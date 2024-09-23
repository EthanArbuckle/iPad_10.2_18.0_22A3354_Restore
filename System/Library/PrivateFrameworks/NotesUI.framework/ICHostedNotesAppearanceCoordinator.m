@implementation ICHostedNotesAppearanceCoordinator

- (ICHostedNotesAppearanceCoordinator)initWithDelegate:(id)a3
{
  id v4;
  ICHostedNotesAppearanceCoordinator *v5;
  ICHostedNotesAppearanceCoordinator *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICHostedNotesAppearanceCoordinator;
  v5 = -[ICHostedNotesAppearanceCoordinator init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_willPresentViewController_, *MEMORY[0x1E0DC5230], 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_willDismissViewController_, *MEMORY[0x1E0DC5220], 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_didDismissViewController_, *MEMORY[0x1E0DC5218], 0);

  }
  return v6;
}

- (void)updateAppearance
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  uint64_t v39;
  double v40;
  double MinX;
  CGFloat v42;
  void *v43;
  double v44;
  CGFloat v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  double v62;
  CGFloat v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double *v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  double v73;
  double MaxX;
  CGFloat v75;
  double v76;
  void *v77;
  double v78;
  void *v79;
  double v80;
  CGFloat v81;
  CGFloat MinY;
  double v83;
  double v84;
  double MaxY;
  double v86;
  void *v87;
  _BOOL8 v88;
  void *v89;
  CGFloat v90;
  double v91;
  double v92;
  CGFloat v93;
  double v94;
  CGFloat MidX;
  double v96;
  CGRect v97;
  double v98;
  double v99;
  CGFloat rect2a;
  double rect2;
  CGFloat v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat v105;
  id v106;
  CGFloat rect;
  CGFloat recta;
  CGFloat v109;
  double v110;
  CGFloat v111;
  double v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;

  -[ICHostedNotesAppearanceCoordinator hostedWindowScene](self, "hostedWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return;
  -[ICHostedNotesAppearanceCoordinator view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[ICHostedNotesAppearanceCoordinator view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safeAreaInsets");
  rect = v8;
  v109 = v6;
  v15 = v6 + v14;
  v17 = v8 + v16;
  v104 = v12;
  v105 = v10;
  v19 = v10 - (v14 + v18);
  v21 = v12 - (v16 + v20);

  v22 = (void *)MEMORY[0x1E0CD1278];
  -[ICHostedNotesAppearanceCoordinator view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "window");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_existingToolPickerForWindow:", v24);
  v106 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v106, "_paletteView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  x = v113.origin.x;
  y = v113.origin.y;
  width = v113.size.width;
  height = v113.size.height;
  v137.origin.x = v15;
  v137.origin.y = v17;
  v137.size.width = v19;
  v137.size.height = v21;
  v97 = CGRectIntersection(v113, v137);
  if (!CGRectIsNull(v97))
  {
    -[ICHostedNotesAppearanceCoordinator view](self, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v17;
    v96 = v15;
    v91 = v21;
    v92 = v19;
    objc_msgSend(v30, "convertRect:toView:", 0, v15, v17, v19, v21);
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;

    v39 = objc_msgSend(v25, "palettePosition");
    if (v39 == 8 || v39 == 4)
    {
      v116.origin.y = rect;
      v116.origin.x = v109;
      v116.size.height = v104;
      v116.size.width = v105;
      v110 = CGRectGetHeight(v116);
      v117.origin.x = x;
      v117.origin.y = y;
      v117.size.width = width;
      v117.size.height = height;
      v111 = v110 - CGRectGetMaxY(v117);
      v90 = v32;
      v118.origin.x = v32;
      v118.origin.y = v34;
      v118.size.width = v36;
      v118.size.height = v38;
      if (v111 < CGRectGetMinY(v118) + 158.0)
      {
        v119.origin.x = v32;
        v119.origin.y = v34;
        v119.size.width = v36;
        v119.size.height = v38;
        MinX = CGRectGetMinX(v119);
        v120.origin.x = x;
        v120.origin.y = y;
        v120.size.width = width;
        v120.size.height = height;
        if (MinX < CGRectGetWidth(v120))
        {
          v42 = CGRectGetWidth(v97);
          v15 = v96 + v42;
          v17 = v94 + 0.0;
          v19 = v92 - (v42 + 0.0);
LABEL_13:
          v21 = v91;
          goto LABEL_14;
        }
      }
    }
    else if (v39 == 3)
    {
      v114.origin.x = x;
      v114.origin.y = y;
      v114.size.width = width;
      v114.size.height = height;
      v40 = CGRectGetMinX(v114);
      v115.origin.x = v32;
      v115.origin.y = v34;
      v115.size.width = v36;
      v115.size.height = v38;
      v17 = v94;
      v15 = v96;
      v21 = v91;
      v19 = v92;
      if (v40 < CGRectGetMinX(v115) + 165.0)
      {
        v15 = v96 + 0.0;
        v17 = v94 + 0.0;
        v21 = v91 - (CGRectGetHeight(v97) + 0.0);
      }
      goto LABEL_14;
    }
    v17 = v94;
    v15 = v96;
    v19 = v92;
    goto LABEL_13;
  }
LABEL_14:
  -[ICHostedNotesAppearanceCoordinator view](self, "view", *(_QWORD *)&v90);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "convertRect:toView:", 0, v15, v17, v19, v21);
  v45 = v44;
  v102 = v47;
  v103 = v46;
  v49 = v48;

  -[ICHostedNotesAppearanceCoordinator view](self, "view");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "window");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "bounds");
  v53 = v52;
  v55 = v54;
  v57 = v56;
  v59 = v58;
  -[ICHostedNotesAppearanceCoordinator view](self, "view");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "window");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "safeAreaInsets");
  v63 = v53 + v62;
  v65 = v55 + v64;
  v112 = v57 - (v62 + v66);
  v68 = v59 - (v64 + v67);

  v69 = (double *)MEMORY[0x1E0DC49E8];
  v121.origin.x = v45;
  v121.origin.y = v103;
  v121.size.width = v49;
  v121.size.height = v102;
  recta = CGRectGetMinX(v121);
  v122.origin.x = v63;
  v122.origin.y = v65;
  v122.size.width = v112;
  v122.size.height = v68;
  rect2a = CGRectGetMidY(v122);
  v123.origin.x = v45;
  v70 = v63;
  v123.origin.y = v103;
  v123.size.width = v49;
  v123.size.height = v102;
  v138.size.width = CGRectGetWidth(v123);
  v138.size.height = 1.0;
  v124.origin.x = v63;
  v124.origin.y = v65;
  v138.origin.x = recta;
  v71 = v112;
  v124.size.width = v112;
  v124.size.height = v68;
  v138.origin.y = rect2a;
  if (CGRectContainsRect(v124, v138))
  {
    v125.origin.x = v45;
    v125.origin.y = v103;
    v125.size.width = v49;
    v125.size.height = v102;
    v72 = v68;
    v73 = CGRectGetMinX(v125);
    v126.origin.x = v70;
    v126.size.width = v112;
    v126.origin.y = v65;
    v126.size.height = v72;
    v98 = fmax(v73 - CGRectGetMinX(v126), 0.0);
    v127.origin.x = v70;
    v127.size.width = v112;
    v127.origin.y = v65;
    v127.size.height = v72;
    MaxX = CGRectGetMaxX(v127);
    v128.origin.x = v45;
    v128.origin.y = v103;
    v128.size.width = v49;
    v75 = v102;
    v128.size.height = v102;
    v76 = fmax(MaxX - CGRectGetMaxX(v128), 0.0);
    -[ICHostedNotesAppearanceCoordinator viewController](self, "viewController");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v77, "ic_isRTL"))
      v78 = v76;
    else
      v78 = v98;
    rect2 = v78;

    -[ICHostedNotesAppearanceCoordinator viewController](self, "viewController");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v79, "ic_isRTL"))
      v80 = v98;
    else
      v80 = v76;
    v99 = v80;
    v68 = v72;
    v71 = v112;

  }
  else
  {
    v99 = v69[3];
    rect2 = v69[1];
    v75 = v102;
  }
  v129.origin.x = v70;
  v129.origin.y = v65;
  v129.size.width = v71;
  v129.size.height = v68;
  MidX = CGRectGetMidX(v129);
  v130.origin.x = v45;
  v130.origin.y = v103;
  v130.size.width = v49;
  v81 = v75;
  v130.size.height = v75;
  MinY = CGRectGetMinY(v130);
  v131.origin.x = v45;
  v131.origin.y = v103;
  v131.size.width = v49;
  v131.size.height = v81;
  v139.size.height = CGRectGetHeight(v131);
  v139.size.width = 1.0;
  v132.origin.x = v70;
  v132.origin.y = v65;
  v132.size.width = v71;
  v93 = v68;
  v132.size.height = v68;
  v139.origin.x = MidX;
  v139.origin.y = MinY;
  if (CGRectContainsRect(v132, v139))
  {
    v133.origin.x = v45;
    v133.origin.y = v103;
    v133.size.width = v49;
    v133.size.height = v81;
    v83 = CGRectGetMinY(v133);
    v134.origin.x = v70;
    v134.origin.y = v65;
    v134.size.width = v112;
    v134.size.height = v93;
    v84 = fmax(v83 - CGRectGetMinY(v134), 0.0);
    v135.origin.x = v70;
    v135.origin.y = v65;
    v135.size.width = v112;
    v135.size.height = v93;
    MaxY = CGRectGetMaxY(v135);
    v136.origin.x = v45;
    v136.origin.y = v103;
    v136.size.width = v49;
    v136.size.height = v102;
    v86 = fmax(MaxY - CGRectGetMaxY(v136), 0.0);
  }
  else
  {
    v84 = *v69;
    v86 = v69[2];
  }
  -[ICHostedNotesAppearanceCoordinator modeButtonHidingPresentedViewController](self, "modeButtonHidingPresentedViewController");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v87 != 0;

  -[ICHostedNotesAppearanceCoordinator viewController](self, "viewController");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "ic_hostedNotesUpdateAdditionalSafeAreaInsets:isModeButtonHidden:", v88, v84, rect2, v86, v99);

}

