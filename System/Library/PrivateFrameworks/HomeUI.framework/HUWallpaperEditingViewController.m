@implementation HUWallpaperEditingViewController

- (HUWallpaperEditingViewController)initWithWallpaper:(id)a3 image:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  HUWallpaperEditingViewController *v12;
  HUWallpaperEditingViewController *v13;
  void *v14;
  uint64_t v15;
  UIImage *image;
  uint64_t v17;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HUWallpaperEditingViewController;
  v12 = -[HUWallpaperEditingViewController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v11);
    objc_storeStrong((id *)&v13->_wallpaper, a3);
    if (objc_msgSend(v9, "type") == 4)
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "scale");
      -[HUWallpaperEditingViewController _convertDefaultBlurImage:toScale:](v13, "_convertDefaultBlurImage:toScale:", v10);
      v15 = objc_claimAutoreleasedReturnValue();
      image = v13->_image;
      v13->_image = (UIImage *)v15;

    }
    else
    {
      -[HUWallpaperEditingViewController _screenScaleAdjustedImage:](v13, "_screenScaleAdjustedImage:", v10);
      v17 = objc_claimAutoreleasedReturnValue();
      v14 = v13->_image;
      v13->_image = (UIImage *)v17;
    }

  }
  return v13;
}

- (id)_screenScaleAdjustedImage:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  id v10;
  void *v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  objc_msgSend(v3, "scale");
  if (v7 == v6)
  {
    v10 = v3;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CEA638];
    v9 = objc_retainAutorelease(v3);
    objc_msgSend(v8, "imageWithCGImage:scale:orientation:", objc_msgSend(v9, "CGImage"), objc_msgSend(v9, "imageOrientation"), v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)_convertDefaultBlurImage:(id)a3 toScale:(double)a4
{
  id v5;
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
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a3;
  objc_msgSend(v5, "imageAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithTraitCollection:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "imageAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithTraitCollection:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CEA638];
  v13 = objc_retainAutorelease(v8);
  objc_msgSend(v12, "imageWithCGImage:scale:orientation:", objc_msgSend(v13, "CGImage"), objc_msgSend(v13, "imageOrientation"), a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CEA638];
  v16 = objc_retainAutorelease(v11);
  objc_msgSend(v15, "imageWithCGImage:scale:orientation:", objc_msgSend(v16, "CGImage"), objc_msgSend(v16, "imageOrientation"), a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageAsset");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerImage:withTraitCollection:", v17, v19);

  return v14;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 2;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  double v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUWallpaperEditingViewController;
  -[HUWallpaperEditingViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[HUWallpaperEditingViewController setStatusBarHidden:](self, "setStatusBarHidden:", 1);
  -[HUWallpaperEditingViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNavigationBarHidden:", 1);

  v5 = *MEMORY[0x1E0CEB9E0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__HUWallpaperEditingViewController_viewWillAppear___block_invoke;
  v6[3] = &unk_1E6F4D988;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v6, v5);
}

uint64_t __51__HUWallpaperEditingViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  double v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUWallpaperEditingViewController;
  -[HUWallpaperEditingViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  -[HUWallpaperEditingViewController setStatusBarHidden:](self, "setStatusBarHidden:", 0);
  -[HUWallpaperEditingViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNavigationBarHidden:", 0);

  v5 = *MEMORY[0x1E0CEB9E0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__HUWallpaperEditingViewController_viewWillDisappear___block_invoke;
  v6[3] = &unk_1E6F4D988;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v6, v5);
}

uint64_t __54__HUWallpaperEditingViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

- (void)viewDidLoad
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
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
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
  uint64_t v66;
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
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  objc_super v102;
  _QWORD v103[2];

  v103[1] = *MEMORY[0x1E0C80C00];
  v102.receiver = self;
  v102.super_class = (Class)HUWallpaperEditingViewController;
  -[HUWallpaperEditingViewController viewDidLoad](&v102, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0CEA970]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[HUWallpaperEditingViewController setScrollView:](self, "setScrollView:", v4);

  -[HUWallpaperEditingViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUWallpaperEditingViewController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShowsHorizontalScrollIndicator:", 0);

  -[HUWallpaperEditingViewController scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowsVerticalScrollIndicator:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  -[HUWallpaperEditingViewController scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  -[HUWallpaperEditingViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController scrollView](self, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  v13 = objc_alloc(MEMORY[0x1E0CEA658]);
  -[HUWallpaperEditingViewController image](self, "image");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithImage:", v14);
  -[HUWallpaperEditingViewController setImageView:](self, "setImageView:", v15);

  -[HUWallpaperEditingViewController wallpaper](self, "wallpaper");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = objc_msgSend(v16, "isCustomType");

  if ((v14 & 1) != 0)
  {
    -[HUWallpaperEditingViewController image](self, "image");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "size");
    v19 = v18;
    v21 = v20;
    -[HUWallpaperEditingViewController scrollView](self, "scrollView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setContentSize:", v19, v21);

  }
  else
  {
    -[HUWallpaperEditingViewController imageView](self, "imageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUWallpaperEditingViewController imageView](self, "imageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setContentMode:", 2);

    -[HUWallpaperEditingViewController scrollView](self, "scrollView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setUserInteractionEnabled:", 0);
  }

  -[HUWallpaperEditingViewController scrollView](self, "scrollView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController imageView](self, "imageView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addSubview:", v26);

  -[HUWallpaperEditingViewController scrollView](self, "scrollView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setContentInsetAdjustmentBehavior:", 2);

  v28 = -[HUWallpaperEditingViewController _createButtonViews](self, "_createButtonViews");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController scrollView](self, "scrollView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v34);

  -[HUWallpaperEditingViewController scrollView](self, "scrollView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v39);

  -[HUWallpaperEditingViewController scrollView](self, "scrollView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController view](self, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v44);

  -[HUWallpaperEditingViewController scrollView](self, "scrollView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController view](self, "view");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v49);

  -[HUWallpaperEditingViewController buttonContainerView](self, "buttonContainerView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController view](self, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v54);

  -[HUWallpaperEditingViewController buttonContainerView](self, "buttonContainerView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController view](self, "view");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "trailingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v59);

  -[HUWallpaperEditingViewController buttonContainerView](self, "buttonContainerView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "bottomAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController view](self, "view");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "bottomAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v64);

  -[HUWallpaperEditingViewController buttonContainerView](self, "buttonContainerView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "topAnchor");
  v66 = objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController view](self, "view");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "safeAreaLayoutGuide");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "bottomAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v66, "constraintEqualToAnchor:constant:", v69, -50.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v70);

  -[HUWallpaperEditingViewController wallpaper](self, "wallpaper");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v66) = objc_msgSend(v71, "isCustomType");

  if ((v66 & 1) == 0)
  {
    -[HUWallpaperEditingViewController imageView](self, "imageView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "topAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperEditingViewController view](self, "view");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "topAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v76);

    -[HUWallpaperEditingViewController imageView](self, "imageView");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "bottomAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperEditingViewController buttonContainerView](self, "buttonContainerView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "bottomAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:", v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v81);

    -[HUWallpaperEditingViewController imageView](self, "imageView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "leadingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperEditingViewController view](self, "view");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "safeAreaLayoutGuide");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "leadingAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToAnchor:", v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v87);

    -[HUWallpaperEditingViewController imageView](self, "imageView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "trailingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperEditingViewController view](self, "view");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "safeAreaLayoutGuide");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "trailingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintEqualToAnchor:", v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v93);

  }
  -[HUWallpaperEditingViewController _createButtonConstraints](self, "_createButtonConstraints");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObjectsFromArray:", v94);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v29);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setValue:forKey:", &unk_1E7043478, *MEMORY[0x1E0CD2D90]);
  objc_msgSend(v95, "setValue:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD2D70]);
  v103[0] = v95;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 1);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController setLayerFilters:](self, "setLayerFilters:", v96);

  -[HUWallpaperEditingViewController wallpaper](self, "wallpaper");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v97, "type");
  if (v98 == 6)
  {
    -[HUWallpaperEditingViewController layerFilters](self, "layerFilters");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v99 = 0;
  }
  -[HUWallpaperEditingViewController imageView](self, "imageView");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "layer");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setFilters:", v99);

  if (v98 == 6)
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUWallpaperEditingViewController;
  -[HUWallpaperEditingViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  if (!-[HUWallpaperEditingViewController scrollViewHasBeenLoaded](self, "scrollViewHasBeenLoaded"))
  {
    -[HUWallpaperEditingViewController updateScrollViewScale](self, "updateScrollViewScale");
    -[HUWallpaperEditingViewController setScrollViewHasBeenLoaded:](self, "setScrollViewHasBeenLoaded:", 1);
  }
}

- (void)buttonPressed:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[HUWallpaperEditingViewController setButton](self, "setButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[HUWallpaperEditingViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v6;
  if (v5 == v4)
  {
    v7 = objc_alloc(MEMORY[0x1E0D319F0]);
    -[HUWallpaperEditingViewController wallpaper](self, "wallpaper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "type");
    -[HUWallpaperEditingViewController wallpaper](self, "wallpaper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperEditingViewController _croppedWallpaperInfo](self, "_croppedWallpaperInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v7, "initWithType:assetIdentifier:cropInfo:", v9, v11, v12);
    -[HUWallpaperEditingViewController image](self, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "wallpaperEditing:didFinishWithWallpaper:image:", self, v13, v14);

  }
  else
  {
    objc_msgSend(v6, "wallpaperEditingDidCancel:", self);
  }

}

- (id)_croppedWallpaperInfo
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;

  -[HUWallpaperEditingViewController wallpaper](self, "wallpaper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCustomType");

  if (v4)
  {
    -[HUWallpaperEditingViewController image](self, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v7 = v6;
    -[HUWallpaperEditingViewController scrollView](self, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "zoomScale");
    v10 = v7 / v9;

    -[HUWallpaperEditingViewController scrollView](self, "scrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentOffset");
    v13 = v10 * v12;
    -[HUWallpaperEditingViewController scrollView](self, "scrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentOffset");
    v16 = v10 * v15;

    -[HUWallpaperEditingViewController scrollView](self, "scrollView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v19 = v10 * v18;
    -[HUWallpaperEditingViewController scrollView](self, "scrollView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    v22 = v10 * v21;

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31340]), "initWithSource:center:scale:", 0, round(v13 + v19 * 0.5), round(v16 + v22 * 0.5), v10);
  }
  else
  {
    v23 = 0;
  }
  return v23;
}

- (void)buttonTouchStarted:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CEABB0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__HUWallpaperEditingViewController_buttonTouchStarted___block_invoke;
  v6[3] = &unk_1E6F4D988;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "animateWithDuration:animations:", v6, 0.2);

}

