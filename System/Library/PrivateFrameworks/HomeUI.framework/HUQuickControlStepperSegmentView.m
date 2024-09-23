@implementation HUQuickControlStepperSegmentView

- (HUQuickControlStepperSegmentView)initWithStyle:(unint64_t)a3 orientation:(unint64_t)a4 controlSize:(unint64_t)a5
{
  HUQuickControlStepperSegmentView *v8;
  HUQuickControlStepperSegmentView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  UIView *highlightedOverlayView;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HUQuickControlStepperSegmentView;
  v8 = -[HUQuickControlStepperSegmentView init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_style = a3;
    v8->_orientation = a4;
    v8->_controlSize = a5;
    -[HUQuickControlStepperSegmentView bounds](v8, "bounds");
    v11 = v10;
    if (a4)
    {
      v11 = v10 * 1.25;
      -[HUQuickControlStepperSegmentView bounds](v9, "bounds");
      v13 = v12;
    }
    else
    {
      -[HUQuickControlStepperSegmentView bounds](v9, "bounds");
      v13 = v14 * 1.25;
    }
    -[HUQuickControlStepperSegmentView bounds](v9, "bounds");
    v16 = v15;
    -[HUQuickControlStepperSegmentView bounds](v9, "bounds");
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v16, v17, v11, v13);
    highlightedOverlayView = v9->_highlightedOverlayView;
    v9->_highlightedOverlayView = (UIView *)v18;

    -[HUQuickControlStepperSegmentView insertSubview:atIndex:](v9, "insertSubview:atIndex:", v9->_highlightedOverlayView, 0);
    -[UIView setUserInteractionEnabled:](v9->_highlightedOverlayView, "setUserInteractionEnabled:", 0);
    -[HUQuickControlStepperSegmentView tintColor](v9, "tintColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9->_highlightedOverlayView, "setBackgroundColor:", v20);

  }
  return v9;
}

- (void)setOrientation:(unint64_t)a3
{
  self->_orientation = a3;
  -[HUQuickControlStepperSegmentView _updateTitleLabel](self, "_updateTitleLabel");
}

- (void)setControlSize:(unint64_t)a3
{
  self->_controlSize = a3;
  -[HUQuickControlStepperSegmentView _updateTitleLabel](self, "_updateTitleLabel");
}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *title;
  uint64_t v7;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  title = self->_title;
  self->_title = v5;

  v7 = objc_msgSend(v4, "length");
  if (v7)
  {
    -[HUQuickControlStepperSegmentView _createTitleLabelIfNecessary](self, "_createTitleLabelIfNecessary");
    -[HUQuickControlStepperSegmentView _updateTitleLabel](self, "_updateTitleLabel");
  }
}

- (void)setIsSegmentViewHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  _QWORD v7[5];

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__HUQuickControlStepperSegmentView_setIsSegmentViewHighlighted___block_invoke;
  v7[3] = &unk_1E6F4D988;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v7);
  self->_isSegmentViewHighlighted = v3;
  if (v3)
    v5 = 1.0;
  else
    v5 = 0.0;
  -[HUQuickControlStepperSegmentView highlightedOverlayView](self, "highlightedOverlayView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

  -[HUQuickControlStepperSegmentView _updateTitleLabel](self, "_updateTitleLabel");
}

uint64_t __64__HUQuickControlStepperSegmentView_setIsSegmentViewHighlighted___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "reachabilityState");
  if (result == 2)
    return objc_msgSend(*(id *)(a1 + 32), "_updateUIHighlightedOverlayView");
  return result;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  -[HUQuickControlStepperSegmentView _updateUIHighlightedOverlayView](self, "_updateUIHighlightedOverlayView");
}

