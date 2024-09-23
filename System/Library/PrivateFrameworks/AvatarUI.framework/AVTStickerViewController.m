@implementation AVTStickerViewController

+ (id)stickerViewControllerForStore:(id)a3 allowEditing:(BOOL)a4 allowPeel:(BOOL)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;
  AVTStickerViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  AVTStickerViewController *v14;
  uint64_t v16;
  _QWORD v17[2];

  v6 = a4;
  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  AVTUIStickersLastSelected();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [AVTStickerViewController alloc];
  +[AVTStickerViewController stickersAvatarsFetchRequest](AVTStickerViewController, "stickersAvatarsFetchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTStickerViewController inUseStickerPack](AVTStickerViewController, "inUseStickerPack");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = a5;
  v14 = -[AVTStickerViewController initWithStore:fetchRequest:stickerPacks:stickerConfigurationNames:selectedRecordIdentifier:allowEditing:allowPeel:environment:](v10, "initWithStore:fetchRequest:stickerPacks:stickerConfigurationNames:selectedRecordIdentifier:allowEditing:allowPeel:environment:", v7, v11, v13, 0, v9, v6, v16, v8);

  return v14;
}

+ (id)stickerViewControllerForStore:(id)a3 fetchRequest:(id)a4 stickerPacks:(id)a5 stickerConfigurationNames:(id)a6 avtViewSessionProvider:(id)a7 allowEditing:(BOOL)a8 allowPeel:(BOOL)a9
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  AVTStickerViewController *v21;
  uint64_t v23;

  v9 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  AVTUIStickersLastSelected();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v23) = a9;
  v21 = -[AVTStickerViewController initWithStore:fetchRequest:stickerPacks:stickerConfigurationNames:selectedRecordIdentifier:allowEditing:allowPeel:environment:]([AVTStickerViewController alloc], "initWithStore:fetchRequest:stickerPacks:stickerConfigurationNames:selectedRecordIdentifier:allowEditing:allowPeel:environment:", v18, v17, v16, v15, v20, v9, v23, v19);

  -[AVTStickerViewController setViewSessionProvider:](v21, "setViewSessionProvider:", v14);
  return v21;
}

+ (double)headerEdgeMarginForEnvironment:(id)a3
{
  id v3;
  double v4;

  v3 = a3;
  v4 = 10.0;
  if ((objc_msgSend(v3, "deviceIsMac") & 1) == 0 && (objc_msgSend(v3, "deviceIsPad") & 1) == 0)
  {
    if (objc_msgSend(v3, "deviceIsVision"))
      v4 = 24.0;
    else
      v4 = 8.0;
  }

  return v4;
}

+ (unint64_t)minimumNumberOfVisibleItemForWidth:(double)a3 environment:(id)a4
{
  double v5;

  if ((objc_msgSend(a4, "deviceIsMac") & 1) != 0)
  {
    v5 = 56.0;
  }
  else if (a3 <= 490.0)
  {
    v5 = 62.5;
  }
  else
  {
    v5 = 70.2352941;
  }
  return vcvtmd_u64_f64(a3 / v5);
}

+ (double)headerHeightForWidth:(double)a3 interitemSpacing:(double)a4 environment:(id)a5
{
  id v8;
  unint64_t v9;
  double v10;
  double v11;

  v8 = a5;
  v9 = objc_msgSend(a1, "minimumNumberOfVisibleItemForWidth:environment:", v8, a3);
  objc_msgSend(a1, "headerEdgeMarginForEnvironment:", v8);
  v11 = v10;

  return fmin((a3 - a4 * (double)v9 + v11 * -2.0) / ((double)v9 + 0.5), 70.0);
}

+ (id)stickersAvatarsFetchRequest
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D00690];
  objc_msgSend(a1, "inUseStickerPack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unavailableAnimojiNamesForStickerPack:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D00840], "requestForAllAvatarsExcluding:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)inUseStickerPack
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = AVTUIShowPrereleaseStickerPack_once();
  v3 = (void *)*MEMORY[0x1E0D006D0];
  if (v2
    && (objc_msgSend(MEMORY[0x1E0D00690], "availableStickerNamesForMemojiInStickerPack:", *MEMORY[0x1E0D006D0]),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        !v5))
  {
    AVTUISetShowPrereleaseStickerPack();
    v6 = (void *)*MEMORY[0x1E0D006B0];
  }
  else if (v2)
  {
    v6 = v3;
  }
  else
  {
    v6 = (void *)*MEMORY[0x1E0D006B0];
  }
  return v6;
}

