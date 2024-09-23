@implementation HUMosaicCameraErrorView

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  objc_super v18;
  CGRect v19;

  v18.receiver = self;
  v18.super_class = (Class)HUMosaicCameraErrorView;
  -[HUMosaicCameraErrorView layoutSubviews](&v18, sel_layoutSubviews);
  -[HUMosaicCameraCellLayoutOptions descriptionInset](self->_layoutOptions, "descriptionInset");
  v4 = v3;
  -[HUMosaicCameraErrorView imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  CGRectGetMaxY(v19);
  -[HUMosaicCameraErrorView labelStackView](self, "labelStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v7 = NACGFloatGreaterThanOrEqualToFloat();

  if (v7)
  {
    -[HUMosaicCameraErrorView bounds](self, "bounds");
    v9 = v8 * 0.3;
    -[HUMosaicCameraErrorView labelStackView](self, "labelStackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v11 + v4 * -2.0;

    if (v9 >= v12)
      v9 = v12;
    -[HUMosaicCameraErrorView labelStackView](self, "labelStackView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v15 = (v14 - v9) * 0.5;

    if (-[HUMosaicCameraErrorView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
    {
      -[HUMosaicCameraErrorView bounds](self, "bounds");
      v4 = v16 - v9 * 1.22 - v4;
    }
    -[HUMosaicCameraErrorView imageView](self, "imageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFrame:", v4, v15, v9 * 1.22, v9);

  }
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setVisualEffectViewHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUMosaicCameraErrorView visualEffectView](self, "visualEffectView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setTitleText:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HUMosaicCameraErrorView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[HUMosaicCameraErrorView titleLabel](self, "titleLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v4 == 0);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setDescriptionText:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HUMosaicCameraErrorView descriptionLabel](self, "descriptionLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[HUMosaicCameraErrorView descriptionLabel](self, "descriptionLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v4 == 0);

}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (HUMosaicCameraErrorView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  HUMosaicCameraErrorView *v5;
  uint64_t v6;
  UIVisualEffectView *visualEffectView;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  UIImageView *imageView;
  UIStackView *v13;
  UIStackView *labelStackView;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  HUMosaicCameraCellLayoutOptions *layoutOptions;
  UILabel *v19;
  UILabel *titleLabel;
  void *v21;
  void *v22;
  UILabel *v23;
  UILabel *descriptionLabel;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  objc_super v66;
  _QWORD v67[13];

  height = a3.size.height;
  width = a3.size.width;
  v67[11] = *MEMORY[0x1E0C80C00];
  v66.receiver = self;
  v66.super_class = (Class)HUMosaicCameraErrorView;
  v5 = -[HUMosaicCameraErrorView initWithFrame:](&v66, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
    visualEffectView = v5->_visualEffectView;
    v5->_visualEffectView = (UIVisualEffectView *)v6;

    objc_msgSend(MEMORY[0x1E0CEABE0], "hu_gridCellBackgroundOffEffects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setBackgroundEffects:](v5->_visualEffectView, "setBackgroundEffects:", v8);

    -[UIVisualEffectView _setGroupName:](v5->_visualEffectView, "_setGroupName:", CFSTR("HUMosiacCameraCell-VisualEffect"));
    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v5->_visualEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUMosaicCameraErrorView addSubview:](v5, "addSubview:", v5->_visualEffectView);
    objc_msgSend(MEMORY[0x1E0CEA638], "hu_cameraErrorImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageWithRenderingMode:", 2);
    v10 = objc_claimAutoreleasedReturnValue();

    v65 = (void *)v10;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v10);
    imageView = v5->_imageView;
    v5->_imageView = (UIImageView *)v11;

    -[UIImageView setAlpha:](v5->_imageView, "setAlpha:", 0.6);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUMosaicCameraErrorView addSubview:](v5, "addSubview:", v5->_imageView);
    v13 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0CEA9E0]);
    labelStackView = v5->_labelStackView;
    v5->_labelStackView = v13;

    v15 = 1;
    -[UIStackView setAxis:](v5->_labelStackView, "setAxis:", 1);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v5->_labelStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUMosaicCameraErrorView addSubview:](v5, "addSubview:", v5->_labelStackView);
    v16 = HUViewSizeSubclassForViewSize(width, height);
    if (v16 <= 0xA)
      v15 = qword_1B9442858[v16];
    +[HUMosaicCameraCellLayoutOptions defaultOptionsForCellSizeSubclass:viewSizeSubclass:](HUMosaicCameraCellLayoutOptions, "defaultOptionsForCellSizeSubclass:viewSizeSubclass:", v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    layoutOptions = v5->_layoutOptions;
    v5->_layoutOptions = (HUMosaicCameraCellLayoutOptions *)v17;

    v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v19;

    -[HUGridCellLayoutOptions font](v5->_layoutOptions, "font");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_titleLabel, "setFont:", v21);

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setColor:](v5->_titleLabel, "setColor:", v22);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UIStackView addArrangedSubview:](v5->_labelStackView, "addArrangedSubview:", v5->_titleLabel);
    v23 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    descriptionLabel = v5->_descriptionLabel;
    v5->_descriptionLabel = v23;

    -[HUMosaicCameraCellLayoutOptions secondaryLabelFont](v5->_layoutOptions, "secondaryLabelFont");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_descriptionLabel, "setFont:", v25);

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setColor:](v5->_descriptionLabel, "setColor:", v26);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_descriptionLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UIStackView addArrangedSubview:](v5->_labelStackView, "addArrangedSubview:", v5->_descriptionLabel);
    -[UIVisualEffectView centerXAnchor](v5->_visualEffectView, "centerXAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraErrorView centerXAnchor](v5, "centerXAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v63);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v62;
    -[UIVisualEffectView centerYAnchor](v5->_visualEffectView, "centerYAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraErrorView centerYAnchor](v5, "centerYAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v60);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v67[1] = v59;
    -[UIVisualEffectView widthAnchor](v5->_visualEffectView, "widthAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraErrorView widthAnchor](v5, "widthAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v57);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v67[2] = v56;
    -[UIVisualEffectView heightAnchor](v5->_visualEffectView, "heightAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraErrorView heightAnchor](v5, "heightAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v54);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v67[3] = v53;
    -[UIImageView heightAnchor](v5->_imageView, "heightAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraErrorView heightAnchor](v5, "heightAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:multiplier:", v51, 0.3);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v67[4] = v50;
    -[UIImageView widthAnchor](v5->_imageView, "widthAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView heightAnchor](v5->_imageView, "heightAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:multiplier:", v48, 1.22);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v67[5] = v47;
    -[UIImageView centerXAnchor](v5->_imageView, "centerXAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraErrorView centerXAnchor](v5, "centerXAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v67[6] = v44;
    -[UIImageView centerYAnchor](v5->_imageView, "centerYAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraErrorView centerYAnchor](v5, "centerYAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCellLayoutOptions descriptionInset](v5->_layoutOptions, "descriptionInset");
    objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, -v27);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v67[7] = v40;
    -[UIStackView bottomAnchor](v5->_labelStackView, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraErrorView bottomAnchor](v5, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCellLayoutOptions descriptionInset](v5->_layoutOptions, "descriptionInset");
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, -v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v67[8] = v31;
    -[UIStackView leadingAnchor](v5->_labelStackView, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraErrorView leadingAnchor](v5, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCellLayoutOptions descriptionInset](v5->_layoutOptions, "descriptionInset");
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v67[9] = v34;
    -[UIStackView trailingAnchor](v5->_labelStackView, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraErrorView trailingAnchor](v5, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMosaicCameraCellLayoutOptions descriptionInset](v5->_layoutOptions, "descriptionInset");
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, -v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v67[10] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 11);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v41);
  }
  return v5;
}

- (NSString)titleText
{
  void *v2;
  void *v3;

  -[HUMosaicCameraErrorView titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)descriptionText
{
  void *v2;
  void *v3;

  -[HUMosaicCameraErrorView descriptionLabel](self, "descriptionLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)visualEffectViewHidden
{
  void *v2;
  char v3;

  -[HUMosaicCameraErrorView visualEffectView](self, "visualEffectView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (HUMosaicCameraCellLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (void)setLayoutOptions:(id)a3
{
  objc_storeStrong((id *)&self->_layoutOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end
