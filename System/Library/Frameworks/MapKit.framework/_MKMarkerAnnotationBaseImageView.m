@implementation _MKMarkerAnnotationBaseImageView

- (_MKMarkerAnnotationBaseImageView)initWithFrame:(CGRect)a3
{
  _MKMarkerAnnotationBaseImageView *v3;
  _MKMarkerAnnotationBaseImageView *v4;
  _MKMarkerAnnotationBaseImageView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MKMarkerAnnotationBaseImageView;
  v3 = -[_MKMarkerAnnotationBaseImageView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (_MKMarkerAnnotationBaseImageView)initWithBalloonRadius:(double)a3 tailLength:(double)a4
{
  _MKMarkerAnnotationBaseImageView *result;

  result = -[_MKMarkerAnnotationBaseImageView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, a3 + a3, a4 + a3 * 2.0);
  if (result)
    result->_tailLength = a4;
  return result;
}

- (_MKMarkerAnnotationBaseImageView)initWithOvalInSize:(CGSize)a3
{
  _MKMarkerAnnotationBaseImageView *result;

  result = -[_MKMarkerAnnotationBaseImageView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, a3.width, a3.height);
  if (result)
    result->_tailLength = 0.0;
  return result;
}

- (void)_setBaseImageContent:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  objc_storeStrong((id *)&self->_baseImageContent, a3);
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CEAB40], "_currentTraitCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CEAB40];
  -[_MKMarkerAnnotationBaseImageView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setCurrentTraitCollection:", v7);

  -[_MKMarkerAnnotationBaseImageView _renderBaseContent](self, "_renderBaseContent");
  objc_msgSend(MEMORY[0x1E0CEAB40], "_setCurrentTraitCollection:", v8);

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  -[_MKMarkerAnnotationBaseImageView _renderBaseContent](self, "_renderBaseContent");
  v3.receiver = self;
  v3.super_class = (Class)_MKMarkerAnnotationBaseImageView;
  -[_MKMarkerAnnotationBaseImageView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
}

- (void)_renderBaseContent
{
  _MKMarkerAnnotationBaseImageContent *baseImageContent;
  double v4;
  double v5;
  const CGPath *v6;

  baseImageContent = self->_baseImageContent;
  if (baseImageContent)
  {
    if (-[_MKMarkerAnnotationBaseImageContent baseImageType](baseImageContent, "baseImageType") == 6)
    {
      -[_MKMarkerAnnotationBaseImageView _renderGradientForRectaloon](self, "_renderGradientForRectaloon");
    }
    else
    {
      -[_MKMarkerAnnotationBaseImageView bounds](self, "bounds");
      v5 = v4;
      if (-[_MKMarkerAnnotationBaseImageContent baseImageType](self->_baseImageContent, "baseImageType"))
      {
        if (-[_MKMarkerAnnotationBaseImageContent baseImageType](self->_baseImageContent, "baseImageType") != 1)
          v5 = v5 * 0.5;
      }
      v6 = (const CGPath *)objc_msgSend((id)objc_opt_class(), "_pathForBaseImageType:radius:tailLength:", -[_MKMarkerAnnotationBaseImageContent baseImageType](self->_baseImageContent, "baseImageType"), v5, self->_tailLength);
      -[_MKMarkerAnnotationBaseImageView _renderContentUsingGraphicsPath:](self, "_renderContentUsingGraphicsPath:", v6);
      CGPathRelease(v6);
    }
  }
}

- (void)_renderContentUsingGraphicsPath:(CGPath *)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGColorSpace *DeviceRGB;
  CGContext *v12;
  id v13;

  -[_MKMarkerAnnotationBaseImageView _currentScreenScale](self, "_currentScreenScale");
  v6 = v5;
  -[_MKMarkerAnnotationBaseImageView bounds](self, "bounds");
  v8 = v6 * v7;
  -[_MKMarkerAnnotationBaseImageView bounds](self, "bounds");
  v10 = v6 * v9;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v12 = CGBitmapContextCreate(0, (unint64_t)v8, (unint64_t)v10, 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  -[_MKMarkerAnnotationBaseImageView _fillPath:inContext:inRect:scale:](self, "_fillPath:inContext:inRect:scale:", a3, v12, 0.0, 0.0, v8, v10, v6);
  -[_MKMarkerAnnotationBaseImageView _strokePath:inContext:scale:](self, "_strokePath:inContext:scale:", a3, v12, v6);
  -[_MKMarkerAnnotationBaseImageView _renderBaseImage:inRect:scale:](self, "_renderBaseImage:inRect:scale:", v12, 0.0, 0.0, v8, v10, v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  CGContextRelease(v12);
  -[_MKMarkerAnnotationBaseImageView setImage:](self, "setImage:", v13);

}

+ (CGPath)_pathForBaseImageType:(int64_t)a3 radius:(double)a4 tailLength:(double)a5
{
  double v6;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  CGPath *v13;
  CGPath *v14;
  _QWORD v16[3];
  CGRect v17;

  v6 = a4;
  v16[2] = *MEMORY[0x1E0C80C00];
  if (qword_1EDFB7B68 != -1)
    dispatch_once(&qword_1EDFB7B68, &__block_literal_global_104);
  *(float *)&a4 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  *(float *)&v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)_MergedGlobals_1_12, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if ((unint64_t)a3 > 5)
    {
      v12 = 0;
    }
    else
    {
      if (((1 << a3) & 3) != 0)
      {
        v17.origin.x = 0.0;
        v17.origin.y = 0.0;
        v17.size.width = v6;
        v17.size.height = v6;
        v13 = CGPathCreateWithEllipseInRect(v17, 0);
      }
      else if (((1 << a3) & 0xC) != 0)
      {
        v13 = +[_MKBezierPathView _createPathForBalloonRadius:tailLength:](_MKBezierPathView, "_createPathForBalloonRadius:tailLength:", v6, a5);
      }
      else
      {
        v13 = +[_MKBezierPathView _createSmoothTransitionPathForBalloonRadius:tailLength:](_MKBezierPathView, "_createSmoothTransitionPathForBalloonRadius:tailLength:", v6, a5);
      }
      v12 = v13;
    }
    objc_msgSend((id)_MergedGlobals_1_12, "setObject:forKey:", v12, v11);
    CGPathRelease((CGPathRef)v12);
  }
  v14 = (CGPath *)MEMORY[0x18D777FE4](v12);

  return v14;
}

- (void)_fillPath:(CGPath *)a3 inContext:(CGContext *)a4 inRect:(CGRect)a5 scale:(double)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v14;
  id v15;
  CGRect v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  CGContextSaveGState(a4);
  -[_MKMarkerAnnotationBaseImageView bounds](self, "bounds");
  CGContextTranslateCTM(a4, 0.0, v14 * a6);
  CGContextScaleCTM(a4, a6, -a6);
  CGContextAddPath(a4, a3);
  CGContextClip(a4);
  -[_MKMarkerAnnotationBaseImageContent fillColor](self->_baseImageContent, "fillColor");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v15, "CGColor"));

  CGContextFillPath(a4);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  CGContextFillRect(a4, v16);
  CGContextRestoreGState(a4);
}

