@implementation HUCameraErrorView

- (HUCameraErrorView)init
{
  HUCameraErrorView *v2;
  HUCameraErrorView *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UIImageView *imageView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIStackView *v13;
  UIStackView *labelStackView;
  UILabel *v15;
  UILabel *titleLabel;
  void *v17;
  UILabel *v18;
  UILabel *descriptionLabel;
  void *v20;
  objc_super v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)HUCameraErrorView;
  v2 = -[HUCameraErrorView init](&v22, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HUCameraErrorView setAxis:](v2, "setAxis:", 1);
    -[HUCameraErrorView setAlignment:](v3, "setAlignment:", 3);
    -[HUCameraErrorView setSpacing:](v3, "setSpacing:", 20.0);
    objc_msgSend(MEMORY[0x1E0CEA638], "hu_cameraErrorImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageWithRenderingMode:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v5);
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v6;

    -[UIImageView setAlpha:](v3->_imageView, "setAlpha:", 0.5);
    -[UIImageView widthAnchor](v3->_imageView, "widthAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToConstant:", 61.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v9;
    -[UIImageView heightAnchor](v3->_imageView, "heightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToConstant:", 50.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v12);
    -[HUCameraErrorView addArrangedSubview:](v3, "addArrangedSubview:", v3->_imageView);
    v13 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0CEA9E0]);
    labelStackView = v3->_labelStackView;
    v3->_labelStackView = v13;

    -[UIStackView setAxis:](v3->_labelStackView, "setAxis:", 1);
    -[UIStackView setAlignment:](v3->_labelStackView, "setAlignment:", 3);
    -[UIStackView setSpacing:](v3->_labelStackView, "setSpacing:", 1.0);
    -[HUCameraErrorView addArrangedSubview:](v3, "addArrangedSubview:", v3->_labelStackView);
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v15;

    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 18.0, *MEMORY[0x1E0CEB5F8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v17);

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 1);
    -[UILabel _setTextColorFollowsTintColor:](v3->_titleLabel, "_setTextColorFollowsTintColor:", 1);
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = v18;

    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 13.0, *MEMORY[0x1E0CEB5E8]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_descriptionLabel, "setFont:", v20);

    -[UILabel setNumberOfLines:](v3->_descriptionLabel, "setNumberOfLines:", 3);
    -[UILabel _setTextColorFollowsTintColor:](v3->_descriptionLabel, "_setTextColorFollowsTintColor:", 1);

  }
  return v3;
}

- (NSString)titleText
{
  void *v2;
  void *v3;

  -[HUCameraErrorView titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTitleText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HUCameraErrorView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  if (v4)
  {
    -[HUCameraErrorView labelStackView](self, "labelStackView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[HUCameraErrorView titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertArrangedSubview:atIndex:", v6, 0);

  }
  else
  {
    -[HUCameraErrorView titleLabel](self, "titleLabel");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");
  }

}

- (NSString)descriptionText
{
  void *v2;
  void *v3;

  -[HUCameraErrorView descriptionLabel](self, "descriptionLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setDescriptionText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HUCameraErrorView descriptionLabel](self, "descriptionLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  if (v4)
  {
    -[HUCameraErrorView labelStackView](self, "labelStackView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[HUCameraErrorView descriptionLabel](self, "descriptionLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addArrangedSubview:", v6);

  }
  else
  {
    -[HUCameraErrorView descriptionLabel](self, "descriptionLabel");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");
  }

}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
