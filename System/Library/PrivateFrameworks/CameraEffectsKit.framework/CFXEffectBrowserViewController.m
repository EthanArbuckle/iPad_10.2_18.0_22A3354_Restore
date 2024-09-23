@implementation CFXEffectBrowserViewController

- (CFXEffectBrowserViewController)initWithDelegate:(id)a3 contentPresenter:(id)a4
{
  id v6;
  id v7;
  CFXEffectBrowserViewController *v8;
  CFXEffectBrowserViewController *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *animojiLoadingQueue;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CFXEffectBrowserViewController;
  v8 = -[CFXEffectBrowserViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak((id *)&v9->_contentPresenter, v7);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("AnimojiLoadingQueue", v10);
    animojiLoadingQueue = v9->_animojiLoadingQueue;
    v9->_animojiLoadingQueue = (OS_dispatch_queue *)v11;

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CFXEffectBrowserViewController messagesAppsDockViewController](self, "messagesAppsDockViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cleanupRunningApps");

  v4.receiver = self;
  v4.super_class = (Class)CFXEffectBrowserViewController;
  -[CFXEffectBrowserViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  CFXEffectBrowserView *v3;

  v3 = objc_alloc_init(CFXEffectBrowserView);
  -[CFXEffectBrowserViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CFXEffectBrowserViewController;
  -[CFXEffectBrowserViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[CFXEffectBrowserViewController initMessagesAppsDockViewController](self, "initMessagesAppsDockViewController");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CFXEffectBrowserViewController;
  -[CFXEffectBrowserViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[CFXEffectBrowserViewController configureUIForOrientation](self, "configureUIForOrientation");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  uint64_t v12;
  double v13;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)CFXEffectBrowserViewController;
  -[CFXEffectBrowserViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "userInterfaceIdiom"))
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    if ((uint64_t)v9 == 667)
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      v12 = (uint64_t)v11;

      if (v12 != 667)
        return;
    }
    if (height <= width)
      v13 = 0.0;
    else
      v13 = -3.0;
    -[CFXEffectBrowserViewController madTopConstraint](self, "madTopConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConstant:", v13);
  }

}

- (void)configureUIForOrientation
{
  void *v3;
  int v4;
  int64_t v5;
  void *v6;
  int v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double Width;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  char v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  void *v55;
  double v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  _OWORD v61[3];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  CGRect v71;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v60 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v60, "userInterfaceIdiom"))
  {

    return;
  }
  -[CFXEffectBrowserViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowLandscapeForEffectBrowserViewController:", self);

  if (v4)
  {
    v5 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
    if ((unint64_t)(v5 - 3) > 1)
    {
      -[CFXEffectBrowserViewController madWidthConstraint](self, "madWidthConstraint");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 1132068864;
      LODWORD(v21) = 1132068864;
      objc_msgSend(v20, "setPriority:", v21);

      -[CFXEffectBrowserViewController madHeightConstraint](self, "madHeightConstraint");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v23) = 1144750080;
      objc_msgSend(v22, "setPriority:", v23);

      -[CFXEffectBrowserViewController madLeadingConstraint](self, "madLeadingConstraint");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v25) = 1144750080;
      objc_msgSend(v24, "setPriority:", v25);

      -[CFXEffectBrowserViewController madTrailingConstraint](self, "madTrailingConstraint");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v27) = 1144750080;
      objc_msgSend(v26, "setPriority:", v27);

      -[CFXEffectBrowserViewController madTopConstraint](self, "madTopConstraint");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v29) = 1144750080;
      objc_msgSend(v28, "setPriority:", v29);

      -[CFXEffectBrowserViewController madBottomConstraint](self, "madBottomConstraint");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CFXEffectBrowserViewController madWidthConstraint](self, "madWidthConstraint");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 1144750080;
      LODWORD(v8) = 1144750080;
      objc_msgSend(v6, "setPriority:", v8);

      -[CFXEffectBrowserViewController madHeightConstraint](self, "madHeightConstraint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = 1132068864;
      objc_msgSend(v9, "setPriority:", v10);

      -[CFXEffectBrowserViewController madTopConstraint](self, "madTopConstraint");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = 1144750080;
      objc_msgSend(v11, "setPriority:", v12);

      -[CFXEffectBrowserViewController madBottomConstraint](self, "madBottomConstraint");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = 1144750080;
      objc_msgSend(v13, "setPriority:", v14);

      -[CFXEffectBrowserViewController madLeadingConstraint](self, "madLeadingConstraint");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v15;
      if (v5 != 4)
      {
        LODWORD(v16) = 1144750080;
        objc_msgSend(v15, "setPriority:", v16);

        -[CFXEffectBrowserViewController madTrailingConstraint](self, "madTrailingConstraint");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v18;
        LODWORD(v19) = 1132068864;
LABEL_10:
        objc_msgSend(v18, "setPriority:", v19);

        +[JFXOrientationMonitor keyWindow](JFXOrientationMonitor, "keyWindow");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "bounds");
        v33 = v32;
        v35 = v34;
        v37 = v36;
        v39 = v38;

        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        objc_msgSend(MEMORY[0x24BE72D80], "cameraBottomBarGeometryForReferenceBounds:withOrientation:", v5, v33, v35, v37, v39);
        objc_msgSend(MEMORY[0x24BE72D80], "cameraBottomBarFrameForReferenceBounds:", v33, v35, v37, v39);
        Width = CGRectGetWidth(v71);
        -[CFXEffectBrowserViewController messagesAppsDockViewController](self, "messagesAppsDockViewController");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "minimizedDockHeight");
        v43 = v42;

        v62 = v68;
        v63 = v69;
        v64 = v70;
        -[CFXEffectBrowserViewController messagesAppsDockViewController](self, "messagesAppsDockViewController");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "view");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v61[0] = v62;
        v61[1] = v63;
        v61[2] = v64;
        objc_msgSend(v45, "setTransform:", v61);

        -[CFXEffectBrowserViewController messagesAppsDockViewController](self, "messagesAppsDockViewController");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "view");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setBounds:", 0.0, 0.0, Width, v43);

        if ((unint64_t)(v5 - 3) > 1)
        {
          v52 = Width * 0.5;
          Width = v43;
LABEL_22:
          -[CFXEffectBrowserViewController messagesAppsDockViewController](self, "messagesAppsDockViewController");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "view");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setCenter:", v52, Width * 0.5);

          return;
        }
        v48 = v43 * 0.5;
        objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v49, "userInterfaceIdiom"))
        {

LABEL_13:
          v50 = 0;
          v51 = 0.0;
LABEL_19:
          if (((v5 == 3) & v50) != 0)
            v51 = -v51;
          v52 = v48 + v51;
          goto LABEL_22;
        }
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "bounds");
        if ((uint64_t)v54 == 667)
        {

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "bounds");
          v57 = (uint64_t)v56;

          if (v57 != 667)
            goto LABEL_13;
        }
        v51 = 3.0;
        v50 = 1;
        goto LABEL_19;
      }
      LODWORD(v16) = 1132068864;
      objc_msgSend(v15, "setPriority:", v16);

      -[CFXEffectBrowserViewController madTrailingConstraint](self, "madTrailingConstraint");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v30 = v18;
    LODWORD(v19) = v7;
    goto LABEL_10;
  }
}