- (void)_strokePath:(CGPath *)a3 inContext:(CGContext *)a4 scale:(double)a5
{
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  const CGPath *v29;
  id v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;

  -[_MKMarkerAnnotationBaseImageContent strokeColor](self->_baseImageContent, "strokeColor");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_MKMarkerAnnotationBaseImageContent strokeWidth](self->_baseImageContent, "strokeWidth");
    v12 = v11;

    if (v12 > 0.0)
    {
      CGContextSaveGState(a4);
      -[_MKMarkerAnnotationBaseImageView bounds](self, "bounds");
      CGContextTranslateCTM(a4, 0.0, v13 * a5);
      CGContextScaleCTM(a4, a5, -a5);
      -[_MKMarkerAnnotationBaseImageContent strokeWidth](self->_baseImageContent, "strokeWidth");
      CGContextSetLineWidth(a4, v14);
      memset(&v33, 0, sizeof(v33));
      -[_MKMarkerAnnotationBaseImageContent strokeWidth](self->_baseImageContent, "strokeWidth");
      v16 = v15 * 0.5;
      -[_MKMarkerAnnotationBaseImageContent strokeWidth](self->_baseImageContent, "strokeWidth");
      CGAffineTransformMakeTranslation(&v33, v16, v17 * 0.5);
      -[_MKMarkerAnnotationBaseImageView bounds](self, "bounds");
      v19 = v18;
      -[_MKMarkerAnnotationBaseImageContent strokeWidth](self->_baseImageContent, "strokeWidth");
      v21 = v19 - v20;
      -[_MKMarkerAnnotationBaseImageView bounds](self, "bounds");
      v23 = v21 / v22;
      -[_MKMarkerAnnotationBaseImageView bounds](self, "bounds");
      v25 = v24;
      -[_MKMarkerAnnotationBaseImageContent strokeWidth](self->_baseImageContent, "strokeWidth");
      v27 = v25 - v26;
      -[_MKMarkerAnnotationBaseImageView bounds](self, "bounds");
      v31 = v33;
      CGAffineTransformScale(&v32, &v31, v23, v27 / v28);
      v33 = v32;
      v29 = (const CGPath *)MEMORY[0x18D778008](a3, &v33);
      CGContextAddPath(a4, v29);
      -[_MKMarkerAnnotationBaseImageContent strokeColor](self->_baseImageContent, "strokeColor");
      v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(v30, "CGColor"));

      CGContextStrokePath(a4);
      CGPathRelease(v29);
      CGContextRestoreGState(a4);
    }
  }
}

