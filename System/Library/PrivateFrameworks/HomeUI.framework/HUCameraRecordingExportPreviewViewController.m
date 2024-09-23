@implementation HUCameraRecordingExportPreviewViewController

- (HUCameraRecordingExportPreviewViewController)initWithCameraClip:(id)a3 cameraProfile:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  HUCameraRecordingExportPreviewViewController *v11;
  HUCameraRecordingExportPreviewViewController *v12;
  void *v13;
  id completionHandler;
  NSOperationQueue *v15;
  NSOperationQueue *backgroundSessionQueue;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HUCameraRecordingExportPreviewViewController;
  v11 = -[HUCameraRecordingExportPreviewViewController initWithNibName:bundle:](&v18, sel_initWithNibName_bundle_, 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_cameraClip, v8);
    objc_storeWeak((id *)&v12->_cameraProfile, v9);
    v13 = _Block_copy(v10);
    completionHandler = v12->_completionHandler;
    v12->_completionHandler = v13;

    v15 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    backgroundSessionQueue = v12->_backgroundSessionQueue;
    v12->_backgroundSessionQueue = v15;

    -[HUCameraRecordingExportPreviewViewController prepareRecordingForExport](v12, "prepareRecordingForExport");
  }

  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUCameraRecordingExportPreviewViewController;
  -[HUCameraRecordingExportPreviewViewController viewDidLoad](&v10, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingExportPreviewViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraExportFeedbackNavigationTitle"), CFSTR("HUCameraExportFeedbackNavigationTitle"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingExportPreviewViewController setTitle:](self, "setTitle:", v5);

  v6 = objc_alloc(MEMORY[0x1E0CEA380]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraCancelText"), CFSTR("HUCameraCancelText"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithTitle:style:target:action:", v7, 0, self, sel_cancelSubmission);
  -[HUCameraRecordingExportPreviewViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLeftBarButtonItem:", v8);

  if (-[HUCameraRecordingExportPreviewViewController hasVideoPreview](self, "hasVideoPreview"))
    -[HUCameraRecordingExportPreviewViewController _loadPreviewInterface](self, "_loadPreviewInterface");
  else
    -[HUCameraRecordingExportPreviewViewController _loadLoadingInterface](self, "_loadLoadingInterface");
}

- (void)_loadPreviewInterface
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

  -[HUCameraRecordingExportPreviewViewController playerView](self, "playerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[HUCameraRecordingExportPreviewViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraRecordingExportPreviewViewController playerView](self, "playerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

    -[HUCameraRecordingExportPreviewViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraRecordingExportPreviewViewController descriptionLabel](self, "descriptionLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    -[HUCameraRecordingExportPreviewViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraRecordingExportPreviewViewController learnMoreTextView](self, "learnMoreTextView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

    -[HUCameraRecordingExportPreviewViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraRecordingExportPreviewViewController submitButton](self, "submitButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v12);

    -[HUCameraRecordingExportPreviewViewController _addConstraints](self, "_addConstraints");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUCameraRecordingExportPreviewViewController;
  -[HUCameraRecordingExportPreviewViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, a3);
  -[HUCameraRecordingExportPreviewViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingExportPreviewViewController loadingIndicatorView](self, "loadingIndicatorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColor:", v5);

}

- (void)_loadLoadingInterface
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;

  -[HUCameraRecordingExportPreviewViewController loadingIndicatorView](self, "loadingIndicatorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 101);
    -[HUCameraRecordingExportPreviewViewController setLoadingIndicatorView:](self, "setLoadingIndicatorView:", v4);

    -[HUCameraRecordingExportPreviewViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userInterfaceStyle") == 2)
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraRecordingExportPreviewViewController loadingIndicatorView](self, "loadingIndicatorView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setColor:", v6);

    -[HUCameraRecordingExportPreviewViewController loadingIndicatorView](self, "loadingIndicatorView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startAnimating");

    -[HUCameraRecordingExportPreviewViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "center");
    v11 = v10;
    v13 = v12;
    -[HUCameraRecordingExportPreviewViewController loadingIndicatorView](self, "loadingIndicatorView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCenter:", v11, v13);

    -[HUCameraRecordingExportPreviewViewController view](self, "view");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[HUCameraRecordingExportPreviewViewController loadingIndicatorView](self, "loadingIndicatorView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v15);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUCameraRecordingExportPreviewViewController;
  -[HUCameraRecordingExportPreviewViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (-[HUCameraRecordingExportPreviewViewController hasVideoPreview](self, "hasVideoPreview"))
    -[HUCameraRecordingExportPreviewViewController playVideoFile](self, "playVideoFile");
}

- (void)playVideoFile
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  CMTime v10;
  id location;

  objc_initWeak(&location, self);
  -[HUCameraRecordingExportPreviewViewController queuePlayer](self, "queuePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeMakeWithSeconds(&v10, 0.017, 60);
  v4 = MEMORY[0x1E0C80D38];
  v5 = MEMORY[0x1E0C80D38];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__HUCameraRecordingExportPreviewViewController_playVideoFile__block_invoke;
  v8[3] = &unk_1E6F53958;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v10, v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingExportPreviewViewController setQueuePlayerObserver:](self, "setQueuePlayerObserver:", v6);

  -[HUCameraRecordingExportPreviewViewController queuePlayer](self, "queuePlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "play");

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __61__HUCameraRecordingExportPreviewViewController_playVideoFile__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  double Seconds;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  void *v11;
  double v12;
  CMTime v13;
  CMTime time;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "queuePlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "currentTime");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);
  objc_msgSend(WeakRetained, "queuePlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "duration");
  else
    memset(&v13, 0, sizeof(v13));
  v9 = Seconds / CMTimeGetSeconds(&v13);
  objc_msgSend(WeakRetained, "playerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "progressView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = v9;
  objc_msgSend(v11, "setProgress:", v12);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUCameraRecordingExportPreviewViewController;
  -[HUCameraRecordingExportPreviewViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  -[HUCameraRecordingExportPreviewViewController queuePlayerObserver](self, "queuePlayerObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HUCameraRecordingExportPreviewViewController queuePlayer](self, "queuePlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraRecordingExportPreviewViewController queuePlayerObserver](self, "queuePlayerObserver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeTimeObserver:", v6);

  }
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
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  _QWORD v82[18];

  v82[16] = *MEMORY[0x1E0C80C00];
  -[HUCameraRecordingExportPreviewViewController playerView](self, "playerView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "heightAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToConstant:", 220.0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v79;
  -[HUCameraRecordingExportPreviewViewController playerView](self, "playerView");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "widthAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToConstant:", 390.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v76;
  -[HUCameraRecordingExportPreviewViewController playerView](self, "playerView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "topAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingExportPreviewViewController view](self, "view");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "safeAreaLayoutGuide");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "topAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:constant:", v71, 20.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v82[2] = v70;
  -[HUCameraRecordingExportPreviewViewController playerView](self, "playerView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "centerXAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingExportPreviewViewController view](self, "view");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "centerXAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:", v66);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v82[3] = v65;
  -[HUCameraRecordingExportPreviewViewController descriptionLabel](self, "descriptionLabel");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "topAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingExportPreviewViewController playerView](self, "playerView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bottomAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:constant:", v61, 10.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v82[4] = v60;
  -[HUCameraRecordingExportPreviewViewController descriptionLabel](self, "descriptionLabel");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "leftAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingExportPreviewViewController view](self, "view");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "safeAreaLayoutGuide");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "leftAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:constant:", v55, 10.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v82[5] = v54;
  -[HUCameraRecordingExportPreviewViewController descriptionLabel](self, "descriptionLabel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "rightAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingExportPreviewViewController view](self, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "safeAreaLayoutGuide");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "rightAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, -10.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v82[6] = v48;
  -[HUCameraRecordingExportPreviewViewController submitButton](self, "submitButton");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingExportPreviewViewController view](self, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "safeAreaLayoutGuide");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, -20.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v82[7] = v42;
  -[HUCameraRecordingExportPreviewViewController submitButton](self, "submitButton");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "heightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToConstant:", 47.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v82[8] = v39;
  -[HUCameraRecordingExportPreviewViewController submitButton](self, "submitButton");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "centerXAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingExportPreviewViewController view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "centerXAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v82[9] = v33;
  -[HUCameraRecordingExportPreviewViewController submitButton](self, "submitButton");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "leftAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingExportPreviewViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "safeAreaLayoutGuide");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leftAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v28, 20.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v82[10] = v27;
  -[HUCameraRecordingExportPreviewViewController submitButton](self, "submitButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "rightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingExportPreviewViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "safeAreaLayoutGuide");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "rightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v22, -20.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v82[11] = v21;
  -[HUCameraRecordingExportPreviewViewController learnMoreTextView](self, "learnMoreTextView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "heightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToConstant:", 80.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v82[12] = v18;
  -[HUCameraRecordingExportPreviewViewController learnMoreTextView](self, "learnMoreTextView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingExportPreviewViewController submitButton](self, "submitButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v14, -10.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v82[13] = v13;
  -[HUCameraRecordingExportPreviewViewController learnMoreTextView](self, "learnMoreTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leftAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingExportPreviewViewController submitButton](self, "submitButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leftAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v82[14] = v7;
  -[HUCameraRecordingExportPreviewViewController learnMoreTextView](self, "learnMoreTextView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingExportPreviewViewController submitButton](self, "submitButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v82[15] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 16);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v35);
}

- (void)showPrivacyInformation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  HUCameraRecordingPrivacyTextViewController *v22;

  v22 = objc_alloc_init(HUCameraRecordingPrivacyTextViewController);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingPrivacyTextViewController view](v22, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc(MEMORY[0x1E0CEA380]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUDoneTitle"), CFSTR("HUDoneTitle"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v6, 0, self, sel_didDismissPrivacyViewController);
  -[HUCameraRecordingPrivacyTextViewController navigationItem](v22, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v22);
  objc_msgSend(v9, "setModalPresentationStyle:", 2);
  -[HUCameraRecordingExportPreviewViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "popoverPresentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSourceView:", v10);

  -[HUCameraRecordingExportPreviewViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v9, "popoverPresentationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSourceRect:", v14, v16, v18, v20);

  -[HUCameraRecordingExportPreviewViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

- (void)didDismissPrivacyViewController
{
  -[HUCameraRecordingExportPreviewViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)submitCurrentClip
{
  void (**v3)(_QWORD, _QWORD);

  -[HUCameraRecordingExportPreviewViewController completionHandler](self, "completionHandler");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v3[2](v3, 1);

  -[HUCameraRecordingExportPreviewViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)cancelSubmission
{
  void (**v3)(_QWORD, _QWORD);

  -[HUCameraRecordingExportPreviewViewController completionHandler](self, "completionHandler");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v3[2](v3, 0);

  -[HUCameraRecordingExportPreviewViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_displayFailureToSubmitAlert
{
  void *v3;
  void *v4;
  id v5;

  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFeedbackFailureToSubmitTitle"), CFSTR("HUCameraFeedbackFailureToSubmitTitle"), 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFeedbackFailureToSubmitMessage"), CFSTR("HUCameraFeedbackFailureToSubmitMessage"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2E8], "hu_alertControllerForAcknowledgementWithTitle:message:", v5, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingExportPreviewViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)_stripAndTruncateRecording
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HUCameraRecordingExportPreviewViewController cameraClip](self, "cameraClip");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Starting Strip and truncate operation for clip:%@", buf, 0xCu);

  }
  v5 = objc_alloc(MEMORY[0x1E0D31208]);
  -[HUCameraRecordingExportPreviewViewController cameraClip](self, "cameraClip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__HUCameraRecordingExportPreviewViewController__stripAndTruncateRecording__block_invoke;
  v9[3] = &unk_1E6F53980;
  v9[4] = self;
  v7 = (void *)objc_msgSend(v5, "initWithCameraClip:completionHandler:", v6, v9);

  -[HUCameraRecordingExportPreviewViewController backgroundSessionQueue](self, "backgroundSessionQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v7);

}

void __74__HUCameraRecordingExportPreviewViewController__stripAndTruncateRecording__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Finally completed stripping the audio at %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__HUCameraRecordingExportPreviewViewController__stripAndTruncateRecording__block_invoke_31;
  v7[3] = &unk_1E6F4C638;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __74__HUCameraRecordingExportPreviewViewController__stripAndTruncateRecording__block_invoke_31(uint64_t a1)
{
  void *v2;
  NSObject *v4;
  uint8_t v5[16];

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setExportURL:");
    objc_msgSend(*(id *)(a1 + 40), "loadingIndicatorView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setHidden:", 1);

    objc_msgSend(*(id *)(a1 + 40), "setHasVideoPreview:", 1);
    objc_msgSend(*(id *)(a1 + 40), "_loadPreviewInterface");
    return objc_msgSend(*(id *)(a1 + 40), "playVideoFile");
  }
  else
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "Unable to locate output URL after stripping audio. Try again later.", v5, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 40), "_displayFailureToSubmitAlert");
  }
}

- (void)prepareRecordingForExport
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id buf[2];

  v3 = (void *)MEMORY[0x1E0D311F8];
  -[HUCameraRecordingExportPreviewViewController cameraClip](self, "cameraClip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "hasCachedRecordingForCameraClip:", v4);

  if ((_DWORD)v3)
  {
    -[HUCameraRecordingExportPreviewViewController _stripAndTruncateRecording](self, "_stripAndTruncateRecording");
  }
  else
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Download file to prepare for export.", (uint8_t *)buf, 2u);
    }

    v6 = objc_alloc(MEMORY[0x1E0CBA3E0]);
    -[HUCameraRecordingExportPreviewViewController cameraProfile](self, "cameraProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clipManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraRecordingExportPreviewViewController cameraClip](self, "cameraClip");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "initWithClipManager:clip:", v8, v9);

    v11 = (void *)MEMORY[0x1E0D31288];
    -[HUCameraRecordingExportPreviewViewController cameraClip](self, "cameraClip");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "videoDestinationURLForCameraClip:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClipDestinationFileURL:", v13);

    objc_msgSend(v10, "setDownloadProgressHandler:", &__block_literal_global_99);
    objc_initWeak(buf, self);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __73__HUCameraRecordingExportPreviewViewController_prepareRecordingForExport__block_invoke_38;
    v14[3] = &unk_1E6F539E8;
    objc_copyWeak(&v15, buf);
    objc_msgSend(v10, "setFetchVideoAssetContextCompletionBlock:", v14);
    objc_msgSend(v10, "start");
    -[HUCameraRecordingExportPreviewViewController setVideoDownloadOperation:](self, "setVideoDownloadOperation:", v10);
    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);

  }
}

void __73__HUCameraRecordingExportPreviewViewController_prepareRecordingForExport__block_invoke(uint64_t a1, uint64_t a2)
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
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Current clip download progress completion percentage: %lu.", (uint8_t *)&v4, 0xCu);
  }

}

void __73__HUCameraRecordingExportPreviewViewController_prepareRecordingForExport__block_invoke_38(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (v4)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "cameraClip");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v4;
      v11 = 2112;
      v12 = v8;
      _os_log_error_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_ERROR, "Error: %@ downloading video file for clip: %@. THIS SHOULD NEVER HAPPEN.", (uint8_t *)&v9, 0x16u);

    }
    objc_msgSend(v6, "_displayFailureToSubmitAlert");
  }
  else
  {
    objc_msgSend(WeakRetained, "_stripAndTruncateRecording");
    objc_msgSend(v6, "setVideoDownloadOperation:", 0);
  }

}

