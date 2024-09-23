@implementation AVTCombinedPickerViewController

- (AVTCombinedPickerViewController)initWithSelectedRecord:(id)a3
{
  id v5;
  AVTCombinedPickerViewController *v6;
  uint64_t v7;
  AVTUIEnvironment *environment;
  AVTAvatarStore *v9;
  AVTAvatarStore *avatarStore;
  AVTAvatarRecordDataSource *v11;
  AVTAvatarStore *v12;
  void *v13;
  uint64_t v14;
  AVTAvatarRecordDataSource *recordDataSource;
  AVTAvatarPickerDataSource *v16;
  uint64_t v17;
  _AVTAvatarRecordImageProvider *v18;
  void *v19;
  _AVTAvatarRecordImageProvider *v20;
  id v21;
  AVTViewSessionProvider *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  AVTViewSessionProvider *v30;
  void *v31;
  AVTSimpleAvatarPicker *v32;
  AVTSimpleAvatarPicker *avatarPicker;
  void *v34;
  double v35;
  AVTPoseSelectionViewController *v36;
  AVTPoseSelectionViewController *poseController;
  AVTAvatarActionsProvider *v38;
  AVTAvatarActionsProvider *actionsModel;
  AVTAvatarInlineActionsController *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  AVTAvatarInlineActionsController *actionsViewHandler;
  AVTStickerConfiguration *stickerConfiguration;
  objc_super v47;

  v5 = a3;
  v47.receiver = self;
  v47.super_class = (Class)AVTCombinedPickerViewController;
  v6 = -[AVTCombinedPickerViewController initWithNibName:bundle:](&v47, sel_initWithNibName_bundle_, 0, 0);
  if (v6)
  {
    +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
    v7 = objc_claimAutoreleasedReturnValue();
    environment = v6->_environment;
    v6->_environment = (AVTUIEnvironment *)v7;

    v9 = objc_alloc_init(AVTAvatarStore);
    avatarStore = v6->_avatarStore;
    v6->_avatarStore = v9;

    v11 = [AVTAvatarRecordDataSource alloc];
    v12 = v6->_avatarStore;
    objc_msgSend(MEMORY[0x1E0D00840], "requestForAllAvatars");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[AVTAvatarRecordDataSource initWithRecordStore:fetchRequest:environment:](v11, "initWithRecordStore:fetchRequest:environment:", v12, v13, v6->_environment);
    recordDataSource = v6->_recordDataSource;
    v6->_recordDataSource = (AVTAvatarRecordDataSource *)v14;

    v16 = -[AVTAvatarPickerDataSource initWithRecordDataSource:environment:allowAddItem:]([AVTAvatarPickerDataSource alloc], "initWithRecordDataSource:environment:allowAddItem:", v6->_recordDataSource, v6->_environment, 0);
    +[AVTStickerTaskScheduler schedulerWithRecordDataSource:](AVTStickerTaskScheduler, "schedulerWithRecordDataSource:", v6->_recordDataSource);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = [_AVTAvatarRecordImageProvider alloc];
    -[AVTAvatarPickerDataSource environment](v16, "environment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[_AVTAvatarRecordImageProvider initWithEnvironment:taskScheduler:](v18, "initWithEnvironment:taskScheduler:", v19, 0);

    v21 = v5;
    v22 = [AVTViewSessionProvider alloc];
    -[AVTAvatarPickerDataSource environment](v16, "environment");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTViewSessionProvider backingSizeForEnvironment:](AVTViewSessionProvider, "backingSizeForEnvironment:", v23);
    v25 = v24;
    v27 = v26;
    +[AVTViewSessionProvider creatorForAVTView](AVTViewSessionProvider, "creatorForAVTView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarPickerDataSource environment](v16, "environment");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[AVTViewSessionProvider initWithAVTViewBackingSize:viewCreator:environment:](v22, "initWithAVTViewBackingSize:viewCreator:environment:", v28, v29, v25, v27);

    v5 = v21;
    v31 = (void *)v17;
    v32 = -[AVTSimpleAvatarPicker initWithDataSource:recordImageProvider:avtViewSessionProvider:taskScheduler:allowEditing:interItemSpacing:]([AVTSimpleAvatarPicker alloc], "initWithDataSource:recordImageProvider:avtViewSessionProvider:taskScheduler:allowEditing:interItemSpacing:", v16, v20, v30, v17, 1, 2.0);
    avatarPicker = v6->_avatarPicker;
    v6->_avatarPicker = v32;

    -[AVTSimpleAvatarPicker setDoesDisplayEditIconWhenAvailable:](v6->_avatarPicker, "setDoesDisplayEditIconWhenAvailable:", 0);
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "userInterfaceIdiom") == 1)
      v35 = 15.0;
    else
      v35 = 45.0;

    -[AVTSimpleAvatarPicker setContentInset:](v6->_avatarPicker, "setContentInset:", 15.0, 10.0, v35, 10.0);
    objc_storeStrong((id *)&v6->_avatarRecord, a3);
    v36 = -[AVTPoseSelectionViewController initWithSelectedRecord:]([AVTPoseSelectionViewController alloc], "initWithSelectedRecord:", v5);
    poseController = v6->_poseController;
    v6->_poseController = v36;

    -[AVTPoseSelectionViewController setShouldNotifyDelegateOnSelection:](v6->_poseController, "setShouldNotifyDelegateOnSelection:", 1);
    -[AVTPoseSelectionViewController setUsesSingleButtonCaptureReview:](v6->_poseController, "setUsesSingleButtonCaptureReview:", 1);
    -[AVTPoseSelectionViewController setDelegate:](v6->_poseController, "setDelegate:", v6);
    v38 = -[AVTAvatarActionsProvider initWithAvatarRecord:dataSource:allowCreate:]([AVTAvatarActionsProvider alloc], "initWithAvatarRecord:dataSource:allowCreate:", v6->_avatarRecord, v6->_recordDataSource, 1);
    actionsModel = v6->_actionsModel;
    v6->_actionsModel = v38;

    v40 = [AVTAvatarInlineActionsController alloc];
    -[AVTAvatarPickerDataSource recordDataSource](v16, "recordDataSource");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarPickerDataSource environment](v16, "environment");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[AVTAvatarInlineActionsController initWithDataSource:avtViewProvider:environment:](v40, "initWithDataSource:avtViewProvider:environment:", v41, v30, v42);
    actionsViewHandler = v6->_actionsViewHandler;
    v6->_actionsViewHandler = (AVTAvatarInlineActionsController *)v43;

    -[AVTAvatarInlineActionsController setDelegate:](v6->_actionsViewHandler, "setDelegate:", v6);
    stickerConfiguration = v6->_stickerConfiguration;
    v6->_stickerConfiguration = 0;

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  NSObject *avatarStoreChangeObserver;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_avatarStoreChangeObserver);

  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = 0;

  v5.receiver = self;
  v5.super_class = (Class)AVTCombinedPickerViewController;
  -[AVTCombinedPickerViewController dealloc](&v5, sel_dealloc);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
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
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
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
  id v35;
  void *v36;
  void *v37;
  UIBarButtonItem *v38;
  UIBarButtonItem *doneButton;
  UIBarButtonItem *v40;
  void *v41;
  AVTSimpleAvatarPicker *avatarPicker;
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
  objc_super v75;
  _QWORD v76[10];

  v76[8] = *MEMORY[0x1E0C80C00];
  v75.receiver = self;
  v75.super_class = (Class)AVTCombinedPickerViewController;
  -[AVTCombinedPickerViewController viewDidLoad](&v75, sel_viewDidLoad);
  -[AVTCombinedPickerViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setBackgroundHidden:", 1);

  -[AVTCombinedPickerViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTranslucent");

  if ((v6 & 1) == 0)
    -[AVTCombinedPickerViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 1);
  -[AVTCombinedPickerViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLargeTitleDisplayMode:", 2);

  -[AVTPoseSelectionViewController view](self->_poseController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AVTCombinedPickerViewController addChildViewController:](self, "addChildViewController:", self->_poseController);
  -[AVTCombinedPickerViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseSelectionViewController view](self->_poseController, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  -[AVTPoseSelectionViewController didMoveToParentViewController:](self->_poseController, "didMoveToParentViewController:", self);
  -[AVTSimpleAvatarPicker view](self->_avatarPicker, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AVTSimpleAvatarPicker setAvatarPickerDelegate:](self->_avatarPicker, "setAvatarPickerDelegate:", self);
  -[AVTSimpleAvatarPicker setPresenterDelegate:](self->_avatarPicker, "setPresenterDelegate:", self);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSimpleAvatarPicker view](self->_avatarPicker, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v12);

  -[AVTCombinedPickerViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSimpleAvatarPicker view](self->_avatarPicker, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCombinedPickerViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  objc_msgSend(v16, "setFrame:", 0.0, 0.0);

  objc_msgSend(v16, "setBorderWidth:", 1.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.1);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19 = v16;
  v74 = v16;
  objc_msgSend(v16, "setBorderColor:", objc_msgSend(v18, "CGColor"));

  -[AVTSimpleAvatarPicker view](self->_avatarPicker, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSublayer:", v19);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "userInterfaceIdiom") == 1)
    v23 = 80.0;
  else
    v23 = 110.0;

  -[AVTSimpleAvatarPicker view](self->_avatarPicker, "view");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "leadingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCombinedPickerViewController view](self, "view");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "leadingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:", v70);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v69;
  -[AVTSimpleAvatarPicker view](self->_avatarPicker, "view");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "trailingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCombinedPickerViewController view](self, "view");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "trailingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v65);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v76[1] = v64;
  -[AVTSimpleAvatarPicker view](self->_avatarPicker, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bottomAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCombinedPickerViewController view](self, "view");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "bottomAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v76[2] = v59;
  -[AVTSimpleAvatarPicker view](self->_avatarPicker, "view");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "heightAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToConstant:", v23);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v76[3] = v56;
  -[AVTSimpleAvatarPicker view](self->_avatarPicker, "view");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "topAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPoseSelectionViewController view](self->_poseController, "view");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v76[4] = v51;
  -[AVTPoseSelectionViewController view](self->_poseController, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCombinedPickerViewController view](self, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v76[5] = v45;
  -[AVTPoseSelectionViewController view](self->_poseController, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCombinedPickerViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v76[6] = v27;
  -[AVTPoseSelectionViewController view](self->_poseController, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCombinedPickerViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v76[7] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 8);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v50);
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_didTapCancel_);
  -[AVTCombinedPickerViewController navigationItem](self, "navigationItem");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setLeftBarButtonItem:", v33);

  v35 = objc_alloc(MEMORY[0x1E0CEA380]);
  AVTAvatarUIBundle();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("NEXT"), &stru_1EA5207B8, CFSTR("Localized"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (UIBarButtonItem *)objc_msgSend(v35, "initWithTitle:style:target:action:", v37, 2, self, sel_didTapDone_);
  doneButton = self->_doneButton;
  self->_doneButton = v38;

  v40 = self->_doneButton;
  -[AVTCombinedPickerViewController navigationItem](self, "navigationItem");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setRightBarButtonItem:", v40);

  -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", 0);
  -[AVTSimpleAvatarPicker reloadDataSource](self->_avatarPicker, "reloadDataSource");
  avatarPicker = self->_avatarPicker;
  -[AVTAvatarRecord identifier](self->_avatarRecord, "identifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSimpleAvatarPicker selectAvatarRecordWithIdentifier:animated:](avatarPicker, "selectAvatarRecordWithIdentifier:animated:", v43, 0);

  -[AVTCombinedPickerViewController updateActionModel](self, "updateActionModel");
  -[AVTCombinedPickerViewController beginObservingAvatarStoreChanges](self, "beginObservingAvatarStoreChanges");

}

- (id)defaultAvatar
{
  AVTAvatarStore *avatarStore;
  void *v3;
  void *v4;
  void *v5;

  avatarStore = self->_avatarStore;
  objc_msgSend(MEMORY[0x1E0D00840], "requestForStorePrimaryAvatar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarStore avatarsForFetchRequest:error:](avatarStore, "avatarsForFetchRequest:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)beginObservingAvatarStoreChanges
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *avatarStoreChangeObserver;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D006D8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__AVTCombinedPickerViewController_beginObservingAvatarStoreChanges__block_invoke;
  v7[3] = &unk_1EA51DB40;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, 0, v7);
  v5 = objc_claimAutoreleasedReturnValue();
  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __67__AVTCombinedPickerViewController_beginObservingAvatarStoreChanges__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "refreshPickerForStoreUpdate");

}

- (void)refreshPickerForStoreUpdate
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__AVTCombinedPickerViewController_refreshPickerForStoreUpdate__block_invoke;
  v2[3] = &unk_1EA51D7E8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __62__AVTCombinedPickerViewController_refreshPickerForStoreUpdate__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "avatarPicker");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(WeakRetained, "avatarPicker");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadDataSource");

    objc_msgSend(WeakRetained, "avatarPicker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "selectedAvatar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "avatarRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 != v5)
    {
      objc_msgSend(WeakRetained, "avatarPicker");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "avatarRecord");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "selectAvatarRecordWithIdentifier:animated:", v8, 1);

    }
  }

}

