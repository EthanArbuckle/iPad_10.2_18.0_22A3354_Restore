@implementation HUClipScrubberViewController

- (HUClipScrubberViewController)initWithPlaybackEngine:(id)a3
{
  id v4;
  HUClipScrubberViewController *v5;
  HUClipScrubberViewController *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUClipScrubberViewController;
  v5 = -[HUClipScrubberViewController init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_playbackEngine, v4);
    objc_msgSend(MEMORY[0x1E0D31250], "defaultOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:withOptions:", v6, v8);

    objc_msgSend(v4, "cameraProfile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clipManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUClipScrubberViewController reloadClipManager:](v6, "reloadClipManager:", v10);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[HUPosterFrameViewCache purgeCache](HUPosterFrameViewCache, "purgeCache");
  objc_msgSend(MEMORY[0x1E0D313C8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HUClipScrubberViewController;
  -[HUClipScrubberViewController dealloc](&v4, sel_dealloc);
}

- (void)reloadClipManager:(id)a3
{
  void *v4;
  void *v5;
  HUClipScrubberDataSource *v6;
  void *v7;
  HUClipScrubberDataSource *v8;
  void *v9;
  void *v10;
  HUClipScrubberScrollDelegate *v11;
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

  -[HUClipScrubberViewController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HUClipScrubberViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadEvents");
  }
  else
  {
    v6 = [HUClipScrubberDataSource alloc];
    -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HUClipScrubberDataSource initWithPlaybackEngine:](v6, "initWithPlaybackEngine:", v7);
    -[HUClipScrubberViewController setDataSource:](self, "setDataSource:", v8);

    -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUClipScrubberViewController dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPlaybackEngine:", v9);

    v11 = -[HUClipScrubberScrollDelegate initWithDataSource:]([HUClipScrubberScrollDelegate alloc], "initWithDataSource:", self->_dataSource);
    -[HUClipScrubberViewController setClipScrollDelegate:](self, "setClipScrollDelegate:", v11);

    -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUClipScrubberViewController clipScrollDelegate](self, "clipScrollDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPlaybackEngine:", v12);

    -[HUClipScrubberViewController clipScrollDelegate](self, "clipScrollDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUClipScrubberViewController scrubberView](self, "scrubberView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "clipCollectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:", v14);

    -[HUClipScrubberViewController scrubberView](self, "scrubberView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "clipCollectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUClipScrubberViewController dataSource](self, "dataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setClipCollectionView:", v18);

    -[HUClipScrubberViewController clipScrollDelegate](self, "clipScrollDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUClipScrubberViewController scrubberView](self, "scrubberView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "clipCollectionView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateCollectionView:", v21);

  }
  -[HUClipScrubberViewController updateSelectionPlatterDisplay](self, "updateSelectionPlatterDisplay");
}

- (void)loadView
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
  void *v13;
  id v14;

  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[HUClipScrubberViewController setView:](self, "setView:", v4);

  -[HUClipScrubberViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController scrubberView](self, "scrubberView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[HUClipScrubberViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController selectionPlatter](self, "selectionPlatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[HUClipScrubberViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController nearbyAccessoriesPlatter](self, "nearbyAccessoriesPlatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  -[HUClipScrubberViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController feedbackPlatter](self, "feedbackPlatter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  -[HUClipScrubberViewController changeToLiveModeIfNeeded](self, "changeToLiveModeIfNeeded");
  -[HUClipScrubberViewController updateAccessoryViews](self, "updateAccessoryViews");
  -[HUClipScrubberViewController scrubberView](self, "scrubberView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateDisplayMode:", 0);

  -[HUClipScrubberViewController updateScrubberViewAndAssociatedConstraints](self, "updateScrubberViewAndAssociatedConstraints");
  objc_msgSend(MEMORY[0x1E0D313C8], "sharedInstance");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:", self);

}

- (void)updateScrubberViewAndAssociatedConstraints
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  -[HUClipScrubberViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditing");

  if (v4)
    goto LABEL_5;
  -[HUClipScrubberViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hu_hasExtendedWidth");

  -[HUClipScrubberViewController nearbyAccessoriesPlatterTopAnchorConstraint](self, "nearbyAccessoriesPlatterTopAnchorConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6)
  {
    objc_msgSend(v7, "setConstant:", 0.0);

    -[HUClipScrubberViewController selectionPlatterTopAnchorConstraint](self, "selectionPlatterTopAnchorConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setConstant:", 0.0);

LABEL_5:
    -[HUClipScrubberViewController scrubberViewLeftAnchorConstraint](self, "scrubberViewLeftAnchorConstraint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setConstant:", 0.0);

    -[HUClipScrubberViewController scrubberViewRightAnchorConstraint](self, "scrubberViewRightAnchorConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0.0;
    goto LABEL_6;
  }
  objc_msgSend(v7, "setConstant:", 63.0);

  -[HUClipScrubberViewController selectionPlatterTopAnchorConstraint](self, "selectionPlatterTopAnchorConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setConstant:", 63.0);

  -[HUClipScrubberViewController scrubberViewLeftAnchorConstraint](self, "scrubberViewLeftAnchorConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConstant:", 63.0);

  -[HUClipScrubberViewController scrubberViewRightAnchorConstraint](self, "scrubberViewRightAnchorConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -63.0;
LABEL_6:
  v15 = v11;
  objc_msgSend(v11, "setConstant:", v12);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)HUClipScrubberViewController;
  v7 = a4;
  -[HUClipScrubberViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[HUClipScrubberViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelectionViewHidden:", 1);

  v9[4] = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__HUClipScrubberViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_1E6F4CB78;
  v10[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__HUClipScrubberViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v9[3] = &unk_1E6F4CB78;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v10, v9);

}

uint64_t __83__HUClipScrubberViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hu_hasExtendedWidth");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "displayMode");

    if (!v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "scrubberView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "updateDisplayMode:", 0);

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "updateScrubberViewAndAssociatedConstraints");
}

void __83__HUClipScrubberViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateSelectionViewIfNeeded");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUClipScrubberViewController;
  -[HUClipScrubberViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[HUClipScrubberViewController setIsVisible:](self, "setIsVisible:", 1);
  -[HUClipScrubberViewController _addConstraints](self, "_addConstraints");
  -[HUClipScrubberViewController _createAndStartDisplayLink](self, "_createAndStartDisplayLink");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUClipScrubberViewController;
  -[HUClipScrubberViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[HUClipScrubberViewController _removeDisplayLink](self, "_removeDisplayLink");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUClipScrubberViewController;
  -[HUClipScrubberViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[HUClipScrubberViewController setIsVisible:](self, "setIsVisible:", 0);
}

- (void)_createAndStartDisplayLink
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HUClipScrubberViewController scrubberUpdateDisplayLink](self, "scrubberUpdateDisplayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUClipScrubberViewController scrubberUpdateDisplayLink](self, "scrubberUpdateDisplayLink");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

  }
  objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__scrubberDisplayLinkTick_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController setScrubberUpdateDisplayLink:](self, "setScrubberUpdateDisplayLink:", v5);

  -[HUClipScrubberViewController scrubberUpdateDisplayLink](self, "scrubberUpdateDisplayLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addToRunLoop:forMode:", v7, *MEMORY[0x1E0C99860]);

  -[HUClipScrubberViewController updateScrubberDisplayLinkState](self, "updateScrubberDisplayLinkState");
}

- (void)_removeDisplayLink
{
  id v2;

  -[HUClipScrubberViewController scrubberUpdateDisplayLink](self, "scrubberUpdateDisplayLink");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)_addConstraints
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
  _QWORD v75[18];

  v75[16] = *MEMORY[0x1E0C80C00];
  -[HUClipScrubberViewController scrubberView](self, "scrubberView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController setScrubberViewRightAnchorConstraint:](self, "setScrubberViewRightAnchorConstraint:", v7);

  -[HUClipScrubberViewController scrubberView](self, "scrubberView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leftAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leftAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController setScrubberViewLeftAnchorConstraint:](self, "setScrubberViewLeftAnchorConstraint:", v12);

  -[HUClipScrubberViewController selectionPlatter](self, "selectionPlatter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController setSelectionPlatterTopAnchorConstraint:](self, "setSelectionPlatterTopAnchorConstraint:", v17);

  -[HUClipScrubberViewController nearbyAccessoriesPlatter](self, "nearbyAccessoriesPlatter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController setNearbyAccessoriesPlatterTopAnchorConstraint:](self, "setNearbyAccessoriesPlatterTopAnchorConstraint:", v22);

  -[HUClipScrubberViewController feedbackPlatter](self, "feedbackPlatter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController setFeedbackPlatterTopAnchorConstraint:](self, "setFeedbackPlatterTopAnchorConstraint:", v27);

  -[HUClipScrubberViewController scrubberViewLeftAnchorConstraint](self, "scrubberViewLeftAnchorConstraint");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v74;
  -[HUClipScrubberViewController scrubberViewRightAnchorConstraint](self, "scrubberViewRightAnchorConstraint");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v75[1] = v73;
  -[HUClipScrubberViewController scrubberView](self, "scrubberView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "heightAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToConstant:", 47.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v75[2] = v70;
  -[HUClipScrubberViewController scrubberView](self, "scrubberView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "topAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController view](self, "view");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "topAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:constant:", v66, 63.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v75[3] = v65;
  -[HUClipScrubberViewController selectionPlatter](self, "selectionPlatter");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "leftAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController view](self, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "leftAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v75[4] = v60;
  -[HUClipScrubberViewController selectionPlatter](self, "selectionPlatter");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "widthAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToConstant:", 54.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v75[5] = v57;
  -[HUClipScrubberViewController selectionPlatter](self, "selectionPlatter");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "heightAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToConstant:", 47.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v75[6] = v54;
  -[HUClipScrubberViewController selectionPlatterTopAnchorConstraint](self, "selectionPlatterTopAnchorConstraint");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v75[7] = v53;
  -[HUClipScrubberViewController nearbyAccessoriesPlatter](self, "nearbyAccessoriesPlatter");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "rightAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "rightAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v75[8] = v48;
  -[HUClipScrubberViewController nearbyAccessoriesPlatter](self, "nearbyAccessoriesPlatter");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "heightAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToConstant:", 47.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v75[9] = v44;
  -[HUClipScrubberViewController nearbyAccessoriesPlatter](self, "nearbyAccessoriesPlatter");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "widthAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToConstant:", 54.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v75[10] = v41;
  -[HUClipScrubberViewController nearbyAccessoriesPlatterTopAnchorConstraint](self, "nearbyAccessoriesPlatterTopAnchorConstraint");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v75[11] = v40;
  -[HUClipScrubberViewController feedbackPlatter](self, "feedbackPlatter");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "rightAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "rightAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v75[12] = v30;
  -[HUClipScrubberViewController feedbackPlatter](self, "feedbackPlatter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "heightAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToConstant:", 45.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v75[13] = v33;
  -[HUClipScrubberViewController feedbackPlatter](self, "feedbackPlatter");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "widthAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToConstant:", 45.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v75[14] = v36;
  -[HUClipScrubberViewController feedbackPlatterTopAnchorConstraint](self, "feedbackPlatterTopAnchorConstraint");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v75[15] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 16);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v47);
}

- (void)togglePlayPause
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "timeControlStatus");

  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v4 != 0;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "User toggled playback engine [Playing:%{BOOL}d].", (uint8_t *)v8, 8u);
  }

  -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    objc_msgSend(v6, "pause");
  else
    objc_msgSend(v6, "play");

}

- (void)changeToLiveModeIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentClip");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

    goto LABEL_5;
  }
  v5 = (void *)v4;
  -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playbackPosition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "contentType");

  if (!v8)
LABEL_5:
    -[HUClipScrubberViewController changeToLiveMode](self, "changeToLiveMode");
}

- (void)changeToLiveMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D31258], "livePosition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaybackPosition:", v3);

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[HUClipScrubberViewController scrubberView](self, "scrubberView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rightActionButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

  }
}

