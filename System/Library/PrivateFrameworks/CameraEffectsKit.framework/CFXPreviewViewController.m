@implementation CFXPreviewViewController

- (void)viewDidLoad
{
  uint64_t v3;
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
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  id v42;
  void *v43;
  double Width;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  void *v65;
  double v66;
  uint64_t v67;
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
  id v78;
  objc_super v79;
  _QWORD v80[4];
  _QWORD v81[6];
  CGRect v82;
  CGRect v83;

  v81[4] = *MEMORY[0x24BDAC8D0];
  v79.receiver = self;
  v79.super_class = (Class)CFXPreviewViewController;
  -[CFXPreviewViewController viewDidLoad](&v79, sel_viewDidLoad);
  v3 = -[CFXPreviewViewController shouldExportOnly](self, "shouldExportOnly") ^ 1;
  -[CFXPreviewViewController exportButton](self, "exportButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  -[CFXPreviewViewController playButton](self, "playButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v70 = (void *)MEMORY[0x24BDD1628];
  -[CFXPreviewViewController playButton](self, "playButton");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "widthAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToConstant:", 70.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v75;
  -[CFXPreviewViewController playButton](self, "playButton");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "heightAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToConstant:", 70.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v81[1] = v72;
  -[CFXPreviewViewController playButton](self, "playButton");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "centerXAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPreviewViewController playerContainerView](self, "playerContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "centerXAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v81[2] = v8;
  -[CFXPreviewViewController playButton](self, "playButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPreviewViewController playerContainerView](self, "playerContainerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "centerYAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v81[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v81, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "activateConstraints:", v14);

  -[CFXPreviewViewController previewClip](self, "previewClip");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPreviewViewController mediaItem](self, "mediaItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "metadataURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMetadataURL:", v17);

  -[CFXPreviewViewController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMediaInterfaceOrientationForDisplay:", objc_msgSend(v18, "calculateMediaInterfaceOrientationForDisplay"));

  v19 = (void *)MEMORY[0x24BDBCF20];
  v80[0] = objc_opt_class();
  v80[1] = objc_opt_class();
  v80[2] = objc_opt_class();
  v80[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v80, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x24BDD1620];
  -[CFXPreviewViewController delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "animojiMetadata");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0;
  objc_msgSend(v22, "unarchivedObjectOfClasses:fromData:error:", v21, v24, &v78);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v78;

  objc_msgSend(v25, "objectForKey:", CFSTR("JFXAnimojiEffectDataRepresentationKey"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setOriginalAnimojiDataRepresentation:", v27);

  objc_msgSend(v25, "objectForKey:", CFSTR("JFXAnimojiEffectAvatarVersionNumberKey"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setOriginalAnimojiVersionNumber:", objc_msgSend(v28, "unsignedIntegerValue"));

  -[CFXPreviewViewController CFX_setFrameAndRenderSizes](self, "CFX_setFrameAndRenderSizes");
  -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setClip:", v15);

  -[CFXPreviewViewController setPlayButtonHiddenIfPossible:](self, "setPlayButtonHiddenIfPossible:", 0);
  -[CFXPreviewViewController setEffectAnimationsEnabledIfPossible:](self, "setEffectAnimationsEnabledIfPossible:", 0);
  +[JFXOrientationMonitor keyWindow](JFXOrientationMonitor, "keyWindow");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;

  objc_msgSend(MEMORY[0x24BE72D80], "reviewScreenControlBarFrameForReferenceBounds:", v32, v34, v36, v38);
  v40 = v39;
  -[CFXPreviewViewController previewControlsContainerHeightConstraint](self, "previewControlsContainerHeightConstraint");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setConstant:", v40);

  -[CFXPreviewViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", 0);
  if (s_LiveCaptureSnapshotView)
  {
    v42 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[CFXPreviewViewController playerContainerView](self, "playerContainerView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "frame");
    Width = CGRectGetWidth(v82);
    -[CFXPreviewViewController playerContainerView](self, "playerContainerView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "frame");
    v46 = (void *)objc_msgSend(v42, "initWithFrame:", 0.0, 0.0, Width, CGRectGetHeight(v83));

    objc_msgSend(v46, "addSubview:", s_LiveCaptureSnapshotView);
    -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "dispatchBlockWhenDone:", &__block_literal_global_25);

    -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "displayCompositionUpdateLoadingView:", v46);

  }
  -[CFXPreviewViewController effectBrowserContentPresenterViewController](self, "effectBrowserContentPresenterViewController");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController jfxAddChildViewController:](self, "jfxAddChildViewController:", v49);

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "userInterfaceIdiom");

  if (!v51)
  {
    -[CFXPreviewViewController previewControls](self, "previewControls");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "controlsContainerViewWidthConstraint");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v54) = 1132068864;
    objc_msgSend(v53, "setPriority:", v54);

    -[CFXPreviewViewController previewControls](self, "previewControls");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "controlsContainerViewHeightConstraint");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v57) = 1132068864;
    objc_msgSend(v56, "setPriority:", v57);

    -[CFXPreviewViewController previewControls](self, "previewControls");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "controlsContainerViewLeadingConstraint");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v60) = 1144750080;
    objc_msgSend(v59, "setPriority:", v60);

    -[CFXPreviewViewController previewControls](self, "previewControls");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "controlsContainerViewTrailingConstraint");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v63) = 1144750080;
    objc_msgSend(v62, "setPriority:", v63);

    -[CFXPreviewViewController previewControls](self, "previewControls");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "controlsContainerViewTopConstraint");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v66) = 1144750080;
    objc_msgSend(v65, "setPriority:", v66);

  }
  v67 = isShowPlayerScrubbingControlsEnabled() ^ 1;
  -[CFXPreviewViewController playbackSlider](self, "playbackSlider");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setHidden:", v67);

}

uint64_t __39__CFXPreviewViewController_viewDidLoad__block_invoke()
{
  return +[CFXPreviewViewController setLiveCaptureSnapshotView:](CFXPreviewViewController, "setLiveCaptureSnapshotView:", 0);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CFXPreviewViewController;
  -[CFXPreviewViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[CFXPreviewViewController configureUIForOrientation](self, "configureUIForOrientation");
}

- (void)configureBottomControlsForOrientation
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  __int128 v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  float v29;
  float v30;
  float v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  uint64_t v37;
  CGFloat v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  double v61;
  uint64_t v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  void *v71;
  _OWORD v72[3];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _OWORD v76[3];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;

  +[JFXOrientationMonitor keyWindow](JFXOrientationMonitor, "keyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  if (!v14)
  {
    v22 = v12 - 3;
    objc_msgSend(MEMORY[0x24BE72D80], "reviewScreenControlBarFrameForReferenceBounds:", v5, v7, v9, v11);
    v24 = v23;
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    objc_msgSend(MEMORY[0x24BE72D80], "reviewScreenControlBarGeometryForReferenceBounds:withOrientation:", v12, v5, v7, v9, v11);
    if (-[CFXPreviewViewController dockIsMagnified](self, "dockIsMagnified"))
    {
      -[CFXPreviewViewController dockMagnifiedHeightDelta](self, "dockMagnifiedHeightDelta");
      *((double *)&v81 + 1) = v25 + *((double *)&v81 + 1);
    }
    -[CFXPreviewViewController previewControlsContainerTopConstraint](self, "previewControlsContainerTopConstraint");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v26;
    v29 = 750.0;
    if (v22 >= 2)
      v30 = 250.0;
    else
      v30 = 750.0;
    if (v22 >= 2)
      v31 = 750.0;
    else
      v31 = 250.0;
    *(float *)&v27 = v30;
    objc_msgSend(v26, "setPriority:", v27);

    -[CFXPreviewViewController previewControlsContainerWidthConstraint](self, "previewControlsContainerWidthConstraint");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v33 = v30;
    objc_msgSend(v32, "setPriority:", v33);

    -[CFXPreviewViewController previewControlsContainerHeightConstraint](self, "previewControlsContainerHeightConstraint");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v35 = v31;
    objc_msgSend(v34, "setPriority:", v35);

    -[CFXPreviewViewController view](self, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bounds");
    if (v22 > 1)
    {
      v46 = CGRectGetHeight(*(CGRect *)&v37) - v24;

      if (-[CFXPreviewViewController dockIsMagnified](self, "dockIsMagnified"))
      {
        -[CFXPreviewViewController dockMagnifiedHeightDelta](self, "dockMagnifiedHeightDelta");
        v46 = v46 + v47;
      }
      -[CFXPreviewViewController previewControlsContainerHeightConstraint](self, "previewControlsContainerHeightConstraint");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setConstant:", v46);

      -[CFXPreviewViewController previewControlsContainerLeadingConstraint](self, "previewControlsContainerLeadingConstraint");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v50) = 1144750080;
      objc_msgSend(v49, "setPriority:", v50);

    }
    else
    {
      v41 = CGRectGetWidth(*(CGRect *)&v37) - v24;

      -[CFXPreviewViewController previewControlsContainerWidthConstraint](self, "previewControlsContainerWidthConstraint");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setConstant:", v41);

      -[CFXPreviewViewController previewControlsContainerLeadingConstraint](self, "previewControlsContainerLeadingConstraint");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v43;
      if (v12 == 4)
        *(float *)&v44 = 750.0;
      else
        *(float *)&v44 = 250.0;
      if (v12 == 4)
        v29 = 250.0;
      objc_msgSend(v43, "setPriority:", v44);

    }
    -[CFXPreviewViewController previewControlsContainerTrailingConstraint](self, "previewControlsContainerTrailingConstraint");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v52 = v29;
    objc_msgSend(v51, "setPriority:", v52);

    v53 = *((double *)&v82 + 1);
    v54 = *(double *)&v82;
    if (!-[CFXPreviewViewController dockIsMagnified](self, "dockIsMagnified"))
      goto LABEL_34;
    -[CFXPreviewViewController dockMagnifiedHeightDelta](self, "dockMagnifiedHeightDelta");
    v56 = ceil(v55 * 0.5);
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v57, "userInterfaceIdiom"))
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "bounds");
      if ((uint64_t)v59 < 812)
      {
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "bounds");
        v62 = (uint64_t)v61;

        if (v62 < 812)
        {
LABEL_28:
          v66 = 0.0;
          if (v22 >= 2)
            v67 = v56;
          else
            v67 = 0.0;
          v53 = *((double *)&v82 + 1) - v67;
          if (v22 < 2)
            v66 = v56;
          v54 = *(double *)&v82 - v66;
LABEL_34:
          -[CFXPreviewViewController bottomControlsDrawer](self, "bottomControlsDrawer");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "setCenter:", v54, v53);

          v69 = v80;
          v70 = v81;
          -[CFXPreviewViewController bottomControlsDrawer](self, "bottomControlsDrawer");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "setBounds:", v69, v70);

          v77 = v83;
          v78 = v84;
          v79 = v85;
          -[CFXPreviewViewController bottomControlsDrawer](self, "bottomControlsDrawer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v76[0] = v77;
          v76[1] = v78;
          v76[2] = v79;
          objc_msgSend(v21, "setTransform:", v76);
          goto LABEL_35;
        }
      }
      else
      {

      }
      -[CFXPreviewViewController view](self, "view");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "safeAreaInsets");
      v64 = v63;
      -[CFXPreviewViewController dockMagnifiedHeightDelta](self, "dockMagnifiedHeightDelta");
      v56 = v56 - (v64 - v65);
    }

    goto LABEL_28;
  }
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  objc_msgSend(MEMORY[0x24BE72D80], "reviewScreenControlBarGeometryForReferenceBounds:withOrientation:", v12, v5, v7, v9, v11);
  v15 = v80;
  v16 = v81;
  -[CFXPreviewViewController bottomControlsDrawer](self, "bottomControlsDrawer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBounds:", v15, v16);

  v18 = v82;
  -[CFXPreviewViewController bottomControlsDrawer](self, "bottomControlsDrawer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCenter:", v18);

  v73 = v83;
  v74 = v84;
  v75 = v85;
  -[CFXPreviewViewController bottomControlsDrawer](self, "bottomControlsDrawer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v73;
  v72[1] = v74;
  v72[2] = v75;
  objc_msgSend(v20, "setTransform:", v72);

  -[CFXPreviewViewController previewControlsContainerHeightConstraint](self, "previewControlsContainerHeightConstraint");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 0);
LABEL_35:

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CFXPreviewViewController;
  -[CFXPreviewViewController viewWillAppear:](&v13, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_JFX_orientationMonitorInterfaceOrientationNotification_, CFSTR("kJFXOrientationMonitorInterfaceOrientationNotification"), 0);

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (!v6)
  {
    -[CFXPreviewViewController bottomControlsDrawer](self, "bottomControlsDrawer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CFXPreviewViewController bottomControlsDrawer](self, "bottomControlsDrawer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXPreviewViewController bottomControlsDrawer](self, "bottomControlsDrawer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraints");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeConstraints:", v11);

      -[CFXPreviewViewController bottomControlsDrawer](self, "bottomControlsDrawer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  _BOOL4 v5;
  objc_super v6;
  CGRect v7;

  v6.receiver = self;
  v6.super_class = (Class)CFXPreviewViewController;
  -[CFXPreviewViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[CFXPreviewViewController bottomControlsDrawer](self, "bottomControlsDrawer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v5 = CGRectEqualToRect(v7, *MEMORY[0x24BDBF090]);

  if (v5)
    -[CFXPreviewViewController configureBottomControlsForOrientation](self, "configureBottomControlsForOrientation");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CFXPreviewViewController;
  -[CFXPreviewViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pause");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("kJFXOrientationMonitorInterfaceOrientationNotification"), 0);

}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "destinationViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v14, "destinationViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXPreviewViewController setPreviewPlayer:](self, "setPreviewPlayer:", v7);

    -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDisplayName:", CFSTR("CFXPreviewPlayer"));

    -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setParentCode:", 301);

    -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", self);

  }
  objc_msgSend(v14, "destinationViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v12 = objc_opt_isKindOfClass();

  if ((v12 & 1) != 0)
  {
    objc_msgSend(v14, "destinationViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXPreviewViewController setPreviewControls:](self, "setPreviewControls:", v13);

  }
}

- (UIView)effectsPickerDrawer
{
  void *v3;
  void *v4;

  -[CFXPreviewViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CFXPreviewViewController previewControls](self, "previewControls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectsPickerDrawer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v4;
}

- (void)setEffectsPickerDrawer:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[CFXPreviewViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CFXPreviewViewController setBottomControlsDrawer:](self, "setBottomControlsDrawer:", v13);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5)
  {
    -[CFXPreviewViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v13);
  }
  else
  {
    -[CFXPreviewViewController mediaItem](self, "mediaItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clip");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isStill");

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXPreviewViewController bottomControlsDrawer](self, "bottomControlsDrawer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBackgroundColor:", v10);

    }
    -[CFXPreviewViewController appStripAndPreviewControlsContainer](self, "appStripAndPreviewControlsContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXPreviewViewController previewControlsContainerView](self, "previewControlsContainerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertSubview:belowSubview:", v13, v12);

  }
}

- (void)setPresentingFilterPicker:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_presentingFilterPicker != a3)
  {
    v3 = a3;
    self->_presentingFilterPicker = a3;
    if (a3)
    {
      -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pause");

    }
    -[CFXPreviewViewController setPlayButtonHiddenIfPossible:](self, "setPlayButtonHiddenIfPossible:", v3);
  }
}

- (CFXClip)previewClip
{
  void *v2;
  void *v3;

  -[CFXPreviewViewController mediaItem](self, "mediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CFXClip *)v3;
}

- (BOOL)shouldExportOnly
{
  if (shouldExportOnly_onceToken != -1)
    dispatch_once(&shouldExportOnly_onceToken, &__block_literal_global_31);
  return shouldExportOnly_shouldExportOnly;
}

void __44__CFXPreviewViewController_shouldExportOnly__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  shouldExportOnly_shouldExportOnly = objc_msgSend(v0, "BOOLForKey:", CFSTR("funCameraShouldExportOnly"));

}

+ (id)liveCaptureSnapshotView
{
  return (id)s_LiveCaptureSnapshotView;
}

