@implementation HUITitleValueSlider

- (HUITitleValueSlider)initWithEffect:(id)a3
{
  HUITitleValueSlider *v4;
  HUIStepSlider *v5;
  HUIStepSlider *slider;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  id *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _BOOL4 v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
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
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  const __CFString *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _BOOL4 v66;
  void *v67;
  void *v68;
  id v69;
  objc_super v70;

  v69 = a3;
  v70.receiver = self;
  v70.super_class = (Class)HUITitleValueSlider;
  v4 = -[HUITitleValueSlider init](&v70, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(HUIStepSlider);
    slider = v4->_slider;
    v4->_slider = v5;

    -[HUIStepSlider setIsAccessibilityElement:](v4->_slider, "setIsAccessibilityElement:", 0);
    LODWORD(v7) = 0;
    -[HUIStepSlider setMinimumValue:](v4->_slider, "setMinimumValue:", v7);
    LODWORD(v8) = 1.0;
    -[HUIStepSlider setMaximumValue:](v4->_slider, "setMaximumValue:", v8);
    -[HUIStepSlider setContinuous:](v4->_slider, "setContinuous:", 1);
    -[HUIStepSlider setTranslatesAutoresizingMaskIntoConstraints:](v4->_slider, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v9) = 0.5;
    -[HUIStepSlider setValue:](v4->_slider, "setValue:", v9);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemLightGrayColor");
    v10 = objc_claimAutoreleasedReturnValue();
    -[HUIStepSlider setMinimumTrackTintColor:](v4->_slider, "setMinimumTrackTintColor:", v10);
    -[HUIStepSlider setMaximumTrackTintColor:](v4->_slider, "setMaximumTrackTintColor:", v10);
    v68 = (void *)v10;
    -[HUIStepSlider setTickColor:](v4->_slider, "setTickColor:", v10);
    -[HUITitleValueSlider addSubview:](v4, "addSubview:", v4->_slider);
    v11 = v4;
    v12 = v11;
    if (v69)
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v69);
      v14 = v11[55];
      v11[55] = (id)v13;

      objc_msgSend(v11[55], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v11, "addSubview:", v11[55]);
      objc_msgSend(v11[55], "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v15 = objc_msgSend(MEMORY[0x24BEBDB00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v11, "semanticContentAttribute"));
    v66 = v15 != 1;
    v16 = v15 == 1;
    v17 = objc_alloc_init(MEMORY[0x24BEBD708]);
    v18 = v11[53];
    v11[53] = v17;

    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BEBE200], 0x8000, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v11[53];
    v21 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(v19, "pointSize");
    objc_msgSend(v21, "fontWithDescriptor:size:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFont:", v22);

    v23 = v11[53];
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBackgroundColor:", v24);

    objc_msgSend(v11[53], "setTextAlignment:", 2 * v16);
    objc_msgSend(v11[53], "setNumberOfLines:", 0);
    objc_msgSend(v11[53], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v12, "addSubview:", v11[53]);
    v25 = objc_alloc_init(MEMORY[0x24BEBD708]);
    v26 = v11[54];
    v11[54] = v25;

    v27 = v11[54];
    v28 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(v19, "pointSize");
    objc_msgSend(v28, "fontWithDescriptor:size:", v19);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFont:", v29);

    v30 = v11[54];
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBackgroundColor:", v31);

    objc_msgSend(v11[54], "setTextAlignment:", 2 * v66);
    objc_msgSend(v11[54], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v67 = v12;
    objc_msgSend(v12, "addSubview:", v11[54]);
    if (v69)
    {
      objc_msgSend(v11[55], "contentView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)MEMORY[0x24BDD1628];
      _NSDictionaryOfVariableBindings(CFSTR("_titleLabel, _valueLabel"), v11[53], v11[54], 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_titleLabel(>=75.0)]-[_valueLabel(>=75.0)]|"), 0, 0, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addConstraints:", v35);

      objc_msgSend(v11[55], "contentView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x24BDD1628];
      _NSDictionaryOfVariableBindings(CFSTR("_titleLabel"), v11[53], 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[_titleLabel]-|"), 0, 0, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addConstraints:", v39);

      objc_msgSend(v11[55], "contentView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)MEMORY[0x24BDD1628];
      _NSDictionaryOfVariableBindings(CFSTR("_valueLabel"), v11[54], 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[_valueLabel]-|"), 0, 0, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addConstraints:", v43);

      v44 = (void *)MEMORY[0x24BDD1628];
      _NSDictionaryOfVariableBindings(CFSTR("_effectView"), v11[55], 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_effectView]-|"), 0, 0, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addConstraints:", v46);

      v47 = (void *)MEMORY[0x24BDD1628];
      _NSDictionaryOfVariableBindings(CFSTR("_slider"), v4->_slider, 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_slider]-|"), 0, 0, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addConstraints:", v49);

      v50 = (void *)MEMORY[0x24BDD1628];
      _NSDictionaryOfVariableBindings(CFSTR("_effectView, _slider"), v11[55], v4->_slider, 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = CFSTR("V:|-[_effectView][_slider]-|");
    }
    else
    {
      v53 = v11[53];
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setTextColor:", v54);

      v55 = v11[54];
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setTextColor:", v56);

      v57 = (void *)MEMORY[0x24BDD1628];
      _NSDictionaryOfVariableBindings(CFSTR("_titleLabel, _valueLabel"), v11[53], v11[54], 0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_titleLabel(>=75.0)]-[_valueLabel(>=75.0)]-|"), 0, 0, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addConstraints:", v59);

      v60 = (void *)MEMORY[0x24BDD1628];
      _NSDictionaryOfVariableBindings(CFSTR("_slider"), v4->_slider, 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_slider]-|"), 0, 0, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addConstraints:", v62);

      objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11[54], 10, 0, v11[53], 10, 1.0, 0.0);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addConstraint:", v63);

      v50 = (void *)MEMORY[0x24BDD1628];
      _NSDictionaryOfVariableBindings(CFSTR("_titleLabel, _slider"), v11[53], v4->_slider, 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = CFSTR("V:|-[_titleLabel]-[_slider]-|");
    }
    objc_msgSend(v50, "constraintsWithVisualFormat:options:metrics:views:", v52, 0, 0, v51);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addConstraints:", v64);

  }
  return v4;
}

- (unint64_t)accessibilityTraits
{
  return -[HUIStepSlider accessibilityTraits](self->_slider, "accessibilityTraits");
}

- (id)accessibilityHint
{
  return (id)-[HUIStepSlider accessibilityHint](self->_slider, "accessibilityHint");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  double v2;
  double v3;
  CGPoint result;

  -[HUIStepSlider accessibilityActivationPoint](self->_slider, "accessibilityActivationPoint");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)accessibilityIncrement
{
  -[HUIStepSlider accessibilityIncrement](self->_slider, "accessibilityIncrement");
}

- (void)accessibilityDecrement
{
  -[HUIStepSlider accessibilityDecrement](self->_slider, "accessibilityDecrement");
}

- (id)_accessibilityUserTestingChildren
{
  UILabel *valueLabel;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  valueLabel = self->_valueLabel;
  v4[0] = self->_titleLabel;
  v4[1] = valueLabel;
  v4[2] = self->_slider;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HUIStepSlider)slider
{
  return self->_slider;
}

- (void)setSlider:(id)a3
{
  objc_storeStrong((id *)&self->_slider, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_slider, 0);
}

@end
