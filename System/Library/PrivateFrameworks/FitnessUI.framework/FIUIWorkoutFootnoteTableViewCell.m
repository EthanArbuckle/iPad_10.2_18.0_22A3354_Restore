@implementation FIUIWorkoutFootnoteTableViewCell

+ (double)preferredHeight
{
  return 45.0;
}

- (FIUIWorkoutFootnoteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  FIUIWorkoutFootnoteTableViewCell *v4;
  void *v5;
  UILabel *v6;
  UILabel *titleLabel;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  UILabel *v12;
  UILabel *footnoteLabel;
  void *v14;
  void *v15;
  void *v16;
  FIUIDividerView *v17;
  uint64_t v18;
  UIView *dividerView;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)FIUIWorkoutFootnoteTableViewCell;
  v4 = -[FIUIWorkoutFootnoteTableViewCell initWithStyle:reuseIdentifier:](&v22, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIWorkoutFootnoteTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v6;

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v8);

    v9 = *MEMORY[0x24BEBE1F0];
    objc_msgSend(MEMORY[0x24BEBB520], "defaultFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v10);

    -[FIUIWorkoutFootnoteTableViewCell contentView](v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v4->_titleLabel);

    v12 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    footnoteLabel = v4->_footnoteLabel;
    v4->_footnoteLabel = v12;

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_footnoteLabel, "setTextColor:", v14);

    objc_msgSend(MEMORY[0x24BEBB520], "defaultFontForTextStyle:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_footnoteLabel, "setFont:", v15);

    -[FIUIWorkoutFootnoteTableViewCell contentView](v4, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v4->_footnoteLabel);

    v17 = [FIUIDividerView alloc];
    v18 = -[FIUIDividerView initWithFrame:](v17, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    dividerView = v4->_dividerView;
    v4->_dividerView = (UIView *)v18;

    -[FIUIWorkoutFootnoteTableViewCell contentView](v4, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v4->_dividerView);

  }
  return v4;
}

- (void)setTitleText:(id)a3
{
  NSString *v4;
  NSString *titleText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  titleText = self->_titleText;
  self->_titleText = v4;

  -[UILabel setText:](self->_titleLabel, "setText:", self->_titleText);
  -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
  -[FIUIWorkoutFootnoteTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setFootnoteText:(id)a3
{
  NSString *v4;
  NSString *footnoteText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  footnoteText = self->_footnoteText;
  self->_footnoteText = v4;

  -[UILabel setText:](self->_footnoteLabel, "setText:", self->_footnoteText);
  -[UILabel sizeToFit](self->_footnoteLabel, "sizeToFit");
  -[FIUIWorkoutFootnoteTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGRect v16;

  v15.receiver = self;
  v15.super_class = (Class)FIUIWorkoutFootnoteTableViewCell;
  -[FIUIWorkoutFootnoteTableViewCell layoutSubviews](&v15, sel_layoutSubviews);
  -[FIUIWorkoutFootnoteTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UILabel _setFirstLineBaselineFrameOriginY:](self->_titleLabel, "_setFirstLineBaselineFrameOriginY:", 18.0);
  -[UILabel frame](self->_titleLabel, "frame");
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 5.5);
  -[UILabel _firstLineBaselineFrameOriginY](self->_titleLabel, "_firstLineBaselineFrameOriginY");
  -[UILabel _setFirstLineBaselineFrameOriginY:](self->_footnoteLabel, "_setFirstLineBaselineFrameOriginY:", v12 + 17.0);
  -[UILabel frame](self->_footnoteLabel, "frame");
  -[UILabel setFrame:](self->_footnoteLabel, "setFrame:", 5.5);
  -[UIView sizeThatFits:](self->_dividerView, "sizeThatFits:", v9 + 5.5 * -2.0, 1.79769313e308);
  v14 = v13;
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  -[UIView setFrame:](self->_dividerView, "setFrame:", 5.5, CGRectGetMaxY(v16) - v14, v9 + 5.5 * -2.0, v14);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)footnoteText
{
  return self->_footnoteText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footnoteText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
