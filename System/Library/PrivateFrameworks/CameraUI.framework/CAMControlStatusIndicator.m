@implementation CAMControlStatusIndicator

+ (NSNumberFormatter)decimalFormatter
{
  if (decimalFormatter_onceToken != -1)
    dispatch_once(&decimalFormatter_onceToken, &__block_literal_global_22);
  return (NSNumberFormatter *)(id)decimalFormatter___decimalFormatter;
}

void __45__CAMControlStatusIndicator_decimalFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  int v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)decimalFormatter___decimalFormatter;
  decimalFormatter___decimalFormatter = (uint64_t)v0;

  objc_msgSend((id)decimalFormatter___decimalFormatter, "setPositiveFormat:", CFSTR("0.0"));
  objc_msgSend((id)decimalFormatter___decimalFormatter, "stringFromNumber:", &unk_1EA3B1910);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("4,5"));

  if (v3)
    objc_msgSend((id)decimalFormatter___decimalFormatter, "setDecimalSeparator:", CFSTR("."));
}

+ (NSNumberFormatter)integerFormatter
{
  if (integerFormatter_onceToken != -1)
    dispatch_once(&integerFormatter_onceToken, &__block_literal_global_6);
  return (NSNumberFormatter *)(id)integerFormatter___integerFormatter;
}

uint64_t __45__CAMControlStatusIndicator_integerFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)integerFormatter___integerFormatter;
  integerFormatter___integerFormatter = (uint64_t)v0;

  return objc_msgSend((id)integerFormatter___integerFormatter, "setPositiveFormat:", CFSTR("0"));
}

+ (id)stretchableCircleImageFilled:(BOOL)a3 scale:(double)a4
{
  _BOOL8 v5;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v7 = CFSTR("NO");
  if (v5)
    v7 = CFSTR("YES");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("filled=%@ scale=%f"), v7, *(_QWORD *)&a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (stretchableCircleImageFilled_scale__onceToken != -1)
    dispatch_once(&stretchableCircleImageFilled_scale__onceToken, &__block_literal_global_12);
  objc_msgSend((id)stretchableCircleImageFilled_scale__cachedCircleImages, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend((id)stretchableCircleImageFilled_scale__cachedCircleImages, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_createStretchableCircleImageFilled:scale:", v5, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)stretchableCircleImageFilled_scale__cachedCircleImages, "setObject:forKeyedSubscript:", v10, v8);
  }

  return v10;
}

void __64__CAMControlStatusIndicator_stretchableCircleImageFilled_scale___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)stretchableCircleImageFilled_scale__cachedCircleImages;
  stretchableCircleImageFilled_scale__cachedCircleImages = (uint64_t)v0;

}