- (void)updateDisplayForLiveMode
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  -[HUClipScrubberViewController selectionButton](self, "selectionButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

  -[HUClipScrubberViewController clipScrollDelegate](self, "clipScrollDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isUserScrubbing");

  if ((v5 & 1) == 0)
  {
    -[HUClipScrubberViewController clipScrollDelegate](self, "clipScrollDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShouldIgnoreScrolling:", 1);

    -[HUClipScrubberViewController scrubberView](self, "scrubberView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigateToLivePosition");

    -[HUClipScrubberViewController clipScrollDelegate](self, "clipScrollDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShouldIgnoreScrolling:", 0);

  }
}

- (void)showAssociatedAccessories
{
  void (**v2)(void);

  -[HUClipScrubberViewController accessoryButtonHandler](self, "accessoryButtonHandler");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

- (void)playbackEngine:(id)a3 didUpdatePlaybackPosition:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = objc_msgSend(v6, "isUserScrubbing");
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "User Scrubbing:%{BOOL}d updated playback position:%@", (uint8_t *)v9, 0x12u);
  }

  -[HUClipScrubberViewController updateAccessoryViews](self, "updateAccessoryViews");
  -[HUClipScrubberViewController updatePlaybackPosition:animated:](self, "updatePlaybackPosition:animated:", v7, 1);

}

- (void)playbackEngine:(id)a3 didUpdateTimeControlStatus:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "timeControlStatusDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;

  }
  -[HUClipScrubberViewController updateAccessoryViews](self, "updateAccessoryViews");
  -[HUClipScrubberViewController updateScrubberDisplayLinkState](self, "updateScrubberDisplayLinkState");

}

- (void)playbackEngine:(id)a3 didUpdatePlaybackError:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HUClipScrubberViewController *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__HUClipScrubberViewController_playbackEngine_didUpdatePlaybackError___block_invoke;
  v7[3] = &unk_1E6F4C638;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __70__HUClipScrubberViewController_playbackEngine_didUpdatePlaybackError___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(result + 40), "removeLiveButtonHighlighting");
  return result;
}

- (double)currentScrubberResolution
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentClip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HUClipScrubberViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scrubbingResolutionForClip:", v4);
    v7 = v6;

  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (void)updateScrubberDisplayLinkState
{
  uint64_t v3;
  void *v4;
  id v5;

  -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "timeControlStatus"))
    v3 = -[HUClipScrubberViewController isVisible](self, "isVisible") ^ 1;
  else
    v3 = 1;
  -[HUClipScrubberViewController scrubberUpdateDisplayLink](self, "scrubberUpdateDisplayLink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPaused:", v3);

}

- (void)_scrubberDisplayLinkTick:(id)a3
{
  void *v4;
  id v5;

  -[HUClipScrubberViewController playbackEngine](self, "playbackEngine", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playbackPosition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController updatePlaybackPosition:animated:](self, "updatePlaybackPosition:animated:", v4, 0);

}

- (void)updateAccessoryViews
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  id v7;

  -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "timelineState") == 2;
  -[HUClipScrubberViewController selectionButton](self, "selectionButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

  -[HUClipScrubberViewController scrubberView](self, "scrubberView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didUpdatePlaybackEngine:", v6);

}