- (void)compactCurrentMessagesApp
{
  void *v2;
  char isKindOfClass;
  void *v4;
  id v5;
  void *v6;

  -[CFXEffectBrowserViewController messagesAppsDockViewController](self, "messagesAppsDockViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentAppViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    v5 = v6;
    if (objc_msgSend(v5, "presentationStyle") == 1)
      objc_msgSend(v5, "requestPresentationStyle:", 0);

    v4 = v6;
  }

}

- (void)displayPickerForEffectTypeIdentifier:(id)a3 messagesAppViewController:(id)a4 embedInMessageAppViewController:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
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
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[5];
  _QWORD v44[5];

  v5 = a5;
  v44[4] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[CFXEffectBrowserViewController effectPickerViewController](self, "effectPickerViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "effectType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", v8) & 1) != 0)
  {
    -[CFXEffectBrowserViewController effectPickerViewController](self, "effectPickerViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "parentViewController");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14 == v9)
      goto LABEL_13;
  }
  else
  {

  }
  -[CFXEffectBrowserViewController effectPickerViewController](self, "effectPickerViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    -[CFXEffectBrowserViewController removeEffectPickerViewController](self, "removeEffectPickerViewController");
  +[CFXEffectPickerViewController effectPickerViewController](CFXEffectPickerViewController, "effectPickerViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectBrowserViewController setEffectPickerViewController:](self, "setEffectPickerViewController:", v16);

  -[CFXEffectBrowserViewController effectPickerViewController](self, "effectPickerViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDelegate:", self);

  +[CFXEffectType effectTypeWithIdentifier:](CFXEffectType, "effectTypeWithIdentifier:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectBrowserViewController effectPickerViewController](self, "effectPickerViewController");
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v19, "setEffectType:", v18);

  -[CFXEffectBrowserViewController delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    -[CFXEffectBrowserViewController delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectBrowserViewController effectPickerViewController](self, "effectPickerViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "effectType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "effectBrowserViewController:didPresentPickerForEffectType:", self, v23);

  }
  -[CFXEffectBrowserViewController delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __129__CFXEffectBrowserViewController_displayPickerForEffectTypeIdentifier_messagesAppViewController_embedInMessageAppViewController___block_invoke;
  v43[3] = &unk_24EE5A8D8;
  v43[4] = self;
  objc_msgSend(v24, "effectBrowserViewController:filterPickerPreviewBackgroundImageAtSizeInPixels:completion:", self, v43, 200.0, 200.0);

  -[CFXEffectBrowserViewController effectPickerViewController](self, "effectPickerViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v9, "jfxAddChildViewController:constrainRelativeToSafeAreas:", v25, 0);
  }
  else
  {
    -[UIViewController jfxAddChildViewController:](self, "jfxAddChildViewController:", v25);

    -[CFXEffectBrowserViewController effectPickerViewController](self, "effectPickerViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[CFXEffectBrowserViewController messagesAppsDockContainerView](self, "messagesAppsDockContainerView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v37 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v25, "leftAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "leftAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v40;
    objc_msgSend(v25, "rightAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "rightAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v36;
    objc_msgSend(v25, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToConstant:", 300.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v29;
    objc_msgSend(v25, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v44[3] = v32;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 4);
    v33 = v9;
    v34 = v8;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "activateConstraints:", v35);

    v8 = v34;
    v9 = v33;

  }
LABEL_13:

}

void __129__CFXEffectBrowserViewController_displayPickerForEffectTypeIdentifier_messagesAppViewController_embedInMessageAppViewController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "effectPickerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreviewBackgroundImage:", v4);

  objc_msgSend(*(id *)(a1 + 32), "effectPickerViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startPreviewing");

}

- (void)initMessagesAppsDockViewController
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
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
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  double v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  double v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  double v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  double Width;
  void *v125;
  double Height;
  void *v127;
  void *v128;
  void *v129;
  double v130;
  int64_t v131;
  void *v132;
  double v133;
  int64_t v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  _QWORD v142[4];
  _QWORD v143[4];
  _QWORD v144[8];
  CGRect v145;
  CGRect v146;

  v144[6] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BEC84B0]);
  -[CFXEffectBrowserViewController setMessagesAppsDockViewController:](self, "setMessagesAppsDockViewController:", v3);

  -[CFXEffectBrowserViewController messagesAppsDockViewController](self, "messagesAppsDockViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  v5 = objc_alloc(MEMORY[0x24BDF6F90]);
  v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[CFXEffectBrowserViewController setMessagesAppsDockContainerView:](self, "setMessagesAppsDockContainerView:", v6);

  -[CFXEffectBrowserViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectBrowserViewController messagesAppsDockContainerView](self, "messagesAppsDockContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[CFXEffectBrowserViewController messagesAppsDockContainerView](self, "messagesAppsDockContainerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CFXEffectBrowserViewController contentPresenterDelegate](self, "contentPresenterDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[CFXEffectBrowserViewController contentPresenterDelegate](self, "contentPresenterDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "shouldAlwaysPresentExpandedAppsForEffectBrowserViewController:", self);

LABEL_7:
    -[CFXEffectBrowserViewController messagesAppsDockViewController](self, "messagesAppsDockViewController");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setAlwaysPresentAppsExpanded:", v13);

    goto LABEL_8;
  }
  -[CFXEffectBrowserViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) == 0)
  {
    v13 = 0;
    goto LABEL_7;
  }
  -[CFXEffectBrowserViewController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "shouldAlwaysPresentExpandedAppsForEffectBrowserViewController:", self);

  -[CFXEffectBrowserViewController messagesAppsDockViewController](self, "messagesAppsDockViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAlwaysPresentAppsExpanded:", v17);

  if ((v17 & 1) != 0)
  {
    -[CFXEffectBrowserViewController messagesAppsDockContainerView](self, "messagesAppsDockContainerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "widthAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToConstant:", 375.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectBrowserViewController setMadWidthConstraint:](self, "setMadWidthConstraint:", v21);

    -[CFXEffectBrowserViewController madWidthConstraint](self, "madWidthConstraint");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = 1144750080;
    objc_msgSend(v22, "setPriority:", v23);

    -[CFXEffectBrowserViewController messagesAppsDockContainerView](self, "messagesAppsDockContainerView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "heightAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToConstant:", 81.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectBrowserViewController setMadHeightConstraint:](self, "setMadHeightConstraint:", v26);

    -[CFXEffectBrowserViewController madHeightConstraint](self, "madHeightConstraint");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = 1144750080;
    objc_msgSend(v27, "setPriority:", v28);

    -[CFXEffectBrowserViewController messagesAppsDockContainerView](self, "messagesAppsDockContainerView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectBrowserViewController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32, 36.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectBrowserViewController setMadLeadingConstraint:](self, "setMadLeadingConstraint:", v33);

    -[CFXEffectBrowserViewController madLeadingConstraint](self, "madLeadingConstraint");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v35) = 1144750080;
    objc_msgSend(v34, "setPriority:", v35);

    -[CFXEffectBrowserViewController messagesAppsDockContainerView](self, "messagesAppsDockContainerView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectBrowserViewController view](self, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:constant:", v39, -36.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectBrowserViewController setMadBottomConstraint:](self, "setMadBottomConstraint:", v40);

    -[CFXEffectBrowserViewController madBottomConstraint](self, "madBottomConstraint");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v42) = 1144750080;
    objc_msgSend(v41, "setPriority:", v42);

    v43 = (void *)MEMORY[0x24BDD1628];
    -[CFXEffectBrowserViewController madWidthConstraint](self, "madWidthConstraint");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v143[0] = v44;
    -[CFXEffectBrowserViewController madHeightConstraint](self, "madHeightConstraint");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v143[1] = v45;
    -[CFXEffectBrowserViewController madLeadingConstraint](self, "madLeadingConstraint");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v143[2] = v46;
    -[CFXEffectBrowserViewController madBottomConstraint](self, "madBottomConstraint");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v143[3] = v47;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v143, 4);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "activateConstraints:", v48);

    -[CFXEffectBrowserViewController messagesAppsDockViewController](self, "messagesAppsDockViewController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectBrowserViewController messagesAppsDockContainerView](self, "messagesAppsDockContainerView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController jfxAddChildViewController:containerView:](self, "jfxAddChildViewController:containerView:", v49, v50);

    -[CFXEffectBrowserViewController messagesAppsDockViewController](self, "messagesAppsDockViewController");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "view");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v52, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v52, "heightAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectBrowserViewController messagesAppsDockViewController](self, "messagesAppsDockViewController");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "minimizedDockHeight");
    objc_msgSend(v53, "constraintEqualToConstant:");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectBrowserViewController setMadExpandedAppButtonsHeightConstraint:](self, "setMadExpandedAppButtonsHeightConstraint:", v55);

    v135 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v52, "leftAnchor");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectBrowserViewController messagesAppsDockContainerView](self, "messagesAppsDockContainerView");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "leftAnchor");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "constraintEqualToAnchor:", v139);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v142[0] = v138;
    objc_msgSend(v52, "rightAnchor");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectBrowserViewController messagesAppsDockContainerView](self, "messagesAppsDockContainerView");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "rightAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "constraintEqualToAnchor:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v142[1] = v57;
    -[CFXEffectBrowserViewController madExpandedAppButtonsHeightConstraint](self, "madExpandedAppButtonsHeightConstraint");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v142[2] = v58;
    objc_msgSend(v52, "centerYAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectBrowserViewController messagesAppsDockContainerView](self, "messagesAppsDockContainerView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "centerYAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v142[3] = v62;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v142, 4);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "activateConstraints:", v63);

    -[CFXEffectBrowserViewController messagesAppsDockContainerView](self, "messagesAppsDockContainerView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "layer");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setCornerRadius:", 12.0);

    v66 = (void *)MEMORY[0x24BDF6950];
    objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("appDockBackground"), v67, 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXEffectBrowserViewController messagesAppsDockContainerView](self, "messagesAppsDockContainerView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setBackgroundColor:", v68);

