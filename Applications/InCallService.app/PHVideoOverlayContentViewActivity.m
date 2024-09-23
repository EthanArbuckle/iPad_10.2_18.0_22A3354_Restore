@implementation PHVideoOverlayContentViewActivity

- (PHVideoOverlayContentViewActivity)initWithTitle:(id)a3 indicatorStyle:(int64_t)a4
{
  id v6;
  PHVideoOverlayContentViewActivity *v7;
  PHVideoOverlayContentViewActivity *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHVideoOverlayContentViewActivity;
  v7 = -[PHVideoOverlayContentViewActivity init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    -[PHVideoOverlayContentViewActivity setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PHVideoOverlayContentViewActivity setupViewWithTitle:indicatorStyle:](v8, "setupViewWithTitle:indicatorStyle:", v6, a4);
  }

  return v8;
}

- (void)setupViewWithTitle:(id)a3 indicatorStyle:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v6 = a3;
  v7 = objc_alloc_init((Class)UILabel);
  -[PHVideoOverlayContentViewActivity setTitleLabel:](self, "setTitleLabel:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity titleLabel](self, "titleLabel"));
  objc_msgSend(v8, "setText:", v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity titleLabel](self, "titleLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v9, "setTextColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity titleLabel](self, "titleLabel"));
  -[PHVideoOverlayContentView titleFontSize](self, "titleFontSize");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
  objc_msgSend(v11, "setFont:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity titleLabel](self, "titleLabel"));
  objc_msgSend(v13, "setTextAlignment:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity titleLabel](self, "titleLabel"));
  objc_msgSend(v14, "setAdjustsFontSizeToFitWidth:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity titleLabel](self, "titleLabel"));
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity titleLabel](self, "titleLabel"));
  LODWORD(v17) = 1132068864;
  objc_msgSend(v16, "setContentCompressionResistancePriority:forAxis:", 1, v17);

  v18 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", a4);
  -[PHVideoOverlayContentViewActivity setActivityIndicator:](self, "setActivityIndicator:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity activityIndicator](self, "activityIndicator"));
  objc_msgSend(v20, "setColor:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity activityIndicator](self, "activityIndicator"));
  objc_msgSend(v21, "startAnimating");

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity activityIndicator](self, "activityIndicator"));
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity titleLabel](self, "titleLabel"));
  -[PHVideoOverlayContentViewActivity addSubview:](self, "addSubview:", v23);

  v24 = (id)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity activityIndicator](self, "activityIndicator"));
  -[PHVideoOverlayContentViewActivity addSubview:](self, "addSubview:", v24);

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)PHVideoOverlayContentViewActivity;
  -[PHVideoOverlayContentViewActivity updateConstraints](&v31, "updateConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity titleLabel](self, "titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 10, 0, self, 10, 1.0, 0.0));
  -[PHVideoOverlayContentViewActivity addConstraint:](self, "addConstraint:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity titleLabel](self, "titleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 2, 0, self, 2, 1.0, 0.0));
  -[PHVideoOverlayContentViewActivity addConstraint:](self, "addConstraint:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity activityIndicator](self, "activityIndicator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity titleLabel](self, "titleLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 10, 0, v8, 10, 1.0, 0.0));

  LODWORD(v10) = 1148846080;
  objc_msgSend(v9, "setPriority:", v10);
  -[PHVideoOverlayContentViewActivity addConstraint:](self, "addConstraint:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity titleLabel](self, "titleLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "text"));
  v13 = objc_msgSend(v12, "length");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity activityIndicator](self, "activityIndicator"));
  v15 = v14;
  if (v13)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leftAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity leftAnchor](self, "leftAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
    objc_msgSend(v18, "setActive:", 1);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity activityIndicator](self, "activityIndicator"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "rightAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity titleLabel](self, "titleLabel"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leftAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, -10.0));

    LODWORD(v23) = 1148846080;
    objc_msgSend(v15, "setPriority:", v23);
    -[PHVideoOverlayContentViewActivity addConstraint:](self, "addConstraint:", v15);
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerXAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity centerXAnchor](self, "centerXAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
    objc_msgSend(v26, "setActive:", 1);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity titleLabel](self, "titleLabel"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v27, 3, -1, self, 3, 1.0, -5.0));
  -[PHVideoOverlayContentViewActivity addConstraint:](self, "addConstraint:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity titleLabel](self, "titleLabel"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v29, 4, 1, self, 4, 1.0, 5.0));
  -[PHVideoOverlayContentViewActivity addConstraint:](self, "addConstraint:", v30);

}

- (void)resetView
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHVideoOverlayContentViewActivity;
  -[PHVideoOverlayContentView resetView](&v6, "resetView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity titleLabel](self, "titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity activityIndicator](self, "activityIndicator"));
  -[PHVideoOverlayContentViewActivity setupViewWithTitle:indicatorStyle:](self, "setupViewWithTitle:indicatorStyle:", v4, objc_msgSend(v5, "activityIndicatorViewStyle"));

}

- (NSString)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewActivity titleLabel](self, "titleLabel"));
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

- (UIActivityIndicatorView)activityIndicator
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 16, 1);
}

- (void)setActivityIndicator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
