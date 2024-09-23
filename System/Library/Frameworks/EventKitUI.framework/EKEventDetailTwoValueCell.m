@implementation EKEventDetailTwoValueCell

- (EKEventDetailTwoValueCell)initWithEvent:(id)a3 editable:(BOOL)a4 platformStyle:(int)a5
{
  _BOOL8 v6;
  id v8;
  EKEventDetailTwoValueCell *v9;
  EKEventDetailTwoValueCell *v10;
  objc_super v12;
  objc_super v13;

  v6 = a4;
  v8 = a3;
  LODWORD(self->_value2View) = a5;
  if ((a5 - 1) >= 2)
  {
    if (a5)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v13.receiver = self;
    v13.super_class = (Class)EKEventDetailTwoValueCell;
    v9 = -[EKEventDetailCell initWithEvent:editable:](&v13, sel_initWithEvent_editable_, v8, v6);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)EKEventDetailTwoValueCell;
    v9 = -[EKEventDetailCell initWithEvent:editable:style:](&v12, sel_initWithEvent_editable_style_, v8, v6, 1);
  }
  self = v9;
  v10 = self;
LABEL_7:

  return v10;
}

- (unsigned)visibleItems
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;

  -[EKEventDetailTwoValueCell valueView](self, "valueView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4 != 0;
  -[EKEventDetailTwoValueCell value2View](self, "value2View");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    return v5 | 2;
  else
    return v5;
}

- (BOOL)update
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;

  v3 = -[EKEventDetailCell isEditable](self, "isEditable");
  -[EKEventDetailTwoValueCell setAccessoryType:](self, "setAccessoryType:", v3);
  if (!*(&self->super._lastLaidOutPosition + 1))
  {
    -[EKEventDetailTwoValueCell textLabel](self, "textLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventDetailTwoValueCell textLabel](self, "textLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = v6;
    }
    else
    {
      -[EKEventDetailTwoValueCell titleView](self, "titleView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTextColor:", v11);

      -[EKEventDetailTwoValueCell valueView](self, "valueView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x1E0DC4A98];
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFont:", v14);

      -[EKEventDetailTwoValueCell valueView](self, "valueView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTextColor:", v16);

      -[EKEventDetailTwoValueCell value2View](self, "value2View");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFont:", v18);

      -[EKEventDetailTwoValueCell value2View](self, "value2View");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v9 = v8;
    }
    objc_msgSend(v7, "setTextColor:", v9);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pointSize");
    v21 = v20;

    v22 = *(void **)&self->_style;
    if (v21 >= 18.5)
    {
      objc_msgSend(v22, "setNumberOfLines:", 0);
      -[UILabel setNumberOfLines:](self->_titleView, "setNumberOfLines:", 0);
      -[UILabel setNumberOfLines:](self->_valueView, "setNumberOfLines:", 0);
      objc_msgSend(*(id *)&self->_style, "setLineBreakMode:", 0);
      -[UILabel setLineBreakMode:](self->_titleView, "setLineBreakMode:", 0);
      -[UILabel setLineBreakMode:](self->_valueView, "setLineBreakMode:", 0);
    }
    else
    {
      objc_msgSend(v22, "setNumberOfLines:", 1);
      -[UILabel setNumberOfLines:](self->_titleView, "setNumberOfLines:", 1);
      -[UILabel setNumberOfLines:](self->_valueView, "setNumberOfLines:", 1);
    }
  }
  return -[EKEventDetailTwoValueCell visibleItems](self, "visibleItems") || v3;
}

- (id)titleView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = *(void **)&self->_style;
  if (!v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    v5 = *(void **)&self->_style;
    *(_QWORD *)&self->_style = v4;

    v6 = *(void **)&self->_style;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v7);

    objc_msgSend(*(id *)&self->_style, "setBackgroundColor:", 0);
    v8 = *(void **)&self->_style;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHighlightedTextColor:", v9);

    objc_msgSend(*(id *)&self->_style, "setOpaque:", 0);
    v3 = *(void **)&self->_style;
  }
  return v3;
}

- (id)valueView
{
  UILabel *titleView;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;

  titleView = self->_titleView;
  if (!titleView)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    v5 = self->_titleView;
    self->_titleView = v4;

    v6 = self->_titleView;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6, "setTextColor:", v7);

    -[UILabel setBackgroundColor:](self->_titleView, "setBackgroundColor:", 0);
    -[UILabel setOpaque:](self->_titleView, "setOpaque:", 0);
    titleView = self->_titleView;
  }
  return titleView;
}

- (id)value2View
{
  UILabel *valueView;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;

  valueView = self->_valueView;
  if (!valueView)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    v5 = self->_valueView;
    self->_valueView = v4;

    v6 = self->_valueView;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6, "setTextColor:", v7);

    -[UILabel setBackgroundColor:](self->_valueView, "setBackgroundColor:", 0);
    -[UILabel setOpaque:](self->_valueView, "setOpaque:", 0);
    valueView = self->_valueView;
  }
  return valueView;
}

