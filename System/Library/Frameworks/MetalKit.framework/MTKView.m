@implementation MTKView

- (MTLPixelFormat)depthStencilPixelFormat
{
  return self->_depthStencilPixelFormat;
}

- (MTLPixelFormat)colorPixelFormat
{
  return self->_colorPixelFormats[self->_drawableAttachmentIndex];
}

- (BOOL)_canDrawContent
{
  return 1;
}

- (NSUInteger)sampleCount
{
  return self->_sampleCount;
}

- (CGSize)drawableSize
{
  double width;
  double height;
  CGSize result;

  width = self->_drawableSize.width;
  height = self->_drawableSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)displayLayer:(id)a3
{
  if (self->_enableSetNeedsDisplay)
    -[MTKView draw](self, "draw", a3);
}

- (BOOL)enableSetNeedsDisplay
{
  return self->_enableSetNeedsDisplay;
}

- (BOOL)_controlsOwnScaleFactor
{
  return 1;
}

- (void)createDepthStencilTexture
{
  void *v3;
  unint64_t depthStencilPixelFormat;
  CAMetalLayer **p_metalLayer;
  id WeakRetained;
  double v7;
  unint64_t v8;
  id v9;
  double v10;
  uint64_t v11;
  MTLTexture *v12;
  MTLTexture *depthStencilTexture;
  unint64_t v14;
  const __CFString *v15;
  id v16;

  v3 = (void *)MEMORY[0x24BDDD740];
  depthStencilPixelFormat = self->_depthStencilPixelFormat;
  p_metalLayer = &self->_metalLayer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
  objc_msgSend(WeakRetained, "drawableSize");
  v8 = (unint64_t)v7;
  v9 = objc_loadWeakRetained((id *)p_metalLayer);
  objc_msgSend(v9, "drawableSize");
  objc_msgSend(v3, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", depthStencilPixelFormat, v8, (unint64_t)v10, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (self->_sampleCount >= 2)
    v11 = 4;
  else
    v11 = 2;
  objc_msgSend(v16, "setTextureType:", v11);
  objc_msgSend(v16, "setSampleCount:", self->_sampleCount);
  objc_msgSend(v16, "setUsage:", self->_depthStencilTextureUsage);
  objc_msgSend(v16, "setStorageMode:", self->_depthStencilStorageMode);
  v12 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v16);
  depthStencilTexture = self->_depthStencilTexture;
  self->_depthStencilTexture = v12;

  v14 = self->_depthStencilPixelFormat - 250;
  if (v14 > 3)
    v15 = CFSTR("MTKView Depth Stencil");
  else
    v15 = *(&off_24C3D4E58 + v14);
  -[MTLTexture setLabel:](self->_depthStencilTexture, "setLabel:", v15);
  self->_renderAttachmentDirtyState &= ~0x80000000;

}

- (void)setColorPixelFormat:(unint64_t)a3 atIndex:(unint64_t)a4
{
  unint64_t v4;
  unint64_t *colorPixelFormats;
  id WeakRetained;
  unint64_t maxValidAttachmentIndex;
  unsigned int i;

  if (a4 <= 8)
  {
    v4 = a4;
    colorPixelFormats = self->_colorPixelFormats;
    self->_colorPixelFormats[a4] = a3;
    self->_renderAttachmentDirtyState |= 0x10001u;
    if (self->_drawableAttachmentIndex == a4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
      objc_msgSend(WeakRetained, "setPixelFormat:", a3);

    }
    maxValidAttachmentIndex = self->_maxValidAttachmentIndex;
    if (a3)
    {
      if (maxValidAttachmentIndex >= v4)
        return;
      goto LABEL_6;
    }
    if (maxValidAttachmentIndex == v4)
    {
      for (i = 7; ; --i)
      {
        v4 = i;
        if (colorPixelFormats[i])
          break;
        if (!(_DWORD)v4)
          return;
      }
LABEL_6:
      self->_maxValidAttachmentIndex = v4;
    }
  }
}

- (void)setFramebufferOnly:(BOOL)framebufferOnly
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = framebufferOnly;
  self->_framebufferOnly = framebufferOnly;
  WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
  objc_msgSend(WeakRetained, "setFramebufferOnly:", v3);

}

- (BOOL)presentsWithTransaction
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
  v3 = objc_msgSend(WeakRetained, "presentsWithTransaction");

  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTKView;
  -[MTKView layoutSubviews](&v3, sel_layoutSubviews);
  if (self->_autoResizeDrawable)
    -[MTKView _resizeDrawable](self, "_resizeDrawable");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTKView;
  -[MTKView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self->_autoResizeDrawable)
    -[MTKView _resizeDrawable](self, "_resizeDrawable");
}

- (void)didMoveToWindow
{
  void *v3;
  void *displayLink;
  void *v5;
  objc_super v6;

  -[MTKView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MTKView _updateToNativeScale](self, "_updateToNativeScale");
    -[MTKView window](self, "window");
    displayLink = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(displayLink, "screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTKView _createDisplayLinkForScreen:](self, "_createDisplayLinkForScreen:", v5);

  }
  else
  {
    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    displayLink = self->_displayLink;
    self->_displayLink = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)MTKView;
  -[MTKView didMoveToWindow](&v6, sel_didMoveToWindow);
}

- (void)setContentScaleFactor:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  float v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  int v33;
  double v34;
  int v35;
  double v36;
  double v37;
  double v38;
  id WeakRetained;
  objc_super v40;

  -[MTKView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v9, "nativeScale");
  v11 = v10;
  -[MTKView contentScaleFactor](self, "contentScaleFactor");
  if (a3 != 0.0 && v12 == a3)
  {
    v40.receiver = self;
    v40.super_class = (Class)MTKView;
    -[MTKView setContentScaleFactor:](&v40, sel_setContentScaleFactor_, a3);
    goto LABEL_18;
  }
  v13 = v11;
  objc_msgSend(v9, "nativeBounds");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v9, "bounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(v9, "fixedCoordinateSpace");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTKView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v26, v19, v21, v23, v25);
  v28 = v27;
  v30 = v29;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v31, "isMacCatalystApp") & 1) == 0)
  {

LABEL_11:
    v35 = (v15 > v17) ^ (v28 <= v30);
    if (v35)
      v34 = v30;
    else
      v34 = v28;
    if (!v35)
      v28 = v30;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isiOSAppOnMac");

  if (v33)
    goto LABEL_11;
  v34 = v30;
LABEL_16:
  self->_drawableScaleFactor.width = v15 / v28 / v13;
  self->_drawableScaleFactor.height = v17 / v34 / v13;
  v40.receiver = self;
  v40.super_class = (Class)MTKView;
  -[MTKView setContentScaleFactor:](&v40, sel_setContentScaleFactor_, a3);
  -[MTKView contentScaleFactor](self, "contentScaleFactor");
  if (v36 == 0.0)
    -[MTKView setContentScaleFactor:].cold.1();
  -[MTKView contentScaleFactor](self, "contentScaleFactor");
  v38 = v37;
  WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
  objc_msgSend(WeakRetained, "setContentsScale:", v38);

  -[MTKView _resizeDrawable](self, "_resizeDrawable");
LABEL_18:

}

- (CGSize)_pixelSizeFromPointSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGSize result;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  height = a3.height;
  width = a3.width;
  -[MTKView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v10, "fixedCoordinateSpace");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTKView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v19, v12, v14, v16, v18);
  v42 = CGRectIntegral(v41);
  v20 = v42.size.width;

  objc_msgSend(v10, "bounds");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend(v10, "coordinateSpace");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTKView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v29, v22, v24, v26, v28);
  v44 = CGRectIntegral(v43);
  v30 = v44.size.width;

  -[MTKView contentScaleFactor](self, "contentScaleFactor");
  v32 = v31 * self->_drawableScaleFactor.width;
  -[MTKView contentScaleFactor](self, "contentScaleFactor");
  v34 = v33 * self->_drawableScaleFactor.height;
  if (v20 == v30)
    v35 = v32;
  else
    v35 = v34;
  if (v20 != v30)
    v34 = v32;
  v36 = round(width * v35);
  v37 = round(height * v34);

  v38 = v36;
  v39 = v37;
  result.height = v39;
  result.width = v38;
  return result;
}

