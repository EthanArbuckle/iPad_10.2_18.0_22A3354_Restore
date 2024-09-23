@implementation MKFirstPartyPhotoBigAttributionView

- (MKFirstPartyPhotoBigAttributionView)initWithContext:(int64_t)a3
{
  MKFirstPartyPhotoBigAttributionView *v3;
  MKFirstPartyPhotoBigAttributionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKFirstPartyPhotoBigAttributionView;
  v3 = -[MKPhotoBigAttributionView initWithContext:](&v6, sel_initWithContext_, a3);
  v4 = v3;
  if (v3)
  {
    -[MKFirstPartyPhotoBigAttributionView _setupSubviews](v3, "_setupSubviews");
    -[MKFirstPartyPhotoBigAttributionView _setupConstraints](v4, "_setupConstraints");
    -[MKFirstPartyPhotoBigAttributionView didUpdateAttributionViewType](v4, "didUpdateAttributionViewType");
  }
  return v4;
}

- (void)_setupSubviews
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIImageView *v8;
  UIImageView *glyphView;
  void *v10;
  UILabel *v11;
  UILabel *titleLabel;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = objc_alloc(MEMORY[0x1E0CEA658]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  glyphView = self->_glyphView;
  self->_glyphView = v8;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_glyphView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_glyphView, "setTintColor:", v10);

  v11 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v4, v5, v6, v7);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v11;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 12.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v13);

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v14);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[MKPhotoBigAttributionView contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", self->_glyphView);

  -[MKPhotoBigAttributionView contentView](self, "contentView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", self->_titleLabel);

}

- (void)_setupConstraints
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
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[11];

  v36[9] = *MEMORY[0x1E0C80C00];
  -[MKPhotoBigAttributionView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CB3718];
  -[UIImageView centerXAnchor](self->_glyphView, "centerXAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v33;
  -[UIImageView topAnchor](self->_glyphView, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintGreaterThanOrEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v30;
  -[UIImageView bottomAnchor](self->_glyphView, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v3;
  objc_msgSend(v3, "centerYAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v27;
  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](self->_glyphView, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, 4.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v22;
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, 4.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v19;
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, -4.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v16;
  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintLessThanOrEqualToAnchor:constant:", v14, -4.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v4;
  -[MKPhotoBigAttributionView spinner](self, "spinner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerXAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView centerXAnchor](self->_glyphView, "centerXAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36[7] = v8;
  -[MKPhotoBigAttributionView spinner](self, "spinner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView centerYAnchor](self->_glyphView, "centerYAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36[8] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v13);

}

- (NSString)titleText
{
  void *v2;
  __CFString *v3;

  v2 = -[MKPhotoBigAttributionView type](self, "type");
  if (!v2)
  {
    v3 = CFSTR("Add Photo [UGC]");
    goto LABEL_5;
  }
  if (v2 == (void *)1)
  {
    v3 = CFSTR("More Photos [UGC]");
LABEL_5:
    _MKLocalizedStringFromThisBundle(v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v2;
}

- (UIImage)glyphImage
{
  int64_t v2;
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = -[MKPhotoBigAttributionView type](self, "type");
  v3 = &stru_1E20DFC00;
  if (v2 == 1)
    v3 = CFSTR("photo.fill.on.rectangle.fill");
  if (v2)
    v4 = v3;
  else
    v4 = CFSTR("camera.fill");
  v5 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 20.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationWithFont:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithConfiguration:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v9;
}

- (void)didUpdateAttributionViewType
{
  void *v3;
  UIImageView *glyphView;
  id v5;

  -[MKFirstPartyPhotoBigAttributionView titleText](self, "titleText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v3);

  glyphView = self->_glyphView;
  -[MKFirstPartyPhotoBigAttributionView glyphImage](self, "glyphImage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](glyphView, "setImage:", v5);

}

- (void)willStartAnimatingActivityIndicatorView
{
  -[UIImageView setAlpha:](self->_glyphView, "setAlpha:", 0.0);
}

- (void)didEndAnimatingActivityIndicatorView
{
  -[UIImageView setAlpha:](self->_glyphView, "setAlpha:", 1.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
}

@end