+ (void)setLiveCaptureSnapshotView:(id)a3
{
  objc_storeStrong((id *)&s_LiveCaptureSnapshotView, a3);
}

- (CFXEffectBrowserContentPresenterViewController)effectBrowserContentPresenterViewController
{
  CFXEffectBrowserContentPresenterViewController *effectBrowserContentPresenterViewController;
  CFXEffectBrowserContentPresenterViewController *v4;
  CFXEffectBrowserContentPresenterViewController *v5;

  effectBrowserContentPresenterViewController = self->_effectBrowserContentPresenterViewController;
  if (!effectBrowserContentPresenterViewController)
  {
    v4 = (CFXEffectBrowserContentPresenterViewController *)objc_opt_new();
    v5 = self->_effectBrowserContentPresenterViewController;
    self->_effectBrowserContentPresenterViewController = v4;

    effectBrowserContentPresenterViewController = self->_effectBrowserContentPresenterViewController;
  }
  return effectBrowserContentPresenterViewController;
}

- (void)exportButtonTapped:(id)a3
{
  -[CFXPreviewViewController exportMediaItemToFileURL:](self, "exportMediaItemToFileURL:", 0);
}

- (void)playbackSliderValueChanged:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  id v9;

  v4 = a3;
  -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (float)(int)objc_msgSend(v5, "duration");
  objc_msgSend(v4, "value");
  v8 = v7;

  -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "seekToTime:", (int)(float)(v8 * v6));

}

- (void)CFX_prepareFaceTrackingDataForOverlayInsertionWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);
  _QWORD v16[3];

  v4 = (void (**)(_QWORD))a3;
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mostRecentARMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "faceAnchor");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hasValidFaceData");

    if (v10)
    {
      v4[2](v4);
      goto LABEL_9;
    }
  }
  else
  {

  }
  -[CFXPreviewViewController previewClip](self, "previewClip");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "currentCMTime");
  else
    memset(v16, 0, sizeof(v16));
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __89__CFXPreviewViewController_CFX_prepareFaceTrackingDataForOverlayInsertionWithCompletion___block_invoke;
  v14[3] = &unk_24EE59498;
  v15 = v4;
  +[JFXFaceTrackingPlaybackUtilities arDataForPlaybackElement:atPlaybackTime:completion:](JFXFaceTrackingPlaybackUtilities, "arDataForPlaybackElement:atPlaybackTime:completion:", v11, v16, v14);

LABEL_9:
}

void __89__CFXPreviewViewController_CFX_prepareFaceTrackingDataForOverlayInsertionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD block[4];
  id v8;

  v3 = a2;
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMostRecentARMetadata:", v3);

  objc_msgSend(v3, "faceAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHasValidFaceData:", v5 != 0);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__CFXPreviewViewController_CFX_prepareFaceTrackingDataForOverlayInsertionWithCompletion___block_invoke_2;
  block[3] = &unk_24EE580C8;
  v8 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __89__CFXPreviewViewController_CFX_prepareFaceTrackingDataForOverlayInsertionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addEffect:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  JFXLog_effects();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "jtEffect");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromJFXEffectType(objc_msgSend(v9, "type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v10;
    v29 = 2114;
    v30 = v11;
    _os_log_impl(&dword_2269A9000, v8, OS_LOG_TYPE_DEFAULT, "Adding effect - type: %{public}@, name: %{public}@", buf, 0x16u);

  }
  objc_msgSend(v6, "jtEffect");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "type");

  if (v13 == 2)
  {
    objc_msgSend(v6, "jtEffect");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __49__CFXPreviewViewController_addEffect_completion___block_invoke;
    v23[3] = &unk_24EE594E8;
    v23[4] = self;
    v24 = v14;
    v25 = v6;
    v26 = v7;
    v15 = v7;
    v16 = v6;
    v17 = v14;
    -[CFXPreviewViewController CFX_prepareFaceTrackingDataForOverlayInsertionWithCompletion:](self, "CFX_prepareFaceTrackingDataForOverlayInsertionWithCompletion:", v23);

  }
  else
  {
    -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pause");

    objc_msgSend(v6, "jtEffect");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __49__CFXPreviewViewController_addEffect_completion___block_invoke_3;
    v20[3] = &unk_24EE59510;
    v20[4] = self;
    v21 = v6;
    v22 = v7;
    v16 = v7;
    v17 = v6;
    objc_msgSend(v19, "loadRenderEffectInBackgroundWithCompletionOnMainQueue:", v20);

  }
}

void __49__CFXPreviewViewController_addEffect_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  char v16;

  v2 = 0x3FD6666666666666;
  if (!objc_msgSend(*(id *)(a1 + 32), "CFX_canApplyFaceTracking"))
    goto LABEL_5;
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mostRecentARMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "faceAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {

LABEL_5:
    v6 = 0;
    v4 = 0;
    goto LABEL_6;
  }
  v6 = 1;
  v2 = 0x3FE399999999999ALL;
LABEL_6:
  v7 = *(void **)(a1 + 40);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__CFXPreviewViewController_addEffect_completion___block_invoke_2;
  v9[3] = &unk_24EE594C0;
  v15 = v2;
  v16 = v6;
  v10 = v7;
  v11 = v4;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v8 = v4;
  objc_msgSend(v10, "loadRenderEffectInBackgroundWithCompletionOnMainQueue:", v9);

}

uint64_t __49__CFXPreviewViewController_addEffect_completion___block_invoke_2(uint64_t a1)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  uint64_t result;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  unsigned int v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v2 = *(double *)(a1 + 72);
  v3 = *(unsigned __int8 *)(a1 + 80);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "previewClip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "playableMediaContentMode");
  objc_msgSend(*(id *)(a1 + 48), "previewClip");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "mediaInterfaceOrientationForDisplay");
  v30 = *MEMORY[0x24BDC0D88];
  v27 = v30;
  *(_QWORD *)&v31 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  v10 = v31;
  +[JFXEffectEditingUtilities nextNormalizedInsertionPointForOverlay:scaleRelativeToCenterSquare:atTime:applyTracking:withARMetadata:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:](JFXEffectEditingUtilities, "nextNormalizedInsertionPointForOverlay:scaleRelativeToCenterSquare:atTime:applyTracking:withARMetadata:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:", v4, &v30, v3, v5, 0, v7, v2, v9);
  v12 = v11;
  v14 = v13;

  v15 = *(double *)(a1 + 72);
  v29 = *(unsigned __int8 *)(a1 + 80);
  v16 = *(_QWORD *)(a1 + 40);
  v28 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "previewClip");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v17, "playableMediaContentMode");
  objc_msgSend(*(id *)(a1 + 48), "previewClip");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "mediaInterfaceOrientationForDisplay");
  objc_msgSend(*(id *)(a1 + 48), "previewClip");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "playableAspectRatio");
  objc_msgSend(*(id *)(a1 + 48), "previewClip");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "playableAspectRatioPreservationMode");
  v33 = v27;
  v34 = v10;
  v24 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v30 = *MEMORY[0x24BDBD8B8];
  v31 = v24;
  v32 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  LODWORD(v26) = v7;
  +[JFXEffectEditingUtilities configureOverlayForInsertion:atNormalizedPoint:atTime:isPositionRelativeToCenterSquare:isPositionRelativeToFace:scaleRelativeToCenterSquare:rotationAngle:applyTracking:autoDetectTrackingType:withARMetadata:previewViewCorrectionTransform:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:](JFXEffectEditingUtilities, "configureOverlayForInsertion:atNormalizedPoint:atTime:isPositionRelativeToCenterSquare:isPositionRelativeToFace:scaleRelativeToCenterSquare:rotationAngle:applyTracking:autoDetectTrackingType:withARMetadata:previewViewCorrectionTransform:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", v28, &v33, 1, 1, v29, 0, v12, v14, v15, 0.0, v16, &v30, 0, v26,
    v19,
    v21,
    v23);

  objc_msgSend(*(id *)(a1 + 48), "CFX_addEffect:", *(_QWORD *)(a1 + 56));
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __49__CFXPreviewViewController_addEffect_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "CFX_addEffect:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)normalizedMinimumHitTestArea
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[CFXPreviewViewController playerContainerView](self, "playerContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;

  v7 = 44.0 / v4;
  v8 = 44.0 / v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (void)addOverlayEffect:(id)a3 atScreenLocation:(CGPoint)a4 atScreenSize:(CGSize)a5 rotationAngle:(double)a6 completion:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  double v62;
  uint64_t v63;
  CGPoint v64;
  CGSize v65;

  height = a5.height;
  width = a5.width;
  y = a4.y;
  x = a4.x;
  v63 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a7;
  JFXLog_effects();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v14, "jtEffect");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromJFXEffectType(objc_msgSend(v17, "type"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v64.x = x;
    v64.y = y;
    NSStringFromCGPoint(v64);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v65.width = width;
    v65.height = height;
    NSStringFromCGSize(v65);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v54 = v18;
    v55 = 2114;
    v56 = v19;
    v57 = 2114;
    v58 = v20;
    v59 = 2114;
    v60 = v21;
    v61 = 2048;
    v62 = a6;
    _os_log_impl(&dword_2269A9000, v16, OS_LOG_TYPE_DEFAULT, "Adding effect - type: %{public}@, name: %{public}@, screenLocation: %{public}@, screenSize: %{public}@, rotationAngle: %f", buf, 0x34u);

  }
  -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "pause");

  -[CFXPreviewViewController playerContainerView](self, "playerContainerView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "convertPoint:fromView:", 0, x, y);
  v25 = v24;
  objc_msgSend(v23, "frame");
  v27 = v25 / v26;
  objc_msgSend(v23, "convertSize:fromView:", 0, width, height);
  v29 = v28;
  v31 = v30;
  +[JFXMediaSettings renderSize](JFXMediaSettings, "renderSize");
  v33 = v32;
  v35 = v34;
  objc_msgSend(v23, "frame");
  v37 = v33 * (v29 / v36);
  objc_msgSend(v23, "frame");
  v39 = CGRectMakeWithSizeAndCenterPoint(v37, v35 * (v31 / v38), v27 * v33);
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __100__CFXPreviewViewController_addOverlayEffect_atScreenLocation_atScreenSize_rotationAngle_completion___block_invoke;
  v45[3] = &unk_24EE59560;
  v45[4] = self;
  v46 = v14;
  v48 = v39;
  v49 = v40;
  v50 = v41;
  v51 = v42;
  v52 = a6;
  v47 = v15;
  v43 = v15;
  v44 = v14;
  -[CFXPreviewViewController CFX_prepareFaceTrackingDataForOverlayInsertionWithCompletion:](self, "CFX_prepareFaceTrackingDataForOverlayInsertionWithCompletion:", v45);

}

void __100__CFXPreviewViewController_addOverlayEffect_atScreenLocation_atScreenSize_rotationAngle_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  void *v6;
  __int128 v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  BOOL v20;

  if (objc_msgSend(*(id *)(a1 + 32), "CFX_canApplyFaceTracking"))
  {
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "mostRecentARMetadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "faceAnchor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

    if (v4)
      v4 = v3;

  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "jtEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __100__CFXPreviewViewController_addOverlayEffect_atScreenLocation_atScreenSize_rotationAngle_completion___block_invoke_2;
  v11[3] = &unk_24EE59538;
  v7 = *(_OWORD *)(a1 + 72);
  v17 = *(_OWORD *)(a1 + 56);
  v18 = v7;
  v19 = *(_QWORD *)(a1 + 88);
  v20 = v5;
  v12 = v6;
  v13 = v4;
  v8 = *(void **)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v16 = *(id *)(a1 + 48);
  v9 = v4;
  v10 = v6;
  objc_msgSend(v10, "loadRenderEffectInBackgroundWithCompletionOnMainQueue:", v11);

}

uint64_t __100__CFXPreviewViewController_addOverlayEffect_atScreenLocation_atScreenSize_rotationAngle_completion___block_invoke_2(uint64_t a1)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  uint64_t result;
  uint64_t v19;
  unsigned int v20;
  _OWORD v21[3];
  __int128 v22;
  uint64_t v23;

  v2 = *(double *)(a1 + 104);
  v20 = *(unsigned __int8 *)(a1 + 112);
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "previewClip");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "playableMediaContentMode");
  objc_msgSend(*(id *)(a1 + 48), "previewClip");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mediaInterfaceOrientationForDisplay");
  objc_msgSend(*(id *)(a1 + 48), "previewClip");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "playableAspectRatio");
  objc_msgSend(*(id *)(a1 + 48), "previewClip");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "playableAspectRatioPreservationMode");
  v13 = *(double *)(a1 + 72);
  v14 = *(double *)(a1 + 80);
  v15 = *(double *)(a1 + 88);
  v16 = *(double *)(a1 + 96);
  v22 = *MEMORY[0x24BDC0D88];
  v23 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  v17 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v21[0] = *MEMORY[0x24BDBD8B8];
  v21[1] = v17;
  v21[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  LODWORD(v19) = v6;
  +[JFXEffectEditingUtilities configureOverlayForInsertion:inRect:atTime:rotationAngle:applyTracking:autoDetectTrackingType:withARMetadata:previewViewCorrectionTransform:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:](JFXEffectEditingUtilities, "configureOverlayForInsertion:inRect:atTime:rotationAngle:applyTracking:autoDetectTrackingType:withARMetadata:previewViewCorrectionTransform:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", v4, &v22, v20, 1, v3, v21, v13, v14, v15, v16, v2, 0, v19, v8, v10,
    v12);

  objc_msgSend(*(id *)(a1 + 48), "CFX_addEffect:", *(_QWORD *)(a1 + 56));
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)CFX_addEffect:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  _BYTE v27[22];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CFXPreviewViewController removeEffectEditor](self, "removeEffectEditor");
  objc_msgSend(v4, "jtEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");
  if (v6 == 7)
  {
    -[CFXPreviewViewController previewClip](self, "previewClip");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 7;
  }
  else
  {
    if (v6 != 1)
      goto LABEL_6;
    -[CFXPreviewViewController previewClip](self, "previewClip");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 1;
  }
  objc_msgSend(v7, "removeAllEffectsOfType:", v9);

LABEL_6:
  if (+[JFXEffectEditingUtilities canEditTextForEffect:](JFXEffectEditingUtilities, "canEditTextForEffect:", v5))
  {
    objc_msgSend(v4, "jtEffect");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);

  }
  if ((objc_msgSend(v5, "isNone") & 1) == 0)
  {
    -[CFXPreviewViewController previewClip](self, "previewClip");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addEffect:", v5);

    JFXLog_effects();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromJFXEffectType(objc_msgSend(v5, "type"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedTitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v27 = 138543618;
      *(_QWORD *)&v27[4] = v13;
      *(_WORD *)&v27[12] = 2114;
      *(_QWORD *)&v27[14] = v14;
      _os_log_impl(&dword_2269A9000, v12, OS_LOG_TYPE_DEFAULT, "Added effect - type: %{public}@, name: %{public}@", v27, 0x16u);

    }
  }
  -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateCompositionForEffectChange");

  objc_msgSend(v4, "localizedTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v5, "type");
  switch(v17)
  {
    case 1:
      JFXLog_automation();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v27 = 138412290;
        *(_QWORD *)&v27[4] = v16;
        v21 = "Element Added: Filter - %@";
        goto LABEL_26;
      }
      break;
    case 7:
      JFXLog_automation();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v27 = 138412290;
        *(_QWORD *)&v27[4] = v16;
        v21 = "Element Added: Animoji - %@";
        goto LABEL_26;
      }
      break;
    case 2:
      if (+[JFXEffectEditingUtilities canEditTextForEffect:](JFXEffectEditingUtilities, "canEditTextForEffect:", v5)&& !-[CFXPreviewViewController presentFullScreenTextEditorForEffect:insertingEffect:](self, "presentFullScreenTextEditorForEffect:insertingEffect:", v5, 1))
      {
        JFXLog_DebugViewerUI();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[CFXPreviewViewController CFX_addEffect:].cold.1();

        -[CFXPreviewViewController previewClip](self, "previewClip");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "removeEffect:", v5);

      }
      JFXLog_automation();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v27 = 138412290;
        *(_QWORD *)&v27[4] = v16;
        v21 = "Element Added: Overlay - %@";