uint64_t __55__HUWallpaperEditingViewController_buttonTouchStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.3);
}

- (void)buttonTouchFinished:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CEABB0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__HUWallpaperEditingViewController_buttonTouchFinished___block_invoke;
  v6[3] = &unk_1E6F4D988;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "animateWithDuration:animations:", v6, 0.2);

}

uint64_t __56__HUWallpaperEditingViewController_buttonTouchFinished___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)updateScrollViewScale
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  NSObject *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  NSObject *v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  id v102;
  uint8_t buf[4];
  double v104;
  __int16 v105;
  uint64_t v106;
  __int16 v107;
  uint64_t v108;
  __int16 v109;
  void *v110;
  uint64_t v111;
  CGPoint v112;

  v111 = *MEMORY[0x1E0C80C00];
  -[HUWallpaperEditingViewController wallpaper](self, "wallpaper");
  v102 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v102, "type") == 3)
    goto LABEL_4;
  -[HUWallpaperEditingViewController wallpaper](self, "wallpaper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 4)
  {

LABEL_4:
    return;
  }
  -[HUWallpaperEditingViewController wallpaper](self, "wallpaper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5 != 5)
  {
    objc_msgSend(MEMORY[0x1E0D319F0], "contentSizeForWallpaper");
    v7 = v6;
    v9 = v8;
    -[HUWallpaperEditingViewController image](self, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "size");
    v12 = v7 / v11;

    -[HUWallpaperEditingViewController image](self, "image");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "size");
    v15 = v9 / v14;

    if (v12 < 1.0 && v15 < 1.0)
    {
      -[HUWallpaperEditingViewController scrollView](self, "scrollView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setMaximumZoomScale:", 1.0);

      if (v12 < v15)
        v12 = v15;
      -[HUWallpaperEditingViewController scrollView](self, "scrollView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setMinimumZoomScale:", v12);
    }
    else
    {
      if (v12 < v15)
        v12 = v15;
      -[HUWallpaperEditingViewController scrollView](self, "scrollView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setMaximumZoomScale:", v12);

      -[HUWallpaperEditingViewController scrollView](self, "scrollView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "maximumZoomScale");
      v20 = v19;
      -[HUWallpaperEditingViewController scrollView](self, "scrollView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setMinimumZoomScale:", v20);

    }
    -[HUWallpaperEditingViewController scrollView](self, "scrollView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "minimumZoomScale");
    v25 = v24;
    -[HUWallpaperEditingViewController scrollView](self, "scrollView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setZoomScale:", v25);

    -[HUWallpaperEditingViewController wallpaper](self, "wallpaper");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = objc_msgSend(v27, "isCustomType");

    if ((_DWORD)v26)
    {
      -[HUWallpaperEditingViewController scrollView](self, "scrollView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "maximumZoomScale");
      objc_msgSend(v28, "setMaximumZoomScale:", v29 + 1.0);

      -[HUWallpaperEditingViewController wallpaper](self, "wallpaper");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "cropInfo");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        -[HUWallpaperEditingViewController image](self, "image");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "scale");
        v34 = v33;
        -[HUWallpaperEditingViewController wallpaper](self, "wallpaper");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "cropInfo");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "scale");
        v38 = v34 / v37;

        -[HUWallpaperEditingViewController scrollView](self, "scrollView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "minimumZoomScale");
        if (v38 >= v40)
        {
          -[HUWallpaperEditingViewController scrollView](self, "scrollView");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "maximumZoomScale");
          v45 = v44;

          if (v38 <= v45)
          {
            -[HUWallpaperEditingViewController wallpaper](self, "wallpaper");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "cropInfo");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "center");
            v66 = v65;
            -[HUWallpaperEditingViewController wallpaper](self, "wallpaper");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "cropInfo");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "scale");
            v70 = v66 / v69;
            -[HUWallpaperEditingViewController wallpaper](self, "wallpaper");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "cropInfo");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "center");
            v74 = v73;
            -[HUWallpaperEditingViewController wallpaper](self, "wallpaper");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "cropInfo");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "scale");
            v78 = v74 / v77;

            -[HUWallpaperEditingViewController scrollView](self, "scrollView");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "bounds");
            v81 = round(v70 - v80 * 0.5);

            v82 = 0.0;
            if (v81 < 0.0)
              v81 = 0.0;
            -[HUWallpaperEditingViewController scrollView](self, "scrollView");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "bounds");
            v85 = round(v78 - v84 * 0.5);

            if (v85 >= 0.0)
              v82 = v85;
            -[HUWallpaperEditingViewController scrollView](self, "scrollView");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "setZoomScale:", v38);

            -[HUWallpaperEditingViewController scrollView](self, "scrollView");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "setContentOffset:", v81, v82);

            HFLogForCategory();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
            {
              -[HUWallpaperEditingViewController scrollView](self, "scrollView");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "minimumZoomScale");
              v90 = v89;
              -[HUWallpaperEditingViewController scrollView](self, "scrollView");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "maximumZoomScale");
              v93 = v92;
              -[HUWallpaperEditingViewController scrollView](self, "scrollView");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "contentOffset");
              NSStringFromCGPoint(v112);
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218754;
              v104 = v38;
              v105 = 2048;
              v106 = v90;
              v107 = 2048;
              v108 = v93;
              v109 = 2112;
              v110 = v95;
              _os_log_debug_impl(&dword_1B8E1E000, v56, OS_LOG_TYPE_DEBUG, "Setting scale %f (min: %f, max %f), offset %@", buf, 0x2Au);

            }
            goto LABEL_27;
          }
        }
        else
        {

        }
        HFLogForCategory();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          -[HUWallpaperEditingViewController wallpaper](self, "wallpaper");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUWallpaperEditingViewController scrollView](self, "scrollView");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "minimumZoomScale");
          v99 = v98;
          -[HUWallpaperEditingViewController scrollView](self, "scrollView");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "maximumZoomScale");
          *(_DWORD *)buf = 138412802;
          v104 = *(double *)&v96;
          v105 = 2048;
          v106 = v99;
          v107 = 2048;
          v108 = v101;
          _os_log_error_impl(&dword_1B8E1E000, v46, OS_LOG_TYPE_ERROR, "Crop scale (%@) doesn't fit within scroll scales (min: %f, max: %f)", buf, 0x20u);

        }
      }
      -[HUWallpaperEditingViewController scrollView](self, "scrollView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "zoomScale");
      v49 = v48;

      -[HUWallpaperEditingViewController image](self, "image");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "size");
      v52 = v49 * v51;
      -[HUWallpaperEditingViewController image](self, "image");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "size");
      v55 = v49 * v54;

      -[HUWallpaperEditingViewController scrollView](self, "scrollView");
      v56 = objc_claimAutoreleasedReturnValue();
      -[NSObject bounds](v56, "bounds");
      v58 = round((v52 - v57) * 0.5);
      -[HUWallpaperEditingViewController scrollView](self, "scrollView");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "bounds");
      v61 = round((v55 - v60) * 0.5);
      -[HUWallpaperEditingViewController scrollView](self, "scrollView");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setContentOffset:", v58, v61);