- (void)_resizeDrawable
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;

  -[MTKView bounds](self, "bounds");
  -[MTKView _pixelSizeFromPointSize:](self, "_pixelSizeFromPointSize:", v3, v4);
  v7 = v6;
  v8 = v5;
  if (self->_drawableSize.width != v6 || self->_drawableSize.height != v5)
  {
    -[MTKView delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mtkView:drawableSizeWillChange:", self, v7, v8);

    self->_drawableSize.width = v7;
    self->_drawableSize.height = v8;
    self->_sizeDirty = 1;
  }
}

- (void)getEnvironmentSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSString *v37;
  NSString *dumpPath;
  int64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("MTK_TERMINATE_AFTER_FRAME"));
  v51 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("MTK_TERMINATE_AFTER_SECONDS"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("MTK_MEASURE_FRAMERATE_AFTER_FRAME"));
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("MTK_MEASURE_FRAMERATE_AFTER_SECONDS"));
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "environment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("MTK_DUMP_PATH"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "environment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("MTK_DUMP_FRAME_AFTER_FRAME"));
  v17 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "environment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", CFSTR("MTK_DUMP_FRAME_AFTER_SECONDS"));
  v20 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "environment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKey:", CFSTR("MTK_DUMP_FIRST_FRAME"));
  v23 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "environment");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKey:", CFSTR("MTK_DRAW_OFFSCREEN"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "environment");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKey:", CFSTR("MTK_FORCE_ORIENTATION"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v30, "setNumberStyle:", 1);
  objc_msgSend(v30, "numberFromString:", v51);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "numberFromString:", v50);
  v46 = (void *)v9;
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "numberFromString:", v9);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)v12;
  objc_msgSend(v30, "numberFromString:", v12);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)v17;
  objc_msgSend(v30, "numberFromString:", v17);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)v20;
  objc_msgSend(v30, "numberFromString:", v20);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)v23;
  objc_msgSend(v30, "numberFromString:", v23);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "numberFromString:", v26);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    v37 = (NSString *)objc_msgSend(v49, "copy");
    dumpPath = self->_dumpPath;
    self->_dumpPath = v37;
  }
  else
  {
    dumpPath = self->_dumpPath;
    self->_dumpPath = (NSString *)CFSTR("/tmp");
  }

  if (v31)
    self->_terminateAfterFrame = objc_msgSend(v31, "unsignedIntegerValue");
  if (v47)
    self->_terminateAfterSeconds = objc_msgSend(v47, "unsignedIntegerValue");
  if (v48)
    self->_measureAfterFrame = objc_msgSend(v48, "unsignedIntegerValue");
  if (v32)
    self->_measureAfterSeconds = objc_msgSend(v32, "unsignedIntegerValue");
  if (v33)
    self->_dumpFrameAtFrame = objc_msgSend(v33, "unsignedIntegerValue");
  if (v34)
    self->_dumpFrameAtSeconds = objc_msgSend(v34, "unsignedIntegerValue");
  if (v35)
    self->_dumpFirstFrame = objc_msgSend(v35, "BOOLValue");
  if (v36)
    self->_drawOffscreen = objc_msgSend(v36, "BOOLValue");
  self->_forceOrientation = 0;
  if (objc_msgSend(v29, "isEqualToString:", CFSTR("Portrait")))
  {
    v39 = 1;
LABEL_28:
    self->_forceOrientation = v39;
    goto LABEL_29;
  }
  if (objc_msgSend(v29, "isEqualToString:", CFSTR("PortraitUpsideDown")))
  {
    v39 = 2;
    goto LABEL_28;
  }
  if (objc_msgSend(v29, "isEqualToString:", CFSTR("LandscapeLeft")))
  {
    v39 = 4;
    goto LABEL_28;
  }
  if (objc_msgSend(v29, "isEqualToString:", CFSTR("LandscapeRight")))
  {
    v39 = 3;
    goto LABEL_28;
  }
  if (!self->_forceOrientation)
  {
    objc_msgSend(v30, "numberFromString:", v29);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      v41 = v40;
      self->_forceOrientation = objc_msgSend(v40, "unsignedIntegerValue");
      v40 = v41;
    }

  }
LABEL_29:

}

- (MTLRenderPassDescriptor)currentRenderPassDescriptor
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t depthStencilPixelFormat;
  void *v18;

  -[MTKView currentDrawable](self, "currentDrawable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_sampleCount < 2)
    {
      -[MTKView colorTextures](self, "colorTextures");
      v8 = 0;
      do
      {
        objc_msgSend(v4, "colorAttachments");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "setTexture:", self->_colorTextures[v8]);
        objc_msgSend(v10, "setLoadAction:", 2);
        objc_msgSend(v10, "setClearColor:", self->_clearColor.red, self->_clearColor.green, self->_clearColor.blue, self->_clearColor.alpha);

        ++v8;
      }
      while (v8 <= self->_maxValidAttachmentIndex);
    }
    else
    {
      -[MTKView multisampleColorTextures](self, "multisampleColorTextures");
      v5 = 0;
      do
      {
        objc_msgSend(v4, "colorAttachments");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "setTexture:", self->_multisampleColorTextures[v5]);
        objc_msgSend(v7, "setResolveTexture:", self->_colorTextures[v5]);
        objc_msgSend(v7, "setStoreAction:", 2);
        objc_msgSend(v7, "setLoadAction:", 2);
        objc_msgSend(v7, "setClearColor:", self->_clearColor.red, self->_clearColor.green, self->_clearColor.blue, self->_clearColor.alpha);

        ++v5;
      }
      while (v5 <= self->_maxValidAttachmentIndex);
    }
    -[MTKView depthStencilTexture](self, "depthStencilTexture");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v4, "depthAttachment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (self->_depthStencilPixelFormat == 253)
      {
        objc_msgSend(v12, "setTexture:", 0);
      }
      else
      {
        -[MTKView depthStencilTexture](self, "depthStencilTexture");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setTexture:", v14);

        objc_msgSend(v13, "setLoadAction:", 2);
        objc_msgSend(v13, "setStoreAction:", 0);
        objc_msgSend(v13, "setClearDepth:", self->_clearDepth);
      }
      objc_msgSend(v4, "stencilAttachment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      depthStencilPixelFormat = self->_depthStencilPixelFormat;
      if (depthStencilPixelFormat == 252 || depthStencilPixelFormat == 250)
      {
        objc_msgSend(v15, "setTexture:", 0);
      }
      else
      {
        -[MTKView depthStencilTexture](self, "depthStencilTexture");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setTexture:", v18);

        objc_msgSend(v16, "setLoadAction:", 2);
        objc_msgSend(v16, "setStoreAction:", 0);
        objc_msgSend(v16, "setClearStencil:", self->_clearStencil);
      }

    }
  }
  else
  {
    v4 = 0;
  }

  return (MTLRenderPassDescriptor *)v4;
}

- (id)depthStencilTexture
{
  MTLTexture **p_depthStencilTexture;
  MTLTexture *v4;
  MTLTexture *depthStencilTexture;
  double v7;
  id WeakRetained;
  double v9;
  double v10;
  id v11;
  double v12;
  uint64_t v13;
  unint64_t depthStencilStorageMode;
  __CFRunLoop *Main;
  const void *v16;
  __CFRunLoop *v17;
  _QWORD block[5];

  if (self->_renderAttachmentDirtyState < 0)
  {
    if (!self->_device)
    {
      v4 = 0;
      return v4;
    }
    p_depthStencilTexture = &self->_depthStencilTexture;
    depthStencilTexture = self->_depthStencilTexture;
    if (!depthStencilTexture)
      goto LABEL_17;
    v7 = (double)(unint64_t)-[MTLTexture width](depthStencilTexture, "width");
    WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
    objc_msgSend(WeakRetained, "drawableSize");
    if (v9 == v7)
    {
      v10 = (double)(unint64_t)-[MTLTexture height](*p_depthStencilTexture, "height");
      v11 = objc_loadWeakRetained((id *)&self->_metalLayer);
      objc_msgSend(v11, "drawableSize");
      if (v12 == v10
        && -[MTLTexture sampleCount](*p_depthStencilTexture, "sampleCount") == self->_sampleCount
        && -[MTLTexture pixelFormat](*p_depthStencilTexture, "pixelFormat") == self->_depthStencilPixelFormat
        && -[MTLTexture usage](*p_depthStencilTexture, "usage") == self->_depthStencilTextureUsage)
      {
        v13 = -[MTLTexture storageMode](*p_depthStencilTexture, "storageMode");
        depthStencilStorageMode = self->_depthStencilStorageMode;

        if (v13 == depthStencilStorageMode)
          goto LABEL_3;
LABEL_17:
        if (self->_depthStencilPixelFormat)
        {
          Main = CFRunLoopGetMain();
          v16 = (const void *)*MEMORY[0x24BDBD598];
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __30__MTKView_depthStencilTexture__block_invoke;
          block[3] = &unk_24C3D4E38;
          block[4] = self;
          CFRunLoopPerformBlock(Main, v16, block);
          v17 = CFRunLoopGetMain();
          CFRunLoopWakeUp(v17);
          -[MTKView _resizeMetalLayerDrawable](self, "_resizeMetalLayerDrawable");
          -[MTKView createDepthStencilTexture](self, "createDepthStencilTexture");
        }
        goto LABEL_3;
      }

    }
    goto LABEL_17;
  }
  p_depthStencilTexture = &self->_depthStencilTexture;
LABEL_3:
  v4 = *p_depthStencilTexture;
  return v4;
}

