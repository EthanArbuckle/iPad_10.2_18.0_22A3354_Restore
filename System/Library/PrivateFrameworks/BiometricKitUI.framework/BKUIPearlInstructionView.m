@implementation BKUIPearlInstructionView

- (BKUIPearlInstructionView)init
{
  BKUIPearlInstructionView *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id WeakRetained;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _QWORD v25[2];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)BKUIPearlInstructionView;
  v2 = -[BKUIPearlInstructionView init](&v24, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB5B8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", 2);
    v5 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v5;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v5, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFont:", v6);

    objc_storeWeak((id *)&v2->_instructionLabel, v3);
    v7 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v8);

    objc_storeWeak((id *)&v2->_detailLabel, v7);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    WeakRetained = objc_loadWeakRetained((id *)&v2->_instructionLabel);
    v25[0] = WeakRetained;
    v10 = objc_loadWeakRetained((id *)&v2->_detailLabel);
    v25[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v16, "setTextAlignment:", 1);
          objc_msgSend(v16, "setNumberOfLines:", 0);
          objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setTextColor:", v17);

          objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[BKUIPearlInstructionView addSubview:](v2, "addSubview:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v13);
    }

    -[BKUIPearlInstructionView _configureConstraints](v2, "_configureConstraints");
    +[BKUIStyle _layoutMarginsForPearEnrollView](BKUIStyle, "_layoutMarginsForPearEnrollView");
    -[BKUIPearlInstructionView setLabelsHorizontalMargin:](v2, "setLabelsHorizontalMargin:");

  }
  return v2;
}

- (void)_configureConstraints
{
  UILabel **p_instructionLabel;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  UILabel **p_detailLabel;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  double v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id *location;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  _QWORD v45[9];

  v45[7] = *MEMORY[0x1E0C80C00];
  p_instructionLabel = &self->_instructionLabel;
  WeakRetained = objc_loadWeakRetained((id *)&self->_instructionLabel);
  objc_msgSend(WeakRetained, "widthAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlInstructionView widthAnchor](self, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlInstructionView setLabelsWidthConstraint:](self, "setLabelsWidthConstraint:", v7);

  v33 = (void *)MEMORY[0x1E0CB3718];
  -[BKUIPearlInstructionView labelsWidthConstraint](self, "labelsWidthConstraint");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v44;
  v43 = objc_loadWeakRetained((id *)p_instructionLabel);
  objc_msgSend(v43, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlInstructionView topAnchor](self, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, 16.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v40;
  v39 = objc_loadWeakRetained((id *)p_instructionLabel);
  objc_msgSend(v39, "centerXAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlInstructionView centerXAnchor](self, "centerXAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v36;
  location = (id *)p_instructionLabel;
  v35 = objc_loadWeakRetained((id *)p_instructionLabel);
  objc_msgSend(v35, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  p_detailLabel = &self->_detailLabel;
  v32 = objc_loadWeakRetained((id *)&self->_detailLabel);
  objc_msgSend(v32, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v29;
  v28 = objc_loadWeakRetained((id *)&self->_detailLabel);
  objc_msgSend(v28, "centerXAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlInstructionView centerXAnchor](self, "centerXAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v25;
  v24 = objc_loadWeakRetained((id *)&self->_detailLabel);
  objc_msgSend(v24, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained((id *)p_instructionLabel);
  objc_msgSend(v10, "widthAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v12;
  v13 = objc_loadWeakRetained((id *)&self->_detailLabel);
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlInstructionView bottomAnchor](self, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintLessThanOrEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activateConstraints:", v17);

  v18 = objc_loadWeakRetained((id *)p_detailLabel);
  objc_msgSend(v18, "firstBaselineAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_loadWeakRetained(location);
  objc_msgSend(v20, "lastBaselineAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, 33.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v23) = 1144750080;
  objc_msgSend(v22, "setPriority:", v23);
  objc_msgSend(v22, "setActive:", 1);

}

- (void)setDarkMode:(BOOL)a3
{
  id WeakRetained;
  id v5;
  id v6;

  self->_darkMode = a3;
  if (a3)
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_instructionLabel);
  objc_msgSend(WeakRetained, "setTextColor:", v6);

  v5 = objc_loadWeakRetained((id *)&self->_detailLabel);
  objc_msgSend(v5, "setTextColor:", v6);

}

- (void)setInstruction:(id)a3
{
  id v5;
  id WeakRetained;

  objc_storeStrong((id *)&self->_instruction, a3);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_instructionLabel);
  objc_msgSend(WeakRetained, "setText:", v5);

}

- (void)setDetail:(id)a3
{
  id v5;
  id WeakRetained;

  objc_storeStrong((id *)&self->_detail, a3);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_detailLabel);
  objc_msgSend(WeakRetained, "setText:", v5);

}

- (id)viewForFirstBaselineLayout
{
  return objc_loadWeakRetained((id *)&self->_instructionLabel);
}

- (id)viewForLastBaselineLayout
{
  return objc_loadWeakRetained((id *)&self->_detailLabel);
}

- (void)setLabelsHorizontalMargin:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  double v15;
  double v16;
  void *v17;
  id v18;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[BKUIPearlInstructionView labelsHorizontalMargin](self, "labelsHorizontalMargin");
  if (v11 != left || v8 != top || v10 != right || v9 != bottom)
  {
    self->_labelsHorizontalMargin.top = top;
    self->_labelsHorizontalMargin.left = left;
    self->_labelsHorizontalMargin.bottom = bottom;
    self->_labelsHorizontalMargin.right = right;
    -[BKUIPearlInstructionView superview](self, "superview");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "size");
    v16 = v15 - self->_labelsHorizontalMargin.left - self->_labelsHorizontalMargin.right;
    -[BKUIPearlInstructionView labelsWidthConstraint](self, "labelsWidthConstraint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setConstant:", v16);

  }
}

- (NSLayoutYAxisAnchor)instructionTextTopAnchor
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_instructionLabel);
  objc_msgSend(WeakRetained, "topAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSLayoutYAxisAnchor *)v3;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[BKUIPearlInstructionView size](self, "size");
  v4 = v3;
  -[BKUIPearlInstructionView instructionLabel](self, "instructionLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intrinsicContentSize");
  v7 = v6;
  -[BKUIPearlInstructionView detailLabel](self, "detailLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intrinsicContentSize");
  v10 = v7 + v9;

  v11 = v4;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (NSString)instruction
{
  return self->_instruction;
}

- (NSString)detail
{
  return self->_detail;
}

- (BOOL)darkMode
{
  return self->_darkMode;
}

- (UILabel)instructionLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_instructionLabel);
}

- (void)setInstructionLabel:(id)a3
{
  objc_storeWeak((id *)&self->_instructionLabel, a3);
}

- (UILabel)detailLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_detailLabel);
}

- (void)setDetailLabel:(id)a3
{
  objc_storeWeak((id *)&self->_detailLabel, a3);
}

- (UIEdgeInsets)labelsHorizontalMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_labelsHorizontalMargin.top;
  left = self->_labelsHorizontalMargin.left;
  bottom = self->_labelsHorizontalMargin.bottom;
  right = self->_labelsHorizontalMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSLayoutConstraint)labelsWidthConstraint
{
  return self->_labelsWidthConstraint;
}

- (void)setLabelsWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_labelsWidthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelsWidthConstraint, 0);
  objc_destroyWeak((id *)&self->_detailLabel);
  objc_destroyWeak((id *)&self->_instructionLabel);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_instruction, 0);
}

@end