- (void)endObservingAvatarStoreChanges
{
  void *v3;
  NSObject *avatarStoreChangeObserver;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_avatarStoreChangeObserver);

  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = 0;

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

- (void)returnPressed:(id)a3
{
  id v4;

  v4 = a3;
  if (-[UIBarButtonItem isEnabled](self->_doneButton, "isEnabled"))
    -[AVTCombinedPickerViewController didTapDone:](self, "didTapDone:", v4);

}

- (void)didTapDone:(id)a3
{
  id v4;

  -[AVTCombinedPickerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "combinedPickerViewController:didSelectRecord:withStickerConfiguration:", self, self->_avatarRecord, self->_stickerConfiguration);

}

- (void)didTapCancel:(id)a3
{
  id v4;

  -[AVTCombinedPickerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "combinedPickerViewControllerDidCancel:", self);

}

- (void)didSelectAvatarRecord:(id)a3
{
  AVTAvatarRecord *v5;
  AVTAvatarRecord *v6;

  v5 = (AVTAvatarRecord *)a3;
  if (v5 && self->_avatarRecord != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_avatarRecord, a3);
    -[AVTPoseSelectionViewController setNewAvatarRecord:](self->_poseController, "setNewAvatarRecord:", v6);
    -[AVTCombinedPickerViewController updateActionModel](self, "updateActionModel");
    v5 = v6;
  }

}

