@implementation HRImageLabel

- (HRImageLabel)initWithImage:(id)a3 size:(CGSize)a4 text:(id)a5 userInterfaceStyleChanged:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  id v13;
  id v14;
  HRImageLabel *v15;
  HRImageLabel *v16;
  uint64_t v17;
  id userInterfaceStyleChanged;
  objc_super v20;

  height = a4.height;
  width = a4.width;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HRImageLabel;
  v15 = -[HRImageLabel initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_image, a3);
    v16->_imageSize.width = width;
    v16->_imageSize.height = height;
    objc_storeStrong((id *)&v16->_text, a5);
    v16->_imageAlignment = 0;
    v17 = MEMORY[0x2199E20AC](v14);
    userInterfaceStyleChanged = v16->_userInterfaceStyleChanged;
    v16->_userInterfaceStyleChanged = (id)v17;

    -[HRImageLabel _setUpUI](v16, "_setUpUI");
    -[HRImageLabel _setUpConstraints](v16, "_setUpConstraints");
  }

  return v16;
}

- (HRImageLabel)initWithImage:(id)a3 size:(CGSize)a4 text:(id)a5
{
  return -[HRImageLabel initWithImage:size:text:userInterfaceStyleChanged:](self, "initWithImage:size:text:userInterfaceStyleChanged:", a3, a5, 0, a4.width, a4.height);
}

- (id)initWIthImage:(id)a3 text:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithImage:size:text:", v7, v6, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));

  return v8;
}

- (void)setImageAlignment:(int64_t)a3
{
  self->_imageAlignment = a3;
  -[HRImageLabel _updateImageTextAlignmentConstraints](self, "_updateImageTextAlignmentConstraints");
}

- (void)setBoldText:(BOOL)a3
{
  self->_boldText = a3;
  -[HRImageLabel _updateTextLabelFont](self, "_updateTextLabelFont");
  -[HRImageLabel _updateImageTextAlignmentConstraints](self, "_updateImageTextAlignmentConstraints");
}

- (void)setImageLeadingSpacing:(double)a3
{
  id v4;

  self->_imageLeadingSpacing = a3;
  -[HRImageLabel imageLeadingConstraint](self, "imageLeadingConstraint");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", a3);

}

- (void)setImageTrailingSpacing:(double)a3
{
  id v4;

  self->_imageTrailingSpacing = a3;
  -[HRImageLabel imageTrailingConstraint](self, "imageTrailingConstraint");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HRImageLabel;
  -[HRImageLabel traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, a3);
  -[HRImageLabel textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRImageLabel traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HRImageLabel textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  -[HRImageLabel _updateImageTextAlignmentConstraints](self, "_updateImageTextAlignmentConstraints");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HRImageLabel;
  -[HRImageLabel layoutSubviews](&v3, sel_layoutSubviews);
  -[HRImageLabel _updateCurrentUserInterfaceStyleIfNeeded](self, "_updateCurrentUserInterfaceStyleIfNeeded");
  -[HRImageLabel _updateImageTextAlignmentConstraints](self, "_updateImageTextAlignmentConstraints");
}

- (void)_updateCurrentUserInterfaceStyleIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void (**v6)(id, HRImageLabel *, uint64_t);

  -[HRImageLabel traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (-[HRImageLabel currentUserInterfaceStyle](self, "currentUserInterfaceStyle") != v4)
  {
    -[HRImageLabel setCurrentUserInterfaceStyle:](self, "setCurrentUserInterfaceStyle:", v4);
    -[HRImageLabel userInterfaceStyleChanged](self, "userInterfaceStyleChanged");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HRImageLabel userInterfaceStyleChanged](self, "userInterfaceStyleChanged");
      v6 = (void (**)(id, HRImageLabel *, uint64_t))objc_claimAutoreleasedReturnValue();
      v6[2](v6, self, v4);

    }
  }
}

