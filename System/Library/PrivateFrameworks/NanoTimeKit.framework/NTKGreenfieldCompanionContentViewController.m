@implementation NTKGreenfieldCompanionContentViewController

- (id)initStartStateWithDecodedRecipe:(id)a3 canAddFaceDirectly:(BOOL)a4 addFaceDescription:(id)a5
{
  id v9;
  id v10;
  NTKGreenfieldCompanionContentViewController *v11;
  NTKGreenfieldCompanionContentViewController *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NTKGreenfieldCompanionContentViewController;
  v11 = -[BPSWelcomeOptinViewController init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[BPSWelcomeOptinViewController setStyle:](v11, "setStyle:", 2);
    v12->_state = 0;
    objc_storeStrong((id *)&v12->_decodedRecipe, a3);
    v12->_canAddFaceDirectly = a4;
    objc_storeStrong((id *)&v12->_addFaceDescription, a5);
  }

  return v12;
}

- (id)initAddComplicationStateWithDecodedRecipe:(id)a3 complicationItemId:(id)a4 installMode:(int64_t)a5 skippedComplicationSlots:(id)a6
{
  id v11;
  id v12;
  id v13;
  NTKGreenfieldCompanionContentViewController *v14;
  NTKGreenfieldCompanionContentViewController *v15;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = -[BPSWelcomeOptinViewController init](self, "init");
  v15 = v14;
  if (v14)
  {
    -[BPSWelcomeOptinViewController setStyle:](v14, "setStyle:", 10);
    v15->_state = 2;
    objc_storeStrong((id *)&v15->_decodedRecipe, a3);
    objc_storeStrong((id *)&v15->_complicationItemId, a4);
    objc_storeStrong((id *)&v15->_skippedComplicationSlots, a6);
    v15->_installMode = a5;
  }

  return v15;
}

- (id)initComplicationNotAvailableStateWithDecodedRecipe:(id)a3 unavailableSlots:(id)a4 unavailableTitle:(id)a5 unavailableDescription:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NTKGreenfieldCompanionContentViewController *v15;
  NTKGreenfieldCompanionContentViewController *v16;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = -[BPSWelcomeOptinViewController init](self, "init");
  v16 = v15;
  if (v15)
  {
    -[BPSWelcomeOptinViewController setStyle:](v15, "setStyle:", 2);
    v16->_state = 1;
    objc_storeStrong((id *)&v16->_decodedRecipe, a3);
    objc_storeStrong((id *)&v16->_unavailableSlots, a4);
    objc_storeStrong((id *)&v16->_unavailableTitle, a5);
    objc_storeStrong((id *)&v16->_unavailableDescription, a6);
  }

  return v16;
}

- (id)initCompletedStateWithDecodedRecipe:(id)a3 skippedComplicationSlots:(id)a4 canRevisit:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  NTKGreenfieldCompanionContentViewController *v11;
  NTKGreenfieldCompanionContentViewController *v12;
  uint64_t v13;
  objc_super v15;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NTKGreenfieldCompanionContentViewController;
  v11 = -[BPSWelcomeOptinViewController init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    if (v5)
      v13 = 10;
    else
      v13 = 2;
    -[BPSWelcomeOptinViewController setStyle:](v11, "setStyle:", v13);
    v12->_state = 3;
    objc_storeStrong((id *)&v12->_decodedRecipe, a3);
    objc_storeStrong((id *)&v12->_skippedComplicationSlots, a4);
  }

  return v12;
}

- (NTKGreenfieldCompanionContentViewController)initWithError:(id)a3 decodedRecipe:(id)a4
{
  id v7;
  id v8;
  NTKGreenfieldCompanionContentViewController *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *workQueue;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NTKGreenfieldCompanionContentViewController;
  v9 = -[BPSWelcomeOptinViewController init](&v16, sel_init);
  if (v9)
  {
    objc_msgSend(v8, "noBorderFacePreviewImagePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v9->_state = 4;
      if (NTKInternalBuild(v11, v12))
        -[BPSWelcomeOptinViewController setStyle:](v9, "setStyle:", 2);
      objc_storeStrong((id *)&v9->_decodedRecipe, a4);
      v13 = dispatch_queue_create("com.apple.NanoTimeKit.GreenfieldViewControllerDecodeImage.queue", 0);
      workQueue = v9->_workQueue;
      v9->_workQueue = (OS_dispatch_queue *)v13;

    }
    else
    {
      v9->_state = 5;
    }
    objc_storeStrong((id *)&v9->_error, a3);
  }

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSInteger v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKGreenfieldCompanionContentViewController;
  -[BPSWelcomeOptinViewController viewDidLoad](&v9, sel_viewDidLoad);
  if (self->_state != 5)
  {
    -[BPSWelcomeOptinViewController alternateChoiceButton](self, "alternateChoiceButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    BPSSetupTintColor();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitleColor:forState:", v4, 0);

    -[BPSWelcomeOptinViewController alternateChoiceButton](self, "alternateChoiceButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitleColor:forState:", v6, 2);

    if (self->_state == 4)
    {
      -[NSError domain](self->_error, "domain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.nanotimekit.NTKGreenfieldAddWatchFaceManager")) & 1) != 0)
      {
        if (-[NSError code](self->_error, "code") == 11)
        {

LABEL_8:
          -[NTKGreenfieldCompanionContentViewController _setupContentViewForWatchFaceNotAvailableError](self, "_setupContentViewForWatchFaceNotAvailableError");
          return;
        }
        v8 = -[NSError code](self->_error, "code");

        if (v8 == 13)
          goto LABEL_8;
      }
      else
      {

      }
    }
    -[NTKGreenfieldCompanionContentViewController _setupContentView](self, "_setupContentView");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKGreenfieldCompanionContentViewController;
  -[BPSWelcomeOptinViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (self->_state == 5)
    -[NTKGreenfieldCompanionContentViewController _presentErrorUIAlert](self, "_presentErrorUIAlert");
}