- (void)updatePlaybackPosition:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  _QWORD aBlock[4];
  id v34;
  HUClipScrubberViewController *v35;
  id v36;
  uint8_t buf[4];
  unint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v4 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HUClipScrubberViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clipPlaybackDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HUClipScrubberViewController lastEngineMode](self, "lastEngineMode");
  -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "engineMode");

  if (v9 != v11)
  {
    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = -[HUClipScrubberViewController lastEngineMode](self, "lastEngineMode");
      -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218240;
      v38 = v13;
      v39 = 2048;
      v40 = objc_msgSend(v14, "engineMode");
      _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "Updating the last engine mode from %lu to %lu", buf, 0x16u);

    }
    -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUClipScrubberViewController setLastEngineMode:](self, "setLastEngineMode:", objc_msgSend(v15, "engineMode"));

    -[HUClipScrubberViewController updateAccessoryViews](self, "updateAccessoryViews");
    if (objc_msgSend(v6, "contentType") && objc_msgSend(v7, "currentTimelineState") != 1)
    {
      if (!objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled"))
        goto LABEL_11;
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HUClipScrubberViewController updateDisplayForLiveMode](self, "updateDisplayForLiveMode");
      if (!objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled"))
        goto LABEL_11;
      objc_msgSend(MEMORY[0x1E0CEA478], "orangeColor");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v16;
    -[HUClipScrubberViewController scrubberView](self, "scrubberView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "rightActionButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v17);

  }
LABEL_11:
  if (objc_msgSend(v6, "contentType"))
  {
    objc_msgSend(v7, "setCurrentDate:", v8);
    -[HUClipScrubberViewController clipScrollDelegate](self, "clipScrollDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isUserScrubbing");

    if ((v21 & 1) == 0)
    {
      objc_msgSend(v6, "clip");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        v24 = v22;
      }
      else
      {
        -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "currentClip");
        v24 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v7, "setCurrentEvent:", v24);
      objc_msgSend(v6, "clipPlaybackDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCurrentDate:", v26);

      v27 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __64__HUClipScrubberViewController_updatePlaybackPosition_animated___block_invoke;
      aBlock[3] = &unk_1E6F4E020;
      v28 = v24;
      v34 = v28;
      v35 = self;
      v36 = v7;
      v29 = _Block_copy(aBlock);
      v30 = v29;
      if (v4)
      {
        -[HUClipScrubberViewController clipScrollDelegate](self, "clipScrollDelegate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setShouldIgnoreScrolling:", 1);

        v32[0] = v27;
        v32[1] = 3221225472;
        v32[2] = __64__HUClipScrubberViewController_updatePlaybackPosition_animated___block_invoke_2;
        v32[3] = &unk_1E6F4E300;
        v32[4] = self;
        objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v30, v32, 0.2);
      }
      else
      {
        (*((void (**)(void *))v29 + 2))(v29);
      }

    }
  }
  else
  {
    -[HUClipScrubberViewController updateDisplayForLiveMode](self, "updateDisplayForLiveMode");
  }

}

void __64__HUClipScrubberViewController_updatePlaybackPosition_animated___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "scrubberView");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "offsetForEvent:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v2, "navigateToOffset:");

  }
}

void __64__HUClipScrubberViewController_updatePlaybackPosition_animated___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "clipScrollDelegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setShouldIgnoreScrolling:", 0);

}

- (BOOL)userIsScrubbing
{
  void *v2;
  void *v3;
  char v4;

  -[HUClipScrubberViewController scrubberView](self, "scrubberView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clipCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTracking");

  return v4;
}