- (void)_setUpUI
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = objc_alloc(MEMORY[0x24BDF6AE8]);
  -[HRImageLabel image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithImage:", v4);
  -[HRImageLabel setImageView:](self, "setImageView:", v5);

  -[HRImageLabel imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentMode:", 1);

  -[HRImageLabel imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HRImageLabel imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRImageLabel addSubview:](self, "addSubview:", v8);

  v9 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HRImageLabel setTextLabel:](self, "setTextLabel:", v9);

  -[HRImageLabel text](self, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRImageLabel textLabel](self, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRImageLabel textLabel](self, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v12);

  -[HRImageLabel textLabel](self, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HRImageLabel textLabel](self, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNumberOfLines:", 0);

  -[HRImageLabel textLabel](self, "textLabel");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[HRImageLabel addSubview:](self, "addSubview:", v16);

}

- (void)_setUpConstraints
{
  double v3;
  double v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
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

  -[HRImageLabel imageSize](self, "imageSize");
  if (v4 != *MEMORY[0x24BDBF148] || v3 != *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    -[HRImageLabel imageView](self, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widthAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRImageLabel imageSize](self, "imageSize");
    objc_msgSend(v7, "constraintEqualToConstant:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActive:", 1);

    -[HRImageLabel imageView](self, "imageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "heightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRImageLabel imageSize](self, "imageSize");
    objc_msgSend(v10, "constraintEqualToConstant:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActive:", 1);

  }
  -[HRImageLabel setImageLeadingSpacing:](self, "setImageLeadingSpacing:", 0.0);
  -[HRImageLabel setImageTrailingSpacing:](self, "setImageTrailingSpacing:", 14.0);
  -[HRImageLabel imageView](self, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRImageLabel leadingAnchor](self, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRImageLabel imageLeadingSpacing](self, "imageLeadingSpacing");
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRImageLabel setImageLeadingConstraint:](self, "setImageLeadingConstraint:", v16);

  -[HRImageLabel imageLeadingConstraint](self, "imageLeadingConstraint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  -[HRImageLabel textLabel](self, "textLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRImageLabel imageView](self, "imageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRImageLabel imageTrailingSpacing](self, "imageTrailingSpacing");
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRImageLabel setImageTrailingConstraint:](self, "setImageTrailingConstraint:", v22);

  -[HRImageLabel imageTrailingConstraint](self, "imageTrailingConstraint");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[HRImageLabel textLabel](self, "textLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRImageLabel trailingAnchor](self, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActive:", 1);

  -[HRImageLabel _updateImageTextAlignmentConstraints](self, "_updateImageTextAlignmentConstraints");
}

- (void)_updateTextLabelFont
{
  void *v3;
  id v4;

  if (-[HRImageLabel boldText](self, "boldText"))
    -[HRImageLabel _textLabelBoldFont](self, "_textLabelBoldFont");
  else
    -[HRImageLabel _textLabelFont](self, "_textLabelFont");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HRImageLabel textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

}

- (void)_updateImageTextAlignmentConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
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
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
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
  void **v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[2];
  _QWORD v66[4];

  v66[3] = *MEMORY[0x24BDAC8D0];
  -[HRImageLabel imageTextAlignmentConstraints](self, "imageTextAlignmentConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HRImageLabel imageTextAlignmentConstraints](self, "imageTextAlignmentConstraints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRImageLabel removeConstraints:](self, "removeConstraints:", v4);

    -[HRImageLabel setImageTextAlignmentConstraints:](self, "setImageTextAlignmentConstraints:", 0);
  }
  switch(-[HRImageLabel imageAlignment](self, "imageAlignment"))
  {
    case 0:
      -[HRImageLabel imageView](self, "imageView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "centerYAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRImageLabel textLabel](self, "textLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "centerYAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "constraintEqualToAnchor:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v10) = 1144750080;
      objc_msgSend(v9, "setPriority:", v10);
      if (-[HRImageLabel _isTextTallerThanImage](self, "_isTextTallerThanImage"))
      {
        -[HRImageLabel textLabel](self, "textLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "topAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HRImageLabel topAnchor](self, "topAnchor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "constraintEqualToAnchor:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[HRImageLabel textLabel](self, "textLabel");
      }
      else
      {
        -[HRImageLabel imageView](self, "imageView");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "topAnchor");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[HRImageLabel topAnchor](self, "topAnchor");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "constraintEqualToAnchor:", v49);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[HRImageLabel imageView](self, "imageView");
      }
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "bottomAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRImageLabel bottomAnchor](self, "bottomAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "constraintEqualToAnchor:", v52);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v66[0] = v14;
      v66[1] = v26;
      v66[2] = v9;
      v45 = (void *)MEMORY[0x24BDBCE30];
      v46 = (void **)v66;
      goto LABEL_14;
    case 1:
      -[HRImageLabel textLabel](self, "textLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "topAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRImageLabel topAnchor](self, "topAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v17);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setActive:", 1);
      -[HRImageLabel imageView](self, "imageView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "centerYAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRImageLabel textLabel](self, "textLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "topAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[HRImageLabel textLabel](self, "textLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "font");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lineHeight");
      objc_msgSend(v14, "setConstant:", v24 * 0.5);

      LODWORD(v25) = 1144750080;
      objc_msgSend(v14, "setPriority:", v25);
      v65[0] = v9;
      v65[1] = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRImageLabel setImageTextAlignmentConstraints:](self, "setImageTextAlignmentConstraints:", v26);
      goto LABEL_15;
    case 2:
      -[HRImageLabel textLabel](self, "textLabel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "topAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRImageLabel topAnchor](self, "topAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v29);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setActive:", 1);
      -[HRImageLabel imageView](self, "imageView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "topAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRImageLabel topAnchor](self, "topAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v32);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v33) = 1148846080;
      objc_msgSend(v14, "setPriority:", v33);
      LODWORD(v30) = -[HRImageLabel _isTextTallerThanImage](self, "_isTextTallerThanImage");
      -[HRImageLabel bottomAnchor](self, "bottomAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_DWORD)v30)
        -[HRImageLabel textLabel](self, "textLabel");
      else
        -[HRImageLabel imageView](self, "imageView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "bottomAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:", v54);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v55) = 1144750080;
      objc_msgSend(v26, "setPriority:", v55);
      v62 = v9;
      v63 = v14;
      v64 = v26;
      v45 = (void *)MEMORY[0x24BDBCE30];
      v46 = &v62;
      goto LABEL_14;
    case 3:
      -[HRImageLabel textLabel](self, "textLabel");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "topAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRImageLabel topAnchor](self, "topAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:", v37);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setActive:", 1);
      -[HRImageLabel imageView](self, "imageView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "firstBaselineAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRImageLabel textLabel](self, "textLabel");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "firstBaselineAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintEqualToAnchor:", v41);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setActive:", 1);
      -[HRImageLabel bottomAnchor](self, "bottomAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRImageLabel textLabel](self, "textLabel");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "bottomAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "constraintEqualToAnchor:", v44);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "setActive:", 1);
      v59 = v9;
      v60 = v14;
      v61 = v26;
      v45 = (void *)MEMORY[0x24BDBCE30];
      v46 = &v59;
