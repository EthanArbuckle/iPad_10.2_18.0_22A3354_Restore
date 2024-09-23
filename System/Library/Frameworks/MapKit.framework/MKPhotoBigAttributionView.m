@implementation MKPhotoBigAttributionView

+ (id)bigAttributionViewForMapItem:(id)a3 attributionType:(int64_t)a4 isFirstParty:(BOOL)a5 context:(int64_t)a6
{
  __objc2_class **v8;
  objc_class *v9;
  id v10;
  void *v11;

  v8 = off_1E20D4CB8;
  if (!a5)
    v8 = off_1E20D50B8;
  v9 = (objc_class *)*v8;
  v10 = a3;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithContext:", a6);
  objc_msgSend(v11, "setMapItem:", v10);

  objc_msgSend(v11, "setType:", a4);
  return v11;
}

- (MKPhotoBigAttributionView)initWithContext:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  MKPhotoBigAttributionView *v8;
  MKPhotoBigAttributionView *v9;
  UIImageView *v10;
  UIImageView *imageView;
  UIView *contentView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIView *v17;
  uint64_t v18;
  UIView *v19;
  UIView *backgroundView;
  uint64_t v21;
  UIActivityIndicatorView *spinner;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
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
  UIView *v50;
  void *v51;
  void *v52;
  UIImageView *v53;
  void *v54;
  void *v55;
  void *v56;
  objc_super v57;
  _QWORD v58[8];
  _QWORD v59[4];

  v59[2] = *MEMORY[0x1E0C80C00];
  v57.receiver = self;
  v57.super_class = (Class)MKPhotoBigAttributionView;
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = -[MKPhotoBigAttributionView initWithFrame:](&v57, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_needsImageLoad = 1;
    v8->_context = a3;
    v10 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v4, v5, v6, v7);
    -[MKPhotoBigAttributionView setClipsToBounds:](v9, "setClipsToBounds:", 1);
    -[UIImageView setClipsToBounds:](v10, "setClipsToBounds:", 1);
    -[UIImageView setContentMode:](v10, "setContentMode:", 2);
    imageView = v9->_imageView;
    v9->_imageView = v10;
    v53 = v10;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v9->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKPhotoBigAttributionView addSubview:](v9, "addSubview:", v9->_imageView);
    contentView = v9->_contentView;
    v9->_contentView = 0;

    v13 = (void *)MEMORY[0x1E0CEABE0];
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "effectCompositingColor:", v14);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithBlurRadius:", 14.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CEABE0];
    v59[0] = v56;
    v59[1] = v55;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "effectCombiningEffects:", v16);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v54);
    -[UIView contentView](v17, "contentView");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v9->_contentView;
    v9->_contentView = (UIView *)v18;

    backgroundView = v9->_backgroundView;
    v9->_backgroundView = v17;
    v50 = v17;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v9->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKPhotoBigAttributionView addSubview:](v9, "addSubview:", v9->_backgroundView);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithFrame:", v4, v5, v6, v7);
    spinner = v9->_spinner;
    v9->_spinner = (UIActivityIndicatorView *)v21;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v9->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView setHidesWhenStopped:](v9->_spinner, "setHidesWhenStopped:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setColor:](v9->_spinner, "setColor:", v23);

    -[MKPhotoBigAttributionView contentView](v9, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v9->_spinner);

    v40 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView leadingAnchor](v9->_imageView, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPhotoBigAttributionView leadingAnchor](v9, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v51);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v49;
    -[UIImageView trailingAnchor](v9->_imageView, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPhotoBigAttributionView trailingAnchor](v9, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v46;
    -[UIImageView topAnchor](v9->_imageView, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPhotoBigAttributionView topAnchor](v9, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = v43;
    -[UIImageView bottomAnchor](v9->_imageView, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPhotoBigAttributionView bottomAnchor](v9, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v58[3] = v39;
    -[UIView leadingAnchor](v9->_backgroundView, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPhotoBigAttributionView leadingAnchor](v9, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v58[4] = v36;
    -[UIView trailingAnchor](v9->_backgroundView, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPhotoBigAttributionView trailingAnchor](v9, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v58[5] = v26;
    -[UIView topAnchor](v9->_backgroundView, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPhotoBigAttributionView topAnchor](v9, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v58[6] = v29;
    -[UIView bottomAnchor](v9->_backgroundView, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPhotoBigAttributionView bottomAnchor](v9, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v58[7] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 8);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "activateConstraints:", v33);

  }
  return v9;
}

- (void)beginAnimatingActivityIndicator
{
  id v3;

  -[MKPhotoBigAttributionView willStartAnimatingActivityIndicatorView](self, "willStartAnimatingActivityIndicatorView");
  -[MKPhotoBigAttributionView spinner](self, "spinner");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAnimating");

}

- (void)endAnimatingActivityIndicatorWithError:(id)a3
{
  void *v4;

  -[MKPhotoBigAttributionView spinner](self, "spinner", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAnimating");

  -[MKPhotoBigAttributionView didEndAnimatingActivityIndicatorView](self, "didEndAnimatingActivityIndicatorView");
}

- (void)setMapItem:(id)a3
{
  MKMapItem *v5;
  MKMapItem *v6;

  v5 = (MKMapItem *)a3;
  if (self->_mapItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mapItem, a3);
    -[MKPhotoBigAttributionView updateBackgroundIfNeeded](self, "updateBackgroundIfNeeded");
    -[MKPhotoBigAttributionView didUpdateMapItem](self, "didUpdateMapItem");
    v5 = v6;
  }

}

- (void)setType:(int64_t)a3
{
  if (self->_type != a3)
  {
    self->_type = a3;
    -[MKPhotoBigAttributionView didUpdateAttributionViewType](self, "didUpdateAttributionViewType");
  }
}

- (void)updateBackgroundIfNeeded
{
  double v3;
  double v4;
  MKMapItemPhoto *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MKMapItemPhoto *v11;
  CGFloat Width;
  void *v13;
  void *v14;
  _QWORD v15[5];
  CGRect v16;

  if (self->_needsImageLoad)
  {
    -[MKPhotoBigAttributionView frame](self, "frame");
    if (v4 != *MEMORY[0x1E0C9D820] || v3 != *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      self->_needsImageLoad = 0;
      v6 = [MKMapItemPhoto alloc];
      -[MKPhotoBigAttributionView mapItem](self, "mapItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_geoMapItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_photos");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[MKMapItemPhoto initWithGeoMapItemPhoto:](v6, "initWithGeoMapItemPhoto:", v10);

      -[UIImageView frame](self->_imageView, "frame");
      Width = CGRectGetWidth(v16);
      -[MKMapItemPhoto urlForBestPhotoForSize:](v11, "urlForBestPhotoForSize:", Width, Width);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        +[MKAppImageManager sharedImageManager](MKAppImageManager, "sharedImageManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __53__MKPhotoBigAttributionView_updateBackgroundIfNeeded__block_invoke;
        v15[3] = &unk_1E20D96B8;
        v15[4] = self;
        objc_msgSend(v14, "loadAppImageAtURL:completionHandler:", v13, v15);

      }
    }
  }
}

void __53__MKPhotoBigAttributionView_updateBackgroundIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CEABB0];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v5 + 416);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__MKPhotoBigAttributionView_updateBackgroundIfNeeded__block_invoke_2;
  v8[3] = &unk_1E20D7E58;
  v8[4] = v5;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "transitionWithView:duration:options:animations:completion:", v6, 5242880, v8, 0, 0.200000003);

}

uint64_t __53__MKPhotoBigAttributionView_updateBackgroundIfNeeded__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setImage:", *(_QWORD *)(a1 + 40));
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKPhotoBigAttributionView;
  -[MKPhotoBigAttributionView layoutSubviews](&v3, sel_layoutSubviews);
  -[MKPhotoBigAttributionView updateBackgroundIfNeeded](self, "updateBackgroundIfNeeded");
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (int64_t)context
{
  return self->_context;
}

- (int64_t)type
{
  return self->_type;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