- (void)willPresentViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v8 = objc_claimAutoreleasedReturnValue();

  v6 = (void *)v8;
  if (v8)
  {
    v7 = -[ICHostedNotesAppearanceCoordinator shouldHideModeButtonWithPresentedViewController:](self, "shouldHideModeButtonWithPresentedViewController:", v8);
    v6 = (void *)v8;
    if (v7)
    {
      -[ICHostedNotesAppearanceCoordinator setModeButtonHidingPresentedViewController:](self, "setModeButtonHidingPresentedViewController:", v8);
      -[ICHostedNotesAppearanceCoordinator updateAppearance](self, "updateAppearance");
      v6 = (void *)v8;
    }
  }

}

- (void)willDismissViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  id v9;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "transitionCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isInteractive");

  -[ICHostedNotesAppearanceCoordinator modeButtonHidingPresentedViewController](self, "modeButtonHidingPresentedViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8 && (v7 & 1) == 0)
  {
    -[ICHostedNotesAppearanceCoordinator setModeButtonHidingPresentedViewController:](self, "setModeButtonHidingPresentedViewController:", 0);
    -[ICHostedNotesAppearanceCoordinator updateAppearance](self, "updateAppearance");
  }

}

- (void)didDismissViewController:(id)a3
{
  void *v4;
  int v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5210]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    -[ICHostedNotesAppearanceCoordinator setModeButtonHidingPresentedViewController:](self, "setModeButtonHidingPresentedViewController:", 0);
    -[ICHostedNotesAppearanceCoordinator updateAppearance](self, "updateAppearance");
  }

}

