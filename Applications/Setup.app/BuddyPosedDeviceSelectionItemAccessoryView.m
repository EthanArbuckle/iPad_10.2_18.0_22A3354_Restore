@implementation BuddyPosedDeviceSelectionItemAccessoryView

- (BuddyPosedDeviceSelectionItemAccessoryView)initWithImage:(id)a3 text:(id)a4
{
  id v5;
  BuddyPosedDeviceSelectionItemAccessoryView *v6;
  id v7;
  void *v8;
  UIImageSymbolConfiguration *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  NSArray *v28;
  BuddyPosedDeviceSelectionItemAccessoryView *v29;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  double v42;
  void **v43;
  int v44;
  int v45;
  void (*v46)(uint64_t);
  void *v47;
  id v48;
  objc_super v49;
  id obj;
  id location[2];
  id v52;
  _QWORD v53[7];

  v52 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj = 0;
  objc_storeStrong(&obj, a4);
  v5 = v52;
  v52 = 0;
  v49.receiver = v5;
  v49.super_class = (Class)BuddyPosedDeviceSelectionItemAccessoryView;
  v6 = -[BuddyPosedDeviceSelectionItemAccessoryView initWithFrame:](&v49, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v52 = v6;
  objc_storeStrong(&v52, v6);
  if (v6)
  {
    objc_storeStrong((id *)v52 + 3, location[0]);
    v7 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v8 = (void *)*((_QWORD *)v52 + 4);
    *((_QWORD *)v52 + 4) = v7;

    objc_msgSend(*((id *)v52 + 4), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*((id *)v52 + 4), "setContentMode:", 4);
    v9 = +[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 24.0);
    objc_msgSend(*((id *)v52 + 4), "setPreferredSymbolConfiguration:", v9);

    v10 = objc_msgSend(*((id *)v52 + 4), "layer");
    objc_msgSend(v10, "setCornerRadius:", 12.0);

    v11 = objc_msgSend(*((id *)v52 + 4), "layer");
    objc_msgSend(v11, "setMasksToBounds:", 1);

    v12 = objc_msgSend(*((id *)v52 + 4), "layer");
    objc_msgSend(v12, "setBorderWidth:", 1.0);

    v13 = objc_msgSend(v52, "traitCollection");
    v43 = _NSConcreteStackBlock;
    v44 = -1073741824;
    v45 = 0;
    v46 = sub_1000D1618;
    v47 = &unk_100280730;
    v48 = v52;
    objc_msgSend(v13, "performAsCurrentTraitCollection:", &v43);

    objc_storeStrong((id *)v52 + 5, obj);
    v14 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v15 = (void *)*((_QWORD *)v52 + 2);
    *((_QWORD *)v52 + 2) = v14;

    objc_msgSend(*((id *)v52 + 2), "setNumberOfLines:", 0);
    objc_msgSend(*((id *)v52 + 2), "setText:", obj);
    v16 = +[UIColor _labelColor](UIColor, "_labelColor");
    objc_msgSend(*((id *)v52 + 2), "setTextColor:", v16);

    objc_msgSend(*((id *)v52 + 2), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v52, "addSubview:", *((_QWORD *)v52 + 4));
    objc_msgSend(v52, "addSubview:", *((_QWORD *)v52 + 2));
    v42 = 8.0;
    v17 = +[BYDevice currentDevice](BYDevice, "currentDevice");
    v18 = objc_msgSend(v17, "size");

    if (v18 == (id)2)
      v42 = 5.0;
    v41 = objc_msgSend(*((id *)v52 + 2), "topAnchor");
    v40 = objc_msgSend(v52, "topAnchor");
    v39 = objc_msgSend(v41, "constraintEqualToAnchor:");
    v53[0] = v39;
    v38 = objc_msgSend(*((id *)v52 + 2), "centerXAnchor");
    v37 = objc_msgSend(v52, "centerXAnchor");
    v36 = objc_msgSend(v38, "constraintEqualToAnchor:");
    v53[1] = v36;
    v35 = objc_msgSend(*((id *)v52 + 4), "topAnchor");
    v34 = objc_msgSend(*((id *)v52 + 2), "bottomAnchor");
    v33 = objc_msgSend(v35, "constraintEqualToAnchor:constant:", v42);
    v53[2] = v33;
    v32 = objc_msgSend(*((id *)v52 + 4), "centerXAnchor");
    v31 = objc_msgSend(v52, "centerXAnchor");
    v19 = objc_msgSend(v32, "constraintEqualToAnchor:");
    v53[3] = v19;
    v20 = objc_msgSend(*((id *)v52 + 4), "heightAnchor");
    v21 = objc_msgSend(v20, "constraintEqualToConstant:", 24.0);
    v53[4] = v21;
    v22 = objc_msgSend(*((id *)v52 + 4), "widthAnchor");
    v23 = objc_msgSend(*((id *)v52 + 4), "heightAnchor");
    v24 = objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v53[5] = v24;
    v25 = objc_msgSend(v52, "bottomAnchor");
    v26 = objc_msgSend(*((id *)v52 + 4), "bottomAnchor");
    v27 = objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v53[6] = v27;
    v28 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v53, 7);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

    objc_msgSend(v52, "layoutSubviews");
    objc_storeStrong(&v48, 0);
  }
  objc_msgSend(v52, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v29 = (BuddyPosedDeviceSelectionItemAccessoryView *)v52;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v52, 0);
  return v29;
}

