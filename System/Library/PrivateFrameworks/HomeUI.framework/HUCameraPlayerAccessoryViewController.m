@implementation HUCameraPlayerAccessoryViewController

- (void)setPlaybackEngine:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_playbackEngine);
    objc_msgSend(v5, "removeObserver:", self);

    objc_storeWeak((id *)&self->_playbackEngine, obj);
    v6 = objc_alloc_init(MEMORY[0x1E0D31250]);
    objc_msgSend(v6, "setPeriodicTimeUpdateInterval:", &unk_1E70434A8);
    v7 = objc_loadWeakRetained((id *)&self->_playbackEngine);
    objc_msgSend(v7, "addObserver:withOptions:", self, v6);

  }
}

- (HUCameraPlayerAccessoryViewController)initWithPlaybackEngine:(id)a3
{
  id v4;
  HUCameraPlayerAccessoryViewController *v5;
  HUCameraPlayerAccessoryViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUCameraPlayerAccessoryViewController;
  v5 = -[HUCameraPlayerAccessoryViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[HUCameraPlayerAccessoryViewController setPlaybackEngine:](v5, "setPlaybackEngine:", v4);

  return v6;
}

- (void)viewDidLoad
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
  double v15;
  double v16;
  double v17;
  double v18;
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
  objc_super v86;
  _QWORD v87[14];

  v87[12] = *MEMORY[0x1E0C80C00];
  v86.receiver = self;
  v86.super_class = (Class)HUCameraPlayerAccessoryViewController;
  -[HUCameraPlayerAccessoryViewController viewDidLoad](&v86, sel_viewDidLoad);
  -[HUCameraPlayerAccessoryViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  -[HUCameraPlayerAccessoryViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerAccessoryViewController loadingActivityIndicator](self, "loadingActivityIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  -[HUCameraPlayerAccessoryViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerAccessoryViewController noActivityLabel](self, "noActivityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "naui_addAutoLayoutSubview:", v7);

  -[HUCameraPlayerAccessoryViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerAccessoryViewController primaryErrorLabel](self, "primaryErrorLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

  -[HUCameraPlayerAccessoryViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerAccessoryViewController secondaryErrorLabel](self, "secondaryErrorLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v11);

  -[HUCameraPlayerAccessoryViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerAccessoryViewController noResponseView](self, "noResponseView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v13);

  -[HUCameraPlayerAccessoryViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "center");
  v16 = v15;
  v18 = v17;
  -[HUCameraPlayerAccessoryViewController loadingActivityIndicator](self, "loadingActivityIndicator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCenter:", v16, v18);

  v59 = (void *)MEMORY[0x1E0CB3718];
  -[HUCameraPlayerAccessoryViewController noActivityLabel](self, "noActivityLabel");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "centerYAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerAccessoryViewController view](self, "view");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "centerYAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:", v82);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v81;
  -[HUCameraPlayerAccessoryViewController noActivityLabel](self, "noActivityLabel");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "centerXAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerAccessoryViewController view](self, "view");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "centerXAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToAnchor:", v77);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v76;
  -[HUCameraPlayerAccessoryViewController primaryErrorLabel](self, "primaryErrorLabel");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "centerXAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerAccessoryViewController view](self, "view");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "centerXAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:", v72);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v87[2] = v71;
  -[HUCameraPlayerAccessoryViewController primaryErrorLabel](self, "primaryErrorLabel");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "centerYAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerAccessoryViewController view](self, "view");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "centerYAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v67);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v87[3] = v66;
  -[HUCameraPlayerAccessoryViewController primaryErrorLabel](self, "primaryErrorLabel");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "widthAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerAccessoryViewController view](self, "view");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "readableContentGuide");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "widthAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v87[4] = v60;
  -[HUCameraPlayerAccessoryViewController secondaryErrorLabel](self, "secondaryErrorLabel");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerAccessoryViewController primaryErrorLabel](self, "primaryErrorLabel");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "bottomAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, 6.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v87[5] = v54;
  -[HUCameraPlayerAccessoryViewController secondaryErrorLabel](self, "secondaryErrorLabel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "leftAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerAccessoryViewController view](self, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "safeAreaLayoutGuide");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "leftAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, 10.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v87[6] = v48;
  -[HUCameraPlayerAccessoryViewController secondaryErrorLabel](self, "secondaryErrorLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "rightAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerAccessoryViewController view](self, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "safeAreaLayoutGuide");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "rightAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, -10.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v87[7] = v42;
  -[HUCameraPlayerAccessoryViewController noResponseView](self, "noResponseView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerAccessoryViewController primaryErrorLabel](self, "primaryErrorLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, -10.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v87[8] = v37;
  -[HUCameraPlayerAccessoryViewController noResponseView](self, "noResponseView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "centerXAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerAccessoryViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "centerXAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v87[9] = v20;
  -[HUCameraPlayerAccessoryViewController noResponseView](self, "noResponseView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "widthAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToConstant:", 61.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v87[10] = v23;
  -[HUCameraPlayerAccessoryViewController noResponseView](self, "noResponseView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "heightAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToConstant:", 50.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v87[11] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 12);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "na_arrayByFlattening");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "activateConstraints:", v28);

  -[HUCameraPlayerAccessoryViewController _updateAllOverlayStateAnimated:](self, "_updateAllOverlayStateAnimated:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "lightTextColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerAccessoryViewController primaryErrorLabel](self, "primaryErrorLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setTextColor:", v29);

  objc_msgSend(MEMORY[0x1E0CEA478], "lightTextColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerAccessoryViewController secondaryErrorLabel](self, "secondaryErrorLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTextColor:", v31);

}

- (void)setCanShowOverlayContent:(BOOL)a3
{
  if (self->_canShowOverlayContent != a3)
  {
    self->_canShowOverlayContent = a3;
    -[HUCameraPlayerAccessoryViewController _updateAllOverlayStateAnimated:](self, "_updateAllOverlayStateAnimated:", 1);
  }
}

- (void)setShouldShowLoadingIndicatorForClipPlayback:(BOOL)a3
{
  if (self->_shouldShowLoadingIndicatorForClipPlayback != a3)
  {
    self->_shouldShowLoadingIndicatorForClipPlayback = a3;
    -[HUCameraPlayerAccessoryViewController _updateLoadingStateAnimated:](self, "_updateLoadingStateAnimated:", 1);
  }
}

- (void)hu_reloadData
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HUCameraPlayerAccessoryViewController_hu_reloadData__block_invoke;
  block[3] = &unk_1E6F4D988;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __54__HUCameraPlayerAccessoryViewController_hu_reloadData__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAllOverlayStateAnimated:", 1);
}

- (void)playbackEngine:(id)a3 didUpdateEventsIncludingUpdatedIdentifiers:(id)a4 replacedIdentifiers:(id)a5 removedIdentifiers:(id)a6
{
  -[HUCameraPlayerAccessoryViewController _updateAllOverlayStateAnimated:](self, "_updateAllOverlayStateAnimated:", 0, a4, a5, a6);
}

- (void)playbackEngine:(id)a3 didUpdatePlaybackPosition:(id)a4
{
  -[HUCameraPlayerAccessoryViewController _updateAllOverlayStateAnimated:](self, "_updateAllOverlayStateAnimated:", 0, a4);
}

- (void)playbackEngine:(id)a3 didUpdateTimeControlStatus:(unint64_t)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__HUCameraPlayerAccessoryViewController_playbackEngine_didUpdateTimeControlStatus___block_invoke;
  block[3] = &unk_1E6F4D988;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __83__HUCameraPlayerAccessoryViewController_playbackEngine_didUpdateTimeControlStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLoadingStateAnimated:", 1);
}

- (void)playbackEngine:(id)a3 didUpdatePlaybackError:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__HUCameraPlayerAccessoryViewController_playbackEngine_didUpdatePlaybackError___block_invoke;
  block[3] = &unk_1E6F4D988;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __79__HUCameraPlayerAccessoryViewController_playbackEngine_didUpdatePlaybackError___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateErrorStateAnimated:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_updateLoadingStateAnimated:", 1);
}

- (void)_updateAllOverlayStateAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[HUCameraPlayerAccessoryViewController _updateLoadingStateAnimated:](self, "_updateLoadingStateAnimated:");
  -[HUCameraPlayerAccessoryViewController _updateNoActivityStateAnimated:](self, "_updateNoActivityStateAnimated:", v3);
  -[HUCameraPlayerAccessoryViewController _updateErrorStateAnimated:](self, "_updateErrorStateAnimated:", v3);
}

- (void)_updateLoadingStateAnimated:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  _BYTE v33[14];
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (-[HUCameraPlayerAccessoryViewController shouldShortCircuitLoadingIndicator](self, "shouldShortCircuitLoadingIndicator", a3))
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 134217984;
      *(_QWORD *)v33 = objc_msgSend(v5, "timeControlStatus");
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Short-circuiting accessory view loading UI. %lu", (uint8_t *)&v32, 0xCu);

    }
    -[HUCameraPlayerAccessoryViewController loadingActivityIndicator](self, "loadingActivityIndicator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.0);

    -[HUCameraPlayerAccessoryViewController loadingOverlayView](self, "loadingOverlayView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 0.0);

    -[HUCameraPlayerAccessoryViewController setShowingLoadingIndicator:](self, "setShowingLoadingIndicator:", 0);
    return;
  }
  v8 = -[HUCameraPlayerAccessoryViewController showingLoadingIndicator](self, "showingLoadingIndicator");
  -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playbackPosition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "contentType");

  -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 == 1)
  {
    if (objc_msgSend(v12, "timelineState") == 3)
    {

LABEL_10:
      -[HUCameraPlayerAccessoryViewController canShowOverlayContent](self, "canShowOverlayContent");
LABEL_15:
      -[HUCameraPlayerAccessoryViewController setShowingLoadingIndicator:](self, "setShowingLoadingIndicator:", 0);
      goto LABEL_16;
    }
    -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "timelineState");

    if (v16 == 4)
      goto LABEL_10;
    v14 = -[HUCameraPlayerAccessoryViewController shouldShowLoadingIndicatorForClipPlayback](self, "shouldShowLoadingIndicatorForClipPlayback");
  }
  else
  {
    v14 = objc_msgSend(v12, "timeControlStatus") == 1;

  }
  if (!-[HUCameraPlayerAccessoryViewController canShowOverlayContent](self, "canShowOverlayContent") || !v14)
    goto LABEL_15;
  -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "playbackError");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerAccessoryViewController setShowingLoadingIndicator:](self, "setShowingLoadingIndicator:", v18 == 0);