- (void)updateActionModel
{
  AVTAvatarActionsProvider *v3;
  AVTAvatarActionsProvider *actionsModel;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = -[AVTAvatarActionsProvider initWithAvatarRecord:dataSource:allowCreate:]([AVTAvatarActionsProvider alloc], "initWithAvatarRecord:dataSource:allowCreate:", self->_avatarRecord, self->_recordDataSource, 0);
  actionsModel = self->_actionsModel;
  self->_actionsModel = v3;

  -[AVTAvatarInlineActionsController updateWithActionsModel:](self->_actionsViewHandler, "updateWithActionsModel:", self->_actionsModel);
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[AVTAvatarActionsProvider canPerformActionType:](self->_actionsModel, "canPerformActionType:", 0))
  {
    -[AVTAvatarActionsProvider editAction](self->_actionsModel, "editAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("pencil"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v6);

    objc_msgSend(v12, "addObject:", v5);
  }
  if (-[AVTAvatarActionsProvider canPerformActionType:](self->_actionsModel, "canPerformActionType:", 1))
  {
    -[AVTAvatarActionsProvider duplicateAction](self->_actionsModel, "duplicateAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("doc.on.doc"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v8);

    objc_msgSend(v12, "addObject:", v7);
  }
  if (-[AVTAvatarActionsProvider canPerformActionType:](self->_actionsModel, "canPerformActionType:", 2))
  {
    -[AVTAvatarActionsProvider deleteAction](self->_actionsModel, "deleteAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("trash"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v10);

    objc_msgSend(v12, "addObject:", v9);
  }
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CEA740], "menuWithChildren:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseSelectionViewController setHeaderMenu:](self->_poseController, "setHeaderMenu:", v11);

  }
  else
  {
    -[AVTPoseSelectionViewController setHeaderMenu:](self->_poseController, "setHeaderMenu:", 0);
  }

}