LABEL_26:
        _os_log_impl(&dword_2269A9000, v20, OS_LOG_TYPE_DEFAULT, v21, v27, 0xCu);
      }
      break;
    default:
      goto LABEL_28;
  }

LABEL_28:
  +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance", *(_OWORD *)v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trackEffect:", v4);

  CFXLog_action();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    -[CFXPreviewViewController previewClip](self, "previewClip");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "effectStack");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[CFXActionLogging actionLogAsJSONForEvent:atLocation:withEffectStack:](CFXActionLogging, "actionLogAsJSONForEvent:atLocation:withEffectStack:", CFSTR("effect added"), CFSTR("post-capture"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v27 = 138543362;
    *(_QWORD *)&v27[4] = v26;
    _os_log_impl(&dword_2269A9000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@", v27, 0xCu);

  }
}

- (void)filterPickerPreviewBackgroundImageAtSizeInPixels:(CGSize)a3 completion:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  void *v8;
  int64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  CGFloat v15;
  CGFloat v16;
  CMTime v17;
  CMTime v18;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  memset(&v18, 0, sizeof(v18));
  -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (int)objc_msgSend(v8, "currentTime");
  -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeMake(&v18, v9, objc_msgSend(v10, "frameRate"));

  dispatch_get_global_queue(21, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __88__CFXPreviewViewController_filterPickerPreviewBackgroundImageAtSizeInPixels_completion___block_invoke;
  v13[3] = &unk_24EE595B0;
  v17 = v18;
  v15 = width;
  v16 = height;
  v13[4] = self;
  v14 = v7;
  v12 = v7;
  dispatch_async(v11, v13);

}

void __88__CFXPreviewViewController_filterPickerPreviewBackgroundImageAtSizeInPixels_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  JFXComposition *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  CFXExportClipDataSource *v19;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;

  objc_msgSend(*(id *)(a1 + 32), "previewClip");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  objc_msgSend(v3, "removeAllEffects");
  objc_msgSend(*(id *)(a1 + 32), "previewClip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectsOfType:", 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "addEffect:", v7);

  }
  v19 = -[CFXExportClipDataSource initWithClip:]([CFXExportClipDataSource alloc], "initWithClip:", v3);
  v8 = -[JFXComposition initWithClipsDataSource:]([JFXComposition alloc], "initWithClipsDataSource:", v19);
  -[JFXComposition setParentCode:](v8, "setParentCode:", 303);
  -[CFXExportClipDataSource renderSize](v19, "renderSize");
  -[JFXComposition setViewSize:](v8, "setViewSize:");
  -[JFXComposition playerItem](v8, "playerItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXComposition applyPlayerItemProperties](v8, "applyPlayerItemProperties");
  objc_msgSend(v9, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB23B0]), "initWithAsset:", v10);
  objc_msgSend(v9, "videoComposition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setVideoComposition:", v12);

  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v26 = *(_OWORD *)(a1 + 64);
  v27 = *(_QWORD *)(a1 + 80);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTime:", &v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v14);
  objc_msgSend(v11, "setMaximumSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend(v11, "setAppliesPreferredTrackTransform:", 1);
  v24 = *MEMORY[0x24BDC0D88];
  v18 = v24;
  v15 = v3;
  v16 = v6;
  v25 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  v17 = v25;
  objc_msgSend(v11, "setRequestedTimeToleranceBefore:", &v24);
  v22 = v18;
  v23 = v17;
  objc_msgSend(v11, "setRequestedTimeToleranceAfter:", &v22);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __88__CFXPreviewViewController_filterPickerPreviewBackgroundImageAtSizeInPixels_completion___block_invoke_2;
  v20[3] = &unk_24EE59588;
  v21 = *(id *)(a1 + 40);
  objc_msgSend(v11, "generateCGImagesAsynchronouslyForTimes:completionHandler:", v13, v20);

}

void __88__CFXPreviewViewController_filterPickerPreviewBackgroundImageAtSizeInPixels_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;

  v8 = a6;
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __88__CFXPreviewViewController_filterPickerPreviewBackgroundImageAtSizeInPixels_completion___block_invoke_4;
    v12[3] = &unk_24EE58FF0;
    v10 = *(id *)(a1 + 32);
    v13 = v9;
    v14 = v10;
    v11 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], v12);

  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __88__CFXPreviewViewController_filterPickerPreviewBackgroundImageAtSizeInPixels_completion___block_invoke_3;
    block[3] = &unk_24EE58FF0;
    v17 = *(id *)(a1 + 32);
    v16 = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v11 = v17;
  }

}

uint64_t __88__CFXPreviewViewController_filterPickerPreviewBackgroundImageAtSizeInPixels_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __88__CFXPreviewViewController_filterPickerPreviewBackgroundImageAtSizeInPixels_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)CFX_exportPhotoWithEffects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  JFXEffectsPreviewGenerator *v7;
  void *v8;
  JFXEffectsPreviewGenerator *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  CFXPreviewViewController *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  -[CFXPreviewViewController mediaItem](self, "mediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originalAssetURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CFXPreviewViewController previewClip](self, "previewClip");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [JFXEffectsPreviewGenerator alloc];
  v17 = *MEMORY[0x24BE79648];
  v18[0] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[JFXEffectsPreviewGenerator initWithRendererOptions:](v7, "initWithRendererOptions:", v8);

  -[CFXPreviewViewController setStillImagePreviewGenerator:](self, "setStillImagePreviewGenerator:", v9);
  dispatch_get_global_queue(21, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke;
  v13[3] = &unk_24EE585C0;
  v14 = v4;
  v15 = v6;
  v16 = self;
  v11 = v6;
  v12 = v4;
  dispatch_async(v10, v13);

}

void __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  JFXEffectsPreviewGenerationRequest *v19;
  JFXEffectsPreviewGenerationRequest *v20;
  JFXEffectsPreviewGenerationRequest *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  JFXAnimojiEffectRenderer *v45;
  JFXAnimojiEffectRenderer *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  __int128 v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _QWORD v71[5];
  id v72;
  _QWORD v73[2];
  _QWORD v74[6];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  _QWORD v83[5];
  _QWORD v84[7];

  v84[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(a1[4], "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "jfx_renderedImageWithUpOrientation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE79030], "imageWithUIImage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(a1[5], "mutableDeepCopy");
  objc_msgSend(v6, "size");
  v9 = v8;
  v11 = v10;
  v82 = 0;
  v80 = 0u;
  v81 = 0u;
  v79 = 0u;
  PVTransformAnimationInfoIdentity();
  objc_msgSend(a1[6], "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "cameraModeUsedForCapture");

  v14 = JFXIsCTMCroppedCameraMode(v13);
  if (v14)
  {
    v15 = 1.77777778;
    if (v9 <= v11)
      v15 = 0.5625;
    if (v13 == 9)
      v15 = 1.0;
    if (v9 / v15 <= v11)
      v16 = v9 / v15;
    else
      v16 = v11;
    v17 = v15 * v16;
    PVTransformAnimationInfoForLiveCapture();
    v79 = v75;
    v80 = v76;
    v81 = v77;
    v82 = v78;
  }
  else
  {
    v17 = v9;
    v16 = v11;
  }
  v18 = MEMORY[0x24BDAC760];
  v74[0] = MEMORY[0x24BDAC760];
  v74[1] = 3221225472;
  v74[2] = __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke_2;
  v74[3] = &__block_descriptor_48_e26_v32__0__JFXEffect_8Q16_B24l;
  *(double *)&v74[4] = v17;
  *(double *)&v74[5] = v16;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v74);
  v19 = [JFXEffectsPreviewGenerationRequest alloc];
  v75 = kDefaultEffectPreviewRenderTime;
  *(_QWORD *)&v76 = 0;
  v20 = -[JFXEffectsPreviewGenerationRequest initWithInput:effectStack:outputSize:renderTime:](v19, "initWithInput:effectStack:outputSize:renderTime:", v6, v7, &v75, v17, v16);
  v21 = v20;
  if (v14)
  {
    v75 = v79;
    v76 = v80;
    v77 = v81;
    v78 = v82;
    -[JFXEffectsPreviewGenerationRequest setTransformAnimationInfo:scaleToOutput:](v20, "setTransformAnimationInfo:scaleToOutput:", &v75, 0);
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "previewClip");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "effectsOfType:", 7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  v26 = 0x24BDBC000;
  if (v25)
  {
    v67 = v22;
    v68 = v7;
    v69 = v6;
    v70 = v5;
    v27 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1[6], "previewClip");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "uuid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("exportPhotoWithEffects_arMetadataMediaReader"), v29);
    v30 = objc_claimAutoreleasedReturnValue();

    +[JFXMediaDataReaderFactory sharedInstance](JFXMediaDataReaderFactory, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "previewClip");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)v30;
    objc_msgSend(v31, "createARMetadataReaderWithCreationAttributesProvider:name:", v32, v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "beginReading");
    v75 = *MEMORY[0x24BDC0D88];
    v63 = v75;
    *(_QWORD *)&v76 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    v34 = v76;
    v65 = v33;
    objc_msgSend(v33, "arMetadataItemForTime:", &v75);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "arMetadata");
    v36 = objc_claimAutoreleasedReturnValue();

    v37 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1[6], "previewClip");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "uuid");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("exportPhotoWithEffects_depthMediaReader"), v39);
    v40 = objc_claimAutoreleasedReturnValue();

    +[JFXMediaDataReaderFactory sharedInstance](JFXMediaDataReaderFactory, "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "previewClip");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)v40;
    objc_msgSend(v41, "createDepthDataReaderWithCreationAttributesProvider:name:", v42, v40);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v43, "beginReading");
    v75 = v63;
    *(_QWORD *)&v76 = v34;
    objc_msgSend(v43, "depthDataForTime:", &v75);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "avDepthData");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_alloc_init(JFXAnimojiEffectRenderer);
    -[JFXAnimojiEffectRenderer setAllowAntialiasing:](v45, "setAllowAntialiasing:", 0);
    v46 = v45;
    objc_msgSend(a1[6], "delegate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "calculateMediaInterfaceOrientationForDisplay");

    +[JFXAnimojiEffectRenderer animojiBufferSizeWithImageSize:interfaceOrientation:](JFXAnimojiEffectRenderer, "animojiBufferSizeWithImageSize:interfaceOrientation:", v48, v9, v11);
    v83[0] = CFSTR("JFXAnimojiRendererMetadata_JFXARMetadata");
    v83[1] = CFSTR("JFXAnimojiRendererMetadata_DepthData");
    v64 = (void *)v36;
    v84[0] = v36;
    v84[1] = v44;
    v83[2] = CFSTR("JFXAnimojiRendererMetadata_RenderSize");
    v73[0] = v49;
    v73[1] = v50;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v73, "{CGSize=dd}");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v84[2] = v51;
    v83[3] = CFSTR("JFXAnimojiRendererMetadata_UIInterfaceOrientation");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v48);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v84[3] = v52;
    v83[4] = CFSTR("JFXAnimojiRendererMetadata_AVCaptureVideoOrientation");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 4);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v84[4] = v53;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v84, v83, 5);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)objc_msgSend(v54, "mutableCopy");

    objc_msgSend(a1[6], "previewClip");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "originalAnimojiDataRepresentation");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
      objc_msgSend(v55, "setObject:forKeyedSubscript:", v57, CFSTR("JFXAnimojiRendererMetadata_DataRepresentation"));
    v58 = +[JFXCustomRenderProperties newCustomRenderProperties:metadata:](JFXCustomRenderProperties, "newCustomRenderProperties:metadata:", v46, v55);
    objc_msgSend(v67, "setObject:forKeyedSubscript:", v58, CFSTR("JFXCustomRenderingPropertiesKey_Animoji"));

    v22 = v67;
    v6 = v69;
    v5 = v70;
    v7 = v68;
    v18 = MEMORY[0x24BDAC760];
    v26 = 0x24BDBC000uLL;
  }
  objc_msgSend(*(id *)(v26 + 3696), "dictionaryWithDictionary:", v22);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXEffectsPreviewGenerationRequest setCustomRenderingProperties:](v21, "setCustomRenderingProperties:", v59);

  -[JFXEffectsPreviewGenerationRequest setHighQuality:](v21, "setHighQuality:", 1);
  objc_msgSend(a1[6], "stillImagePreviewGenerator");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v18;
  v71[1] = 3221225472;
  v71[2] = __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke_3;
  v71[3] = &unk_24EE595F8;
  v71[4] = a1[6];
  v72 = a1[4];
  objc_msgSend(v60, "generatePreviewRequest:completionHandler:", v21, v71);

}

void __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke_2(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  id v4;
  void *v5;
  _OWORD v6[3];

  v2 = *(double *)(a1 + 32);
  v3 = *(double *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setRenderSize:", v2, v3);
  objc_msgSend(v4, "renderEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = kDefaultEffectPreviewAnimationRange;
  v6[1] = xmmword_226AB8860;
  v6[2] = xmmword_226AB8870;
  objc_msgSend(v5, "setEffectRange:", v6);

}

void __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL8 v14;
  CGImageSource *v15;
  const CGImageMetadata *v16;
  CGImageMetadata *MutableCopy;
  char v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;

  objc_msgSend(a2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "uiImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjustedAssetURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v24 = 0;
    +[JFXMediaURLManager photoExportURL:isHEIF:](JFXMediaURLManager, "photoExportURL:isHEIF:", &v24, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v24;
    objc_msgSend(*(id *)(a1 + 32), "mediaItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAdjustedAssetURL:", v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "adjustedAssetURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "pathExtension");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = !-[NSObject caseInsensitiveCompare:](v13, "caseInsensitiveCompare:", CFSTR("heic"))
       || !-[NSObject caseInsensitiveCompare:](v13, "caseInsensitiveCompare:", CFSTR("heif"));
    v15 = CGImageSourceCreateWithURL(*(CFURLRef *)(a1 + 40), 0);
    v16 = CGImageSourceCopyMetadataAtIndex(v15, 0, 0);
    MutableCopy = CGImageMetadataCreateMutableCopy(v16);
    CGImageMetadataRemoveTagWithPath(MutableCopy, 0, CFSTR("tiff:Orientation"));
    if (v16)
      CFRelease(v16);
    if (v15)
      CFRelease(v15);
    v18 = objc_msgSend(*(id *)(a1 + 32), "CFX_saveImageToURL:image:compressionQuality:asHEIF:metadata:", v12, v5, v14, MutableCopy, 1.0);
    if (MutableCopy)
      CFRelease(MutableCopy);
    if ((v18 & 1) == 0)
    {
      JFXLog_export();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke_3_cold_2();

    }
  }
  else
  {
    JFXLog_export();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke_3_cold_1();
  }

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "clear");

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke_71;
  block[3] = &unk_24EE57AA8;
  block[4] = *(_QWORD *)(a1 + 32);
  v23 = v8;
  v21 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke_71(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "CFX_notifyDelegateExportMediaItemFinishedWithError:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllEffects");

  return objc_msgSend(*(id *)(a1 + 32), "setStillImagePreviewGenerator:", 0);
}

- (BOOL)CFX_saveImageToURL:(id)a3 image:(id)a4 compressionQuality:(double)a5 asHEIF:(BOOL)a6 metadata:(CGImageMetadata *)a7
{
  _BOOL4 v8;
  id v11;
  CFStringRef *v12;
  CGImageDestinationRef v13;
  CGImageDestination *v14;
  void *v15;
  const __CFDictionary *v16;
  CGImage *v17;
  BOOL v18;
  uint64_t v20;
  _QWORD v21[2];

  v8 = a6;
  v21[1] = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = (CFStringRef *)MEMORY[0x24BDB1C18];
  if (!v8)
    v12 = (CFStringRef *)MEMORY[0x24BDB1C28];
  v13 = CGImageDestinationCreateWithURL((CFURLRef)a3, *v12, 1uLL, 0);
  if (v13)
  {
    v14 = v13;
    v20 = *MEMORY[0x24BDD9220];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v17 = (CGImage *)objc_msgSend(objc_retainAutorelease(v11), "CGImage");
    if (a7)
      CGImageDestinationAddImageAndMetadata(v14, v17, a7, v16);
    else
      CGImageDestinationAddImage(v14, v17, v16);
    v18 = CGImageDestinationFinalize(v14);
    CFRelease(v14);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)exportMediaItemToFileURL:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__CFXPreviewViewController_exportMediaItemToFileURL___block_invoke;
  v6[3] = &unk_24EE57AA8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __53__CFXPreviewViewController_exportMediaItemToFileURL___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 0);

  objc_msgSend(*(id *)(a1 + 32), "previewPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__CFXPreviewViewController_exportMediaItemToFileURL___block_invoke_2;
  v5[3] = &unk_24EE57AA8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "pauseWithCompletionBlock:", v5);

}

void __53__CFXPreviewViewController_exportMediaItemToFileURL___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __53__CFXPreviewViewController_exportMediaItemToFileURL___block_invoke_3;
  v2[3] = &unk_24EE57AA8;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

}