LABEL_11:
    return;
  }
LABEL_8:
  -[CFXEffectBrowserViewController messagesAppsDockContainerView](self, "messagesAppsDockContainerView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "widthAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectBrowserViewController messagesAppsDockViewController](self, "messagesAppsDockViewController");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "minimizedDockHeight");
  objc_msgSend(v72, "constraintEqualToConstant:");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectBrowserViewController setMadWidthConstraint:](self, "setMadWidthConstraint:", v74);

  -[CFXEffectBrowserViewController madWidthConstraint](self, "madWidthConstraint");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v76) = 1132068864;
  objc_msgSend(v75, "setPriority:", v76);

  -[CFXEffectBrowserViewController messagesAppsDockContainerView](self, "messagesAppsDockContainerView");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "heightAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectBrowserViewController messagesAppsDockViewController](self, "messagesAppsDockViewController");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "minimizedDockHeight");
  objc_msgSend(v78, "constraintEqualToConstant:");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectBrowserViewController setMadHeightConstraint:](self, "setMadHeightConstraint:", v80);

  -[CFXEffectBrowserViewController madHeightConstraint](self, "madHeightConstraint");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v82) = 1144750080;
  objc_msgSend(v81, "setPriority:", v82);

  -[CFXEffectBrowserViewController messagesAppsDockContainerView](self, "messagesAppsDockContainerView");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "leadingAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectBrowserViewController view](self, "view");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "leadingAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectBrowserViewController setMadLeadingConstraint:](self, "setMadLeadingConstraint:", v87);

  -[CFXEffectBrowserViewController madLeadingConstraint](self, "madLeadingConstraint");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v89) = 1144750080;
  objc_msgSend(v88, "setPriority:", v89);

  -[CFXEffectBrowserViewController messagesAppsDockContainerView](self, "messagesAppsDockContainerView");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "trailingAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectBrowserViewController view](self, "view");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "trailingAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "constraintEqualToAnchor:", v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectBrowserViewController setMadTrailingConstraint:](self, "setMadTrailingConstraint:", v94);

  -[CFXEffectBrowserViewController madTrailingConstraint](self, "madTrailingConstraint");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v96) = 1144750080;
  objc_msgSend(v95, "setPriority:", v96);

  -[CFXEffectBrowserViewController messagesAppsDockContainerView](self, "messagesAppsDockContainerView");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "topAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectBrowserViewController view](self, "view");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "topAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "constraintEqualToAnchor:", v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectBrowserViewController setMadTopConstraint:](self, "setMadTopConstraint:", v101);

  -[CFXEffectBrowserViewController madTopConstraint](self, "madTopConstraint");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v103) = 1144750080;
  objc_msgSend(v102, "setPriority:", v103);

  -[CFXEffectBrowserViewController messagesAppsDockContainerView](self, "messagesAppsDockContainerView");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "bottomAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectBrowserViewController view](self, "view");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "bottomAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "constraintEqualToAnchor:", v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectBrowserViewController setMadBottomConstraint:](self, "setMadBottomConstraint:", v108);

  -[CFXEffectBrowserViewController madBottomConstraint](self, "madBottomConstraint");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v110) = 1132068864;
  objc_msgSend(v109, "setPriority:", v110);

  v111 = (void *)MEMORY[0x24BDD1628];
  -[CFXEffectBrowserViewController madWidthConstraint](self, "madWidthConstraint");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v144[0] = v112;
  -[CFXEffectBrowserViewController madHeightConstraint](self, "madHeightConstraint");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v144[1] = v113;
  -[CFXEffectBrowserViewController madLeadingConstraint](self, "madLeadingConstraint");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v144[2] = v114;
  -[CFXEffectBrowserViewController madTrailingConstraint](self, "madTrailingConstraint");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v144[3] = v115;
  -[CFXEffectBrowserViewController madTopConstraint](self, "madTopConstraint");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v144[4] = v116;
  -[CFXEffectBrowserViewController madBottomConstraint](self, "madBottomConstraint");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v144[5] = v117;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v144, 6);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "activateConstraints:", v118);

  -[CFXEffectBrowserViewController messagesAppsDockViewController](self, "messagesAppsDockViewController");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectBrowserViewController messagesAppsDockContainerView](self, "messagesAppsDockContainerView");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectBrowserViewController delegate](self, "delegate");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController jfxAddChildViewController:containerView:constrainToContainer:relativeToSafeArea:](self, "jfxAddChildViewController:containerView:constrainToContainer:relativeToSafeArea:", v119, v120, objc_msgSend(v121, "allowLandscapeForEffectBrowserViewController:", self) ^ 1, 0);

  -[CFXEffectBrowserViewController delegate](self, "delegate");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v120) = objc_msgSend(v122, "allowLandscapeForEffectBrowserViewController:", self);

  if ((_DWORD)v120)
  {
    -[CFXEffectBrowserViewController messagesAppsDockContainerView](self, "messagesAppsDockContainerView");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "frame");
    Width = CGRectGetWidth(v145);
    -[CFXEffectBrowserViewController messagesAppsDockContainerView](self, "messagesAppsDockContainerView");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "frame");
    Height = CGRectGetHeight(v146);
    -[CFXEffectBrowserViewController messagesAppsDockViewController](self, "messagesAppsDockViewController");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "view");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "setFrame:", 0.0, 0.0, Width, Height);

  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v52, "userInterfaceIdiom"))
    goto LABEL_11;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "bounds");
  if ((uint64_t)v130 == 667)
  {
    v131 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");

    if (v131 == 1)
    {
LABEL_18:
      -[CFXEffectBrowserViewController madTopConstraint](self, "madTopConstraint");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setConstant:", -3.0);
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "bounds");
    if ((uint64_t)v133 != 667)
    {

      goto LABEL_11;
    }
    v134 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");

    if (v134 == 1)
      goto LABEL_18;
  }
}