LABEL_16:
  if (-[HUCameraPlayerAccessoryViewController forceLoadingIndicatorToDisplay](self, "forceLoadingIndicatorToDisplay"))
    -[HUCameraPlayerAccessoryViewController setShowingLoadingIndicator:](self, "setShowingLoadingIndicator:", 1);
  v19 = -[HUCameraPlayerAccessoryViewController showingLoadingIndicator](self, "showingLoadingIndicator");
  HFLogForCategory();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v8 == v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v26 = -[HUCameraPlayerAccessoryViewController showingLoadingIndicator](self, "showingLoadingIndicator");
      -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "playbackPosition");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "contentType");
      -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 67109890;
      *(_DWORD *)v33 = v26;
      *(_WORD *)&v33[4] = 2112;
      *(_QWORD *)&v33[6] = v27;
      v34 = 2048;
      v35 = v30;
      v36 = 2048;
      v37 = objc_msgSend(v31, "timeControlStatus");
      _os_log_debug_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_DEBUG, "Loading state unchanged. Showing:%{BOOL}d for engine:%@ contentType:%lu timeControlStatus:%lu.", (uint8_t *)&v32, 0x26u);

    }
  }
  else
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 67109120;
      *(_DWORD *)v33 = -[HUCameraPlayerAccessoryViewController showingLoadingIndicator](self, "showingLoadingIndicator");
      _os_log_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_DEFAULT, "Loading state updated. Showing:%{BOOL}d.", (uint8_t *)&v32, 8u);
    }

    v22 = (double)-[HUCameraPlayerAccessoryViewController showingLoadingIndicator](self, "showingLoadingIndicator");
    -[HUCameraPlayerAccessoryViewController loadingActivityIndicator](self, "loadingActivityIndicator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAlpha:", v22);

    if (-[HUCameraPlayerAccessoryViewController showingLoadingIndicator](self, "showingLoadingIndicator"))
      v24 = 0.5;
    else
      v24 = 0.0;
    -[HUCameraPlayerAccessoryViewController loadingOverlayView](self, "loadingOverlayView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAlpha:", v24);

  }
}