void __53__CFXPreviewViewController_exportMediaItemToFileURL___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CFXExportClipDataSource *v11;
  void *v12;
  void *v13;
  JFXCompositionExporter *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x2276A1DB0]();
  objc_msgSend(*(id *)(a1 + 32), "previewPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didReceiveMemoryWarning");

  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "previewClip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isStill");
  objc_msgSend(*(id *)(a1 + 32), "setSaveMediaItemToFunCamPhotosAlbumUponExport:", *(_QWORD *)(a1 + 40) == 0);
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAdjustedAssetURL:", v6);

  objc_msgSend(*(id *)(a1 + 32), "CFX_setIsExporting:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setPlayButtonHiddenIfPossible:", 1);
  objc_msgSend(*(id *)(a1 + 32), "CFX_setEffectAnimationsEnabledIfPossible:updatePlayer:", 1, 0);
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldExportOnly") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v9, "mediaItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "previewViewController:didStartExportingMediaItem:", v9, v10);

  }
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "CFX_exportPhotoWithEffects");
    CFXLog_action();
    v11 = (CFXExportClipDataSource *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "effectStack");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[CFXActionLogging actionLogAsJSONForEvent:atLocation:withEffectStack:](CFXActionLogging, "actionLogAsJSONForEvent:atLocation:withEffectStack:", CFSTR("exported still"), CFSTR("post-capture"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v13;
      _os_log_impl(&dword_2269A9000, &v11->super, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

    }
  }
  else
  {
    v11 = -[CFXExportClipDataSource initWithClip:]([CFXExportClipDataSource alloc], "initWithClip:", v4);
    v14 = -[JFXCompositionExporter initWithClipsDataSource:]([JFXCompositionExporter alloc], "initWithClipsDataSource:", v11);
    objc_msgSend(*(id *)(a1 + 32), "setExporter:", v14);

    v15 = *(void **)(a1 + 32);
    objc_msgSend(v15, "exporter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:", v15);

    objc_msgSend(*(id *)(a1 + 32), "mediaItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "adjustedAssetURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v35 = 0;
      +[JFXMediaURLManager videoExportURL:](JFXMediaURLManager, "videoExportURL:", &v35);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v35;
      objc_msgSend(*(id *)(a1 + 32), "mediaItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setAdjustedAssetURL:", v19);

    }
    objc_msgSend(v4, "mediaItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "colorSpace");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "CFX_AVAssetExportPresetWithColorSpace:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "mediaItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "adjustedAssetURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "exporter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "startWithPresets:toFilePath:poster:", v29, v27, 0);

    CFXLog_action();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "effectStack");
      v34 = v23;
      v31 = v22;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[CFXActionLogging actionLogAsJSONForEvent:atLocation:withEffectStack:](CFXActionLogging, "actionLogAsJSONForEvent:atLocation:withEffectStack:", CFSTR("exported video"), CFSTR("post-capture"), v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v33;
      _os_log_impl(&dword_2269A9000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

      v22 = v31;
      v23 = v34;

    }
  }

}

- (id)CFX_AVAssetExportPresetWithColorSpace:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  int v15;
  int v16;
  BOOL v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;

  v3 = a3;
  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frameSize");
  v6 = v5;
  v8 = v7;

  v9 = (int)v6;
  objc_msgSend(MEMORY[0x24BE14A80], "preferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "usingMostCompatibleEncoding");

  v12 = objc_msgSend(v3, "isHDRSpace");
  v13 = objc_msgSend(v3, "isWideGamutSpace");

  objc_msgSend(MEMORY[0x24BE14A28], "capabilities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isHEVCEncodingSupported");

  v16 = v12 | ~v11 | v13;
  v17 = (v16 & v15) == 0;
  if ((v16 & v15) != 0)
    v18 = JFXAssetExportPresetHEVC1920x1080;
  else
    v18 = (__CFString *)*MEMORY[0x24BDB1958];
  v19 = JFXAssetExportPresetHEVC1280x720;
  if (v17)
    v19 = (__CFString *)*MEMORY[0x24BDB1950];
  if (v12)
    v18 = JFXAssetExportPresetHEVC1920x1080HDR;
  v20 = JFXAssetExportPresetHEVC1280x720HDR;
  if (!v12)
    v20 = v19;
  if ((uint64_t)(v9 | ((unint64_t)(int)v8 << 32)) <= 0x500FFFFFFFFLL && (int)v9 <= 1280)
    v18 = v20;
  return v18;
}

- (void)playbackDidStart:(id)a3
{
  double v4;
  _QWORD v5[5];
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__CFXPreviewViewController_playbackDidStart___block_invoke;
  v6[3] = &unk_24EE57B60;
  v6[4] = self;
  v4 = *MEMORY[0x24BDF7BD8];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__CFXPreviewViewController_playbackDidStart___block_invoke_2;
  v5[3] = &unk_24EE59620;
  v5[4] = self;
  +[JTAnimation performAnimation:duration:completion:](JTAnimation, "performAnimation:duration:completion:", v6, v5, v4);
  -[CFXPreviewViewController CFX_hidePreviewUI](self, "CFX_hidePreviewUI");
}

void __45__CFXPreviewViewController_playbackDidStart___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "playButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __45__CFXPreviewViewController_playbackDidStart___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "playButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notifyPlaybackDidStart");

}

- (void)playbackTimeDidChange:(id)a3 currentTime:(int)a4
{
  float v5;
  double v6;
  id v7;

  v5 = (double)a4 / (double)(int)objc_msgSend(a3, "duration");
  -[CFXPreviewViewController playbackSlider](self, "playbackSlider");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = v5;
  objc_msgSend(v7, "setValue:", v6);

}

- (void)playbackDidStop:(id)a3 currentTime:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v11[5];

  v6 = a3;
  -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clip");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "duration");

  if (v9 <= a4)
    objc_msgSend(v6, "seekToTime:", 0);
  -[CFXPreviewViewController setEffectAnimationsEnabledIfPossible:](self, "setEffectAnimationsEnabledIfPossible:", 0);
  -[CFXPreviewViewController playButton](self, "playButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notifyPlaybackDidStop");

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__CFXPreviewViewController_playbackDidStop_currentTime___block_invoke;
  v11[3] = &unk_24EE57B60;
  v11[4] = self;
  +[JTAnimation performAnimation:duration:completion:](JTAnimation, "performAnimation:duration:completion:", v11, 0, *MEMORY[0x24BDF7BD8]);
  -[CFXPreviewViewController CFX_showPreviewUI](self, "CFX_showPreviewUI");

}

void __56__CFXPreviewViewController_playbackDidStop_currentTime___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "playButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)playbackAreaTapped:(id)a3 normalizedClipPoint:(CGPoint)a4 normalizedMinimumSize:(id)a5 atTime:(int)a6
{
  double var1;
  double var0;
  double y;
  double x;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  uint64_t v20;

  var1 = a5.var1;
  var0 = a5.var0;
  y = a4.y;
  x = a4.x;
  -[CFXPreviewViewController previewClip](self, "previewClip", a3, *(_QWORD *)&a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "effectsOfType:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isPlaying");

  if ((v14 & 1) != 0
    || (v19 = *MEMORY[0x24BDC0D88],
        v20 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16),
        +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:", v12, &v19, 1, x, y, var0, var1), (v15 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[CFXPreviewViewController delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "selectedAppIdentifierForPreviewViewController:", self);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      -[CFXPreviewViewController CFX_togglePreviewUI](self, "CFX_togglePreviewUI");
  }
  else
  {
    v16 = (void *)v15;
    -[CFXPreviewViewController displayEffectEditorForEffect:forMode:](self, "displayEffectEditorForEffect:forMode:", v15, 0);

  }
}

