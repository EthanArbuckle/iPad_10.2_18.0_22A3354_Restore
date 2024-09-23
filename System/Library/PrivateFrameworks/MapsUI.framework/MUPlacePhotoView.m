@implementation MUPlacePhotoView

- (MUPlacePhotoView)initWithImage:(id)a3
{
  id v5;
  MUPlacePhotoView *v6;
  void *v7;
  uint64_t v8;
  UIImageView *imageView;
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
  id v22;
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
  id v35;
  objc_super v36;
  void *v37;
  _QWORD v38[8];

  v38[6] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)MUPlacePhotoView;
  v6 = -[MUPlacePhotoView initWithFrame:](&v36, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v35 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlacePhotoView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[MUPlacePhotoView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 1);
    -[MUPlacePhotoView setClipsToBounds:](v6, "setClipsToBounds:", 1);
    -[MUPlacePhotoView setDelegate:](v6, "setDelegate:", v6);
    -[MUPlacePhotoView setContentMode:](v6, "setContentMode:", 4);
    -[MUPlacePhotoView setMaximumZoomScale:](v6, "setMaximumZoomScale:", 3.0);
    -[MUPlacePhotoView setMinimumZoomScale:](v6, "setMinimumZoomScale:", 1.0);
    -[MUPlacePhotoView setDecelerationRate:](v6, "setDecelerationRate:", 0.850000024);
    -[MUPlacePhotoView setShowsVerticalScrollIndicator:](v6, "setShowsVerticalScrollIndicator:", 0);
    -[MUPlacePhotoView setShowsHorizontalScrollIndicator:](v6, "setShowsHorizontalScrollIndicator:", 0);
    -[MUPlacePhotoView setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", CFSTR("PlacePhotoView"));
    objc_storeStrong((id *)&v6->_image, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v6->_image);
    imageView = v6->_imageView;
    v6->_imageView = (UIImageView *)v8;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v6->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setAccessibilityIgnoresInvertColors:](v6->_imageView, "setAccessibilityIgnoresInvertColors:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v6->_imageView, "setBackgroundColor:", v10);

    -[UIImageView setContentMode:](v6->_imageView, "setContentMode:", 1);
    -[UIImageView setUserInteractionEnabled:](v6->_imageView, "setUserInteractionEnabled:", 1);
    -[UIImageView setAccessibilityIdentifier:](v6->_imageView, "setAccessibilityIdentifier:", CFSTR("ImageView"));
    -[MUPlacePhotoView addSubview:](v6, "addSubview:", v6->_imageView);
    v27 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView leadingAnchor](v6->_imageView, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlacePhotoView leadingAnchor](v6, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v32;
    -[UIImageView trailingAnchor](v6->_imageView, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlacePhotoView trailingAnchor](v6, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v29;
    -[UIImageView topAnchor](v6->_imageView, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlacePhotoView topAnchor](v6, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v25;
    -[UIImageView bottomAnchor](v6->_imageView, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlacePhotoView bottomAnchor](v6, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v12;
    -[UIImageView heightAnchor](v6->_imageView, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlacePhotoView heightAnchor](v6, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38[4] = v15;
    -[UIImageView widthAnchor](v6->_imageView, "widthAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlacePhotoView widthAnchor](v6, "widthAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v38[5] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v19);

    objc_opt_self();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)-[MUPlacePhotoView registerForTraitChanges:withAction:](v6, "registerForTraitChanges:withAction:", v21, sel__updateObfuscationText);

    v5 = v35;
  }

  return v6;
}

- (void)setImage:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if ((-[UIImage isEqual:](self->_image, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_image, a3);
    -[MUPlacePhotoView _updateObfuscationPosition](self, "_updateObfuscationPosition");
    v6 = (void *)MEMORY[0x1E0DC3F10];
    -[MUPlacePhotoView imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __29__MUPlacePhotoView_setImage___block_invoke;
    v8[3] = &unk_1E2E01730;
    v8[4] = self;
    v9 = v5;
    objc_msgSend(v6, "transitionWithView:duration:options:animations:completion:", v7, 5242880, v8, 0, 0.200000003);

  }
}

void __29__MUPlacePhotoView_setImage___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v1);

}

- (void)zoomWithGestureRecognizer:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;

  v22 = a3;
  if (-[MUPlacePhotoView isZoomed](self, "isZoomed"))
  {
    -[MUPlacePhotoView minimumZoomScale](self, "minimumZoomScale");
    -[MUPlacePhotoView setZoomScale:animated:](self, "setZoomScale:animated:", 1);
  }
  else
  {
    objc_msgSend(v22, "locationInView:", self);
    v5 = v4;
    v7 = v6;
    -[MUPlacePhotoView frame](self, "frame");
    v9 = v8;
    -[MUPlacePhotoView maximumZoomScale](self, "maximumZoomScale");
    v11 = v9 / v10;
    -[MUPlacePhotoView frame](self, "frame");
    v13 = v12;
    -[MUPlacePhotoView maximumZoomScale](self, "maximumZoomScale");
    v15 = v13 / v14;
    if (v5 - v11 * 0.5 >= 0.0)
      v16 = v5 - v11 * 0.5;
    else
      v16 = 0.0;
    if (v7 - v15 * 0.5 >= 0.0)
      v17 = v7 - v15 * 0.5;
    else
      v17 = 0.0;
    -[MUPlacePhotoView frame](self, "frame");
    if (v11 + v16 > v18)
    {
      -[MUPlacePhotoView frame](self, "frame");
      v16 = v19 - v11;
    }
    -[MUPlacePhotoView frame](self, "frame");
    if (v15 + v17 > v20)
    {
      -[MUPlacePhotoView frame](self, "frame");
      v17 = v21 - v15;
    }
    -[MUPlacePhotoView zoomToRect:animated:](self, "zoomToRect:animated:", 1, v16, v17, v11, v15);
  }

}

- (BOOL)isZoomed
{
  double v3;
  double v4;
  double v5;

  -[MUPlacePhotoView zoomScale](self, "zoomScale");
  v4 = v3;
  -[MUPlacePhotoView minimumZoomScale](self, "minimumZoomScale");
  return v4 != v5;
}

- (void)setObfuscationModel:(id)a3
{
  MUPlacePhotoViewObfuscationModel *obfuscationModel;
  MUPlacePhotoViewObfuscationModel *v5;
  MUPlacePhotoViewObfuscationModel *v6;
  MUPlacePhotoViewObfuscationModel *v7;
  id v8;

  v8 = a3;
  if ((-[MUPlacePhotoViewObfuscationModel isEqual:](self->_obfuscationModel, "isEqual:") & 1) == 0)
  {
    obfuscationModel = self->_obfuscationModel;
    v5 = (MUPlacePhotoViewObfuscationModel *)v8;
    v6 = self->_obfuscationModel;
    self->_obfuscationModel = v5;
    v7 = obfuscationModel;

    -[MUPlacePhotoView _updateObfuscationWithPreviousModel:](self, "_updateObfuscationWithPreviousModel:", v7);
  }

}

- (void)_updateObfuscationWithPreviousModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MUPlacePhotoObfuscationView *v8;
  MUPlacePhotoObfuscationView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "tapGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MUPlacePhotoView obfuscationView](self, "obfuscationView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tapGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeGestureRecognizer:", v6);

  }
  if (self->_obfuscationModel)
  {
    -[MUPlacePhotoView obfuscationView](self, "obfuscationView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = [MUPlacePhotoObfuscationView alloc];
      v9 = -[MUPlacePhotoObfuscationView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[MUPlacePhotoView setObfuscationView:](self, "setObfuscationView:", v9);

      -[MUPlacePhotoView imageView](self, "imageView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlacePhotoView obfuscationView](self, "obfuscationView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", v11);

      -[MUPlacePhotoView _updateObfuscationPosition](self, "_updateObfuscationPosition");
    }
  }
  -[MUPlacePhotoViewObfuscationModel tapGestureRecognizer](self->_obfuscationModel, "tapGestureRecognizer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MUPlacePhotoView obfuscationView](self, "obfuscationView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlacePhotoViewObfuscationModel tapGestureRecognizer](self->_obfuscationModel, "tapGestureRecognizer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addGestureRecognizer:", v14);

  }
  v15 = self->_obfuscationModel == 0;
  -[MUPlacePhotoView obfuscationView](self, "obfuscationView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", v15);

  -[MUPlacePhotoView _updateObfuscationText](self, "_updateObfuscationText");
}