- (AVTStickerViewController)initWithStore:(id)a3 fetchRequest:(id)a4 stickerPacks:(id)a5 stickerConfigurationNames:(id)a6 selectedRecordIdentifier:(id)a7 allowEditing:(BOOL)a8 allowPeel:(BOOL)a9 environment:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  AVTStickerViewController *v20;
  AVTStickerViewController *v21;
  AVTAvatarRecordDataSource *v22;
  AVTAvatarRecordDataSource *recordDataSource;
  uint64_t v24;
  AVTUILogger *logger;
  id v28;
  id v29;
  objc_super v30;

  v16 = a3;
  v17 = a4;
  v29 = a5;
  v28 = a6;
  v18 = a7;
  v19 = a10;
  v30.receiver = self;
  v30.super_class = (Class)AVTStickerViewController;
  v20 = -[AVTStickerViewController initWithNibName:bundle:](&v30, sel_initWithNibName_bundle_, 0, 0);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_store, a3);
    v22 = -[AVTAvatarRecordDataSource initWithRecordStore:fetchRequest:environment:]([AVTAvatarRecordDataSource alloc], "initWithRecordStore:fetchRequest:environment:", v16, v17, v19);
    recordDataSource = v21->_recordDataSource;
    v21->_recordDataSource = v22;

    objc_storeStrong((id *)&v21->_stickerPacks, a5);
    objc_storeStrong((id *)&v21->_stickerConfigurationNames, a6);
    objc_msgSend(v19, "logger");
    v24 = objc_claimAutoreleasedReturnValue();
    logger = v21->_logger;
    v21->_logger = (AVTUILogger *)v24;

    objc_storeStrong((id *)&v21->_environment, a10);
    v21->_allowEditing = a8;
    v21->_allowPeel = a9;
    objc_storeStrong((id *)&v21->_selectedRecordIdentifier, a7);
  }

  return v21;
}