- (void)playbackAreaPanned:(id)a3 gesture:(id)a4 normalizedClipPoint:(CGPoint)a5 normalizedMinimumSize:(id)a6 translationDelta:(CGPoint)a7 atTime:(int)a8 timeScale:(int)a9
{
  double var1;
  double var0;
  double y;
  double x;
  id v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  _BOOL4 v30;
  NSObject *v31;
  void *v32;
  unint64_t v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  unint64_t v37;
  NSObject *v38;
  void *v39;
  __int128 v40;
  uint64_t v41;

  var1 = a6.var1;
  var0 = a6.var0;
  y = a5.y;
  x = a5.x;
  v14 = a4;
  -[CFXPreviewViewController previewClip](self, "previewClip");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_43;
  if (objc_msgSend(v14, "state") == 1)
  {
    -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isPlaying");

    if ((v17 & 1) != 0)
      goto LABEL_43;
  }
  v18 = objc_msgSend(v14, "state");
  if ((unint64_t)(v18 - 3) < 2)
  {
    if ((-[CFXPreviewViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") & 1) != 0
      && -[CFXPreviewViewController isEditingEffect](self, "isEditingEffect"))
    {
      CFXLog_DebugEffectEditingUI();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        -[CFXPreviewViewController playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:].cold.8();

      -[CFXPreviewViewController effectEditor](self, "effectEditor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handlePanGesture:", v14);

      v33 = -[CFXPreviewViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") & 0xFFFFFFFFFFFFFFFELL;
      -[CFXPreviewViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v33);
      -[CFXPreviewViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v33);
      if (!-[CFXPreviewViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures"))
      {
        CFXLog_DebugEffectEditingUI();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          -[CFXPreviewViewController playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:].cold.7();

        -[CFXPreviewViewController removeEffectEditor](self, "removeEffectEditor");
      }
    }
  }
  else
  {
    if (v18 != 2)
    {
      if (v18 != 1)
        goto LABEL_43;
      CFXLog_DebugEffectEditingUI();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[CFXPreviewViewController playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:].cold.5();

      if (-[CFXPreviewViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures"))
      {
        -[CFXPreviewViewController effectEditor](self, "effectEditor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "editEffect");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "jtEffect");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        CFXLog_DebugEffectEditingUI();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);

        if (v24)
        {
          CFXLog_DebugEffectEditingUI();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            -[CFXPreviewViewController playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:].cold.4();

        }
        if (v22)
          goto LABEL_36;
      }
      -[CFXPreviewViewController previewClip](self, "previewClip");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "effectsOfType:", 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = *MEMORY[0x24BDC0D88];
      v41 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:", v27, &v40, 1, x, y, var0, var1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      CFXLog_DebugEffectEditingUI();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
      v30 = v29;
      if (v22)
      {

        if (!v30)
        {
LABEL_35:

LABEL_36:
          if (objc_msgSend(v22, "type") == 2)
          {
            v37 = -[CFXPreviewViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") | 1;
            -[CFXPreviewViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v37);
            -[CFXPreviewViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v37);
            if (!-[CFXPreviewViewController isEditingEffect](self, "isEditingEffect"))
              -[CFXPreviewViewController displayEffectEditorForEffect:forMode:](self, "displayEffectEditorForEffect:forMode:", v22, 1);
            CFXLog_DebugEffectEditingUI();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              -[CFXPreviewViewController playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:].cold.1();

            -[CFXPreviewViewController effectEditor](self, "effectEditor");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "handlePanGesture:", v14);

          }
          goto LABEL_43;
        }
        CFXLog_DebugEffectEditingUI();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          -[CFXPreviewViewController playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:].cold.3();
      }
      else if (v29)
      {
        -[CFXPreviewViewController playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:].cold.2();
      }

      goto LABEL_35;
    }
    if ((-[CFXPreviewViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") & 1) != 0
      && -[CFXPreviewViewController isEditingEffect](self, "isEditingEffect"))
    {
      -[CFXPreviewViewController effectEditor](self, "effectEditor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handlePanGesture:", v14);

      CFXLog_DebugEffectEditingUI();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        -[CFXPreviewViewController playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:].cold.6();

    }
  }
LABEL_43:

}

- (void)playbackAreaPinched:(id)a3 gesture:(id)a4 normalizedClipPoints:(id)a5 normalizedCenterPoint:(CGPoint)a6 normalizedMinimumSize:(id)a7 scaleDelta:(double)a8 atTime:(int)a9 timeScale:(int)a10
{
  double var1;
  double var0;
  double y;
  double x;
  id v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  _BOOL4 v31;
  NSObject *v32;
  void *v33;
  unint64_t v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  unint64_t v38;
  NSObject *v39;
  void *v40;
  __int128 v41;
  uint64_t v42;

  var1 = a7.var1;
  var0 = a7.var0;
  y = a6.y;
  x = a6.x;
  v15 = a4;
  -[CFXPreviewViewController previewClip](self, "previewClip");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_43;
  if (objc_msgSend(v15, "state") == 1)
  {
    -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isPlaying");

    if ((v18 & 1) != 0)
      goto LABEL_43;
  }
  v19 = objc_msgSend(v15, "state");
  if ((unint64_t)(v19 - 3) < 2)
  {
    if ((-[CFXPreviewViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") & 2) != 0
      && -[CFXPreviewViewController isEditingEffect](self, "isEditingEffect"))
    {
      CFXLog_DebugEffectEditingUI();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        -[CFXPreviewViewController playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:].cold.8();

      -[CFXPreviewViewController effectEditor](self, "effectEditor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handlePinchGesture:", v15);

      v34 = -[CFXPreviewViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") & 0xFFFFFFFFFFFFFFFDLL;
      -[CFXPreviewViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v34);
      -[CFXPreviewViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v34);
      if (!-[CFXPreviewViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures"))
      {
        CFXLog_DebugEffectEditingUI();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          -[CFXPreviewViewController playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:].cold.7();

        -[CFXPreviewViewController removeEffectEditor](self, "removeEffectEditor");
      }
    }
  }
  else
  {
    if (v19 != 2)
    {
      if (v19 != 1)
        goto LABEL_43;
      CFXLog_DebugEffectEditingUI();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[CFXPreviewViewController playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:].cold.5();

      if (-[CFXPreviewViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures"))
      {
        -[CFXPreviewViewController effectEditor](self, "effectEditor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "editEffect");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "jtEffect");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        CFXLog_DebugEffectEditingUI();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);

        if (v25)
        {
          CFXLog_DebugEffectEditingUI();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            -[CFXPreviewViewController playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:].cold.4();

        }
        if (v23)
          goto LABEL_36;
      }
      -[CFXPreviewViewController previewClip](self, "previewClip");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "effectsOfType:", 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = *MEMORY[0x24BDC0D88];
      v42 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:", v28, &v41, 1, x, y, var0, var1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      CFXLog_DebugEffectEditingUI();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
      v31 = v30;
      if (v23)
      {

        if (!v31)
        {
LABEL_35:

LABEL_36:
          if (objc_msgSend(v23, "type") == 2)
          {
            v38 = -[CFXPreviewViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") | 2;
            -[CFXPreviewViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v38);
            -[CFXPreviewViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v38);
            if (!-[CFXPreviewViewController isEditingEffect](self, "isEditingEffect"))
              -[CFXPreviewViewController displayEffectEditorForEffect:forMode:](self, "displayEffectEditorForEffect:forMode:", v23, 1);
            CFXLog_DebugEffectEditingUI();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
              -[CFXPreviewViewController playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:].cold.1();

            -[CFXPreviewViewController effectEditor](self, "effectEditor");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "handlePinchGesture:", v15);

          }
          goto LABEL_43;
        }
        CFXLog_DebugEffectEditingUI();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          -[CFXPreviewViewController playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:].cold.3();
      }
      else if (v30)
      {
        -[CFXPreviewViewController playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:].cold.2();
      }

      goto LABEL_35;
    }
    if ((-[CFXPreviewViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") & 2) != 0
      && -[CFXPreviewViewController isEditingEffect](self, "isEditingEffect"))
    {
      CFXLog_DebugEffectEditingUI();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        -[CFXPreviewViewController playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:].cold.6();

      -[CFXPreviewViewController effectEditor](self, "effectEditor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handlePinchGesture:", v15);

    }
  }
LABEL_43:

}

- (void)playbackAreaRotated:(id)a3 gesture:(id)a4 normalizedClipPoints:(id)a5 normalizedCenterPoint:(CGPoint)a6 normalizedMinimumSize:(id)a7 rotateDelta:(double)a8 atTime:(int)a9
{
  double var1;
  double var0;
  double y;
  double x;
  id v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  _BOOL4 v30;
  NSObject *v31;
  void *v32;
  unint64_t v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  unint64_t v37;
  NSObject *v38;
  void *v39;
  __int128 v40;
  uint64_t v41;

  var1 = a7.var1;
  var0 = a7.var0;
  y = a6.y;
  x = a6.x;
  v14 = a4;
  -[CFXPreviewViewController previewClip](self, "previewClip");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_43;
  if (objc_msgSend(v14, "state") == 1)
  {
    -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isPlaying");

    if ((v17 & 1) != 0)
      goto LABEL_43;
  }
  v18 = objc_msgSend(v14, "state");
  if ((unint64_t)(v18 - 3) < 2)
  {
    if ((-[CFXPreviewViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") & 4) != 0
      && -[CFXPreviewViewController isEditingEffect](self, "isEditingEffect"))
    {
      CFXLog_DebugEffectEditingUI();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        -[CFXPreviewViewController playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:].cold.8();

      -[CFXPreviewViewController effectEditor](self, "effectEditor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleRotateGesture:", v14);

      v33 = -[CFXPreviewViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") & 0xFFFFFFFFFFFFFFFBLL;
      -[CFXPreviewViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v33);
      -[CFXPreviewViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v33);
      if (!-[CFXPreviewViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures"))
      {
        CFXLog_DebugEffectEditingUI();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          -[CFXPreviewViewController playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:].cold.7();

        -[CFXPreviewViewController removeEffectEditor](self, "removeEffectEditor");
      }
    }
  }
  else
  {
    if (v18 != 2)
    {
      if (v18 != 1)
        goto LABEL_43;
      CFXLog_DebugEffectEditingUI();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[CFXPreviewViewController playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:].cold.5();

      if (-[CFXPreviewViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures"))
      {
        -[CFXPreviewViewController effectEditor](self, "effectEditor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "editEffect");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "jtEffect");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        CFXLog_DebugEffectEditingUI();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);

        if (v24)
        {
          CFXLog_DebugEffectEditingUI();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            -[CFXPreviewViewController playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:].cold.4();

        }
        if (v22)
          goto LABEL_36;
      }
      -[CFXPreviewViewController previewClip](self, "previewClip");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "effectsOfType:", 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = *MEMORY[0x24BDC0D88];
      v41 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:", v27, &v40, 1, x, y, var0, var1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      CFXLog_DebugEffectEditingUI();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
      v30 = v29;
      if (v22)
      {

        if (!v30)
        {
LABEL_35:

LABEL_36:
          if (objc_msgSend(v22, "type") == 2)
          {
            v37 = -[CFXPreviewViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") | 4;
            -[CFXPreviewViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v37);
            -[CFXPreviewViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v37);
            if (!-[CFXPreviewViewController isEditingEffect](self, "isEditingEffect"))
              -[CFXPreviewViewController displayEffectEditorForEffect:forMode:](self, "displayEffectEditorForEffect:forMode:", v22, 1);
            CFXLog_DebugEffectEditingUI();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              -[CFXPreviewViewController playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:].cold.1();

            -[CFXPreviewViewController effectEditor](self, "effectEditor");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "handleRotateGesture:", v14);

          }
          goto LABEL_43;
        }
        CFXLog_DebugEffectEditingUI();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          -[CFXPreviewViewController playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:].cold.3();
      }
      else if (v29)
      {
        -[CFXPreviewViewController playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:].cold.2();
      }

      goto LABEL_35;
    }
    if ((-[CFXPreviewViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") & 4) != 0
      && -[CFXPreviewViewController isEditingEffect](self, "isEditingEffect"))
    {
      CFXLog_DebugEffectEditingUI();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        -[CFXPreviewViewController playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:].cold.6();

      -[CFXPreviewViewController effectEditor](self, "effectEditor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleRotateGesture:", v14);

    }
  }
LABEL_43:

}

- (double)animationDurationForCompositionTransition:(id)a3 shouldScale:(BOOL *)a4
{
  void *v5;
  double v6;

  +[CFXPreviewViewController liveCaptureSnapshotView](CFXPreviewViewController, "liveCaptureSnapshotView", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = 0.25;
  else
    v6 = 0.0;

  *a4 = 0;
  return v6;
}

- (void)displayEffectEditorForEffect:(id)a3 forMode:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  CFXEffectEditorView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;

  v6 = a3;
  -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isPlaying");

  if ((v8 & 1) == 0)
  {
    -[CFXPreviewViewController effectEditor](self, "effectEditor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CFXPreviewViewController effectEditor](self, "effectEditor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "mode") == a4)
      {
        -[CFXPreviewViewController effectEditor](self, "effectEditor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "editEffect");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v6);

        if ((v13 & 1) != 0)
          goto LABEL_15;
      }
      else
      {

      }
      -[CFXPreviewViewController removeEffectEditor](self, "removeEffectEditor");
    }
    if (a4
      || !+[JFXEffectEditingUtilities canEditTextForEffect:](JFXEffectEditingUtilities, "canEditTextForEffect:", v6))
    {
      +[CFXEffect effectWithJTEffect:](CFXEffect, "effectWithJTEffect:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[CFXEffectEditorView initWithMode:delegate:]([CFXEffectEditorView alloc], "initWithMode:delegate:", a4, self);
      -[CFXPreviewViewController setEffectEditor:](self, "setEffectEditor:", v16);

      -[CFXPreviewViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXPreviewViewController effectEditor](self, "effectEditor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "insertSubview:aboveSubview:", v18, v20);

      -[CFXPreviewViewController playerContainerView](self, "playerContainerView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "frame");
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      -[CFXPreviewViewController effectEditor](self, "effectEditor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);

      -[CFXPreviewViewController effectEditor](self, "effectEditor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "beginEditingEffect:", v15);

      -[CFXPreviewViewController setPlayButtonHiddenIfPossible:](self, "setPlayButtonHiddenIfPossible:", 1);
    }
    else if (!-[CFXPreviewViewController presentFullScreenTextEditorForEffect:insertingEffect:](self, "presentFullScreenTextEditorForEffect:insertingEffect:", v6, 0))
    {
      JFXLog_DebugViewerUI();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[CFXPreviewViewController displayEffectEditorForEffect:forMode:].cold.1();

    }
  }
LABEL_15:

}

- (BOOL)isEditingEffect
{
  void *v2;
  BOOL v3;

  -[CFXPreviewViewController effectEditor](self, "effectEditor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CGRect)playerContentFrame
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v21;
  double v22;
  double v23;
  double v24;
  CGSize v25;
  CGRect v26;
  CGRect result;
  CGRect v28;

  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "renderSize");
  v5 = v4;
  v7 = v6;

  -[CFXPreviewViewController playerContainerView](self, "playerContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v25.width = v5;
  v25.height = v7;
  v28.origin.x = v10;
  v28.origin.y = v12;
  v28.size.width = v14;
  v28.size.height = v16;
  v26 = AVMakeRectWithAspectRatioInsideRect(v25, v28);
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;

  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)updateEffectEditorLayout
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  -[CFXPreviewViewController effectEditor](self, "effectEditor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CFXPreviewViewController playerContentFrame](self, "playerContentFrame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[CFXPreviewViewController effectEditor](self, "effectEditor");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  }
}

- (void)removeEffectEditor
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  -[CFXPreviewViewController effectEditor](self, "effectEditor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CFXPreviewViewController effectEditor](self, "effectEditor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v4);

    -[CFXPreviewViewController setEffectEditor:](self, "setEffectEditor:", 0);
    v5 = objc_loadWeakRetained(&location);
    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __46__CFXPreviewViewController_removeEffectEditor__block_invoke;
    v9 = &unk_24EE59648;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v5, "endEditingAnimated:withCompletionBlock:", 1, &v6);

    -[CFXPreviewViewController setPlayButtonHiddenIfPossible:](self, "setPlayButtonHiddenIfPossible:", 0, v6, v7, v8, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __46__CFXPreviewViewController_removeEffectEditor__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "removeFromSuperview");

}

- (BOOL)presentFullScreenTextEditorForEffect:(id)a3 insertingEffect:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a4;
  v6 = a3;
  -[CFXPreviewViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPreviewViewController playerContainerView](self, "playerContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  objc_msgSend(v7, "convertRect:toView:", 0);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  +[CFXEffect effectWithJTEffect:](CFXEffect, "effectWithJTEffect:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[CFXPreviewViewController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "previewViewControllerDidStartEditingText:", self);

  v19 = +[CFXFullScreenTextEditViewController displayFullScreenTextEditorForEffect:inViewController:delegate:cameraViewWindowFrame:insertingEffect:](CFXFullScreenTextEditViewController, "displayFullScreenTextEditorForEffect:inViewController:delegate:cameraViewWindowFrame:insertingEffect:", v17, self, self, v4, v10, v12, v14, v16);
  -[CFXPreviewViewController effectBrowserContentPresenterViewController](self, "effectBrowserContentPresenterViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[CFXPreviewViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXPreviewViewController effectBrowserContentPresenterViewController](self, "effectBrowserContentPresenterViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bringSubviewToFront:", v23);

  }
  return v19;
}

- (void)updateFullScreenTextEditorLayout
{
  if (+[CFXFullScreenTextEditViewController isFullScreenTextEditorPresented](CFXFullScreenTextEditViewController, "isFullScreenTextEditorPresented"))
  {
    -[CFXPreviewViewController playerContentFrame](self, "playerContentFrame");
    +[CFXFullScreenTextEditViewController notifyCameraViewWindowFrameChanged:](CFXFullScreenTextEditViewController, "notifyCameraViewWindowFrameChanged:");
  }
}

- (void)exportProgressedTo:(float)a3
{
  _QWORD v3[5];
  float v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__CFXPreviewViewController_exportProgressedTo___block_invoke;
  v3[3] = &unk_24EE59670;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

void __47__CFXPreviewViewController_exportProgressedTo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "shouldExportOnly"))
  {
    v2 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (int)(float)(*(float *)(a1 + 40) * 100.0));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("-EXPORTING- %@%%"), v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "exportButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:forState:", v7, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    v6 = *(float *)(a1 + 40);
    objc_msgSend(v5, "mediaItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "previewViewController:didProgress:exportingMediaItem:", v5, v4, v6);
  }

}

- (void)didFinishExport:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__CFXPreviewViewController_didFinishExport___block_invoke;
  v3[3] = &unk_24EE58078;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

void __44__CFXPreviewViewController_didFinishExport___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "setExporter:", 0);
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 == 2)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    v8 = v6;
    v9 = 1001;
    goto LABEL_5;
  }
  v3 = 0;
  if (v2 == 3)
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    v8 = v6;
    v9 = 1000;
LABEL_5:
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, v9, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v3 = v12;
  }
  v13 = v3;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserInteractionEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "CFX_setEffectAnimationsEnabledIfPossible:updatePlayer:", 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "CFX_notifyDelegateExportMediaItemFinishedWithError:", v13);

}

- (void)playButtonViewDidTapPlay:(id)a3
{
  void *v4;
  void *v5;

  -[CFXPreviewViewController exporter](self, "exporter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[CFXPreviewViewController removeEffectEditor](self, "removeEffectEditor");
    -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "play");

    -[CFXPreviewViewController setEffectAnimationsEnabledIfPossible:](self, "setEffectAnimationsEnabledIfPossible:", 1);
  }
}

- (void)playButtonViewDidTapPause:(id)a3
{
  id v3;

  -[CFXPreviewViewController previewPlayer](self, "previewPlayer", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pause");

}

- (BOOL)shouldKeepPlayButtonHidden
{
  void *v3;
  BOOL v4;
  void *v5;

  -[CFXPreviewViewController previewClip](self, "previewClip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isVideo")
    && !-[CFXPreviewViewController isPresentingFilterPicker](self, "isPresentingFilterPicker"))
  {
    -[CFXPreviewViewController exporter](self, "exporter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setPlayButtonHiddenIfPossible:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  id v7;

  if (-[CFXPreviewViewController shouldKeepPlayButtonHidden](self, "shouldKeepPlayButtonHidden"))
  {
    v5 = 1;
  }
  else
  {
    v5 = 1;
    if (!-[CFXPreviewViewController userInterfaceIsHidden](self, "userInterfaceIsHidden") && !a3)
    {
      -[CFXPreviewViewController playButton](self, "playButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAlpha:", 1.0);

      v5 = 0;
    }
  }
  -[CFXPreviewViewController playButton](self, "playButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v5);

}

- (void)setUserInterfaceHidden:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[6];

  if (self->_userInterfaceHidden != a3)
  {
    v3 = a3;
    self->_userInterfaceHidden = a3;
    v5 = -[CFXPreviewViewController shouldKeepPlayButtonHidden](self, "shouldKeepPlayButtonHidden") | a3;
    -[CFXPreviewViewController playButton](self, "playButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v5);

    LOBYTE(v5) = !v3;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __51__CFXPreviewViewController_setUserInterfaceHidden___block_invoke;
    v9[3] = &unk_24EE58078;
    v9[4] = self;
    *(double *)&v9[5] = (double)!v3;
    +[JTAnimation performAnimation:duration:completion:](JTAnimation, "performAnimation:duration:completion:", v9, 0, *MEMORY[0x24BDF7BD8]);
    -[CFXPreviewViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((v5 & 1) != 0)
      objc_msgSend(v7, "previewViewControllerDidShowUserInterface:", self);
    else
      objc_msgSend(v7, "previewViewControllerDidHideUserInterface:", self);

  }
}

void __51__CFXPreviewViewController_setUserInterfaceHidden___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  id v8;

  v2 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "previewControls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v2);

  v5 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "playButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

  v7 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "bottomControlsDrawer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v7);

}

- (void)CFX_showPreviewUI
{
  -[CFXPreviewViewController setUserInterfaceHidden:](self, "setUserInterfaceHidden:", 0);
}

- (void)CFX_hidePreviewUI
{
  -[CFXPreviewViewController setUserInterfaceHidden:](self, "setUserInterfaceHidden:", 1);
}

- (void)CFX_togglePreviewUI
{
  -[CFXPreviewViewController setUserInterfaceHidden:](self, "setUserInterfaceHidden:", -[CFXPreviewViewController userInterfaceIsHidden](self, "userInterfaceIsHidden") ^ 1);
}

- (void)configureUIForOrientation
{
  void *v3;

  -[CFXPreviewViewController CFX_layoutPlayerContainerView](self, "CFX_layoutPlayerContainerView");
  -[CFXPreviewViewController configureBottomControlsForOrientation](self, "configureBottomControlsForOrientation");
  -[CFXPreviewViewController effectBrowserContentPresenterViewController](self, "effectBrowserContentPresenterViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configureEffectBrowserContentPresentationForOrientation:", +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation"));

  -[CFXPreviewViewController updateEffectEditorLayout](self, "updateEffectEditorLayout");
  -[CFXPreviewViewController updateFullScreenTextEditorLayout](self, "updateFullScreenTextEditorLayout");
}

- (void)CFX_layoutPlayerContainerView
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double Width;
  CGFloat Height;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  CGFloat v34;
  void *v35;
  id v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  -[CFXPreviewViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cameraModeUsedForCapture");

  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "renderSize");
  v7 = v6;
  v9 = v8;

  v10 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
  +[JFXOrientationMonitor keyWindow](JFXOrientationMonitor, "keyWindow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  Width = v18;

  if (v4 == 9)
  {
    if ((unint64_t)(v10 - 3) <= 1)
    {
      v37.origin.x = v13;
      v37.origin.y = v15;
      v37.size.width = v17;
      v37.size.height = Width;
      Height = CGRectGetHeight(v37);
      v38.origin.x = v13;
      v38.origin.y = v15;
      v38.size.width = v17;
      v38.size.height = Width;
      Width = CGRectGetWidth(v38);
      v17 = Height;
    }
    v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE14A68]), "initWithReferenceBounds:shutterIntrinsicSize:", v13, v15, v17, Width, 72.0, 72.0);
    objc_msgSend(v36, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 3, 1, 0);
    v23 = v22;
    v24 = v21;
    v26 = v25;
    v28 = v27;
    if ((unint64_t)(v10 - 3) <= 1)
    {
      if (v10 == 3)
      {
        v29 = v21;
      }
      else
      {
        -[CFXPreviewViewController view](self, "view");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "frame");
        v33 = CGRectGetWidth(v39);
        v40.origin.x = v23;
        v40.origin.y = v24;
        v40.size.width = v26;
        v40.size.height = v28;
        v29 = v33 - (v24 + CGRectGetWidth(v40));

      }
      v41.origin.x = v23;
      v41.origin.y = v24;
      v41.size.width = v26;
      v41.size.height = v28;
      v34 = CGRectGetWidth(v41);
      v42.origin.x = v23;
      v42.origin.y = v24;
      v42.size.width = v26;
      v42.size.height = v28;
      v28 = CGRectGetHeight(v42);
      v26 = v34;
      v24 = v23;
      v23 = v29;
    }
    -[CFXPreviewViewController playerContainerView](self, "playerContainerView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFrame:", v23, v24, v26, v28);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE72D80], "reviewScreenContentGeometryForReferenceBounds:forContentSize:withOrientation:", v10, v13, v15, v17, Width, v7, v9);
    -[CFXPreviewViewController playerContainerView](self, "playerContainerView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBounds:", 0.0, 0.0, 0.0, 0.0);

    -[CFXPreviewViewController playerContainerView](self, "playerContainerView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCenter:", 0.0, 0.0);

  }
}

- (void)CFX_notifyDelegateExportMediaItemFinishedWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[CFXPreviewViewController saveMediaItemToFunCamPhotosAlbumUponExport](self, "saveMediaItemToFunCamPhotosAlbumUponExport"))
  {
    -[CFXPreviewViewController mediaItem](self, "mediaItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "adjustedAssetURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CFXPreviewViewController mediaItem](self, "mediaItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clip");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isStill");

    -[CFXPreviewViewController CFX_addURLToCameraRoll:isStill:completionHandler:](self, "CFX_addURLToCameraRoll:isStill:completionHandler:", v5, v8, &__block_literal_global_89);
  }
  -[CFXPreviewViewController CFX_setIsExporting:](self, "CFX_setIsExporting:", 0);
  if (!-[CFXPreviewViewController shouldExportOnly](self, "shouldExportOnly"))
  {
    -[CFXPreviewViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXPreviewViewController mediaItem](self, "mediaItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "previewViewController:didFinishExportingMediaItem:withError:", self, v10, v11);

  }
}

- (void)CFX_setIsExporting:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  if (-[CFXPreviewViewController shouldExportOnly](self, "shouldExportOnly"))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __47__CFXPreviewViewController_CFX_setIsExporting___block_invoke;
    v5[3] = &unk_24EE57C98;
    v5[4] = self;
    v6 = a3;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);
  }
}

void __47__CFXPreviewViewController_CFX_setIsExporting___block_invoke(uint64_t a1)
{
  _BOOL8 v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  id v8;

  v2 = *(_BYTE *)(a1 + 40) == 0;
  objc_msgSend(*(id *)(a1 + 32), "exportButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", v2);

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(MEMORY[0x24BDF6950], "redColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "blueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "exportButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  objc_msgSend(*(id *)(a1 + 32), "exportButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (*(_BYTE *)(a1 + 40))
    v7 = CFSTR("-EXPORTING-");
  else
    v7 = CFSTR("EXPORT");
  objc_msgSend(v6, "setTitle:forState:", v7, 0);

}

- (void)setEffectAnimationsEnabledIfPossible:(BOOL)a3
{
  -[CFXPreviewViewController CFX_setEffectAnimationsEnabledIfPossible:updatePlayer:](self, "CFX_setEffectAnimationsEnabledIfPossible:updatePlayer:", a3, 1);
}

- (void)CFX_setEffectAnimationsEnabledIfPossible:(BOOL)a3 updatePlayer:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a4;
  v5 = a3;
  v24 = *MEMORY[0x24BDAC8D0];
  -[CFXPreviewViewController previewClip](self, "previewClip");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isStill");

  -[CFXPreviewViewController previewClip](self, "previewClip");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "effectsOfType:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  v13 = v11;
  if (!v12)
    goto LABEL_10;
  v14 = v12;
  v15 = 0;
  v16 = *(_QWORD *)v20;
  v17 = v8 | !v5;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v20 != v16)
        objc_enumerationMutation(v11);
      v15 |= objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "enablePresentationState:", v17, (_QWORD)v19);
    }
    v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  }
  while (v14);

  if ((v4 & v15) == 1)
  {
    -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateCompositionForEffectChange");
LABEL_10:

  }
}

- (void)CFX_setFrameAndRenderSizes
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  _BOOL4 v14;
  _BOOL4 v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  int v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  int v35;
  uint64_t v36;
  CGSize v37;
  CGSize v38;

  v36 = *MEMORY[0x24BDAC8D0];
  -[CFXPreviewViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cameraModeUsedForCapture");

  -[CFXPreviewViewController previewClip](self, "previewClip");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaSize");
  v7 = v6;
  v9 = v8;

  v10 = v9;
  v11 = v7;
  if (v4)
  {
    if (v7 <= v9)
      v12 = 1;
    else
      v12 = 4;
    v11 = JFXCroppedFrameSizeForCameraModeAndOrientation(v4, v12);
    v10 = v13;
  }
  v14 = JFXIsCTMCameraMode(v4);
  v15 = CGSizeCouldContainSize(v11, v10, v7, v9);
  if (v15)
    v16 = v9;
  else
    v16 = v10;
  if (v15)
    v17 = v7;
  else
    v17 = v11;
  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrameSize:", v7, v9);

  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setRenderSize:", v17, v16);

  JFXLog_playback();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = v11 != v7;
    if (v10 != v9)
      v21 = 1;
    v22 = v14 && v21;
    v37.width = v7;
    v37.height = v9;
    NSStringFromCGSize(v37);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 > v9)
      v24 = CFSTR("UIInterfaceOrientationLandscapeLeft");
    else
      v24 = CFSTR("UIInterfaceOrientationPortrait");
    v38.width = v17;
    v38.height = v16;
    NSStringFromCGSize(v38);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 134219010;
    v27 = v4;
    v28 = 2114;
    v29 = v23;
    v30 = 2114;
    v31 = v24;
    v32 = 2114;
    v33 = v25;
    v34 = 1024;
    v35 = v22;
    _os_log_impl(&dword_2269A9000, v20, OS_LOG_TYPE_DEFAULT, "cameraModeUsedForCapture: %ld, mediaSize: %{public}@, mediaOrientation: %{public}@, renderSize: %{public}@, mediaIsCropped: %d", (uint8_t *)&v26, 0x30u);

  }
}

- (BOOL)shouldUseFaceTracking
{
  void *v3;
  int v4;
  int v5;

  -[CFXPreviewViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mediaCapturedInFunCam");

  v5 = !-[CFXPreviewViewController capturedWithBackCamera](self, "capturedWithBackCamera");
  if ((v5 & 1) != 0 || !v4)
    return v5 & v4;
  else
    return isFaceTrackingEnabledOnBackCamera();
}

- (BOOL)CFX_canApplyFaceTracking
{
  _BOOL4 v2;

  v2 = -[CFXPreviewViewController shouldUseFaceTracking](self, "shouldUseFaceTracking");
  if (v2)
    LOBYTE(v2) = +[JFXEffectEditingUtilities isFaceTrackingDataAvailable](JFXEffectEditingUtilities, "isFaceTrackingDataAvailable");
  return v2;
}

- (void)CFX_addURLToCameraRoll:(id)a3 isStill:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__CFXPreviewViewController_CFX_addURLToCameraRoll_isStill_completionHandler___block_invoke;
  v12[3] = &unk_24EE59728;
  v13 = v8;
  v14 = v9;
  v15 = a4;
  v12[4] = self;
  v10 = v8;
  v11 = v9;
  -[CFXPreviewViewController CFX_createAlbumWithCompletionHandler:](self, "CFX_createAlbumWithCompletionHandler:", v12);

}

void __77__CFXPreviewViewController_CFX_addURLToCameraRoll_isStill_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v3 = a2;
  if (v3)
  {
    if (*(_BYTE *)(a1 + 56))
      v4 = 1;
    else
      v4 = 2;
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __77__CFXPreviewViewController_CFX_addURLToCameraRoll_isStill_completionHandler___block_invoke_2;
    v9[3] = &unk_24EE59700;
    v7 = *(id *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 32);
    v11 = v7;
    v9[4] = v8;
    v10 = v3;
    objc_msgSend(v5, "CFX_addAssetAtURL:resourceType:completionHandler:", v6, v4, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __77__CFXPreviewViewController_CFX_addURLToCameraRoll_isStill_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  if (!a2 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __77__CFXPreviewViewController_CFX_addURLToCameraRoll_isStill_completionHandler___block_invoke_3;
    v6[3] = &unk_24EE596D8;
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v4, "CFX_addAssetWithIdentifier:intoAlbum:completionHandler:", a2, v5, v6);

  }
}

uint64_t __77__CFXPreviewViewController_CFX_addURLToCameraRoll_isStill_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 != 0);
}

- (void)CFX_createAlbumWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD block[4];
  id v37;
  id v38;
  _BYTE v39[128];
  _QWORD v40[4];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForKey:", CFSTR("saveClipAlbumPrefKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_4;
  v6 = (void *)MEMORY[0x24BDE3498];
  v40[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchAssetCollectionsWithLocalIdentifiers:options:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke;
    block[3] = &unk_24EE58FF0;
    v38 = v3;
    v10 = v9;
    v37 = v10;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v11 = v38;
  }
  else
  {
LABEL_4:
    objc_msgSend(MEMORY[0x24BDE3498], "fetchAssetCollectionsWithType:subtype:options:", 1, 2, 0);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v33;
LABEL_6:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v14);
        objc_msgSend(v15, "localizedTitle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqual:", CFSTR("FunCam"));

        if ((v17 & 1) != 0)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
          if (v12)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
      v18 = v15;

      if (!v18)
        goto LABEL_15;
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke_2;
      v29[3] = &unk_24EE58FF0;
      v31 = v3;
      v10 = v18;
      v30 = v10;
      dispatch_async(MEMORY[0x24BDAC9B8], v29);

    }
    else
    {
LABEL_12:

LABEL_15:
      v27[0] = 0;
      v27[1] = v27;
      v27[2] = 0x3032000000;
      v27[3] = __Block_byref_object_copy__9;
      v27[4] = __Block_byref_object_dispose__9;
      v19 = MEMORY[0x24BDAC760];
      v28 = 0;
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke_110;
      v26[3] = &unk_24EE59750;
      v26[4] = v27;
      v20 = (void *)MEMORY[0x2276A1F6C](v26);
      v23[0] = v19;
      v23[1] = 3221225472;
      v23[2] = __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke_2_112;
      v23[3] = &unk_24EE597A0;
      v25 = v27;
      v24 = v3;
      v21 = (void *)MEMORY[0x2276A1F6C](v23);
      objc_msgSend(MEMORY[0x24BDE35F0], "sharedPhotoLibrary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "performChanges:completionHandler:", v20, v21);

      _Block_object_dispose(v27, 8);
      v10 = 0;
    }
  }

}

uint64_t __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke_110(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDE34A0], "creationRequestForAssetCollectionWithTitle:", CFSTR("FunCam"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "placeholderForCreatedAssetCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke_2_112(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD block[4];
  id v10;
  __int128 v11;
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke_3;
  block[3] = &unk_24EE59778;
  v12 = a2;
  v10 = v5;
  v8 = *(_OWORD *)(a1 + 32);
  v6 = (id)v8;
  v11 = v8;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 56) && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), CFSTR("saveClipAlbumPrefKey"));

    v3 = (void *)MEMORY[0x24BDE3498];
    v13[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fetchAssetCollectionsWithLocalIdentifiers:options:", v4, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    -[NSObject firstObject](v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    JFXLog_core();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke_3_cold_1(a1, v5, v7, v8, v9, v10, v11, v12);
    v6 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)CFX_addAssetAtURL:(id)a3 resourceType:(int64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  int64_t v22;
  _QWORD v23[5];
  id v24;

  v7 = a3;
  v8 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__9;
  v23[4] = __Block_byref_object_dispose__9;
  v24 = 0;
  v9 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __77__CFXPreviewViewController_CFX_addAssetAtURL_resourceType_completionHandler___block_invoke;
  v19[3] = &unk_24EE597C8;
  v21 = v23;
  v22 = a4;
  v10 = v7;
  v20 = v10;
  v11 = (void *)MEMORY[0x2276A1F6C](v19);
  objc_msgSend(MEMORY[0x24BDE35F0], "sharedPhotoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __77__CFXPreviewViewController_CFX_addAssetAtURL_resourceType_completionHandler___block_invoke_2;
  v15[3] = &unk_24EE59818;
  v18 = v23;
  v13 = v10;
  v16 = v13;
  v14 = v8;
  v17 = v14;
  objc_msgSend(v12, "performChanges:completionHandler:", v11, v15);

  _Block_object_dispose(v23, 8);
}

void __77__CFXPreviewViewController_CFX_addAssetAtURL_resourceType_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDE34B8], "creationRequestForAsset");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "placeholderForCreatedAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = objc_alloc_init(MEMORY[0x24BDE34E0]);
  objc_msgSend(v7, "setShouldMoveFile:", 0);
  objc_msgSend(v8, "addResourceWithType:fileURL:options:", a1[6], a1[4], v7);

}

void __77__CFXPreviewViewController_CFX_addAssetAtURL_resourceType_completionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;

  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

    JFXLog_core();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __77__CFXPreviewViewController_CFX_addAssetAtURL_resourceType_completionHandler___block_invoke_2_cold_1(a1, (uint64_t)v5, v8);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__CFXPreviewViewController_CFX_addAssetAtURL_resourceType_completionHandler___block_invoke_117;
  block[3] = &unk_24EE597F0;
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v14 = v9;
  v15 = v10;
  v13 = v5;
  v11 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __77__CFXPreviewViewController_CFX_addAssetAtURL_resourceType_completionHandler___block_invoke_117(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[4]);
}

- (void)CFX_addAssetWithIdentifier:(id)a3 intoAlbum:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD block[4];
  id v25;

  v8 = a4;
  v9 = a5;
  -[CFXPreviewViewController CFX_fetchAssetWithLocalIdentifier:](self, "CFX_fetchAssetWithLocalIdentifier:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  if (!v10)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83__CFXPreviewViewController_CFX_addAssetWithIdentifier_intoAlbum_completionHandler___block_invoke;
    block[3] = &unk_24EE580C8;
    v25 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __83__CFXPreviewViewController_CFX_addAssetWithIdentifier_intoAlbum_completionHandler___block_invoke_2;
  v21[3] = &unk_24EE57AA8;
  v22 = v8;
  v12 = v10;
  v23 = v12;
  v13 = v8;
  v14 = (void *)MEMORY[0x2276A1F6C](v21);
  objc_msgSend(MEMORY[0x24BDE35F0], "sharedPhotoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __83__CFXPreviewViewController_CFX_addAssetWithIdentifier_intoAlbum_completionHandler___block_invoke_3;
  v18[3] = &unk_24EE59868;
  v19 = v12;
  v20 = v9;
  v16 = v9;
  v17 = v12;
  objc_msgSend(v15, "performChanges:completionHandler:", v14, v18);

}

uint64_t __83__CFXPreviewViewController_CFX_addAssetWithIdentifier_intoAlbum_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__CFXPreviewViewController_CFX_addAssetWithIdentifier_intoAlbum_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE34A0], "changeRequestForAssetCollection:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAssets:", v3);

}