- (int)twoValueCellStyle
{
  return (int)self->_value2View;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKEventDetailTwoValueCell;
  -[EKUITableViewCell layoutSubviews](&v5, sel_layoutSubviews);
  -[EKEventDetailTwoValueCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[EKEventDetailTwoValueCell _layoutForWidth:](self, "_layoutForWidth:", v4);

}

- (double)_layoutForWidth:(double)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  char IsLeftToRight;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  char v28;
  double v29;
  double v30;
  double v31;
  char v32;
  UILabel *valueView;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v41;
  double v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  -[EKEventDetailCell detailsLeftInset](self, "detailsLeftInset");
  v6 = v5;
  -[EKEventDetailTwoValueCell titleView](self, "titleView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailTwoValueCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v7);

  v9 = *MEMORY[0x1E0C9D648];
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[EKEventDetailTwoValueCell layoutMargins](self, "layoutMargins");
  v13 = a3 - v12;
  -[EKEventDetailTwoValueCell layoutMargins](self, "layoutMargins");
  v42 = v13 - v14;
  objc_msgSend(*(id *)&self->_style, "setFrame:", v9, v10);
  objc_msgSend(*(id *)&self->_style, "sizeToFit");
  objc_msgSend(v7, "frame");
  v16 = v15;
  v18 = v17;
  IsLeftToRight = CalInterfaceIsLeftToRight();
  v20 = v6;
  if ((IsLeftToRight & 1) == 0)
  {
    objc_msgSend(*(id *)&self->_style, "bounds", v6);
    v20 = a3 - v6 - CGRectGetWidth(v43);
  }
  objc_msgSend(v7, "setFrame:", v20, 11.0, v16, v18);
  objc_msgSend((id)objc_opt_class(), "detailsPostLabelSpace");
  v22 = v18 + 11.0 + v21;
  -[UILabel setFrame:](self->_titleView, "setFrame:", v9, v10, v42, v11);
  -[UILabel sizeToFit](self->_titleView, "sizeToFit");
  -[EKEventDetailTwoValueCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", self->_titleView);

  -[UILabel frame](self->_titleView, "frame");
  v25 = v24;
  v27 = v26;
  -[UILabel sizeToFit](self->_titleView, "sizeToFit");
  v28 = CalInterfaceIsLeftToRight();
  v29 = v6;
  if ((v28 & 1) == 0)
  {
    -[UILabel bounds](self->_titleView, "bounds", v6);
    v29 = a3 - v6 - CGRectGetWidth(v44);
  }
  -[UILabel setFrame:](self->_titleView, "setFrame:", v29, v22, v25, v27);
  -[UILabel frame](self->_titleView, "frame");
  v31 = v30;
  v32 = -[EKEventDetailTwoValueCell visibleItems](self, "visibleItems");
  valueView = self->_valueView;
  if ((v32 & 2) != 0)
  {
    v41 = a3;
    -[UILabel setFrame:](valueView, "setFrame:", v9, v10, v42, v11);
    -[UILabel sizeToFit](self->_valueView, "sizeToFit");
    -[EKEventDetailTwoValueCell contentView](self, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addSubview:", self->_valueView);

    v22 = v22 + v31 + 1.0;
    -[UILabel frame](self->_valueView, "frame");
    v36 = v35;
    v38 = v37;
    -[UILabel sizeToFit](self->_valueView, "sizeToFit");
    if ((CalInterfaceIsLeftToRight() & 1) == 0)
    {
      -[UILabel bounds](self->_valueView, "bounds");
      v6 = v41 - v6 - CGRectGetWidth(v45);
    }
    -[UILabel setFrame:](self->_valueView, "setFrame:", v6, v22, v36, v38);
    -[UILabel frame](self->_valueView, "frame");
    v31 = v39;
  }
  else
  {
    -[UILabel removeFromSuperview](valueView, "removeFromSuperview");
  }

  return v31 + v22;
}

- (void)layoutForWidth:(double)a3 position:(int)a4
{
  char v4;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  objc_super v17;

  v4 = a4;
  v17.receiver = self;
  v17.super_class = (Class)EKEventDetailTwoValueCell;
  -[EKEventDetailCell layoutForWidth:position:](&v17, sel_layoutForWidth_position_);
  if (-[EKEventDetailTwoValueCell visibleItems](self, "visibleItems"))
  {
    -[EKEventDetailTwoValueCell _layoutForWidth:](self, "_layoutForWidth:", a3);
    v8 = v7;
    -[EKEventDetailTwoValueCell frame](self, "frame");
    v10 = v9;
    v12 = v11;
    if ((v4 & 4) != 0)
    {
      v14 = ceil(v8);
      v15 = (void *)objc_opt_class();
      if ((v4 & 1) != 0)
        objc_msgSend(v15, "detailsTopVerticalInset");
      else
        objc_msgSend(v15, "detailsBottomVerticalInset");
      v13 = v14 + v16;
    }
    else
    {
      v13 = ceil(v8 + 7.0);
    }
    -[EKEventDetailTwoValueCell setFrame:](self, "setFrame:", v10, v12, a3, v13);
  }
  else
  {
    -[UILabel removeFromSuperview](self->_titleView, "removeFromSuperview");
    -[UILabel removeFromSuperview](self->_valueView, "removeFromSuperview");
    objc_msgSend(*(id *)&self->_style, "removeFromSuperview");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
