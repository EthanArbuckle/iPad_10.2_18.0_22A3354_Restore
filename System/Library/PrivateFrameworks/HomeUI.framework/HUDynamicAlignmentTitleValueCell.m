@implementation HUDynamicAlignmentTitleValueCell

- (BOOL)useVerticalLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  double v21;
  double v22;
  void *v23;
  void *v24;
  double Width;
  void *v26;
  void *v27;
  CGRect v29;

  -[HUTitleValueCell labelsStackView](self, "labelsStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAxis:", 0);

  -[HUTitleValueCell labelsStackView](self, "labelsStackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlignment:", 2);

  -[HUTitleValueCell labelsStackView](self, "labelsStackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDistribution:", 3);

  -[HUTitleValueCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", 1);

  -[HUTitleValueCell valueLabel](self, "valueLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNumberOfLines:", 1);

  v8 = 2
     * (-[HUDynamicAlignmentTitleValueCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 0);
  -[HUTitleValueCell valueLabel](self, "valueLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextAlignment:", v8);

  -[HUTitleValueCell titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUTitleValueCell valueLabel](self, "valueLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUDynamicAlignmentTitleValueCell layoutOptions](self, "layoutOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "longestPossibleTitleText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleValueCell titleLabel](self, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v15);

  -[HUDynamicAlignmentTitleValueCell layoutOptions](self, "layoutOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "longestPossibleValueText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTitleValueCell valueLabel](self, "valueLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v18);

  -[HUTitleValueCell labelsStackView](self, "labelsStackView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0CEB980], *(double *)(MEMORY[0x1E0CEB980] + 8));
  v22 = v21;

  -[HUDynamicAlignmentTitleValueCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "readableContentGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "layoutFrame");
  Width = CGRectGetWidth(v29);

  -[HUTitleValueCell titleLabel](self, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setText:", v11);

  -[HUTitleValueCell valueLabel](self, "valueLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setText:", v13);

  return v22 > Width;
}

- (void)_ensureCorrectHeaderViewOrientation
{
  void *v2;
  void *v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;

  -[HUTitleValueCell titleLabel](self, "titleLabel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[HUTitleValueCell valueLabel](self, "valueLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[HUTitleValueCell titleLabel](self, "titleLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");
      if (v10)
      {
        -[HUTitleValueCell valueLabel](self, "valueLabel");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "text");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v3, "length"))
          v11 = 16.0;
        else
          v11 = 0.0;
      }
      else
      {
        v11 = 0.0;
      }
      -[HUTitleValueCell labelsStackView](self, "labelsStackView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSpacing:", v11);

      if (v10)
      {

      }
      v13 = -[HUDynamicAlignmentTitleValueCell useVerticalLayout](self, "useVerticalLayout");
      -[HUTitleValueCell labelsStackView](self, "labelsStackView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v13)
      {
        objc_msgSend(v14, "setAxis:", 1);

        -[HUTitleValueCell labelsStackView](self, "labelsStackView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAlignment:", 0);

        -[HUTitleValueCell labelsStackView](self, "labelsStackView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setDistribution:", 0);

        -[HUTitleValueCell titleLabel](self, "titleLabel");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setNumberOfLines:", 0);

        -[HUTitleValueCell valueLabel](self, "valueLabel");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setNumberOfLines:", 0);

        -[HUTitleValueCell valueLabel](self, "valueLabel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v20;
        v21 = 4;
      }
      else
      {
        objc_msgSend(v14, "setAxis:", 0);

        -[HUTitleValueCell labelsStackView](self, "labelsStackView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setAlignment:", 2);

        -[HUTitleValueCell labelsStackView](self, "labelsStackView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setDistribution:", 3);

        -[HUTitleValueCell titleLabel](self, "titleLabel");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setNumberOfLines:", 1);

        -[HUTitleValueCell valueLabel](self, "valueLabel");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setNumberOfLines:", 1);

        v26 = 2
            * (-[HUDynamicAlignmentTitleValueCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 0);
        -[HUTitleValueCell valueLabel](self, "valueLabel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v20;
        v21 = v26;
      }
      objc_msgSend(v20, "setTextAlignment:", v21);

    }
  }
}

- (HUDynamicAlignmentTitleValueCellLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (void)setLayoutOptions:(id)a3
{
  objc_storeStrong((id *)&self->_layoutOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end