void __83__CFXPreviewViewController_CFX_addAssetWithIdentifier_intoAlbum_completionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __83__CFXPreviewViewController_CFX_addAssetWithIdentifier_intoAlbum_completionHandler___block_invoke_4;
  v8[3] = &unk_24EE59840;
  v6 = *(id *)(a1 + 32);
  v12 = a2;
  v9 = v6;
  v10 = v5;
  v11 = *(id *)(a1 + 40);
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

void __83__CFXPreviewViewController_CFX_addAssetWithIdentifier_intoAlbum_completionHandler___block_invoke_4(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(id *)(a1 + 32);
  v3 = v2;
  if (!*(_BYTE *)(a1 + 56) || *(_QWORD *)(a1 + 40))
  {

    JFXLog_core();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __83__CFXPreviewViewController_CFX_addAssetWithIdentifier_intoAlbum_completionHandler___block_invoke_4_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);

    v3 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)CFX_fetchAssetWithLocalIdentifier:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDE3570]);
  objc_msgSend(v4, "setWantsIncrementalChangeDetails:", 0);
  v5 = (void *)MEMORY[0x24BDE3488];
  v15[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchAssetsWithLocalIdentifiers:options:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x24BDE3498], "fetchAssetCollectionsWithType:subtype:options:", 2, 200, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc_init(MEMORY[0x24BDE3570]);

      objc_msgSend(v10, "setWantsIncrementalChangeDetails:", 0);
      objc_msgSend(v10, "setIncludeHiddenAssets:", 1);
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("localIdentifier = %@"), v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPredicate:", v11);

      objc_msgSend(MEMORY[0x24BDE3488], "fetchAssetsInAssetCollection:options:", v9, v10);
      v12 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v12;
      v4 = v10;
    }

  }
  objc_msgSend(v7, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)updateUIForDockMagnify:(BOOL)a3 dockHeightDelta:(double)a4
{
  id v6;

  -[CFXPreviewViewController setDockIsMagnified:](self, "setDockIsMagnified:", a3);
  -[CFXPreviewViewController setDockMagnifiedHeightDelta:](self, "setDockMagnifiedHeightDelta:", a4);
  -[CFXPreviewViewController configureBottomControlsForOrientation](self, "configureBottomControlsForOrientation");
  -[CFXPreviewViewController bottomControlsDrawer](self, "bottomControlsDrawer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

}

- (id)bottomControlsSnapshot
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  -[CFXPreviewViewController bottomControlsDrawer](self, "bottomControlsDrawer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CFXPreviewViewController appStripAndPreviewControlsContainer](self, "appStripAndPreviewControlsContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0, v5, v7, v9, v11, *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)hideBottomControls
{
  void *v3;
  void *v4;
  id v5;

  -[CFXPreviewViewController previewControls](self, "previewControls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[CFXPreviewViewController bottomControlsDrawer](self, "bottomControlsDrawer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

}

- (void)showBottomControls
{
  void *v3;
  void *v4;
  id v5;

  -[CFXPreviewViewController previewControls](self, "previewControls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  -[CFXPreviewViewController bottomControlsDrawer](self, "bottomControlsDrawer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

}

- (CGRect)bottomControlsBounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[CFXPreviewViewController bottomControlsDrawer](self, "bottomControlsDrawer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGPoint)bottomControlsCenter
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[CFXPreviewViewController bottomControlsDrawer](self, "bottomControlsDrawer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "center");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CFXPreviewViewControllerDelegate)delegate
{
  return (CFXPreviewViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isPresentingFilterPicker
{
  return self->_presentingFilterPicker;
}

- (BOOL)capturedWithBackCamera
{
  return self->_capturedWithBackCamera;
}

- (void)setCapturedWithBackCamera:(BOOL)a3
{
  self->_capturedWithBackCamera = a3;
}

- (CFXControlsViewController)previewControls
{
  return (CFXControlsViewController *)objc_loadWeakRetained((id *)&self->_previewControls);
}

- (void)setPreviewControls:(id)a3
{
  objc_storeWeak((id *)&self->_previewControls, a3);
}

- (void)setEffectBrowserContentPresenterViewController:(id)a3
{
  objc_storeStrong((id *)&self->_effectBrowserContentPresenterViewController, a3);
}

- (UIView)playerContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_playerContainerView);
}

- (void)setPlayerContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_playerContainerView, a3);
}

- (UIView)appStripAndPreviewControlsContainer
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_appStripAndPreviewControlsContainer);
}

- (void)setAppStripAndPreviewControlsContainer:(id)a3
{
  objc_storeWeak((id *)&self->_appStripAndPreviewControlsContainer, a3);
}

- (UIButton)exportButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_exportButton);
}