- (NSSet)modeButtonHidingModalTypes
{
  void *v3;
  void *v4;

  -[ICHostedNotesAppearanceCoordinator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hostedNotesAppearanceCoordinatorModeButtonHidingModalTypes:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)modeButtonHidingPopoverTypes
{
  void *v3;
  void *v4;

  -[ICHostedNotesAppearanceCoordinator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hostedNotesAppearanceCoordinatorModeButtonHidingPopoverTypes:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (BOOL)shouldHideModeButtonWithPresentedViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  char v15;
  void *v16;
  id v17;
  char v18;
  char v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  char v24;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;

  v4 = a3;
  objc_msgSend(v4, "presentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_hostedWindowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && (-[ICHostedNotesAppearanceCoordinator hostedWindowScene](self, "hostedWindowScene"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7 == v8))
  {
    objc_msgSend(v4, "popoverPresentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICHostedNotesAppearanceCoordinator viewController](self, "viewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "horizontalSizeClass");

    if (objc_msgSend(v4, "modalPresentationStyle") == -1)
    {
      v15 = 1;
    }
    else
    {
      if (v10)
        v14 = v13 == 1;
      else
        v14 = 1;
      v15 = !v14;
    }
    -[ICHostedNotesAppearanceCoordinator modeButtonHidingModalTypes](self, "modeButtonHidingModalTypes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __86__ICHostedNotesAppearanceCoordinator_shouldHideModeButtonWithPresentedViewController___block_invoke;
    v28[3] = &unk_1E5C206E0;
    v17 = v4;
    v29 = v17;
    v18 = objc_msgSend(v16, "ic_containsObjectPassingTest:", v28);

    v19 = v15 ^ 1;
    if ((v15 & 1) != 0)
    {
      v20 = MEMORY[0x1E0C809B0];
    }
    else
    {
      v20 = MEMORY[0x1E0C809B0];
      if ((v18 & 1) == 0)
      {
        -[ICHostedNotesAppearanceCoordinator delegate](self, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v21, "hostedNotesAppearanceCoordinator:shouldHideWithModal:", self, v17);

      }
    }
    -[ICHostedNotesAppearanceCoordinator modeButtonHidingPopoverTypes](self, "modeButtonHidingPopoverTypes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v20;
    v26[1] = 3221225472;
    v26[2] = __86__ICHostedNotesAppearanceCoordinator_shouldHideModeButtonWithPresentedViewController___block_invoke_2;
    v26[3] = &unk_1E5C206E0;
    v27 = v17;
    v23 = objc_msgSend(v22, "ic_containsObjectPassingTest:", v26);

    if (v10)
      v24 = v23;
    else
      v24 = 0;
    v9 = v19 | v24;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __86__ICHostedNotesAppearanceCoordinator_shouldHideModeButtonWithPresentedViewController___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __86__ICHostedNotesAppearanceCoordinator_shouldHideModeButtonWithPresentedViewController___block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

- (_UIHostedWindowScene)hostedWindowScene
{
  void *v2;
  void *v3;

  -[ICHostedNotesAppearanceCoordinator viewController](self, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_hostedWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIHostedWindowScene *)v3;
}

- (UIViewController)viewController
{
  void *v3;
  void *v4;

  -[ICHostedNotesAppearanceCoordinator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hostedNotesAppearanceCoordinatorSafeAreaViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v4;
}

- (UIView)view
{
  void *v2;
  void *v3;

  -[ICHostedNotesAppearanceCoordinator viewController](self, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (ICHostedNotesAppearanceCoordinating)delegate
{
  return (ICHostedNotesAppearanceCoordinating *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)modeButtonHidingPresentedViewController
{
  return self->_modeButtonHidingPresentedViewController;
}

- (void)setModeButtonHidingPresentedViewController:(id)a3
{
  objc_storeStrong((id *)&self->_modeButtonHidingPresentedViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeButtonHidingPresentedViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
