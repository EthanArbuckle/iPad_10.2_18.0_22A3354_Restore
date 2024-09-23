@implementation GLKView

- (void)_display:(BOOL)a3
{
  _BOOL4 v4;
  void (*drawRectIMP)(GLKView *, char *);
  BOOL v6;
  GLKViewDelegate *delegate;
  char v8;

  self->_inDraw = 1;
  if (self->_context)
  {
    v4 = a3;
    v8 = 0;
    -[GLKView _setFramebuffer:](self, "_setFramebuffer:", &v8);
    glPushGroupMarkerEXT(0, "Rendering");
    drawRectIMP = (void (*)(GLKView *, char *))self->_drawRectIMP;
    if (drawRectIMP)
      v6 = drawRectIMP == (void (*)(GLKView *, char *))_drawRectUIViewIMP;
    else
      v6 = 1;
    if (v6)
    {
      if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
      {
        delegate = self->_delegate;
        -[GLKView bounds](self, "bounds");
        -[GLKViewDelegate glkView:drawInRect:](delegate, "glkView:drawInRect:", self);
      }
    }
    else
    {
      -[GLKView bounds](self, "bounds");
      drawRectIMP(self, sel_drawRect_);
    }
    glPopGroupMarkerEXT();
    if (v8)
      glFinish();
    -[GLKView _resolveAndDiscard](self, "_resolveAndDiscard");
    if (v4)
      -[GLKView _presentFramebuffer](self, "_presentFramebuffer");
  }
  self->_inDraw = 0;
}

- (void)_setFramebuffer:(BOOL *)a3
{
  unsigned int *p_resolveFramebuffer;

  if (a3)
    *a3 = 0;
  if (self->_context)
  {
    objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:");
    if (self->_shouldDeleteFramebuffer)
      -[GLKView _deleteFramebuffer](self, "_deleteFramebuffer");
    p_resolveFramebuffer = &self->_resolveFramebuffer;
    if (!self->_resolveFramebuffer)
    {
      -[GLKView _createFramebuffer](self, "_createFramebuffer");
      if (a3)
        *a3 = 1;
    }
    if (self->_drawableMultisample)
      p_resolveFramebuffer = &self->_multisampleFramebuffer;
    glBindFramebuffer(0x8D40u, *p_resolveFramebuffer);
    glViewport(0, 0, self->_drawableWidth, self->_drawableHeight);
  }
}

- (void)_resolveAndDiscard
{
  glPushGroupMarkerEXT(0, "Resolve and Discard");
  if (self->_drawableMultisample)
  {
    glBindFramebuffer(0x8CA8u, self->_multisampleFramebuffer);
    glBindFramebuffer(0x8CA9u, self->_resolveFramebuffer);
    if (-[EAGLContext API](self->_context, "API") == kEAGLRenderingAPIOpenGLES3)
      glBlitFramebuffer(0, 0, self->_drawableWidth, self->_drawableHeight, 0, 0, self->_drawableWidth, self->_drawableHeight, 0x4000u, 0x2601u);
    else
      glResolveMultisampleFramebufferAPPLE();
  }
  glDiscardFramebufferEXT();
  glPopGroupMarkerEXT();
}

- (BOOL)_presentFramebuffer
{
  glBindRenderbuffer(0x8D41u, self->_resolveColorRenderbuffer);
  return -[EAGLContext presentRenderbuffer:](self->_context, "presentRenderbuffer:", 36161);
}