- (void)didPinch:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[HUClipScrubberViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserControlled:", 1);

  switch(objc_msgSend(v8, "state"))
  {
    case 1:
      -[HUClipScrubberViewController clipScrollDelegate](self, "clipScrollDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setShouldIgnoreScrolling:", 1);

      -[HUClipScrubberViewController dataSource](self, "dataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "beginTimeScaleTrackingForPinchGesture:", v8);
      goto LABEL_5;
    case 2:
      -[HUClipScrubberViewController dataSource](self, "dataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "changeTimeScaleForPinchGesture:", v8);
      goto LABEL_5;
    case 3:
    case 5:
      -[HUClipScrubberViewController clipScrollDelegate](self, "clipScrollDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setShouldIgnoreScrolling:", 0);
LABEL_5:

      break;
    default:
      break;
  }

}

- (void)didTap:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
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
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  id v32;

  v32 = a3;
  if (objc_msgSend(v32, "numberOfTouches") == 1)
  {
    -[HUClipScrubberViewController scrubberView](self, "scrubberView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clipCollectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "locationOfTouch:inView:", 0, v5);
    v7 = v6;
    v9 = v8;

    -[HUClipScrubberViewController scrubberView](self, "scrubberView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clipCollectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "indexPathForItemAtPoint:", v7, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUClipScrubberViewController dataSource](self, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v13, "isValidRecordingEventAtIndexPath:", v12);

    if (!(_DWORD)v11)
    {
LABEL_15:

      goto LABEL_16;
    }
    -[HUClipScrubberViewController dataSource](self, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateToClipAtIndexPath:", v12);

    -[HUClipScrubberViewController scrubberView](self, "scrubberView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "clipCollectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cellForItemAtIndexPath:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v15) = -[HUClipScrubberViewController _cellBoundsContainsPlayhead:](self, "_cellBoundsContainsPlayhead:", v17);
    -[HUClipScrubberViewController dataSource](self, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if ((_DWORD)v15)
      objc_msgSend(v18, "selectedDateFromCell:atOffset:", v17, v7);
    else
      objc_msgSend(v18, "startDateFromCell:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    -[HUClipScrubberViewController dataSource](self, "dataSource");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "currentEvent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v24 = v23;

    -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "updatePlaybackPositionToDate:usingClip:", v20, v24);

    -[HUClipScrubberViewController dataSource](self, "dataSource");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = objc_msgSend(v26, "isEditing");

    if ((_DWORD)v25)
    {
      -[HUClipScrubberViewController scrubberView](self, "scrubberView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "clipCollectionView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "selectItemAtIndexPath:animated:scrollPosition:", v12, 0, 0);

    }
    else
    {
      -[HUClipScrubberViewController dataSource](self, "dataSource");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "timeController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isAtMinimumZoom");

      if (!v31)
      {
LABEL_14:

        goto LABEL_15;
      }
      -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "play");
    }

    goto LABEL_14;
  }
LABEL_16:

}

- (void)didDoubleTap:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HUClipScrubberViewController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserControlled:", 1);

  -[HUClipScrubberViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAtMinimumZoom");

  -[HUClipScrubberViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "expandToMaximumZoom");

    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[HUClipScrubberViewController dataSource](self, "dataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeScale");
      v17 = 134217984;
      v18 = v14;
      v15 = "Double tapped the time scale = %.2f to zoom in.";
LABEL_6:
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v17, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v9, "shrinkToMinimumZoom");

    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[HUClipScrubberViewController dataSource](self, "dataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeScale");
      v17 = 134217984;
      v18 = v16;
      v15 = "Double tapped the time scale = %.2f to zoom out.";
      goto LABEL_6;
    }
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  char v11;

  v6 = a4;
  v7 = a3;
  -[HUClipScrubberViewController singleTapGestureRecognizer](self, "singleTapGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    -[HUClipScrubberViewController doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "isEqual:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)didSelectRightActionButton:(id)a3
{
  void *v4;
  uint64_t v5;

  -[HUClipScrubberViewController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "displayMode");

  if (v5)
    -[HUClipScrubberViewController showDeleteInterface](self, "showDeleteInterface");
  else
    -[HUClipScrubberViewController changeToLiveMode](self, "changeToLiveMode");
}

- (HUClipScrubberView)scrubberView
{
  HUClipScrubberView *scrubberView;
  HUClipScrubberView *v4;
  HUClipScrubberView *v5;
  HUClipScrubberView *v6;
  HUClipScrubberScrollDelegate *clipScrollDelegate;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UITapGestureRecognizer *v13;
  UITapGestureRecognizer *singleTapGestureRecognizer;
  void *v15;
  UITapGestureRecognizer *v16;
  UITapGestureRecognizer *doubleTapGestureRecognizer;
  void *v18;
  void *v19;

  scrubberView = self->_scrubberView;
  if (!scrubberView)
  {
    v4 = [HUClipScrubberView alloc];
    v5 = -[HUClipScrubberView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_scrubberView;
    self->_scrubberView = v5;

    -[HUClipScrubberView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrubberView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    clipScrollDelegate = self->_clipScrollDelegate;
    -[HUClipScrubberView clipCollectionView](self->_scrubberView, "clipCollectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", clipScrollDelegate);

    -[HUClipScrubberView playPauseButton](self->_scrubberView, "playPauseButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel_togglePlayPause, 64);

    -[HUClipScrubberView rightActionButton](self->_scrubberView, "rightActionButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel_didSelectRightActionButton_, 64);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA840]), "initWithTarget:action:", self, sel_didPinch_);
    -[HUClipScrubberViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addGestureRecognizer:", v11);

    v13 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel_didTap_);
    singleTapGestureRecognizer = self->_singleTapGestureRecognizer;
    self->_singleTapGestureRecognizer = v13;

    -[UITapGestureRecognizer setDelegate:](self->_singleTapGestureRecognizer, "setDelegate:", self);
    -[HUClipScrubberView clipCollectionView](self->_scrubberView, "clipCollectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addGestureRecognizer:", self->_singleTapGestureRecognizer);

    v16 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel_didDoubleTap_);
    doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
    self->_doubleTapGestureRecognizer = v16;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_doubleTapGestureRecognizer, "setNumberOfTapsRequired:", 2);
    -[UITapGestureRecognizer setMaximumIntervalBetweenSuccessiveTaps:](self->_doubleTapGestureRecognizer, "setMaximumIntervalBetweenSuccessiveTaps:", 0.15);
    -[HUClipScrubberView clipCollectionView](self->_scrubberView, "clipCollectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addGestureRecognizer:", self->_doubleTapGestureRecognizer);

    if (objc_msgSend(MEMORY[0x1E0D31288], "internalCameraFeedbackSupported"))
    {
      -[HUClipScrubberViewController feedbackButton](self, "feedbackButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel_didSelectFeedbackButton, 64);

    }
    scrubberView = self->_scrubberView;
  }
  return scrubberView;
}

- (UIButton)selectionButton
{
  UIButton *selectionButton;
  UIButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIButton *v9;

  selectionButton = self->_selectionButton;
  if (!selectionButton)
  {
    +[HUClipScrubberControlButton buttonWithType:](HUClipScrubberControlButton, "buttonWithType:", 1);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    -[UIButton addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, sel_showEditInterface, 64);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v4, "setTintColor:", v5);

    objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("square.and.arrow.up"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "hu_standardSymbolConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithConfiguration:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIButton setImage:forState:](v4, "setImage:forState:", v8, 0);
    v9 = self->_selectionButton;
    self->_selectionButton = v4;

    selectionButton = self->_selectionButton;
  }
  return selectionButton;
}

- (UIButton)nearbyAccessoriesButton
{
  UIButton *nearbyAccessoriesButton;
  UIButton *v4;
  UIButton *v5;

  nearbyAccessoriesButton = self->_nearbyAccessoriesButton;
  if (!nearbyAccessoriesButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "hu_clipScrubberNearbyAccessoryButton");
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    -[UIButton addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, sel_showAssociatedAccessories, 64);
    v5 = self->_nearbyAccessoriesButton;
    self->_nearbyAccessoriesButton = v4;

    nearbyAccessoriesButton = self->_nearbyAccessoriesButton;
  }
  return nearbyAccessoriesButton;
}

- (UIButton)feedbackButton
{
  UIButton *feedbackButton;
  UIButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIButton *v9;

  feedbackButton = self->_feedbackButton;
  if (!feedbackButton)
  {
    +[HUClipScrubberControlButton buttonWithType:](HUClipScrubberControlButton, "buttonWithType:", 1);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", 8.0);

    objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("apple.bubble.middle.bottom"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "hu_standardSymbolConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithConfiguration:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIButton setImage:forState:](v4, "setImage:forState:", v8, 0);
    v9 = self->_feedbackButton;
    self->_feedbackButton = v4;

    feedbackButton = self->_feedbackButton;
  }
  return feedbackButton;
}

- (UIView)feedbackPlatter
{
  UIView *feedbackPlatter;
  void *v4;
  UIView *v5;
  UIView *v6;

  feedbackPlatter = self->_feedbackPlatter;
  if (!feedbackPlatter)
  {
    -[HUClipScrubberViewController feedbackButton](self, "feedbackButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUClipScrubberViewController platterWithView:](self, "platterWithView:", v4);
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();

    -[UIView setHidden:](v5, "setHidden:", 1);
    v6 = self->_feedbackPlatter;
    self->_feedbackPlatter = v5;

    feedbackPlatter = self->_feedbackPlatter;
  }
  return feedbackPlatter;
}

- (id)platterWithView:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0C8B3F8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(v5, "addSubview:applyingMaterialStyle:tintEffectStyle:", v4, 0, 1);

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "_setContinuousCornerRadius:", 8.0);
  return v5;
}

- (UIView)selectionPlatter
{
  UIView *selectionPlatter;
  void *v4;
  UIView *v5;
  UIView *v6;

  selectionPlatter = self->_selectionPlatter;
  if (!selectionPlatter)
  {
    -[HUClipScrubberViewController selectionButton](self, "selectionButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUClipScrubberViewController platterWithView:](self, "platterWithView:", v4);
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();

    v6 = self->_selectionPlatter;
    self->_selectionPlatter = v5;

    selectionPlatter = self->_selectionPlatter;
  }
  return selectionPlatter;
}

- (UIView)nearbyAccessoriesPlatter
{
  UIView *nearbyAccessoriesPlatter;
  void *v4;
  UIView *v5;
  UIView *v6;

  nearbyAccessoriesPlatter = self->_nearbyAccessoriesPlatter;
  if (!nearbyAccessoriesPlatter)
  {
    -[HUClipScrubberViewController nearbyAccessoriesButton](self, "nearbyAccessoriesButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUClipScrubberViewController platterWithView:](self, "platterWithView:", v4);
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();

    v6 = self->_nearbyAccessoriesPlatter;
    self->_nearbyAccessoriesPlatter = v5;

    nearbyAccessoriesPlatter = self->_nearbyAccessoriesPlatter;
  }
  return nearbyAccessoriesPlatter;
}

- (BOOL)_cellBoundsContainsPlayhead:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  void *v24;
  void *v25;
  CGRect v27;
  CGRect v28;

  v4 = a3;
  -[HUClipScrubberViewController scrubberView](self, "scrubberView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clipCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[HUClipScrubberViewController scrubberView](self, "scrubberView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertRect:toView:", v15, v8, v10, v12, v14);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  -[HUClipScrubberViewController scrubberView](self, "scrubberView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "playheadView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  v28.origin.x = v17;
  v28.origin.y = v19;
  v28.size.width = v21;
  v28.size.height = v23;
  LOBYTE(v5) = CGRectIntersectsRect(v27, v28);

  return (char)v5;
}

- (unint64_t)displayMode
{
  void *v2;
  unint64_t v3;

  -[HUClipScrubberViewController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "displayMode");

  return v3;
}

- (void)presentFeedbackConsent
{
  void *v3;
  void *v4;
  HUFeedbackConsentViewController *v5;

  v5 = -[HUFeedbackConsentViewController initWithConsentDelegate:]([HUFeedbackConsentViewController alloc], "initWithConsentDelegate:", self);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v5);
  objc_msgSend(v3, "setModalPresentationStyle:", 2);
  -[HUClipScrubberViewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentViewController:animated:completion:", v3, 1, 0);

}

- (void)consentController:(id)a3 didFinishConsentWithAnswer:(BOOL)a4
{
  _QWORD v4[5];

  if (a4)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __77__HUClipScrubberViewController_consentController_didFinishConsentWithAnswer___block_invoke;
    v4[3] = &unk_1E6F4D988;
    v4[4] = self;
    -[HUClipScrubberViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v4);
  }
}

uint64_t __77__HUClipScrubberViewController_consentController_didFinishConsentWithAnswer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didSelectFeedbackButton");
}

- (void)exportCurrentClipWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, void *);
  void *v30;
  NSObject *v31;
  HUClipScrubberViewController *v32;
  NSObject *v33;
  void (**v34)(_QWORD);
  uint8_t buf[4];
  NSObject *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  -[HUClipScrubberViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containerType");

  if (v7 == 2)
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[HUClipScrubberViewController dataSource](self, "dataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentEvent");
      v10 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = v10;
      _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "Unable to share event:%@.", buf, 0xCu);

    }
  }
  else
  {
    objc_opt_class();
    -[HUClipScrubberViewController dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentEvent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v8 = v13;

    if (v8)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D311D8]), "initWithCameraClip:", v8);
      -[HUClipScrubberViewController setExportSessionEvent:](self, "setExportSessionEvent:", v14);

      objc_msgSend(MEMORY[0x1E0D31288], "videoDestinationURLForCameraClip:", v8);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(MEMORY[0x1E0D311F8], "hasCachedRecordingForCameraClip:", v8);
      HFLogForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (v18)
        {
          *(_DWORD *)buf = 138412290;
          v36 = v15;
          _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "Exportable file already exists at path:%@.", buf, 0xCu);
        }

        v4[2](v4);
        -[HUClipScrubberViewController exportLocalClipAtURL:](self, "exportLocalClipAtURL:", v15);
      }
      else
      {
        if (v18)
        {
          *(_DWORD *)buf = 138412290;
          v36 = v8;
          _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "Requesting downloaded video asset for export for clip:%@", buf, 0xCu);
        }

        v21 = objc_alloc(MEMORY[0x1E0CBA3E0]);
        -[HUClipScrubberViewController dataSource](self, "dataSource");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "playbackEngine");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "cameraProfile");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "clipManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v21, "initWithClipManager:clip:", v25, v8);

        objc_msgSend(v26, "setClipDestinationFileURL:", v15);
        objc_msgSend(v26, "setDownloadProgressHandler:", &__block_literal_global_210);
        v27 = MEMORY[0x1E0C809B0];
        v28 = 3221225472;
        v29 = __64__HUClipScrubberViewController_exportCurrentClipWithCompletion___block_invoke_63;
        v30 = &unk_1E6F5B380;
        v31 = v8;
        v32 = self;
        v34 = v4;
        v15 = v15;
        v33 = v15;
        objc_msgSend(v26, "setFetchVideoAssetContextCompletionBlock:", &v27);
        objc_msgSend(v26, "start", v27, v28, v29, v30);
        -[HUClipScrubberViewController setExportDownloadOperation:](self, "setExportDownloadOperation:", v26);

      }
    }
    else
    {
      HFLogForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_ERROR, "Unable to share nil clip.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleError:", v15);

    }
  }

}

