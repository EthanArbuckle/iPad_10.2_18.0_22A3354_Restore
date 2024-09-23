@implementation AVTPoseSelectionViewController

+ (CGRect)borderMaskRectForContentRect:(CGRect)a3
{
  return CGRectInset(a3, 1.0, 1.0);
}

+ (id)poseConfigurationsForTypes:(unint64_t)a3 avatarRecord:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 != 1)
  {
    v8 = (_QWORD *)MEMORY[0x1E0D006C8];
    if (a3 != 2)
      goto LABEL_5;
    objc_msgSend(v6, "addObject:", *MEMORY[0x1E0D006C8]);
  }
  v8 = (_QWORD *)MEMORY[0x1E0D006B0];
LABEL_5:
  objc_msgSend(v6, "addObject:", *v8);
  if (AVTUIShowPrereleaseStickerPack_once())
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v33 != v13)
            objc_enumerationMutation(v10);
          AVTPrereleaseStickerPackForStickerPack();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v12);
    }

  }
  else
  {
    v9 = v6;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v16 = v9;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
        v22 = objc_msgSend(v5, "isEditable", (_QWORD)v28);
        v23 = (void *)MEMORY[0x1E0D00690];
        if (v22)
        {
          objc_msgSend(MEMORY[0x1E0D00690], "stickerConfigurationsForMemojiInStickerPack:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObjectsFromArray:", v24);
        }
        else
        {
          objc_msgSend(v5, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stickerConfigurationsForAnimojiNamed:inStickerPack:", v24, v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObjectsFromArray:", v25);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v18);
  }

  v26 = (void *)objc_msgSend(v7, "copy");
  return v26;
}

- (AVTPoseSelectionViewController)initWithSelectedRecord:(id)a3
{
  return -[AVTPoseSelectionViewController initWithSelectedRecord:poseTypes:](self, "initWithSelectedRecord:poseTypes:", a3, 0);
}

- (AVTPoseSelectionViewController)initWithSelectedRecord:(id)a3 poseTypes:(unint64_t)a4
{
  id v6;
  void *v7;
  AVTPoseSelectionViewController *v8;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "poseConfigurationsForTypes:avatarRecord:", a4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AVTPoseSelectionViewController initWithSelectedRecord:poseConfigurations:](self, "initWithSelectedRecord:poseConfigurations:", v6, v7);

  return v8;
}