- (void)_deleteFramebuffer
{
  unsigned int *p_depthStencilRenderbuffer;

  if (self->_context)
  {
    self->_shouldDeleteFramebuffer = 0;
    objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", self->_context);
    glPushGroupMarkerEXT(0, "Delete Framebuffer");
    if (self->_resolveFramebuffer)
    {
      glDeleteFramebuffers(1, &self->_resolveFramebuffer);
      self->_resolveFramebuffer = 0;
    }
    if (self->_resolveColorRenderbuffer)
    {
      glDeleteRenderbuffers(1, &self->_resolveColorRenderbuffer);
      self->_resolveColorRenderbuffer = 0;
    }
    if (self->_multisampleFramebuffer)
    {
      glDeleteFramebuffers(1, &self->_multisampleFramebuffer);
      self->_multisampleFramebuffer = 0;
    }
    if (self->_multisampleColorRenderbuffer)
    {
      glDeleteRenderbuffers(1, &self->_multisampleColorRenderbuffer);
      self->_multisampleColorRenderbuffer = 0;
    }
    if (self->_depthRenderbuffer)
    {
      glDeleteRenderbuffers(1, &self->_depthRenderbuffer);
      self->_depthRenderbuffer = 0;
    }
    if (self->_stencilRenderbuffer)
    {
      glDeleteRenderbuffers(1, &self->_stencilRenderbuffer);
      self->_stencilRenderbuffer = 0;
    }
    p_depthStencilRenderbuffer = &self->_depthStencilRenderbuffer;
    if (*p_depthStencilRenderbuffer)
    {
      glDeleteRenderbuffers(1, p_depthStencilRenderbuffer);
      *p_depthStencilRenderbuffer = 0;
    }
    glPopGroupMarkerEXT();
  }
}