- (void)viewDidLayoutSubviews
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)NTKGreenfieldCompanionContentViewController;
  -[OBBaseWelcomeController viewDidLayoutSubviews](&v24, sel_viewDidLayoutSubviews);
  -[NTKGreenfieldCompanionContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[NTKGreenfieldCompanionContentViewController scrollView](self, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[NTKGreenfieldCompanionContentViewController scrollView](self, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "verticalScrollIndicatorInsets");
  v15 = v14;
  v17 = v16;
  v19 = v18;

  -[NTKGreenfieldCompanionContentViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "safeAreaInsets");
  v22 = v21;

  -[NTKGreenfieldCompanionContentViewController scrollView](self, "scrollView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setVerticalScrollIndicatorInsets:", v22, v15, v17, v19);

}

- (id)titleString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  __CFString *v7;
  __CFString *v8;

  switch(self->_state)
  {
    case 0uLL:
      -[NTKGreenfieldDecodedRecipe watchFace](self->_decodedRecipe, "watchFace");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "faceSharingName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        NTKClockFaceLocalizedString(CFSTR("GREENFIELD_ADD_WATCH_FACE_TITLE_MAIN_SCREEN"), CFSTR("Add %@ Watch Face"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v4, v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        NTKClockFaceLocalizedString(CFSTR("GREENFIELD_ADD_WATCH_FACE_TITLE_MAIN_SCREEN_GENERIC"), CFSTR("Add Watch Face"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }

      return v5;
    case 1uLL:
      v6 = self->_unavailableTitle;
      goto LABEL_10;
    case 2uLL:
      v7 = CFSTR("GREENFIELD_ADD_WATCH_FACE_TITLE_IN_FLOW");
      v8 = CFSTR("Include Complication");
      goto LABEL_8;
    case 3uLL:
      v7 = CFSTR("GREENFIELD_ADD_WATCH_FACE_TITLE_SUCCESS");
      v8 = CFSTR("Watch Face Added");
LABEL_8:
      NTKClockFaceLocalizedString(v7, v8);
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 4uLL:
      -[NTKGreenfieldCompanionContentViewController _errorTitleForError:](self, "_errorTitleForError:", self->_error);
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      v5 = v6;
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)detailString
{
  void *v3;
  uint64_t v4;
  __CFString *v6;
  __CFString *v7;

  v3 = 0;
  switch(self->_state)
  {
    case 0uLL:
      v4 = 1304;
      return *(id *)((char *)&self->super.super.super.super.super.super.isa + v4);
    case 1uLL:
      v4 = 1336;
      return *(id *)((char *)&self->super.super.super.super.super.super.isa + v4);
    case 2uLL:
      if ((self->_installMode & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        v6 = CFSTR("GREENFIELD_ADD_WATCH_FACE_SUBTITLE_UPDATE_COMPLICATION_IN_FLOW");
        v7 = CFSTR("To use this complication, update the app.");
      }
      else
      {
        v6 = CFSTR("GREENFIELD_ADD_WATCH_FACE_SUBTITLE_IN_FLOW");
        v7 = CFSTR("To use this complication, download the app from the App Store.");
      }
      NTKClockFaceLocalizedString(v6, v7);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 4uLL:
      -[NTKGreenfieldCompanionContentViewController _errorSubtitleForError:](self, "_errorSubtitleForError:", self->_error);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    default:
      return v3;
  }
}

- (id)suggestedButtonTitle
{
  __CFString *v2;
  __CFString *v3;
  void *v5;

  switch(self->_state)
  {
    case 0uLL:
      if (!self->_canAddFaceDirectly)
        goto LABEL_4;
      v2 = CFSTR("GREENFIELD_ADD_TO_MY_FACES_BUTTON_TITLE");
      v3 = CFSTR("Add to My Faces");
      goto LABEL_8;
    case 1uLL:
LABEL_4:
      v2 = CFSTR("GREENFIELD_CONTINUE_BUTTON_TITLE");
      v3 = CFSTR("Continue");
      goto LABEL_8;
    case 2uLL:
      return &stru_1E6BDC918;
    case 3uLL:
      v2 = CFSTR("GREENFIELD_DONE_BUTTON_TITLE");
      v3 = CFSTR("Done");
LABEL_8:
      NTKClockFaceLocalizedString(v2, v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    case 4uLL:
      if (NTKInternalBuild(self, a2))
        return CFSTR("[INTERNAL ONLY: SHOW ERROR]");
      v5 = 0;
      return v5;
    default:
      return 0;
  }
}

- (id)alternateButtonTitle
{
  unint64_t state;
  __CFString *v3;
  __CFString *v4;
  void *v5;

  state = self->_state;
  if (state == 3)
  {
    v3 = CFSTR("GREENFIELD_REVISIT_SKIPPED_COMPLICATIONS_BUTTON_TITLE");
    v4 = CFSTR("Add Skipped Apps");
  }
  else
  {
    if (state != 2)
    {
      v5 = 0;
      return v5;
    }
    v3 = CFSTR("GREENFIELD_SKIP_APPS_BUTTON_TITLE");
    v4 = CFSTR("Continue Without This App");
  }
  NTKClockFaceLocalizedString(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (void)suggestedButtonPressed:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 canAddFaceDirectly;
  id WeakRetained;
  void *v8;
  NTKGreenfieldCompanionContentViewController *v9;
  uint64_t v10;
  int v11;
  id v12;

  v4 = a3;
  v5 = v4;
  switch(self->_state)
  {
    case 0uLL:
      v12 = v4;
      canAddFaceDirectly = self->_canAddFaceDirectly;
      WeakRetained = objc_loadWeakRetained((id *)&self->_greenfieldDelegate);
      v8 = WeakRetained;
      if (!canAddFaceDirectly)
        goto LABEL_5;
      v9 = self;
      v10 = 0;
      goto LABEL_7;
    case 1uLL:
      v12 = v4;
      WeakRetained = objc_loadWeakRetained((id *)&self->_greenfieldDelegate);
      v8 = WeakRetained;
LABEL_5:
      v9 = self;
      v10 = 1;
      goto LABEL_7;
    case 3uLL:
      v12 = v4;
      WeakRetained = objc_loadWeakRetained((id *)&self->_greenfieldDelegate);
      v8 = WeakRetained;
      v9 = self;
      v10 = 2;
LABEL_7:
      objc_msgSend(WeakRetained, "companionContentViewController:handleButtonEvent:", v9, v10);

      goto LABEL_8;
    case 4uLL:
      v12 = v4;
      v11 = NTKInternalBuild(v4, v4);
      v5 = v12;
      if (!v11)
        goto LABEL_9;
      -[NTKGreenfieldCompanionContentViewController _didTapShowInternalErrorButton](self, "_didTapShowInternalErrorButton");
LABEL_8:
      v5 = v12;
LABEL_9:

      return;
    default:
      goto LABEL_9;
  }
}

- (void)alternateButtonPressed:(id)a3
{
  id v4;
  unint64_t state;
  id WeakRetained;
  void *v7;
  NTKGreenfieldCompanionContentViewController *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a3;
  state = self->_state;
  if (state == 3)
  {
    v11 = v4;
    -[BPSWelcomeOptinViewController alternateChoiceButton](self, "alternateChoiceButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", 0);

    WeakRetained = objc_loadWeakRetained((id *)&self->_greenfieldDelegate);
    v7 = WeakRetained;
    v8 = self;
    v9 = 3;
    goto LABEL_5;
  }
  if (state == 2)
  {
    v11 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_greenfieldDelegate);
    v7 = WeakRetained;
    v8 = self;
    v9 = 4;
LABEL_5:
    objc_msgSend(WeakRetained, "companionContentViewController:handleButtonEvent:", v8, v9);

    v4 = v11;
  }

}

- (void)refreshViews
{
  ASCLockupView *v3;
  ASCLockupView *appStoreView;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NTKGreenfieldCompanionContentViewController;
  -[BPSWelcomeOptinViewController refreshViews](&v16, sel_refreshViews);
  if (self->_state == 2)
  {
    if (!self->_appStoreView)
    {
      v3 = (ASCLockupView *)objc_alloc_init(MEMORY[0x1E0CF9BC8]);
      appStoreView = self->_appStoreView;
      self->_appStoreView = v3;

      -[ASCLockupView setDelegate:](self->_appStoreView, "setDelegate:", self);
      BPSForegroundColor();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCLockupView setBackgroundColor:](self->_appStoreView, "setBackgroundColor:", v5);

      -[ASCLockupView layer](self->_appStoreView, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCornerRadius:", 15.0);

      -[ASCLockupView setLayoutMargins:](self->_appStoreView, "setLayoutMargins:", 10.0, 16.0, 10.0, 16.0);
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9B88]), "initWithNumberValue:", self->_complicationItemId);
      v8 = objc_alloc(MEMORY[0x1E0CF9BC0]);
      v9 = (void *)objc_msgSend(v8, "initWithID:kind:context:", v7, *MEMORY[0x1E0CF9B38], *MEMORY[0x1E0CF9B30]);
      -[ASCLockupView setRequest:](self->_appStoreView, "setRequest:", v9);

      self->_lockupViewStateDidChange = 0;
    }
    -[BPSWelcomeOptinViewController suggestedChoiceButton](self, "suggestedChoiceButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[BPSWelcomeOptinViewController suggestedChoiceButton](self, "suggestedChoiceButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "superview");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[BPSWelcomeOptinViewController suggestedChoiceButton](self, "suggestedChoiceButton");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeFromSuperview");

      objc_msgSend(v14, "insertArrangedSubview:atIndex:", self->_appStoreView, 0);
    }
  }
}