- (void)_updateNoActivityStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v3 = a3;
  v5 = -[HUCameraPlayerAccessoryViewController showingNoActivity](self, "showingNoActivity");
  v6 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__HUCameraPlayerAccessoryViewController__updateNoActivityStateAnimated___block_invoke;
  v8[3] = &unk_1E6F50A90;
  v8[4] = self;
  -[HUCameraPlayerAccessoryViewController setShowingNoActivity:](self, "setShowingNoActivity:", __72__HUCameraPlayerAccessoryViewController__updateNoActivityStateAnimated___block_invoke((uint64_t)v8) != 0);
  if (v5 != -[HUCameraPlayerAccessoryViewController showingNoActivity](self, "showingNoActivity"))
  {
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __72__HUCameraPlayerAccessoryViewController__updateNoActivityStateAnimated___block_invoke_2;
    v7[3] = &unk_1E6F4D988;
    v7[4] = self;
    -[HUCameraPlayerAccessoryViewController _updateStateAnimated:usingBlock:](self, "_updateStateAnimated:usingBlock:", v3, v7);
  }
}

uint64_t __72__HUCameraPlayerAccessoryViewController__updateNoActivityStateAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackPosition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "canShowOverlayContent") && objc_msgSend(v3, "contentType") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "timelineState") == 4)
    {
      objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isUserScrubbing");

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __72__HUCameraPlayerAccessoryViewController__updateNoActivityStateAnimated___block_invoke_2(uint64_t a1)
{
  double v2;
  id v3;

  v2 = (double)objc_msgSend(*(id *)(a1 + 32), "showingNoActivity");
  objc_msgSend(*(id *)(a1 + 32), "noActivityLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

}

- (void)_updateErrorStateAnimated:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  int v38;
  NSObject *v39;
  void *v40;
  void *v41;
  int v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _BOOL4 v52;
  void *v53;
  uint8_t v54[16];
  _QWORD v55[4];
  id v56;
  id v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  _BOOL4 v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  _BOOL4 v67;
  __int16 v68;
  _BOOL4 v69;
  uint64_t v70;

  v3 = a3;
  v70 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled") & 1) != 0)
    return;
  v52 = v3;
  v5 = -[HUCameraPlayerAccessoryViewController showingError](self, "showingError");
  -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playbackError");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HUCameraPlayerAccessoryViewController canShowOverlayContent](self, "canShowOverlayContent") && v53)
  {
    -[HUCameraPlayerAccessoryViewController setShowingError:](self, "setShowingError:", 1);
  }
  else
  {
    -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cameraProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraPlayerAccessoryViewController setShowingError:](self, "setShowingError:", objc_msgSend(v8, "hf_shouldDisableLiveStream"));

  }
  -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playbackPosition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "contentType");

  if (v11 == 1)
    -[HUCameraPlayerAccessoryViewController setShowingError:](self, "setShowingError:", 0);
  -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "timelineState");

  if (v13 != 3)
    goto LABEL_11;
  -[HUCameraPlayerAccessoryViewController setShowingError:](self, "setShowingError:", 1);
  if (-[HUCameraPlayerAccessoryViewController reachabilityEventWasOffline](self, "reachabilityEventWasOffline"))
    goto LABEL_12;
  -[HUCameraPlayerAccessoryViewController lastDisplayedEvent](self, "lastDisplayedEvent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentClip");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "isEqual:", v16);

  if ((v17 & 1) == 0)
  {
LABEL_12:
    -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "currentClip");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraPlayerAccessoryViewController setLastDisplayedEvent:](self, "setLastDisplayedEvent:", v20);

    objc_opt_class();
    -[HUCameraPlayerAccessoryViewController lastDisplayedEvent](self, "lastDisplayedEvent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
    v23 = v22;

    objc_msgSend(v23, "endEvent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUCameraPlayerAccessoryViewController setReachabilityEventWasOffline:](self, "setReachabilityEventWasOffline:", v24 == 0);
    v18 = 1;
  }
  else
  {
LABEL_11:
    v18 = 0;
  }
  v25 = -[HUCameraPlayerAccessoryViewController currentAccessMode](self, "currentAccessMode");
  -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "cameraProfile");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "userSettings");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "currentAccessMode");

  if (v25 != v29)
  {
    -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "cameraProfile");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "userSettings");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraPlayerAccessoryViewController setCurrentAccessMode:](self, "setCurrentAccessMode:", objc_msgSend(v32, "currentAccessMode"));

    v18 = 1;
  }
  v33 = -[HUCameraPlayerAccessoryViewController lastEngineMode](self, "lastEngineMode");
  -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33 == objc_msgSend(v34, "engineMode"))
  {
    -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "engineMode");

    if (v36)
      goto LABEL_23;
  }
  else
  {

  }
  -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerAccessoryViewController setLastEngineMode:](self, "setLastEngineMode:", objc_msgSend(v37, "engineMode"));

  v18 = 1;