+ (id)_createStretchableCircleImageFilled:(BOOL)a3 scale:(double)a4
{
  _BOOL4 v5;
  CGFloat v6;
  double v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGContext *CurrentContext;
  void *v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  void *v20;
  void *v21;
  CGRect v23;
  CGRect v24;

  v5 = a3;
  v6 = 3.0 / a4 * 0.5;
  v7 = v6 * 2.0 + 24.0;
  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  v23.size.width = v7;
  v23.size.height = v7;
  v24 = CGRectInset(v23, v6, v6);
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  v24.origin.x = v7;
  v24.origin.y = v7;
  UIGraphicsBeginImageContextWithOptions((CGSize)v24.origin, 0, a4);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFill");

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setStroke");

  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  if (v5)
    CGContextFillEllipseInRect(CurrentContext, *(CGRect *)&v15);
  else
    CGContextStrokeEllipseInRect(CurrentContext, *(CGRect *)&v15);
  UIGraphicsGetImageFromCurrentImageContext();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v19, "resizableImageWithCapInsets:", 0.0, v7 * 0.5, 0.0, v7 * 0.5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "imageWithRenderingMode:", 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (CAMControlStatusIndicator)initWithFrame:(CGRect)a3
{
  CAMControlStatusIndicator *v3;
  CAMControlStatusIndicator *v4;
  CAMControlStatusIndicator *v5;
  CAMControlStatusIndicator *v6;
  CAMSlashView *v7;
  CAMSlashView *slashView;
  void *v9;
  CAMSlashMaskView *v10;
  CAMSlashMaskView *slashMaskView;
  UIView *v12;
  UIView *slashMaskContainer;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  UIImageView *outlineView;
  UILabel *v20;
  UILabel *valueLabel;
  void *v22;
  void *v23;
  void *v24;
  UIView *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CAMControlStatusIndicator;
  v3 = -[CAMControlStatusIndicator initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    v6 = v5;
    if (-[CAMControlStatusIndicator shouldUseSlash](v5, "shouldUseSlash"))
    {
      v7 = objc_alloc_init(CAMSlashView);
      slashView = v5->__slashView;
      v5->__slashView = v7;

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMSlashView setTintColor:](v5->__slashView, "setTintColor:", v9);

      -[CAMControlStatusIndicator addSubview:](v5, "addSubview:", v5->__slashView);
      v10 = objc_alloc_init(CAMSlashMaskView);
      slashMaskView = v5->__slashMaskView;
      v5->__slashMaskView = v10;

      v12 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      slashMaskContainer = v5->__slashMaskContainer;
      v5->__slashMaskContainer = v12;

      -[UIView setUserInteractionEnabled:](v5->__slashMaskContainer, "setUserInteractionEnabled:", 0);
      -[CAMControlStatusIndicator addSubview:](v5, "addSubview:", v5->__slashMaskContainer);
      v6 = v5->__slashMaskContainer;

    }
    if (-[CAMControlStatusIndicator shouldUseOutline](v5, "shouldUseOutline"))
    {
      v14 = objc_alloc(MEMORY[0x1E0DC3890]);
      v15 = (void *)objc_opt_class();
      -[CAMControlStatusIndicator traitCollection](v5, "traitCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "displayScale");
      objc_msgSend(v15, "stretchableCircleImageFilled:scale:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v14, "initWithImage:", v17);
      outlineView = v5->__outlineView;
      v5->__outlineView = (UIImageView *)v18;

      -[CAMControlStatusIndicator addSubview:](v6, "addSubview:", v5->__outlineView);
    }
    if (-[CAMControlStatusIndicator canShowValue](v5, "canShowValue"))
    {
      v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      valueLabel = v5->__valueLabel;
      v5->__valueLabel = v20;

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v5->__valueLabel, "setTextColor:", v22);

      +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sfCameraFontSupported");

      CEKMonospacedStylisticNumeralFontOfSizeAndStyle();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v5->__valueLabel, "setFont:", v24);

      -[CAMControlStatusIndicator addSubview:](v6, "addSubview:", v5->__valueLabel);
      -[CAMControlStatusIndicator _updateValueLabelVisibilityAnimated:](v5, "_updateValueLabelVisibilityAnimated:", 0);
      -[CAMControlStatusIndicator _setNeedsUpdateValueText:](v5, "_setNeedsUpdateValueText:", 1);
    }
    if (v5->__slashMaskView)
    {
      v25 = v5->__slashMaskContainer;
      if (v25)
        -[UIView setMaskView:](v25, "setMaskView:");
    }
    -[CAMControlStatusIndicator updateImage](v5, "updateImage");
    -[CAMControlStatusIndicator setExclusiveTouch:](v5, "setExclusiveTouch:", 1);

  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double *v15;
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
  double v26;
  double v27;
  double v28;
  double v29;
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
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  objc_super v53;
  CGRect v54;

  v53.receiver = self;
  v53.super_class = (Class)CAMControlStatusIndicator;
  -[CAMControlStatusIndicator layoutSubviews](&v53, sel_layoutSubviews);
  -[CAMControlStatusIndicator bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMControlStatusIndicator _imageView](self, "_imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlStatusIndicator _outlineView](self, "_outlineView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlStatusIndicator _valueLabel](self, "_valueLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlStatusIndicator _slashMaskContainer](self, "_slashMaskContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v4, v6, v8, v10);

  v51 = v6;
  v52 = v4;
  v49 = v10;
  v50 = v8;
  -[CAMControlStatusIndicator alignmentRectForFrame:](self, "alignmentRectForFrame:", v4, v6, v8, v10);
  UIRectGetCenter();
  v15 = (double *)MEMORY[0x1E0C9D538];
  if (v11)
  {
    -[CAMControlStatusIndicator imageOffset](self, "imageOffset");
    if (v17 == 0.0 && v16 == 0.0 && -[CAMControlStatusIndicator isShowingValue](self, "isShowingValue"))
      -[CAMControlStatusIndicator _additionalWidthForValue](self, "_additionalWidthForValue", 0.0);
    v18 = *v15;
    v19 = v15[1];
    objc_msgSend(v11, "intrinsicContentSize");
    objc_msgSend(v11, "frameForAlignmentRect:", v18, v19, v20, v21);
    v23 = v22;
    v25 = v24;
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    objc_msgSend(v11, "setCenter:");
    objc_msgSend(v11, "setBounds:", v18, v19, v23, v25);
  }
  if (v12)
  {
    v26 = *v15;
    v27 = v15[1];
    -[CAMControlStatusIndicator intrinsicContentSize](self, "intrinsicContentSize");
    v29 = v28;
    v31 = v30;
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    objc_msgSend(v12, "setCenter:");
    objc_msgSend(v12, "setBounds:", v26, v27, v29, v31);
  }
  if (v13)
  {
    v32 = *MEMORY[0x1E0C9D648];
    v33 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    -[CAMControlStatusIndicator _valueLabelSize](self, "_valueLabelSize");
    v48 = v34;
    v47 = v35;
    UIRectCenteredYInRectScale();
    if (-[CAMControlStatusIndicator isShowingValue](self, "isShowingValue", 0))
    {
      objc_msgSend(v12, "frame");
      CGRectGetMaxX(v54);
      -[CAMControlStatusIndicator _additionalWidthForValue](self, "_additionalWidthForValue");
    }
    else
    {
      v46 = 0;
      UIRectCenteredXInRectScale();
    }
    UIRectGetCenter();
    objc_msgSend(v13, "setCenter:");
    objc_msgSend(v13, "setBounds:", v32, v33, v48, v47);
  }
  if (-[CAMControlStatusIndicator shouldUseSlash](self, "shouldUseSlash", v46))
  {
    if (v11)
      objc_msgSend(v11, "frame");
    else
      -[CAMControlStatusIndicator bounds](self, "bounds");
    UIRectCenteredIntegralRectScale();
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v43 = v42;
    -[CAMControlStatusIndicator _slashView](self, "_slashView", 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setFrame:", v37, v39, v41, v43);

    -[CAMControlStatusIndicator _slashMaskView](self, "_slashMaskView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFrame:", v52, v51, v50, v49);

    -[CAMControlStatusIndicator _updateSlashAnimated:](self, "_updateSlashAnimated:", 0);
  }

}

- (double)_additionalWidthForValue
{
  double v2;

  -[CAMControlStatusIndicator _valueLabelSize](self, "_valueLabelSize");
  return v2 + 4.0 + 4.0;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  -[CAMControlStatusIndicator _outlineView](self, "_outlineView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;
  v7 = v6;
  -[CAMControlStatusIndicator _imageView](self, "_imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v10;
  v13 = v12;

  if (!v3)
  {
    v7 = v13;
    v5 = v11;
  }
  if (-[CAMControlStatusIndicator isShowingValue](self, "isShowingValue"))
  {
    -[CAMControlStatusIndicator _additionalWidthForValue](self, "_additionalWidthForValue");
    v5 = v5 + v14;
  }

  v15 = v5;
  v16 = v7;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)updateImage
{
  -[CAMControlStatusIndicator updateImageAnimated:](self, "updateImageAnimated:", 0);
}

- (void)updateImageAnimated:(BOOL)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  CAMControlStatusIndicator *v9;
  CAMControlStatusIndicator *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _BOOL8 v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  double v23;
  uint64_t v24;
  void *v25;
  unsigned int v26;
  id v27;

  v3 = a3;
  -[CAMControlStatusIndicator imageForCurrentState](self, "imageForCurrentState");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    -[CAMControlStatusIndicator _imageView](self, "_imageView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CAMControlStatusIndicator _outlineView](self, "_outlineView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0DC3890]);
      -[CAMControlStatusIndicator _slashMaskContainer](self, "_slashMaskContainer");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v7)
        v9 = (CAMControlStatusIndicator *)v7;
      else
        v9 = self;
      v10 = v9;

      -[CAMControlStatusIndicator addSubview:](v10, "addSubview:", v5);
      -[CAMControlStatusIndicator set_imageView:](self, "set_imageView:", v5);

    }
    objc_msgSend(v5, "setImage:", v27);
    -[CAMControlStatusIndicator setNeedsLayout](self, "setNeedsLayout");
    v11 = -[CAMControlStatusIndicator shouldUseActiveTintForCurrentState](self, "shouldUseActiveTintForCurrentState");
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;
    if (v6)
    {
      v26 = v3;
      v16 = -[CAMControlStatusIndicator shouldFillOutlineForCurrentState](self, "shouldFillOutlineForCurrentState");
      v17 = -[CAMControlStatusIndicator shouldShowOutlineForCurrentState](self, "shouldShowOutlineForCurrentState");
      v18 = (void *)objc_opt_class();
      -[CAMControlStatusIndicator traitCollection](self, "traitCollection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "displayScale");
      objc_msgSend(v18, "stretchableCircleImageFilled:scale:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setImage:", v20);

      if (v11)
      {
        objc_msgSend(v6, "setTintColor:", v13);
        v21 = 0x1E0DC3000;
      }
      else
      {
        v21 = 0x1E0DC3000uLL;
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.6);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setTintColor:", v22);

      }
      v23 = 0.0;
      if (v17)
        v23 = 1.0;
      objc_msgSend(v6, "setAlpha:", v23);
      if (v17 && v16)
      {
        objc_msgSend(*(id *)(v21 + 1624), "blackColor");
        v24 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v24;
      }
      v3 = v26;
    }
    objc_msgSend(v5, "setTintColor:", v15);
    -[CAMControlStatusIndicator _valueLabel](self, "_valueLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTextColor:", v15);

  }
  if (-[CAMControlStatusIndicator shouldUseSlash](self, "shouldUseSlash"))
    -[CAMControlStatusIndicator _updateSlashAnimated:](self, "_updateSlashAnimated:", v3);

}