- (AVTPoseSelectionViewController)initWithSelectedRecord:(id)a3 poseConfigurations:(id)a4
{
  id v7;
  id v8;
  AVTPoseSelectionViewController *v9;
  AVTPoseSelectionViewController *v10;
  UIMenu *headerMenu;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AVTPoseSelectionViewController;
  v9 = -[AVTPoseSelectionViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_avatarRecord, a3);
    objc_storeStrong((id *)&v10->_stickerConfigurations, a4);
    headerMenu = v10->_headerMenu;
    v10->_headerMenu = 0;

  }
  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  AVTAnimojiPoseSelectionHeaderViewController *v8;
  void *v9;
  AVTAnimojiPoseSelectionHeaderViewController *v10;
  AVTAnimojiPoseSelectionHeaderViewController *headerViewController;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  AVTPoseSelectionGridViewController *v16;
  void *v17;
  void *v18;
  AVTPoseSelectionGridViewController *v19;
  AVTPoseSelectionGridViewController *gridViewController;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  UIView *v25;
  UIView *headerDropShadowView;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  id v35;
  void *v36;
  void *v37;
  UIView *v38;
  UIView *borderMaskView;
  void *v40;
  UIView *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  UIBarButtonItem *v48;
  UIBarButtonItem *doneButton;
  UIBarButtonItem *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  int IsGreenTea;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _BOOL4 v73;
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
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  objc_super v117;
  _QWORD v118[14];

  v118[12] = *MEMORY[0x1E0C80C00];
  v117.receiver = self;
  v117.super_class = (Class)AVTPoseSelectionViewController;
  -[AVTPoseSelectionViewController viewDidLoad](&v117, sel_viewDidLoad);
  -[AVTPoseSelectionViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setBackgroundHidden:", 1);

  -[AVTPoseSelectionViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTranslucent");

  if ((v6 & 1) == 0)
    -[AVTPoseSelectionViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 1);
  -[AVTPoseSelectionViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLargeTitleDisplayMode:", 2);

  v8 = [AVTAnimojiPoseSelectionHeaderViewController alloc];
  -[AVTPoseSelectionViewController avatarRecord](self, "avatarRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AVTAnimojiPoseSelectionHeaderViewController initWithRecord:](v8, "initWithRecord:", v9);
  headerViewController = self->_headerViewController;
  self->_headerViewController = v10;

  -[AVTAnimojiPoseSelectionHeaderViewController view](self->_headerViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AVTPoseSelectionViewController addChildViewController:](self, "addChildViewController:", self->_headerViewController);
  -[AVTPoseSelectionViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAnimojiPoseSelectionHeaderViewController view](self->_headerViewController, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v14);

  -[AVTAnimojiPoseSelectionHeaderViewController didMoveToParentViewController:](self->_headerViewController, "didMoveToParentViewController:", self);
  v15 = -[AVTPoseSelectionViewController allowsCameraCapture](self, "allowsCameraCapture");
  v16 = [AVTPoseSelectionGridViewController alloc];
  -[AVTPoseSelectionViewController avatarRecord](self, "avatarRecord");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseSelectionViewController stickerConfigurations](self, "stickerConfigurations");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v15;
  v19 = -[AVTPoseSelectionGridViewController initWithAvatarRecord:poseConfigurations:allowsCameraCapture:](v16, "initWithAvatarRecord:poseConfigurations:allowsCameraCapture:", v17, v18, v15);
  gridViewController = self->_gridViewController;
  self->_gridViewController = v19;

  -[AVTPoseSelectionGridViewController setDelegate:](self->_gridViewController, "setDelegate:", self);
  -[AVTPoseSelectionGridViewController view](self->_gridViewController, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AVTPoseSelectionViewController addChildViewController:](self, "addChildViewController:", self->_gridViewController);
  -[AVTPoseSelectionViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseSelectionGridViewController view](self->_gridViewController, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", v23);

  -[AVTPoseSelectionGridViewController didMoveToParentViewController:](self->_gridViewController, "didMoveToParentViewController:", self);
  v24 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v25 = (UIView *)objc_msgSend(v24, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  headerDropShadowView = self->_headerDropShadowView;
  self->_headerDropShadowView = v25;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_headerDropShadowView, "setBackgroundColor:", v27);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerDropShadowView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AVTPoseSelectionViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSubview:", self->_headerDropShadowView);

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "scale");
  v31 = v30;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "nativeScale");
  v34 = v33;

  if (v31 != v34)
  {
    v35 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v36 = (void *)objc_opt_class();
    -[AVTPoseSelectionViewController view](self, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bounds");
    objc_msgSend(v36, "borderMaskRectForContentRect:");
    v38 = (UIView *)objc_msgSend(v35, "initWithFrame:");
    borderMaskView = self->_borderMaskView;
    self->_borderMaskView = v38;

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_borderMaskView, "setBackgroundColor:", v40);

    v41 = self->_borderMaskView;
    -[AVTAnimojiPoseSelectionHeaderViewController view](self->_headerViewController, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setMaskView:", v41);

  }
  v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_didTapCancel_);
  -[AVTPoseSelectionViewController navigationItem](self, "navigationItem");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = (void *)v43;
  objc_msgSend(v44, "setLeftBarButtonItem:", v43);

  v45 = objc_alloc(MEMORY[0x1E0CEA380]);
  AVTAvatarUIBundle();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("NEXT"), &stru_1EA5207B8, CFSTR("Localized"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (UIBarButtonItem *)objc_msgSend(v45, "initWithTitle:style:target:action:", v47, 2, self, sel_didTapDone_);
  doneButton = self->_doneButton;
  self->_doneButton = v48;

  v50 = self->_doneButton;
  -[AVTPoseSelectionViewController navigationItem](self, "navigationItem");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setRightBarButtonItem:", v50);

  -[AVTPoseSelectionViewController view](self, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "window");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "screen");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "scale");
  v56 = v55;

  if (v56 <= 0.0)
    v57 = 1.0;
  else
    v57 = 1.0 / v56;
  -[AVTPoseSelectionViewController updateHeaderHeightConstraint](self, "updateHeaderHeightConstraint");
  -[AVTAnimojiPoseSelectionHeaderViewController view](self->_headerViewController, "view");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "topAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseSelectionViewController view](self, "view");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "topAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "constraintEqualToAnchor:", v112);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v118[0] = v111;
  -[AVTAnimojiPoseSelectionHeaderViewController view](self->_headerViewController, "view");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "leadingAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseSelectionViewController view](self, "view");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "leadingAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "constraintEqualToAnchor:", v107);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v118[1] = v106;
  -[AVTAnimojiPoseSelectionHeaderViewController view](self->_headerViewController, "view");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "trailingAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseSelectionViewController view](self, "view");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "trailingAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "constraintEqualToAnchor:", v102);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v118[2] = v101;
  -[AVTPoseSelectionViewController headerHeightConstraint](self, "headerHeightConstraint");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v118[3] = v100;
  -[UIView leadingAnchor](self->_headerDropShadowView, "leadingAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseSelectionViewController view](self, "view");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "leadingAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "constraintEqualToAnchor:", v97);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v118[4] = v96;
  -[UIView trailingAnchor](self->_headerDropShadowView, "trailingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseSelectionViewController view](self, "view");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "trailingAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToAnchor:", v93);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v118[5] = v92;
  -[UIView topAnchor](self->_headerDropShadowView, "topAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAnimojiPoseSelectionHeaderViewController view](self->_headerViewController, "view");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "bottomAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintEqualToAnchor:", v89);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v118[6] = v88;
  -[UIView heightAnchor](self->_headerDropShadowView, "heightAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToConstant:", v57);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v118[7] = v86;
  -[AVTPoseSelectionGridViewController view](self->_gridViewController, "view");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "topAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAnimojiPoseSelectionHeaderViewController view](self->_headerViewController, "view");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "bottomAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:", v82);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v118[8] = v81;
  -[AVTPoseSelectionGridViewController view](self->_gridViewController, "view");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "leadingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseSelectionViewController view](self, "view");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "leadingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToAnchor:", v77);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v118[9] = v76;
  -[AVTPoseSelectionGridViewController view](self->_gridViewController, "view");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "trailingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseSelectionViewController view](self, "view");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "trailingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v118[10] = v60;
  -[AVTPoseSelectionGridViewController view](self->_gridViewController, "view");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "bottomAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseSelectionViewController view](self, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bottomAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v118[11] = v65;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 12);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v66);
  if ((AVTUIForceCameraDisclosures_once() & 1) != 0 || (IsGreenTea = AVTDeviceIsGreenTea(), !v73) || IsGreenTea)
  {
    -[AVTPoseSelectionViewController setMode:](self, "setMode:", 0);
    -[AVTPoseSelectionViewController stickerConfigurations](self, "stickerConfigurations");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "objectAtIndexedSubscript:", 0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionViewController gridViewController](self, "gridViewController");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setSelectedStickerConfiguration:", v69);

    -[AVTPoseSelectionViewController stickerConfigurations](self, "stickerConfigurations");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "objectAtIndexedSubscript:", 0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionViewController updateForPoseConfiguration:animated:](self, "updateForPoseConfiguration:animated:", v72, 0);

  }
  else
  {
    -[AVTPoseSelectionViewController setMode:](self, "setMode:", 1);
    -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", 0);
  }

}