- (HUCameraRecordingPlayerView)playerView
{
  HUCameraRecordingPlayerView *playerView;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HUCameraRecordingPlayerView *v9;
  void *v10;
  HUCameraRecordingPlayerView *v11;

  playerView = self->_playerView;
  if (!playerView)
  {
    v4 = (void *)MEMORY[0x1E0C8B300];
    -[HUCameraRecordingExportPreviewViewController exportURL](self, "exportURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playerItemWithURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(MEMORY[0x1E0C8B350]);
    -[HUCameraRecordingExportPreviewViewController setQueuePlayer:](self, "setQueuePlayer:", v7);
    objc_msgSend(MEMORY[0x1E0C8B338], "playerLooperWithPlayer:templateItem:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraRecordingExportPreviewViewController setLooper:](self, "setLooper:", v8);

    v9 = -[HUCameraRecordingPlayerView initWithPlayer:displayingProgressView:]([HUCameraRecordingPlayerView alloc], "initWithPlayer:displayingProgressView:", v7, 1);
    -[HUCameraRecordingPlayerView layer](v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCornerRadius:", 8.0);

    -[HUCameraRecordingPlayerView setClipsToBounds:](v9, "setClipsToBounds:", 1);
    -[HUCameraRecordingPlayerView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = self->_playerView;
    self->_playerView = v9;

    playerView = self->_playerView;
  }
  return playerView;
}

- (UILabel)descriptionLabel
{
  UILabel *descriptionLabel;
  UILabel *v4;
  void *v5;
  UILabel *v6;

  descriptionLabel = self->_descriptionLabel;
  if (!descriptionLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v4, "setTextAlignment:", 1);
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraExportFeedbackExplanation"), CFSTR("HUCameraExportFeedbackExplanation"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v4, "setText:", v5);

    v6 = self->_descriptionLabel;
    self->_descriptionLabel = v4;

    descriptionLabel = self->_descriptionLabel;
  }
  return descriptionLabel;
}

- (UIButton)submitButton
{
  UIButton *submitButton;
  UIButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIButton *v9;

  submitButton = self->_submitButton;
  if (!submitButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, sel_submitCurrentClip, 64);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v4, "setTintColor:", v5);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v4, "setBackgroundColor:", v6);

    -[UIButton layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 8.0);

    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraExportFeedbackSubmitButtonTitle"), CFSTR("HUCameraExportFeedbackSubmitButtonTitle"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v4, "setTitle:forState:", v8, 0);

    v9 = self->_submitButton;
    self->_submitButton = v4;

    submitButton = self->_submitButton;
  }
  return submitButton;
}