- (id)imageForCurrentState
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[CAMControlStatusIndicator imageNameForCurrentState](self, "imageNameForCurrentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[CAMControlStatusIndicator customPointSizeForImageSymbol](self, "customPointSizeForImageSymbol");
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", (double)v4);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[CAMControlStatusIndicator shouldUseOutline](self, "shouldUseOutline"))
        v7 = 1;
      else
        v7 = 3;
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", v7);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v5;
    -[CAMControlStatusIndicator imageSymbolColorConfiguration](self, "imageSymbolColorConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v8, "configurationByApplyingConfiguration:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v10;
    }
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", v3, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v6 = v11;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0DC3870];
      CAMCameraUIFrameworkBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageNamed:inBundle:", v3, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "imageWithRenderingMode:", 2);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)imageNameForCurrentState
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99750];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("%@ must be implemented by subclasses"), v4);

  return 0;
}

- (id)imageForAXHUD
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  -[CAMControlStatusIndicator imageNameForAXHUD](self, "imageNameForAXHUD");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlStatusIndicator traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationWithTraitCollection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0DC3870];
    CAMCameraUIFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageNamed:inBundle:", v3, v11);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (BOOL)shouldUseOutline
{
  return 1;
}

- (BOOL)shouldFillOutlineForCurrentState
{
  return 0;
}

