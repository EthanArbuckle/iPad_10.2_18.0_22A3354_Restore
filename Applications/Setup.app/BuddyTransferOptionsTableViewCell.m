@implementation BuddyTransferOptionsTableViewCell

- (BuddyTransferOptionsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v4;
  BuddyTransferOptionsTableViewCell *v5;
  BuddyAspectFitLayerView *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSArray *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  NSArray *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  UIImage *v42;
  UIColor *v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  NSArray *v56;
  double v57;
  BuddyTransferOptionsTableViewCell *v58;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  objc_super v74;
  id location;
  int64_t v76;
  SEL v77;
  id v78;
  _QWORD v79[4];
  _QWORD v80[3];
  _QWORD v81[4];

  v78 = self;
  v77 = a2;
  v76 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v4 = v78;
  v78 = 0;
  v74.receiver = v4;
  v74.super_class = (Class)BuddyTransferOptionsTableViewCell;
  v5 = -[BuddyTransferOptionsTableViewCell initWithStyle:reuseIdentifier:](&v74, "initWithStyle:reuseIdentifier:", v76, location);
  v78 = v5;
  objc_storeStrong(&v78, v5);
  if (v5)
  {
    objc_msgSend(v78, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = -[BuddyAspectFitLayerView initWithFrame:]([BuddyAspectFitLayerView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v7 = (void *)*((_QWORD *)v78 + 4);
    *((_QWORD *)v78 + 4) = v6;

    objc_msgSend(*((id *)v78 + 4), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = objc_msgSend(v78, "contentView");
    objc_msgSend(v8, "addSubview:", *((_QWORD *)v78 + 4));

    v68 = objc_msgSend(*((id *)v78 + 4), "leadingAnchor");
    v70 = objc_msgSend(v78, "contentView");
    v66 = objc_msgSend(v70, "leadingAnchor");
    objc_msgSend(v78, "_imageLeadingMargin");
    v64 = objc_msgSend(v68, "constraintEqualToAnchor:constant:", v66);
    v81[0] = v64;
    v62 = objc_msgSend(v78, "contentView");
    v9 = objc_msgSend(v62, "topAnchor");
    v10 = objc_msgSend(*((id *)v78 + 4), "topAnchor");
    v11 = objc_msgSend(v9, "constraintLessThanOrEqualToAnchor:", v10);
    v81[1] = v11;
    v12 = objc_msgSend(v78, "contentView");
    v13 = objc_msgSend(v12, "bottomAnchor");
    v14 = objc_msgSend(*((id *)v78 + 4), "bottomAnchor");
    v15 = objc_msgSend(v13, "constraintGreaterThanOrEqualToAnchor:", v14);
    v81[2] = v15;
    v16 = objc_msgSend(*((id *)v78 + 4), "widthAnchor");
    objc_msgSend(v78, "_imageWidth");
    v17 = objc_msgSend(v16, "constraintEqualToConstant:");
    v81[3] = v17;
    v18 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v81, 4);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

    v73 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v73, "setAxis:", 1);
    objc_msgSend(v73, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v19 = objc_msgSend(v78, "contentView");
    objc_msgSend(v19, "addSubview:", v73);

    v61 = objc_msgSend(v73, "leadingAnchor");
    v60 = objc_msgSend(*((id *)v78 + 4), "trailingAnchor");
    objc_msgSend(v78, "_imageTrailingMargin");
    v20 = objc_msgSend(v61, "constraintEqualToAnchor:constant:", v60);
    v80[0] = v20;
    v21 = objc_msgSend(v73, "topAnchor");
    v22 = objc_msgSend(v78, "contentView");
    v23 = objc_msgSend(v22, "topAnchor");
    v24 = objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23, 40.0);
    v80[1] = v24;
    v25 = objc_msgSend(v78, "contentView");
    v26 = objc_msgSend(v25, "bottomAnchor");
    v27 = objc_msgSend(v73, "bottomAnchor");
    v28 = objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, 30.0);
    v80[2] = v28;
    v29 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v80, 3);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

    v72 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v72, "setAxis:", 1);
    objc_msgSend(v72, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v30 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v31 = (void *)*((_QWORD *)v78 + 1);
    *((_QWORD *)v78 + 1) = v30;

    v32 = objc_msgSend(v78, "_titleFont");
    objc_msgSend(*((id *)v78 + 1), "setFont:", v32);

    objc_msgSend(*((id *)v78 + 1), "setNumberOfLines:", 0);
    objc_msgSend(*((id *)v78 + 1), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v72, "addArrangedSubview:", *((_QWORD *)v78 + 1));
    objc_msgSend(v72, "setCustomSpacing:afterView:", *((_QWORD *)v78 + 1), 2.0);
    v33 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v34 = (void *)*((_QWORD *)v78 + 2);
    *((_QWORD *)v78 + 2) = v33;

    v35 = objc_msgSend(v78, "_descriptionFont");
    objc_msgSend(*((id *)v78 + 2), "setFont:", v35);

    objc_msgSend(*((id *)v78 + 2), "setNumberOfLines:", 0);
    objc_msgSend(*((id *)v78 + 2), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v72, "addArrangedSubview:", *((_QWORD *)v78 + 2));
    objc_msgSend(v73, "addArrangedSubview:", v72);
    objc_msgSend(v73, "setCustomSpacing:afterView:", v72, 16.0);
    v36 = objc_msgSend(*((id *)v78 + 4), "centerYAnchor");
    v37 = objc_msgSend(v72, "centerYAnchor");
    v38 = objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    objc_msgSend(v38, "setActive:", 1);

    v39 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v40 = (void *)*((_QWORD *)v78 + 3);
    *((_QWORD *)v78 + 3) = v39;

    v41 = objc_msgSend(v78, "_footnoteFont");
    objc_msgSend(*((id *)v78 + 3), "setFont:", v41);

    objc_msgSend(*((id *)v78 + 3), "setNumberOfLines:", 0);
    objc_msgSend(*((id *)v78 + 3), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v73, "addArrangedSubview:", *((_QWORD *)v78 + 3));
    v42 = +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.forward"));
    v43 = +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
    v71 = -[UIImage imageWithTintColor:renderingMode:](v42, "imageWithTintColor:renderingMode:", v43, 1);

    v44 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v71);
    v45 = (void *)*((_QWORD *)v78 + 5);
    *((_QWORD *)v78 + 5) = v44;

    objc_msgSend(*((id *)v78 + 5), "setContentMode:", 1);
    objc_msgSend(*((id *)v78 + 5), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v46 = objc_msgSend(v78, "contentView");
    objc_msgSend(v46, "addSubview:", *((_QWORD *)v78 + 5));

    v67 = objc_msgSend(*((id *)v78 + 5), "centerYAnchor");
    v69 = objc_msgSend(v78, "contentView");
    v65 = objc_msgSend(v69, "centerYAnchor");
    v63 = objc_msgSend(v67, "constraintEqualToAnchor:");
    v79[0] = v63;
    v47 = objc_msgSend(*((id *)v78 + 5), "widthAnchor");
    objc_msgSend(v78, "_chevronWidth");
    v48 = objc_msgSend(v47, "constraintEqualToConstant:");
    v79[1] = v48;
    v49 = objc_msgSend(*((id *)v78 + 5), "leadingAnchor");
    v50 = objc_msgSend(v73, "trailingAnchor");
    v51 = objc_msgSend(v49, "constraintEqualToAnchor:constant:", v50, 10.0);
    v79[2] = v51;
    v52 = objc_msgSend(v78, "contentView");
    v53 = objc_msgSend(v52, "trailingAnchor");
    v54 = objc_msgSend(*((id *)v78 + 5), "trailingAnchor");
    v55 = objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, 8.0);
    v79[3] = v55;
    v56 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v79, 4);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v56);

    LODWORD(v57) = 1148846080;
    objc_msgSend(*((id *)v78 + 5), "setContentHuggingPriority:forAxis:", 0, v57);
    objc_storeStrong(&v71, 0);
    objc_storeStrong(&v72, 0);
    objc_storeStrong(&v73, 0);
  }
  v58 = (BuddyTransferOptionsTableViewCell *)v78;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v78, 0);
  return v58;
}

