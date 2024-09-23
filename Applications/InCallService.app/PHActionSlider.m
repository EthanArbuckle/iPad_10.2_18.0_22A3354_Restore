@implementation PHActionSlider

- (PHActionSlider)initWithFrame:(CGRect)a3 vibrantSettings:(id)a4 large:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  double y;
  double x;
  id v12;
  PHActionSlider *v13;
  PHActionSlider *v14;
  void *v15;
  unsigned int v16;
  UIEdgeInsets *p_knobInsets;
  double v18;
  void *v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  float v30;
  uint64_t v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  UIView *v42;
  UIView *contentView;
  UIView *v44;
  UIView *trackBackgroundView;
  void *v46;
  PHActionSliderTrackComponentView *v47;
  UIView *trackDodgeView;
  UIView *v49;
  void *v50;
  void *v51;
  NSString *v52;
  NSString *trackText;
  uint64_t v54;
  UIFont *trackFont;
  PHActionSliderKnob *v56;
  PHActionSliderKnob *knobView;
  void *v58;
  UIImageView *v59;
  UIImageView *knobImageView;
  UILabel *v61;
  UILabel *knobLabel;
  UILabel *v63;
  void *v64;
  UILabel *v65;
  void *v66;
  UIPanGestureRecognizer *v67;
  UIPanGestureRecognizer *slideGestureRecognizer;
  void *v69;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  float v77;
  objc_super v78;
  CGRect v79;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v78.receiver = self;
  v78.super_class = (Class)PHActionSlider;
  v13 = -[PHActionSlider initWithFrame:](&v78, "initWithFrame:", x, y, width, height);
  v14 = v13;
  if (v13)
  {
    -[PHActionSlider setOpaque:](v13, "setOpaque:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[PHActionSlider setBackgroundColor:](v14, "setBackgroundColor:", v15);

    v14->_trackWidthProportion = 1.0;
    v16 = -[PHActionSlider isButtonLayoutEnabled](v14, "isButtonLayoutEnabled");
    p_knobInsets = &v14->_knobInsets;
    v18 = 3.5;
    if ((v16 & v5) != 0)
      v18 = 6.0;
    v14->_knobInsets.left = v18;
    v14->_knobInsets.right = v18;
    v14->_isLarge = v5;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v20 = objc_msgSend(v19, "userInterfaceIdiom");

    if (v20
      || (v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen")),
          objc_msgSend(v21, "_referenceBounds"),
          v22 = CGRectGetHeight(v79),
          v21,
          v22 > 480.0))
    {
      v23 = 65.0;
      if (v5)
        v23 = 82.0;
      v14->_knobWidth = v23;
      if (-[PHActionSlider isButtonLayoutEnabled](v14, "isButtonLayoutEnabled") && v5)
      {
        p_knobInsets->top = 6.0;
        v14->_knobInsets.bottom = 6.0;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
        objc_msgSend(v24, "bounds");
        v26 = v25;
        v28 = v27;

        if (v26 >= v28)
          v29 = v28;
        else
          v29 = v26;
        v30 = v29 * 0.1976;
        v14->_knobWidth = roundf(v30);
      }
      else
      {
        p_knobInsets->top = 5.0;
        v14->_knobInsets.bottom = 5.0;
      }
      v31 = 0x403F800000000000;
    }
    else
    {
      v14->_knobWidth = 58.0;
      if (-[PHActionSlider isButtonLayoutEnabled](v14, "isButtonLayoutEnabled") && v5)
      {
        p_knobInsets->top = 6.0;
        v14->_knobInsets.bottom = 6.0;
        v71 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
        objc_msgSend(v71, "bounds");
        v73 = v72;
        v75 = v74;

        if (v73 >= v75)
          v76 = v75;
        else
          v76 = v73;
        v77 = v76 * 0.1976;
        v14->_knobWidth = roundf(v77);
      }
      else
      {
        p_knobInsets->top = 3.5;
        v14->_knobInsets.bottom = 3.5;
      }
      v31 = 0x403A800000000000;
    }
    *(_QWORD *)&v14->_trackTextBaselineFromBottom = v31;
    -[PHActionSlider _defaultTrackSize](v14, "_defaultTrackSize");
    v14->_trackSize.width = v32;
    v14->_trackSize.height = v33;
    v14->_minSlideCompletionPercentage = 0.6;
    v14->_minFastSlideCompletionPercentage = 0.4;
    objc_storeStrong((id *)&v14->_vibrantSettings, a4);
    -[PHActionSlider bounds](v14, "bounds");
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v42 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v34, v36, v38, v40);
    contentView = v14->_contentView;
    v14->_contentView = v42;

    -[PHActionSlider addSubview:](v14, "addSubview:", v14->_contentView);
    v44 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v35, v37, v39, v41);
    trackBackgroundView = v14->_trackBackgroundView;
    v14->_trackBackgroundView = v44;

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v14->_trackBackgroundView, "layer"));
    objc_msgSend(v46, "setAllowsGroupBlending:", 0);

    -[UIView addSubview:](v14->_contentView, "addSubview:", v14->_trackBackgroundView);
    v47 = objc_alloc_init(PHActionSliderTrackComponentView);
    trackDodgeView = v14->_trackDodgeView;
    v14->_trackDodgeView = &v47->super;

    v49 = v14->_trackDodgeView;
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.65, 1.0));
    -[UIView setBackgroundColor:](v49, "setBackgroundColor:", v50);

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v14->_trackDodgeView, "layer"));
    objc_msgSend(v51, "setCompositingFilter:", kCAFilterColorDodgeBlendMode);

    -[UIView addSubview:](v14->_trackBackgroundView, "addSubview:", v14->_trackDodgeView);
    v52 = (NSString *)objc_msgSend(&stru_10028DC20, "copy");
    trackText = v14->_trackText;
    v14->_trackText = v52;

    v54 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 20.0));
    trackFont = v14->_trackFont;
    v14->_trackFont = (UIFont *)v54;

    v14->_showingTrackLabel = 1;
    v56 = -[PHActionSliderKnob initWithFrame:]([PHActionSliderKnob alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    knobView = v14->_knobView;
    v14->_knobView = v56;

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[PHActionSliderKnob layer](v14->_knobView, "layer"));
    objc_msgSend(v58, "setMasksToBounds:", 1);

    -[UIView addSubview:](v14->_contentView, "addSubview:", v14->_knobView);
    v59 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    knobImageView = v14->_knobImageView;
    v14->_knobImageView = v59;

    -[PHActionSliderKnob addSubview:](v14->_knobView, "addSubview:", v14->_knobImageView);
    v61 = (UILabel *)objc_alloc_init((Class)UILabel);
    knobLabel = v14->_knobLabel;
    v14->_knobLabel = v61;

    -[UILabel setTextAlignment:](v14->_knobLabel, "setTextAlignment:", 1);
    v63 = v14->_knobLabel;
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 37.0, UIFontWeightHeavy));
    -[UILabel setFont:](v63, "setFont:", v64);

    v65 = v14->_knobLabel;
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](v65, "setTextColor:", v66);

    -[UILabel setAlpha:](v14->_knobLabel, "setAlpha:", 0.0);
    -[PHActionSliderKnob addSubview:](v14->_knobView, "addSubview:", v14->_knobLabel);
    v67 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", v14, "_knobPanGesture:");
    slideGestureRecognizer = v14->_slideGestureRecognizer;
    v14->_slideGestureRecognizer = v67;

    -[UIPanGestureRecognizer setMaximumNumberOfTouches:](v14->_slideGestureRecognizer, "setMaximumNumberOfTouches:", 1);
    -[UIPanGestureRecognizer setMinimumNumberOfTouches:](v14->_slideGestureRecognizer, "setMinimumNumberOfTouches:", 1);
    -[UIPanGestureRecognizer _setCanPanHorizontally:](v14->_slideGestureRecognizer, "_setCanPanHorizontally:", 1);
    -[UIPanGestureRecognizer _setCanPanVertically:](v14->_slideGestureRecognizer, "_setCanPanVertically:", 0);
    -[UIPanGestureRecognizer _setHysteresis:](v14->_slideGestureRecognizer, "_setHysteresis:", 2.0);
    -[UIPanGestureRecognizer setDelegate:](v14->_slideGestureRecognizer, "setDelegate:", v14);
    -[PHActionSlider addGestureRecognizer:](v14, "addGestureRecognizer:", v14->_slideGestureRecognizer);
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[PHActionSlider layer](v14, "layer"));
    objc_msgSend(v69, "setHitTestsAsOpaque:", 1);

  }
  return v14;
}

