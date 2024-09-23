@implementation CKBrowserIconView

- (CKBrowserIconView)initWithFrame:(CGRect)a3
{
  CKBrowserIconView *v3;
  CKBrowserIconView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKBrowserIconView;
  v3 = -[CKBrowserIconView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CKBrowserIconView setOpaque:](v3, "setOpaque:", 0);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CKBrowserIconView;
  -[CKBrowserIconView dealloc](&v3, sel_dealloc);
}

- (void)setIconImage:(id)a3
{
  UIImage *v5;
  void *v6;
  void *v7;
  UIImage *v8;

  v5 = (UIImage *)a3;
  if (self->_iconImage != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_iconImage, a3);
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContents:", -[UIImage CGImage](self->_iconImage, "CGImage"));
    -[CKBrowserIconView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMask:", v6);

    -[CKBrowserIconView setNeedsDisplay](self, "setNeedsDisplay");
    -[CKBrowserIconView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

    v5 = v8;
  }

}

- (void)setPercentComplete:(double)a3
{
  -[CKBrowserIconView setPercentComplete:animated:](self, "setPercentComplete:animated:", 0, a3);
}

- (void)setPercentComplete:(double)a3 animated:(BOOL)a4
{
  double v6;
  void *v7;
  double v8;
  double v9;

  if (!a4)
  {
    -[CKBrowserIconView setAnimating:](self, "setAnimating:");
    if (self->_percentComplete == a3)
      return;
    self->_percentComplete = a3;
    goto LABEL_7;
  }
  if (-[CKBrowserIconView animating](self, "animating")
    || (-[CKBrowserIconView percentComplete](self, "percentComplete"), v6 != a3))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v9 = v8;

    -[CKBrowserIconView setAnimationStartTime:](self, "setAnimationStartTime:", v9);
    -[CKBrowserIconView percentComplete](self, "percentComplete");
    -[CKBrowserIconView setAnimationStartPercentComplete:](self, "setAnimationStartPercentComplete:");
    -[CKBrowserIconView setAnimationEndPercentComplete:](self, "setAnimationEndPercentComplete:", a3);
    -[CKBrowserIconView setAnimating:](self, "setAnimating:", 1);
LABEL_7:
    -[CKBrowserIconView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGContext *CurrentContext;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  double v31;
  double v32;
  CGRect v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKBrowserIconView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  UIRectGetCenter();
  v31 = v16;
  v32 = v17;
  if (v16 >= v17)
    v16 = v17;
  v29 = v16;
  CurrentContext = UIGraphicsGetCurrentContext();
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  CGContextClearRect(CurrentContext, v33);
  -[CKBrowserIconView iconImage](self, "iconImage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[CKBrowserIconView iconImage](self, "iconImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "drawInRect:blendMode:alpha:", 17, v9, v11, v13, v15, 0.7);

  }
  -[CKBrowserIconView percentComplete](self, "percentComplete");
  if (v21 < 100.0)
  {
    v22 = (void *)objc_opt_class();
    -[CKBrowserIconView percentComplete](self, "percentComplete");
    v24 = v23;
    -[CKBrowserIconView bounds](self, "bounds");
    objc_msgSend(v22, "_pieImageForPercentComplete:size:center:radius:", v24, v25, v26, v31, v32, v29 + -3.0);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "size");
    objc_msgSend(v30, "drawInRect:blendMode:alpha:", 0, ceil(v31 - v27 * 0.5), ceil(v32 - v28 * 0.5), v27, v28, 1.0);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[CKBrowserIconView iconImage](self, "iconImage", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CKBrowserIconView iconImage](self, "iconImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKBrowserIconView;
  -[CKBrowserIconView layoutSubviews](&v13, sel_layoutSubviews);
  -[CKBrowserIconView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "mask");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

+ (id)_pieImageForPercentComplete:(double)a3 size:(CGSize)a4 center:(CGPoint)a5 radius:(double)a6
{
  double y;
  double x;
  double height;
  double width;
  void *v11;
  double v12;
  double v13;
  double v14;
  size_t AlignedBytesPerRow;
  CGColorSpace *DeviceRGB;
  CGContext *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CGImage *Image;
  void *v23;
  CGAffineTransform v26;
  CGRect v27;
  CGRect v28;

  y = a5.y;
  x = a5.x;
  height = a4.height;
  width = a4.width;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  v13 = v12;

  v14 = ceil(height * v13);
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v17 = CGBitmapContextCreate(0, vcvtpd_u64_f64(width * v13), vcvtpd_u64_f64(height * v13), 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2002u);
  CGColorSpaceRelease(DeviceRGB);
  v27.size.width = (double)(unint64_t)ceil(width * v13);
  v27.origin.x = 0.0;
  v27.origin.y = 0.0;
  v27.size.height = (double)(unint64_t)v14;
  CGContextClearRect(v17, v27);
  CGContextTranslateCTM(v17, 0.0, (double)(unint64_t)v14);
  CGContextScaleCTM(v17, v13, -v13);
  CGContextGetCTM(&v26, v17);
  CGContextSetBaseCTM();
  UIGraphicsPushContext(v17);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "set");

  v28.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
  v28.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
  v28.size.width = width;
  v28.size.height = height;
  UIRectFill(v28);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "set");

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, x, y, a6, 0.0, 6.28318531);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLineWidth:", 3.0);
  objc_msgSend(v20, "strokeWithBlendMode:alpha:", 17, 1.0);
  if (fabs(a3) >= 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "moveToPoint:", x, y);
    objc_msgSend(v21, "addLineToPoint:", x, y - a6);
    objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, x, y, a6, -1.57079633, a3 / 100.0 * 6.28318531 + -1.57079633);
    objc_msgSend(v21, "addLineToPoint:", x, y);
    objc_msgSend(v21, "fillWithBlendMode:alpha:", 17, 1.0);

  }
  UIGraphicsPopContext();
  Image = CGBitmapContextCreateImage(v17);
  CGContextRelease(v17);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:scale:orientation:", Image, 0, v13);
  CGImageRelease(Image);

  return v23;
}