- (void)_createFramebuffer
{
  void *v3;
  int v4;
  _QWORD *v5;
  unsigned int *p_resolveColorRenderbuffer;
  GLenum v7;
  int drawableStencilFormat;
  unsigned int *p_depthRenderbuffer;
  int v10;
  unsigned int *p_depthStencilRenderbuffer;
  GLenum v12;
  uint64_t v13;
  int v14;
  GLuint depthRenderbuffer;
  GLenum v16;
  uint64_t v17;
  GLint params[2];

  if (self->_context)
  {
    glPushGroupMarkerEXT(0, "Create Framebuffer");
    v3 = (void *)-[GLKView layer](self, "layer");
    glGenFramebuffers(1, &self->_resolveFramebuffer);
    glBindFramebuffer(0x8D40u, self->_resolveFramebuffer);
    v4 = self->_drawableColorFormat - 1;
    if (v4 > 0xC)
      v5 = (_QWORD *)MEMORY[0x24BDE2BC8];
    else
      v5 = (_QWORD *)qword_24C848450[v4];
    -[NSMutableDictionary setObject:forKey:](self->_drawableProperties, "setObject:forKey:", *v5, *MEMORY[0x24BDE2BD0]);
    objc_msgSend(v3, "setDrawableProperties:", self->_drawableProperties);
    p_resolveColorRenderbuffer = &self->_resolveColorRenderbuffer;
    glGenRenderbuffers(1, &self->_resolveColorRenderbuffer);
    glBindRenderbuffer(0x8D41u, self->_resolveColorRenderbuffer);
    if (!-[EAGLContext renderbufferStorage:fromDrawable:](self->_context, "renderbufferStorage:fromDrawable:", 36161, v3))NSLog(CFSTR("Failed to bind EAGLDrawable: %@ to GL_RENDERBUFFER %d"), v3, *p_resolveColorRenderbuffer);
    *(_QWORD *)params = 0;
    glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &params[1]);
    glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, params);
    self->_drawableWidth = params[1];
    self->_drawableHeight = params[0];
    glFramebufferRenderbuffer(0x8D40u, 0x8CE0u, 0x8D41u, *p_resolveColorRenderbuffer);
    if (self->_drawableDepthFormat == 1)
      v7 = 33189;
    else
      v7 = 33190;
    if (self->_drawableMultisample)
    {
      glGenFramebuffers(1, &self->_multisampleFramebuffer);
      glBindFramebuffer(0x8D40u, self->_multisampleFramebuffer);
      glGenRenderbuffers(1, &self->_multisampleColorRenderbuffer);
      glBindRenderbuffer(0x8D41u, self->_multisampleColorRenderbuffer);
      glRenderbufferStorageMultisampleAPPLE();
      glFramebufferRenderbuffer(0x8D40u, 0x8CE0u, 0x8D41u, self->_multisampleColorRenderbuffer);
      drawableStencilFormat = self->_drawableStencilFormat;
      if (self->_drawableDepthFormat)
      {
        if (!drawableStencilFormat)
        {
          p_depthRenderbuffer = &self->_depthRenderbuffer;
          glGenRenderbuffers(1, &self->_depthRenderbuffer);
          glBindRenderbuffer(0x8D41u, self->_depthRenderbuffer);
          glRenderbufferStorageMultisampleAPPLE();
          v12 = 36096;
          goto LABEL_21;
        }
        p_depthRenderbuffer = &self->_depthStencilRenderbuffer;
        glGenRenderbuffers(1, &self->_depthStencilRenderbuffer);
        glBindRenderbuffer(0x8D41u, self->_depthStencilRenderbuffer);
        glRenderbufferStorageMultisampleAPPLE();
        glFramebufferRenderbuffer(0x8D40u, 0x8D00u, 0x8D41u, self->_depthStencilRenderbuffer);
      }
      else
      {
        if (!drawableStencilFormat)
          goto LABEL_22;
        p_depthRenderbuffer = &self->_stencilRenderbuffer;
        glGenRenderbuffers(1, &self->_stencilRenderbuffer);
        glBindRenderbuffer(0x8D41u, self->_stencilRenderbuffer);
        glRenderbufferStorageMultisampleAPPLE();
      }
      v12 = 36128;
LABEL_21:
      glFramebufferRenderbuffer(0x8D40u, v12, 0x8D41u, *p_depthRenderbuffer);
LABEL_22:
      if (glCheckFramebufferStatus(0x8D40u) != 36053)
      {
        v13 = glCheckFramebufferStatus(0x8D40u);
        NSLog(CFSTR("Failed to make complete multisample framebuffer object %x"), v13);
        v14 = 1;
        goto LABEL_30;
      }
LABEL_29:
      v14 = 0;
LABEL_30:
      glBindFramebuffer(0x8D40u, self->_resolveFramebuffer);
      if (glCheckFramebufferStatus(0x8D40u) == 36053)
      {
        if (!v14)
          goto LABEL_35;
      }
      else
      {
        v17 = glCheckFramebufferStatus(0x8D40u);
        NSLog(CFSTR("Failed to make complete framebuffer object %x"), v17);
      }
      -[GLKView _deleteFramebuffer](self, "_deleteFramebuffer");
LABEL_35:
      glPopGroupMarkerEXT();
      return;
    }
    self->_multisampleFramebuffer = 0;
    self->_multisampleColorRenderbuffer = 0;
    v10 = self->_drawableStencilFormat;
    if (self->_drawableDepthFormat)
    {
      if (!v10)
      {
        glGenRenderbuffers(1, &self->_depthRenderbuffer);
        glBindRenderbuffer(0x8D41u, self->_depthRenderbuffer);
        glRenderbufferStorage(0x8D41u, v7, self->_drawableWidth, self->_drawableHeight);
        depthRenderbuffer = self->_depthRenderbuffer;
        v16 = 36096;
        goto LABEL_28;
      }
      p_depthStencilRenderbuffer = &self->_depthStencilRenderbuffer;
      glGenRenderbuffers(1, &self->_depthStencilRenderbuffer);
      glBindRenderbuffer(0x8D41u, self->_depthStencilRenderbuffer);
      glRenderbufferStorage(0x8D41u, 0x88F0u, self->_drawableWidth, self->_drawableHeight);
      glFramebufferRenderbuffer(0x8D40u, 0x8D00u, 0x8D41u, self->_depthStencilRenderbuffer);
    }
    else
    {
      if (!v10)
        goto LABEL_29;
      p_depthStencilRenderbuffer = &self->_stencilRenderbuffer;
      glGenRenderbuffers(1, &self->_stencilRenderbuffer);
      glBindRenderbuffer(0x8D41u, self->_stencilRenderbuffer);
      glRenderbufferStorage(0x8D41u, 0x8D48u, self->_drawableWidth, self->_drawableHeight);
    }
    depthRenderbuffer = *p_depthStencilRenderbuffer;
    v16 = 36128;