LABEL_14:
      objc_msgSend(v45, "arrayWithObjects:count:", v46, 3, v59, v60, v61, v62, v63, v64);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRImageLabel setImageTextAlignmentConstraints:](self, "setImageTextAlignmentConstraints:", v56);

LABEL_15:
      break;
    default:
      break;
  }
  v57 = (void *)MEMORY[0x24BDD1628];
  -[HRImageLabel imageTextAlignmentConstraints](self, "imageTextAlignmentConstraints");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "activateConstraints:", v58);

}

- (BOOL)_isTextTallerThanImage
{
  HRImageLabel *v2;
  void *v3;
  double Height;
  double v5;
  CGRect v7;

  v2 = self;
  -[HRImageLabel textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  Height = CGRectGetHeight(v7);
  -[HRImageLabel imageSize](v2, "imageSize");
  LOBYTE(v2) = Height > v5;

  return (char)v2;
}

- (id)_textLabelFontStyle
{
  return (id)*MEMORY[0x24BDF7810];
}

- (id)_textLabelFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  -[HRImageLabel _textLabelFontStyle](self, "_textLabelFontStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_textLabelBoldFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  -[HRImageLabel _textLabelFontStyle](self, "_textLabelFontStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_preferredFontForTextStyle:symbolicTraits:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (int64_t)imageAlignment
{
  return self->_imageAlignment;
}

- (BOOL)boldText
{
  return self->_boldText;
}

- (double)imageLeadingSpacing
{
  return self->_imageLeadingSpacing;
}

- (double)imageTrailingSpacing
{
  return self->_imageTrailingSpacing;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
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

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (NSLayoutConstraint)imageLeadingConstraint
{
  return self->_imageLeadingConstraint;
}

- (void)setImageLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageLeadingConstraint, a3);
}

- (NSLayoutConstraint)imageTrailingConstraint
{
  return self->_imageTrailingConstraint;
}

- (void)setImageTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageTrailingConstraint, a3);
}

- (NSArray)imageTextAlignmentConstraints
{
  return self->_imageTextAlignmentConstraints;
}

- (void)setImageTextAlignmentConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_imageTextAlignmentConstraints, a3);
}

- (int64_t)currentUserInterfaceStyle
{
  return self->_currentUserInterfaceStyle;
}

- (void)setCurrentUserInterfaceStyle:(int64_t)a3
{
  self->_currentUserInterfaceStyle = a3;
}

- (id)userInterfaceStyleChanged
{
  return self->_userInterfaceStyleChanged;
}

- (void)setUserInterfaceStyleChanged:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInterfaceStyleChanged, 0);
  objc_storeStrong((id *)&self->_imageTextAlignmentConstraints, 0);
  objc_storeStrong((id *)&self->_imageTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_imageLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