- (PHActionSlider)initWithFrame:(CGRect)a3
{
  return -[PHActionSlider initWithFrame:vibrantSettings:large:](self, "initWithFrame:vibrantSettings:large:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PHActionSlider)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHActionSlider;
  return -[PHActionSlider initWithCoder:](&v4, "initWithCoder:", a3);
}

- (BOOL)isButtonLayoutEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
  v3 = objc_msgSend(v2, "isButtonLayoutEnabled");

  return v3;
}

- (void)setStyle:(int64_t)a3
{
  UIView *trackBackgroundView;
  void *trackBlurView;
  PHActionSliderTrackComponentView *v7;
  UIView *trackSolidView;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  UIVisualEffectView *v13;
  UIVisualEffectView *trackSolidViewBackDropVisualEffectView;
  void *v15;
  _UIBackdropView *v16;
  _UIBackdropView *v17;
  _QWORD v18[2];

  if (self->_style != a3)
  {
    self->_style = a3;
    -[_UIBackdropView removeFromSuperview](self->_trackBlurView, "removeFromSuperview");
    -[UIView removeFromSuperview](self->_trackSolidView, "removeFromSuperview");
    -[UIView removeFromSuperview](self->_trackDodgeView, "removeFromSuperview");
    switch(a3)
    {
      case 3:
        if (!self->_trackSolidView)
        {
          v7 = objc_alloc_init(PHActionSliderTrackComponentView);
          trackSolidView = self->_trackSolidView;
          self->_trackSolidView = &v7->super;

          -[PHActionSlider setCachedTrackMaskWidth:](self, "setCachedTrackMaskWidth:", 0.0);
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
          v10 = objc_msgSend(v9, "isButtonLayoutEnabled");

          if (v10)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColorEffect inCallControls](UIColorEffect, "inCallControls"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 40.0));
            v13 = (UIVisualEffectView *)objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", 0);
            trackSolidViewBackDropVisualEffectView = self->_trackSolidViewBackDropVisualEffectView;
            self->_trackSolidViewBackDropVisualEffectView = v13;

            v18[0] = v11;
            v18[1] = v12;
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
            -[UIVisualEffectView setBackgroundEffects:](self->_trackSolidViewBackDropVisualEffectView, "setBackgroundEffects:", v15);

            -[UIView addSubview:](self->_trackBackgroundView, "addSubview:", self->_trackSolidViewBackDropVisualEffectView);
          }
        }
        trackBackgroundView = self->_trackBackgroundView;
        trackBlurView = self->_trackSolidView;
        break;
      case 2:
        trackBlurView = self->_trackBlurView;
        if (!trackBlurView)
        {
          v16 = (_UIBackdropView *)objc_msgSend(objc_alloc((Class)_UIBackdropView), "initWithPrivateStyle:", 2020);
          v17 = self->_trackBlurView;
          self->_trackBlurView = v16;

          -[PHActionSlider setCachedTrackMaskWidth:](self, "setCachedTrackMaskWidth:", 0.0);
          trackBlurView = self->_trackBlurView;
        }
        trackBackgroundView = self->_trackBackgroundView;
        break;
      case 1:
        trackBackgroundView = self->_trackBackgroundView;
        trackBlurView = self->_trackDodgeView;
        break;
      default:
LABEL_14:
        -[PHActionSlider setNeedsLayout](self, "setNeedsLayout");
        return;
    }
    -[UIView insertSubview:atIndex:](trackBackgroundView, "insertSubview:atIndex:", trackBlurView, 0);
    goto LABEL_14;
  }
}

- (void)setDragStyle:(unint64_t)a3
{
  if (self->_dragStyle != a3)
  {
    self->_dragStyle = a3;
    -[PHActionSlider _defaultTrackSize](self, "_defaultTrackSize");
    if (a3 == 1 || a3 == 2)
      -[PHActionSlider setTrackSize:](self, "setTrackSize:");
  }
}

- (UIBezierPath)knobMaskPath
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t dragStyle;
  void *v12;
  double v13;

  -[PHActionSlider knobRect](self, "knobRect");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  dragStyle = self->_dragStyle;
  if (dragStyle == 2)
  {
    -[PHActionSlider _knobWidth](self, "_knobWidth");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v7, v8, v9, v10, v13 * 0.5));
  }
  else if (dragStyle == 1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v3, v4, v5, v6));
  }
  else
  {
    v12 = 0;
  }
  return (UIBezierPath *)v12;
}

- (UIImage)knobImage
{
  return -[UIImageView image](self->_knobImageView, "image");
}

- (void)setKnobImage:(id)a3
{
  -[UIImageView setImage:](self->_knobImageView, "setImage:", a3);
  -[PHActionSlider setNeedsLayout](self, "setNeedsLayout");
}

