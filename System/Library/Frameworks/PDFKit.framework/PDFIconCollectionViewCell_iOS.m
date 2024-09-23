@implementation PDFIconCollectionViewCell_iOS

- (PDFIconCollectionViewCell_iOS)initWithFrame:(CGRect)a3
{
  PDFIconCollectionViewCell_iOS *v3;
  PDFIconCollectionViewCell_iOS *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PDFIconCollectionViewCell_iOS;
  v3 = -[PDFIconCollectionViewCell_iOS initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PDFIconCollectionViewCell_iOS _commonInit](v3, "_commonInit");
  return v4;
}

- (PDFIconCollectionViewCell_iOS)initWithCoder:(id)a3
{
  PDFIconCollectionViewCell_iOS *v3;
  PDFIconCollectionViewCell_iOS *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PDFIconCollectionViewCell_iOS;
  v3 = -[PDFIconCollectionViewCell_iOS initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PDFIconCollectionViewCell_iOS _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  -[PDFIconCollectionViewCell_iOS setupSubviews](self, "setupSubviews");
  v3 = *MEMORY[0x24BDE58E8];
  -[PDFIconCollectionViewCell_iOS layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerCurve:", v3);

  -[PDFIconCollectionViewCell_iOS layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", 3.0);

  -[PDFIconCollectionViewCell_iOS layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMasksToBounds:", 1);

  -[PDFIconCollectionViewCell_iOS updateOverlay](self, "updateOverlay");
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PDFIconCollectionViewCell_iOS;
  -[PDFIconCollectionViewCell_iOS prepareForReuse](&v5, sel_prepareForReuse);
  if (self->_ratioConstraint)
  {
    -[PDFIconCollectionViewCell_iOS imageView](self, "imageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeConstraint:", self->_ratioConstraint);

  }
  -[PDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", 0);

}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PDFIconCollectionViewCell_iOS;
  -[PDFIconCollectionViewCell_iOS setSelected:](&v4, sel_setSelected_, a3);
  -[PDFIconCollectionViewCell_iOS updateOverlay](self, "updateOverlay");
}

- (void)updateOverlay
{
  -[UIView setHidden:](self->_overlayView, "setHidden:", -[PDFIconCollectionViewCell_iOS isSelected](self, "isSelected") ^ 1);
}

- (void)setupSubviews
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIView *v15;
  UIView *overlayView;
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
  id v32;
  UIButton *v33;
  UIButton *actionsButton;
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
  _QWORD v81[4];
  _QWORD v82[10];

  v82[8] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDF6AE8]);
  -[PDFIconCollectionViewCell_iOS bounds](self, "bounds");
  v4 = (void *)objc_msgSend(v3, "initWithFrame:");
  -[PDFIconCollectionViewCell_iOS setImageView:](self, "setImageView:", v4);

  -[PDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentMode:", 0);

  v6 = *MEMORY[0x24BDE58E8];
  -[PDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerCurve:", v6);

  -[PDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", 2.0);

  -[PDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMasksToBounds:", 1);

  -[PDFIconCollectionViewCell_iOS contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v14);

  v15 = (UIView *)objc_opt_new();
  overlayView = self->_overlayView;
  self->_overlayView = v15;

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "colorWithAlphaComponent:", 0.3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_overlayView, "setBackgroundColor:", v18);

  -[UIView layer](self->_overlayView, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCornerCurve:", v6);

  -[UIView layer](self->_overlayView, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCornerRadius:", 2.0);

  -[UIView setHidden:](self->_overlayView, "setHidden:", 1);
  -[PDFIconCollectionViewCell_iOS contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", self->_overlayView);

  -[PDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_overlayView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v59 = (void *)MEMORY[0x24BDD1628];
  -[PDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "bottomAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFIconCollectionViewCell_iOS contentView](self, "contentView");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "bottomAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:constant:", v73, -3.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v71;
  -[PDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "topAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFIconCollectionViewCell_iOS contentView](self, "contentView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "topAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:constant:", v66, 3.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v65;
  -[PDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "leadingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFIconCollectionViewCell_iOS contentView](self, "contentView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:constant:", v61, 3.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v82[2] = v60;
  -[PDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFIconCollectionViewCell_iOS contentView](self, "contentView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, -3.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v82[3] = v54;
  -[UIView bottomAnchor](self->_overlayView, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFIconCollectionViewCell_iOS contentView](self, "contentView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v82[4] = v50;
  -[UIView topAnchor](self->_overlayView, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFIconCollectionViewCell_iOS contentView](self, "contentView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v82[5] = v46;
  -[UIView leadingAnchor](self->_overlayView, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFIconCollectionViewCell_iOS contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v82[6] = v26;
  -[UIView trailingAnchor](self->_overlayView, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFIconCollectionViewCell_iOS contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v82[7] = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v82, 8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "activateConstraints:", v31);

  v32 = objc_alloc(MEMORY[0x24BDF6880]);
  v33 = (UIButton *)objc_msgSend(v32, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  actionsButton = self->_actionsButton;
  self->_actionsButton = v33;

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("ellipsis.circle.fill"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6888], "plainButtonConfiguration");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setImage:", v80);
  -[UIButton setConfiguration:](self->_actionsButton, "setConfiguration:", v78);
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTintColor:](self->_actionsButton, "setTintColor:", v35);

  -[UIView addSubview:](self->_overlayView, "addSubview:", self->_actionsButton);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_actionsButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v70 = (void *)MEMORY[0x24BDD1628];
  -[UIButton widthAnchor](self->_actionsButton, "widthAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self->_overlayView, "widthAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:", v74);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v72;
  -[UIButton heightAnchor](self->_actionsButton, "heightAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](self->_overlayView, "heightAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v81[1] = v38;
  -[UIButton centerXAnchor](self->_actionsButton, "centerXAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_overlayView, "centerXAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v81[2] = v41;
  -[UIButton centerYAnchor](self->_actionsButton, "centerYAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_overlayView, "centerYAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v81[3] = v44;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v81, 4);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "activateConstraints:", v45);

}

- (void)updateAspectConstraintWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *ratioConstraint;
  double v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  height = a3.height;
  width = a3.width;
  v18[1] = *MEMORY[0x24BDAC8D0];
  if (self->_ratioConstraint)
  {
    -[PDFIconCollectionViewCell_iOS imageView](self, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeConstraint:", self->_ratioConstraint);

  }
  v7 = height / width;
  if (fabs(height / width) == INFINITY)
    v7 = 1.0;
  if (v7 < 0.5)
    v7 = 0.5;
  v8 = fmin(v7, 2.0);
  -[PDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:multiplier:constant:", v12, v8, 0.0);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  ratioConstraint = self->_ratioConstraint;
  self->_ratioConstraint = v13;

  LODWORD(v15) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_ratioConstraint, "setPriority:", v15);
  v16 = (void *)MEMORY[0x24BDD1628];
  v18[0] = self->_ratioConstraint;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v17);

}

- (void)setThumbnailWidth:(double)a3
{
  double v5;
  NSLayoutConstraint *imageViewWidthConstraint;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *v10;
  void *v11;
  void *v12;
  double v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[NSLayoutConstraint constant](self->_imageViewWidthConstraint, "constant");
  if (v5 != a3)
  {
    imageViewWidthConstraint = self->_imageViewWidthConstraint;
    if (imageViewWidthConstraint)
    {
      -[NSLayoutConstraint setConstant:](imageViewWidthConstraint, "setConstant:", a3);
    }
    else
    {
      -[PDFIconCollectionViewCell_iOS contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "widthAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToConstant:", a3);
      v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v10 = self->_imageViewWidthConstraint;
      self->_imageViewWidthConstraint = v9;

      v11 = (void *)MEMORY[0x24BDD1628];
      v14[0] = self->_imageViewWidthConstraint;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "activateConstraints:", v12);

      LODWORD(v13) = 1148829696;
      -[NSLayoutConstraint setPriority:](self->_imageViewWidthConstraint, "setPriority:", v13);
    }
  }
}

- (void)setThumbnailHeight:(double)a3
{
  double v5;
  NSLayoutConstraint *imageViewHeightConstraint;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *v10;
  void *v11;
  void *v12;
  double v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[NSLayoutConstraint constant](self->_imageViewHeightConstraint, "constant");
  if (v5 != a3)
  {
    imageViewHeightConstraint = self->_imageViewHeightConstraint;
    if (imageViewHeightConstraint)
    {
      -[NSLayoutConstraint setConstant:](imageViewHeightConstraint, "setConstant:", a3);
    }
    else
    {
      -[PDFIconCollectionViewCell_iOS contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "heightAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToConstant:", a3);
      v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v10 = self->_imageViewHeightConstraint;
      self->_imageViewHeightConstraint = v9;

      v11 = (void *)MEMORY[0x24BDD1628];
      v14[0] = self->_imageViewHeightConstraint;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "activateConstraints:", v12);

      LODWORD(v13) = 1148829696;
      -[NSLayoutConstraint setPriority:](self->_imageViewHeightConstraint, "setPriority:", v13);
    }
  }
}

- (UIButton)actionsButton
{
  return self->_actionsButton;
}

- (void)setActionsButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionsButton, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (PDFPage)page
{
  return self->_page;
}

- (void)setPage:(id)a3
{
  objc_storeStrong((id *)&self->_page, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_page, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_actionsButton, 0);
  objc_storeStrong((id *)&self->_imageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_ratioConstraint, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
}

@end