- (void)viewDidLoad
{
  void *v3;
  AVTAvatarPickerDataSource *v4;
  void *v5;
  void *v6;
  AVTAvatarPickerDataSource *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _AVTAvatarRecordImageProvider *v12;
  void *v13;
  _AVTAvatarRecordImageProvider *v14;
  AVTStickerConfigurationProvider *v15;
  void *v16;
  AVTStickerPack *stickerPacks;
  void *v18;
  AVTStickerConfigurationProvider *v19;
  AVTStickerPagingController *v20;
  void *v21;
  void *v22;
  void *v23;
  AVTStickerPagingController *v24;
  void *v25;
  void *v26;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  AVTViewSessionProvider *v43;
  AVTViewSessionProvider *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  AVTSimpleAvatarPicker *v54;
  void *v55;
  void *v56;
  AVTSimpleAvatarPicker *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  objc_super v71;

  v71.receiver = self;
  v71.super_class = (Class)AVTStickerViewController;
  -[AVTStickerViewController viewDidLoad](&v71, sel_viewDidLoad);
  -[AVTStickerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipsToBounds:", 1);

  v4 = [AVTAvatarPickerDataSource alloc];
  -[AVTStickerViewController recordDataSource](self, "recordDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerViewController environment](self, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AVTAvatarPickerDataSource initWithRecordDataSource:environment:allowAddItem:](v4, "initWithRecordDataSource:environment:allowAddItem:", v5, v6, 0);
  -[AVTStickerViewController setAvatarPickerDataSource:](self, "setAvatarPickerDataSource:", v7);

  -[AVTStickerViewController avatarPickerDataSource](self, "avatarPickerDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadModel");

  -[AVTStickerViewController recordDataSource](self, "recordDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:", self);

  -[AVTStickerViewController recordDataSource](self, "recordDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTStickerTaskScheduler schedulerWithRecordDataSource:](AVTStickerTaskScheduler, "schedulerWithRecordDataSource:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerViewController setTaskScheduler:](self, "setTaskScheduler:", v11);

  v12 = [_AVTAvatarRecordImageProvider alloc];
  -[AVTStickerViewController environment](self, "environment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[_AVTAvatarRecordImageProvider initWithEnvironment:taskScheduler:](v12, "initWithEnvironment:taskScheduler:", v13, 0);

  v15 = [AVTStickerConfigurationProvider alloc];
  -[AVTStickerViewController environment](self, "environment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  stickerPacks = self->_stickerPacks;
  -[AVTStickerViewController stickerConfigurationNames](self, "stickerConfigurationNames");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[AVTStickerConfigurationProvider initWithEnvironment:forStickerPacks:stickerConfigurationNames:](v15, "initWithEnvironment:forStickerPacks:stickerConfigurationNames:", v16, stickerPacks, v18);

  v20 = [AVTStickerPagingController alloc];
  -[AVTStickerViewController recordDataSource](self, "recordDataSource");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerViewController taskScheduler](self, "taskScheduler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerViewController environment](self, "environment");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[AVTStickerPagingController initWithRecordDataSource:recordImageProvider:stickerConfigurationProvider:taskScheduler:environment:allowsPeel:](v20, "initWithRecordDataSource:recordImageProvider:stickerConfigurationProvider:taskScheduler:environment:allowsPeel:", v21, v14, v19, v22, v23, -[AVTStickerViewController allowPeel](self, "allowPeel"));

  -[AVTStickerPagingController setAvatarPickerDelegate:](v24, "setAvatarPickerDelegate:", self);
  -[AVTStickerPagingController setPresenterDelegate:](v24, "setPresenterDelegate:", self);
  -[AVTStickerPagingController setDelegate:](v24, "setDelegate:", self);
  -[AVTStickerViewController disclosureValidationDelegate](self, "disclosureValidationDelegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerPagingController setDisclosureValidationDelegate:](v24, "setDisclosureValidationDelegate:", v25);

  -[AVTStickerViewController stickerSelectionDelegate](self, "stickerSelectionDelegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerPagingController setStickerSelectionDelegate:](v24, "setStickerSelectionDelegate:", v26);

  -[AVTStickerViewController stickerSheetControllerProvider](self, "stickerSheetControllerProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerPagingController setStickerSheetControllerProvider:](v24, "setStickerSheetControllerProvider:", v27);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerPagingController view](v24, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setBackgroundColor:", v28);

  -[AVTStickerViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  -[AVTStickerPagingController view](v24, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFrame:", v32, v34, v36, v38);

  -[AVTStickerPagingController view](v24, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setAutoresizingMask:", 18);

  -[AVTStickerViewController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerPagingController view](v24, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addSubview:", v42);

  -[AVTStickerViewController setPagingController:](self, "setPagingController:", v24);
  -[AVTStickerViewController viewSessionProvider](self, "viewSessionProvider");
  v43 = (AVTViewSessionProvider *)objc_claimAutoreleasedReturnValue();
  if (!v43)
  {
    v44 = [AVTViewSessionProvider alloc];
    -[AVTStickerViewController avatarPickerDataSource](self, "avatarPickerDataSource");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "environment");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTViewSessionProvider backingSizeForEnvironment:](AVTViewSessionProvider, "backingSizeForEnvironment:", v46);
    v48 = v47;
    v50 = v49;
    +[AVTViewSessionProvider creatorForAVTView](AVTViewSessionProvider, "creatorForAVTView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerViewController avatarPickerDataSource](self, "avatarPickerDataSource");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "environment");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[AVTViewSessionProvider initWithAVTViewBackingSize:viewCreator:environment:](v44, "initWithAVTViewBackingSize:viewCreator:environment:", v51, v53, v48, v50);

  }
  v54 = [AVTSimpleAvatarPicker alloc];
  -[AVTStickerViewController avatarPickerDataSource](self, "avatarPickerDataSource");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerViewController taskScheduler](self, "taskScheduler");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = -[AVTSimpleAvatarPicker initWithDataSource:recordImageProvider:avtViewSessionProvider:taskScheduler:allowEditing:](v54, "initWithDataSource:recordImageProvider:avtViewSessionProvider:taskScheduler:allowEditing:", v55, v14, v43, v56, -[AVTStickerViewController allowEditing](self, "allowEditing"));

  -[AVTSimpleAvatarPicker setAvatarPickerDelegate:](v57, "setAvatarPickerDelegate:", self);
  -[AVTSimpleAvatarPicker setPresenterDelegate:](v57, "setPresenterDelegate:", self);
  -[AVTStickerViewController imageDelegate](self, "imageDelegate");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSimpleAvatarPicker setImageDelegate:](v57, "setImageDelegate:", v58);

  -[AVTSimpleAvatarPicker setShouldHideUserInfoView:](v57, "setShouldHideUserInfoView:", -[AVTStickerViewController shouldHideUserInfoView](self, "shouldHideUserInfoView"));
  v59 = (void *)objc_opt_class();
  -[AVTStickerViewController environment](self, "environment");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "headerEdgeMarginForEnvironment:", v60);
  v62 = v61;

  -[AVTStickerViewController environment](self, "environment");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v63, "deviceIsMac"))
    v64 = 10.0;
  else
    v64 = 0.0;

  -[AVTSimpleAvatarPicker setContentInset:](v57, "setContentInset:", 0.0, v62, v64, v62);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSimpleAvatarPicker view](v57, "view");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setBackgroundColor:", v65);

  -[AVTSimpleAvatarPicker view](v57, "view");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setAutoresizingMask:", 34);

  -[AVTStickerViewController view](self, "view");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSimpleAvatarPicker view](v57, "view");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "addSubview:", v69);

  -[AVTStickerViewController setAvatarPicker:](self, "setAvatarPicker:", v57);
  -[AVTStickerViewController updateHeaderSize](self, "updateHeaderSize");
  -[AVTStickerViewController updatePagingControllerInsets](self, "updatePagingControllerInsets");
  -[AVTStickerViewController paddleView](self, "paddleView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70)
  {

  }
  else if (!-[AVTStickerViewController shouldPresentPaddleView](self, "shouldPresentPaddleView"))
  {
    -[AVTStickerViewController selectDefaultAvatarIfNeeded](self, "selectDefaultAvatarIfNeeded");
    goto LABEL_11;
  }
  -[AVTStickerViewController selectAvatarRecordAtIndex:hideHeader:](self, "selectAvatarRecordAtIndex:hideHeader:", 0, 0);
LABEL_11:

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVTStickerViewController;
  -[AVTStickerViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[AVTStickerViewController presentPaddleViewIfNeeded](self, "presentPaddleViewIfNeeded");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVTStickerViewController;
  -[AVTStickerViewController viewWillLayoutSubviews](&v10, sel_viewWillLayoutSubviews);
  -[AVTStickerViewController environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceIsVision");

  if (v4)
  {
    -[AVTStickerViewController avatarPicker](self, "avatarPicker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMinimumInteritemSpacing:", 12.0);
  }
  else
  {
    -[AVTStickerViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    if (v6 <= 490.0)
      v7 = 8.0;
    else
      v7 = 16.0;
    -[AVTStickerViewController avatarPicker](self, "avatarPicker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMinimumInteritemSpacing:", v7);

  }
  -[AVTStickerViewController updateHeaderSize](self, "updateHeaderSize");
  -[AVTStickerViewController updatePagingControllerInsets](self, "updatePagingControllerInsets");
  -[AVTStickerViewController pagingController](self, "pagingController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pageContentOffset");
  -[AVTStickerViewController updateHeaderPositionWithContentOffset:](self, "updateHeaderPositionWithContentOffset:");

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTStickerViewController;
  -[AVTStickerViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[AVTStickerViewController updatePaddleViewLayoutIfNecessary](self, "updatePaddleViewLayoutIfNecessary");
}

- (void)setAllowEditing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_allowEditing != a3)
  {
    v3 = a3;
    self->_allowEditing = a3;
    -[AVTStickerViewController avatarPicker](self, "avatarPicker");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAllowEditing:", v3);

  }
}

- (void)reloadPickerView
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[AVTStickerViewController avatarPickerDataSource](self, "avatarPickerDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadModel");

  -[AVTStickerViewController taskScheduler](self, "taskScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  -[AVTStickerViewController avatarPicker](self, "avatarPicker");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[AVTStickerViewController pagingController](self, "pagingController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[AVTStickerViewController avatarPicker](self, "avatarPicker");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reloadData");

    }
  }
}

- (void)reloadData
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[AVTStickerViewController avatarPickerDataSource](self, "avatarPickerDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadModel");

  -[AVTStickerViewController taskScheduler](self, "taskScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  -[AVTStickerViewController avatarPicker](self, "avatarPicker");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[AVTStickerViewController pagingController](self, "pagingController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[AVTStickerViewController avatarPicker](self, "avatarPicker");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reloadData");

      -[AVTStickerViewController pagingController](self, "pagingController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reloadData");

      -[AVTStickerViewController selectDefaultAvatarIfNeeded](self, "selectDefaultAvatarIfNeeded");
    }
  }
}

