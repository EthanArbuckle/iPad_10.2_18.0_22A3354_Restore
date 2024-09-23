@implementation PHTableViewCell

+ (NSString)reuseIdentifier
{
  NSString *v2;
  void *v3;
  void *v4;

  v2 = NSStringFromClass((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ReuseIdentifier"), v3));

  return (NSString *)v4;
}

+ (double)titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:(id)a3
{
  return 0.0;
}

- (void)updateFontsLayoutMetricsAndSeparatorInset
{
  void *v3;
  void *v4;
  id v5;

  -[PHTableViewCell updateFontsAndLayoutMetrics](self, "updateFontsAndLayoutMetrics");
  v3 = (void *)objc_opt_class(self);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHTableViewCell traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  objc_msgSend(v3, "separatorInsetForContentSizeCategory:", v4);
  -[PHTableViewCell setSeparatorInset:](self, "setSeparatorInset:");

}

- (PHTableViewCell)initWithCoder:(id)a3
{
  -[PHTableViewCell doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHTableViewCell;
  v4 = a3;
  -[PHTableViewCell traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  if (v6 != v7)
    -[PHTableViewCell updateFontsLayoutMetricsAndSeparatorInset](self, "updateFontsLayoutMetricsAndSeparatorInset");

}

+ (UIEdgeInsets)separatorInsetForContentSizeCategory:(id)a3
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = UIEdgeInsetsZero.top;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIColor)foregroundColor
{
  void *v2;
  void *v3;

  if (self->_foregroundView)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell foregroundView](self, "foregroundView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "backgroundColor"));

  }
  else
  {
    v3 = 0;
  }
  return (UIColor *)v3;
}

- (void)setForegroundColor:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (!v11
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")),
        v5 = objc_msgSend(v11, "isEqual:", v4),
        v4,
        (v5 & 1) != 0))
  {
    -[PHTableViewCell setForegroundView:](self, "setForegroundView:", 0);
LABEL_6:
    v8 = v11;
    goto LABEL_7;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell foregroundView](self, "foregroundView"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "backgroundColor"));

  v8 = v11;
  if (v7 != v11)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell foregroundView](self, "foregroundView"));
    objc_msgSend(v9, "setBackgroundColor:", v11);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell foregroundView](self, "foregroundView"));
    objc_msgSend(v10, "setUserInteractionEnabled:", 0);

    goto LABEL_6;
  }
LABEL_7:

}

- (UIView)foregroundView
{
  UIView *foregroundView;
  UIView *v4;

  foregroundView = self->_foregroundView;
  if (!foregroundView)
  {
    v4 = objc_opt_new(UIView);
    -[PHTableViewCell setForegroundView:](self, "setForegroundView:", v4);

    foregroundView = self->_foregroundView;
  }
  return foregroundView;
}

- (void)setForegroundView:(id)a3
{
  UIView *v5;
  UIView *foregroundView;
  UIView *v7;

  v5 = (UIView *)a3;
  foregroundView = self->_foregroundView;
  v7 = v5;
  if (foregroundView != v5)
  {
    -[UIView removeFromSuperview](foregroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_foregroundView, a3);
    if (self->_foregroundView)
      -[PHTableViewCell addSubview:](self, "addSubview:");
  }

}

- (PHTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PHTableViewCell *v4;
  PHTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHTableViewCell;
  v4 = -[PHTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
    -[PHTableViewCell commonInit](v4, "commonInit");
  return v5;
}

- (void)commonInit
{
  UIView *v3;
  UIView *rootView;
  UIView *v5;
  uint64_t v6;
  id v7;

  v3 = (UIView *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell loadRootViewAndContentViews](self, "loadRootViewAndContentViews"));
  rootView = self->_rootView;
  self->_rootView = v3;

  v5 = self->_rootView;
  v6 = objc_opt_class(NUIContainerView);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    -[UIView setDelegate:](self->_rootView, "setDelegate:", self);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[PHTableViewCell contentView](self, "contentView"));
  objc_msgSend(v7, "addSubview:", self->_rootView);

}

- (id)loadRootViewAndContentViews
{
  UILabel *v3;
  UILabel *titleLabel;
  double v5;
  double v6;
  UILabel *v7;
  UILabel *subtitleLabel;
  double v9;
  double v10;

  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  LODWORD(v5) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v5);
  LODWORD(v6) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v6);
  v7 = (UILabel *)objc_alloc_init((Class)UILabel);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v7;

  LODWORD(v9) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v9);
  LODWORD(v10) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_subtitleLabel, "setContentHuggingPriority:forAxis:", 1, v10);
  return 0;
}

