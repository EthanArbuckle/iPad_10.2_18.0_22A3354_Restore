@implementation ASVThumbnailButton

+ (id)thumbnailButton
{
  NSObject *v2;
  void *v3;
  uint8_t v5[16];

  AssetViewerLogHandleForCategory(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D93A7000, v2, OS_LOG_TYPE_DEFAULT, "ARQL thumbnailButton() called", v5, 2u);
  }

  +[ASVThumbnailButton buttonWithType:](ASVThumbnailButton, "buttonWithType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setupButton");
  return v3;
}

- (void)_setupButton
{
  NSObject *v3;
  ASVLoadingView *v4;
  ASVLoadingView *loadingView;
  UIImageView *v6;
  UIImageView *imageView;
  ASVBadgeView *v8;
  ASVBadgeView *badgeView;
  void *v10;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *badgeTopConstraint;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *badgeTrailingConstraint;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSLayoutConstraint *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint8_t buf[8];
  _QWORD v44[11];

  v44[9] = *MEMORY[0x1E0C80C00];
  AssetViewerLogHandleForCategory(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D93A7000, v3, OS_LOG_TYPE_DEFAULT, "ARQL Setting up ASVThumbnailButton", buf, 2u);
  }

  v4 = (ASVLoadingView *)objc_opt_new();
  loadingView = self->_loadingView;
  self->_loadingView = v4;

  v6 = (UIImageView *)objc_opt_new();
  imageView = self->_imageView;
  self->_imageView = v6;

  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
  +[ASVBadgeView badgeView](ASVBadgeView, "badgeView");
  v8 = (ASVBadgeView *)objc_claimAutoreleasedReturnValue();
  badgeView = self->_badgeView;
  self->_badgeView = v8;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVThumbnailButton setBackgroundColor:](self, "setBackgroundColor:", v10);

  -[ASVThumbnailButton addSubview:](self, "addSubview:", self->_loadingView);
  -[ASVThumbnailButton addSubview:](self, "addSubview:", self->_imageView);
  -[ASVThumbnailButton addSubview:](self, "addSubview:", self->_badgeView);
  -[ASVLoadingView setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ASVBadgeView setTranslatesAutoresizingMaskIntoConstraints:](self->_badgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ASVBadgeView topAnchor](self->_badgeView, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVThumbnailButton topAnchor](self, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  badgeTopConstraint = self->_badgeTopConstraint;
  self->_badgeTopConstraint = v13;

  -[ASVBadgeView trailingAnchor](self->_badgeView, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVThumbnailButton trailingAnchor](self, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  badgeTrailingConstraint = self->_badgeTrailingConstraint;
  self->_badgeTrailingConstraint = v17;

  v33 = (void *)MEMORY[0x1E0CB3718];
  -[ASVLoadingView centerXAnchor](self->_loadingView, "centerXAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVThumbnailButton centerXAnchor](self, "centerXAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v40;
  -[ASVLoadingView centerYAnchor](self->_loadingView, "centerYAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVThumbnailButton centerYAnchor](self, "centerYAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v37;
  -[ASVLoadingView widthAnchor](self->_loadingView, "widthAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVThumbnailButton widthAnchor](self, "widthAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintLessThanOrEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v34;
  -[UIImageView leadingAnchor](self->_imageView, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVThumbnailButton leadingAnchor](self, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v30;
  -[UIImageView trailingAnchor](self->_imageView, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVThumbnailButton trailingAnchor](self, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v20;
  -[UIImageView topAnchor](self->_imageView, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVThumbnailButton topAnchor](self, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v44[5] = v23;
  -[UIImageView bottomAnchor](self->_imageView, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVThumbnailButton bottomAnchor](self, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = self->_badgeTopConstraint;
  v44[6] = v26;
  v44[7] = v27;
  v44[8] = self->_badgeTrailingConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activateConstraints:", v28);

  -[ASVThumbnailButton _updateSubviewVisibility](self, "_updateSubviewVisibility");
  -[ASVThumbnailButton setAccessibilityIgnoresInvertColors:](self, "setAccessibilityIgnoresInvertColors:", 1);
}

- (UIImage)thumbnail
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setThumbnail:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:", a3);
  -[ASVThumbnailButton _updateSubviewVisibility](self, "_updateSubviewVisibility");
}

- (void)setError:(id)a3
{
  -[ASVLoadingView setLoadingError:](self->_loadingView, "setLoadingError:", a3);
  -[ASVThumbnailButton _updateSubviewVisibility](self, "_updateSubviewVisibility");
}

- (NSError)error
{
  return -[ASVLoadingView loadingError](self->_loadingView, "loadingError");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ASVThumbnailButton;
  -[ASVThumbnailButton setHighlighted:](&v7, sel_setHighlighted_);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.7, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
  }
  -[ASVThumbnailButton setBackgroundColor:](self, "setBackgroundColor:", v5);

  -[ASVBadgeView setHighlighted:](self->_badgeView, "setHighlighted:", v3);
  -[UIImageView setDrawMode:](self->_imageView, "setDrawMode:", v6);
}

- (void)_updateSubviewVisibility
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  double v7;

  -[ASVThumbnailButton thumbnail](self, "thumbnail");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if (v3)
  {
    -[ASVThumbnailButton error](self, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v4 = 0.0;
    else
      v4 = 1.0;

  }
  -[ASVThumbnailButton thumbnail](self, "thumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIImageView setAlpha:](self->_imageView, "setAlpha:", v4);
  v7 = 1.0;
  if (v6)
    v7 = 0.0;
  -[ASVLoadingView setAlpha:](self->_loadingView, "setAlpha:", v7);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ASVThumbnailButton;
  -[ASVThumbnailButton layoutSubviews](&v16, sel_layoutSubviews);
  -[ASVBadgeView thumbnailSize](self->_badgeView, "thumbnailSize");
  v4 = v3;
  v6 = v5;
  -[ASVThumbnailButton bounds](self, "bounds");
  if (v4 != v8 || v6 != v7)
  {
    -[ASVThumbnailButton bounds](self, "bounds");
    -[ASVBadgeView setThumbnailSize:](self->_badgeView, "setThumbnailSize:", v10, v11);
    -[ASVBadgeView badgeDescription](self->_badgeView, "badgeDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "badgeOffset");
    -[NSLayoutConstraint setConstant:](self->_badgeTopConstraint, "setConstant:", v13);

    -[ASVBadgeView badgeDescription](self->_badgeView, "badgeDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "badgeOffset");
    -[NSLayoutConstraint setConstant:](self->_badgeTrailingConstraint, "setConstant:", -v15);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_badgeTopConstraint, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
}

@end
