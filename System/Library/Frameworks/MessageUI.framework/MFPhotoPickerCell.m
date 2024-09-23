@implementation MFPhotoPickerCell

+ (NSString)reusableIdentifier
{
  return (NSString *)CFSTR("PhotoPickerCellIdentifier");
}

- (MFPhotoPickerCell)initWithFrame:(CGRect)a3
{
  MFPhotoPickerCell *v3;
  id v4;
  uint64_t v5;
  UIImageView *imageView;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  UIImageView *mediaTypeBadgeView;
  void *v14;
  uint64_t v15;
  UIImageView *selectedBadgeView;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIImageView *v24;
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
  void *v50;
  void *v51;
  void *v52;
  objc_super v53;
  _QWORD v54[10];

  v54[8] = *MEMORY[0x1E0C80C00];
  v53.receiver = self;
  v53.super_class = (Class)MFPhotoPickerCell;
  v3 = -[MFPhotoPickerCell initWithFrame:](&v53, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[MFPhotoPickerCell bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v5;

    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 2);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setClipsToBounds:](v3->_imageView, "setClipsToBounds:", 1);
    v7 = objc_alloc(MEMORY[0x1E0DC3890]);
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v12 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], v9, v10, v11);
    mediaTypeBadgeView = v3->_mediaTypeBadgeView;
    v3->_mediaTypeBadgeView = (UIImageView *)v12;

    -[UIImageView setContentMode:](v3->_mediaTypeBadgeView, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_mediaTypeBadgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v3->_mediaTypeBadgeView, "setTintColor:", v14);

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v8, v9, v10, v11);
    selectedBadgeView = v3->_selectedBadgeView;
    v3->_selectedBadgeView = (UIImageView *)v15;

    v17 = objc_alloc(MEMORY[0x1E0DC3870]);
    objc_msgSend(MEMORY[0x1E0DC3658], "mailInteractiveColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "_initWithFilledSystemImageNamed:fillColor:symbolColor:", CFSTR("checkmark.circle"), v18, v19);
    -[UIImageView setImage:](v3->_selectedBadgeView, "setImage:", v20);

    -[UIImageView setContentMode:](v3->_selectedBadgeView, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_selectedBadgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MFPhotoPickerCell contentView](v3, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v3->_imageView);

    -[MFPhotoPickerCell contentView](v3, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v3->_mediaTypeBadgeView);

    -[MFPhotoPickerCell contentView](v3, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v3->_selectedBadgeView);

    v24 = v3->_imageView;
    -[MFPhotoPickerCell contentView](v3, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView mf_pinToView:usingLayoutMargins:](v24, "mf_pinToView:usingLayoutMargins:", v25, 0);

    v26 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView widthAnchor](v3->_mediaTypeBadgeView, "widthAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToConstant:", 24.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v49;
    -[UIImageView heightAnchor](v3->_mediaTypeBadgeView, "heightAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToConstant:", 24.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v47;
    -[UIImageView leadingAnchor](v3->_mediaTypeBadgeView, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFPhotoPickerCell contentView](v3, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:constant:", 2.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v54[2] = v44;
    -[MFPhotoPickerCell contentView](v3, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v3->_mediaTypeBadgeView, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:constant:", 2.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v54[3] = v41;
    -[UIImageView widthAnchor](v3->_selectedBadgeView, "widthAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToConstant:", 24.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v54[4] = v39;
    -[UIImageView heightAnchor](v3->_selectedBadgeView, "heightAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToConstant:", 24.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v54[5] = v37;
    -[MFPhotoPickerCell contentView](v3, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v3->_selectedBadgeView, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, 2.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v54[6] = v29;
    -[MFPhotoPickerCell contentView](v3, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v3->_selectedBadgeView, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, 2.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v54[7] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 8);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v34);

  }
  return v3;
}

- (void)setProgress:(double)a3
{
  id v4;

  -[MFPhotoPickerCell progressView](self, "progressView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProgress:", a3);
  objc_msgSend(v4, "setHidden:", a3 >= 1.0);

}

- (void)resetProgress
{
  void *v3;

  -[MFPhotoPickerCell progressView](self, "progressView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[MFPhotoPickerCell setProgressView:](self, "setProgressView:", 0);
}

- (MFRoundProgressView)progressView
{
  MFRoundProgressView **p_progressView;
  MFRoundProgressView *v4;
  double v5;
  double v6;
  void *v7;

  p_progressView = &self->_progressView;
  v4 = self->_progressView;
  if (!v4)
  {
    -[MFPhotoPickerCell frame](self, "frame");
    v4 = -[MFRoundProgressView initWithFrame:]([MFRoundProgressView alloc], "initWithFrame:", v6 * 0.5 + -12.5, v5 * 0.5 + -12.5, 25.0, 25.0);
    -[MFPhotoPickerCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v4);

    objc_storeStrong((id *)p_progressView, v4);
  }
  return v4;
}

- (void)setThumbnailImage:(id)a3
{
  UIImage *v5;
  void *v6;
  UIImage *v7;

  v5 = (UIImage *)a3;
  if (self->_thumbnailImage != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_thumbnailImage, a3);
    -[MFPhotoPickerCell imageView](self, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v7);

    v5 = v7;
  }

}

- (void)setMediaType:(int64_t)a3
{
  void *v4;
  id v5;

  self->_mediaType = a3;
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("video.fill"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[MFPhotoPickerCell mediaTypeBadgeView](self, "mediaTypeBadgeView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:", v5);

  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFPhotoPickerCell;
  -[MFPhotoPickerCell setSelected:](&v7, sel_setSelected_);
  v5 = !v3;
  -[MFPhotoPickerCell selectedBadgeView](self, "selectedBadgeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFPhotoPickerCell;
  -[MFPhotoPickerCell prepareForReuse](&v5, sel_prepareForReuse);
  -[MFPhotoPickerCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

  -[MFPhotoPickerCell mediaTypeBadgeView](self, "mediaTypeBadgeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", 0);

  -[MFPhotoPickerCell setSelected:](self, "setSelected:", 0);
  -[MFPhotoPickerCell resetProgress](self, "resetProgress");
}

- (NSString)representedAssetIdentifier
{
  return self->_representedAssetIdentifier;
}

- (void)setRepresentedAssetIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 648);
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIImageView)mediaTypeBadgeView
{
  return self->_mediaTypeBadgeView;
}

- (void)setMediaTypeBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_mediaTypeBadgeView, a3);
}

- (UIImageView)selectedBadgeView
{
  return self->_selectedBadgeView;
}

- (void)setSelectedBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_selectedBadgeView, a3);
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_selectedBadgeView, 0);
  objc_storeStrong((id *)&self->_mediaTypeBadgeView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_representedAssetIdentifier, 0);
}

@end
