@implementation AXSBVoiceOverSwipeDetectorView

- (AXSBVoiceOverSwipeDetectorView)initWithFrame:(CGRect)a3
{
  AXSBVoiceOverSwipeDetectorView *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  UIImageView *bgImageView;
  id v26;
  uint64_t v27;
  UILabel *titleLabel;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  AXSBVoiceOverSwipeDetectorView *v35;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)AXSBVoiceOverSwipeDetectorView;
  v3 = -[AXSBVoiceOverSwipeDetectorView initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSBVoiceOverSwipeDetectorView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[AXSBVoiceOverSwipeDetectorView setAutoresizesSubviews:](v3, "setAutoresizesSubviews:", 1);
    -[AXSBVoiceOverSwipeDetectorView setMultipleTouchEnabled:](v3, "setMultipleTouchEnabled:", 1);
    v5 = objc_alloc(MEMORY[0x24BEBD668]);
    objc_msgSend(MEMORY[0x24BEBD640], "_defaultBackgroundGradient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithImage:", v6);

    -[AXSBVoiceOverSwipeDetectorView bounds](v3, "bounds");
    objc_msgSend(v7, "setFrame:");
    objc_msgSend(v7, "setAutoresizingMask:", 18);
    -[AXSBVoiceOverSwipeDetectorView addSubview:](v3, "addSubview:", v7);
    v8 = objc_alloc(MEMORY[0x24BEBDB00]);
    -[AXSBVoiceOverSwipeDetectorView bounds](v3, "bounds");
    v9 = (void *)objc_msgSend(v8, "initWithFrame:");
    objc_msgSend(v9, "setUserInteractionEnabled:", 1);
    objc_msgSend(v9, "setAutoresizingMask:", 18);
    v10 = (void *)MEMORY[0x24BEBD4B8];
    objc_msgSend(MEMORY[0x24BEBD640], "kitImageNamed:", CFSTR("UITableViewTexture.png"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colorWithPatternImage:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v12);

    -[AXSBVoiceOverSwipeDetectorView addSubview:](v3, "addSubview:", v9);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9B0]), "initWithTarget:action:", v3, sel__swipeDetected_);
    objc_msgSend(v13, "setDelaysTouchesEnded:", 0);
    objc_msgSend(v13, "setCancelsTouchesInView:", 0);
    objc_msgSend(v13, "setNumberOfTouchesRequired:", 1);
    objc_msgSend(v13, "setDirection:", 4);
    objc_msgSend(v9, "addGestureRecognizer:", v13);
    v14 = objc_alloc(MEMORY[0x24BEBD788]);
    -[AXSBVoiceOverSwipeDetectorView frame](v3, "frame");
    v15 = (void *)objc_msgSend(v14, "initWithFrame:", 0.0, 0.0);
    objc_msgSend(v15, "setAutoresizingMask:", 2);
    -[AXSBVoiceOverSwipeDetectorView addSubview:](v3, "addSubview:", v15);
    v16 = objc_alloc(MEMORY[0x24BEBD7A8]);
    SBAXLocalizedString(CFSTR("ask.sheet.option.VoiceOver.on"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithTitle:", v17);

    objc_msgSend(v18, "setHidesBackButton:", 1);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v3, sel__cancelVOSwipeActivation_);
    objc_msgSend(v18, "setRightBarButtonItem:", v19);
    objc_msgSend(v15, "pushNavigationItem:animated:", v18, 1);
    v20 = objc_alloc(MEMORY[0x24BEBD668]);
    v21 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "imageNamed:inBundle:", CFSTR("activate-arrow"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v20, "initWithImage:", v23);
    bgImageView = v3->_bgImageView;
    v3->_bgImageView = (UIImageView *)v24;

    -[AXSBVoiceOverSwipeDetectorView addSubview:](v3, "addSubview:", v3->_bgImageView);
    v26 = objc_allocWithZone(MEMORY[0x24BEBD708]);
    v27 = objc_msgSend(v26, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v27;

    -[UILabel setAutoresizingMask:](v3->_titleLabel, "setAutoresizingMask:", 45);
    objc_msgSend(MEMORY[0x24BEBD5E0], "boldSystemFontOfSize:", 20.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v29);

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v3->_titleLabel, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.294117647, 0.341176471, 0.435294118, 1.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v30);

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "colorWithAlphaComponent:", 0.75);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setShadowColor:](v3->_titleLabel, "setShadowColor:", v32);

    -[UILabel setShadowOffset:](v3->_titleLabel, "setShadowOffset:", 0.0, 1.0);
    -[UILabel setIsAccessibilityElement:](v3->_titleLabel, "setIsAccessibilityElement:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v3->_titleLabel, "setBackgroundColor:", v33);

    SBAXLocalizedString(CFSTR("SWIPE_TO_ENABLE"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_titleLabel, "setText:", v34);

    objc_msgSend(v9, "addSubview:", v3->_titleLabel);
    -[UILabel sizeToFit](v3->_titleLabel, "sizeToFit");
    v35 = v3;

  }
  return v3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  self->_swipeDetected = 0;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v4;

  if (self->_swipeDetected)
  {
    -[AXSBVoiceOverSwipeDetectorView delegate](self, "delegate", a3, a4);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "swipeDetectorDetectedSwipe");

  }
}

- (void)_swipeDetected:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    self->_swipeDetected = 1;
}

- (void)_cancelVOSwipeActivation:(id)a3
{
  id v3;

  -[AXSBVoiceOverSwipeDetectorView delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "swipeDetectorCanceled");

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  _BOOL4 v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  -[AXSBVoiceOverSwipeDetectorView bounds](self, "bounds");
  v4 = v3;
  -[UIImageView frame](self->_bgImageView, "frame");
  v6 = v5;
  v8 = v7;
  -[AXSBVoiceOverSwipeDetectorView frame](self, "frame");
  v10 = v9 > 560.0;
  *(_QWORD *)&v11.origin.y = qword_21ACB6AB0[v9 > 560.0];
  v11.origin.x = v4 * 0.5 - v6 * 0.5;
  v11.size.width = v6;
  v11.size.height = v8;
  v12 = CGRectIntegral(v11);
  -[UIImageView setFrame:](self->_bgImageView, "setFrame:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
  -[UILabel frame](self->_titleLabel, "frame");
  v13.origin.y = 0.0;
  v13.origin.x = v4 * 0.05;
  v13.size.width = v4 * 0.9;
  v14 = CGRectIntegral(v13);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v14.origin.x, dbl_21ACB6AC0[v10], v14.size.width, v14.size.height);
}

- (AXSBVoiceOverSwipeDetectorDelegate)delegate
{
  return (AXSBVoiceOverSwipeDetectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bgImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