- (BOOL)shouldUseSlash
{
  return 0;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return 0;
}

- (BOOL)supportsOrientations
{
  return 1;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return 0;
}

- (CGVector)imageOffset
{
  double v2;
  double v3;
  CGVector result;

  v2 = 0.0;
  v3 = 0.0;
  result.dy = v3;
  result.dx = v2;
  return result;
}

- (UIImageSymbolConfiguration)imageSymbolColorConfiguration
{
  return 0;
}

- (BOOL)canShowValue
{
  return 0;
}

- (void)setNeedsUpdateValueText
{
  if (-[CAMControlStatusIndicator isShowingValue](self, "isShowingValue"))
    -[CAMControlStatusIndicator _updateValueText](self, "_updateValueText");
  else
    -[CAMControlStatusIndicator _setNeedsUpdateValueText:](self, "_setNeedsUpdateValueText:", 1);
}

- (id)valueText
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99750];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("%@ must be implemented by subclasses that return YES for canShowValue"), v4);

  return 0;
}

- (unint64_t)customPointSizeForImageSymbol
{
  return 0;
}

- (void)_updateValueText
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v11;
  void *v12;
  id v13;

  -[CAMControlStatusIndicator _setNeedsUpdateValueText:](self, "_setNeedsUpdateValueText:", 0);
  -[CAMControlStatusIndicator valueText](self, "valueText");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMControlStatusIndicator _valueLabel](self, "_valueLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v13);
  objc_msgSend(v3, "intrinsicContentSize");
  UICeilToViewScale();
  v5 = v4;
  UICeilToViewScale();
  v7 = v6;
  -[CAMControlStatusIndicator _valueLabelSize](self, "_valueLabelSize");
  if (v9 != v5 || v8 != v7)
  {
    -[CAMControlStatusIndicator _setValueLabelSize:](self, "_setValueLabelSize:", v5, v7);
    if (-[CAMControlStatusIndicator isShowingValue](self, "isShowingValue"))
    {
      -[CAMControlStatusIndicator delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "controlStatusIndicatorDidChangeIntrinsicContentSize:animated:", self, 1);

      -[CAMControlStatusIndicator _slashMaskView](self, "_slashMaskView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "updateMaskAnimated");

    }
  }

}

- (void)_updateValueLabelVisibilityAnimated:(BOOL)a3
{
  double v3;
  _QWORD v4[5];

  v3 = 0.0;
  if (a3)
    v3 = 0.25;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__CAMControlStatusIndicator__updateValueLabelVisibilityAnimated___block_invoke;
  v4[3] = &unk_1EA328868;
  v4[4] = self;
  +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v4, v3);
}