- (void)_setupContentView
{
  void *v3;
  NTKGreenfieldHighlightableFaceContainerView *v4;
  NTKGreenfieldHighlightableFaceContainerView *faceView;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NTKRoundedCornerMaskView *v18;
  void *v19;
  NTKRoundedCornerMaskView *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[NTKGreenfieldDecodedRecipe watchFace](self->_decodedRecipe, "watchFace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[NTKGreenfieldHighlightableFaceContainerView initWithFace:]([NTKGreenfieldHighlightableFaceContainerView alloc], "initWithFace:", v3);
    faceView = self->_faceView;
    self->_faceView = v4;

    -[NTKGreenfieldDecodedRecipe complicationSlotToTemplateMapping](self->_decodedRecipe, "complicationSlotToTemplateMapping");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v6, "allKeys", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKGreenfieldHighlightableFaceContainerView setTemplate:forSlot:](self->_faceView, "setTemplate:forSlot:", v13, v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "nrDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(MEMORY[0x1E0D65218], "sizeFromDevice:", v15);
    v17 = objc_msgSend(MEMORY[0x1E0D65218], "materialFromDevice:", v15);
    v18 = [NTKRoundedCornerMaskView alloc];
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[NTKRoundedCornerMaskView initWithDevice:](v18, "initWithDevice:", v19);

    -[NTKRoundedCornerMaskView addSubview:](v20, "addSubview:", self->_faceView);
    -[NTKGreenfieldCompanionContentViewController _setupWatchFaceViewContainerWithView:deviceSize:deviceMaterial:](self, "_setupWatchFaceViewContainerWithView:deviceSize:deviceMaterial:", v20, v16, v17);
    -[NTKGreenfieldCompanionContentViewController _updateComplicationDisplayStates](self, "_updateComplicationDisplayStates");

  }
}