- (void)removeEffectPickerViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  -[CFXEffectBrowserViewController effectPickerViewController](self, "effectPickerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CFXEffectBrowserViewController effectPickerViewController](self, "effectPickerViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "effectType");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[CFXEffectBrowserViewController effectPickerViewController](self, "effectPickerViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "jfxRemoveFromParentViewController");

    -[CFXEffectBrowserViewController setEffectPickerViewController:](self, "setEffectPickerViewController:", 0);
    -[CFXEffectBrowserViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[CFXEffectBrowserViewController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "effectBrowserViewController:didDismissPickerForEffectType:", self, v9);

    }
  }
}

- (void)hideBrowserAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[CFXEffectBrowserViewController messagesAppsDockViewController](self, "messagesAppsDockViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hideAppViewControllerAnimated:completion:", v4, v6);

}

- (void)refreshEffectBrowserForCameraFlip
{
  void *v3;
  id v4;

  -[CFXEffectBrowserViewController messagesAppsDockViewController](self, "messagesAppsDockViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentAppViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[CFXEffectBrowserViewController CFX_updateAVTAvatarPickerforMessagesAppViewController:](self, "CFX_updateAVTAvatarPickerforMessagesAppViewController:", v4);
}

- (BOOL)showAppIconBorders
{
  void *v3;
  char v4;

  -[CFXEffectBrowserViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CFXEffectBrowserViewController messagesAppsDockViewController](self, "messagesAppsDockViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showIconBorders");

  return v4;
}

- (void)setShowAppIconBorders:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[CFXEffectBrowserViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CFXEffectBrowserViewController messagesAppsDockViewController](self, "messagesAppsDockViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowIconBorders:", v3);

}

