@implementation AXLongTitleEditableTableCell

- (AXLongTitleEditableTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  AXLongTitleEditableTableCell *v5;
  AXLongTitleEditableTableCell *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXLongTitleEditableTableCell;
  v5 = -[PSEditableTableCell initWithStyle:reuseIdentifier:specifier:](&v9, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[PSTableCell titleLabel](v5, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfLines:", 0);

  }
  return v6;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  BOOL IsAccessibilityCategory;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  float v41;
  double v42;
  double v43;
  int v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  objc_super v52;
  uint64_t v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x1E0C80C00];
  v52.receiver = self;
  v52.super_class = (Class)AXLongTitleEditableTableCell;
  -[PSEditableTableCell layoutSubviews](&v52, sel_layoutSubviews);
  -[PSTableCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[AXLongTitleEditableTableCell traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

    if (!IsAccessibilityCategory)
    {
      -[AXLongTitleEditableTableCell editableTextField](self, "editableTextField");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "frame");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v53 = *MEMORY[0x1E0DC32A0];
      objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, &v53, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "text");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sizeWithAttributes:", v19);
      v22 = v21;

      if (v22 <= v15)
      {
        objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 1);
      }
      else
      {
        v51 = v13;
        v23 = v22 - v15;
        -[AXLongTitleEditableTableCell contentView](self, "contentView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "bounds");
        v26 = v25;
        v28 = v27;

        -[PSTableCell titleLabel](self, "titleLabel");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "frame");
        v31 = v30;
        v33 = v32;

        if (v33 - v23 >= v26 * 0.25)
          v34 = v33 - v23;
        else
          v34 = v26 * 0.25;
        objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 0);
        v35 = v33 - v34;
        -[PSTableCell titleLabel](self, "titleLabel");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "sizeThatFits:", v34, v28);
        v38 = v37;
        v40 = v39;

        v41 = (v28 - v40) * 0.5;
        v42 = floorf(v41);
        v43 = v15 + v35;
        v44 = -[AXLongTitleEditableTableCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
        v45 = v35 + 8.0;
        if (!v44)
          v45 = -0.0;
        v46 = v31 + v45;
        v47 = 0.0;
        if (!v44)
          v47 = v35;
        v48 = v11 - v47;
        -[PSTableCell titleLabel](self, "titleLabel");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setNumberOfLines:", 0);

        -[PSTableCell titleLabel](self, "titleLabel");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setFrame:", v46, v42, v38, v40);

        objc_msgSend(v9, "setFrame:", v48, v51, v43, v17);
      }

    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  BOOL IsAccessibilityCategory;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  objc_super v40;
  uint64_t v41;
  _QWORD v42[2];
  CGSize result;

  v42[1] = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)AXLongTitleEditableTableCell;
  -[AXLongTitleEditableTableCell sizeThatFits:](&v40, sel_sizeThatFits_, a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[PSTableCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    -[AXLongTitleEditableTableCell traitCollection](self, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredContentSizeCategory");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

    if (!IsAccessibilityCategory)
    {
      -[AXLongTitleEditableTableCell contentView](self, "contentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sizeThatFits:", v5, v7);
      v16 = v15;
      v18 = v17;

      -[AXLongTitleEditableTableCell layoutMargins](self, "layoutMargins");
      v20 = v16 - v19;
      -[AXLongTitleEditableTableCell layoutMargins](self, "layoutMargins");
      v22 = v20 - v21 + -8.0;
      v41 = *MEMORY[0x1E0DC32A0];
      objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      -[AXLongTitleEditableTableCell editableTextField](self, "editableTextField");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "text");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "sizeWithAttributes:", v24);
      v28 = v27;
      v30 = v29;

      if (v22 - v28 >= v16 * 0.25)
        v31 = v22 - v28;
      else
        v31 = v16 * 0.25;
      -[PSTableCell titleLabel](self, "titleLabel");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "sizeThatFits:", v31, v18);
      v34 = v33;

      if (v34 < v30)
        v34 = v30;
      -[AXLongTitleEditableTableCell layoutMargins](self, "layoutMargins");
      v36 = v34 + v35;
      -[AXLongTitleEditableTableCell layoutMargins](self, "layoutMargins");
      if (v7 < v36 + v37)
        v7 = v36 + v37;

    }
  }
  v38 = v5;
  v39 = v7;
  result.height = v39;
  result.width = v38;
  return result;
}

@end