LABEL_27:
      return;
    }
    -[HUWallpaperEditingViewController wallpaper](self, "wallpaper");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "type");

    if (!v42)
    {
      -[HUWallpaperEditingViewController scrollView](self, "scrollView");
      v102 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setBouncesZoom:", 0);
      goto LABEL_4;
    }
  }
}

- (id)_createButtonViews
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
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
  _TtC6HomeUI12HUBlurButton *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  -[HUWallpaperEditingViewController setButtonContainerView:](self, "setButtonContainerView:", v8);

  -[HUWallpaperEditingViewController buttonContainerView](self, "buttonContainerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUWallpaperEditingViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController buttonContainerView](self, "buttonContainerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v11);

  v12 = objc_alloc(MEMORY[0x1E0CEABE8]);
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithEffect:", v13);
  -[HUWallpaperEditingViewController setButtonBackgroundView:](self, "setButtonBackgroundView:", v14);

  -[HUWallpaperEditingViewController buttonBackgroundView](self, "buttonBackgroundView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUWallpaperEditingViewController buttonContainerView](self, "buttonContainerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController buttonBackgroundView](self, "buttonBackgroundView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  _HULocalizedStringWithDefaultValue(CFSTR("HUWallpaperPickerCancelButton"), CFSTR("HUWallpaperPickerCancelButton"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController transparentButtonWithTitle:](self, "transparentButtonWithTitle:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController setCancelButton:](self, "setCancelButton:", v19);

  -[HUWallpaperEditingViewController buttonContainerView](self, "buttonContainerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController cancelButton](self, "cancelButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", v21);

  _HULocalizedStringWithDefaultValue(CFSTR("HUWallpaperPickerSetButton"), CFSTR("HUWallpaperPickerSetButton"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController transparentButtonWithTitle:](self, "transparentButtonWithTitle:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController setSetButton:](self, "setSetButton:", v23);

  -[HUWallpaperEditingViewController buttonContainerView](self, "buttonContainerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController setButton](self, "setButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", v25);

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v4, v5, v6, v7);
  -[HUWallpaperEditingViewController setButtonSeparatorView:](self, "setButtonSeparatorView:", v26);

  -[HUWallpaperEditingViewController buttonSeparatorView](self, "buttonSeparatorView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "darkGrayColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController buttonSeparatorView](self, "buttonSeparatorView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setBackgroundColor:", v28);

  -[HUWallpaperEditingViewController buttonContainerView](self, "buttonContainerView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController buttonSeparatorView](self, "buttonSeparatorView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSubview:", v31);

  -[HUWallpaperEditingViewController wallpaper](self, "wallpaper");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v31) = objc_msgSend(v32, "isCustomType");

  if ((_DWORD)v31)
  {
    v33 = objc_alloc_init(_TtC6HomeUI12HUBlurButton);
    -[HUWallpaperEditingViewController setBlurButton:](self, "setBlurButton:", v33);

    -[HUWallpaperEditingViewController blurButton](self, "blurButton");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUWallpaperEditingViewController blurButton](self, "blurButton");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addTarget:action:forControlEvents:", self, sel_blurButtonPressed_, 64);

    -[HUWallpaperEditingViewController view](self, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperEditingViewController blurButton](self, "blurButton");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSubview:", v37);

    -[HUWallpaperEditingViewController _refreshBlurButton](self, "_refreshBlurButton");
    -[HUWallpaperEditingViewController blurButton](self, "blurButton");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "sizeToFit");

  }
  return -[HUWallpaperEditingViewController buttonContainerView](self, "buttonContainerView");
}

