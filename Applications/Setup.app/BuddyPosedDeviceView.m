@implementation BuddyPosedDeviceView

- (BuddyPosedDeviceView)initWithFrame:(CGRect)a3
{
  UIColor *v3;
  BuddyPosedDeviceView *v4;
  objc_super v6;
  SEL v7;
  id location;
  CGRect v9;

  v9 = a3;
  v7 = a2;
  location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddyPosedDeviceView;
  location = -[BuddyPosedDeviceView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong(&location, location);
  if (location)
  {
    v3 = +[UIColor systemGray6Color](UIColor, "systemGray6Color");
    objc_msgSend(location, "setBackgroundColor:", v3);

    objc_msgSend(location, "setClipsToBounds:", 1);
    objc_msgSend(location, "setAccessibilityIgnoresInvertColors:", 1);
  }
  v4 = (BuddyPosedDeviceView *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (BuddyPosedDeviceView)initWithPairForProductType:(id)a3
{
  id v3;
  BuddyPosedDeviceView *v4;
  id location[2];
  id v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v7;
  v7 = 0;
  v7 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_storeStrong(&v7, v7);
  if (v7)
  {
    if ((objc_msgSend(location[0], "containsString:", CFSTR("iPad")) & 1) != 0)
      objc_msgSend(v7, "_addPairForiPad");
    else
      objc_msgSend(v7, "_addPairForiPhone:", location[0]);
  }
  v4 = (BuddyPosedDeviceView *)v7;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v7, 0);
  return v4;
}

- (id)_localizedHelloCursiveAssetForDeviceType:(int64_t)a3
{
  NSArray *v3;
  NSArray *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id location;
  id v11;
  id v12;
  id v13[4];

  v13[3] = self;
  v13[2] = (id)a2;
  v13[1] = (id)a3;
  v3 = +[NSLocale preferredLanguages](NSLocale, "preferredLanguages");
  v4 = +[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", &off_100290B48, v3);
  v13[0] = -[NSArray firstObject](v4, "firstObject");

  v12 = &off_100290BC0;
  v5 = objc_msgSend(v12, "objectForKey:", v13[0]);

  if (v5)
  {
    v6 = objc_msgSend(v12, "objectForKey:", v13[0]);
    v7 = v13[0];
    v13[0] = v6;

  }
  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cursive Hello %@"), v13[0]);
  location = +[UIImage imageNamed:](UIImage, "imageNamed:", v11);
  if (!location)
  {
    location = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Cursive Hello en"));

  }
  v8 = location;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  return v8;
}

- (void)_addPairForiPad
{
  UIImage *v2;
  UIImage *v3;
  UIColor *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSArray *v14;
  id v15;
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
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id location;
  id v39;
  id v40;
  id v41[2];
  BuddyPosedDeviceView *v42;
  _QWORD v43[11];

  v42 = self;
  v41[1] = (id)a2;
  v41[0] = -[BuddyPosedDeviceView _localizedHelloCursiveAssetForDeviceType:](self, "_localizedHelloCursiveAssetForDeviceType:", 1);
  v2 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("iPad Pair Hello"));
  v40 = -[BuddyPosedDeviceView _helloScreenViewWithBackgroundImage:cursiveImage:labelBottomOffset:labelHorizontalInset:deviceType:](v42, "_helloScreenViewWithBackgroundImage:cursiveImage:labelBottomOffset:labelHorizontalInset:deviceType:", v2, v41[0], 1, 88.0, 88.0);

  v3 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("iPad Phone Pair Home"));
  v39 = -[BuddyPosedDeviceView _homeScreenViewWithImage:](v42, "_homeScreenViewWithImage:", v3);

  -[BuddyPosedDeviceView addSubview:](v42, "addSubview:", v40);
  -[BuddyPosedDeviceView addSubview:](v42, "addSubview:", v39);
  location = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(location, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = +[UIColor systemGray6Color](UIColor, "systemGray6Color");
  objc_msgSend(location, "setBackgroundColor:", v4);

  -[BuddyPosedDeviceView addSubview:](v42, "addSubview:", location);
  v37 = objc_msgSend(v40, "leadingAnchor");
  v36 = -[BuddyPosedDeviceView leadingAnchor](v42, "leadingAnchor");
  v35 = objc_msgSend(v37, "constraintEqualToAnchor:");
  v43[0] = v35;
  v34 = objc_msgSend(v40, "trailingAnchor");
  v33 = -[BuddyPosedDeviceView trailingAnchor](v42, "trailingAnchor");
  v32 = objc_msgSend(v34, "constraintEqualToAnchor:");
  v43[1] = v32;
  v31 = objc_msgSend(v40, "topAnchor");
  v30 = -[BuddyPosedDeviceView topAnchor](v42, "topAnchor");
  v29 = objc_msgSend(v31, "constraintEqualToAnchor:");
  v43[2] = v29;
  v28 = objc_msgSend(v40, "bottomAnchor");
  v27 = -[BuddyPosedDeviceView bottomAnchor](v42, "bottomAnchor");
  v26 = objc_msgSend(v28, "constraintEqualToAnchor:");
  v43[3] = v26;
  v25 = objc_msgSend(v39, "topAnchor");
  v24 = -[BuddyPosedDeviceView topAnchor](v42, "topAnchor");
  v23 = objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:");
  v43[4] = v23;
  v22 = objc_msgSend(v39, "bottomAnchor");
  v21 = -[BuddyPosedDeviceView bottomAnchor](v42, "bottomAnchor");
  v20 = objc_msgSend(v22, "constraintEqualToAnchor:");
  v43[5] = v20;
  v19 = -[BuddyPosedDeviceView trailingAnchor](v42, "trailingAnchor");
  v18 = objc_msgSend(v39, "trailingAnchor");
  v17 = objc_msgSend(v19, "constraintEqualToAnchor:constant:", 28.0);
  v43[6] = v17;
  v16 = objc_msgSend(location, "leadingAnchor");
  v15 = -[BuddyPosedDeviceView leadingAnchor](v42, "leadingAnchor");
  v5 = objc_msgSend(v16, "constraintEqualToAnchor:");
  v43[7] = v5;
  v6 = objc_msgSend(location, "trailingAnchor");
  v7 = -[BuddyPosedDeviceView trailingAnchor](v42, "trailingAnchor");
  v8 = objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v43[8] = v8;
  v9 = objc_msgSend(location, "bottomAnchor");
  v10 = -[BuddyPosedDeviceView bottomAnchor](v42, "bottomAnchor");
  v11 = objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v43[9] = v11;
  v12 = objc_msgSend(location, "heightAnchor");
  v13 = objc_msgSend(v12, "constraintEqualToConstant:", 0.5);
  v43[10] = v13;
  v14 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 11);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

  objc_storeStrong(&location, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(v41, 0);
}

- (void)_addPairForiPhone:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSArray *v12;
  double v13;
  double v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSArray *v24;
  id v25;
  double v26;
  id v27;
  double v28;
  id v29;
  id v30;
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
  double v43;
  double v44;
  id v45;
  id v46;
  id v47;
  id location[2];
  BuddyPosedDeviceView *v49;
  _QWORD v50[7];
  _QWORD v51[3];

  v49 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v47 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v47, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BuddyPosedDeviceView addSubview:](v49, "addSubview:", v47);
  v3 = objc_msgSend(v47, "centerXAnchor");
  v4 = -[BuddyPosedDeviceView centerXAnchor](v49, "centerXAnchor");
  v5 = objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v51[0] = v5;
  v6 = objc_msgSend(v47, "topAnchor");
  v7 = -[BuddyPosedDeviceView topAnchor](v49, "topAnchor");
  v8 = objc_msgSend(v6, "constraintGreaterThanOrEqualToAnchor:", v7);
  v51[1] = v8;
  v9 = objc_msgSend(v47, "bottomAnchor");
  v10 = -[BuddyPosedDeviceView bottomAnchor](v49, "bottomAnchor");
  v11 = objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v51[2] = v11;
  v12 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 3);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

  v46 = -[BuddyPosedDeviceView _helloScreenViewForProductType:](v49, "_helloScreenViewForProductType:", location[0]);
  v45 = -[BuddyPosedDeviceView _homeScreenViewForProductType:](v49, "_homeScreenViewForProductType:", location[0]);
  LODWORD(v13) = 1148846080;
  objc_msgSend(v46, "setContentCompressionResistancePriority:forAxis:", 0, v13);
  LODWORD(v14) = 1148846080;
  objc_msgSend(v45, "setContentCompressionResistancePriority:forAxis:", 0, v14);
  objc_msgSend(v47, "addSubview:", v46);
  objc_msgSend(v47, "addSubview:", v45);
  v44 = 0.0;
  switch(-[BuddyPosedDeviceView _deviceTypeForProductType:](v49, "_deviceTypeForProductType:", location[0]))
  {
    case 1:
      v44 = 59.0;
      break;
    case 2:
      v44 = 62.0;
      break;
    case 3:
      v44 = 60.0;
      break;
    case 4:
      v44 = 74.0;
      break;
    case 5:
      v44 = 71.0;
      break;
    default:
      break;
  }
  v41 = objc_msgSend(v47, "topAnchor");
  v40 = objc_msgSend(v46, "topAnchor");
  v39 = objc_msgSend(v41, "constraintEqualToAnchor:");
  v50[0] = v39;
  v38 = objc_msgSend(v47, "bottomAnchor");
  v37 = objc_msgSend(v45, "bottomAnchor");
  v36 = objc_msgSend(v38, "constraintEqualToAnchor:");
  v50[1] = v36;
  v35 = objc_msgSend(v47, "leftAnchor");
  v34 = objc_msgSend(v46, "leftAnchor");
  v33 = objc_msgSend(v35, "constraintEqualToAnchor:");
  v50[2] = v33;
  v32 = objc_msgSend(v47, "rightAnchor");
  v31 = objc_msgSend(v45, "rightAnchor");
  v30 = objc_msgSend(v32, "constraintEqualToAnchor:");
  v50[3] = v30;
  v15 = objc_msgSend(v47, "bottomAnchor");
  v16 = objc_msgSend(v46, "bottomAnchor");
  v17 = objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 20.0);
  v50[4] = v17;
  v18 = objc_msgSend(v45, "topAnchor");
  v19 = objc_msgSend(v46, "topAnchor");
  v20 = objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, v44);
  v50[5] = v20;
  v21 = objc_msgSend(v46, "rightAnchor");
  v22 = objc_msgSend(v45, "leftAnchor");
  v23 = objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 20.0);
  v50[6] = v23;
  v24 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 7);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

  v25 = objc_msgSend(v45, "layer");
  LODWORD(v26) = 1045220557;
  objc_msgSend(v25, "setShadowOpacity:", v26);

  v27 = objc_msgSend(v45, "layer");
  objc_msgSend(v27, "setShadowRadius:", 18.0);

  v42 = sub_10005C530();
  v43 = v28;
  v29 = objc_msgSend(v45, "layer");
  objc_msgSend(v29, "setShadowOffset:", v42, v43);

  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(location, 0);
}