LABEL_23:
  v38 = -[HUCameraPlayerAccessoryViewController showingError](self, "showingError");
  if (v18 || v5 != v38)
  {
    HFLogForCategory();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "cameraProfile");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "userSettings");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "hu_currentAccessModeDescription");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "cameraProfile");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "hf_shouldDisableLiveStream");
      v43 = -[HUCameraPlayerAccessoryViewController showingError](self, "showingError");
      -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "timelineStateDescription");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraPlayerAccessoryViewController lastDisplayedEvent](self, "lastDisplayedEvent");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v59 = v48;
      v60 = 1024;
      v61 = v42;
      v62 = 1024;
      v63 = v43;
      v64 = 2112;
      v65 = v45;
      v66 = 1024;
      v67 = objc_msgSend(v46, "containerType") == 1;
      v68 = 1024;
      v69 = -[HUCameraPlayerAccessoryViewController reachabilityEventWasOffline](self, "reachabilityEventWasOffline");
      _os_log_impl(&dword_1B8E1E000, v39, OS_LOG_TYPE_DEFAULT, "Update AccessoryController cameraAccessMode:%@ liveStreamDisabled:%{BOOL}d showingError:%{BOOL}d timelineState:%@ containerTypeRecording:%{BOOL}d offline:%{BOOL}d", buf, 0x2Eu);

    }
    objc_initWeak((id *)buf, self);
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __67__HUCameraPlayerAccessoryViewController__updateErrorStateAnimated___block_invoke;
    v55[3] = &unk_1E6F50A68;
    objc_copyWeak(&v57, (id *)buf);
    v56 = v53;
    -[HUCameraPlayerAccessoryViewController _updateStateAnimated:usingBlock:](self, "_updateStateAnimated:usingBlock:", v52, v55);
    HFLogForCategory();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v54 = 0;
      _os_log_impl(&dword_1B8E1E000, v47, OS_LOG_TYPE_DEFAULT, "Accessory controller did update error state after change.", v54, 2u);
    }

    objc_destroyWeak(&v57);
    objc_destroyWeak((id *)buf);
  }

}