- (void)blurButtonPressed:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[HUWallpaperEditingViewController wallpaper](self, "wallpaper", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5 == 1)
    v6 = 6;
  else
    v6 = 1;
  v7 = objc_alloc(MEMORY[0x1E0D319F0]);
  -[HUWallpaperEditingViewController wallpaper](self, "wallpaper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assetIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController wallpaper](self, "wallpaper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cropInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v7, "initWithType:assetIdentifier:cropInfo:", v6, v9, v11);

  -[HUWallpaperEditingViewController setWallpaper:](self, "setWallpaper:", v15);
  if (v5 == 1)
  {
    -[HUWallpaperEditingViewController layerFilters](self, "layerFilters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  -[HUWallpaperEditingViewController imageView](self, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFilters:", v12);

  if (v5 == 1)
  -[HUWallpaperEditingViewController _refreshBlurButton](self, "_refreshBlurButton");

}

- (void)_refreshBlurButton
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  id v7;

  -[HUWallpaperEditingViewController wallpaper](self, "wallpaper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 == 6)
    v5 = CFSTR("HUWallpaperBlurOn");
  else
    v5 = CFSTR("HUWallpaperBlurOff");
  _HULocalizedStringWithDefaultValue(v5, v5, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController blurButton](self, "blurButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v7, 0);

}

- (id)_createButtonConstraints
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
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
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
  id obj;
  HUWallpaperEditingViewController *v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _QWORD v82[2];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController buttonBackgroundView](self, "buttonBackgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController buttonContainerView](self, "buttonContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  -[HUWallpaperEditingViewController buttonBackgroundView](self, "buttonBackgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController buttonContainerView](self, "buttonContainerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  -[HUWallpaperEditingViewController buttonBackgroundView](self, "buttonBackgroundView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController buttonContainerView](self, "buttonContainerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v18);

  -[HUWallpaperEditingViewController buttonBackgroundView](self, "buttonBackgroundView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController buttonContainerView](self, "buttonContainerView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v23);

  -[HUWallpaperEditingViewController buttonSeparatorView](self, "buttonSeparatorView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "centerXAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController buttonContainerView](self, "buttonContainerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "centerXAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v28);

  -[HUWallpaperEditingViewController buttonSeparatorView](self, "buttonSeparatorView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "widthAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToConstant:", 1.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v31);

  -[HUWallpaperEditingViewController buttonSeparatorView](self, "buttonSeparatorView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController buttonContainerView](self, "buttonContainerView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v36);

  -[HUWallpaperEditingViewController buttonSeparatorView](self, "buttonSeparatorView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWallpaperEditingViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "safeAreaLayoutGuide");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v42);

  v43 = (void *)MEMORY[0x1E0CB3718];
  _NSDictionaryOfVariableBindings(CFSTR("_cancelButton, _setButton"), self->_cancelButton, self->_setButton, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[_cancelButton(==_setButton)][_setButton]|"), 0, 0, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v3;
  objc_msgSend(v3, "addObjectsFromArray:", v45);

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  -[HUWallpaperEditingViewController cancelButton](self, "cancelButton");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v46;
  v76 = self;
  -[HUWallpaperEditingViewController setButton](self, "setButton");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v48;
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v79 != v51)
          objc_enumerationMutation(obj);
        v53 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
        objc_msgSend(v53, "topAnchor");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUWallpaperEditingViewController buttonContainerView](v76, "buttonContainerView");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "topAnchor");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "constraintEqualToAnchor:", v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "addObject:", v57);

        objc_msgSend(v53, "bottomAnchor");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUWallpaperEditingViewController view](v76, "view");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "safeAreaLayoutGuide");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "bottomAnchor");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "constraintEqualToAnchor:", v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "addObject:", v62);

      }
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
    }
    while (v50);
  }

  -[HUWallpaperEditingViewController blurButton](v76, "blurButton");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    -[HUWallpaperEditingViewController blurButton](v76, "blurButton");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "centerXAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperEditingViewController view](v76, "view");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "centerXAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "addObject:", v68);

    -[HUWallpaperEditingViewController blurButton](v76, "blurButton");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "bottomAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperEditingViewController buttonContainerView](v76, "buttonContainerView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "topAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:constant:", v72, -40.0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "addObject:", v73);

  }
  return v77;
}