- (id)_helloScreenViewForProductType:(id)a3
{
  id v3;
  id v4;
  double v6;
  id v7;
  id v8;
  id location[2];
  BuddyPosedDeviceView *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = -[BuddyPosedDeviceView _localizedHelloCursiveAssetForDeviceType:](v10, "_localizedHelloCursiveAssetForDeviceType:", 0);
  v7 = -[BuddyPosedDeviceView _helloBackgroundForProductType:](v10, "_helloBackgroundForProductType:", location[0]);
  v6 = 0.0;
  switch(-[BuddyPosedDeviceView _deviceTypeForProductType:](v10, "_deviceTypeForProductType:", location[0]))
  {
    case 1:
      v3 = -[BuddyPosedDeviceView _helloScreenViewWithBackgroundImage:cursiveImage:labelBottomOffset:labelHorizontalInset:deviceType:](v10, "_helloScreenViewWithBackgroundImage:cursiveImage:labelBottomOffset:labelHorizontalInset:deviceType:", v7, v8, 0, 92.0, 10.0, 0x4057000000000000);
      break;
    case 2:
      v3 = -[BuddyPosedDeviceView _helloScreenViewWithBackgroundImage:cursiveImage:labelBottomOffset:labelHorizontalInset:deviceType:](v10, "_helloScreenViewWithBackgroundImage:cursiveImage:labelBottomOffset:labelHorizontalInset:deviceType:", v7, v8, 0, 108.0, 10.0, 0x405B000000000000);
      break;
    case 3:
      v3 = -[BuddyPosedDeviceView _helloScreenViewWithBackgroundImage:cursiveImage:labelBottomOffset:labelHorizontalInset:deviceType:](v10, "_helloScreenViewWithBackgroundImage:cursiveImage:labelBottomOffset:labelHorizontalInset:deviceType:", v7, v8, 0, 122.0, 10.0, 0x405E800000000000);
      break;
    case 4:
      v3 = -[BuddyPosedDeviceView _helloScreenViewWithBackgroundImage:cursiveImage:labelBottomOffset:labelHorizontalInset:deviceType:](v10, "_helloScreenViewWithBackgroundImage:cursiveImage:labelBottomOffset:labelHorizontalInset:deviceType:", v7, v8, 0, 134.0, 10.0, 0x4060C00000000000);
      break;
    case 5:
      v6 = 149.0;
      goto LABEL_7;
    default:
LABEL_7:
      v3 = -[BuddyPosedDeviceView _helloScreenViewWithBackgroundImage:cursiveImage:labelBottomOffset:labelHorizontalInset:deviceType:](v10, "_helloScreenViewWithBackgroundImage:cursiveImage:labelBottomOffset:labelHorizontalInset:deviceType:", v7, v8, 0, v6, 10.0, *(_QWORD *)&v6);
      break;
  }
  v4 = v3;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_helloScreenViewWithBackgroundImage:(id)a3 cursiveImage:(id)a4 labelBottomOffset:(double)a5 labelHorizontalInset:(double)a6 deviceType:(int64_t)a7
{
  id v11;
  id v12;
  double v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  id v27;
  NSArray *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  NSArray *v39;
  id v40;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  double v48;
  id v49[5];
  id v50;
  id v51;
  int64_t v52;
  double v53;
  double v54;
  id v55;
  id location[3];
  _QWORD v57[4];
  _QWORD v58[4];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v55 = 0;
  objc_storeStrong(&v55, a4);
  v54 = a5;
  v53 = a6;
  v52 = a7;
  v11 = objc_alloc((Class)UIImageView);
  v51 = objc_msgSend(v11, "initWithImage:", location[0]);
  objc_msgSend(v51, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v51, "setContentMode:", 1);
  v12 = objc_alloc((Class)UIImageView);
  v50 = objc_msgSend(v12, "initWithImage:", location[0]);
  objc_msgSend(v50, "setHidden:", 1);
  objc_msgSend(v50, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v13) = 1148846080;
  objc_msgSend(v50, "setContentHuggingPriority:forAxis:", 0, v13);
  objc_msgSend(v51, "addSubview:", v50);
  v47 = objc_msgSend(v50, "topAnchor");
  v46 = objc_msgSend(v51, "topAnchor");
  v45 = objc_msgSend(v47, "constraintEqualToAnchor:");
  v58[0] = v45;
  v14 = objc_msgSend(v50, "bottomAnchor");
  v15 = objc_msgSend(v51, "bottomAnchor");
  v16 = objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v58[1] = v16;
  v17 = objc_msgSend(v50, "centerXAnchor");
  v18 = objc_msgSend(v51, "centerXAnchor");
  v19 = objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v58[2] = v19;
  v20 = objc_msgSend(v50, "widthAnchor");
  v21 = objc_msgSend(v50, "heightAnchor");
  objc_msgSend(location[0], "size");
  v49[3] = v22;
  v49[4] = v23;
  v24 = *(double *)&v22;
  objc_msgSend(location[0], "size");
  v49[1] = v25;
  v49[2] = v26;
  v27 = objc_msgSend(v20, "constraintEqualToAnchor:multiplier:", v21, v24 / *(double *)&v26);
  v58[3] = v27;
  v28 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 4);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

  v29 = objc_alloc((Class)UIImageView);
  v49[0] = objc_msgSend(v29, "initWithImage:", v55);
  objc_msgSend(v49[0], "setContentMode:", 1);
  objc_msgSend(v49[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v51, "addSubview:", v49[0]);
  v48 = 20.0;
  if (v52 == 1)
    v48 = 30.0;
  v44 = objc_msgSend(v50, "centerXAnchor", NSLayoutConstraint);
  v43 = objc_msgSend(v49[0], "centerXAnchor");
  v30 = objc_msgSend(v44, "constraintEqualToAnchor:");
  v57[0] = v30;
  v31 = objc_msgSend(v50, "widthAnchor");
  v32 = objc_msgSend(v49[0], "widthAnchor");
  v33 = objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:constant:", v32, v53 * 2.0);
  v57[1] = v33;
  v34 = objc_msgSend(v51, "bottomAnchor");
  v35 = objc_msgSend(v49[0], "bottomAnchor");
  v36 = objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, v54);
  v57[2] = v36;
  v37 = objc_msgSend(v49[0], "heightAnchor");
  v38 = objc_msgSend(v37, "constraintLessThanOrEqualToConstant:", v48);
  v57[3] = v38;
  v39 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v57, 4);
  objc_msgSend(v42, "activateConstraints:", v39);

  v40 = v51;
  objc_storeStrong(v49, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(location, 0);
  return v40;
}