- (BuddyPosedDeviceSelectionItemAccessoryView)initWithSymbol:(id)a3 text:(id)a4
{
  UIColor *v5;
  UIColor *v6;
  NSArray *v7;
  id v8;
  BuddyPosedDeviceSelectionItemAccessoryView *v9;
  id v11;
  id v12;
  id v13;
  id location[2];
  id v15;
  _QWORD v16[2];

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v5 = +[UIColor whiteColor](UIColor, "whiteColor");
  v16[0] = v5;
  v6 = +[UIColor systemBlueColor](UIColor, "systemBlueColor");
  v16[1] = v6;
  v7 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2);
  v12 = +[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v7);

  v11 = +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", location[0], v12);
  v8 = v15;
  v15 = 0;
  v15 = objc_msgSend(v8, "initWithImage:text:", v11, v13);
  v9 = (BuddyPosedDeviceSelectionItemAccessoryView *)v15;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v15, 0);
  return v9;
}

- (void)setSelected:(BOOL)a3
{
  UIImageView *v3;
  id v4;
  UIImage *v5;
  UIImageView *v6;
  UIImageView *v7;
  id v8;
  UIImageView *v9;
  UIImageView *v10;

  if (a3 && !self->_selected)
  {
    v3 = -[BuddyPosedDeviceSelectionItemAccessoryView imageView](self, "imageView");
    v4 = -[UIImageView layer](v3, "layer");
    objc_msgSend(v4, "setBorderWidth:", 0.0);

    v5 = -[BuddyPosedDeviceSelectionItemAccessoryView selectedImage](self, "selectedImage");
    v6 = -[BuddyPosedDeviceSelectionItemAccessoryView imageView](self, "imageView");
    -[UIImageView setImage:](v6, "setImage:", v5);

  }
  if (!a3 && self->_selected)
  {
    v7 = -[BuddyPosedDeviceSelectionItemAccessoryView imageView](self, "imageView");
    v8 = -[UIImageView layer](v7, "layer");
    objc_msgSend(v8, "setBorderWidth:", 1.0);

    v9 = -[BuddyPosedDeviceSelectionItemAccessoryView imageView](self, "imageView");
    -[UIImageView setImage:](v9, "setImage:", 0);

  }
  self->_selected = a3;
  v10 = -[BuddyPosedDeviceSelectionItemAccessoryView imageView](self, "imageView");
  -[UIImageView layoutIfNeeded](v10, "layoutIfNeeded");

}

- (void)traitCollectionDidChange:(id)a3
{
  UIColor *v3;
  CGColor *v4;
  id v5;
  objc_super v6;
  id location[2];
  BuddyPosedDeviceSelectionItemAccessoryView *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6.receiver = v8;
  v6.super_class = (Class)BuddyPosedDeviceSelectionItemAccessoryView;
  -[BuddyPosedDeviceSelectionItemAccessoryView traitCollectionDidChange:](&v6, "traitCollectionDidChange:", location[0]);
  v3 = objc_retainAutorelease(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  v4 = -[UIColor CGColor](v3, "CGColor");
  v5 = -[UIImageView layer](v8->_imageView, "layer");
  objc_msgSend(v5, "setBorderColor:", v4);

  objc_storeStrong(location, 0);
}

- (BOOL)selected
{
  return self->_selected;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIImage)selectedImage
{
  return self->_selectedImage;
}

- (void)setSelectedImage:(id)a3
{
  objc_storeStrong((id *)&self->_selectedImage, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (NSString)accessoryText
{
  return self->_accessoryText;
}

- (void)setAccessoryText:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryText, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_selectedImage, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