void __64__HUClipScrubberViewController_exportCurrentClipWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = a2;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Exporting with progress ...%lu", (uint8_t *)&v4, 0xCu);
  }

}

void __64__HUClipScrubberViewController_exportCurrentClipWithCompletion___block_invoke_63(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v16 = v4;
      v17 = 2112;
      v18 = v11;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "Error: %@ fetching clip: %@.", buf, 0x16u);
    }

    if (objc_msgSend(v4, "code") != 12)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __64__HUClipScrubberViewController_exportCurrentClipWithCompletion___block_invoke_64;
      v12[3] = &unk_1E6F4C638;
      v9 = v4;
      v10 = *(_QWORD *)(a1 + 40);
      v13 = v9;
      v14 = v10;
      dispatch_async(MEMORY[0x1E0C80D38], v12);

    }
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v6, v7, v8);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(*(id *)(a1 + 40), "exportLocalClipAtURL:", *(_QWORD *)(a1 + 48));
  }

}

uint64_t __64__HUClipScrubberViewController_exportCurrentClipWithCompletion___block_invoke_64(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleError:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "exportSessionEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "sendEventForState:", 1);

  return objc_msgSend(*(id *)(a1 + 40), "setExportSessionEvent:", 0);
}

- (void)exportLocalClipAtURL:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__HUClipScrubberViewController_exportLocalClipAtURL___block_invoke;
  v6[3] = &unk_1E6F4C638;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __53__HUClipScrubberViewController_exportLocalClipAtURL___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  HUCameraRecordingFeedbackActivity *v17;
  void *v18;
  void *v19;
  id v20;
  HUCameraRecordingFeedbackActivity *v21;
  HUCameraRecordingFeedbackActivity **v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  HUClipExporterItemProvider *v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  HUClipExporterItemProvider *v48;
  HUCameraRecordingFeedbackActivity *v49;
  HUCameraRecordingFeedbackActivity *v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  double v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_displayableURLForCameraClipURL:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31288], "durationOfRecordingAtURL:", v2);
  v4 = v3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v52 = v2;
    v53 = 2048;
    v54 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Preparing file for export at path:%@ for duration:%.2f.", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "exportSessionEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRecordingDuration:", v4);

  objc_msgSend(*(id *)(a1 + 32), "exportSessionEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "sendEventForState:", 0);

  objc_msgSend(*(id *)(a1 + 32), "setExportSessionEvent:", 0);
  v42 = -[HUClipExporterItemProvider initWithURL:]([HUClipExporterItemProvider alloc], "initWithURL:", v2);
  v9 = objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentEvent");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v11;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v9, objc_opt_class());

LABEL_9:
    v13 = 0;
  }

  v16 = MEMORY[0x1E0C809B0];
  if (v13)
  {
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v17 = [HUCameraRecordingFeedbackActivity alloc];
    objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "cameraProfile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v16;
    v45[1] = 3221225472;
    v45[2] = __53__HUClipScrubberViewController_exportLocalClipAtURL___block_invoke_68;
    v45[3] = &unk_1E6F5B3A8;
    objc_copyWeak(&v47, (id *)buf);
    v20 = v13;
    v46 = v20;
    v21 = -[HUCameraRecordingFeedbackActivity initWithCameraClip:cameraProfile:completionHandler:](v17, "initWithCameraClip:cameraProfile:completionHandler:", v20, v19, v45);

    if (objc_msgSend(MEMORY[0x1E0D319D0], "isInternalInstall"))
    {
      v50 = v21;
      v22 = &v50;
    }
    else
    {
      if (!objc_msgSend(v20, "canAskForUserFeedback"))
      {
        v23 = 0;
        goto LABEL_18;
      }
      v49 = v21;
      v22 = &v49;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

    objc_destroyWeak(&v47);
    objc_destroyWeak((id *)buf);
    goto LABEL_19;
  }
  v23 = 0;
LABEL_19:
  v24 = objc_alloc(MEMORY[0x1E0CEA2D8]);
  v48 = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithActivityItems:applicationActivities:", v25, v23);

  v43[0] = v16;
  v43[1] = 3221225472;
  v43[2] = __53__HUClipScrubberViewController_exportLocalClipAtURL___block_invoke_3;
  v43[3] = &unk_1E6F5B3D0;
  v44 = v2;
  v27 = v2;
  objc_msgSend(v26, "setCompletionWithItemsHandler:", v43);
  objc_msgSend(v26, "setExcludedActivityTypes:", &unk_1E7042D20);
  v29 = *(void **)(a1 + 32);
  v28 = (id *)(a1 + 32);
  objc_msgSend(v29, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "popoverPresentationController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setSourceView:", v30);

  objc_msgSend(*v28, "scrubberView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "frame");
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  objc_msgSend(v26, "popoverPresentationController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setSourceRect:", v34, v36, v38, v40);

  objc_msgSend(*v28, "presentViewController:animated:completion:", v26, 1, 0);
}

void __53__HUClipScrubberViewController_exportLocalClipAtURL___block_invoke_68(uint64_t a1, int a2)
{
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id v6;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __53__HUClipScrubberViewController_exportLocalClipAtURL___block_invoke_2;
    v4[3] = &unk_1E6F4C638;
    v5 = *(id *)(a1 + 32);
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, v4);

  }
}