- (void)setKnobImageOffset:(CGSize)a3
{
  if (self->_knobImageOffset.width != a3.width || self->_knobImageOffset.height != a3.height)
  {
    self->_knobImageOffset = a3;
    -[PHActionSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)knobText
{
  return -[UILabel text](self->_knobLabel, "text");
}

- (void)setKnobText:(id)a3
{
  -[UILabel setText:](self->_knobLabel, "setText:", a3);
  -[PHActionSlider setNeedsLayout](self, "setNeedsLayout");
}

- (UILabel)knobLabel
{
  return self->_knobLabel;
}

- (UIVisualEffectView)trackSolidViewBackDropVisualEffectView
{
  return self->_trackSolidViewBackDropVisualEffectView;
}

- (UIColor)knobColor
{
  return -[PHActionSliderKnob knobColor](self->_knobView, "knobColor");
}

- (void)setKnobColor:(id)a3
{
  -[PHActionSliderKnob setKnobColor:](self->_knobView, "setKnobColor:", a3);
}

- (void)setTrackText:(id)a3
{
  NSString *v4;
  NSString *trackText;

  if (self->_trackText != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    trackText = self->_trackText;
    self->_trackText = v4;

    -[PHActionSliderLabel setText:](self->_trackLabel, "setText:", self->_trackText);
    -[PHActionSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTrackFont:(id)a3
{
  UIFont *v5;

  v5 = (UIFont *)a3;
  if (self->_trackFont != v5)
  {
    objc_storeStrong((id *)&self->_trackFont, a3);
    -[PHActionSliderLabel setFont:](self->_trackLabel, "setFont:", v5);
    -[PHActionSlider setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTrackSize:(CGSize)a3
{
  if (a3.width != self->_trackSize.width || a3.height != self->_trackSize.height)
  {
    self->_trackSize = a3;
    -[PHActionSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)trackAlpha
{
  double result;

  -[UIView alpha](self->_trackBackgroundView, "alpha");
  return result;
}

- (void)setTrackAlpha:(double)a3
{
  double v5;
  double v6;

  -[UIView alpha](self->_trackBackgroundView, "alpha");
  if (v5 - a3 >= 0.00000011920929
    || (-[UIView alpha](self->_trackBackgroundView, "alpha"), a3 - v6 >= 0.00000011920929))
  {
    -[UIView setAlpha:](self->_trackBackgroundView, "setAlpha:", a3);
    -[PHActionSliderLabel setAlpha:](self->_trackLabel, "setAlpha:", a3);
  }
}

- (UILabel)trackLabel
{
  PHActionSliderLabel *trackLabel;
  id v5;

  if ((id)-[PHActionSlider textStyle](self, "textStyle") != (id)2)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("Can't call -trackLabel when -textStyle is not PHActionSliderTextStyleSolid"), 0));
    objc_exception_throw(v5);
  }
  trackLabel = self->_trackLabel;
  if (!trackLabel)
  {
    -[PHActionSlider _makeTrackLabel](self, "_makeTrackLabel");
    trackLabel = self->_trackLabel;
  }
  return (UILabel *)trackLabel;
}

- (void)setKnobPosition:(double)a3
{
  if (self->_knobPosition != a3)
  {
    self->_knobPosition = a3;
    -[PHActionSlider setNeedsLayout](self, "setNeedsLayout");
    -[PHActionSlider layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setKnobWidth:(double)a3
{
  void *v5;

  if (self->_knobWidth != a3)
  {
    self->_knobWidth = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHActionSliderKnob layer](self->_knobView, "layer"));
    objc_msgSend(v5, "setCornerRadius:", a3 * 0.5);

    -[PHActionSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setKnobInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_knobInsets.left
    || a3.top != self->_knobInsets.top
    || a3.right != self->_knobInsets.right
    || a3.bottom != self->_knobInsets.bottom)
  {
    self->_knobInsets = a3;
    -[PHActionSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGRect)knobRect
{
  double v3;
  CGFloat height;
  unint64_t dragStyle;
  double v6;
  CGFloat x;
  double v8;
  double y;
  double width;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[PHActionSlider _knobWidth](self, "_knobWidth");
  height = v3;
  dragStyle = self->_dragStyle;
  if (dragStyle == 2)
  {
    -[PHActionSlider _stretchKnobX](self, "_stretchKnobX");
    x = v11;
    -[PHActionSlider _knobVerticalInset](self, "_knobVerticalInset");
    y = v12 + -1.5;
    -[PHActionSlider _stretchKnobWidth](self, "_stretchKnobWidth");
    width = v13;
  }
  else if (dragStyle == 1)
  {
    -[PHActionSlider _knobHorizontalPosition](self, "_knobHorizontalPosition");
    x = v6;
    -[PHActionSlider _knobVerticalInset](self, "_knobVerticalInset");
    y = v8;
    width = height;
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v14 = x;
  v15 = y;
  v16 = height;
  result.size.height = v16;
  result.size.width = width;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)trackTextRect
{
  unsigned int v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGRectEdge v15;
  CGRectEdge v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  double v24;
  CGFloat width;
  double MinX;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double MaxX;
  CGFloat v36;
  double v37;
  double v38;
  CGFloat v39;
  void *v40;
  int64_t v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  unsigned int v56;
  double v57;
  char v58;
  PHActionSliderLabel *trackLabel;
  CGFloat v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  CGFloat x;
  double height;
  CGFloat y;
  double v72;
  double v73;
  double v74;
  double rect;
  CGRect slice;
  CGRect remainder;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect result;

  v3 = -[PHActionSlider shouldReverseLayoutDirection](self, "shouldReverseLayoutDirection");
  -[PHActionSlider _trackFrame](self, "_trackFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PHActionSlider _knobWidth](self, "_knobWidth");
  v13 = v12;
  -[PHActionSlider _knobMinXInset](self, "_knobMinXInset");
  memset(&remainder, 0, sizeof(remainder));
  memset(&slice, 0, sizeof(slice));
  if (v3)
    v15 = CGRectMaxXEdge;
  else
    v15 = CGRectMinXEdge;
  if (v3)
    v16 = CGRectMinXEdge;
  else
    v16 = CGRectMaxXEdge;
  v17 = v13 + v14;
  v18 = 86.0;
  if (v3)
    v18 = 14.0;
  v73 = v18;
  v78.origin.x = v5;
  v78.origin.y = v7;
  v78.size.width = v9;
  v78.size.height = v11;
  CGRectDivide(v78, &slice, &remainder, v17, v15);
  CGRectDivide(remainder, &slice, &remainder, 13.0, v16);
  -[PHActionSliderLabel sizeThatFits:](self->_trackLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  v20 = v19;
  v22 = v21;
  v23 = -[PHActionSlider _currentScreenScale](self, "_currentScreenScale");
  v79.origin.x = UIRectCenteredXInRectScale(v23, 0.0, 0.0, v20, v22, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height, v24);
  width = v79.size.width;
  x = v79.origin.x;
  height = v79.size.height;
  y = v79.origin.y;
  MinX = CGRectGetMinX(v79);
  v27 = v5;
  v80.origin.x = v5;
  v28 = v7;
  v80.origin.y = v7;
  v29 = v9;
  v80.size.width = v9;
  v30 = v11;
  v80.size.height = v11;
  rect = width;
  if (MinX - CGRectGetMinX(v80) >= v73)
  {
    v31 = x;
  }
  else
  {
    v81.origin.x = v27;
    v81.origin.y = v28;
    v81.size.width = v9;
    v81.size.height = v11;
    v31 = v73 + CGRectGetMinX(v81);
  }
  v32 = v27;
  if (v3)
    v33 = 86.0;
  else
    v33 = 14.0;
  v82.origin.x = v27;
  v82.origin.y = v28;
  v82.size.width = v29;
  v82.size.height = v30;
  v34 = v28;
  MaxX = CGRectGetMaxX(v82);
  v83.origin.x = v31;
  v83.origin.y = y;
  v83.size.width = rect;
  v83.size.height = height;
  if (MaxX - CGRectGetMaxX(v83) < v33)
  {
    v84.origin.x = v32;
    v84.origin.y = v28;
    v84.size.width = v29;
    v84.size.height = v30;
    v36 = CGRectGetMaxX(v84) - v33;
    v85.origin.x = v31;
    v85.origin.y = y;
    v85.size.width = rect;
    v85.size.height = height;
    v31 = v36 - CGRectGetWidth(v85);
  }
  v86.origin.x = v31;
  v86.origin.y = y;
  v86.size.width = rect;
  v86.size.height = height;
  v37 = CGRectGetMinX(v86);
  v87.origin.x = v32;
  v87.origin.y = v28;
  v87.size.width = v29;
  v87.size.height = v30;
  v38 = v31;
  if (v37 - CGRectGetMinX(v87) < v73)
  {
    v88.origin.x = v32;
    v88.origin.y = v34;
    v88.size.width = v29;
    v88.size.height = v30;
    v39 = CGRectGetMaxX(v88) - (v33 + -4.0);
    v89.origin.x = v31;
    v89.origin.y = y;
    v89.size.width = rect;
    v89.size.height = height;
    v38 = v39 - CGRectGetWidth(v89);
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHActionSlider trackText](self, "trackText"));
  v41 = -[PHActionSlider textStyle](self, "textStyle");
  -[UIView bounds](self->_trackBackgroundView, "bounds");
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v49 = v48;
  -[PHActionSlider trackTextYOffset](self, "trackTextYOffset");
  v51 = v50;
  if (v41 == 2
    && ((uint64_t)-[PHActionSliderLabel numberOfLines](self->_trackLabel, "numberOfLines") > 1
     || !-[PHActionSliderLabel numberOfLines](self->_trackLabel, "numberOfLines"))
    && objc_msgSend(v40, "containsString:", CFSTR("\n")))
  {
    v90.origin.x = v43;
    v90.origin.y = v45;
    v90.size.width = v47;
    v90.size.height = v49;
    v52 = CGRectGetHeight(v90);
    v91.origin.x = v38;
    v91.origin.y = y;
    v53 = rect;
    v91.size.width = rect;
    v91.size.height = height;
    v54 = (v52 - CGRectGetHeight(v91)) * 0.5 + 0.0;
  }
  else
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
    v56 = objc_msgSend(v55, "isButtonLayoutEnabled");

    if (v56)
    {
      v92.origin.x = v43;
      v92.origin.y = v45;
      v92.size.width = v47;
      v92.size.height = v49;
      v57 = CGRectGetHeight(v92);
      v93.origin.x = v38;
      v93.origin.y = y;
      v53 = rect;
      v93.size.width = rect;
      v93.size.height = height;
      v54 = (v57 - CGRectGetHeight(v93)) * 0.5;
    }
    else
    {
      v74 = v51;
      v58 = objc_opt_respondsToSelector(self->_trackLabel, "baselineOffsetFromBottomWithSize:");
      trackLabel = self->_trackLabel;
      v53 = rect;
      v60 = v49;
      if ((v58 & 1) != 0)
        -[PHActionSliderLabel baselineOffsetFromBottomWithSize:](trackLabel, "baselineOffsetFromBottomWithSize:", rect, height);
      else
        -[PHActionSliderLabel _baselineOffsetFromBottom](trackLabel, "_baselineOffsetFromBottom");
      v72 = v61;
      -[PHActionSlider trackTextBaselineFromBottom](self, "trackTextBaselineFromBottom");
      v63 = v62;
      v94.origin.x = v43;
      v94.origin.y = v45;
      v94.size.width = v47;
      v94.size.height = v60;
      v64 = CGRectGetHeight(v94);
      v95.origin.x = v38;
      v95.origin.y = y;
      v95.size.width = rect;
      v95.size.height = height;
      v54 = v74 + v64 - (CGRectGetHeight(v95) - v72) - v63;
    }
  }

  v65 = v38;
  v66 = v54;
  v67 = v53;
  v68 = height;
  result.size.height = v68;
  result.size.width = v67;
  result.origin.y = v66;
  result.origin.x = v65;
  return result;
}

- (double)trackTextYOffset
{
  unsigned int v2;
  double result;

  v2 = -[PHActionSlider isLarge](self, "isLarge");
  result = 0.0;
  if (v2)
    return -10.0;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;
  CGRect v15;
  CGRect v16;

  width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHActionSlider superview](self, "superview", a3.width, a3.height));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "bounds");
    v7 = CGRectGetWidth(v15);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v8, "bounds");
    v7 = CGRectGetWidth(v16);

  }
  if (width >= v7 || width <= 0.0)
    width = v7;
  -[PHActionSlider trackSize](self, "trackSize");
  v11 = v10 + 0.0;

  v12 = width;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)openTrackAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD block[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[6];

  if (a3)
  {
    -[PHActionSlider hideTrackLabel:](self, "hideTrackLabel:", 1);
    -[PHActionSlider setAnimating:](self, "setAnimating:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_trackBackgroundView, "layer"));
    objc_msgSend(v4, "removeAllAnimations");

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_trackDodgeView, "layer"));
    objc_msgSend(v5, "removeAllAnimations");

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100090268;
    v10[3] = &unk_1002850B0;
    v10[4] = self;
    v10[5] = 0x3FD3333333333333;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);
    v8[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10009029C;
    v9[3] = &unk_100284898;
    v9[4] = self;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000902D0;
    v8[3] = &unk_1002848C0;
    +[UIView _animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:](UIView, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 0, v9, v8, 0.05, 0.0);
    v6 = dispatch_time(0, 150000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100090308;
    block[3] = &unk_100284898;
    block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    -[PHActionSlider setTrackWidthProportion:](self, "setTrackWidthProportion:", 1.0);
    -[PHActionSlider showTrackLabel](self, "showTrackLabel");
    -[PHActionSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)closeTrackAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v3 = a3;
  -[PHActionSlider hideTrackLabel:](self, "hideTrackLabel:");
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_trackBackgroundView, "layer"));
    objc_msgSend(v5, "removeAllAnimations");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_trackDodgeView, "layer"));
    objc_msgSend(v6, "removeAllAnimations");

    -[PHActionSlider setAnimating:](self, "setAnimating:", 1);
    -[PHActionSlider updateAllTrackMasks](self, "updateAllTrackMasks");
    v7[4] = self;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100090418;
    v8[3] = &unk_100284898;
    v8[4] = self;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10009044C;
    v7[3] = &unk_1002848C0;
    +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v8, v7);
  }
  else
  {
    -[PHActionSlider setTrackWidthProportion:](self, "setTrackWidthProportion:", 0.0);
    -[PHActionSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBackgroundColor:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
  v5 = objc_msgSend(v4, "isButtonLayoutEnabled");

  if ((v5 & 1) == 0)
    -[UIView setBackgroundColor:](self->_trackSolidView, "setBackgroundColor:", v6);

}

- (id)backgroundColor
{
  return -[UIView backgroundColor](self->_trackSolidView, "backgroundColor");
}

- (CGSize)_defaultTrackSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  double Height;
  unsigned int v18;
  CGSize result;
  CGRect v20;

  if (-[PHActionSlider isButtonLayoutEnabled](self, "isButtonLayoutEnabled") && self->_isLarge)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;

    if (v5 >= v7)
      v8 = v7;
    else
      v8 = v5;
    v9 = v8 * 0.1976;
    v10 = roundf(v9);
    v11 = (v8 + v8 * -0.102 * 2.0 - v10 * 3.0) * 0.5;
    v12 = v11 + v11 + v10 * 3.0 + 12.0;
    v13 = v10 + 12.0;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v15 = objc_msgSend(v14, "userInterfaceIdiom");

    if (v15
      || (v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen")),
          objc_msgSend(v16, "_referenceBounds"),
          Height = CGRectGetHeight(v20),
          v16,
          Height > 480.0))
    {
      v18 = -[PHActionSlider isLarge](self, "isLarge");
      v13 = 92.0;
      if (!v18)
        v13 = 75.0;
      v12 = 266.0;
    }
    else
    {
      v12 = 266.0;
      v13 = 65.0;
    }
  }
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGRect)_trackFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  -[PHActionSlider bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PHActionSlider trackSize](self, "trackSize");
  v12 = v11;
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  if (CGRectGetWidth(v17) > v12)
  {
    v18.origin.x = v4;
    v18.origin.y = v6;
    v18.size.width = v8;
    v18.size.height = v10;
    v4 = v4 + (CGRectGetWidth(v18) - v12) * 0.5;
    v8 = v12;
  }
  v13 = v6 + 0.0;
  v14 = v4;
  v15 = v8;
  v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v13;
  result.origin.x = v14;
  return result;
}

- (double)_knobMinXInset
{
  double v2;

  -[PHActionSlider knobInsets](self, "knobInsets");
  return v2;
}

- (double)_knobMaxXInset
{
  double v2;

  -[PHActionSlider knobInsets](self, "knobInsets");
  return v2;
}

- (double)_knobVerticalInset
{
  double v2;

  -[PHActionSlider knobInsets](self, "knobInsets");
  return v2 + 0.0;
}

- (double)_knobHorizontalPosition
{
  double v3;
  double v4;
  double knobPosition;
  double v6;
  double v7;
  double v8;

  -[PHActionSlider _knobAvailableX](self, "_knobAvailableX");
  v4 = v3;
  knobPosition = self->_knobPosition;
  v6 = v3 * knobPosition;
  if (-[PHActionSlider shouldReverseLayoutDirection](self, "shouldReverseLayoutDirection"))
    v7 = -(v4 * knobPosition);
  else
    v7 = v6;
  -[PHActionSlider _knobMinX](self, "_knobMinX");
  return v8 + v7;
}

- (double)_stretchKnobX
{
  double MaxX;
  double v4;
  double v5;
  double v6;
  double result;
  CGRect v8;

  if (-[PHActionSlider shouldReverseLayoutDirection](self, "shouldReverseLayoutDirection"))
  {
    -[PHActionSlider _trackFrame](self, "_trackFrame");
    MaxX = CGRectGetMaxX(v8);
    -[PHActionSlider _knobMaxXInset](self, "_knobMaxXInset");
    v5 = MaxX - v4;
    -[PHActionSlider _stretchKnobWidth](self, "_stretchKnobWidth");
    return v5 - v6;
  }
  else
  {
    -[PHActionSlider _knobLeftMostX](self, "_knobLeftMostX");
  }
  return result;
}

- (double)_stretchKnobWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double knobPosition;
  double v10;

  -[PHActionSlider _knobAvailableX](self, "_knobAvailableX");
  v4 = v3;
  -[PHActionSlider _knobMaxXInset](self, "_knobMaxXInset");
  v6 = v4 - v5;
  -[PHActionSlider _knobMinXInset](self, "_knobMinXInset");
  v8 = v6 - v7;
  knobPosition = self->_knobPosition;
  -[PHActionSlider _knobWidth](self, "_knobWidth");
  return v10 + v8 * knobPosition;
}

