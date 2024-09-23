@implementation AVTStickerRecentsStickerCollectionViewCell

+ (id)identifier
{
  return CFSTR("AVTStickerRecentsStickerCollectionViewCell");
}

- (AVTStickerRecentsStickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  AVTStickerRecentsStickerCollectionViewCell *v3;
  id v4;
  uint64_t v5;
  UIImageView *imageView;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTStickerRecentsStickerCollectionViewCell;
  v3 = -[AVTStickerRecentsStickerCollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    -[AVTStickerRecentsStickerCollectionViewCell contentBounds](v3, "contentBounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v5;

    -[AVTStickerRecentsStickerCollectionViewCell updateWithDefaultImage](v3, "updateWithDefaultImage");
    -[UIImageView setAccessibilityIgnoresInvertColors:](v3->_imageView, "setAccessibilityIgnoresInvertColors:", 1);
    -[AVTStickerRecentsStickerCollectionViewCell contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v3->_imageView);

  }
  return v3;
}

- (void)updateWithDefaultImage
{
  void *v3;
  id v4;

  -[AVTStickerRecentsStickerCollectionViewCell traitCollection](self, "traitCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  AVTFlatSilhouetteImageForTraitCollection(v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_imageView, "setImage:", v3);

}

- (CGRect)contentBounds
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGRect v11;

  -[AVTStickerRecentsStickerCollectionViewCell contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11.origin.x = v4;
  v11.origin.y = v6;
  v11.size.width = v8;
  v11.size.height = v10;
  return CGRectInset(v11, 4.0, 4.0);
}

- (void)setShowPrereleaseSticker:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  if (self->_showPrereleaseSticker != a3)
  {
    v3 = a3;
    self->_showPrereleaseSticker = a3;
    if (a3)
      -[AVTStickerRecentsStickerCollectionViewCell setupPrereleaseLabelIfNeeded](self, "setupPrereleaseLabelIfNeeded");
    -[AVTStickerRecentsStickerCollectionViewCell prereleaseLabel](self, "prereleaseLabel");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", !v3);

  }
}

- (void)setupPrereleaseLabelIfNeeded
{
  void *v3;
  id v4;
  double v5;
  double v6;
  UILabel *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UILabel *prereleaseLabel;

  -[AVTStickerRecentsStickerCollectionViewCell prereleaseLabel](self, "prereleaseLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    -[AVTStickerRecentsStickerCollectionViewCell bounds](self, "bounds");
    v6 = v5 + -15.0;
    -[AVTStickerRecentsStickerCollectionViewCell bounds](self, "bounds");
    v7 = (UILabel *)objc_msgSend(v4, "initWithFrame:", 0.0, v6);
    -[UILabel setAutoresizingMask:](v7, "setAutoresizingMask:", 10);
    AVTAvatarUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("STICKER_PRERELEASE"), &stru_1EA5207B8, CFSTR("Localized"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v7, "setText:", v9);

    -[UILabel setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);
    -[UILabel setTextAlignment:](v7, "setTextAlignment:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v7, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7, "setTextColor:", v10);

    -[AVTStickerRecentsStickerCollectionViewCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v7);

    prereleaseLabel = self->_prereleaseLabel;
    self->_prereleaseLabel = v7;

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  objc_super v51;

  v51.receiver = self;
  v51.super_class = (Class)AVTStickerRecentsStickerCollectionViewCell;
  -[AVTStickerRecentsStickerCollectionViewCell layoutSubviews](&v51, sel_layoutSubviews);
  -[AVTStickerRecentsStickerCollectionViewCell contentBounds](self, "contentBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[AVTStickerRecentsStickerCollectionViewCell imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "image");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[AVTStickerRecentsStickerCollectionViewCell imageView](self, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "image");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "size");
    v17 = v16;
    v19 = v18;
    v20 = *MEMORY[0x1E0C9D820];
    v21 = *(double *)(MEMORY[0x1E0C9D820] + 8);

    if (v17 != v20 || v19 != v21)
    {
      -[AVTStickerRecentsStickerCollectionViewCell imageView](self, "imageView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "image");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "size");
      v50 = v25;
      -[AVTStickerRecentsStickerCollectionViewCell imageView](self, "imageView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "image");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "size");
      v49 = v28;

      -[AVTStickerRecentsStickerCollectionViewCell imageView](self, "imageView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "image");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "size");
      v32 = v31;
      v34 = v33;
      -[AVTStickerRecentsStickerCollectionViewCell imageView](self, "imageView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "image");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "size");
      v38 = v37;
      v40 = v39;

      if (v50 <= v49)
      {
        v42 = v8;
        v41 = v8 * v34 / v38;
      }
      else
      {
        v41 = v10;
        v42 = v10 * v32 / v40;
      }
      goto LABEL_10;
    }
  }
  else
  {

  }
  v41 = v10;
  v42 = v8;
LABEL_10:
  -[AVTStickerRecentsStickerCollectionViewCell imageView](self, "imageView", *(_QWORD *)&v49);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setFrame:", v4 + (v8 - v42) * 0.5, v6 + (v10 - v41) * 0.5, v42, v41);

  if (-[AVTStickerRecentsStickerCollectionViewCell showPrereleaseSticker](self, "showPrereleaseSticker"))
  {
    -[AVTStickerRecentsStickerCollectionViewCell bounds](self, "bounds");
    v45 = v44 + -15.0;
    -[AVTStickerRecentsStickerCollectionViewCell bounds](self, "bounds");
    v47 = v46;
    -[AVTStickerRecentsStickerCollectionViewCell prereleaseLabel](self, "prereleaseLabel");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setFrame:", 0.0, v45, v47, 15.0);

  }
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  if (self->_title != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    title = self->_title;
    self->_title = v4;

  }
}

- (void)updateWithImage:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0D00668], "trimmedImageByTrimmingTransparentPixelsFromImage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_imageView, "setImage:", v4);

  -[AVTStickerRecentsStickerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)prepareForReuse
{
  NSUUID *displaySessionUUID;
  NSString *title;
  objc_super v5;

  displaySessionUUID = self->_displaySessionUUID;
  self->_displaySessionUUID = 0;

  title = self->_title;
  self->_title = 0;

  -[AVTStickerRecentsStickerCollectionViewCell setShowPrereleaseSticker:](self, "setShowPrereleaseSticker:", 0);
  -[AVTStickerRecentsStickerCollectionViewCell updateWithDefaultImage](self, "updateWithDefaultImage");
  -[AVTStickerRecentsStickerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  v5.receiver = self;
  v5.super_class = (Class)AVTStickerRecentsStickerCollectionViewCell;
  -[AVTStickerRecentsStickerCollectionViewCell prepareForReuse](&v5, sel_prepareForReuse);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (NSString)title
{
  return self->_title;
}

- (NSUUID)displaySessionUUID
{
  return self->_displaySessionUUID;
}

- (void)setDisplaySessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_displaySessionUUID, a3);
}

- (BOOL)showPrereleaseSticker
{
  return self->_showPrereleaseSticker;
}

- (UILabel)prereleaseLabel
{
  return self->_prereleaseLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prereleaseLabel, 0);
  objc_storeStrong((id *)&self->_displaySessionUUID, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