void __67__HUCameraPlayerAccessoryViewController__updateErrorStateAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_shouldDisableLiveStream");

  objc_msgSend(WeakRetained, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cameraProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v4)
  {
    v14 = objc_msgSend(v6, "hf_thermalShutdownMode");

    if (v14 != 1 && v14 != 2)
    {
      v15 = *(void **)(a1 + 32);
      if (!v15)
        goto LABEL_15;
      objc_msgSend(v15, "code");
      HFLocalizedString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "primaryErrorLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setText:", v16);

      objc_msgSend(WeakRetained, "_errorStringDetailsForError:", *(_QWORD *)(a1 + 32));
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_13:
    HFLocalizedString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "primaryErrorLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v19);

    HFLocalizedString();
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v21 = (void *)v18;
    objc_msgSend(WeakRetained, "secondaryErrorLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setText:", v21);

    goto LABEL_15;
  }
  objc_msgSend(v6, "userSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "currentAccessMode");

  objc_msgSend(WeakRetained, "playbackEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cameraProfile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isCameraManuallyDisabled");

  if (v13 || v9 == 3 || !v9)
    goto LABEL_13;
LABEL_15:
  objc_msgSend(WeakRetained, "playbackEngine");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "timelineState");

  if (v24 == 3)
  {
    objc_msgSend(WeakRetained, "playbackEngine");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "currentClip");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_displayReachabilityMessageForEvent:", v26);

  }
  v27 = (double)objc_msgSend(WeakRetained, "showingError");
  objc_msgSend(WeakRetained, "primaryErrorLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setAlpha:", v27);

  v29 = (double)objc_msgSend(WeakRetained, "showingError");
  objc_msgSend(WeakRetained, "secondaryErrorLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAlpha:", v29);

  if (objc_msgSend(WeakRetained, "showingError"))
    v31 = 0.5;
  else
    v31 = 0.0;
  objc_msgSend(WeakRetained, "noResponseView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setAlpha:", v31);

}