uint64_t __53__HUClipScrubberViewController_exportLocalClipAtURL___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isDonated");
  v3 = *(void **)(a1 + 40);
  if (v2)
    return objc_msgSend(v3, "presentPreviouslySubmittedClipAlert");
  else
    return objc_msgSend(v3, "donateClip:", *(_QWORD *)(a1 + 32));
}

void __53__HUClipScrubberViewController_exportLocalClipAtURL___block_invoke_3(uint64_t a1, void *a2, int a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  _BYTE v21[10];
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v10, "removeItemAtPath:error:", v11, &v17);
  v12 = v17;

  if (v12)
  {
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v19 = v16;
      v20 = 2112;
      *(_QWORD *)v21 = v12;
      _os_log_error_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_ERROR, "Unable to remove file:%@ with error:%@", buf, 0x16u);
    }

    v14 = 0;
  }
  else
  {
    v14 = 1;
  }
  HFLogForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v19 = v8;
    v20 = 1024;
    *(_DWORD *)v21 = a3;
    *(_WORD *)&v21[4] = 1024;
    *(_DWORD *)&v21[6] = v14;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "Finished export activity for activityType:%@ completed:%{BOOL}d removedClip:%{BOOL}d with error:%@", buf, 0x22u);
  }

}

- (id)_displayableURLForCameraClipURL:(id)a3
{
  id v4;
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
  int v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D311F8];
  -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cameraProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentClip");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateOfOccurrence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userFriendlyExportURLForCameraName:withStartDate:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_5;
  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("null")))
  {

LABEL_5:
    HFLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[HUClipScrubberViewController dataSource](self, "dataSource");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "currentEvent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "uniqueIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "cameraProfile");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "accessory");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "name");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v42 = v30;
      v43 = 2112;
      v44 = v34;
      _os_log_error_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_ERROR, "Failure to create URL using clip:%@ and camera profile:%@", buf, 0x16u);

    }
    v18 = v4;
LABEL_8:
    v19 = v18;
    goto LABEL_9;
  }
  objc_msgSend(v13, "absoluteString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("(null)"));

  if (v16)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend(v21, "copyItemAtURL:toURL:error:", v4, v13, &v40);
  v22 = v40;

  if (!v22)
    goto LABEL_23;
  if (objc_msgSend(v22, "code") != 516)
  {
    HFLogForCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v22;
      goto LABEL_27;
    }
LABEL_17:

    v19 = v4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v22;
  objc_msgSend(v23, "removeItemAtPath:error:", v24, &v39);
  v25 = v39;

  HFLogForCategory();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (!v25)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v13;
      _os_log_impl(&dword_1B8E1E000, v27, OS_LOG_TYPE_DEFAULT, "Second attempt to copy file after removal for displayableURL:%@.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    objc_msgSend(v36, "copyItemAtURL:toURL:error:", v4, v13, &v38);
    v22 = v38;

    if (v22)
    {
      HFLogForCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v22;
LABEL_27:
        _os_log_error_impl(&dword_1B8E1E000, v35, OS_LOG_TYPE_ERROR, "Failure creating user-friendly export link: %@", buf, 0xCu);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
LABEL_23:
    HFLogForCategory();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v13;
      _os_log_impl(&dword_1B8E1E000, v37, OS_LOG_TYPE_DEFAULT, "Displaying user-friendly export link: %@", buf, 0xCu);
    }

    v18 = v13;
    goto LABEL_8;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v42 = v13;
    v43 = 2112;
    v44 = v4;
    _os_log_error_impl(&dword_1B8E1E000, v27, OS_LOG_TYPE_ERROR, "Failure to remove file at displayableURL:%@. Bailing and using url:%@", buf, 0x16u);
  }

  v19 = v4;
LABEL_9:

  return v19;
}

- (void)updateSelectionPlatterDisplay
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[HUClipScrubberViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditing");

  if (v4)
  {
    -[HUClipScrubberViewController selectionPlatter](self, "selectionPlatter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);
  }
  else
  {
    -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "hasRecordingEvents") ^ 1;
    -[HUClipScrubberViewController selectionPlatter](self, "selectionPlatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v5);

  }
}

- (void)deleteClip
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  objc_opt_class();
  -[HUClipScrubberViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_initWeak(location, self);
    -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cameraProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clipManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __42__HUClipScrubberViewController_deleteClip__block_invoke;
    v14[3] = &unk_1E6F4EBA0;
    objc_copyWeak(&v16, location);
    v15 = v6;
    objc_msgSend(v9, "deleteClipWithUUID:completion:", v10, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(location);
  }
  else
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[HUClipScrubberViewController dataSource](self, "dataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "currentEvent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v13;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "Unable to delete clip:%@", (uint8_t *)location, 0xCu);

    }
  }

}

void __42__HUClipScrubberViewController_deleteClip__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v13;
      v16 = 2112;
      v17 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_ERROR, "Unable to delete clip:%@ %@.", (uint8_t *)&v14, 0x16u);

    }
    HFLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HFLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HFLocalizedString();
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v6, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v10);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v9, 1, 0);

    goto LABEL_7;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v11;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Deleted clip:%@.", (uint8_t *)&v14, 0xCu);

LABEL_7:
  }

}

- (void)showDeleteInterface
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  _QWORD v50[5];
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D30598], 40, 0);
    v49 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleError:", v49);

  }
  else
  {
    -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pause");

    -[HUClipScrubberViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isComplete");

    if ((v7 & 1) != 0)
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUClipScrubberDeleteClipTitle"), CFSTR("HUClipScrubberDeleteClipTitle"), 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUClipScrubberDeleteClipMessage"), CFSTR("HUClipScrubberDeleteClipMessage"), 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v8, v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUClipScrubberViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "popoverPresentationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSourceView:", v11);

      -[HUClipScrubberViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUClipScrubberViewController scrubberView](self, "scrubberView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "rightActionButton");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "frame");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      -[HUClipScrubberViewController scrubberView](self, "scrubberView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "convertRect:fromView:", v24, v17, v19, v21, v23);
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v32 = v31;
      objc_msgSend(v10, "popoverPresentationController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setSourceRect:", v26, v28, v30, v32);

      v34 = (void *)MEMORY[0x1E0CEA2E0];
      _HULocalizedStringWithDefaultValue(CFSTR("HUClipScrubberDeleteClipButtonTitle"), CFSTR("HUClipScrubberDeleteClipButtonTitle"), 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __51__HUClipScrubberViewController_showDeleteInterface__block_invoke;
      v50[3] = &unk_1E6F4C6E0;
      v50[4] = self;
      objc_msgSend(v34, "actionWithTitle:style:handler:", v35, 2, v50);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "addAction:", v36);
      v37 = (void *)MEMORY[0x1E0CEA2E0];
      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraCancelText"), CFSTR("HUCameraCancelText"), 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "actionWithTitle:style:handler:", v38, 0, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "addAction:", v39);
      -[HUClipScrubberViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

    }
    else
    {
      HFLogForCategory();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        -[HUClipScrubberViewController dataSource](self, "dataSource");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "currentEvent");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v52 = v42;
        _os_log_impl(&dword_1B8E1E000, v40, OS_LOG_TYPE_DEFAULT, "Not allowing deletion of an in-progress clips. User is unable to delete clip: %@", buf, 0xCu);

      }
      v43 = (void *)MEMORY[0x1E0CEA2E8];
      _HULocalizedStringWithDefaultValue(CFSTR("HUClipScrubberDeletionBlockedTitle"), CFSTR("HUClipScrubberDeletionBlockedTitle"), 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUClipScrubberDeletionBlockedMessage"), CFSTR("HUClipScrubberDeletionBlockedMessage"), 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "alertControllerWithTitle:message:preferredStyle:", v44, v45, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = (void *)MEMORY[0x1E0CEA2E0];
      _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "actionWithTitle:style:handler:", v47, 0, 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAction:", v48);

      -[HUClipScrubberViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
    }

  }
}

uint64_t __51__HUClipScrubberViewController_showDeleteInterface__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteClip");
}

- (void)removeLiveButtonHighlighting
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController scrubberView](self, "scrubberView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightActionButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

}