- (void)selectDefaultAvatarIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, void *);
  void *v13;
  id v14;

  -[AVTStickerViewController avatarPicker](self, "avatarPicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "indexForSelectedAvatar") == 0x7FFFFFFFFFFFFFFFLL)
  {

  }
  else
  {
    -[AVTStickerViewController recordDataSource](self, "recordDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "numberOfRecords");

    if (!v5)
      return;
  }
  -[AVTStickerViewController selectedRecordIdentifier](self, "selectedRecordIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_6;
  -[AVTStickerViewController recordDataSource](self, "recordDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __55__AVTStickerViewController_selectDefaultAvatarIfNeeded__block_invoke;
  v13 = &unk_1EA51DCC8;
  v14 = v8;
  v7 = objc_msgSend(v6, "indexOfRecordPassingTest:", &v10);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
LABEL_6:
    v7 = 0;
  -[AVTStickerViewController selectAvatarRecordAtIndex:hideHeader:](self, "selectAvatarRecordAtIndex:hideHeader:", v7, 0, v8, v10, v11, v12, v13);

}

uint64_t __55__AVTStickerViewController_selectDefaultAvatarIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)selectAvatarRecordAtIndex:(int64_t)a3 hideHeader:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  -[AVTStickerViewController recordDataSource](self, "recordDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordAtIndex:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[AVTStickerViewController selectRecordForIdentifier:](self, "selectRecordForIdentifier:", v8);
    if (v4)
      -[AVTStickerViewController updateScrollToShowAvatarPicker:](self, "updateScrollToShowAvatarPicker:", 0);
  }

}

- (void)selectRecordForIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AVTStickerViewController pagingController](self, "pagingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectAvatarRecordWithIdentifier:animated:", v7, 0);

  -[AVTStickerViewController avatarPicker](self, "avatarPicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectAvatarRecordWithIdentifier:animated:", v7, 0);

  -[AVTStickerViewController taskScheduler](self, "taskScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectedAvatarRecordIdentifier:", v7);

  -[AVTStickerViewController setSelectedRecordIdentifier:](self, "setSelectedRecordIdentifier:", v7);
}

