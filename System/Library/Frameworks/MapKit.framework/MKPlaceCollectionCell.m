@implementation MKPlaceCollectionCell

- (MKPlaceCollectionCell)initWithFrame:(CGRect)a3
{
  MKPlaceCollectionCell *v3;
  MKPlaceCollectionCell *v4;
  void *v5;
  id v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)MKPlaceCollectionCell;
  v3 = -[MKPlaceCollectionCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MKPlaceCollectionCell setupSubviews](v3, "setupSubviews");
    -[MKPlaceCollectionCell setupCornerRadius](v4, "setupCornerRadius");
    -[MKPlaceCollectionCell setupConstraints](v4, "setupConstraints");
    -[MKPlaceCollectionCell setupShadows](v4, "setupShadows");
    -[MKPlaceCollectionCell setupAccessibility](v4, "setupAccessibility");
    v9[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)-[MKPlaceCollectionCell registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v5, sel_traitEnvironment_didChangeTraitCollection_);

  }
  return v4;
}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  BOOL v3;

  -[MKPlaceCollectionCell traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 5;

  return v3;
}

- (void)setupSubviews
{
  -[MKPlaceCollectionCell setupCollectionImage](self, "setupCollectionImage");
  -[MKPlaceCollectionCell setupStackView](self, "setupStackView");
}

