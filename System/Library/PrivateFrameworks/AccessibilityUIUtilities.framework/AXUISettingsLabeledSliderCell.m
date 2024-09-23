@implementation AXUISettingsLabeledSliderCell

- (AXUISettingsLabeledSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  AXUISettingsLabeledSliderCell *v9;
  AXUISettingsLabeledSliderCell *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
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
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  UITraitChangeRegistration *traitRegistration;
  objc_super v67;
  _QWORD v68[2];

  v68[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v67.receiver = self;
  v67.super_class = (Class)AXUISettingsLabeledSliderCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v67, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  v10 = v9;
  if (v9)
  {
    -[PSTableCell setSpecifier:](v9, "setSpecifier:", v8);
    -[AXUISettingsLabeledSliderCell setUserInteractionEnabled:](v10, "setUserInteractionEnabled:", 1);
    -[AXUISettingsLabeledSliderCell contentView](v10, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 0);

    v12 = objc_alloc(-[AXUISettingsLabeledSliderCell sliderCellClass](v10, "sliderCellClass"));
    v13 = *MEMORY[0x1E0C9D648];
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v17 = (void *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], v14, v15, v16);
    -[AXUISettingsLabeledSliderCell setSliderView:](v10, "setSliderView:", v17);
    -[AXUISettingsLabeledSliderCell minimumValue](v10, "minimumValue");
    *(float *)&v18 = v18;
    objc_msgSend(v17, "setMinimumValue:", v18);
    -[AXUISettingsLabeledSliderCell maximumValue](v10, "maximumValue");
    *(float *)&v19 = v19;
    objc_msgSend(v17, "setMaximumValue:", v19);
    -[AXUISettingsLabeledSliderCell initialValue](v10, "initialValue");
    *(float *)&v20 = v20;
    objc_msgSend(v17, "setValue:", v20);
    objc_msgSend(v17, "setContinuous:", 1);
    objc_msgSend(v17, "addTarget:action:forControlEvents:", v10, sel_handleSliderBeingDragged_, 4096);
    objc_msgSend(v17, "addTarget:action:forControlEvents:", v10, sel_handleSliderDidFinishDrag_, 192);
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v21) = 1148846080;
    objc_msgSend(v17, "setContentCompressionResistancePriority:forAxis:", 1, v21);
    -[AXUISettingsLabeledSliderCell contentView](v10, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v17);

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v13, v14, v15, v16);
    -[AXUISettingsLabeledSliderCell setRightView:](v10, "setRightView:", v23);
    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v24) = 1148846080;
    objc_msgSend(v23, "setContentCompressionResistancePriority:forAxis:", 0, v24);
    LODWORD(v25) = 1148846080;
    objc_msgSend(v23, "setContentCompressionResistancePriority:forAxis:", 1, v25);
    -[AXUISettingsLabeledSliderCell contentView](v10, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v23);

    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v13, v14, v15, v16);
    -[AXUISettingsLabeledSliderCell setRightLabel:](v10, "setRightLabel:", v27);
    objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v23, "addSubview:", v27);
    objc_msgSend(v27, "setTextAlignment:", 2);
    objc_msgSend(v27, "setNumberOfLines:", 1);
    objc_msgSend(v27, "setLineBreakMode:", 2);
    -[AXUISettingsLabeledSliderCell _updateLabelFont:](v10, "_updateLabelFont:", v27);
    -[AXUISettingsLabeledSliderCell labelTextColor](v10, "labelTextColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTextColor:", v28);

    objc_msgSend(v27, "setAdjustsFontForContentSizeCategory:", 1);
    -[AXUISettingsLabeledSliderCell rightViewPadding](v10, "rightViewPadding");
    *(float *)&v13 = v29;
    objc_msgSend(v17, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsLabeledSliderCell contentView](v10, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32, 25.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsLabeledSliderCell addConstraint:](v10, "addConstraint:", v33);

    objc_msgSend(v17, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (float)-*(float *)&v13;
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsLabeledSliderCell addConstraint:](v10, "addConstraint:", v37);

    objc_msgSend(v23, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsLabeledSliderCell contentView](v10, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40, v36);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsLabeledSliderCell addConstraint:](v10, "addConstraint:", v41);

    objc_msgSend(v17, "centerYAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsLabeledSliderCell contentView](v10, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "centerYAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:constant:", v44, 0.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsLabeledSliderCell addConstraint:](v10, "addConstraint:", v45);

    objc_msgSend(v23, "centerYAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsLabeledSliderCell contentView](v10, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "centerYAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:constant:", v48, 0.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsLabeledSliderCell addConstraint:](v10, "addConstraint:", v49);

    objc_msgSend(v23, "heightAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsLabeledSliderCell contentView](v10, "contentView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "heightAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:constant:", v52, 0.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsLabeledSliderCell addConstraint:](v10, "addConstraint:", v53);

    objc_msgSend(v27, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:constant:", v55, 0.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsLabeledSliderCell addConstraint:](v10, "addConstraint:", v56);

    objc_msgSend(v27, "trailingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:constant:", v58, 0.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsLabeledSliderCell addConstraint:](v10, "addConstraint:", v59);

    objc_msgSend(v27, "centerYAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "centerYAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:constant:", v61, 0.0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsLabeledSliderCell addConstraint:](v10, "addConstraint:", v62);

    v68[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsLabeledSliderCell registerForTraitChanges:withAction:](v10, "registerForTraitChanges:withAction:", v63, sel_didChangeTraitPreferredContentSizeCategory);
    v64 = objc_claimAutoreleasedReturnValue();
    traitRegistration = v10->_traitRegistration;
    v10->_traitRegistration = (UITraitChangeRegistration *)v64;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[AXUISettingsLabeledSliderCell unregisterForTraitChanges:](self, "unregisterForTraitChanges:", self->_traitRegistration);
  v3.receiver = self;
  v3.super_class = (Class)AXUISettingsLabeledSliderCell;
  -[PSTableCell dealloc](&v3, sel_dealloc);
}

- (double)rightViewPadding
{
  return 10.0;
}

- (void)didMoveToSuperview
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  -[AXUISettingsLabeledSliderCell maximumTextSizeString](self, "maximumTextSizeString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v10 = v3;
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v5, "setNumberOfLines:", 1);
    -[AXUISettingsLabeledSliderCell _updateLabelFont:](self, "_updateLabelFont:", v5);
    objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v5, "setText:", v10);
    objc_msgSend(v5, "sizeThatFits:", 10000.0, 10000.0);
    v7 = v6;

    v3 = v10;
    if (v7 > 0.0)
    {
      -[AXUISettingsLabeledSliderCell rightView](self, "rightView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ax_addedConstraintForLayoutAttribute:asEqualToConstant:", 7, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXUISettingsLabeledSliderCell addConstraint:](self, "addConstraint:", v9);

      v3 = v10;
    }
  }

}