- (void)updateHeaderSize
{
  void *v3;
  char v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  id v27;

  -[AVTStickerViewController environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceIsVision");

  if ((v4 & 1) != 0)
  {
    v5 = 64.0;
  }
  else
  {
    -[AVTStickerViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;

    v9 = (void *)objc_opt_class();
    -[AVTStickerViewController avatarPicker](self, "avatarPicker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "minimumInteritemSpacing");
    v12 = v11;
    -[AVTStickerViewController environment](self, "environment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "headerHeightForWidth:interitemSpacing:environment:", v13, v8, v12);
    v5 = v14;

  }
  -[AVTStickerViewController environment](self, "environment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "deviceIsVision"))
    v16 = 0.0;
  else
    v16 = 10.0;

  -[AVTStickerViewController avatarPicker](self, "avatarPicker");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentInset");
  v19 = v18;
  -[AVTStickerViewController avatarPicker](self, "avatarPicker");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "contentInset");
  v22 = v5 + v19 + v21;

  -[AVTStickerViewController view](self, "view");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bounds");
  v24 = v23;
  -[AVTStickerViewController avatarPicker](self, "avatarPicker");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", 0.0, v16, v24, v22);

}

- (void)updateHeaderPositionWithContentOffset:(CGPoint)a3
{
  double y;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  CGRect v23;

  y = a3.y;
  -[AVTStickerViewController environment](self, "environment", a3.x);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "deviceIsVision"))
    v6 = 0.0;
  else
    v6 = 10.0;

  -[AVTStickerViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaInsets");
  v9 = v6 + v8 - y;

  -[AVTStickerViewController avatarPicker](self, "avatarPicker");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v12 = -CGRectGetHeight(v23);

  if (v9 < v12)
    v9 = v12;
  -[AVTStickerViewController avatarPicker](self, "avatarPicker");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[AVTStickerViewController avatarPicker](self, "avatarPicker");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v16, v9, v18, v20);

}

- (double)headerMaxY
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;

  -[AVTStickerViewController environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "deviceIsVision"))
    v4 = 0.0;
  else
    v4 = 10.0;

  -[AVTStickerViewController avatarPicker](self, "avatarPicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v4 + v7;
  -[AVTStickerViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeAreaInsets");
  v11 = v8 + v10;
  -[AVTStickerViewController avatarPicker](self, "avatarPicker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentInset");
  v14 = v11 - v13;

  return v14;
}

- (void)updatePagingControllerInsets
{
  double v3;
  double v4;
  id v5;

  -[AVTStickerViewController headerMaxY](self, "headerMaxY");
  v4 = v3;
  -[AVTStickerViewController pagingController](self, "pagingController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPageContentInsets:", v4, 0.0, 0.0, 0.0);

}

- (void)updateScrollToShowAvatarPicker:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  if (a3)
  {
    -[AVTStickerViewController pagingController](self, "pagingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0C9D538];
    v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v9 = v4;
  }
  else
  {
    -[AVTStickerViewController headerMaxY](self, "headerMaxY");
    v8 = v7;
    -[AVTStickerViewController pagingController](self, "pagingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0.0;
    v9 = v4;
    v6 = v8;
  }
  objc_msgSend(v4, "setPageContentOffset:", v5, v6);

}

- (void)presentMemojiEditorForCreation
{
  id v2;

  -[AVTStickerViewController avatarPicker](self, "avatarPicker");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentMemojiEditorForCreation");

}

- (void)stickerControllerDidEnterBackground
{
  void *v3;
  id v4;

  -[AVTStickerViewController paddleView](self, "paddleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTStickerViewController paddleView](self, "paddleView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pauseVideo");

  }
}

- (void)stickerControllerWillEnterForeground
{
  void *v3;
  id v4;

  -[AVTStickerViewController paddleView](self, "paddleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTStickerViewController paddleView](self, "paddleView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playVideo");

  }
}

- (void)snapshotInBlock:(id)a3
{
  void (**v4)(id, void *);
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
  id v15;
  CGRect v16;

  v4 = (void (**)(id, void *))a3;
  -[AVTStickerViewController pagingController](self, "pagingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pageContentOffset");
  v7 = v6;
  v9 = v8;

  -[AVTStickerViewController logger](self, "logger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  NSStringFromCGRect(v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logStickerViewSnapshotForBounds:offset:", v12, v7, v9);

  if (v9 > 0.0)
  {
    -[AVTStickerViewController pagingController](self, "pagingController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPageContentOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  }
  -[AVTStickerViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v14);

  -[AVTStickerViewController pagingController](self, "pagingController");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPageContentOffset:", v7, v9);

}

- (void)clearStickerSelection
{
  id v2;

  -[AVTStickerViewController pagingController](self, "pagingController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearStickerSelection");

}

- (void)presentAvatarUIController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  dispatch_time_t v9;
  _QWORD block[5];

  v4 = a4;
  v6 = a3;
  -[AVTStickerViewController pagingController](self, "pagingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "willEndDisplaying");

  -[AVTStickerViewController presenterDelegate](self, "presenterDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentAvatarUIController:animated:", v6, v4);

  v9 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AVTStickerViewController_presentAvatarUIController_animated___block_invoke;
  block[3] = &unk_1EA51D188;
  block[4] = self;
  dispatch_after(v9, MEMORY[0x1E0C80D38], block);
}

void __63__AVTStickerViewController_presentAvatarUIController_animated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "pagingController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didEndDisplaying");

}

- (void)dismissAvatarUIControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[AVTStickerViewController pagingController](self, "pagingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willStartDisplaying");

  -[AVTStickerViewController presenterDelegate](self, "presenterDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissAvatarUIControllerAnimated:", v3);

}

- (void)avatarPicker:(id)a3 didSelectAvatarRecord:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  id v17;

  v17 = a4;
  v6 = a3;
  objc_msgSend(v17, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerViewController setSelectedRecordIdentifier:](self, "setSelectedRecordIdentifier:", v7);

  -[AVTStickerViewController taskScheduler](self, "taskScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerViewController selectedRecordIdentifier](self, "selectedRecordIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelectedAvatarRecordIdentifier:", v9);

  -[AVTStickerViewController selectedRecordIdentifier](self, "selectedRecordIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  AVTUISetStickersLastSelected();

  -[AVTStickerViewController environment](self, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "usageTrackingSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "didChangeCurrentAvatarInStickers:", v17);

  -[AVTStickerViewController avatarPicker](self, "avatarPicker");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v6)
    -[AVTStickerViewController pagingController](self, "pagingController");
  else
    -[AVTStickerViewController avatarPicker](self, "avatarPicker");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 != v6;
  objc_msgSend(v17, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "selectAvatarRecordWithIdentifier:animated:", v16, v15);

}

- (BOOL)avatarPicker:(id)a3 shouldPresentMemojiEditorForAvatarRecord:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  v5 = a4;
  -[AVTStickerViewController stickerSelectionDelegate](self, "stickerSelectionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[AVTStickerViewController stickerSelectionDelegate](self, "stickerSelectionDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "stickerViewController:shouldPresentMemojiEditorForSelectedAvatar:", self, v5);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)dataSource:(id)a3 didAddRecord:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v7 = a4;
  -[AVTStickerViewController pagingController](self, "pagingController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertPageForRecord:atIndex:", v7, a5);

  -[AVTStickerViewController reloadPickerView](self, "reloadPickerView");
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTStickerViewController selectRecordForIdentifier:](self, "selectRecordForIdentifier:", v9);
  -[AVTStickerViewController updateScrollToShowAvatarPicker:](self, "updateScrollToShowAvatarPicker:", 0);
  -[AVTStickerViewController selectedRecordIdentifier](self, "selectedRecordIdentifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  AVTUISetStickersLastSelected();

}

- (void)dataSource:(id)a3 didEditRecord:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  void *v8;

  v7 = a4;
  -[AVTStickerViewController pagingController](self, "pagingController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadPageForRecord:atIndex:", v7, a5);

  -[AVTStickerViewController updateScrollToShowAvatarPicker:](self, "updateScrollToShowAvatarPicker:", 0);
  -[AVTStickerViewController reloadPickerView](self, "reloadPickerView");
}