- (void)_updateStateAnimated:(BOOL)a3 usingBlock:(id)a4
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", a4, 0.3);
  else
    (*((void (**)(id))a4 + 2))(a4);
}

- (id)_errorStringDetailsForError:(id)a3
{
  objc_msgSend(a3, "code");
  HFLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldShortCircuitLoadingIndicator
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[HUCameraPlayerAccessoryViewController forceLoadingIndicatorToDisplay](self, "forceLoadingIndicatorToDisplay"))
    return 0;
  -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "timeControlStatus"))
  {
    -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cameraProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "hf_shouldDisableLiveStream"))
    {
      -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "playbackPosition");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v8, "contentType") == 0;

    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (BOOL)_shouldShortCircuitBlurEffect
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled") & 1) != 0)
    return 1;
  if (-[HUCameraPlayerAccessoryViewController showingError](self, "showingError"))
    return 0;
  -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playbackPosition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "contentType"))
  {
    -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "timeControlStatus") == 2)
    {
      -[HUCameraPlayerAccessoryViewController playbackEngine](self, "playbackEngine");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v7, "timelineState") == 2;

    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (void)_displayReachabilityMessageForEvent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "Unable to display a reachability message for a non-reachability event:%@", (uint8_t *)&v12, 0xCu);
    }

  }
  -[HUCameraPlayerAccessoryViewController primaryErrorLabel](self, "primaryErrorLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", &stru_1E6F60E80);

  objc_msgSend(v7, "displayDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPlayerAccessoryViewController secondaryErrorLabel](self, "secondaryErrorLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

}