- (id)_renderBaseImage:(CGContext *)a3 inRect:(CGRect)a4 scale:(double)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v11;
  id v12;
  CGImage *v13;
  id v14;
  CGImage *v15;
  CGImage *Image;
  void *v17;
  CGRect v19;
  CGRect v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend((id)objc_opt_class(), "_gradientImageName:", -[_MKMarkerAnnotationBaseImageContent baseImageType](self->_baseImageContent, "baseImageType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (_MKLinkedOnOrAfterReleaseSet(3338)
    && v11
    && !-[_MKMarkerAnnotationBaseImageView _isFillColorClear](self, "_isFillColorClear"))
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", v11);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (CGImage *)objc_msgSend(v14, "CGImage");
    CGContextSetBlendMode(a3, (CGBlendMode)-[_MKMarkerAnnotationBaseImageContent blendMode](self->_baseImageContent, "blendMode"));
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    CGContextDrawImage(a3, v20, v15);

  }
  else if (!-[_MKMarkerAnnotationBaseImageView _isFillColorClear](self, "_isFillColorClear"))
  {
    -[_MKMarkerAnnotationBaseImageView image](self, "image");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (CGImage *)objc_msgSend(v12, "CGImage");

    CGContextSetBlendMode(a3, kCGBlendModeDestinationAtop);
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    CGContextDrawImage(a3, v19, v13);
  }
  Image = CGBitmapContextCreateImage(a3);
  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", Image);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(Image);

  return v17;
}

- (void)_renderGradientForRectaloon
{
  double v3;
  double v4;
  id v5;
  CGImage *v6;
  CGColorSpace *DeviceRGB;
  double v8;
  double v9;
  double v10;
  double v11;
  CGContext *v12;
  void *v13;
  id v14;
  CGImage *Image;
  void *v16;
  void *v17;
  id v18;
  CGImage *v19;
  id v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  -[_MKMarkerAnnotationBaseImageView _currentScreenScale](self, "_currentScreenScale");
  v4 = v3;
  -[_MKMarkerAnnotationBaseImageView image](self, "image");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (CGImage *)objc_msgSend(v5, "CGImage");

  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  -[_MKMarkerAnnotationBaseImageView bounds](self, "bounds");
  v9 = v4 * v8;
  -[_MKMarkerAnnotationBaseImageView bounds](self, "bounds");
  v11 = v4 * v10;
  v12 = CGBitmapContextCreate(0, (unint64_t)v9, (unint64_t)(v4 * v10), 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  CGContextResetCTM();
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = v9;
  v21.size.height = v11;
  CGContextDrawImage(v12, v21, v6);
  -[_MKMarkerAnnotationBaseImageContent fillColor](self->_baseImageContent, "fillColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    CGContextSaveGState(v12);
    CGContextSetBlendMode(v12, kCGBlendModeSourceIn);
    -[_MKMarkerAnnotationBaseImageContent fillColor](self->_baseImageContent, "fillColor");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(v12, (CGColorRef)objc_msgSend(v14, "CGColor"));

    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    v22.size.width = v9;
    v22.size.height = v11;
    CGContextFillRect(v12, v22);
    CGContextRestoreGState(v12);
  }
  Image = CGBitmapContextCreateImage(v12);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:scale:orientation:", Image, 0, v4);
  -[_MKMarkerAnnotationBaseImageView setImage:](self, "setImage:", v16);
  objc_msgSend((id)objc_opt_class(), "_gradientImageName:", -[_MKMarkerAnnotationBaseImageContent baseImageType](self->_baseImageContent, "baseImageType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", v17);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = (CGImage *)objc_msgSend(v18, "CGImage");
    CGContextSetBlendMode(v12, (CGBlendMode)-[_MKMarkerAnnotationBaseImageContent blendMode](self->_baseImageContent, "blendMode"));
    v23.origin.x = 0.0;
    v23.origin.y = 0.0;
    v23.size.width = v9;
    v23.size.height = v11;
    CGContextDrawImage(v12, v23, v19);
    Image = CGBitmapContextCreateImage(v12);

  }
  v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:scale:orientation:", Image, 0, v4);

  CGContextRelease(v12);
  CGImageRelease(Image);
  -[_MKMarkerAnnotationBaseImageView setImage:](self, "setImage:", v20);

}

+ (id)_gradientImageName:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return 0;
  else
    return *(&off_1E20DFA20 + a3 - 1);
}

- (BOOL)_isFillColorClear
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_MKMarkerAnnotationBaseImageContent fillColor](self->_baseImageContent, "fillColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2 == v3;

  return v4;
}

- (_MKMarkerAnnotationBaseImageContent)_baseImageContent
{
  return self->_baseImageContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseImageContent, 0);
}

@end
