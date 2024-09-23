@implementation CAMShutterIndicatorView

- (CAMShutterIndicatorView)initWithFrame:(CGRect)a3
{
  CAMShutterIndicatorView *v3;
  CAMShutterIndicatorView *v4;
  CAMShutterIndicatorView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMShutterIndicatorView;
  v3 = -[CAMShutterIndicatorView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMShutterIndicatorView _commonCAMShutterIndicatorViewInitialization](v3, "_commonCAMShutterIndicatorViewInitialization");
    v5 = v4;
  }

  return v4;
}

- (void)_commonCAMShutterIndicatorViewInitialization
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSAttributedString *v10;
  NSAttributedString *indicatorText;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0DC1138];
  +[CAMFont cameraFontOfSize:](CAMFont, "cameraFontOfSize:", 12.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC1150];
  v14[0] = v3;
  v14[1] = &unk_1EA3B19F0;
  v5 = *MEMORY[0x1E0DC1140];
  v13[1] = v4;
  v13[2] = v5;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0CB3498]);
  CAMLocalizedFrameworkString(CFSTR("SHUTTER"), CFSTR("Label for the hardware button which controls the Camera shutter."));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (NSAttributedString *)objc_msgSend(v8, "initWithString:attributes:", v9, v7);
  indicatorText = self->__indicatorText;
  self->__indicatorText = v10;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMShutterIndicatorView setBackgroundColor:](self, "setBackgroundColor:", v12);

  -[CAMShutterIndicatorView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[CAMShutterIndicatorView _indicatorText](self, "_indicatorText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  UIRoundToViewScale();
  v4 = v3;

  v5 = 33.0;
  v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (NSAttributedString)_indicatorText
{
  return self->__indicatorText;
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGContext *CurrentContext;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  void *v22;
  CGFloat Height;
  id v24;
  CGImage *v25;
  size_t Width;
  size_t v27;
  size_t BitsPerComponent;
  size_t BitsPerPixel;
  size_t BytesPerRow;
  CGDataProvider *DataProvider;
  const CGFloat *Decode;
  BOOL ShouldInterpolate;
  CGImage *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  CGSize v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  -[CAMShutterIndicatorView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 12, v5, v7, v9, v11, 3.0, 3.0);
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v42.origin.x = v5;
  v42.origin.y = v7;
  v42.size.width = v9;
  v42.size.height = v11;
  v43 = CGRectInset(v42, 2.0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 12, v43.origin.x, v43.origin.y, v43.size.width, v43.size.height + -2.0, 2.0, 2.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "set");

  objc_msgSend(v40, "fill");
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", v5, v7, v9, v11);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "appendPath:", v39);
  objc_msgSend(v38, "setUsesEvenOddFillRule:", 1);
  objc_msgSend(v38, "addClip");
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "set");

  objc_msgSend(v40, "fill");
  CGContextRestoreGState(CurrentContext);
  -[CAMShutterIndicatorView _indicatorText](self, "_indicatorText");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "size");
  UIRectCenteredIntegralRectScale();
  v16 = v15;
  v18 = v17;
  v20 = v19 + 1.0;
  v44.origin.x = v5;
  v44.origin.y = v7;
  v44.size.width = v9;
  v44.size.height = v11;
  v21 = CGRectGetMinY(v44) + 13.0;
  v41.width = v9;
  v41.height = v11;
  UIGraphicsBeginImageContextWithOptions(v41, 0, 0.0);
  UIGraphicsGetCurrentContext();
  objc_msgSend(v37, "drawInRect:", v20, v21, v16, v18, 0);
  UIGraphicsGetImageFromCurrentImageContext();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  CGContextSaveGState(CurrentContext);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  v45.origin.x = v5;
  v45.origin.y = v7;
  v45.size.width = v9;
  v45.size.height = v11;
  Height = CGRectGetHeight(v45);
  CGContextTranslateCTM(CurrentContext, 0.0, -Height);
  v24 = objc_retainAutorelease(v22);
  v25 = (CGImage *)objc_msgSend(v24, "CGImage");
  Width = CGImageGetWidth(v25);
  v27 = CGImageGetHeight(v25);
  BitsPerComponent = CGImageGetBitsPerComponent(v25);
  BitsPerPixel = CGImageGetBitsPerPixel(v25);
  BytesPerRow = CGImageGetBytesPerRow(v25);
  DataProvider = CGImageGetDataProvider(v25);
  Decode = CGImageGetDecode(v25);
  ShouldInterpolate = CGImageGetShouldInterpolate(v25);
  v34 = CGImageMaskCreate(Width, v27, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, Decode, ShouldInterpolate);
  v46.origin.x = v5;
  v46.origin.y = v7;
  v46.size.width = v9;
  v46.size.height = v11;
  CGContextClipToMask(CurrentContext, v46, v34);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "set");

  v47.origin.x = v5;
  v47.origin.y = v7;
  v47.size.width = v9;
  v47.size.height = v11;
  v48 = CGRectInset(v47, 3.0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 3, v48.origin.x, v48.origin.y + 3.0, v48.size.width, v48.size.height, 2.0, 2.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "fill");
  CGContextRestoreGState(CurrentContext);
  CGImageRelease(v34);

}

- (CAMShutterIndicatorView)initWithCoder:(id)a3
{
  CAMShutterIndicatorView *v3;
  CAMShutterIndicatorView *v4;
  CAMShutterIndicatorView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMShutterIndicatorView;
  v3 = -[CAMShutterIndicatorView initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[CAMShutterIndicatorView _commonCAMShutterIndicatorViewInitialization](v3, "_commonCAMShutterIndicatorViewInitialization");
    v5 = v4;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__indicatorText, 0);
}

@end