void __65__CAMControlStatusIndicator__updateValueLabelVisibilityAnimated___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isShowingValue"))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "_valueLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

}

- (void)setOrientation:(int64_t)a3
{
  -[CAMControlStatusIndicator setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    -[CAMControlStatusIndicator _updateImageOrientationAnimated:](self, "_updateImageOrientationAnimated:", a4);
  }
}

- (void)_updateImageOrientationAnimated:(BOOL)a3
{
  _BOOL8 v3;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  if ((unint64_t)(-[CAMControlStatusIndicator orientation](self, "orientation") - 1) > 1)
    v5 = 1;
  else
    v5 = -[CAMControlStatusIndicator orientation](self, "orientation");
  -[CAMControlStatusIndicator _valueLabel](self, "_valueLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v6, v5, 0);

  if (!-[CAMControlStatusIndicator isShowingValue](self, "isShowingValue"))
    v5 = -[CAMControlStatusIndicator orientation](self, "orientation");
  -[CAMControlStatusIndicator _imageView](self, "_imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v7, v5, v3);

  -[CAMControlStatusIndicator _slashView](self, "_slashView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v8, v5, v3);

  -[CAMControlStatusIndicator _slashMaskView](self, "_slashMaskView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v9, v5, v3);

}

- (void)setShowingValue:(BOOL)a3
{
  -[CAMControlStatusIndicator setShowingValue:animated:](self, "setShowingValue:animated:", a3, 0);
}

- (void)setShowingValue:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  id v9;

  if (self->_showingValue != a3)
  {
    v4 = a4;
    v5 = a3;
    -[CAMControlStatusIndicator _valueLabel](self, "_valueLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (v4)
        -[CAMControlStatusIndicator layoutIfNeeded](self, "layoutIfNeeded");
      if (v5 && -[CAMControlStatusIndicator _needsUpdateValueText](self, "_needsUpdateValueText"))
        -[CAMControlStatusIndicator _updateValueText](self, "_updateValueText");
      self->_showingValue = v5;
      -[CAMControlStatusIndicator setNeedsLayout](self, "setNeedsLayout");
      -[CAMControlStatusIndicator _updateImageOrientationAnimated:](self, "_updateImageOrientationAnimated:", v4);
      -[CAMControlStatusIndicator _updateValueLabelVisibilityAnimated:](self, "_updateValueLabelVisibilityAnimated:", v4);
      -[CAMControlStatusIndicator delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "controlStatusIndicatorDidChangeIntrinsicContentSize:animated:", self, v4);

      if (v4)
      {
        -[CAMControlStatusIndicator _slashMaskView](self, "_slashMaskView");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "updateMaskAnimated");

      }
    }
  }
}

- (void)_updateSlashAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL8 v6;
  id v7;

  v3 = a3;
  -[CAMControlStatusIndicator _slashView](self, "_slashView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMControlStatusIndicator _slashMaskView](self, "_slashMaskView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CAMControlStatusIndicator shouldShowSlashForCurrentState](self, "shouldShowSlashForCurrentState");
  objc_msgSend(v7, "bounds");
  objc_msgSend(v5, "convertRect:fromView:", v7);
  objc_msgSend(v5, "setSlashBounds:animated:", v3);
  objc_msgSend(v7, "setVisible:animated:", v6, v3);

}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[CAMControlStatusIndicator imageForAXHUD](self, "imageForAXHUD", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CAMControlStatusIndicator canShowValue](self, "canShowValue")
    && -[CAMControlStatusIndicator isShowingValue](self, "isShowingValue"))
  {
    -[CAMControlStatusIndicator valueText](self, "valueText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_alloc(MEMORY[0x1E0DC3418]);
  v7 = (void *)objc_msgSend(v6, "initWithTitle:image:imageInsets:scaleImage:", v5, v4, 1, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));

  return v7;
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  -[CAMControlStatusIndicator sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (unint64_t)controlStatusType
{
  return self->_controlStatusType;
}

- (void)setControlStatusType:(unint64_t)a3
{
  self->_controlStatusType = a3;
}

- (CAMControlStatusIndicatorDelegate)delegate
{
  return (CAMControlStatusIndicatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isShowingValue
{
  return self->_showingValue;
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (void)set_imageView:(id)a3
{
  objc_storeStrong((id *)&self->__imageView, a3);
}

- (UIImageView)_outlineView
{
  return self->__outlineView;
}

- (UILabel)_valueLabel
{
  return self->__valueLabel;
}

- (CAMSlashView)_slashView
{
  return self->__slashView;
}

- (CAMSlashMaskView)_slashMaskView
{
  return self->__slashMaskView;
}

- (UIView)_slashMaskContainer
{
  return self->__slashMaskContainer;
}

- (CGSize)_valueLabelSize
{
  double width;
  double height;
  CGSize result;

  width = self->__valueLabelSize.width;
  height = self->__valueLabelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setValueLabelSize:(CGSize)a3
{
  self->__valueLabelSize = a3;
}

- (BOOL)_needsUpdateValueText
{
  return self->__needsUpdateValueText;
}

- (void)_setNeedsUpdateValueText:(BOOL)a3
{
  self->__needsUpdateValueText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__slashMaskContainer, 0);
  objc_storeStrong((id *)&self->__slashMaskView, 0);
  objc_storeStrong((id *)&self->__slashView, 0);
  objc_storeStrong((id *)&self->__valueLabel, 0);
  objc_storeStrong((id *)&self->__outlineView, 0);
  objc_storeStrong((id *)&self->__imageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