- (void)setExportButton:(id)a3
{
  objc_storeWeak((id *)&self->_exportButton, a3);
}

- (NSLayoutConstraint)previewControlsContainerHeightConstraint
{
  return self->_previewControlsContainerHeightConstraint;
}

- (void)setPreviewControlsContainerHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_previewControlsContainerHeightConstraint, a3);
}

- (NSLayoutConstraint)previewControlsContainerWidthConstraint
{
  return self->_previewControlsContainerWidthConstraint;
}

- (void)setPreviewControlsContainerWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_previewControlsContainerWidthConstraint, a3);
}

- (NSLayoutConstraint)previewControlsContainerTrailingConstraint
{
  return self->_previewControlsContainerTrailingConstraint;
}

- (void)setPreviewControlsContainerTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_previewControlsContainerTrailingConstraint, a3);
}

- (NSLayoutConstraint)previewControlsContainerLeadingConstraint
{
  return self->_previewControlsContainerLeadingConstraint;
}

- (void)setPreviewControlsContainerLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_previewControlsContainerLeadingConstraint, a3);
}

- (NSLayoutConstraint)previewControlsContainerTopConstraint
{
  return self->_previewControlsContainerTopConstraint;
}

- (void)setPreviewControlsContainerTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_previewControlsContainerTopConstraint, a3);
}

- (BOOL)userInterfaceIsHidden
{
  return self->_userInterfaceHidden;
}

- (BOOL)saveMediaItemToFunCamPhotosAlbumUponExport
{
  return self->_saveMediaItemToFunCamPhotosAlbumUponExport;
}

- (void)setSaveMediaItemToFunCamPhotosAlbumUponExport:(BOOL)a3
{
  self->_saveMediaItemToFunCamPhotosAlbumUponExport = a3;
}

- (unint64_t)appliedDirectOverlayEditingGestures
{
  return self->_appliedDirectOverlayEditingGestures;
}

- (void)setAppliedDirectOverlayEditingGestures:(unint64_t)a3
{
  self->_appliedDirectOverlayEditingGestures = a3;
}

- (UIView)bottomControlsDrawer
{
  return self->_bottomControlsDrawer;
}

- (void)setBottomControlsDrawer:(id)a3
{
  objc_storeStrong((id *)&self->_bottomControlsDrawer, a3);
}

- (BOOL)dockIsMagnified
{
  return self->_dockIsMagnified;
}

- (void)setDockIsMagnified:(BOOL)a3
{
  self->_dockIsMagnified = a3;
}

- (double)dockMagnifiedHeightDelta
{
  return self->_dockMagnifiedHeightDelta;
}

- (void)setDockMagnifiedHeightDelta:(double)a3
{
  self->_dockMagnifiedHeightDelta = a3;
}

- (UISlider)playbackSlider
{
  return self->_playbackSlider;
}

- (void)setPlaybackSlider:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSlider, a3);
}

- (UIView)previewControlsContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_previewControlsContainerView);
}

- (void)setPreviewControlsContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_previewControlsContainerView, a3);
}

- (CFXPlayButtonView)playButton
{
  return (CFXPlayButtonView *)objc_loadWeakRetained((id *)&self->_playButton);
}

- (void)setPlayButton:(id)a3
{
  objc_storeWeak((id *)&self->_playButton, a3);
}

- (CFXMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItem, a3);
}

- (CFXClipPlayerViewController)previewPlayer
{
  return self->_previewPlayer;
}

- (void)setPreviewPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_previewPlayer, a3);
}

- (JFXCompositionExporter)exporter
{
  return self->_exporter;
}

- (void)setExporter:(id)a3
{
  objc_storeStrong((id *)&self->_exporter, a3);
}

- (JFXEffectsPreviewGenerator)stillImagePreviewGenerator
{
  return self->_stillImagePreviewGenerator;
}

- (void)setStillImagePreviewGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_stillImagePreviewGenerator, a3);
}

- (JFXOrientationMonitor)orientationMonitor
{
  return self->_orientationMonitor;
}

- (void)setOrientationMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_orientationMonitor, a3);
}

- (CFXEffectEditorView)effectEditor
{
  return self->_effectEditor;
}

- (void)setEffectEditor:(id)a3
{
  objc_storeStrong((id *)&self->_effectEditor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectEditor, 0);
  objc_storeStrong((id *)&self->_orientationMonitor, 0);
  objc_storeStrong((id *)&self->_stillImagePreviewGenerator, 0);
  objc_storeStrong((id *)&self->_exporter, 0);
  objc_storeStrong((id *)&self->_previewPlayer, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_destroyWeak((id *)&self->_playButton);
  objc_destroyWeak((id *)&self->_previewControlsContainerView);
  objc_storeStrong((id *)&self->_playbackSlider, 0);
  objc_storeStrong((id *)&self->_bottomControlsDrawer, 0);
  objc_storeStrong((id *)&self->_previewControlsContainerTopConstraint, 0);
  objc_storeStrong((id *)&self->_previewControlsContainerLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_previewControlsContainerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_previewControlsContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_previewControlsContainerHeightConstraint, 0);
  objc_destroyWeak((id *)&self->_exportButton);
  objc_destroyWeak((id *)&self->_appStripAndPreviewControlsContainer);
  objc_destroyWeak((id *)&self->_playerContainerView);
  objc_storeStrong((id *)&self->_effectBrowserContentPresenterViewController, 0);
  objc_destroyWeak((id *)&self->_previewControls);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)effectEditorViewDidBeginEditing:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[CFXPreviewViewController previewPlayer](self, "previewPlayer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __84__CFXPreviewViewController_EffectEditingAdditions__effectEditorViewDidBeginEditing___block_invoke;
  v5[3] = &unk_24EE57B60;
  v5[4] = self;
  objc_msgSend(v4, "pauseWithCompletionBlock:", v5);

}

uint64_t __84__CFXPreviewViewController_EffectEditingAdditions__effectEditorViewDidBeginEditing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEffectAnimationsEnabledIfPossible:", 0);
}

- (void)effectEditorViewDidEndEditing:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CFXPreviewViewController effectEditor](self, "effectEditor");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[CFXPreviewViewController removeEffectEditor](self, "removeEffectEditor");
  -[CFXPreviewViewController setEffectAnimationsEnabledIfPossible:](self, "setEffectAnimationsEnabledIfPossible:", 0);
}

- (void)effectEditorView:(id)a3 didEndEditingByTappingOutSideEffectAtScreenPoint:(CGPoint)a4
{
  -[CFXPreviewViewController setPlayButtonHiddenIfPossible:](self, "setPlayButtonHiddenIfPossible:", 0, a4.x, a4.y);
}