- (UITextView)learnMoreTextView
{
  UITextView *learnMoreTextView;
  UITextView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UITextView *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  learnMoreTextView = self->_learnMoreTextView;
  if (!learnMoreTextView)
  {
    v4 = (UITextView *)objc_alloc_init(MEMORY[0x1E0CEAB18]);
    -[UITextView setEditable:](v4, "setEditable:", 0);
    v5 = (void *)MEMORY[0x1E0CB3498];
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraExportFeedbackConsumerSubheadingText"), CFSTR("HUCameraExportFeedbackConsumerSubheadingText"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraExportFeedbackConsumerSubheadingLinkText"), CFSTR("HUCameraExportFeedbackConsumerSubheadingLinkText"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E6F60E80);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0CEA0A0];
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_attributedLinkStringForString:linkString:linkURL:attributes:additionalLinkAttributes:", v6, v7, v8, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setAttributedText:](v4, "setAttributedText:", v11);

    -[UITextView setDelegate:](v4, "setDelegate:", self);
    -[UITextView setTextAlignment:](v4, "setTextAlignment:", 1);
    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = self->_learnMoreTextView;
    self->_learnMoreTextView = v4;

    learnMoreTextView = self->_learnMoreTextView;
  }
  return learnMoreTextView;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v8;
  NSObject *v9;
  int v11;
  HUCameraRecordingExportPreviewViewController *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v11, 0x16u);
  }

  if (!a6)
    -[HUCameraRecordingExportPreviewViewController showPrivacyInformation](self, "showPrivacyInformation");

  return 0;
}