- (void)prepareForReuse
{
  id v2;
  BuddyAspectFitLayerView *v3;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  objc_super v7;
  SEL v8;
  BuddyTransferOptionsTableViewCell *v9;

  v9 = self;
  v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)BuddyTransferOptionsTableViewCell;
  -[BuddyTransferOptionsTableViewCell prepareForReuse](&v7, "prepareForReuse");
  v2 = -[BuddyTransferOptionsTableViewCell imageView](v9, "imageView");
  objc_msgSend(v2, "setImage:", 0);

  v3 = -[BuddyTransferOptionsTableViewCell iconLayerView](v9, "iconLayerView");
  -[BuddyAspectFitLayerView setManagedLayer:](v3, "setManagedLayer:", 0);

  v4 = -[BuddyTransferOptionsTableViewCell nameLabel](v9, "nameLabel");
  -[UILabel setText:](v4, "setText:", 0);

  v5 = -[BuddyTransferOptionsTableViewCell descriptionLabel](v9, "descriptionLabel");
  -[UILabel setText:](v5, "setText:", 0);

  v6 = -[BuddyTransferOptionsTableViewCell footnoteLabel](v9, "footnoteLabel");
  -[UILabel setText:](v6, "setText:", 0);

}

- (CALayer)iconLayer
{
  BuddyAspectFitLayerView *v2;
  CALayer *v3;

  v2 = -[BuddyTransferOptionsTableViewCell iconLayerView](self, "iconLayerView", a2, self);
  v3 = -[BuddyAspectFitLayerView managedLayer](v2, "managedLayer");

  return v3;
}

