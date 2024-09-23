@implementation HUSectionHeaderFooterCell

- (HUSectionHeaderFooterCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  HUSectionHeaderFooterCell *v7;
  HUItemTableSectionHeaderFooterView *v8;
  HUItemTableSectionHeaderFooterView *headerFooterView;
  double v10;
  double v11;
  double v12;
  double v13;
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
  void *v28;
  void *v29;
  void *v30;
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
  id v41;
  objc_super v42;
  _QWORD v43[6];

  v43[4] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v42.receiver = self;
  v42.super_class = (Class)HUSectionHeaderFooterCell;
  v7 = -[HUSectionHeaderFooterCell initWithStyle:reuseIdentifier:](&v42, sel_initWithStyle_reuseIdentifier_, a3, v6);
  if (v7)
  {
    v8 = -[HUItemTableSectionHeaderFooterView initWithReuseIdentifier:]([HUItemTableSectionHeaderFooterView alloc], "initWithReuseIdentifier:", v6);
    headerFooterView = v7->_headerFooterView;
    v7->_headerFooterView = v8;

    v10 = *MEMORY[0x1E0CEB4B0];
    v11 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v12 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v13 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    -[HUSectionHeaderFooterCell headerFooterView](v7, "headerFooterView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setIndentationInset:", v10, v11, v12, v13);

    -[HUSectionHeaderFooterCell contentView](v7, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSectionHeaderFooterCell headerFooterView](v7, "headerFooterView");
    v41 = v6;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "naui_addAutoLayoutSubview:", v16);

    v31 = (void *)MEMORY[0x1E0CB3718];
    -[HUSectionHeaderFooterCell contentView](v7, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSectionHeaderFooterCell headerFooterView](v7, "headerFooterView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v36;
    -[HUSectionHeaderFooterCell contentView](v7, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSectionHeaderFooterCell headerFooterView](v7, "headerFooterView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v30;
    -[HUSectionHeaderFooterCell contentView](v7, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSectionHeaderFooterCell headerFooterView](v7, "headerFooterView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v19;
    -[HUSectionHeaderFooterCell contentView](v7, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSectionHeaderFooterCell headerFooterView](v7, "headerFooterView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "activateConstraints:", v25);

    v6 = v41;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSectionHeaderFooterCell setBackgroundColor:](v7, "setBackgroundColor:", v26);

  }
  return v7;
}

- (void)willMoveToSuperview:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUSectionHeaderFooterCell;
  -[HUSectionHeaderFooterCell willMoveToSuperview:](&v9, sel_willMoveToSuperview_, v4);
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  -[HUSectionHeaderFooterCell headerFooterView](self, "headerFooterView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTableView:", v7);

  -[HUSectionHeaderFooterCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[HUSectionHeaderFooterCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[HUSectionHeaderFooterCell headerFooterView](self, "headerFooterView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a4;
  *(float *)&v11 = a5;
  objc_msgSend(v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  LODWORD(v2) = 1148846080;
  LODWORD(v3) = 1148846080;
  -[HUSectionHeaderFooterCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), v2, v3);
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  -[HUSectionHeaderFooterCell headerFooterView](self, "headerFooterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForReuse");

  v4.receiver = self;
  v4.super_class = (Class)HUSectionHeaderFooterCell;
  -[HUSectionHeaderFooterCell prepareForReuse](&v4, sel_prepareForReuse);
}

- (BOOL)prefersSeparatorsHidden
{
  return 1;
}

- (HUItemTableSectionHeaderFooterView)headerFooterView
{
  return self->_headerFooterView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerFooterView, 0);
}

@end