- (void)dataSource:(id)a3 didRemoveRecord:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  -[AVTStickerViewController pagingController](self, "pagingController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deletePageForRecord:atIndex:", v8, a5);

  -[AVTStickerViewController reloadPickerView](self, "reloadPickerView");
  objc_msgSend(v14, "indexSetForEditableRecords");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  objc_msgSend(v14, "recordAtIndex:", objc_msgSend(v10, "closestIndexToIndex:greaterIndexesFirst:", a5, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerViewController selectRecordForIdentifier:](self, "selectRecordForIdentifier:", v13);

  -[AVTStickerViewController updateScrollToShowAvatarPicker:](self, "updateScrollToShowAvatarPicker:", 0);
}

- (BOOL)shouldPresentPaddleView
{
  void *v3;
  BOOL v4;

  if ((AVTUIAlwaysShowPaddleView() & 1) == 0 && (AVTUIHasDisplayedPaddleView() & 1) != 0
    || !-[AVTStickerViewController allowAvatarCreation](self, "allowAvatarCreation"))
  {
    return 0;
  }
  -[AVTStickerViewController paddleView](self, "paddleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (void)presentPaddleViewIfNeeded
{
  AVTPaddleView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[AVTStickerViewController shouldPresentPaddleView](self, "shouldPresentPaddleView"))
  {
    v3 = -[AVTPaddleView initWithLayoutDirection:]([AVTPaddleView alloc], "initWithLayoutDirection:", 1);
    -[AVTStickerViewController setPaddleView:](self, "setPaddleView:", v3);

    -[AVTStickerViewController paddleView](self, "paddleView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", self);

    -[AVTStickerViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerViewController paddleView](self, "paddleView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

    -[AVTStickerViewController updatePaddleViewLayoutIfNecessary](self, "updatePaddleViewLayoutIfNecessary");
    -[AVTStickerViewController paddleView](self, "paddleView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 0.0);

    -[AVTStickerViewController paddleView](self, "paddleView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "showAnimated:", 1);

    AVTUISetHasDisplayedPaddleView();
  }
}

- (void)updatePaddleViewLayoutIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double Width;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  CGRect v18;
  CGRect v19;

  -[AVTStickerViewController paddleView](self, "paddleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTStickerViewController pagingController](self, "pagingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");

    -[AVTStickerViewController avatarPicker](self, "avatarPicker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutIfNeeded");

    -[AVTStickerViewController avatarPicker](self, "avatarPicker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewForAddItem");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v17, "bounds");
      Width = CGRectGetWidth(v18);
      objc_msgSend(v17, "button");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      v11 = (Width - CGRectGetWidth(v19)) * 0.5;
      -[AVTStickerViewController paddleView](self, "paddleView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPadding:", v11);

      -[AVTStickerViewController pagingController](self, "pagingController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstPageItemView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[AVTStickerViewController paddleView](self, "paddleView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "button");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "updateLayoutFromPlusButtonView:videoView:", v16, v14);

    }
  }
}

