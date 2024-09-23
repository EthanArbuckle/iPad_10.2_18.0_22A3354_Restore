@implementation HUWallpaperThumbnailCollectionCell

- (HUWallpaperThumbnailCollectionCell)initWithFrame:(CGRect)a3
{
  HUWallpaperThumbnailCollectionCell *v3;
  HUWallpaperThumbnailCollectionCell *v4;
  double *p_width;
  id v6;
  uint64_t v7;
  UIImageView *imageThumbnailView;
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
  uint64_t v23;
  NSLayoutConstraint *imageHeightConstraint;
  double v25;
  void *v26;
  uint64_t v27;
  NSLayoutConstraint *imageWidthConstraint;
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
  uint64_t v39;
  UIDropInteraction *dropInteraction;
  void *v41;
  void *v42;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)HUWallpaperThumbnailCollectionCell;
  v3 = -[HUWallpaperThumbnailCollectionCell initWithFrame:](&v44, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    p_width = &v3->_imageSize.width;
    v3->_imageSize = (CGSize)vdupq_n_s64(0x4049000000000000uLL);
    v3->_contentMode = 2;
    v6 = objc_alloc(MEMORY[0x1E0CEA658]);
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    imageThumbnailView = v4->_imageThumbnailView;
    v4->_imageThumbnailView = (UIImageView *)v7;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_imageThumbnailView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v4->_imageThumbnailView, "setContentMode:", v4->_contentMode);
    -[UIImageView setClipsToBounds:](v4->_imageThumbnailView, "setClipsToBounds:", 1);
    -[HUWallpaperThumbnailCollectionCell addSubview:](v4, "addSubview:", v4->_imageThumbnailView);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView centerXAnchor](v4->_imageThumbnailView, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperThumbnailCollectionCell layoutMarginsGuide](v4, "layoutMarginsGuide");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerXAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v13);

    -[UIImageView leadingAnchor](v4->_imageThumbnailView, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperThumbnailCollectionCell layoutMarginsGuide](v4, "layoutMarginsGuide");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v17);

    -[UIImageView trailingAnchor](v4->_imageThumbnailView, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperThumbnailCollectionCell layoutMarginsGuide](v4, "layoutMarginsGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintLessThanOrEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v21);

    -[UIImageView heightAnchor](v4->_imageThumbnailView, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToConstant:", v4->_imageSize.height);
    v23 = objc_claimAutoreleasedReturnValue();
    imageHeightConstraint = v4->_imageHeightConstraint;
    v4->_imageHeightConstraint = (NSLayoutConstraint *)v23;

    LODWORD(v25) = 1144750080;
    -[NSLayoutConstraint setPriority:](v4->_imageHeightConstraint, "setPriority:", v25);
    objc_msgSend(v9, "addObject:", v4->_imageHeightConstraint);
    -[UIImageView widthAnchor](v4->_imageThumbnailView, "widthAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToConstant:", *p_width);
    v27 = objc_claimAutoreleasedReturnValue();
    imageWidthConstraint = v4->_imageWidthConstraint;
    v4->_imageWidthConstraint = (NSLayoutConstraint *)v27;

    objc_msgSend(v9, "addObject:", v4->_imageWidthConstraint);
    -[UIImageView centerYAnchor](v4->_imageThumbnailView, "centerYAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperThumbnailCollectionCell layoutMarginsGuide](v4, "layoutMarginsGuide");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "centerYAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v32);

    -[UIImageView topAnchor](v4->_imageThumbnailView, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperThumbnailCollectionCell topAnchor](v4, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintGreaterThanOrEqualToAnchor:constant:", v34, 16.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v35);

    -[UIImageView bottomAnchor](v4->_imageThumbnailView, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperThumbnailCollectionCell bottomAnchor](v4, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintLessThanOrEqualToAnchor:constant:", v37, 16.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v38);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v9);
    v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA588]), "initWithDelegate:", v4);
    dropInteraction = v4->_dropInteraction;
    v4->_dropInteraction = (UIDropInteraction *)v39;

    -[HUWallpaperThumbnailCollectionCell contentView](v4, "contentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperThumbnailCollectionCell dropInteraction](v4, "dropInteraction");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addInteraction:", v42);

  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUWallpaperThumbnailCollectionCell;
  -[HUWallpaperThumbnailCollectionCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HUWallpaperThumbnailCollectionCell setImage:](self, "setImage:", 0);
  -[HUWallpaperThumbnailCollectionCell setImageSize:](self, "setImageSize:", 50.0, 50.0);
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
  v10[2] = __66__HUWallpaperThumbnailCollectionCell_dropInteraction_performDrop___block_invoke;
  v10[3] = &unk_1E6F4DF08;
  v10[4] = self;
  v9 = (id)objc_msgSend(v7, "loadObjectOfClass:completionHandler:", v8, v10);

}

void __66__HUWallpaperThumbnailCollectionCell_dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2)
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
      v7[2] = __66__HUWallpaperThumbnailCollectionCell_dropInteraction_performDrop___block_invoke_2;
      v7[3] = &unk_1E6F4C638;
      v7[4] = *(_QWORD *)(a1 + 32);
      v8 = v3;
      dispatch_async(MEMORY[0x1E0C80D38], v7);

    }
  }

}

void __66__HUWallpaperThumbnailCollectionCell_dropInteraction_performDrop___block_invoke_2(uint64_t a1)
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
  id v7;

  objc_msgSend(a4, "items", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 1)
  {
    -[HUWallpaperThumbnailCollectionCell configurationState](self, "configurationState");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelected:", 1);
    -[HUWallpaperThumbnailCollectionCell updateConfigurationUsingState:](self, "updateConfigurationUsingState:", v7);

  }
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  id v5;

  -[HUWallpaperThumbnailCollectionCell configurationState](self, "configurationState", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", 0);
  -[HUWallpaperThumbnailCollectionCell updateConfigurationUsingState:](self, "updateConfigurationUsingState:", v5);

}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  id v5;

  -[HUWallpaperThumbnailCollectionCell configurationState](self, "configurationState", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", 0);
  -[HUWallpaperThumbnailCollectionCell updateConfigurationUsingState:](self, "updateConfigurationUsingState:", v5);

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
  -[HUWallpaperThumbnailCollectionCell imageHeightConstraint](self, "imageHeightConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", height);

  width = p_imageSize->width;
  -[HUWallpaperThumbnailCollectionCell imageWidthConstraint](self, "imageWidthConstraint");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", width);

}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[HUWallpaperThumbnailCollectionCell imageThumbnailView](self, "imageThumbnailView");
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
  -[HUWallpaperThumbnailCollectionCell imageThumbnailView](self, "imageThumbnailView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (void)setContentMode:(int64_t)a3
{
  id v4;

  self->_contentMode = a3;
  -[HUWallpaperThumbnailCollectionCell imageThumbnailView](self, "imageThumbnailView");
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
