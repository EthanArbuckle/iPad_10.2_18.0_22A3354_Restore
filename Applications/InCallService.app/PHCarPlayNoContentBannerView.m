@implementation PHCarPlayNoContentBannerView

- (PHCarPlayNoContentBannerView)initWithFrame:(CGRect)a3
{
  PHCarPlayNoContentBannerView *v3;
  UILabel *v4;
  UILabel *titleLabel;
  void *v6;
  void *v7;
  UILabel *v8;
  UILabel *subtitleLabel;
  void *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;
  _QWORD v27[2];
  _QWORD v28[2];

  v26.receiver = self;
  v26.super_class = (Class)PHCarPlayNoContentBannerView;
  v3 = -[PHCarPlayNoContentBannerView initWithFrame:](&v26, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 28.0));
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicLabelColor](UIColor, "dynamicLabelColor"));
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v7);

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v3->_titleLabel, "setLineBreakMode:", 0);
    -[PHCarPlayNoContentBannerView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v8 = (UILabel *)objc_alloc_init((Class)UILabel);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v8;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 16.0));
    -[UILabel setFont:](v3->_subtitleLabel, "setFont:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicLabelColor](UIColor, "dynamicLabelColor"));
    -[UILabel setTextColor:](v3->_subtitleLabel, "setTextColor:", v11);

    -[UILabel setTextAlignment:](v3->_subtitleLabel, "setTextAlignment:", 1);
    -[PHCarPlayNoContentBannerView addSubview:](v3, "addSubview:", v3->_subtitleLabel);
    v27[0] = CFSTR("titleLabel");
    v12 = v3->_titleLabel;
    v27[1] = CFSTR("subtitleLabel");
    v28[0] = v12;
    v28[1] = v3->_subtitleLabel;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayNoContentBannerView titleLabel](v3, "titleLabel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 11, 0, v3, 10, 1.0, 0.0));
    -[PHCarPlayNoContentBannerView addConstraint:](v3, "addConstraint:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[titleLabel]-[subtitleLabel]"), 0, 0, v13));
    -[PHCarPlayNoContentBannerView addConstraints:](v3, "addConstraints:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayNoContentBannerView titleLabel](v3, "titleLabel"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 7, 0, v3, 7, 1.0, 0.0));
    -[PHCarPlayNoContentBannerView addConstraint:](v3, "addConstraint:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayNoContentBannerView titleLabel](v3, "titleLabel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 9, 0, v3, 9, 1.0, 0.0));
    -[PHCarPlayNoContentBannerView addConstraint:](v3, "addConstraint:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayNoContentBannerView subtitleLabel](v3, "subtitleLabel"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 7, 0, v3, 7, 1.0, 0.0));
    -[PHCarPlayNoContentBannerView addConstraint:](v3, "addConstraint:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayNoContentBannerView subtitleLabel](v3, "subtitleLabel"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v23, 9, 0, v3, 9, 1.0, 0.0));
    -[PHCarPlayNoContentBannerView addConstraint:](v3, "addConstraint:", v24);

  }
  return v3;
}

- (void)setTitleString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayNoContentBannerView titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (void)setSubtitleString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayNoContentBannerView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)titleString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayNoContentBannerView titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (NSString)subtitleString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayNoContentBannerView subtitleLabel](self, "subtitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTitleLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (UILabel)subtitleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSubtitleLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