- (void)setIconLayer:(id)a3
{
  id v3;
  BuddyAspectFitLayerView *v4;
  id location[2];
  BuddyTransferOptionsTableViewCell *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = location[0];
  v4 = -[BuddyTransferOptionsTableViewCell iconLayerView](v6, "iconLayerView");
  -[BuddyAspectFitLayerView setManagedLayer:](v4, "setManagedLayer:", v3);

  objc_storeStrong(location, 0);
}

- (id)_titleFont
{
  id v2;
  UIFont *v3;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleBody);
  v2 = objc_msgSend(location[0], "fontDescriptorWithSymbolicTraits:", 2);
  v3 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v2, 0.0);

  objc_storeStrong(location, 0);
  return v3;
}

- (id)_descriptionFont
{
  UIFontDescriptor *v2;
  UIFont *v3;

  v2 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleSubheadline, a2, self);
  v3 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v2, 0.0);

  return v3;
}

- (id)_footnoteFont
{
  UIFontDescriptor *v2;
  UIFont *v3;

  v2 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleFootnote, a2, self);
  v3 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v2, 0.0);

  return v3;
}

- (double)_imageWidth
{
  id v2;
  id v3;

  v2 = +[BYDevice currentDevice](BYDevice, "currentDevice");
  v3 = objc_msgSend(v2, "size");

  if (v3 == (id)2)
    return 40.0;
  else
    return 54.0;
}

- (double)_imageLeadingMargin
{
  id v2;
  char *v3;
  double v5;

  v2 = +[BYDevice currentDevice](BYDevice, "currentDevice");
  v3 = (char *)objc_msgSend(v2, "size");

  if (v3)
  {
    if (v3 == (char *)1)
      return 20.0;
    if (v3 == (char *)2)
      return 12.0;
    if (v3 != (char *)3)
    {
      if ((unint64_t)(v3 - 4) >= 3)
        return v5;
      return 20.0;
    }
  }
  return 16.0;
}

- (double)_imageTrailingMargin
{
  id v2;
  char *v3;
  double v5;

  v2 = +[BYDevice currentDevice](BYDevice, "currentDevice");
  v3 = (char *)objc_msgSend(v2, "size");

  if (v3)
  {
    if (v3 == (char *)1)
      return 14.0;
    if ((unint64_t)(v3 - 2) >= 2)
    {
      if ((unint64_t)(v3 - 4) >= 3)
        return v5;
      return 14.0;
    }
  }
  return 10.0;
}

- (double)_chevronWidth
{
  id v2;
  id v3;

  v2 = +[BYDevice currentDevice](BYDevice, "currentDevice");
  v3 = objc_msgSend(v2, "size");

  if (v3 == (id)2)
    return 24.0;
  else
    return 20.0;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (UILabel)footnoteLabel
{
  return self->_footnoteLabel;
}

- (void)setFootnoteLabel:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteLabel, a3);
}

- (BuddyAspectFitLayerView)iconLayerView
{
  return self->_iconLayerView;
}

- (void)setIconLayerView:(id)a3
{
  objc_storeStrong((id *)&self->_iconLayerView, a3);
}

- (UIImageView)chevronView
{
  return self->_chevronView;
}

- (void)setChevronView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_iconLayerView, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end