- (void)presentUpdatedAvatarRecord:(id)a3 animated:(BOOL)a4
{
  -[AVTCombinedPickerViewController presentUpdatedAvatarRecord:animated:completion:](self, "presentUpdatedAvatarRecord:animated:completion:", a3, a4, 0);
}

- (void)presentUpdatedAvatarRecord:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  BOOL v13;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __82__AVTCombinedPickerViewController_presentUpdatedAvatarRecord_animated_completion___block_invoke;
    v10[3] = &unk_1EA51F850;
    v10[4] = self;
    v11 = v8;
    v13 = a4;
    v12 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  }
}

uint64_t __82__AVTCombinedPickerViewController_presentUpdatedAvatarRecord_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "avatarPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedAvatar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);

  if (v3 != v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "avatarPicker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectAvatarRecordWithIdentifier:animated:", v6, *(unsigned __int8 *)(a1 + 56));

  }
  objc_msgSend(*(id *)(a1 + 32), "didSelectAvatarRecord:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)wrapAndPresentViewController:(id)a3 animated:(BOOL)a4
{
  id v5;

  +[AVTUIControllerPresentation presentationWithWrappingForController:](AVTUIControllerPresentation, "presentationWithWrappingForController:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTCombinedPickerViewController presentAvatarUIController:animated:](self, "presentAvatarUIController:animated:", v5, 1);

}

- (void)poseSelectionController:(id)a3 didSelectPoseWithConfiguration:(id)a4
{
  id v6;

  objc_storeStrong((id *)&self->_stickerConfiguration, a4);
  v6 = a4;
  -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", 1);

}

- (void)poseSelectionControllerDidCancel:(id)a3
{
  id v4;

  -[AVTCombinedPickerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "combinedPickerViewControllerDidCancel:", self);

}

- (void)poseSelectionController:(id)a3 didSetMode:(unint64_t)a4 withConfiguration:(id)a5
{
  BOOL v8;
  uint64_t v9;
  id v10;

  v10 = a5;
  objc_storeStrong((id *)&self->_stickerConfiguration, a5);
  if (self->_stickerConfiguration)
    v8 = a4 == 1;
  else
    v8 = 1;
  v9 = !v8;
  -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", v9);

}

- (void)avatarPicker:(id)a3 didSelectAvatarRecord:(id)a4
{
  -[AVTCombinedPickerViewController didSelectAvatarRecord:](self, "didSelectAvatarRecord:", a4);
}

- (BOOL)avatarPicker:(id)a3 shouldPresentMemojiEditorForAvatarRecord:(id)a4
{
  return 1;
}

- (void)presentAvatarUIController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v4 = a4;
  objc_msgSend(a3, "controller");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "horizontalSizeClass");

  if (v8 == 2)
  {
    objc_msgSend(v10, "setPreferredContentSize:", 624.0, 746.0);
    objc_msgSend(v10, "setModalInPresentation:", 1);
    v9 = 2;
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v10, "setModalPresentationStyle:", v9);
  -[AVTCombinedPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, v4, 0);

}

