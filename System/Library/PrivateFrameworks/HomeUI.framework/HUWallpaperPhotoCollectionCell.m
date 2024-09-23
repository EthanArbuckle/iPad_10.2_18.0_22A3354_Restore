@implementation HUWallpaperPhotoCollectionCell

- (HUWallpaperPhotoCollectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUWallpaperPhotoCollectionCell *v4;
  HUWallpaperPhotoCollectionCell *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  UIImageView *imageThumbnailView;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *v19;
  uint64_t v20;
  UILabel *titleLabel;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  UILabel *descriptionLabel;
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
  void *v53;
  uint64_t v54;
  NSLayoutConstraint *imageHeightConstraint;
  double v56;
  void *v57;
  uint64_t v58;
  NSLayoutConstraint *imageWidthConstraint;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  double *p_width;
  objc_super v101;

  v101.receiver = self;
  v101.super_class = (Class)HUWallpaperPhotoCollectionCell;
  v4 = -[HUWallpaperPhotoCollectionCell initWithStyle:reuseIdentifier:](&v101, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v5 = v4;
  if (v4)
  {
    p_width = &v4->_imageSize.width;
    v4->_imageSize = (CGSize)vdupq_n_s64(0x4049000000000000uLL);
    v6 = objc_alloc(MEMORY[0x1E0CEA658]);
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    imageThumbnailView = v5->_imageThumbnailView;
    v5->_imageThumbnailView = (UIImageView *)v11;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_imageThumbnailView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v5->_imageThumbnailView, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](v5->_imageThumbnailView, "setClipsToBounds:", 1);
    -[UIImageView layer](v5->_imageThumbnailView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerRadius:", 4.0);

    -[HUWallpaperPhotoCollectionCell contentView](v5, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v5->_imageThumbnailView);

    LODWORD(v15) = 1132134400;
    -[UIImageView setContentHuggingPriority:forAxis:](v5->_imageThumbnailView, "setContentHuggingPriority:forAxis:", 0, v15);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v7, v8, v9, v10);
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUWallpaperPhotoCollectionCell contentView](v5, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v16);

    -[HUWallpaperPhotoCollectionCell traitCollection](v5, "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "preferredContentSizeCategory");
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = UIContentSizeCategoryIsAccessibilityCategory(v19);

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v7, v8, v9, v10);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = (UILabel *)v20;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_titleLabel, "setFont:", v22);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v23 = v17 ^ 1;
    -[UILabel setNumberOfLines:](v5->_titleLabel, "setNumberOfLines:", v23);
    objc_msgSend(v16, "addSubview:", v5->_titleLabel);
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v7, v8, v9, v10);
    descriptionLabel = v5->_descriptionLabel;
    v5->_descriptionLabel = (UILabel *)v24;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB548]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_descriptionLabel, "setFont:", v26);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_descriptionLabel, "setTextColor:", v27);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_descriptionLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](v5->_descriptionLabel, "setNumberOfLines:", v23);
    objc_msgSend(v16, "addSubview:", v5->_descriptionLabel);
    -[UIImageView leadingAnchor](v5->_imageThumbnailView, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPhotoCollectionCell contentView](v5, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layoutMarginsGuide");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setActive:", 1);

    -[UIImageView trailingAnchor](v5->_imageThumbnailView, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, -16.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setActive:", 1);

    objc_msgSend(v16, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPhotoCollectionCell contentView](v5, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "layoutMarginsGuide");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setActive:", 1);

    -[UILabel leadingAnchor](v5->_titleLabel, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setActive:", 1);

    -[UILabel trailingAnchor](v5->_titleLabel, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setActive:", 1);

    -[UILabel leadingAnchor](v5->_descriptionLabel, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setActive:", 1);

    -[UILabel trailingAnchor](v5->_descriptionLabel, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setActive:", 1);

    -[UIImageView heightAnchor](v5->_imageThumbnailView, "heightAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToConstant:", p_width[1]);
    v54 = objc_claimAutoreleasedReturnValue();
    imageHeightConstraint = v5->_imageHeightConstraint;
    v5->_imageHeightConstraint = (NSLayoutConstraint *)v54;

    LODWORD(v56) = 1144750080;
    -[NSLayoutConstraint setPriority:](v5->_imageHeightConstraint, "setPriority:", v56);
    -[NSLayoutConstraint setActive:](v5->_imageHeightConstraint, "setActive:", 1);
    -[UIImageView widthAnchor](v5->_imageThumbnailView, "widthAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToConstant:", *p_width);
    v58 = objc_claimAutoreleasedReturnValue();
    imageWidthConstraint = v5->_imageWidthConstraint;
    v5->_imageWidthConstraint = (NSLayoutConstraint *)v58;

    -[NSLayoutConstraint setActive:](v5->_imageWidthConstraint, "setActive:", 1);
    -[UIImageView centerYAnchor](v5->_imageThumbnailView, "centerYAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPhotoCollectionCell contentView](v5, "contentView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "layoutMarginsGuide");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "centerYAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setActive:", 1);

    -[UIImageView topAnchor](v5->_imageThumbnailView, "topAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPhotoCollectionCell contentView](v5, "contentView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "layoutMarginsGuide");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "topAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintGreaterThanOrEqualToAnchor:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setActive:", 1);

    -[UIImageView bottomAnchor](v5->_imageThumbnailView, "bottomAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPhotoCollectionCell contentView](v5, "contentView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "layoutMarginsGuide");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "bottomAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintLessThanOrEqualToAnchor:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setActive:", 1);

    objc_msgSend(v16, "centerYAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPhotoCollectionCell contentView](v5, "contentView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "layoutMarginsGuide");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "centerYAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setActive:", 1);

    objc_msgSend(v16, "topAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPhotoCollectionCell contentView](v5, "contentView");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "layoutMarginsGuide");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "topAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintGreaterThanOrEqualToAnchor:", v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setActive:", 1);

    objc_msgSend(v16, "bottomAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPhotoCollectionCell contentView](v5, "contentView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "layoutMarginsGuide");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "bottomAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintLessThanOrEqualToAnchor:", v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setActive:", 1);

    -[UILabel topAnchor](v5->_titleLabel, "topAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "topAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:", v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "setActive:", 1);

    -[UILabel bottomAnchor](v5->_titleLabel, "bottomAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel topAnchor](v5->_descriptionLabel, "topAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:constant:", v94, -8.0);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setActive:", 1);

    -[UILabel bottomAnchor](v5->_descriptionLabel, "bottomAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bottomAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintEqualToAnchor:", v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setActive:", 1);

  }
  return v5;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUWallpaperPhotoCollectionCell;
  -[HUWallpaperPhotoCollectionCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HUWallpaperPhotoCollectionCell setImage:](self, "setImage:", 0);
  -[HUWallpaperPhotoCollectionCell setTitleText:](self, "setTitleText:", 0);
  -[HUWallpaperPhotoCollectionCell setDescriptionText:](self, "setDescriptionText:", 0);
  -[HUWallpaperPhotoCollectionCell setImageSize:](self, "setImageSize:", 50.0, 50.0);
}

- (void)updateConstraints
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  objc_super v6;

  -[HUWallpaperPhotoCollectionCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", !IsAccessibilityCategory);
  -[UILabel setNumberOfLines:](self->_descriptionLabel, "setNumberOfLines:", !IsAccessibilityCategory);
  v6.receiver = self;
  v6.super_class = (Class)HUWallpaperPhotoCollectionCell;
  -[HUWallpaperPhotoCollectionCell updateConstraints](&v6, sel_updateConstraints);
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
  -[HUWallpaperPhotoCollectionCell imageHeightConstraint](self, "imageHeightConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", height);

  width = p_imageSize->width;
  -[HUWallpaperPhotoCollectionCell imageWidthConstraint](self, "imageWidthConstraint");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", width);

}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[HUWallpaperPhotoCollectionCell imageThumbnailView](self, "imageThumbnailView");
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
  -[HUWallpaperPhotoCollectionCell imageThumbnailView](self, "imageThumbnailView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (NSString)titleText
{
  void *v2;
  void *v3;

  -[HUWallpaperPhotoCollectionCell titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTitleText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUWallpaperPhotoCollectionCell titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)descriptionText
{
  void *v2;
  void *v3;

  -[HUWallpaperPhotoCollectionCell descriptionLabel](self, "descriptionLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setDescriptionText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUWallpaperPhotoCollectionCell descriptionLabel](self, "descriptionLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

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

- (UIImageView)imageThumbnailView
{
  return self->_imageThumbnailView;
}

- (void)setImageThumbnailView:(id)a3
{
  objc_storeStrong((id *)&self->_imageThumbnailView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (NSArray)imageSizeConstraints
{
  return self->_imageSizeConstraints;
}

- (void)setImageSizeConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_imageSizeConstraints, a3);
}

- (NSArray)horizontalConstraints
{
  return self->_horizontalConstraints;
}

- (void)setHorizontalConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalConstraints, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_horizontalConstraints, 0);
  objc_storeStrong((id *)&self->_imageSizeConstraints, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageThumbnailView, 0);
}

@end