- (void)avatarPicker:(id)a3 didSelectAvatarRecord:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  CFXEffectBrowserViewController *v22;

  v6 = a3;
  v7 = a4;
  JFXLog_pickerUI();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9)
      -[CFXEffectBrowserViewController avatarPicker:didSelectAvatarRecord:].cold.2(v7, v8);

    -[CFXEffectBrowserViewController animojiLoadingQueue](self, "animojiLoadingQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __69__CFXEffectBrowserViewController_avatarPicker_didSelectAvatarRecord___block_invoke;
    v20 = &unk_24EE57AA8;
    v21 = v7;
    v22 = self;
    dispatch_async(v10, &v17);

    v11 = v21;
    goto LABEL_9;
  }
  if (v9)
    -[CFXEffectBrowserViewController avatarPicker:didSelectAvatarRecord:].cold.1();

  -[CFXEffectBrowserViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[CFXEffectBrowserViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CFXEffectType effectTypeWithIdentifier:](CFXEffectType, "effectTypeWithIdentifier:", CFSTR("Animoji"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "effectBrowserViewController:didRemoveAllEffectsOfType:", self, v14);

LABEL_9:
  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice", v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  if (!v16)
    -[CFXEffectBrowserViewController compactCurrentMessagesApp](self, "compactCurrentMessagesApp");

}

void __69__CFXEffectBrowserViewController_avatarPicker_didSelectAvatarRecord___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  _QWORD block[5];
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v2 = AVTAvatarKitVersionNumber();
  objc_msgSend(MEMORY[0x24BE0B498], "avatarForRecord:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v15[0] = CFSTR("JFXAnimojiEffectDataRepresentationKey");
    v15[1] = CFSTR("JFXAnimojiEffectAvatarVersionNumberKey");
    v16[0] = v4;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  +[JFXEffectFactory sharedInstance](JFXEffectFactory, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createEffectForType:fromID:withProperties:", 7, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CFXEffect effectWithJTEffect:](CFXEffect, "effectWithJTEffect:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__CFXEffectBrowserViewController_avatarPicker_didSelectAvatarRecord___block_invoke_2;
    block[3] = &unk_24EE57AA8;
    block[4] = *(_QWORD *)(a1 + 40);
    v14 = v10;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __69__CFXEffectBrowserViewController_avatarPicker_didSelectAvatarRecord___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectBrowserViewController:didSelectEffect:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)avatarPickerDidEndCameraSession:(id)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;

  JFXLog_pickerUI();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[CFXEffectBrowserViewController avatarPickerDidEndCameraSession:].cold.1();

  -[CFXEffectBrowserViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CFXEffectBrowserViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "effectBrowserViewControllerDidStartCaptureSession:", self);

  }
}

- (void)avatarPickerWillStartCameraSession:(id)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;

  JFXLog_pickerUI();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[CFXEffectBrowserViewController avatarPickerWillStartCameraSession:].cold.1();

  -[CFXEffectBrowserViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CFXEffectBrowserViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "effectBrowserViewControllerDidStopCaptureSession:", self);

  }
}

- (void)effectPickerViewController:(id)a3 didPickEffect:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a4;
  -[CFXEffectBrowserViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CFXEffectBrowserViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "effectBrowserViewController:didSelectEffect:", self, v10);

  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (!v9)
    -[CFXEffectBrowserViewController compactCurrentMessagesApp](self, "compactCurrentMessagesApp");

}

- (id)selectedFilterIdentifierForEffectPickerViewController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[CFXEffectBrowserViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CFXEffectBrowserViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectedFilterIdentifierForEffectBrowserViewController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)shouldRotateCellsForDeviceOrientation
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[CFXEffectBrowserViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[CFXEffectBrowserViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldRotateCellsForDeviceOrientation");

  return v6;
}

- (id)selectedAnimojiIdentifierForEffectBrowserViewController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[CFXEffectBrowserViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CFXEffectBrowserViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectedAnimojiIdentifierForEffectBrowserViewController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)localizedPromptForHidingAnimojiForEffectBrowserViewController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[CFXEffectBrowserViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CFXEffectBrowserViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedPromptForHidingAnimojiForEffectBrowserViewController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)addSticker:(id)a3
{
  -[CFXEffectBrowserViewController CFX_addSticker:atDropTarget:](self, "CFX_addSticker:atDropTarget:", a3, 0);
}

+ (CGSize)CFX_sizeOfImageAtURL:(id)a3
{
  double v3;
  double v4;
  CGImageSourceRef v5;
  CGImageSource *v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  double v14;
  double v15;
  uint64_t v16;
  _QWORD v17[2];
  CGSize result;

  v17[1] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDBF148];
  v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v5 = CGImageSourceCreateWithURL((CFURLRef)a3, 0);
  if (v5)
  {
    v6 = v5;
    v16 = *MEMORY[0x24BDD97D0];
    v17[0] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = CGImageSourceCopyPropertiesAtIndex(v6, 0, v7);
    if (v8)
    {
      v9 = v8;
      CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BDD96C8]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionaryGetValue(v9, (const void *)*MEMORY[0x24BDD96C0]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      v3 = v12;
      objc_msgSend(v11, "floatValue");
      v4 = v13;
      CFRelease(v9);

    }
    CFRelease(v6);

  }
  v14 = v3;
  v15 = v4;
  result.height = v15;
  result.width = v14;
  return result;
}

+ (CGSize)CFX_droppedSizeForSticker:(id)a3 dropTarget:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  v6 = a4;
  objc_msgSend(a3, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "CFX_sizeOfImageAtURL:", v7);
  v9 = v8;
  v11 = v10;

  v12 = *MEMORY[0x24BDBF148];
  v13 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (v9 != *MEMORY[0x24BDBF148] || v11 != v13)
  {
    objc_msgSend(v6, "scale");
    v16 = v15;
    objc_msgSend(MEMORY[0x24BEC84B8], "screenScale");
    v18 = 1.0 / v17;
    v19 = CGSizeScale(v9, v11, v16);
    v12 = CGSizeScale(v19, v20, v18);
    v13 = v21;
  }

  v22 = v12;
  v23 = v13;
  result.height = v23;
  result.width = v22;
  return result;
}