- (void)_setupWatchFaceViewContainerWithView:(id)a3 deviceSize:(unint64_t)a4 deviceMaterial:(unint64_t)a5
{
  id v8;
  void *v9;
  int v10;
  BPSWatchViewProtocol *watchView;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  id v33;
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
  BPSWatchViewProtocol *v46;
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
  CGAffineTransform v57;
  CGAffineTransform v58;
  CGAffineTransform v59;
  CGAffineTransform v60;
  _QWORD v61[4];
  _QWORD v62[3];

  v62[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a4 <= 8 && ((1 << a4) & 0x186) != 0)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D03600]), "initWithStyle:", 2);
    objc_msgSend(v9, "overrideMaterial:size:", a5, a4);
    v10 = 0;
    watchView = self->_watchView;
    self->_watchView = (BPSWatchViewProtocol *)v9;
  }
  else
  {
    v46 = (BPSWatchViewProtocol *)objc_alloc_init(MEMORY[0x1E0D035E8]);
    watchView = self->_watchView;
    self->_watchView = v46;
    v10 = 1;
  }

  -[BPSWatchViewProtocol setTranslatesAutoresizingMaskIntoConstraints:](self->_watchView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BPSWatchViewProtocol addSubview:](self->_watchView, "addSubview:", v8);
  if (v8)
  {
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v8, "setContentMode:", 2);
      -[BPSWatchViewProtocol watchScreenInsetGuide](self->_watchView, "watchScreenInsetGuide");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      objc_msgSend(v8, "bounds");
      CGAffineTransformMakeScale(&v60, v17 / v20, v17 / v20);
      v59 = v60;
      objc_msgSend(v8, "setTransform:", &v59);
      objc_msgSend(v8, "setFrame:", v13, v15, v17, v19);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "scale");
      v23 = v22;

      -[NTKGreenfieldCompanionContentViewController _watchScreenSizeForDeviceSize:screenScale:](self, "_watchScreenSizeForDeviceSize:screenScale:", a4, v23);
      v25 = v24;
      v27 = v26;
      -[NTKGreenfieldCompanionContentViewController _watchScreenInsetForDeviceSize:screenScale:](self, "_watchScreenInsetForDeviceSize:screenScale:", a4, v23);
      objc_msgSend(v8, "setCenter:", v28 + v25 * 0.5, v29 + v27 * 0.5);
      objc_msgSend(v8, "bounds");
      v31 = v25 / v30;
      objc_msgSend(v8, "bounds");
      CGAffineTransformMakeScale(&v58, v31, v27 / v32);
      v57 = v58;
      objc_msgSend(v8, "setTransform:", &v57);
    }
  }
  v33 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v62[0] = self->_watchView;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v33, "initWithArrangedSubviews:", v34);

  objc_msgSend(v35, "setAxis:", 1);
  objc_msgSend(v35, "setAlignment:", 3);
  objc_msgSend(v35, "setBaselineRelativeArrangement:", 1);
  objc_msgSend(v35, "setSpacing:", 8.0);
  objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[NTKGreenfieldCompanionContentViewController contentView](self, "contentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addSubview:", v35);

  v48 = (void *)MEMORY[0x1E0CB3718];
  -[NTKGreenfieldCompanionContentViewController contentView](self, "contentView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v53;
  -[NTKGreenfieldCompanionContentViewController contentView](self, "contentView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v49);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v47;
  -[NTKGreenfieldCompanionContentViewController contentView](self, "contentView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "trailingAnchor");
  v51 = v8;
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v40;
  -[NTKGreenfieldCompanionContentViewController contentView](self, "contentView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v61[3] = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 4);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "activateConstraints:", v45);

}

- (void)_setupContentViewForWatchFaceNotAvailableError
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *workQueue;
  _QWORD v10[6];

  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nrDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(MEMORY[0x1E0D65218], "materialFromDevice:", v4);
  -[NTKGreenfieldDecodedRecipe noBorderFacePreviewImagePath](self->_decodedRecipe, "noBorderFacePreviewImagePath");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[NTKGreenfieldDecodedRecipe senderBoxedDeviceSize](self->_decodedRecipe, "senderBoxedDeviceSize");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      workQueue = self->_workQueue;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __93__NTKGreenfieldCompanionContentViewController__setupContentViewForWatchFaceNotAvailableError__block_invoke;
      v10[3] = &unk_1E6BD09B0;
      v10[4] = self;
      v10[5] = v5;
      dispatch_async(workQueue, v10);
    }
  }

}