LABEL_28:
    glFramebufferRenderbuffer(0x8D40u, v16, 0x8D41u, depthRenderbuffer);
    goto LABEL_29;
  }
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)_initCommon
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = (void *)-[GLKView layer](self, "layer");
  self->_enableSetNeedsDisplay = 1;
  self->_drawableColorFormat = 0;
  self->_drawableDepthFormat = 0;
  self->_drawableStencilFormat = 0;
  self->_drawableMultisample = 0;
  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  -[GLKView setDrawableProperties:](self, "setDrawableProperties:", objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v5, *MEMORY[0x24BDE2BD8], *MEMORY[0x24BDE2BC8], *MEMORY[0x24BDE2BD0], 0));
  objc_msgSend(v3, "setDrawableProperties:", self->_drawableProperties);
  objc_msgSend(v3, "setOpaque:", 1);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "nativeScale");
  -[GLKView setContentScaleFactor:](self, "setContentScaleFactor:");
  if (!_drawRectUIViewIMP)
    _drawRectUIViewIMP = objc_msgSend(MEMORY[0x24BDF6F90], "instanceMethodForSelector:", sel_drawRect_);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    self->_drawRectIMP = (void *)-[GLKView methodForSelector:](self, "methodForSelector:", sel_drawRect_);
}