- (void)CFX_addSticker:(id)a3 atDropTarget:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  NSObject *v34;
  void *v35;
  char v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  int v46;
  NSObject *v47;
  id v48;
  uint64_t v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "stickerName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CFXEffectMessagesStickerUtilities overlayIDFromAnimatedPreviewFileName:](CFXEffectMessagesStickerUtilities, "overlayIDFromAnimatedPreviewFileName:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v6, "fileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v6, "fileURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("CFX"), "stringByAppendingString:", v13);
    v10 = objc_claimAutoreleasedReturnValue();

    NSTemporaryDirectory();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "fileExistsAtPath:", v15);

    if ((v17 & 1) != 0)
    {
LABEL_7:
      v49 = *MEMORY[0x24BE79650];
      v50[0] = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
      v23 = objc_claimAutoreleasedReturnValue();
      v9 = (id)*MEMORY[0x24BE79468];

      v10 = v23;
LABEL_8:
      JFXLog_pickerUI();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[CFXEffectBrowserViewController CFX_addSticker:atDropTarget:].cold.3((uint64_t)v9, v24, v25);

      +[JFXEffectFactory sharedInstance](JFXEffectFactory, "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "createEffectForType:fromID:withProperties:", 2, v9, v10);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "accessibilityLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setAccessibilityOverlayEffectLabel:", v28);

      +[CFXEffect effectWithJTEffect:](CFXEffect, "effectWithJTEffect:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend((id)objc_opt_class(), "CFX_droppedSizeForSticker:dropTarget:", v6, v7);
        v32 = v31;
        v33 = v30;
        if (v31 == *MEMORY[0x24BDBF148] && v30 == *(double *)(MEMORY[0x24BDBF148] + 8))
        {
          JFXLog_pickerUI();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            -[CFXEffectBrowserViewController CFX_addSticker:atDropTarget:].cold.2();
        }
        else
        {
          objc_msgSend(v27, "pickerScale");
          if (v37 != 1.0)
          {
            v32 = CGSizeScale(v32, v33, v37);
            v33 = v38;
          }
          objc_msgSend(v7, "screenCoordinate");
          v40 = v39;
          v42 = v41;
          objc_msgSend(v7, "rotation");
          v44 = v43;
          -[CFXEffectBrowserViewController delegate](self, "delegate");
          v34 = objc_claimAutoreleasedReturnValue();
          -[NSObject effectBrowserViewController:didDropOverlayEffect:atScreenLocation:atScreenSize:rotationAngle:](v34, "effectBrowserViewController:didDropOverlayEffect:atScreenLocation:atScreenSize:rotationAngle:", self, v29, v40, v42, v32, v33, v44);
        }
      }
      else
      {
        -[CFXEffectBrowserViewController delegate](self, "delegate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_opt_respondsToSelector();

        if ((v36 & 1) == 0)
        {
LABEL_21:
          -[CFXEffectBrowserViewController messagesAppsDockViewController](self, "messagesAppsDockViewController");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "alwaysPresentAppsExpanded");

          if (v46)
            -[CFXEffectBrowserViewController hideBrowserAnimated:completion:](self, "hideBrowserAnimated:completion:", 1, 0);

          goto LABEL_24;
        }
        -[CFXEffectBrowserViewController delegate](self, "delegate");
        v34 = objc_claimAutoreleasedReturnValue();
        -[NSObject effectBrowserViewController:didSelectEffect:](v34, "effectBrowserViewController:didSelectEffect:", self, v29);
      }

      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    v21 = objc_msgSend(v18, "copyItemAtPath:toPath:error:", v20, v15, &v48);
    v22 = v48;

    if ((v21 & 1) != 0)
    {

      goto LABEL_7;
    }
    JFXLog_pickerUI();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      -[CFXEffectBrowserViewController CFX_addSticker:atDropTarget:].cold.4(v6, (uint64_t)v22, v47);

  }
  else
  {
    JFXLog_pickerUI();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CFXEffectBrowserViewController CFX_addSticker:atDropTarget:].cold.1();
  }
LABEL_24:

}

- (void)didSelectAppWithBundleIdentifier:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[CFXEffectBrowserViewController setSelectedAppIdentifier:](self, "setSelectedAppIdentifier:");
  -[CFXEffectBrowserViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CFXEffectBrowserViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "effectBrowserViewController:didSelectAppWithIdentifier:", self, v11);

  }
  if (v11)
  {
    v7 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.FunCamera.Filters"));
    if ((_DWORD)v7)
      v8 = CFSTR("Filter");
    else
      v8 = 0;
    -[CFXEffectBrowserViewController messagesAppsDockViewController](self, "messagesAppsDockViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentAppViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CFXEffectBrowserViewController displayPickerForEffectTypeIdentifier:messagesAppViewController:embedInMessageAppViewController:](self, "displayPickerForEffectTypeIdentifier:messagesAppViewController:embedInMessageAppViewController:", v8, v10, v7);
    }
    else
    {
      -[CFXEffectBrowserViewController removeEffectPickerViewController](self, "removeEffectPickerViewController");
      -[CFXEffectBrowserViewController CFX_updateAVTAvatarPickerforMessagesAppViewController:](self, "CFX_updateAVTAvatarPickerforMessagesAppViewController:", v10);
    }

  }
  else
  {
    -[CFXEffectBrowserViewController removeEffectPickerViewController](self, "removeEffectPickerViewController");
    -[CFXEffectBrowserViewController messagesAppsDockViewController](self, "messagesAppsDockViewController");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString cleanupRunningApps](v8, "cleanupRunningApps");
  }

}