- (void)dismissPaddleViewIfNecessary
{
  void *v3;
  void *v4;

  -[AVTStickerViewController paddleView](self, "paddleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTStickerViewController paddleView](self, "paddleView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissAnimated:", 1);

    -[AVTStickerViewController setPaddleView:](self, "setPaddleView:", 0);
  }
}

- (void)paddleViewTapped:(id)a3
{
  -[AVTStickerViewController dismissPaddleViewIfNecessary](self, "dismissPaddleViewIfNecessary", a3);
  -[AVTStickerViewController presentMemojiEditorForCreation](self, "presentMemojiEditorForCreation");
}

- (AVTPresenterDelegate)presenterDelegate
{
  return (AVTPresenterDelegate *)objc_loadWeakRetained((id *)&self->presenterDelegate);
}

- (void)setPresenterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->presenterDelegate, a3);
}

- (AVTStickerDisclosureValidationDelegate)disclosureValidationDelegate
{
  return (AVTStickerDisclosureValidationDelegate *)objc_loadWeakRetained((id *)&self->_disclosureValidationDelegate);
}

- (void)setDisclosureValidationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_disclosureValidationDelegate, a3);
}

- (AVTStickerViewControllerImageDelegate)imageDelegate
{
  return (AVTStickerViewControllerImageDelegate *)objc_loadWeakRetained((id *)&self->_imageDelegate);
}

- (void)setImageDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_imageDelegate, a3);
}

- (AVTStickerSelectionDelegate)stickerSelectionDelegate
{
  return (AVTStickerSelectionDelegate *)objc_loadWeakRetained((id *)&self->_stickerSelectionDelegate);
}

- (void)setStickerSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_stickerSelectionDelegate, a3);
}

- (AVTStickerSheetControllerProvider)stickerSheetControllerProvider
{
  return (AVTStickerSheetControllerProvider *)objc_loadWeakRetained((id *)&self->_stickerSheetControllerProvider);
}

- (void)setStickerSheetControllerProvider:(id)a3
{
  objc_storeWeak((id *)&self->_stickerSheetControllerProvider, a3);
}

- (BOOL)allowEditing
{
  return self->_allowEditing;
}

- (BOOL)shouldHideUserInfoView
{
  return self->_shouldHideUserInfoView;
}

- (void)setShouldHideUserInfoView:(BOOL)a3
{
  self->_shouldHideUserInfoView = a3;
}

- (AVTAvatarStore)store
{
  return self->_store;
}

- (AVTAvatarRecordDataSource)recordDataSource
{
  return self->_recordDataSource;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (BOOL)allowPeel
{
  return self->_allowPeel;
}

- (AVTAvatarPickerDataSource)avatarPickerDataSource
{
  return self->_avatarPickerDataSource;
}

- (void)setAvatarPickerDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_avatarPickerDataSource, a3);
}

- (AVTSimpleAvatarPicker)avatarPicker
{
  return self->_avatarPicker;
}

- (void)setAvatarPicker:(id)a3
{
  objc_storeStrong((id *)&self->_avatarPicker, a3);
}

- (AVTStickerPagingController)pagingController
{
  return self->_pagingController;
}

