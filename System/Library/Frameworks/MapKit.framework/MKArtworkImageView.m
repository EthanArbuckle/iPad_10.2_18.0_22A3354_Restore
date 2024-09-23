@implementation MKArtworkImageView

- (MKArtworkImageView)initWithFrame:(CGRect)a3
{
  MKArtworkImageView *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)MKArtworkImageView;
  v3 = -[MKArtworkImageView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKArtworkImageView setTintColor:](v3, "setTintColor:", v4);

    v9[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)-[MKArtworkImageView registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v5, sel_traitEnvironment_didChangeTraitCollection_);

  }
  return v3;
}

- (void)setImageSource:(id)a3
{
  MKArtworkImageSource *v5;
  MKArtworkImageSource *v6;

  v5 = (MKArtworkImageSource *)a3;
  if (self->_imageSource != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_imageSource, a3);
    -[MKArtworkImageView _updateImageView](self, "_updateImageView");
    v5 = v6;
  }

}

- (void)_updateImageView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  UIImageView *cachedBadgeView;
  id v14;
  UIImageView *v15;
  UIImageView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  -[MKArtworkImageView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "scale");
    v7 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    v7 = v9;

  }
  v10 = -[UIView _mapkit_isDarkModeEnabled](self, "_mapkit_isDarkModeEnabled");
  -[MKArtworkImageSource imageToDisplayWithScreenScale:nightMode:](self->_imageSource, "imageToDisplayWithScreenScale:nightMode:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)MKArtworkImageView;
  -[MKArtworkImageView setImage:](&v24, sel_setImage_, v11);
  -[MKArtworkImageSource badgeImageToDisplayWithScreenScale:nightMode:](self->_imageSource, "badgeImageToDisplayWithScreenScale:nightMode:", v10, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  cachedBadgeView = self->_cachedBadgeView;
  if (v12)
  {
    if (!cachedBadgeView)
    {
      v14 = objc_alloc(MEMORY[0x1E0CEA658]);
      v15 = (UIImageView *)objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v16 = self->_cachedBadgeView;
      self->_cachedBadgeView = v15;

      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_cachedBadgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      cachedBadgeView = self->_cachedBadgeView;
    }
    -[MKArtworkImageView addSubview:](self, "addSubview:", cachedBadgeView);
    -[UIImageView setImage:](self->_cachedBadgeView, "setImage:", v12);
    -[MKArtworkImageView setClipsToBounds:](self, "setClipsToBounds:", 0);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](self->_cachedBadgeView, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKArtworkImageView bottomAnchor](self, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 2.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v20);

    -[UIImageView trailingAnchor](self->_cachedBadgeView, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKArtworkImageView trailingAnchor](self, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 6.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v23);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v17);
  }
  else
  {
    -[UIImageView setImage:](self->_cachedBadgeView, "setImage:", 0);
    -[UIImageView removeFromSuperview](self->_cachedBadgeView, "removeFromSuperview");
  }

}

- (UIImageView)badgeView
{
  void *cachedBadgeView;
  void *v4;
  UIImageView *v5;

  -[UIImageView superview](self->_cachedBadgeView, "superview");
  cachedBadgeView = (void *)objc_claimAutoreleasedReturnValue();
  v4 = cachedBadgeView;
  if (cachedBadgeView)
    cachedBadgeView = self->_cachedBadgeView;
  v5 = cachedBadgeView;

  return v5;
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v5 = objc_msgSend(a4, "userInterfaceStyle", a3);
  -[MKArtworkImageView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
    -[MKArtworkImageView _updateImageView](self, "_updateImageView");
}

- (MKArtworkImageSource)imageSource
{
  return self->_imageSource;
}

- (UIColor)primaryTintColor
{
  return self->_primaryTintColor;
}

- (void)setPrimaryTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTintColor, a3);
}

- (UIColor)secondaryTintColor
{
  return self->_secondaryTintColor;
}

- (void)setSecondaryTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTintColor, 0);
  objc_storeStrong((id *)&self->_primaryTintColor, 0);
  objc_storeStrong((id *)&self->_imageSource, 0);
  objc_storeStrong((id *)&self->_cachedBadgeView, 0);
}

@end