- (double)_knobMinX
{
  double result;

  if (-[PHActionSlider shouldReverseLayoutDirection](self, "shouldReverseLayoutDirection"))
    -[PHActionSlider _knobRightMostX](self, "_knobRightMostX");
  else
    -[PHActionSlider _knobLeftMostX](self, "_knobLeftMostX");
  return result;
}

- (double)_knobMaxX
{
  double result;

  if (-[PHActionSlider shouldReverseLayoutDirection](self, "shouldReverseLayoutDirection"))
    -[PHActionSlider _knobLeftMostX](self, "_knobLeftMostX");
  else
    -[PHActionSlider _knobRightMostX](self, "_knobRightMostX");
  return result;
}

- (double)_knobLeftMostX
{
  double MinX;
  double v4;
  CGRect v6;

  -[PHActionSlider _trackFrame](self, "_trackFrame");
  MinX = CGRectGetMinX(v6);
  -[PHActionSlider _knobMinXInset](self, "_knobMinXInset");
  return MinX + v4;
}

- (double)_knobRightMostX
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGRect v9;

  if (self->_dragStyle == 2)
  {
    -[PHActionSlider _knobMinXInset](self, "_knobMinXInset");
    v4 = -v3;
  }
  else
  {
    -[PHActionSlider _knobMaxXInset](self, "_knobMaxXInset");
    v4 = v5;
  }
  -[PHActionSlider _trackFrame](self, "_trackFrame");
  v6 = CGRectGetMaxX(v9) - v4;
  -[PHActionSlider _knobWidth](self, "_knobWidth");
  return v6 - v7;
}

