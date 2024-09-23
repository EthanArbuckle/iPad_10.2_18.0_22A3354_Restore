@implementation HUWallpaperThumbnailCell

- (HUWallpaperThumbnailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUWallpaperThumbnailCell *v4;
  HUWallpaperThumbnailCell *v5;
  double *p_width;
  id v7;
  uint64_t v8;
  UIImageView *imageThumbnailView;
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
  uint64_t v28;
  NSLayoutConstraint *imageHeightConstraint;
  double v30;
  void *v31;
  uint64_t v32;
  NSLayoutConstraint *imageWidthConstraint;
  void *v34;
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
  uint64_t v47;
  UIDropInteraction *dropInteraction;
  void *v49;
  void *v50;
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)HUWallpaperThumbnailCell;
  v4 = -[HUWallpaperThumbnailCell initWithStyle:reuseIdentifier:](&v52, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v5 = v4;
  if (v4)
  {
    p_width = &v4->_imageSize.width;
    v4->_imageSize = (CGSize)vdupq_n_s64(0x4049000000000000uLL);
    v4->_contentMode = 2;
    v7 = objc_alloc(MEMORY[0x1E0CEA658]);
    v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    imageThumbnailView = v5->_imageThumbnailView;
    v5->_imageThumbnailView = (UIImageView *)v8;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_imageThumbnailView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v5->_imageThumbnailView, "setContentMode:", v5->_contentMode);
    -[UIImageView setClipsToBounds:](v5->_imageThumbnailView, "setClipsToBounds:", 1);
    -[HUWallpaperThumbnailCell contentView](v5, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v5->_imageThumbnailView);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView centerXAnchor](v5->_imageThumbnailView, "centerXAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperThumbnailCell contentView](v5, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layoutMarginsGuide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "centerXAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v16);

    -[UIImageView leadingAnchor](v5->_imageThumbnailView, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperThumbnailCell contentView](v5, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutMarginsGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintGreaterThanOrEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v21);

    -[UIImageView trailingAnchor](v5->_imageThumbnailView, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperThumbnailCell contentView](v5, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layoutMarginsGuide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintLessThanOrEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v26);

    -[UIImageView heightAnchor](v5->_imageThumbnailView, "heightAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToConstant:", v5->_imageSize.height);
    v28 = objc_claimAutoreleasedReturnValue();
    imageHeightConstraint = v5->_imageHeightConstraint;
    v5->_imageHeightConstraint = (NSLayoutConstraint *)v28;

    LODWORD(v30) = 1144750080;
    -[NSLayoutConstraint setPriority:](v5->_imageHeightConstraint, "setPriority:", v30);
    objc_msgSend(v11, "addObject:", v5->_imageHeightConstraint);
    -[UIImageView widthAnchor](v5->_imageThumbnailView, "widthAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToConstant:", *p_width);
    v32 = objc_claimAutoreleasedReturnValue();
    imageWidthConstraint = v5->_imageWidthConstraint;
    v5->_imageWidthConstraint = (NSLayoutConstraint *)v32;

    objc_msgSend(v11, "addObject:", v5->_imageWidthConstraint);
    -[UIImageView centerYAnchor](v5->_imageThumbnailView, "centerYAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperThumbnailCell contentView](v5, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "layoutMarginsGuide");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "centerYAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v38);

    -[UIImageView topAnchor](v5->_imageThumbnailView, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperThumbnailCell contentView](v5, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintGreaterThanOrEqualToAnchor:constant:", v41, 16.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v42);

    -[UIImageView bottomAnchor](v5->_imageThumbnailView, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperThumbnailCell contentView](v5, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintLessThanOrEqualToAnchor:constant:", v45, 16.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v46);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v11);
    v47 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA588]), "initWithDelegate:", v5);
    dropInteraction = v5->_dropInteraction;
    v5->_dropInteraction = (UIDropInteraction *)v47;

    -[HUWallpaperThumbnailCell contentView](v5, "contentView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperThumbnailCell dropInteraction](v5, "dropInteraction");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addInteraction:", v50);

  }
  return v5;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v4;
  char v5;

  v4 = a4;
  v5 = objc_msgSend(v4, "canLoadObjectsOfClass:", objc_opt_class());

  return v5;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  void *v4;
  _BOOL4 v5;

  objc_msgSend(a4, "items", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)objc_msgSend(v4, "count") < 2;

  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA590]), "initWithDropOperation:", 2 * v5);
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];

  objc_msgSend(a4, "items", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__HUWallpaperThumbnailCell_dropInteraction_performDrop___block_invoke;
  v10[3] = &unk_1E6F4DF08;
  v10[4] = self;
  v9 = (id)objc_msgSend(v7, "loadObjectOfClass:completionHandler:", v8, v10);

}

void __56__HUWallpaperThumbnailCell_dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  char isKindOfClass;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __56__HUWallpaperThumbnailCell_dropInteraction_performDrop___block_invoke_2;
      v7[3] = &unk_1E6F4C638;
      v7[4] = *(_QWORD *)(a1 + 32);
      v8 = v3;
      dispatch_async(MEMORY[0x1E0C80D38], v7);

    }
  }

}

void __56__HUWallpaperThumbnailCell_dropInteraction_performDrop___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wallpaperThumbnailCell:didReceiveDroppedImage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a4, "items", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 1)
    -[HUWallpaperThumbnailCell setSelected:animated:](self, "setSelected:animated:", 1, 1);
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  -[HUWallpaperThumbnailCell setSelected:animated:](self, "setSelected:animated:", 0, 1);
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  -[HUWallpaperThumbnailCell setSelected:animated:](self, "setSelected:animated:", 0, 1);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUWallpaperThumbnailCell;
  -[HUWallpaperThumbnailCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HUWallpaperThumbnailCell setImage:](self, "setImage:", 0);
  -[HUWallpaperThumbnailCell setImageSize:](self, "setImageSize:", 50.0, 50.0);
}

- (void)setImageSize:(CGSize)a3
{
  double height;
  CGSize *p_imageSize;
  void *v6;
  double width;
  id v8;

  height = a3.height;
  p_imageSize = &self->_imageSize;
  self->_imageSize = a3;
  -[HUWallpaperThumbnailCell imageHeightConstraint](self, "imageHeightConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", height);

  width = p_imageSize->width;
  -[HUWallpaperThumbnailCell imageWidthConstraint](self, "imageWidthConstraint");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", width);

}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[HUWallpaperThumbnailCell imageThumbnailView](self, "imageThumbnailView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUWallpaperThumbnailCell imageThumbnailView](self, "imageThumbnailView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (void)setContentMode:(int64_t)a3
{
  id v4;

  self->_contentMode = a3;
  -[HUWallpaperThumbnailCell imageThumbnailView](self, "imageThumbnailView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentMode:", a3);

}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (HUWallpaperThumbnailCellDelegate)delegate
{
  return (HUWallpaperThumbnailCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImageView)imageThumbnailView
{
  return self->_imageThumbnailView;
}

- (void)setImageThumbnailView:(id)a3
{
  objc_storeStrong((id *)&self->_imageThumbnailView, a3);
}

- (NSLayoutConstraint)imageWidthConstraint
{
  return self->_imageWidthConstraint;
}

- (void)setImageWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageWidthConstraint, a3);
}

- (NSLayoutConstraint)imageHeightConstraint
{
  return self->_imageHeightConstraint;
}

- (void)setImageHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageHeightConstraint, a3);
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (void)setDropInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_dropInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong((id *)&self->_imageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageThumbnailView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
