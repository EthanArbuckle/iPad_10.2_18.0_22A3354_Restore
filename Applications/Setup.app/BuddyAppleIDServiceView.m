@implementation BuddyAppleIDServiceView

- (BuddyAppleIDServiceView)initWithImage:(id)a3 description:(id)a4
{
  id v5;
  BuddyAppleIDServiceView *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  UIColor *v16;
  id v17;
  UIFont *v18;
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
  id v29;
  id v30;
  id v31;
  id v32;
  NSArray *v33;
  BuddyAppleIDServiceView *v34;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
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
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  objc_super v62;
  id v63;
  id location[2];
  id v65;
  _QWORD v66[9];

  v65 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v63 = 0;
  objc_storeStrong(&v63, a4);
  v5 = v65;
  v65 = 0;
  v62.receiver = v5;
  v62.super_class = (Class)BuddyAppleIDServiceView;
  v6 = -[BuddyAppleIDServiceView initWithFrame:](&v62, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v65 = v6;
  objc_storeStrong(&v65, v6);
  if (v6)
  {
    v7 = objc_alloc((Class)UIImageView);
    v8 = objc_msgSend(v7, "initWithImage:", location[0]);
    objc_msgSend(v65, "setImageView:", v8);

    v9 = objc_msgSend(v65, "imageView");
    objc_msgSend(v9, "setAccessibilityIgnoresInvertColors:", 1);

    v10 = objc_msgSend(v65, "imageView");
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v11 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v65, "setLabel:", v11);

    v12 = objc_msgSend(v65, "label");
    objc_msgSend(v12, "setNumberOfLines:", 0);

    v13 = v63;
    v14 = objc_msgSend(v65, "label");
    objc_msgSend(v14, "setText:", v13);

    v15 = objc_msgSend(v65, "label");
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v16 = +[UIColor lightGrayColor](UIColor, "lightGrayColor");
    v17 = objc_msgSend(v65, "label");
    objc_msgSend(v17, "setTextColor:", v16);

    v18 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote);
    v19 = objc_msgSend(v65, "label");
    objc_msgSend(v19, "setFont:", v18);

    v20 = v65;
    v21 = objc_msgSend(v65, "imageView");
    objc_msgSend(v20, "addSubview:", v21);

    v22 = v65;
    v23 = objc_msgSend(v65, "label");
    objc_msgSend(v22, "addSubview:", v23);

    v60 = objc_msgSend(v65, "topAnchor");
    v61 = objc_msgSend(v65, "imageView");
    v59 = objc_msgSend(v61, "topAnchor");
    v58 = objc_msgSend(v60, "constraintEqualToAnchor:constant:", 0.0);
    v66[0] = v58;
    v56 = objc_msgSend(v65, "leadingAnchor");
    v57 = objc_msgSend(v65, "imageView");
    v55 = objc_msgSend(v57, "leadingAnchor");
    v54 = objc_msgSend(v56, "constraintEqualToAnchor:constant:", 0.0);
    v66[1] = v54;
    v53 = objc_msgSend(v65, "imageView");
    v52 = objc_msgSend(v53, "heightAnchor");
    v51 = objc_msgSend(v52, "constraintEqualToConstant:", 40.0);
    v66[2] = v51;
    v50 = objc_msgSend(v65, "imageView");
    v49 = objc_msgSend(v50, "widthAnchor");
    v48 = objc_msgSend(v49, "constraintEqualToConstant:", 40.0);
    v66[3] = v48;
    v47 = objc_msgSend(v65, "imageView");
    v46 = objc_msgSend(v47, "bottomAnchor");
    v45 = objc_msgSend(v65, "bottomAnchor");
    v44 = objc_msgSend(v46, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
    v66[4] = v44;
    v42 = objc_msgSend(v65, "topAnchor");
    v43 = objc_msgSend(v65, "label");
    v41 = objc_msgSend(v43, "topAnchor");
    v40 = objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, UIRoundToViewScale(0, 0.5));
    v66[5] = v40;
    v39 = objc_msgSend(v65, "imageView");
    v37 = objc_msgSend(v39, "trailingAnchor");
    v38 = objc_msgSend(v65, "label");
    v36 = objc_msgSend(v38, "leadingAnchor");
    v24 = objc_msgSend(v37, "constraintEqualToAnchor:constant:", -12.0);
    v66[6] = v24;
    v25 = objc_msgSend(v65, "label");
    v26 = objc_msgSend(v25, "trailingAnchor");
    v27 = objc_msgSend(v65, "trailingAnchor");
    v28 = objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, 0.0);
    v66[7] = v28;
    v29 = objc_msgSend(v65, "label");
    v30 = objc_msgSend(v29, "bottomAnchor");
    v31 = objc_msgSend(v65, "bottomAnchor");
    v32 = objc_msgSend(v30, "constraintLessThanOrEqualToAnchor:constant:", v31, 0.0);
    v66[8] = v32;
    v33 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v66, 9);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v33);

  }
  v34 = (BuddyAppleIDServiceView *)v65;
  objc_storeStrong(&v63, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v65, 0);
  return v34;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