- (double)_knobAvailableX
{
  double v3;
  double v4;
  double v5;

  -[PHActionSlider _knobMaxX](self, "_knobMaxX");
  v4 = v3;
  -[PHActionSlider _knobMinX](self, "_knobMinX");
  return vabdd_f64(v4, v5);
}

- (BOOL)xPointIsWithinTrack:(double)a3
{
  unsigned int v5;
  double v6;

  v5 = -[PHActionSlider shouldReverseLayoutDirection](self, "shouldReverseLayoutDirection");
  -[PHActionSlider _knobMinX](self, "_knobMinX");
  if (v5)
    return v6 >= a3;
  else
    return v6 <= a3;
}

- (BOOL)shouldHideTrackLabelForXPoint:(double)a3
{
  unsigned int v5;
  double v6;

  v5 = -[PHActionSlider shouldReverseLayoutDirection](self, "shouldReverseLayoutDirection");
  -[PHActionSlider _knobMinX](self, "_knobMinX");
  if (v5)
    return v6 > a3;
  else
    return v6 < a3;
}

- (void)didMoveToSuperview
{
  double v3;
  PHActionSliderLabel *trackLabel;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHActionSlider;
  -[PHActionSlider didMoveToSuperview](&v5, "didMoveToSuperview");
  if ((id)-[PHActionSlider textStyle](self, "textStyle") == (id)1)
  {
    -[PHActionSlider trackWidthProportion](self, "trackWidthProportion");
    if (v3 >= 1.0)
    {
      trackLabel = self->_trackLabel;
      if (!trackLabel)
      {
        -[PHActionSlider _makeTrackLabel](self, "_makeTrackLabel");
        trackLabel = self->_trackLabel;
      }
      -[PHActionSliderLabel startAnimating](trackLabel, "startAnimating");
    }
  }
}

- (void)didMoveToWindow
{
  uint64_t v3;
  PHActionSliderLabel *trackLabel;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHActionSlider;
  -[PHActionSlider didMoveToWindow](&v6, "didMoveToWindow");
  -[PHActionSlider setCachedTrackMaskWidth:](self, "setCachedTrackMaskWidth:", 0.0);
  -[PHActionSlider setNeedsLayout](self, "setNeedsLayout");
  if (-[PHActionSlider isShowingTrackLabel](self, "isShowingTrackLabel"))
  {
    trackLabel = self->_trackLabel;
    if (trackLabel)
    {
      v5 = objc_opt_class(_UIGlintyStringView, v3);
      if ((objc_opt_isKindOfClass(trackLabel, v5) & 1) != 0)
        -[PHActionSliderLabel show](self->_trackLabel, "show");
    }
  }
}

- (void)_makeTrackLabel
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  PHActionSliderLabel *trackLabel;
  id v16;
  _OWORD v17[5];
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHActionSlider trackText](self, "trackText"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHActionSlider trackFont](self, "trackFont"));
  v5 = -[PHActionSlider textStyle](self, "textStyle");
  if (v5 != 2)
  {
    if (v5 != 1)
    {
      v7 = 0;
      goto LABEL_8;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHActionSlider vibrantSettings](self, "vibrantSettings"));
    v7 = objc_msgSend(objc_alloc((Class)_UIGlintyStringView), "initWithText:andFont:", v3, v4);
    objc_msgSend(v7, "setAllowsLuminanceAdjustments:", 0);
    objc_msgSend(v7, "setUsesBackgroundDimming:", 1);
    objc_msgSend(v7, "setVibrantSettings:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "legibilitySettings"));
    objc_msgSend(v7, "setLegibilitySettings:", v8);

    objc_msgSend(v7, "setChevronStyle:", 0);
    objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v7, "updateText");
    goto LABEL_6;
  }
  v7 = objc_alloc_init((Class)UILabel);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.9));
  objc_msgSend(v7, "setTextColor:", v9);

  objc_msgSend(v7, "setText:", v3);
  objc_msgSend(v7, "setFont:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
  v11 = objc_msgSend(v10, "isButtonLayoutEnabled");

  if (v11)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterColorMatrix));
    v17[2] = xmmword_10023FF30;
    v17[3] = *(_OWORD *)"Zd;@";
    v17[4] = xmmword_10023FF50;
    v17[0] = xmmword_10023FF10;
    v17[1] = unk_10023FF20;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCAColorMatrix:](NSValue, "valueWithCAColorMatrix:", v17));
    objc_msgSend(v6, "setValue:forKey:", v12, CFSTR("inputColorMatrix"));

    v18 = v6;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));
    objc_msgSend(v14, "setFilters:", v13);

LABEL_6:
  }
LABEL_8:
  -[PHActionSliderLabel removeFromSuperview](self->_trackLabel, "removeFromSuperview");
  trackLabel = self->_trackLabel;
  self->_trackLabel = (PHActionSliderLabel *)v7;
  v16 = v7;

  -[UIView insertSubview:below:](self->_contentView, "insertSubview:below:", self->_trackLabel, self->_knobView);
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
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
  double v44;
  double v45;
  UIImageView *knobImageView;
  id v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  unsigned int v58;
  double v59;
  uint64_t v60;
  void *v61;
  void *v62;
  unsigned __int8 v63;
  UIImageView *v64;
  double v65;
  objc_super v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  v66.receiver = self;
  v66.super_class = (Class)PHActionSlider;
  -[PHActionSlider layoutSubviews](&v66, "layoutSubviews");
  -[PHActionSlider bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PHActionSlider _currentScreenScale](self, "_currentScreenScale");
  v12 = v11;
  -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10);
  -[PHActionSlider _knobWidth](self, "_knobWidth");
  v13 = UIRoundToViewScale(self);
  -[PHActionSlider _knobMinXInset](self, "_knobMinXInset");
  v14 = UIRoundToViewScale(self);
  -[PHActionSlider _knobMaxXInset](self, "_knobMaxXInset");
  v15 = UIRoundToViewScale(self);
  -[PHActionSlider _trackFrame](self, "_trackFrame");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  if (self->_trackWidthProportion >= 1.0)
  {
    if (self->_knobPosition > 0.0)
    {
      v26 = 0.0;
      if (self->_dragStyle != 2)
      {
        -[PHActionSlider _knobAvailableX](self, "_knobAvailableX");
        v26 = v27 * self->_knobPosition;
      }
      v69.origin.x = v17;
      v69.origin.y = v19;
      v69.size.width = v21;
      v69.size.height = v23;
      v28 = CGRectGetWidth(v69) - v26;
      v70.origin.x = v17;
      v70.origin.y = v19;
      v70.size.width = v21;
      v70.size.height = v23;
      v29 = CGRectGetHeight(v70) - v28;
      v23 = v23 - fmax(v29, 0.0);
      if (v29 <= 0.0)
        v30 = -0.0;
      else
        v30 = v29 * 0.5;
      v19 = v19 + v30;
      if (-[PHActionSlider shouldReverseLayoutDirection](self, "shouldReverseLayoutDirection"))
        v31 = -0.0;
      else
        v31 = v26;
      v17 = v17 + v31;
      v21 = v21 - v26;
    }
  }
  else
  {
    v24 = v13 + v14 + v15;
    v25 = v16;
    if (-[PHActionSlider shouldReverseLayoutDirection](self, "shouldReverseLayoutDirection"))
    {
      v67.origin.x = v17;
      v67.origin.y = v19;
      v67.size.width = v21;
      v67.size.height = v23;
      v25 = (CGRectGetMaxX(v67) - v24) * (1.0 - self->_trackWidthProportion);
    }
    v68.origin.x = v17;
    v68.origin.y = v19;
    v68.size.width = v21;
    v68.size.height = v23;
    v21 = v24 + (CGRectGetWidth(v68) - v24) * self->_trackWidthProportion;
    v17 = v25;
  }
  -[UIView setFrame:](self->_trackBackgroundView, "setFrame:", v17, v19, v21, v23);
  -[UIView bounds](self->_trackBackgroundView, "bounds");
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  -[UIView setFrame:](self->_trackDodgeView, "setFrame:");
  -[_UIBackdropView setFrame:](self->_trackBlurView, "setFrame:", v33, v35, v37, v39);
  -[UIView setFrame:](self->_trackSolidView, "setFrame:", v33, v35, v37, v39);
  -[UIVisualEffectView setFrame:](self->_trackSolidViewBackDropVisualEffectView, "setFrame:", v33, v35, v37, v39);
  -[PHActionSlider cachedTrackMaskWidth](self, "cachedTrackMaskWidth");
  v41 = v40;
  v71.origin.x = v33;
  v71.origin.y = v35;
  v71.size.width = v37;
  v71.size.height = v39;
  if (v41 != CGRectGetWidth(v71))
  {
    v72.origin.x = v33;
    v72.origin.y = v35;
    v72.size.width = v37;
    v72.size.height = v39;
    if (CGRectGetWidth(v72) > 0.0)
      -[PHActionSlider updateAllTrackMasks](self, "updateAllTrackMasks");
  }
  UIRectIntegralWithScale(-[PHActionSlider knobRect](self, "knobRect"));
  v43 = v42;
  v45 = v44;
  -[PHActionSliderKnob setFrame:](self->_knobView, "setFrame:");
  knobImageView = self->_knobImageView;
  if (knobImageView)
  {
    v47 = -[UIImageView sizeThatFits:](knobImageView, "sizeThatFits:", v43, v45);
    v50 = UIRectCenteredIntegralRectScale(v47, 0.0, 0.0, v48, v49, 0.0, 0.0, v43, v45, v12);
    v52 = v51;
    v54 = v53;
    v56 = v55;
    if ((id)-[PHActionSlider dragStyle](self, "dragStyle") == (id)2)
      v57 = v43 + (v45 - v54) * -0.5 - v54 - self->_knobImageOffset.width;
    else
      v57 = v50 + self->_knobImageOffset.width;
    -[UIImageView setFrame:](self->_knobImageView, "setFrame:", floor(v12 * v57) / v12, floor(v12 * (v52 + self->_knobImageOffset.height)) / v12, v54, v56);
  }
  if (self->_knobLabel)
  {
    v58 = -[PHActionSlider _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v59 = v43 - v45;
    if (v58)
      v59 = 0.0;
    -[UILabel setFrame:](self->_knobLabel, "setFrame:", v59, 0.0, v45, v45);
  }
  v60 = objc_claimAutoreleasedReturnValue(-[PHActionSlider knobText](self, "knobText"));
  if (!v60)
  {
    v64 = self->_knobImageView;
    goto LABEL_31;
  }
  v61 = (void *)v60;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[PHActionSlider knobText](self, "knobText"));
  v63 = objc_msgSend(v62, "isEqualToString:", &stru_10028DC20);

  v64 = self->_knobImageView;
  if ((v63 & 1) != 0)
  {
LABEL_31:
    -[UIImageView setAlpha:](v64, "setAlpha:", 1.0);
    v65 = 0.0;
    goto LABEL_32;
  }
  -[UIImageView setAlpha:](v64, "setAlpha:", 0.0);
  v65 = 1.0;