- (void)setNewAvatarRecord:(id)a3
{
  AVTAvatarRecord *v5;
  AVTAvatarRecord *v6;
  _QWORD v7[4];
  AVTAvatarRecord *v8;
  id v9;
  id location;

  v5 = (AVTAvatarRecord *)a3;
  if (self->_avatarRecord != v5)
  {
    objc_storeStrong((id *)&self->_avatarRecord, a3);
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__AVTPoseSelectionViewController_setNewAvatarRecord___block_invoke;
    v7[3] = &unk_1EA51D160;
    objc_copyWeak(&v9, &location);
    v6 = v5;
    v8 = v6;
    -[AVTPoseSelectionViewController didFinishMenuPresentationWithCompletion:](self, "didFinishMenuPresentationWithCompletion:", v7);
    if (self->_menuButton)
      -[AVTCircularButton setHidden:](self->_menuButton, "setHidden:", -[AVTAvatarRecord isEditable](v6, "isEditable") ^ 1);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __53__AVTPoseSelectionViewController_setNewAvatarRecord___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend((id)objc_opt_class(), "poseConfigurationsForTypes:avatarRecord:", 0, *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setStickerConfigurations:", v2);

  objc_msgSend(WeakRetained, "gridViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "stickerConfigurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateWithAvatarRecord:stickerConfigurations:", v4, v5);

  v6 = objc_msgSend(WeakRetained, "mode");
  objc_msgSend(WeakRetained, "headerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateForAvatarRecord:discardPose:", *(_QWORD *)(a1 + 32), v6 == 0);

  v8 = WeakRetained;
  if (!v6)
  {
    objc_msgSend(WeakRetained, "doneButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnabled:", 0);

    if (objc_msgSend(WeakRetained, "allowsCameraCapture") && (AVTDeviceIsGreenTea() & 1) == 0)
    {
      objc_msgSend(WeakRetained, "setMode:", 1);
      objc_msgSend(WeakRetained, "gridViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSelectedStickerConfiguration:", 0);
    }
    else
    {
      objc_msgSend(WeakRetained, "stickerConfigurations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "headerViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "updateForStickerConfiguration:animated:", v11, 0);

      objc_msgSend(WeakRetained, "gridViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSelectedStickerConfiguration:", v11);

      objc_msgSend(WeakRetained, "notifyDelegateOfSelectedPose");
    }

    v8 = WeakRetained;
  }

}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0CEB740], 0, sel_didTapCancel_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_nonRepeatableKeyCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CEA6B8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\r"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyCommandWithInput:modifierFlags:action:", v6, 0, sel_returnPressed_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_nonRepeatableKeyCommand");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v8);

  return v2;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)AVTPoseSelectionViewController;
  v7 = a4;
  -[AVTPoseSelectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__AVTPoseSelectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1EA51D1B0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

uint64_t __85__AVTPoseSelectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateHeaderHeightConstraint");
}

- (void)updateHeaderHeightConstraint
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[AVTPoseSelectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[AVTPoseSelectionViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;

  v9 = 336.0;
  if (v5 > v8)
    v9 = 162.666667;
  v10 = fmax(v9, 272.0);
  -[AVTPoseSelectionViewController headerHeightConstraint](self, "headerHeightConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[AVTPoseSelectionViewController headerHeightConstraint](self, "headerHeightConstraint");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setConstant:", v10);
  }
  else
  {
    -[AVTAnimojiPoseSelectionHeaderViewController view](self->_headerViewController, "view");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "heightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToConstant:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionViewController setHeaderHeightConstraint:](self, "setHeaderHeightConstraint:", v13);

  }
}

- (void)setMode:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  if (self->_mode != a3)
  {
    self->_mode = a3;
    if (a3 != 2)
    {
      if (a3 == 1)
      {
        objc_initWeak(&location, self);
        -[AVTPoseSelectionViewController headerViewController](self, "headerViewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = MEMORY[0x1E0C809B0];
        v9 = 3221225472;
        v10 = __42__AVTPoseSelectionViewController_setMode___block_invoke;
        v11 = &unk_1EA51D7E8;
        objc_copyWeak(&v12, &location);
        objc_msgSend(v7, "beginFaceTrackingWithCompletionBlock:", &v8);

        objc_destroyWeak(&v12);
        objc_destroyWeak(&location);
      }
      else if (!a3)
      {
        -[AVTPoseSelectionViewController discardButton](self, "discardButton");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setHidden:", 1);

        -[AVTPoseSelectionViewController captureButton](self, "captureButton");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setHidden:", 1);
LABEL_8:

      }
      -[AVTPoseSelectionViewController notifyDelegateOfModeChange:](self, "notifyDelegateOfModeChange:", a3, v8, v9, v10, v11);
      return;
    }
    -[AVTPoseSelectionViewController createCaptureButtonIfNeeded](self, "createCaptureButtonIfNeeded");
    -[AVTPoseSelectionViewController createDiscardButtonIfNeeded](self, "createDiscardButtonIfNeeded");
    -[AVTPoseSelectionViewController configureButtonsForReview](self, "configureButtonsForReview");
    -[AVTPoseSelectionViewController headerViewController](self, "headerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pauseFaceTracking");
    goto LABEL_8;
  }
}

void __42__AVTPoseSelectionViewController_setMode___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "mode") == 1)
  {
    objc_msgSend(WeakRetained, "createCaptureButtonIfNeeded");
    objc_msgSend(WeakRetained, "configureButtonsForCapture");
  }

}

