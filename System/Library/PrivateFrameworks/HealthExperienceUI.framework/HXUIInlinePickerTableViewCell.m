@implementation HXUIInlinePickerTableViewCell

- (HXUIInlinePickerTableViewCell)initWithTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HXUIInlinePickerTableViewCell *v7;
  void *v8;
  HXUIPickerLabelView *v9;
  HXUIPickerLabelView *contentLabel;
  void *v11;
  UIPickerView *v12;
  UIPickerView *picker;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19.receiver = self;
  v19.super_class = (Class)HXUIInlinePickerTableViewCell;
  v7 = -[HXUIInlinePickerTableViewCell initWithStyle:reuseIdentifier:](&v19, sel_initWithStyle_reuseIdentifier_, 0, v6);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HXUIInlinePickerTableViewCell setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[HXUIInlinePickerTableViewCell setSelectionStyle:](v7, "setSelectionStyle:", 0);
    v9 = objc_alloc_init(HXUIPickerLabelView);
    contentLabel = v7->_contentLabel;
    v7->_contentLabel = v9;

    -[HXUIPickerLabelView setText:](v7->_contentLabel, "setText:", v4);
    -[HXUIInlinePickerTableViewCell contentView](v7, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v7->_contentLabel);

    -[HXUIInlinePickerTableViewCell _contentLabelFrame](v7, "_contentLabelFrame");
    -[HXUIPickerLabelView setFrame:](v7->_contentLabel, "setFrame:");
    v12 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E0DC3AE0]);
    picker = v7->_picker;
    v7->_picker = v12;

    -[UIPickerView setAlpha:](v7->_picker, "setAlpha:", 0.0);
    -[HXUIInlinePickerTableViewCell contentView](v7, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v7->_picker);

    -[HXUIInlinePickerTableViewCell _pickerFrame](v7, "_pickerFrame");
    -[UIPickerView setFrame:](v7->_picker, "setFrame:");
    objc_opt_self();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)-[HXUIInlinePickerTableViewCell registerForTraitChanges:withHandler:](v7, "registerForTraitChanges:withHandler:", v16, &__block_literal_global);

  }
  return v7;
}

uint64_t __47__HXUIInlinePickerTableViewCell_initWithTitle___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setNeedsLayout");
}

- (CGRect)_contentLabelFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[HXUIInlinePickerTableViewCell bounds](self, "bounds");
  v4 = v3 + -30.0;
  -[HXUIInlinePickerTableViewCell contentLabelHeightForBoundsSize:](self, "contentLabelHeightForBoundsSize:", v3 + -30.0, 10000.0);
  v6 = v5;
  v7 = 15.0;
  v8 = 4.0;
  v9 = v4;
  result.size.height = v6;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)_pickerFrame
{
  CGFloat MaxY;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v11;
  CGRect result;

  -[HXUIInlinePickerTableViewCell _contentLabelFrame](self, "_contentLabelFrame");
  MaxY = CGRectGetMaxY(v11);
  -[HXUIInlinePickerTableViewCell bounds](self, "bounds");
  v5 = v4;
  -[UIPickerView sizeThatFits:](self->_picker, "sizeThatFits:", v4, 10000.0);
  v7 = v6;
  v8 = 0.0;
  v9 = MaxY;
  v10 = v5;
  result.size.height = v7;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HXUIInlinePickerTableViewCell;
  -[HXUIInlinePickerTableViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[HXUIInlinePickerTableViewCell _contentLabelFrame](self, "_contentLabelFrame");
  -[HXUIPickerLabelView setFrame:](self->_contentLabel, "setFrame:");
  -[HXUIInlinePickerTableViewCell _pickerFrame](self, "_pickerFrame");
  -[UIPickerView setFrame:](self->_picker, "setFrame:");
}

- (UIPickerView)pickerView
{
  return self->_picker;
}

- (void)setExpanded:(BOOL)a3
{
  double v5;
  id v6;

  self->_expanded = a3;
  v5 = 0.0;
  if (a3)
    v5 = 1.0;
  -[UIPickerView setAlpha:](self->_picker, "setAlpha:", v5);
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HXUIPickerLabelView setDetailTextColor:](self->_contentLabel, "setDetailTextColor:", v6);

}

- (void)setDisplayName:(id)a3
{
  -[HXUIPickerLabelView setText:](self->_contentLabel, "setText:", a3);
}

- (void)setValue:(id)a3
{
  -[HXUIPickerLabelView setDetailText:](self->_contentLabel, "setDetailText:", a3);
}

- (CGSize)contentLabelHeightForBoundsSize:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  v3 = a3.width + -30.0;
  if (v3 < 0.0)
    v3 = 0.0;
  -[HXUIPickerLabelView sizeThatFits:](self->_contentLabel, "sizeThatFits:", v3, a3.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[HXUIInlinePickerTableViewCell contentLabelHeightForBoundsSize:](self, "contentLabelHeightForBoundsSize:");
  v7 = v6;
  v9 = v8;
  if (-[HXUIInlinePickerTableViewCell expanded](self, "expanded"))
  {
    -[UIPickerView sizeThatFits:](self->_picker, "sizeThatFits:", width, height);
    v9 = v9 + v10;
    v7 = width;
  }
  v11 = v9 + 8.0;
  v12 = v7;
  result.height = v11;
  result.width = v12;
  return result;
}

- (double)expandedHeight
{
  CGRect v3;

  -[HXUIInlinePickerTableViewCell _pickerFrame](self, "_pickerFrame");
  return CGRectGetMaxY(v3) + 4.0;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_picker, 0);
  objc_storeStrong((id *)&self->_contentLabel, 0);
}

@end
