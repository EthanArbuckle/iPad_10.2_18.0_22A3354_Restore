@implementation TabThumbnailRecordingIndicator

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)TabThumbnailRecordingIndicator;
  -[TabThumbnailRecordingIndicator layoutSubviews](&v3, sel_layoutSubviews);
  -[TabThumbnailRecordingIndicator frame](self, "frame");
  -[TabThumbnailRecordingIndicator _setCornerRadius:](self, "_setCornerRadius:", CGRectGetWidth(v4) * 0.5);
}

- (TabThumbnailRecordingIndicator)initWithFrame:(CGRect)a3
{
  TabThumbnailRecordingIndicator *v3;
  TabThumbnailRecordingIndicator *v4;
  void *v5;
  double v6;
  UIImageView *v7;
  UIImageView *imageView;
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
  TabThumbnailRecordingIndicator *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)TabThumbnailRecordingIndicator;
  v3 = -[TabThumbnailRecordingIndicator initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TabThumbnailRecordingIndicator setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabThumbnailRecordingIndicator setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[TabThumbnailRecordingIndicator setClipsToBounds:](v4, "setClipsToBounds:", 0);
    -[TabThumbnailRecordingIndicator layer](v4, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = 0.25;
    objc_msgSend(v27, "setShadowOpacity:", v6);
    objc_msgSend(v27, "setShadowOffset:", 0.0, 0.0);
    objc_msgSend(v27, "setShadowRadius:", 12.0);
    objc_msgSend(v27, "setShadowPathIsBounds:", 1);
    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v4->_imageView;
    v4->_imageView = v7;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v4->_imageView, "setTintColor:", v9);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4AA0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pointSize");
    objc_msgSend(v10, "configurationWithPointSize:weight:scale:", 6, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v4->_imageView, "setPreferredSymbolConfiguration:", v12);

    -[UIImageView _sf_setMatchesIntrinsicContentSize](v4->_imageView, "_sf_setMatchesIntrinsicContentSize");
    -[TabThumbnailRecordingIndicator addSubview:](v4, "addSubview:", v4->_imageView);
    v24 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView centerXAnchor](v4->_imageView, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabThumbnailRecordingIndicator centerXAnchor](v4, "centerXAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v13;
    -[UIImageView centerYAnchor](v4->_imageView, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabThumbnailRecordingIndicator centerYAnchor](v4, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v16;
    -[TabThumbnailRecordingIndicator widthAnchor](v4, "widthAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToConstant:", 22.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v18;
    -[TabThumbnailRecordingIndicator heightAnchor](v4, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToConstant:", 22.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v21);

    v22 = v4;
  }

  return v4;
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_mediaStateIcon != a3)
  {
    self->_mediaStateIcon = a3;
    v4 = (void *)MEMORY[0x1E0DC3870];
    SFSystemImageNameForMediaStateIcon();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemImageNamed:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_imageView, "setImage:", v5);

  }
}

- (unint64_t)mediaStateIcon
{
  return self->_mediaStateIcon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
