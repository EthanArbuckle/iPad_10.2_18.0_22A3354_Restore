@implementation WFOpacitySliderView

- (WFOpacitySliderView)init
{
  WFOpacitySliderView *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  WFOpacitySlider *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  WFOpacitySliderView *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)WFOpacitySliderView;
  v2 = -[WFOpacitySliderView init](&v34, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BEBDB38]);
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithEffect:", v4);

    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFOpacitySliderView addSubview:](v2, "addSubview:", v5);
    v6 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.149019608, 0.196078431, 0.219607843, 0.75);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

    objc_msgSend(v5, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v6);

    v9 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("blurTintView"), v6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[blurTintView]|"), 0, 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addConstraints:", v11);

    v12 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("blurTintView"), v6, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[blurTintView]|"), 0, 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addConstraints:", v14);

    v15 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("backgroundView"), v5, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[backgroundView]|"), 0, 0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOpacitySliderView addConstraints:](v2, "addConstraints:", v17);

    v18 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("backgroundView"), v5, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[backgroundView]|"), 0, 0, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOpacitySliderView addConstraints:](v2, "addConstraints:", v20);

    v21 = objc_alloc_init(WFOpacitySlider);
    -[WFOpacitySlider setTranslatesAutoresizingMaskIntoConstraints:](v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEC14E0], "actionKitImageNamed:", CFSTR("OverlayImageOpacitySliderThumbImage"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UIImage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOpacitySlider setThumbImage:forState:](v21, "setThumbImage:forState:", v23, 0);

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.756862745, 0.0274509804, 1.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOpacitySlider setTintColor:](v21, "setTintColor:", v24);

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.22745098, 0.274509804, 0.298039216, 0.75);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOpacitySlider setMaximumTrackTintColor:](v21, "setMaximumTrackTintColor:", v25);

    -[WFOpacitySlider addTarget:action:forControlEvents:](v21, "addTarget:action:forControlEvents:", v2, sel_didChangeOpacityValue_, 4096);
    -[WFOpacitySliderView addSubview:](v2, "addSubview:", v21);
    objc_storeWeak((id *)&v2->_slider, v21);
    v26 = objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 13.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFont:", v27);

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.756862745, 0.0274509804, 0.699999988);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTextColor:", v28);

    objc_msgSend(v26, "setTextAlignment:", 1);
    -[WFOpacitySliderView addSubview:](v2, "addSubview:", v26);
    objc_storeWeak((id *)&v2->_opacityLabel, v26);
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 7, 0, v2, 7, 0.699999988, 1.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOpacitySliderView addConstraint:](v2, "addConstraint:", v29);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 9, 0, v2, 9, 1.0, 0.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOpacitySliderView addConstraint:](v2, "addConstraint:", v30);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 10, 0, v2, 10, 1.0, 0.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOpacitySliderView addConstraint:](v2, "addConstraint:", v31);

    -[WFOpacitySliderView reset](v2, "reset");
    v32 = v2;

  }
  return v2;
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  void *v31;
  double MidX;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  uint64_t v48;
  objc_super v49;
  CGRect v50;

  v49.receiver = self;
  v49.super_class = (Class)WFOpacitySliderView;
  -[WFOpacitySliderView layoutSubviews](&v49, sel_layoutSubviews);
  -[WFOpacitySliderView slider](self, "slider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v3, "trackRectForBounds:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v3, "value");
  LODWORD(v48) = v20;
  objc_msgSend(v3, "thumbRectForBounds:trackRect:value:", v13, v15, v17, v19, v5, v7, v9, v11, v48);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend(v3, "frame");
  v30 = v22 + v29;
  -[WFOpacitySliderView opacityLabel](self, "opacityLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sizeToFit");

  v50.origin.x = v30;
  v50.origin.y = v24;
  v50.size.width = v26;
  v50.size.height = v28;
  MidX = CGRectGetMidX(v50);
  -[WFOpacitySliderView opacityLabel](self, "opacityLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "frame");
  v35 = MidX + v34 * -0.5;
  objc_msgSend(v3, "frame");
  v37 = v36;
  -[WFOpacitySliderView opacityLabel](self, "opacityLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "frame");
  v40 = v37 - (v39 + 5.0);
  -[WFOpacitySliderView opacityLabel](self, "opacityLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "frame");
  v43 = v42;
  -[WFOpacitySliderView opacityLabel](self, "opacityLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "frame");
  v46 = v45;
  -[WFOpacitySliderView opacityLabel](self, "opacityLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setFrame:", v35, v40, v43, v46);

}

- (void)didChangeOpacityValue:(id)a3
{
  void *v4;
  float v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "value");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%0.0f%%"), roundf(v5 * 100.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOpacitySliderView opacityLabel](self, "opacityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  -[WFOpacitySliderView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  -[WFOpacitySliderView setNeedsLayout](self, "setNeedsLayout");
}

- (double)opacity
{
  void *v2;
  float v3;
  double v4;

  -[WFOpacitySliderView slider](self, "slider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v4 = v3;

  return v4;
}

- (void)reset
{
  void *v3;
  double v4;
  id v5;

  -[WFOpacitySliderView slider](self, "slider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setValue:", v4);

  -[WFOpacitySliderView slider](self, "slider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFOpacitySliderView didChangeOpacityValue:](self, "didChangeOpacityValue:", v5);

}

- (WFOpacitySlider)slider
{
  return (WFOpacitySlider *)objc_loadWeakRetained((id *)&self->_slider);
}

- (UILabel)opacityLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_opacityLabel);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_opacityLabel);
  objc_destroyWeak((id *)&self->_slider);
}

@end