- (HUCameraLoadingActivityIndicatorView)loadingActivityIndicator
{
  HUCameraLoadingActivityIndicatorView *loadingActivityIndicator;
  HUCameraLoadingActivityIndicatorView *v4;
  void *v5;
  HUCameraLoadingActivityIndicatorView *v6;
  HUCameraLoadingActivityIndicatorView *v7;

  loadingActivityIndicator = self->_loadingActivityIndicator;
  if (!loadingActivityIndicator)
  {
    v4 = [HUCameraLoadingActivityIndicatorView alloc];
    -[HUCameraPlayerAccessoryViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = -[HUCameraLoadingActivityIndicatorView initWithFrame:](v4, "initWithFrame:");
    v7 = self->_loadingActivityIndicator;
    self->_loadingActivityIndicator = v6;

    -[HUCameraLoadingActivityIndicatorView setAutoresizingMask:](self->_loadingActivityIndicator, "setAutoresizingMask:", 18);
    loadingActivityIndicator = self->_loadingActivityIndicator;
  }
  return loadingActivityIndicator;
}

- (UILabel)primaryErrorLabel
{
  UILabel *primaryErrorLabel;
  UILabel *v4;
  void *v5;
  UILabel *v6;

  primaryErrorLabel = self->_primaryErrorLabel;
  if (!primaryErrorLabel)
  {
    v4 = (UILabel *)objc_msgSend((id)objc_opt_class(), "_newLabel");
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB568]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4, "setFont:", v5);

    -[UILabel setNumberOfLines:](v4, "setNumberOfLines:", 0);
    -[UILabel setAlpha:](v4, "setAlpha:", 0.0);
    v6 = self->_primaryErrorLabel;
    self->_primaryErrorLabel = v4;

    primaryErrorLabel = self->_primaryErrorLabel;
  }
  return primaryErrorLabel;
}

- (UILabel)secondaryErrorLabel
{
  UILabel *secondaryErrorLabel;
  UILabel *v4;
  void *v5;
  UILabel *v6;

  secondaryErrorLabel = self->_secondaryErrorLabel;
  if (!secondaryErrorLabel)
  {
    v4 = (UILabel *)objc_msgSend((id)objc_opt_class(), "_newLabel");
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB590]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4, "setFont:", v5);

    -[UILabel setNumberOfLines:](v4, "setNumberOfLines:", 0);
    -[UILabel setAlpha:](v4, "setAlpha:", 0.0);
    v6 = self->_secondaryErrorLabel;
    self->_secondaryErrorLabel = v4;

    secondaryErrorLabel = self->_secondaryErrorLabel;
  }
  return secondaryErrorLabel;
}

- (UILabel)noActivityLabel
{
  UILabel *noActivityLabel;
  UILabel *v4;
  void *v5;
  void *v6;
  UILabel *v7;

  noActivityLabel = self->_noActivityLabel;
  if (!noActivityLabel)
  {
    v4 = (UILabel *)objc_msgSend((id)objc_opt_class(), "_newLabel");
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraPlayerNoActivity"), CFSTR("HUCameraPlayerNoActivity"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v4, "setText:", v5);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB568]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4, "setFont:", v6);

    -[UILabel setAlpha:](v4, "setAlpha:", 0.0);
    v7 = self->_noActivityLabel;
    self->_noActivityLabel = v4;

    noActivityLabel = self->_noActivityLabel;
  }
  return noActivityLabel;
}