- (GLKView)initWithFrame:(CGRect)a3
{
  GLKView *v3;
  GLKView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GLKView;
  v3 = -[GLKView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[GLKView _initCommon](v3, "_initCommon");
  return v4;
}

- (GLKView)initWithFrame:(CGRect)frame context:(EAGLContext *)context
{
  GLKView *v5;
  GLKView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GLKView;
  v5 = -[GLKView initWithFrame:](&v8, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  v6 = v5;
  if (v5)
  {
    -[GLKView _initCommon](v5, "_initCommon");
    -[GLKView setContext:](v6, "setContext:", context);
  }
  return v6;
}

- (GLKView)initWithCoder:(id)a3
{
  GLKView *v4;
  GLKView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GLKView;
  v4 = -[GLKView initWithCoder:](&v7, sel_initWithCoder_);
  v5 = v4;
  if (v4)
  {
    -[GLKView _initCommon](v4, "_initCommon");
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("GLKViewDrawableColorFormatCoderKey")))
      v5->_drawableColorFormat = objc_msgSend(a3, "decodeIntForKey:", CFSTR("GLKViewDrawableColorFormatCoderKey"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("GLKViewDrawableDepthFormatCoderKey")))
      v5->_drawableDepthFormat = objc_msgSend(a3, "decodeIntForKey:", CFSTR("GLKViewDrawableDepthFormatCoderKey"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("GLKViewDrawableStencilFormatCoderKey")))
      v5->_drawableStencilFormat = objc_msgSend(a3, "decodeIntForKey:", CFSTR("GLKViewDrawableStencilFormatCoderKey"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("GLKViewDrawableMultisampleCoderKey")))
      v5->_drawableMultisample = objc_msgSend(a3, "decodeIntForKey:", CFSTR("GLKViewDrawableMultisampleCoderKey"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("GLKViewEnableSetNeedsDisplayCoderKey")))
      v5->_enableSetNeedsDisplay = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("GLKViewEnableSetNeedsDisplayCoderKey"));
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GLKView;
  -[GLKView encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_drawableColorFormat, CFSTR("GLKViewDrawableColorFormatCoderKey"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_drawableDepthFormat, CFSTR("GLKViewDrawableDepthFormatCoderKey"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_drawableStencilFormat, CFSTR("GLKViewDrawableStencilFormatCoderKey"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_drawableMultisample, CFSTR("GLKViewDrawableMultisampleCoderKey"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_enableSetNeedsDisplay, CFSTR("GLKViewEnableSetNeedsDisplayCoderKey"));
}

- (void)dealloc
{
  id v3;
  objc_super v4;

  if (glkLinkedOSVersion() < 0x90000)
    v3 = 0;
  else
    v3 = (id)objc_msgSend(MEMORY[0x24BDE2818], "currentContext");
  -[GLKView _deleteFramebuffer](self, "_deleteFramebuffer");

  if (glkLinkedOSVersion() > 0x8FFFF)
  {
    objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", v3);

  }
  -[GLKView setDrawableProperties:](self, "setDrawableProperties:", 0);
  v4.receiver = self;
  v4.super_class = (Class)GLKView;
  -[GLKView dealloc](&v4, sel_dealloc);
}

- (EAGLContext)context
{
  return self->_context;
}

- (void)setContext:(EAGLContext *)context
{
  uint64_t v5;

  if (self->_context != context)
  {
    v5 = objc_msgSend(MEMORY[0x24BDE2818], "currentContext");
    -[GLKView _deleteFramebuffer](self, "_deleteFramebuffer");

    self->_context = context;
    objc_msgSend(MEMORY[0x24BDE2818], "setCurrentContext:", v5);
  }
}

- (GLKViewDrawableColorFormat)drawableColorFormat
{
  return self->_drawableColorFormat;
}

- (void)setDrawableColorFormat:(GLKViewDrawableColorFormat)drawableColorFormat
{
  if (self->_drawableColorFormat != drawableColorFormat)
  {
    self->_shouldDeleteFramebuffer = 1;
    self->_drawableColorFormat = drawableColorFormat;
  }
}

- (GLKViewDrawableDepthFormat)drawableDepthFormat
{
  return self->_drawableDepthFormat;
}

- (void)setDrawableDepthFormat:(GLKViewDrawableDepthFormat)drawableDepthFormat
{
  if (self->_drawableDepthFormat != drawableDepthFormat)
  {
    self->_shouldDeleteFramebuffer = 1;
    self->_drawableDepthFormat = drawableDepthFormat;
  }
}

- (GLKViewDrawableStencilFormat)drawableStencilFormat
{
  return self->_drawableStencilFormat;
}

- (void)setDrawableStencilFormat:(GLKViewDrawableStencilFormat)drawableStencilFormat
{
  if (self->_drawableStencilFormat != drawableStencilFormat)
  {
    self->_shouldDeleteFramebuffer = 1;
    self->_drawableStencilFormat = drawableStencilFormat;
  }
}

- (GLKViewDrawableMultisample)drawableMultisample
{
  return self->_drawableMultisample;
}

- (void)setDrawableMultisample:(GLKViewDrawableMultisample)drawableMultisample
{
  if (self->_drawableMultisample != drawableMultisample)
  {
    self->_shouldDeleteFramebuffer = 1;
    self->_drawableMultisample = drawableMultisample;
  }
}

- (void)bindDrawable
{
  -[GLKView _setFramebuffer:](self, "_setFramebuffer:", 0);
}

- (UIImage)snapshot
{
  UIImage *ImageFromCurrentImageContext;
  size_t v4;
  void *v5;
  GLvoid *v6;
  const __CFData *v7;
  const __CFData *v8;
  CGDataProviderRef v9;
  CGDataProvider *v10;
  CGColorSpace *DeviceRGB;
  CGImageRef v12;
  CGImage *v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGContext *CurrentContext;
  GLint params;
  CGSize v21;
  CGRect v22;

  if (self->_inDraw)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GLKViewSnapshotInDraw"), CFSTR("snapshot method cannot be called from within draw"));
    return 0;
  }
  else
  {
    params = 0;
    -[GLKView _display:](self, "_display:", 0);
    glPushGroupMarkerEXT(0, "Take Snapshot");
    glBindFramebuffer(0x8D40u, self->_resolveFramebuffer);
    v4 = 4 * self->_drawableWidth;
    v5 = malloc_type_malloc(self->_drawableHeight * v4, 0x391FEC08uLL);
    if (v5)
    {
      v6 = v5;
      glGetIntegerv(0xD05u, &params);
      glPixelStorei(0xD05u, 1);
      glReadPixels(0, 0, self->_drawableWidth, self->_drawableHeight, 0x1908u, 0x1401u, v6);
      glPixelStorei(0xD05u, params);
      v7 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)v6, self->_drawableHeight * v4);
      if (v7)
      {
        v8 = v7;
        v9 = CGDataProviderCreateWithCFData(v7);
        if (v9)
        {
          v10 = v9;
          DeviceRGB = CGColorSpaceCreateDeviceRGB();
          v12 = CGImageCreate(self->_drawableWidth, self->_drawableHeight, 8uLL, 0x20uLL, v4, DeviceRGB, 1u, v10, 0, 0, kCGRenderingIntentDefault);
          if (v12)
          {
            v13 = v12;
            -[GLKView contentScaleFactor](self, "contentScaleFactor");
            v15 = v14;
            v16 = (double)(uint64_t)((double)self->_drawableWidth / v14);
            v17 = (double)(uint64_t)((double)self->_drawableHeight / v14);
            v21.width = v16;
            v21.height = v17;
            UIGraphicsBeginImageContextWithOptions(v21, 0, v15);
            CurrentContext = UIGraphicsGetCurrentContext();
            CGContextSetBlendMode(CurrentContext, kCGBlendModeCopy);
            v22.origin.x = 0.0;
            v22.origin.y = 0.0;
            v22.size.width = v16;
            v22.size.height = v17;
            CGContextDrawImage(CurrentContext, v22, v13);
            ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            CGImageRelease(v13);
          }
          else
          {
            ImageFromCurrentImageContext = 0;
          }
          CGColorSpaceRelease(DeviceRGB);
          CGDataProviderRelease(v10);
        }
        else
        {
          ImageFromCurrentImageContext = 0;
        }
        CFRelease(v8);
      }
      else
      {
        ImageFromCurrentImageContext = 0;
      }
      free(v6);
    }
    else
    {
      ImageFromCurrentImageContext = 0;
    }
    glPopGroupMarkerEXT();
  }
  return ImageFromCurrentImageContext;
}

- (void)setEnableSetNeedsDisplay:(BOOL)enableSetNeedsDisplay
{
  self->_enableSetNeedsDisplay = enableSetNeedsDisplay;
}

- (BOOL)enableSetNeedsDisplay
{
  return self->_enableSetNeedsDisplay;
}

- (void)displayLayer:(id)a3
{
  if (self->_enableSetNeedsDisplay)
    -[GLKView _display:](self, "_display:", 1);
}

- (BOOL)_canDrawContent
{
  return 1;
}

- (BOOL)_controlsOwnScaleFactor
{
  return 1;
}

- (void)display
{
  -[GLKView _display:](self, "_display:", 1);
}

- (void)setContentScaleFactor:(double)a3
{
  double v4;
  objc_super v5;
  objc_super v6;

  if (self->_viewContentScaleFactor != a3)
  {
    self->_viewContentScaleFactor = a3;
    self->_shouldDeleteFramebuffer = 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)GLKView;
  -[GLKView setContentScaleFactor:](&v6, sel_setContentScaleFactor_);
  v5.receiver = self;
  v5.super_class = (Class)GLKView;
  -[GLKView contentScaleFactor](&v5, sel_contentScaleFactor);
  self->_viewContentScaleFactor = v4;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGRect *p_viewBounds;
  double Width;
  double Height;
  objc_super v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v14.receiver = self;
  v14.super_class = (Class)GLKView;
  -[GLKView layoutSubviews](&v14, sel_layoutSubviews);
  -[GLKView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  p_viewBounds = &self->_viewBounds;
  Width = CGRectGetWidth(self->_viewBounds);
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  if (Width != CGRectGetWidth(v15))
    goto LABEL_3;
  v16.origin.x = p_viewBounds->origin.x;
  v16.origin.y = self->_viewBounds.origin.y;
  v16.size.width = self->_viewBounds.size.width;
  v16.size.height = self->_viewBounds.size.height;
  Height = CGRectGetHeight(v16);
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  if (Height != CGRectGetHeight(v17))
  {
LABEL_3:
    p_viewBounds->origin.x = v4;
    self->_viewBounds.origin.y = v6;
    self->_viewBounds.size.width = v8;
    self->_viewBounds.size.height = v10;
    self->_shouldDeleteFramebuffer = 1;
  }
}

- (BOOL)inDraw
{
  return self->_inDraw;
}

- (void)setInDraw:(BOOL)a3
{
  self->_inDraw = a3;
}

- (NSMutableDictionary)drawableProperties
{
  return self->_drawableProperties;
}

- (void)setDrawableProperties:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 464);
}