- (void)updateFontsAndLayoutMetrics
{
  void *v3;
  void *v4;
  void *v5;
  _UNKNOWN **v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  unsigned __int8 v22;
  id v23;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell titleLabel](self, "titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "font"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontName"));
  v6 = &_s10Foundation12NotificationV36_unconditionallyBridgeFromObjectiveCyACSo14NSNotificationCSgFZ_ptr;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUIBodyShortEmphasizedFont](UIFont, "telephonyUIBodyShortEmphasizedFont"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fontName"));
  if (!objc_msgSend(v5, "isEqual:", v8))
  {

    goto LABEL_5;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "font"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fontName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUISubheadlineShortFont](UIFont, "telephonyUISubheadlineShortFont"));
  v23 = v3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fontName"));
  v22 = objc_msgSend(v11, "isEqual:", v13);

  v6 = &_s10Foundation12NotificationV36_unconditionallyBridgeFromObjectiveCyACSo14NSNotificationCSgFZ_ptr;
  if ((v22 & 1) == 0)
  {
LABEL_5:
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[377], "telephonyUIBodyShortEmphasizedFont"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell titleLabel](self, "titleLabel"));
    objc_msgSend(v15, "setFont:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[377], "telephonyUISubheadlineShortFont"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v17, "setFont:", v16);

    v18 = NUIContainerViewLengthUseDefault;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v19, "setCustomBaselineOffsetFromBottom:", v18);

    -[PHTableViewCell effectiveBaselineOffsetFromBottom](self, "effectiveBaselineOffsetFromBottom");
    v21 = v20;
    v24 = (id)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v24, "setCustomBaselineOffsetFromBottom:", v21);

  }
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  id v7;

  v7 = a3;
  -[PHTableViewCell rootViewLayoutMargins](self, "rootViewLayoutMargins");
  if (!a5)
    objc_msgSend(v7, "setDirectionalLayoutMargins:");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell contentView](self, "contentView"));
  objc_msgSend(v6, "bounds");
  v8 = v7;

  if (width >= v8)
    width = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell rootView](self, "rootView"));
  objc_msgSend(v9, "sizeThatFits:", width, height);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PHTableViewCell;
  -[PHTableViewCell layoutSubviews](&v14, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell contentView](self, "contentView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell rootView](self, "rootView"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  if (self->_foregroundView)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell contentView](self, "contentView"));
    objc_msgSend(v13, "bringSubviewToFront:", self->_foregroundView);

    -[PHTableViewCell bounds](self, "bounds");
    -[UIView setFrame:](self->_foregroundView, "setFrame:");
  }
}

- (NSDirectionalEdgeInsets)rootViewLayoutMargins
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSDirectionalEdgeInsets result;

  -[PHTableViewCell titleLabelFirstBaselineLayoutConstraintConstant](self, "titleLabelFirstBaselineLayoutConstraintConstant");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "effectiveFirstBaselineOffsetFromContentTop");
  v7 = v4 - v6;
  -[PHTableViewCell titleLabelLeadingLayoutConstraintConstant](self, "titleLabelLeadingLayoutConstraintConstant");
  v9 = v8;
  -[PHTableViewCell subtitleLabelLastBaselineLayoutConstraintConstant](self, "subtitleLabelLastBaselineLayoutConstraintConstant");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v12, "effectiveBaselineOffsetFromContentBottom");
  v14 = v11 - v13;
  -[PHTableViewCell titleLabelTrailingLayoutConstraintConstant](self, "titleLabelTrailingLayoutConstraintConstant");
  v16 = v15;

  v17 = v7;
  v18 = v9;
  v19 = v14;
  v20 = v16;
  result.trailing = v20;
  result.bottom = v19;
  result.leading = v18;
  result.top = v17;
  return result;
}

- (double)titleLabelLeadingLayoutConstraintConstant
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell traitCollection](self, "traitCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  objc_msgSend(v3, "titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:", v5);
  v7 = v6;

  return v7;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UIView)rootView
{
  return self->_rootView;
}

- (void)setRootView:(id)a3
{
  objc_storeStrong((id *)&self->_rootView, a3);
}

- (double)titleLabelFirstBaselineLayoutConstraintConstant
{
  return self->_titleLabelFirstBaselineLayoutConstraintConstant;
}

- (double)titleLabelLastBaselineLayoutConstraintConstant
{
  return self->_titleLabelLastBaselineLayoutConstraintConstant;
}

- (double)titleLabelTrailingLayoutConstraintConstant
{
  return self->_titleLabelTrailingLayoutConstraintConstant;
}

- (double)subtitleLabelFirstBaselineLayoutConstraintConstant
{
  return self->_subtitleLabelFirstBaselineLayoutConstraintConstant;
}

- (double)subtitleLabelLastBaselineLayoutConstraintConstant
{
  return self->_subtitleLabelLastBaselineLayoutConstraintConstant;
}

- (double)subtitleLabelLeadingLayoutConstraintConstant
{
  return self->_subtitleLabelLeadingLayoutConstraintConstant;
}

- (double)subtitleLabelTrailingLayoutConstraintConstant
{
  return self->_subtitleLabelTrailingLayoutConstraintConstant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_foregroundView, 0);
}

@end
