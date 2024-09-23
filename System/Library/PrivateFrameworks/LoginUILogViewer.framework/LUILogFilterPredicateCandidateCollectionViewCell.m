@implementation LUILogFilterPredicateCandidateCollectionViewCell

- (LUILogFilterPredicateCandidateCollectionViewCell)initWithFrame:(CGRect)a3
{
  LUILogFilterPredicateCandidateCollectionViewCell *v3;
  LUILogFilterPredicateCandidateCollectionViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LUILogFilterPredicateCandidateCollectionViewCell;
  v3 = -[LUILogFilterPredicateCandidateCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[LUILogFilterPredicateCandidateCollectionViewCell _setupUI](v3, "_setupUI");
  return v4;
}

- (void)_setupUI
{
  UILabel *v3;
  UILabel *titleLabel;
  id v5;

  -[LUILogFilterPredicateCandidateCollectionViewCell _createTitleLabel](self, "_createTitleLabel");
  v3 = (UILabel *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[LUILogFilterPredicateCandidateCollectionViewCell contentView](self, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_titleLabel);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LUILogFilterPredicateCandidateCollectionViewCell;
  -[LUILogFilterPredicateCandidateCollectionViewCell setSelected:](&v9, sel_setSelected_);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "lightGrayColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LUILogFilterPredicateCandidateCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x24BDF6950], "darkGrayColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LUILogFilterPredicateCandidateCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v6);

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LUILogFilterPredicateCandidateCollectionViewCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

}

- (void)layoutSubViews
{
  CGFloat v3;
  double Height;
  id v5;
  CGRect v6;
  CGRect v7;

  -[LUILogFilterPredicateCandidateCollectionViewCell frame](self, "frame");
  v3 = CGRectGetWidth(v6) + -20.0;
  -[LUILogFilterPredicateCandidateCollectionViewCell frame](self, "frame");
  Height = CGRectGetHeight(v7);
  -[LUILogFilterPredicateCandidateCollectionViewCell titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", 10.0, 0.0, v3, Height);

}

- (id)_createTitleLabel
{
  void *v3;
  CGFloat v4;
  void *v5;
  void *v6;
  CGRect v8;
  CGRect v9;

  v3 = (void *)objc_opt_new();
  -[LUILogFilterPredicateCandidateCollectionViewCell frame](self, "frame");
  v4 = CGRectGetWidth(v8) + -20.0;
  -[LUILogFilterPredicateCandidateCollectionViewCell frame](self, "frame");
  objc_msgSend(v3, "setFrame:", 10.0, 0.0, v4, CGRectGetHeight(v9));
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 17.0, *MEMORY[0x24BDF7880]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v5);

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v6);

  objc_msgSend(v3, "setTextAlignment:", 1);
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  return v3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