- (CGSize)sizeForSavedPill
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  CGSize result;

  -[MKPlaceCollectionCell savedCollectionLabel](self, "savedCollectionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;

  -[MKPlaceCollectionCell savedView](self, "savedView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setContinuousCornerRadius:", 12.0);

  v8 = 24.0;
  v9 = v6 + 7.0 + 7.0;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)setupConstraints
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
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
  _QWORD v84[19];

  v84[17] = *MEMORY[0x1E0C80C00];
  -[MKPlaceCollectionCell sizeForSavedPill](self, "sizeForSavedPill");
  v4 = v3;
  v6 = v5;
  v52 = (void *)MEMORY[0x1E0CB3718];
  -[MKPlaceCollectionCell collectionImageView](self, "collectionImageView");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "leadingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell contentView](self, "contentView");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "leadingAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToAnchor:", v80);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v79;
  -[MKPlaceCollectionCell collectionImageView](self, "collectionImageView");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "trailingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell contentView](self, "contentView");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "trailingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:", v75);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = v74;
  -[MKPlaceCollectionCell collectionImageView](self, "collectionImageView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "topAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell contentView](self, "contentView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "topAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:", v70);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v84[2] = v69;
  -[MKPlaceCollectionCell collectionImageView](self, "collectionImageView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "bottomAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell contentView](self, "contentView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "bottomAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v65);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v84[3] = v64;
  -[MKPlaceCollectionCell metadataStackView](self, "metadataStackView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell contentView](self, "contentView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:constant:", v60, 12.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v84[4] = v59;
  -[MKPlaceCollectionCell metadataStackView](self, "metadataStackView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell contentView](self, "contentView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, -20.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v84[5] = v54;
  -[MKPlaceCollectionCell metadataStackView](self, "metadataStackView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell contentView](self, "contentView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintGreaterThanOrEqualToAnchor:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v84[6] = v48;
  -[MKPlaceCollectionCell metadataStackView](self, "metadataStackView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell contentView](self, "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, -12.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v84[7] = v43;
  -[MKPlaceCollectionCell publisherLogoImageView](self, "publisherLogoImageView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "heightAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToConstant:", 32.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v84[8] = v40;
  -[MKPlaceCollectionCell savedCollectionLabel](self, "savedCollectionLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "centerXAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell savedView](self, "savedView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "centerXAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v84[9] = v35;
  -[MKPlaceCollectionCell savedCollectionLabel](self, "savedCollectionLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "centerYAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell savedView](self, "savedView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "centerYAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v84[10] = v30;
  -[MKPlaceCollectionCell savedCollectionLabel](self, "savedCollectionLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "heightAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToConstant:", v6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v84[11] = v27;
  -[MKPlaceCollectionCell savedCollectionLabel](self, "savedCollectionLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "widthAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToConstant:", v4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v84[12] = v24;
  -[MKPlaceCollectionCell savedView](self, "savedView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, 8.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v84[13] = v19;
  -[MKPlaceCollectionCell savedView](self, "savedView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v8, -8.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v84[14] = v9;
  -[MKPlaceCollectionCell savedView](self, "savedView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "heightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToConstant:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v84[15] = v12;
  -[MKPlaceCollectionCell savedView](self, "savedView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToConstant:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v84[16] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "activateConstraints:", v16);

}

- (void)setupCornerRadius
{
  void *v3;
  void *v4;
  id v5;

  -[MKPlaceCollectionCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setContinuousCornerRadius:", 10.0);

  -[MKPlaceCollectionCell contentView](self, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMasksToBounds:", 1);

}

- (void)setupCollectionImage
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0CEA658]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MKPlaceCollectionCell setCollectionImageView:](self, "setCollectionImageView:", v4);

  -[MKPlaceCollectionCell collectionImageView](self, "collectionImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[MKPlaceCollectionCell collectionImageView](self, "collectionImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIgnoresInvertColors:", 1);

  -[MKPlaceCollectionCell collectionImageView](self, "collectionImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("PlaceCollectionImage"));

  -[MKPlaceCollectionCell collectionImageView](self, "collectionImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentMode:", 2);

  -[MKPlaceCollectionCell contentView](self, "contentView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell collectionImageView](self, "collectionImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v9);

}

- (void)setupStackView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CEA9E0]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MKPlaceCollectionCell setMetadataStackView:](self, "setMetadataStackView:", v4);

  -[MKPlaceCollectionCell metadataStackView](self, "metadataStackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[MKPlaceCollectionCell metadataStackView](self, "metadataStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAxis:", 1);

  -[MKPlaceCollectionCell metadataStackView](self, "metadataStackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDistribution:", 0);

  -[MKPlaceCollectionCell metadataStackView](self, "metadataStackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlignment:", 1);

  -[MKPlaceCollectionCell metadataStackView](self, "metadataStackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("PlaceCollectionMetadataStack"));

  -[MKPlaceCollectionCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell metadataStackView](self, "metadataStackView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v11);

  -[MKPlaceCollectionCell addPublisherLogoImage](self, "addPublisherLogoImage");
  -[MKPlaceCollectionCell addCollectionNameView](self, "addCollectionNameView");
  -[MKPlaceCollectionCell addSavedCollectionView](self, "addSavedCollectionView");
}

- (void)addPublisherLogoImage
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0CEA658]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MKPlaceCollectionCell setPublisherLogoImageView:](self, "setPublisherLogoImageView:", v4);

  -[MKPlaceCollectionCell publisherLogoImageView](self, "publisherLogoImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[MKPlaceCollectionCell publisherLogoImageView](self, "publisherLogoImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIgnoresInvertColors:", 1);

  -[MKPlaceCollectionCell publisherLogoImageView](self, "publisherLogoImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("PlaceCollectionPublisherLogo"));

  -[MKPlaceCollectionCell publisherLogoImageView](self, "publisherLogoImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentMode:", 1);

  -[MKPlaceCollectionCell metadataStackView](self, "metadataStackView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell publisherLogoImageView](self, "publisherLogoImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addArrangedSubview:", v9);

}

- (void)addCollectionNameView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0CEA700]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MKPlaceCollectionCell setCollectionLabel:](self, "setCollectionLabel:", v4);

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell collectionLabel](self, "collectionLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

  -[MKPlaceCollectionCell collectionLabel](self, "collectionLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNumberOfLines:", 0);

  -[MKPlaceCollectionCell collectionLabel](self, "collectionLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("PlaceCollectionTitle"));

  -[MKPlaceCollectionCell metadataStackView](self, "metadataStackView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell collectionLabel](self, "collectionLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addArrangedSubview:", v9);

}

- (void)addSavedCollectionView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  uint64_t v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
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
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithBlurRadius:", 10.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v3);
  -[MKPlaceCollectionCell setSavedView:](self, "setSavedView:", v4);

  -[MKPlaceCollectionCell savedView](self, "savedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell savedView](self, "savedView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colorWithAlphaComponent:", 0.24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell savedView](self, "savedView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v9);

  -[MKPlaceCollectionCell savedView](self, "savedView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("PlaceCollectionSavedView"));

  v13 = objc_alloc(MEMORY[0x1E0CEA700]);
  v14 = (void *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MKPlaceCollectionCell setSavedCollectionLabel:](self, "setSavedCollectionLabel:", v14);

  -[MKPlaceCollectionCell savedCollectionLabel](self, "savedCollectionLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell savedCollectionLabel](self, "savedCollectionLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextColor:", v16);

  -[MKPlaceCollectionCell savedCollectionLabel](self, "savedCollectionLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = 1148846080;
  objc_msgSend(v18, "setContentCompressionResistancePriority:forAxis:", 0, v19);

  v20 = *MEMORY[0x1E0CEB550];
  v21 = *MEMORY[0x1E0CEB5E8];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0CEB550], *MEMORY[0x1E0CEB5E8]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell savedCollectionLabel](self, "savedCollectionLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFont:", v22);

  -[MKPlaceCollectionCell savedCollectionLabel](self, "savedCollectionLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setNumberOfLines:", 1);

  v25 = objc_alloc_init(MEMORY[0x1E0CEA258]);
  v26 = (void *)MEMORY[0x1E0CEA638];
  v27 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:weight:", v20, v21);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "configurationWithFont:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "imageWithTintColor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setImage:", v32);

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v25);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_alloc(MEMORY[0x1E0CB3778]);
  v50 = *MEMORY[0x1E0CEA098];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:weight:", v20, v21);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v34, "initWithString:attributes:", &stru_1E20DFC00, v36);

  objc_msgSend(v37, "appendAttributedString:", v33);
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
  objc_msgSend(v37, "appendAttributedString:", v38);

  v39 = objc_alloc(MEMORY[0x1E0CB3498]);
  _MKLocalizedStringFromThisBundle(CFSTR("[Curated Collection] Saved Collection text"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v39, "initWithString:", v40);

  objc_msgSend(v37, "appendAttributedString:", v41);
  -[MKPlaceCollectionCell savedCollectionLabel](self, "savedCollectionLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setTextAlignment:", 1);

  -[MKPlaceCollectionCell savedCollectionLabel](self, "savedCollectionLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setAttributedText:", v37);

  -[MKPlaceCollectionCell savedCollectionLabel](self, "savedCollectionLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setAccessibilityIdentifier:", CFSTR("PlaceCollectionSavedLabel"));

  -[MKPlaceCollectionCell savedView](self, "savedView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell savedCollectionLabel](self, "savedCollectionLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addSubview:", v47);

  -[MKPlaceCollectionCell contentView](self, "contentView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell savedView](self, "savedView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addSubview:", v49);

}

- (void)setupShadows
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");
  -[MKPlaceCollectionCell layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowColor:", v4);

  -[MKPlaceCollectionCell layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 1028443341;
  objc_msgSend(v6, "setShadowOpacity:", v7);

  -[MKPlaceCollectionCell layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShadowOffset:", 0.0, 2.0);

  -[MKPlaceCollectionCell layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShadowRadius:", 12.0);

  -[MKPlaceCollectionCell layer](self, "layer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShadowPathIsBounds:", 1);

}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a4, "preferredContentSizeCategory", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
  {
    -[MKPlaceCollectionCell item](self, "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentCategorySizeDidChange");

    -[MKPlaceCollectionCell setTextMetadata](self, "setTextMetadata");
  }
}

- (void)setupAccessibility
{
  void *v3;
  uint64_t v4;
  id v5;

  -[MKPlaceCollectionCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("PlaceCollectionCell"));
  -[MKPlaceCollectionCell metadataStackView](self, "metadataStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);

  v4 = *MEMORY[0x1E0CEB110];
  -[MKPlaceCollectionCell metadataStackView](self, "metadataStackView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityTraits:", v4);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MKPlaceCollectionCell;
  -[MKPlaceCollectionCell prepareForReuse](&v8, sel_prepareForReuse);
  -[MKPlaceCollectionCell publisherLogoImageView](self, "publisherLogoImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

  -[MKPlaceCollectionCell collectionLabel](self, "collectionLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedText:", 0);

  -[MKPlaceCollectionCell collectionImageView](self, "collectionImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", 0);

  -[MKPlaceCollectionCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", 0);

  -[MKPlaceCollectionCell metadataStackView](self, "metadataStackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", 0);

  -[MKPlaceCollectionCell setItem:](self, "setItem:", 0);
}

- (void)setUpCellUsingModel:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MKGetCuratedCollectionsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "collectionTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_DEBUG, "Configuring cell for Collection: %@", (uint8_t *)&v10, 0xCu);

  }
  -[MKPlaceCollectionCell setItem:](self, "setItem:", v4);
  objc_msgSend(v4, "backgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  -[MKPlaceCollectionCell setTextMetadata](self, "setTextMetadata");
  -[MKPlaceCollectionCell setImageMetadata](self, "setImageMetadata");

}

- (void)setTextMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;

  -[MKPlaceCollectionCell item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell collectionLabel](self, "collectionLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v4);

  -[MKPlaceCollectionCell item](self, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSaved") ^ 1;
  -[MKPlaceCollectionCell savedView](self, "savedView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v7);

  -[MKPlaceCollectionCell collectionLabel](self, "collectionLabel");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "text");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_1E20DFC00;
  -[MKPlaceCollectionCell metadataStackView](self, "metadataStackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityLabel:", v11);

}

- (void)setImageMetadata
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell setUpdateIdentifier:](self, "setUpdateIdentifier:", v3);
  objc_initWeak(&location, self);
  -[MKPlaceCollectionCell item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __41__MKPlaceCollectionCell_setImageMetadata__block_invoke;
  v24[3] = &unk_1E20DF1B0;
  objc_copyWeak(&v26, &location);
  v6 = v3;
  v25 = v6;
  objc_msgSend(v4, "publisherLogoImageWithCompletion:", v24);

  MKGetCuratedCollectionsLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[MKPlaceCollectionCell item](self, "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = v10;
    _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_DEBUG, "[⌛]Requesting image for : %@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell item](self, "item");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  v17 = v16;
  v20[0] = v5;
  v20[1] = 3221225472;
  v20[2] = __41__MKPlaceCollectionCell_setImageMetadata__block_invoke_47;
  v20[3] = &unk_1E20DF1D8;
  objc_copyWeak(&v23, &location);
  v20[4] = self;
  v18 = v6;
  v21 = v18;
  v19 = v11;
  v22 = v19;
  objc_msgSend(v12, "collectionImageForSize:onCompletion:", v20, v15, v17);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

void __41__MKPlaceCollectionCell_setImageMetadata__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_8;
  objc_msgSend(WeakRetained, "updateIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {

LABEL_8:
    objc_msgSend(v4, "publisherLogoImageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHidden:", 1);
    goto LABEL_9;
  }
  objc_msgSend(v4, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23 || !v6)
    goto LABEL_8;
  objc_msgSend(v4, "publisherLogoImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v4, "publisherLogoImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v23);

    objc_msgSend(v4, "publisherLogoImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "widthAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "publisherLogoImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "publisherLogoImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "image");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "size");
    v17 = v16;
    objc_msgSend(v4, "publisherLogoImageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "image");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "size");
    objc_msgSend(v11, "constraintEqualToAnchor:multiplier:", v13, v17 / v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLogoWidthConstraint:", v21);

    objc_msgSend(v4, "logoWidthConstraint");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setActive:", 1);
LABEL_9:

  }
}

void __41__MKPlaceCollectionCell_setImageMetadata__block_invoke_47(uint64_t a1, void *a2, uint64_t a3, int a4, char a5)
{
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  double v20;
  const char *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v11 = WeakRetained;
  if ((a5 & 1) == 0)
  {
    MKGetCuratedCollectionsLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "item");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "collectionTitle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "string");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v25;
      _os_log_impl(&dword_18B0B0000, v22, OS_LOG_TYPE_INFO, "Cancelled image download for collection: %@", buf, 0xCu);

    }
    goto LABEL_19;
  }
  if (!WeakRetained)
    goto LABEL_16;
  objc_msgSend(WeakRetained, "updateIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {

    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 32), "item");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_16:
    MKGetCuratedCollectionsLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B0B0000, v26, OS_LOG_TYPE_INFO, "Cell doesn't exist OR identifier mistach", buf, 2u);
    }

    goto LABEL_19;
  }
  MKGetCuratedCollectionsLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v11, "item");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "collectionTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v35 = v17;
    _os_log_impl(&dword_18B0B0000, v14, OS_LOG_TYPE_DEBUG, "[⌛]Received image for : %@", buf, 0xCu);

  }
  if (v9 && !a3)
  {
    MKGetCuratedCollectionsLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (a4)
    {
      v20 = 0.0;
      if (v19)
      {
        *(_WORD *)buf = 0;
        v21 = "Received cached image. Displaying without animation.";
LABEL_22:
        _os_log_impl(&dword_18B0B0000, v18, OS_LOG_TYPE_INFO, v21, buf, 2u);
      }
    }
    else
    {
      v20 = 0.100000001;
      if (v19)
      {
        *(_WORD *)buf = 0;
        v21 = "Received non-cached image. Displaying with animation.";
        goto LABEL_22;
      }
    }

    v27 = (void *)MEMORY[0x1E0CEABB0];
    objc_msgSend(v11, "collectionImageView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __41__MKPlaceCollectionCell_setImageMetadata__block_invoke_49;
    v32[3] = &unk_1E20D7E58;
    v32[4] = v11;
    v33 = v9;
    v30[0] = v29;
    v30[1] = 3221225472;
    v30[2] = __41__MKPlaceCollectionCell_setImageMetadata__block_invoke_2;
    v30[3] = &unk_1E20D8578;
    v30[4] = v11;
    v31 = *(id *)(a1 + 48);
    objc_msgSend(v27, "transitionWithView:duration:options:animations:completion:", v28, 5242882, v32, v30, v20);

  }
LABEL_19:

}

void __41__MKPlaceCollectionCell_setImageMetadata__block_invoke_49(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "collectionImageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v1);

}

void __41__MKPlaceCollectionCell_setImageMetadata__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  MKGetCuratedCollectionsLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "item");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "collectionTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    v8 = 138412546;
    v9 = v5;
    v10 = 2048;
    v11 = v7;
    _os_log_impl(&dword_18B0B0000, v2, OS_LOG_TYPE_DEBUG, "[⌛]Finished showing image for : %@ in %f", (uint8_t *)&v8, 0x16u);

  }
}

- (UIImageView)publisherLogoImageView
{
  return self->_publisherLogoImageView;
}

- (void)setPublisherLogoImageView:(id)a3
{
  objc_storeStrong((id *)&self->_publisherLogoImageView, a3);
}

- (UIImageView)collectionImageView
{
  return self->_collectionImageView;
}

- (void)setCollectionImageView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionImageView, a3);
}

- (UIStackView)metadataStackView
{
  return self->_metadataStackView;
}

- (void)setMetadataStackView:(id)a3
{
  objc_storeStrong((id *)&self->_metadataStackView, a3);
}

- (UILabel)collectionLabel
{
  return self->_collectionLabel;
}

- (void)setCollectionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_collectionLabel, a3);
}

- (UILabel)savedCollectionLabel
{
  return self->_savedCollectionLabel;
}

- (void)setSavedCollectionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_savedCollectionLabel, a3);
}

- (UIVisualEffectView)savedView
{
  return self->_savedView;
}

- (void)setSavedView:(id)a3
{
  objc_storeStrong((id *)&self->_savedView, a3);
}

- (UIImageView)checkMarkImageView
{
  return self->_checkMarkImageView;
}

- (void)setCheckMarkImageView:(id)a3
{
  objc_storeStrong((id *)&self->_checkMarkImageView, a3);
}

- (NSLayoutConstraint)logoWidthConstraint
{
  return self->_logoWidthConstraint;
}

- (void)setLogoWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_logoWidthConstraint, a3);
}

- (MKPlaceCollectionViewModel)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (NSUUID)updateIdentifier
{
  return self->_updateIdentifier;
}

- (void)setUpdateIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_updateIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateIdentifier, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_logoWidthConstraint, 0);
  objc_storeStrong((id *)&self->_checkMarkImageView, 0);
  objc_storeStrong((id *)&self->_savedView, 0);
  objc_storeStrong((id *)&self->_savedCollectionLabel, 0);
  objc_storeStrong((id *)&self->_collectionLabel, 0);
  objc_storeStrong((id *)&self->_metadataStackView, 0);
  objc_storeStrong((id *)&self->_collectionImageView, 0);
  objc_storeStrong((id *)&self->_publisherLogoImageView, 0);
}

@end