LABEL_32:
  -[UILabel setAlpha:](self->_knobLabel, "setAlpha:", v65);
  if (self->_trackLabel || (-[PHActionSlider _makeTrackLabel](self, "_makeTrackLabel"), self->_trackLabel))
  {
    UIRectIntegralWithScale(-[PHActionSlider trackTextRect](self, "trackTextRect"));
    -[PHActionSliderLabel setFrame:](self->_trackLabel, "setFrame:");
  }
}

- (id)trackMaskImage
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  CGColorSpace *DeviceRGB;
  size_t v15;
  CGFloat Height;
  CGContext *v17;
  CGColor *v18;
  id v19;
  id v20;
  CGImage *Image;
  void *v22;
  _OWORD v24[2];
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHActionSlider _screen](self, "_screen"));
  -[UIView bounds](self->_trackBackgroundView, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "scale");
  v13 = v12;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  v15 = vcvtpd_u64_f64(v13 * CGRectGetWidth(v25));
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  Height = CGRectGetHeight(v26);
  v17 = CGBitmapContextCreate(0, v15, vcvtpd_u64_f64(v13 * Height), 8uLL, 4 * v15, DeviceRGB, 2u);
  CGContextScaleCTM(v17, v13, v13);
  v27.origin.x = 0.0;
  v27.origin.y = 0.0;
  v27.size.width = v9;
  v27.size.height = v11;
  CGContextClearRect(v17, v27);
  v24[0] = xmmword_10023FF60;
  v24[1] = unk_10023FF70;
  v18 = CGColorCreate(DeviceRGB, (const CGFloat *)v24);
  CGContextSetFillColorWithColor(v17, v18);
  CGColorRelease(v18);
  v19 = sub_100091540(v5, v7, v9, v11);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v19));
  CGContextAddPath(v17, (CGPathRef)objc_msgSend(v20, "CGPath"));
  CGContextFillPath(v17);
  Image = CGBitmapContextCreateImage(v17);
  CGContextRelease(v17);
  CGColorSpaceRelease(DeviceRGB);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", Image, 0, v13));
  CGImageRelease(Image);

  return v22;
}

- (id)trackMaskPath
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;

  -[UIView bounds](self->_trackBackgroundView, "bounds");
  return sub_100091540(v2, v3, v4, v5);
}

- (void)updateAllTrackMasks
{
  id v3;
  const CGPath *Copy;
  _UIBackdropView **p_trackBlurView;
  uint64_t v6;
  _UIBackdropView *trackBlurView;
  void *v8;
  id v9;
  CGRect v10;

  if (-[PHActionSlider isAnimating](self, "isAnimating"))
  {
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[PHActionSlider trackMaskPath](self, "trackMaskPath")));
    Copy = CGPathCreateCopy((CGPathRef)objc_msgSend(v3, "CGPath"));
    -[PHActionSlider setMaskPath:onView:](self, "setMaskPath:onView:", Copy, self->_trackDodgeView);
    if (self->_trackSolidView)
    {
      -[PHActionSlider setMaskPath:onView:](self, "setMaskPath:onView:", Copy);
      -[PHActionSlider setMaskPath:onView:](self, "setMaskPath:onView:", Copy, self->_trackSolidViewBackDropVisualEffectView);
    }
    CGPathRelease(Copy);

    p_trackBlurView = &self->_trackBlurView;
    if (!self->_trackBlurView)
    {
      v9 = 0;
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(-[PHActionSlider trackMaskImage](self, "trackMaskImage"));
  -[PHActionSlider setMaskFromImage:onView:](self, "setMaskFromImage:onView:");
  if (self->_trackSolidView)
  {
    -[PHActionSlider setMaskFromImage:onView:](self, "setMaskFromImage:onView:", v9);
    -[PHActionSlider setMaskFromImage:onView:](self, "setMaskFromImage:onView:", v9, self->_trackSolidViewBackDropVisualEffectView);
  }
  v6 = (uint64_t)v9;
  p_trackBlurView = &self->_trackBlurView;
  trackBlurView = self->_trackBlurView;
  if (trackBlurView)
  {
    if (v9)
    {
LABEL_11:
      v9 = (id)v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_UIBackdropView inputSettings](trackBlurView, "inputSettings"));
      objc_msgSend(v8, "setFilterMaskImage:", v9);
      objc_msgSend(v8, "setGrayscaleTintMaskImage:", v9);
      objc_msgSend(v8, "setColorTintMaskImage:", v9);

      goto LABEL_12;
    }
LABEL_10:
    v6 = objc_claimAutoreleasedReturnValue(-[PHActionSlider trackMaskImage](self, "trackMaskImage"));
    trackBlurView = *p_trackBlurView;
    goto LABEL_11;
  }
LABEL_12:
  -[UIView bounds](self->_trackBackgroundView, "bounds");
  -[PHActionSlider setCachedTrackMaskWidth:](self, "setCachedTrackMaskWidth:", CGRectGetWidth(v10));

}

- (void)setMaskPath:(CGPath *)a3 onView:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  id v11;

  v11 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mask"));
  v7 = objc_opt_self(CAShapeLayer);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  if ((isKindOfClass & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));

    objc_msgSend(v10, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
    objc_msgSend(v10, "setDelegate:", v11);
    objc_msgSend(v5, "setMask:", v10);
    v6 = v10;
  }
  objc_msgSend(v11, "bounds");
  objc_msgSend(v6, "setBounds:");
  objc_msgSend(v6, "setPath:", a3);

}