- (BOOL)shouldDeleteFramebuffer
{
  return self->_shouldDeleteFramebuffer;
}

- (void)setShouldDeleteFramebuffer:(BOOL)a3
{
  self->_shouldDeleteFramebuffer = a3;
}

- (unsigned)resolveFramebuffer
{
  return self->_resolveFramebuffer;
}

- (void)setResolveFramebuffer:(unsigned int)a3
{
  self->_resolveFramebuffer = a3;
}

- (unsigned)resolveColorRenderbuffer
{
  return self->_resolveColorRenderbuffer;
}

- (void)setResolveColorRenderbuffer:(unsigned int)a3
{
  self->_resolveColorRenderbuffer = a3;
}

- (unsigned)multisampleFramebuffer
{
  return self->_multisampleFramebuffer;
}

- (void)setMultisampleFramebuffer:(unsigned int)a3
{
  self->_multisampleFramebuffer = a3;
}

- (unsigned)multisampleColorRenderbuffer
{
  return self->_multisampleColorRenderbuffer;
}

- (void)setMultisampleColorRenderbuffer:(unsigned int)a3
{
  self->_multisampleColorRenderbuffer = a3;
}

- (unsigned)depthRenderbuffer
{
  return self->_depthRenderbuffer;
}

- (void)setDepthRenderbuffer:(unsigned int)a3
{
  self->_depthRenderbuffer = a3;
}