+ (id)_newLabel
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v2 = objc_alloc(MEMORY[0x1E0CEA700]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v5);

  objc_msgSend(v3, "setTextAlignment:", 1);
  objc_msgSend(v3, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShadowRadius:", 3.0);

  objc_msgSend(v3, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = *(_DWORD *)"333?";
  objc_msgSend(v7, "setShadowOpacity:", v8);

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.7);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend(v9, "CGColor");
  objc_msgSend(v3, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShadowColor:", v10);

  objc_msgSend(v3, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShadowOffset:", 0.0, 0.0);

  objc_msgSend(v3, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 16.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v13);

  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v3;
}

- (UIImageView)noResponseView
{
  UIImageView *noResponseView;
  void *v4;
  UIImageView *v5;
  void *v6;
  UIImageView *v7;

  noResponseView = self->_noResponseView;
  if (!noResponseView)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "hu_cameraErrorImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v4);
    -[UIImageView setContentMode:](v5, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v5, "setTintColor:", v6);

    -[UIImageView setAlpha:](v5, "setAlpha:", 0.0);
    v7 = self->_noResponseView;
    self->_noResponseView = v5;

    noResponseView = self->_noResponseView;
  }
  return noResponseView;
}

- (BOOL)showingError
{
  return self->_showingError;
}

- (void)setShowingError:(BOOL)a3
{
  self->_showingError = a3;
}

- (BOOL)canShowOverlayContent
{
  return self->_canShowOverlayContent;
}

- (BOOL)shouldShowLoadingIndicatorForClipPlayback
{
  return self->_shouldShowLoadingIndicatorForClipPlayback;
}

- (HFCameraPlaybackEngine)playbackEngine
{
  return (HFCameraPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (UIView)loadingOverlayView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_loadingOverlayView);
}

- (void)setLoadingOverlayView:(id)a3
{
  objc_storeWeak((id *)&self->_loadingOverlayView, a3);
}

- (BOOL)forceLoadingIndicatorToDisplay
{
  return self->_forceLoadingIndicatorToDisplay;
}

- (void)setForceLoadingIndicatorToDisplay:(BOOL)a3
{
  self->_forceLoadingIndicatorToDisplay = a3;
}

- (void)setNoResponseView:(id)a3
{
  objc_storeStrong((id *)&self->_noResponseView, a3);
}

- (void)setLoadingActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_loadingActivityIndicator, a3);
}

- (void)setNoActivityLabel:(id)a3
{
  objc_storeStrong((id *)&self->_noActivityLabel, a3);
}

- (void)setPrimaryErrorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryErrorLabel, a3);
}

- (void)setSecondaryErrorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryErrorLabel, a3);
}

- (BOOL)showingNoActivity
{
  return self->_showingNoActivity;
}

- (void)setShowingNoActivity:(BOOL)a3
{
  self->_showingNoActivity = a3;
}

- (BOOL)showingLoadingIndicator
{
  return self->_showingLoadingIndicator;
}

- (void)setShowingLoadingIndicator:(BOOL)a3
{
  self->_showingLoadingIndicator = a3;
}

- (unint64_t)currentAccessMode
{
  return self->_currentAccessMode;
}

- (void)setCurrentAccessMode:(unint64_t)a3
{
  self->_currentAccessMode = a3;
}

- (HFCameraRecordingEvent)lastDisplayedEvent
{
  return (HFCameraRecordingEvent *)objc_loadWeakRetained((id *)&self->_lastDisplayedEvent);
}

- (void)setLastDisplayedEvent:(id)a3
{
  objc_storeWeak((id *)&self->_lastDisplayedEvent, a3);
}

- (BOOL)reachabilityEventWasOffline
{
  return self->_reachabilityEventWasOffline;
}

- (void)setReachabilityEventWasOffline:(BOOL)a3
{
  self->_reachabilityEventWasOffline = a3;
}

- (unint64_t)lastEngineMode
{
  return self->_lastEngineMode;
}

- (void)setLastEngineMode:(unint64_t)a3
{
  self->_lastEngineMode = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lastDisplayedEvent);
  objc_storeStrong((id *)&self->_secondaryErrorLabel, 0);
  objc_storeStrong((id *)&self->_primaryErrorLabel, 0);
  objc_storeStrong((id *)&self->_noActivityLabel, 0);
  objc_storeStrong((id *)&self->_loadingActivityIndicator, 0);
  objc_storeStrong((id *)&self->_noResponseView, 0);
  objc_destroyWeak((id *)&self->_loadingOverlayView);
  objc_destroyWeak((id *)&self->_playbackEngine);
}

@end