- (void)_updateObfuscationText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MUPlacePhotoView *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapkit_fontWithWeight:", *MEMORY[0x1E0DC1448]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUPlacePhotoViewObfuscationModel providerName](self->_obfuscationModel, "providerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (objc_msgSend(v5, "length"))
  {
    v20 = self;
    v21 = *MEMORY[0x1E0DC1138];
    v22[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _MULocalizedStringFromThisBundle(CFSTR("View on %@ %@"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v19, v7);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v7);
    v10 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v6, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "_mapsui_systemImageNamed:withConfiguration:", CFSTR("arrow.up.right.square.fill"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageWithRenderingMode:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v13);

    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3498], "localizedAttributedStringWithFormat:options:", v8, 2, v9, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    if (v7)
      objc_msgSend(v16, "addAttributes:range:", v7, 0, objc_msgSend(v16, "length"));
    v17 = (void *)objc_msgSend(v16, "copy");

    self = v20;
  }
  else
  {
    v17 = 0;
  }

  -[MUPlacePhotoView obfuscationView](self, "obfuscationView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAttributedText:", v17);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MUPlacePhotoView;
  -[MUPlacePhotoView layoutSubviews](&v3, sel_layoutSubviews);
  -[MUPlacePhotoView _updateObfuscationPosition](self, "_updateObfuscationPosition");
}