- (const)colorTextures
{
  return -[MTKView colorTexturesForceUpdate:](self, "colorTexturesForceUpdate:", 0);
}

- (const)colorTexturesForceUpdate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  unint64_t v7;
  MTLTexture *v8;
  unint64_t drawableAttachmentIndex;
  MTLTexture *v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  void *v14;
  double v15;
  id WeakRetained;
  double v17;
  double v18;
  id v19;
  double v20;
  uint64_t v21;
  unint64_t multisampleColorTextureUsage;
  uint64_t v23;
  MTKOffscreenDrawable **offscreenSwapChain;
  uint64_t v25;
  char *v26;
  void *v27;
  __CFRunLoop *Main;
  __CFRunLoop *v29;
  void *v30;
  unint64_t v31;
  id v32;
  unint64_t v33;
  _BOOL8 v34;
  double v35;
  unint64_t v36;
  id v37;
  double v38;
  unint64_t v39;
  void *v40;
  uint64_t v41;
  char *v42;
  const void **v43;
  void *v45;
  CFTypeRef mode;
  _QWORD block[5];

  if (!self->_device)
    return 0;
  v3 = a3;
  -[MTKView currentDrawable](self, "currentDrawable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0x25462B000uLL;
  if (v5)
  {
    objc_msgSend(v5, "texture");
    v8 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    drawableAttachmentIndex = self->_drawableAttachmentIndex;
    v10 = self->_colorTextures[drawableAttachmentIndex];
    self->_colorTextures[drawableAttachmentIndex] = v8;

  }
  if ((self->_renderAttachmentDirtyState & 1) != 0)
  {
    v45 = v6;
    v11 = 0;
    mode = (CFTypeRef)*MEMORY[0x24BDBD598];
    v12 = 0x25462B000uLL;
    while (1)
    {
      if (self->_drawOffscreen || *(Class *)((char *)&self->super.super.super.isa + *(int *)(v12 + 3836)) != (Class)v11)
      {
        if (v3)
          goto LABEL_17;
        v13 = (char *)self + *(int *)(v7 + 3828);
        v14 = *(void **)&v13[8 * v11];
        if (!v14)
          goto LABEL_17;
        v15 = (double)(unint64_t)objc_msgSend(v14, "width");
        WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
        objc_msgSend(WeakRetained, "drawableSize");
        if (v17 != v15)
          goto LABEL_16;
        v18 = (double)(unint64_t)objc_msgSend(*(id *)&v13[8 * v11], "height");
        v19 = objc_loadWeakRetained((id *)&self->_metalLayer);
        objc_msgSend(v19, "drawableSize");
        if (v20 != v18 || objc_msgSend(*(id *)&v13[8 * v11], "pixelFormat") != self->_colorPixelFormats[v11])
        {

LABEL_16:
LABEL_17:
          if (self->_drawOffscreen
            && *(Class *)((char *)&self->super.super.super.isa + *(int *)(v12 + 3836)) == (Class)v11)
          {
            v23 = 0;
            offscreenSwapChain = self->_offscreenSwapChain;
            do
            {
              -[MTKOffscreenDrawable setSize:](offscreenSwapChain[v23], "setSize:", self->_drawableSize.width, self->_drawableSize.height);
              -[MTKOffscreenDrawable setPixelFormat:](offscreenSwapChain[v23++], "setPixelFormat:", self->_colorPixelFormats[v11]);
            }
            while (v23 != 3);
            -[CAMetalDrawable texture](self->_currentDrawable, "texture");
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = (char *)self + *(int *)(v7 + 3828);
            v27 = *(void **)&v26[8 * v11];
            *(_QWORD *)&v26[8 * v11] = v25;
          }
          else
          {
            if (self->_colorPixelFormats[v11])
            {
              Main = CFRunLoopGetMain();
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __36__MTKView_colorTexturesForceUpdate___block_invoke;
              block[3] = &unk_24C3D4E38;
              block[4] = self;
              CFRunLoopPerformBlock(Main, mode, block);
              v29 = CFRunLoopGetMain();
              CFRunLoopWakeUp(v29);
              -[MTKView _resizeMetalLayerDrawable](self, "_resizeMetalLayerDrawable");
              v30 = (void *)MEMORY[0x24BDDD740];
              v31 = self->_colorPixelFormats[v11];
              v32 = objc_loadWeakRetained((id *)&self->_metalLayer);
              objc_msgSend(v32, "drawableSize");
              v33 = v7;
              v34 = v3;
              v36 = (unint64_t)v35;
              v37 = objc_loadWeakRetained((id *)&self->_metalLayer);
              objc_msgSend(v37, "drawableSize");
              v39 = v36;
              v3 = v34;
              v7 = v33;
              v12 = 0x25462B000;
              objc_msgSend(v30, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v31, v39, (unint64_t)v38, 0);
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v40, "setUsage:", self->_multisampleColorTextureUsage);
              objc_msgSend(v40, "setStorageMode:", 2);
              v41 = -[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v40);

            }
            else
            {
              objc_msgSend(MEMORY[0x24BDBCEF8], "null");
              v41 = objc_claimAutoreleasedReturnValue();
            }
            v42 = (char *)self + *(int *)(v7 + 3828);
            v27 = *(void **)&v42[8 * v11];
            *(_QWORD *)&v42[8 * v11] = v41;
          }

          goto LABEL_27;
        }
        v21 = objc_msgSend(*(id *)&v13[8 * v11], "usage");
        multisampleColorTextureUsage = self->_multisampleColorTextureUsage;

        if (v21 != multisampleColorTextureUsage)
          goto LABEL_17;
      }
LABEL_27:
      if (++v11 > self->_maxValidAttachmentIndex)
      {
        v6 = v45;
        self->_renderAttachmentDirtyState &= ~1u;
        break;
      }
    }
  }
  v43 = (const void **)((char *)&self->super.super.super.isa + *(int *)(v7 + 3828));

  return v43;
}

- (id)currentDrawable
{
  CAMetalDrawable *currentDrawable;
  void *v4;
  unint64_t v5;
  MTKOffscreenDrawable *v6;
  void *v7;
  id WeakRetained;
  CAMetalDrawable *v9;
  CAMetalDrawable *v10;

  currentDrawable = self->_currentDrawable;
  if (!currentDrawable)
  {
    v4 = (void *)MEMORY[0x20BD32DD8](0, a2);
    if (self->_drawOffscreen)
    {
      v5 = (self->_drawableIdx + 1) % 3;
      self->_drawableIdx = v5;
      v6 = self->_offscreenSwapChain[v5];
      v7 = self->_currentDrawable;
      self->_currentDrawable = (CAMetalDrawable *)v6;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
      objc_msgSend(WeakRetained, "nextDrawable");
      v9 = (CAMetalDrawable *)objc_claimAutoreleasedReturnValue();
      v10 = self->_currentDrawable;
      self->_currentDrawable = v9;

      if (self->_frameNum != 1
        || self->_dumpFrameAtFrame
        || self->_dumpFrameAtSeconds
        || !self->_dumpFirstFrame
        || !self->_framebufferOnly)
      {
        goto LABEL_8;
      }
      v7 = objc_loadWeakRetained((id *)&self->_metalLayer);
      objc_msgSend(v7, "setFramebufferOnly:", 1);
    }

LABEL_8:
    objc_autoreleasePoolPop(v4);
    currentDrawable = self->_currentDrawable;
  }
  return currentDrawable;
}

