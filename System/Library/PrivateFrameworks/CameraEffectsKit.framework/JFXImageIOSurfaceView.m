@implementation JFXImageIOSurfaceView

- (void)JFXImageIOSurfaceView_commonInit
{
  -[JFXImageIOSurfaceView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  if (JFXImageIOSurfaceView_commonInit_onceToken != -1)
    dispatch_once(&JFXImageIOSurfaceView_commonInit_onceToken, &__block_literal_global_51);
  self->_enableDebugDrawing = JFXImageIOSurfaceView_commonInit_s_enableDebugDrawing;
  -[JFXImageIOSurfaceView setRenderingType:](self, "setRenderingType:", -1);
}

void __57__JFXImageIOSurfaceView_JFXImageIOSurfaceView_commonInit__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForKey:", CFSTR("JTImageViewDebugDraw"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    JFXImageIOSurfaceView_commonInit_s_enableDebugDrawing = objc_msgSend(v2, "BOOLForKey:", CFSTR("JTImageViewDebugDraw"));

  }
}

- (JFXImageIOSurfaceView)initWithFrame:(CGRect)a3
{
  JFXImageIOSurfaceView *v3;
  JFXImageIOSurfaceView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JFXImageIOSurfaceView;
  v3 = -[JFXImageIOSurfaceView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[JFXImageIOSurfaceView JFXImageIOSurfaceView_commonInit](v3, "JFXImageIOSurfaceView_commonInit");
  return v4;
}

- (JFXImageIOSurfaceView)initWithCoder:(id)a3
{
  JFXImageIOSurfaceView *v3;
  JFXImageIOSurfaceView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JFXImageIOSurfaceView;
  v3 = -[JFXImageIOSurfaceView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[JFXImageIOSurfaceView JFXImageIOSurfaceView_commonInit](v3, "JFXImageIOSurfaceView_commonInit");
  return v4;
}

- (void)setJtImage:(id)a3
{
  JTImage *v5;
  JTImage **p_jtImage;
  JTImage *v7;
  void *v8;
  void *v9;
  __CVBuffer *v10;
  IOSurfaceRef IOSurface;
  void *v12;
  CFTypeRef v13;
  const void *v14;
  uint64_t v15;
  void *v16;
  JFXImageIOSurfaceView *v17;
  uint64_t v18;
  JTImage *v19;

  v5 = (JTImage *)a3;
  p_jtImage = &self->_jtImage;
  if (self->_jtImage != v5)
  {
    v19 = v5;
    objc_storeStrong((id *)&self->_jtImage, a3);
    v7 = *p_jtImage;
    if (*p_jtImage)
    {
      -[JTImage pvImageBuffer](v7, "pvImageBuffer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "canCreateCVPixelBuffer");

      v7 = *p_jtImage;
    }
    -[JTImage pvImageBuffer](v7, "pvImageBuffer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (__CVBuffer *)objc_msgSend(v9, "cvPixelBuffer");

    if (v10)
    {
      IOSurface = CVPixelBufferGetIOSurface(v10);
      -[JFXImageIOSurfaceView layer](self, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setContents:", IOSurface);

      v13 = CVBufferCopyAttachment(v10, (CFStringRef)*MEMORY[0x24BDC5570], 0);
      if (v13)
      {
        v14 = v13;
        if (v13 == (CFTypeRef)*MEMORY[0x24BDC5590])
          v15 = 1;
        else
          v15 = 2;
        -[JFXImageIOSurfaceView setRenderingType:](self, "setRenderingType:", v15);
        CFRelease(v14);
        goto LABEL_13;
      }
      v17 = self;
      v18 = 0;
    }
    else
    {
      -[JFXImageIOSurfaceView layer](self, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setContents:", 0);

      v17 = self;
      v18 = -1;
    }
    -[JFXImageIOSurfaceView setRenderingType:](v17, "setRenderingType:", v18);
LABEL_13:
    v5 = v19;
  }

}

- (void)setRenderingType:(int64_t)a3
{
  if (self->_renderingType != a3)
  {
    self->_renderingType = a3;
    -[JFXImageIOSurfaceView updateDebugDrawing](self, "updateDebugDrawing");
  }
}

- (void)setFlipX:(BOOL)a3
{
  double v4;
  double v5;
  void *v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  if (self->_flipX != a3)
  {
    self->_flipX = a3;
    v4 = 1.0;
    if (a3)
      v5 = -1.0;
    else
      v5 = 1.0;
    if (self->_flipY)
      v4 = -1.0;
    CGAffineTransformMakeScale(&v8, v5, v4);
    -[JFXImageIOSurfaceView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    objc_msgSend(v6, "setAffineTransform:", &v7);

    -[JFXImageIOSurfaceView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setFlipY:(BOOL)a3
{
  double v4;
  double v5;
  void *v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  if (self->_flipY != a3)
  {
    self->_flipY = a3;
    v4 = -1.0;
    if (self->_flipX)
      v5 = -1.0;
    else
      v5 = 1.0;
    if (!a3)
      v4 = 1.0;
    CGAffineTransformMakeScale(&v8, v5, v4);
    -[JFXImageIOSurfaceView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    objc_msgSend(v6, "setAffineTransform:", &v7);

    -[JFXImageIOSurfaceView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setEnableDebugDrawing:(BOOL)a3
{
  if (self->_enableDebugDrawing != a3)
  {
    self->_enableDebugDrawing = a3;
    -[JFXImageIOSurfaceView updateDebugDrawing](self, "updateDebugDrawing");
  }
}

- (void)updateDebugDrawing
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  if (self->_enableDebugDrawing)
  {
    +[JFXImageView colorFromRenderingType:](JFXImageView, "colorFromRenderingType:", self->_renderingType);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = objc_msgSend(v3, "CGColor");
    -[JFXImageIOSurfaceView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBorderColor:", v4);

    -[JFXImageIOSurfaceView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 4.0;
  }
  else
  {
    -[JFXImageIOSurfaceView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0.0;
  }
  v8 = v6;
  objc_msgSend(v6, "setBorderWidth:", v7);

}

- (JTImage)jtImage
{
  return self->_jtImage;
}

- (int64_t)renderingType
{
  return self->_renderingType;
}

- (BOOL)flipX
{
  return self->_flipX;
}

- (BOOL)flipY
{
  return self->_flipY;
}

- (BOOL)enableDebugDrawing
{
  return self->_enableDebugDrawing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jtImage, 0);
}

@end