- (void)configureButtonsForReview
{
  void *v3;
  _QWORD v4[5];
  CGAffineTransform v5;
  CGAffineTransform v6;

  CGAffineTransformMakeScale(&v6, 0.75, 0.75);
  -[AVTPoseSelectionViewController discardButton](self, "discardButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  objc_msgSend(v3, "setTransform:", &v5);

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__AVTPoseSelectionViewController_configureButtonsForReview__block_invoke;
  v4[3] = &unk_1EA51D188;
  v4[4] = self;
  -[AVTPoseSelectionViewController animateButtonConfiguration:](self, "animateButtonConfiguration:", v4);
}

void __59__AVTPoseSelectionViewController_configureButtonsForReview__block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  void *v5;
  void *v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  _OWORD v9[3];

  objc_msgSend(*(id *)(a1 + 32), "discardButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v9[0] = *MEMORY[0x1E0C9BAA8];
  v9[1] = v3;
  v9[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v9);

  CGAffineTransformMakeScale(&v8, 0.5, 0.5);
  objc_msgSend(*(id *)(a1 + 32), "captureButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;
  objc_msgSend(v4, "setTransform:", &v7);

  objc_msgSend(*(id *)(a1 + 32), "captureButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "discardButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 0);

}

- (void)configureButtonsForCapture
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  CGAffineTransform v6;
  CGAffineTransform v7;

  CGAffineTransformMakeScale(&v7, 0.5, 0.5);
  -[AVTPoseSelectionViewController captureButton](self, "captureButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  objc_msgSend(v3, "setTransform:", &v6);

  -[AVTPoseSelectionViewController captureButton](self, "captureButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__AVTPoseSelectionViewController_configureButtonsForCapture__block_invoke;
  v5[3] = &unk_1EA51D188;
  v5[4] = self;
  -[AVTPoseSelectionViewController animateButtonConfiguration:](self, "animateButtonConfiguration:", v5);
}

void __60__AVTPoseSelectionViewController_configureButtonsForCapture__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  void *v5;
  _OWORD v6[3];
  CGAffineTransform v7;
  CGAffineTransform v8;

  CGAffineTransformMakeScale(&v8, 0.5, 0.5);
  objc_msgSend(*(id *)(a1 + 32), "discardButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;
  objc_msgSend(v2, "setTransform:", &v7);

  objc_msgSend(*(id *)(a1 + 32), "captureButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v6[0] = *MEMORY[0x1E0C9BAA8];
  v6[1] = v4;
  v6[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v3, "setTransform:", v6);

  objc_msgSend(*(id *)(a1 + 32), "discardButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

}

- (void)animateButtonConfiguration:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0CEA9D8];
  v4 = a3;
  v6 = (id)objc_msgSend([v3 alloc], "initWithMass:stiffness:damping:initialVelocity:", 1.0, 325.0, 32.0, 0.0, 0.0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABC8]), "initWithDuration:timingParameters:", v6, 0.4);
  objc_msgSend(v5, "addAnimations:", v4);

  objc_msgSend(v5, "startAnimation");
}

- (void)createCaptureButtonIfNeeded
{
  void *v3;
  AVTRecordingButton *v4;
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
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  -[AVTPoseSelectionViewController captureButton](self, "captureButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(AVTRecordingButton);
    -[AVTPoseSelectionViewController setCaptureButton:](self, "setCaptureButton:", v4);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionViewController captureButton](self, "captureButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCenterCircleColor:", v5);

    -[AVTPoseSelectionViewController captureButton](self, "captureButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIgnoresLongPress:", 1);

    -[AVTPoseSelectionViewController captureButton](self, "captureButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel_didTapCaptureButton_, 64);

    -[AVTPoseSelectionViewController captureButton](self, "captureButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[AVTPoseSelectionViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionViewController captureButton](self, "captureButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v11);

    -[AVTPoseSelectionViewController captureButton](self, "captureButton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionViewController captureButtonEdgeLength](self, "captureButtonEdgeLength");
    objc_msgSend(v30, "constraintEqualToConstant:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v29;
    -[AVTPoseSelectionViewController captureButton](self, "captureButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "heightAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionViewController captureButton](self, "captureButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "widthAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v24;
    -[AVTPoseSelectionViewController captureButton](self, "captureButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionViewController headerViewController](self, "headerViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v14, -20.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v15;
    -[AVTPoseSelectionViewController captureButton](self, "captureButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, -20.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v21);
  }
}

- (void)createDiscardButtonIfNeeded
{
  void *v3;
  AVTCircularButton *v4;
  AVTCircularButton *v5;
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
  void *v39;
  id v40;

  -[AVTPoseSelectionViewController discardButton](self, "discardButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [AVTCircularButton alloc];
    v5 = -[AVTCircularButton initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[AVTPoseSelectionViewController setDiscardButton:](self, "setDiscardButton:", v5);

    -[AVTPoseSelectionViewController discardButton](self, "discardButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_didTapDiscardButton_, 64);

    -[AVTPoseSelectionViewController discardButton](self, "discardButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v8 = (void *)MEMORY[0x1E0CEA650];
    -[AVTPoseSelectionViewController discardButtonSymbolWeight](self, "discardButtonSymbolWeight");
    objc_msgSend(v8, "configurationWithPointSize:weight:", 5);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    if (self->_usesSingleButtonCaptureReview)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTPoseSelectionViewController discardButton](self, "discardButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTintColor:", v9);

      -[AVTPoseSelectionViewController discardButton](self, "discardButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSymbolImageWithName:configuration:", CFSTR("gobackward"), v40);

      -[AVTPoseSelectionViewController discardButton](self, "discardButton");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSymbolTintColor:", v13);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTPoseSelectionViewController discardButton](self, "discardButton");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTintColor:", v14);

      -[AVTPoseSelectionViewController discardButton](self, "discardButton");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSymbolImageWithName:configuration:", CFSTR("trash.fill"), v40);
    }

    -[AVTPoseSelectionViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionViewController discardButton](self, "discardButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v17);

    v38 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[AVTPoseSelectionViewController discardButton](self, "discardButton");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "widthAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionViewController discardButtonEdgeLength](self, "discardButtonEdgeLength");
    objc_msgSend(v36, "constraintEqualToConstant:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionViewController discardButton](self, "discardButton");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "heightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionViewController discardButton](self, "discardButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "widthAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionViewController discardButton](self, "discardButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionViewController captureButton](self, "captureButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "centerYAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v38, "initWithObjects:", v18, v21, v26, 0);

    if (self->_usesSingleButtonCaptureReview || self->_headerMenu)
    {
      -[AVTPoseSelectionViewController discardButton](self, "discardButton");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "centerXAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTPoseSelectionViewController captureButton](self, "captureButton");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "centerXAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v39;
      objc_msgSend(v39, "addObject:", v31);
    }
    else
    {
      -[AVTPoseSelectionViewController discardButton](self, "discardButton");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "leadingAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTPoseSelectionViewController headerViewController](self, "headerViewController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "leadingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:constant:", v31, 20.0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addObject:", v33);

      v32 = v39;
    }

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v32);
  }
}

- (void)createMenuButtonIfNeeded
{
  AVTCircularButton *v3;
  AVTCircularButton *v4;
  AVTCircularButton *menuButton;
  void *v6;
  void *v7;
  AVTCircularButton *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  AVTTouchDownGestureRecognizer *v24;
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
  _QWORD v38[6];

  v38[4] = *MEMORY[0x1E0C80C00];
  if (!self->_menuButton)
  {
    v3 = [AVTCircularButton alloc];
    v4 = -[AVTCircularButton initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    menuButton = self->_menuButton;
    self->_menuButton = v4;

    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemFillColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCircularButton setTintColor:](self->_menuButton, "setTintColor:", v6);

    -[AVTCircularButton setShowsMenuAsPrimaryAction:](self->_menuButton, "setShowsMenuAsPrimaryAction:", 1);
    v7 = (void *)MEMORY[0x1E0CEA650];
    -[AVTPoseSelectionViewController buttonSymbolWeight](self, "buttonSymbolWeight");
    objc_msgSend(v7, "configurationWithPointSize:weight:", 5);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCircularButton setSymbolImageWithName:configuration:](self->_menuButton, "setSymbolImageWithName:configuration:", CFSTR("ellipsis"), v37);
    v8 = self->_menuButton;
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCircularButton setSymbolTintColor:](v8, "setSymbolTintColor:", v9);

    -[AVTCircularButton setTranslatesAutoresizingMaskIntoConstraints:](self->_menuButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AVTPoseSelectionViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionViewController menuButton](self, "menuButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v11);

    -[AVTPoseSelectionViewController buttonEdgeLength](self, "buttonEdgeLength");
    v13 = v12;
    -[AVTPoseSelectionViewController captureButtonEdgeLength](self, "captureButtonEdgeLength");
    v15 = (v14 - v13) * 0.5 + 20.0;
    -[AVTPoseSelectionViewController menuButton](self, "menuButton");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "widthAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToConstant:", v13);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v34;
    -[AVTPoseSelectionViewController menuButton](self, "menuButton");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "heightAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionViewController menuButton](self, "menuButton");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v29;
    -[AVTPoseSelectionViewController menuButton](self, "menuButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionViewController headerViewController](self, "headerViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v17, -v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v18;
    -[AVTPoseSelectionViewController menuButton](self, "menuButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, 20.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v25);
    v24 = -[AVTTouchDownGestureRecognizer initWithTarget:action:]([AVTTouchDownGestureRecognizer alloc], "initWithTarget:action:", self, sel_prepareForMenuPresentation);
    -[AVTCircularButton addGestureRecognizer:](self->_menuButton, "addGestureRecognizer:", v24);

  }
}

- (double)buttonSymbolWeight
{
  int IsMacOrIPad;
  double result;

  IsMacOrIPad = AVTDeviceIsMacOrIPad();
  result = 18.0;
  if (IsMacOrIPad)
    return 31.0;
  return result;
}

- (double)discardButtonSymbolWeight
{
  int IsMacOrIPad;
  double result;

  if (self->_usesSingleButtonCaptureReview)
  {
    IsMacOrIPad = AVTDeviceIsMacOrIPad();
    result = 32.0;
    if (IsMacOrIPad)
      return 56.0;
  }
  else
  {
    -[AVTPoseSelectionViewController buttonSymbolWeight](self, "buttonSymbolWeight");
  }
  return result;
}

- (double)buttonEdgeLength
{
  int IsMacOrIPad;
  double result;

  IsMacOrIPad = AVTDeviceIsMacOrIPad();
  result = 32.0;
  if (IsMacOrIPad)
    return 56.0;
  return result;
}

- (double)discardButtonEdgeLength
{
  double result;

  if (self->_usesSingleButtonCaptureReview)
    -[AVTPoseSelectionViewController captureButtonEdgeLength](self, "captureButtonEdgeLength");
  else
    -[AVTPoseSelectionViewController buttonEdgeLength](self, "buttonEdgeLength");
  return result;
}

- (double)captureButtonEdgeLength
{
  int IsMacOrIPad;
  double result;

  IsMacOrIPad = AVTDeviceIsMacOrIPad();
  result = 52.0;
  if (IsMacOrIPad)
    return 72.0;
  return result;
}

- (void)setHeaderMenu:(id)a3
{
  UIMenu *v5;
  UIMenu *v6;

  v5 = (UIMenu *)a3;
  if (self->_headerMenu != v5)
  {
    v6 = v5;
    if (v5)
    {
      -[AVTPoseSelectionViewController createMenuButtonIfNeeded](self, "createMenuButtonIfNeeded");
      objc_storeStrong((id *)&self->_headerMenu, a3);
      -[AVTCircularButton setMenu:](self->_menuButton, "setMenu:", self->_headerMenu);
      -[AVTCircularButton setHidden:](self->_menuButton, "setHidden:", -[AVTAvatarRecord isEditable](self->_avatarRecord, "isEditable") ^ 1);
    }
    else
    {
      -[AVTPoseSelectionViewController clearHeaderMenu](self, "clearHeaderMenu");
    }
    v5 = v6;
  }

}

- (void)clearHeaderMenu
{
  AVTCircularButton *menuButton;
  AVTCircularButton *v4;
  UIMenu *headerMenu;

  menuButton = self->_menuButton;
  if (menuButton)
  {
    -[AVTCircularButton removeFromSuperview](menuButton, "removeFromSuperview");
    v4 = self->_menuButton;
    self->_menuButton = 0;

  }
  headerMenu = self->_headerMenu;
  self->_headerMenu = 0;

}

- (void)prepareForMenuPresentation
{
  AVTAnimojiPoseSelectionHeaderViewController *headerViewController;
  id v3;

  headerViewController = self->_headerViewController;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAnimojiPoseSelectionHeaderViewController setCaptureBackgroundColor:](headerViewController, "setCaptureBackgroundColor:", v3);

}

- (void)didFinishMenuPresentationWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__AVTPoseSelectionViewController_didFinishMenuPresentationWithCompletion___block_invoke;
  block[3] = &unk_1EA51D838;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __74__AVTPoseSelectionViewController_didFinishMenuPresentationWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  dispatch_time_t v4;
  _QWORD block[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "headerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCaptureBackgroundColor:", 0);

  if (*(_QWORD *)(a1 + 32))
  {
    v4 = dispatch_time(0, 10000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__AVTPoseSelectionViewController_didFinishMenuPresentationWithCompletion___block_invoke_2;
    block[3] = &unk_1EA51D810;
    v6 = *(id *)(a1 + 32);
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __74__AVTPoseSelectionViewController_didFinishMenuPresentationWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)didTapCaptureButton:(id)a3
{
  -[AVTPoseSelectionViewController setMode:](self, "setMode:", 2);
  -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", 1);
}

- (void)didTapDiscardButton:(id)a3
{
  -[AVTPoseSelectionViewController setMode:](self, "setMode:", 1);
  -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", 0);
}

- (void)didTapCancel:(id)a3
{
  id v4;

  -[AVTPoseSelectionViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "poseSelectionControllerDidCancel:", self);

}

- (void)returnPressed:(id)a3
{
  id v4;

  v4 = a3;
  if (-[UIBarButtonItem isEnabled](self->_doneButton, "isEnabled"))
    -[AVTPoseSelectionViewController didTapDone:](self, "didTapDone:", v4);

}

- (void)notifyDelegateOfSelectedPose
{
  void *v3;
  id v4;

  -[AVTPoseSelectionViewController selectedPoseConfiguration](self, "selectedPoseConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTPoseSelectionViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "poseSelectionController:didSelectPoseWithConfiguration:", self, v4);

}

- (id)selectedPoseConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  -[AVTPoseSelectionViewController gridViewController](self, "gridViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedStickerConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[AVTPoseSelectionViewController headerViewController](self, "headerViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "newStickerConfigurationFromCurrentPose");

  }
  return v4;
}

- (void)notifyDelegateOfModeChange:(unint64_t)a3
{
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[AVTPoseSelectionViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (a3 == 1)
    {
      v7 = 0;
    }
    else
    {
      -[AVTPoseSelectionViewController selectedPoseConfiguration](self, "selectedPoseConfiguration");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (id)v7;
    -[AVTPoseSelectionViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "poseSelectionController:didSetMode:withConfiguration:", self, a3, v9);

  }
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTPoseSelectionViewController;
  -[AVTPoseSelectionViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[AVTPoseSelectionViewController updateHeaderHeightConstraint](self, "updateHeaderHeightConstraint");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTPoseSelectionViewController;
  -[AVTPoseSelectionViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[AVTPoseSelectionViewController headerViewController](self, "headerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endFaceTracking");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTPoseSelectionViewController;
  -[AVTPoseSelectionViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  if (-[AVTPoseSelectionViewController mode](self, "mode") == 1)
  {
    -[AVTPoseSelectionViewController headerViewController](self, "headerViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginFaceTrackingWithCompletionBlock:", 0);

  }
}

- (void)updateForPoseConfiguration:(id)a3 animated:(BOOL)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  BOOL v14;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __70__AVTPoseSelectionViewController_updateForPoseConfiguration_animated___block_invoke;
  v11 = &unk_1EA51D860;
  objc_copyWeak(&v13, &location);
  v7 = v6;
  v12 = v7;
  v14 = a4;
  -[AVTPoseSelectionViewController didFinishMenuPresentationWithCompletion:](self, "didFinishMenuPresentationWithCompletion:", &v8);
  -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", 1, v8, v9, v10, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __70__AVTPoseSelectionViewController_updateForPoseConfiguration_animated___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "headerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateForStickerConfiguration:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

- (void)poseSelectionGridControllerDidSelectCameraItem:(id)a3
{
  -[AVTPoseSelectionViewController setMode:](self, "setMode:", 1);
  -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", 0);
}

- (void)poseSelectionGridController:(id)a3 didSelectConfiguration:(id)a4
{
  id v5;

  v5 = a4;
  -[AVTPoseSelectionViewController setMode:](self, "setMode:", 0);
  -[AVTPoseSelectionViewController updateForPoseConfiguration:animated:](self, "updateForPoseConfiguration:animated:", v5, 1);

  if (-[AVTPoseSelectionViewController shouldNotifyDelegateOnSelection](self, "shouldNotifyDelegateOnSelection"))
    -[AVTPoseSelectionViewController notifyDelegateOfSelectedPose](self, "notifyDelegateOfSelectedPose");
}

- (AVTPoseSelectionViewControllerDelegate)delegate
{
  return (AVTPoseSelectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)poseTypes
{
  return self->_poseTypes;
}

- (void)setPoseTypes:(unint64_t)a3
{
  self->_poseTypes = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (AVTRecordingButton)captureButton
{
  return self->_captureButton;
}

- (void)setCaptureButton:(id)a3
{
  objc_storeStrong((id *)&self->_captureButton, a3);
}

- (AVTCircularButton)discardButton
{
  return self->_discardButton;
}

- (void)setDiscardButton:(id)a3
{
  objc_storeStrong((id *)&self->_discardButton, a3);
}

- (AVTCircularButton)menuButton
{
  return self->_menuButton;
}

- (void)setMenuButton:(id)a3
{
  objc_storeStrong((id *)&self->_menuButton, a3);
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
  objc_storeStrong((id *)&self->_avatarRecord, a3);
}

- (AVTAnimojiPoseSelectionHeaderViewController)headerViewController
{
  return self->_headerViewController;
}

- (void)setHeaderViewController:(id)a3
{
  objc_storeStrong((id *)&self->_headerViewController, a3);
}

- (NSLayoutConstraint)headerHeightConstraint
{
  return self->_headerHeightConstraint;
}

- (void)setHeaderHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_headerHeightConstraint, a3);
}

- (AVTPoseSelectionGridViewController)gridViewController
{
  return self->_gridViewController;
}

- (void)setGridViewController:(id)a3
{
  objc_storeStrong((id *)&self->_gridViewController, a3);
}

- (NSArray)stickerConfigurations
{
  return self->_stickerConfigurations;
}

- (void)setStickerConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_stickerConfigurations, a3);
}

- (UIView)headerDropShadowView
{
  return self->_headerDropShadowView;
}

- (void)setHeaderDropShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_headerDropShadowView, a3);
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (UIView)borderMaskView
{
  return self->_borderMaskView;
}

- (void)setBorderMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_borderMaskView, a3);
}

- (UIMenu)headerMenu
{
  return self->_headerMenu;
}

- (BOOL)shouldNotifyDelegateOnSelection
{
  return self->_shouldNotifyDelegateOnSelection;
}

- (void)setShouldNotifyDelegateOnSelection:(BOOL)a3
{
  self->_shouldNotifyDelegateOnSelection = a3;
}

- (BOOL)usesSingleButtonCaptureReview
{
  return self->_usesSingleButtonCaptureReview;
}

- (void)setUsesSingleButtonCaptureReview:(BOOL)a3
{
  self->_usesSingleButtonCaptureReview = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerMenu, 0);
  objc_storeStrong((id *)&self->_borderMaskView, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_headerDropShadowView, 0);
  objc_storeStrong((id *)&self->_stickerConfigurations, 0);
  objc_storeStrong((id *)&self->_gridViewController, 0);
  objc_storeStrong((id *)&self->_headerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_storeStrong((id *)&self->_discardButton, 0);
  objc_storeStrong((id *)&self->_captureButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