- (id)_homeScreenViewForProductType:(id)a3
{
  id v3;
  id v4;
  id v6;
  id location[2];
  BuddyPosedDeviceView *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyPosedDeviceView _homeScreenImageForProductType:](v8, "_homeScreenImageForProductType:", location[0]);
  v4 = -[BuddyPosedDeviceView _homeScreenViewWithImage:](v8, "_homeScreenViewWithImage:", v3, v3);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_homeScreenViewWithImage:(id)a3
{
  id v3;
  id v4;
  id v6;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_alloc((Class)UIImageView);
  v6 = objc_msgSend(v3, "initWithImage:", location[0]);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setContentMode:", 1);
  v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_homeScreenImageForProductType:(id)a3
{
  NSString *v3;
  UIImage *v4;
  id v6;
  id location[2];
  BuddyPosedDeviceView *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = -[BuddyPosedDeviceView _screenImagePrefixForProductType:](v8, "_screenImagePrefixForProductType:", location[0]);
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ Pair Home"), v6);
  v4 = +[UIImage imageNamed:](UIImage, "imageNamed:", v3);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_helloBackgroundForProductType:(id)a3
{
  id v3;
  NSString *v4;
  UIImage *v5;
  id location[2];
  BuddyPosedDeviceView *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyPosedDeviceView _screenImagePrefixForProductType:](v8, "_screenImagePrefixForProductType:", location[0]);
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ Pair Hello"), v3);
  v5 = +[UIImage imageNamed:](UIImage, "imageNamed:", v4);

  objc_storeStrong(location, 0);
  return v5;
}

- (id)_screenImagePrefixForProductType:(id)a3
{
  id v3;
  id v5;
  int64_t v6;
  id location[2];
  BuddyPosedDeviceView *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = -[BuddyPosedDeviceView _deviceTypeForProductType:](v8, "_deviceTypeForProductType:", location[0]);
  v5 = 0;
  switch(v6)
  {
    case 1:
      objc_storeStrong(&v5, CFSTR("iPhone SE"));
      break;
    case 2:
      objc_storeStrong(&v5, CFSTR("iPhone 7"));
      break;
    case 3:
      objc_storeStrong(&v5, CFSTR("iPhone 7 Plus"));
      break;
    case 4:
      objc_storeStrong(&v5, CFSTR("iPhone 11 Pro"));
      break;
    case 5:
      objc_storeStrong(&v5, CFSTR("iPhone 11 Pro Max"));
      break;
    default:
      break;
  }
  v3 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v3;
}

- (int64_t)_deviceTypeForProductType:(id)a3
{
  id v4;
  id v5;
  int v6;
  id location[3];
  int64_t v8;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((objc_msgSend(location[0], "containsString:", CFSTR("iPhone")) & 1) == 0)
    goto LABEL_21;
  if ((objc_msgSend(location[0], "containsString:", CFSTR("iPhone8,4")) & 1) != 0
    || (objc_msgSend(location[0], "containsString:", CFSTR("iPhone6")) & 1) != 0)
  {
    v8 = 1;
    v6 = 1;
    goto LABEL_22;
  }
  if ((objc_msgSend(location[0], "containsString:", CFSTR("iPhone10,3")) & 1) != 0
    || (objc_msgSend(location[0], "containsString:", CFSTR("iPhone10,6")) & 1) != 0
    || (objc_msgSend(location[0], "containsString:", CFSTR("iPhone11,2")) & 1) != 0
    || (objc_msgSend(location[0], "containsString:", CFSTR("iPhone11,8")) & 1) != 0
    || (objc_msgSend(location[0], "containsString:", CFSTR("iPhone12,3")) & 1) != 0)
  {
    v8 = 4;
    v6 = 1;
    goto LABEL_22;
  }
  if ((objc_msgSend(location[0], "containsString:", CFSTR("iPhone11,4")) & 1) != 0
    || (objc_msgSend(location[0], "containsString:", CFSTR("iPhone11,6")) & 1) != 0
    || (objc_msgSend(location[0], "containsString:", CFSTR("iPhone12,5")) & 1) != 0)
  {
    v8 = 5;
    v6 = 1;
    goto LABEL_22;
  }
  v5 = &off_100290B60;
  v4 = &off_100290B78;
  if ((objc_msgSend(v5, "containsObject:", location[0]) & 1) != 0)
  {
    v8 = 2;
    v6 = 1;
  }
  else if ((objc_msgSend(v4, "containsObject:", location[0]) & 1) != 0)
  {
    v8 = 3;
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  if (!v6)
  {
LABEL_21:
    v8 = 4;
    v6 = 1;
  }
LABEL_22:
  objc_storeStrong(location, 0);
  return v8;
}

@end