- (void)draw
{
  void *v3;
  void (*drawRectSubIMP)(MTKView *, char *);
  id WeakRetained;
  double v6;
  double startTime;
  unint64_t dumpFrameAtFrame;
  void *v9;
  double v10;
  unint64_t dumpFrameAtSeconds;
  void *v12;
  unint64_t measureAfterFrame;
  void *v14;
  unint64_t v15;
  unint64_t measureAfterSeconds;
  void *v17;
  unint64_t v18;
  unint64_t terminateAfterFrame;
  unint64_t terminateAfterSeconds;
  CAMetalDrawable *currentDrawable;
  unint64_t drawableAttachmentIndex;
  MTLTexture *v23;

  ++self->_frameNum;
  v3 = (void *)MEMORY[0x20BD32DD8]();
  -[MTKView _resizeMetalLayerDrawable](self, "_resizeMetalLayerDrawable");
  if (self->_subClassOverridesDrawRect)
  {
    drawRectSubIMP = (void (*)(MTKView *, char *))self->_drawRectSubIMP;
    -[MTKView bounds](self, "bounds");
    drawRectSubIMP(self, sel_drawRect_);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "drawInMTKView:", self);

  }
  if (self->_frameNum == 1)
  {
    if (self->_dumpFirstFrame)
      -[MTKView _dumpFrameImageWithFilename:](self, "_dumpFrameImageWithFilename:", CFSTR("MTKViewFirstFrameDump"));
    self->_startTime = CACurrentMediaTime();
  }
  v6 = CACurrentMediaTime();
  startTime = self->_startTime;
  dumpFrameAtFrame = self->_dumpFrameAtFrame;
  if (dumpFrameAtFrame && dumpFrameAtFrame <= self->_frameNum)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MTKViewFrameDumpAfterFrame_%d"), self->_frameNum);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTKView _dumpFrameImageWithFilename:](self, "_dumpFrameImageWithFilename:", v9);
    self->_dumpFrameAtFrame = 0;

  }
  v10 = v6 - startTime;
  dumpFrameAtSeconds = self->_dumpFrameAtSeconds;
  if (dumpFrameAtSeconds && v10 >= (double)dumpFrameAtSeconds)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MTKViewFrameDumpAfterSeconds_%lu"), self->_dumpFrameAtSeconds);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTKView _dumpFrameImageWithFilename:](self, "_dumpFrameImageWithFilename:", v12);
    self->_dumpFrameAtSeconds = 0;

  }
  measureAfterFrame = self->_measureAfterFrame;
  if (measureAfterFrame && measureAfterFrame <= self->_frameNum)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MTKViewFramerateAfterFrame_%d"), self->_frameNum);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = self->_frameNum;
    -[MTKView _dumpFramerate:withFilename:](self, "_dumpFramerate:withFilename:", v14, (double)v15 / v10);
    self->_measureAfterFrame = 0;

  }
  measureAfterSeconds = self->_measureAfterSeconds;
  if (measureAfterSeconds && v10 >= (double)measureAfterSeconds)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MTKViewFramerateAfterSeconds_%lu"), self->_measureAfterSeconds);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = self->_frameNum;
    -[MTKView _dumpFramerate:withFilename:](self, "_dumpFramerate:withFilename:", v17, (double)v18 / v10);
    self->_measureAfterSeconds = 0;

  }
  terminateAfterFrame = self->_terminateAfterFrame;
  if (terminateAfterFrame && terminateAfterFrame <= self->_frameNum
    || (terminateAfterSeconds = self->_terminateAfterSeconds) != 0 && v10 >= (double)terminateAfterSeconds)
  {
    exit(0);
  }
  currentDrawable = self->_currentDrawable;
  self->_currentDrawable = 0;

  drawableAttachmentIndex = self->_drawableAttachmentIndex;
  v23 = self->_colorTextures[drawableAttachmentIndex];
  self->_colorTextures[drawableAttachmentIndex] = 0;

  objc_autoreleasePoolPop(v3);
}

- (void)_resizeMetalLayerDrawable
{
  double width;
  double height;
  id WeakRetained;

  if (self->_sizeDirty)
  {
    width = self->_drawableSize.width;
    height = self->_drawableSize.height;
    WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
    objc_msgSend(WeakRetained, "setDrawableSize:", width, height);

    self->_renderAttachmentDirtyState |= 0x80010001;
    self->_sizeDirty = 0;
  }
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_updateToNativeScale
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  if (self->_autoResizeDrawable)
  {
    -[MTKView window](self, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[MTKView window](self, "window");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "screen");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "nativeScale");
      v7 = v6;

      -[MTKView setContentScaleFactor:](self, "setContentScaleFactor:", v7);
    }
  }
}

- (void)_createDisplayLinkForScreen:(id)a3
{
  CADisplayLink *displayLink;
  id v5;
  CADisplayLink *v6;
  CADisplayLink *v7;
  CADisplayLink *v8;
  void *v9;
  MTKViewDisplayLinkTarget *v10;

  displayLink = self->_displayLink;
  v5 = a3;
  -[CADisplayLink invalidate](displayLink, "invalidate");
  v10 = -[MTKViewDisplayLinkTarget initWithTarget:]([MTKViewDisplayLinkTarget alloc], "initWithTarget:", self);
  objc_msgSend(v5, "displayLinkWithTarget:selector:", v10, sel_draw);
  v6 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();

  v7 = self->_displayLink;
  self->_displayLink = v6;

  v8 = self->_displayLink;
  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CADisplayLink addToRunLoop:forMode:](v8, "addToRunLoop:forMode:", v9, *MEMORY[0x24BDBCB80]);

  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", self->_paused);
  -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", self->_preferredFramesPerSecond);

}

- (MTKView)initWithFrame:(CGRect)frameRect device:(id)device
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  MTKView *v11;
  MTKView *v12;
  objc_super v14;

  height = frameRect.size.height;
  width = frameRect.size.width;
  y = frameRect.origin.y;
  x = frameRect.origin.x;
  v10 = device;
  v14.receiver = self;
  v14.super_class = (Class)MTKView;
  v11 = -[MTKView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_device, device);
    -[MTKView __initCommon](v12, "__initCommon");
  }

  return v12;
}