- (unsigned)stencilRenderbuffer
{
  return self->_stencilRenderbuffer;
}

- (void)setStencilRenderbuffer:(unsigned int)a3
{
  self->_stencilRenderbuffer = a3;
}

- (unsigned)depthStencilRenderbuffer
{
  return self->_depthStencilRenderbuffer;
}

- (void)setDepthStencilRenderbuffer:(unsigned int)a3
{
  self->_depthStencilRenderbuffer = a3;
}

- (CGRect)viewBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_viewBounds.origin.x;
  y = self->_viewBounds.origin.y;
  width = self->_viewBounds.size.width;
  height = self->_viewBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setViewBounds:(CGRect)a3
{
  self->_viewBounds = a3;
}

- (double)viewContentScaleFactor
{
  return self->_viewContentScaleFactor;
}

- (void)setViewContentScaleFactor:(double)a3
{
  self->_viewContentScaleFactor = a3;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = (GLKViewDelegate *)delegate;
}

- (NSInteger)drawableWidth
{
  return self->_drawableWidth;
}

- (NSInteger)drawableHeight
{
  return self->_drawableHeight;
}

- (void)drawRectIMP
{
  return self->_drawRectIMP;
}

- (void)setDrawRectIMP:(void *)a3
{
  self->_drawRectIMP = a3;
}

@end