- (id)transparentButtonWithTitle:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CEA3A0];
  v5 = a3;
  objc_msgSend(v4, "buttonWithType:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB5C0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  objc_msgSend(v6, "setTitle:forState:", v5, 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitleColor:forState:", v9, 0);

  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_buttonPressed_, 64);
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_buttonTouchStarted_, 64);
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_buttonTouchStarted_, 1);
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_buttonTouchStarted_, 16);
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_buttonTouchFinished_, 256);
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_buttonTouchFinished_, 32);
  return v6;
}

- (HUWallpaperEditingViewControllerDelegate)delegate
{
  return (HUWallpaperEditingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)statusBarHidden
{
  return self->_statusBarHidden;
}

- (void)setStatusBarHidden:(BOOL)a3
{
  self->_statusBarHidden = a3;
}

- (BOOL)scrollViewHasBeenLoaded
{
  return self->_scrollViewHasBeenLoaded;
}

- (void)setScrollViewHasBeenLoaded:(BOOL)a3
{
  self->_scrollViewHasBeenLoaded = a3;
}

- (HFWallpaper)wallpaper
{
  return self->_wallpaper;
}

- (void)setWallpaper:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaper, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIView)buttonContainerView
{
  return self->_buttonContainerView;
}

- (void)setButtonContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonContainerView, a3);
}

- (UIView)buttonSeparatorView
{
  return self->_buttonSeparatorView;
}

- (void)setButtonSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonSeparatorView, a3);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (UIButton)setButton
{
  return self->_setButton;
}

- (void)setSetButton:(id)a3
{
  objc_storeStrong((id *)&self->_setButton, a3);
}

- (UIVisualEffectView)buttonBackgroundView
{
  return self->_buttonBackgroundView;
}

- (void)setButtonBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonBackgroundView, a3);
}

- (_TtC6HomeUI12HUBlurButton)blurButton
{
  return self->_blurButton;
}

- (void)setBlurButton:(id)a3
{
  objc_storeStrong((id *)&self->_blurButton, a3);
}

- (NSArray)layerFilters
{
  return self->_layerFilters;
}

- (void)setLayerFilters:(id)a3
{
  objc_storeStrong((id *)&self->_layerFilters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerFilters, 0);
  objc_storeStrong((id *)&self->_blurButton, 0);
  objc_storeStrong((id *)&self->_buttonBackgroundView, 0);
  objc_storeStrong((id *)&self->_setButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_buttonSeparatorView, 0);
  objc_storeStrong((id *)&self->_buttonContainerView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_wallpaper, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