- (void)setMaskFromImage:(id)a3 onView:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
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
  void *v21;
  id v22;

  v5 = objc_retainAutorelease(a3);
  v6 = a4;
  v7 = v5;
  v8 = objc_msgSend(v7, "CGImage");
  v22 = (id)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  objc_msgSend(v6, "bounds");
  objc_msgSend(v22, "setBounds:");
  objc_msgSend(v22, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
  objc_msgSend(v7, "scale");
  objc_msgSend(v22, "setContentsScale:");
  objc_msgSend(v22, "setDelegate:", v6);
  objc_msgSend(v7, "size");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v7, "capInsets");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  objc_msgSend(v22, "setContentsCenter:", v16 / v10, v14 / v12, (v10 - v20 - v16) / v10, (v12 - v14 - v18) / v12);
  objc_msgSend(v22, "setContents:", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));

  objc_msgSend(v21, "setMask:", v22);
}

- (void)setTrackLabelHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  unsigned int v7;
  PHActionSliderLabel *trackLabel;
  double v9;
  void ***v10;
  void **v11;
  uint64_t v12;
  id (*v13)(uint64_t);
  void *v14;
  PHActionSlider *v15;
  void **v16;
  uint64_t v17;
  id (*v18)(uint64_t);
  void *v19;
  PHActionSlider *v20;

  v4 = a4;
  v5 = a3;
  v7 = -[PHActionSlider isShowingTrackLabel](self, "isShowingTrackLabel");
  if (v5)
  {
    if (!v7)
      return;
    if (!self->_trackLabel)
      -[PHActionSlider _makeTrackLabel](self, "_makeTrackLabel");
    if ((id)-[PHActionSlider textStyle](self, "textStyle") == (id)1)
    {
      trackLabel = self->_trackLabel;
      if (v4)
        -[PHActionSliderLabel fadeOutWithDuration:](trackLabel, "fadeOutWithDuration:", 0.15);
      else
        -[PHActionSliderLabel hide](trackLabel, "hide");
      goto LABEL_19;
    }
    v9 = 0.15;
    if (!v4)
      v9 = 0.0;
    v16 = _NSConcreteStackBlock;
    v17 = 3221225472;
    v18 = sub_100091B60;
    v19 = &unk_100284898;
    v20 = self;
    v10 = &v16;
    goto LABEL_17;
  }
  if ((v7 & 1) != 0)
    return;
  if (!self->_trackLabel)
    -[PHActionSlider _makeTrackLabel](self, "_makeTrackLabel");
  if ((id)-[PHActionSlider textStyle](self, "textStyle") != (id)1)
  {
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_100091B78;
    v14 = &unk_100284898;
    v15 = self;
    v9 = 0.15;
    v10 = &v11;
LABEL_17:
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v10, v9, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_19;
  }
  -[PHActionSliderLabel fadeInWithDuration:](self->_trackLabel, "fadeInWithDuration:", 0.15);
LABEL_19:
  -[PHActionSlider setShowingTrackLabel:](self, "setShowingTrackLabel:", !v5);
}

- (void)showTrackLabel
{
  -[PHActionSlider setTrackLabelHidden:animated:](self, "setTrackLabelHidden:animated:", 0, 1);
}

- (void)hideTrackLabel:(BOOL)a3
{
  -[PHActionSlider setTrackLabelHidden:animated:](self, "setTrackLabelHidden:animated:", 1, 1);
}

- (void)_slideCompleted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  dispatch_time_t v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  BOOL v10;

  v3 = a3;
  -[PHActionSlider setAnimating:](self, "setAnimating:", 1);
  -[PHActionSlider updateAllTrackMasks](self, "updateAllTrackMasks");
  self->_slideGestureInitialPoint = CGPointZero;
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100091D14;
  v9[3] = &unk_100284C98;
  v10 = v3;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100091D9C;
  v8[3] = &unk_1002848C0;
  +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v9, v8);
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHActionSlider delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v5, "actionSliderDidCompleteSlide:") & 1) != 0)
      objc_msgSend(v5, "actionSliderDidCompleteSlide:", self);
  }
  else
  {
    v6 = dispatch_time(0, 150000000);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100091DD4;
    v7[3] = &unk_100284898;
    v7[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHActionSlider delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v5, "actionSliderDidCancelSlide:") & 1) != 0)
      objc_msgSend(v5, "actionSliderDidCancelSlide:", self);
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v10;
  id v11;

  v6 = a4;
  if (self->_slideGestureRecognizer == a3 && !objc_msgSend(a3, "state"))
  {
    objc_msgSend(v6, "locationInView:", self->_knobView);
    -[PHActionSlider setPanGestureFirstTouchLocationInView:](self, "setPanGestureFirstTouchLocationInView:");
    v7 = sub_1000C5588();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PHActionSlider -shouldReceiveTouch: storing touch %@", (uint8_t *)&v10, 0xCu);
    }

  }
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UIPanGestureRecognizer *v4;
  UIPanGestureRecognizer *v5;
  CGFloat x;
  CGFloat y;
  double v8;
  double v9;
  _BOOL4 v10;
  id v11;
  NSObject *v12;
  NSString *v13;
  void *v14;
  NSString *v15;
  void *v16;
  NSString *v17;
  void *v18;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  _DWORD v30[2];
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  CGPoint v37;
  CGPoint v38;
  CGPoint v39;
  CGPoint v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v4 = (UIPanGestureRecognizer *)a3;
  v5 = v4;
  if (self->_slideGestureRecognizer != v4)
  {
    x = CGPointZero.x;
    y = CGPointZero.y;
LABEL_4:
    v10 = 1;
    goto LABEL_5;
  }
  -[UIPanGestureRecognizer locationInView:](v4, "locationInView:", self->_knobView);
  x = v8;
  y = v9;
  -[PHActionSliderKnob bounds](self->_knobView, "bounds");
  v39.x = x;
  v39.y = y;
  if (CGRectContainsPoint(v41, v39))
    goto LABEL_4;
  -[PHActionSliderKnob bounds](self->_knobView, "bounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[PHActionSlider panGestureFirstTouchLocationInView](self, "panGestureFirstTouchLocationInView");
  v40.x = v28;
  v40.y = v29;
  v43.origin.x = v21;
  v43.origin.y = v23;
  v43.size.width = v25;
  v43.size.height = v27;
  v10 = CGRectContainsPoint(v43, v40);
LABEL_5:
  v11 = sub_1000C5588();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v37.x = x;
    v37.y = y;
    v13 = NSStringFromCGPoint(v37);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[PHActionSlider panGestureFirstTouchLocationInView](self, "panGestureFirstTouchLocationInView");
    v15 = NSStringFromCGPoint(v38);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[PHActionSliderKnob bounds](self->_knobView, "bounds");
    v17 = NSStringFromCGRect(v42);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v30[0] = 67109890;
    v30[1] = v10;
    v31 = 2112;
    v32 = v14;
    v33 = 2112;
    v34 = v16;
    v35 = 2112;
    v36 = v18;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PHActionSlider shouldBegin: %d touchLocationInKnob: %@ firstTouchLocationInKnob: %@ knobViewBounds: %@", (uint8_t *)v30, 0x26u);

  }
  return v10;
}