- (void)__initCommon
{
  void *v3;
  void *v4;
  void *v5;
  MTLDevice *device;
  id WeakRetained;
  id v8;
  id v9;
  int v10;
  unint64_t v11;
  id v12;
  uint64_t i;
  MTKOffscreenDrawable *v14;
  MTKOffscreenDrawable *v15;
  void *drawRectSubIMP;
  BOOL v17;
  BOOL v18;
  id v19;

  -[MTKView getEnvironmentSettings](self, "getEnvironmentSettings");
  if (self->_forceOrientation)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_forceOrientation);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("orientation"));

  }
  self->_pausedOnBackgrounding = 1;
  -[MTKView setContentScaleFactor:](self, "setContentScaleFactor:", 0.0);
  -[MTKView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_metalLayer, v5);

  self->_sampleCount = 1;
  self->_paused = 0;
  self->_renderAttachmentDirtyState = -2147418111;
  *(_OWORD *)self->_colorPixelFormats = 0u;
  *(_OWORD *)&self->_colorPixelFormats[2] = 0u;
  *(_OWORD *)&self->_colorPixelFormats[4] = 0u;
  *(_OWORD *)&self->_colorPixelFormats[6] = 0u;
  *(_OWORD *)self->_colorTextures = 0u;
  *(_OWORD *)&self->_colorTextures[2] = 0u;
  *(_OWORD *)&self->_colorTextures[4] = 0u;
  *(_OWORD *)&self->_colorTextures[6] = 0u;
  *(_OWORD *)self->_multisampleColorTextures = 0u;
  *(_OWORD *)&self->_multisampleColorTextures[2] = 0u;
  *(_OWORD *)&self->_multisampleColorTextures[4] = 0u;
  *(_OWORD *)&self->_multisampleColorTextures[6] = 0u;
  self->_drawableAttachmentIndex = 0;
  self->_maxValidAttachmentIndex = 0;
  -[MTKView setColorPixelFormat:](self, "setColorPixelFormat:", 80);
  device = self->_device;
  WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
  objc_msgSend(WeakRetained, "setDevice:", device);

  v8 = objc_loadWeakRetained((id *)&self->_metalLayer);
  objc_msgSend(v8, "setDelegate:", self);

  v9 = objc_loadWeakRetained((id *)&self->_metalLayer);
  objc_msgSend(v9, "setFramebufferOnly:", 1);

  self->_framebufferOnly = 1;
  v10 = _mtkLinkedOnOrAfter(1uLL);
  v11 = 4;
  if (!v10)
    v11 = 0;
  self->_depthStencilTextureUsage = v11;
  self->_multisampleColorTextureUsage = v11;
  if (self->_dumpFrameAtFrame || self->_dumpFrameAtSeconds || self->_dumpFirstFrame)
  {
    v12 = objc_loadWeakRetained((id *)&self->_metalLayer);
    objc_msgSend(v12, "setFramebufferOnly:", 0);

  }
  self->_clearColor.red = 0.0;
  self->_clearColor.green = 0.0;
  self->_clearColor.blue = 0.0;
  self->_clearColor.alpha = 1.0;
  self->_clearDepth = 1.0;
  self->_clearStencil = 0;
  self->_depthStencilStorageMode = 2;
  self->_enableSetNeedsDisplay = 0;
  if (self->_drawOffscreen)
  {
    for (i = 0; i != 3; ++i)
    {
      v14 = -[MTKOffscreenDrawable initWithDevice:pixelFormat:size:drawableID:]([MTKOffscreenDrawable alloc], "initWithDevice:pixelFormat:size:drawableID:", self->_device, -[MTKView colorPixelFormat](self, "colorPixelFormat"), i, self->_drawableSize.width, self->_drawableSize.height);
      v15 = self->_offscreenSwapChain[i];
      self->_offscreenSwapChain[i] = v14;

    }
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[MTKView setOpaque:](self, "setOpaque:", 1);
  -[MTKView setBackgroundColor:](self, "setBackgroundColor:", 0);
  -[MTKView setPreferredFramesPerSecond:](self, "setPreferredFramesPerSecond:", 60);
  objc_msgSend(v19, "addObserver:selector:name:object:", self, sel__applicationDidEnterBackground_, *MEMORY[0x24BDF7528], 0);
  objc_msgSend(v19, "addObserver:selector:name:object:", self, sel__applicationWillEnterForeground_, *MEMORY[0x24BDF75D0], 0);
  if (!_drawRectSuperIMP)
    _drawRectSuperIMP = objc_msgSend(MEMORY[0x24BDF6F90], "instanceMethodForSelector:", sel_drawRect_);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    drawRectSubIMP = (void *)-[MTKView methodForSelector:](self, "methodForSelector:", sel_drawRect_);
    self->_drawRectSubIMP = drawRectSubIMP;
  }
  else
  {
    drawRectSubIMP = self->_drawRectSubIMP;
  }
  if (drawRectSubIMP)
    v17 = drawRectSubIMP == (void *)_drawRectSuperIMP;
  else
    v17 = 1;
  v18 = !v17;
  self->_subClassOverridesDrawRect = v18;
  self->_autoResizeDrawable = 1;
  -[MTKView _resizeDrawable](self, "_resizeDrawable");

}

- (void)setColorPixelFormat:(MTLPixelFormat)colorPixelFormat
{
  -[MTKView setColorPixelFormat:atIndex:](self, "setColorPixelFormat:atIndex:", colorPixelFormat, self->_drawableAttachmentIndex);
}

- (void)setPreferredFramesPerSecond:(NSInteger)preferredFramesPerSecond
{
  self->_preferredFramesPerSecond = preferredFramesPerSecond;
  if (preferredFramesPerSecond <= 0)
  {
    -[MTKView setPaused:](self, "setPaused:", 1);
    preferredFramesPerSecond = self->_preferredFramesPerSecond;
  }
  -[MTKView setNominalFramesPerSecond:](self, "setNominalFramesPerSecond:", preferredFramesPerSecond);
  -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", self->_preferredFramesPerSecond);
}

- (void)setNominalFramesPerSecond:(int64_t)a3
{
  self->_nominalFramesPerSecond = a3;
}

- (void)setDevice:(id)device
{
  MTLDevice *v5;
  MTLTexture *depthStencilTexture;
  MTLTexture *multisampleColorTexture;
  id WeakRetained;
  uint64_t i;
  MTLDevice *v10;

  v5 = (MTLDevice *)device;
  if (self->_device != v5)
  {
    depthStencilTexture = self->_depthStencilTexture;
    self->_depthStencilTexture = 0;
    v10 = v5;

    multisampleColorTexture = self->_multisampleColorTexture;
    self->_multisampleColorTexture = 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
    objc_msgSend(WeakRetained, "setDevice:", v10);

    if (self->_drawOffscreen)
    {
      for (i = 0; i != 3; ++i)
        -[MTKOffscreenDrawable setDevice:](self->_offscreenSwapChain[i], "setDevice:", v10);
    }
    self->_renderAttachmentDirtyState |= 0x80010001;
    objc_storeStrong((id *)&self->_device, device);
    v5 = v10;
  }

}

- (void)setPaused:(BOOL)paused
{
  self->_paused = paused;
  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:");
}

- (void)setEnableSetNeedsDisplay:(BOOL)enableSetNeedsDisplay
{
  self->_enableSetNeedsDisplay = enableSetNeedsDisplay;
  if (enableSetNeedsDisplay)
    -[MTKView setPaused:](self, "setPaused:", 1);
}

uint64_t __30__MTKView_depthStencilTexture__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resizeDrawable");
}