- (id)effectEditorView:(id)a3 effectAtPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  _BYTE v23[24];

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[CFXPreviewViewController previewClip](self, "previewClip");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "effectsOfType:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v7, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[CFXPreviewViewController CFX_previewPlayerCurrentTime](self, "CFX_previewPlayerCurrentTime");
    -[CFXPreviewViewController normalizedMinimumHitTestArea](self, "normalizedMinimumHitTestArea");
    +[JFXEffectEditingUtilities hitTestOverlays:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlays:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:", v9, v23, 1, x, y, v11, v13, v15, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      +[CFXEffect effectWithJTEffect:](CFXEffect, "effectWithJTEffect:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)effectEditorView:(id)a3 isEffectAtPoint:(CGPoint)a4 effect:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  BOOL v26;
  __int128 v28;
  uint64_t v29;
  _QWORD v30[2];

  y = a4.y;
  x = a4.x;
  v30[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  objc_msgSend(v10, "jtEffect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v10, "jtEffect");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[CFXPreviewViewController normalizedMinimumHitTestArea](self, "normalizedMinimumHitTestArea");
    v28 = *MEMORY[0x24BDC0D88];
    v29 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:", v14, &v28, 1, x, y, v16, v18, v20, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v25 != 0;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (CGRect)effectEditorView:(id)a3 frameForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  char v26[24];
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4;
  objc_msgSend(v10, "jtEffect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v10, "jtEffect");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXPreviewViewController CFX_previewPlayerCurrentTime](self, "CFX_previewPlayerCurrentTime");
    objc_msgSend(v13, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", v26, 1, 1, 1, x, y, width, height);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

  }
  else
  {
    v15 = *MEMORY[0x24BDBF090];
    v17 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v19 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v21 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)effectEditorView:(id)a3 hitAreaBoundingFrameForEffect:(id)a4 adjustForMinimumSize:(BOOL)a5 relativeToBounds:(CGRect)a6
{
  _BOOL8 v6;
  id v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  char v24[24];
  CGRect result;

  v6 = a5;
  v8 = a4;
  objc_msgSend(v8, "jtEffect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "jtEffect");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXPreviewViewController CFX_previewPlayerCurrentTime](self, "CFX_previewPlayerCurrentTime");
    -[CFXPreviewViewController normalizedMinimumHitTestArea](self, "normalizedMinimumHitTestArea");
    objc_msgSend(v11, "hitAreaBoundingFrameAtTime:forcePosterFrame:includeDropShadow:adjustForMinimumSize:normalizedMinimumSize:relativeTo:basisOrigin:", v24, 1, 1, v6, 1);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

  }
  else
  {
    v13 = *MEMORY[0x24BDBF090];
    v15 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v17 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v19 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (id)effectEditorView:(id)a3 overlayEffectFrameForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height;
  double width;
  void *v8;
  id v9;
  void *v10;
  _BYTE v12[24];

  height = a5.size.height;
  width = a5.size.width;
  objc_msgSend(a4, "jtEffect", a3, a5.origin.x, a5.origin.y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    -[CFXPreviewViewController CFX_previewPlayerCurrentTime](self, "CFX_previewPlayerCurrentTime");
    +[JFXOverlayEffectFrame frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:](JFXOverlayEffectFrame, "frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", v9, 1, v12, 1, 1, 1, width, height);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CGPoint)effectEditorView:(id)a3 removeButtonPositionForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  __int128 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _OWORD v18[3];
  char v19[24];
  CGPoint result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  objc_msgSend(a4, "jtEffect", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPreviewViewController CFX_previewPlayerCurrentTime](self, "CFX_previewPlayerCurrentTime");
  v11 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v18[0] = *MEMORY[0x24BDBD8B8];
  v18[1] = v11;
  v18[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  +[JFXEffectEditingUtilities removeButtonPositionForEffect:atTime:atPosterFrameRelativeToBounds:viewCorrectionTransform:](JFXEffectEditingUtilities, "removeButtonPositionForEffect:atTime:atPosterFrameRelativeToBounds:viewCorrectionTransform:", v10, v19, v18, x, y, width, height);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGPoint)effectEditorView:(id)a3 spacingBetweenCenterPointOfEffect:(id)a4 point:(CGPoint)a5 relativeToBounds:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  char v20[24];
  CGPoint result;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v10 = a5.y;
  v11 = a5.x;
  objc_msgSend(a4, "jtEffect", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPreviewViewController CFX_previewPlayerCurrentTime](self, "CFX_previewPlayerCurrentTime");
  +[JFXEffectEditingUtilities spacingBetweenCenterPointOfEffect:point:relativeToBounds:atTime:](JFXEffectEditingUtilities, "spacingBetweenCenterPointOfEffect:point:relativeToBounds:atTime:", v13, v20, v11, v10, x, y, width, height);
  v15 = v14;
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.y = v19;
  result.x = v18;
  return result;
}

- (void)effectEditorView:(id)a3 didTransformEffect:(id)a4 transform:(CGAffineTransform *)a5 relativeToBounds:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  __int128 v13;
  void *v14;
  _OWORD v15[3];
  _BYTE v16[24];

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  objc_msgSend(a4, "jtEffect", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPreviewViewController CFX_previewPlayerCurrentTime](self, "CFX_previewPlayerCurrentTime");
  v13 = *(_OWORD *)&a5->c;
  v15[0] = *(_OWORD *)&a5->a;
  v15[1] = v13;
  v15[2] = *(_OWORD *)&a5->tx;
  +[JFXEffectEditingUtilities addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:](JFXEffectEditingUtilities, "addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:", v12, v15, v16, 1, x, y, width, height);

  -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateCompositionForEffectChange");

}

- (void)effectEditorView:(id)a3 didMoveEffect:(id)a4 withTouchPoint:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  void *v31;
  uint64_t v32;
  unsigned int v33;
  __int128 v34;
  uint64_t v35;
  void *v36;
  _QWORD block[4];
  id v38;
  id v39;
  __int128 v40;
  uint64_t v41;

  y = a5.y;
  x = a5.x;
  v9 = a3;
  v10 = a4;
  objc_msgSend(v10, "jtEffect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "type") != 2)
  {
LABEL_6:

    goto LABEL_7;
  }
  v12 = -[CFXPreviewViewController shouldUseFaceTracking](self, "shouldUseFaceTracking");

  if (v12)
  {
    objc_msgSend(v10, "jtEffect");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mostRecentARMetadata");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "trackingProps");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v14, "trackingType");

    objc_msgSend(v9, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    objc_msgSend(v36, "faceAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXPreviewViewController previewClip](self, "previewClip");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v24, "playableMediaContentMode");
    -[CFXPreviewViewController previewClip](self, "previewClip");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "mediaInterfaceOrientationForDisplay");
    v27 = objc_msgSend(v11, "playableAspectRatio");
    v28 = objc_msgSend(v11, "playableAspectRatioPreservationMode");
    v40 = *MEMORY[0x24BDC0D88];
    v34 = v40;
    v41 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    v29 = v41;
    v30 = +[JFXEffectEditingUtilities trackingTypeForOverlayPointIntersectionWithFaceRect:atTime:relativeTo:defaultTrackingType:faceAnchor:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:](JFXEffectEditingUtilities, "trackingTypeForOverlayPointIntersectionWithFaceRect:atTime:relativeTo:defaultTrackingType:faceAnchor:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", &v40, v35, v23, 0, v33, v26, x, y, v16, v18, v20, v22, v27, v28);

    -[CFXPreviewViewController previewClip](self, "previewClip");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "mediaInterfaceOrientationForDisplay");
    v40 = v34;
    v41 = v29;
    LODWORD(v25) = +[JFXEffectEditingUtilities makeOverlayTrackedMaintainingAppearance:atTime:newTrackingType:arMetadata:playableInterfaceOrientation:](JFXEffectEditingUtilities, "makeOverlayTrackedMaintainingAppearance:atTime:newTrackingType:arMetadata:playableInterfaceOrientation:", v11, &v40, v30, v36, v32);

    if ((_DWORD)v25)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __98__CFXPreviewViewController_EffectEditingAdditions__effectEditorView_didMoveEffect_withTouchPoint___block_invoke;
      block[3] = &unk_24EE57AA8;
      v38 = v9;
      v39 = v11;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
    goto LABEL_6;
  }
LABEL_7:

}

void __98__CFXPreviewViewController_EffectEditingAdditions__effectEditorView_didMoveEffect_withTouchPoint___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "trackingProps");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notifyEffectTrackingDidChangeToType:", objc_msgSend(v2, "trackingType"));

}

- (id)effectEditorView:(id)a3 textEditingPropertiesForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  id v11;
  _BYTE v13[24];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  objc_msgSend(a4, "jtEffect", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPreviewViewController CFX_previewPlayerCurrentTime](self, "CFX_previewPlayerCurrentTime");
  v11 = +[JFXEffectEditingUtilities newTextEditingPropertiesForEffect:relativeTo:atTime:withNewText:](JFXEffectEditingUtilities, "newTextEditingPropertiesForEffect:relativeTo:atTime:withNewText:", v10, v13, 0, x, y, width, height);

  return v11;
}

- (id)effectEditorView:(id)a3 textForEffect:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a4, "jtEffect", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXEffectEditingUtilities textForEffect:](JFXEffectEditingUtilities, "textForEffect:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)effectEditorView:(id)a3 didBeginEditingTextForEffect:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(a4, "jtEffect", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXEffectEditingUtilities beginTextEditingForEffect:](JFXEffectEditingUtilities, "beginTextEditingForEffect:", v5);

  -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateCompositionForEffectChange");

}

- (void)effectEditorView:(id)a3 didEditTextForEffect:(id)a4 newText:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a5;
  objc_msgSend(a4, "jtEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXEffectEditingUtilities updateEffectText:newText:](JFXEffectEditingUtilities, "updateEffectText:newText:", v8, v7);

  -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateCompositionForEffectChange");

}

- (void)effectEditorView:(id)a3 didEndEditingTextForEffect:(id)a4 wasCancelled:(BOOL)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  objc_msgSend(v6, "jtEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXEffectEditingUtilities updateEffectToDefaultTextIfEmpty:](JFXEffectEditingUtilities, "updateEffectToDefaultTextIfEmpty:", v7);

  objc_msgSend(v6, "jtEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[JFXEffectEditingUtilities endTextEditingForEffect:](JFXEffectEditingUtilities, "endTextEditingForEffect:", v8);
  -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateCompositionForEffectChange");

}

- (BOOL)effectEditorView:(id)a3 shouldEditTextForEffect:(id)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a4, "jtEffect", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[JFXEffectEditingUtilities canEditTextForEffect:](JFXEffectEditingUtilities, "canEditTextForEffect:", v4);

  return v5;
}

- (unint64_t)effectEditorView:(id)a3 maximumTextLengthForEffect:(id)a4
{
  void *v4;
  unint64_t v5;

  objc_msgSend(a4, "jtEffect", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[JFXEffectEditingUtilities maximumTextLengthForEffect:](JFXEffectEditingUtilities, "maximumTextLengthForEffect:", v4);

  return v5;
}

- (BOOL)effectEditorView:(id)a3 presentCustomTextEditingUI:(id)a4
{
  void *v5;
  _QWORD block[5];

  objc_msgSend(a4, "jtEffect", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPreviewViewController presentFullScreenTextEditorForEffect:insertingEffect:](self, "presentFullScreenTextEditorForEffect:insertingEffect:", v5, 0);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96__CFXPreviewViewController_EffectEditingAdditions__effectEditorView_presentCustomTextEditingUI___block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  return 1;
}

uint64_t __96__CFXPreviewViewController_EffectEditingAdditions__effectEditorView_presentCustomTextEditingUI___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeEffectEditor");
}

- (void)effectEditorView:(id)a3 didRemoveEffect:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[CFXPreviewViewController previewClip](self, "previewClip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jtEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeEffect:", v7);
  -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateCompositionForEffectChange");

  CFXLog_action();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[CFXPreviewViewController previewClip](self, "previewClip");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "effectStack");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CFXActionLogging actionLogAsJSONForEvent:atLocation:withEffectStack:](CFXActionLogging, "actionLogAsJSONForEvent:atLocation:withEffectStack:", CFSTR("effect removed"), CFSTR("post-capture"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v12;
    _os_log_impl(&dword_2269A9000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v13, 0xCu);

  }
}

- (BOOL)effectEditorView:(id)a3 isFaceTrackingDataAvailableForEffect:(id)a4
{
  void *v4;
  int v5;

  objc_msgSend(a4, "jtEffect", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  return v5 == 2
      && +[JFXEffectEditingUtilities isFaceTrackingDataAvailable](JFXEffectEditingUtilities, "isFaceTrackingDataAvailable");
}

- (BOOL)effectEditorView:(id)a3 isFaceTrackingEffect:(id)a4
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  char v8;

  v4 = a4;
  objc_msgSend(v4, "jtEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "jtEffect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isCurrentlyTracking");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)CFX_previewPlayerCurrentTime
{
  int64_t v5;
  void *v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v8;

  -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (int)objc_msgSend(v8, "currentTime");
  -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeMake((CMTime *)retstr, v5, objc_msgSend(v6, "frameRate"));

  return result;
}

- (void)fullScreenTextEditViewController:(id)a3 didBeginAnimationBeforeEditingEffect:(id)a4 completion:(id)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = a5;
  objc_msgSend(a4, "jtEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "setHidden:", 1);
    -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateCompositionForEffectChange");

    -[CFXPreviewViewController dispatchWhenPlayerReadyForDisplayEffectUpdate:](self, "dispatchWhenPlayerReadyForDisplayEffectUpdate:", v9);
  }

}

- (void)fullScreenTextEditViewController:(id)a3 didBeginEditingEffect:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(a4, "jtEffect", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "setHidden:", 1);
    -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateCompositionForEffectChange");

  }
}

- (void)fullScreenTextEditViewController:(id)a3 willBeginAnimationAfterEditingEffect:(id)a4 updatedText:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a5;
  objc_msgSend(a4, "jtEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXEffectEditingUtilities updateEffectText:newText:](JFXEffectEditingUtilities, "updateEffectText:newText:", v8, v7);

  -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateCompositionForEffectChange");

}

- (void)dispatchWhenPlayerReadyForDisplayEffectUpdate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __98__CFXPreviewViewController_EffectEditingAdditions__dispatchWhenPlayerReadyForDisplayEffectUpdate___block_invoke;
  v7[3] = &unk_24EE580A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "dispatchBlockWhenDone:", v7);

}

void __98__CFXPreviewViewController_EffectEditingAdditions__dispatchWhenPlayerReadyForDisplayEffectUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "previewPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCompositionForEffectChange");

  objc_msgSend(*(id *)(a1 + 32), "previewPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __98__CFXPreviewViewController_EffectEditingAdditions__dispatchWhenPlayerReadyForDisplayEffectUpdate___block_invoke_2;
  v5[3] = &unk_24EE580A0;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "dispatchBlockWhenDone:", v5);

}

void __98__CFXPreviewViewController_EffectEditingAdditions__dispatchWhenPlayerReadyForDisplayEffectUpdate___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "previewPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCompositionForEffectChange");

  objc_msgSend(*(id *)(a1 + 32), "previewPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __98__CFXPreviewViewController_EffectEditingAdditions__dispatchWhenPlayerReadyForDisplayEffectUpdate___block_invoke_3;
  v4[3] = &unk_24EE580C8;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "dispatchBlockWhenDone:", v4);

}

uint64_t __98__CFXPreviewViewController_EffectEditingAdditions__dispatchWhenPlayerReadyForDisplayEffectUpdate___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fullScreenTextEditViewController:(id)a3 didFinishAnimationAfterEditingEffect:(id)a4 completion:(id)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = a5;
  objc_msgSend(a4, "jtEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "setHidden:", 0);
    -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateCompositionForEffectChange");

    -[CFXPreviewViewController dispatchWhenPlayerReadyForDisplayEffectUpdate:](self, "dispatchWhenPlayerReadyForDisplayEffectUpdate:", v9);
  }

}

- (void)fullScreenTextEditViewController:(id)a3 didFinishEditingEffect:(id)a4 withUpdatedText:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a5;
  objc_msgSend(a4, "jtEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    +[JFXEffectEditingUtilities updateEffectText:newText:](JFXEffectEditingUtilities, "updateEffectText:newText:", v8, v11);
    objc_msgSend(v8, "setHidden:", 0);

    -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateCompositionForEffectChange");

    -[CFXPreviewViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "previewViewControllerDidStopEditingText:", self);

  }
}

- (void)fullScreenTextEditViewController:(id)a3 didFinishEditingByRemovingEffect:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[CFXPreviewViewController previewClip](self, "previewClip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jtEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeEffect:", v7);
  -[CFXPreviewViewController previewPlayer](self, "previewPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateCompositionForEffectChange");

  -[CFXPreviewViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "previewViewControllerDidStopEditingText:", self);

  CFXLog_action();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[CFXPreviewViewController previewClip](self, "previewClip");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "effectStack");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CFXActionLogging actionLogAsJSONForEvent:atLocation:withEffectStack:](CFXActionLogging, "actionLogAsJSONForEvent:atLocation:withEffectStack:", CFSTR("effect removed"), CFSTR("post-capture"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v13;
    _os_log_impl(&dword_2269A9000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v14, 0xCu);

  }
}

- (int64_t)faceTrackingInterfaceOrientationForfullScreenTextEditViewController:(id)a3
{
  void *v3;
  int64_t v4;

  -[CFXPreviewViewController previewClip](self, "previewClip", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mediaInterfaceOrientationForDisplay");

  return v4;
}

- (void)CFX_addEffect:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Cannot display text editor on insert because its already open", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke_3_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_2269A9000, v0, OS_LOG_TYPE_ERROR, "could not generate export file name", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void __54__CFXPreviewViewController_CFX_exportPhotoWithEffects__block_invoke_3_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2269A9000, v0, v1, "could not write to file %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "playback direct pan gesture begin - apply pan", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "playback direct pan gesture begin - did not find hit test effect", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, v0, v1, "playback direct pan gesture begin - found hit test effect: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, v0, v1, "playback direct pan gesture begin - found effect already being edited: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "playback direct pan gesture begin", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "playback direct pan gesture changed - apply pan", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "playback direct pan gesture finished - no more gestures applied, ending effect editing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)playbackAreaPanned:gesture:normalizedClipPoint:normalizedMinimumSize:translationDelta:atTime:timeScale:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "playback direct pan gesture finished - apply pan", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "playback direct pinch gesture begin - apply pinch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "playback direct pinch gesture begin - did not find hit test effect", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, v0, v1, "playback direct pinch gesture begin - found hit test effect: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, v0, v1, "playback direct pinch gesture begin - found effect already being edited: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "playback direct pinch gesture begin", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "playback direct pinch gesture changed - apply pinch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "playback direct pinch gesture finished - no more gestures applied, ending effect editing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)playbackAreaPinched:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:scaleDelta:atTime:timeScale:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "playback direct pinch gesture finished - apply pinch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "playback direct rotate gesture begin - apply rotate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "playback direct rotated gesture begin - did not find hit test effect", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, v0, v1, "playback direct rotated gesture begin - found hit test effect: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, v0, v1, "playback direct rotated gesture begin - found effect already being edited: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "playback direct rotate gesture begin", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "playback direct rotate gesture changed - apply pinch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "playback direct rotate gesture finished - no more gestures applied, ending effect editing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)playbackAreaRotated:gesture:normalizedClipPoints:normalizedCenterPoint:normalizedMinimumSize:rotateDelta:atTime:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "playback direct rotate gesture finished - apply rotate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)displayEffectEditorForEffect:forMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "Request to display text editor for edit ignored because already open", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__CFXPreviewViewController_CFX_createAlbumWithCompletionHandler___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2269A9000, a2, a3, "ERROR: failed to create the album (%@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __77__CFXPreviewViewController_CFX_addAssetAtURL_resourceType_completionHandler___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_2269A9000, log, OS_LOG_TYPE_ERROR, "ERROR: failed to move asset (%@) to the album (%@)", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_4();
}

void __83__CFXPreviewViewController_CFX_addAssetWithIdentifier_intoAlbum_completionHandler___block_invoke_4_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2269A9000, a2, a3, "ERROR: failed to assign album (%@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

@end