- (id)maximumTextSizeString
{
  return 0;
}

- (Class)sliderCellClass
{
  return (Class)objc_opt_class();
}

- (void)_updateLabelFont:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0DC37E8];
  v4 = *MEMORY[0x1E0DC4A88];
  v5 = a3;
  objc_msgSend(v3, "preferredFontForTextStyle:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC37E8];
  objc_msgSend(v8, "pointSize");
  objc_msgSend(v6, "monospacedDigitSystemFontOfSize:weight:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v7);

}

- (id)labelTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[AXUISettingsLabeledSliderCell rightLabel](self, "rightLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[AXUISettingsLabeledSliderCell sliderView](self, "sliderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");

  return v3;
}

- (void)accessibilityDecrement
{
  void *v2;

  -[AXUISettingsLabeledSliderCell sliderView](self, "sliderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityDecrement");

  AXPerformBlockAsynchronouslyOnMainThread();
}

void __55__AXUISettingsLabeledSliderCell_accessibilityDecrement__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "sliderView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleSliderDidFinishDrag:", v2);

}

- (void)accessibilityIncrement
{
  void *v2;

  -[AXUISettingsLabeledSliderCell sliderView](self, "sliderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityIncrement");

  AXPerformBlockAsynchronouslyOnMainThread();
}

void __55__AXUISettingsLabeledSliderCell_accessibilityIncrement__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "sliderView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleSliderDidFinishDrag:", v2);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if ((-[AXUISettingsLabeledSliderCell isHidden](self, "isHidden") & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)AXUISettingsLabeledSliderCell;
    -[AXUISettingsLabeledSliderCell hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AXUISettingsLabeledSliderCell sliderView](self, "sliderView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsLabeledSliderCell sliderView](self, "sliderView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsLabeledSliderCell convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
    objc_msgSend(v9, "hitTest:withEvent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)setLabelText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXUISettingsLabeledSliderCell rightLabel](self, "rightLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (id)accessibilityLabel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXUISettingsLabeledSliderCell;
  -[AXUISettingsLabeledSliderCell accessibilityLabel](&v3, sel_accessibilityLabel);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)maximumValue
{
  return 1.0;
}

- (double)minimumValue
{
  return 0.0;
}

- (double)initialValue
{
  return 0.5;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[AXUISettingsLabeledSliderCell sliderView](self, "sliderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)didChangeTraitPreferredContentSizeCategory
{
  id v3;

  -[AXUISettingsLabeledSliderCell rightLabel](self, "rightLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsLabeledSliderCell _updateLabelFont:](self, "_updateLabelFont:", v3);

}

- (UIView)leftView
{
  return self->_leftView;
}

- (void)setLeftView:(id)a3
{
  objc_storeStrong((id *)&self->_leftView, a3);
}

- (UISlider)sliderView
{
  return self->_sliderView;
}

- (void)setSliderView:(id)a3
{
  objc_storeStrong((id *)&self->_sliderView, a3);
}

- (UIView)rightView
{
  return self->_rightView;
}

- (void)setRightView:(id)a3
{
  objc_storeStrong((id *)&self->_rightView, a3);
}

- (UILabel)rightLabel
{
  return self->_rightLabel;
}

- (void)setRightLabel:(id)a3
{
  objc_storeStrong((id *)&self->_rightLabel, a3);
}

- (BOOL)segmented
{
  return self->_segmented;
}

- (void)setSegmented:(BOOL)a3
{
  self->_segmented = a3;
}

- (UITraitChangeRegistration)traitRegistration
{
  return self->_traitRegistration;
}

- (void)setTraitRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_traitRegistration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitRegistration, 0);
  objc_storeStrong((id *)&self->_rightLabel, 0);
  objc_storeStrong((id *)&self->_rightView, 0);
  objc_storeStrong((id *)&self->_sliderView, 0);
  objc_storeStrong((id *)&self->_leftView, 0);
}

@end