- (id)device
{
  return self->_device;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setClearColor:(MTLClearColor)clearColor
{
  self->_clearColor = ($3ED934EFF50B3E737D3D4A62C605F33B)clearColor;
}

- (MTKView)initWithFrame:(CGRect)a3
{
  return -[MTKView initWithFrame:device:](self, "initWithFrame:device:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (void)setClearDepth:(double)clearDepth
{
  self->_clearDepth = clearDepth;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPresentsWithTransaction:(BOOL)presentsWithTransaction
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = presentsWithTransaction;
  WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
  objc_msgSend(WeakRetained, "setPresentsWithTransaction:", v3);

}

- (void)setSampleCount:(NSUInteger)sampleCount
{
  MTLTexture *multisampleColorTexture;

  if (sampleCount <= 1)
  {
    multisampleColorTexture = self->_multisampleColorTexture;
    self->_multisampleColorTexture = 0;

  }
  self->_sampleCount = sampleCount;
  self->_renderAttachmentDirtyState |= 0x80010001;
}

- (void)setDepthStencilPixelFormat:(MTLPixelFormat)depthStencilPixelFormat
{
  MTLTexture *depthStencilTexture;

  if (depthStencilPixelFormat)
  {
    if (depthStencilPixelFormat == MTLPixelFormatX32_Stencil8)
      -[MTKView setDepthStencilPixelFormat:].cold.1();
  }
  else
  {
    depthStencilTexture = self->_depthStencilTexture;
    self->_depthStencilTexture = 0;

  }
  self->_depthStencilPixelFormat = depthStencilPixelFormat;
  self->_renderAttachmentDirtyState |= 0x80000000;
}

- (BOOL)exportToTargaAtLocation:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 size:(unint64_t)a6 bytes:(void *)a7
{
  __int16 v9;
  __int16 v10;
  objc_class *v11;
  id v12;
  id v13;
  uint64_t v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  id v20;

  v9 = a5;
  v10 = a4;
  v11 = (objc_class *)MEMORY[0x24BDBCEC8];
  v12 = a3;
  v13 = objc_retainAutorelease((id)objc_msgSend([v11 alloc], "initWithLength:", 18));
  v14 = objc_msgSend(v13, "mutableBytes");
  *(_WORD *)v14 = 0;
  *(_BYTE *)(v14 + 2) = 2;
  *(_QWORD *)(v14 + 3) = 0;
  *(_BYTE *)(v14 + 11) = 0;
  *(_WORD *)(v14 + 12) = v10;
  *(_WORD *)(v14 + 14) = v9;
  *(_WORD *)(v14 + 16) = 32;
  objc_msgSend(v13, "appendBytes:length:", a7, a6);
  v20 = 0;
  v15 = objc_msgSend(v13, "writeToURL:options:error:", v12, 0, &v20);

  v16 = v20;
  v17 = v16;
  if ((v15 & 1) == 0)
  {
    objc_msgSend(v16, "localizedDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Couldn't export image to TGA %@"), v18);

  }
  return v15;
}

- (double)startTime
{
  return self->_startTime;
}

- (unint64_t)drawNumber
{
  return self->_frameNum;
}

- (void)_dumpFramerate:(double)a3 withFilename:(id)a4
{
  NSString *dumpPath;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  dumpPath = self->_dumpPath;
  v6 = a4;
  v7 = (void *)-[NSString copy](dumpPath, "copy");
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("/"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByAppendingString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByAppendingString:", CFSTR(".txt"));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "createFileAtPath:contents:attributes:", v13, v12, 0);

}

- (void)_dumpFrameImageWithFilename:(id)a3
{
  id v4;
  unint64_t v5;
  double v6;
  CGSize *p_drawableSize;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t width;
  unint64_t height;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  void *v21;
  id v22;
  id v23;
  const char *v24;
  id v25;
  unint64_t v26;
  id v27;
  unint64_t v28;
  void *v29;
  MTKTextureIOBufferAllocator *v30;
  id v31;
  _QWORD v32[3];
  _QWORD v33[4];

  v4 = a3;
  v5 = self->_colorPixelFormats[self->_drawableAttachmentIndex];
  v6 = 4.0;
  if (v5 - 70 > 0x2D)
    goto LABEL_4;
  if (((1 << (v5 - 70)) & 0xC03) != 0)
    goto LABEL_7;
  if (v5 != 115)
  {
LABEL_4:
    if (v5 - 554 < 2)
      goto LABEL_7;
    if (v5 - 552 > 1)
      -[MTKView _dumpFrameImageWithFilename:].cold.1();
  }
  v6 = 8.0;
LABEL_7:
  p_drawableSize = &self->_drawableSize;
  v26 = (unint64_t)(v6 * self->_drawableSize.width);
  v8 = (unint64_t)(self->_drawableSize.height * (double)v26);
  v28 = self->_colorPixelFormats[self->_drawableAttachmentIndex];
  v30 = -[MTKTextureIOBufferAllocator initWithDevice:]([MTKTextureIOBufferAllocator alloc], "initWithDevice:", self->_device);
  v27 = -[MTKTextureIOBufferAllocator newBufferWithLength:](v30, "newBufferWithLength:", v8);
  v29 = (void *)-[MTLDevice newCommandQueue](self->_device, "newCommandQueue");
  objc_msgSend(v29, "commandBuffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "blitCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  width = (unint64_t)self->_drawableSize.width;
  height = (unint64_t)self->_drawableSize.height;
  -[CAMetalDrawable texture](self->_currentDrawable, "texture");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v33, 0, 24);
  objc_msgSend(v27, "buffer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = width;
  v32[1] = height;
  v15 = v4;
  v32[2] = 1;
  objc_msgSend(v10, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:", v13, 0, 0, v33, v32, v14, 0, v26, v8);

  objc_msgSend(v10, "endEncoding");
  objc_msgSend(v9, "commit");
  objc_msgSend(v9, "waitUntilCompleted");
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("file:///"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLByAppendingPathComponent:", self->_dumpPath);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "URLByAppendingPathComponent:", v4);
  v18 = objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v18, "URLByAppendingPathExtension:", CFSTR("png"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = COERCE_DOUBLE(vmovn_s64((int64x2_t)vcvtq_u64_f64(*(float64x2_t *)p_drawableSize)));
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB6DC0]), "initWithDimensions:pixelFormat:alphaInfo:bytesPerRow:bytesPerImage:buffer:offset:", v28, 0, v26, v8, v27, 0, v20);
  v31 = 0;
  LOBYTE(v18) = objc_msgSend(v21, "exportToURL:uttype:error:", v19, CFSTR("public.png"), &v31);
  v22 = v31;
  if ((v18 & 1) == 0)
  {
    objc_msgSend(v19, "absoluteString");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v24 = (const char *)objc_msgSend(v23, "UTF8String");
    objc_msgSend(v22, "localizedDescription");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    printf("Image Dump Error - %s: %s ", v24, (const char *)objc_msgSend(v25, "UTF8String"));

  }
}

- (CGColorSpaceRef)colorspace
{
  return 0;
}

- (void)setDrawableAttachmentIndex:(unint64_t)a3
{
  if (self->_drawableAttachmentIndex <= 7)
    self->_drawableAttachmentIndex = a3;
}

- (unint64_t)drawableAttachmentIndex
{
  return self->_drawableAttachmentIndex;
}

- (const)multisampleColorTextures
{
  return -[MTKView multisampleColorTexturesForceUpdate:](self, "multisampleColorTexturesForceUpdate:", 0);
}

- (const)multisampleColorTexturesForceUpdate:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  Class v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  void *v10;
  double v11;
  id WeakRetained;
  double v13;
  double v14;
  id v15;
  double v16;
  _BOOL4 v17;
  uint64_t v18;
  __CFRunLoop *Main;
  __CFRunLoop *v20;
  unint64_t v21;
  id v22;
  unint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  double v26;
  unint64_t v27;
  id v28;
  double v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  char *v33;
  void *v34;
  CFTypeRef mode;
  void *v37;
  _QWORD block[5];

  v3 = a3;
  -[MTKView colorTextures](self, "colorTextures");
  v5 = 0x25462B000uLL;
  if ((self->_renderAttachmentDirtyState & 0x10000) == 0)
    return (const void **)((char *)&self->super.super.super.isa + *(int *)(v5 + 3832));
  if (self->_device)
  {
    v6 = 0;
    v7 = 552;
    mode = (CFTypeRef)*MEMORY[0x24BDBD598];
    v8 = 0x25462B000uLL;
    do
    {
      if (v3)
        goto LABEL_16;
      v9 = (char *)self + *(int *)(v5 + 3832);
      v10 = *(void **)&v9[8 * (_QWORD)v6];
      if (!v10)
        goto LABEL_16;
      v11 = (double)(unint64_t)objc_msgSend(v10, "width");
      WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
      objc_msgSend(WeakRetained, "drawableSize");
      if (v13 == v11)
      {
        v14 = (double)(unint64_t)objc_msgSend(*(id *)&v9[8 * (_QWORD)v6], "height");
        v15 = objc_loadWeakRetained((id *)&self->_metalLayer);
        objc_msgSend(v15, "drawableSize");
        v17 = v16 != v14
           || (Class)objc_msgSend(*(id *)&v9[8 * (_QWORD)v6], "sampleCount") != *(Class *)((char *)&self->super.super.super.isa
                                                                                         + *(int *)(v8 + 3812))
           || objc_msgSend(*(id *)&v9[8 * (_QWORD)v6], "pixelFormat") != self->_colorPixelFormats[(_QWORD)v6]
           || objc_msgSend(*(id *)&v9[8 * (_QWORD)v6], "usage") != self->_multisampleColorTextureUsage;

      }
      else
      {
        v17 = 1;
      }

      if (v17)
      {
LABEL_16:
        v18 = *(int *)(v8 + 3812);
        if (*(Class *)((char *)&self->super.super.super.isa + v18) >= (Class)2)
        {
          if (self->_colorPixelFormats[(_QWORD)v6])
          {
            Main = CFRunLoopGetMain();
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __47__MTKView_multisampleColorTexturesForceUpdate___block_invoke;
            block[3] = &unk_24C3D4E38;
            block[4] = self;
            CFRunLoopPerformBlock(Main, mode, block);
            v20 = CFRunLoopGetMain();
            CFRunLoopWakeUp(v20);
            -[MTKView _resizeMetalLayerDrawable](self, "_resizeMetalLayerDrawable");
            v37 = (void *)MEMORY[0x24BDDD740];
            v21 = self->_colorPixelFormats[(_QWORD)v6];
            v22 = objc_loadWeakRetained((id *)&self->_metalLayer);
            objc_msgSend(v22, "drawableSize");
            v23 = v8;
            v24 = v3;
            v25 = v7;
            v27 = (unint64_t)v26;
            v28 = objc_loadWeakRetained((id *)&self->_metalLayer);
            objc_msgSend(v28, "drawableSize");
            v30 = v27;
            v7 = v25;
            v3 = v24;
            v8 = v23;
            objc_msgSend(v37, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v21, v30, (unint64_t)v29, 0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            v5 = 0x25462B000;
            objc_msgSend(v31, "setTextureType:", 4);
            objc_msgSend(v31, "setSampleCount:", *(Class *)((char *)&self->super.super.super.isa + v18));
            objc_msgSend(v31, "setUsage:", self->_multisampleColorTextureUsage);
            objc_msgSend(v31, "setStorageMode:", 2);
            v32 = -[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v31);

          }
          else
          {
            v32 = 0;
          }
          v33 = (char *)self + *(int *)(v5 + 3832);
          v34 = *(void **)&v33[8 * (_QWORD)v6];
          *(_QWORD *)&v33[8 * (_QWORD)v6] = v32;

        }
      }
      v6 = (Class)((char *)v6 + 1);
    }
    while (v6 <= *(Class *)((char *)&self->super.super.super.isa + v7));
    self->_renderAttachmentDirtyState &= ~0x10000u;
    return (const void **)((char *)&self->super.super.super.isa + *(int *)(v5 + 3832));
  }
  return 0;
}

uint64_t __47__MTKView_multisampleColorTexturesForceUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resizeDrawable");
}

uint64_t __36__MTKView_colorTexturesForceUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resizeDrawable");
}

- (id)multisampleColorTexture
{
  return (id)-[MTKView multisampleColorTextures](self, "multisampleColorTextures")[8 * self->_drawableAttachmentIndex];
}

- (int64_t)nominalFramesPerSecond
{
  return self->_nominalFramesPerSecond;
}

- (int64_t)_calculateRefeshesPerSecond
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;

  -[MTKView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_refreshRate");
    v6 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_refreshRate");
    v6 = v8;

  }
  if (v6 == 0.0)
    return 0;
  else
    return llround(1.0 / v6);
}

- (void)_applicationWillEnterForeground:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_pausedOnBackgrounding && self->_paused)
  {
    v5 = v4;
    -[MTKView setPaused:](self, "setPaused:", 0);
    v4 = v5;
  }

}

