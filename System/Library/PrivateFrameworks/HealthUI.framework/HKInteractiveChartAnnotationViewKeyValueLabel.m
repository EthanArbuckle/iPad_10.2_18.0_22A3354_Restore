@implementation HKInteractiveChartAnnotationViewKeyValueLabel

- (HKInteractiveChartAnnotationViewKeyValueLabel)initWithFrame:(CGRect)a3
{
  HKInteractiveChartAnnotationViewKeyValueLabel *v3;
  HKInteractiveChartAnnotationViewKeyValueLabel *v4;
  uint64_t v5;
  HKSelectedRangeLabel *keyLabel;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HKSelectedRangeLabel *valueLabel;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)HKInteractiveChartAnnotationViewKeyValueLabel;
  v3 = -[HKInteractiveChartAnnotationViewKeyValueLabel initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_orientation = 1;
    v5 = objc_opt_new();
    keyLabel = v4->_keyLabel;
    v4->_keyLabel = (HKSelectedRangeLabel *)v5;

    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartLollipopKeyFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSelectedRangeLabel setFont:](v4->_keyLabel, "setFont:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartAnnotationViewKeyValueLabel keyLabel](v4, "keyLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    -[HKInteractiveChartAnnotationViewKeyValueLabel keyLabel](v4, "keyLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", 1);

    -[HKInteractiveChartAnnotationViewKeyValueLabel keyLabel](v4, "keyLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMinimumScaleFactor:", 0.1);

    -[HKInteractiveChartAnnotationViewKeyValueLabel keyLabel](v4, "keyLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLineBreakMode:", 4);

    -[HKInteractiveChartAnnotationViewKeyValueLabel keyLabel](v4, "keyLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartAnnotationViewKeyValueLabel addSubview:](v4, "addSubview:", v13);

    v14 = objc_opt_new();
    valueLabel = v4->_valueLabel;
    v4->_valueLabel = (HKSelectedRangeLabel *)v14;

    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartCurrentValueValueFont");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSelectedRangeLabel setFont:](v4->_valueLabel, "setFont:", v16);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartAnnotationViewKeyValueLabel valueLabel](v4, "valueLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextColor:", v17);

    -[HKInteractiveChartAnnotationViewKeyValueLabel valueLabel](v4, "valueLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAdjustsFontSizeToFitWidth:", 1);

    -[HKInteractiveChartAnnotationViewKeyValueLabel valueLabel](v4, "valueLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMinimumScaleFactor:", 0.1);

    -[HKInteractiveChartAnnotationViewKeyValueLabel valueLabel](v4, "valueLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLineBreakMode:", 4);

    -[HKInteractiveChartAnnotationViewKeyValueLabel valueLabel](v4, "valueLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartAnnotationViewKeyValueLabel addSubview:](v4, "addSubview:", v22);

    -[HKInteractiveChartAnnotationViewKeyValueLabel setForwardChevronView:](v4, "setForwardChevronView:", 0);
    -[HKInteractiveChartAnnotationViewKeyValueLabel setTapOutRecognizer:](v4, "setTapOutRecognizer:", 0);
  }
  return v4;
}

- (void)layoutSubviews
{
  if (-[HKInteractiveChartAnnotationViewKeyValueLabel orientation](self, "orientation") == 1)
    -[HKInteractiveChartAnnotationViewKeyValueLabel _layoutSubviewsVertically](self, "_layoutSubviewsVertically");
  else
    -[HKInteractiveChartAnnotationViewKeyValueLabel _layoutSubviewsHorizontally](self, "_layoutSubviewsHorizontally");
}

- (void)setTapOutBlock:(id)a3
{
  void *v5;
  id tapOutBlock;

  v5 = _Block_copy(a3);
  tapOutBlock = self->_tapOutBlock;
  self->_tapOutBlock = v5;

  if (a3)
    -[HKInteractiveChartAnnotationViewKeyValueLabel _installForwardChevronView](self, "_installForwardChevronView");
  else
    -[HKInteractiveChartAnnotationViewKeyValueLabel _removeForwardChevronView](self, "_removeForwardChevronView");
}

- (void)_installForwardChevronView
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3888];
  v18[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationWithPaletteColors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartLollipopKeyFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationWithFont:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "configurationByApplyingConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("chevron.forward"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v11);
  -[HKInteractiveChartAnnotationViewKeyValueLabel setForwardChevronView:](self, "setForwardChevronView:", v12);

  -[HKInteractiveChartAnnotationViewKeyValueLabel forwardChevronView](self, "forwardChevronView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContentMode:", 1);

  -[HKInteractiveChartAnnotationViewKeyValueLabel forwardChevronView](self, "forwardChevronView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartAnnotationViewKeyValueLabel addSubview:](self, "addSubview:", v14);

  -[HKInteractiveChartAnnotationViewKeyValueLabel setNeedsLayout](self, "setNeedsLayout");
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_handleTapOutGesture_);
  -[HKInteractiveChartAnnotationViewKeyValueLabel setTapOutRecognizer:](self, "setTapOutRecognizer:", v15);

  -[HKInteractiveChartAnnotationViewKeyValueLabel setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
  -[HKInteractiveChartAnnotationViewKeyValueLabel tapOutRecognizer](self, "tapOutRecognizer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartAnnotationViewKeyValueLabel addGestureRecognizer:](self, "addGestureRecognizer:", v16);

  objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartAccessibilityIdentifier:", CFSTR("LollipopTapOut"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartAnnotationViewKeyValueLabel setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v17);

}

- (void)_removeForwardChevronView
{
  void *v3;
  void *v4;
  void *v5;

  -[HKInteractiveChartAnnotationViewKeyValueLabel forwardChevronView](self, "forwardChevronView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKInteractiveChartAnnotationViewKeyValueLabel forwardChevronView](self, "forwardChevronView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[HKInteractiveChartAnnotationViewKeyValueLabel setNeedsLayout](self, "setNeedsLayout");
    -[HKInteractiveChartAnnotationViewKeyValueLabel tapOutRecognizer](self, "tapOutRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartAnnotationViewKeyValueLabel removeGestureRecognizer:](self, "removeGestureRecognizer:", v5);

    -[HKInteractiveChartAnnotationViewKeyValueLabel setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
    -[HKInteractiveChartAnnotationViewKeyValueLabel setTapOutRecognizer:](self, "setTapOutRecognizer:", 0);
    -[HKInteractiveChartAnnotationViewKeyValueLabel setForwardChevronView:](self, "setForwardChevronView:", 0);
  }
}

- (void)handleTapOutGesture:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[HKInteractiveChartAnnotationViewKeyValueLabel tapOutBlock](self, "tapOutBlock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HKInteractiveChartAnnotationViewKeyValueLabel tapOutBlock](self, "tapOutBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (void)_layoutSubviewsVertically
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  id v30;

  -[HKInteractiveChartAnnotationViewKeyValueLabel bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[HKInteractiveChartAnnotationViewKeyValueLabel _compressedKeySize](self, "_compressedKeySize");
  v8 = v7;
  -[HKInteractiveChartAnnotationViewKeyValueLabel valueLabel](self, "valueLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "intrinsicContentSize");
  v11 = v10;

  v12 = v8 + v11 - v6;
  v13 = v12 <= 0.00000001;
  v14 = 0.0;
  if (v12 <= 0.00000001)
    v15 = 0.0;
  else
    v15 = v11 * 0.15;
  v16 = v6 + v15;
  if (v13)
    v17 = 0.0;
  else
    v17 = v8 * 0.15;
  if (v16 - v11 >= 0.0)
    v18 = v16 - v11;
  else
    v18 = 0.0;
  v19 = v16 - v18;
  -[HKInteractiveChartAnnotationViewKeyValueLabel valueLabel](self, "valueLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", 0.0, v18, v4, v19);

  v21 = v4 - v8;
  -[HKInteractiveChartAnnotationViewKeyValueLabel forwardChevronView](self, "forwardChevronView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    v23 = v4 - v8;
  else
    v23 = v4;
  v24 = v18 - v8;

  if (v18 - v8 < 0.0)
  {
    v24 = -v17;
    v18 = v8 - v17;
  }
  if (-[HKInteractiveChartAnnotationViewKeyValueLabel effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
  {
    -[HKInteractiveChartAnnotationViewKeyValueLabel forwardChevronView](self, "forwardChevronView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
      v14 = v8;
    else
      v14 = 0.0;
  }
  -[HKInteractiveChartAnnotationViewKeyValueLabel keyLabel](self, "keyLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", v14, v24, v23, v18 - v24);

  -[HKInteractiveChartAnnotationViewKeyValueLabel forwardChevronView](self, "forwardChevronView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = v8 + -4.0;
    v29 = v21 + 4.0;
    if (-[HKInteractiveChartAnnotationViewKeyValueLabel effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)v29 = 0.0;
    -[HKInteractiveChartAnnotationViewKeyValueLabel forwardChevronView](self, "forwardChevronView");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFrame:", v29, v24 + 2.0, v28, v28);

  }
}

- (void)_layoutSubviewsHorizontally
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  id v22;

  -[HKInteractiveChartAnnotationViewKeyValueLabel bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[HKInteractiveChartAnnotationViewKeyValueLabel _compressedKeySize](self, "_compressedKeySize");
  v8 = v7;
  -[HKInteractiveChartAnnotationViewKeyValueLabel valueLabel](self, "valueLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "intrinsicContentSize");
  v11 = v10;

  if (v8 + v11 <= v4)
    v12 = 0.0;
  else
    v12 = (v8 + v11 - v4) * 0.5;
  -[HKInteractiveChartAnnotationViewKeyValueLabel forwardChevronView](self, "forwardChevronView", v8 + v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    v14 = v6;
  else
    v14 = 0.0;

  -[HKInteractiveChartAnnotationViewKeyValueLabel forwardChevronView](self, "forwardChevronView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    v16 = v14;
  else
    v16 = 0.0;
  v17 = v8 - v12 - v16;
  -[HKInteractiveChartAnnotationViewKeyValueLabel keyLabel](self, "keyLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", 0.0, 0.0, v17, v6);

  v19 = v17 + 0.0;
  -[HKInteractiveChartAnnotationViewKeyValueLabel forwardChevronView](self, "forwardChevronView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[HKInteractiveChartAnnotationViewKeyValueLabel forwardChevronView](self, "forwardChevronView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFrame:", v19 + 4.0, 2.0, v14 + -4.0, v14 + -4.0);

    v19 = v14 + v19;
  }
  -[HKInteractiveChartAnnotationViewKeyValueLabel valueLabel](self, "valueLabel");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v19, 0.0, v11 - v12, v6);

}

- (CGSize)intrinsicContentSize
{
  int64_t v3;
  double v4;
  double v5;
  CGSize result;

  v3 = -[HKInteractiveChartAnnotationViewKeyValueLabel orientation](self, "orientation");
  if (v3 == 1)
  {
    -[HKInteractiveChartAnnotationViewKeyValueLabel _verticalInstrinsicContentSize](self, "_verticalInstrinsicContentSize");
  }
  else if (!v3)
  {
    -[HKInteractiveChartAnnotationViewKeyValueLabel _horizontalIntrinsicContentSize](self, "_horizontalIntrinsicContentSize");
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_horizontalIntrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[HKInteractiveChartAnnotationViewKeyValueLabel _compressedKeySize](self, "_compressedKeySize");
  v4 = v3;
  v6 = v5;
  -[HKInteractiveChartAnnotationViewKeyValueLabel valueLabel](self, "valueLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intrinsicContentSize");
  v9 = v8;
  v11 = v10;

  v12 = v4 + v9;
  if (v6 >= v11)
    v13 = v6;
  else
    v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)_verticalInstrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[HKInteractiveChartAnnotationViewKeyValueLabel _compressedKeySize](self, "_compressedKeySize");
  v4 = v3;
  v6 = v5;
  -[HKInteractiveChartAnnotationViewKeyValueLabel valueLabel](self, "valueLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intrinsicContentSize");
  v9 = v8;
  v11 = v10;

  if (v4 >= v9)
    v12 = v4;
  else
    v12 = v9;
  v13 = v6 + v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)_compressedKeySize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[HKInteractiveChartAnnotationViewKeyValueLabel keyLabel](self, "keyLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;
  v7 = v6;

  -[HKInteractiveChartAnnotationViewKeyValueLabel forwardChevronView](self, "forwardChevronView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -0.0;
  if (v8)
    v9 = v7;
  v10 = v5 + v9;
  v11 = v7;
  result.height = v11;
  result.width = v10;
  return result;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (HKSelectedRangeLabel)keyLabel
{
  return self->_keyLabel;
}

- (HKSelectedRangeLabel)valueLabel
{
  return self->_valueLabel;
}

- (id)tapOutBlock
{
  return self->_tapOutBlock;
}

- (UIImageView)forwardChevronView
{
  return self->_forwardChevronView;
}

- (void)setForwardChevronView:(id)a3
{
  objc_storeStrong((id *)&self->_forwardChevronView, a3);
}

- (UITapGestureRecognizer)tapOutRecognizer
{
  return self->_tapOutRecognizer;
}

- (void)setTapOutRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapOutRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapOutRecognizer, 0);
  objc_storeStrong((id *)&self->_forwardChevronView, 0);
  objc_storeStrong(&self->_tapOutBlock, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_keyLabel, 0);
}

@end