void __93__NTKGreenfieldCompanionContentViewController__setupContentViewForWatchFaceNotAvailableError__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD block[5];
  id v8;
  uint64_t v9;

  v2 = objc_alloc(MEMORY[0x1E0DC3870]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "noBorderFacePreviewImagePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithContentsOfFile:", v3);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__NTKGreenfieldCompanionContentViewController__setupContentViewForWatchFaceNotAvailableError__block_invoke_2;
  block[3] = &unk_1E6BD1EC0;
  v5 = *(_QWORD *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __93__NTKGreenfieldCompanionContentViewController__setupContentViewForWatchFaceNotAvailableError__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
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
  double v15;
  double v16;
  NTKRoundedCornerMaskView *v17;
  id v18;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "senderBoxedDeviceSize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  v4 = objc_msgSend(*(id *)(a1 + 32), "_deviceSizeForCLKDeviceSizeClass:", v3);
  objc_msgSend(MEMORY[0x1E0C944B0], "screenBoundsForSizeClass:", v3);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(MEMORY[0x1E0C944B0], "screenScaleForSizeClass:", v3);
  v14 = v13;
  objc_msgSend(MEMORY[0x1E0C944B0], "screenCornerRadiusForSizeClass:", v3);
  v16 = v15;
  v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v18, "setFrame:", v6, v8, v10, v12);
  v17 = -[NTKRoundedCornerMaskView initWithFrame:screenScale:cornerRadius:]([NTKRoundedCornerMaskView alloc], "initWithFrame:screenScale:cornerRadius:", v6, v8, v10, v12, v14, v16);
  -[NTKRoundedCornerMaskView addSubview:](v17, "addSubview:", v18);
  objc_msgSend(*(id *)(a1 + 32), "_setupWatchFaceViewContainerWithView:deviceSize:deviceMaterial:", v17, v4, *(_QWORD *)(a1 + 48));

}

- (void)_presentErrorUIAlert
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  -[NTKGreenfieldCompanionContentViewController _errorTitleForError:](self, "_errorTitleForError:", self->_error);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKGreenfieldCompanionContentViewController _errorSubtitleForError:](self, "_errorSubtitleForError:", self->_error);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (NTKInternalBuild(v4, v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n \n [INTERNAL ONLY] \n Please file a radar and include a sysdiagnose. Error: reason: %@"), self->_error);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3448];
  NTKClockFaceLocalizedString(CFSTR("GREENFIELD_ADD_WATCH_FACE_ERROR_OK_BUTON_TITLE"), CFSTR("OK"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__NTKGreenfieldCompanionContentViewController__presentErrorUIAlert__block_invoke;
  v12[3] = &unk_1E6BCE388;
  v12[4] = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v11);
  -[NTKGreenfieldCompanionContentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

}

void __67__NTKGreenfieldCompanionContentViewController__presentErrorUIAlert__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1392));
  objc_msgSend(WeakRetained, "companionContentViewController:handleButtonEvent:", *(_QWORD *)(a1 + 32), 5);

}

- (unint64_t)_deviceSizeForCLKDeviceSizeClass:(unint64_t)a3
{
  if (a3 > 8)
    return 7;
  else
    return qword_1B755E1C0[a3];
}

- (CGPoint)_watchScreenInsetForDeviceSize:(unint64_t)a3 screenScale:(double)a4
{
  double v4;
  double v5;
  CGPoint result;

  if (a4 <= 2.0)
  {
    if (a3 == 2)
    {
      v5 = 56.0;
      v4 = 25.5;
      goto LABEL_17;
    }
    if (a3 == 7)
    {
      v5 = 50.5;
      v4 = 19.5;
      goto LABEL_17;
    }
    if (a3 != 8)
    {
      v5 = 54.0;
      v4 = 24.5;
      goto LABEL_17;
    }
    v5 = 50.5;
    goto LABEL_12;
  }
  switch(a3)
  {
    case 2uLL:
      v5 = 74.0;
      v4 = 32.0;
      break;
    case 7uLL:
      v5 = 65.0;
LABEL_12:
      v4 = 20.5;
      break;
    case 8uLL:
      v4 = 21.0;
      v5 = 66.0;
      break;
    default:
      v4 = 30.0;
      v5 = 71.0;
      break;
  }
LABEL_17:
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGSize)_watchScreenSizeForDeviceSize:(unint64_t)a3 screenScale:(double)a4
{
  double v4;
  double v5;
  uint64_t v6;
  CGSize result;

  if (a4 <= 2.0)
  {
    switch(a3)
    {
      case 2uLL:
        v4 = 85.0;
        v6 = 0x4051000000000000;
        break;
      case 8uLL:
        v4 = 95.0;
        v5 = 78.0;
        goto LABEL_17;
      case 7uLL:
        v4 = 98.0;
        v6 = 0x4054000000000000;
        break;
      default:
        v4 = 89.0;
        v5 = 71.0;
        goto LABEL_17;
    }
    v5 = *(double *)&v6;
  }
  else
  {
    switch(a3)
    {
      case 2uLL:
        v4 = 108.0;
        v5 = 86.0;
        break;
      case 8uLL:
        v4 = 123.0;
        v5 = 101.0;
        break;
      case 7uLL:
        v4 = 126.0;
        v5 = 103.0;
        break;
      default:
        v4 = 113.0;
        v5 = 90.0;
        break;
    }
  }
LABEL_17:
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)_updateComplicationDisplayStates
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  int *v7;
  uint64_t v8;
  int *v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  void *v15;
  int *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[NTKGreenfieldDecodedRecipe complicationSlotToTemplateMapping](self->_decodedRecipe, "complicationSlotToTemplateMapping");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = &OBJC_IVAR___NTKSiderealDataSource__locationManagerToken;
    v7 = &OBJC_IVAR___NTKSiderealDataSource__locationManagerToken;
    v8 = *(_QWORD *)v21;
    v9 = &OBJC_IVAR___NTKSiderealDataSource__locationManagerToken;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v3);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v6[147]), "containsObject:", v11) & 1) != 0)
        {
          v12 = 1;
        }
        else
        {
          v13 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v9[142]);
          if (v13 == 2)
          {
            v14 = v6;
            v15 = v3;
            v16 = v9;
            if (self->_complicationItemId)
            {
              -[NTKGreenfieldDecodedRecipe complicationSlotToItemIdMapping](self->_decodedRecipe, "complicationSlotToItemIdMapping");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "allKeysForObject:", self->_complicationItemId);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v18, "containsObject:", v11))
                v12 = 2;
              else
                v12 = 0;

            }
            else
            {
              v12 = 0;
            }
            v9 = v16;
            v3 = v15;
            v6 = v14;
            v7 = &OBJC_IVAR___NTKSiderealDataSource__locationManagerToken;
          }
          else if (v13 == 1)
          {
            if (-[NSSet containsObject:](self->_unavailableSlots, "containsObject:", v11))
              v12 = 2;
            else
              v12 = 0;
          }
          else
          {
            v12 = 0;
          }
        }
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v7[157]), "setComplicationDisplayViewState:forSlot:", v12, v11);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }

}