- (void)setPagingController:(id)a3
{
  objc_storeStrong((id *)&self->_pagingController, a3);
}

- (NSString)selectedRecordIdentifier
{
  return self->_selectedRecordIdentifier;
}

- (void)setSelectedRecordIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRecordIdentifier, a3);
}

- (AVTPaddleView)paddleView
{
  return self->_paddleView;
}

- (void)setPaddleView:(id)a3
{
  objc_storeStrong((id *)&self->_paddleView, a3);
}

- (AVTStickerTaskScheduler)taskScheduler
{
  return self->_taskScheduler;
}

- (void)setTaskScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_taskScheduler, a3);
}

- (AVTViewSessionProvider)viewSessionProvider
{
  return self->_viewSessionProvider;
}

- (void)setViewSessionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_viewSessionProvider, a3);
}

- (AVTStickerPack)stickerPacks
{
  return self->_stickerPacks;
}

- (void)setStickerPacks:(id)a3
{
  objc_storeStrong((id *)&self->_stickerPacks, a3);
}

- (NSArray)stickerConfigurationNames
{
  return self->_stickerConfigurationNames;
}

- (void)setStickerConfigurationNames:(id)a3
{
  objc_storeStrong((id *)&self->_stickerConfigurationNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerConfigurationNames, 0);
  objc_storeStrong((id *)&self->_stickerPacks, 0);
  objc_storeStrong((id *)&self->_viewSessionProvider, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_paddleView, 0);
  objc_storeStrong((id *)&self->_selectedRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_pagingController, 0);
  objc_storeStrong((id *)&self->_avatarPicker, 0);
  objc_storeStrong((id *)&self->_avatarPickerDataSource, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_recordDataSource, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_destroyWeak((id *)&self->_stickerSheetControllerProvider);
  objc_destroyWeak((id *)&self->_stickerSelectionDelegate);
  objc_destroyWeak((id *)&self->_imageDelegate);
  objc_destroyWeak((id *)&self->_disclosureValidationDelegate);
  objc_destroyWeak((id *)&self->presenterDelegate);
}

- (void)editCurrentMemoji
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[AVTStickerViewController pagingController](self, "pagingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerViewController selectedRecordIdentifier](self, "selectedRecordIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "pageIndexForAvatarRecordIdentifierForPPT:", v4);

  -[AVTStickerViewController avatarPicker](self, "avatarPicker");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTStickerViewController recordDataSource](self, "recordDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordAtIndex:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentActionsForAvatarForPPT:", v7);

}

- (void)swipeRightWithDelay:(int64_t)a3 forCompletionHandler:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  dispatch_time_t v16;
  _QWORD block[4];
  void (**v18)(_QWORD);

  v6 = (void (**)(_QWORD))a4;
  -[AVTStickerViewController pagingController](self, "pagingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerViewController selectedRecordIdentifier](self, "selectedRecordIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "pageIndexForAvatarRecordIdentifierForPPT:", v8);

  v10 = v9 + 1;
  -[AVTStickerViewController recordDataSource](self, "recordDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "numberOfRecords");

  if (v10 < v12)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v10, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerViewController pagingController](self, "pagingController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "collectionViewForPPT");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scrollToItemAtIndexPath:atScrollPosition:animated:", v13, 8, 1);

  }
  if (v6)
  {
    if (a3 < 1)
    {
      v6[2](v6);
    }
    else
    {
      v16 = dispatch_time(0, 1000000000 * a3);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__AVTStickerViewController_PPT__swipeRightWithDelay_forCompletionHandler___block_invoke;
      block[3] = &unk_1EA51D810;
      v18 = v6;
      dispatch_after(v16, MEMORY[0x1E0C80D38], block);

    }
  }

}

uint64_t __74__AVTStickerViewController_PPT__swipeRightWithDelay_forCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)swipeLeftWithDelay:(int64_t)a3 forCompletionHandler:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  _QWORD block[4];
  void (**v15)(_QWORD);

  v6 = (void (**)(_QWORD))a4;
  -[AVTStickerViewController pagingController](self, "pagingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerViewController selectedRecordIdentifier](self, "selectedRecordIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "pageIndexForAvatarRecordIdentifierForPPT:", v8);

  if (v9 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9 - 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerViewController pagingController](self, "pagingController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collectionViewForPPT");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scrollToItemAtIndexPath:atScrollPosition:animated:", v10, 8, 1);

  }
  if (v6)
  {
    if (a3 < 1)
    {
      v6[2](v6);
    }
    else
    {
      v13 = dispatch_time(0, 1000000000 * a3);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__AVTStickerViewController_PPT__swipeLeftWithDelay_forCompletionHandler___block_invoke;
      block[3] = &unk_1EA51D810;
      v15 = v6;
      dispatch_after(v13, MEMORY[0x1E0C80D38], block);

    }
  }

}

uint64_t __73__AVTStickerViewController_PPT__swipeLeftWithDelay_forCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
