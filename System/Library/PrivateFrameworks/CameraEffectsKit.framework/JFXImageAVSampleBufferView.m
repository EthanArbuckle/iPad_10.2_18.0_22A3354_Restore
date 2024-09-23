@implementation JFXImageAVSampleBufferView

- (void)JFXImageAVSampleBufferView_commonInit
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;

  -[JFXImageAVSampleBufferView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  if (JFXImageAVSampleBufferView_commonInit_onceToken != -1)
    dispatch_once(&JFXImageAVSampleBufferView_commonInit_onceToken, &__block_literal_global_22);
  v3 = *MEMORY[0x24BDB1C78];
  -[JFXImageAVSampleBufferView sampleBufferDisplayLayer](self, "sampleBufferDisplayLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVideoGravity:", v3);

  -[JFXImageAVSampleBufferView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMasksToBounds:", 1);

  self->_enableDebugDrawing = JFXImageAVSampleBufferView_commonInit_s_enableDebugDrawing;
  -[JFXImageAVSampleBufferView setRenderingType:](self, "setRenderingType:", -1);
  if (JFX_isShowHDRBadgeInPreviewEnabled())
  {
    v6 = (void *)objc_opt_new();
    -[JFXImageAVSampleBufferView setHdrBadgeDebug:](self, "setHdrBadgeDebug:", v6);

    -[JFXImageAVSampleBufferView hdrBadgeDebug](self, "hdrBadgeDebug");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", CFSTR("HDR"));

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXImageAVSampleBufferView hdrBadgeDebug](self, "hdrBadgeDebug");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 24.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXImageAVSampleBufferView hdrBadgeDebug](self, "hdrBadgeDebug");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v10);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXImageAVSampleBufferView hdrBadgeDebug](self, "hdrBadgeDebug");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v12);

    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "CGColor");
    -[JFXImageAVSampleBufferView hdrBadgeDebug](self, "hdrBadgeDebug");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setShadowColor:", v15);

    -[JFXImageAVSampleBufferView hdrBadgeDebug](self, "hdrBadgeDebug");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setShadowOffset:", 1.0, 1.0);

    -[JFXImageAVSampleBufferView hdrBadgeDebug](self, "hdrBadgeDebug");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = 1.0;
    objc_msgSend(v21, "setShadowOpacity:", v22);

    -[JFXImageAVSampleBufferView hdrBadgeDebug](self, "hdrBadgeDebug");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setShadowRadius:", 3.0);

    -[JFXImageAVSampleBufferView hdrBadgeDebug](self, "hdrBadgeDebug");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXImageAVSampleBufferView addSubview:](self, "addSubview:", v25);

    -[JFXImageAVSampleBufferView hdrBadgeDebug](self, "hdrBadgeDebug");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sizeToFit");

    -[JFXImageAVSampleBufferView hdrBadgeDebug](self, "hdrBadgeDebug");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "frame");
    v29 = v28;
    v31 = v30;

    -[JFXImageAVSampleBufferView hdrBadgeDebug](self, "hdrBadgeDebug");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFrame:", 20.0, 20.0, v29, v31);

  }
}

void __67__JFXImageAVSampleBufferView_JFXImageAVSampleBufferView_commonInit__block_invoke()
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
    JFXImageAVSampleBufferView_commonInit_s_enableDebugDrawing = objc_msgSend(v2, "BOOLForKey:", CFSTR("JTImageViewDebugDraw"));

  }
}