- (void)_installLocallyAvailableApp
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "Could not fine app record for complication item id %@", a5, a6, a7, a8, 2u);
}

void __74__NTKGreenfieldCompanionContentViewController__installLocallyAvailableApp__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v14 = a2;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "Installing local available app result: %ld %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier", CFSTR("ApplicationID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v11[1] = CFSTR("InstallState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("GreenfieldApplicationInstallBeganNotification"), 0, v10);

}

- (void)_overrideLockup:(id)a3 withButtonTitle:(id)a4 buttonAction:(id)a5
{
  void *v7;
  id v8;
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
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v24 = a3;
  v7 = (void *)MEMORY[0x1E0CF9BE0];
  v8 = a5;
  objc_msgSend(v7, "textMetadataWithTitle:subtitle:", a4, 0);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9BA8]), "initWithMetadata:action:", v25, v8);

  objc_msgSend(v24, "lockup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc(MEMORY[0x1E0CF9BB0]);
  objc_msgSend(v9, "id");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "kind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "metrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "icon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "heading");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subtitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ageRating");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v22, "initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:", v10, v11, v12, v13, v14, v15, v16, v17, v23);

  v19 = (void *)MEMORY[0x1E0DC3F10];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __92__NTKGreenfieldCompanionContentViewController__overrideLockup_withButtonTitle_buttonAction___block_invoke;
  v26[3] = &unk_1E6BCD778;
  v27 = v24;
  v28 = v18;
  v20 = v18;
  v21 = v24;
  objc_msgSend(v19, "performWithoutAnimation:", v26);

}

uint64_t __92__NTKGreenfieldCompanionContentViewController__overrideLockup_withButtonTitle_buttonAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLockup:", *(_QWORD *)(a1 + 40));
}

- (void)_reinstallAppWithAdamId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CF9BF0], "sharedWatchApps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reinstallAppWithID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__NTKGreenfieldCompanionContentViewController__reinstallAppWithAdamId___block_invoke;
  v10[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v6, "addSuccessBlock:", v10);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __71__NTKGreenfieldCompanionContentViewController__reinstallAppWithAdamId___block_invoke_3;
  v8[3] = &unk_1E6BD1F10;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v6, "addErrorBlock:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __71__NTKGreenfieldCompanionContentViewController__reinstallAppWithAdamId___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__NTKGreenfieldCompanionContentViewController__reinstallAppWithAdamId___block_invoke_2;
  block[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __71__NTKGreenfieldCompanionContentViewController__reinstallAppWithAdamId___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "alternateChoiceButton");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setEnabled:", 1);

    v3 = objc_loadWeakRetained(v4 + 174);
    objc_msgSend(v3, "companionContentViewController:didStartInstallingAppWithItemId:", v4, v4[161]);

    WeakRetained = v4;
  }

}

void __71__NTKGreenfieldCompanionContentViewController__reinstallAppWithAdamId___block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__NTKGreenfieldCompanionContentViewController__reinstallAppWithAdamId___block_invoke_4;
  block[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __71__NTKGreenfieldCompanionContentViewController__reinstallAppWithAdamId___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "alternateChoiceButton");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setEnabled:", 1);

    WeakRetained = v3;
  }

}

- (void)_reinstallSystemAppWithBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CF9BF0], "sharedWatchApps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reinstallSystemAppWithBundleID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__NTKGreenfieldCompanionContentViewController__reinstallSystemAppWithBundleId___block_invoke;
  v10[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v6, "addSuccessBlock:", v10);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __79__NTKGreenfieldCompanionContentViewController__reinstallSystemAppWithBundleId___block_invoke_3;
  v8[3] = &unk_1E6BD1F10;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v6, "addErrorBlock:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __79__NTKGreenfieldCompanionContentViewController__reinstallSystemAppWithBundleId___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__NTKGreenfieldCompanionContentViewController__reinstallSystemAppWithBundleId___block_invoke_2;
  block[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __79__NTKGreenfieldCompanionContentViewController__reinstallSystemAppWithBundleId___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "alternateChoiceButton");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setEnabled:", 1);

    v3 = objc_loadWeakRetained(v4 + 174);
    objc_msgSend(v3, "companionContentViewController:didStartInstallingAppWithItemId:", v4, v4[161]);

    WeakRetained = v4;
  }

}

void __79__NTKGreenfieldCompanionContentViewController__reinstallSystemAppWithBundleId___block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__NTKGreenfieldCompanionContentViewController__reinstallSystemAppWithBundleId___block_invoke_4;
  block[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __79__NTKGreenfieldCompanionContentViewController__reinstallSystemAppWithBundleId___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "alternateChoiceButton");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setEnabled:", 1);

    WeakRetained = v3;
  }

}

