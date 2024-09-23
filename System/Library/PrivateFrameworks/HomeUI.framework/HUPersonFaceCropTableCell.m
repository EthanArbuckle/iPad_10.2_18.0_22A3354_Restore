@implementation HUPersonFaceCropTableCell

- (HUPersonFaceCropTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUPersonFaceCropTableCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUPersonFaceCropTableCell;
  v4 = -[HUPersonFaceCropTableCell initWithStyle:reuseIdentifier:](&v15, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", 0);
    -[HUPersonFaceCropTableCell setFaceCropView:](v4, "setFaceCropView:", v5);

    -[HUPersonFaceCropTableCell faceCropView](v4, "faceCropView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentMode:", 1);

    -[HUPersonFaceCropTableCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPersonFaceCropTableCell faceCropView](v4, "faceCropView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    v9 = objc_alloc(MEMORY[0x1E0D33710]);
    -[HUPersonFaceCropTableCell imageView](v4, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v11 = (void *)objc_msgSend(v9, "initWithFrame:");

    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v12);

    -[HUPersonFaceCropTableCell faceCropView](v4, "faceCropView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMaskView:", v11);

    -[HUPersonFaceCropTableCell _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUPersonFaceCropTableCell;
  -[HUPersonFaceCropTableCell prepareForReuse](&v4, sel_prepareForReuse);
  -[HUPersonFaceCropTableCell faceCropView](self, "faceCropView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

  -[HUPersonFaceCropTableCell setItem:](self, "setItem:", 0);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HUPersonFaceCropTableCell;
  -[HUPersonFaceCropTableCell layoutSubviews](&v14, sel_layoutSubviews);
  -[HUPersonFaceCropTableCell faceCropView](self, "faceCropView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[HUPersonFaceCropTableCell faceCropView](self, "faceCropView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "maskView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HUPersonFaceCropTableCell item](self, "item", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30A90]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonFaceCropTableCell setFaceImage:](self, "setFaceImage:", v6);

  -[HUPersonFaceCropTableCell faceImage](self, "faceImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonFaceCropTableCell faceCropView](self, "faceCropView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v7);

  -[HUPersonFaceCropTableCell faceCropView](self, "faceCropView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeToFit");

}

- (void)_setupConstraints
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
  id v38;

  -[HUPersonFaceCropTableCell constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HUPersonFaceCropTableCell faceCropView](self, "faceCropView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v38 = (id)objc_claimAutoreleasedReturnValue();
    -[HUPersonFaceCropTableCell faceCropView](self, "faceCropView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerXAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPersonFaceCropTableCell layoutMarginsGuide](self, "layoutMarginsGuide");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "centerXAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v9);

    -[HUPersonFaceCropTableCell faceCropView](self, "faceCropView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "centerYAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPersonFaceCropTableCell layoutMarginsGuide](self, "layoutMarginsGuide");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "centerYAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v14);

    -[HUPersonFaceCropTableCell faceCropView](self, "faceCropView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPersonFaceCropTableCell contentView](self, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, 20.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v19);

    -[HUPersonFaceCropTableCell faceCropView](self, "faceCropView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPersonFaceCropTableCell contentView](self, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23, -20.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v24);

    -[HUPersonFaceCropTableCell faceCropView](self, "faceCropView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "heightAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPersonFaceCropTableCell faceCropView](self, "faceCropView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "widthAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v29);

    -[HUPersonFaceCropTableCell faceCropView](self, "faceCropView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "heightAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintGreaterThanOrEqualToConstant:", 30.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v32);

    -[HUPersonFaceCropTableCell faceCropView](self, "faceCropView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "heightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintLessThanOrEqualToConstant:", 256.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v35);

    -[HUPersonFaceCropTableCell setConstraints:](self, "setConstraints:", v38);
    v36 = (void *)MEMORY[0x1E0CB3718];
    -[HUPersonFaceCropTableCell constraints](self, "constraints");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "activateConstraints:", v37);

  }
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (HMFaceCrop)personFaceCrop
{
  return self->_personFaceCrop;
}

- (void)setPersonFaceCrop:(id)a3
{
  objc_storeStrong((id *)&self->_personFaceCrop, a3);
}

- (UIImage)faceImage
{
  return self->_faceImage;
}

- (void)setFaceImage:(id)a3
{
  objc_storeStrong((id *)&self->_faceImage, a3);
}

- (UIImageView)faceCropView
{
  return self->_faceCropView;
}

- (void)setFaceCropView:(id)a3
{
  objc_storeStrong((id *)&self->_faceCropView, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_faceCropView, 0);
  objc_storeStrong((id *)&self->_faceImage, 0);
  objc_storeStrong((id *)&self->_personFaceCrop, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