- (void)dismissEditInterface
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[16];

  -[HUClipScrubberViewController exportDownloadOperation](self, "exportDownloadOperation");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[HUClipScrubberViewController exportDownloadOperation](self, "exportDownloadOperation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isFinished");

    if ((v6 & 1) == 0)
    {
      HFLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Cancelling previous un-finished export operation.", buf, 2u);
      }

      -[HUClipScrubberViewController exportDownloadOperation](self, "exportDownloadOperation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cancel");

      -[HUClipScrubberViewController setExportDownloadOperation:](self, "setExportDownloadOperation:", 0);
    }
  }
  -[HUClipScrubberViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEditing:", 0);

  -[HUClipScrubberViewController clipScrollDelegate](self, "clipScrollDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "finishEditing");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__HUClipScrubberViewController_dismissEditInterface__block_invoke;
  v11[3] = &unk_1E6F4D988;
  v11[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v11, 0.2);
}

void __52__HUClipScrubberViewController_dismissEditInterface__block_invoke(uint64_t a1)
{
  void (**v2)(void);
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "endEditingHandler");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

  if (objc_msgSend(MEMORY[0x1E0D31288], "internalCameraFeedbackSupported"))
  {
    objc_msgSend(*(id *)(a1 + 32), "feedbackPlatter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "nearbyAccessoriesPlatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "selectionPlatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "updateScrubberViewAndAssociatedConstraints");
  objc_msgSend(*(id *)(a1 + 32), "scrubberView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateDisplayMode:", 0);

  objc_msgSend(*(id *)(a1 + 32), "scrubberView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightActionButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutIfNeeded");

}

- (void)showEditInterface
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  uint8_t buf[16];

  if (-[HUClipScrubberViewController displayMode](self, "displayMode") == 1)
  {
    -[HUClipScrubberViewController showDeleteInterface](self, "showDeleteInterface");
    return;
  }
  -[HUClipScrubberViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEditing:", 1);

  -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playbackPosition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31258], "livePosition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    -[HUClipScrubberViewController dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentEvents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D31258];
      objc_msgSend(v10, "dateOfOccurrence");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "clipPositionWithDate:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPlaybackPosition:", v14);

    }
    else
    {
      HFLogForCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_ERROR, "Failure to find a valid clip when attempting to display edit mode.", buf, 2u);
      }

      v10 = 0;
    }
LABEL_13:

    goto LABEL_14;
  }
  -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "timeControlStatus");

  if (v16)
  {
    HFLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "Pausing playback for switch to edit mode.", buf, 2u);
    }

    -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pause");
    goto LABEL_13;
  }
LABEL_14:
  v19[4] = self;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __49__HUClipScrubberViewController_showEditInterface__block_invoke;
  v20[3] = &unk_1E6F4D988;
  v20[4] = self;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __49__HUClipScrubberViewController_showEditInterface__block_invoke_2;
  v19[3] = &unk_1E6F4E300;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v20, v19, 0.2);
}

void __49__HUClipScrubberViewController_showEditInterface__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void);
  id v7;

  if (objc_msgSend(MEMORY[0x1E0D31288], "internalCameraFeedbackSupported"))
  {
    objc_msgSend(*(id *)(a1 + 32), "feedbackPlatter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setHidden:", 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "nearbyAccessoriesPlatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "selectionPlatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "updateScrubberViewAndAssociatedConstraints");
  objc_msgSend(*(id *)(a1 + 32), "scrubberView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateDisplayMode:", 1);

  objc_msgSend(*(id *)(a1 + 32), "beginEditingHandler");
  v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v6[2]();

  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

}

void __49__HUClipScrubberViewController_showEditInterface__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "clipScrollDelegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "beginEditing");

}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CEA2E8], "hu_alertControllerForAcknowledgementWithTitle:message:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)didSelectFeedbackButton
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pause");

  if ((objc_msgSend(MEMORY[0x1E0D31288], "hasAcceptedCameraFeedbackEmployeeConsent") & 1) == 0)
  {
    -[HUClipScrubberViewController presentFeedbackConsent](self, "presentFeedbackConsent");
    return;
  }
  -[HUClipScrubberViewController _feedbackClip](self, "_feedbackClip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "hf_isPlayable") & 1) != 0)
    {
      if (objc_msgSend(v5, "isDonated"))
        -[HUClipScrubberViewController presentPreviouslySubmittedClipAlert](self, "presentPreviouslySubmittedClipAlert");
      else
        -[HUClipScrubberViewController presentFeedbackOptions](self, "presentFeedbackOptions");
      goto LABEL_13;
    }
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFeedbackBadClipSubmissionTitle"), CFSTR("HUCameraFeedbackBadClipSubmissionTitle"), 1);
    v6 = objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFeedbackBadClipSubmissionMessage"), CFSTR("HUCameraFeedbackBadClipSubmissionMessage"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUClipScrubberViewController _presentAlertWithTitle:message:](self, "_presentAlertWithTitle:message:", v6, v7);
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "Preventing submission of unplayable clip:%@.", (uint8_t *)&v11, 0xCu);

    }
  }
  else
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Failed attempt to submit current clip when none available.", (uint8_t *)&v11, 2u);
    }
  }

LABEL_13:
}

- (void)presentFeedbackOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];

  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFeedbackAlertTitle"), CFSTR("HUCameraFeedbackAlertTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFeedbackLegalMessage"), CFSTR("HUCameraFeedbackLegalMessage"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFeedbackSubmitOneTitle"), CFSTR("HUCameraFeedbackSubmitOneTitle"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__HUClipScrubberViewController_presentFeedbackOptions__block_invoke;
  v14[3] = &unk_1E6F4C6E0;
  v14[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v6, 0, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v8);
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFeedbackSubmitAllTitle"), CFSTR("HUCameraFeedbackSubmitAllTitle"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __54__HUClipScrubberViewController_presentFeedbackOptions__block_invoke_2;
  v13[3] = &unk_1E6F4C6E0;
  v13[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v9, 0, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v10);
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFeedbackCancelTitle"), CFSTR("HUCameraFeedbackCancelTitle"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v11, 1, &__block_literal_global_116_1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v12);
  -[HUClipScrubberViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

uint64_t __54__HUClipScrubberViewController_presentFeedbackOptions__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "submitCurrentClip");
}

uint64_t __54__HUClipScrubberViewController_presentFeedbackOptions__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "verifySubmitAllClips");
}

- (void)presentPreviouslySubmittedClipAlert
{
  void *v3;
  id v4;

  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFeedbackAlreadySubmittedTitle"), CFSTR("HUCameraFeedbackAlreadySubmittedTitle"), 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFeedbackAlreadySubmittedMessage"), CFSTR("HUCameraFeedbackAlreadySubmittedMessage"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController _presentAlertWithTitle:message:](self, "_presentAlertWithTitle:message:", v4, v3);

}

- (id)_feedbackClip
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentClip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "currentClip");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "cameraClips");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isInternalInstall"))
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Internal install - allowing submission of feedback for clip:%@", (uint8_t *)&v13, 0xCu);
    }

    goto LABEL_9;
  }
  if (objc_msgSend(v7, "canAskForUserFeedback"))
  {
LABEL_9:
    v10 = v7;
    goto LABEL_13;
  }
  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v7;
    _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "Preventing submission of feedback for clip:%@", (uint8_t *)&v13, 0xCu);
  }

  v10 = 0;
LABEL_13:

  return v10;
}

- (void)submitCurrentClip
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  -[HUClipScrubberViewController _feedbackClip](self, "_feedbackClip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "isDonated"))
      -[HUClipScrubberViewController presentPreviouslySubmittedClipAlert](self, "presentPreviouslySubmittedClipAlert");
    else
      -[HUClipScrubberViewController donateClip:](self, "donateClip:", v4);
  }
  else
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "Failed attempt to submit current clip when none available.", v6, 2u);
    }

  }
}

