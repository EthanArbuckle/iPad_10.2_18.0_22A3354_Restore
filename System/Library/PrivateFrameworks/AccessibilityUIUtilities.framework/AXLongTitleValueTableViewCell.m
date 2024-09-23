@implementation AXLongTitleValueTableViewCell

- (AXLongTitleValueTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  AXLongTitleValueTableViewCell *v5;
  AXLongTitleValueTableViewCell *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXLongTitleValueTableViewCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v10, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[PSTableCell valueLabel](v5, "valueLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfLines:", 0);

    -[PSTableCell titleLabel](v6, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 0);

  }
  return v6;
}

- (void)layoutSubviews
{
  void *v3;
  NSString *v4;
  BOOL IsAccessibilityCategory;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  float v40;
  double v41;
  float v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)AXLongTitleValueTableViewCell;
  -[PSTableCell layoutSubviews](&v47, sel_layoutSubviews);
  -[AXLongTitleValueTableViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (!IsAccessibilityCategory)
  {
    -[AXLongTitleValueTableViewCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;

    -[AXLongTitleValueTableViewCell layoutMargins](self, "layoutMargins");
    v12 = v11;
    if (-[AXLongTitleValueTableViewCell accessoryType](self, "accessoryType"))
    {
      v12 = 0.0;
      if (AXProcessIsSetup())
      {
        -[AXLongTitleValueTableViewCell defaultCellContentTrailingPadding](self, "defaultCellContentTrailingPadding");
        v12 = v13;
      }
    }
    -[PSTableCell iconImageView](self, "iconImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell specifier](self, "specifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "propertyForKey:", *MEMORY[0x1E0D80870]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0.0;
    if (v16)
    {
      if (v14)
      {
        objc_msgSend(v14, "frame");
        if (v18 != 0.0)
        {
          objc_msgSend(v14, "frame");
          v20 = v19;
          -[AXLongTitleValueTableViewCell iconImageViewGap](self, "iconImageViewGap");
          v17 = v21 + v20;
        }
      }
    }
    v46 = v17;
    -[AXLongTitleValueTableViewCell layoutMargins](self, "layoutMargins");
    v23 = v8 - v22 - v12 + -6.0 - v17;
    -[PSTableCell valueLabel](self, "valueLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sizeThatFits:", v23 * 0.5, v10);
    v26 = v25;
    v27 = v8;
    v29 = v28;

    -[PSTableCell titleLabel](self, "titleLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "sizeThatFits:", v23 - v26, v10);
    v32 = v31;
    v34 = v33;

    -[PSTableCell valueLabel](self, "valueLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "frame");

    -[PSTableCell titleLabel](self, "titleLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "frame");
    v38 = v37;

    if (-[AXLongTitleValueTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      -[AXLongTitleValueTableViewCell layoutMargins](self, "layoutMargins");
      v38 = v27 - v39 - v46 - v32;
    }
    else
    {
      v12 = v27 - v26 - v12;
    }
    v40 = (v10 - v29) * 0.5;
    v41 = floorf(v40);
    v42 = (v10 - v34) * 0.5;
    v43 = floorf(v42);
    -[PSTableCell valueLabel](self, "valueLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setFrame:", v12, v41, v26, v29);

    -[PSTableCell titleLabel](self, "titleLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFrame:", v38, v43, v32, v34);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  BOOL IsAccessibilityCategory;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  NSString *v20;
  BOOL v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t);
  void *v57;
  AXLongTitleValueTableViewCell *v58;
  uint64_t *v59;
  double v60;
  double v61;
  uint64_t v62;
  double *v63;
  uint64_t v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PSTableCell specifier](self, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyForKey:", *MEMORY[0x1E0D80870]);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;
  if (v7)
  {
    v9 = (void *)v7;
    -[PSTableCell iconImageView](self, "iconImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v8 = 0;
      goto LABEL_8;
    }
    -[AXLongTitleValueTableViewCell traitCollection](self, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredContentSizeCategory");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

    if (IsAccessibilityCategory)
    {
      v8 = 1;
      goto LABEL_8;
    }
    -[PSTableCell valueLabel](self, "valueLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNumberOfLines:", 1);

    -[PSTableCell titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfLines:", 1);
  }

LABEL_8:
  v68.receiver = self;
  v68.super_class = (Class)AXLongTitleValueTableViewCell;
  -[AXLongTitleValueTableViewCell sizeThatFits:](&v68, sel_sizeThatFits_, width, height);
  v16 = v15;
  v18 = v17;
  -[AXLongTitleValueTableViewCell traitCollection](self, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "preferredContentSizeCategory");
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  v21 = UIContentSizeCategoryIsAccessibilityCategory(v20);

  if (!v21)
  {
    -[AXLongTitleValueTableViewCell contentView](self, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sizeThatFits:", v16, v18);
    v24 = v23;
    v26 = v25;

    v62 = 0;
    v63 = (double *)&v62;
    v64 = 0x4010000000;
    v65 = &unk_1BD8F08A9;
    v27 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v66 = *MEMORY[0x1E0C9D648];
    v67 = v27;
    v28 = 0.0;
    if (v8)
    {
      v54 = MEMORY[0x1E0C809B0];
      v55 = 3221225472;
      v56 = __46__AXLongTitleValueTableViewCell_sizeThatFits___block_invoke;
      v57 = &unk_1E76ABD70;
      v58 = self;
      v59 = &v62;
      v60 = v24;
      v61 = v26;
      AXPerformSafeBlock();
      v29 = v63[6];
      if (v29 != 0.0)
      {
        -[AXLongTitleValueTableViewCell iconImageViewGap](self, "iconImageViewGap", v54, 3221225472, __46__AXLongTitleValueTableViewCell_sizeThatFits___block_invoke, &unk_1E76ABD70, self, &v62, *(_QWORD *)&v24, *(_QWORD *)&v26, v62);
        v28 = v29 + v30;
      }
      -[PSTableCell valueLabel](self, "valueLabel", v54, v55, v56, v57, v58, v59, *(_QWORD *)&v60, *(_QWORD *)&v61);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setNumberOfLines:", 0);

      -[PSTableCell titleLabel](self, "titleLabel");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setNumberOfLines:", 0);

    }
    -[AXLongTitleValueTableViewCell layoutMargins](self, "layoutMargins");
    v34 = v33;
    if (-[AXLongTitleValueTableViewCell accessoryType](self, "accessoryType"))
    {
      v34 = 0.0;
      if (AXProcessIsSetup())
      {
        -[AXLongTitleValueTableViewCell defaultCellContentTrailingPadding](self, "defaultCellContentTrailingPadding");
        v34 = v35;
      }
    }
    -[AXLongTitleValueTableViewCell layoutMargins](self, "layoutMargins");
    v37 = v36;
    -[PSTableCell valueLabel](self, "valueLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v24 - v37 - v34 + -6.0 - v28;
    objc_msgSend(v38, "sizeThatFits:", v39 * 0.5, v26);
    v41 = v40;
    v43 = v42;

    -[PSTableCell titleLabel](self, "titleLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "sizeThatFits:", v39 - v41, v26);
    v46 = v45;

    -[AXLongTitleValueTableViewCell layoutMargins](self, "layoutMargins");
    v48 = v47;
    -[AXLongTitleValueTableViewCell layoutMargins](self, "layoutMargins");
    if (v46 >= v43)
      v50 = v46;
    else
      v50 = v43;
    v51 = v50 + v48 + v49;
    if (v18 < v51)
      v18 = v51;
    _Block_object_dispose(&v62, 8);
  }
  v52 = v16;
  v53 = v18;
  result.height = v53;
  result.width = v52;
  return result;
}

uint64_t __46__AXLongTitleValueTableViewCell_sizeThatFits___block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "imageRectForContentRect:", 0.0, 0.0, *(double *)(a1 + 48), *(double *)(a1 + 56));
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (double)iconImageViewGap
{
  void *v2;
  double v3;

  -[AXLongTitleValueTableViewCell traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom") == 3)
    v3 = 8.0;
  else
    v3 = 15.0;

  return v3;
}

- (double)defaultCellContentTrailingPadding
{
  return 8.0;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AXLongTitleValueTableViewCell;
  v3 = -[AXLongTitleValueTableViewCell accessibilityTraits](&v14, sel_accessibilityTraits);
  -[PSTableCell specifier](self, "specifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("VOCommandContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSTableCell specifier](self, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyForKey:", CFSTR("command"));
  v7 = objc_claimAutoreleasedReturnValue();

  -[PSTableCell specifier](self, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertyForKey:", CFSTR("AXLongTitleValueTableViewCellButtonBoolKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (-[PSTableCell type](self, "type") == 4 && (-[PSTableCell cellEnabled](self, "cellEnabled") & v10) == 1)
  {
    if (v5
      || (-[PSTableCell specifier](self, "specifier"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "detailControllerClass") | v7,
          v11,
          v12))
    {
      v3 |= *MEMORY[0x1E0DC4660];
    }
  }

  return v3;
}

@end
