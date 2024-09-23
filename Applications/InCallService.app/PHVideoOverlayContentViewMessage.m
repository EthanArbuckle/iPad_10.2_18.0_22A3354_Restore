@implementation PHVideoOverlayContentViewMessage

- (PHVideoOverlayContentViewMessage)initWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  PHVideoOverlayContentViewMessage *v8;
  PHVideoOverlayContentViewMessage *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PHVideoOverlayContentViewMessage;
  v8 = -[PHVideoOverlayContentViewMessage init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[PHVideoOverlayContentViewMessage setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PHVideoOverlayContentViewMessage setupViewWithTitle:message:](v9, "setupViewWithTitle:message:", v6, v7);
  }

  return v9;
}

- (void)setupViewWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
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
  id v28;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)UILabel);
  -[PHVideoOverlayContentViewMessage setTitleLabel:](self, "setTitleLabel:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage titleLabel](self, "titleLabel"));
  objc_msgSend(v9, "setText:", v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage titleLabel](self, "titleLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v10, "setTextColor:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage titleLabel](self, "titleLabel"));
  -[PHVideoOverlayContentView titleFontSize](self, "titleFontSize");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
  objc_msgSend(v12, "setFont:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage titleLabel](self, "titleLabel"));
  objc_msgSend(v14, "setTextAlignment:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage titleLabel](self, "titleLabel"));
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage titleLabel](self, "titleLabel"));
  objc_msgSend(v16, "setAdjustsFontSizeToFitWidth:", 1);

  v17 = objc_alloc_init((Class)UILabel);
  -[PHVideoOverlayContentViewMessage setMessageLabel:](self, "setMessageLabel:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage messageLabel](self, "messageLabel"));
  objc_msgSend(v18, "setText:", v6);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage messageLabel](self, "messageLabel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v19, "setTextColor:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage messageLabel](self, "messageLabel"));
  -[PHVideoOverlayContentView textFontSize](self, "textFontSize");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
  objc_msgSend(v21, "setFont:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage messageLabel](self, "messageLabel"));
  objc_msgSend(v23, "setTextAlignment:", 1);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage messageLabel](self, "messageLabel"));
  objc_msgSend(v24, "setNumberOfLines:", 4);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage messageLabel](self, "messageLabel"));
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage messageLabel](self, "messageLabel"));
  objc_msgSend(v26, "setAdjustsFontSizeToFitWidth:", 1);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage titleLabel](self, "titleLabel"));
  -[PHVideoOverlayContentViewMessage addSubview:](self, "addSubview:", v27);

  v28 = (id)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage messageLabel](self, "messageLabel"));
  -[PHVideoOverlayContentViewMessage addSubview:](self, "addSubview:", v28);

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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PHVideoOverlayContentViewMessage;
  -[PHVideoOverlayContentViewMessage updateConstraints](&v18, "updateConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage titleLabel](self, "titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 9, 0, self, 9, 1.0, 0.0));
  -[PHVideoOverlayContentViewMessage addConstraint:](self, "addConstraint:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage titleLabel](self, "titleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 3, 0, self, 3, 1.0, 0.0));
  -[PHVideoOverlayContentViewMessage addConstraint:](self, "addConstraint:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage titleLabel](self, "titleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 7, 0, self, 7, 1.0, 0.0));
  -[PHVideoOverlayContentViewMessage addConstraint:](self, "addConstraint:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage messageLabel](self, "messageLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 9, 0, self, 9, 1.0, 0.0));
  -[PHVideoOverlayContentViewMessage addConstraint:](self, "addConstraint:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage messageLabel](self, "messageLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 4, 0, self, 4, 1.0, 0.0));
  -[PHVideoOverlayContentViewMessage addConstraint:](self, "addConstraint:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage messageLabel](self, "messageLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 7, 0, self, 7, 1.0, 0.0));
  -[PHVideoOverlayContentViewMessage addConstraint:](self, "addConstraint:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage titleLabel](self, "titleLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage messageLabel](self, "messageLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 4, 0, v16, 3, 1.0, -6.0));
  -[PHVideoOverlayContentViewMessage addConstraint:](self, "addConstraint:", v17);

}

- (void)resetView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage titleLabel](self, "titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewMessage messageLabel](self, "messageLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));

  v7.receiver = self;
  v7.super_class = (Class)PHVideoOverlayContentViewMessage;
  -[PHVideoOverlayContentView resetView](&v7, "resetView");
  -[PHVideoOverlayContentViewMessage setupViewWithTitle:message:](self, "setupViewWithTitle:message:", v4, v6);

}

- (UILabel)titleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTitleLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (UILabel)messageLabel
{
  return (UILabel *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMessageLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
