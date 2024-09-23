@implementation PHVideoOverlayContentViewTitle

- (PHVideoOverlayContentViewTitle)initWithTitle:(id)a3
{
  id v4;
  PHVideoOverlayContentViewTitle *v5;
  PHVideoOverlayContentViewTitle *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHVideoOverlayContentViewTitle;
  v5 = -[PHVideoOverlayContentViewTitle init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    -[PHVideoOverlayContentViewTitle setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PHVideoOverlayContentViewTitle setupViewWithTitle:](v6, "setupViewWithTitle:", v4);
  }

  return v6;
}

- (void)setupViewWithTitle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v5 = objc_alloc_init((Class)UILabel);
  -[PHVideoOverlayContentViewTitle setTitleLabel:](self, "setTitleLabel:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewTitle titleLabel](self, "titleLabel"));
  objc_msgSend(v6, "setText:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewTitle titleLabel](self, "titleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v7, "setTextColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewTitle titleLabel](self, "titleLabel"));
  -[PHVideoOverlayContentView titleFontSize](self, "titleFontSize");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
  objc_msgSend(v9, "setFont:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewTitle titleLabel](self, "titleLabel"));
  objc_msgSend(v11, "setTextAlignment:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewTitle titleLabel](self, "titleLabel"));
  objc_msgSend(v12, "setNumberOfLines:", 3);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewTitle titleLabel](self, "titleLabel"));
  objc_msgSend(v13, "setAdjustsFontSizeToFitWidth:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewTitle titleLabel](self, "titleLabel"));
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v15 = (id)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewTitle titleLabel](self, "titleLabel"));
  -[PHVideoOverlayContentViewTitle addSubview:](self, "addSubview:", v15);

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PHVideoOverlayContentViewTitle;
  -[PHVideoOverlayContentViewTitle updateConstraints](&v12, "updateConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewTitle titleLabel](self, "titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 9, 0, self, 9, 1.0, 0.0));
  -[PHVideoOverlayContentViewTitle addConstraint:](self, "addConstraint:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewTitle titleLabel](self, "titleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 10, 0, self, 10, 1.0, 0.0));
  -[PHVideoOverlayContentViewTitle addConstraint:](self, "addConstraint:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewTitle titleLabel](self, "titleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 7, 0, self, 7, 1.0, 0.0));

  LODWORD(v9) = 1144995840;
  objc_msgSend(v8, "setPriority:", v9);
  -[PHVideoOverlayContentViewTitle addConstraint:](self, "addConstraint:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewTitle titleLabel](self, "titleLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 8, 0, self, 8, 1.0, 0.0));
  -[PHVideoOverlayContentViewTitle addConstraint:](self, "addConstraint:", v11);

}

- (void)resetView
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewTitle titleLabel](self, "titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));

  v5.receiver = self;
  v5.super_class = (Class)PHVideoOverlayContentViewTitle;
  -[PHVideoOverlayContentView resetView](&v5, "resetView");
  -[PHVideoOverlayContentViewTitle setupViewWithTitle:](self, "setupViewWithTitle:", v4);

}

- (UILabel)titleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTitleLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
