@implementation LUIPaneHeaderView

- (LUIPaneHeaderView)initWithFrame:(CGRect)a3
{
  LUIPaneHeaderView *v3;
  id v4;
  double y;
  double width;
  double height;
  UILabel *v8;
  UILabel *mTitleLabel;
  UILabel *v10;
  void *v11;
  void *v12;
  UILabel *v13;
  UILabel *mSubTitleLabel;
  void *v15;
  UILabel *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  UIStackView *v21;
  UIStackView *mStackView;
  UIStackView *v23;
  void *v24;
  UIView *v25;
  UIView *mSeperatorView;
  UIView *v27;
  void *v28;
  void *v29;
  objc_super v31;
  _QWORD v32[2];

  v31.receiver = self;
  v31.super_class = (Class)LUIPaneHeaderView;
  v3 = -[LUIPaneHeaderView initWithFrame:](&v31, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v8 = (UILabel *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    mTitleLabel = v3->mTitleLabel;
    v3->mTitleLabel = v8;

    -[UILabel setLineBreakMode:](v3->mTitleLabel, "setLineBreakMode:", 4);
    v10 = v3->mTitleLabel;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    objc_msgSend(v11, "headerTitleMinimumScaleFactor");
    -[UILabel setMinimumScaleFactor:](v10, "setMinimumScaleFactor:");

    -[UILabel setAdjustsFontSizeToFitWidth:](v3->mTitleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    objc_msgSend(v12, "applyThemeToTitleLabel:", v3->mTitleLabel);

    v13 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    mSubTitleLabel = v3->mSubTitleLabel;
    v3->mSubTitleLabel = v13;

    -[UILabel setNumberOfLines:](v3->mSubTitleLabel, "setNumberOfLines:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    objc_msgSend(v15, "applyThemeToLabel:", v3->mSubTitleLabel);

    -[UILabel setTextAlignment:](v3->mSubTitleLabel, "setTextAlignment:", 1);
    -[UILabel setMinimumScaleFactor:](v3->mSubTitleLabel, "setMinimumScaleFactor:", 0.0);
    -[UILabel setAdjustsFontSizeToFitWidth:](v3->mSubTitleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v16 = v3->mSubTitleLabel;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "headerSubTitleFont"));
    -[UILabel setFont:](v16, "setFont:", v18);

    v19 = objc_alloc((Class)UIStackView);
    v32[0] = v3->mTitleLabel;
    v32[1] = v3->mSubTitleLabel;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 2));
    v21 = (UIStackView *)objc_msgSend(v19, "initWithArrangedSubviews:", v20);
    mStackView = v3->mStackView;
    v3->mStackView = v21;

    -[UIStackView setAxis:](v3->mStackView, "setAxis:", 1);
    -[UIStackView setDistribution:](v3->mStackView, "setDistribution:", 0);
    -[UIStackView setAlignment:](v3->mStackView, "setAlignment:", 3);
    v23 = v3->mStackView;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    objc_msgSend(v24, "titleToSubTitleSpacing");
    -[UIStackView setSpacing:](v23, "setSpacing:");

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->mStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v25 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    mSeperatorView = v3->mSeperatorView;
    v3->mSeperatorView = v25;

    v27 = v3->mSeperatorView;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.878431373, 0.6));
    -[UIView setBackgroundColor:](v27, "setBackgroundColor:", v28);

    -[UIView setHidden:](v3->mSeperatorView, "setHidden:", 1);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->mSeperatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[LUIPaneHeaderView addSubview:](v3, "addSubview:", v3->mStackView);
    -[LUIPaneHeaderView addSubview:](v3, "addSubview:", v3->mSeperatorView);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPaneHeaderView layoutConstraints](v3, "layoutConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

  }
  return v3;
}

- (id)layoutConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  id v16;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[8];

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerXAnchor](self->mStackView, "centerXAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPaneHeaderView centerXAnchor](self, "centerXAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
  v33[0] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->mStackView, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPaneHeaderView topAnchor](self, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v28, "edgeInsetsForHeader");
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v27));
  v33[1] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->mStackView, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPaneHeaderView leadingAnchor](self, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:", v24));
  v33[2] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPaneHeaderView trailingAnchor](self, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->mStackView, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:", v21));
  v33[3] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->mSeperatorView, "heightAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToConstant:", 0.5));
  v33[4] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->mSeperatorView, "bottomAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPaneHeaderView bottomAnchor](self, "bottomAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v3));
  v33[5] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->mSeperatorView, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPaneHeaderView leadingAnchor](self, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v7, "tableViewSeperatorInset");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintLessThanOrEqualToAnchor:constant:", v6, v8));
  v33[6] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPaneHeaderView trailingAnchor](self, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->mSeperatorView, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v12, "tableViewSeperatorInset");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintLessThanOrEqualToAnchor:constant:", v11, v13));
  v33[7] = v14;
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 8));

  return v16;
}

- (void)setEnableBottomSeperator:(BOOL)a3
{
  if (self->_enableBottomSeperator != a3)
  {
    self->_enableBottomSeperator = a3;
    -[UIView setHidden:](self->mSeperatorView, "setHidden:", !a3);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[LUIPaneHeaderView layoutIfNeeded](self, "layoutIfNeeded");
  -[UIStackView sizeThatFits:](self->mStackView, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v10, "edgeInsetsForHeader");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v13, "edgeInsetsForHeader");
  v15 = v9 + v12 + v14;

  v16 = v7;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)setTitle:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_title != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_title, a3);
    -[UILabel setText:](self->mTitleLabel, "setText:", self->_title);
    -[LUIPaneHeaderView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setSubtitle:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_subtitle != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_subtitle, a3);
    -[UILabel setText:](self->mSubTitleLabel, "setText:", self->_subtitle);
    -[LUIPaneHeaderView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setAttributedSubtitle:(id)a3
{
  NSAttributedString *v5;
  NSAttributedString *v6;

  v5 = (NSAttributedString *)a3;
  if (self->_attributedSubtitle != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_attributedSubtitle, a3);
    -[UILabel setAttributedText:](self->mSubTitleLabel, "setAttributedText:", self->_attributedSubtitle);
    -[LUIPaneHeaderView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setSubtitleNumberOfLines:(int64_t)a3
{
  -[UILabel setNumberOfLines:](self->mSubTitleLabel, "setNumberOfLines:", a3);
  -[LUIPaneHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSAttributedString)attributedSubtitle
{
  return self->_attributedSubtitle;
}

- (int64_t)subtitleNumberOfLines
{
  return self->_subtitleNumberOfLines;
}

- (BOOL)enableBottomSeperator
{
  return self->_enableBottomSeperator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedSubtitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->mStackView, 0);
  objc_storeStrong((id *)&self->mSubTitleLabel, 0);
  objc_storeStrong((id *)&self->mTitleLabel, 0);
  objc_storeStrong((id *)&self->mSeperatorView, 0);
}

@end