- (void)dockDidMagnify:(BOOL)a3
{
  void *v3;
  _BOOL4 v4;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  double v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  uint64_t v22;
  double v23;
  id v24;

  v4 = a3;
  if (a3)
    v6 = 75.0;
  else
    v6 = 44.0;
  -[CFXEffectBrowserViewController madExpandedAppButtonsHeightConstraint](self, "madExpandedAppButtonsHeightConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CFXEffectBrowserViewController madExpandedAppButtonsHeightConstraint](self, "madExpandedAppButtonsHeightConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v11 = v8;
    v12 = v6;
    goto LABEL_9;
  }
  -[CFXEffectBrowserViewController contentPresenterDelegate](self, "contentPresenterDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[CFXEffectBrowserViewController madHeightConstraint](self, "madHeightConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0.0;
  if (!objc_msgSend(v18, "userInterfaceIdiom"))
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    v22 = (uint64_t)v21;
    if ((uint64_t)v21 != 667
      && (objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "bounds"),
          (uint64_t)v23 != 667)
      || (+[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation") != 1
        ? (v19 = 0.0)
        : (v19 = -3.0),
          v22 != 667))
    {

    }
  }

  if (v4)
    v19 = 31.0;
  -[CFXEffectBrowserViewController madTopConstraint](self, "madTopConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  v12 = v19;
LABEL_9:
  objc_msgSend(v8, "setConstant:", v12);

  -[CFXEffectBrowserViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[CFXEffectBrowserViewController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "effectBrowserViewController:willChangeDockHeight:", self, v6);

  }
  -[CFXEffectBrowserViewController contentPresenterDelegate](self, "contentPresenterDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    -[CFXEffectBrowserViewController contentPresenterDelegate](self, "contentPresenterDelegate");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "effectBrowserViewController:willChangeDockHeight:", self, v6);

  }
}

- (UIViewController)dockPresentationViewController
{
  void *v3;
  CFXEffectBrowserViewController *v4;
  CFXEffectBrowserViewController *v5;

  -[CFXEffectBrowserViewController contentPresenter](self, "contentPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CFXEffectBrowserViewController contentPresenter](self, "contentPresenter");
    v4 = (CFXEffectBrowserViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self;
  }
  v5 = v4;

  return (UIViewController *)v5;
}

- (BOOL)expandedAppShouldDismissOnDragSuccess
{
  void *v2;
  char v3;

  -[CFXEffectBrowserViewController selectedAppIdentifier](self, "selectedAppIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.FunCamera.TextPicker.MessagesExtension"));

  return v3;
}

- (void)CFX_updateAVTAvatarPickerforMessagesAppViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  dispatch_time_t v8;
  id v9;
  dispatch_time_t v10;
  NSObject *v11;
  uint8_t v12[8];
  _QWORD block[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  CFXEffectBrowserViewController *v18;
  id v19;

  v4 = a3;
  -[CFXEffectBrowserViewController localizedPromptForHidingAnimojiForEffectBrowserViewController:](self, "localizedPromptForHidingAnimojiForEffectBrowserViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "conformsToProtocol:", &unk_255914458))
    goto LABEL_10;
  v6 = v4;
  objc_msgSend(v6, "setAvatarPickerDelegate:", self);
  if (!v5)
  {
    v10 = dispatch_time(0, 100000000);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __88__CFXEffectBrowserViewController_CFX_updateAVTAvatarPickerforMessagesAppViewController___block_invoke;
    v16[3] = &unk_24EE585C0;
    v17 = v6;
    v18 = self;
    v19 = v17;
    dispatch_after(v10, MEMORY[0x24BDAC9B8], v16);

    v9 = v17;
    goto LABEL_6;
  }
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_2559144B8))
  {
    v7 = v6;
    v8 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __88__CFXEffectBrowserViewController_CFX_updateAVTAvatarPickerforMessagesAppViewController___block_invoke_2;
    block[3] = &unk_24EE57AA8;
    v14 = v7;
    v15 = v5;
    v9 = v7;
    dispatch_after(v8, MEMORY[0x24BDAC9B8], block);

LABEL_6:
  }
  JFXLog_pickerUI();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_2269A9000, v11, OS_LOG_TYPE_DEFAULT, "animoji picker with avatar delegate found", v12, 2u);
  }

LABEL_10:
}

void __88__CFXEffectBrowserViewController_CFX_updateAVTAvatarPickerforMessagesAppViewController___block_invoke(id *a1)
{
  id v2;
  id v3;

  v2 = a1[4];
  objc_msgSend(v2, "endHidingInterface");
  objc_msgSend(a1[5], "selectedAnimojiIdentifierForEffectBrowserViewController:", a1[5]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "selectAvatarRecordWithIdentifier:animated:", v3, 0);

}

uint64_t __88__CFXEffectBrowserViewController_CFX_updateAVTAvatarPickerforMessagesAppViewController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "beginHidingInterfaceWithMessage:", *(_QWORD *)(a1 + 40));
}

- (CGSize)expandedAppViewControllerSize
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[CFXEffectBrowserViewController contentPresenterDelegate](self, "contentPresenterDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CFXEffectBrowserViewController contentPresenterDelegate](self, "contentPresenterDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CFXEffectBrowserViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0)
    {
      v10 = *MEMORY[0x24BDBF148];
      v12 = *(double *)(MEMORY[0x24BDBF148] + 8);
      goto LABEL_7;
    }
    -[CFXEffectBrowserViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v5;
  objc_msgSend(v5, "expandedAppViewControllerSizeForEffectBrowserViewController:", self);
  v10 = v9;
  v12 = v11;

LABEL_7:
  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)presentExpandedAppViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;

  v6 = a4;
  v15 = a3;
  v8 = a5;
  -[CFXEffectBrowserViewController contentPresenterDelegate](self, "contentPresenterDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[CFXEffectBrowserViewController contentPresenterDelegate](self, "contentPresenterDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v14 = v11;
    objc_msgSend(v11, "effectBrowserViewController:presentExpandedAppViewController:animated:completion:", self, v15, v6, v8);

    goto LABEL_6;
  }
  -[CFXEffectBrowserViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[CFXEffectBrowserViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

}

- (void)dismissExpandedAppViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;

  v6 = a4;
  v15 = a3;
  v8 = a5;
  -[CFXEffectBrowserViewController contentPresenterDelegate](self, "contentPresenterDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[CFXEffectBrowserViewController contentPresenterDelegate](self, "contentPresenterDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v14 = v11;
    objc_msgSend(v11, "effectBrowserViewController:dismissExpandedAppViewController:animated:completion:", self, v15, v6, v8);

    goto LABEL_6;
  }
  -[CFXEffectBrowserViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[CFXEffectBrowserViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

}

- (void)commitAnimatedLayoutChanges
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __61__CFXEffectBrowserViewController_commitAnimatedLayoutChanges__block_invoke;
  v2[3] = &unk_24EE57B60;
  v2[4] = self;
  +[JTAnimation performAnimation:duration:completion:](JTAnimation, "performAnimation:duration:completion:", v2, 0, 0.4);
}

void __61__CFXEffectBrowserViewController_commitAnimatedLayoutChanges__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- (CFXEffectBrowserContentPresenterDelegate)contentPresenterDelegate
{
  return (CFXEffectBrowserContentPresenterDelegate *)objc_loadWeakRetained((id *)&self->_contentPresenterDelegate);
}

- (void)setContentPresenterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contentPresenterDelegate, a3);
}