- (void)_applicationDidEnterBackground:(id)a3
{
  -[MTKView releaseDrawables](self, "releaseDrawables", a3);
  self->_pausedOnBackgrounding = self->_paused;
  if (!self->_paused)
    -[MTKView setPaused:](self, "setPaused:", 1);
}

- (MTKView)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  MTKView *v5;
  MTKView *v6;
  MTLDevice *device;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  double *v13;
  float v14;
  uint64_t v16;
  objc_super v17;

  v4 = coder;
  v17.receiver = self;
  v17.super_class = (Class)MTKView;
  v5 = -[MTKView initWithCoder:](&v17, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    device = v5->_device;
    v5->_device = 0;

    -[MTKView __initCommon](v6, "__initCommon");
    v8 = 0;
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("MTKViewNumberColorPixelFormatsCoderKey")))
    {
      v8 = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("MTKViewNumberColorPixelFormatsCoderKey"));
      v6->_maxValidAttachmentIndex = v8 - 1;
    }
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("MTKViewColorPixelFormatArrayCoderKey")))
    {
      v16 = 0;
      v9 = -[NSCoder decodeBytesForKey:returnedLength:](objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("MTKViewColorPixelFormatArrayCoderKey"), &v16);
      if (v16 != 8 * v8)
        -[MTKView initWithCoder:].cold.1();
      if (v8)
      {
        v10 = v9;
        for (i = 0; i != v8; ++i)
          -[MTKView setColorPixelFormat:atIndex:](v6, "setColorPixelFormat:atIndex:", *(_QWORD *)(v10 + 8 * i), i);
      }
    }
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("MTKViewDrawableAttachmentIndexCoderKey")))
      -[MTKView setDrawableAttachmentIndex:](v6, "setDrawableAttachmentIndex:", -[NSCoder decodeIntForKey:](v4, "decodeIntForKey:", CFSTR("MTKViewDrawableAttachmentIndexCoderKey")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("MTKViewColorPixelFormatCoderKey")))
      -[MTKView setColorPixelFormat:](v6, "setColorPixelFormat:", -[NSCoder decodeIntForKey:](v4, "decodeIntForKey:", CFSTR("MTKViewColorPixelFormatCoderKey")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("MTKViewDepthStencilPixelFormatCoderKey")))
      -[MTKView setDepthStencilPixelFormat:](v6, "setDepthStencilPixelFormat:", -[NSCoder decodeIntForKey:](v4, "decodeIntForKey:", CFSTR("MTKViewDepthStencilPixelFormatCoderKey")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("MTKViewSampleCountCoderKey")))
      -[MTKView setSampleCount:](v6, "setSampleCount:", -[NSCoder decodeIntForKey:](v4, "decodeIntForKey:", CFSTR("MTKViewSampleCountCoderKey")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("MTKViewClearColorCoderKey")))
    {
      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("MTKViewClearColorCoderKey"));
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v13 = (double *)objc_msgSend(v12, "bytes");
      -[MTKView setClearColor:](v6, "setClearColor:", *v13, v13[1], v13[2], v13[3]);

    }
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("MTKViewFramebufferOnlyCoderKey")))
      -[MTKView setFramebufferOnly:](v6, "setFramebufferOnly:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("MTKViewFramebufferOnlyCoderKey")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("MTKViewPresentsWithTransactionCoderKey")))
      -[MTKView setPresentsWithTransaction:](v6, "setPresentsWithTransaction:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("MTKViewPresentsWithTransactionCoderKey")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("MTKViewClearDepthCoderKey")))
    {
      -[NSCoder decodeFloatForKey:](v4, "decodeFloatForKey:", CFSTR("MTKViewClearDepthCoderKey"));
      -[MTKView setClearDepth:](v6, "setClearDepth:", v14);
    }
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("MTKViewClearStencilCoderKey")))
      -[MTKView setClearStencil:](v6, "setClearStencil:", -[NSCoder decodeIntForKey:](v4, "decodeIntForKey:", CFSTR("MTKViewClearStencilCoderKey")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("MTKViewPreferredFramesPerSecondCoderKey")))
      -[MTKView setPreferredFramesPerSecond:](v6, "setPreferredFramesPerSecond:", -[NSCoder decodeIntForKey:](v4, "decodeIntForKey:", CFSTR("MTKViewPreferredFramesPerSecondCoderKey")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("MTKViewEnableSetNeedsDisplayCoderKey")))
      -[MTKView setEnableSetNeedsDisplay:](v6, "setEnableSetNeedsDisplay:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("MTKViewEnableSetNeedsDisplayCoderKey")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("MTKViewPausedCoderKey")))
      -[MTKView setPaused:](v6, "setPaused:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("MTKViewPausedCoderKey")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("MTKViewAutoResizeDrawableCoderKey")))
      -[MTKView setAutoResizeDrawable:](v6, "setAutoResizeDrawable:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("MTKViewAutoResizeDrawableCoderKey")));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t maxValidAttachmentIndex;
  int64_t v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t *colorPixelFormats;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  double clearDepth;
  id WeakRetained;
  id v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MTKView;
  -[MTKView encodeWithCoder:](&v18, sel_encodeWithCoder_, v4);
  maxValidAttachmentIndex = self->_maxValidAttachmentIndex;
  v6 = maxValidAttachmentIndex + 1;
  v7 = maxValidAttachmentIndex == -1;
  objc_msgSend(v4, "encodeInteger:forKey:", maxValidAttachmentIndex + 1, CFSTR("MTKViewNumberColorPixelFormatsCoderKey"));
  v8 = 8 * v6;
  v9 = malloc_type_malloc(8 * v6, 0x8067A07uLL);
  v10 = v9;
  if (!v7)
  {
    colorPixelFormats = self->_colorPixelFormats;
    v12 = v9;
    do
    {
      v13 = *colorPixelFormats++;
      *v12++ = v13;
      --v6;
    }
    while (v6);
  }
  objc_msgSend(v4, "encodeBytes:length:forKey:", v9, v8, CFSTR("MTKViewColorPixelFormatArrayCoderKey"));
  free(v10);
  objc_msgSend(v4, "encodeInteger:forKey:", -[MTKView drawableAttachmentIndex](self, "drawableAttachmentIndex"), CFSTR("MTKViewDrawableAttachmentIndexCoderKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MTKView colorPixelFormat](self, "colorPixelFormat"), CFSTR("MTKViewColorPixelFormatCoderKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_depthStencilPixelFormat, CFSTR("MTKViewDepthStencilPixelFormatCoderKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_sampleCount, CFSTR("MTKViewSampleCountCoderKey"));
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &self->_clearColor, 32);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("MTKViewClearColorCoderKey"));
  clearDepth = self->_clearDepth;
  *(float *)&clearDepth = clearDepth;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("MTKViewClearDepthCoderKey"), clearDepth);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_clearStencil, CFSTR("MTKViewClearStencilCoderKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_preferredFramesPerSecond, CFSTR("MTKViewPreferredFramesPerSecondCoderKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_enableSetNeedsDisplay, CFSTR("MTKViewEnableSetNeedsDisplayCoderKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_paused, CFSTR("MTKViewPausedCoderKey"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
  objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(WeakRetained, "framebufferOnly"), CFSTR("MTKViewFramebufferOnlyCoderKey"));

  v17 = objc_loadWeakRetained((id *)&self->_metalLayer);
  objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v17, "presentsWithTransaction"), CFSTR("MTKViewPresentsWithTransactionCoderKey"));

  objc_msgSend(v4, "encodeBool:forKey:", self->_autoResizeDrawable, CFSTR("MTKViewAutoResizeDrawableCoderKey"));
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)MTKView;
  -[MTKView dealloc](&v4, sel_dealloc);
}