- (void)_didTapAddToMyFacesButton
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_greenfieldDelegate);
  objc_msgSend(WeakRetained, "companionContentViewController:handleButtonEvent:", self, 0);

}

- (void)lockupViewDidFinishRequest:(id)a3
{
  id v4;
  void *v5;
  int64_t installMode;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  id location;

  v4 = a3;
  v5 = v4;
  installMode = self->_installMode;
  if (installMode)
    v7 = installMode == 2;
  else
    v7 = 1;
  if (v7)
  {
    objc_msgSend(v4, "lockup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "offer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "flags") & 0x10) != 0 && (objc_msgSend(v9, "flags") & 0x40) != 0)
    {
      objc_msgSend(v5, "setAutomaticallyPresentsProductDetails:", 0);
      NTKClockFaceLocalizedString(CFSTR("GREENFIELD_ADD_WATCH_FACE_INSTALL_BUTTON_TITLE"), CFSTR("INSTALL"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __74__NTKGreenfieldCompanionContentViewController_lockupViewDidFinishRequest___block_invoke_2;
      v11[3] = &unk_1E6BCD5F0;
      v11[4] = self;
      -[NTKGreenfieldCompanionContentViewController _overrideLockup:withButtonTitle:buttonAction:](self, "_overrideLockup:withButtonTitle:buttonAction:", v5, v10, v11);

    }
    goto LABEL_11;
  }
  if (installMode == 1)
  {
    NTKClockFaceLocalizedString(CFSTR("GREENFIELD_ADD_WATCH_FACE_INSTALL_BUTTON_TITLE"), CFSTR("INSTALL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__NTKGreenfieldCompanionContentViewController_lockupViewDidFinishRequest___block_invoke;
    v12[3] = &unk_1E6BCD7F0;
    objc_copyWeak(&v13, &location);
    -[NTKGreenfieldCompanionContentViewController _overrideLockup:withButtonTitle:buttonAction:](self, "_overrideLockup:withButtonTitle:buttonAction:", v5, v9, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
LABEL_11:

  }
}

void __74__NTKGreenfieldCompanionContentViewController_lockupViewDidFinishRequest___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_installLocallyAvailableApp");

}

void __74__NTKGreenfieldCompanionContentViewController_lockupViewDidFinishRequest___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "complicationSlotToItemIdMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeysForObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1288));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "complicationSlotToBundleIdMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_reinstallSystemAppWithBundleId:", v5);
}

- (void)lockupView:(id)a3 appStateDidChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *WeakRetained;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF9A78]))
  {
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF9A50]) & 1) != 0
      || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF9A58]))
    {
      if (self->_lockupViewDidUpdateStateForInstallingOrOpenable)
        goto LABEL_9;
      self->_lockupViewDidUpdateStateForInstallingOrOpenable = 1;
      if (self->_installMode == 2)
      {
        -[NTKGreenfieldCompanionContentViewController _installLocallyAvailableApp](self, "_installLocallyAvailableApp");
        goto LABEL_5;
      }
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF9A60]))
      {
        -[BPSWelcomeOptinViewController alternateChoiceButton](self, "alternateChoiceButton");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = v8;
        v10 = 1;
        goto LABEL_3;
      }
      if (!self->_lockupViewStateDidChange)
      {
        NTKClockFaceLocalizedString(CFSTR("GREENFIELD_ADD_WATCH_FACE_INSTALL_BUTTON_TITLE"), CFSTR("INSTALL"));
        WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __76__NTKGreenfieldCompanionContentViewController_lockupView_appStateDidChange___block_invoke;
        v12[3] = &unk_1E6BCD778;
        v12[4] = self;
        v13 = v6;
        -[NTKGreenfieldCompanionContentViewController _overrideLockup:withButtonTitle:buttonAction:](self, "_overrideLockup:withButtonTitle:buttonAction:", v13, WeakRetained, v12);

        goto LABEL_4;
      }
    }
    -[BPSWelcomeOptinViewController alternateChoiceButton](self, "alternateChoiceButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnabled:", 1);

    WeakRetained = objc_loadWeakRetained((id *)&self->_greenfieldDelegate);
    objc_msgSend(WeakRetained, "companionContentViewController:didStartInstallingAppWithItemId:", self, self->_complicationItemId);
    goto LABEL_4;
  }
  -[BPSWelcomeOptinViewController alternateChoiceButton](self, "alternateChoiceButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = v8;
  v10 = 0;
LABEL_3:
  objc_msgSend(v8, "setEnabled:", v10);
LABEL_4:

LABEL_5:
  self->_lockupViewStateDidChange = 1;
LABEL_9:

}

void __76__NTKGreenfieldCompanionContentViewController_lockupView_appStateDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "lockup");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "id");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_reinstallAppWithAdamId:", v2);

}

