@implementation HUWallpaperPhotoCollectionFooterView

- (HUWallpaperPhotoCollectionFooterView)initWithFrame:(CGRect)a3
{
  HUWallpaperPhotoCollectionFooterView *v3;
  id v4;
  uint64_t v5;
  UILabel *label;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)HUWallpaperPhotoCollectionFooterView;
  v3 = -[HUWallpaperPhotoCollectionFooterView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_label, "setFont:", v7);

    -[HUWallpaperPhotoCollectionFooterView addSubview:](v3, "addSubview:", v3->_label);
    -[UILabel topAnchor](v3->_label, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPhotoCollectionFooterView topAnchor](v3, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 8.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setActive:", 1);

    -[UILabel bottomAnchor](v3->_label, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPhotoCollectionFooterView bottomAnchor](v3, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, -8.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    -[UILabel centerXAnchor](v3->_label, "centerXAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPhotoCollectionFooterView centerXAnchor](v3, "centerXAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    -[UILabel leadingAnchor](v3->_label, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPhotoCollectionFooterView leadingAnchor](v3, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintGreaterThanOrEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    -[UILabel trailingAnchor](v3->_label, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPhotoCollectionFooterView trailingAnchor](v3, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintLessThanOrEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setActive:", 1);

  }
  return v3;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