- (HMCameraClip)cameraClip
{
  return (HMCameraClip *)objc_loadWeakRetained((id *)&self->_cameraClip);
}

- (void)setCameraClip:(id)a3
{
  objc_storeWeak((id *)&self->_cameraClip, a3);
}

- (HMCameraProfile)cameraProfile
{
  return (HMCameraProfile *)objc_loadWeakRetained((id *)&self->_cameraProfile);
}

- (void)setCameraProfile:(id)a3
{
  objc_storeWeak((id *)&self->_cameraProfile, a3);
}

- (NSURL)exportURL
{
  return self->_exportURL;
}

- (void)setExportURL:(id)a3
{
  objc_storeStrong((id *)&self->_exportURL, a3);
}

- (HMCameraClipFetchVideoAssetContextOperation)videoDownloadOperation
{
  return self->_videoDownloadOperation;
}

- (void)setVideoDownloadOperation:(id)a3
{
  objc_storeStrong((id *)&self->_videoDownloadOperation, a3);
}

- (BOOL)hasVideoPreview
{
  return self->_hasVideoPreview;
}

- (void)setHasVideoPreview:(BOOL)a3
{
  self->_hasVideoPreview = a3;
}

- (AVQueuePlayer)queuePlayer
{
  return (AVQueuePlayer *)objc_loadWeakRetained((id *)&self->_queuePlayer);
}

