@implementation EKEventDetailRecurrenceCell

- (id)_recurrenceLabel
{
  UILabel *recurrenceLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  recurrenceLabel = self->_recurrenceLabel;
  if (!recurrenceLabel)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_recurrenceLabel;
    self->_recurrenceLabel = v5;

    -[UILabel setNumberOfLines:](self->_recurrenceLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_recurrenceLabel, "setLineBreakMode:", 0);
    -[UILabel setTextAlignment:](self->_recurrenceLabel, "setTextAlignment:", 2);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_recurrenceLabel, "setFont:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_recurrenceLabel, "setTextColor:", v8);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_recurrenceLabel, "setBackgroundColor:", v9);

    -[EKEventDetailRecurrenceCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", self->_recurrenceLabel);

    recurrenceLabel = self->_recurrenceLabel;
  }
  return recurrenceLabel;
}

- (void)setRecurrenceString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKEventDetailRecurrenceCell _recurrenceLabel](self, "_recurrenceLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (id)_myTableView
{
  void *v2;
  void *v3;
  id v4;

  -[EKEventDetailRecurrenceCell superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)layoutForWidth:(double)a3 position:(int)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKEventDetailRecurrenceCell;
  -[EKEventDetailCell layoutForWidth:position:](&v6, sel_layoutForWidth_position_, *(_QWORD *)&a4);
  self->_lastLayoutWidth = a3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGRect v21;

  v20.receiver = self;
  v20.super_class = (Class)EKEventDetailRecurrenceCell;
  -[EKUITableViewCell layoutSubviews](&v20, sel_layoutSubviews);
  -[EKEventDetailRecurrenceCell _recurrenceLabel](self, "_recurrenceLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailRecurrenceCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[EKEventDetailRecurrenceCell _myTableView](self, "_myTableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "_backgroundInset");
    v16 = v15 + 11.0;
  }
  else
  {
    v16 = 11.0;
  }
  v21.origin.x = v6;
  v21.origin.y = v8;
  v21.size.width = v10;
  v21.size.height = v12;
  v17 = v16 + CGRectGetMaxX(v21) + 10.0;
  v18 = self->_lastLayoutWidth - v17 - v16;
  objc_msgSend(v3, "sizeThatFits:", v18, 3.40282347e38);
  -[UILabel setFrame:](self->_recurrenceLabel, "setFrame:", v17, 9.0, v18, v19);

}

- (double)height
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  -[EKEventDetailRecurrenceCell _recurrenceLabel](self, "_recurrenceLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;

  return v6 + v4 * 2.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recurrenceLabel, 0);
}

@end
