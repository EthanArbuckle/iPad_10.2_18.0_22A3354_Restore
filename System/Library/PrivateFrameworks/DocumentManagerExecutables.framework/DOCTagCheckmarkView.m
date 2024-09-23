@implementation DOCTagCheckmarkView

+ (id)checkmarkImage
{
  if (checkmarkImage_onceToken != -1)
    dispatch_once(&checkmarkImage_onceToken, &__block_literal_global_2);
  return (id)checkmarkImage_checkmarkImage;
}

void __37__DOCTagCheckmarkView_checkmarkImage__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "checkmarkImageConfiguration");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)checkmarkImage_checkmarkImage;
  checkmarkImage_checkmarkImage = v1;

}

- (id)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (DOCTagCheckmarkView)initWithFrame:(CGRect)a3
{
  DOCTagCheckmarkView *v3;
  DOCTagCheckmarkView *v4;
  id v5;
  void *v6;
  uint64_t v7;
  UIImageView *imageView;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSLayoutConstraint *heightConstraint;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)DOCTagCheckmarkView;
  v3 = -[DOCTagCheckmarkView initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[DOCTagCheckmarkView setContentMode:](v3, "setContentMode:", 1);
    v5 = objc_alloc(MEMORY[0x24BEBD668]);
    objc_msgSend((id)objc_opt_class(), "checkmarkImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithImage:", v6);
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v7;

    -[DOCTagCheckmarkView _updateTintColor](v4, "_updateTintColor");
    -[DOCTagCheckmarkView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DOCTagCheckmarkView image](v4, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "size");
    v11 = v10;

    v12 = 1.0;
    if (v11 > 0.0)
    {
      -[DOCTagCheckmarkView image](v4, "image");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "size");
      v15 = v14;
      -[DOCTagCheckmarkView image](v4, "image");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "size");
      v12 = v15 / v17;

    }
    -[DOCTagCheckmarkView widthAnchor](v4, "widthAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagCheckmarkView heightAnchor](v4, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:multiplier:", v19, v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

    -[DOCTagCheckmarkView heightAnchor](v4, "heightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToConstant:", 0.0);
    v22 = objc_claimAutoreleasedReturnValue();
    heightConstraint = v4->_heightConstraint;
    v4->_heightConstraint = (NSLayoutConstraint *)v22;

    LODWORD(v24) = 1144750080;
    -[NSLayoutConstraint setPriority:](v4->_heightConstraint, "setPriority:", v24);
    -[DOCTagCheckmarkView updateForChangedTraitsAffectingFonts](v4, "updateForChangedTraitsAffectingFonts");
    -[NSLayoutConstraint setActive:](v4->_heightConstraint, "setActive:", 1);
    -[DOCTagCheckmarkView addSubview:](v4, "addSubview:", v4->_imageView);
    v25 = (void *)MEMORY[0x24BDD1628];
    DOCConstraintsToResizeWithSuperview();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "activateConstraints:", v26);

    objc_msgSend(MEMORY[0x24BEBDAB0], "doc_traitsAffectingFonts");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (id)-[DOCTagCheckmarkView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v27, sel_updateForChangedTraitsAffectingFonts);

  }
  return v4;
}

- (void)updateForChangedTraitsAffectingFonts
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;

  -[DOCTagCheckmarkView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alignmentRectInsets");
  v5 = v4;
  -[DOCTagCheckmarkView image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alignmentRectInsets");
  v8 = v5 + v7;

  -[DOCTagCheckmarkView image](self, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v10 - v8;

  objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCTagCheckmarkView traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scaledValueForValue:compatibleWithTraitCollection:", v13, v11);
  v15 = v14;

  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:", v15);
}

- (void)setItemTag:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[DOCTag isEqual:](self->_itemTag, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_itemTag, a3);
    -[DOCTagCheckmarkView _updateTintColor](self, "_updateTintColor");
  }

}

- (void)_updateTintColor
{
  void *v3;
  id v4;

  +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "checkmarkImageColorForTag:", self->_itemTag);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_imageView, "setTintColor:", v3);

}

- (DOCTag)itemTag
{
  return self->_itemTag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemTag, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

@end