- (void)releaseDrawables
{
  MTLTexture *depthStencilTexture;
  MTLTexture *multisampleColorTexture;

  depthStencilTexture = self->_depthStencilTexture;
  self->_depthStencilTexture = 0;

  multisampleColorTexture = self->_multisampleColorTexture;
  self->_multisampleColorTexture = 0;

  self->_renderAttachmentDirtyState |= 0x80010000;
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  if (self->_enableSetNeedsDisplay)
    -[MTKView displayLayer:](self, "displayLayer:", a3, a4);
}

- (void)setDrawableSize:(CGSize)drawableSize
{
  double height;
  double width;
  CGSize *p_drawableSize;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  height = drawableSize.height;
  width = drawableSize.width;
  p_drawableSize = &self->_drawableSize;
  if (self->_drawableSize.width != drawableSize.width || self->_drawableSize.height != drawableSize.height)
  {
    -[MTKView bounds](self, "bounds");
    v9 = v8;
    -[MTKView setContentScaleFactor:](self, "setContentScaleFactor:", width / v10);
    self->_drawableScaleFactor.width = 1.0;
    -[MTKView contentScaleFactor](self, "contentScaleFactor");
    self->_drawableScaleFactor.height = height / v9 / v11;
    -[MTKView delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mtkView:drawableSizeWillChange:", self, width, height);

    p_drawableSize->width = width;
    p_drawableSize->height = height;
    self->_sizeDirty = 1;
  }
}

- (id)preferredDevice
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
  objc_msgSend(WeakRetained, "preferredDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setNilValueForKey:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("clearColor")))
  {
    -[MTKView setClearColor:](self, "setClearColor:", 0.0, 0.0, 0.0, 1.0);
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("sampleCount")))
  {
    -[MTKView setSampleCount:](self, "setSampleCount:", 1);
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("clearDepth")))
  {
    -[MTKView setClearDepth:](self, "setClearDepth:", 1.0);
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("clearStencil")))
  {
    -[MTKView setClearStencil:](self, "setClearStencil:", 0);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MTKView;
    -[MTKView setNilValueForKey:](&v5, sel_setNilValueForKey_, v4);
  }

}

- (void)setDepthStencilAttachmentTextureUsage:(MTLTextureUsage)depthStencilAttachmentTextureUsage
{
  if (self->_depthStencilTextureUsage != depthStencilAttachmentTextureUsage)
  {
    self->_depthStencilTextureUsage = depthStencilAttachmentTextureUsage;
    self->_renderAttachmentDirtyState |= 0x80000000;
  }
}

- (MTLTextureUsage)depthStencilAttachmentTextureUsage
{
  return self->_depthStencilTextureUsage;
}

- (MTLStorageMode)depthStencilStorageMode
{
  return self->_depthStencilStorageMode;
}

- (void)setDepthStencilStorageMode:(MTLStorageMode)depthStencilStorageMode
{
  if (self->_depthStencilStorageMode != depthStencilStorageMode)
  {
    self->_depthStencilStorageMode = depthStencilStorageMode;
    self->_renderAttachmentDirtyState |= 0x80000000;
  }
}

- (void)setMultisampleColorAttachmentTextureUsage:(MTLTextureUsage)multisampleColorAttachmentTextureUsage
{
  if (self->_multisampleColorTextureUsage != multisampleColorAttachmentTextureUsage)
  {
    self->_multisampleColorTextureUsage = multisampleColorAttachmentTextureUsage;
    self->_renderAttachmentDirtyState |= 0x10001u;
  }
}

- (MTLTextureUsage)multisampleColorAttachmentTextureUsage
{
  return self->_multisampleColorTextureUsage;
}

- (BOOL)framebufferOnly
{
  id WeakRetained;
  char v3;

  self->_framebufferOnly = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
  v3 = objc_msgSend(WeakRetained, "framebufferOnly");

  return v3;
}

- (MTLClearColor)clearColor
{
  double red;
  double green;
  double blue;
  double alpha;
  MTLClearColor result;

  red = self->_clearColor.red;
  green = self->_clearColor.green;
  blue = self->_clearColor.blue;
  alpha = self->_clearColor.alpha;
  result.alpha = alpha;
  result.blue = blue;
  result.green = green;
  result.red = red;
  return result;
}

- (double)clearDepth
{
  return self->_clearDepth;
}

- (uint32_t)clearStencil
{
  return self->_clearStencil;
}

- (void)setClearStencil:(uint32_t)clearStencil
{
  self->_clearStencil = clearStencil;
}

- (NSInteger)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (BOOL)autoResizeDrawable
{
  return self->_autoResizeDrawable;
}

- (void)setAutoResizeDrawable:(BOOL)autoResizeDrawable
{
  self->_autoResizeDrawable = autoResizeDrawable;
}

- (CGSize)preferredDrawableSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredDrawableSize.width;
  height = self->_preferredDrawableSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  uint64_t k;

  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dumpPath, 0);
  for (i = 2; i != -1; --i)
    objc_storeStrong((id *)&self->_offscreenSwapChain[i], 0);
  for (j = 7; j != -1; --j)
    objc_storeStrong((id *)&self->_colorTextures[j], 0);
  for (k = 7; k != -1; --k)
    objc_storeStrong((id *)&self->_multisampleColorTextures[k], 0);
  objc_storeStrong((id *)&self->_multisampleColorTexture, 0);
  objc_storeStrong((id *)&self->_depthStencilTexture, 0);
  objc_storeStrong((id *)&self->_currentDrawable, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_destroyWeak((id *)&self->_metalLayer);
}

- (void)_dumpFrameImageWithFilename:.cold.1()
{
  __assert_rtn("-[MTKView _dumpFrameImageWithFilename:]", "MTKView.m", 488, "!\"Unhandled PixelFormat\");
}

- (void)initWithCoder:.cold.1()
{
  __assert_rtn("-[MTKView initWithCoder:]", "MTKView.m", 1132, "bytesReturned == bytesExpected");
}

- (void)setContentScaleFactor:.cold.1()
{
  __assert_rtn("-[MTKView setContentScaleFactor:]", "MTKView.m", 1627, "self.contentScaleFactor != 0");
}

- (void)setDepthStencilPixelFormat:.cold.1()
{
  __assert_rtn("-[MTKView setDepthStencilPixelFormat:]", "MTKView.m", 1748, "depthStencilPixelFormat != MTLPixelFormatX32_Stencil8 && \"depthStencilPixelFormat cannot be a stencil texture view pixel format\");
}

@end
