@implementation iFBAResponseDetailHeaderView

- (iFBAResponseDetailHeaderView)initWithCoder:(id)a3
{
  iFBAResponseDetailHeaderView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[2];

  v11.receiver = self;
  v11.super_class = (Class)iFBAResponseDetailHeaderView;
  v3 = -[iFBAResponseDetailHeaderView initWithCoder:](&v11, "initWithCoder:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2));
    v12[0] = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v12[1] = v5;
    v13[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
    v13[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _dynamicColorWithColorsByTraitCollection:](UIColor, "_dynamicColorWithColorsByTraitCollection:", v8));
    -[iFBAResponseDetailHeaderView setBackgroundColor:](v3, "setBackgroundColor:", v9);

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double Width;
  void *v5;
  objc_super v6;
  CGRect v7;

  v6.receiver = self;
  v6.super_class = (Class)iFBAResponseDetailHeaderView;
  -[iFBAResponseDetailHeaderView layoutSubviews](&v6, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAResponseDetailHeaderView titleLabel](self, "titleLabel"));
  objc_msgSend(v3, "frame");
  Width = CGRectGetWidth(v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAResponseDetailHeaderView titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setPreferredMaxLayoutWidth:", Width);

}

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)iFBAResponseDetailHeaderView;
  -[iFBAResponseDetailHeaderView awakeFromNib](&v9, "awakeFromNib");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAResponseDetailHeaderView titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setTextColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 20.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", UIFontTextStyleHeadline));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scaledFontForFont:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAResponseDetailHeaderView titleLabel](self, "titleLabel"));
  objc_msgSend(v8, "setFont:", v7);

}

- (iFBAResponseDetailHeaderView)initWithContentItem:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  iFBAResponseDetailHeaderView *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (objc_class *)objc_opt_class(self);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "loadNibNamed:owner:options:", v8, self, 0));
  v10 = (iFBAResponseDetailHeaderView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", 0));

  if (v10)
    -[iFBAResponseDetailHeaderView updateWithItem:](v10, "updateWithItem:", v4);

  return v10;
}

- (void)updateWithItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[iFBAResponseDetailHeaderView setRepresentedItem:](self, "setRepresentedItem:", v14);
  if (v14)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "displayTitle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAResponseDetailHeaderView titleLabel](self, "titleLabel"));
    objc_msgSend(v5, "setText:", v4);

    if (objc_msgSend(v14, "isClosedFeedback"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAResponseDetailHeaderView stackView](self, "stackView"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAResponseDetailHeaderView closedLabel](self, "closedLabel"));
      objc_msgSend(v6, "insertArrangedSubview:atIndex:", v7, 1);

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CLOSED_FEEDBACK_STATE"), &stru_1000EA660, FBKCommonStrings));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAResponseDetailHeaderView closedLabel](self, "closedLabel"));
      objc_msgSend(v10, "setText:", v9);

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAResponseDetailHeaderView closedLabel](self, "closedLabel"));
      objc_msgSend(v13, "setText:", &stru_1000EA660);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAResponseDetailHeaderView stackView](self, "stackView"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAResponseDetailHeaderView closedLabel](self, "closedLabel"));
      objc_msgSend(v8, "removeArrangedSubview:", v9);
    }

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAResponseDetailHeaderView titleLabel](self, "titleLabel"));
    objc_msgSend(v11, "setText:", &stru_1000EA660);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAResponseDetailHeaderView closedLabel](self, "closedLabel"));
    objc_msgSend(v12, "setText:", &stru_1000EA660);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAResponseDetailHeaderView closedLabel](self, "closedLabel"));
    objc_msgSend(v8, "setText:", &stru_1000EA660);
  }

  -[iFBAResponseDetailHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_titleLabel);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_titleLabel, a3);
}

- (UILabel)closedLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_closedLabel);
}

- (void)setClosedLabel:(id)a3
{
  objc_storeWeak((id *)&self->_closedLabel, a3);
}

- (FBKContentItem)representedItem
{
  return self->_representedItem;
}

- (void)setRepresentedItem:(id)a3
{
  objc_storeStrong((id *)&self->_representedItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representedItem, 0);
  objc_destroyWeak((id *)&self->_closedLabel);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