- (JFXImageAVSampleBufferView)initWithFrame:(CGRect)a3
{
  JFXImageAVSampleBufferView *v3;
  JFXImageAVSampleBufferView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JFXImageAVSampleBufferView;
  v3 = -[JFXImageAVSampleBufferView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[JFXImageAVSampleBufferView JFXImageAVSampleBufferView_commonInit](v3, "JFXImageAVSampleBufferView_commonInit");
  return v4;
}

- (JFXImageAVSampleBufferView)initWithCoder:(id)a3
{
  JFXImageAVSampleBufferView *v3;
  JFXImageAVSampleBufferView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JFXImageAVSampleBufferView;
  v3 = -[JFXImageAVSampleBufferView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[JFXImageAVSampleBufferView JFXImageAVSampleBufferView_commonInit](v3, "JFXImageAVSampleBufferView_commonInit");
  return v4;
}

- (void)setContentMode:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JFXImageAVSampleBufferView;
  -[JFXImageAVSampleBufferView setContentMode:](&v6, sel_setContentMode_, a3);
  v4 = *MEMORY[0x24BDB1C80];
  -[JFXImageAVSampleBufferView sampleBufferDisplayLayer](self, "sampleBufferDisplayLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVideoGravity:", v4);

}

- (void)setJtImage:(id)a3
{
  JTImage *v5;
  JTImage **p_jtImage;
  JTImage *v7;
  void *v8;
  void *v9;
  __CVBuffer *v10;
  void *v11;
  OSType PixelFormatType;
  opaqueCMSampleBuffer *v13;
  void *v14;
  JTImage *v15;

  v5 = (JTImage *)a3;
  p_jtImage = &self->_jtImage;
  if (self->_jtImage != v5)
  {
    v15 = v5;
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
      objc_msgSend(MEMORY[0x24BE78FF8], "jfx_getColorSpaceFromPixelBuffer:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PixelFormatType = CVPixelBufferGetPixelFormatType(v10);
      if (objc_msgSend(v11, "isHDRSpace") && PixelFormatType == 2016686640)
      {
        v13 = -[JFXImageAVSampleBufferView createCMSampleBufferFromJTImage](self, "createCMSampleBufferFromJTImage");
        -[JFXImageAVSampleBufferView drawSampleBufferToLayer:](self, "drawSampleBufferToLayer:", v13);
        CFRelease(v13);
      }

    }
    else
    {
      -[JFXImageAVSampleBufferView sampleBufferDisplayLayer](self, "sampleBufferDisplayLayer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setContents:", 0);

      -[JFXImageAVSampleBufferView setRenderingType:](self, "setRenderingType:", -1);
    }
    v5 = v15;
  }

}

- (void)setRenderingType:(int64_t)a3
{
  if (self->_renderingType != a3)
  {
    self->_renderingType = a3;
    -[JFXImageAVSampleBufferView updateDebugDrawing](self, "updateDebugDrawing");
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
    -[JFXImageAVSampleBufferView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    objc_msgSend(v6, "setAffineTransform:", &v7);

    -[JFXImageAVSampleBufferView setNeedsDisplay](self, "setNeedsDisplay");
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
    -[JFXImageAVSampleBufferView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    objc_msgSend(v6, "setAffineTransform:", &v7);

    -[JFXImageAVSampleBufferView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setEnableDebugDrawing:(BOOL)a3
{
  if (self->_enableDebugDrawing != a3)
  {
    self->_enableDebugDrawing = a3;
    -[JFXImageAVSampleBufferView updateDebugDrawing](self, "updateDebugDrawing");
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
    -[JFXImageAVSampleBufferView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBorderColor:", v4);

    -[JFXImageAVSampleBufferView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 4.0;
  }
  else
  {
    -[JFXImageAVSampleBufferView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0.0;
  }
  v8 = v6;
  objc_msgSend(v6, "setBorderWidth:", v7);

}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (opaqueCMSampleBuffer)createCMSampleBufferFromJTImage
{
  opaqueCMSampleBuffer *result;
  void *v4;
  int v5;
  void *v6;
  __CVBuffer *v7;
  const __CFAllocator *v8;
  void *v9;
  void *v10;
  CMSampleTimingInfo v11;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  CMSampleBufferRef sampleBufferOut;

  result = (opaqueCMSampleBuffer *)self->_jtImage;
  if (result)
  {
    -[opaqueCMSampleBuffer pvImageBuffer](result, "pvImageBuffer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "canCreateCVPixelBuffer");

    if (!v5)
      return 0;
    sampleBufferOut = 0;
    -[JTImage pvImageBuffer](self->_jtImage, "pvImageBuffer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (__CVBuffer *)objc_msgSend(v6, "cvPixelBuffer");

    if (!v7)
      return 0;
    formatDescriptionOut = 0;
    v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], v7, &formatDescriptionOut);
    if (formatDescriptionOut)
    {
      *(_OWORD *)&v11.duration.value = *MEMORY[0x24BDC0D88];
      v11.duration.epoch = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      v11.presentationTimeStamp = v11.duration;
      v11.decodeTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
      CMSampleBufferCreateForImageBuffer(v8, v7, 1u, 0, 0, formatDescriptionOut, &v11, &sampleBufferOut);
      if (sampleBufferOut)
      {
        CMSampleBufferGetSampleAttachmentsArray(sampleBufferOut, 1u);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDC0C88]);

      }
      CFRelease(formatDescriptionOut);
      return sampleBufferOut;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)drawSampleBufferToLayer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    -[JFXImageAVSampleBufferView sampleBufferDisplayLayer](self, "sampleBufferDisplayLayer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "status");
    if ((objc_msgSend(v5, "requiresFlushToResumeDecoding") & 1) != 0 || v4 == 2)
      objc_msgSend(v5, "flush");
    objc_msgSend(v5, "enqueueSampleBuffer:", a3);

  }
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

- (UILabel)hdrBadgeDebug
{
  return self->_hdrBadgeDebug;
}

- (void)setHdrBadgeDebug:(id)a3
{
  objc_storeStrong((id *)&self->_hdrBadgeDebug, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hdrBadgeDebug, 0);
  objc_storeStrong((id *)&self->_jtImage, 0);
}

@end