- (void)_knobPanGesture:(id)a3
{
  id v4;
  unsigned int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGPoint *p_slideGestureInitialPoint;
  double x;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _BOOL4 v25;
  uint64_t v26;
  void *v27;
  id v28;
  NSObject *v29;
  PHActionSlider *v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  double *p_knobPosition;
  id v35;
  NSObject *v36;
  int v37;
  _QWORD v38[2];

  v4 = a3;
  v5 = -[PHActionSlider _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[PHActionSlider _knobMinX](self, "_knobMinX");
  v7 = v6;
  -[PHActionSlider _knobAvailableX](self, "_knobAvailableX");
  v9 = v8;
  objc_msgSend(v4, "locationInView:", self);
  v11 = v10;
  v13 = v12;
  p_slideGestureInitialPoint = &self->_slideGestureInitialPoint;
  x = self->_slideGestureInitialPoint.x;
  objc_msgSend(v4, "velocityInView:", self);
  v17 = v16;
  v18 = self->_slideGestureInitialPoint.x;
  if (!v5)
  {
    v19 = v11 - x;
    if (v18 < 0.0)
    {
      -[PHActionSlider _knobMaxX](self, "_knobMaxX");
      goto LABEL_6;
    }
LABEL_7:
    v21 = v9;
    goto LABEL_8;
  }
  v19 = x - v11;
  if (v18 >= 0.0)
    goto LABEL_7;
  -[PHActionSlider _knobMinX](self, "_knobMinX");
LABEL_6:
  v21 = v20;
LABEL_8:
  v22 = v19 / v21;
  -[PHActionSlider minSlideCompletionPercentage](self, "minSlideCompletionPercentage");
  v24 = v19 / (v21 * v23);
  v25 = v17 >= 150.0 && v19 / v21 >= 0.4;
  v26 = v24 >= 0.999000013 || v25;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHActionSlider delegate](self, "delegate"));
  switch((unint64_t)objc_msgSend(v4, "state"))
  {
    case 1uLL:
      v32 = sub_1000C5588();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v37 = 138412290;
        v38[0] = v4;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Began slide with gesture recognizer: %@", (uint8_t *)&v37, 0xCu);
      }

      p_slideGestureInitialPoint->x = v11;
      self->_slideGestureInitialPoint.y = v13;
      if (-[PHActionSlider shouldHideTrackLabelForXPoint:](self, "shouldHideTrackLabelForXPoint:", v11))
        -[PHActionSlider hideTrackLabel:](self, "hideTrackLabel:", 1);
      if ((objc_opt_respondsToSelector(v27, "actionSliderDidBeginSlide:") & 1) != 0)
        objc_msgSend(v27, "actionSliderDidBeginSlide:", self);
      goto LABEL_37;
    case 2uLL:
      if (!-[PHActionSlider xPointIsWithinTrack:](self, "xPointIsWithinTrack:", v11))
      {
        p_knobPosition = &self->_knobPosition;
        self->_knobPosition = 0.0;
LABEL_39:
        *p_knobPosition = 0.0;
        -[PHActionSlider showTrackLabel](self, "showTrackLabel");
        goto LABEL_40;
      }
      if (!-[PHActionSlider xPointIsWithinTrack:](self, "xPointIsWithinTrack:", p_slideGestureInitialPoint->x))
      {
        if (-[PHActionSlider xPointIsWithinTrack:](self, "xPointIsWithinTrack:", p_slideGestureInitialPoint->x))
          v7 = p_slideGestureInitialPoint->x;
        v22 = vabdd_f64(v11, v7) / v9;
      }
      p_knobPosition = &self->_knobPosition;
      self->_knobPosition = v22;
      if (v22 <= 0.0)
        goto LABEL_39;
      if (v22 > 1.0)
        *p_knobPosition = 1.0;
      -[PHActionSlider hideTrackLabelIfNecessary:](self, "hideTrackLabelIfNecessary:", 1);
LABEL_40:
      -[PHActionSlider setNeedsLayout](self, "setNeedsLayout");
      -[PHActionSlider setNeedsDisplay](self, "setNeedsDisplay");
      if ((objc_opt_respondsToSelector(v27, "actionSlider:didUpdateSlideWithValue:") & 1) != 0)
        objc_msgSend(v27, "actionSlider:didUpdateSlideWithValue:", self, *p_knobPosition);
LABEL_37:

      return;
    case 3uLL:
      v35 = sub_1000C5588();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = 67109378;
        LODWORD(v38[0]) = v26;
        WORD2(v38[0]) = 2112;
        *(_QWORD *)((char *)v38 + 6) = v4;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Recognized slide with with success=%d for gesture recognizer: %@", (uint8_t *)&v37, 0x12u);
      }

      v30 = self;
      v31 = v26;
      goto LABEL_36;
    case 4uLL:
    case 5uLL:
      v28 = sub_1000C5588();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v37 = 138412290;
        v38[0] = v4;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Failed slide with gesture recognizer: %@", (uint8_t *)&v37, 0xCu);
      }

      v30 = self;
      v31 = 0;
LABEL_36:
      -[PHActionSlider _slideCompleted:](v30, "_slideCompleted:", v31);
      goto LABEL_37;
    default:
      goto LABEL_37;
  }
}

- (void)hideTrackLabelIfNecessary:(BOOL)a3
{
  if (self->_dragStyle != 2)
    -[PHActionSlider hideTrackLabel:](self, "hideTrackLabel:", a3);
}

- (BOOL)shouldReverseLayoutDirection
{
  return (id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PHActionSlider semanticContentAttribute](self, "semanticContentAttribute")) == (id)1;
}

- (double)_currentScreenScale
{
  return 2.0;
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)textStyle
{
  return self->_textStyle;
}

- (void)setTextStyle:(int64_t)a3
{
  self->_textStyle = a3;
}

- (unint64_t)dragStyle
{
  return self->_dragStyle;
}

- (void)setTrackSolidViewBackDropVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_trackSolidViewBackDropVisualEffectView, a3);
}

- (CGSize)knobImageOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_knobImageOffset.width;
  height = self->_knobImageOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSString)trackText
{
  return self->_trackText;
}

- (UIFont)trackFont
{
  return self->_trackFont;
}

- (CGSize)trackSize
{
  double width;
  double height;
  CGSize result;

  width = self->_trackSize.width;
  height = self->_trackSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)minSlideCompletionPercentage
{
  return self->_minSlideCompletionPercentage;
}

- (void)setMinSlideCompletionPercentage:(double)a3
{
  self->_minSlideCompletionPercentage = a3;
}

- (double)minFastSlideCompletionPercentage
{
  return self->_minFastSlideCompletionPercentage;
}

- (void)setMinFastSlideCompletionPercentage:(double)a3
{
  self->_minFastSlideCompletionPercentage = a3;
}

- (double)trackTextBaselineFromBottom
{
  return self->_trackTextBaselineFromBottom;
}

- (void)setTrackTextBaselineFromBottom:(double)a3
{
  self->_trackTextBaselineFromBottom = a3;
}

- (UIPanGestureRecognizer)slideGestureRecognizer
{
  return self->_slideGestureRecognizer;
}

- (PHActionSliderDelegate)delegate
{
  return (PHActionSliderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)knobPosition
{
  return self->_knobPosition;
}

- (double)knobWidth
{
  return self->_knobWidth;
}

- (UIEdgeInsets)knobInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_knobInsets.top;
  left = self->_knobInsets.left;
  bottom = self->_knobInsets.bottom;
  right = self->_knobInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)trackWidthProportion
{
  return self->_trackWidthProportion;
}

- (void)setTrackWidthProportion:(double)a3
{
  self->_trackWidthProportion = a3;
}

- (BOOL)isShowingTrackLabel
{
  return self->_showingTrackLabel;
}

- (void)setShowingTrackLabel:(BOOL)a3
{
  self->_showingTrackLabel = a3;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (double)cachedTrackMaskWidth
{
  return self->_cachedTrackMaskWidth;
}

- (void)setCachedTrackMaskWidth:(double)a3
{
  self->_cachedTrackMaskWidth = a3;
}

- (UIView)_knobView
{
  return &self->_knobView->super;
}

- (_UIVibrantSettings)vibrantSettings
{
  return self->_vibrantSettings;
}

- (void)setVibrantSettings:(id)a3
{
  objc_storeStrong((id *)&self->_vibrantSettings, a3);
}

- (BOOL)isLarge
{
  return self->_isLarge;
}

- (void)setIsLarge:(BOOL)a3
{
  self->_isLarge = a3;
}

- (CGPoint)panGestureFirstTouchLocationInView
{
  double x;
  double y;
  CGPoint result;

  x = self->_panGestureFirstTouchLocationInView.x;
  y = self->_panGestureFirstTouchLocationInView.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPanGestureFirstTouchLocationInView:(CGPoint)a3
{
  self->_panGestureFirstTouchLocationInView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrantSettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trackFont, 0);
  objc_storeStrong((id *)&self->_trackText, 0);
  objc_storeStrong((id *)&self->_trackSolidViewBackDropVisualEffectView, 0);
  objc_storeStrong((id *)&self->_slideGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_trackLabel, 0);
  objc_storeStrong((id *)&self->_knobLabel, 0);
  objc_storeStrong((id *)&self->_knobImageView, 0);
  objc_storeStrong((id *)&self->_knobView, 0);
  objc_storeStrong((id *)&self->_trackSolidView, 0);
  objc_storeStrong((id *)&self->_trackBlurView, 0);
  objc_storeStrong((id *)&self->_trackBackgroundView, 0);
  objc_storeStrong((id *)&self->_trackDodgeView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