- (void)dismissAvatarUIControllerAnimated:(BOOL)a3
{
  -[AVTCombinedPickerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", a3, 0);
}

- (void)presentedAvatarRecord:(id)a3
{
  -[AVTCombinedPickerViewController presentUpdatedAvatarRecord:animated:](self, "presentUpdatedAvatarRecord:animated:", a3, 0);
}

- (void)actionsController:(id)a3 didAddRecord:(id)a4
{
  -[AVTCombinedPickerViewController presentUpdatedAvatarRecord:animated:](self, "presentUpdatedAvatarRecord:animated:", a4, 1);
}

- (void)actionsController:(id)a3 didDeleteRecord:(id)a4 withRecordUpdate:(id)a5 completionBlock:(id)a6
{
  uint64_t v7;
  id v8;

  if (a5)
  {
    objc_msgSend(a5, "avatarRecord", a3, a4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7
      || (-[AVTCombinedPickerViewController defaultAvatar](self, "defaultAvatar"),
          (v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = (id)v7;
      -[AVTCombinedPickerViewController presentUpdatedAvatarRecord:animated:](self, "presentUpdatedAvatarRecord:animated:", v7, 1);

    }
  }
}

- (void)actionsController:(id)a3 didDuplicateToRecord:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__AVTCombinedPickerViewController_actionsController_didDuplicateToRecord_completionBlock___block_invoke;
  v11[3] = &unk_1EA51D7E8;
  objc_copyWeak(&v12, &location);
  -[AVTCombinedPickerViewController presentUpdatedAvatarRecord:animated:completion:](self, "presentUpdatedAvatarRecord:animated:completion:", v9, 1, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __90__AVTCombinedPickerViewController_actionsController_didDuplicateToRecord_completionBlock___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "actionsModel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didTapEdit");

}

- (void)actionsController:(id)a3 didEditRecord:(id)a4
{
  -[AVTCombinedPickerViewController presentUpdatedAvatarRecord:animated:](self, "presentUpdatedAvatarRecord:animated:", a4, 0);
}

- (void)actionsController:(id)a3 presentAlertController:(id)a4
{
  -[AVTCombinedPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (void)presentEditorViewController:(id)a3 forActionsController:(id)a4 isCreate:(BOOL)a5
{
  -[AVTCombinedPickerViewController wrapAndPresentViewController:animated:](self, "wrapAndPresentViewController:animated:", a3, 1, a5);
}

- (void)dismissEditorViewController:(id)a3 forActionsController:(id)a4 wasCreate:(BOOL)a5 didEdit:(BOOL)a6 animated:(BOOL)a7 completion:(id)a8
{
  -[AVTCombinedPickerViewController dismissAvatarUIControllerAnimated:](self, "dismissAvatarUIControllerAnimated:", 1, a4, a5, a6, a7, a8);
}

- (void)actionsControllerDidFinish:(id)a3
{
  -[AVTCombinedPickerViewController dismissAvatarUIControllerAnimated:](self, "dismissAvatarUIControllerAnimated:", 1);
}

- (AVTCombinedPickerViewControllerDelegate)delegate
{
  return (AVTCombinedPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTAvatarRecordDataSource)recordDataSource
{
  return self->_recordDataSource;
}

- (void)setRecordDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_recordDataSource, a3);
}

- (AVTAvatarStore)avatarStore
{
  return self->_avatarStore;
}

- (NSObject)avatarStoreChangeObserver
{
  return self->_avatarStoreChangeObserver;
}

- (void)setAvatarStoreChangeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_avatarStoreChangeObserver, a3);
}

- (AVTSimpleAvatarPicker)avatarPicker
{
  return self->_avatarPicker;
}

- (void)setAvatarPicker:(id)a3
{
  objc_storeStrong((id *)&self->_avatarPicker, a3);
}

- (AVTPoseSelectionViewController)poseController
{
  return self->_poseController;
}

- (void)setPoseController:(id)a3
{
  objc_storeStrong((id *)&self->_poseController, a3);
}

- (AVTAvatarActionsProvider)actionsModel
{
  return self->_actionsModel;
}

- (void)setActionsModel:(id)a3
{
  objc_storeStrong((id *)&self->_actionsModel, a3);
}

- (AVTAvatarInlineActionsController)actionsViewHandler
{
  return self->_actionsViewHandler;
}

- (void)setActionsViewHandler:(id)a3
{
  objc_storeStrong((id *)&self->_actionsViewHandler, a3);
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
  objc_storeStrong((id *)&self->_avatarRecord, a3);
}

- (AVTStickerConfiguration)stickerConfiguration
{
  return self->_stickerConfiguration;
}

- (void)setStickerConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_stickerConfiguration, a3);
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_stickerConfiguration, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_actionsViewHandler, 0);
  objc_storeStrong((id *)&self->_actionsModel, 0);
  objc_storeStrong((id *)&self->_poseController, 0);
  objc_storeStrong((id *)&self->_avatarPicker, 0);
  objc_storeStrong((id *)&self->_avatarStoreChangeObserver, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_storeStrong((id *)&self->_recordDataSource, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