- (NSString)selectedAppIdentifier
{
  return self->_selectedAppIdentifier;
}

- (void)setSelectedAppIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAppIdentifier, a3);
}

- (CFXEffectBrowserViewControllerDelegate)delegate
{
  return (CFXEffectBrowserViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CFXEffectPickerViewController)effectPickerViewController
{
  return self->_effectPickerViewController;
}

- (void)setEffectPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_effectPickerViewController, a3);
}

- (UIView)messagesAppsDockContainerView
{
  return self->_messagesAppsDockContainerView;
}

- (void)setMessagesAppsDockContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_messagesAppsDockContainerView, a3);
}

- (IMADockViewController)messagesAppsDockViewController
{
  return self->_messagesAppsDockViewController;
}

- (void)setMessagesAppsDockViewController:(id)a3
{
  objc_storeStrong((id *)&self->_messagesAppsDockViewController, a3);
}

- (OS_dispatch_semaphore)animatedPreviewWritingSemaphore
{
  return self->_animatedPreviewWritingSemaphore;
}

- (void)setAnimatedPreviewWritingSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_animatedPreviewWritingSemaphore, a3);
}

- (OS_dispatch_queue)animatedPreviewWritingQueue
{
  return self->_animatedPreviewWritingQueue;
}

- (void)setAnimatedPreviewWritingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_animatedPreviewWritingQueue, a3);
}

- (OS_dispatch_group)animatedPreviewProcessingGroup
{
  return self->_animatedPreviewProcessingGroup;
}

- (void)setAnimatedPreviewProcessingGroup:(id)a3
{
  objc_storeStrong((id *)&self->_animatedPreviewProcessingGroup, a3);
}

- (UIViewController)contentPresenter
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_contentPresenter);
}

- (void)setContentPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_contentPresenter, a3);
}

- (NSLayoutConstraint)madWidthConstraint
{
  return self->_madWidthConstraint;
}

- (void)setMadWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_madWidthConstraint, a3);
}

- (NSLayoutConstraint)madHeightConstraint
{
  return self->_madHeightConstraint;
}

- (void)setMadHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_madHeightConstraint, a3);
}

- (NSLayoutConstraint)madLeadingConstraint
{
  return self->_madLeadingConstraint;
}

- (void)setMadLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_madLeadingConstraint, a3);
}

- (NSLayoutConstraint)madTrailingConstraint
{
  return self->_madTrailingConstraint;
}

- (void)setMadTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_madTrailingConstraint, a3);
}

- (NSLayoutConstraint)madTopConstraint
{
  return self->_madTopConstraint;
}

- (void)setMadTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_madTopConstraint, a3);
}

- (NSLayoutConstraint)madBottomConstraint
{
  return self->_madBottomConstraint;
}

- (void)setMadBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_madBottomConstraint, a3);
}

- (NSLayoutConstraint)madExpandedAppButtonsHeightConstraint
{
  return self->_madExpandedAppButtonsHeightConstraint;
}

- (void)setMadExpandedAppButtonsHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_madExpandedAppButtonsHeightConstraint, a3);
}

- (OS_dispatch_queue)animojiLoadingQueue
{
  return self->_animojiLoadingQueue;
}

- (void)setAnimojiLoadingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_animojiLoadingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animojiLoadingQueue, 0);
  objc_storeStrong((id *)&self->_madExpandedAppButtonsHeightConstraint, 0);
  objc_storeStrong((id *)&self->_madBottomConstraint, 0);
  objc_storeStrong((id *)&self->_madTopConstraint, 0);
  objc_storeStrong((id *)&self->_madTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_madLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_madHeightConstraint, 0);
  objc_storeStrong((id *)&self->_madWidthConstraint, 0);
  objc_destroyWeak((id *)&self->_contentPresenter);
  objc_storeStrong((id *)&self->_animatedPreviewProcessingGroup, 0);
  objc_storeStrong((id *)&self->_animatedPreviewWritingQueue, 0);
  objc_storeStrong((id *)&self->_animatedPreviewWritingSemaphore, 0);
  objc_storeStrong((id *)&self->_messagesAppsDockViewController, 0);
  objc_storeStrong((id *)&self->_messagesAppsDockContainerView, 0);
  objc_storeStrong((id *)&self->_effectPickerViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedAppIdentifier, 0);
  objc_destroyWeak((id *)&self->_contentPresenterDelegate);
}

- (void)avatarPicker:didSelectAvatarRecord:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "none selected in animoji picker", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)avatarPicker:(void *)a1 didSelectAvatarRecord:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_2269A9000, a2, v4, "selected animoji %@", (uint8_t *)&v5);

}

- (void)avatarPickerDidEndCameraSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "animoji picker did end camera session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)avatarPickerWillStartCameraSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "animoji picker did start camera session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)CFX_addSticker:atDropTarget:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2269A9000, v0, v1, "rdar://110255981 Ignoring sticker with nil fileURL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)CFX_addSticker:atDropTarget:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2269A9000, v0, v1, "could not insert overlay on drag and drop because its screen size could not be determined", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)CFX_addSticker:(uint64_t)a3 atDropTarget:.cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_2269A9000, a2, a3, "sticker dropped for overlay %@", (uint8_t *)&v3);
}

- (void)CFX_addSticker:(NSObject *)a3 atDropTarget:.cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_2269A9000, a3, OS_LOG_TYPE_ERROR, "could not copy sticker file %@ to temporary directory. Error %@", (uint8_t *)&v7, 0x16u);

}

@end
