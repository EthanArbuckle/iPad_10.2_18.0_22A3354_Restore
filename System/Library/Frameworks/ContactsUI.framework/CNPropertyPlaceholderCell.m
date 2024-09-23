@implementation CNPropertyPlaceholderCell

- (id)labelView
{
  UILabel *label;
  UILabel *v4;
  UILabel *v5;

  label = self->_label;
  if (!label)
  {
    -[CNLabeledCell standardLabelView](self, "standardLabelView");
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_label;
    self->_label = v4;

    label = self->_label;
  }
  return label;
}

- (BOOL)shouldPerformDefaultAction
{
  return 1;
}

- (void)setCardGroupItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[CNContactCell cardGroupItem](self, "cardGroupItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)CNPropertyPlaceholderCell;
    -[CNContactCell setCardGroupItem:](&v8, sel_setCardGroupItem_, v4);
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyPlaceholderCell label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

  }
}

- (double)minCellHeight
{
  return 44.0;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

+ (BOOL)shouldIndentWhileEditing
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1;
}

@end