- (void)_updateObfuscationPosition
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double Height;
  void *v15;
  double Width;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  CGRect v25;
  CGRect v26;

  -[MUPlacePhotoView obfuscationView](self, "obfuscationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MUPlacePhotoView image](self, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "size");
    v6 = v5;

    if (v6 != 0.0)
    {
      -[MUPlacePhotoView image](self, "image");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "size");
      v9 = v8;
      -[MUPlacePhotoView image](self, "image");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "size");
      v12 = v9 / v11;

      -[MUPlacePhotoView imageView](self, "imageView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      Height = CGRectGetHeight(v25);

      -[MUPlacePhotoView imageView](self, "imageView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bounds");
      Width = CGRectGetWidth(v26);

      v17 = Width / v12;
      if (v12 * Height < Width)
        Width = v12 * Height;
      if (v17 < Height)
        Height = v17;
      -[MUPlacePhotoView obfuscationView](self, "obfuscationView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFrame:", 0.0, 0.0, Width, Height);

      -[MUPlacePhotoView imageView](self, "imageView");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "center");
      v20 = v19;
      v22 = v21;
      -[MUPlacePhotoView obfuscationView](self, "obfuscationView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setCenter:", v20, v22);

    }
  }
}

- (UIImage)image
{
  return self->_image;
}

- (void)setIsZoomed:(BOOL)a3
{
  self->_isZoomed = a3;
}

- (BOOL)needsFullImageDownload
{
  return self->_needsFullImageDownload;
}

- (void)setNeedsFullImageDownload:(BOOL)a3
{
  self->_needsFullImageDownload = a3;
}

- (MUPlacePhotoViewObfuscationModel)obfuscationModel
{
  return self->_obfuscationModel;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (MUPlacePhotoObfuscationView)obfuscationView
{
  return self->_obfuscationView;
}

- (void)setObfuscationView:(id)a3
{
  objc_storeStrong((id *)&self->_obfuscationView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obfuscationView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_obfuscationModel, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
