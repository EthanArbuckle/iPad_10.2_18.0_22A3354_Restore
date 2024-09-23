@implementation MKDeveloperPlaceCardLoadingViewDecorator

+ (id)decorateView:(id)a3 ofType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[4];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  switch(a4)
  {
    case 0:
      +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 50.0, 12.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v6;
      +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 240.0, 16.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 12.0;
      v10 = 12.0;
      v11 = 0.0;
      v12 = -12.0;
      v13 = 4.0;
      goto LABEL_7;
    case 1:
      +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 50.0, 12.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v6;
      +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 240.0, 16.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v7;
      +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 200.0, 16.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKDeveloperPlaceCardLoadingViewDecorator configureWithViews:axis:alignment:insets:spacing:parentView:](MKDeveloperPlaceCardLoadingViewDecorator, "configureWithViews:axis:alignment:insets:spacing:parentView:", v15, 1, 1, v5, 12.0, 12.0, 12.0, -12.0, 4.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2:
      +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 32.0, 32.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v6;
      +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 200.0, 16.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 12.0;
      v10 = 12.0;
      v11 = 12.0;
      v12 = -12.0;
      v13 = 8.0;
      v16 = v8;
      v17 = 0;
      v18 = 3;
      goto LABEL_8;
    case 3:
      +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 240.0, 20.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v6;
      +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 200.0, 16.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 20.0;
      v10 = 16.0;
      v11 = 12.0;
      v12 = 0.0;
      v13 = 8.0;
LABEL_7:
      v16 = v8;
      v17 = 1;
      v18 = 1;
LABEL_8:
      +[MKDeveloperPlaceCardLoadingViewDecorator configureWithViews:axis:alignment:insets:spacing:parentView:](MKDeveloperPlaceCardLoadingViewDecorator, "configureWithViews:axis:alignment:insets:spacing:parentView:", v16, v17, v18, v5, v9, v10, v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 4:
      +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 180.0, 16.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 200.0, 16.0, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v7;
      +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 200.0, 16.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2] = v8;
      +[MKDeveloperPlaceCardLoadingViewDecorator viewWithSize:](MKDeveloperPlaceCardLoadingViewDecorator, "viewWithSize:", 140.0, 16.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21[3] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKDeveloperPlaceCardLoadingViewDecorator configureWithViews:axis:alignment:insets:spacing:parentView:](MKDeveloperPlaceCardLoadingViewDecorator, "configureWithViews:axis:alignment:insets:spacing:parentView:", v19, 1, 1, v5, 12.0, 12.0, 12.0, -12.0, 4.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
LABEL_11:

      break;
    default:
      v14 = 0;
      break;
  }

  return v14;
}

+ (id)viewWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  height = a3.height;
  width = a3.width;
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemFillColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(v5, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", height * 0.5);

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "widthAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToConstant:", width);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  objc_msgSend(v5, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToConstant:", height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  return v5;
}

+ (id)configureWithViews:(id)a3 axis:(int64_t)a4 alignment:(int64_t)a5 insets:(UIEdgeInsets)a6 spacing:(double)a7 parentView:(id)a8
{
  double right;
  double bottom;
  double left;
  double top;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  _BYTE v44[128];
  uint64_t v45;

  right = a6.right;
  bottom = a6.bottom;
  left = a6.left;
  top = a6.top;
  v45 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a8;
  v18 = objc_alloc_init(MEMORY[0x1E0CEA9E0]);
  objc_msgSend(v18, "setAxis:", a4);
  objc_msgSend(v18, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v18, "setLayoutMargins:", top, left, bottom, right);
  objc_msgSend(v18, "setAlignment:", a5);
  objc_msgSend(v18, "setSpacing:", a7);
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v19 = v16;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v40;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v40 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(v18, "addArrangedSubview:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v23++));
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v21);
  }

  if (v17)
  {
    objc_msgSend(v17, "addSubview:", v18);
    v33 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v18, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v36;
    objc_msgSend(v18, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintLessThanOrEqualToAnchor:", v34);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v32;
    objc_msgSend(v18, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v26;
    objc_msgSend(v18, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintLessThanOrEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "activateConstraints:", v30);

  }
  return v18;
}

@end