- (void)verifySubmitAllClips
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFeedbackVerifyAlertTitle"), CFSTR("HUCameraFeedbackVerifyAlertTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFeedbackVerifyLegalMessage"), CFSTR("HUCameraFeedbackVerifyLegalMessage"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFeedbackVerifyAcceptTitle"), CFSTR("HUCameraFeedbackVerifyAcceptTitle"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__HUClipScrubberViewController_verifySubmitAllClips__block_invoke;
  v10[3] = &unk_1E6F4C6E0;
  v10[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v6, 0, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v7);
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFeedbackVerifyDeclineTitle"), CFSTR("HUCameraFeedbackVerifyDeclineTitle"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v8, 0, &__block_literal_global_129_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v9);
  -[HUClipScrubberViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

uint64_t __52__HUClipScrubberViewController_verifySubmitAllClips__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "donateAllClips");
}

- (void)donateClip:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  HUClipScrubberViewController *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D31200];
  -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cameraProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__HUClipScrubberViewController_donateClip___block_invoke;
  v9[3] = &unk_1E6F4D1B0;
  v10 = v4;
  v11 = self;
  v8 = v4;
  objc_msgSend(v5, "donateCameraClip:forCameraProfile:completion:", v8, v7, v9);

}

void __43__HUClipScrubberViewController_donateClip___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "Error donating clip:%@. %@", (uint8_t *)&v9, 0x16u);

    }
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFeedbackFailureToSubmitTitle"), CFSTR("HUCameraFeedbackFailureToSubmitTitle"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("HUCameraFeedbackFailureToSubmitMessage");
  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFeedbackSubmittedTitle"), CFSTR("HUCameraFeedbackSubmittedTitle"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("HUCameraFeedbackSubmittedMessage");
  }
  _HULocalizedStringWithDefaultValue(v6, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_presentAlertWithTitle:message:", v5, v7);

}

- (void)donateAllClips
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)MEMORY[0x1E0D31200];
  -[HUClipScrubberViewController playbackEngine](self, "playbackEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__HUClipScrubberViewController_donateAllClips__block_invoke;
  v6[3] = &unk_1E6F4E2D8;
  v6[4] = self;
  objc_msgSend(v3, "donateAllCameraClipsForCameraProfile:completion:", v5, v6);

}

void __46__HUClipScrubberViewController_donateAllClips__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "Error donating all clips. %@", (uint8_t *)&v8, 0xCu);
    }

    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFeedbackFailureToSubmitTitle"), CFSTR("HUCameraFeedbackFailureToSubmitTitle"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("HUCameraFeedbackFailureToSubmitMessage");
  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFeedbackSubmittedAllTitle"), CFSTR("HUCameraFeedbackSubmittedAllTitle"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("HUCameraFeedbackSubmittedAllMessage");
  }
  _HULocalizedStringWithDefaultValue(v6, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_presentAlertWithTitle:message:", v5, v7);

}

- (id)accessoryButtonHandler
{
  return self->_accessoryButtonHandler;
}

- (void)setAccessoryButtonHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (id)beginEditingHandler
{
  return self->_beginEditingHandler;
}

- (void)setBeginEditingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (id)endEditingHandler
{
  return self->_endEditingHandler;
}

- (void)setEndEditingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (HFCameraPlaybackEngine)playbackEngine
{
  return (HFCameraPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (void)setPlaybackEngine:(id)a3
{
  objc_storeWeak((id *)&self->_playbackEngine, a3);
}

- (void)setScrubberView:(id)a3
{
  objc_storeStrong((id *)&self->_scrubberView, a3);
}

- (void)setSelectionButton:(id)a3
{
  objc_storeStrong((id *)&self->_selectionButton, a3);
}

- (void)setNearbyAccessoriesButton:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyAccessoriesButton, a3);
}

- (void)setFeedbackButton:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackButton, a3);
}

- (void)setSelectionPlatter:(id)a3
{
  objc_storeStrong((id *)&self->_selectionPlatter, a3);
}

- (void)setFeedbackPlatter:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackPlatter, a3);
}

- (void)setNearbyAccessoriesPlatter:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyAccessoriesPlatter, a3);
}

- (HUClipScrubberDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (HUClipScrubberScrollDelegate)clipScrollDelegate
{
  return self->_clipScrollDelegate;
}

- (void)setClipScrollDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_clipScrollDelegate, a3);
}

- (NSLayoutConstraint)scrubberViewRightAnchorConstraint
{
  return self->_scrubberViewRightAnchorConstraint;
}

- (void)setScrubberViewRightAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scrubberViewRightAnchorConstraint, a3);
}

- (NSLayoutConstraint)scrubberViewLeftAnchorConstraint
{
  return self->_scrubberViewLeftAnchorConstraint;
}

- (void)setScrubberViewLeftAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scrubberViewLeftAnchorConstraint, a3);
}

- (NSLayoutConstraint)feedbackPlatterTopAnchorConstraint
{
  return self->_feedbackPlatterTopAnchorConstraint;
}

- (void)setFeedbackPlatterTopAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackPlatterTopAnchorConstraint, a3);
}

- (NSLayoutConstraint)nearbyAccessoriesPlatterTopAnchorConstraint
{
  return self->_nearbyAccessoriesPlatterTopAnchorConstraint;
}

- (void)setNearbyAccessoriesPlatterTopAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyAccessoriesPlatterTopAnchorConstraint, a3);
}

- (NSLayoutConstraint)selectionPlatterTopAnchorConstraint
{
  return self->_selectionPlatterTopAnchorConstraint;
}

- (void)setSelectionPlatterTopAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_selectionPlatterTopAnchorConstraint, a3);
}

- (CADisplayLink)scrubberUpdateDisplayLink
{
  return self->_scrubberUpdateDisplayLink;
}

- (void)setScrubberUpdateDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_scrubberUpdateDisplayLink, a3);
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void)setIsVisible:(BOOL)a3
{
  self->_isVisible = a3;
}

- (unint64_t)lastEngineMode
{
  return self->_lastEngineMode;
}

- (void)setLastEngineMode:(unint64_t)a3
{
  self->_lastEngineMode = a3;
}

- (HMCameraClipFetchVideoAssetContextOperation)exportDownloadOperation
{
  return (HMCameraClipFetchVideoAssetContextOperation *)objc_loadWeakRetained((id *)&self->_exportDownloadOperation);
}

- (void)setExportDownloadOperation:(id)a3
{
  objc_storeWeak((id *)&self->_exportDownloadOperation, a3);
}

- (UITapGestureRecognizer)singleTapGestureRecognizer
{
  return self->_singleTapGestureRecognizer;
}

- (void)setSingleTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_singleTapGestureRecognizer, a3);
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return self->_doubleTapGestureRecognizer;
}

- (void)setDoubleTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, a3);
}

- (HFCameraAnalyticsCameraClipExportSessionEvent)exportSessionEvent
{
  return self->_exportSessionEvent;
}

- (void)setExportSessionEvent:(id)a3
{
  objc_storeStrong((id *)&self->_exportSessionEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportSessionEvent, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_singleTapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_exportDownloadOperation);
  objc_storeStrong((id *)&self->_scrubberUpdateDisplayLink, 0);
  objc_storeStrong((id *)&self->_selectionPlatterTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_nearbyAccessoriesPlatterTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_feedbackPlatterTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_scrubberViewLeftAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_scrubberViewRightAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_clipScrollDelegate, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_nearbyAccessoriesPlatter, 0);
  objc_storeStrong((id *)&self->_feedbackPlatter, 0);
  objc_storeStrong((id *)&self->_selectionPlatter, 0);
  objc_storeStrong((id *)&self->_feedbackButton, 0);
  objc_storeStrong((id *)&self->_nearbyAccessoriesButton, 0);
  objc_storeStrong((id *)&self->_selectionButton, 0);
  objc_storeStrong((id *)&self->_scrubberView, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_storeStrong(&self->_endEditingHandler, 0);
  objc_storeStrong(&self->_beginEditingHandler, 0);
  objc_storeStrong(&self->_accessoryButtonHandler, 0);
}

@end