- (void)setAnimating:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_animating != a3)
  {
    self->_animating = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__onDisplayLink_);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBrowserIconView setDisplayLink:](self, "setDisplayLink:", v4);

      -[CKBrowserIconView displayLink](self, "displayLink");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addToRunLoop:forMode:", v5, *MEMORY[0x1E0C99860]);

    }
    else
    {
      -[CKBrowserIconView displayLink](self, "displayLink");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "invalidate");

      -[CKBrowserIconView setDisplayLink:](self, "setDisplayLink:", 0);
    }
  }
}

- (void)_onDisplayLink:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  objc_msgSend(MEMORY[0x1E0C99D68], "date", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;

  -[CKBrowserIconView animationStartTime](self, "animationStartTime");
  v8 = v7;
  -[CKBrowserIconView animationEndPercentComplete](self, "animationEndPercentComplete");
  v10 = v9;
  -[CKBrowserIconView animationStartPercentComplete](self, "animationStartPercentComplete");
  v12 = vabdd_f64(v10, v11) * 0.005;
  -[CKBrowserIconView animationStartTime](self, "animationStartTime");
  if (v6 <= v13 + v12)
  {
    v15 = v6 - v8;
    -[CKBrowserIconView animationStartPercentComplete](self, "animationStartPercentComplete");
    v17 = v16;
    v18 = v15 / v12;
    -[CKBrowserIconView animationEndPercentComplete](self, "animationEndPercentComplete");
    v20 = v19;
    -[CKBrowserIconView animationStartPercentComplete](self, "animationStartPercentComplete");
    self->_percentComplete = v17 + v18 * (v20 - v21);
  }
  else
  {
    -[CKBrowserIconView animationEndPercentComplete](self, "animationEndPercentComplete");
    self->_percentComplete = v14;
    -[CKBrowserIconView setAnimating:](self, "setAnimating:", 0);
  }
  -[CKBrowserIconView setNeedsDisplay](self, "setNeedsDisplay");
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (BOOL)animating
{
  return self->_animating;
}

- (double)animationStartTime
{
  return self->_animationStartTime;
}

- (void)setAnimationStartTime:(double)a3
{
  self->_animationStartTime = a3;
}

- (double)animationStartPercentComplete
{
  return self->_animationStartPercentComplete;
}

- (void)setAnimationStartPercentComplete:(double)a3
{
  self->_animationStartPercentComplete = a3;
}

- (double)animationEndPercentComplete
{
  return self->_animationEndPercentComplete;
}

- (void)setAnimationEndPercentComplete:(double)a3
{
  self->_animationEndPercentComplete = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
}

@end