- (void)setSegmentLocation:(unint64_t)a3
{
  self->_segmentLocation = a3;
  -[HUQuickControlStepperSegmentView _updateUIHighlightedOverlayView](self, "_updateUIHighlightedOverlayView");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlStepperSegmentView;
  v4 = a3;
  -[HUQuickControlStepperSegmentView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[HUQuickControlStepperSegmentView traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "verticalSizeClass");
  v7 = objc_msgSend(v4, "verticalSizeClass");

  if (v6 != v7)
    -[HUQuickControlStepperSegmentView _updateTitleLabel](self, "_updateTitleLabel");
}

- (void)_createTitleLabelIfNecessary
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[HUQuickControlStepperSegmentView titleLabelEffectView](self, "titleLabelEffectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    -[HUQuickControlStepperSegmentView setTitleLabel:](self, "setTitleLabel:", v4);

    -[HUQuickControlStepperSegmentView titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserInteractionEnabled:", 0);

    -[HUQuickControlStepperSegmentView titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfLines:", 0);

    -[HUQuickControlStepperSegmentView titleLabel](self, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextAlignment:", 1);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__contentSizeCategoryDidChange, *MEMORY[0x1E0CEB3F0], 0);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
    -[HUQuickControlStepperSegmentView setTitleLabelEffectView:](self, "setTitleLabelEffectView:", v9);

    -[HUQuickControlStepperSegmentView titleLabelEffectView](self, "titleLabelEffectView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUserInteractionEnabled:", 0);

    -[HUQuickControlStepperSegmentView titleLabelEffectView](self, "titleLabelEffectView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlStepperSegmentView titleLabel](self, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);

    -[HUQuickControlStepperSegmentView titleLabelEffectView](self, "titleLabelEffectView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlStepperSegmentView addSubview:](self, "addSubview:", v14);

    -[HUQuickControlStepperSegmentView _updateTitleLabel](self, "_updateTitleLabel");
  }
}

- (void)_updateTitleLabel
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setAlignment:", 1);
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setHyphenationFactor:", v4);
  objc_msgSend(v3, "setLineBreakMode:", 0);
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 14.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HUQuickControlStepperSegmentView isSegmentViewHighlighted](self, "isSegmentViewHighlighted")
    && -[HUQuickControlStepperSegmentView reachabilityState](self, "reachabilityState") == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemDarkGrayColor");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  v10 = *MEMORY[0x1E0CEA098];
  v19[0] = *MEMORY[0x1E0CEA0A0];
  v19[1] = v10;
  v20[0] = v8;
  v20[1] = v7;
  v11 = *MEMORY[0x1E0CA8590];
  v19[2] = *MEMORY[0x1E0CEA0D0];
  v19[3] = v11;
  v20[2] = v3;
  v20[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[HUQuickControlStepperSegmentView title](self, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithString:attributes:", v14, v12);
  -[HUQuickControlStepperSegmentView titleLabel](self, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAttributedText:", v15);

  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials")
    && !-[HUQuickControlStepperSegmentView isSegmentViewHighlighted](self, "isSegmentViewHighlighted"))
  {
    objc_msgSend(MEMORY[0x1E0CEABA8], "controlCenterSecondaryVibrancyEffect");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlStepperSegmentView titleLabelEffectView](self, "titleLabelEffectView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setEffect:", v17);

  }
  else
  {
    -[HUQuickControlStepperSegmentView titleLabelEffectView](self, "titleLabelEffectView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setEffect:", 0);
  }

}

- (void)_updateUIHighlightedOverlayView
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  unint64_t v7;
  double v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  id v18;

  if (-[HUQuickControlStepperSegmentView isSegmentViewHighlighted](self, "isSegmentViewHighlighted")
    && -[HUQuickControlStepperSegmentView reachabilityState](self, "reachabilityState") == 2)
  {
    -[HUQuickControlStepperSegmentView highlightedOverlayView](self, "highlightedOverlayView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = 1.0;
  }
  else
  {
    -[HUQuickControlStepperSegmentView highlightedOverlayView](self, "highlightedOverlayView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = 0.0;
  }
  objc_msgSend(v3, "setAlpha:", v5);

  -[HUQuickControlStepperSegmentView highlightedOverlayView](self, "highlightedOverlayView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[HUQuickControlStepperSegmentView style](self, "style");
    if (v7)
    {
      v8 = 0.0;
      if (v7 == 1)
      {
        if (-[HUQuickControlStepperSegmentView segmentLocation](self, "segmentLocation") != 1)
        {
          -[HUQuickControlStepperSegmentView cornerRadius](self, "cornerRadius");
          v8 = v9;
        }
        v10 = -[HUQuickControlStepperSegmentView segmentLocation](self, "segmentLocation");
        if (v10 > 2)
          v11 = 0;
        else
          v11 = qword_1B9442E18[v10];
        -[HUQuickControlStepperSegmentView highlightedOverlayView](self, "highlightedOverlayView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "layer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setMaskedCorners:", v11);

        -[HUQuickControlStepperSegmentView highlightedOverlayView](self, "highlightedOverlayView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "layer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v17) = 0;
        objc_msgSend(v16, "setShadowOpacity:", v17);

      }
    }
    else
    {
      -[HUQuickControlStepperSegmentView cornerRadius](self, "cornerRadius");
      v8 = v12;
    }
    -[HUQuickControlStepperSegmentView highlightedOverlayView](self, "highlightedOverlayView");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_setContinuousCornerRadius:", v8);

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HUQuickControlStepperSegmentView;
  -[HUQuickControlStepperSegmentView layoutSubviews](&v16, sel_layoutSubviews);
  -[HUQuickControlStepperSegmentView frame](self, "frame");
  v4 = v3 + -16.0;
  -[HUQuickControlStepperSegmentView frame](self, "frame");
  v6 = v5 + -16.0;
  -[HUQuickControlStepperSegmentView highlightedOverlayView](self, "highlightedOverlayView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", 8.0, 8.0, v4, v6);

  -[HUQuickControlStepperSegmentView titleLabelEffectView](self, "titleLabelEffectView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", 10.0, 10.0, v4 + -4.0, v6 + -4.0);

  -[HUQuickControlStepperSegmentView titleLabelEffectView](self, "titleLabelEffectView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  -[HUQuickControlStepperSegmentView titleLabelEffectView](self, "titleLabelEffectView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  -[HUQuickControlStepperSegmentView titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", 0.0, 0.0, v11, v14);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  -[HUQuickControlStepperSegmentView bounds](self, "bounds", a4);
  v9 = CGRectInset(v8, -10.0, -5.0);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v9, v7);
}

- (void)setTintColor:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlStepperSegmentView;
  -[HUQuickControlStepperSegmentView setTintColor:](&v5, sel_setTintColor_, a3);
  -[HUQuickControlStepperSegmentView tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_highlightedOverlayView, "setBackgroundColor:", v4);

}

- (void)_contentSizeCategoryDidChange
{
  -[HUQuickControlStepperSegmentView _updateTitleLabel](self, "_updateTitleLabel");
  -[HUQuickControlStepperSegmentView setNeedsLayout](self, "setNeedsLayout");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlStepperSegmentView;
  -[HUQuickControlStepperSegmentView dealloc](&v4, sel_dealloc);
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isSegmentViewHighlighted
{
  return self->_isSegmentViewHighlighted;
}

- (unint64_t)segmentLocation
{
  return self->_segmentLocation;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (unint64_t)reachabilityState
{
  return self->_reachabilityState;
}

- (void)setReachabilityState:(unint64_t)a3
{
  self->_reachabilityState = a3;
}

- (UIView)highlightedOverlayView
{
  return self->_highlightedOverlayView;
}

- (void)setHighlightedOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedOverlayView, a3);
}

- (UIVisualEffectView)titleLabelEffectView
{
  return self->_titleLabelEffectView;
}

- (void)setTitleLabelEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelEffectView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (unint64_t)orientation
{
  return self->_orientation;
}

- (unint64_t)controlSize
{
  return self->_controlSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabelEffectView, 0);
  objc_storeStrong((id *)&self->_highlightedOverlayView, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