- (void)setQueuePlayer:(id)a3
{
  objc_storeWeak((id *)&self->_queuePlayer, a3);
}

- (AVPlayerLooper)looper
{
  return self->_looper;
}

- (void)setLooper:(id)a3
{
  objc_storeStrong((id *)&self->_looper, a3);
}

- (void)setPlayerView:(id)a3
{
  objc_storeStrong((id *)&self->_playerView, a3);
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (void)setSubmitButton:(id)a3
{
  objc_storeStrong((id *)&self->_submitButton, a3);
}

- (void)setLearnMoreTextView:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreTextView, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (id)queuePlayerObserver
{
  return self->_queuePlayerObserver;
}

- (void)setQueuePlayerObserver:(id)a3
{
  objc_storeStrong(&self->_queuePlayerObserver, a3);
}

- (UIActivityIndicatorView)loadingIndicatorView
{
  return self->_loadingIndicatorView;
}

- (void)setLoadingIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingIndicatorView, a3);
}

- (NSOperationQueue)backgroundSessionQueue
{
  return self->_backgroundSessionQueue;
}

- (void)setBackgroundSessionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundSessionQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundSessionQueue, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorView, 0);
  objc_storeStrong(&self->_queuePlayerObserver, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_learnMoreTextView, 0);
  objc_storeStrong((id *)&self->_submitButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_looper, 0);
  objc_destroyWeak((id *)&self->_queuePlayer);
  objc_storeStrong((id *)&self->_videoDownloadOperation, 0);
  objc_storeStrong((id *)&self->_exportURL, 0);
  objc_destroyWeak((id *)&self->_cameraProfile);
  objc_destroyWeak((id *)&self->_cameraClip);
}

@end