- (id)_errorSubtitleForError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.nanotimekit.NTKGreenfieldAddWatchFaceManager"));

  if (v5)
  {
    switch(objc_msgSend(v3, "code"))
    {
      case 1:
      case 8:
      case 11:
        v6 = CFSTR("GREENFIELD_ADD_WATCH_FACE_ERROR_NOT_AVAIALBLE_ON_DEVICE");
        v7 = CFSTR("This watch face is not available on your Apple Watch.");
        goto LABEL_5;
      case 2:
      case 4:
        v6 = CFSTR("GREENFIELD_ADD_WATCH_FACE_ERROR_TRY_AGAIN_LATER");
        v7 = CFSTR("Try again later.");
        goto LABEL_5;
      case 3:
        v6 = CFSTR("GREENFIELD_COMPANION_ADD_WATCH_FACE_ERROR_NO_WATCH_PAIRED");
        v7 = CFSTR("Pair your Apple Watch with this iPhone to add this face.");
        goto LABEL_5;
      case 5:
        v10 = (void *)MEMORY[0x1E0CB3940];
        NTKClockFaceLocalizedString(CFSTR("GREENFIELD_ADD_WATCH_FACE_ERROR_FACE_LIMIT"), CFSTR("too many faces"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringWithFormat:", v11, NTKFaceLibraryMaxFaceCountForDevice(v12));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      case 6:
        v6 = CFSTR("GREENFIELD_COMPANION_ADD_WATCH_FACE_ERROR_SINGULAR_FACE_SUBTITLE");
        v7 = CFSTR("You can switch to this face on your Apple Watch.");
        goto LABEL_5;
      case 7:
        v6 = CFSTR("GREENFIELD_ADD_WATCH_FACE_ERROR_NO_PHOTOS_INCLUDED_IN_PHOTOS_WATCH_FACE");
        v7 = CFSTR("This face cannot be added to your Apple Watch because the sender did not include any photos.");
        goto LABEL_5;
      case 9:
        v6 = CFSTR("GREENFIELD_ADD_WATCH_FACE_ERROR_LIBRARY_NOT_LOADED");
        v7 = CFSTR("Could not add this watch face at this time. Try again later.");
        goto LABEL_5;
      case 10:
        v6 = CFSTR("GREENFIELD_ADD_WATCH_FACE_ERROR_NO_NETWORK_CONNECTION_OR_INVALID_URL_SUBTITLE");
        v7 = CFSTR("Check your internet connection and try again.");
        goto LABEL_5;
      case 12:
        v6 = CFSTR("GREENFIELD_COMPANION_ADD_WATCH_FACE_ERROR_REQURE_WATCH_OS_UPDATE");
        v7 = CFSTR("Watch face sharing is not available with your current version of watchOS.");
        goto LABEL_5;
      case 13:
        objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "nrDevice");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "valueForProperty:", *MEMORY[0x1E0D51728]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = (void *)MEMORY[0x1E0CB3940];
        NTKClockFaceLocalizedString(CFSTR("GREENFIELD_ADD_WATCH_FACE_ERROR_PAIRED_DEVICE_IS_TINKER"), CFSTR("This face can be added on Apple Watch. Message it to %@ to get started."));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringWithFormat:", v17, v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    v6 = CFSTR("GREENFIELD_ADD_WATCH_FACE_ERROR_DEFAULT_ALERT_MESSAGE");
    v7 = CFSTR("This watch face is not available with your current version of watchOS.");
LABEL_5:
    NTKClockFaceLocalizedString(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_errorTitleForError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.nanotimekit.NTKGreenfieldAddWatchFaceManager"));

  if (v6)
  {
    switch(objc_msgSend(v4, "code"))
    {
      case 0:
      case 2:
      case 11:
        goto LABEL_3;
      case 4:
        v8 = CFSTR("GREENFIELD_ADD_WATCH_FACE_ERROR_FAILED_TO_DOWNLOAD_WATCH_FACE_DATA_TITLE");
        v9 = CFSTR("This Watch Face is Not Available at This Time");
        break;
      case 6:
        v8 = CFSTR("GREENFIELD_COMPANION_ADD_WATCH_FACE_ERROR_SINGULAR_FACE_TITLE");
        v9 = CFSTR("You Already Have This Face");
        break;
      case 10:
        v8 = CFSTR("GREENFIELD_ADD_WATCH_FACE_ERROR_NO_NETWORK_CONNECTION_OR_INVALID_URL_TITLE");
        v9 = CFSTR("Unable to Download the Watch Face");
        break;
      case 12:
        goto LABEL_5;
      default:
        goto LABEL_4;
    }
  }
  else
  {
LABEL_3:
    -[NTKGreenfieldDecodedRecipe watchFace](self->_decodedRecipe, "watchFace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
LABEL_4:
      v8 = CFSTR("GREENFIELD_ADD_WATCH_FACE_TITLE_MAIN_SCREEN_GENERIC");
      v9 = CFSTR("Add Watch Face");
    }
    else
    {
LABEL_5:
      v8 = CFSTR("GREENFIELD_ADD_WATCH_FACE_ERROR_NOT_AVAIALBLE_ON_DEVICE_ALERT_TITLE");
      v9 = CFSTR("Watch Face Unavailable");
    }
  }
  NTKClockFaceLocalizedString(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_didTapShowInternalErrorButton
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Please file a radar to Watch Faces if you think this is an error.\n %@"), self->_error);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("[Internal Only]"), v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Ok"), 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAction:", v4);

  -[NTKGreenfieldCompanionContentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);
}

- (NTKGreenfieldCompanionContentViewControllerDelegate)greenfieldDelegate
{
  return (NTKGreenfieldCompanionContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_greenfieldDelegate);
}

- (void)setGreenfieldDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_greenfieldDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_greenfieldDelegate);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_faceView, 0);
  objc_storeStrong((id *)&self->_watchView, 0);
  objc_storeStrong((id *)&self->_appStoreView, 0);
  objc_storeStrong((id *)&self->_unavailableDescription, 0);
  objc_storeStrong((id *)&self->_unavailableTitle, 0);
  objc_storeStrong((id *)&self->_unavailableSlots, 0);
  objc_storeStrong((id *)&self->_skippedComplicationSlots, 0);
  objc_storeStrong((id *)&self->_addFaceDescription, 0);
  objc_storeStrong((id *)&self->_complicationItemId, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_decodedRecipe, 0);
}

@end
