@implementation CNPropertyAlertEditingCell

- (BOOL)allowsCellSelection
{
  return 1;
}

- (double)minCellHeight
{
  return 44.0;
}

- (id)variableConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v11.receiver = self;
  v11.super_class = (Class)CNPropertyAlertEditingCell;
  -[CNLabeledCell variableConstraints](&v11, sel_variableConstraints);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0CB3718];
    -[CNPropertySimpleCell labelView](self, "labelView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyAlertEditingCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 10, 0, v8, 10, 1.0, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

  }
  return v5;
}

+ (BOOL)wantsHorizontalLayout
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1;
}

@end
