@implementation HUITitleDarkStepSliderView

- (HUITitleDarkStepSliderView)initWithConfig:(id)a3
{
  id v5;
  HUITitleDarkStepSliderView *v6;
  HUITitleDarkStepSliderView *v7;
  HACCStackView *v8;
  HACCStackView *stackView;
  HACCCapsuleTitleView *v10;
  HACCCapsuleTitleView *titleView;
  _HUIDarkStepSliderView *v12;
  _HUIDarkStepSliderView *sliderView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSLayoutConstraint *titleViewHeightLayout;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  objc_super v46;
  _QWORD v47[7];

  v47[5] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v46.receiver = self;
  v46.super_class = (Class)HUITitleDarkStepSliderView;
  v6 = -[HUITitleDarkStepSliderView initWithFrame:](&v46, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v8 = objc_alloc_init(HACCStackView);
    stackView = v7->_stackView;
    v7->_stackView = v8;

    -[HACCStackView setAxis:](v7->_stackView, "setAxis:", 1);
    -[HACCStackView setAlignment:](v7->_stackView, "setAlignment:", 0);
    -[HACCStackView setTranslatesAutoresizingMaskIntoConstraints:](v7->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUITitleDarkStepSliderView addSubview:](v7, "addSubview:", v7->_stackView);
    v10 = objc_alloc_init(HACCCapsuleTitleView);
    titleView = v7->_titleView;
    v7->_titleView = v10;

    -[HACCCapsuleTitleView setTranslatesAutoresizingMaskIntoConstraints:](v7->_titleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = -[_HUIDarkStepSliderView initWithConfig:]([_HUIDarkStepSliderView alloc], "initWithConfig:", v5);
    sliderView = v7->_sliderView;
    v7->_sliderView = v12;

    -[_HUIDarkStepSliderView slider](v7->_sliderView, "slider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSupportsVibrancy:", 1);

    -[_HUIDarkStepSliderView slider](v7->_sliderView, "slider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDrawsEndTicks:", 0);

    -[_HUIDarkStepSliderView slider](v7->_sliderView, "slider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v45 = v5;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMinimumTrackTintColor:", v17);

    -[_HUIDarkStepSliderView slider](v7->_sliderView, "slider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTickColor:", v19);

    -[_HUIDarkStepSliderView setTranslatesAutoresizingMaskIntoConstraints:](v7->_sliderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUITitleDarkStepSliderView _setupTitleView](v7, "_setupTitleView");
    v36 = (void *)MEMORY[0x24BDD1628];
    -[HUITitleDarkStepSliderView stackView](v7, "stackView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUITitleDarkStepSliderView leadingAnchor](v7, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v41;
    -[HUITitleDarkStepSliderView stackView](v7, "stackView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUITitleDarkStepSliderView trailingAnchor](v7, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v37;
    -[HUITitleDarkStepSliderView stackView](v7, "stackView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUITitleDarkStepSliderView topAnchor](v7, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v20;
    -[HUITitleDarkStepSliderView stackView](v7, "stackView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUITitleDarkStepSliderView bottomAnchor](v7, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v24;
    -[HUITitleDarkStepSliderView sliderView](v7, "sliderView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "heightAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintGreaterThanOrEqualToConstant:", 52.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v47[4] = v27;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "activateConstraints:", v28);

    v5 = v45;
    -[HACCCapsuleTitleView heightAnchor](v7->_titleView, "heightAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintGreaterThanOrEqualToConstant:", 52.0);
    v30 = objc_claimAutoreleasedReturnValue();
    titleViewHeightLayout = v7->_titleViewHeightLayout;
    v7->_titleViewHeightLayout = (NSLayoutConstraint *)v30;

  }
  return v7;
}

- (HUIStepSlider)slider
{
  void *v2;
  void *v3;

  -[HUITitleDarkStepSliderView sliderView](self, "sliderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "slider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HUIStepSlider *)v3;
}

- (UILabel)titleLabel
{
  void *v2;
  void *v3;

  -[HUITitleDarkStepSliderView titleView](self, "titleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UILabel *)v3;
}

- (UILabel)valueLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[HUITitleDarkStepSliderView sliderView](self, "sliderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UILabel *)v4;
}

- (void)setIsSubmenu:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;

  v3 = a3;
  -[HUITitleDarkStepSliderView config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSubmenuSlider");

  if (v6 != v3)
  {
    -[HUITitleDarkStepSliderView config](self, "config");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIsSubmenuSlider:", v3);

    -[HUITitleDarkStepSliderView _setupTitleView](self, "_setupTitleView");
  }
}

- (void)_setupTitleView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[HUITitleDarkStepSliderView titleView](self, "titleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[HUITitleDarkStepSliderView stackView](self, "stackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUITitleDarkStepSliderView titleView](self, "titleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeArrangedSubview:", v5);

  -[HUITitleDarkStepSliderView stackView](self, "stackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUITitleDarkStepSliderView sliderView](self, "sliderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeArrangedSubview:", v7);

  -[HUITitleDarkStepSliderView config](self, "config");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v8, "isSubmenuSlider");

  -[HUITitleDarkStepSliderView stackView](self, "stackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v7)
  {
    -[HUITitleDarkStepSliderView sliderView](self, "sliderView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addArrangedSubview:withPartialSeparator:withDarkBackground:", v10, 1, 1);

    -[HUITitleDarkStepSliderView titleViewHeightLayout](self, "titleViewHeightLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v11, "isActive");

    if (!(_DWORD)v10)
      return;
    -[HUITitleDarkStepSliderView titleViewHeightLayout](self, "titleViewHeightLayout");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 0);
  }
  else
  {
    -[HUITitleDarkStepSliderView titleView](self, "titleView");
    v12 = objc_claimAutoreleasedReturnValue();
    -[HUITitleDarkStepSliderView config](self, "config");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addArrangedSubview:withSeparator:", v12, objc_msgSend(v13, "providesOwnSeparator"));

    -[HUITitleDarkStepSliderView titleViewHeightLayout](self, "titleViewHeightLayout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_msgSend(v14, "isActive");

    if ((v12 & 1) == 0)
    {
      -[HUITitleDarkStepSliderView titleViewHeightLayout](self, "titleViewHeightLayout");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setActive:", 1);

    }
    -[HUITitleDarkStepSliderView stackView](self, "stackView");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[HUITitleDarkStepSliderView sliderView](self, "sliderView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addArrangedSubview:withSeparator:", v16, 1);

  }
}

- (void)setIsLargeText:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[HUITitleDarkStepSliderView config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLargeText");

  if (v6 != v3)
  {
    -[HUITitleDarkStepSliderView config](self, "config");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIsLargeText:", v3);

    -[HUITitleDarkStepSliderView sliderView](self, "sliderView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[HUITitleDarkStepSliderView config](self, "config");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateConstraintsWithConfig:", v8);

  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBDEF0];
}

- (void)accessibilityDecrement
{
  id v2;

  -[HUITitleDarkStepSliderView sliderView](self, "sliderView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityDecrement");

}

- (void)accessibilityIncrement
{
  id v2;

  -[HUITitleDarkStepSliderView sliderView](self, "sliderView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityIncrement");

}

- (void)setSlider:(id)a3
{
  objc_storeStrong((id *)&self->_slider, a3);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

- (HUISliderConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (HACCStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (HACCCapsuleTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (_HUIDarkStepSliderView)sliderView
{
  return self->_sliderView;
}

- (void)setSliderView:(id)a3
{
  objc_storeStrong((id *)&self->_sliderView, a3);
}

- (NSLayoutConstraint)titleViewHeightLayout
{
  return self->_titleViewHeightLayout;
}

- (void)setTitleViewHeightLayout:(id)a3
{
  objc_storeStrong((id *)&self->_titleViewHeightLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleViewHeightLayout, 0);
  objc_storeStrong((id *)&self->_sliderView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_slider, 0);
}

@end
