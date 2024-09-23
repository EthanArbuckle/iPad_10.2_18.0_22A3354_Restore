@implementation ICNoteEditorViewController

- (void)viewDidLoad
{
  uint64_t BundleBoolSettingValue;
  void *v4;
  id v5;
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
  ICNoteEditorNavigationItemConfiguration *v24;
  ICStyleSelectorViewController *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  ICAudioAttachmentEditorCoordinator *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v44;
  _QWORD v45[5];

  v45[4] = *MEMORY[0x1E0C80C00];
  v44.receiver = self;
  v44.super_class = (Class)ICNoteEditorViewController;
  -[ICNoteEditorViewController viewDidLoad](&v44, sel_viewDidLoad);
  BundleBoolSettingValue = ICInternalSettingsGetBundleBoolSettingValue();
  -[ICNoteEditorViewController backgroundView](self, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHasBarBlur:", BundleBoolSettingValue);

  if (-[ICNoteEditorBaseViewController isEditingOnSecureScreen](self, "isEditingOnSecureScreen"))
  {
    v5 = objc_alloc(MEMORY[0x1E0DC3CB0]);
    v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ICNoteEditorViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "statusBarManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requestStyle:", objc_msgSend(v10, "statusBarStyle"));

    -[ICNoteEditorViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v6);

    v37 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v6, "leftAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController view](self, "view");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "leftAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v40;
    objc_msgSend(v6, "rightAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController view](self, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "rightAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v36);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v12;
    objc_msgSend(v6, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v16;
    objc_msgSend(v6, "heightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToConstant:", *MEMORY[0x1E0DC53B0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v45[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "activateConstraints:", v19);

  }
  -[ICNoteEditorViewController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLargeTitleDisplayMode:", 2);

  -[ICNoteEditorViewController backgroundView](self, "backgroundView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController ic_safeAreaLayoutGuide](self, "ic_safeAreaLayoutGuide");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController backgroundView](self, "backgroundView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addConstraintsForSafeAreaLayoutGuide:toContainer:", v22, v23);

  v24 = -[ICNoteEditorNavigationItemConfiguration initWithDataSource:delegate:]([ICNoteEditorNavigationItemConfiguration alloc], "initWithDataSource:delegate:", self, self);
  -[ICNoteEditorViewController setNavigationItemConfiguration:](self, "setNavigationItemConfiguration:", v24);

  v25 = objc_alloc_init(ICStyleSelectorViewController);
  -[ICNoteEditorViewController setStyleSelectorController:](self, "setStyleSelectorController:", v25);

  -[ICNoteEditorViewController styleSelectorController](self, "styleSelectorController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDelegate:", self);

  if (UIAccessibilityIsVoiceOverRunning())
    -[ICNoteEditorViewController applyAccessibilityInfo](self, "applyAccessibilityInfo");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_localeChanged_, *MEMORY[0x1E0C99720], 0);
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_sceneWillDeactivate_, *MEMORY[0x1E0DC5330], 0);
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_applicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_applicationDidBecomeActive_, *MEMORY[0x1E0DC4750], 0);
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChange, *MEMORY[0x1E0DC48E8], 0);
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_attachmentBrickDidChangeSize, *MEMORY[0x1E0D635F0], 0);
  v28 = *MEMORY[0x1E0D63F08];
  objc_msgSend(MEMORY[0x1E0C95130], "ic_mentionableNamesCache");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_updateParticipantsInDrawings, v28, v29);

  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_splitViewModeChangeWillBegin_, CFSTR("ICSplitViewControllerWillBeginDisplayModeChange"), 0);
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_navigationControllerWillChange_, CFSTR("ICNavigationControllerWillChange"), 0);
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_splitViewModeChangeDidEnd_, CFSTR("ICSplitViewControllerDidEndDisplayModeChange"), 0);
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_paperKitBundleDidMerge_, *MEMORY[0x1E0D63610], 0);
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_observeAttachmentDeleted_, *MEMORY[0x1E0D635E0], 0);
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_observeDrawingConverted_, *MEMORY[0x1E0D64930], 0);
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_noteAnalyticsAddAttachment_, *MEMORY[0x1E0D63780], 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICNoteEditorViewController collaborationButtons_registerForSharedWithYouHighlightUpdates](self, "collaborationButtons_registerForSharedWithYouHighlightUpdates");
  -[ICNoteEditorViewController setShouldResetTextViewContentOffsetWhenAppearing:](self, "setShouldResetTextViewContentOffsetWhenAppearing:", 1);
  objc_msgSend(MEMORY[0x1E0DC3AC8], "ic_addObserver:forKeyPath:context:", self, CFSTR("prefersPencilOnlyDrawing"), &compoundliteral_0);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "ic_addObserver:forKeyPath:context:", self, *MEMORY[0x1E0D64898], &compoundliteral_2699);

  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_willAddAttachmentForNoteNotification_, *MEMORY[0x1E0D63998], 0);
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_didAddAttachmentForNoteNotification_, *MEMORY[0x1E0D63708], 0);
  v31 = *MEMORY[0x1E0D636E0];
  objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_noteDecryptedStatusDidChange_, v31, v32);

  v33 = *MEMORY[0x1E0D636E8];
  objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_noteDecryptedStatusDidChange_, v33, v34);

  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_noteDecryptedStatusDidChange_, *MEMORY[0x1E0D635A0], 0);
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_noteDidDeauthenticateAfterMerge_, *MEMORY[0x1E0D637A8], 0);
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_sceneDidActivate_, *MEMORY[0x1E0DC5308], 0);
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_passwordEntryAlertControllerAttemptDidFail_, *MEMORY[0x1E0D649F0], 0);
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_authenticationAuthenticateBiometricsAttemptDidFail_, *MEMORY[0x1E0D648D8], 0);
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_lockNoteManagerWillToggleLock_, *MEMORY[0x1E0D649E0], 0);
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_lockNoteManagerDidToggleLock_, *MEMORY[0x1E0D649D8], 0);
  -[ICScrollViewDelegateViewController setupScrollViewKeyboardResizer](self, "setupScrollViewKeyboardResizer");
  if (ICInternalSettingsIsAudioTranscriptionEnabled())
  {
    v35 = -[ICAudioAttachmentEditorCoordinator initWithNoteEditorViewController:]([ICAudioAttachmentEditorCoordinator alloc], "initWithNoteEditorViewController:", self);
    -[ICNoteEditorViewController setAudioAttachmentEditorCoordinator:](self, "setAudioAttachmentEditorCoordinator:", v35);

  }
  if (!ICInternalSettingsIsTextKit2Enabled()
    || -[ICNoteEditorViewController isEditingOnSystemPaperOnPhone](self, "isEditingOnSystemPaperOnPhone"))
  {
    -[ICNoteEditorViewController recreateTextViewIfNecessary](self, "recreateTextViewIfNecessary");
  }

}

- (void)stopTextFindingIfNecessary
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  -[ICNoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "findInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFindNavigatorVisible");

  if (v5)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "findInteraction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissFindNavigator");

    -[ICNoteEditorViewController showOrHideSearchPatternHighlightsIfNecessary](self, "showOrHideSearchPatternHighlightsIfNecessary");
  }
}

- (void)setSplitViewExpandingOrCollapsing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  double x;
  double y;
  double width;
  double height;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v3 = a3;
  self->_splitViewExpandingOrCollapsing = a3;
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldAvoidResigningFirstResponder:", v3);

  objc_opt_class();
  -[ICNoteEditorViewController auxiliaryResponder](self, "auxiliaryResponder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShouldAvoidResigningFirstResponder:", v3);

  objc_opt_class();
  -[ICNoteEditorViewController auxiliaryResponder](self, "auxiliaryResponder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShouldAvoidResigningFirstResponder:", v3);

  v10 = v3 && -[ICNoteEditorViewController isInkPickerShowing](self, "isInkPickerShowing");
  -[ICNoteEditorViewController setShowInkPickerAfterViewAppears:](self, "setShowInkPickerAfterViewAppears:", v10 | -[ICNoteEditorViewController showInkPickerAfterViewAppears](self, "showInkPickerAfterViewAppears"));
  -[ICNoteEditorViewController attributionSidebarController](self, "attributionSidebarController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hideSidebarAnimated:", 1);

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0 && _os_feature_enabled_impl() && !v3)
  {
    -[ICNoteEditorViewController viewIfLoaded](self, "viewIfLoaded");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[ICNoteEditorViewController updateTextViewContentInsetsAnimated:](self, "updateTextViewContentInsetsAnimated:", 0);
      -[ICNoteEditorViewController textView](self, "textView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "frame");
      v26 = CGRectInset(v25, 1.0, 0.0);
      x = v26.origin.x;
      y = v26.origin.y;
      width = v26.size.width;
      height = v26.size.height;
      -[ICNoteEditorViewController textView](self, "textView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFrame:", x, y, width, height);

      -[ICNoteEditorViewController textView](self, "textView");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "frame");
      v28 = CGRectInset(v27, -1.0, 0.0);
      v19 = v28.origin.x;
      v20 = v28.origin.y;
      v21 = v28.size.width;
      v22 = v28.size.height;
      -[ICNoteEditorViewController textView](self, "textView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setFrame:", v19, v20, v21, v22);

    }
  }
}

- (UIResponder)auxiliaryResponder
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_auxiliaryResponder);
}

- (BOOL)showInkPickerAfterViewAppears
{
  return self->_showInkPickerAfterViewAppears;
}

- (void)setShowInkPickerAfterViewAppears:(BOOL)a3
{
  self->_showInkPickerAfterViewAppears = a3;
}

- (BOOL)wantsToRemainFirstResponder
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;
  int v9;

  if (-[ICNoteEditorViewController isViewLoaded](self, "isViewLoaded"))
  {
    if ((-[ICNoteEditorViewController isEditing](self, "isEditing") & 1) != 0)
      goto LABEL_6;
    -[ICNoteEditorViewController textView](self, "textView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "selectedTextRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = objc_msgSend(v4, "isEmpty");

      if (!v5)
        goto LABEL_6;
    }
  }
  -[ICNoteEditorViewController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFindNavigatorVisible");

  if ((v8 & 1) != 0)
  {
LABEL_6:
    LOBYTE(v9) = 1;
  }
  else
  {
    v9 = -[ICNoteEditorViewController isInkPickerShowing](self, "isInkPickerShowing");
    if (v9)
      LOBYTE(v9) = -[ICNoteEditorViewController ic_isViewVisible](self, "ic_isViewVisible");
  }
  return v9;
}

- (BOOL)isInkPickerShowing
{
  void *v3;
  void *v4;
  char v5;

  -[ICNoteEditorViewController inkPaletteController](self, "inkPaletteController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICNoteEditorViewController inkPaletteController](self, "inkPaletteController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isInkPaletteShowing");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (ICInkPaletteController)inkPaletteController
{
  return self->_inkPaletteController;
}

- (UIEdgeInsets)textViewScrollIndicatorInsetsThatWeWant
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  double x;
  double y;
  double width;
  double height;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  CGFloat v34;
  double MaxX;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double MinX;
  double v42;
  double v43;
  double v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  UIEdgeInsets result;

  -[ICNoteEditorViewController textViewTopInsetThatWeWant](self, "textViewTopInsetThatWeWant");
  v44 = v3;
  -[ICNoteEditorViewController ic_safeAreaDistanceFromBottom](self, "ic_safeAreaDistanceFromBottom");
  v43 = v4;
  -[ICNoteEditorViewController textViewScrollIndicatorBottomInsetOverride](self, "textViewScrollIndicatorBottomInsetOverride");
  v42 = v5;
  -[ICNoteEditorViewController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "verticalScrollIndicatorInsets");
  v39 = v8;
  v40 = v7;

  -[ICNoteEditorViewController textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v45.origin.x = v11;
  v45.origin.y = v13;
  v45.size.width = v15;
  v45.size.height = v17;
  v18 = CGRectGetHeight(v45) / 3.0;
  v46.origin.x = v11;
  v46.origin.y = v13;
  v46.size.width = v15;
  v46.size.height = v17;
  v47 = CGRectInset(v46, 0.0, v18);
  x = v47.origin.x;
  y = v47.origin.y;
  width = v47.size.width;
  height = v47.size.height;
  -[ICNoteEditorViewController textView](self, "textView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 10, 1, x, y, width, height);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v48.origin.x = v25;
  v48.origin.y = v27;
  v48.size.width = v29;
  v48.size.height = v31;
  if (CGRectIsNull(v48))
  {
    v32 = v39;
    v33 = v40;
  }
  else
  {
    v49.origin.x = v25;
    v49.origin.y = v27;
    v49.size.width = v29;
    v49.size.height = v31;
    MinX = CGRectGetMinX(v49);
    v50.origin.x = v11;
    v50.origin.y = v13;
    v50.size.width = v15;
    v50.size.height = v17;
    v34 = CGRectGetMinX(v50);
    v51.size.height = v17;
    v33 = MinX - v34;
    v51.origin.x = v11;
    v51.origin.y = v13;
    v51.size.width = v15;
    MaxX = CGRectGetMaxX(v51);
    v52.origin.x = v25;
    v52.origin.y = v27;
    v52.size.width = v29;
    v52.size.height = v31;
    v32 = MaxX - CGRectGetMaxX(v52);
  }
  if (v43 >= v42)
    v36 = v43;
  else
    v36 = v42;
  v37 = v44;
  v38 = v33;
  result.right = v32;
  result.bottom = v36;
  result.left = v38;
  result.top = v37;
  return result;
}

- (ICAuthorHighlightsUpdater)authorHighlightsUpdater
{
  return self->_authorHighlightsUpdater;
}

- (void)updateForceLightContentIfNecessary
{
  _BOOL4 v3;
  _BOOL8 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
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
  char isKindOfClass;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  v3 = -[ICNoteEditorViewController shouldForceLightContent](self, "shouldForceLightContent");
  v4 = v3;
  if (v3)
    v5 = 2;
  else
    v5 = 0;
  -[ICNoteEditorViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", v3);
  -[ICNoteEditorViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOverrideUserInterfaceStyle:", v4);

  -[ICNoteEditorViewController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOverrideUserInterfaceStyle:", v4);

  -[ICNoteEditorViewController updateTextViewBackground](self, "updateTextViewBackground");
  -[ICNoteEditorViewController textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsDisplay");

  -[ICNoteEditorViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOverrideUserInterfaceStyle:", v4);

  -[ICNoteEditorViewController textViewInputAccessoryView](self, "textViewInputAccessoryView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOverrideUserInterfaceStyle:", v4);

  -[ICNoteEditorViewController textView](self, "textView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setKeyboardAppearance:", v5);

  -[ICNoteEditorViewController dynamicBarColor](self, "dynamicBarColor");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(v13, "configureWithTransparentBackground");
  objc_msgSend(v13, "setBackgroundColor:", v35);
  -[ICNoteEditorViewController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setStandardAppearance:", v13);

  -[ICNoteEditorViewController navigationItem](self, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCompactAppearance:", v13);

  if (!-[ICNoteEditorViewController usesCustomTransition](self, "usesCustomTransition"))
  {
    -[ICNoteEditorViewController navigationItem](self, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setScrollEdgeAppearance:", v13);

  }
  -[ICNoteEditorViewController navigationController](self, "navigationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "toolbar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "standardAppearance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "configureWithTransparentBackground");
  objc_msgSend(v19, "setBackgroundColor:", v35);
  -[ICNoteEditorViewController navigationController](self, "navigationController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "toolbar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setStandardAppearance:", v19);

  -[ICNoteEditorViewController navigationController](self, "navigationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "toolbar");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCompactAppearance:", v19);

  -[ICNoteEditorViewController navigationController](self, "navigationController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "toolbar");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setScrollEdgeAppearance:", v19);

  -[ICNoteEditorViewController navigationController](self, "navigationController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "toolbar");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setCompactScrollEdgeAppearance:", v19);

  -[ICNoteEditorViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[ICNoteEditorViewController inkPaletteController](self, "inkPaletteController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 || v28)
  {
    -[ICNoteEditorViewController inkPaletteController](self, "inkPaletteController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "selectedTool");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      -[ICNoteEditorViewController inkPaletteController](self, "inkPaletteController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "colorCorrectedTool");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController updateInkPickerAndTextViewToTool:](self, "updateInkPickerAndTextViewToTool:", v33);

    }
    -[ICNoteEditorViewController inkPaletteController](self, "inkPaletteController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setColorUserInterfaceStyle:", v4);

  }
}

- (void)setNote:(id)a3
{
  -[ICNoteEditorViewController setNote:delayedForLaunch:successHandler:](self, "setNote:delayedForLaunch:successHandler:", a3, 0, 0);
}

- (void)setViewControllerManager:(id)a3
{
  objc_storeWeak((id *)&self->_viewControllerManager, a3);
}

- (void)setNote:(id)a3 delayedForLaunch:(BOOL)a4 successHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  id v42;
  void *v43;
  dispatch_time_t v44;
  NSObject *v45;
  id v46;
  id v47;
  id v48;
  _QWORD *v49;
  _QWORD *v50;
  _QWORD *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  _BOOL4 v61;
  _BOOL4 v62;
  id v63;
  BOOL v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
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
  id v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  BOOL v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t i;
  void *v113;
  void *v114;
  void *v115;
  char v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  int v127;
  void *v128;
  void *v129;
  void (**v130)(void);
  id v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _QWORD v136[4];
  id v137;
  id location;
  objc_super v139;
  _QWORD block[5];
  id v141;
  id v142;
  _BYTE v143[128];
  _QWORD v144[2];
  _QWORD v145[4];

  v6 = a4;
  v145[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v130 = (void (**)(void))a5;
  -[ICNoteEditorViewController setSuspendBarButtonUpdates:](self, "setSuspendBarButtonUpdates:", 1);
  -[ICNoteEditorViewController textViewController](self, "textViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIgnoresTaps:", 0);

  -[ICNoteEditorViewController unsupportedNoteTapGestureRecognizer](self, "unsupportedNoteTapGestureRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ICNoteEditorViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController unsupportedNoteTapGestureRecognizer](self, "unsupportedNoteTapGestureRecognizer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeGestureRecognizer:", v12);

    -[ICNoteEditorViewController setUnsupportedNoteTapGestureRecognizer:](self, "setUnsupportedNoteTapGestureRecognizer:", 0);
  }
  if (objc_msgSend(v8, "isUnsupported") && objc_msgSend(v8, "isDeletedOrInTrash"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_showRecoverNoteAlert);
    -[ICNoteEditorViewController setUnsupportedNoteTapGestureRecognizer:](self, "setUnsupportedNoteTapGestureRecognizer:", v13);

    -[ICNoteEditorViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController unsupportedNoteTapGestureRecognizer](self, "unsupportedNoteTapGestureRecognizer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addGestureRecognizer:", v15);

  }
  if (v8 && objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
  {
    -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isMainSplitViewDisplayModeSecondaryOnly") & 1) != 0)
    {
      v17 = 1;
    }
    else
    {
      -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v18, "isAuxiliary");

    }
    -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "noteContainerViewMode") == 0;

    -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "noteContainerViewMode") == 1)
      v22 = 1;
    else
      v22 = v17;

    -[ICNoteEditorViewController updateContentViewBezelsStandalone:needsAdditionalBottomMargin:needsAdditionalLeadingMargin:force:](self, "updateContentViewBezelsStandalone:needsAdditionalBottomMargin:needsAdditionalLeadingMargin:force:", v17, v20, v22, 0);
  }
  if ((objc_msgSend(v8, "isSharedReadOnly") & 1) != 0)
    v23 = 1;
  else
    v23 = objc_msgSend(v8, "isSharedAndEmpty");
  -[ICNoteEditorViewController setUserWantsToSeeDateLabel:](self, "setUserWantsToSeeDateLabel:", v23);
  -[ICNoteEditorBaseViewController note](self, "note");
  v131 = (id)objc_claimAutoreleasedReturnValue();
  if (v131 != v8)
  {
    -[ICNoteEditorViewController setHasMadeEdits:](self, "setHasMadeEdits:", 0);
    v24 = -[ICNoteEditorViewController shouldTrackNoteViewEventAnalyticsFromSettingNote](self, "shouldTrackNoteViewEventAnalyticsFromSettingNote");
    if (v131)
    {
      if (v24)
      {
        -[ICNoteEditorViewController viewIfLoaded](self, "viewIfLoaded");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "window");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
          -[ICNoteEditorViewController submitNoteViewEventForModernNote:](self, "submitNoteViewEventForModernNote:", v131);
      }
    }
    v27 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[ICNoteEditorViewController setNote:delayedForLaunch:successHandler:].cold.1((uint64_t)self, v8);

    objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "extendDeauthenticationTimer");

    -[ICNoteEditorViewController presentedViewController](self, "presentedViewController");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    ICDynamicCast();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = v29;
    if (v29)
      v30 = objc_msgSend(v29, "shouldDismissWhenShowingNote", v29);
    else
      v30 = 1;
    if (NSClassFromString(CFSTR("ICAllowNotificationsViewController")))
      v30 &= ~objc_opt_isKindOfClass();
    if (v30 && v128)
      -[ICNoteEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    -[ICNoteEditorViewController setPaperTextAttachmentManager:](self, "setPaperTextAttachmentManager:", 0, v125);
    -[ICNoteEditorViewController setAuthorHighlightsController:](self, "setAuthorHighlightsController:", 0);
    -[ICNoteEditorViewController setAuthorHighlightsUpdater:](self, "setAuthorHighlightsUpdater:", 0);
    -[ICNoteEditorViewController setMentionsController:](self, "setMentionsController:", 0);
    -[ICNoteEditorViewController setHashtagController:](self, "setHashtagController:", 0);
    -[ICNoteEditorViewController setCalculateRecognitionController:](self, "setCalculateRecognitionController:", 0);
    -[ICNoteEditorViewController setCollaborationButtonsController:](self, "setCollaborationButtonsController:", 0);
    -[ICNoteEditorViewController setCollaborationBarButtonItem:](self, "setCollaborationBarButtonItem:", 0);
    -[ICNoteEditorViewController linkAcceleratorController](self, "linkAcceleratorController");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    if (v129)
    {
      if (objc_msgSend(v129, "isShowing"))
        objc_msgSend(v129, "hideAccelerator");
      objc_msgSend(v129, "setLinkDelegate:", 0);
    }
    -[ICNoteEditorViewController setLinkAcceleratorController:](self, "setLinkAcceleratorController:", 0);
    -[ICNoteEditorViewController linkAcceleratorController](self, "linkAcceleratorController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setLinkDelegate:", 0);

    if (v131)
    {
      -[ICNoteEditorViewController setInkPickerState:](self, "setInkPickerState:", 2);
      -[ICNoteEditorViewController showInkPicker:animated:](self, "showInkPicker:animated:", 0, 0);
      -[ICNoteEditorViewController updateInlineDrawingsPaletteVisibility](self, "updateInlineDrawingsPaletteVisibility");
      objc_msgSend(MEMORY[0x1E0D64CB8], "sharedController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "sendPendingNotifications");

      objc_msgSend(v131, "markActivitySummaryViewed");
      if (objc_msgSend(v131, "isPasswordProtected"))
      {
        objc_msgSend(v131, "account");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "accountData");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "cryptoPassphraseVerifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37 == 0;

        if (!v38)
        {
          objc_msgSend(MEMORY[0x1E0D64C88], "sharedMigrator");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "migrateNoteToV1NeoIfNeeded:completionHandler:", v131, &__block_literal_global_658);

        }
      }
      -[ICNoteEditorViewController presentRecordingStoppedAlertForNoteIfNeeded:](self, "presentRecordingStoppedAlertForNoteIfNeeded:", v131);
    }
    -[ICNoteEditorViewController showStyleSelector:animated:](self, "showStyleSelector:animated:", 0, 0);
    -[ICNoteEditorViewController tearDownAudioPlayers](self, "tearDownAudioPlayers");
    -[ICNoteEditorViewController stopTextFindingIfNecessary](self, "stopTextFindingIfNecessary");
    -[ICNoteEditorViewController saveCurrentScrollState](self, "saveCurrentScrollState");
    +[ICMovieController stopIfPlaying](ICMovieController, "stopIfPlaying");
    if (v6)
    {
      objc_msgSend(v8, "textStorage");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (unint64_t)objc_msgSend(v40, "length") > 0x10000;

      if (v41)
      {
        v42 = v8;
        v43 = (void *)objc_msgSend(v130, "copy");
        v44 = dispatch_time(0, 0);
        v45 = MEMORY[0x1E0C80D38];
        v46 = MEMORY[0x1E0C80D38];
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __70__ICNoteEditorViewController_setNote_delayedForLaunch_successHandler___block_invoke_660;
        block[3] = &unk_1EA7DD3F0;
        block[4] = self;
        v47 = v42;
        v141 = v47;
        v48 = v43;
        v142 = v48;
        dispatch_after(v44, v45, block);

        v8 = 0;
      }
    }
    v127 = -[ICNoteEditorViewController isEditing](self, "isEditing");
    if (v127)
    {
      -[ICNoteEditorViewController textViewScrollIndicatorBottomInsetOverride](self, "textViewScrollIndicatorBottomInsetOverride");
      -[ICNoteEditorViewController setTextViewScrollIndicatorBottomInsetOverrideToRestore:](self, "setTextViewScrollIndicatorBottomInsetOverrideToRestore:");
    }
    v49 = (_QWORD *)MEMORY[0x1E0D63790];
    v50 = (_QWORD *)MEMORY[0x1E0D64918];
    v51 = (_QWORD *)MEMORY[0x1E0D649C8];
    if (v131)
    {
      -[ICNoteEditorViewController removeKVOObserversForNote:](self, "removeKVOObserversForNote:");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "removeObserver:name:object:", self, *v49, v131);
      objc_msgSend(v52, "removeObserver:name:object:", self, *MEMORY[0x1E0D637E0], v131);
      objc_msgSend(v52, "removeObserver:name:object:", self, *MEMORY[0x1E0D63730], v131);
      objc_msgSend(v131, "calculateDocumentController");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "removeObserver:name:object:", self, *v50, v53);

      objc_msgSend(v52, "removeObserver:name:object:", self, *v51, v131);
      if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
      {
        objc_opt_class();
        -[ICNoteEditorViewController textView](self, "textView");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "layoutManager");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        ICCheckedDynamicCast();
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v56, "clearAllSupplementalViews");
      }
      -[ICNoteEditorViewController textController](self, "textController");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "resetTrackedToDoParagraphs");

      -[ICNoteEditorViewController calculateRecognitionController](self, "calculateRecognitionController");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "discardPreviewedResult");

      -[ICNoteEditorViewController setNoteAndFolderChangeController:](self, "setNoteAndFolderChangeController:", 0);
      -[ICNoteEditorViewController setInlineAttachmentChangeController:](self, "setInlineAttachmentChangeController:", 0);
      +[ICSystemPaperDocumentController sharedInstance](ICSystemPaperDocumentController, "sharedInstance");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "removePresenter:", self);

      if (-[ICNoteEditorBaseViewController viewAppearanceState](self, "viewAppearanceState") <= 1)
        goto LABEL_59;
      -[ICNoteEditorBaseViewController noteWillDisappear:](self, "noteWillDisappear:", v131);
      if (!v8)
      {
LABEL_64:
        -[ICNoteEditorViewController resetTextViewUndoManager](self, "resetTextViewUndoManager");
        v61 = v8 != 0;
LABEL_65:
        -[ICNoteEditorViewController previousNote](self, "previousNote");
        v63 = (id)objc_claimAutoreleasedReturnValue();
        v64 = v8 == v63;

        if (!v64)
        {
          -[ICNoteEditorViewController previousNote](self, "previousNote");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setHandwritingRecognitionEnabled:", 0);

        }
        -[ICNoteEditorViewController setPreviousNote:](self, "setPreviousNote:", v131);
        v139.receiver = self;
        v139.super_class = (Class)ICNoteEditorViewController;
        -[ICNoteEditorBaseViewController setNote:](&v139, sel_setNote_, v8);
        -[ICNoteEditorViewController setLastSelectedRange:](self, "setLastSelectedRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
        if (objc_msgSend(v8, "needsRefresh"))
          -[ICNoteEditorViewController fetchAll](self, "fetchAll");
        objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setCurrentNote:", v8);

        if (v61)
        {
          -[ICNoteEditorViewController addKVOObserversForNote:](self, "addKVOObserversForNote:", v8);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "addObserver:selector:name:object:", self, sel_attachmentsExceeded_, *v49, v8);
          objc_msgSend(v67, "addObserver:selector:name:object:", self, sel_mergeRelatedOperationsDidEnd_, *MEMORY[0x1E0D637E0], v8);
          objc_msgSend(v67, "addObserver:selector:name:object:", self, sel_inlineAttachmentDeleted_, *MEMORY[0x1E0D63730], v8);
          objc_msgSend(v8, "calculateDocumentController");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "addObserver:selector:name:object:", self, sel_calculateDocumentControllerDidUpdateHighlights_, *v50, v68);

          objc_msgSend(v67, "addObserver:selector:name:object:", self, sel_noteDidChangeCalculatePreviewBehaviorNotification_, *v51, v8);
          -[ICNoteEditorViewController setInvitation:](self, "setInvitation:", 0);
          v69 = objc_alloc(MEMORY[0x1E0D64C98]);
          v70 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v8, "managedObjectContext");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "setWithObject:", v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = (void *)objc_msgSend(v69, "initWithManagedObjectContexts:delegate:", v72, self);
          -[ICNoteEditorViewController setNoteAndFolderChangeController:](self, "setNoteAndFolderChangeController:", v73);

          -[ICNoteEditorViewController noteAndFolderChangeController](self, "noteAndFolderChangeController");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "setObjectTypes:", 9);

          v75 = objc_alloc(MEMORY[0x1E0D64C98]);
          v76 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v8, "managedObjectContext");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "setWithObject:", v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = (void *)objc_msgSend(v75, "initWithManagedObjectContexts:delegate:", v78, self);
          -[ICNoteEditorViewController setInlineAttachmentChangeController:](self, "setInlineAttachmentChangeController:", v79);

          +[ICSystemPaperDocumentController sharedInstance](ICSystemPaperDocumentController, "sharedInstance");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "addPresenter:", self);

        }
        if (-[ICNoteEditorBaseViewController viewAppearanceState](self, "viewAppearanceState") >= 2)
        {
          -[ICNoteEditorViewController previousNote](self, "previousNote");
          v81 = (void *)objc_claimAutoreleasedReturnValue();

          if (v81)
          {
            -[ICNoteEditorViewController previousNote](self, "previousNote");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICNoteEditorBaseViewController noteDidDisappear:](self, "noteDidDisappear:", v82);

          }
          if (v61 && -[ICNoteEditorBaseViewController viewAppearanceState](self, "viewAppearanceState") == 3)
            -[ICNoteEditorBaseViewController noteDidAppear:](self, "noteDidAppear:", v8);
        }
        -[ICNoteEditorViewController recreateTextViewIfNecessary](self, "recreateTextViewIfNecessary");
        -[ICNoteEditorViewController showOrHidePasswordEntryViewControllerIfNeeded](self, "showOrHidePasswordEntryViewControllerIfNeeded");
        -[ICNoteEditorViewController updateUnsupportedNoteView](self, "updateUnsupportedNoteView");
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v144[0] = *MEMORY[0x1E0D637C8];
        -[ICNoteEditorViewController previousNote](self, "previousNote");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = v84;
        if (!v84)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v145[0] = v85;
        v144[1] = *MEMORY[0x1E0D637C0];
        v86 = v8;
        if (!v61)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v145[1] = v86;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v145, v144, 2);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "postNotificationName:object:userInfo:", *MEMORY[0x1E0D637B8], self, v87);

        if (!v61)
        if (!v84)

        -[ICNoteEditorViewController textView](self, "textView");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "setEditable:", 0);

        -[ICNoteEditorViewController noteUserActivity](self, "noteUserActivity");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "setDelegate:", 0);

        -[ICNoteEditorViewController noteUserActivity](self, "noteUserActivity");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "invalidate");

        -[ICNoteEditorViewController setNoteUserActivity:](self, "setNoteUserActivity:", 0);
        -[ICNoteEditorViewController setNoteUserActivityState:](self, "setNoteUserActivityState:", 0);
        if (v61)
        {
          -[ICNoteEditorViewController updateNoteUserActivityStateDelayer](self, "updateNoteUserActivityStateDelayer");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "requestFire");

        }
        if (-[ICNoteEditorViewController ic_isViewVisible](self, "ic_isViewVisible"))
        {
          -[ICNoteEditorViewController updateTextViewContentInsetsAnimated:](self, "updateTextViewContentInsetsAnimated:", 0);
          if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
          {
            -[ICNoteEditorViewController resetTextViewContentOffset](self, "resetTextViewContentOffset");
            -[ICNoteEditorViewController textViewController](self, "textViewController");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "applyInitialScrollState");

          }
        }
        else
        {
          -[ICNoteEditorViewController setShouldResetTextViewContentOffsetWhenAppearing:](self, "setShouldResetTextViewContentOffsetWhenAppearing:", 1);
        }
        if (ICInternalSettingsIsTextKit2Enabled())
          -[ICNoteEditorViewController applyScrollStateIfAvailable](self, "applyScrollStateIfAvailable");
        -[ICNoteEditorViewController setEditing:](self, "setEditing:", v127 & v61);
        -[ICNoteEditorViewController rememberNoteContentForEditingIntent](self, "rememberNoteContentForEditingIntent");
        -[ICNoteEditorBaseViewController note](self, "note");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "mergeUnappliedEncryptedRecordRecursivelyInBackground");

        -[ICNoteEditorViewController setDidDrawWithPencilWithoutPalette:](self, "setDidDrawWithPencilWithoutPalette:", 0);
        -[ICNoteEditorViewController setSuspendBarButtonUpdates:](self, "setSuspendBarButtonUpdates:", 0);
        -[ICNoteEditorViewController setNeedsInitialBarConfiguration:](self, "setNeedsInitialBarConfiguration:", 0);
        if (-[ICNoteEditorViewController _appearState](self, "_appearState") == 2)
          -[ICNoteEditorViewController resetBarButtonsAnimated:](self, "resetBarButtonsAnimated:", 0);
        -[ICNoteEditorViewController updateActionMenu](self, "updateActionMenu");
        if (v130)
          v130[2]();
        -[ICNoteEditorViewController updateDataOwnerForCopyAndPaste](self, "updateDataOwnerForCopyAndPaste");
        -[ICNoteEditorViewController textView](self, "textView");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "dateView");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "setNote:", v8);

        -[ICNoteEditorViewController textView](self, "textView");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "userTitleView");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "setNote:", v8);

        -[ICNoteEditorViewController textView](self, "textView");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "icaxClearCaches");

        UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], 0);
        objc_initWeak(&location, self);
        v99 = MEMORY[0x1E0C80D38];
        v136[0] = MEMORY[0x1E0C809B0];
        v136[1] = 3221225472;
        v136[2] = __70__ICNoteEditorViewController_setNote_delayedForLaunch_successHandler___block_invoke_2;
        v136[3] = &unk_1EA7DD6B8;
        objc_copyWeak(&v137, &location);
        v100 = (void *)MEMORY[0x1E0C80D38];
        dispatch_async(MEMORY[0x1E0C80D38], v136);

        -[ICNoteEditorViewController inkPaletteController](self, "inkPaletteController");
        v101 = (void *)objc_claimAutoreleasedReturnValue();

        if (v101)
          -[ICNoteEditorViewController ensureValidInkForNewDrawingOrNote](self, "ensureValidInkForNewDrawingOrNote");
        -[ICNoteEditorViewController updateDrawingAttachmentsIfNeeded](self, "updateDrawingAttachmentsIfNeeded");
        -[ICNoteEditorViewController showOrHideActivityStreamToolbarIfNeeded](self, "showOrHideActivityStreamToolbarIfNeeded");
        -[ICNoteEditorViewController updatePencilKitPaperStyleType](self, "updatePencilKitPaperStyleType");
        -[ICNoteEditorViewController updateAuthorHighlightsIfNeeded](self, "updateAuthorHighlightsIfNeeded");
        objc_msgSend(v8, "modificationDate");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController setNoteLastModificationDate:](self, "setNoteLastModificationDate:", v102);

        if ((v61 & -[ICNoteEditorViewController shouldTrackNoteViewEventAnalyticsFromSettingNote](self, "shouldTrackNoteViewEventAnalyticsFromSettingNote")) == 1)
        {
          -[ICNoteEditorViewController viewIfLoaded](self, "viewIfLoaded");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "window");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = v104 == 0;

          if (!v105)
          {
            -[ICNoteEditorViewController eventReporter](self, "eventReporter");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v106, "startNoteViewEventDurationTrackingForModernNote:reportCoreAnalytics:", v8, 1);

          }
        }
        -[ICNoteEditorViewController previousNote](self, "previousNote");
        v107 = (void *)objc_claimAutoreleasedReturnValue();

        if (v107)
        {
          v134 = 0u;
          v135 = 0u;
          v132 = 0u;
          v133 = 0u;
          -[ICNoteEditorViewController previousNote](self, "previousNote");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "attachments");
          v109 = (void *)objc_claimAutoreleasedReturnValue();

          v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v132, v143, 16);
          if (v110)
          {
            v111 = *(_QWORD *)v133;
            do
            {
              for (i = 0; i != v110; ++i)
              {
                if (*(_QWORD *)v133 != v111)
                  objc_enumerationMutation(v109);
                v113 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * i);
                if ((objc_msgSend(v113, "hasChanges") & 1) == 0)
                {
                  objc_msgSend(v113, "managedObjectContext");
                  v114 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v114, "ic_refreshObject:mergeChanges:", v113, 0);

                }
              }
              v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v132, v143, 16);
            }
            while (v110);
          }

          -[ICNoteEditorViewController previousNote](self, "previousNote");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          v116 = objc_msgSend(v115, "hasChanges");

          if ((v116 & 1) == 0)
          {
            -[ICNoteEditorViewController previousNote](self, "previousNote");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "managedObjectContext");
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICNoteEditorViewController previousNote](self, "previousNote");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v118, "ic_refreshObject:mergeChanges:", v119, 0);

          }
        }
        if (objc_msgSend(v8, "isPasswordProtected"))
        {
          objc_msgSend(MEMORY[0x1E0D63C18], "sharedController");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "account");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "reaskPasswordForAccountIfNecessary:", v121);

        }
        v122 = objc_msgSend(v8, "isEditable");
        -[ICNoteEditorViewController textView](self, "textView");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "setDisplayingEditableContent:", v122);

        -[ICNoteEditorViewController bluetoothKeyboardHintViewController](self, "bluetoothKeyboardHintViewController");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "hide");

        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[ICNoteEditorViewController updateViewAnnotation](self, "updateViewAnnotation");
        objc_destroyWeak(&v137);
        objc_destroyWeak(&location);

        goto LABEL_119;
      }
    }
    else
    {
      v60 = -[ICNoteEditorBaseViewController viewAppearanceState](self, "viewAppearanceState");
      if (!v8 || v60 < 2)
        goto LABEL_64;
    }
    -[ICNoteEditorViewController noteWillAppear:](self, "noteWillAppear:", v8);
LABEL_59:
    -[ICNoteEditorViewController resetTextViewUndoManager](self, "resetTextViewUndoManager");
    v61 = v8 != 0;
    if (v8)
      v62 = v131 != 0;
    else
      v62 = 0;
    if (v62)
    {
      -[ICNoteEditorViewController donateEditingIntentIfNecessary](self, "donateEditingIntentIfNecessary");
      v61 = 1;
    }
    goto LABEL_65;
  }
  if (-[ICNoteEditorViewController shouldAllowAttributionSidebar](self, "shouldAllowAttributionSidebar"))
  {
    -[ICNoteEditorViewController attributionSidebarView](self, "attributionSidebarView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "reload");

  }
  -[ICNoteEditorViewController setSuspendBarButtonUpdates:](self, "setSuspendBarButtonUpdates:", 0);
  -[ICNoteEditorViewController updateBarButtonsAnimated:](self, "updateBarButtonsAnimated:", -[ICNoteEditorViewController ic_isViewVisible](self, "ic_isViewVisible"));
  -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setIsAnimatingOut:", 0);

  -[ICNoteEditorViewController showOrHidePasswordEntryViewControllerIfNeeded](self, "showOrHidePasswordEntryViewControllerIfNeeded");
LABEL_119:

}

- (void)setSuspendBarButtonUpdates:(BOOL)a3
{
  self->_suspendBarButtonUpdates = a3;
}

- (ICPasswordEntryViewController)passwordEntryViewController
{
  return self->_passwordEntryViewController;
}

- (void)updateBarButtonsAnimated:(BOOL)a3
{
  -[ICNoteEditorViewController updateBarButtonsAnimated:checkIfVisible:](self, "updateBarButtonsAnimated:checkIfVisible:", a3, 1);
}

- (UITapGestureRecognizer)unsupportedNoteTapGestureRecognizer
{
  return self->_unsupportedNoteTapGestureRecognizer;
}

- (ICTextViewController)textViewController
{
  return self->_textViewController;
}

- (void)showOrHidePasswordEntryViewControllerIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
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
  id v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  _BOOL8 v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  _QWORD v85[5];
  id v86;
  id v87;
  _QWORD v88[4];
  id v89;
  _QWORD v90[4];
  id v91;
  id location;

  -[ICNoteEditorBaseViewController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isPasswordProtectedAndLocked") && (objc_msgSend(v3, "isUnsupported") & 1) == 0)
    v5 = objc_msgSend(v3, "hasMissingKeychainItem") ^ 1;
  else
    v5 = 0;

  -[ICNoteEditorBaseViewController note](self, "note");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isPasswordProtected");

  if (!v7)
  {
    -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeFromSuperview");

      -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController removeChildViewController:](self, "removeChildViewController:", v20);

      -[ICNoteEditorViewController setPasswordEntryViewController:](self, "setPasswordEntryViewController:", 0);
      -[ICNoteEditorViewController recreateTextViewIfNecessary](self, "recreateTextViewIfNecessary");
      -[ICNoteEditorViewController textView](self, "textView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setAlpha:", 1.0);

LABEL_45:
      -[ICNoteEditorViewController showOrHideActivityStreamToolbarIfNeeded](self, "showOrHideActivityStreamToolbarIfNeeded");
      -[ICNoteEditorViewController updateBarButtonsAnimated:](self, "updateBarButtonsAnimated:", 1);
      goto LABEL_46;
    }
    -[ICNoteEditorViewController textView](self, "textView");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAlpha:", 1.0);
    goto LABEL_21;
  }
  if (v5)
  {
    -[ICNoteEditorViewController stopTextFindingIfNecessary](self, "stopTextFindingIfNecessary");
    -[ICNoteEditorViewController blockAccessibilityScreenChangedNotificationsIfNecessaryForDuration:](self, "blockAccessibilityScreenChangedNotificationsIfNecessaryForDuration:", 2.0);
    -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isAnimatingOut");

    if (v9)
    {
      -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeFromSuperview");

      -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeFromParentViewController");

      -[ICNoteEditorViewController setPasswordEntryViewController:](self, "setPasswordEntryViewController:", 0);
    }
    -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      goto LABEL_33;
    -[ICNoteEditorViewController presentedViewController](self, "presentedViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[ICNoteEditorViewController presentedViewController](self, "presentedViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "performSelector:", sel_canAppearAbovePasswordEntryView);

      if (v16)
      {
LABEL_28:
        -[ICNoteEditorViewController textView](self, "textView");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "isEditing");

        if (v51)
        {
          -[ICNoteEditorViewController textView](self, "textView");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "endEditing:", 1);

        }
        if (-[ICNoteEditorViewController isEditing](self, "isEditing"))
          -[ICNoteEditorViewController setEditing:animated:](self, "setEditing:animated:", 0, 0);
        v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64CF0]), "initWithNibName:bundle:note:intent:", 0, 0, v3, 0);
        -[ICNoteEditorViewController setPasswordEntryViewController:](self, "setPasswordEntryViewController:", v53);

        -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setMode:", 0);

        objc_initWeak(&location, self);
        v90[0] = MEMORY[0x1E0C809B0];
        v90[1] = 3221225472;
        v90[2] = __75__ICNoteEditorViewController_showOrHidePasswordEntryViewControllerIfNeeded__block_invoke;
        v90[3] = &unk_1EA7DE858;
        objc_copyWeak(&v91, &location);
        -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setPasswordEntryCompletionHandler:", v90);

        -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "view");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setAutoresizingMask:", 18);

        -[ICNoteEditorViewController view](self, "view");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "bounds");
        v60 = v59;
        v62 = v61;
        v64 = v63;
        v66 = v65;
        -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "view");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setFrame:", v60, v62, v64, v66);

        -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController addChildViewController:](self, "addChildViewController:", v69);

        objc_destroyWeak(&v91);
        objc_destroyWeak(&location);
LABEL_33:
        -[ICNoteEditorBaseViewController note](self, "note");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setNote:", v70);

        -[ICNoteEditorViewController backgroundView](self, "backgroundView");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "view");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "addSubviewAboveAllViews:", v74);

        -[ICNoteEditorViewController traitCollection](self, "traitCollection");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v75, "ic_hasCompactWidth") & 1) != 0)
        {
          v76 = 1;
        }
        else
        {
          -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v77, "isAuxiliary") & 1) != 0)
          {
            v76 = 1;
          }
          else if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
          {
            -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = objc_msgSend(v78, "isMainSplitViewDisplayModeSecondaryOnly");

          }
          else
          {
            v76 = 0;
          }

        }
        -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v79, "noteContainerViewMode") == 0;

        -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v81, "noteContainerViewMode") == 1)
          v82 = 1;
        else
          v82 = v76;

        -[ICNoteEditorViewController updateContentViewBezelsStandalone:needsAdditionalBottomMargin:needsAdditionalLeadingMargin:force:](self, "updateContentViewBezelsStandalone:needsAdditionalBottomMargin:needsAdditionalLeadingMargin:force:", v76, v80, v82, 1);
        -[ICNoteEditorViewController view](self, "view");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "layoutIfNeeded");

        -[ICNoteEditorViewController recreateTextView](self, "recreateTextView");
        -[ICNoteEditorViewController textView](self, "textView");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "setHidden:", 1);

        -[ICNoteEditorViewController hideInkPicker](self, "hideInkPicker");
        -[ICNoteEditorViewController updateForceLightContentIfNecessary](self, "updateForceLightContentIfNecessary");
        goto LABEL_45;
      }
    }
    else
    {

    }
    -[ICNoteEditorViewController hideAndDismissPresentedViewController](self, "hideAndDismissPresentedViewController");
    goto LABEL_28;
  }
  -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "note");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorBaseViewController note](self, "note");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24 != v25)
    {
      -[ICNoteEditorViewController recreateTextView](self, "recreateTextView");
      -[ICNoteEditorViewController textView](self, "textView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "layoutIfNeeded");

      if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
      {
        -[ICNoteEditorViewController textView](self, "textView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "layoutManager");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController textView](self, "textView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "textContainer");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "ensureLayoutForTextContainer:", v30);

      }
      -[ICNoteEditorViewController updateTextViewContentInsetsAnimated:](self, "updateTextViewContentInsetsAnimated:", 0);
      -[ICNoteEditorViewController resetTextViewContentOffset](self, "resetTextViewContentOffset");
      -[ICNoteEditorViewController updatePencilKitPaperStyleType](self, "updatePencilKitPaperStyleType");
      -[ICNoteEditorViewController updateBarButtonsAnimated:](self, "updateBarButtonsAnimated:", -[ICNoteEditorViewController ic_isViewVisible](self, "ic_isViewVisible"));
      -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "view");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "removeFromSuperview");

      -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "removeFromParentViewController");

      -[ICNoteEditorViewController setPasswordEntryViewController:](self, "setPasswordEntryViewController:", 0);
      -[ICNoteEditorViewController showOrHideActivityStreamToolbarIfNeeded](self, "showOrHideActivityStreamToolbarIfNeeded");
      goto LABEL_46;
    }
    -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isAnimatingOut");

    if ((v36 & 1) != 0)
      goto LABEL_46;
    -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setIsAnimatingOut:", 1);

    -[ICNoteEditorViewController recreateTextView](self, "recreateTextView");
    -[ICNoteEditorViewController textView](self, "textView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "layoutIfNeeded");

    if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "layoutManager");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController textView](self, "textView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "textContainer");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "ensureLayoutForTextContainer:", v42);

    }
    -[ICNoteEditorViewController updateTextViewContentInsetsAnimated:](self, "updateTextViewContentInsetsAnimated:", 0);
    v43 = *MEMORY[0x1E0C9D538];
    v44 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[ICNoteEditorViewController textView](self, "textView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setContentOffset:", v43, v44);

    -[ICNoteEditorViewController resetTextViewContentOffset](self, "resetTextViewContentOffset");
    -[ICNoteEditorViewController updatePencilKitPaperStyleType](self, "updatePencilKitPaperStyleType");
    -[ICNoteEditorViewController updateBarButtonsAnimated:](self, "updateBarButtonsAnimated:", -[ICNoteEditorViewController ic_isViewVisible](self, "ic_isViewVisible"));
    -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setAlpha:", 0.0);

    v48 = (void *)MEMORY[0x1E0DC3F10];
    v49 = MEMORY[0x1E0C809B0];
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __75__ICNoteEditorViewController_showOrHidePasswordEntryViewControllerIfNeeded__block_invoke_2;
    v88[3] = &unk_1EA7DD2D8;
    v89 = v46;
    v85[0] = v49;
    v85[1] = 3221225472;
    v85[2] = __75__ICNoteEditorViewController_showOrHidePasswordEntryViewControllerIfNeeded__block_invoke_3;
    v85[3] = &unk_1EA7DE880;
    v85[4] = self;
    v86 = v89;
    v87 = v3;
    v34 = v89;
    objc_msgSend(v48, "animateWithDuration:animations:completion:", v88, v85, 0.25);

LABEL_21:
  }
LABEL_46:

}

- (void)updateBarButtonsAnimated:(BOOL)a3 checkIfVisible:(BOOL)a4
{
  void *v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  int v42;
  _BOOL8 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  uint64_t v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  _BOOL8 v55;
  void *v56;
  _BOOL8 v57;
  void *v58;
  void *v59;
  _BOOL8 v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t isKindOfClass;
  void *v70;
  int v71;
  _BOOL8 v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  _BOOL8 v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  _BOOL4 v87;
  void *v88;
  int v89;
  uint64_t v90;
  void *v91;
  int v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  _BOOL8 v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  int v108;
  int v109;
  int v110;
  int v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  int v124;
  uint64_t v125;
  void *v126;
  void *v127;
  int v128;
  uint64_t v129;
  void *v130;
  void *v131;
  int v132;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  char v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  void *v141;
  _BOOL4 v142;
  _BOOL8 v143;
  void *v144;
  void *v145;
  _BOOL4 v146;
  int v147;
  _BOOL4 v148;
  void *v149;
  void *v150;
  id v151;
  id v152;
  _BOOL4 v153;

  v5 = a3;
  if ((!a4
     || -[ICNoteEditorViewController _appearState](self, "_appearState") != 3
     && -[ICNoteEditorViewController _appearState](self, "_appearState"))
    && !-[ICNoteEditorViewController suspendBarButtonUpdates](self, "suspendBarButtonUpdates"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[ICNoteEditorViewController collaborationButtons_updateCollaborationStateIfNeeded](self, "collaborationButtons_updateCollaborationStateIfNeeded");
    -[ICNoteEditorBaseViewController note](self, "note");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = v5;
    if (objc_msgSend(v7, "isEditable"))
    {
      -[ICNoteEditorBaseViewController note](self, "note");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "folder");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "supportsEditingNotes"))
      {
        -[ICNoteEditorViewController invitation](self, "invitation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = 0;
        }
        else
        {
          -[ICNoteEditorBaseViewController note](self, "note");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v11, "isPasswordProtectedAndLocked") & 1) != 0)
          {
            v10 = 0;
          }
          else
          {
            -[ICNoteEditorBaseViewController note](self, "note");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v12, "isUnsupported") & 1) != 0)
            {
              v10 = 0;
            }
            else
            {
              -[ICNoteEditorViewController unsupportedNoteView](self, "unsupportedNoteView");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = v13 == 0;

            }
          }

        }
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

    -[ICNoteEditorViewController textStorage](self, "textStorage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "selectedRange");
    if ((objc_msgSend(v14, "ic_containsBlockAttachmentsInRange:", v16, v17) & 1) != 0)
    {
      v18 = 0;
    }
    else
    {
      -[ICNoteEditorViewController auxiliaryResponder](self, "auxiliaryResponder");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        v18 = 0;
      else
        v18 = v10;

    }
    -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "canToggleTodo") & 1) != 0)
    {
      v146 = 1;
      goto LABEL_41;
    }
    -[ICNoteEditorViewController textView](self, "textView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isFirstResponder");
    if ((v22 & 1) != 0
      || (-[ICNoteEditorViewController auxiliaryResponder](self, "auxiliaryResponder"),
          (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "ic_canChangeStyle"))
      {
        -[ICNoteEditorViewController auxiliaryResponder](self, "auxiliaryResponder");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v146 = v24 == 0;

        if ((v22 & 1) != 0)
          goto LABEL_40;
      }
      else
      {

        v146 = 0;
        if ((v22 & 1) != 0)
          goto LABEL_40;
      }
    }
    else
    {
      v146 = 1;
    }

LABEL_40:
LABEL_41:

    -[ICNoteEditorViewController textView](self, "textView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "ic_shouldEnableBlockQuoteForAttachmentsOnlySelection");

    if ((v26 & 1) != 0)
    {
      v27 = 1;
    }
    else
    {
      -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v28, "canStyleText") & 1) != 0)
      {
        v27 = 1;
      }
      else
      {
        -[ICNoteEditorViewController textView](self, "textView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v29, "ic_canChangeStyle");

      }
    }
    -[ICNoteEditorBaseViewController note](self, "note");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v31 = 1;
    }
    else
    {
      -[ICNoteEditorViewController invitation](self, "invitation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v32 != 0;

    }
    if (objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode"))
    {
      objc_msgSend(MEMORY[0x1E0DC3958], "sharedInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v147 = objc_msgSend(v33, "isMinimized");

    }
    else
    {
      v147 = 0;
    }
    -[ICNoteEditorViewController traitCollection](self, "traitCollection");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "ic_hasCompactWidth");

    v36 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
    v37 = v36 ^ 1u;
    LODWORD(v150) = v35;
    if ((v36 & 1) == 0 && (v35 & 1) == 0)
      v37 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isiPhone");
    v149 = (void *)-[ICNoteEditorViewController ic_behavior](self, "ic_behavior");
    v38 = (void *)ICAccessibilityAccessibilityLargerTextSizesEnabled();
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setAccessibilityTextSizeEnabled:", v38);

    v40 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
    LODWORD(v151) = v27;
    v148 = v31;
    v41 = v10;
    if (v40)
    {
      -[ICNoteEditorBaseViewController note](self, "note");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v42 = 0;
        v43 = 1;
      }
      else
      {
        -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v145, "selectedContainerItemID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v38 != 0;
        v42 = 1;
      }
    }
    else
    {
      v42 = 0;
      v43 = 0;
    }
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setCanShowPillOrnament:", v43);

    if (v42)
    {

    }
    if (v40)

    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setCompact:", v37);

    -[ICNoteEditorBaseViewController note](self, "note");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v46, "isDeletedOrInTrash");
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setDeleted:", v47);

    v49 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
    if (v49)
    {
      -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v47, "canTilePrimaryContent") ^ 1;
    }
    else
    {
      v50 = 0;
    }
    v51 = v41;
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setHidesBackButton:", v50);

    if (v49)
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setHidesDefaultCenterItems:", v149 == (void *)1);

    -[ICNoteEditorViewController ic_windowScene](self, "ic_windowScene");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (unint64_t)(objc_msgSend(v54, "interfaceOrientation") - 3) < 2;
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setLandscape:", v55);

    v57 = -[ICNoteEditorBaseViewController isEditingOnSecureScreen](self, "isEditingOnSecureScreen");
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setInSecureScreen:", v57);

    -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "proposedMainSplitViewControllerDisplayMode") == 4;
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setInTripleColumnSplitView:", v60);

    v62 = objc_msgSend(MEMORY[0x1E0DC3938], "ic_isInFloatingKeyboardMode");
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setKeyboardFloating:", v62);

    if ((objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") & 1) != 0)
      v64 = 0;
    else
      v64 = -[ICNoteEditorViewController isEditingOnSystemPaperOnPhone](self, "isEditingOnSystemPaperOnPhone") ^ 1;
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setShowsDoneWhileEditing:", v64);

    if (v149 == (void *)1)
      v66 = v150 ^ 1;
    else
      v66 = 0;
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setShowsSidebarButton:", v66);

    -[ICNoteEditorViewController auxiliaryResponder](self, "auxiliaryResponder");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setTableSelected:", isKindOfClass & 1);

    v71 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
    if (v71)
    {
      -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
      isKindOfClass = objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend((id)isKindOfClass, "noteContainerViewMode") == 1;
    }
    else
    {
      v72 = 0;
    }
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setUsesCustomBackButton:", v72);

    if (v71)
    v74 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isLargeiPad") & (v147 ^ 1);
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setUsesOnlyTrailingInputAssistantItems:", v74);

    v76 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setUsesPillOrnament:", v76);

    v78 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setUsesSidecarMenu:", v78);

    v80 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setUsesStyleMenu:", v80);

    v82 = (-[ICNoteEditorViewController isEditing](self, "isEditing") & 1) != 0
       || -[ICNoteEditorViewController didEndEditingForAddingImageAttachment](self, "didEndEditingForAddingImageAttachment");
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setEditing:", v82);

    if (-[ICNoteEditorViewController isInkPickerShowing](self, "isInkPickerShowing"))
    {
      -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v84;
      v86 = 3;
    }
    else if (-[ICNoteEditorViewController isDrawingStrokeWithPencil](self, "isDrawingStrokeWithPencil"))
    {
      -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v84;
      v86 = 1;
    }
    else
    {
      v87 = -[ICNoteEditorViewController didDrawWithPencilWithoutPalette](self, "didDrawWithPencilWithoutPalette");
      -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v84;
      if (v87)
        v86 = 2;
      else
        v86 = 0;
    }
    objc_msgSend(v84, "setInlineSketchEditingState:", v86);

    -[ICNoteEditorViewController firstResponder](self, "firstResponder");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v89 = objc_opt_isKindOfClass();

    v90 = ((-[ICNoteEditorViewController isSplitViewExpandingOrCollapsing](self, "isSplitViewExpandingOrCollapsing") | v18) ^ 1) & v89;
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setEditingTable:", v90);

    v92 = v89 ^ 1;
    v93 = (v146 & v41 | !v148) & (v89 ^ 1u);
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setCanAddChecklist:", v93);

    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setCanAddMedia:", v41 | !v148);

    -[ICNoteEditorBaseViewController note](self, "note");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v96, "isEmpty");
    if ((v97 & 1) != 0)
    {
      v98 = 0;
    }
    else
    {
      -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_msgSend(v95, "canAddNewNoteToSelectedContainers");
    }
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setCanAddNote:", v98);

    if ((v97 & 1) == 0)
    v100 = v151;
    if ((v18 & 1) != 0)
    {
      v101 = 1;
    }
    else
    {
      -[ICNoteEditorViewController auxiliaryResponder](self, "auxiliaryResponder");
      v97 = objc_claimAutoreleasedReturnValue();
      v101 = v97 != 0;
    }
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setCanAddTable:", v101);

    if ((v18 & 1) == 0)
    if ((v151 & v51) == 1)
      v103 = -[ICNoteEditorViewController isEditing](self, "isEditing") & v92;
    else
      v103 = 0;
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "setCanChangeStyle:", v103);

    v105 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") ^ 1;
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "setCanCustomizeCenterItems:", v105);

    -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v107
      || (-[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController"),
          v151 = (id)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v151, "isAnimatingOut")))
    {
      -[ICNoteEditorViewController invitationViewController](self, "invitationViewController");
      v113 = objc_claimAutoreleasedReturnValue();
      if (v113)
      {
        v100 = v113;
        v109 = 0;
        v110 = 0;
        v111 = 0;
        v112 = 0;
        v108 = 1;
      }
      else
      {
        -[ICNoteEditorViewController unsupportedNoteView](self, "unsupportedNoteView");
        v114 = objc_claimAutoreleasedReturnValue();
        if (v114)
        {
          v102 = (void *)v114;
          v100 = 0;
          v110 = 0;
          v111 = 0;
          v112 = 0;
          v108 = 1;
          v109 = 1;
        }
        else
        {
          -[ICNoteEditorBaseViewController note](self, "note");
          v115 = objc_claimAutoreleasedReturnValue();
          if (v115)
          {
            v150 = (void *)v115;
            -[ICNoteEditorBaseViewController note](self, "note");
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            v112 = objc_msgSend(v149, "isEditable");
            v100 = 0;
            v102 = 0;
            v108 = 1;
            v109 = 1;
            v110 = 1;
            v111 = 1;
          }
          else
          {
            v100 = 0;
            v102 = 0;
            v150 = 0;
            v111 = 0;
            v108 = 1;
            v109 = 1;
            v110 = 1;
            v112 = 1;
          }
        }
      }
    }
    else
    {
      v108 = 0;
      v109 = 0;
      v110 = 0;
      v111 = 0;
      v112 = 0;
    }
    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "setCanInlineSketch:", v112);

    if (v111)
    if (v110)
    {

      if (!v109)
        goto LABEL_118;
    }
    else if (!v109)
    {
LABEL_118:
      if (v108)
        goto LABEL_119;
      goto LABEL_123;
    }

    if (v108)
    {
LABEL_119:

      if (!v107)
      {
LABEL_125:

        -[ICNoteEditorBaseViewController note](self, "note");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = objc_msgSend(v117, "isEmpty") ^ 1;
        -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "setCanSaveQuickNote:", v118);

        -[ICNoteEditorViewController invitation](self, "invitation");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        if (v120)
        {
          v121 = 0;
        }
        else
        {
          -[ICNoteEditorBaseViewController note](self, "note");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v121 = objc_msgSend(v117, "isSharable");
        }
        -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "setCanShare:", v121);

        if (!v120)
        -[ICNoteEditorBaseViewController note](self, "note");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v124 = objc_msgSend(v123, "isEditable");
        if (v124)
        {
          -[ICNoteEditorViewController textView](self, "textView");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "undoManager");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v125 = objc_msgSend(v117, "canRedo");
        }
        else
        {
          v125 = 0;
        }
        -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "setCanRedo:", v125);

        if (v124)
        {

        }
        -[ICNoteEditorBaseViewController note](self, "note");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v128 = objc_msgSend(v127, "isEditable");
        if (v128)
        {
          -[ICNoteEditorViewController textView](self, "textView");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "undoManager");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v129 = objc_msgSend(v117, "canUndo");
        }
        else
        {
          v129 = 0;
        }
        -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "setCanUndo:", v129);

        if (v128)
        {

        }
        -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        v132 = objc_msgSend(v131, "isAuxiliary");

        if (v132)
        {
          if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
            v133 = 2;
          else
            v133 = 1;
        }
        else
        {
          v133 = 0;
        }
        -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "setAuxiliaryWindowType:", v133);

        -[ICNoteEditorBaseViewController note](self, "note");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v135, "isPasswordProtected"))
        {
          -[ICNoteEditorBaseViewController note](self, "note");
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          v137 = objc_msgSend(v136, "isUnsupported");

          if ((v137 & 1) != 0)
          {
            v138 = 0;
LABEL_153:
            -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v139, "setLockState:", v138);

            if (-[ICNoteEditorViewController isEditingOnSystemPaperOnPhone](self, "isEditingOnSystemPaperOnPhone"))
              v140 = 2;
            else
              v140 = -[ICNoteEditorViewController isEditingOnSystemPaperOnPad](self, "isEditingOnSystemPaperOnPad");
            -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v141, "setQuickNoteType:", v140);

            v142 = -[ICNoteEditorViewController hasMadeEdits](self, "hasMadeEdits");
            v143 = v138 != 1 && v142;
            -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v144, "setCanShowUndoRedo:", v143);

            -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
            v152 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v152, "updateAnimated:", v153);

            return;
          }
          -[ICNoteEditorBaseViewController note](self, "note");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v135, "isAuthenticated"))
            v138 = 2;
          else
            v138 = 1;
        }
        else
        {
          v138 = 0;
        }

        goto LABEL_153;
      }
LABEL_124:

      goto LABEL_125;
    }
LABEL_123:
    if (!v107)
      goto LABEL_125;
    goto LABEL_124;
  }
}

- (ICNoteEditorNavigationItemConfiguration)navigationItemConfiguration
{
  return self->_navigationItemConfiguration;
}

- (BOOL)shouldAllowAttributionSidebar
{
  void *v3;
  _BOOL4 v4;

  -[ICNoteEditorBaseViewController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isSharedViaICloud")
    && !-[ICNoteEditorBaseViewController isEditingOnSystemPaper](self, "isEditingOnSystemPaper"))
  {
    v4 = !-[ICNoteEditorBaseViewController isEditingOnSecureScreen](self, "isEditingOnSecureScreen");
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

+ (id)editorViewControllerWithIdentifier:(int64_t)a3 options:(unint64_t)a4
{
  int IsTextKit2Enabled;
  __objc2_class **v7;

  IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  v7 = off_1EA7DB750;
  if (!IsTextKit2Enabled)
    v7 = &off_1EA7DB5E8;
  return (id)objc_msgSend(objc_alloc(*v7), "initWithIdentifier:options:", a3, a4);
}

- (ICNoteEditorViewController)initWithIdentifier:(int64_t)a3 options:(unint64_t)a4
{
  char v4;
  ICNoteEditorViewController *v5;
  ICAttributionSidebarController *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *savedScrollStates;
  objc_super v12;

  v4 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICNoteEditorViewController;
  v5 = -[ICNoteEditorBaseViewController initWithIdentifier:options:nibName:bundle:](&v12, sel_initWithIdentifier_options_nibName_bundle_, a3, a4, 0, 0);
  if (v5)
  {
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v6 = (ICAttributionSidebarController *)objc_claimAutoreleasedReturnValue();
      v7 = 1656;
    }
    else
    {
      v6 = objc_alloc_init(ICAttributionSidebarController);
      v7 = 1192;
    }
    v8 = *(Class *)((char *)&v5->super.super.super.super.super.isa + v7);
    *(Class *)((char *)&v5->super.super.super.super.super.isa + v7) = (Class)v6;

    v5->_canShowLinkBar = (v4 & 2) != 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    savedScrollStates = v5->_savedScrollStates;
    v5->_savedScrollStates = (NSMutableDictionary *)v9;

    v5->_needsInitialBarConfiguration = 1;
    -[ICNoteEditorViewController registerForTraitChanges](v5, "registerForTraitChanges");
  }
  return v5;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  _QWORD v4[10];
  _QWORD v5[11];

  v5[10] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    v4[0] = &unk_1EA821C10;
    v4[1] = &unk_1EA821C40;
    v5[0] = &unk_1EA821C28;
    v5[1] = &unk_1EA821C58;
    v4[2] = &unk_1EA821C70;
    v4[3] = &unk_1EA821CA0;
    v5[2] = &unk_1EA821C88;
    v5[3] = &unk_1EA821CB8;
    v4[4] = &unk_1EA821CD0;
    v4[5] = &unk_1EA821D00;
    v5[4] = &unk_1EA821CE8;
    v5[5] = &unk_1EA821D18;
    v4[6] = &unk_1EA821D30;
    v4[7] = &unk_1EA821D60;
    v5[6] = &unk_1EA821D48;
    v5[7] = &unk_1EA821C58;
    v4[8] = &unk_1EA821D78;
    v4[9] = &unk_1EA821DA8;
    v5[8] = &unk_1EA821D90;
    v5[9] = &unk_1EA821DC0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 10);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)topoTextStylesToAnalyticsStyles;
    topoTextStylesToAnalyticsStyles = v2;

  }
}

- (void)setInvitation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  ICInvitationViewController *v10;
  void *v11;
  void *v12;
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
  uint64_t v36;
  id v37;
  id v38;
  id buf[2];

  v4 = a3;
  -[ICNoteEditorViewController invitation](self, "invitation");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    objc_msgSend(v4, "shareURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1DD7B0000, v7, OS_LOG_TYPE_INFO, "The invitation was likely dismissed/deleted causing the shareURL to be empty. This is an invalid state, and the invitation will be removed from the editor.", (uint8_t *)buf, 2u);
      }

      v4 = 0;
    }
    objc_storeStrong((id *)&self->_invitation, v4);
    if (v4)
    {
      -[ICNoteEditorViewController setNote:](self, "setNote:", 0);
      -[ICNoteEditorViewController textView](self, "textView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHidden:", 1);

      -[ICNoteEditorViewController invitationViewController](self, "invitationViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = objc_alloc_init(ICInvitationViewController);
        -[ICNoteEditorViewController setInvitationViewController:](self, "setInvitationViewController:", v10);

        -[ICNoteEditorViewController invitationViewController](self, "invitationViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setAutoresizingMask:", 18);

        -[ICNoteEditorViewController view](self, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "bounds");
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;
        -[ICNoteEditorViewController invitationViewController](self, "invitationViewController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "view");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setFrame:", v15, v17, v19, v21);

        -[ICNoteEditorViewController invitationViewController](self, "invitationViewController");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController addChildViewController:](self, "addChildViewController:", v24);

        -[ICNoteEditorViewController backgroundView](self, "backgroundView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController invitationViewController](self, "invitationViewController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "view");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addSubviewAboveAllViews:", v27);

      }
      objc_initWeak(buf, self);
      -[ICNoteEditorViewController invitationViewController](self, "invitationViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setInvitation:", v4);

      objc_msgSend(v4, "highlight");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController invitationViewController](self, "invitationViewController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setHighlight:", v29);

      -[ICNoteEditorViewController invitationViewController](self, "invitationViewController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setShowsActivityIndicator:", 0);

      v36 = MEMORY[0x1E0C809B0];
      objc_copyWeak(&v38, buf);
      v37 = v4;
      -[ICNoteEditorViewController invitationViewController](self, "invitationViewController", v36, 3221225472, __44__ICNoteEditorViewController_setInvitation___block_invoke, &unk_1EA7DDD98);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setDidTapViewButton:", &v36);

      objc_destroyWeak(&v38);
      objc_destroyWeak(buf);
    }
    else
    {
      -[ICNoteEditorViewController invitationViewController](self, "invitationViewController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "view");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "removeFromSuperview");

      -[ICNoteEditorViewController invitationViewController](self, "invitationViewController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController removeChildViewController:](self, "removeChildViewController:", v35);

      -[ICNoteEditorViewController setInvitationViewController:](self, "setInvitationViewController:", 0);
      -[ICNoteEditorViewController recreateTextViewIfNecessary](self, "recreateTextViewIfNecessary");
    }
    -[ICNoteEditorViewController updateBarButtonsAnimated:](self, "updateBarButtonsAnimated:", 1);
    -[ICNoteEditorViewController showOrHideActivityStreamToolbarIfNeeded](self, "showOrHideActivityStreamToolbarIfNeeded");
    -[ICNoteEditorViewController updateForceLightContentIfNecessary](self, "updateForceLightContentIfNecessary");
    -[ICNoteEditorViewController updateActionMenu](self, "updateActionMenu");
  }

}

- (ICInvitation)invitation
{
  return self->_invitation;
}

void __70__ICNoteEditorViewController_setNote_delayedForLaunch_successHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "note");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHandwritingRecognitionEnabled:", 1);

  objc_msgSend(WeakRetained, "note");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(WeakRetained, "note");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "previousNote");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 != v5)
    {
      objc_msgSend(WeakRetained, "previousNote");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setHandwritingRecognitionEnabled:", 0);

    }
  }
  objc_msgSend(WeakRetained, "handwritingDebugPresenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "refresh");

}

void __66__ICNoteEditorViewController_updateTextViewContentInsetsAnimated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentInset:", v2, v3, v4, v5);

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    v7 = *(double *)(a1 + 72);
    v8 = *(double *)(a1 + 80);
    v9 = *(double *)(a1 + 88);
    v10 = *(double *)(a1 + 96);
    objc_msgSend(*(id *)(a1 + 32), "textView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setVerticalScrollIndicatorInsets:", v7, v8, v9, v10);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  objc_super v24;
  uint8_t buf[4];
  _BYTE v26[10];
  _DWORD v27[2];
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v26 = "-[ICNoteEditorViewController viewWillAppear:]";
    *(_WORD *)&v26[8] = 1024;
    v27[0] = 1347;
    _os_log_impl(&dword_1DD7B0000, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v24.receiver = self;
  v24.super_class = (Class)ICNoteEditorViewController;
  -[ICNoteEditorBaseViewController viewWillAppear:](&v24, sel_viewWillAppear_, v3);
  -[ICNoteEditorViewController setNeedsInitialBarConfiguration:](self, "setNeedsInitialBarConfiguration:", 1);
  -[ICNoteEditorViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

  -[ICNoteEditorViewController updatePencilKitPaperStyleType](self, "updatePencilKitPaperStyleType");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_audioPlaybackPlayNotification_, *MEMORY[0x1E0D648C0], 0);
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_notesContextRefreshNotification_, *MEMORY[0x1E0D63860], 0);
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_viewControllerWillStartEditModeNotification_, CFSTR("ICViewControllerWillStartEditModeNotification"), 0);
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_migrationStateDidChange_, *MEMORY[0x1E0D640D0], 0);
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_keyboardDidShow_, *MEMORY[0x1E0DC4E70], 0);
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_keyboardDidHide_, *MEMORY[0x1E0DC4E68], 0);
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_keyboardDidChangeFrame_, *MEMORY[0x1E0DC4E60], 0);
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_noteWillBeDeleted_, *MEMORY[0x1E0D63820], 0);
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_noteWillBeDeleted_, *MEMORY[0x1E0D63808], 0);
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    -[ICNoteEditorViewController applyScrollStateIfAvailable](self, "applyScrollStateIfAvailable");
  -[ICNoteEditorViewController transitionCoordinator](self, "transitionCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ICNoteEditorViewController transitionCoordinator](self, "transitionCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __45__ICNoteEditorViewController_viewWillAppear___block_invoke;
    v23[3] = &unk_1EA7DD1E8;
    v23[4] = self;
    objc_msgSend(v9, "animateAlongsideTransition:completion:", v23, 0);

  }
  else
  {
    -[ICNoteEditorViewController updateForceLightContentIfNecessary](self, "updateForceLightContentIfNecessary");
  }
  if (-[ICNoteEditorViewController userWantsToSeeDateLabel](self, "userWantsToSeeDateLabel"))
  {
    -[ICNoteEditorViewController setUserWantsToSeeDateLabel:](self, "setUserWantsToSeeDateLabel:", 1);
  }
  else
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController setUserWantsToSeeDateLabel:](self, "setUserWantsToSeeDateLabel:", objc_msgSend(v10, "isSharedAndEmpty"));

  }
  v11 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = -[ICNoteEditorViewController userWantsToSeeDateLabel](self, "userWantsToSeeDateLabel");
    -[ICNoteEditorBaseViewController note](self, "note");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isSharedAndEmpty");
    -[ICNoteEditorViewController textView](self, "textView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v26 = v12;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = v14;
    LOWORD(v27[0]) = 1024;
    *(_DWORD *)((char *)v27 + 2) = v16 != 0;
    _os_log_impl(&dword_1DD7B0000, v11, OS_LOG_TYPE_INFO, "wants to see date label: %d shared and empty: %d, has window: %d", buf, 0x14u);

  }
  if (-[ICNoteEditorViewController userWantsToSeeDateLabel](self, "userWantsToSeeDateLabel"))
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      -[ICNoteEditorViewController updateTextViewContentOffset](self, "updateTextViewContentOffset");
  }
  -[ICNoteEditorBaseViewController note](self, "note");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "needsRefresh");

  if (v20)
    -[ICNoteEditorViewController fetchAll](self, "fetchAll");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICNoteEditorViewController link_addCreateNoteInteraction](self, "link_addCreateNoteInteraction");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICNoteEditorViewController link_addSetParagraphStyleInteraction](self, "link_addSetParagraphStyleInteraction");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICNoteEditorViewController link_addInsertNoteLinkInteraction](self, "link_addInsertNoteLinkInteraction");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICNoteEditorViewController link_addReplaceSelectionInteraction](self, "link_addReplaceSelectionInteraction");
  -[ICNoteEditorBaseViewController note](self, "note");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController noteWillAppear:](self, "noteWillAppear:", v22);

  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICNoteEditorViewController;
  -[ICNoteEditorViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v9, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if (a3)
  {
    -[ICNoteEditorViewController updateForceLightContentIfNecessary](self, "updateForceLightContentIfNecessary");
    -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isAuxiliary");
    -[ICNoteEditorViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidesBackButton:", v7);

    if (ICInternalSettingsIsTextKit2Enabled())
      -[ICNoteEditorViewController applyScrollStateIfAvailable](self, "applyScrollStateIfAvailable");
  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[ICNoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[ICNoteEditorViewController setSuspendBarButtonUpdates:](self, "setSuspendBarButtonUpdates:", -[ICNoteEditorViewController needsInitialBarConfiguration](self, "needsInitialBarConfiguration"));
    -[ICNoteEditorViewController recreateTextViewIfNecessary](self, "recreateTextViewIfNecessary");
    -[ICNoteEditorViewController setSuspendBarButtonUpdates:](self, "setSuspendBarButtonUpdates:", 0);
  }
  -[ICNoteEditorViewController updateBottomContentPadding](self, "updateBottomContentPadding");
  if (-[ICNoteEditorViewController shouldResetTextViewContentOffsetWhenAppearing](self, "shouldResetTextViewContentOffsetWhenAppearing"))
  {
    -[ICNoteEditorViewController updateTextViewContentInsetsAnimated:](self, "updateTextViewContentInsetsAnimated:", 0);
    if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    {
      -[ICNoteEditorViewController resetTextViewContentOffset](self, "resetTextViewContentOffset");
      -[ICNoteEditorViewController textViewController](self, "textViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "applyInitialScrollState");

    }
  }
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0
    && -[ICNoteEditorViewController _appearState](self, "_appearState") == 1)
  {
    -[ICNoteEditorViewController applyScrollStateIfAvailable](self, "applyScrollStateIfAvailable");
  }
  if (-[ICNoteEditorViewController needsInitialBarConfiguration](self, "needsInitialBarConfiguration"))
  {
    -[ICNoteEditorViewController setNeedsInitialBarConfiguration:](self, "setNeedsInitialBarConfiguration:", 0);
    -[ICNoteEditorViewController resetBarButtonsAnimated:checkIfVisible:](self, "resetBarButtonsAnimated:checkIfVisible:", 0, 0);
  }
  v6.receiver = self;
  v6.super_class = (Class)ICNoteEditorViewController;
  -[ICScrollViewDelegateViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateHostedNotesAppearance");

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICNoteEditorViewController ppt_noteEditorDidLayoutSubviews](self, "ppt_noteEditorDidLayoutSubviews");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  ICNoteEditorViewController *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  void *v45;
  id v46;
  id location;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD block[5];
  objc_super v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v53.receiver = self;
  v53.super_class = (Class)ICNoteEditorViewController;
  -[ICNoteEditorBaseViewController viewDidAppear:](&v53, sel_viewDidAppear_, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICNoteEditorViewController collaboration_setupActivityItemsConfigurationProvider](self, "collaboration_setupActivityItemsConfigurationProvider");
  else
    -[ICNoteEditorViewController setActivityItemsConfigurationProvider:](self, "setActivityItemsConfigurationProvider:", 0);
  -[ICNoteEditorViewController activityItemsConfigurationProvider](self, "activityItemsConfigurationProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActivityItemsConfigurationSource:", v4);

  -[ICNoteEditorViewController setShouldTrackNoteViewEventAnalyticsFromSettingNote:](self, "setShouldTrackNoteViewEventAnalyticsFromSettingNote:", 1);
  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[ICNoteEditorViewController shouldFireNoteViewEventOnViewDisappear](self, "shouldFireNoteViewEventOnViewDisappear");

    if (!v9)
    {
      -[ICNoteEditorViewController eventReporter](self, "eventReporter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorBaseViewController note](self, "note");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "startNoteViewEventDurationTrackingForModernNote:reportCoreAnalytics:", v11, 1);

      -[ICNoteEditorViewController setShouldFireNoteViewEventOnViewDisappear:](self, "setShouldFireNoteViewEventOnViewDisappear:", 1);
    }
  }
  if (-[ICNoteEditorViewController updateContentSizeCategoryWhenVisible](self, "updateContentSizeCategoryWhenVisible"))
  {
    -[ICNoteEditorViewController setUpdateContentSizeCategoryWhenVisible:](self, "setUpdateContentSizeCategoryWhenVisible:", 0);
    -[ICNoteEditorViewController contentSizeCategoryDidChange](self, "contentSizeCategoryDidChange");
  }
  v12 = self;
  -[ICNoteEditorViewController view](v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  -[ICNoteEditorViewController updateFormatToolbarLayoutWithSize:](v12, "updateFormatToolbarLayoutWithSize:", v14, v15);

  -[ICNoteEditorViewController textViewInputAccessoryView](v12, "textViewInputAccessoryView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController view](v12, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  objc_msgSend(v16, "updateLayoutWithSize:", v18, v19);

  -[ICNoteEditorViewController setShouldResetTextViewContentOffsetWhenAppearing:](v12, "setShouldResetTextViewContentOffsetWhenAppearing:", 0);
  if (-[ICNoteEditorViewController startEditingAfterViewAppears](v12, "startEditingAfterViewAppears"))
  {
    -[ICNoteEditorViewController startEditing](v12, "startEditing");
    -[ICNoteEditorViewController setStartEditingAfterViewAppears:](v12, "setStartEditingAfterViewAppears:", 0);
  }
  if (-[ICNoteEditorViewController showInkPickerAfterViewAppears](v12, "showInkPickerAfterViewAppears"))
  {
    -[ICNoteEditorViewController presentedViewController](v12, "presentedViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20 == 0;

    if (v21)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __44__ICNoteEditorViewController_viewDidAppear___block_invoke;
      block[3] = &unk_1EA7DD2D8;
      block[4] = v12;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    -[ICNoteEditorViewController setShowInkPickerAfterViewAppears:](v12, "setShowInkPickerAfterViewAppears:", 0);
  }
  if (-[ICNoteEditorViewController showInsertUIAfterViewAppears](v12, "showInsertUIAfterViewAppears"))
  {
    -[ICNoteEditorViewController showInsertUIWithPreferredSourceType:](v12, "showInsertUIWithPreferredSourceType:", 1);
    -[ICNoteEditorViewController setShowInsertUIAfterViewAppears:](v12, "setShowInsertUIAfterViewAppears:", 0);
  }
  if (-[ICNoteEditorViewController addToDoListAfterViewAppears](v12, "addToDoListAfterViewAppears"))
  {
    -[ICNoteEditorViewController addTodoListAtEndOfNote](v12, "addTodoListAtEndOfNote");
    -[ICNoteEditorViewController setAddToDoListAfterViewAppears:](v12, "setAddToDoListAfterViewAppears:", 0);
  }
  if (-[ICNoteEditorViewController addDocumentScanAfterViewAppears](v12, "addDocumentScanAfterViewAppears"))
  {
    -[ICNoteEditorViewController showInsertUIWithPreferredSourceType:](v12, "showInsertUIWithPreferredSourceType:", 4);
    -[ICNoteEditorViewController setAddDocumentScanAfterViewAppears:](v12, "setAddDocumentScanAfterViewAppears:", 0);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICNoteEditorViewController ppt_didFinishExtendedLaunch](v12, "ppt_didFinishExtendedLaunch");
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObserver:selector:name:object:", v12, sel_systemPaperLinkBarVisibilityPreferenceChanged_, CFSTR("ICShouldQuickNoteLinksBarDefaultsChangedNotification"), 0);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICNoteEditorViewController ppt_didShowNoteEditor](v12, "ppt_didShowNoteEditor");
  -[ICNoteEditorViewController updateTextViewContentInsetsAnimated:](v12, "updateTextViewContentInsetsAnimated:", 1);
  -[ICNoteEditorViewController passwordEntryViewController](v12, "passwordEntryViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setIsAnimatingOut:", 0);

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0
    && -[ICNoteEditorViewController wasWindowlessDuringTransitionToSize](v12, "wasWindowlessDuringTransitionToSize"))
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    -[ICNoteEditorBaseViewController note](v12, "note");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "textStorage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "layoutManagers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v49;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v49 != v28)
            objc_enumerationMutation(v26);
          v30 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v29);
          v31 = -[ICNoteEditorViewController visibleRange](v12, "visibleRange");
          v33 = v32;
          objc_msgSend(v30, "invalidateLayoutForCharacterRange:actualCharacterRange:", v31, v32, 0);
          objc_msgSend(v30, "invalidateDisplayForCharacterRange:", v31, v33);
          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      }
      while (v27);
    }

    -[ICNoteEditorViewController setWasWindowlessDuringTransitionToSize:](v12, "setWasWindowlessDuringTransitionToSize:", 0);
  }
  -[ICNoteEditorViewController updateBarButtonsAnimated:](v12, "updateBarButtonsAnimated:", 0);
  -[ICNoteEditorViewController view](v12, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "window");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    if (objc_msgSend(MEMORY[0x1E0D641E0], "deviceSupportsPencil")
      && (objc_msgSend(MEMORY[0x1E0D641E0], "deviceSupportsFirstGenPencil") & 1) == 0)
    {
      objc_initWeak(&location, v12);
      v42 = MEMORY[0x1E0C809B0];
      v43 = 3221225472;
      v44 = __44__ICNoteEditorViewController_viewDidAppear___block_invoke_2;
      v45 = &unk_1EA7DD6B8;
      objc_copyWeak(&v46, &location);
      dispatchMainAfterDelay();
      objc_destroyWeak(&v46);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v36 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[ICNoteEditorViewController viewDidAppear:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults", v42, v43, v44, v45);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v37, "BOOLForKey:", *MEMORY[0x1E0D649F8]))
    -[ICNoteEditorViewController showHandwritingDebug:](v12, "showHandwritingDebug:", 1);
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    -[ICNoteEditorViewController applyScrollStateIfAvailable](v12, "applyScrollStateIfAvailable");
  -[ICNoteEditorViewController setArchivedScrollStateToApply:](v12, "setArchivedScrollStateToApply:", 0);
  -[ICNoteEditorViewController setShouldOverscrollScrollState:](v12, "setShouldOverscrollScrollState:", 0);
  -[ICNoteEditorBaseViewController note](v12, "note");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[ICNoteEditorBaseViewController note](v12, "note");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorBaseViewController noteDidAppear:](v12, "noteDidAppear:", v39);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[ICNoteEditorBaseViewController note](v12, "note");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController performSelector:withObject:](v12, "performSelector:withObject:", sel_updateFastSyncParticipantCursorsForNote_, v40);

    }
  }
  -[ICNoteEditorViewController viewControllerManager](v12, "viewControllerManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setSelectedNewNoteShortcutItem:", 0);

}

- (ICViewControllerManager)viewControllerManager
{
  return (ICViewControllerManager *)objc_loadWeakRetained((id *)&self->_viewControllerManager);
}

- (BOOL)userWantsToSeeDateLabel
{
  return self->_userWantsToSeeDateLabel;
}

- (BOOL)useInputViewForStyleSelector
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "horizontalSizeClass") == 1)
  {
    LOBYTE(v4) = 1;
  }
  else if (objc_msgSend(v3, "userInterfaceIdiom") == 1)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") ^ 1;
  }

  return v4;
}

- (void)updateUnsupportedNoteView
{
  void *v3;
  void *v4;
  int v5;
  ICUnsupportedNoteView *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  ICUnsupportedNoteView *v12;
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
  _QWORD v33[4];
  id v34;
  id location;
  _QWORD v36[4];

  v36[3] = *MEMORY[0x1E0C80C00];
  -[ICNoteEditorViewController unsupportedNoteView](self, "unsupportedNoteView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[ICNoteEditorViewController setUnsupportedNoteView:](self, "setUnsupportedNoteView:", 0);
  -[ICNoteEditorBaseViewController note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isUnsupported");

  if (v5)
  {
    v6 = -[ICUnsupportedNoteView initWithReason:]([ICUnsupportedNoteView alloc], "initWithReason:", 0);
    -[ICNoteEditorViewController setUnsupportedNoteView:](self, "setUnsupportedNoteView:", v6);

    -[ICNoteEditorViewController unsupportedNoteView](self, "unsupportedNoteView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUserInteractionEnabled:", 0);

  }
  -[ICNoteEditorBaseViewController note](self, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "canAuthenticate"))
  {

  }
  else
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hasMissingKeychainItem");

    if (v10)
    {
      -[ICNoteEditorBaseViewController note](self, "note");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, v11);

      v12 = -[ICUnsupportedNoteView initWithReason:]([ICUnsupportedNoteView alloc], "initWithReason:", 1);
      -[ICNoteEditorViewController setUnsupportedNoteView:](self, "setUnsupportedNoteView:", v12);

      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __55__ICNoteEditorViewController_updateUnsupportedNoteView__block_invoke;
      v33[3] = &unk_1EA7DD6B8;
      objc_copyWeak(&v34, &location);
      -[ICNoteEditorViewController unsupportedNoteView](self, "unsupportedNoteView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDidTapActionButton:", v33);

      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
    }
  }
  -[ICNoteEditorViewController unsupportedNoteView](self, "unsupportedNoteView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", 1);

    -[ICNoteEditorViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController unsupportedNoteView](self, "unsupportedNoteView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v17);

    v28 = (void *)MEMORY[0x1E0CB3718];
    -[ICNoteEditorViewController unsupportedNoteView](self, "unsupportedNoteView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "centerXAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "centerXAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v18;
    -[ICNoteEditorViewController unsupportedNoteView](self, "unsupportedNoteView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v23;
    -[ICNoteEditorViewController unsupportedNoteView](self, "unsupportedNoteView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "widthAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintLessThanOrEqualToConstant:", 310.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v27);

  }
}

- (void)updateTextViewContentInsetsAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
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
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  _QWORD v50[13];

  v3 = a3;
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentInset");
  v7 = v6;
  v49 = v8;

  -[ICNoteEditorViewController textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "verticalScrollIndicatorInsets");
  v11 = v10;
  v48 = v12;

  -[ICNoteEditorViewController textViewTopInsetThatWeWant](self, "textViewTopInsetThatWeWant");
  v14 = v13;
  -[ICNoteEditorViewController textViewBottomInsetThatWeWant](self, "textViewBottomInsetThatWeWant");
  v16 = v15;
  -[ICNoteEditorViewController textViewScrollIndicatorInsetsThatWeWant](self, "textViewScrollIndicatorInsetsThatWeWant");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  if (-[ICNoteEditorViewController userWantsToSeeDateLabel](self, "userWantsToSeeDateLabel"))
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dateView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "preferredHeight");
    v47 = v18;
    v27 = v16;
    v28 = v14;
    v29 = v11;
    v30 = v22;
    v31 = v7;
    v32 = v20;
    v33 = v24;
    v35 = v34;
    -[ICNoteEditorViewController textView](self, "textView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "userTitleView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "preferredHeight");
    v39 = v35 + v38;
    v24 = v33;
    v20 = v32;
    v7 = v31;
    v22 = v30;
    v11 = v29;
    v14 = v28;
    v16 = v27;
    v18 = v47 - v39;

  }
  -[ICNoteEditorViewController textView](self, "textView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "compatibilityBannerView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "compatibilityBannerView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "preferredHeight");
    v18 = v18 - v44;

  }
  if (vabdd_f64(v49, v16) >= 0.00999999978
    || vabdd_f64(v7, v14) >= 0.00999999978
    || vabdd_f64(v48, v22) >= 0.00999999978
    || vabdd_f64(v11, v18) >= 0.00999999978)
  {
    if (v3)
    {
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __66__ICNoteEditorViewController_updateTextViewContentInsetsAnimated___block_invoke;
      v50[3] = &unk_1EA7DE440;
      v50[4] = self;
      *(double *)&v50[5] = v14;
      v50[6] = 0;
      *(double *)&v50[7] = v16;
      v50[8] = 0;
      *(double *)&v50[9] = v18;
      *(double *)&v50[10] = v20;
      *(double *)&v50[11] = v22;
      *(double *)&v50[12] = v24;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v50, 0, 0.25, 0.0);
    }
    else
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setContentInset:", v14, 0.0, v16, 0.0);

      if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
      {
        -[ICNoteEditorViewController textView](self, "textView");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setVerticalScrollIndicatorInsets:", v18, v20, v22, v24);

      }
    }
  }
  -[ICNoteEditorViewController updateBottomContentPadding](self, "updateBottomContentPadding");
}

- (void)updateTextViewBackground
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  if (-[ICNoteEditorViewController ic_isViewVisible](self, "ic_isViewVisible"))
  {
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      if (!objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "ic_noteEditorBackgroundColor");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController view](self, "view");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setBackgroundColor:", v10);
LABEL_10:

        return;
      }
      -[ICNoteEditorViewController textView](self, "textView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setBackgroundColor:", 0);

      objc_msgSend(MEMORY[0x1E0DC3658], "ic_noteEditorBackgroundColor");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController backgroundView](self, "backgroundView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contentView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = v10;
LABEL_9:
      objc_msgSend(v5, "setBackgroundColor:", v7);

      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "ic_noteEditorBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textViewController](self, "textViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v8);

    if ((objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") & 1) == 0)
    {
      -[ICNoteEditorViewController textViewController](self, "textViewController");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "backgroundColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = v4;
      goto LABEL_9;
    }
  }
}

- (void)updatePencilKitPaperStyleType
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = (void *)MEMORY[0x1E0D64CE8];
  -[ICNoteEditorBaseViewController note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "linedPaperWithPaperStyleType:", (int)objc_msgSend(v4, "paperStyleType"));
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[ICNoteEditorViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");

    if ((v7 & 1) == 0)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0DC3E70]);
      objc_msgSend(v8, "configureWithTransparentBackground");
      -[ICNoteEditorViewController dynamicBarColor](self, "dynamicBarColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBackgroundColor:", v9);

      -[ICNoteEditorViewController navigationController](self, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "toolbar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setScrollEdgeAppearance:", v8);

      -[ICNoteEditorViewController navigationController](self, "navigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "toolbar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setCompactScrollEdgeAppearance:", v8);

    }
  }
  -[ICNoteEditorViewController textView](self, "textView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLinedPaper:", v15);

}

- (ICSelectorDelayer)updateNoteUserActivityStateDelayer
{
  ICSelectorDelayer *updateNoteUserActivityStateDelayer;
  ICSelectorDelayer *v4;
  ICSelectorDelayer *v5;

  updateNoteUserActivityStateDelayer = self->_updateNoteUserActivityStateDelayer;
  if (!updateNoteUserActivityStateDelayer)
  {
    v4 = (ICSelectorDelayer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64268]), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", self, sel_updateNoteUserActivityState, 1, 1, 1.0);
    v5 = self->_updateNoteUserActivityStateDelayer;
    self->_updateNoteUserActivityStateDelayer = v4;

    updateNoteUserActivityStateDelayer = self->_updateNoteUserActivityStateDelayer;
  }
  return updateNoteUserActivityStateDelayer;
}

- (void)updateFormatToolbarLayoutWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  uint64_t v7;
  id v8;

  height = a3.height;
  width = a3.width;
  -[ICNoteEditorViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (!v7)
  {
    -[ICNoteEditorViewController textViewInputAccessoryView](self, "textViewInputAccessoryView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateLayoutWithSize:", width, height);

  }
}

- (void)updateDrawingAttachmentsIfNeeded
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D64BE8], "sharedConverter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertDrawingsInNoteIfNeeded:", v3);

}

- (void)updateDataOwnerForCopyAndPaste
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[ICNoteEditorBaseViewController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isManaged"))
    v5 = 2;
  else
    v5 = 1;

  -[ICNoteEditorViewController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setDataOwnerForCopy:", v5);

  -[ICNoteEditorViewController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setDataOwnerForPaste:", v5);

  -[ICNoteEditorViewController textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setDragDataOwner:", v5);

  -[ICNoteEditorViewController textView](self, "textView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setDropDataOwner:", v5);

}

- (BOOL)updateContentSizeCategoryWhenVisible
{
  return self->_updateContentSizeCategoryWhenVisible;
}

- (void)updateBottomContentPadding
{
  void *v3;
  char v4;
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
  void *v16;
  double v17;
  double v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  -[ICNoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTransitioningToNewSize");

  if ((v4 & 1) == 0)
  {
    -[ICNoteEditorViewController backgroundView](self, "backgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    -[ICNoteEditorViewController ic_safeAreaDistanceFromTop](self, "ic_safeAreaDistanceFromTop");
    v10 = v8 - v9;

    -[ICNoteEditorViewController textViewBottomInsetThatWeWant](self, "textViewBottomInsetThatWeWant");
    v12 = v10 - (v11 + 0.0 + 70.0);
    -[ICNoteEditorViewController textViewBottomPaddingVisibleRatio](self, "textViewBottomPaddingVisibleRatio");
    v14 = v13 * v12;
    -[ICNoteEditorViewController textView](self, "textView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomContentPadding");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "targetValue");
    v18 = vabdd_f64(v17, v14);

    if (v18 >= 0.00999999978)
    {
      v19 = objc_msgSend(MEMORY[0x1E0D64270], "BOOLForKey:", *MEMORY[0x1E0D64408]);
      -[ICNoteEditorViewController textView](self, "textView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bottomContentPadding");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setMode:", v19);

      -[ICNoteEditorViewController textView](self, "textView");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bottomContentPadding");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setTargetValue:", v14);

    }
  }
}

- (void)updateBarButtons
{
  -[ICNoteEditorViewController updateBarButtonsAnimated:](self, "updateBarButtonsAnimated:", 0);
}

- (void)updateAuthorHighlightsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  -[ICNoteEditorBaseViewController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorageWithoutCreating");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ICNoteEditorViewController textController](self, "textController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "authorHighlightsController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "ic_range");
    objc_msgSend(v5, "performHighlightUpdatesForRange:inTextStorage:updates:", v6, v7, v8, 0);

  }
}

- (void)updateActionMenu
{
  void *v3;
  void *v4;
  char v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[ICNoteEditorBaseViewController isEditingOnSystemPaper](self, "isEditingOnSystemPaper"))
    return;
  -[ICNoteEditorViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return;
  -[ICNoteEditorViewController invitationViewController](self, "invitationViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isDeletedOrInTrash");

    if ((v5 & 1) == 0)
    {
      -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "createDeferredActionMenuElementForEditorViewController:", self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 1;
      goto LABEL_8;
    }
  }
  v6 = 0;
  v7 = 0;
LABEL_8:
  -[ICNoteEditorViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAdditionalOverflowItems:", v7);

  if (v6)
  {

  }
  -[ICNoteEditorViewController navigationItem](self, "navigationItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutSubviews");

}

- (ICUnsupportedNoteView)unsupportedNoteView
{
  return self->_unsupportedNoteView;
}

- (double)textViewTopInsetThatWeWant
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;

  v3 = 0.0;
  if ((objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") & 1) == 0 && (ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    -[ICNoteEditorViewController ic_safeAreaDistanceFromTop](self, "ic_safeAreaDistanceFromTop");
    v3 = v4;
  }
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "compatibilityBannerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "compatibilityBannerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredHeight");
    v3 = v3 + v9;

  }
  if (-[ICNoteEditorViewController userWantsToSeeDateLabel](self, "userWantsToSeeDateLabel"))
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredHeight");
    v13 = v12;
    -[ICNoteEditorViewController textView](self, "textView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "userTitleView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferredHeight");
    v3 = v3 + v13 + v16;

  }
  -[ICNoteEditorViewController audioBarViewController](self, "audioBarViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[ICNoteEditorViewController audioBarViewController](self, "audioBarViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "height");
    v3 = v3 + v19;

  }
  if (self->_paperLinkBarShowing)
  {
    +[ICSystemPaperConstants linkBarHeight](ICSystemPaperConstants, "linkBarHeight");
    return v3 + v20;
  }
  return v3;
}

- (double)textViewScrollIndicatorBottomInsetOverride
{
  return self->_textViewScrollIndicatorBottomInsetOverride;
}

- (ICNoteEditorInputAccessoryView)textViewInputAccessoryView
{
  return self->_textViewInputAccessoryView;
}

- (double)textViewBottomPaddingVisibleRatio
{
  double v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = 1.0;
  if ((-[ICNoteEditorViewController isEditing](self, "isEditing") & 1) == 0)
  {
    -[ICNoteEditorViewController textStorage](self, "textStorage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    v3 = 0.5;
    if (v5)
    {
      -[ICNoteEditorViewController textStorage](self, "textStorage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "string");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "invertedSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "rangeOfCharacterFromSet:options:", v9, 4);

      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_opt_class();
        -[ICNoteEditorViewController textStorage](self, "textStorage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], v10, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          return 0.9;
        else
          return 0.5;
      }
    }
  }
  return v3;
}

- (double)textViewBottomInsetThatWeWant
{
  double result;

  -[ICNoteEditorViewController textViewBottomInsetThatWeWantForEditing:](self, "textViewBottomInsetThatWeWantForEditing:", -[ICNoteEditorViewController isEditing](self, "isEditing"));
  return result;
}

- (double)textViewBottomInsetThatWeWantForEditing:(BOOL)a3
{
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;

  -[ICNoteEditorViewController textViewScrollIndicatorInsetsThatWeWant](self, "textViewScrollIndicatorInsetsThatWeWant");
  v6 = v5;
  if (a3)
  {
    if (-[ICNoteEditorViewController isShowingMiniPlayer](self, "isShowingMiniPlayer"))
      v6 = v6 + 70.0;
    if ((objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode") & 1) == 0)
    {
      -[ICNoteEditorViewController textViewInputAccessoryView](self, "textViewInputAccessoryView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ICNoteEditorViewController isSelecting](self, "isSelecting")
        && v7
        && (objc_msgSend(v7, "buttonsVisible") & 1) == 0)
      {
        -[ICNoteEditorViewController inputAccessoryViewHeight](self, "inputAccessoryViewHeight");
        v6 = v6 - v8;
      }
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLForKey:", *MEMORY[0x1E0D643E8]);

      if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0 && (v10 & 1) == 0)
      {
        -[ICNoteEditorBaseViewController note](self, "note");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "textStorage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v12, "length");
        if (v13)
        {
          v14 = v13;
          objc_msgSend(v12, "string");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v14 - 1;
          v17 = objc_msgSend(v15, "characterAtIndex:", v16);

          objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v17) = objc_msgSend(v18, "characterIsMember:", v17);

          if ((_DWORD)v17)
          {
            -[ICNoteEditorViewController textView](self, "textView");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "selectedRange");
            v22 = v21;

            if (!v22 && v20 == v16)
            {
              -[ICNoteEditorViewController textView](self, "textView");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "layoutManager");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "extraLineFragmentRect");
              v6 = v6 - v25;

            }
          }
        }

      }
    }
  }
  else if (v5 < 0.0)
  {
    return 0.0;
  }
  return v6;
}

- (BOOL)suspendBarButtonUpdates
{
  return self->_suspendBarButtonUpdates;
}

- (BOOL)styleSelectorInputViewShowing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[ICNoteEditorViewController styleSelectorDummyInputView](self, "styleSelectorDummyInputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == v5)
  {
    v8 = 1;
  }
  else
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v3 == v7;

  }
  return v8;
}

- (UIView)styleSelectorDummyInputView
{
  UIView *styleSelectorDummyInputView;
  id v4;
  UIView *v5;
  UIView *v6;

  styleSelectorDummyInputView = self->_styleSelectorDummyInputView;
  if (!styleSelectorDummyInputView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC38B0]);
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:inputViewStyle:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_styleSelectorDummyInputView;
    self->_styleSelectorDummyInputView = v5;

    -[UIView setUserInteractionEnabled:](self->_styleSelectorDummyInputView, "setUserInteractionEnabled:", 0);
    styleSelectorDummyInputView = self->_styleSelectorDummyInputView;
  }
  return styleSelectorDummyInputView;
}

- (ICStyleSelectorViewController)styleSelectorController
{
  return self->_styleSelectorController;
}

- (BOOL)startEditingAfterViewAppears
{
  return self->_startEditingAfterViewAppears;
}

- (void)showStyleSelectorInputView:(BOOL)a3 animated:(BOOL)a4 doneEditing:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
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
  _QWORD v29[4];
  id v30;
  _QWORD v31[2];

  v5 = a3;
  v31[1] = *MEMORY[0x1E0C80C00];
  -[ICNoteEditorViewController setIsLoadingStyleSelectorInputView:](self, "setIsLoadingStyleSelectorInputView:", 1, a4, a5);
  if (-[ICNoteEditorViewController styleSelectorInputViewShowing](self, "styleSelectorInputViewShowing") != v5)
  {
    -[ICNoteEditorViewController setSuspendBarButtonUpdates:](self, "setSuspendBarButtonUpdates:", 1);
    -[ICNoteEditorViewController setSuspendSelectedRangeUpdates:](self, "setSuspendSelectedRangeUpdates:", 1);
    -[ICNoteEditorViewController textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "typingAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[ICNoteEditorViewController noteFormattingControllerCreateIfNecessary](self, "noteFormattingControllerCreateIfNecessary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "presentationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)MEMORY[0x1E0DC3C78];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __78__ICNoteEditorViewController_showStyleSelectorInputView_animated_doneEditing___block_invoke;
        v29[3] = &unk_1EA7DE638;
        v30 = v9;
        v12 = v10;
        objc_msgSend(v11, "customDetentWithIdentifier:resolver:", CFSTR("compactStyleSelector"), v29);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setDetents:", v14);

        objc_msgSend(v12, "setPrefersEdgeAttachedInCompactHeight:", 1);
        objc_msgSend(v12, "setLargestUndimmedDetentIdentifier:", CFSTR("compactStyleSelector"));
        objc_msgSend(v12, "_setShouldDismissWhenTappedOutside:", 0);

      }
      objc_msgSend(v9, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHidden:", 0);

      -[ICNoteEditorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
      -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICNoteEditorViewController styleSelectorDummyInputView](self, "styleSelectorDummyInputView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setInputView:", v17);

        -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setInputAccessoryView:", 0);
      }
      else
      {
        -[ICNoteEditorViewController textView](self, "textView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setInputView:", v17);

        -[ICNoteEditorViewController textView](self, "textView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setInputAccessoryView:", 0);

        -[ICNoteEditorViewController textView](self, "textView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "reloadInputViews");
      }

    }
    else
    {
      -[ICNoteEditorViewController noteFormattingController](self, "noteFormattingController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dismissViewControllerAnimated:completion:", 1, 0);

      -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        -[ICNoteEditorViewController textView](self, "textView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setInputView:", 0);

        -[ICNoteEditorViewController textViewInputAccessoryView](self, "textViewInputAccessoryView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController textView](self, "textView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setInputAccessoryView:", v27);

        -[ICNoteEditorViewController textView](self, "textView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "reloadInputViews");
        goto LABEL_12;
      }
      -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setInputView:", 0);

      -[ICNoteEditorViewController textViewInputAccessoryView](self, "textViewInputAccessoryView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setInputAccessoryView:", v9);
    }

LABEL_12:
    -[ICNoteEditorViewController textView](self, "textView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTypingAttributes:", v8);

    -[ICNoteEditorViewController setSuspendBarButtonUpdates:](self, "setSuspendBarButtonUpdates:", 0);
    -[ICNoteEditorViewController setSuspendSelectedRangeUpdates:](self, "setSuspendSelectedRangeUpdates:", 0);

  }
  -[ICNoteEditorViewController setIsLoadingStyleSelectorInputView:](self, "setIsLoadingStyleSelectorInputView:", 0);
}

- (void)showStyleSelector:(BOOL)a3 animated:(BOOL)a4 sender:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  v10 = a5;
  if (v6)
  {
    -[ICNoteEditorViewController noteFormattingControllerCreateIfNecessary](self, "noteFormattingControllerCreateIfNecessary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateWithDataSource:ignoreTypingAttributes:", self, 0);

  }
  if (-[ICNoteEditorViewController useInputViewForStyleSelector](self, "useInputViewForStyleSelector"))
  {
    -[ICNoteEditorViewController showStyleSelectorInputView:animated:doneEditing:](self, "showStyleSelectorInputView:animated:doneEditing:", v6, v5, 0);
  }
  else
  {
    -[ICNoteEditorViewController showStyleSelectorPopover:animated:sender:](self, "showStyleSelectorPopover:animated:sender:", v6, v5, v10);
    -[ICNoteEditorViewController styleSelectorController](self, "styleSelectorController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setElementForAXFocusOnDismissal:", v10);

  }
}

- (void)showStyleSelector:(BOOL)a3 animated:(BOOL)a4
{
  -[ICNoteEditorViewController showStyleSelector:animated:sender:](self, "showStyleSelector:animated:sender:", a3, a4, 0);
}

- (void)showOrHideLockIconCoverViewControllerIfNeededIsBackgrounding:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
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
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") & 1) != 0)
    return;
  if (v3)
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isPasswordProtected") & 1) != 0)
    {
      -[ICNoteEditorBaseViewController note](self, "note");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isAuthenticated");

      if (v7)
      {
        if (!-[ICNoteEditorViewController styleSelectorInputViewShowing](self, "styleSelectorInputViewShowing"))
        {
          -[ICNoteEditorViewController visualAssetImportController](self, "visualAssetImportController");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "isShowing");

          if ((v9 & 1) == 0)
          {
            -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "currentAttachmentPresenter");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "dismissAnimated:completion:", 0, 0);

            -[ICNoteEditorViewController hideAndDismissPresentedViewController](self, "hideAndDismissPresentedViewController");
          }
        }
        -[ICNoteEditorViewController lockIconCoverViewController](self, "lockIconCoverViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          -[ICNoteEditorViewController lockIconCoverViewController](self, "lockIconCoverViewController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "view");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeFromSuperview");

          -[ICNoteEditorViewController setLockIconCoverViewController:](self, "setLockIconCoverViewController:", 0);
        }
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64CF0]), "initWithNibName:bundle:note:intent:", 0, 0, 0, 0);
        -[ICNoteEditorViewController setLockIconCoverViewController:](self, "setLockIconCoverViewController:", v15);

        -[ICNoteEditorViewController lockIconCoverViewController](self, "lockIconCoverViewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setMode:", 1);

        -[ICNoteEditorViewController lockIconCoverViewController](self, "lockIconCoverViewController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setAutoresizingMask:", 18);

        -[ICNoteEditorViewController view](self, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "bounds");
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;
        -[ICNoteEditorViewController lockIconCoverViewController](self, "lockIconCoverViewController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "view");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setFrame:", v21, v23, v25, v27);

        -[ICNoteEditorViewController view](self, "view");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController lockIconCoverViewController](self, "lockIconCoverViewController");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "view");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addSubview:", v32);

        if (ICInternalSettingsIsTextKit2Enabled())
        {
          -[ICNoteEditorViewController view](self, "view");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICNoteEditorViewController lockIconCoverViewController](self, "lockIconCoverViewController");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "view");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "bringSubviewToFront:", v35);

        }
        if (-[ICNoteEditorViewController isEditing](self, "isEditing"))
        {
          -[ICNoteEditorViewController textView](self, "textView");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "hidePrediction");

          if ((v37 & 1) == 0)
          {
            -[ICNoteEditorViewController textView](self, "textView");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "setHidePrediction:", 1);

            objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
            v48 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "textInputTraitsDidChange");

          }
        }
        return;
      }
    }
    else
    {

    }
  }
  -[ICNoteEditorViewController lockIconCoverViewController](self, "lockIconCoverViewController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39)
  {
    v41 = (void *)MEMORY[0x1E0DC3F10];
    v42 = MEMORY[0x1E0C809B0];
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __91__ICNoteEditorViewController_showOrHideLockIconCoverViewControllerIfNeededIsBackgrounding___block_invoke;
    v51[3] = &unk_1EA7DD2D8;
    v52 = v39;
    v49[0] = v42;
    v49[1] = 3221225472;
    v49[2] = __91__ICNoteEditorViewController_showOrHideLockIconCoverViewControllerIfNeededIsBackgrounding___block_invoke_2;
    v49[3] = &unk_1EA7DE700;
    v50 = v52;
    objc_msgSend(v41, "animateWithDuration:animations:completion:", v51, v49, 0.5);

  }
  -[ICNoteEditorViewController textView](self, "textView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "hidePrediction");

  if (v44)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setHidePrediction:", 0);

    -[ICNoteEditorViewController textView](self, "textView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v45) = objc_msgSend(v46, "isEditing");

    if ((_DWORD)v45)
    {
      objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "textInputTraitsDidChange");

    }
  }

}

- (void)showOrHideActivityStreamToolbarIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ICNoteEditorViewController activityStreamToolbar](self, "activityStreamToolbar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICNoteEditorViewController navigationController](self, "navigationController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController activityStreamToolbar](self, "activityStreamToolbar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bringSubviewToFront:", v5);

  }
}

- (BOOL)showInsertUIAfterViewAppears
{
  return self->_showInsertUIAfterViewAppears;
}

- (BOOL)shouldTrackNoteViewEventAnalyticsFromSettingNote
{
  return self->_shouldTrackNoteViewEventAnalyticsFromSettingNote;
}

- (BOOL)shouldResetTextViewContentOffsetWhenAppearing
{
  return self->_shouldResetTextViewContentOffsetWhenAppearing;
}

- (BOOL)shouldLockTextViewContentOffset
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  if (-[ICNoteEditorViewController isDrawingStroke](self, "isDrawingStroke"))
    return 1;
  -[ICNoteEditorViewController dateOfLastStrokeOrNewDrawing](self, "dateOfLastStrokeOrNewDrawing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController dateOfLastStrokeOrNewDrawing](self, "dateOfLastStrokeOrNewDrawing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  return v7 < 0.1;
}

- (BOOL)shouldForceLightContent
{
  void *v2;
  char v3;

  -[ICNoteEditorBaseViewController note](self, "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "prefersLightBackground") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(MEMORY[0x1E0DC3E88], "ic_alwaysShowLightContent");

  return v3;
}

- (void)setVisualAssetImportController:(id)a3
{
  objc_storeStrong((id *)&self->_visualAssetImportController, a3);
}

- (void)setUserWantsToSeeDateLabel:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  self->_userWantsToSeeDateLabel = a3;
  if (!a3)
  {
    if (-[ICNoteEditorViewController usesCustomTransition](self, "usesCustomTransition"))
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dateView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAlpha:", 0.0);

      -[ICNoteEditorViewController textView](self, "textView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userTitleView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAlpha:", 0.0);

    }
  }
}

- (void)setUnsupportedNoteView:(id)a3
{
  objc_storeStrong((id *)&self->_unsupportedNoteView, a3);
}

- (void)setTextViewInputAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_textViewInputAccessoryView, a3);
}

- (void)setSwipeGestureRecognizers:(id)a3
{
  objc_storeStrong((id *)&self->_swipeGestureRecognizers, a3);
}

- (void)setStyleSelectorController:(id)a3
{
  objc_storeStrong((id *)&self->_styleSelectorController, a3);
}

- (void)setShouldTrackNoteViewEventAnalyticsFromSettingNote:(BOOL)a3
{
  self->_shouldTrackNoteViewEventAnalyticsFromSettingNote = a3;
}

- (void)setShouldResetTextViewContentOffsetWhenAppearing:(BOOL)a3
{
  self->_shouldResetTextViewContentOffsetWhenAppearing = a3;
}

- (void)setShouldOverscrollScrollState:(BOOL)a3
{
  self->_shouldOverscrollScrollState = a3;
}

- (void)setPreviousNote:(id)a3
{
  objc_storeWeak((id *)&self->_previousNote, a3);
}

- (void)setOriginalEndOfNote:(id)a3
{
  objc_storeStrong((id *)&self->_originalEndOfNote, a3);
}

- (void)setNoteUserActivityState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1296);
}

- (void)setNoteUserActivity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1288);
}

- (void)setNoteLastModificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1640);
}

- (void)setNoteAndFolderChangeController:(id)a3
{
  objc_storeStrong((id *)&self->_noteAndFolderChangeController, a3);
}

- (void)setNote:(uint64_t)a1 delayedForLaunch:(void *)a2 successHandler:.cold.1(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "shortLoggingDescription");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1DD7B0000, v3, v4, "Setting note on editor %p: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_0();
}

- (void)setNeedsStatusBarAppearanceUpdate
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICNoteEditorViewController;
  -[ICNoteEditorViewController setNeedsStatusBarAppearanceUpdate](&v4, sel_setNeedsStatusBarAppearanceUpdate);
  -[ICNoteEditorViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsStatusBarAppearanceUpdate");

}

- (void)setNeedsInitialBarConfiguration:(BOOL)a3
{
  self->_needsInitialBarConfiguration = a3;
}

- (void)setNavigationItemConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_navigationItemConfiguration, a3);
}

- (void)setMentionsController:(id)a3
{
  objc_storeStrong((id *)&self->_mentionsController, a3);
}

- (void)setLinkAcceleratorController:(id)a3
{
  objc_storeStrong((id *)&self->_linkAcceleratorController, a3);
}

- (void)setLastSelectedRange:(_NSRange)a3
{
  self->_lastSelectedRange = a3;
}

- (void)setIsLoadingStyleSelectorInputView:(BOOL)a3
{
  self->_isLoadingStyleSelectorInputView = a3;
}

- (void)setIsEditingNewNote:(BOOL)a3
{
  self->_isEditingNewNote = a3;
}

- (void)setHashtagController:(id)a3
{
  objc_storeStrong((id *)&self->_hashtagController, a3);
}

- (void)setHasMadeEdits:(BOOL)a3
{
  self->_hasMadeEdits = a3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  objc_super v20;

  v4 = a4;
  v5 = a3;
  if (a3)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "canBecomeFirstResponder"))
    {

    }
    else
    {
      v8 = -[ICNoteEditorViewController isSettingEditing](self, "isSettingEditing");

      if (!v8)
        return;
    }
  }
  if (-[ICNoteEditorViewController isEditing](self, "isEditing") != v5)
  {
    -[ICNoteEditorViewController setIsSettingEditing:](self, "setIsSettingEditing:", 1);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:", CFSTR("ICViewControllerWillStartEditModeNotification"), self);

      -[ICNoteEditorViewController textView](self, "textView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "isFirstResponder"))
      {
        -[ICNoteEditorViewController auxiliaryResponder](self, "auxiliaryResponder");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isFirstResponder");

        if ((v12 & 1) == 0)
          -[ICNoteEditorViewController startEditing](self, "startEditing");
        goto LABEL_15;
      }
    }
    else
    {
      -[ICNoteEditorViewController auxiliaryResponder](self, "auxiliaryResponder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isFirstResponder");

      if (v14)
      {
        -[ICNoteEditorViewController auxiliaryResponder](self, "auxiliaryResponder");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "resignFirstResponder");

      }
      -[ICNoteEditorViewController textView](self, "textView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isFirstResponder");

      if (!v17)
        goto LABEL_15;
      -[ICNoteEditorViewController textView](self, "textView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "resignFirstResponder");
    }

LABEL_15:
    -[ICNoteEditorViewController showStyleSelectorInputView:animated:doneEditing:](self, "showStyleSelectorInputView:animated:doneEditing:", 0, 1, 1);
    v20.receiver = self;
    v20.super_class = (Class)ICNoteEditorViewController;
    -[ICNoteEditorViewController setEditing:animated:](&v20, sel_setEditing_animated_, v5, v4);
    -[ICNoteEditorViewController setIsSettingEditing:](self, "setIsSettingEditing:", 0);
    -[ICNoteEditorViewController showOrHideSearchPatternHighlightsIfNecessary](self, "showOrHideSearchPatternHighlightsIfNecessary");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "postNotificationName:object:", CFSTR("ICNoteEditorViewControllerSelectionDidChangeNotification"), self);

    -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setEditing:", v5);

  }
}

- (void)setDidDrawWithPencilWithoutPalette:(BOOL)a3
{
  self->_didDrawWithPencilWithoutPalette = a3;
}

- (void)setCollaborationButtonsController:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationButtonsController, a3);
}

- (void)setCollaborationBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationBarButtonItem, a3);
}

- (void)setAuthorHighlightsUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_authorHighlightsUpdater, a3);
}

- (void)setAuthorHighlightsController:(id)a3
{
  objc_storeStrong((id *)&self->_authorHighlightsController, a3);
}

- (void)setAttachmentInsertionController:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentInsertionController, a3);
}

- (void)setArchivedScrollStateToApply:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  ICTextViewScrollState *v8;
  void *v9;
  void *v10;
  void *v11;
  ICTextViewScrollState *v12;
  _QWORD v13[4];
  ICTextViewScrollState *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  v21 = 0;
  objc_msgSend(v5, "note");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__ICNoteEditorViewController_setArchivedScrollStateToApply___block_invoke;
  v13[3] = &unk_1EA7DE5C8;
  v15 = &v16;
  v8 = (ICTextViewScrollState *)v5;
  v14 = v8;
  objc_msgSend(v7, "performBlockAndWait:", v13);

  -[ICNoteEditorViewController savedScrollStates](self, "savedScrollStates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ic_removeObjectForNonNilKey:", v17[5]);

  if (self->_archivedScrollStateToApply != v8)
  {
    objc_storeStrong((id *)&self->_archivedScrollStateToApply, a3);
    if (-[ICNoteEditorViewController ic_isViewVisible](self, "ic_isViewVisible"))
    {
      -[ICNoteEditorBaseViewController note](self, "note");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTextViewScrollState note](self->_archivedScrollStateToApply, "note");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 == v11)
      {
        -[ICNoteEditorViewController applyScrollStateIfAvailable](self, "applyScrollStateIfAvailable");
        if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
        {
          v12 = v8;
          dispatchMainAfterDelay();

        }
      }
    }
  }

  _Block_object_dispose(&v16, 8);
}

- (void)setActivityItemsConfigurationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_activityItemsConfigurationProvider, a3);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  -[ICNoteEditorViewController textView](self, "textView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v20;
  if (v4 == v20)
  {
    -[ICNoteEditorViewController backgroundView](self, "backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "contentOffset");
    objc_msgSend(v6, "scrollView:didChangeContentOffset:", v20);

    if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "shouldUpdateVisibleSupplementalViewsInLayoutSubviews");

      if ((v8 & 1) == 0)
      {
        objc_opt_class();
        -[ICNoteEditorViewController textView](self, "textView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "layoutManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "updateVisibleSupplementalViews");
        objc_msgSend(v11, "ensureLayoutForSurroundingPages");

      }
    }
    -[ICNoteEditorViewController updateUserAndDateViewVisibility](self, "updateUserAndDateViewVisibility");
    -[ICNoteEditorViewController linkAcceleratorController](self, "linkAcceleratorController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isShowing");

    if (v13)
    {
      -[ICNoteEditorViewController linkAcceleratorController](self, "linkAcceleratorController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hideAccelerator");

    }
    -[ICNoteEditorViewController calculateScrubberController](self, "calculateScrubberController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isShowing");

    if (v16)
    {
      -[ICNoteEditorViewController calculateScrubberController](self, "calculateScrubberController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hideScrubber");

    }
    -[ICNoteEditorViewController audioAttachmentEditorCoordinator](self, "audioAttachmentEditorCoordinator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textViewDidScroll:", v19);

    v5 = v20;
  }

}

- (void)sceneDidActivate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id location;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController viewIfLoaded](self, "viewIfLoaded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqual:", v8);

  if (!v9)
    goto LABEL_13;
  -[ICNoteEditorBaseViewController note](self, "note");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isPasswordProtected"))
  {
    -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "selectedNoteObjectID");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "selectedNoteObjectID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorBaseViewController note](self, "note");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v15, "isEqual:", v17);

      if ((v18 & 1) != 0)
        goto LABEL_8;
      -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "selectedModernNote");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController setNote:](self, "setNote:", v11);
    }

  }
LABEL_8:
  -[ICNoteEditorViewController showOrHideLockIconCoverViewControllerIfNeededIsBackgrounding:](self, "showOrHideLockIconCoverViewControllerIfNeededIsBackgrounding:", 0);
  if (-[ICNoteEditorViewController ic_isViewVisible](self, "ic_isViewVisible"))
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[ICNoteEditorViewController eventReporter](self, "eventReporter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorBaseViewController note](self, "note");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "startNoteViewEventDurationTrackingForModernNote:reportCoreAnalytics:", v21, 0);

    }
  }
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v22, &location);
    dispatchMainAfterDelay();
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
LABEL_13:

}

- (NSMutableDictionary)savedScrollStates
{
  return self->_savedScrollStates;
}

- (void)saveCurrentScrollState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[ICNoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICTextViewScrollState scrollStateForTextView:](ICTextViewScrollState, "scrollStateForTextView:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    -[ICNoteEditorViewController savedScrollStates](self, "savedScrollStates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "note");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ic_setNonNilObject:forNonNilKey:", v9, v8);

  }
}

- (void)resetTextViewUndoManager
{
  void *v3;

  -[ICNoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetUndoManager");

  -[ICNoteEditorViewController updateBarButtons](self, "updateBarButtons");
}

- (void)resetBarButtonsAnimated:(BOOL)a3 checkIfVisible:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;

  v4 = a4;
  v5 = a3;
  -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reset");

  if (!-[ICNoteEditorViewController suspendBarButtonUpdates](self, "suspendBarButtonUpdates"))
    -[ICNoteEditorViewController updateBarButtonsAnimated:checkIfVisible:](self, "updateBarButtonsAnimated:checkIfVisible:", v5, v4);
}

- (void)rememberNoteContentForEditingIntent
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
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[ICNoteEditorBaseViewController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController setIsEditingNewNote:](self, "setIsEditingNewNote:", objc_msgSend(v3, "isEmpty"));

  -[ICNoteEditorBaseViewController note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mergeableString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3B18];
  -[ICNoteEditorBaseViewController note](self, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mergeableString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueWithRange:", objc_msgSend(v10, "length"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectionForCharacterRanges:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController setOriginalEndOfNote:](self, "setOriginalEndOfNote:", v13);

}

- (void)recreateTextViewIfNecessary
{
  void *v3;
  void *v4;
  char v5;

  if (-[ICNoteEditorViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {

    }
    else
    {
      -[ICNoteEditorBaseViewController note](self, "note");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isPasswordProtectedAndLocked");

      if ((v5 & 1) == 0)
        -[ICNoteEditorViewController recreateTextView](self, "recreateTextView");
    }
  }
}

- (void)rebuildInputAccessoryView
{
  void *v3;
  ICNoteEditorInputAccessoryView *v4;
  ICNoteEditorInputAccessoryView *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[ICNoteEditorViewController icSplitViewController](self, "icSplitViewController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom"))
  {
    v4 = 0;
  }
  else
  {
    v5 = [ICNoteEditorInputAccessoryView alloc];
    objc_msgSend(v12, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v4 = -[ICNoteEditorInputAccessoryView initWithFrame:](v5, "initWithFrame:", 0.0, 0.0);

  }
  v7 = objc_alloc_init(MEMORY[0x1E0DC3E68]);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  -[ICNoteEditorInputAccessoryView setToolbar:](v4, "setToolbar:", v7);
  -[ICNoteEditorViewController setTextViewInputAccessoryView:](self, "setTextViewInputAccessoryView:", v4);
  -[ICNoteEditorViewController textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInputAccessoryView:", v4);

  objc_opt_class();
  -[ICNoteEditorViewController auxiliaryResponder](self, "auxiliaryResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setInputAccessoryView:", v4);
  -[ICNoteEditorInputAccessoryView setDelegate:](v4, "setDelegate:", self);

}

- (ICNote)previousNote
{
  return (ICNote *)objc_loadWeakRetained((id *)&self->_previousNote);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  unint64_t v39;
  void *v40;
  char v41;
  uint64_t v42;
  void *v43;
  int v44;
  uint64_t v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  unint64_t v54;
  void *v55;
  char v56;
  uint64_t v57;
  void *v58;
  int v59;
  void *v60;
  uint64_t v61;
  void *v62;
  int v63;
  _BOOL8 v64;
  void *v65;
  uint64_t v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  void *v71;
  _QWORD block[5];
  objc_super v73;

  v10 = a3;
  v11 = a5;
  v12 = a4;
  if ((-[ICNoteEditorViewController ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/Editor/ICNoteEditorViewController.m") & 1) == 0)
  {
    v73.receiver = self;
    v73.super_class = (Class)ICNoteEditorViewController;
    -[ICNoteEditorViewController observeValueForKeyPath:ofObject:change:context:](&v73, sel_observeValueForKeyPath_ofObject_change_context_, v10, v12, v11, a6);

    goto LABEL_10;
  }
  v13 = -[ICNoteEditorViewController ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v11, v12, v10);

  if ((v13 & 1) == 0)
  {
    if (a6 == &compoundliteral_2701)
    {
      -[ICNoteEditorViewController updateForceLightContentIfNecessary](self, "updateForceLightContentIfNecessary");
      goto LABEL_10;
    }
    if (a6 != &compoundliteral_2703)
    {
      if (a6 != &compoundliteral_2705)
      {
        if (a6 == &compoundliteral_0)
        {
          if (-[ICNoteEditorViewController isInkPickerShowing](self, "isInkPickerShowing"))
          {
            -[ICNoteEditorViewController textViewController](self, "textViewController");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isViewLoaded");

            if (v24)
            {
              if (objc_msgSend(MEMORY[0x1E0DC3AC8], "prefersPencilOnlyDrawing"))
                -[ICNoteEditorViewController cleanupAfterFingerDrawing](self, "cleanupAfterFingerDrawing");
              else
                -[ICNoteEditorViewController setupForFingerDrawing](self, "setupForFingerDrawing");
            }
          }
        }
        else if (a6 == &compoundliteral_2699)
        {
          -[ICNoteEditorViewController forceLightContentDidChange:](self, "forceLightContentDidChange:", 0);
        }
        goto LABEL_10;
      }
      -[ICNoteEditorViewController textViewIfLoaded](self, "textViewIfLoaded");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorBaseViewController note](self, "note");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "createUserTitleViewIfNecessaryForNote:", v21);

      if (!-[ICNoteEditorViewController usesCustomTransition](self, "usesCustomTransition"))
        goto LABEL_10;
      -[ICNoteEditorViewController textView](self, "textView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "userTitleView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setAlpha:", 0.0);

LABEL_18:
      goto LABEL_10;
    }
    -[ICNoteEditorBaseViewController note](self, "note");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[ICNoteEditorBaseViewController note](self, "note");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "noteHasChanges");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "BOOLValue") & 1) != 0)
      {
        v18 = objc_msgSend(v10, "isEqualToString:", CFSTR("noteHasChanges"));

        if (v18)
        {
          -[ICNoteEditorBaseViewController note](self, "note");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setNoteHasChanges:", MEMORY[0x1E0C9AAA0]);
          goto LABEL_18;
        }
      }
      else
      {

      }
    }
    -[ICNoteEditorBaseViewController note](self, "note");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)v25;
      v27 = objc_msgSend(v10, "isEqualToString:", CFSTR("modificationDate"));

      if (v27)
      {
        -[ICNoteEditorViewController updateLastViewedMetadataIfNessessary](self, "updateLastViewedMetadataIfNessessary");
        goto LABEL_10;
      }
    }
    -[ICNoteEditorBaseViewController note](self, "note");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = (void *)v28;
      v30 = objc_msgSend(v10, "isEqualToString:", CFSTR("attachmentViewType"));

      if (v30)
      {
        objc_opt_class();
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v34)
          goto LABEL_73;
        v35 = (void *)*MEMORY[0x1E0C9B0D0];
        v36 = (void *)*MEMORY[0x1E0C9B0D0] == v32 ? 0 : v32;
        v37 = v36;
        v38 = v35 == v34 ? 0 : v34;
        v39 = v38;
        if (!(v37 | v39))
          goto LABEL_73;
        v40 = (void *)v39;
        if (v37 && v39)
        {
          v41 = objc_msgSend((id)v37, "isEqual:", v39);

          if ((v41 & 1) != 0)
            goto LABEL_73;
        }
        else
        {

        }
        if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
        {
          -[ICNoteEditorViewController resetTextViewContentOffset](self, "resetTextViewContentOffset");
          objc_opt_class();
          -[ICNoteEditorViewController textView](self, "textView");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "layoutManager");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          ICDynamicCast();
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v71, "invalidateLayoutAfterAttachmentViewTypeChangeIfNecessary");
        }
        goto LABEL_73;
      }
    }
    -[ICNoteEditorBaseViewController note](self, "note");
    v42 = objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      v43 = (void *)v42;
      v44 = objc_msgSend(v10, "isEqualToString:", CFSTR("paperStyleType"));

      if (v44)
      {
        -[ICNoteEditorViewController updatePencilKitPaperStyleType](self, "updatePencilKitPaperStyleType");
        goto LABEL_10;
      }
    }
    -[ICNoteEditorBaseViewController note](self, "note");
    v45 = objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      v46 = (void *)v45;
      v47 = objc_msgSend(v10, "isEqualToString:", CFSTR("isEmpty"));

      if (v47)
      {
        objc_opt_class();
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        ICCheckedDynamicCast();
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        ICCheckedDynamicCast();
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v34)
          goto LABEL_73;
        v50 = (void *)*MEMORY[0x1E0C9B0D0];
        v51 = (void *)*MEMORY[0x1E0C9B0D0] == v32 ? 0 : v32;
        v52 = v51;
        v53 = v50 == v34 ? 0 : v34;
        v54 = v53;
        if (!(v52 | v54))
          goto LABEL_73;
        v55 = (void *)v54;
        if (v52 && v54)
        {
          v56 = objc_msgSend((id)v52, "isEqual:", v54);

          if ((v56 & 1) != 0)
            goto LABEL_73;
        }
        else
        {

        }
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __77__ICNoteEditorViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
        block[3] = &unk_1EA7DD2D8;
        block[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], block);
LABEL_73:

        goto LABEL_10;
      }
    }
    -[ICNoteEditorBaseViewController note](self, "note");
    v57 = objc_claimAutoreleasedReturnValue();
    if (v57
      && (v58 = (void *)v57,
          v59 = objc_msgSend(v10, "isEqualToString:", CFSTR("serverShareData")),
          v58,
          v59))
    {
      -[ICNoteEditorViewController mentionsController](self, "mentionsController");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "updateNoteParticipants");

      -[ICNoteEditorViewController updateParticipantsInDrawings](self, "updateParticipantsInDrawings");
    }
    else
    {
      -[ICNoteEditorBaseViewController note](self, "note");
      v61 = objc_claimAutoreleasedReturnValue();
      if (v61
        && (v62 = (void *)v61,
            v63 = objc_msgSend(v10, "isEqualToString:", CFSTR("isSharedViaICloud")),
            v62,
            v63))
      {
        v64 = -[ICNoteEditorViewController shouldAllowAttributionSidebar](self, "shouldAllowAttributionSidebar");
        -[ICNoteEditorViewController attributionSidebarController](self, "attributionSidebarController");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setEnabled:", v64);

        -[ICNoteEditorViewController resetDateView](self, "resetDateView");
      }
      else
      {
        -[ICNoteEditorBaseViewController note](self, "note");
        v66 = objc_claimAutoreleasedReturnValue();
        if (v66)
        {
          v67 = (void *)v66;
          v68 = objc_msgSend(v10, "isEqualToString:", CFSTR("lastActivitySummaryViewedDate"));

          if (v68)
            -[ICNoteEditorViewController resetBarButtonsAnimated:](self, "resetBarButtonsAnimated:", 0);
        }
      }
    }
  }
LABEL_10:

}

- (void)noteWillAppear:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICNoteEditorViewController;
  -[ICNoteEditorBaseViewController noteWillAppear:](&v8, sel_noteWillAppear_, v4);
  -[ICNoteEditorViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[ICNoteEditorViewController textViewIfLoaded](self, "textViewIfLoaded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      -[ICNoteEditorViewController updateBarButtons](self, "updateBarButtons");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICNoteEditorViewController performSelector:withObject:](self, "performSelector:withObject:", sel_updateFastSyncParticipantCursorsForNote_, v4);

}

- (NSUserActivity)noteUserActivity
{
  return (NSUserActivity *)objc_getProperty(self, a2, 1288, 1);
}

- (id)noteEditorNavigationItemConfigurationToolbar:(id)a3
{
  void *v3;
  void *v4;

  -[ICNoteEditorViewController navigationController](self, "navigationController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toolbar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)noteEditorNavigationItemConfigurationInputAssistantItem:(id)a3
{
  void *v4;
  void *v5;

  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isiPad", a3))
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputAssistantItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)noteEditorNavigationItemConfigurationInputAccessoryToolbar:(id)a3
{
  void *v3;
  void *v4;

  -[ICNoteEditorViewController textViewInputAccessoryView](self, "textViewInputAccessoryView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toolbar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)noteEditorNavigationItemConfigurationChecklistAccessibilityValue:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  -[ICNoteEditorBaseViewController note](self, "note", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "selectedRange");
  objc_msgSend(v4, "checklistStyleAccessibilityDescriptionForRange:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (ICManagedObjectContextChangeController)noteAndFolderChangeController
{
  return self->_noteAndFolderChangeController;
}

- (id)nibBundle
{
  return (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
}

- (BOOL)needsInitialBarConfiguration
{
  return self->_needsInitialBarConfiguration;
}

- (ICMentionsController)mentionsController
{
  return self->_mentionsController;
}

- (id)managedObjectContextChangeController:(id)a3 managedObjectIDsToUpdateForUpdatedManagedObjects:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  -[ICNoteEditorViewController inlineAttachmentChangeController](self, "inlineAttachmentChangeController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    objc_msgSend(v7, "ic_compactMap:", &__block_literal_global_433);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICNoteEditorViewController noteAndFolderChangeController](self, "noteAndFolderChangeController");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v6)
    {
      -[ICNoteEditorBaseViewController note](self, "note");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "folder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __116__ICNoteEditorViewController_managedObjectContextChangeController_managedObjectIDsToUpdateForUpdatedManagedObjects___block_invoke_2;
      v17[3] = &unk_1EA7DE4A8;
      v18 = v12;
      v19 = v13;
      v14 = v13;
      v15 = v12;
      objc_msgSend(v7, "ic_compactMap:", v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICNoteEditorViewController managedObjectContextChangeController:managedObjectIDsToUpdateForUpdatedManagedObjects:]", 1, 0, CFSTR("Need to update this method for a new change controller"));
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
LABEL_7:

  return v11;
}

- (ICPasswordEntryViewController)lockIconCoverViewController
{
  return self->_lockIconCoverViewController;
}

- (ICLinkAcceleratorController)linkAcceleratorController
{
  return self->_linkAcceleratorController;
}

- (BOOL)isStyleSelectorInputViewPresenting
{
  return self->_styleSelectorInputViewPresenting;
}

- (BOOL)isSplitViewExpandingOrCollapsing
{
  return self->_splitViewExpandingOrCollapsing;
}

- (BOOL)isEditingOnSystemPaperOnPhone
{
  void *v3;
  BOOL v4;

  if (!-[ICNoteEditorBaseViewController isEditingOnSystemPaper](self, "isEditingOnSystemPaper"))
    return 0;
  -[ICNoteEditorViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom") == 0;

  return v4;
}

- (BOOL)isEditingOnSystemPaperOnPad
{
  void *v3;
  BOOL v4;

  if (!-[ICNoteEditorBaseViewController isEditingOnSystemPaper](self, "isEditingOnSystemPaper"))
    return 0;
  -[ICNoteEditorViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  return v4;
}

- (BOOL)isDrawingStroke
{
  return self->_isDrawingStroke;
}

- (BOOL)isDrawingStrokeWithPencil
{
  return self->_isDrawingStrokeWithPencil;
}

- (ICInvitationViewController)invitationViewController
{
  return self->_invitationViewController;
}

- (id)icSplitViewController
{
  void *v3;
  void *v4;

  if (-[ICNoteEditorBaseViewController isEditingOnSecureScreen](self, "isEditingOnSecureScreen"))
  {
    v3 = 0;
  }
  else
  {
    -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mainSplitViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)iCloudShareBarButtonItem
{
  void *v3;
  void *v4;

  -[ICNoteEditorBaseViewController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isPubliclySharedOrHasInvitees") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICNoteEditorViewController collaborationButtons_collaborationBarButtonItem](self, "collaborationButtons_collaborationBarButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)hideAcceleratorIfNecessary
{
  void *v3;
  int v4;
  id v5;

  -[ICNoteEditorViewController linkAcceleratorController](self, "linkAcceleratorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isShowing");

  if (v4)
  {
    -[ICNoteEditorViewController linkAcceleratorController](self, "linkAcceleratorController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hideAccelerator");

  }
}

- (ICHashtagController)hashtagController
{
  return self->_hashtagController;
}

- (BOOL)hasMadeEdits
{
  return self->_hasMadeEdits;
}

- (ICNAEventReporter)eventReporter
{
  _BOOL4 v3;
  id v4;
  objc_class *v5;
  void *v6;
  ICNAEventReporter *v7;
  void *eventReporter;
  ICNAEventReporter *v9;
  ICNAEventReporter *v10;
  void *v11;

  if (!self->_eventReporter && objc_msgSend(MEMORY[0x1E0D62A30], "isOptedInForAnalytics"))
  {
    v3 = -[ICNoteEditorViewController isEditingOnSystemPaperOnPhone](self, "isEditingOnSystemPaperOnPhone");
    v4 = objc_alloc(MEMORY[0x1E0D62A30]);
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v7 = (ICNAEventReporter *)objc_msgSend(v4, "initWithSubTrackerName:", v6);
      eventReporter = self->_eventReporter;
      self->_eventReporter = v7;
    }
    else
    {
      -[ICNoteEditorViewController view](self, "view");
      eventReporter = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (ICNAEventReporter *)objc_msgSend(v4, "initWithSubTrackerName:view:", v6, eventReporter);
      v10 = self->_eventReporter;
      self->_eventReporter = v9;

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_eventReporterLostSession_, *MEMORY[0x1E0D62A18], self->_eventReporter);

  }
  return self->_eventReporter;
}

- (BOOL)doNotAdvanceInsertionPointAfterInsertingAttachment
{
  return self->_doNotAdvanceInsertionPointAfterInsertingAttachment;
}

- (BOOL)didEndEditingForAddingImageAttachment
{
  return self->_didEndEditingForAddingImageAttachment;
}

- (BOOL)didDrawWithPencilWithoutPalette
{
  return self->_didDrawWithPencilWithoutPalette;
}

- (NSDate)dateOfLastStrokeOrNewDrawing
{
  return self->_dateOfLastStrokeOrNewDrawing;
}

- (ICCollaborationButtonsController)collaborationButtonsController
{
  return self->_collaborationButtonsController;
}

- (BOOL)canBecomeFirstResponder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasCompactWidth"))
  {

  }
  else
  {
    -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isPrimaryContentVisible"))
    {

      return 0;
    }
    -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isSupplementaryContentVisible");

    if ((v7 & 1) != 0)
      return 0;
  }
  if (-[ICNoteEditorViewController isStyleSelectorInputViewPresenting](self, "isStyleSelectorInputViewPresenting"))
    return 0;
  -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

    return 0;
  }
  -[ICNoteEditorViewController invitationViewController](self, "invitationViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return !v8;
}

- (ICBluetoothKeyboardHintViewController)bluetoothKeyboardHintViewController
{
  ICBluetoothKeyboardHintViewController *bluetoothKeyboardHintViewController;
  ICBluetoothKeyboardHintViewController *v4;
  ICBluetoothKeyboardHintViewController *v5;
  ICBluetoothKeyboardHintViewController *v6;

  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
  {
    bluetoothKeyboardHintViewController = self->_bluetoothKeyboardHintViewController;
    if (!bluetoothKeyboardHintViewController)
    {
      v4 = -[ICBluetoothKeyboardHintViewController initWithRootViewController:]([ICBluetoothKeyboardHintViewController alloc], "initWithRootViewController:", self);
      v5 = self->_bluetoothKeyboardHintViewController;
      self->_bluetoothKeyboardHintViewController = v4;

      bluetoothKeyboardHintViewController = self->_bluetoothKeyboardHintViewController;
    }
    v6 = bluetoothKeyboardHintViewController;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  char v4;
  objc_super v6;

  if (-[ICNoteEditorViewController isInkPickerShowing](self, "isInkPickerShowing"))
  {
    -[ICNoteEditorViewController paletteResponder](self, "paletteResponder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "becomeFirstResponder");

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ICNoteEditorViewController;
    return -[ICNoteEditorViewController becomeFirstResponder](&v6, sel_becomeFirstResponder);
  }
}

- (NotesBackgroundView)backgroundView
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ICNoteEditorViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NotesBackgroundView *)v4;
}

- (ICAuxiliaryStyling)auxiliaryStylingController
{
  return (ICAuxiliaryStyling *)objc_loadWeakRetained((id *)&self->_auxiliaryStylingController);
}

- (ICAuthorHighlightsController)authorHighlightsController
{
  return self->_authorHighlightsController;
}

- (ICAudioBarViewController)audioBarViewController
{
  return self->_audioBarViewController;
}

- (int64_t)attributionSidebarVisibility
{
  void *v2;
  int64_t v3;

  -[ICNoteEditorViewController attributionSidebarController](self, "attributionSidebarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "attributionSidebarVisibility");

  return v3;
}

- (ICAttachmentInsertionController)attachmentInsertionController
{
  return self->_attachmentInsertionController;
}

- (ICTextViewScrollState)archivedScrollStateToApply
{
  return self->_archivedScrollStateToApply;
}

- (void)applyScrollStateIfAvailable
{
  uint64_t v3;
  void *v4;
  int64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  _QWORD v32[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  -[ICNoteEditorViewController view](self, "view");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "window");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = +[ICExtensionSafeAPIShims applicationState](ICExtensionSafeAPIShims, "applicationState");

    if (v5 != 2)
    {
      -[ICNoteEditorBaseViewController note](self, "note");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isPasswordProtectedAndLocked");

      if ((v7 & 1) == 0)
      {
        v33 = 0;
        v34 = &v33;
        v35 = 0x3032000000;
        v36 = __Block_byref_object_copy__4;
        v37 = __Block_byref_object_dispose__4;
        v38 = 0;
        -[ICNoteEditorViewController archivedScrollStateToApply](self, "archivedScrollStateToApply");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "note");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "managedObjectContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __57__ICNoteEditorViewController_applyScrollStateIfAvailable__block_invoke;
        v32[3] = &unk_1EA7DE5C8;
        v32[4] = self;
        v32[5] = &v33;
        objc_msgSend(v10, "performBlockAndWait:", v32);

        v11 = (void *)v34[5];
        -[ICNoteEditorBaseViewController note](self, "note");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = objc_msgSend(v11, "isEqualToString:", v13);

        if ((_DWORD)v11)
        {
          -[ICNoteEditorViewController archivedScrollStateToApply](self, "archivedScrollStateToApply");
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[ICNoteEditorViewController savedScrollStates](self, "savedScrollStates");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICNoteEditorBaseViewController note](self, "note");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "ic_objectForNonNilKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v18, "captureIsWithinTimeThreshold"))
            v14 = v18;
          else
            v14 = 0;

        }
        -[ICNoteEditorViewController view](self, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "layoutIfNeeded");

        -[ICNoteEditorViewController textView](self, "textView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "applyToTextView:", v20) & 1) != 0)
        {
          -[ICNoteEditorViewController archivedScrollStateToApply](self, "archivedScrollStateToApply");
          v21 = (id)objc_claimAutoreleasedReturnValue();

          if (v14 == v21)
            -[ICNoteEditorViewController setArchivedScrollStateToApply:](self, "setArchivedScrollStateToApply:", 0);
        }
        else
        {

        }
        if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
        {
          if (-[ICNoteEditorViewController shouldOverscrollScrollState](self, "shouldOverscrollScrollState"))
          {
            -[ICNoteEditorViewController textView](self, "textView");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "contentOffset");
            v24 = v23;
            v26 = v25;

            -[ICNoteEditorViewController view](self, "view");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "safeAreaInsets");
            v29 = v28;

            -[ICNoteEditorViewController textView](self, "textView");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setContentOffset:", v24, fmax(v26 + -100.0, -v29));

          }
        }

        _Block_object_dispose(&v33, 8);
      }
    }
  }
  else
  {

  }
}

- (void)applyScrollStateFromArchive:(id)a3
{
  if (a3)
    -[ICNoteEditorViewController setArchivedScrollStateToApply:](self, "setArchivedScrollStateToApply:");
}

- (void)applicationDidBecomeActive:(id)a3
{
  void *v4;
  _QWORD v5[5];

  if (-[ICNoteEditorViewController isEditing](self, "isEditing", a3))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __57__ICNoteEditorViewController_applicationDidBecomeActive___block_invoke;
    v5[3] = &unk_1EA7DD2D8;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v5, 0.25);
  }
  if (-[ICNoteEditorViewController ic_isViewVisible](self, "ic_isViewVisible"))
  {
    -[ICNoteEditorViewController updateForceLightContentIfNecessary](self, "updateForceLightContentIfNecessary");
    -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsAnimatingOut:", 0);

    -[ICNoteEditorViewController showOrHidePasswordEntryViewControllerIfNeeded](self, "showOrHidePasswordEntryViewControllerIfNeeded");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[ICNoteEditorViewController ppt_didFinishExtendedLaunch](self, "ppt_didFinishExtendedLaunch");
  }
}

- (BOOL)addToDoListAfterViewAppears
{
  return self->_addToDoListAfterViewAppears;
}

- (void)addKVOObserversForNote:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, CFSTR("noteHasChanges"), &compoundliteral_2703);
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, CFSTR("modificationDate"), &compoundliteral_2703);
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, CFSTR("lastActivitySummaryViewedDate"), &compoundliteral_2703);
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, CFSTR("attachmentViewType"), &compoundliteral_2703);
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, CFSTR("paperStyleType"), &compoundliteral_2703);
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, CFSTR("isEmpty"), &compoundliteral_2703);
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, CFSTR("serverShareData"), &compoundliteral_2703);
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, CFSTR("isSharedViaICloud"), &compoundliteral_2703);
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, CFSTR("prefersLightBackground"), &compoundliteral_2701);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  +[ICNoteEditorUserTitleView noteKeyPathsAffectingUserTitleView](ICNoteEditorUserTitleView, "noteKeyPathsAffectingUserTitleView", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), &compoundliteral_2705);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)addDocumentScanAfterViewAppears
{
  return self->_addDocumentScanAfterViewAppears;
}

- (ICActivityStreamDockView)activityStreamToolbar
{
  return self->_activityStreamToolbar;
}

- (UIActivityItemsConfigurationProviding)activityItemsConfigurationProvider
{
  return self->_activityItemsConfigurationProvider;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (id)keyPathsForValuesAffectingTextView
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("textViewController"));
}

- (ICTextView)textView
{
  void *v2;
  void *v3;

  -[ICNoteEditorViewController textViewController](self, "textViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTextView *)v3;
}

- (ICTextView)textViewIfLoaded
{
  void *v2;
  void *v3;

  -[ICNoteEditorViewController textViewController](self, "textViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textViewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTextView *)v3;
}

- (ICTextController)textController
{
  void *v2;
  void *v3;

  -[ICNoteEditorViewController textViewController](self, "textViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTextController *)v3;
}

- (void)startEditing
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  if ((-[ICNoteEditorViewController ic_isViewVisible](self, "ic_isViewVisible") & 1) == 0)
  {
    -[ICNoteEditorViewController setStartEditingAfterViewAppears:](self, "setStartEditingAfterViewAppears:", 1);
    goto LABEL_5;
  }
  -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beginAuthentication");

    -[ICNoteEditorViewController setShouldBeginEditingAfterNoteUnlock:](self, "setShouldBeginEditingAfterNoteUnlock:", 1);
    goto LABEL_5;
  }
  -[ICNoteEditorViewController invitationViewController](self, "invitationViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

    goto LABEL_5;
  }
  -[ICNoteEditorViewController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFirstResponder");
  if (v8)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "isEditable"))
    {

      goto LABEL_5;
    }
  }
  -[ICNoteEditorViewController textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "canBecomeFirstResponder");

  if (v8)
  if ((v10 & 1) != 0)
  {
    -[ICNoteEditorViewController stopTextFindingIfNecessary](self, "stopTextFindingIfNecessary");
    -[ICNoteEditorViewController textView](self, "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEditable:", 1);

    -[ICNoteEditorViewController textView](self, "textView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "selectedRange");
    v15 = v14;

    -[ICNoteEditorViewController textView](self, "textView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "textStorage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "length") && !v15)
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "textStorage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");

      if (v13 != v20)
        goto LABEL_22;
      objc_opt_class();
      -[ICNoteEditorViewController textView](self, "textView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "textStorage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], v13 - 1, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16 || objc_msgSend(v16, "embeddingType") != 1)
      {
LABEL_21:

LABEL_22:
        -[ICNoteEditorViewController view](self, "view");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "window");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "makeKeyWindow");

        -[ICNoteEditorViewController textView](self, "textView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "becomeFirstResponder");

        if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "BOOLForKey:", CFSTR("DisableInitialCursorSizeWorkaround"));

          if ((v29 & 1) == 0)
          {
            -[ICNoteEditorViewController textView](self, "textView");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "textStorage");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "length");

            if (!v32)
            {
              -[ICNoteEditorViewController textView](self, "textView");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "layoutManager");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICNoteEditorViewController textView](self, "textView");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "textContainer");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setExtraLineFragmentRect:usedRect:textContainer:", v36, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

            }
          }
        }
        -[ICNoteEditorViewController rememberNoteContentForEditingIntent](self, "rememberNoteContentForEditingIntent");
        goto LABEL_5;
      }
      -[ICNoteEditorViewController textView](self, "textView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
      objc_msgSend(v17, "_pasteAttributedString:pasteAsRichText:", v24, 0);

    }
    goto LABEL_21;
  }
LABEL_5:
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "postNotificationName:object:", CFSTR("ICNoteEditorViewControllerDidStartEditingNotification"), self);

}

- (void)keyboardDidShow:(id)a3
{
  id v4;
  void *v5;
  dispatch_time_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController setKeyboardDidShowAnimationDate:](self, "setKeyboardDidShowAnimationDate:", v5);

  v6 = dispatch_time(0, 300000000);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __46__ICNoteEditorViewController_keyboardDidShow___block_invoke;
  v10 = &unk_1EA7DD6B8;
  objc_copyWeak(&v11, &location);
  dispatch_after(v6, MEMORY[0x1E0C80D38], &v7);
  -[ICNoteEditorViewController setWasEditingBeforeDrawing:](self, "setWasEditingBeforeDrawing:", 1, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __46__ICNoteEditorViewController_keyboardDidShow___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setKeyboardDidShowAnimationDate:", 0);

}

- (void)keyboardDidHide:(id)a3
{
  void *v4;
  void *v5;

  -[ICNoteEditorViewController noteFormattingController](self, "noteFormattingController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "popoverPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[ICNoteEditorViewController showStyleSelector:animated:](self, "showStyleSelector:animated:", 0, 1);
  -[ICNoteEditorViewController setWasEditingBeforeDrawing:](self, "setWasEditingBeforeDrawing:", 0);
}

- (BOOL)shouldUseiPadBarLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;

  -[ICNoteEditorViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "horizontalSizeClass"))
  {
    -[ICNoteEditorViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rootViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitCollection");
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  if ((objc_msgSend(v3, "ic_hasCompactWidth") & 1) != 0 || (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isiPad") & 1) == 0)
    v8 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
  else
    v8 = 1;

  return v8;
}

- (void)scrollRangeToVisible:(_NSRange)a3 animated:(BOOL)a4
{
  -[ICNoteEditorViewController scrollRangeToVisible:animated:inSearchableString:searchHighlightRegexFinder:](self, "scrollRangeToVisible:animated:inSearchableString:searchHighlightRegexFinder:", a3.location, a3.length, a4, 0, 0);
}

- (void)scrollRangeToVisible:(_NSRange)a3 animated:(BOOL)a4 inSearchableString:(id)a5 searchHighlightRegexFinder:(id)a6
{
  _BOOL8 v7;
  NSUInteger length;
  NSUInteger location;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a4;
  length = a3.length;
  location = a3.location;
  v17 = a5;
  v11 = a6;
  if (-[ICNoteEditorViewController _appearState](self, "_appearState") == 2)
  {
    if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "layoutManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController textView](self, "textView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "textContainer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ensureLayoutForTextContainer:", v15);

    }
    -[ICNoteEditorViewController textView](self, "textView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scrollRangeToVisible:consideringInsets:animated:inSearchableString:", location, length, 1, 0, v17);

    -[ICNoteEditorViewController setSearchRegexFinder:](self, "setSearchRegexFinder:", v11);
  }
  else
  {
    -[ICNoteEditorViewController scrollRangeToVisibleWhenViewAppears:animated:inSearchableString:searchHighlightRegexFinder:](self, "scrollRangeToVisibleWhenViewAppears:animated:inSearchableString:searchHighlightRegexFinder:", location, length, v7, v17, v11);
  }

}

- (void)scrollRangeToVisibleWhenViewAppears:(_NSRange)a3 animated:(BOOL)a4 inSearchableString:(id)a5 searchHighlightRegexFinder:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  id v12;

  length = a3.length;
  location = a3.location;
  v9 = a6;
  v10 = (id)-[ICNoteEditorViewController view](self, "view");
  -[ICNoteEditorViewController setShouldResetTextViewContentOffsetWhenAppearing:](self, "setShouldResetTextViewContentOffsetWhenAppearing:", 0);
  -[ICNoteEditorBaseViewController note](self, "note");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICTextViewScrollState scrollStateForRange:inNote:](ICTextViewScrollState, "scrollStateForRange:inNote:", location, length, v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[ICNoteEditorViewController setArchivedScrollStateToApply:](self, "setArchivedScrollStateToApply:", v12);
  -[ICNoteEditorViewController setSearchRegexFinder:](self, "setSearchRegexFinder:", v9);

  -[ICNoteEditorViewController setShouldOverscrollScrollState:](self, "setShouldOverscrollScrollState:", 1);
}

- (void)setSelectedRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v5;

  length = a3.length;
  location = a3.location;
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedRange:", location, length);

}

- (id)barButtonItemWithImage:(id)a3 selector:(SEL)a4
{
  objc_class *v6;
  id v7;
  void *v8;

  v6 = (objc_class *)MEMORY[0x1E0DC34F0];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithImage:style:target:action:", v7, 0, self, a4);

  return v8;
}

- (id)flexibleSpaceBarButtonItem
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
}

- (void)recreateTextViewIfPasswordEntryScreenExistsButNoteIsUnlocked
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;

  -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[ICNoteEditorBaseViewController note](self, "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isPasswordProtectedAndLocked");

    if ((v6 & 1) == 0)
      -[ICNoteEditorViewController recreateTextView](self, "recreateTextView");
  }
}

- (void)recreateTextView
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1DD7B0000, v0, v1, "isPreviewingAttachmentFromNote = NO, recreateTextView", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __46__ICNoteEditorViewController_recreateTextView__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setDataDetectorTypes:", -1);

}

- (double)inputAccessoryViewHeight
{
  void *v2;
  double v3;
  double v4;

  -[ICNoteEditorViewController inputAccessoryView](self, "inputAccessoryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;

  return v4;
}

- (void)paperKitBundleDidMerge:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    performBlockOnMainThread();

  }
}

void __53__ICNoteEditorViewController_paperKitBundleDidMerge___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "note", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleAttachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "objectID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 40));

        if (v9)
        {
          +[ICSystemPaperDocumentController sharedInstance](ICSystemPaperDocumentController, "sharedInstance");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "removePresenter:", *(_QWORD *)(a1 + 32));

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

uint64_t __44__ICNoteEditorViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showInkPicker:animated:", 1, 1);
}

void __44__ICNoteEditorViewController_viewDidAppear___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "createInkPickerControllerIfNecessary");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  _QWORD v28[5];
  id v29;
  id v30;
  BOOL v31;
  _QWORD v32[5];

  height = a3.height;
  width = a3.width;
  v7 = (void *)MEMORY[0x1E0DC3708];
  v8 = a4;
  if ((objc_msgSend(v7, "ic_isVision") & 1) == 0)
  {
    -[ICNoteEditorViewController attributionSidebarController](self, "attributionSidebarController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hideSidebarAnimated:", 1);

  }
  -[ICNoteEditorViewController textViewInputAccessoryView](self, "textViewInputAccessoryView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hideDisclosureViewForTransition:", 1);

  -[ICNoteEditorViewController auxiliaryResponder](self, "auxiliaryResponder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isFirstResponder"))
  {
    -[ICNoteEditorViewController auxiliaryResponder](self, "auxiliaryResponder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  -[ICNoteEditorViewController textView](self, "textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isFirstResponder") & 1) != 0)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v12;
  }
  v15 = v14;

  v16 = -[ICNoteEditorViewController isInkPickerShowing](self, "isInkPickerShowing");
  -[ICNoteEditorViewController noteFormattingController](self, "noteFormattingController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentingViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNoteEditorViewController updateFormatToolbarLayoutWithSize:](self, "updateFormatToolbarLayoutWithSize:", width, height);
  -[ICNoteEditorViewController hideAcceleratorIfNecessary](self, "hideAcceleratorIfNecessary");
  -[ICNoteEditorViewController linkEditorViewController](self, "linkEditorViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[ICNoteEditorViewController linkEditorViewController](self, "linkEditorViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hideAccelerator");

  }
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __81__ICNoteEditorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v32[3] = &unk_1EA7DD1E8;
  v32[4] = self;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __81__ICNoteEditorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v28[3] = &unk_1EA7DE3F0;
  v31 = v16;
  v28[4] = self;
  v29 = v15;
  v30 = v18;
  v21 = v18;
  v22 = v15;
  objc_msgSend(v8, "animateAlongsideTransition:completion:", v32, v28);
  -[ICNoteEditorViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "window");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController setWasWindowlessDuringTransitionToSize:](self, "setWasWindowlessDuringTransitionToSize:", v24 == 0);

  -[ICNoteEditorViewController audioBarViewController](self, "audioBarViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "viewWillTransitionToSize:withTransitionCoordinator:", v8, width, height);

  -[ICNoteEditorViewController paperLinkBarViewController](self, "paperLinkBarViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "viewWillTransitionToSize:withTransitionCoordinator:", v8, width, height);

  v27.receiver = self;
  v27.super_class = (Class)ICNoteEditorViewController;
  -[ICNoteEditorViewController viewWillTransitionToSize:withTransitionCoordinator:](&v27, sel_viewWillTransitionToSize_withTransitionCoordinator_, v8, width, height);

}

void __81__ICNoteEditorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "viewControllerManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateHostedNotesAppearance");

}

void __81__ICNoteEditorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v2 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "viewControllerManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "noteContainerViewMode");

    if (v5 == 1)
      objc_msgSend(*(id *)(a1 + 32), "updateBarButtonsAnimated:", 0);
  }
  else
  {
    objc_msgSend(v3, "resetBarButtonsAnimated:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "textViewInputAccessoryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hideDisclosureViewForTransition:", 0);

  objc_msgSend(*(id *)(a1 + 32), "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didFinishAnimatingAfterSizeTransition");

  if (*(_BYTE *)(a1 + 56) && (objc_msgSend(*(id *)(a1 + 32), "isInkPickerShowing") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        objc_msgSend(*(id *)(a1 + 32), "showInkPicker:animated:", 1, 1);
        goto LABEL_15;
      }
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "setShowInkPickerAfterViewAppears:", 1);
    goto LABEL_15;
  }
  v8 = *(void **)(a1 + 40);
  if (v8 && (objc_msgSend(v8, "isFirstResponder") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setEditing:animated:", 1, 1);
    objc_msgSend(*(id *)(a1 + 40), "becomeFirstResponder");
  }
LABEL_15:
  if (*(_QWORD *)(a1 + 48) && objc_msgSend(*(id *)(a1 + 32), "useInputViewForStyleSelector"))
    objc_msgSend(*(id *)(a1 + 32), "showStyleSelector:animated:", 1, 1);
  objc_msgSend(*(id *)(a1 + 32), "linkAcceleratorController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentLinkAcceleratorIfNecessaryWithCompletionHandler:", &__block_literal_global_4);

}

uint64_t __45__ICNoteEditorViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateForceLightContentIfNecessary");
}

- (void)updateTextViewContentOffset
{
  NSObject *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[ICNoteEditorViewController updateTextViewContentOffset]";
    v10 = 1024;
    v11 = 1416;
    _os_log_impl(&dword_1DD7B0000, v3, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v8, 0x12u);
  }

  -[ICNoteEditorViewController updateTextViewContentInsetsAnimated:](self, "updateTextViewContentInsetsAnimated:", 1);
  -[ICNoteEditorViewController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "adjustedContentInset");
  objc_msgSend(v4, "setContentOffset:", 0.0, -v6);

  -[ICNoteEditorViewController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "icaxClearCachedChildrenForReparenting");

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  _QWORD v32[5];
  objc_super v33;

  v3 = a3;
  v33.receiver = self;
  v33.super_class = (Class)ICNoteEditorViewController;
  -[ICNoteEditorBaseViewController viewWillDisappear:](&v33, sel_viewWillDisappear_);
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorBaseViewController noteWillDisappear:](self, "noteWillDisappear:", v6);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICNoteEditorViewController link_removeLinkActionInteractions](self, "link_removeLinkActionInteractions");
  -[ICNoteEditorViewController setShouldTrackNoteViewEventAnalyticsFromSettingNote:](self, "setShouldTrackNoteViewEventAnalyticsFromSettingNote:", 0);
  -[ICNoteEditorBaseViewController note](self, "note");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = -[ICNoteEditorViewController shouldFireNoteViewEventOnViewDisappear](self, "shouldFireNoteViewEventOnViewDisappear");

    if (v9)
    {
      -[ICNoteEditorBaseViewController note](self, "note");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController submitNoteViewEventForModernNote:](self, "submitNoteViewEventForModernNote:", v10);

      -[ICNoteEditorViewController setShouldFireNoteViewEventOnViewDisappear:](self, "setShouldFireNoteViewEventOnViewDisappear:", 0);
    }
  }
  -[ICNoteEditorViewController saveCurrentScrollState](self, "saveCurrentScrollState");
  -[ICNoteEditorViewController showInkPicker:animated:](self, "showInkPicker:animated:", 0, v3);
  -[ICNoteEditorViewController textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEditing");

  v13 = MEMORY[0x1E0C809B0];
  if (v12)
  {
    -[ICNoteEditorViewController noteFormattingController](self, "noteFormattingController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentingViewController");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      v17 = -[ICNoteEditorViewController isSplitViewExpandingOrCollapsing](self, "isSplitViewExpandingOrCollapsing");

      if (!v17)
      {
        -[ICNoteEditorViewController noteFormattingController](self, "noteFormattingController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "presentingViewController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "dismissViewControllerAnimated:completion:", v3, 0);

        goto LABEL_14;
      }
    }
    else
    {

    }
    -[ICNoteEditorViewController setStartEditingAfterViewAppears:](self, "setStartEditingAfterViewAppears:", 1);
    -[ICNoteEditorViewController transitionCoordinator](self, "transitionCoordinator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v13;
    v32[1] = 3221225472;
    v32[2] = __48__ICNoteEditorViewController_viewWillDisappear___block_invoke;
    v32[3] = &unk_1EA7DD1E8;
    v32[4] = self;
    objc_msgSend(v20, "animateAlongsideTransition:completion:", 0, v32);

  }
LABEL_14:
  v21 = objc_alloc_init(MEMORY[0x1E0DC3E70]);
  objc_msgSend(v21, "configureWithTransparentBackground");
  -[ICNoteEditorViewController navigationController](self, "navigationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "toolbar");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setScrollEdgeAppearance:", v21);

  -[ICNoteEditorViewController navigationController](self, "navigationController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "toolbar");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCompactScrollEdgeAppearance:", v21);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "removeObserver:name:object:", self, *MEMORY[0x1E0D648C0], 0);
  objc_msgSend(v26, "removeObserver:name:object:", self, *MEMORY[0x1E0D63860], 0);
  objc_msgSend(v26, "removeObserver:name:object:", self, CFSTR("ICViewControllerWillStartEditModeNotification"), 0);
  objc_msgSend(v26, "removeObserver:name:object:", self, *MEMORY[0x1E0D640D0], 0);
  objc_msgSend(v26, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4E70], 0);
  objc_msgSend(v26, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4E68], 0);
  objc_msgSend(v26, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4E60], 0);
  objc_msgSend(v26, "removeObserver:name:object:", self, *MEMORY[0x1E0D63820], 0);
  objc_msgSend(v26, "removeObserver:name:object:", self, *MEMORY[0x1E0D63808], 0);
  -[ICNoteEditorViewController navigationController](self, "navigationController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "toolbar");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setAccessibilityElementsHidden:", 0);

  -[ICNoteEditorViewController navigationItem](self, "navigationItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setCenterItemGroups:", MEMORY[0x1E0C9AA60]);

  -[ICNoteEditorViewController transitionCoordinator](self, "transitionCoordinator");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v13;
  v31[1] = 3221225472;
  v31[2] = __48__ICNoteEditorViewController_viewWillDisappear___block_invoke_2;
  v31[3] = &unk_1EA7DD1E8;
  v31[4] = self;
  objc_msgSend(v30, "animateAlongsideTransition:completion:", 0, v31);

}

uint64_t __48__ICNoteEditorViewController_viewWillDisappear___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setStartEditingAfterViewAppears:", 0);
  return result;
}

uint64_t __48__ICNoteEditorViewController_viewWillDisappear___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "updateForceLightContentIfNecessary");
  return result;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ICNoteEditorViewController;
  -[ICNoteEditorBaseViewController viewDidDisappear:](&v16, sel_viewDidDisappear_, a3);
  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitPendingInlineDrawingDataForNote:", v6);

  -[ICNoteEditorViewController submitNoteEditEventIfNecessary](self, "submitNoteEditEventIfNecessary");
  if (-[ICNoteEditorViewController shouldRemoveEmptyNoteWhenViewDisappeared](self, "shouldRemoveEmptyNoteWhenViewDisappeared"))
  {
    v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[ICNoteEditorViewController viewDidDisappear:].cold.1((uint64_t)self, a2);

    -[ICNoteEditorViewController setNote:](self, "setNote:", 0);
  }
  if (!+[ICMovieController isFullScreen](ICMovieController, "isFullScreen"))
    +[ICMovieController stopIfPlaying](ICMovieController, "stopIfPlaying");
  -[ICNoteEditorViewController highlightSearchMatchesForRegexFinder:](self, "highlightSearchMatchesForRegexFinder:", 0);
  -[ICNoteEditorViewController paletteResponder](self, "paletteResponder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resignFirstResponder");

  -[ICNoteEditorViewController textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShouldAvoidResigningFirstResponder:", 0);

  objc_opt_class();
  -[ICNoteEditorViewController auxiliaryResponder](self, "auxiliaryResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShouldAvoidResigningFirstResponder:", 0);

  objc_opt_class();
  -[ICNoteEditorViewController auxiliaryResponder](self, "auxiliaryResponder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShouldAvoidResigningFirstResponder:", 0);

  -[ICNoteEditorBaseViewController note](self, "note");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorBaseViewController noteDidDisappear:](self, "noteDidDisappear:", v15);

  }
}

- (BOOL)usesCustomTransition
{
  void *v3;
  BOOL v4;

  if (!_os_feature_enabled_impl())
    return 0;
  -[ICNoteEditorViewController preferredTransition](self, "preferredTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)registerForTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__ICNoteEditorViewController_registerForTraitChanges__block_invoke;
  v5[3] = &unk_1EA7DE418;
  objc_copyWeak(&v6, &location);
  v4 = (id)-[ICNoteEditorViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __53__ICNoteEditorViewController_registerForTraitChanges__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsUpdateConstraints");

    objc_msgSend(v5, "updateAuthorHighlightsIfNeeded");
    objc_msgSend(v5, "updateTextViewBackground");
    objc_msgSend(v5, "updatePencilKitPaperStyleType");
    objc_msgSend(v5, "setNeedsStatusBarAppearanceUpdate");
    objc_msgSend(v5, "inkPaletteController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v5, "inkPaletteController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "selectedTool");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend(v5, "traitCollection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "ic_isDark");
        v13 = objc_msgSend(v20, "ic_isDark");

        if (v12 != v13)
        {
          objc_msgSend(v5, "inkPaletteController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "colorCorrectedTool");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "updateInkPickerAndTextViewToTool:", v15);

        }
      }
      objc_msgSend(v5, "traitCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "userInterfaceStyle");

      if (objc_msgSend(v20, "userInterfaceStyle") != v17)
      {
        objc_msgSend(v5, "inkPaletteController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "updateUserInterfaceStyle:", v17);

      }
    }
    objc_msgSend(v5, "updateForceLightContentIfNecessary");
    objc_msgSend(v5, "activityStreamToolbar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "update");

  }
}

- (BOOL)resignFirstResponder
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  objc_super v8;

  -[ICNoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFirstResponder");

  if (v4)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "resignFirstResponder");

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ICNoteEditorViewController;
    return -[ICNoteEditorViewController resignFirstResponder](&v8, sel_resignFirstResponder);
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  -[ICNoteEditorBaseViewController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController removeKVOObserversForNote:](self, "removeKVOObserversForNote:", v4);

  }
  objc_msgSend(MEMORY[0x1E0DC3AC8], "ic_removeObserver:forKeyPath:context:", self, CFSTR("prefersPencilOnlyDrawing"), &compoundliteral_0);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_removeObserver:forKeyPath:context:", self, *MEMORY[0x1E0D64898], &compoundliteral_2699);

  -[ICNoteEditorViewController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  v9.receiver = self;
  v9.super_class = (Class)ICNoteEditorViewController;
  -[ICNoteEditorViewController dealloc](&v9, sel_dealloc);
}

- (void)warnLimitExceededWithTitle:(id)a3 andMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v6 = a3;
  v7 = a4;
  -[ICNoteEditorViewController limitExceededAlertController](self, "limitExceededAlertController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController setLimitExceededAlertController:](self, "setLimitExceededAlertController:", v9);

    -[ICNoteEditorViewController limitExceededAlertController](self, "limitExceededAlertController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA7E9860, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v14);

    -[ICNoteEditorViewController limitExceededAlertController](self, "limitExceededAlertController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __68__ICNoteEditorViewController_warnLimitExceededWithTitle_andMessage___block_invoke;
    v16[3] = &unk_1EA7DD2D8;
    v16[4] = self;
    -[ICNoteEditorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, v16);

  }
}

uint64_t __68__ICNoteEditorViewController_warnLimitExceededWithTitle_andMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLimitExceededAlertController:", 0);
}

- (void)warnUserNoteLengthExceeded
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Maximum note length reached."), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController warnLimitExceededWithTitle:andMessage:](self, "warnLimitExceededWithTitle:andMessage:", v3, 0);

}

- (void)warnUserAttachmentLimitExceeded
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Maximum attachments reached."), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController warnLimitExceededWithTitle:andMessage:](self, "warnLimitExceededWithTitle:andMessage:", v3, 0);

}

- (void)warnUserAttachmentSizeExceededWithAttachmentCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(MEMORY[0x1E0D63A78], "sharedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "maximumAttachmentSizeMB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedLongLongValue") << 20;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a3 == 1)
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Large Attachment."), &stru_1EA7E9860, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = CFSTR("To add this attachment to your note, you’ll need to make it smaller than %@.");
  }
  else
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Large Attachments"), &stru_1EA7E9860, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = CFSTR("Some of these attachments are too large. Each attachment must be smaller than %@.");
  }
  objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1EA7E9860, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v7, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringWithFormat:", v15, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[ICNoteEditorViewController warnLimitExceededWithTitle:andMessage:](self, "warnLimitExceededWithTitle:andMessage:", v10, v17);
}

- (void)showRecoverNoteAlert
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1DD7B0000, v0, v1, "showRecoverNoteAlert early return", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (BOOL)shouldIgnoreTapToStartEditingTextView:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  void *v15;
  id v16;

  v4 = a3;
  -[ICNoteEditorViewController calculateRecognitionController](self, "calculateRecognitionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPreviewingResult");

  if ((v6 & 1) == 0)
  {
    -[ICNoteEditorViewController calculateScrubberController](self, "calculateScrubberController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isShowing");

    if ((v8 & 1) == 0)
    {
      objc_opt_self();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "note");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textStorageWithoutCreating");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isMarkingTextForHeadingRename");

      if ((v12 & 1) == 0)
      {
        if (-[ICNoteEditorViewController isEditing](self, "isEditing"))
        {
          -[ICNoteEditorViewController auxiliaryResponder](self, "auxiliaryResponder");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            -[ICNoteEditorViewController auxiliaryResponder](self, "auxiliaryResponder");
            v16 = (id)objc_claimAutoreleasedReturnValue();
            v13 = v16 == v4;
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            -[ICNoteEditorViewController invitationViewController](self, "invitationViewController");
            v16 = (id)objc_claimAutoreleasedReturnValue();
            v13 = v16 != 0;
            goto LABEL_12;
          }
        }
        v13 = 1;
LABEL_13:

        goto LABEL_5;
      }
    }
  }
  v13 = 0;
LABEL_5:

  return v13;
}

- (id)createNewNote
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showNewNoteWithApproach:sender:animated:", 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)calculateDocumentControllerDidUpdateHighlights:(id)a3
{
  id v3;

  -[ICNoteEditorViewController authorHighlightsUpdater](self, "authorHighlightsUpdater", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduleUpdateAnimated:force:", 0, 1);

}

- (void)noteDidChangeCalculatePreviewBehaviorNotification:(id)a3
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[ICNoteEditorBaseViewController note](self, "note", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "calculatePreviewBehavior") != 1;
  -[ICNoteEditorViewController calculateRecognitionController](self, "calculateRecognitionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInsertsResults:", v5);

  -[ICNoteEditorBaseViewController note](self, "note");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "calculatePreviewBehavior");
  -[ICNoteEditorViewController calculateRecognitionController](self, "calculateRecognitionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreviewBehavior:", v7);

}

- (void)noteWillBeDeleted:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
    goto LABEL_9;
  -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isAuxiliary")
    && !-[ICNoteEditorBaseViewController isEditingOnSystemPaper](self, "isEditingOnSystemPaper"))
  {
    v7 = -[ICNoteEditorViewController isTogglingLock](self, "isTogglingLock");

    if (v7)
      goto LABEL_7;
    -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "closeAuxiliaryWindowAnimated:", 1);
  }

LABEL_7:
  objc_msgSend(v13, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64B10], "sharedAudioController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentAttachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "note");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v11)
  {
    objc_msgSend(MEMORY[0x1E0D64B10], "sharedAudioController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stop");

  }
LABEL_9:

}

- (void)showOverscrollContentAndScrollToTop
{
  -[ICNoteEditorViewController setUserWantsToSeeDateLabel:](self, "setUserWantsToSeeDateLabel:", 1);
  -[ICNoteEditorViewController updateTextViewContentOffset](self, "updateTextViewContentOffset");
}

- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4
{
  char IsTextKit2Enabled;
  id v7;
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
  id v18;

  v18 = a3;
  IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  if (v18)
  {
    if ((IsTextKit2Enabled & 1) == 0)
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v18 && !a4)
      {
        -[ICNoteEditorViewController textView](self, "textView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "verticalScrollIndicatorInsets");
        v10 = v9;
        v12 = v11;

        -[ICNoteEditorViewController textViewScrollIndicatorInsetsThatWeWant](self, "textViewScrollIndicatorInsetsThatWeWant");
        v14 = v13;
        v16 = v15;
        -[ICNoteEditorViewController textView](self, "textView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setVerticalScrollIndicatorInsets:", v10, v14, v12, v16);

      }
    }
  }

}

- (void)contentSizeCategoryDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[ICNoteEditorViewController ic_isViewVisible](self, "ic_isViewVisible"))
  {
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setNeedsStylingRefreshOnNextLayout:", 1);
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[ICNoteEditorBaseViewController note](self, "note", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "textStorage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "layoutManagers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v19;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v19 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v10++), "contentSizeCategoryDidChange");
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v8);
      }

      objc_opt_class();
      -[ICNoteEditorViewController textView](self, "textView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "textStorage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      objc_msgSend(v3, "styler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "refreshTextStylingForTextStorage:withTextController:", v3, v14);
    }

    -[ICNoteEditorViewController textView](self, "textView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "compatibilityBannerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentSizeCategoryDidChange");

    -[ICNoteEditorViewController setUpdateContentSizeCategoryWhenVisible:](self, "setUpdateContentSizeCategoryWhenVisible:", 0);
    -[ICNoteEditorViewController attributionSidebarView](self, "attributionSidebarView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reload");

  }
  else
  {
    -[ICNoteEditorViewController setUpdateContentSizeCategoryWhenVisible:](self, "setUpdateContentSizeCategoryWhenVisible:", 1);
  }
}

- (void)tearDownAudioPlayers
{
  void *v3;
  void *v4;
  id v5;

  -[ICNoteEditorViewController audioBarViewController](self, "audioBarViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICNoteEditorViewController audioBarViewController](self, "audioBarViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "done:", self);

  }
  -[ICNoteEditorViewController audioAttachmentEditorCoordinator](self, "audioAttachmentEditorCoordinator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "teardown");

}

- (BOOL)isShowingAudioInspector
{
  void *v2;
  char v3;

  -[ICNoteEditorViewController audioAttachmentEditorCoordinator](self, "audioAttachmentEditorCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isShowingInspector");

  return v3;
}

- (BOOL)isShowingMiniPlayer
{
  void *v2;
  char v3;

  -[ICNoteEditorViewController audioAttachmentEditorCoordinator](self, "audioAttachmentEditorCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isShowingMiniPlayer");

  return v3;
}

- (void)audioPlaybackPlayNotification:(id)a3
{
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ICAudioPlaybackBarViewController *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (!-[ICNoteEditorBaseViewController isEditingOnSystemPaper](self, "isEditingOnSystemPaper")
    && (ICInternalSettingsIsAudioTranscriptionEnabled() & 1) == 0)
  {
    objc_msgSend(v14, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController audioBarViewController](self, "audioBarViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[ICNoteEditorViewController audioBarViewController](self, "audioBarViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v7, "setAudioAttachment:", v4);

      -[ICNoteEditorBaseViewController note](self, "note");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController audioBarViewController](self, "audioBarViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNote:", v9);

      -[ICNoteEditorViewController audioBarViewController](self, "audioBarViewController");
      v11 = (ICAudioPlaybackBarViewController *)objc_claimAutoreleasedReturnValue();
      -[ICAudioBarViewController addToViewController:](v11, "addToViewController:", self);
    }
    else
    {

      if (v8)
      {
        -[ICNoteEditorViewController audioBarViewController](self, "audioBarViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "done:", self);

      }
      v11 = objc_alloc_init(ICAudioPlaybackBarViewController);
      -[ICAudioPlaybackBarViewController setAudioAttachment:](v11, "setAudioAttachment:", v4);
      -[ICNoteEditorBaseViewController note](self, "note");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAudioBarViewController setNote:](v11, "setNote:", v13);

      -[ICAudioBarViewController setDelegate:](v11, "setDelegate:", self);
      -[ICAudioBarViewController addToViewController:](v11, "addToViewController:", self);
      -[ICNoteEditorViewController setAudioBarViewController:](self, "setAudioBarViewController:", v11);
    }

    -[ICNoteEditorViewController updateTextViewContentInsetsAnimated:](self, "updateTextViewContentInsetsAnimated:", 0);
  }

}

uint64_t __77__ICNoteEditorViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateBarButtons");
}

- (void)willAddAttachmentForNoteNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    objc_opt_class();
    -[ICNoteEditorViewController textView](self, "textView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "breakUndoCoalescing");

  }
}

- (void)didAddAttachmentForNoteNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    objc_opt_class();
    -[ICNoteEditorViewController textView](self, "textView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "breakUndoCoalescing");

  }
}

- (void)noteAnalyticsAddAttachment:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  ICNoteEditorViewController *v9;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D63788]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__ICNoteEditorViewController_noteAnalyticsAddAttachment___block_invoke;
    v7[3] = &unk_1EA7DD498;
    v8 = v5;
    v9 = self;
    objc_msgSend(v6, "performBlock:", v7);

  }
}

void __57__ICNoteEditorViewController_noteAnalyticsAddAttachment___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqual:", v5);

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "eventReporter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "submitAttachmentAddEventForAttachment:", *(_QWORD *)(a1 + 32));

  }
}

- (void)observeAttachmentDeleted:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  ICNoteEditorViewController *v9;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D635E8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__ICNoteEditorViewController_observeAttachmentDeleted___block_invoke;
    v7[3] = &unk_1EA7DD498;
    v8 = v5;
    v9 = self;
    objc_msgSend(v6, "performBlock:", v7);

  }
}

void __55__ICNoteEditorViewController_observeAttachmentDeleted___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqual:", v5);

  if (v6)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "attachmentType") == 12)
    {
      objc_msgSend(*(id *)(a1 + 40), "eventReporter");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v7, "note");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "submitTableRemoveEventForAttachment:inNote:", v7, v8);
LABEL_9:

      return;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "attachmentType") == 11)
    {
      objc_msgSend(*(id *)(a1 + 40), "eventReporter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "galleryModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pushStartDocScanPageCountData:", objc_msgSend(v10, "subAttachmentCount"));

      objc_msgSend(*(id *)(a1 + 40), "eventReporter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pushDocScanDataWithID:actionType:stage:", v12, 5, 2);

      objc_msgSend(*(id *)(a1 + 40), "eventReporter");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "note");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "submitDocScanEventForNote:pageCount:", v8, 0);
      goto LABEL_9;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "attachmentType") == 10
      || objc_msgSend(*(id *)(a1 + 32), "attachmentType") == 13)
    {
      v13 = objc_alloc(MEMORY[0x1E0CD1158]);
      objc_msgSend(*(id *)(a1 + 32), "mergeableData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (id)objc_msgSend(v13, "initWithData:error:", v14, 0);

      objc_msgSend(*(id *)(a1 + 40), "eventReporter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "note");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "submitInlineDrawingDataForDrawingDeletion:drawingID:forNote:", v17, v15, v16);

      goto LABEL_9;
    }
  }
}

- (void)observeDrawingConverted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  NSObject *v16;
  ICNoteEditorViewController *v17;
  id v18;
  id v19;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D64940]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v8, "existingObjectWithID:error:", v6, &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;
  ICDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = v10 == 0;
  else
    v12 = 0;
  if (v12)
  {
    objc_msgSend(v11, "managedObjectContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __54__ICNoteEditorViewController_observeDrawingConverted___block_invoke;
    v15[3] = &unk_1EA7DDBF0;
    v16 = v11;
    v17 = self;
    v18 = v4;
    objc_msgSend(v14, "performBlock:", v15);

    v13 = v16;
  }
  else
  {
    v13 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ICNoteEditorViewController observeDrawingConverted:].cold.1();
  }

}

void __54__ICNoteEditorViewController_observeDrawingConverted___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(a1[4], "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqual:", v5);

  if (v6)
  {
    objc_msgSend(a1[6], "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D64938]);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "BOOLValue"))
      v8 = 2;
    else
      v8 = 1;
    v9 = objc_alloc(MEMORY[0x1E0CD1158]);
    objc_msgSend(a1[4], "mergeableData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithData:error:", v10, 0);

    objc_msgSend(a1[5], "eventReporter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "note");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "submitFullscreenDrawingToInlineDrawingEventForNote:drawing:drawingID:method:", v13, v11, v14, v8);

  }
}

- (void)lockNoteManagerWillToggleLock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICCheckedDynamicCast();
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "note");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
    -[ICNoteEditorViewController setTogglingLock:](self, "setTogglingLock:", 1);

}

- (void)lockNoteManagerDidToggleLock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICCheckedDynamicCast();
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "note");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    objc_msgSend(v11, "updatedNote");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = -[ICNoteEditorViewController userWantsToSeeDateLabel](self, "userWantsToSeeDateLabel");
      objc_msgSend(v11, "updatedNote");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController setNote:](self, "setNote:", v10);

      -[ICNoteEditorViewController setUserWantsToSeeDateLabel:](self, "setUserWantsToSeeDateLabel:", v9);
      UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], 0);
    }
    -[ICNoteEditorViewController setTogglingLock:](self, "setTogglingLock:", 0);
    -[ICNoteEditorViewController cleanupAfterBarSourcedPopoverPresentation](self, "cleanupAfterBarSourcedPopoverPresentation");
  }

}

- (void)attachmentBrickDidChangeSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_opt_class();
  -[ICNoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v7, "styler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "refreshTextStylingForTextStorage:withTextController:", v7, v6);
}

- (void)tableCellFirstResponderChanged
{
  void *v3;
  void *v4;
  id v5;

  -[ICNoteEditorBaseViewController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICNoteEditorViewController mentionsController](self, "mentionsController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorBaseViewController note](self, "note");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tableCellFirstResponderChangedInNote:", v4);

  }
}

- (void)sharedWithYouControllerDidUpdateHighlights:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__ICNoteEditorViewController_sharedWithYouControllerDidUpdateHighlights___block_invoke;
  block[3] = &unk_1EA7DD2D8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __73__ICNoteEditorViewController_sharedWithYouControllerDidUpdateHighlights___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCollaborationBarButtonItem:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "resetBarButtonsAnimated:", 0);
}

- (void)passwordEntryAlertControllerAttemptDidFail:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICNoteEditorViewController eventReporter](self, "eventReporter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "note");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "submitPasswordFailEventForModernNote:", v7);

  }
}

- (void)authenticationAuthenticateBiometricsAttemptDidFail:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICNoteEditorViewController eventReporter](self, "eventReporter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "note");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "submitBiometricsFailEventForModernNote:", v7);

  }
}

- (BOOL)managedObjectContextChangeControllerShouldUpdateImmediately:(id)a3
{
  return 1;
}

id __116__ICNoteEditorViewController_managedObjectContextChangeController_managedObjectIDsToUpdateForUpdatedManagedObjects___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "ic_isInlineAttachmentType"))
  {
    objc_msgSend(v2, "objectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __116__ICNoteEditorViewController_managedObjectContextChangeController_managedObjectIDsToUpdateForUpdatedManagedObjects___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;

  v3 = a2;
  objc_msgSend(v3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    objc_msgSend(v3, "changedValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count") != 1)
      goto LABEL_8;
    objc_msgSend(v8, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("lastOpenedDate"));

    if (!v11)
      goto LABEL_8;

LABEL_7:
    v4 = 0;
LABEL_8:

    return v4;
  }
  objc_msgSend(v3, "objectID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if ((v14 & 1) == 0)
  {
    v8 = v4;
    goto LABEL_7;
  }
  return v4;
}

- (void)managedObjectContextChangeController:(id)a3 performUpdatesForManagedObjectIDs:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
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
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[ICNoteEditorViewController inlineAttachmentChangeController](self, "inlineAttachmentChangeController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[ICNoteEditorViewController managedObjectContextChangeController:performUpdatesForManagedObjectIDs:].cold.1();

    objc_opt_class();
    -[ICNoteEditorViewController textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    -[ICNoteEditorViewController textView](self, "textView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textLayoutManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(v11, "styler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (ICInternalSettingsIsTextKit2Enabled())
      objc_msgSend(v14, "reloadInlineAttachments");
    else
      objc_msgSend(v16, "refreshTextStylingForTextStorage:withTextController:", v11, v16);
    -[ICNoteEditorBaseViewController note](self, "note");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "visibleAttachmentTextStoragesForTextLayoutManager:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "allValues");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ic_flatMap:", &__block_literal_global_442);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v27;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v27 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(v16, "refreshTextStylingForTextStorage:withTextController:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v25++), v16, (_QWORD)v26);
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v23);
    }

  }
  else
  {
    -[ICNoteEditorViewController noteAndFolderChangeController](self, "noteAndFolderChangeController");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v5)
      -[ICNoteEditorViewController noteOrFolderChangedCallback](self, "noteOrFolderChangedCallback");
    else
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICNoteEditorViewController managedObjectContextChangeController:performUpdatesForManagedObjectIDs:]", 1, 0, CFSTR("Need to update this method for a new change controller"));
  }

}

uint64_t __101__ICNoteEditorViewController_managedObjectContextChangeController_performUpdatesForManagedObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allObjects");
}

- (void)updateTextInputAccessoryViewForDidBeginEditing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD v24[4];
  id v25;
  ICNoteEditorViewController *v26;
  uint8_t buf[4];
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICNoteEditorViewController textViewInputAccessoryView](self, "textViewInputAccessoryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController noteFormattingController](self, "noteFormattingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = -[ICNoteEditorViewController styleSelectorInputViewShowing](self, "styleSelectorInputViewShowing");

    if (v9)
      goto LABEL_8;
  }
  else
  {

  }
  objc_msgSend(v4, "inputAccessoryView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setInputAccessoryView:", v5);
  if (!v10 && v5)
    objc_msgSend(v4, "reloadInputViews");
LABEL_8:
  -[ICNoteEditorViewController keyboardAnimateInFinishTime](self, "keyboardAnimateInFinishTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[ICNoteEditorViewController keyboardAnimateInFinishTime](self, "keyboardAnimateInFinishTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceNow");
    v14 = v13;

    if (v14 <= 0.0 || v14 >= 0.5)
    {
      v15 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v28 = v14;
        _os_log_impl(&dword_1DD7B0000, v15, OS_LOG_TYPE_DEFAULT, "Invalid keyboard animate in finish time interval: %g, falling back to default", buf, 0xCu);
      }

      v14 = 0.1;
    }
    -[ICNoteEditorViewController setKeyboardAnimateInFinishTime:](self, "setKeyboardAnimateInFinishTime:", 0);
  }
  else
  {
    v14 = 0.1;
  }
  if (!objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode")
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "userInterfaceIdiom"),
        v16,
        !v17))
  {
    objc_msgSend(v5, "showWithDelay:", v14);
    if (!-[ICNoteEditorViewController hasKeyboardBeenVisibleBefore](self, "hasKeyboardBeenVisibleBefore"))
    {
      -[ICNoteEditorViewController setHasKeyboardBeenVisibleBefore:](self, "setHasKeyboardBeenVisibleBefore:", 1);
      -[ICNoteEditorViewController view](self, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "window");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "frame");
      v21 = v20;
      v23 = v22;

      -[ICNoteEditorViewController setShouldInputAccessoryViewButtonsBeVisible:](self, "setShouldInputAccessoryViewButtonsBeVisible:", v21 < v23);
    }
    objc_msgSend(v5, "setButtonsVisible:", -[ICNoteEditorViewController shouldInputAccessoryViewButtonsBeVisible](self, "shouldInputAccessoryViewButtonsBeVisible"));
    if (v5)
      -[ICNoteEditorViewController updateTextViewContentInsetsAnimated:](self, "updateTextViewContentInsetsAnimated:", 1);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __77__ICNoteEditorViewController_updateTextInputAccessoryViewForDidBeginEditing___block_invoke;
    v24[3] = &unk_1EA7DD498;
    v25 = v4;
    v26 = self;
    dispatch_async(MEMORY[0x1E0C80D38], v24);

  }
}

uint64_t __77__ICNoteEditorViewController_updateTextInputAccessoryViewForDidBeginEditing___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEditing");
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "isEditingOnSecureScreen");
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(a1 + 40), "showOrHideActivityStreamToolbarIfNeeded");
  }
  return result;
}

- (void)updateTextInputAccessoryViewForDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  -[ICNoteEditorViewController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isFirstResponder") & 1) != 0)
  {
LABEL_5:

    goto LABEL_6;
  }
  -[ICNoteEditorViewController auxiliaryResponder](self, "auxiliaryResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFirstResponder");

  if ((v6 & 1) == 0)
  {
    -[ICNoteEditorViewController textViewInputAccessoryView](self, "textViewInputAccessoryView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController setShouldInputAccessoryViewButtonsBeVisible:](self, "setShouldInputAccessoryViewButtonsBeVisible:", objc_msgSend(v4, "buttonsVisible"));
    objc_msgSend(v4, "setButtonsVisible:", 0);
    objc_msgSend(v4, "hide");
    -[ICNoteEditorViewController textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInputAccessoryView:", 0);

    -[ICNoteEditorViewController textView](self, "textView");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v9)
      -[ICNoteEditorViewController showOrHideActivityStreamToolbarIfNeeded](self, "showOrHideActivityStreamToolbarIfNeeded");
    goto LABEL_5;
  }
LABEL_6:

}

- (void)inputAccessoryDisclosureStateWillChange:(id)a3
{
  void *v4;
  char v5;

  -[ICNoteEditorViewController textViewInputAccessoryView](self, "textViewInputAccessoryView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "buttonsVisible");

  if ((v5 & 1) == 0)
    -[ICNoteEditorViewController resetBarButtonsAnimated:](self, "resetBarButtonsAnimated:", 0);
}

- (void)inputAccessoryDisclosureStateDidChange:(id)a3 tapped:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  CGFloat v34;
  double MaxY;
  double v36;
  double v37;
  void *v38;
  double v39;
  CGRect v40;
  CGRect v41;

  v4 = a4;
  -[ICNoteEditorViewController updateTextViewContentInsetsAnimated:](self, "updateTextViewContentInsetsAnimated:", 1);
  -[ICNoteEditorViewController textViewInputAccessoryView](self, "textViewInputAccessoryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "buttonsVisible");

  if (!(_DWORD)v7)
  {
    if (!v4)
      return;
LABEL_9:
    -[ICNoteEditorViewController setShouldInputAccessoryViewButtonsBeVisible:](self, "setShouldInputAccessoryViewButtonsBeVisible:", v7);
    return;
  }
  -[ICNoteEditorViewController textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectedRange");
  v10 = v9;

  if (!v10)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectedTextRange");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "end");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "caretRectForPosition:", v14);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    -[ICNoteEditorViewController textView](self, "textView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;

    -[ICNoteEditorViewController textView](self, "textView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "contentInset");
    v34 = v31 - v33;

    v39 = v16;
    v40.origin.x = v16;
    v40.origin.y = v18;
    v40.size.width = v20;
    v40.size.height = v22;
    MaxY = CGRectGetMaxY(v40);
    v41.origin.x = v25;
    v41.origin.y = v27;
    v41.size.width = v29;
    v41.size.height = v34;
    v36 = MaxY - CGRectGetMaxY(v41);
    if (v36 > 0.0)
    {
      -[ICNoteEditorViewController inputAccessoryViewHeight](self, "inputAccessoryViewHeight");
      if (v36 < v22 + v37)
      {
        -[ICNoteEditorViewController textView](self, "textView");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "scrollRectToVisible:animated:", 1, v39, v18, v20, v22);

      }
    }
  }
  if (v4)
    goto LABEL_9;
}

- (void)notesContextRefreshNotification:(id)a3
{
  id v4;

  -[ICNoteEditorViewController fetchAll](self, "fetchAll", a3);
  -[ICNoteEditorBaseViewController note](self, "note");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refreshNoteTextFromDataStore");

}

- (void)fetchAll
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  -[ICNoteEditorBaseViewController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D63BB8];
    -[ICNoteEditorBaseViewController note](self, "note");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorBaseViewController note](self, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v4, "refreshAllOfNoteWithIdentifier:context:", v5, v7);

  }
}

- (void)viewControllerWillStartEditModeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ICNoteEditorViewController *v8;
  void *v9;
  char v10;
  id v11;

  v11 = a3;
  objc_opt_class();
  objc_msgSend(v11, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "ic_windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController ic_windowScene](self, "ic_windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    objc_msgSend(v11, "object");
    v8 = (ICNoteEditorViewController *)objc_claimAutoreleasedReturnValue();
    if (v8 == self || (-[ICNoteEditorViewController isEditing](self, "isEditing") & 1) == 0)
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D64DE8], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isSecureScreenShowing");

      if ((v10 & 1) == 0)
        -[ICNoteEditorViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
    }
  }

}

- (void)submitChecklistAnalyticsEventForActionType:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[ICNoteEditorViewController textController](self, "textController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "selectedRange");
  -[ICNoteEditorViewController textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "analyticsInfoForChecklistAtIndex:textView:", v7, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "submitChecklistUsageEventForModernNote:countOfCheckedItems:countOfTotalItems:checklistActionType:", v10, objc_msgSend(v11, "numberOfCheckedItems"), objc_msgSend(v11, "numberOfItems"), a3);

}

- (void)donateEditingIntentIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;

  -[ICNoteEditorBaseViewController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    if (-[ICNoteEditorViewController isEditingNewNote](self, "isEditingNewNote"))
    {
      -[ICNoteEditorBaseViewController note](self, "note");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICIntentsUtilities interactionForCreateNote:](ICIntentsUtilities, "interactionForCreateNote:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICIntentsUtilities donateInteraction:](ICIntentsUtilities, "donateInteraction:", v7);
      goto LABEL_4;
    }
    -[ICNoteEditorViewController originalEndOfNote](self, "originalEndOfNote");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[ICNoteEditorBaseViewController note](self, "note");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textStorage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mergeableString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController originalEndOfNote](self, "originalEndOfNote");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "characterRangesForSelection:", v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "rangeValue");

      -[ICNoteEditorBaseViewController note](self, "note");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textStorage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "length") - v14;

      if (v17 < 2)
        goto LABEL_10;
      -[ICNoteEditorBaseViewController note](self, "note");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "textStorage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");

      if (v14 >= v20)
        goto LABEL_10;
      -[ICNoteEditorBaseViewController note](self, "note");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "textStorage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "string");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "substringWithRange:", v14, v17);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "hasPrefix:", CFSTR("\n")))
      {
        objc_msgSend(v7, "substringFromIndex:", 1);
        v24 = objc_claimAutoreleasedReturnValue();

        -[ICNoteEditorBaseViewController note](self, "note");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICIntentsUtilities interactionForAppendToNote:withAppendedText:](ICIntentsUtilities, "interactionForAppendToNote:withAppendedText:", v25, v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICIntentsUtilities donateInteraction:](ICIntentsUtilities, "donateInteraction:", v26);

        v7 = (void *)v24;
      }
LABEL_4:

LABEL_10:
    }
  }
  -[ICNoteEditorViewController setIsEditingNewNote:](self, "setIsEditingNewNote:", 0);
  -[ICNoteEditorViewController setOriginalEndOfNote:](self, "setOriginalEndOfNote:", 0);
}

- (void)didEndEditingNote
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  id v6;

  -[ICNoteEditorBaseViewController note](self, "note");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[ICNoteEditorViewController isAddingImageAttachment](self, "isAddingImageAttachment");

    if (!v5)
    {
      -[ICNoteEditorViewController saveNote](self, "saveNote");
      -[ICNoteEditorViewController bluetoothKeyboardHintViewController](self, "bluetoothKeyboardHintViewController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "didEditNote");

    }
  }
}

- (void)saveNote
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_1DD7B0000, a2, v5, "noteEditor saving note %@", v6);

  OUTLINED_FUNCTION_0_0();
}

- (void)saveInlineDrawings
{
  void *v2;
  id v3;

  -[ICNoteEditorViewController textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textStorage");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", *MEMORY[0x1E0DC10F8], 0, objc_msgSend(v3, "length"), 0, &__block_literal_global_447);
}

void __48__ICNoteEditorViewController_saveInlineDrawings__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  ICDynamicCast();
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    objc_msgSend(v4, "saveIfNeeded");
    v3 = v4;
  }

}

- (void)updateInlineDrawings
{
  void *v3;
  void *v4;
  id v5;

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    objc_opt_class();
    -[ICNoteEditorViewController textView](self, "textView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "updateInlineDrawingViews");
  }
}

- (id)attributedStringFromHTML:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB3778]);
  v19 = *MEMORY[0x1E0DC1118];
  v20[0] = *MEMORY[0x1E0DC1148];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v7 = (void *)objc_msgSend(v5, "initWithData:options:documentAttributes:error:", v4, v6, 0, &v18);
  v8 = v18;

  if (v8)
  {
    NSLog(CFSTR("Failed to convert HTML string to attributed string: %@"), v8);
    v9 = objc_alloc_init(MEMORY[0x1E0CB3778]);

    v7 = v9;
  }
  if (objc_msgSend(v3, "rangeOfString:", CFSTR("<meta name=\"Generator\" content=\"Cocoa HTML Writer\">")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__4;
    v16[4] = __Block_byref_object_dispose__4;
    v17 = 0;
    v10 = objc_msgSend(v7, "length");
    v11 = *MEMORY[0x1E0DC1138];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__ICNoteEditorViewController_attributedStringFromHTML___block_invoke;
    v13[3] = &unk_1EA7DE550;
    v15 = v16;
    v14 = v7;
    objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v10, 2, v13);

    _Block_object_dispose(v16, 8);
  }

  return v7;
}

void __55__ICNoteEditorViewController_attributedStringFromHTML___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a2;
  v8 = v7;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (a4 == 1)
  {
    v13 = v7;
    v10 = v7;
    v11 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
LABEL_5:

    v8 = v13;
    goto LABEL_6;
  }
  v12 = *(void **)(v9 + 40);
  if (v12)
  {
    v13 = v8;
    objc_msgSend(v12, "pointSize");
    objc_msgSend(v13, "fontWithSize:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v11, a3, a4);
    goto LABEL_5;
  }
LABEL_6:

}

- (_NSRange)visibleRange
{
  int IsTextKit2Enabled;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
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
  void *v26;
  void *v27;
  double MaxX;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSUInteger v33;
  NSUInteger v34;
  _NSRange result;
  CGRect v36;
  CGRect v37;

  IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  -[ICNoteEditorViewController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (IsTextKit2Enabled)
  {
    objc_msgSend(v4, "textLayoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textViewportLayoutController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewportRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICNoteEditorViewController textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textLayoutManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "ic_rangeForTextRange:", v8);
    v13 = v12;
  }
  else
  {
    objc_msgSend(v4, "textStorage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v14, "length");

    if (!v11)
    {
      v13 = 0;
      goto LABEL_7;
    }
    -[ICNoteEditorViewController textView](self, "textView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    -[ICNoteEditorViewController textView](self, "textView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bounds");
    objc_msgSend(v24, "characterRangeAtPoint:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "start");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICNoteEditorViewController textView](self, "textView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v36.origin.x = v17;
    v36.origin.y = v19;
    v36.size.width = v21;
    v36.size.height = v23;
    MaxX = CGRectGetMaxX(v36);
    v37.origin.x = v17;
    v37.origin.y = v19;
    v37.size.width = v21;
    v37.size.height = v23;
    objc_msgSend(v27, "characterRangeAtPoint:", MaxX, CGRectGetMaxY(v37));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "end");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICNoteEditorViewController textView](self, "textView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "beginningOfDocument");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v30, "offsetFromPosition:toPosition:", v32, v8);

    -[ICNoteEditorViewController textView](self, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "offsetFromPosition:toPosition:", v8, v9);
  }

LABEL_7:
  v33 = v11;
  v34 = v13;
  result.length = v34;
  result.location = v33;
  return result;
}

- (id)linkForSelection
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__4;
  v26 = __Block_byref_object_dispose__4;
  v27 = 0;
  -[ICNoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedRange");
  v6 = v5;

  if (v6)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0DC1160];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __46__ICNoteEditorViewController_linkForSelection__block_invoke;
    v21[3] = &unk_1EA7DD260;
    v21[4] = &v22;
    objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v9, v4, v6, 0, v21);
  }
  else
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v4 < objc_msgSend(v11, "length");

    if (!v12)
      goto LABEL_6;
    -[ICNoteEditorViewController textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1160], v4, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v23[5];
    v23[5] = v13;

  }
LABEL_6:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = (id)v23[5];
LABEL_10:
    v16 = v15;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v23[5]);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (v23[5])
  {
    v17 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v19;
      _os_log_impl(&dword_1DD7B0000, v17, OS_LOG_TYPE_DEFAULT, "Cannot convert link attribute of type %@ to an NSURL", buf, 0xCu);

    }
  }
  v16 = 0;
LABEL_16:
  _Block_object_dispose(&v22, 8);

  return v16;
}

void __46__ICNoteEditorViewController_linkForSelection__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v8;
  uint64_t v9;
  id *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a2;
  if (v8)
  {
    v13 = v8;
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v9 + 40);
    v10 = (id *)(v9 + 40);
    v11 = v12;
    if (v12)
    {
      *v10 = 0;

      *a5 = 1;
    }
    else
    {
      objc_storeStrong(v10, a2);
    }
    v8 = v13;
  }

}

- (BOOL)canFindInNote
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[ICNoteEditorBaseViewController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isPasswordProtectedAndLocked") & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      -[ICNoteEditorViewController invitation](self, "invitation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        v5 = 0;
      else
        v5 = -[ICNoteEditorViewController ic_isViewVisible](self, "ic_isViewVisible");

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)canOpenLink
{
  BOOL v3;
  void *v4;

  if ((objc_msgSend(MEMORY[0x1E0DC3708], "ic_isLocked") & 1) != 0)
    return 0;
  -[ICNoteEditorViewController linkForSelection](self, "linkForSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v3 = +[ICExtensionSafeAPIShims canOpenURL:](ICExtensionSafeAPIShims, "canOpenURL:", v4);
  else
    v3 = 0;

  return v3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  objc_super v47;
  objc_super v48;
  objc_super v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_topmostPresentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3B18];
  -[ICNoteEditorViewController textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "selectedRange");
  objc_msgSend(v10, "valueWithRange:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (sel_decreaseIndentation_ == a3 || sel_increaseIndentation_ == a3)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "isEditing"))
    {
      LOBYTE(v18) = -[ICNoteEditorViewController canIndentLeft](self, "canIndentLeft")
                 || -[ICNoteEditorViewController canIndentRight](self, "canIndentRight");
      goto LABEL_52;
    }
    goto LABEL_51;
  }
  if (sel_checkAll_ == a3)
  {
    -[ICNoteEditorViewController textController](self, "textController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v20;
    v23 = 0;
LABEL_34:
    LOBYTE(v18) = objc_msgSend(v22, "checklistItemExistsMarkedCompleted:inTextView:forRanges:", v23, v21, v15);
LABEL_35:

LABEL_52:
    goto LABEL_53;
  }
  if (sel_uncheckAll_ == a3)
  {
    -[ICNoteEditorViewController textController](self, "textController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v20;
    v23 = 1;
    goto LABEL_34;
  }
  if (sel_removeChecked_ == a3)
  {
    -[ICNoteEditorViewController textController](self, "textController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "checklistItemExistsMarkedCompleted:inTextView:forRanges:", 1, v25, v15);

    -[ICNoteEditorViewController textController](self, "textController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "selectedRange");
    v31 = objc_msgSend(v27, "containsOnlyChecklistItemsInTextView:forRange:", v18, v29, v30);

    LOBYTE(v18) = v26 & v31;
    goto LABEL_53;
  }
  if (sel_moveCheckedToBottom_ == a3)
  {
    -[ICNoteEditorViewController textController](self, "textController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "checklistItemExistsMarkedCompleted:inTextView:forRanges:", 0, v33, v15);

    -[ICNoteEditorViewController textController](self, "textController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend((id)v37, "selectedRange");
    v40 = objc_msgSend(v35, "canMoveCheckedChecklistsToBottomInTextView:forRange:", v36, v38, v39);

    -[ICNoteEditorViewController textController](self, "textController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "selectedRange");
    LOBYTE(v37) = objc_msgSend(v18, "containsOnlyChecklistItemsInTextView:forRange:", v41, v43, v44);

    LOBYTE(v18) = v34 & v40 & v37;
    goto LABEL_53;
  }
  if (sel_performFindInNote_ == a3)
  {
    v19 = -[ICNoteEditorViewController canFindInNote](self, "canFindInNote");
    goto LABEL_39;
  }
  if (v9)
    goto LABEL_58;
  -[ICNoteEditorViewController textView](self, "textView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEditing");

  if (!v17)
    goto LABEL_58;
  if (sel_moveSelectedListItemUp_ == a3)
  {
    v19 = -[ICNoteEditorViewController canMoveSelectedListItemUp](self, "canMoveSelectedListItemUp");
    goto LABEL_39;
  }
  if (sel_moveSelectedListItemDown_ == a3)
  {
    v19 = -[ICNoteEditorViewController canMoveSelectedListItemDown](self, "canMoveSelectedListItemDown");
    goto LABEL_39;
  }
  if (sel_openLink_ == a3)
  {
    v19 = -[ICNoteEditorViewController canOpenLink](self, "canOpenLink");
    goto LABEL_39;
  }
  LOBYTE(v18) = 1;
  if (sel_tab_ == a3 || sel_shiftTab_ == a3 || sel_shiftReturn_ == a3 || sel_strikethrough_ == a3)
    goto LABEL_53;
  if (sel_indentLeft_ == a3)
  {
    v19 = -[ICNoteEditorViewController canIndentLeft](self, "canIndentLeft");
    goto LABEL_39;
  }
  if (sel_indentRight_ == a3)
  {
    v19 = -[ICNoteEditorViewController canIndentRight](self, "canIndentRight");
    goto LABEL_39;
  }
  if (sel_copy_ == a3 || sel_cut_ == a3)
  {
    v49.receiver = self;
    v49.super_class = (Class)ICNoteEditorViewController;
    if (-[ICNoteEditorViewController canPerformAction:withSender:](&v49, sel_canPerformAction_withSender_, a3, v6))
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v18) = objc_msgSend(v45, "isSelectionCopyableSize");
      goto LABEL_47;
    }
    goto LABEL_58;
  }
  if (sel__share_ == a3)
  {
    v48.receiver = self;
    v48.super_class = (Class)ICNoteEditorViewController;
    if (-[ICNoteEditorViewController canPerformAction:withSender:](&v48, sel_canPerformAction_withSender_, a3, v6))
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "isSelectionCopyableSize"))
      {
        -[ICNoteEditorViewController textView](self, "textView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v18) = objc_msgSend(v21, "ic_isInSecureWindow") ^ 1;
        goto LABEL_35;
      }
LABEL_51:
      LOBYTE(v18) = 0;
      goto LABEL_52;
    }
LABEL_58:
    LOBYTE(v18) = 0;
    goto LABEL_53;
  }
  if (sel_addToTags_ == a3)
  {
    v19 = -[ICNoteEditorViewController canAddToTags](self, "canAddToTags");
    goto LABEL_39;
  }
  if (sel_convertToText_ == a3)
  {
    v19 = -[ICNoteEditorViewController canConvertToText](self, "canConvertToText");
    goto LABEL_39;
  }
  if (sel_convertToTag_ == a3)
  {
    v19 = -[ICNoteEditorViewController canConvertToTag](self, "canConvertToTag");
    goto LABEL_39;
  }
  if (sel_openLinkEditor_ == a3)
  {
    if (-[ICNoteEditorBaseViewController isEditingOnSecureScreen](self, "isEditingOnSecureScreen"))
      goto LABEL_58;
    -[ICNoteEditorBaseViewController note](self, "note");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = objc_msgSend(v45, "isSharedReadOnly") ^ 1;
LABEL_47:

    goto LABEL_53;
  }
  if (sel_toggleBlockQuote_ != a3)
  {
    v47.receiver = self;
    v47.super_class = (Class)ICNoteEditorViewController;
    v19 = -[ICNoteEditorViewController canPerformAction:withSender:](&v47, sel_canPerformAction_withSender_, a3, v6);
LABEL_39:
    LOBYTE(v18) = v19;
  }
LABEL_53:

  return (char)v18;
}

- (OS_dispatch_queue)userActivityUpdateQueue
{
  ICNoteEditorViewController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *userActivityUpdateQueue;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_userActivityUpdateQueue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.notes.user-activity", v3);
    userActivityUpdateQueue = v2->_userActivityUpdateQueue;
    v2->_userActivityUpdateQueue = (OS_dispatch_queue *)v4;

  }
  objc_sync_exit(v2);

  return v2->_userActivityUpdateQueue;
}

- (void)updateNoteUserActivityState
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  char v58;
  id v59;
  id v60;
  _QWORD block[4];
  id v62;
  id v63;
  id v64;
  id v65;
  ICNoteEditorViewController *v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  void *v70;
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
  -[ICNoteEditorViewController updateNoteUserActivityStateDelayer](self, "updateNoteUserActivityStateDelayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelPreviousFireRequests");

  -[ICNoteEditorBaseViewController note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICNoteEditorViewController noteUserActivity](self, "noteUserActivity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

    }
    else
    {
      -[ICNoteEditorBaseViewController note](self, "note");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEmpty");

      if ((v7 & 1) != 0)
        return;
    }
    if (-[ICNoteEditorViewController isDrawingStroke](self, "isDrawingStroke"))
    {
      -[ICNoteEditorViewController updateNoteUserActivityStateDelayer](self, "updateNoteUserActivityStateDelayer");
      v59 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "requestFire");

    }
    else
    {
      -[ICNoteEditorViewController noteUserActivity](self, "noteUserActivity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B10]), "initWithActivityType:", CFSTR("com.apple.notes.activity.edit-note"));
        objc_msgSend(v9, "setEligibleForSearch:", 1);
        -[ICNoteEditorBaseViewController note](self, "note");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "title");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizeForLanguage:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setTitle:", v12);

        objc_msgSend(v9, "setDelegate:", self);
        -[ICNoteEditorViewController setNoteUserActivity:](self, "setNoteUserActivity:", v9);
        -[ICNoteEditorViewController noteUserActivity](self, "noteUserActivity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "becomeCurrent");

      }
      -[ICNoteEditorBaseViewController note](self, "note");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectID");
      v60 = (id)objc_claimAutoreleasedReturnValue();

      v58 = -[ICNoteEditorViewController isEditing](self, "isEditing");
      -[ICNoteEditorBaseViewController note](self, "note");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textStorage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "mergeableString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0CB3B18];
      -[ICNoteEditorViewController textView](self, "textView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "selectedRange");
      objc_msgSend(v18, "valueWithRange:", v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "selectionForCharacterRanges:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "serialize");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICNoteEditorViewController textView](self, "textView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "bounds");
      v27 = v26;
      v29 = v28;
      v31 = v30;
      v33 = v32;

      if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
      {
        -[ICNoteEditorViewController textView](self, "textView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "layoutManager");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController textView](self, "textView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "textContainer");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "ensureLayoutForBoundingRect:inTextContainer:", v37, v27, v29, v31, v33);

      }
      v38 = -[ICNoteEditorViewController visibleRange](self, "visibleRange");
      v40 = v39;
      -[ICNoteEditorBaseViewController note](self, "note");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "textStorage");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "mergeableString");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)MEMORY[0x1E0CB3B18];
      v45 = -[ICNoteEditorViewController visibleRange](self, "visibleRange");
      objc_msgSend(v44, "valueWithRange:", v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v47;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "selectionForCharacterRanges:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "serialize");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICNoteEditorViewController currentScrollState](self, "currentScrollState");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController userActivityUpdateQueue](self, "userActivityUpdateQueue");
      v52 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57__ICNoteEditorViewController_updateNoteUserActivityState__block_invoke;
      block[3] = &unk_1EA7DE5A0;
      v69 = v58;
      v62 = v60;
      v63 = v57;
      v67 = v38;
      v68 = v40;
      v64 = v51;
      v65 = v50;
      v66 = self;
      v53 = v50;
      v54 = v51;
      v55 = v57;
      v56 = v60;
      dispatch_async(v52, block);

    }
  }
}

void __57__ICNoteEditorViewController_updateNoteUserActivityState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  char v15;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "workerManagedObjectContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__ICNoteEditorViewController_updateNoteUserActivityState__block_invoke_2;
    v7[3] = &unk_1EA7DE578;
    v8 = *(id *)(a1 + 32);
    v9 = v3;
    v15 = *(_BYTE *)(a1 + 88);
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    v14 = *(_OWORD *)(a1 + 72);
    v4 = *(id *)(a1 + 56);
    v5 = *(_QWORD *)(a1 + 64);
    v12 = v4;
    v13 = v5;
    v6 = v3;
    objc_msgSend(v6, "performBlockAndWait:", v7);

  }
}

void __57__ICNoteEditorViewController_updateNoteUserActivityState__block_invoke_2(uint64_t a1)
{
  void *v2;
  ICNoteUserActivityState *v3;
  void *v4;
  _BOOL8 CanContinueActivityForNote;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D63BB8], "ic_existingObjectWithID:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v9 = v2;
    v3 = -[ICNoteUserActivityState initWithNote:]([ICNoteUserActivityState alloc], "initWithNote:", v2);
    -[ICNoteUserActivityState setEditing:](v3, "setEditing:", *(unsigned __int8 *)(a1 + 96));
    if (*(_BYTE *)(a1 + 96))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteUserActivityState setModificationDate:](v3, "setModificationDate:", v4);

    }
    -[ICNoteUserActivityState setSelectionRangeData:](v3, "setSelectionRangeData:", *(_QWORD *)(a1 + 48));
    -[ICNoteUserActivityState setScrollState:](v3, "setScrollState:", *(_QWORD *)(a1 + 56));
    -[ICNoteUserActivityState setVisibleRange:](v3, "setVisibleRange:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
    -[ICNoteUserActivityState setVisibleRangeData:](v3, "setVisibleRangeData:", *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 72), "setNoteUserActivityState:", v3);
    CanContinueActivityForNote = ICNotesCanContinueActivityForNote(v9);
    objc_msgSend(*(id *)(a1 + 72), "noteUserActivity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEligibleForHandoff:", CanContinueActivityForNote);

    objc_msgSend(*(id *)(a1 + 72), "noteUserActivity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSupportsContinuationStreams:", CanContinueActivityForNote);

    objc_msgSend(*(id *)(a1 + 72), "noteUserActivity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsSave:", 1);

    v2 = v9;
  }

}

- (void)removeCurrentScrollState
{
  void *v3;
  void *v4;
  id v5;

  -[ICNoteEditorViewController savedScrollStates](self, "savedScrollStates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_removeObjectForNonNilKey:", v4);

}

- (ICTextViewScrollState)currentScrollState
{
  void *v2;
  void *v3;

  -[ICNoteEditorViewController textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICTextViewScrollState scrollStateForTextView:](ICTextViewScrollState, "scrollStateForTextView:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTextViewScrollState *)v3;
}

void __60__ICNoteEditorViewController_setArchivedScrollStateToApply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "note");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __60__ICNoteEditorViewController_setArchivedScrollStateToApply___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(void **)(v1 + 1440);
  if (v2 == *(void **)(result + 40))
  {
    v3 = result;
    *(_QWORD *)(v1 + 1440) = 0;

    return objc_msgSend(*(id *)(v3 + 32), "setShouldOverscrollScrollState:", 0);
  }
  return result;
}

void __57__ICNoteEditorViewController_applyScrollStateIfAvailable__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "archivedScrollStateToApply");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)submitNoteEditEventIfNecessary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[ICNoteEditorBaseViewController note](self, "note");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "modificationDate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[ICNoteEditorBaseViewController note](self, "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modificationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController noteLastModificationDate](self, "noteLastModificationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToDate:", v7);

    if ((v8 & 1) != 0)
      return;
    -[ICNoteEditorViewController eventReporter](self, "eventReporter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorBaseViewController note](self, "note");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "submitNoteEditEventForModernNote:fromQuickNote:", v10, -[ICNoteEditorBaseViewController isEditingOnSecureScreen](self, "isEditingOnSecureScreen"));

    -[ICNoteEditorBaseViewController note](self, "note");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "modificationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController setNoteLastModificationDate:](self, "setNoteLastModificationDate:", v11);

  }
}

- (void)handleMenuBarButtonTap:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v7, "contextMenuInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_presentMenuAtLocation:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)updateParticipantsInDrawings
{
  performBlockOnMainThread();
}

void __58__ICNoteEditorViewController_updateParticipantsInDrawings__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "textView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textStorage");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", *MEMORY[0x1E0DC10F8], 0, objc_msgSend(v4, "length"), 0, &__block_literal_global_515);
}

void __58__ICNoteEditorViewController_updateParticipantsInDrawings__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_class();
  ICDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      objc_msgSend(v3, "attachmentViews", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v10;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v10 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "updateAllPossibleParticipantNameTokens");
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        }
        while (v6);
      }

    }
  }

}

- (void)updateContentViewBezelsStandalone:(BOOL)a3 needsAdditionalBottomMargin:(BOOL)a4 needsAdditionalLeadingMargin:(BOOL)a5 force:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id v10;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  -[ICNoteEditorViewController backgroundView](self, "backgroundView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateContentViewBezelsStandalone:needsAdditionalBottomMargin:needsAdditionalLeadingMargin:force:", v9, v8, v7, v6);

}

- (void)submitNoteViewEventForModernNote:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D62A30], "isOptedInForAnalytics"))
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__4;
    v13[4] = __Block_byref_object_dispose__4;
    v14 = 0;
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__ICNoteEditorViewController_submitNoteViewEventForModernNote___block_invoke;
    v9[3] = &unk_1EA7DE610;
    v9[4] = self;
    v12 = v13;
    v6 = v5;
    v10 = v6;
    v7 = v4;
    v11 = v7;
    objc_msgSend(v6, "performBlockAndWait:", v9);
    -[ICNoteEditorViewController setNoteViewEventSourceObjectID:](self, "setNoteViewEventSourceObjectID:", 0);
    v8 = v7;
    performBlockOnMainThread();

    _Block_object_dispose(v13, 8);
  }

}

uint64_t __63__ICNoteEditorViewController_submitNoteViewEventForModernNote___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "noteViewEventSourceObjectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D63BB8];
    objc_msgSend(*(id *)(a1 + 32), "noteViewEventSourceObjectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ic_existingObjectWithID:context:", v4, *(_QWORD *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  objc_msgSend(*(id *)(a1 + 32), "eventReporter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submitNoteViewEventForModernNote:referringNote:collapsibleSectionAffordanceExposures:collapsibleSectionAffordanceUsages:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), objc_msgSend(*(id *)(a1 + 32), "uniqueCollapsibleSectionAffordanceExposures"), objc_msgSend(*(id *)(a1 + 32), "uniqueCollapsibleSectionAffordanceUsages"));

  return objc_msgSend(*(id *)(a1 + 32), "resetCollapsibleSectionAffordanceUsageData");
}

void __63__ICNoteEditorViewController_submitNoteViewEventForModernNote___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  int8x16_t v7;
  id v8;
  _QWORD v9[4];
  int8x16_t v10;

  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);

  if (v2 == v3)
  {
    v4 = *MEMORY[0x1E0DC10F8];
    v5 = objc_msgSend(v8, "length");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__ICNoteEditorViewController_submitNoteViewEventForModernNote___block_invoke_3;
    v9[3] = &unk_1EA7DDF00;
    v7 = *(int8x16_t *)(a1 + 32);
    v6 = (id)v7.i64[0];
    v10 = vextq_s8(v7, v7, 8uLL);
    objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v5, 0, v9);

  }
}

void __63__ICNoteEditorViewController_submitNoteViewEventForModernNote___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a2;
  objc_opt_class();
  ICDynamicCast();
  v11 = objc_claimAutoreleasedReturnValue();

  v6 = (void *)v11;
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "attachmentViewForTextAttachment:characterIndex:", v11, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    ICClassAndProtocolCast();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "paperDocumentEngagementData", &unk_1F04780A8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "hasActivity"))
      {
        objc_msgSend(*(id *)(a1 + 32), "eventReporter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "submitPDFWorkflowEngagementSummary:modernNote:", v9, *(_QWORD *)(a1 + 40));

      }
      objc_msgSend(v8, "resetPaperDocumentEngagementData");

    }
    v6 = (void *)v11;
  }

}

- (void)audioBarViewControllerDone:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICNoteEditorViewController audioBarViewController](self, "audioBarViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[ICNoteEditorViewController setAudioBarViewController:](self, "setAudioBarViewController:", 0);
  -[ICNoteEditorViewController updateTextViewContentInsetsAnimated:](self, "updateTextViewContentInsetsAnimated:", 0);
}

- (void)styleSelector:(id)a3 didSelectStyle:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[ICNoteEditorViewController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsSettingStyleWithStyleUI:", 1);

  -[ICNoteEditorViewController setCurrentTextStyle:](self, "setCurrentTextStyle:", v4);
  objc_msgSend(v6, "setCurrentBIUS:", -[ICNoteEditorViewController currentBIUSForStyleSelector](self, "currentBIUSForStyleSelector"));

  -[ICNoteEditorViewController textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsSettingStyleWithStyleUI:", 0);

  v9 = (void *)topoTextStylesToAnalyticsStyles;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  if (v12)
  {
    -[ICNoteEditorViewController eventReporter](self, "eventReporter");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorBaseViewController note](self, "note");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "submitStyleFormatEventForModernNote:styleTypeValue:", v13, v12);

  }
}

- (void)toggleBlockQuote:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[ICNoteEditorViewController textController](self, "textController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleBlockQuoteInTextView:", v5);

  -[ICNoteEditorViewController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "ic_visibleRange");
  objc_msgSend(v6, "updateStyleLayersInRange:", v8, v9);

  -[ICNoteEditorViewController textView](self, "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsLayout");

  -[ICNoteEditorViewController textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutIfNeeded");

  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "submitStyleFormatEventForModernNote:styleTypeValue:", v12, 15);

}

- (void)toggleEmphasis
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;

  -[ICNoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedRange");
  v5 = v4;

  -[ICNoteEditorViewController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "textStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0D63908];
    -[ICNoteEditorViewController textView](self, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "selectedRange");
    objc_msgSend(v8, "attribute:atIndex:effectiveRange:", v9, objc_msgSend(v10, "firstValidEmphasisLocationWithinSelection:", v12, v13), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "intValue");

  }
  else
  {
    objc_msgSend(v6, "typingAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (_QWORD *)MEMORY[0x1E0D63908];
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D63908]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v18, "intValue");

    -[ICNoteEditorViewController textView](self, "textView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "typingAttributes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v20, "mutableCopy");

    if (v15)
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, *v17);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ic_currentEmphasisColorTypeDefault());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, *v17);

    }
    v8 = (void *)objc_msgSend(v7, "copy");
    -[ICNoteEditorViewController textView](self, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTypingAttributes:", v8);
  }

  -[ICNoteEditorViewController textView](self, "textView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v23 = 0;
  else
    v23 = ic_currentEmphasisColorTypeDefault();
  objc_msgSend(v22, "ic_toggleEmphasisWithType:", v23);

  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "submitStyleFormatEventForModernNote:styleTypeValue:", v24, 16);

}

- (void)toggleEmphasisWithType:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedRange");
  v7 = v6;

  if (!v7)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "typingAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D63908]);

    }
    else
    {
      objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D63908]);
    }
    v12 = (void *)objc_msgSend(v10, "copy");
    -[ICNoteEditorViewController textView](self, "textView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTypingAttributes:", v12);

  }
  if (a3 && ic_currentEmphasisColorTypeDefault() != a3)
    ic_setCurrentEmphasisColorTypeDefault();
  -[ICNoteEditorViewController textView](self, "textView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ic_toggleEmphasisWithType:", a3);

  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "submitStyleFormatEventForModernNote:styleTypeValue:", v15, 16);

}

- (void)styleSelector:(id)a3 didChangeIndentAmount:(int64_t)a4
{
  void *v6;
  id v7;

  -[ICNoteEditorViewController textView](self, "textView", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsSettingStyleWithStyleUI:", 1);

  -[ICNoteEditorViewController indentSelectionIfPossibleByAmount:](self, "indentSelectionIfPossibleByAmount:", a4);
  -[ICNoteEditorViewController textView](self, "textView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsSettingStyleWithStyleUI:", 0);

}

- (void)styleSelectorDidIndentLeft:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  if (-[ICNoteEditorViewController currentWritingDirection](self, "currentWritingDirection") == 1)
    v5 = 1;
  else
    v5 = -1;
  -[ICNoteEditorViewController styleSelector:didChangeIndentAmount:](self, "styleSelector:didChangeIndentAmount:", v4, v5);

  if (-[ICNoteEditorViewController currentWritingDirection](self, "currentWritingDirection"))
    v6 = 13;
  else
    v6 = 14;
  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submitStyleFormatEventForModernNote:styleTypeValue:", v7, v6);

}

- (void)styleSelectorDidIndentRight:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  if (-[ICNoteEditorViewController currentWritingDirection](self, "currentWritingDirection") == 1)
    v5 = -1;
  else
    v5 = 1;
  -[ICNoteEditorViewController styleSelector:didChangeIndentAmount:](self, "styleSelector:didChangeIndentAmount:", v4, v5);

  if (-[ICNoteEditorViewController currentWritingDirection](self, "currentWritingDirection"))
    v6 = 14;
  else
    v6 = 13;
  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submitStyleFormatEventForModernNote:styleTypeValue:", v7, v6);

}

- (void)toggleBoldface
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toggleBoldface:", self);
  }
  else
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_toggleBoldface");
  }

  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "submitStyleFormatEventForModernNote:styleTypeValue:", v5, 9);

}

- (void)enableBoldface
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enableBoldface:", self);
  }
  else
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_enableBoldface");
  }

  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "submitStyleFormatEventForModernNote:styleTypeValue:", v5, 9);

}

- (void)disableBoldface
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disableBoldface:", self);
  }
  else
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_disableBoldface");
  }

  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "submitStyleFormatEventForModernNote:styleTypeValue:", v5, 9);

}

- (void)toggleItalics
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toggleItalics:", self);
  }
  else
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_toggleItalics");
  }

  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "submitStyleFormatEventForModernNote:styleTypeValue:", v5, 10);

}

- (void)enableItalics
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enableItalics:", self);
  }
  else
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_enableItalics");
  }

  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "submitStyleFormatEventForModernNote:styleTypeValue:", v5, 10);

}

- (void)disableItalics
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disableItalics:", self);
  }
  else
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_disableItalics");
  }

  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "submitStyleFormatEventForModernNote:styleTypeValue:", v5, 10);

}

- (void)toggleUnderline
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toggleUnderline:", self);
  }
  else
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_toggleUnderline");
  }

  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "submitStyleFormatEventForModernNote:styleTypeValue:", v5, 11);

}

- (void)enableUnderline
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enableUnderline:", self);
  }
  else
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_enableUnderline");
  }

  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "submitStyleFormatEventForModernNote:styleTypeValue:", v5, 11);

}

- (void)disableUnderline
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disableUnderline:", self);
  }
  else
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_disableUnderline");
  }

  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "submitStyleFormatEventForModernNote:styleTypeValue:", v5, 11);

}

- (void)toggleStrikethrough
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toggleStrikethrough:", self);
  }
  else
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_toggleStrikethrough");
  }

  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "submitStyleFormatEventForModernNote:styleTypeValue:", v5, 12);

}

- (void)enableStrikethrough
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enableStrikethrough:", self);
  }
  else
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_enableStrikethrough");
  }

  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "submitStyleFormatEventForModernNote:styleTypeValue:", v5, 12);

}

- (void)disableStrikethrough
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disableStrikethrough:", self);
  }
  else
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_disableStrikethrough");
  }

  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "submitStyleFormatEventForModernNote:styleTypeValue:", v5, 12);

}

- (void)styleSelector:(id)a3 toggleBIUS:(unint64_t)a4
{
  id v6;

  v6 = a3;
  -[ICNoteEditorViewController toggleBIUS:sender:](self, "toggleBIUS:sender:", a4, v6);
  objc_msgSend(v6, "setCurrentBIUS:", -[ICNoteEditorViewController currentBIUSForStyleSelector](self, "currentBIUSForStyleSelector"));

}

- (void)styleSelectorDidCancel:(id)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  void *v6;
  id v7;

  -[ICNoteEditorViewController showStyleSelector:animated:](self, "showStyleSelector:animated:", 0, 1);
  v4 = *MEMORY[0x1E0DC4578];
  -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "styleBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v6);

}

- (BOOL)styleSelectorShouldDisableTextStyles:(id)a3
{
  void *v3;
  char v4;

  -[ICNoteEditorViewController textView](self, "textView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ic_shouldEnableBlockQuoteForAttachmentsOnlySelection");

  return v4;
}

- (void)styleSelector:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;

  v6 = a5;
  v9 = a6;
  v10 = a4;
  -[ICNoteEditorViewController doneEditing:](self, "doneEditing:", 0);
  -[ICNoteEditorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, v6, v9);

}

- (void)styleSelectorWillShowInlineMenu:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICNoteEditorViewController currentStylesForStyleSelectorIgnoreTypingAttributes:](self, "currentStylesForStyleSelectorIgnoreTypingAttributes:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCurrentStyles:bius:animated:", v5, -[ICNoteEditorViewController currentBIUSForStyleSelector](self, "currentBIUSForStyleSelector"), 0);

}

- (BOOL)styleSelectorShouldUseCompactTopInset:(id)a3
{
  void *v5;
  char v6;

  if (-[ICNoteEditorViewController isEditingOnSystemPaperOnPad](self, "isEditingOnSystemPaperOnPad", a3))
    return 1;
  -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasCompactWidth");

  return v6;
}

- (id)currentStylesForStyleSelectorIgnoreTypingAttributes:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectedStyles");
  }
  else
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ic_selectedStylesIgnoreTypingAttributes:", v3);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)currentBIUSForStyleSelector
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  unsigned int v16;
  int v17;
  void *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  int v28;

  -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "selectedRange");
    v9 = v8;

    -[ICNoteEditorViewController textView](self, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v10, "textStorage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "attributesAtIndex:longestEffectiveRange:inRange:", v7, 0, v7, v9);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v10, "typingAttributes");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D63918]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "intValue");

    objc_msgSend(v12, "fontDescriptor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "symbolicTraits");

    v17 = v14 | (v16 >> 1);
    objc_msgSend(v12, "fontDescriptor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = objc_msgSend(v18, "symbolicTraits");

    v19 = (v14 | (2 * v16)) & 2 | v17 & 1u;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1248]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "integerValue");

    if (v21)
      v5 = v19 | 4;
    else
      v5 = v19;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC11A8]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "integerValue"))
    {

    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D63930]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "BOOLValue");

      if (!v24)
        goto LABEL_13;
    }
    v5 |= 8uLL;
LABEL_13:
    v25 = (_QWORD *)MEMORY[0x1E0D63908];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D63908]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "integerValue"))
    {

    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", *v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "BOOLValue");

      if (!v28)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    v5 |= 0x10uLL;
    goto LABEL_17;
  }
  -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "selectedStyleBIUS");
LABEL_18:

  return v5;
}

- (int64_t)currentEmphasisType
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  -[ICNoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedRange");
  v5 = v4;

  -[ICNoteEditorViewController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "textStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0D63908];
    -[ICNoteEditorViewController textView](self, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "selectedRange");
    objc_msgSend(v8, "attribute:atIndex:effectiveRange:", v9, objc_msgSend(v10, "firstValidEmphasisLocationWithinSelection:", v12, v13), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "intValue");

  }
  else
  {
    objc_msgSend(v6, "typingAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63908]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "intValue");
  }

  return ICEmphasisColorTypeForTag();
}

- (BOOL)isBlockQuoteSet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  char v21;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  -[ICNoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "selectedRange");
  v9 = objc_msgSend(v5, "ic_rangeIsValid:", v7, v8);

  if (v9)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "selectedRange");
    v16 = objc_msgSend(v12, "paragraphRangeForRange:", v14, v15);
    v18 = v17;

    -[ICNoteEditorViewController textStorage](self, "textStorage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x1E0D63928];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __45__ICNoteEditorViewController_isBlockQuoteSet__block_invoke;
    v23[3] = &unk_1EA7DD260;
    v23[4] = &v24;
    objc_msgSend(v19, "enumerateAttribute:inRange:options:usingBlock:", v20, v16, v18, 0, v23);

  }
  v21 = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v24, 8);
  return v21;
}

void __45__ICNoteEditorViewController_isBlockQuoteSet__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  void *v8;
  int v9;
  void *v10;

  v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (v10)
  {
    v9 = objc_msgSend(v10, "isBlockQuote");
    v8 = v10;
    if (v9)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a5 = 1;
    }
  }

}

- (BOOL)isOnlyBlockQuoteEnabled
{
  void *v2;
  char v3;

  -[ICNoteEditorViewController textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ic_shouldEnableBlockQuoteForAttachmentsOnlySelection");

  return v3;
}

- (ICNoteFormattingViewController)noteFormattingControllerCreateIfNecessary
{
  void *v3;
  ICNoteFormattingViewController *v4;
  void *v5;

  -[ICNoteEditorViewController noteFormattingController](self, "noteFormattingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(ICNoteFormattingViewController);
    -[ICNoteEditorViewController setNoteFormattingController:](self, "setNoteFormattingController:", v4);

    -[ICNoteEditorViewController noteFormattingController](self, "noteFormattingController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFormattingDelegate:", self);

  }
  -[ICNoteEditorViewController noteFormattingController](self, "noteFormattingController");
  return (ICNoteFormattingViewController *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)showStyleSelectorPopover:(BOOL)a3 animated:(BOOL)a4 sender:(id)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  void *v8;
  void *v9;
  uint64_t v10;
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

  v5 = a4;
  v6 = a3;
  v20 = a5;
  if (v6)
  {
    -[ICNoteEditorViewController noteFormattingControllerCreateIfNecessary](self, "noteFormattingControllerCreateIfNecessary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
        v10 = -2;
      else
        v10 = 7;
      objc_msgSend(v8, "setModalPresentationStyle:", v10);
      objc_msgSend(v8, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "backgroundColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "popoverPresentationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBackgroundColor:", v12);

      objc_msgSend(v8, "popoverPresentationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setDelegate:", self);

      objc_msgSend(v8, "popoverPresentationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setBarButtonItem:", v20);

      objc_msgSend(v8, "popoverPresentationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setPopoverLayoutMargins:", 0.0, 0.0, 0.0, 1.0);

      -[ICNoteEditorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, v5, 0);
    }
    goto LABEL_9;
  }
  -[ICNoteEditorViewController noteFormattingController](self, "noteFormattingController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentingViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[ICNoteEditorViewController noteFormattingController](self, "noteFormattingController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentingViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dismissViewControllerAnimated:completion:", v5, 0);

LABEL_9:
  }

}

- (void)setAuxiliaryStylingController:(id)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  char v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_auxiliaryStylingController);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_auxiliaryStylingController);
    if (!v5
      || (v6 = v5,
          v7 = objc_loadWeakRetained((id *)&self->_auxiliaryStylingController),
          v8 = objc_msgSend(v7, "lockSelection"),
          v7,
          v6,
          (v8 & 1) == 0))
    {
      objc_storeWeak((id *)&self->_auxiliaryStylingController, obj);
      -[ICNoteEditorViewController updateBarButtons](self, "updateBarButtons");
    }
  }

}

double __78__ICNoteEditorViewController_showStyleSelectorInputView_animated_doneEditing___block_invoke(uint64_t a1)
{
  double v1;

  objc_msgSend(*(id *)(a1 + 32), "preferredContentSize");
  return v1;
}

- (void)setCurrentTextStyle:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextStyleForCurrentSelection:", v3);
  }
  else
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ic_setTextStyleForCurrentSelection:", v3);
  }

}

- (void)setTextStyle:(unsigned int)a3 sender:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v4 = *(_QWORD *)&a3;
  -[ICNoteEditorViewController textView](self, "textView", *(_QWORD *)&a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsSettingStyleWithStyleUI:", 1);

  -[ICNoteEditorViewController setCurrentTextStyle:](self, "setCurrentTextStyle:", v4);
  -[ICNoteEditorViewController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsSettingStyleWithStyleUI:", 0);

  v8 = (void *)topoTextStylesToAnalyticsStyles;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  if (v11)
  {
    -[ICNoteEditorViewController eventReporter](self, "eventReporter");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorBaseViewController note](self, "note");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "submitStyleFormatEventForModernNote:styleTypeValue:", v12, v11);

  }
}

- (void)toggleBIUS:(unint64_t)a3 sender:(id)a4
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  -[ICNoteEditorViewController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 1;
  objc_msgSend(v6, "setIsSettingStyleWithStyleUI:", 1);

  -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = 0;
  switch(a3)
  {
    case 1uLL:
      if (v8)
        v9 = v8;
      objc_msgSend(v9, "toggleBoldface:", v15);
      v7 = 0;
      v11 = 9;
      break;
    case 2uLL:
      if (v8)
        v9 = v8;
      objc_msgSend(v9, "toggleItalics:", v15);
      v7 = 0;
      v11 = 10;
      break;
    case 4uLL:
      if (v8)
        v9 = v8;
      objc_msgSend(v9, "toggleUnderline:", v15);
      v7 = 0;
      v11 = 11;
      break;
    case 8uLL:
      if (v8)
        objc_msgSend(v8, "toggleStrikethrough:", v15);
      else
        -[ICNoteEditorViewController strikethrough:](self, "strikethrough:", v15);
      v7 = 0;
      v11 = 12;
      break;
    default:
      break;
  }
  -[ICNoteEditorViewController textView](self, "textView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIsSettingStyleWithStyleUI:", 0);

  if ((v7 & 1) == 0)
  {
    -[ICNoteEditorViewController eventReporter](self, "eventReporter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorBaseViewController note](self, "note");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "submitStyleFormatEventForModernNote:styleTypeValue:", v14, v11);

  }
}

- (void)changeIndentationByIncreasing:(BOOL)a3 sender:(id)a4
{
  _BOOL4 v4;
  int64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v6 = -[ICNoteEditorViewController currentWritingDirection](self, "currentWritingDirection", a3, a4);
  v7 = !v4;
  -[ICNoteEditorViewController textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsSettingStyleWithStyleUI:", 1);

  if (v6 == v7)
    v9 = 1;
  else
    v9 = -1;
  if (v6 == v7)
    v10 = 13;
  else
    v10 = 14;
  -[ICNoteEditorViewController indentSelectionIfPossibleByAmount:](self, "indentSelectionIfPossibleByAmount:", v9);
  -[ICNoteEditorViewController textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIsSettingStyleWithStyleUI:", 0);

  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "submitStyleFormatEventForModernNote:styleTypeValue:", v12, v10);

}

- (id)noteFormattingTintColor
{
  void *v2;
  void *v3;

  -[ICNoteEditorViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)noteFormattingNeedsUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[ICNoteEditorViewController textView](self, "textView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedRange");
  objc_msgSend(v4, "updateWithDataSource:ignoreTypingAttributes:", self, v5 != 0);

}

- (void)noteFormattingDidFinish:(id)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  void *v6;
  id v7;

  if (-[ICNoteEditorViewController styleSelectorInputViewShowing](self, "styleSelectorInputViewShowing", a3))
    -[ICNoteEditorViewController showStyleSelectorInputView:animated:doneEditing:](self, "showStyleSelectorInputView:animated:doneEditing:", 0, 1, 0);
  else
    -[ICNoteEditorViewController cleanupAfterAddImageAttachmentOperation](self, "cleanupAfterAddImageAttachmentOperation");
  v4 = *MEMORY[0x1E0DC4578];
  -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "styleBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v6);

}

- (void)attachmentInsertionController:(id)a3 willAddAttachment:(id)a4 atRange:(_NSRange)a5
{
  id v5;

  -[ICNoteEditorViewController textView](self, "textView", a3, a4, a5.location, a5.length);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unmarkText");

}

- (void)attachmentInsertionController:(id)a3 didAddAttachment:(id)a4 atRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSUInteger v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  ICNoteEditorViewController *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  ICNoteEditorViewController *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSUInteger v43;

  length = a5.length;
  location = a5.location;
  v8 = a4;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    -[NSObject textStorage](v9, "textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = location + length;
    if (location + length > objc_msgSend(v11, "length"))
    {
      v13 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ICNoteEditorViewController attachmentInsertionController:didAddAttachment:atRange:].cold.2();

      goto LABEL_22;
    }
    objc_opt_class();
    objc_msgSend(v11, "styler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = length;
    v17 = objc_msgSend(v16, "paragraphRangeForRange:", location, length);
    v18 = v9;
    v19 = self;
    v20 = v11;
    v21 = v8;
    v22 = v17;
    v24 = v23;

    v25 = v22;
    v8 = v21;
    v11 = v20;
    v26 = v19;
    v9 = v18;
    objc_msgSend(v15, "updateParagraphWritingDirectionToKeyboardWritingDirectionInRange:textStorage:textView:", v25, v24, v11, v18);
    -[ICNoteEditorViewController textViewDidChange:](v26, "textViewDidChange:", v18);
    objc_msgSend(v11, "breakUndoCoalescing");
    -[ICNoteEditorViewController updateBarButtons](v26, "updateBarButtons");
    UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], 0);
    v27 = objc_msgSend(v8, "attachmentType");
    if (v27 >= 0xC && v27 - 13 >= 3)
    {
      if (v27 != 12)
        goto LABEL_21;
      -[ICNoteEditorViewController textStorage](v26, "textStorage");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "length");

      if (location >= v33)
        goto LABEL_21;
      objc_opt_class();
      -[ICNoteEditorViewController textStorage](v26, "textStorage");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], location, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
        goto LABEL_21;
      if (ICInternalSettingsIsTextKit2Enabled())
      {
        objc_opt_class();
        -[ICNoteEditorViewController textView](v26, "textView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "textLayoutManager");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v38, "tableViewControllerForAttachment:createIfNeeded:", v30, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        -[ICNoteEditorViewController textView](v26, "textView");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "layoutManager");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        objc_msgSend(v38, "viewControllerForTextAttachment:", v30);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v39 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v39, "setShouldBeginInitialEditing:", 1);
      objc_msgSend(v39, "updateTableColumnDirectionForWritingDirection:", -[ICNoteEditorViewController currentWritingDirection](v26, "currentWritingDirection"));

    }
    else
    {
      if (!-[ICNoteEditorViewController doNotAdvanceInsertionPointAfterInsertingAttachment](v26, "doNotAdvanceInsertionPointAfterInsertingAttachment")&& v12 + 1 <= objc_msgSend(v11, "length"))
      {
        ++v12;
      }
      -[NSObject setSelectedRange:](v18, "setSelectedRange:", v12, 0);
      -[ICNoteEditorViewController scrollRangeToVisible:animated:](v26, "scrollRangeToVisible:animated:", location, v43, 1);
      if (ICInternalSettingsIsTextKit2Enabled())
      {
        objc_opt_class();
        -[ICNoteEditorViewController textView](v26, "textView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "textLayoutManager");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        ICCheckedDynamicCast();
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30 && (objc_opt_respondsToSelector() & 1) != 0)
          -[ICNoteEditorViewController rcc_updatePaperKitMessengerForAttachment:textLayoutManager:](v26, "rcc_updatePaperKitMessengerForAttachment:textLayoutManager:", v8, v30);
      }
      else
      {
        objc_opt_class();
        -[NSObject layoutManager](v18, "layoutManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        ICCheckedDynamicCast();
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30 && (objc_opt_respondsToSelector() & 1) != 0)
          -[ICNoteEditorViewController rcc_updatePaperKitMessengerForAttachment:layoutManager:](v26, "rcc_updatePaperKitMessengerForAttachment:layoutManager:", v8, v30);
      }
    }

LABEL_21:
LABEL_22:

    goto LABEL_23;
  }
  v9 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[ICNoteEditorViewController attachmentInsertionController:didAddAttachment:atRange:].cold.1();
LABEL_23:

}

- (void)attachmentInsertionController:(id)a3 didAddInlineAttachment:(id)a4 atRange:(_NSRange)a5 textStorage:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSUInteger v14;
  void *v15;
  id v16;

  length = a5.length;
  location = a5.location;
  v9 = a6;
  -[ICNoteEditorViewController textView](self, "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textStorage");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v9)
  {
    objc_opt_class();
    -[ICNoteEditorViewController textView](self, "textView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textStorage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v16, "isEditing") & 1) == 0)
    {
      v14 = location + length;
      if (location + length <= objc_msgSend(v16, "length"))
      {
        if (-[ICNoteEditorViewController isConvertToTag](self, "isConvertToTag"))
          v14 = location + 1;
        -[ICNoteEditorViewController textView](self, "textView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setSelectedRange:", v14, 0);

        -[ICNoteEditorViewController scrollRangeToVisible:animated:](self, "scrollRangeToVisible:animated:", location, length, 1);
      }
    }
    -[ICNoteEditorViewController setIsConvertToTag:](self, "setIsConvertToTag:", 0);

  }
}

- (void)addSystemPaperAttachment
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  -[ICNoteEditorBaseViewController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canAddAttachment");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    -[ICNoteEditorBaseViewController note](self, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSystemPaperAttachmentWithIdentifier:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICNoteEditorViewController attachmentInsertionController](self, "attachmentInsertionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "selectedRange");
    v12 = (id)objc_msgSend(v8, "addAttachment:atTextLocation:", v7, v10 + v11);

    -[ICNoteEditorBaseViewController note](self, "note");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "managedObjectContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ic_save");

  }
}

- (void)showDocumentCamera
{
  void *v3;
  char v4;

  -[ICNoteEditorBaseViewController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canAddAttachment");

  if ((v4 & 1) != 0)
  {
    -[ICNoteEditorViewController prepareSelectionForAddingAttachment](self, "prepareSelectionForAddingAttachment");
    -[ICNoteEditorViewController showInsertUIWithPreferredSourceType:](self, "showInsertUIWithPreferredSourceType:", 4);
  }
  else
  {
    -[ICNoteEditorViewController warnUserAttachmentLimitExceeded](self, "warnUserAttachmentLimitExceeded");
  }
}

- (void)documentCameraPresentingViewController:(id)a3 didFinishWithInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6 closeViewController:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  unint64_t v38;
  ICNoteEditorViewController *v39;
  void *v40;
  int v41;
  void *v42;
  int v43;
  void *v44;
  int v45;
  char v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  _QWORD *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  uint64_t v79;
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
  uint64_t v92;
  uint64_t v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t m;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  unint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  NSObject *v116;
  void *v117;
  void *v118;
  void *v119;
  char v120;
  void *v121;
  id v122;
  id v123;
  _BOOL4 v124;
  uint64_t v125;
  void *v126;
  _BOOL4 v127;
  void *v128;
  ICNoteEditorViewController *v129;
  _QWORD v130[5];
  _QWORD block[4];
  id v132;
  id v133;
  id v134;
  id v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _QWORD v140[4];
  void *v141;
  ICNoteEditorViewController *v142;
  _QWORD v143[5];
  BOOL v144;
  _QWORD v145[5];
  BOOL v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  id v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  uint64_t v164;

  v7 = a7;
  v8 = a6;
  v164 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v124 = v8;
  if (v8 && !v7)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "!(warnUser && !closeViewController)", "-[ICNoteEditorViewController documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:]", 1, 0, CFSTR("Cannot warn user if not closing the view controller"));
  v127 = v7;
  objc_msgSend(v13, "docInfos");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (!v16)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "docInfoCollection.docInfos.count > 0", "-[ICNoteEditorViewController documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:]", 1, 0, CFSTR("This should never be called with a count of 0."));
  v17 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v13, "docInfos");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrayWithCapacity:", objc_msgSend(v18, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v158 = 0u;
  v159 = 0u;
  v156 = 0u;
  v157 = 0u;
  v128 = v13;
  objc_msgSend(v13, "docInfos");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v156, v163, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v157;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v157 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v156 + 1) + 8 * i), "croppedAndFilteredImageUUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "getImageURL:async:", v25, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "ic_addNonNilObject:", v26);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v156, v163, 16);
    }
    while (v22);
  }
  v129 = self;

  objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D64270], "objectForKey:", CFSTR("ICShouldSavePhotosAndVideosToCameraRollKey"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "BOOLValue");

  v154 = 0u;
  v155 = 0u;
  v152 = 0u;
  v153 = 0u;
  v30 = v19;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v152, v162, 16);
  if (v31)
  {
    v32 = v31;
    v33 = 0;
    v34 = *(_QWORD *)v153;
    v35 = *MEMORY[0x1E0C99998];
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v153 != v34)
          objc_enumerationMutation(v30);
        v37 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * j);
        v151 = 0;
        objc_msgSend(v37, "getResourceValue:forKey:error:", &v151, v35, 0);
        if (v151)
        {
          v38 = objc_msgSend(v151, "unsignedIntegerValue");
          if (v33 <= v38)
            v33 = v38;
        }
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v152, v162, 16);
    }
    while (v32);
  }
  else
  {
    v33 = 0;
  }

  v39 = v129;
  -[ICNoteEditorBaseViewController note](v129, "note");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "canAddAttachment");

  -[ICNoteEditorBaseViewController note](v129, "note");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "attachmentExceedsMaxSizeAllowed:", v33);

  -[ICNoteEditorBaseViewController note](v129, "note");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "isPasswordProtected");

  v46 = v41;
  if (!v45 && v29 | v43 | v41 ^ 1)
  {
    v120 = v41;
    v122 = v12;
    v149 = 0u;
    v150 = 0u;
    v147 = 0u;
    v148 = 0u;
    v47 = v30;
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v147, v161, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v148;
      do
      {
        for (k = 0; k != v49; ++k)
        {
          if (*(_QWORD *)v148 != v50)
            objc_enumerationMutation(v47);
          v52 = *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * k);
          v53 = (void *)MEMORY[0x1DF0DF21C]();
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v52);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          UIImageDataWriteToSavedPhotosAlbum();

          objc_autoreleasePoolPop(v53);
        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v147, v161, 16);
      }
      while (v49);
    }

    v12 = v122;
    v39 = v129;
    v46 = v120;
  }
  v55 = v128;
  if ((v46 & 1) != 0)
  {
    if (!v43)
    {
      if (ICInternalSettingsDefaultToPaperKitPDFsAndScans())
      {
        -[ICNoteEditorViewController createdGalleryAttachmentUUID](v39, "createdGalleryAttachmentUUID");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "UUIDString");
        v125 = objc_claimAutoreleasedReturnValue();

        -[ICNoteEditorBaseViewController note](v39, "note");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "addPaperDocumentAttachmentWithIdentifier:subtype:", v125, *MEMORY[0x1E0D636A8]);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v128, "docInfos");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "count");
        objc_opt_class();
        objc_msgSend(v61, "paperBundleModel");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setPaperPageCount:", v63);

        objc_msgSend(v61, "managedObjectContext");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "ic_save");

        v67 = (void *)MEMORY[0x1E0D63C00];
        objc_msgSend(v128, "docInfos");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v140[0] = MEMORY[0x1E0C809B0];
        v140[1] = 3221225472;
        v140[2] = __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2;
        v140[3] = &unk_1EA7DE688;
        v141 = v61;
        v142 = v39;
        v69 = v61;
        objc_msgSend(v67, "createPaperBundleForAttachment:fromDocCamInfoCollection:imageCache:completion:", v69, v68, v14, v140);

        -[ICNoteEditorViewController eventReporter](v39, "eventReporter");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "identifier");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "pushDocScanDataWithID:actionType:stage:", v71, 1, 2);

        -[ICNoteEditorViewController eventReporter](v39, "eventReporter");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorBaseViewController note](v39, "note");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "docInfos");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "submitDocScanEventForNote:pageCount:", v73, objc_msgSend(v74, "count"));

        v75 = (void *)v125;
        -[ICNoteEditorViewController setCreatedGalleryAttachmentUUID:](v39, "setCreatedGalleryAttachmentUUID:", 0);
        v76 = v141;
      }
      else
      {
        v123 = v12;
        v77 = objc_alloc(MEMORY[0x1E0D1D850]);
        objc_msgSend(v128, "docInfos");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend(v77, "initWithImageCache:docInfos:", v14, v78);

        v126 = (void *)v79;
        objc_msgSend(MEMORY[0x1E0D1D848], "setCachedItem:", v79);
        -[ICNoteEditorBaseViewController note](v39, "note");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController createdGalleryAttachmentUUID](v39, "createdGalleryAttachmentUUID");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "UUIDString");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "addGalleryAttachmentWithIdentifier:", v82);
        v69 = (id)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        objc_msgSend(v69, "attachmentModel");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        ICCheckedDynamicCast();
        v84 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v128, "docInfos");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "firstObject");
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D64BF0], "createSubAttachmentFromDocument:imageCache:galleryAttachment:", v86, v14, v69);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = v87;
        if (v87)
        {
          objc_msgSend(v87, "identifier");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "setScanDataDelegateIdentifier:", v89);

          objc_msgSend(v84, "addSubAttachment:", v88);
        }
        v118 = v88;
        v119 = v86;
        v121 = v84;
        objc_msgSend(v69, "saveMergeableDataIfNeeded");
        -[ICNoteEditorViewController attachmentInsertionController](v39, "attachmentInsertionController");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController textView](v39, "textView");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_msgSend(v91, "selectedRange");
        v94 = (id)objc_msgSend(v90, "addAttachment:atTextLocation:", v69, v92 + v93);

        -[ICNoteEditorBaseViewController note](v39, "note");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "managedObjectContext");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "ic_saveWithLogDescription:", CFSTR("Insert gallery attachment"));

        v138 = 0u;
        v139 = 0u;
        v136 = 0u;
        v137 = 0u;
        objc_msgSend(v69, "subAttachments");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v136, v160, 16);
        if (v98)
        {
          v99 = v98;
          v100 = *(_QWORD *)v137;
          do
          {
            for (m = 0; m != v99; ++m)
            {
              if (*(_QWORD *)v137 != v100)
                objc_enumerationMutation(v97);
              v102 = *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * m);
              objc_msgSend(MEMORY[0x1E0D64B00], "sharedGenerator");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v103, "generatePreviewIfNeededForAttachment:", v102);

            }
            v99 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v136, v160, 16);
          }
          while (v99);
        }

        objc_msgSend(MEMORY[0x1E0D64B00], "sharedGenerator");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "generatePreviewIfNeededForAttachment:", v69);

        v39 = v129;
        -[ICNoteEditorViewController eventReporter](v129, "eventReporter");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "identifier");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "pushDocScanDataWithID:actionType:stage:", v106, 1, 2);

        -[ICNoteEditorViewController eventReporter](v129, "eventReporter");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorBaseViewController note](v129, "note");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v128;
        objc_msgSend(v128, "docInfos");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "submitDocScanEventForNote:pageCount:", v108, objc_msgSend(v109, "count"));

        -[ICNoteEditorViewController setCreatedGalleryAttachmentUUID:](v129, "setCreatedGalleryAttachmentUUID:", 0);
        objc_msgSend(v128, "docInfos");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = objc_msgSend(v110, "count");

        if (v111 < 2)
        {
          v75 = v126;
          objc_msgSend(v126, "doneBuildingCache");
        }
        else
        {
          objc_msgSend(v128, "docInfos");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "docInfos");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "subarrayWithRange:", 1, objc_msgSend(v113, "count") - 1);
          v114 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v114);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "setDocInfos:", v115);

          dispatch_get_global_queue(0, 0);
          v116 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_3_610;
          block[3] = &unk_1EA7DDEA8;
          v132 = v69;
          v133 = v128;
          v134 = v14;
          v75 = v126;
          v135 = v126;
          dispatch_async(v116, block);

        }
        v76 = v121;
        v12 = v123;

      }
      if (!v127)
      {
        -[ICNoteEditorViewController cleanupAfterAddImageAttachmentOperation](v39, "cleanupAfterAddImageAttachmentOperation");
        v117 = v12;
        v57 = 0;
        goto LABEL_68;
      }
      v130[0] = MEMORY[0x1E0C809B0];
      v130[1] = 3221225472;
      v130[2] = __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_4;
      v130[3] = &unk_1EA7DD2D8;
      v130[4] = v39;
      v57 = v130;
LABEL_66:
      v117 = v12;
LABEL_68:
      objc_msgSend(v117, "dismissViewControllerAnimated:completion:", 1, v57);
      goto LABEL_69;
    }
    v56 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      -[ICNoteEditorViewController documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:].cold.1(v39, v33, v56);

    if (v127)
    {
      v143[0] = MEMORY[0x1E0C809B0];
      v143[1] = 3221225472;
      v143[2] = __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_590;
      v143[3] = &unk_1EA7DE660;
      v143[4] = v39;
      v144 = v124;
      v57 = v143;
      goto LABEL_66;
    }
    if (v124)
      -[ICNoteEditorViewController warnUserAttachmentSizeExceededWithAttachmentCount:](v39, "warnUserAttachmentSizeExceededWithAttachmentCount:", 1);
  }
  else
  {
    v58 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      -[ICNoteEditorViewController documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:].cold.2(v39);

    if (v127)
    {
      v145[0] = MEMORY[0x1E0C809B0];
      v145[1] = 3221225472;
      v145[2] = __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke;
      v145[3] = &unk_1EA7DE660;
      v145[4] = v39;
      v146 = v124;
      v57 = v145;
      goto LABEL_66;
    }
    if (v124)
      -[ICNoteEditorViewController warnUserAttachmentLimitExceeded](v39, "warnUserAttachmentLimitExceeded");
  }
LABEL_69:

}

uint64_t __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "cleanupAfterAddImageAttachmentOperation");
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "warnUserAttachmentLimitExceeded");
  return result;
}

uint64_t __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_590(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "cleanupAfterAddImageAttachmentOperation");
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "warnUserAttachmentSizeExceededWithAttachmentCount:", 1);
  return result;
}

void __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_3;
  v7[3] = &unk_1EA7DDEA8;
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v10 = v4;
  v11 = *(_QWORD *)(a1 + 40);
  v5 = v4;
  v6 = v3;
  objc_msgSend(v5, "performBlock:", v7);

}

void __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v2 = a1 + 32;
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_3_cold_1(v2, a1, v3);

    objc_msgSend(MEMORY[0x1E0D639F0], "deleteAttachment:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "ic_saveWithLogDescription:", CFSTR("Deleted PaperDocumentScan attachment after error"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "attachmentInsertionController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 56), "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "selectedRange");
    v9 = (id)objc_msgSend(v4, "addAttachment:atTextLocation:", v5, v7 + v8);

    objc_msgSend(*(id *)(a1 + 48), "ic_saveWithLogDescription:", CFSTR("Inserted PaperDocumentScan attachment"));
    objc_msgSend(MEMORY[0x1E0D64B00], "sharedGenerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "generatePreviewIfNeededForAttachment:", *(_QWORD *)(a1 + 40));

    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "workerManagedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D64CE0], "shared");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_599;
    v16[3] = &unk_1EA7DD2D8;
    v17 = v12;
    v15 = v12;
    objc_msgSend(v13, "updateIndexForAttachment:userInitiated:managedObjectContext:completionHandler:", v14, 1, v15, v16);

  }
}

void __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_599(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2_600;
  v2[3] = &unk_1EA7DD2D8;
  v3 = v1;
  objc_msgSend(v3, "performBlock:", v2);

}

uint64_t __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2_600(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ic_saveWithLogDescription:", CFSTR("Updated index after gallery attachment upgrade"));
}

uint64_t __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_3_610(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0D64BF0];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "docInfos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "createAndAddSubAttachmentsToGalleryAttachment:fromDocuments:imageCache:context:", v3, v4, *(_QWORD *)(a1 + 48), 0);

  return objc_msgSend(*(id *)(a1 + 56), "doneBuildingCache");
}

uint64_t __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanupAfterAddImageAttachmentOperation");
}

- (void)documentCameraControllerDidCancelWithPresentingViewController:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __92__ICNoteEditorViewController_documentCameraControllerDidCancelWithPresentingViewController___block_invoke;
  v3[3] = &unk_1EA7DD2D8;
  v3[4] = self;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v3);
}

uint64_t __92__ICNoteEditorViewController_documentCameraControllerDidCancelWithPresentingViewController___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cleanupAfterAddImageAttachmentOperation");
  return objc_msgSend(*(id *)(a1 + 32), "setCreatedGalleryAttachmentUUID:", 0);
}

- (id)documentCameraControllerCreateDataCryptorIfNecessary
{
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[ICNoteEditorBaseViewController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPasswordProtected");

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D63AC0]);
    -[ICNoteEditorBaseViewController note](self, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithObjectIdentifier:", v7);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  objc_msgSend(a3, "presentingViewController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:](self, "documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:", v12, v11, v10, v6, 1);

}

- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6 closeViewController:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;

  v7 = a7;
  v8 = a6;
  v12 = a5;
  v13 = a4;
  objc_msgSend(a3, "presentingViewController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:](self, "documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:", v14, v13, v12, v8, v7);

}

- (void)documentCameraControllerDidRetake:(id)a3 pageCount:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[ICNoteEditorViewController eventReporter](self, "eventReporter", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController createdGalleryAttachmentUUID](self, "createdGalleryAttachmentUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushDocScanDataWithID:actionType:stage:", v8, 2, 1);

  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "submitDocScanEventForNote:pageCount:", v9, a4);

}

- (BOOL)documentCameraController:(id)a3 canAddImages:(unint64_t)a4
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0D63A78], "sharedConfiguration", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v5, "maxSubAttachmentsPerAttachment") >= a4;

  return a4;
}

- (id)scanDataDelegateWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0D639F0];
  v4 = (void *)MEMORY[0x1E0D63BC8];
  v5 = a3;
  objc_msgSend(v4, "sharedContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentWithIdentifier:context:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)remoteDocumentCameraController:(id)a3 didFinishWithInfoCollection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "presentingViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNoteEditorViewController documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:](self, "documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:", v9, v6, v8, 1, 1);
}

- (void)addSystemPaperImageData:(id)a3 updateFirstResponder:(BOOL)a4
{
  -[ICNoteEditorViewController addSystemPaperImageData:updateFirstResponder:forceAddToPaper:](self, "addSystemPaperImageData:updateFirstResponder:forceAddToPaper:", a3, a4, 0);
}

- (void)addSystemPaperImageData:(id)a3 updateFirstResponder:(BOOL)a4 forceAddToPaper:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  __int128 buf;
  uint64_t v29;
  char v30;
  uint64_t v31;

  v5 = a5;
  v6 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[ICNoteEditorBaseViewController note](self, "note");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isSharedReadOnly");

  if (v10)
  {
    v11 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1DD7B0000, v11, OS_LOG_TYPE_DEFAULT, "Not adding system paper image data since note is read-only.", (uint8_t *)&buf, 2u);
    }
    goto LABEL_17;
  }
  if (v5)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v29 = 0x2020000000;
    v30 = 0;
    -[ICNoteEditorBaseViewController note](self, "note");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textStorage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorBaseViewController note](self, "note");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "ic_range");
    v17 = *MEMORY[0x1E0DC10F8];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __91__ICNoteEditorViewController_addSystemPaperImageData_updateFirstResponder_forceAddToPaper___block_invoke;
    v27[3] = &unk_1EA7DD260;
    v27[4] = &buf;
    objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v17, v16, v18, 0, v27);

    v5 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
    _Block_object_dispose(&buf, 8);
  }
  if (v6)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isFirstResponder"))
    {

    }
    else
    {
      -[ICNoteEditorViewController paletteResponder](self, "paletteResponder");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "isFirstResponder"))
      {

      }
      else
      {
        v21 = -[ICNoteEditorViewController isFirstResponder](self, "isFirstResponder");

        if ((v21 & 1) == 0)
          -[ICNoteEditorViewController becomeFirstResponder](self, "becomeFirstResponder");
      }
    }
  }
  v22 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = objc_msgSend(v8, "count");
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v23;
    _os_log_impl(&dword_1DD7B0000, v22, OS_LOG_TYPE_DEFAULT, "System Paper received %lu images", (uint8_t *)&buf, 0xCu);
  }

  -[ICNoteEditorViewController visualAssetImportController](self, "visualAssetImportController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addImageData:typeIdentifier:forceAddToPaper:", v8, 0, v5);

  -[ICNoteEditorBaseViewController note](self, "note");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "updateModificationDateAndChangeCountAndSaveImmediately");

  objc_msgSend(MEMORY[0x1E0D64B00], "sharedGenerator");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "generatePreviewsIfNeeded");

  if (+[ICPaperCommonUtilities shouldShowLinksWhenComposingQuickNote](ICPaperCommonUtilities, "shouldShowLinksWhenComposingQuickNote"))
  {
    -[ICNoteEditorViewController paperLinkBarViewController](self, "paperLinkBarViewController");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject refresh](v11, "refresh");
LABEL_17:

  }
}

void __91__ICNoteEditorViewController_addSystemPaperImageData_updateFirstResponder_forceAddToPaper___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  char isKindOfClass;

  v7 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
}

- (BOOL)addSystemPaperLink:(id)a3 updateFirstResponder:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  char IsSystemPaperEnabled;
  void *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v31;
  __int16 v32;
  uint8_t buf[2];

  v4 = a4;
  v6 = a3;
  IsSystemPaperEnabled = ICInternalSettingsIsSystemPaperEnabled();
  if ((IsSystemPaperEnabled & 1) == 0)
  {
    v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "Not adding system paper link since SystemPaper isn't enabled.";
      v12 = buf;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_20;
  }
  -[ICNoteEditorBaseViewController note](self, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSharedReadOnly");

  if (v9)
  {
    v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 0;
      v11 = "Not adding system paper link since note is read-only.";
      v12 = (uint8_t *)&v32;
LABEL_7:
      _os_log_impl(&dword_1DD7B0000, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v4)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "isFirstResponder"))
    {
      -[ICNoteEditorViewController paletteResponder](self, "paletteResponder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v14, "isFirstResponder"))
      {
        v31 = -[ICNoteEditorViewController isFirstResponder](self, "isFirstResponder");

        if ((v31 & 1) == 0)
          -[ICNoteEditorViewController becomeFirstResponder](self, "becomeFirstResponder");
        goto LABEL_14;
      }

    }
  }
LABEL_14:
  -[ICNoteEditorBaseViewController note](self, "note");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSynapseLinkAttachmentWithContentItem:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "displayTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitle:", v17);

  objc_msgSend(v16, "updateChangeCountWithReason:", CFSTR("Add System Paper Link"));
  if (-[ICNoteEditorViewController isEditing](self, "isEditing"))
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "selectedRange");
    v21 = v19 + v20;
  }
  else
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textStorage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v22, "length");

  }
  -[ICNoteEditorViewController attachmentInsertionController](self, "attachmentInsertionController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v23, "addAttachment:atTextLocation:", v16, v21);

  -[ICNoteEditorBaseViewController note](self, "note");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "updateModificationDateAndChangeCountAndSaveImmediately");

  objc_msgSend(MEMORY[0x1E0D64B00], "sharedGenerator");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "generatePreviewsIfNeeded");

  objc_msgSend(MEMORY[0x1E0D62A28], "sharedReporter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "fireDeepLinkCreationEventWithNote:contentItem:", v28, v6);

  if (+[ICPaperCommonUtilities shouldShowLinksWhenComposingQuickNote](ICPaperCommonUtilities, "shouldShowLinksWhenComposingQuickNote"))
  {
    -[ICNoteEditorViewController paperLinkBarViewController](self, "paperLinkBarViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "refresh");

  }
LABEL_20:

  return IsSystemPaperEnabled ^ 1;
}

- (void)createSystemPaperLinkBarIfNecessary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1DD7B0000, v0, v1, "Attempting System Paper link bar creation.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)teardownSystemPaperLinkBarIfNecessary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1DD7B0000, v0, v1, "Attempting System Paper link bar teardown.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)systemPaperLinkBarVisibilityPreferenceChanged:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;

  v4 = +[ICPaperCommonUtilities shouldShowLinksWhenComposingQuickNote](ICPaperCommonUtilities, "shouldShowLinksWhenComposingQuickNote", a3);
  -[ICNoteEditorViewController paperLinkBarViewController](self, "paperLinkBarViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || v4)
  {
    -[ICNoteEditorViewController paperLinkBarViewController](self, "paperLinkBarViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v4 = 0;

    if (v4)
    {
      -[ICNoteEditorViewController createSystemPaperLinkBarIfNecessary](self, "createSystemPaperLinkBarIfNecessary");
      -[ICNoteEditorViewController paperLinkBarViewController](self, "paperLinkBarViewController");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "refresh");

    }
  }
  else
  {
    -[ICNoteEditorViewController teardownSystemPaperLinkBarIfNecessary](self, "teardownSystemPaperLinkBarIfNecessary");
  }
}

- (void)setCanShowLinkBar:(BOOL)a3
{
  if (self->_canShowLinkBar != a3)
  {
    self->_canShowLinkBar = a3;
    if (!a3)
      -[ICNoteEditorViewController teardownSystemPaperLinkBarIfNecessary](self, "teardownSystemPaperLinkBarIfNecessary");
  }
}

- (void)setPaperLinkBarShowing:(BOOL)a3
{
  NSObject *v3;
  unsigned int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  double v13;
  double v14;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  _QWORD aBlock[5];
  char v18;

  LODWORD(v3) = a3;
  if ((ICInternalSettingsIsSystemPaperEnabled() & 1) == 0)
  {
    v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ICNoteEditorViewController setPaperLinkBarShowing:].cold.5();
    goto LABEL_14;
  }
  if ((objc_msgSend(MEMORY[0x1E0D641E0], "deviceSupportsSystemPaper") & 1) == 0)
  {
    v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ICNoteEditorViewController setPaperLinkBarShowing:].cold.4();
    goto LABEL_14;
  }
  if (!-[ICNoteEditorBaseViewController isEditingOnSystemPaper](self, "isEditingOnSystemPaper"))
  {
    v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ICNoteEditorViewController setPaperLinkBarShowing:].cold.3();
    goto LABEL_14;
  }
  v5 = v3 ^ 1;
  if (!-[ICNoteEditorViewController canShowLinkBar](self, "canShowLinkBar") && (v5 & 1) == 0)
  {
    v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[ICNoteEditorViewController setPaperLinkBarShowing:].cold.2();
LABEL_14:

    return;
  }
  if (self->_paperLinkBarShowing != (_DWORD)v3)
  {
    if (((+[ICPaperCommonUtilities shouldShowLinksWhenComposingQuickNote](ICPaperCommonUtilities, "shouldShowLinksWhenComposingQuickNote") | v5) & 1) == 0)
    {
      v3 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        -[ICNoteEditorViewController setPaperLinkBarShowing:].cold.1();

      LOBYTE(v3) = 0;
    }
    self->_paperLinkBarShowing = (char)v3;
    -[ICNoteEditorViewController textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorBaseViewController note](self, "note");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createUserTitleViewIfNecessaryForNote:", v8);

    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__ICNoteEditorViewController_setPaperLinkBarShowing___block_invoke;
    aBlock[3] = &unk_1EA7DE660;
    v18 = (char)v3;
    aBlock[4] = self;
    v10 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[ICNoteEditorViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNeedsUpdateConstraints");

    if (-[ICNoteEditorViewController linksBarNeedsAnimationWhileEditorIsVisible](self, "linksBarNeedsAnimationWhileEditorIsVisible")|| -[ICNoteEditorViewController needsToPerformInitialPaperAnimations](self, "needsToPerformInitialPaperAnimations"))
    {
      v12 = (void *)MEMORY[0x1E0DC3F10];
      +[ICSystemPaperConstants linkBarAnimationDuration](ICSystemPaperConstants, "linkBarAnimationDuration");
      v14 = v13;
      v15[0] = v9;
      v15[1] = 3221225472;
      v15[2] = __53__ICNoteEditorViewController_setPaperLinkBarShowing___block_invoke_2;
      v15[3] = &unk_1EA7DDE08;
      v16 = v10;
      objc_msgSend(v12, "animateWithDuration:animations:", v15, v14);

    }
    else
    {
      v10[2](v10);
    }
    -[ICNoteEditorViewController setNeedsToPerformInitialPaperAnimations:](self, "setNeedsToPerformInitialPaperAnimations:", 0);
    -[ICNoteEditorViewController setLinksBarNeedsAnimationWhileEditorIsVisible:](self, "setLinksBarNeedsAnimationWhileEditorIsVisible:", 1);

  }
}

void __53__ICNoteEditorViewController_setPaperLinkBarShowing___block_invoke(uint64_t a1)
{
  void *v2;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  id v28;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "paperLinkBarTopConstraint");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setConstant:", 0.0);

    objc_msgSend(*(id *)(a1 + 32), "textView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "userTitleView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 0.0);

    objc_msgSend(*(id *)(a1 + 32), "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.0);

    objc_msgSend(*(id *)(a1 + 32), "paperLinkBarViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 1.0;
  }
  else
  {
    +[ICSystemPaperConstants linkBarHeight](ICSystemPaperConstants, "linkBarHeight");
    v12 = -v11;
    objc_msgSend(*(id *)(a1 + 32), "paperLinkBarTopConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setConstant:", v12);

    objc_msgSend(*(id *)(a1 + 32), "textView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "userTitleView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAlpha:", 1.0);

    objc_msgSend(*(id *)(a1 + 32), "textView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dateView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAlpha:", 1.0);

    objc_msgSend(*(id *)(a1 + 32), "paperLinkBarViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 0.0;
  }
  objc_msgSend(v8, "setAlpha:", v10);

  objc_msgSend(*(id *)(a1 + 32), "textView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentInset");
  v20 = v19;
  v22 = v21;
  v24 = v23;

  objc_msgSend(*(id *)(a1 + 32), "textViewTopInsetThatWeWant");
  v26 = v25;
  objc_msgSend(*(id *)(a1 + 32), "textView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setContentInset:", v26, v20, v22, v24);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "layoutIfNeeded");

}

uint64_t __53__ICNoteEditorViewController_setPaperLinkBarShowing___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cancelFromSystemPaperCard:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
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
  _QWORD v28[5];
  _QWORD v29[4];
  void (**v30)(_QWORD);
  _QWORD v31[5];
  id v32;
  _QWORD aBlock[6];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__ICNoteEditorViewController_cancelFromSystemPaperCard___block_invoke;
  aBlock[3] = &unk_1EA7DD2D8;
  aBlock[4] = self;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[ICNoteEditorViewController textStorage](self, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[ICNoteEditorViewController presentedViewController](self, "presentedViewController");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_5;
    v10 = (void *)v9;
    -[ICNoteEditorViewController presentedViewController](self, "presentedViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController noteFormattingController](self, "noteFormattingController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (v13)
    {
      -[ICNoteEditorViewController noteFormattingController](self, "noteFormattingController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v5;
      v31[1] = 3221225472;
      v31[2] = __56__ICNoteEditorViewController_cancelFromSystemPaperCard___block_invoke_3;
      v31[3] = &unk_1EA7DD498;
      v31[4] = self;
      v32 = v4;
      objc_msgSend(v14, "dismissViewControllerAnimated:completion:", 1, v31);

    }
    else
    {
LABEL_5:
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Delete Quick Note"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v5;
      v29[1] = 3221225472;
      v29[2] = __56__ICNoteEditorViewController_cancelFromSystemPaperCard___block_invoke_4;
      v29[3] = &unk_1EA7DE6B0;
      v30 = v6;
      objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 2, v29);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addAction:", v19);

      v20 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Save Quick Note"), &stru_1EA7E9860, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v5;
      v28[1] = 3221225472;
      v28[2] = __56__ICNoteEditorViewController_cancelFromSystemPaperCard___block_invoke_5;
      v28[3] = &unk_1EA7DE6D8;
      v28[4] = self;
      objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 0, v28);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addAction:", v23);

      v24 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1EA7E9860, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "actionWithTitle:style:handler:", v26, 1, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addAction:", v27);

      objc_msgSend(v15, "setModalPresentationStyle:", 7);
      -[ICNoteEditorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);

    }
  }
  else
  {
    v6[2](v6);
  }

}

void __56__ICNoteEditorViewController_cancelFromSystemPaperCard___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "setQuickNoteiPhoneDidSaveOrCancel:", 1);
  objc_msgSend(*(id *)(a1 + 32), "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "eventReporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "submitNoteDeleteEventForModernNote:", v2);

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__ICNoteEditorViewController_cancelFromSystemPaperCard___block_invoke_2;
  v8[3] = &unk_1EA7DDBF0;
  v9 = v5;
  v10 = v2;
  v11 = *(_QWORD *)(a1 + 32);
  v6 = v2;
  v7 = v5;
  objc_msgSend(v7, "performBlockAndWait:", v8);

}

void __56__ICNoteEditorViewController_cancelFromSystemPaperCard___block_invoke_2(id *a1)
{
  id v2;

  objc_msgSend(a1[4], "processPendingChanges");
  objc_msgSend(a1[5], "markForDeletion");
  objc_msgSend(a1[4], "ic_save");
  objc_msgSend(a1[6], "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteEditorRequestsDismissal:cancelled:", a1[6], 1);

}

uint64_t __56__ICNoteEditorViewController_cancelFromSystemPaperCard___block_invoke_3(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "styleSelectorInputViewShowing"))
    objc_msgSend(*(id *)(a1 + 32), "showStyleSelector:animated:", 0, 0);
  return objc_msgSend(*(id *)(a1 + 32), "cancelFromSystemPaperCard:", *(_QWORD *)(a1 + 40));
}

uint64_t __56__ICNoteEditorViewController_cancelFromSystemPaperCard___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__ICNoteEditorViewController_cancelFromSystemPaperCard___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "saveFromSystemPaperCard:", *(_QWORD *)(a1 + 32));
}

- (void)saveFromSystemPaperCard:(id)a3
{
  id v4;

  -[ICNoteEditorViewController saveNote](self, "saveNote", a3);
  -[ICNoteEditorViewController setQuickNoteiPhoneDidSaveOrCancel:](self, "setQuickNoteiPhoneDidSaveOrCancel:", 1);
  -[ICNoteEditorViewController ensurePaperPreviewsExistIfNecessary](self, "ensurePaperPreviewsExistIfNecessary");
  -[ICNoteEditorViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "noteEditorRequestsDismissal:cancelled:", self, 0);

}

- (void)ensurePaperPreviewsExistIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_semaphore_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;
  char v22;
  _QWORD v23[4];
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[ICNoteEditorBaseViewController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleAttachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1DF0DF21C]();
        if (objc_msgSend(v9, "attachmentType") == 13)
        {
          v11 = (void *)MEMORY[0x1E0D63A40];
          objc_msgSend(v9, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "generatePreviewsForAttachment:paperIdentifier:", v9, v12);

        }
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v6);
  }

  v13 = dispatch_semaphore_create(0);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __65__ICNoteEditorViewController_ensurePaperPreviewsExistIfNecessary__block_invoke;
  v23[3] = &unk_1EA7DE700;
  v16 = v13;
  v24 = v16;
  objc_msgSend(v14, "performExpiringActivityWithReason:usingBlock:", CFSTR("Generating thumbnails for System Paper card"), v23);

  objc_msgSend(MEMORY[0x1E0D64D38], "sharedService");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __65__ICNoteEditorViewController_ensurePaperPreviewsExistIfNecessary__block_invoke_2;
  v20[3] = &unk_1EA7DE660;
  v22 = 1;
  v21 = v16;
  v19 = v16;
  objc_msgSend(v17, "updateIfNeededForNote:completion:", v18, v20);

}

intptr_t __65__ICNoteEditorViewController_ensurePaperPreviewsExistIfNecessary__block_invoke(intptr_t result, char a2)
{
  if ((a2 & 1) == 0)
    return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(result + 32), 0xFFFFFFFFFFFFFFFFLL);
  return result;
}

intptr_t __65__ICNoteEditorViewController_ensurePaperPreviewsExistIfNecessary__block_invoke_2(uint64_t a1)
{
  void *v2;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0D642A0], "sharedWidget");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadTimelinesWithReason:", CFSTR("System Paper card saved"));

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)showActivityStreamToolbarForObject:(id)a3 selection:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  ICActivityStreamDockView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
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
  _BOOL4 v59;
  id v60;
  id v61;
  _QWORD v62[5];
  _QWORD v63[5];

  v5 = a5;
  v63[3] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  -[ICNoteEditorViewController activityStreamToolbar](self, "activityStreamToolbar");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[ICNoteEditorViewController activityStreamToolbar](self, "activityStreamToolbar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController navigationController](self, "navigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 != v15)
    {
      -[ICNoteEditorViewController activityStreamToolbar](self, "activityStreamToolbar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeFromSuperview");

      -[ICNoteEditorViewController setActivityStreamToolbar:](self, "setActivityStreamToolbar:", 0);
    }
  }
  -[ICNoteEditorViewController activityStreamToolbar](self, "activityStreamToolbar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {

  }
  else
  {
    -[ICNoteEditorViewController navigationController](self, "navigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v60 = v8;
      v61 = v9;
      -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[ICActivityStreamDockView initWithCoordinator:isDisplayedInCard:]([ICActivityStreamDockView alloc], "initWithCoordinator:isDisplayedInCard:", v58, 0);
      -[ICNoteEditorViewController setActivityStreamToolbar:](self, "setActivityStreamToolbar:", v19);

      -[ICNoteEditorViewController activityStreamToolbar](self, "activityStreamToolbar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[ICNoteEditorViewController navigationController](self, "navigationController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController activityStreamToolbar](self, "activityStreamToolbar");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addSubview:", v23);

      -[ICNoteEditorViewController navigationController](self, "navigationController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "layoutIfNeeded");

      v26 = 0.0;
      v59 = v5;
      if (v5)
      {
        -[ICNoteEditorViewController navigationController](self, "navigationController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "view");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "safeAreaInsets");
        v30 = v29;
        -[ICNoteEditorViewController activityStreamToolbar](self, "activityStreamToolbar");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "frame");
        v26 = v30 + v32;

      }
      -[ICNoteEditorViewController activityStreamToolbar](self, "activityStreamToolbar");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "bottomAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController navigationController](self, "navigationController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "view");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "bottomAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:constant:", v37, v26);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController setActivityStreamToolbarBottomConstraint:](self, "setActivityStreamToolbarBottomConstraint:", v38);

      v52 = (void *)MEMORY[0x1E0CB3718];
      -[ICNoteEditorViewController activityStreamToolbarBottomConstraint](self, "activityStreamToolbarBottomConstraint");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = v57;
      -[ICNoteEditorViewController activityStreamToolbar](self, "activityStreamToolbar");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "leadingAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController navigationController](self, "navigationController");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "view");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "leadingAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "constraintEqualToAnchor:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v63[1] = v40;
      -[ICNoteEditorViewController activityStreamToolbar](self, "activityStreamToolbar");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "trailingAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController navigationController](self, "navigationController");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "view");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "trailingAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "constraintEqualToAnchor:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v63[2] = v46;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 3);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "activateConstraints:", v47);

      if (v59)
      {
        -[ICNoteEditorViewController navigationController](self, "navigationController");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "view");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "layoutIfNeeded");

        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __84__ICNoteEditorViewController_showActivityStreamToolbarForObject_selection_animated___block_invoke;
        v62[3] = &unk_1EA7DD2D8;
        v62[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v62, 0.25);
      }

      v8 = v60;
      v9 = v61;
    }
  }
  -[ICNoteEditorViewController activityStreamToolbar](self, "activityStreamToolbar");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setSelection:", v8);

  -[ICNoteEditorViewController activityStreamToolbar](self, "activityStreamToolbar");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setObject:", v9);

}

void __84__ICNoteEditorViewController_showActivityStreamToolbarForObject_selection_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "activityStreamToolbarBottomConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setConstant:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (void)hideActivityStreamToolbarAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  _QWORD v14[5];

  if (a3
    && (-[ICNoteEditorViewController activityStreamToolbar](self, "activityStreamToolbar"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    -[ICNoteEditorViewController activityStreamToolbar](self, "activityStreamToolbar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0DC3F10];
    v13 = v5;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__ICNoteEditorViewController_hideActivityStreamToolbarAnimated___block_invoke;
    v14[3] = &unk_1EA7DD2D8;
    v14[4] = self;
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __64__ICNoteEditorViewController_hideActivityStreamToolbarAnimated___block_invoke_2;
    v12 = &unk_1EA7DE700;
    v7 = v5;
    objc_msgSend(v6, "animateWithDuration:animations:completion:", v14, &v9, 0.25);

  }
  else
  {
    -[ICNoteEditorViewController activityStreamToolbar](self, "activityStreamToolbar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

  }
  -[ICNoteEditorViewController setActivityStreamToolbar:](self, "setActivityStreamToolbar:", 0, v9, v10, v11, v12);
  -[ICNoteEditorViewController setActivityStreamToolbarBottomConstraint:](self, "setActivityStreamToolbarBottomConstraint:", 0);
}

void __64__ICNoteEditorViewController_hideActivityStreamToolbarAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "activityStreamToolbar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "activityStreamToolbarBottomConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v4);

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

}

uint64_t __64__ICNoteEditorViewController_hideActivityStreamToolbarAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (UIViewController)rootViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[ICNoteEditorViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v5;
}

- (void)noteOrFolderChangedCallback
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;

  if (-[ICNoteEditorViewController isEditingOnSystemPaperOnPhone](self, "isEditingOnSystemPaperOnPhone"))
  {
    if (!-[ICNoteEditorViewController quickNoteiPhoneDidSaveOrCancel](self, "quickNoteiPhoneDidSaveOrCancel"))
    {
      -[ICNoteEditorBaseViewController note](self, "note");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "isDeletedOrInTrash");

      if (v4)
      {
        -[ICNoteEditorViewController delegate](self, "delegate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_opt_respondsToSelector();

        if ((v6 & 1) != 0)
        {
          -[ICNoteEditorViewController delegate](self, "delegate");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "noteEditorRequestsDismissal:cancelled:", self, 1);

        }
      }
    }
  }
  if (-[ICNoteEditorViewController isDrawingStroke](self, "isDrawingStroke"))
  {
    -[ICNoteEditorViewController noteOrFolderChangedCallbackSelectorDelayer](self, "noteOrFolderChangedCallbackSelectorDelayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64268]), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", self, sel_noteOrFolderChangedCallback, 0, 1, 0.25);
      -[ICNoteEditorViewController setNoteOrFolderChangedCallbackSelectorDelayer:](self, "setNoteOrFolderChangedCallbackSelectorDelayer:", v9);

    }
    -[ICNoteEditorViewController noteOrFolderChangedCallbackSelectorDelayer](self, "noteOrFolderChangedCallbackSelectorDelayer");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "requestFire");
  }
  else
  {
    -[ICNoteEditorViewController updateBarButtonsAnimated:](self, "updateBarButtonsAnimated:", 1);
    -[ICNoteEditorViewController updateActionMenu](self, "updateActionMenu");
    -[ICNoteEditorViewController textView](self, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorBaseViewController note](self, "note");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateCompatibilityBannerForNote:parentViewController:updateTextViewContentInsets:", v11, self, 1);

    -[ICNoteEditorViewController showOrHidePasswordEntryViewControllerIfNeeded](self, "showOrHidePasswordEntryViewControllerIfNeeded");
    -[ICNoteEditorViewController updateBarButtons](self, "updateBarButtons");
    if (!-[ICNoteEditorViewController userWantsToSeeDateLabel](self, "userWantsToSeeDateLabel")
      || (-[ICNoteEditorBaseViewController note](self, "note"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "isSharedReadOnly"),
          v12,
          v13))
    {
      -[ICNoteEditorViewController resetDateView](self, "resetDateView");
    }
    -[ICNoteEditorViewController textView](self, "textView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "userTitleView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateContentToCurrentNote");

    -[ICNoteEditorViewController updatePencilKitSelectionViewEnabled](self, "updatePencilKitSelectionViewEnabled");
    -[ICNoteEditorViewController textView](self, "textView");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "ic_isFirstResponder"))
    {
      -[ICNoteEditorBaseViewController note](self, "note");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEditable");

      if ((v17 & 1) != 0)
        return;
      -[ICNoteEditorViewController textView](self, "textView");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "resignFirstResponder");
    }
  }

}

- (void)resetBarButtonsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reset");

  if (!-[ICNoteEditorViewController suspendBarButtonUpdates](self, "suspendBarButtonUpdates"))
    -[ICNoteEditorViewController updateBarButtonsAnimated:](self, "updateBarButtonsAnimated:", v3);
}

- (void)undoAction:(id)a3
{
  void *v4;
  BOOL v5;
  id v6;

  -[ICNoteEditorViewController textView](self, "textView", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "canUndo"))
  {
    v5 = -[ICNoteEditorViewController isDrawingStroke](self, "isDrawingStroke");

    if (v5)
      return;
    -[ICNoteEditorViewController textView](self, "textView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "undoManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "undo");
  }

}

- (void)redoAction:(id)a3
{
  void *v4;
  BOOL v5;
  id v6;

  -[ICNoteEditorViewController textView](self, "textView", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "canRedo"))
  {
    v5 = -[ICNoteEditorViewController isDrawingStroke](self, "isDrawingStroke");

    if (v5)
      return;
    -[ICNoteEditorViewController textView](self, "textView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "undoManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "redo");
  }

}

- (void)updateLastViewedMetadataIfNessessary
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;

  if (-[ICNoteEditorViewController ic_isViewVisible](self, "ic_isViewVisible"))
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "updateLastViewedTimestampWithCurrentTimestamp");

    if (v4)
    {
      -[ICNoteEditorBaseViewController note](self, "note");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "saveAfterDelay");

    }
  }
  -[ICNoteEditorBaseViewController note](self, "note");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__ICNoteEditorViewController_updateLastViewedMetadataIfNessessary__block_invoke;
    block[3] = &unk_1EA7DD2D8;
    v10 = v7;
    dispatch_async(v8, block);

  }
}

uint64_t __66__ICNoteEditorViewController_updateLastViewedMetadataIfNessessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D63C58], "clearNotificationForRecordID:", *(_QWORD *)(a1 + 32));
}

- (void)localeChanged:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  if (ICInternalSettingsIsTextKit2Enabled())
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *MEMORY[0x1E0D63928];
    v7 = objc_msgSend(v5, "length");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__ICNoteEditorViewController_localeChanged___block_invoke;
    v9[3] = &unk_1EA7DE2F0;
    v10 = v5;
    v8 = v5;
    objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v7, 0, v9);

  }
}

void __44__ICNoteEditorViewController_localeChanged___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "style") == 102)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "layoutManagers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v12, "invalidateLayoutForCharacterRange:actualCharacterRange:", a3, a4, 0);
          objc_msgSend(v12, "ensureLayoutForCharacterRange:", a3, a4);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

- (BOOL)currentSelectionContainsListOrFixedWidth
{
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  uint64_t v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[ICNoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_selectedRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v22 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v22)
  {
    v24 = *(_QWORD *)v28;
    v5 = (_QWORD *)MEMORY[0x1E0D63928];
    while (2)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[ICNoteEditorBaseViewController note](self, "note");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "textStorage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "string");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v7, "rangeValue");
        v13 = objc_msgSend(v10, "paragraphRangeForRange:", v11, v12);
        v15 = v14;

        if (v13 < v13 + v15)
        {
          v16 = v13;
          while (1)
          {
            v25 = 0;
            v26 = 0;
            -[ICNoteEditorBaseViewController note](self, "note");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "textStorage");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "attribute:atIndex:longestEffectiveRange:inRange:", *v5, v16, &v25, v13, v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              if (objc_msgSend(v19, "isList"))
                break;
            }
            v16 = v26 + v25;

            if (v16 >= v13 + v15)
              goto LABEL_11;
          }

          v20 = 1;
          goto LABEL_16;
        }
LABEL_11:
        ;
      }
      v20 = 0;
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v22)
        continue;
      break;
    }
  }
  else
  {
    v20 = 0;
  }
LABEL_16:

  return v20;
}

- (void)removeKVOObserversForNote:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, CFSTR("noteHasChanges"), &compoundliteral_2703);
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, CFSTR("modificationDate"), &compoundliteral_2703);
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, CFSTR("lastActivitySummaryViewedDate"), &compoundliteral_2703);
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, CFSTR("attachmentViewType"), &compoundliteral_2703);
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, CFSTR("paperStyleType"), &compoundliteral_2703);
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, CFSTR("isEmpty"), &compoundliteral_2703);
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, CFSTR("serverShareData"), &compoundliteral_2703);
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, CFSTR("isSharedViaICloud"), &compoundliteral_2703);
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, CFSTR("prefersLightBackground"), &compoundliteral_2701);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  +[ICNoteEditorUserTitleView noteKeyPathsAffectingUserTitleView](ICNoteEditorUserTitleView, "noteKeyPathsAffectingUserTitleView", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), &compoundliteral_2705);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)setNote:(id)a3 overrideScrollState:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v6)
    -[ICNoteEditorViewController setArchivedScrollStateToApply:](self, "setArchivedScrollStateToApply:", v6);
  -[ICNoteEditorViewController setNote:](self, "setNote:", v8);
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    -[ICNoteEditorViewController archivedScrollStateToApply](self, "archivedScrollStateToApply");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      -[ICNoteEditorViewController applyScrollStateIfAvailable](self, "applyScrollStateIfAvailable");
  }

}

void __70__ICNoteEditorViewController_setNote_delayedForLaunch_successHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v2, "shortLoggingDescription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1DD7B0000, v3, OS_LOG_TYPE_INFO, "Migrated previous note to v1 Neo {migratedNote: %@}", (uint8_t *)&v5, 0xCu);

    }
  }

}

uint64_t __70__ICNoteEditorViewController_setNote_delayedForLaunch_successHandler___block_invoke_660(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNote:delayedForLaunch:successHandler:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

- (void)presentRecordingStoppedAlertForNoteIfNeeded:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D63A50], "currentAttachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "note");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v7 = (void *)MEMORY[0x1E0D63A50];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __74__ICNoteEditorViewController_presentRecordingStoppedAlertForNoteIfNeeded___block_invoke;
    v8[3] = &unk_1EA7DE688;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v7, "cancelCurrentAudioRecordingSessionWithCompletionHandler:", v8);

  }
}

void __74__ICNoteEditorViewController_presentRecordingStoppedAlertForNoteIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
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
  _QWORD v20[4];
  id v21;
  id v22;
  id location;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "AudioTranscription");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __74__ICNoteEditorViewController_presentRecordingStoppedAlertForNoteIfNeeded___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __74__ICNoteEditorViewController_presentRecordingStoppedAlertForNoteIfNeeded___block_invoke_cold_1();
  }

  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Recording Stopped"), &stru_1EA7E9860, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Leaving the note stopped your audio recording. Your recording is saved in the note."), &stru_1EA7E9860, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Return to Note"), &stru_1EA7E9860, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __74__ICNoteEditorViewController_presentRecordingStoppedAlertForNoteIfNeeded___block_invoke_686;
  v20[3] = &unk_1EA7DE768;
  objc_copyWeak(&v22, &location);
  v21 = *(id *)(a1 + 40);
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 0, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v15);

  v16 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA7E9860, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 0, &__block_literal_global_687);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v19);

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v11, 1, 0);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
}

void __74__ICNoteEditorViewController_presentRecordingStoppedAlertForNoteIfNeeded___block_invoke_686(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "viewControllerManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showNoteWithIdentifier:", v3);

}

- (void)reloadCurrentNote
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[ICNoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedRange");
  v6 = v5;

  -[ICNoteEditorBaseViewController note](self, "note");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController setNote:](self, "setNote:", 0);
  -[ICNoteEditorViewController setNote:](self, "setNote:", v8);
  -[ICNoteEditorViewController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelectedRange:", v4, v6);

}

- (void)noteDidDeauthenticateAfterMerge:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(v6, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorBaseViewController note](self, "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 == v5)
      -[ICNoteEditorViewController noteDecryptedStatusDidChange:](self, "noteDecryptedStatusDidChange:", v6);
  }

}

- (void)noteDecryptedStatusDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D636F0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isBlockingDeauthentication"))
  {

  }
  else
  {
    if (v7)
    {
      -[ICNoteEditorBaseViewController note](self, "note");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v7, "isEqual:", v10);

      if (!v11)
        goto LABEL_8;
    }
    else
    {

    }
    dispatchMainAfterDelay();
  }
LABEL_8:

}

void __59__ICNoteEditorViewController_noteDecryptedStatusDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasswordProtected");

  if (v3)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "note", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attachments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "checkPreviewImagesIntegrity");
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v7);
    }

    objc_msgSend(*(id *)(a1 + 32), "note");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v10, "mergeUnappliedEncryptedRecordRecursivelyInBackground");

    objc_msgSend(*(id *)(a1 + 32), "showOrHidePasswordEntryViewControllerIfNeeded");
    objc_msgSend(*(id *)(a1 + 32), "note");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = v11 == 0;

    if ((v10 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "note");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isAuthenticated");

      if (v13)
      {
        dispatchMainAfterDelay();
        objc_msgSend(*(id *)(a1 + 32), "updateDrawingAttachmentsIfNeeded");
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "note");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isPasswordProtected");

        if (v15)
        {
          objc_msgSend(*(id *)(a1 + 32), "viewControllerManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "currentAttachmentPresenter");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "dismissAnimated:completion:", 0, 0);

        }
        objc_msgSend(*(id *)(a1 + 32), "calculateScrubberController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(*(id *)(a1 + 32), "calculateScrubberController");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "hideScrubber");

        }
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        v31 = &v30;
        v32 = 0x2020000000;
        v21 = (_QWORD *)getkAXQuickSpeakStopSpeakingNotificationSymbolLoc_ptr;
        v33 = getkAXQuickSpeakStopSpeakingNotificationSymbolLoc_ptr;
        if (!getkAXQuickSpeakStopSpeakingNotificationSymbolLoc_ptr)
        {
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __getkAXQuickSpeakStopSpeakingNotificationSymbolLoc_block_invoke;
          v29[3] = &unk_1EA7DECF8;
          v29[4] = &v30;
          __getkAXQuickSpeakStopSpeakingNotificationSymbolLoc_block_invoke((uint64_t)v29);
          v21 = (_QWORD *)v31[3];
        }
        _Block_object_dispose(&v30, 8);
        if (!v21)
        {
          __59__ICNoteEditorViewController_noteDecryptedStatusDidChange___block_invoke_cold_1();
          __break(1u);
        }
        objc_msgSend(v20, "postNotificationName:object:", *v21, 0);

        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Notes Locked"), &stru_1EA7E9860, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        ICAccessibilityPostHighPriorityAnnouncementNotification();
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "textView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "icaxClearCaches");

  }
}

void __59__ICNoteEditorViewController_noteDecryptedStatusDidChange___block_invoke_2()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Notes Unlocked"), &stru_1EA7E9860, 0);
  v1 = (id)objc_claimAutoreleasedReturnValue();

  ICAccessibilityPostHighPriorityAnnouncementNotification();
}

- (id)dynamicBarColor
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  BOOL v15;

  v3 = -[ICNoteEditorViewController shouldForceLightContent](self, "shouldForceLightContent");
  -[ICNoteEditorViewController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "ic_noteEditorBackgroundColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = (void *)MEMORY[0x1E0DC3658];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45__ICNoteEditorViewController_dynamicBarColor__block_invoke;
  v13[3] = &unk_1EA7DE830;
  v15 = v3;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "colorWithDynamicProvider:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __45__ICNoteEditorViewController_dynamicBarColor__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v3, "traitCollectionByModifyingTraits:", &__block_literal_global_697);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  objc_msgSend(*(id *)(a1 + 32), "resolvedColorWithTraitCollection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_appearanceInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationBarAlpha");
  objc_msgSend(v6, "colorWithAlphaComponent:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __45__ICNoteEditorViewController_dynamicBarColor__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserInterfaceStyle:", 1);
}

- (int64_t)preferredStatusBarStyle
{
  if (-[ICNoteEditorViewController shouldForceLightContent](self, "shouldForceLightContent"))
    return 3;
  else
    return 0;
}

- (void)hideAndDismissPresentedViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[ICNoteEditorViewController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  v5 = (void *)objc_opt_class();
  -[ICNoteEditorViewController presentedViewController](self, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__ICNoteEditorViewController_hideAndDismissPresentedViewController__block_invoke;
  v7[3] = &unk_1EA7DD2D8;
  v7[4] = self;
  objc_msgSend(v5, "dismissChildPresentedViewControllersInPostOrder:animated:completion:", v6, 0, v7);

}

uint64_t __67__ICNoteEditorViewController_hideAndDismissPresentedViewController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanupAfterBarSourcedPopoverPresentation");
}

+ (void)dismissChildPresentedViewControllersInPostOrder:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v11 = a3;
  v8 = a5;
  objc_msgSend(v11, "presentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v11, "presentedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dismissChildPresentedViewControllersInPostOrder:animated:completion:", v10, 0, 0);

  }
  objc_msgSend(v11, "dismissViewControllerAnimated:completion:", v6, v8);

}

- (void)resetTextViewContentOffset
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  -[ICNoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;

  -[ICNoteEditorViewController textViewTopInsetThatWeWant](self, "textViewTopInsetThatWeWant");
  v7 = -v6;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    -[ICNoteEditorViewController ic_safeAreaDistanceFromTop](self, "ic_safeAreaDistanceFromTop");
    v7 = v7 - v8;
  }
  -[ICNoteEditorViewController textView](self, "textView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resetContentOffset:", v5, v7);

}

- (ICNoteContext)noteContext
{
  return (ICNoteContext *)objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
}

- (int64_t)currentWritingDirection
{
  void *v2;
  int64_t v3;

  -[ICNoteEditorViewController textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ic_currentWritingDirection");

  return v3;
}

- (BOOL)ignoresTaps
{
  void *v4;
  char v5;

  if (ICInternalSettingsIsTextKit2Enabled())
    return self->_ignoresTaps;
  -[ICNoteEditorViewController textViewController](self, "textViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ignoresTaps");

  return v5;
}

- (void)setIgnoresTaps:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v3 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    self->_ignoresTaps = v3;
    if (v3)
    {
      v26 = 0uLL;
      v27 = 0uLL;
      v24 = 0uLL;
      v25 = 0uLL;
      -[ICNoteEditorViewController textView](self, "textView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subviews");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v25 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            if (objc_msgSend(v11, "isUserInteractionEnabled"))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                -[ICNoteEditorViewController enabledSubviews](self, "enabledSubviews");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "addObject:", v11);

                objc_msgSend(v11, "setUserInteractionEnabled:", 0);
              }
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v8);
      }
    }
    else
    {
      v22 = 0uLL;
      v23 = 0uLL;
      v20 = 0uLL;
      v21 = 0uLL;
      -[ICNoteEditorViewController enabledSubviews](self, "enabledSubviews");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v21;
        do
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v21 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "setUserInteractionEnabled:", 1);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        }
        while (v15);
      }

      -[ICNoteEditorViewController enabledSubviews](self, "enabledSubviews");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeAllObjects");
    }

    -[ICNoteEditorViewController textView](self, "textView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSelectable:", v3 ^ 1);

  }
  else
  {
    -[ICNoteEditorViewController textViewController](self, "textViewController");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setIgnoresTaps:", v3);

  }
}

- (ICAttributionSidebarView)attributionSidebarView
{
  void *v2;
  void *v3;

  -[ICNoteEditorViewController textViewController](self, "textViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributionSidebarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICAttributionSidebarView *)v3;
}

void __55__ICNoteEditorViewController_updateUnsupportedNoteView__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_loadWeakRetained(v1);
    v6[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "undoablyTrashOrDeleteNotes:", v5);

  }
}

void __44__ICNoteEditorViewController_setInvitation___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  char v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v8 = objc_loadWeakRetained(v2);
    objc_msgSend(*(id *)(a1 + 32), "shareURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "invitationViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collaborationButtons_acceptInviteWithShareURL:invitationViewController:", v5, v7);

  }
}

- (BOOL)isPasswordEntryShowing
{
  void *v2;
  BOOL v3;

  -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __75__ICNoteEditorViewController_showOrHidePasswordEntryViewControllerIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 == 2)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "eventReporter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "submitPasswordSuccessEventForModernNote:", v5);

    objc_msgSend(v8, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v6, "isAuthenticated");

    WeakRetained = v8;
    if ((_DWORD)v5)
    {
      objc_msgSend(v8, "passwordEntryViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = v8;
      if (v7)
      {
        objc_msgSend(v8, "showOrHidePasswordEntryViewControllerIfNeeded");
        WeakRetained = v8;
      }
    }
  }

}

void __75__ICNoteEditorViewController_showOrHidePasswordEntryViewControllerIfNeeded__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __75__ICNoteEditorViewController_showOrHidePasswordEntryViewControllerIfNeeded__block_invoke_3(id *a1, int a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  int v7;
  void *v8;
  _QWORD v9[5];

  if (a2)
  {
    objc_msgSend(a1[4], "passwordEntryViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = a1[5];

    if (v3 == v4)
    {
      v5 = a1[6];
      objc_msgSend(a1[4], "note");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v5 == v6)
      {
        v7 = objc_msgSend(a1[6], "isAuthenticated");

        if (v7)
        {
          objc_msgSend(a1[4], "resetDateView");
          objc_msgSend(a1[5], "view");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeFromSuperview");

          objc_msgSend(a1[4], "removeChildViewController:", a1[5]);
          objc_msgSend(a1[4], "setPasswordEntryViewController:", 0);
          objc_msgSend(a1[4], "showOrHideActivityStreamToolbarIfNeeded");
          if (objc_msgSend(a1[4], "shouldBeginEditingAfterNoteUnlock"))
          {
            objc_msgSend(a1[4], "setShouldBeginEditingAfterNoteUnlock:", 0);
            objc_msgSend(a1[4], "startEditing");
          }
          v9[0] = MEMORY[0x1E0C809B0];
          v9[1] = 3221225472;
          v9[2] = __75__ICNoteEditorViewController_showOrHidePasswordEntryViewControllerIfNeeded__block_invoke_4;
          v9[3] = &unk_1EA7DD2D8;
          v9[4] = a1[4];
          objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v9, 0.25);
        }
      }
      else
      {

      }
    }
  }
}

void __75__ICNoteEditorViewController_showOrHidePasswordEntryViewControllerIfNeeded__block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "textView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __91__ICNoteEditorViewController_showOrHideLockIconCoverViewControllerIfNeededIsBackgrounding___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __91__ICNoteEditorViewController_showOrHideLockIconCoverViewControllerIfNeededIsBackgrounding___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeFromSuperview");

}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  if (!a3)
  {
    if (-[ICNoteEditorViewController isEditing](self, "isEditing"))
      -[ICNoteEditorViewController setEditing:animated:](self, "setEditing:animated:", 0, 0);
  }
}

- (void)prepareForBarSourcedPopoverPresentation
{
  void *v3;
  void *v4;
  id v5;

  -[ICNoteEditorViewController setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  if ((-[ICNoteEditorViewController isEditing](self, "isEditing") & 1) == 0)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "selectedTextRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController setSelectedTextRangeToRestoreAfterBarSourcedPopoverPresentation:](self, "setSelectedTextRangeToRestoreAfterBarSourcedPopoverPresentation:", v4);

    -[ICNoteEditorViewController textView](self, "textView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelectedTextRange:", 0);

  }
}

- (void)cleanupAfterBarSourcedPopoverPresentation
{
  void *v3;
  void *v4;
  void *v5;

  -[ICNoteEditorViewController setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
  -[ICNoteEditorViewController selectedTextRangeToRestoreAfterBarSourcedPopoverPresentation](self, "selectedTextRangeToRestoreAfterBarSourcedPopoverPresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICNoteEditorViewController selectedTextRangeToRestoreAfterBarSourcedPopoverPresentation](self, "selectedTextRangeToRestoreAfterBarSourcedPopoverPresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelectedTextRange:", v4);

    -[ICNoteEditorViewController setSelectedTextRangeToRestoreAfterBarSourcedPopoverPresentation:](self, "setSelectedTextRangeToRestoreAfterBarSourcedPopoverPresentation:", 0);
  }
}

- (id)addQuickNoteWithPencil:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  _BOOL8 v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315394;
    v19 = "-[ICNoteEditorViewController addQuickNoteWithPencil:]";
    v20 = 1024;
    v21 = 5933;
    _os_log_impl(&dword_1DD7B0000, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v18, 0x12u);
  }

  if (!-[ICNoteEditorBaseViewController isEditingOnSecureScreen](self, "isEditingOnSecureScreen"))
    return 0;
  -[ICNoteEditorViewController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isFirstResponder") & 1) != 0)
  {
    v7 = !v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "userInterfaceIdiom"))
      v7 = 0;
    else
      v7 = !v3;

  }
  v10 = (void *)MEMORY[0x1E0D639C8];
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultAccountInContext:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "defaultFolder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(MEMORY[0x1E0D63BB8], "newEmptyNoteInFolder:", v14);
  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "submitNoteCreateEventForModernNote:createApproach:", v15, 12);

  -[ICNoteEditorViewController setNote:](self, "setNote:", v15);
  -[ICNoteEditorViewController updateBarButtons](self, "updateBarButtons");
  -[ICNoteEditorViewController setupLinedPaperOnNewNote:willStartEditing:](self, "setupLinedPaperOnNewNote:willStartEditing:", v15, v7);
  if (v7)
    -[ICNoteEditorViewController startEditing](self, "startEditing");
  -[ICNoteEditorBaseViewController note](self, "note");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)addNewNote
{
  return -[ICNoteEditorViewController addNewNoteWithEvent:](self, "addNewNoteWithEvent:", 0);
}

- (id)addNewNoteWithEvent:(id)a3
{
  ICNoteEditorViewController *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  ICNoteEditorViewController *v9;
  uint64_t v10;

  v4 = (ICNoteEditorViewController *)a3;
  -[ICNoteEditorViewController saveNote](self, "saveNote");
  if (-[ICNoteEditorBaseViewController isEditingOnSecureScreen](self, "isEditingOnSecureScreen"))
  {
    -[ICNoteEditorViewController addQuickNoteWithPencil:](self, "addQuickNoteWithPencil:", -[ICNoteEditorViewController ic_isPencilEvent](v4, "ic_isPencilEvent"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = -[ICNoteEditorBaseViewController isEditingOnSystemPaper](self, "isEditingOnSystemPaper");
    -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v4)
      v9 = v4;
    else
      v9 = self;
    if (v6)
      v10 = 18;
    else
      v10 = 2;
    objc_msgSend(v7, "showNewNoteWithApproach:sender:animated:", v10, v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)setupLinedPaperOnNewNote:(id)a3 willStartEditing:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  dispatch_time_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v4 = a4;
  v5 = a3;
  objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D64270], "objectForKey:", CFSTR("PaperStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  if (v8 <= 1)
    v9 = 1;
  else
    v9 = v8;
  if (v4)
  {
    v10 = v9;
    v11 = dispatch_time(0, 1000000000);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __72__ICNoteEditorViewController_setupLinedPaperOnNewNote_willStartEditing___block_invoke;
    v12[3] = &unk_1EA7DE8A8;
    v13 = v5;
    v14 = v10;
    dispatch_after(v11, MEMORY[0x1E0C80D38], v12);

  }
  else
  {
    objc_msgSend(v5, "setPaperStyleType:", (__int16)v9);
  }

}

uint64_t __72__ICNoteEditorViewController_setupLinedPaperOnNewNote_willStartEditing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPaperStyleType:", *(__int16 *)(a1 + 40));
}

- (void)addNote:(id)a3
{
  -[ICNoteEditorViewController addNote:event:shouldInstrumentAsNewNoteAffordanceUsage:](self, "addNote:event:shouldInstrumentAsNewNoteAffordanceUsage:", a3, 0, 0);
}

- (void)addNote:(id)a3 event:(id)a4 shouldInstrumentAsNewNoteAffordanceUsage:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v5 = a5;
  v11 = a4;
  if (v5)
  {
    -[ICNoteEditorViewController eventReporter](self, "eventReporter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushNoteCreateDataWithCreateApproach:", 2);

    v8 = -[ICNoteEditorViewController addNewNoteWithEvent:](self, "addNewNoteWithEvent:", v11);
    -[ICNoteEditorViewController eventReporter](self, "eventReporter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "popNoteCreateData");

  }
  else
  {
    v10 = -[ICNoteEditorViewController addNewNoteWithEvent:](self, "addNewNoteWithEvent:", v11);
  }

}

- (void)addNewNoteIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  id v7;
  id v8;

  -[ICNoteEditorBaseViewController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0D64DE8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isQuickNoteSessionActive");

    if (v5)
    {
      v6 = -[ICNoteEditorViewController addQuickNoteWithPencil:](self, "addQuickNoteWithPencil:", 1);
    }
    else
    {
      -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v8, "showNewNoteWithApproach:sender:animated:", 0, self, 1);

    }
  }
}

- (void)deleteCurrentNote:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  ICNoteEditorViewController *v13;
  id v14;

  v4 = a3;
  if (!-[ICNoteEditorViewController isPerformingDeleteAnimation](self, "isPerformingDeleteAnimation"))
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __48__ICNoteEditorViewController_deleteCurrentNote___block_invoke;
      v12 = &unk_1EA7DD498;
      v13 = self;
      v14 = v4;
      v6 = (void (**)(_QWORD))_Block_copy(&v9);
      objc_opt_class();
      -[ICNoteEditorViewController presentedViewController](self, "presentedViewController", v9, v10, v11, v12, v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v6);
      else
        v6[2](v6);

    }
  }

}

void __48__ICNoteEditorViewController_deleteCurrentNote___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, int);
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSuspendBarButtonUpdates:", 1);
  if (objc_msgSend(*(id *)(a1 + 32), "isEditing"))
    objc_msgSend(*(id *)(a1 + 32), "setEditing:animated:", 0, 1);
  v3 = objc_alloc(NSClassFromString(CFSTR("ICDeleteDecisionController")));
  v17[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "eventReporter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithSourceObjects:window:sender:eventReporter:", v4, v6, v7, v8);

  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __48__ICNoteEditorViewController_deleteCurrentNote___block_invoke_2;
  v14 = &unk_1EA7DE8D0;
  v10 = *(void **)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 32);
  v16 = v10;
  objc_msgSend(v9, "performDecisionWithCompletion:", &v11);
  if (!v9)
    objc_msgSend(*(id *)(a1 + 32), "setSuspendBarButtonUpdates:", 0, v11, v12, v13, v14, v15);

}

uint64_t __48__ICNoteEditorViewController_deleteCurrentNote___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  int v4;
  id v5;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "performDeleteAnimation:", *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0D64DE8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isQuickNoteSessionActive");

    if (v4)
      v5 = (id)objc_msgSend(*(id *)(a1 + 32), "addQuickNoteWithPencil:", 0);
  }
  return objc_msgSend(*(id *)(a1 + 32), "setSuspendBarButtonUpdates:", 0);
}

- (void)performDeleteAnimation:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
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
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;

  v4 = a3;
  if (!-[ICNoteEditorBaseViewController isEditingOnSystemPaper](self, "isEditingOnSystemPaper"))
  {
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_3;
    -[ICNoteEditorViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rightBarButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
LABEL_3:
      v6 = 0;
      if (v5)
      {
LABEL_7:
        -[ICNoteEditorViewController setIsPerformingDeleteAnimation:](self, "setIsPerformingDeleteAnimation:", 1);
        -[ICNoteEditorViewController backgroundView](self, "backgroundView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "contentView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_alloc(MEMORY[0x1E0DC3F10]);
        objc_msgSend(v13, "bounds");
        v15 = (void *)objc_msgSend(v14, "initWithFrame:");
        objc_msgSend(v13, "frame");
        v17 = v16;
        v19 = v18;
        v21 = v20;
        v23 = v22;
        objc_msgSend(v12, "snapshotViewAfterScreenUpdates:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (UIAccessibilityIsReduceMotionEnabled())
        {
          v25 = 0;
        }
        else
        {
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v17, v19, v21, v23);
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setBackgroundColor:", v26);

          if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
            objc_msgSend(v25, "ic_applyRoundedCornersFromView:", v13);
          objc_msgSend(v15, "addSubview:", v25);
        }
        objc_msgSend(v15, "addSubview:", v24);
        -[ICNoteEditorViewController backgroundView](self, "backgroundView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addSubviewAboveAllViews:", v15);

        objc_msgSend(v5, "bounds");
        objc_msgSend(v15, "convertRect:fromView:", v5);
        if (v6)
        {
          CGRectGetWidth(*(CGRect *)&v28);
          -[ICNoteEditorViewController ic_isRTL](self, "ic_isRTL");
        }
        v35 = v24;
        v36 = v15;
        v32 = v15;
        v33 = v25;
        v34 = v24;
        dispatchMainAfterDelay();

      }
    }
    else
    {
      -[ICNoteEditorViewController navigationItem](self, "navigationItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "rightBarButtonItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = 1;
      if (v5)
        goto LABEL_7;
    }

  }
}

void __53__ICNoteEditorViewController_performDeleteAnimation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  __int128 v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;

  v2 = MEMORY[0x1E0C809B0];
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__ICNoteEditorViewController_performDeleteAnimation___block_invoke_2;
  v10[3] = &unk_1EA7DDDE0;
  v11 = *(id *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 80);
  v13 = *(_OWORD *)(a1 + 64);
  v14 = v4;
  v12 = *(id *)(a1 + 40);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __53__ICNoteEditorViewController_performDeleteAnimation___block_invoke_3;
  v7[3] = &unk_1EA7DE8D0;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v3, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v10, v7);

}

uint64_t __53__ICNoteEditorViewController_performDeleteAnimation___block_invoke_2(uint64_t a1)
{
  void *v3;
  void *v4;
  void *v5;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGAffineTransform v10;

  if (UIAccessibilityIsReduceMotionEnabled())
    return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  CGAffineTransformMakeRotation(&v10, 0.42062435);
  v3 = *(void **)(a1 + 32);
  v9 = v10;
  objc_msgSend(v3, "setTransform:", &v9);
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v4, "transform");
    v5 = *(void **)(a1 + 32);
  }
  else
  {
    v5 = 0;
    memset(&v7, 0, sizeof(v7));
  }
  CGAffineTransformScale(&v8, &v7, 0.01, 0.01);
  v6 = v8;
  objc_msgSend(v5, "setTransform:", &v6);
  TSDCenterOfRect();
  objc_msgSend(*(id *)(a1 + 32), "setCenter:");
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __53__ICNoteEditorViewController_performDeleteAnimation___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "setIsPerformingDeleteAnimation:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setSuspendBarButtonUpdates:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "updateBarButtons");
}

- (void)moveToFolderPressed:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICNoteEditorViewController app_showMoveToFolder](self, "app_showMoveToFolder");
}

- (void)quickNoteAllNotes:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[ICNoteEditorViewController didEndEditingNote](self, "didEndEditingNote", a3);
  -[ICNoteEditorViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ICNoteEditorViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "noteEditorDidTapAllNotes:", self);

  }
}

- (void)gridViewBack:(id)a3
{
  -[ICNoteEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)lockBarButtonPressed:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[ICNoteEditorBaseViewController note](self, "note", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAuthenticated");

  if (!v5)
  {
    -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "beginAuthentication");
    goto LABEL_5;
  }
  -[ICNoteEditorViewController saveNote](self, "saveNote");
  objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deauthenticate");

  -[ICNoteEditorViewController stopTextFindingIfNecessary](self, "stopTextFindingIfNecessary");
  -[ICNoteEditorBaseViewController note](self, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "account");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v12;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D64C88], "sharedMigrator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "showMigrationPromptAndMigrateIfNeededForAccount:window:", v12, v11);

LABEL_5:
    v8 = v12;
  }

}

- (void)iCloudShareButtonPressed:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[ICNoteEditorViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ICNoteEditorViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "noteEditorDidTapAddPeople:", self);
  }
  else
  {
    -[ICNoteEditorViewController view](self, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ic_crashIfWindowIsSecure");
  }

}

- (void)shareButtonPressedWithSender:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[ICNoteEditorViewController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "findInteraction");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "dismissFindNavigator");

  -[ICNoteEditorViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ICNoteEditorViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "noteEditorDidTapAddPeople:", self);
  }
  else
  {
    -[ICNoteEditorViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ic_crashIfWindowIsSecure");

    objc_opt_class();
    ICDynamicCast();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v7 = v9;
    }
    else
    {
      -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shareBarButtonItem");
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[ICNoteEditorViewController performSelector:withObject:](self, "performSelector:withObject:", sel_app_shareButtonPressed_, v7);
  }

}

- (void)createAndPresentCloudSharingControllerBySender:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICNoteEditorViewController app_createAndPresentCloudSharingControllerBySender:](self, "app_createAndPresentCloudSharingControllerBySender:", v4);

}

- (void)didBeginFindInteraction
{
  void *v3;
  int v4;
  id v5;

  -[ICNoteEditorViewController noteFormattingController](self, "noteFormattingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ic_isViewVisible");

  if (v4)
    -[ICNoteEditorViewController showStyleSelector:animated:](self, "showStyleSelector:animated:", 0, 1);
  if (-[ICNoteEditorViewController isInkPickerShowing](self, "isInkPickerShowing"))
  {
    -[ICNoteEditorViewController setInkPickerState:](self, "setInkPickerState:", 2);
    -[ICNoteEditorViewController hideInkPicker](self, "hideInkPicker");
  }
  -[ICNoteEditorViewController findResultReporter](self, "findResultReporter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startTrackingFindSession");

}

- (void)didUpdateSearchQueryInFindInteraction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICNoteEditorViewController findResultReporter](self, "findResultReporter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithSearchQuery:", v4);

}

- (void)didEndFindInteraction
{
  void *v3;
  id v4;

  -[ICNoteEditorViewController showOrHideSearchPatternHighlightsIfNecessary](self, "showOrHideSearchPatternHighlightsIfNecessary");
  -[ICNoteEditorViewController clearTextViewSelection](self, "clearTextViewSelection");
  -[ICNoteEditorViewController findResultReporter](self, "findResultReporter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "submitEventIfApplicableForNote:", v3);

}

- (void)performFindInNote:(id)a3
{
  void *v4;
  void *v5;

  -[ICNoteEditorViewController textView](self, "textView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "findInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentFindNavigatorShowingReplace:", 0);

  -[ICNoteEditorViewController showOrHideSearchPatternHighlightsIfNecessary](self, "showOrHideSearchPatternHighlightsIfNecessary");
}

- (void)performReplaceInNote:(id)a3
{
  void *v4;
  void *v5;

  -[ICNoteEditorViewController textView](self, "textView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "findInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentFindNavigatorShowingReplace:", 1);

  -[ICNoteEditorViewController showOrHideSearchPatternHighlightsIfNecessary](self, "showOrHideSearchPatternHighlightsIfNecessary");
}

- (void)doneEditing
{
  -[ICNoteEditorViewController didEndEditingNote](self, "didEndEditingNote");
  -[ICNoteEditorViewController doneEditing:](self, "doneEditing:", 0);
  -[ICNoteEditorViewController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)doneEditing:(id)a3
{
  uint64_t v4;
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  void (**v20)(_QWORD);
  _QWORD aBlock[5];

  if (-[ICNoteEditorViewController isInkPickerShowing](self, "isInkPickerShowing", a3))
  {
    -[ICNoteEditorViewController setInkPickerState:](self, "setInkPickerState:", 2);
    -[ICNoteEditorViewController hideInkPicker](self, "hideInkPicker");
  }
  else
  {
    v4 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __42__ICNoteEditorViewController_doneEditing___block_invoke;
    aBlock[3] = &unk_1EA7DD2D8;
    aBlock[4] = self;
    v5 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[ICNoteEditorViewController keyboardDidShowAnimationDate](self, "keyboardDidShowAnimationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController keyboardDidShowAnimationDate](self, "keyboardDidShowAnimationDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v8);
      v10 = v9;

      if (v10 < 0.3
        && (-[ICNoteEditorViewController textView](self, "textView"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v11, "isScrolling"),
            v11,
            v12))
      {
        v16 = v4;
        v17 = 3221225472;
        v18 = __42__ICNoteEditorViewController_doneEditing___block_invoke_2;
        v19 = &unk_1EA7DDE08;
        v20 = v5;
        dispatchMainAfterDelay();

      }
      else
      {
        v5[2](v5);
      }

    }
    else
    {
      v5[2](v5);
    }

  }
  -[ICNoteEditorViewController calculateScrubberController](self, "calculateScrubberController", v16, v17, v18, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isShowing");

  if (v14)
  {
    -[ICNoteEditorViewController calculateScrubberController](self, "calculateScrubberController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hideScrubber");

  }
  -[ICNoteEditorViewController submitNoteEditEventIfNecessary](self, "submitNoteEditEventIfNecessary");
}

uint64_t __42__ICNoteEditorViewController_doneEditing___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = objc_msgSend(*(id *)(a1 + 32), "isEditing");
  if ((_DWORD)result)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "shouldUseiPadBarLayout") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "navigationController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setToolbarHidden:animated:", 0, 0);

    }
    return objc_msgSend(*(id *)(a1 + 32), "setEditing:animated:", 0, 1);
  }
  return result;
}

uint64_t __42__ICNoteEditorViewController_doneEditing___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)toggleTodoStyle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[ICNoteEditorViewController attributionSidebarController](self, "attributionSidebarController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hideSidebarAnimated:", 1);

  -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toggleTodoStyle:", v14);
  }
  else
  {
    -[ICNoteEditorViewController textController](self, "textController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v7, "textStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v7, "selectedRange");
    objc_msgSend(v6, "todoForRange:inTextStorage:", v10, v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[ICNoteEditorViewController setCurrentTextStyle:](self, "setCurrentTextStyle:", 3);
    }
    else
    {
      -[ICNoteEditorViewController setCurrentTextStyle:](self, "setCurrentTextStyle:", 103);
      -[ICNoteEditorViewController submitChecklistAnalyticsEventForActionType:](self, "submitChecklistAnalyticsEventForActionType:", 1);
    }
    -[ICNoteEditorViewController showStyleSelector:animated:](self, "showStyleSelector:animated:", 0, 1);
    -[ICNoteEditorViewController updateBarButtons](self, "updateBarButtons");
    -[ICNoteEditorViewController textView](self, "textView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "icaxClearCaches");

  }
}

- (void)toggleTodoChecked:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  _QWORD v32[4];
  id v33;
  id location;

  v4 = a3;
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEditable");

  if ((v6 & 1) != 0)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "selectedRange");
    v10 = v9;

    -[ICNoteEditorViewController textController](self, "textController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textStorage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "paragraphStyleForRange:inTextView:inTextStorage:", v8, v10, v12, v14);

    if (v15 == 103)
    {
      -[ICNoteEditorViewController textController](self, "textController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController textView](self, "textView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "textStorage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v16, "isTodoDoneRange:inTextStorage:", v8, v10, v18);

      -[ICNoteEditorViewController textController](self, "textController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController textView](self, "textView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "textStorage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setDone:range:inTextStorage:", v19 ^ 1u, v8, v10, v22);

      if (v19)
        v23 = 2;
      else
        v23 = 3;
      -[ICNoteEditorViewController submitChecklistAnalyticsEventForActionType:](self, "submitChecklistAnalyticsEventForActionType:", v23);
      -[ICNoteEditorViewController textController](self, "textController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController textView](self, "textView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "expandedChecklistTrackedParagraphsInTextView:forIndex:", v25, v8);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      -[ICNoteEditorViewController textController](self, "textController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController textView](self, "textView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __48__ICNoteEditorViewController_toggleTodoChecked___block_invoke;
      v32[3] = &unk_1EA7DE260;
      objc_copyWeak(&v33, &location);
      objc_msgSend(v28, "autoSortChecklistIfNecessaryForTrackedParagraph:textView:analyticsHandler:", v27, v29, v32);

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);

    }
  }
  else
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isDeletedOrInTrash");

    if (v31)
      -[ICNoteEditorViewController showRecoverNoteAlert](self, "showRecoverNoteAlert");
  }

}

void __48__ICNoteEditorViewController_toggleTodoChecked___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "eventReporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "submitMoveCheckedItemsToBottomSwitchEventWithNewState:isInApp:", a2, 1);

}

- (void)changeStyle:(id)a3
{
  -[ICNoteEditorViewController showStyleSelector:animated:sender:](self, "showStyleSelector:animated:sender:", 1, 1, a3);
}

- (void)setTitleStyle:(id)a3
{
  void *v4;
  id v5;

  -[ICNoteEditorViewController setCurrentTextStyle:](self, "setCurrentTextStyle:", 0);
  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitStyleFormatEventForModernNote:styleTypeValue:", v4, 1);

}

- (void)setHeadingStyle:(id)a3
{
  void *v4;
  id v5;

  -[ICNoteEditorViewController setCurrentTextStyle:](self, "setCurrentTextStyle:", 1);
  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitStyleFormatEventForModernNote:styleTypeValue:", v4, 2);

}

- (void)setSubheadingStyle:(id)a3
{
  void *v4;
  id v5;

  -[ICNoteEditorViewController setCurrentTextStyle:](self, "setCurrentTextStyle:", 2);
  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitStyleFormatEventForModernNote:styleTypeValue:", v4, 3);

}

- (void)setBodyStyle:(id)a3
{
  void *v4;
  id v5;

  -[ICNoteEditorViewController setCurrentTextStyle:](self, "setCurrentTextStyle:", 3);
  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitStyleFormatEventForModernNote:styleTypeValue:", v4, 4);

}

- (void)setFixedWidthStyle:(id)a3
{
  void *v4;
  id v5;

  -[ICNoteEditorViewController setCurrentTextStyle:](self, "setCurrentTextStyle:", 4);
  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitStyleFormatEventForModernNote:styleTypeValue:", v4, 5);

}

- (void)setBulletedListStyle:(id)a3
{
  void *v4;
  id v5;

  -[ICNoteEditorViewController setCurrentTextStyle:](self, "setCurrentTextStyle:", 100);
  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitStyleFormatEventForModernNote:styleTypeValue:", v4, 6);

}

- (void)setDashedListStyle:(id)a3
{
  void *v4;
  id v5;

  -[ICNoteEditorViewController setCurrentTextStyle:](self, "setCurrentTextStyle:", 101);
  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitStyleFormatEventForModernNote:styleTypeValue:", v4, 7);

}

- (void)setNumberedListStyle:(id)a3
{
  void *v4;
  id v5;

  -[ICNoteEditorViewController setCurrentTextStyle:](self, "setCurrentTextStyle:", 102);
  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitStyleFormatEventForModernNote:styleTypeValue:", v4, 8);

}

- (void)prepareSelectionForAddingAttachment
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  if ((-[ICNoteEditorViewController isEditing](self, "isEditing") & 1) == 0)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textStorage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    -[ICNoteEditorViewController textView](self, "textView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectedRange:", v5, 0);

  }
}

- (void)createTodoListItem:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  -[ICNoteEditorViewController attributionSidebarController](self, "attributionSidebarController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hideSidebarAnimated:", 1);

  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "selectedRange");
  v8 = v7;

  if (-[ICNoteEditorViewController isEditing](self, "isEditing"))
  {
    -[ICNoteEditorViewController toggleTodoStyle:](self, "toggleTodoStyle:", v15);
  }
  else if (v6 == 0x7FFFFFFFFFFFFFFFLL || !v8)
  {
    -[ICNoteEditorViewController addTodoListAtEndOfNote](self, "addTodoListAtEndOfNote");
  }
  else
  {
    objc_opt_class();
    -[ICNoteEditorViewController textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICNoteEditorViewController textController](self, "textController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsOnlyStyle:inRange:inTextStorage:", 103, v6, v8, v11);

    if (v13)
      v14 = 3;
    else
      v14 = 103;
    -[ICNoteEditorViewController setCurrentTextStyle:](self, "setCurrentTextStyle:", v14);
    -[ICNoteEditorViewController startEditing](self, "startEditing");

  }
}

- (void)addTodoListAtEndOfNote
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  if ((-[ICNoteEditorViewController ic_isViewVisible](self, "ic_isViewVisible") & 1) == 0)
  {
    -[ICNoteEditorViewController setAddToDoListAfterViewAppears:](self, "setAddToDoListAfterViewAppears:", 1);
    return;
  }
  -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isWelcomeScreenVisible");

  if ((v4 & 1) == 0)
  {
    -[ICNoteEditorViewController addNewNoteIfNeeded](self, "addNewNoteIfNeeded");
    -[ICNoteEditorViewController textView](self, "textView");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v25, "textStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "length");
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v6, "string");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "characterAtIndex:", v8 - 1);

      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "characterIsMember:", v10) & 1) != 0)
      {
        -[ICNoteEditorViewController textController](self, "textController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController textView](self, "textView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "paragraphStyleForRange:inTextView:inTextStorage:", v8 - 1, 1, v13, v6);

        if (v14 == 103)
        {
          if (v8 == 1)
          {
            v8 = 0;
          }
          else
          {
            objc_msgSend(v6, "string");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "characterAtIndex:", v8 - 2);

            if ((objc_msgSend(v11, "characterIsMember:", v16) & 1) != 0)
            {
              --v8;
            }
            else
            {
              -[ICNoteEditorViewController textController](self, "textController");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "insertNewlineAtCharacterIndex:textStorage:", v8 - 1, v6);

            }
          }

          -[ICNoteEditorViewController textView](self, "textView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setSelectedRange:", v8, 0);

          goto LABEL_15;
        }
      }
      else
      {
        objc_msgSend(v25, "setSelectedRange:", v8, 0);
        objc_msgSend(v25, "insertText:", CFSTR("\n"));
        v8 = objc_msgSend(v6, "length");
      }

      -[ICNoteEditorViewController textView](self, "textView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = v8;
    }
    else
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = 0;
    }
    objc_msgSend(v17, "setSelectedRange:", v19, 0);

    -[ICNoteEditorViewController setCurrentTextStyle:](self, "setCurrentTextStyle:", 103);
LABEL_15:
    if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    {
      objc_opt_class();
      -[ICNoteEditorViewController textView](self, "textView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "layoutManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "updateVisibleSupplementalViews");
    }
    -[ICNoteEditorViewController startEditing](self, "startEditing");
    -[ICNoteEditorViewController updateBarButtons](self, "updateBarButtons");

  }
}

- (void)cleanupAfterAddImageAttachmentOperation
{
  void *v3;

  -[ICNoteEditorViewController setIsAddingImageAttachment:](self, "setIsAddingImageAttachment:", 0);
  objc_msgSend(MEMORY[0x1E0DC3F20], "attemptRotationToDeviceOrientation");
  if (-[ICNoteEditorViewController didEndEditingForAddingImageAttachment](self, "didEndEditingForAddingImageAttachment"))
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setShouldAvoidBecomingFirstResponder:", 0);

    if (!+[ICExtensionSafeAPIShims applicationState](ICExtensionSafeAPIShims, "applicationState"))
      -[ICNoteEditorViewController startEditing](self, "startEditing");
    -[ICNoteEditorViewController setDidEndEditingForAddingImageAttachment:](self, "setDidEndEditingForAddingImageAttachment:", 0);
  }
}

- (BOOL)isDocumentCameraAvailable
{
  if ((objc_msgSend(MEMORY[0x1E0DC3470], "ic_isExtension") & 1) != 0)
    return 0;
  else
    return objc_msgSend(MEMORY[0x1E0D641E0], "isCameraAvailable");
}

- (BOOL)isPhotosLibraryAvailable
{
  int v3;

  v3 = objc_msgSend(MEMORY[0x1E0DC3880], "isSourceTypeAvailable:", 0);
  if (v3)
    LOBYTE(v3) = !-[ICNoteEditorBaseViewController isEditingOnSecureScreen](self, "isEditingOnSecureScreen");
  return v3;
}

- (void)showInsertUIWithPreferredSourceType:(unint64_t)a3
{
  if ((-[ICNoteEditorViewController ic_isViewVisible](self, "ic_isViewVisible") & 1) != 0)
  {
    switch(a3)
    {
      case 1uLL:
        if ((objc_msgSend(MEMORY[0x1E0D641E0], "isCameraAvailable") & 1) == 0)
          goto LABEL_14;
        goto LABEL_15;
      case 3uLL:
        if ((objc_msgSend(MEMORY[0x1E0DC3708], "ic_isLiveTextAvailable") & 1) != 0)
          goto LABEL_15;
        goto LABEL_14;
      case 4uLL:
        if (-[ICNoteEditorViewController isDocumentCameraAvailable](self, "isDocumentCameraAvailable"))
          goto LABEL_15;
        goto LABEL_14;
      case 6uLL:
        if ((objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") & 1) == 0)
          goto LABEL_14;
        goto LABEL_15;
      default:
LABEL_14:
        if (objc_msgSend(MEMORY[0x1E0DC3880], "isSourceTypeAvailable:", 1))
        {
LABEL_15:
          -[ICNoteEditorViewController showInsertUIForSourceType:sender:](self, "showInsertUIForSourceType:sender:", a3, 0);
        }
        else if (-[ICNoteEditorViewController isPhotosLibraryAvailable](self, "isPhotosLibraryAvailable"))
        {
          -[ICNoteEditorViewController showPhotoLibrary](self, "showPhotoLibrary");
        }
        break;
    }
  }
  else if (a3 == 4)
  {
    -[ICNoteEditorViewController setAddDocumentScanAfterViewAppears:](self, "setAddDocumentScanAfterViewAppears:", 1);
  }
  else if (a3 == 1)
  {
    -[ICNoteEditorViewController setShowInsertUIAfterViewAppears:](self, "setShowInsertUIAfterViewAppears:", 1);
  }
}

- (void)showPhotoLibrary
{
  -[ICNoteEditorViewController showInsertUIForSourceType:sender:](self, "showInsertUIForSourceType:sender:", 2, 0);
}

- (void)attachFile:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[ICNoteEditorBaseViewController note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canAddAttachment");

  if ((v5 & 1) != 0)
  {
    -[ICNoteEditorViewController prepareSelectionForAddingAttachment](self, "prepareSelectionForAddingAttachment");
    -[ICNoteEditorViewController showInsertUIForSourceType:sender:](self, "showInsertUIForSourceType:sender:", 5, v6);
  }
  else
  {
    -[ICNoteEditorViewController warnUserAttachmentLimitExceeded](self, "warnUserAttachmentLimitExceeded");
  }

}

- (void)showInsertUIForSourceType:(unint64_t)a3 sender:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  ICNoteEditorViewController *v17;
  ICNoteEditorViewController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD block[5];

  -[ICNoteEditorBaseViewController note](self, "note", a3, a4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        -[ICNoteEditorBaseViewController note](self, "note"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "canAddAttachment"),
        v8,
        v7,
        (v9 & 1) == 0))
  {
    -[ICNoteEditorViewController warnUserAttachmentLimitExceeded](self, "warnUserAttachmentLimitExceeded");
  }
  else
  {
    -[ICNoteEditorViewController addNewNoteIfNeeded](self, "addNewNoteIfNeeded");
    -[ICNoteEditorViewController prepareSelectionForAddingAttachment](self, "prepareSelectionForAddingAttachment");
    -[ICNoteEditorViewController showInkPicker:animated:](self, "showInkPicker:animated:", 0, 1);
    switch(a3)
    {
      case 1uLL:
        if (-[ICNoteEditorViewController isEditing](self, "isEditing"))
          -[ICNoteEditorViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
        -[ICNoteEditorViewController visualAssetImportController](self, "visualAssetImportController");
        v26 = (id)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController traitCollection](self, "traitCollection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "presentVisualAssetCaptureControllerWithDisableAutorotate:", objc_msgSend(v10, "userInterfaceIdiom") == 0);

        goto LABEL_15;
      case 2uLL:
        -[ICNoteEditorViewController visualAssetImportController](self, "visualAssetImportController");
        v26 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "presentVisualAssetPickerController");
        goto LABEL_15;
      case 3uLL:
        -[ICNoteEditorViewController textView](self, "textView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "becomeFirstResponder");

        -[ICNoteEditorViewController textView](self, "textView");
        v26 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "captureTextFromCamera:", self);
        goto LABEL_15;
      case 4uLL:
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController setCreatedGalleryAttachmentUUID:](self, "setCreatedGalleryAttachmentUUID:", v12);

        v13 = objc_alloc(MEMORY[0x1E0D1D810]);
        -[ICNoteEditorViewController documentCameraControllerCreateDataCryptorIfNecessary](self, "documentCameraControllerCreateDataCryptorIfNecessary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (id)objc_msgSend(v13, "initWithDataCryptorDelegate:", v14);

        -[ICNoteEditorViewController navigationController](self, "navigationController");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
          v17 = (ICNoteEditorViewController *)v15;
        else
          v17 = self;
        v18 = v17;

        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D830]), "initWithImageCache:docCamDelegate:remoteDocCamDelegate:", v26, self, self);
        objc_msgSend(v19, "setModalTransitionStyle:", 2);
        -[ICNoteEditorViewController presentViewController:animated:completion:](v18, "presentViewController:animated:completion:", v19, 1, 0);
        -[ICNoteEditorViewController eventReporter](self, "eventReporter");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "pushStartDocScanPageCountData:", 0);

        -[ICNoteEditorViewController eventReporter](self, "eventReporter");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController createdGalleryAttachmentUUID](self, "createdGalleryAttachmentUUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "UUIDString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "pushDocScanDataWithID:actionType:stage:", v23, 1, 1);

        -[ICNoteEditorViewController eventReporter](self, "eventReporter");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorBaseViewController note](self, "note");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "submitDocScanEventForNote:pageCount:", v25, 0);
LABEL_15:

        break;
      case 5uLL:
        -[ICNoteEditorViewController showDocumentPicker](self, "showDocumentPicker");
        break;
      case 7uLL:
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __63__ICNoteEditorViewController_showInsertUIForSourceType_sender___block_invoke;
        block[3] = &unk_1EA7DD2D8;
        block[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], block);
        break;
      default:
        return;
    }
  }
}

void __63__ICNoteEditorViewController_showInsertUIForSourceType_sender___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "audioAttachmentEditorCoordinator");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "presentRecordingViewControllerForAttachment:", 0);

}

- (void)showDocumentPicker
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3730]);
  v6[0] = *MEMORY[0x1E0CEC4A0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initForOpeningContentTypes:asCopy:", v4, 1);

  objc_msgSend(v5, "setAllowsMultipleSelection:", 0);
  objc_msgSend(v5, "setDelegate:", self);
  -[ICNoteEditorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = a4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (!v5)
    goto LABEL_30;
  v7 = v5;
  v46 = *(_QWORD *)v50;
  v45 = *MEMORY[0x1E0C998E0];
  v43 = *MEMORY[0x1E0CEC570];
  v41 = *MEMORY[0x1E0D636A0];
  v42 = *MEMORY[0x1E0CD0E98];
  *(_QWORD *)&v6 = 138412546;
  v40 = v6;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v50 != v46)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
      -[ICNoteEditorBaseViewController note](self, "note", v40);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "canAddAttachment");

      if ((v11 & 1) == 0)
      {
        -[ICNoteEditorViewController warnUserAttachmentLimitExceeded](self, "warnUserAttachmentLimitExceeded");
        goto LABEL_30;
      }
      -[ICNoteEditorBaseViewController note](self, "note");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "attachmentExceedsMaxSizeAllowed:", objc_msgSend(v9, "ic_fileSize"));

      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("Maximum attachment size reached."), &stru_1EA7E9860, 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController warnLimitExceededWithTitle:andMessage:](self, "warnLimitExceededWithTitle:andMessage:", v39, 0);

        goto LABEL_30;
      }
      objc_msgSend(v9, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByDeletingPathExtension");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = 0;
      LODWORD(v14) = objc_msgSend(v9, "getResourceValue:forKey:error:", &v48, v45, 0);
      v16 = v48;
      v17 = v16;
      if (!(_DWORD)v14 || !v16)
      {
        -[ICNoteEditorBaseViewController note](self, "note");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addAttachmentWithFileURL:", v9);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      if (!objc_msgSend(v16, "conformsToType:", v43))
      {
        -[ICNoteEditorBaseViewController note](self, "note");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addAttachmentWithUTI:withURL:", v27, v9);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_23;
      }
      v18 = ICInternalSettingsDefaultToPaperKitPDFsAndScans();
      -[ICNoteEditorBaseViewController note](self, "note");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        objc_msgSend(v17, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addAttachmentWithUTI:withURL:", v22, v9);
        v25 = objc_claimAutoreleasedReturnValue();
LABEL_19:

        v22 = (void *)v25;
        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "UUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addPaperDocumentAttachmentWithIdentifier:subtype:", v21, v41);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "managedObjectContext");
      v23 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v23, "ic_save");

      v47 = 0;
      LOBYTE(v23) = objc_msgSend(MEMORY[0x1E0D63C00], "createPaperDocumentForAttachment:fromLegacyMediaAtURL:error:", v22, v9, &v47);
      v19 = v47;
      if ((v23 & 1) == 0)
      {
        v24 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v22, "ic_loggingDescription");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v40;
          v54 = v19;
          v55 = 2112;
          v56 = v37;
          _os_log_error_impl(&dword_1DD7B0000, v24, OS_LOG_TYPE_ERROR, "Failed to create paper document from PDF with error: %@ -- deleting attachment %@", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0D639F0], "deleteAttachment:", v22);
        v25 = 0;
        goto LABEL_19;
      }
LABEL_20:

      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD0DB8]), "initWithURL:", v9);
      objc_msgSend(v26, "documentAttributes");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", v42);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v29, "length"))
      {
        v30 = v29;

        v15 = v30;
      }

LABEL_23:
      if (v22)
      {
        objc_msgSend(v22, "setTitle:", v15);
        -[ICNoteEditorViewController attachmentInsertionController](self, "attachmentInsertionController");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController textView](self, "textView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "selectedRange");
        v35 = (id)objc_msgSend(v31, "addAttachment:atTextLocation:", v22, v33 + v34);

        -[ICNoteEditorBaseViewController note](self, "note");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "save");

      }
    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v7)
      continue;
    break;
  }
LABEL_30:

}

- (void)insertSidecarItems:(id)a3 service:(int64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  double MaxX;
  uint64_t v31;
  double v32;
  double v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  id v47;
  uint64_t v48;
  CGAffineTransform v49;
  uint8_t buf;
  _BYTE v51[15];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[5];
  id v57;
  _BYTE v58[128];
  uint64_t v59;
  CGRect v60;
  CGRect v61;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ICNoteEditorViewController prepareSelectionForAddingAttachment](self, "prepareSelectionForAddingAttachment");
  if (!a4)
  {
    v12 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ICNoteEditorViewController insertSidecarItems:service:].cold.1();

    objc_msgSend(v6, "ic_compactMap:", &__block_literal_global_739);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController visualAssetImportController](self, "visualAssetImportController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addImageData:typeIdentifier:", v8, 0);
    goto LABEL_10;
  }
  if ((unint64_t)a4 > 2)
  {
    if (a4 != 3)
      goto LABEL_12;
    v13 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[ICNoteEditorViewController insertSidecarItems:service:].cold.5();

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v8 = v6;
    v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v14)
    {
      v15 = v14;
      v47 = v6;
      v16 = *(_QWORD *)v53;
      v17 = *MEMORY[0x1E0CD12D8];
      v18 = *MEMORY[0x1E0CD12F0];
      v19 = *MEMORY[0x1E0C9D820];
      v20 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      while (2)
      {
        v21 = 0;
        v48 = v15;
        do
        {
          if (*(_QWORD *)v53 != v16)
            objc_enumerationMutation(v8);
          v22 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v21);
          objc_msgSend(v22, "type");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", v17);

          if ((v24 & 1) != 0)
          {
            -[ICNoteEditorBaseViewController note](self, "note");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "canAddAttachment");

            if ((v26 & 1) == 0)
            {
              v46 = os_log_create("com.apple.notes", "UI");
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                -[ICNoteEditorViewController insertSidecarItems:service:].cold.3();

              -[ICNoteEditorViewController warnUserAttachmentLimitExceeded](self, "warnUserAttachmentLimitExceeded");
              goto LABEL_40;
            }
            v27 = v17;
            objc_msgSend(v22, "data");
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1158]), "initWithData:error:", v28, 0);
            objc_msgSend(v29, "bounds");
            MaxX = CGRectGetMaxX(v60);
            if (MaxX > v18)
            {
              CGAffineTransformMakeScale(&v49, v18 / MaxX, v18 / MaxX);
              objc_msgSend(v29, "_transformAllStrokes:", &v49);
            }
            v31 = v16;
            objc_msgSend(v29, "_canvasBounds");
            if (v33 == v19 && v32 == v20)
            {
              objc_msgSend(v29, "bounds");
              objc_msgSend(v29, "set_canvasBounds:", 0.0, 0.0, v18, CGRectGetMaxY(v61));
            }
            v35 = (void *)MEMORY[0x1E0D63C00];
            -[ICNoteEditorBaseViewController note](self, "note");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "createSystemPaperAttachmentWithPKDrawing:inNote:", v29, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            -[ICNoteEditorViewController attachmentInsertionController](self, "attachmentInsertionController");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICNoteEditorViewController textView](self, "textView");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "selectedRange");
            v42 = (id)objc_msgSend(v38, "addAttachment:atTextLocation:", v37, v40 + v41);

            -[ICNoteEditorBaseViewController note](self, "note");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "managedObjectContext");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "ic_save");

            objc_msgSend(MEMORY[0x1E0D64B00], "sharedGenerator");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "generatePreviewIfNeededForAttachment:", v37);

            v16 = v31;
            v17 = v27;
            v15 = v48;
          }
          else
          {
            v28 = os_log_create("com.apple.notes", "UI");
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              -[ICNoteEditorViewController insertSidecarItems:service:].cold.4(&buf, v51, v28);
          }

          ++v21;
        }
        while (v15 != v21);
        v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
        if (v15)
          continue;
        break;
      }
LABEL_40:
      v6 = v47;
    }
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[ICNoteEditorViewController insertSidecarItems:service:].cold.2();

    objc_msgSend(v6, "ic_map:", &__block_literal_global_745);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D810]), "initWithDataCryptorDelegate:", 0);
    v10 = (void *)MEMORY[0x1E0D1D7F8];
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __57__ICNoteEditorViewController_insertSidecarItems_service___block_invoke_2;
    v56[3] = &unk_1EA7DE9A0;
    v56[4] = self;
    v57 = v9;
    v11 = v9;
    objc_msgSend(v10, "infoCollectionFromSidecarItems:imageCache:completion:", v8, v11, v56);

LABEL_10:
LABEL_11:

  }
LABEL_12:

}

uint64_t __57__ICNoteEditorViewController_insertSidecarItems_service___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "data");
}

id __57__ICNoteEditorViewController_insertSidecarItems_service___block_invoke_743(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x1E0D97640];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v4, "initWithData:type:", v5, v6);
  return v7;
}

void __57__ICNoteEditorViewController_insertSidecarItems_service___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:", 0, a2, *(_QWORD *)(a1 + 40), 1, 0);
  }
  else
  {
    v2 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __57__ICNoteEditorViewController_insertSidecarItems_service___block_invoke_2_cold_1();

  }
}

- (id)getTableControllerFor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  while (1)
  {
    v5 = v4;
    objc_msgSend(v4, "nextResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      break;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      ICDynamicCast();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  v6 = 0;
LABEL_6:

  return v6;
}

- (void)addTable:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[ICNoteEditorBaseViewController note](self, "note", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canAddAttachment");

  if ((v5 & 1) != 0)
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEditable");

    if ((v7 & 1) != 0)
    {
      -[ICNoteEditorViewController showStyleSelector:animated:](self, "showStyleSelector:animated:", 0, 0);
      -[ICNoteEditorViewController textView](self, "textView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "selectedRange");
      v10 = v9;

      if (v10)
      {
        -[ICNoteEditorViewController textStorage](self, "textStorage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController textView](self, "textView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "selectedRange");
        objc_msgSend(v11, "ic_attributedSubstringFromRange:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICNoteEditorBaseViewController note](self, "note");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "managedObjectContext");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "ic_attributedStringByFlatteningCalculateAttachmentsWithContext:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICNoteEditorBaseViewController note](self, "note");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addTableAttachmentWithText:", v18);
        v33 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[ICNoteEditorBaseViewController note](self, "note");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addTableAttachment");
        v33 = (id)objc_claimAutoreleasedReturnValue();
      }

      -[ICNoteEditorViewController eventReporter](self, "eventReporter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorBaseViewController note](self, "note");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "submitTableCreateEventForAttachment:inNote:", v33, v24);

      -[ICNoteEditorViewController attachmentInsertionController](self, "attachmentInsertionController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController textView](self, "textView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "selectedRange");
      v29 = (id)objc_msgSend(v25, "addAttachment:atTextRange:", v33, v27, v28);

      -[ICNoteEditorViewController undoManager](self, "undoManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Add Table"), &stru_1EA7E9860, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setActionName:", v32);

    }
    else
    {
      v20 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[ICNoteEditorBaseViewController note](self, "note");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "shortLoggingDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v35 = v22;
        _os_log_impl(&dword_1DD7B0000, v20, OS_LOG_TYPE_DEFAULT, "Trying to add table to non-editable note %@", buf, 0xCu);

      }
    }
  }
  else
  {
    -[ICNoteEditorViewController warnUserAttachmentLimitExceeded](self, "warnUserAttachmentLimitExceeded");
  }
}

- (void)resetDateView
{
  void *v2;
  id v3;

  -[ICNoteEditorViewController textView](self, "textView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

- (void)updatePencilKitSelectionViewEnabled
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isiPad"))
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEditable"))
      v3 = -[ICNoteEditorViewController attributionSidebarVisibility](self, "attributionSidebarVisibility") == 0;
    else
      v3 = 0;
    -[ICNoteEditorViewController textView](self, "textView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_pkSelectionInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", v3);

  }
}

- (void)openLink:(id)a3
{
  void *v4;
  id v5;

  -[ICNoteEditorViewController linkForSelection](self, "linkForSelection", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICExtensionSafeAPIShims openURL:originatingView:completionHandler:](ICExtensionSafeAPIShims, "openURL:originatingView:completionHandler:", v5, v4, 0);

}

- (void)tab:(id)a3
{
  id v4;

  if (-[ICNoteEditorViewController currentSelectionContainsListOrFixedWidth](self, "currentSelectionContainsListOrFixedWidth", a3))
  {
    -[ICNoteEditorViewController indentSelectionIfPossibleByAmount:](self, "indentSelectionIfPossibleByAmount:", 1);
  }
  else
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertText:", CFSTR("\t"));

  }
}

- (void)shiftTab:(id)a3
{
  -[ICNoteEditorViewController indentSelectionIfPossibleByAmount:](self, "indentSelectionIfPossibleByAmount:", -1);
}

- (void)shiftReturn:(id)a3
{
  id v3;

  -[ICNoteEditorViewController textView](self, "textView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertText:", CFSTR("\u2028"));

}

- (void)strikethrough:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "toggleStrikethrough:", v4);
  }
  else
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toggleStrikethrough");

    -[ICNoteEditorViewController textView](self, "textView");
    v7 = objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textViewDidChange:](self, "textViewDidChange:", v7);

    objc_opt_class();
    LOBYTE(v7) = objc_opt_isKindOfClass();

    if ((v7 & 1) == 0)
      return;
    -[ICNoteEditorViewController eventReporter](self, "eventReporter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorBaseViewController note](self, "note");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "submitNoteEditorCallOutBarButtonSelectionEventForModernNote:buttonTypeValue:", v4, 9);
  }

}

- (void)checkAll:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[ICNoteEditorViewController textController](self, "textController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3B18];
  -[ICNoteEditorViewController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "selectedRange");
  objc_msgSend(v6, "valueWithRange:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markAllChecklistItemsCompleted:inTextview:forSelectedRanges:", 1, v5, v11);

  -[ICNoteEditorViewController submitChecklistAnalyticsEventForActionType:](self, "submitChecklistAnalyticsEventForActionType:", 2);
}

- (void)uncheckAll:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[ICNoteEditorViewController textController](self, "textController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3B18];
  -[ICNoteEditorViewController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "selectedRange");
  objc_msgSend(v6, "valueWithRange:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markAllChecklistItemsCompleted:inTextview:forSelectedRanges:", 0, v5, v11);

  -[ICNoteEditorViewController submitChecklistAnalyticsEventForActionType:](self, "submitChecklistAnalyticsEventForActionType:", 3);
}

- (void)removeChecked:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[ICNoteEditorViewController textController](self, "textController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3B18];
  -[ICNoteEditorViewController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "selectedRange");
  objc_msgSend(v6, "valueWithRange:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeChecklistItemsMarkedCompleted:inTextView:forRanges:", 1, v5, v11);

  -[ICNoteEditorViewController submitChecklistAnalyticsEventForActionType:](self, "submitChecklistAnalyticsEventForActionType:", 4);
}

- (void)moveCheckedToBottom:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[ICNoteEditorViewController textController](self, "textController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "selectedRange");
  objc_msgSend(v4, "moveCheckedChecklistsToBottomInTextView:forRange:animated:", v5, v7, v8, 1);

  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "submitNoteEditorCallOutBarButtonSelectionEventForModernNote:buttonTypeValue:", v9, 14);

}

- (BOOL)canMoveSelectedListItemUp
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  -[ICNoteEditorViewController textController](self, "textController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "selectedRange");
  v8 = objc_msgSend(v3, "canMoveListItemInDirection:inTextView:forRange:", 0, v4, v6, v7);

  return v8;
}

- (BOOL)canMoveSelectedListItemDown
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  -[ICNoteEditorViewController textController](self, "textController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "selectedRange");
  v8 = objc_msgSend(v3, "canMoveListItemInDirection:inTextView:forRange:", 1, v4, v6, v7);

  return v8;
}

- (void)moveSelectedListItemUp:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  -[ICNoteEditorViewController textController](self, "textController", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "selectedRange");
  objc_msgSend(v8, "moveListItemInDirection:inTextView:forRange:", 0, v4, v6, v7);

}

- (void)moveSelectedListItemDown:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  -[ICNoteEditorViewController textController](self, "textController", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "selectedRange");
  objc_msgSend(v8, "moveListItemInDirection:inTextView:forRange:", 1, v4, v6, v7);

}

- (BOOL)canConvertToText
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  -[ICNoteEditorViewController textController](self, "textController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "selectedRange");
  v8 = objc_msgSend(v3, "canConvertInlineAttachmentToTextInTextView:forRange:", v4, v6, v7);

  return v8;
}

- (BOOL)canConvertToTag
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  -[ICNoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "ic_canConvertToTag"))
    v5 = !-[ICNoteEditorViewController canConvertToText](self, "canConvertToText");
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (void)convertToText:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  NSRange v18;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18.location = objc_msgSend(v5, "selectedRange");
    NSStringFromRange(v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v6;
    _os_log_impl(&dword_1DD7B0000, v4, OS_LOG_TYPE_INFO, "Converting inline attachment at %@ to text", (uint8_t *)&v15, 0xCu);

  }
  -[ICNoteEditorViewController textController](self, "textController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "selectedRange");
  objc_msgSend(v7, "convertInlineAttachmentToTextInTextView:forRange:", v8, v10, v11);

  -[ICNoteEditorViewController textView](self, "textView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textViewDidChange:](self, "textViewDidChange:", v12);

  -[ICNoteEditorBaseViewController note](self, "note");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateChangeCountWithReason:", CFSTR("Converted inline attachment to text"));

  -[ICNoteEditorBaseViewController note](self, "note");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "save");

}

- (void)convertToTag:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
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
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  NSRange v28;

  v27 = *MEMORY[0x1E0C80C00];
  -[ICNoteEditorViewController eventReporter](self, "eventReporter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "submitHashtagAddEventForNote:tokenContentIdentifier:viaAutoComplete:", v5, v7, 0);

  -[ICNoteEditorViewController setIsConvertToTag:](self, "setIsConvertToTag:", 1);
  v8 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28.location = objc_msgSend(v9, "selectedRange");
    NSStringFromRange(v28);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412290;
    v26 = v10;
    _os_log_impl(&dword_1DD7B0000, v8, OS_LOG_TYPE_INFO, "Converting text to inline attachment at %@", (uint8_t *)&v25, 0xCu);

  }
  v11 = (void *)MEMORY[0x1E0D63B40];
  -[ICNoteEditorViewController textView](self, "textView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "selectedText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ic_stringByReplacingLeadingFullWidthHashSignIfPossible");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "createHashtagAttachmentIfApplicableWithHashtagText:creatingHashtagIfNecessary:note:parentAttachment:", v14, 1, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[ICNoteEditorViewController attachmentInsertionController](self, "attachmentInsertionController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "selectedRange");
    v21 = (id)objc_msgSend(v17, "addInlineAttachment:atTextRange:", v16, v19, v20);

    objc_msgSend(v16, "updateChangeCountWithReason:", CFSTR("Created tag from text"));
    -[ICNoteEditorBaseViewController note](self, "note");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "updateChangeCountWithReason:", CFSTR("Created tag from text"));

    -[ICNoteEditorBaseViewController note](self, "note");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "save");

    -[ICNoteEditorViewController hashtagController](self, "hashtagController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "updateNoteHashtags");

  }
  -[ICNoteEditorViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);

}

- (BOOL)canAddToTags
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  -[ICNoteEditorViewController textController](self, "textController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "selectedRange");
  v8 = objc_msgSend(v3, "canAddToTagsInTextView:forRange:", v4, v6, v7);

  return v8;
}

- (void)addToTags:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[ICNoteEditorViewController addToTags:].cold.1(self, v4);

  -[ICNoteEditorViewController textController](self, "textController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "selectedRange");
  objc_msgSend(v5, "addToTagsInTextView:forRange:", v6, v8, v9);

}

- (void)openExperimentalHashtagUI:(id)a3
{
  ICHashtagViewController *v4;

  if (ICDebugModeEnabled())
  {
    v4 = objc_alloc_init(ICHashtagViewController);
    -[ICHashtagViewController setDelegate:](v4, "setDelegate:", self);
    -[ICNoteEditorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

  }
}

- (void)openLinkEditor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  -[ICNoteEditorViewController linkForSelection](self, "linkForSelection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNoteEditorViewController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0DC10F8];
  -[ICNoteEditorViewController textView](self, "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attribute:atIndex:effectiveRange:", v9, objc_msgSend(v10, "selectedRange"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  ICDynamicCast();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = xmmword_1DD9E6F90;
  if (v4)
  {
    -[ICNoteEditorViewController textStorage](self, "textStorage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0DC1160];
    -[ICNoteEditorViewController textView](self, "textView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "selectedRange");
    -[ICNoteEditorViewController textStorage](self, "textStorage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v13, "attribute:atIndex:longestEffectiveRange:inRange:", v14, v16, &v31, 0, objc_msgSend(v17, "length"));

    if ((_QWORD)v31 != 0x7FFFFFFFFFFFFFFFLL && *((_QWORD *)&v31 + 1))
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "ic_textRangeFromCharacterRange:", v31);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICNoteEditorViewController textView](self, "textView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "textInRange:", v20);
      v22 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v22;
      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D639E0], "detectedURLInString:allowNonLinkCharacters:", v6, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  -[ICNoteEditorViewController textView](self, "textView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v31 = objc_msgSend(v20, "selectedRange");
  *((_QWORD *)&v31 + 1) = v23;
LABEL_8:

  -[ICNoteEditorViewController presentedViewController](self, "presentedViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    -[ICNoteEditorViewController hideAndDismissPresentedViewController](self, "hideAndDismissPresentedViewController");
  -[ICNoteEditorBaseViewController note](self, "note");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "mergeableString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v31);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "selectionForCharacterRanges:selectionAffinity:", v28, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICLinkEditorViewControllerHelper presentFromViewController:delegate:text:url:attachment:stringSelection:range:addApproach:](ICLinkEditorViewControllerHelper, "presentFromViewController:delegate:text:url:attachment:stringSelection:range:addApproach:", self, self, v6, v4, v12, v29, v31, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController setLinkEditorViewController:](self, "setLinkEditorViewController:", v30);

}

- (void)openLinkEditorForLink:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "rangeForAttachment:", v4);
    v8 = v7;

    -[ICNoteEditorBaseViewController note](self, "note");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mergeableString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v6, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectionForCharacterRanges:selectionAffinity:", v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICNoteEditorViewController textView](self, "textView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], v6, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    ICDynamicCast();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController presentedViewController](self, "presentedViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      -[ICNoteEditorViewController hideAndDismissPresentedViewController](self, "hideAndDismissPresentedViewController");
    objc_msgSend(v4, "displayText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "selectedRange");
    +[ICLinkEditorViewControllerHelper presentFromViewController:delegate:text:url:attachment:stringSelection:range:addApproach:](ICLinkEditorViewControllerHelper, "presentFromViewController:delegate:text:url:attachment:stringSelection:range:addApproach:", self, self, v19, 0, v17, v13, v21, v22, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController setLinkEditorViewController:](self, "setLinkEditorViewController:", v23);

  }
}

- (void)openLinkEditorForLinkTextItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "range");
    v8 = v7;
    -[ICNoteEditorViewController textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ic_textRangeFromCharacterRange:", v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICNoteEditorViewController textView](self, "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textInRange:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICNoteEditorBaseViewController note](self, "note");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mergeableString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v6, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "selectionForCharacterRanges:selectionAffinity:", v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICNoteEditorViewController presentedViewController](self, "presentedViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      -[ICNoteEditorViewController hideAndDismissPresentedViewController](self, "hideAndDismissPresentedViewController");
    objc_msgSend(v5, "link");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "selectedRange");
    +[ICLinkEditorViewControllerHelper presentFromViewController:delegate:text:url:attachment:stringSelection:range:addApproach:](ICLinkEditorViewControllerHelper, "presentFromViewController:delegate:text:url:attachment:stringSelection:range:addApproach:", self, self, v12, v19, 0, v17, v21, v22, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController setLinkEditorViewController:](self, "setLinkEditorViewController:", v23);

  }
}

- (void)removeLinkForLinkTextItem:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  if (a3)
  {
    v4 = objc_msgSend(a3, "range");
    -[ICNoteEditorViewController removeLinksFromRange:](self, "removeLinksFromRange:", v4, v5);
  }
}

- (void)insertGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "calculateGraphingControllerInsertionDecision");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ICNoteEditorViewController calculateGraphingController](self, "calculateGraphingController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performDecision:", v7);

  }
}

- (void)addToGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "calculateGraphingControllerInsertionDecision");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "setPrefersExistingGraph:", 1);
    -[ICNoteEditorViewController calculateGraphingController](self, "calculateGraphingController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performDecision:", v7);

  }
}

- (void)createNoteLinkAttachment:(id)a3 textSelection:(id)a4 range:(_NSRange)a5 addApproach:(int64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  void *v12;
  id v13;
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
  NSUInteger v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  int64_t v34;
  uint8_t buf[16];

  length = a5.length;
  location = a5.location;
  v11 = a4;
  v12 = (void *)MEMORY[0x1E0D63BB8];
  v13 = a3;
  -[ICNoteEditorBaseViewController note](self, "note");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "noteWithIdentifier:context:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v34 = a6;
    v17 = (void *)MEMORY[0x1E0D63B40];
    -[ICNoteEditorBaseViewController note](self, "note");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "newLinkAttachmentToNote:fromNote:parentAttachment:", v16, v18, 0);

    -[ICNoteEditorBaseViewController note](self, "note");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "mergeableString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "characterRangesForSelection:", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      location = objc_msgSend(v23, "rangeValue");
      length = v24;
    }
    if (v19)
    {
      -[ICNoteEditorViewController attachmentInsertionController](self, "attachmentInsertionController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (id)objc_msgSend(v25, "addInlineAttachment:atTextRange:", v19, location, length);

      objc_msgSend(v23, "rangeValue");
      if (v27)
      {
        v28 = objc_msgSend(v23, "rangeValue") + 1;
        -[ICNoteEditorViewController textView](self, "textView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setSelectedRange:", v28, 0);

      }
      objc_msgSend(v19, "updateChangeCountWithReason:", CFSTR("Created note link"));
      -[ICNoteEditorBaseViewController note](self, "note");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "updateModificationDateAndChangeCountAndSaveImmediately");

      -[ICNoteEditorViewController eventReporter](self, "eventReporter");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorBaseViewController note](self, "note");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "submitAddLinkEvent:addApproach:contentType:isTokenized:", v32, v34, 1, 1);

      -[ICNoteEditorViewController startEditing](self, "startEditing");
    }

  }
  else
  {
    v33 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD7B0000, v33, OS_LOG_TYPE_DEFAULT, "Attempted to create Note Link Attachment to nil Note", buf, 2u);
    }

  }
}

- (void)createLink:(id)a3 title:(id)a4 textSelection:(id)a5 range:(_NSRange)a6 addApproach:(int64_t)a7
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v45 = a4;
  v10 = a5;
  -[ICNoteEditorBaseViewController note](self, "note");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mergeableString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v10;
  objc_msgSend(v12, "characterRangesForSelection:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v13;
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v47)
  {
    v43 = *MEMORY[0x1E0DC1160];
    v44 = *(_QWORD *)v49;
    v42 = *MEMORY[0x1E0D1CF60];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v49 != v44)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v14);
        -[ICNoteEditorViewController textView](self, "textView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "textStorage");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "attributesAtIndex:effectiveRange:", objc_msgSend(v15, "rangeValue"), 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v45);
        v20 = objc_msgSend(v19, "ic_range");
        objc_msgSend(v19, "addAttributes:range:", v18, v20, v21);
        v22 = objc_msgSend(v19, "ic_range");
        objc_msgSend(v19, "addAttribute:value:range:", v43, v46, v22, v23);
        v24 = objc_msgSend(v19, "ic_range");
        objc_msgSend(v19, "removeAttribute:range:", v42, v24, v25);
        -[ICNoteEditorViewController textView](self, "textView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "textStorage");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v15, "rangeValue");
        v30 = v29;
        v31 = (void *)objc_msgSend(v19, "copy");
        objc_msgSend(v27, "replaceCharactersInRange:withAttributedString:", v28, v30, v31);

        objc_msgSend(v15, "rangeValue");
        if (v32)
        {
          v33 = objc_msgSend(v15, "rangeValue");
          v34 = objc_msgSend(v19, "length");
          -[ICNoteEditorViewController textView](self, "textView");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setSelectedRange:", v33, v34);

        }
        ++v14;
      }
      while (v47 != v14);
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v47);
  }

  -[ICNoteEditorBaseViewController note](self, "note");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "updateModificationDateAndChangeCountAndSaveImmediately");

  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "submitAddLinkEvent:addApproach:url:", v38, a7, v46);

  -[ICNoteEditorViewController startEditing](self, "startEditing");
}

- (void)removeLinksFromTextSelection:(id)a3 range:(_NSRange)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[ICNoteEditorBaseViewController note](self, "note");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mergeableString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "characterRangesForSelection:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "rangeValue", (_QWORD)v16);
        -[ICNoteEditorViewController removeLinksFromRange:](self, "removeLinksFromRange:", v14, v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

- (void)removeLinksFromRange:(_NSRange)a3
{
  NSUInteger location;
  NSUInteger length;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  __int128 v30;

  location = a3.location;
  if (a3.length)
  {
    length = a3.length;
    -[ICNoteEditorViewController textStorage](self, "textStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAttribute:range:", *MEMORY[0x1E0DC1160], location, length);

    -[ICNoteEditorViewController textStorage](self, "textStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0DC10F8];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __51__ICNoteEditorViewController_removeLinksFromRange___block_invoke;
    v29[3] = &unk_1EA7DDC18;
    v29[4] = self;
    objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v8, location, length, 0, v29);

  }
  else
  {
    v30 = xmmword_1DD9E6F90;
    -[ICNoteEditorViewController textStorage](self, "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0DC1160];
    -[ICNoteEditorViewController textStorage](self, "textStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v9, "attribute:atIndex:longestEffectiveRange:inRange:", v10, location, &v30, 0, objc_msgSend(v11, "length"));

    if ((_QWORD)v30 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "textStorage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeAttribute:range:", v10, v30);

    }
    -[ICNoteEditorViewController textView](self, "textView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "textStorage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], location, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    ICDynamicCast();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "attachment");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorBaseViewController note](self, "note");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "rangeForAttachment:", v20);
      v24 = v23;

      -[ICNoteEditorViewController textView](self, "textView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "textStorage");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "displayText");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "replaceCharactersInRange:withString:", v22, v24, v27);

    }
  }
  -[ICNoteEditorBaseViewController note](self, "note");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "updateModificationDateAndChangeCountAndSaveImmediately");

}

void __51__ICNoteEditorViewController_removeLinksFromRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "typeUTI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D63878]);

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "textStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "attachment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "replaceCharactersInRange:withString:", a3, a4, v13);

  }
}

- (void)removeLinksFromCurrentSelection
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  -[ICNoteEditorViewController auxiliaryResponder](self, "auxiliaryResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_opt_class();
    -[ICNoteEditorViewController auxiliaryResponder](self, "auxiliaryResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "removeLinksFromCurrentSelection");
  }
  else
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "selectedRange");
    -[ICNoteEditorViewController removeLinksFromRange:](self, "removeLinksFromRange:", v5, v6);
  }

}

- (BOOL)shouldShowFloatingSuggestions
{
  void *v2;
  char v3;

  -[ICNoteEditorViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "ic_hasCompactSize"))
    v3 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
  else
    v3 = 1;

  return v3;
}

- (void)linkEditorWillDismiss
{
  void *v3;
  char v4;

  -[ICNoteEditorViewController setLinkEditorViewController:](self, "setLinkEditorViewController:", 0);
  -[ICNoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditing");

  if ((v4 & 1) == 0)
    -[ICNoteEditorViewController startEditing](self, "startEditing");
}

- (void)hashtagViewController:(id)a3 insertHashtagWithText:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v5 = (void *)MEMORY[0x1E0D63B40];
  v6 = a4;
  -[ICNoteEditorBaseViewController note](self, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createHashtagAttachmentIfApplicableWithHashtagText:creatingHashtagIfNecessary:note:parentAttachment:", v6, 1, v7, 0);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[ICNoteEditorViewController attachmentInsertionController](self, "attachmentInsertionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "selectedRange");
    v12 = (id)objc_msgSend(v8, "addInlineAttachment:atTextRange:", v15, v10, v11);

    objc_msgSend(v15, "updateChangeCountWithReason:", CFSTR("Created tag"));
    -[ICNoteEditorBaseViewController note](self, "note");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateChangeCountWithReason:", CFSTR("Inserted tag"));

    -[ICNoteEditorBaseViewController note](self, "note");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "save");

  }
  -[ICNoteEditorViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);

}

- (void)hashtagViewController:(id)a3 insertUnknownInlineAttachmentWithText:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v5 = (void *)MEMORY[0x1E0D63B40];
  v6 = (void *)*MEMORY[0x1E0D63870];
  v7 = a4;
  objc_msgSend(v6, "stringByAppendingString:", CFSTR(".unknown"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createInlineAttachmentIfApplicableWithTypeUTI:altText:tokenContentIdentifier:note:parentAttachment:", v8, v7, v7, v9, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[ICNoteEditorViewController attachmentInsertionController](self, "attachmentInsertionController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "selectedRange");
    v14 = (id)objc_msgSend(v10, "addInlineAttachment:atTextRange:", v17, v12, v13);

    objc_msgSend(v17, "updateChangeCountWithReason:", CFSTR("Created unknown inline attachment"));
    -[ICNoteEditorBaseViewController note](self, "note");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateChangeCountWithReason:", CFSTR("Inserted unknown inline attachment"));

    -[ICNoteEditorBaseViewController note](self, "note");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "save");

  }
  -[ICNoteEditorViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);

}

- (void)hashtagViewController:(id)a3 insertFutureHashtagWithText:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v5 = (void *)MEMORY[0x1E0D63B40];
  v6 = a4;
  -[ICNoteEditorBaseViewController note](self, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createHashtagAttachmentIfApplicableWithHashtagText:creatingHashtagIfNecessary:note:parentAttachment:", v6, 1, v7, 0);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "requireMinimumSupportedVersionAndPropagateToChildObjects:", objc_msgSend(MEMORY[0x1E0D63A90], "currentNotesVersion") + 1);
    -[ICNoteEditorViewController attachmentInsertionController](self, "attachmentInsertionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "selectedRange");
    v12 = (id)objc_msgSend(v8, "addInlineAttachment:atTextRange:", v15, v10, v11);

    objc_msgSend(v15, "updateChangeCountWithReason:", CFSTR("Created tag from the future"));
    -[ICNoteEditorBaseViewController note](self, "note");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateChangeCountWithReason:", CFSTR("Inserted tag from the future"));

    -[ICNoteEditorBaseViewController note](self, "note");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "save");

  }
  -[ICNoteEditorViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);

}

- (void)decreaseIndentation:(id)a3
{
  id v4;
  char isKindOfClass;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  -[ICNoteEditorViewController indentSelectionIfPossibleByAmount:](self, "indentSelectionIfPossibleByAmount:", -1);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (-[ICNoteEditorViewController currentWritingDirection](self, "currentWritingDirection"))
      v6 = 12;
    else
      v6 = 13;
    -[ICNoteEditorViewController eventReporter](self, "eventReporter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorBaseViewController note](self, "note");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "submitNoteEditorCallOutBarButtonSelectionEventForModernNote:buttonTypeValue:", v7, v6);

  }
}

- (void)increaseIndentation:(id)a3
{
  id v4;
  char isKindOfClass;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  -[ICNoteEditorViewController indentSelectionIfPossibleByAmount:](self, "indentSelectionIfPossibleByAmount:", 1);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (-[ICNoteEditorViewController currentWritingDirection](self, "currentWritingDirection"))
      v6 = 13;
    else
      v6 = 12;
    -[ICNoteEditorViewController eventReporter](self, "eventReporter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorBaseViewController note](self, "note");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "submitNoteEditorCallOutBarButtonSelectionEventForModernNote:buttonTypeValue:", v7, v6);

  }
}

- (BOOL)canIndentLeft
{
  return -[ICNoteEditorViewController canIndentByAmount:](self, "canIndentByAmount:", -1);
}

- (void)indentLeft:(id)a3
{
  -[ICNoteEditorViewController indentSelectionIfPossibleByAmount:](self, "indentSelectionIfPossibleByAmount:", -1);
}

- (BOOL)canIndentRight
{
  return -[ICNoteEditorViewController canIndentByAmount:](self, "canIndentByAmount:", 1);
}

- (void)indentRight:(id)a3
{
  -[ICNoteEditorViewController indentSelectionIfPossibleByAmount:](self, "indentSelectionIfPossibleByAmount:", 1);
}

- (void)indentSelectionIfPossibleByAmount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (-[ICNoteEditorViewController canIndentByAmount:](self, "canIndentByAmount:"))
  {
    -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "indentByamount:", a3);
    }
    else
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ic_indentByAmount:", a3);

      -[ICNoteEditorViewController textView](self, "textView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController textViewDidChange:](self, "textViewDidChange:", v6);
    }

  }
  dispatchMainAfterDelay();
}

void __64__ICNoteEditorViewController_indentSelectionIfPossibleByAmount___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "textView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "icaxSpeakIndentationLevelForCurrentSelectedRange");

}

- (BOOL)canIndentByAmount:(int64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;

  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEditable");

  if (!v6)
    return 0;
  -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ICNoteEditorViewController auxiliaryStylingController](self, "auxiliaryStylingController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "canIndentByamount:", a3);
  }
  else
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "ic_canIndentByDelta:", a3);
  }
  v10 = v9;

  return v10;
}

- (void)handleLeftOrRightSwipe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textController](self, "textController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEditable") || objc_msgSend(v4, "state") != 3)
  {
LABEL_15:

    goto LABEL_16;
  }
  -[ICNoteEditorViewController attributionSidebarController](self, "attributionSidebarController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "attributionSidebarVisibility");

  if (!v9)
  {
    objc_msgSend(v4, "locationInView:", v5);
    objc_msgSend(v5, "characterRangeAtPoint:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (-[ICNoteEditorViewController isSwipeOnTodoItem:](self, "isSwipeOnTodoItem:", v4))
      {
        v10 = -[ICNoteEditorViewController charRangeForSwipeTextRange:](self, "charRangeForSwipeTextRange:", v7);
        v12 = v11;
        objc_msgSend(v5, "textStorage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "paragraphStyleForRange:inTextView:inTextStorage:", v10, v12, v5, v13);

        if (ICTTNamedStyleIsList())
        {
          if (objc_msgSend(v4, "direction") == 1)
            v14 = 1;
          else
            v14 = -1;
          objc_msgSend(v5, "textStorage");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v6, "writingDirectionForRange:inTextView:inTextStorage:", v10, v12, v5, v15);

          if (v16 == 1)
            v17 = -v14;
          else
            v17 = v14;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v10, v12);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = v18;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v17;
          v20 = objc_msgSend(v6, "canIndentTextView:byDelta:forRanges:", v5, v17, v19);

          if (v20)
          {
            v21 = (void *)MEMORY[0x1E0C99E88];
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __53__ICNoteEditorViewController_handleLeftOrRightSwipe___block_invoke;
            v24[3] = &unk_1EA7DE9C8;
            v24[4] = self;
            v25 = v5;
            v27 = v10;
            v28 = v12;
            v26 = v6;
            v29 = v23;
            v22 = (id)objc_msgSend(v21, "scheduledTimerWithTimeInterval:repeats:block:", 0, v24, 0.1);

          }
        }
      }
    }
    goto LABEL_15;
  }
LABEL_16:

}

void __53__ICNoteEditorViewController_handleLeftOrRightSwipe___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "attributionSidebarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "attributionSidebarVisibility");

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "attributionSidebarController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelActiveGestures");

    objc_msgSend(*(id *)(a1 + 40), "selectedRange");
    if (objc_msgSend(*(id *)(a1 + 32), "isEditing"))
      v5 = TSURangeEnclosesRange();
    else
      v5 = 0;
    v6 = *(_QWORD *)(a1 + 72);
    v7 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "TTTextStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indentRange:byAmount:inTextStorage:textView:forceUpdateAttributes:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v6, v8, *(_QWORD *)(a1 + 40), v5);

    objc_msgSend(*(id *)(a1 + 32), "note");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateModificationDateAndChangeCountAndSaveImmediately");

  }
}

- (BOOL)isPositionOnTodoItem:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _BOOL4 v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _BOOL4 v30;
  void *v31;
  uint64_t v33;
  CGPoint v34;
  CGRect v35;

  y = a3.y;
  x = a3.x;
  -[ICNoteEditorViewController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textController](self, "textController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "characterRangeAtPoint:", x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[ICNoteEditorViewController charRangeForSwipeTextRange:](self, "charRangeForSwipeTextRange:", v8);
    v11 = v10;
    objc_msgSend(v6, "textStorage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v7, "writingDirectionForRange:inTextView:inTextStorage:", v9, v11, v6, v12);

    if (ICInternalSettingsIsTextKit2Enabled())
    {
      objc_msgSend(v6, "textLayoutManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textLayoutManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "documentRange");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "location");
      v33 = v13;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "locationFromLocation:withOffset:", v17, v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "icTextLayoutManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "textLayoutFragmentForLocation:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "layoutFragmentFrame");
      v22 = v21;
      v24 = v23;

      v13 = v33;
    }
    else
    {
      objc_msgSend(v6, "layoutManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", v9, 0);
      v22 = v26;
      v24 = v27;
    }

    objc_msgSend(v6, "textContainerInset");
    objc_msgSend(v6, "textContainerInset");
    TSDAddPoints();
    v35.origin.x = v28 - dbl_1DD9E7150[v13 == 1];
    v35.size.width = v22 + 286.0;
    v35.origin.y = v29 + -22.0;
    v35.size.height = v24 + 44.0;
    v34.x = x;
    v34.y = y;
    v30 = CGRectContainsPoint(v35, v34);
    objc_msgSend(v6, "textStorage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paragraphStyleForRange:inTextView:inTextStorage:", v9, v11, v6, v31);

    v25 = v30 & ICTTNamedStyleIsList();
  }
  else
  {
    LOBYTE(v25) = 0;
  }

  return v25;
}

- (BOOL)isSwipeOnTodoItem:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  return -[ICNoteEditorViewController isPositionOnTodoItem:](self, "isPositionOnTodoItem:", v7, v9);
}

- (_NSRange)charRangeForSwipeTextRange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  _NSRange result;

  v4 = a3;
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ic_characterRangeFromTextRange:", v4);
  v8 = v7;

  if (v8 == 1)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributedSubstringFromRange:", v6, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "characterAtIndex:", 0);
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = objc_msgSend(v14, "characterIsMember:", v13);

    if ((_DWORD)v13)
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textStorage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ic_range");
      v6 = TSUClampRange();
      v8 = v17;

    }
    else
    {
      v8 = 1;
    }

  }
  v18 = v6;
  v19 = v8;
  result.length = v19;
  result.location = v18;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  -[ICNoteEditorViewController swipeGestureRecognizers](self, "swipeGestureRecognizers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if (v9)
  {
    -[ICNoteEditorViewController splitViewController](self, "splitViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "displayMode");

    if (v11 == 1)
    {
      -[ICNoteEditorViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "locationInView:", v12);
      v14 = v13 > 44.0;
LABEL_21:

      goto LABEL_22;
    }
    goto LABEL_5;
  }
  -[ICNoteEditorViewController attributionSidebarController](self, "attributionSidebarController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "panGestureRecognizer");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 != v6)
  {
LABEL_5:
    v14 = 1;
    goto LABEL_22;
  }
  objc_msgSend(v7, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("ICPaperDocumentTextAttachmentView"));
  if (v12)
  {
    while (1)
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v17)
      {
LABEL_10:

        goto LABEL_11;
      }
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v12, "superview");
      v18 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v18;
      if (!v18)
        goto LABEL_10;
    }
    v14 = 0;
    goto LABEL_21;
  }
LABEL_11:
  if (!-[ICNoteEditorViewController isInkPickerShowing](self, "isInkPickerShowing"))
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ic_pkSelectionInteraction");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "hasCurrentSelection") & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "ic_pkSelectionInteraction");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_msgSend(v21, "hasStrokesOrElementsSelection") & 1) == 0 && objc_msgSend(v7, "type") == 0;

    }
    goto LABEL_21;
  }
  v14 = 0;
LABEL_22:

  return v14;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  char v18;
  char isKindOfClass;
  void *v20;
  char v21;
  void *v22;
  char v23;

  v6 = a4;
  v7 = a3;
  -[ICNoteEditorViewController attributionSidebarController](self, "attributionSidebarController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "panGestureRecognizer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 != v7)
  {
LABEL_13:
    v18 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v6, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v10 == (void *)v11)
  {
    v12 = v10;
    goto LABEL_11;
  }
  v12 = (id)v11;
  objc_msgSend(v6, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_11;
  }
  objc_msgSend(v6, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "panGestureRecognizer");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15 != v6)
    goto LABEL_12;
  objc_msgSend(v6, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  objc_msgSend(v12, "velocityInView:", v10);
  if (v16 <= 0.0)
  {
LABEL_11:

LABEL_12:
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    objc_msgSend(v6, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v21 = objc_opt_isKindOfClass();

    objc_msgSend(v6, "className");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("UITextRangeAdjustmentGestureRecognizer"));

    if ((isKindOfClass & 1) == 0)
    {
      v18 = (v21 | v23) ^ 1;
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  objc_msgSend(v10, "contentOffset");
  v18 = v17 <= 0.0;
  if (v17 <= 0.0)
  {
    objc_msgSend(v12, "setState:", 4);
    objc_msgSend(v10, "contentOffset");
    objc_msgSend(v10, "setContentOffset:animated:", 1, 0.0);
  }

LABEL_14:
  return v18 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[ICNoteEditorViewController swipeGestureRecognizers](self, "swipeGestureRecognizers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "containsObject:", v6))
  {

LABEL_5:
    objc_opt_class();
    ICDynamicCast();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12 != 0;

    goto LABEL_6;
  }
  -[ICNoteEditorViewController attributionSidebarController](self, "attributionSidebarController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "panGestureRecognizer");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v6)
    goto LABEL_5;
  v11 = 0;
LABEL_6:

  return v11;
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "isDropping") ^ 1;
  else
    LOBYTE(v7) = 1;
  -[ICNoteEditorBaseViewController note](self, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEditable");

  if ((v9 & 1) == 0)
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isDeletedOrInTrash"))
    {
      v11 = -[ICNoteEditorViewController isTogglingLock](self, "isTogglingLock");

      if (!v11)
        -[ICNoteEditorViewController showRecoverNoteAlert](self, "showRecoverNoteAlert");
    }
    else
    {

    }
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)textViewDidBeginEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  char v21;
  id v22;

  v22 = a3;
  objc_msgSend(MEMORY[0x1E0D63AA0], "prefetchHashtagDisplayTextsFromOtherApps");
  -[ICNoteEditorViewController setEditing:](self, "setEditing:", 1);
  -[ICNoteEditorBaseViewController note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICNoteEditorViewController updateNoteUserActivityStateDelayer](self, "updateNoteUserActivityStateDelayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestFire");

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0D63BB8];
    -[ICNoteEditorViewController noteContext](self, "noteContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "newEmptyNoteInContext:", v8);
    -[ICNoteEditorViewController setNote:](self, "setNote:", v9);

    -[ICNoteEditorViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_startEditing, 0, 0.0);
  }
  -[ICNoteEditorViewController textController](self, "textController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v22, "selectedRange");
  v13 = v12;
  v14 = -[ICNoteEditorViewController isLoadingStyleSelectorInputView](self, "isLoadingStyleSelectorInputView") ^ 1;
  objc_msgSend(v22, "typingAttributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textStorage](self, "textStorage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "typingAttributesForRange:forSelectionChange:currentTypingAttributes:inTextStorage:", v11, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTypingAttributes:", v17);

  -[ICNoteEditorViewController textViewScrollIndicatorBottomInsetOverrideToRestore](self, "textViewScrollIndicatorBottomInsetOverrideToRestore");
  if (v18 > 0.0)
  {
    -[ICNoteEditorViewController textViewScrollIndicatorBottomInsetOverrideToRestore](self, "textViewScrollIndicatorBottomInsetOverrideToRestore");
    -[ICNoteEditorViewController setTextViewScrollIndicatorBottomInsetOverride:](self, "setTextViewScrollIndicatorBottomInsetOverride:");
    -[ICNoteEditorViewController setTextViewScrollIndicatorBottomInsetOverrideToRestore:](self, "setTextViewScrollIndicatorBottomInsetOverrideToRestore:", 0.0);
  }
  -[ICNoteEditorViewController setInkPickerState:](self, "setInkPickerState:", 2);
  -[ICNoteEditorViewController textView](self, "textView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ink");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "_isHandwritingInk");

  if ((v21 & 1) == 0)
    -[ICNoteEditorViewController hideInkPicker](self, "hideInkPicker");
  -[ICNoteEditorViewController updateTextInputAccessoryViewForDidBeginEditing:](self, "updateTextInputAccessoryViewForDidBeginEditing:", v22);
  -[ICNoteEditorViewController updateStyleSelectorStateIfNeededIgnoreTypingAttributes:](self, "updateStyleSelectorStateIfNeededIgnoreTypingAttributes:", 0);
  -[ICNoteEditorViewController updateBarButtonsAnimated:](self, "updateBarButtonsAnimated:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICNoteEditorViewController ppt_didEditorBeginEditing](self, "ppt_didEditorBeginEditing");

}

- (void)textViewDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[ICNoteEditorViewController auxiliaryResponder](self, "auxiliaryResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (-[ICNoteEditorViewController inkPickerState](self, "inkPickerState") == 1)
      -[ICNoteEditorViewController showInkPicker:animated:](self, "showInkPicker:animated:", 1, 1);
    else
      -[ICNoteEditorViewController hideInkPicker](self, "hideInkPicker");
    -[ICNoteEditorViewController showOrHideActivityStreamToolbarIfNeeded](self, "showOrHideActivityStreamToolbarIfNeeded");
    -[ICNoteEditorViewController updateTextInputAccessoryViewForDidEndEditing:](self, "updateTextInputAccessoryViewForDidEndEditing:", v10);
    -[ICNoteEditorViewController calculateRecognitionController](self, "calculateRecognitionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "discardPreviewedResult");

    -[ICNoteEditorViewController calculateScrubberController](self, "calculateScrubberController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[ICNoteEditorViewController calculateScrubberController](self, "calculateScrubberController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hideScrubber");

    }
    -[ICNoteEditorViewController setEditing:](self, "setEditing:", 0);
    -[ICNoteEditorViewController updateNoteUserActivityStateDelayer](self, "updateNoteUserActivityStateDelayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestFire");

    -[ICNoteEditorViewController didEndEditingNote](self, "didEndEditingNote");
    -[ICNoteEditorViewController textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEditable:", 0);

    -[ICNoteEditorViewController updateTextViewContentInsetsAnimated:](self, "updateTextViewContentInsetsAnimated:", 1);
  }
  -[ICNoteEditorViewController updateBarButtonsAnimated:](self, "updateBarButtonsAnimated:", 1);
  -[ICNoteEditorViewController donateEditingIntentIfNecessary](self, "donateEditingIntentIfNecessary");

}

- (double)textViewScrollPosition
{
  void *v2;
  double v3;
  double v4;

  -[ICNoteEditorViewController textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentOffset");
  v4 = v3;

  return v4;
}

- (_NSRange)textViewVisibleRange
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[ICNoteEditorViewController textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ic_visibleRange");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)restoreTextViewScrollPosition:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ensureLayoutForTextContainer:", v8);

  }
  -[ICNoteEditorViewController textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentOffset");
  v11 = v10;

  -[ICNoteEditorViewController textView](self, "textView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClippedContentOffset:", v11, a3);

}

- (void)restoreTextViewVisibleRange:(_NSRange)a3 animated:(BOOL)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  length = a3.length;
  location = a3.location;
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ensureLayoutForTextContainer:", v10);

  }
  -[ICNoteEditorViewController textView](self, "textView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ic_scrollRangeToVisible:consideringInsets:animated:", location, length, 1, 0);

}

- (ICTTTextStorage)textStorage
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[ICNoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTTTextStorage *)v5;
}

- (void)textViewDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
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
  id v31;

  v31 = a3;
  -[ICNoteEditorViewController textStorage](self, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textStorageWithoutCreating");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The text storage set on the editor does not match the text storage on the note"));
  -[ICNoteEditorViewController ic_topViewController](self, "ic_topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "modalPresentationStyle");

  if (v8 == 7)
  {
    -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismissOverlayContent");

  }
  objc_msgSend(v31, "updateTextViewForDidChange");
  -[ICNoteEditorViewController setIsSelecting:](self, "setIsSelecting:", 0);
  -[ICNoteEditorViewController updateTextViewContentInsetsAnimated:](self, "updateTextViewContentInsetsAnimated:", 1);
  -[ICNoteEditorBaseViewController note](self, "note");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateModificationDateAndChangeCountAndSaveAfterDelay");

  -[ICNoteEditorViewController textStorage](self, "textStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEditingOrConvertingMarkedText:", 0);

  if (!-[ICNoteEditorViewController previouslyHadMarkedText](self, "previouslyHadMarkedText"))
  {
    if ((_DWORD)v12)
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "markedTextRange");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[ICNoteEditorViewController textView](self, "textView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController textView](self, "textView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "markedTextRange");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v15, "ic_characterRangeFromTextRange:", v17);
        v20 = v19;

        -[ICNoteEditorViewController textController](self, "textController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController textView](self, "textView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "TTTextStorage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController textView](self, "textView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "updateParagraphWritingDirectionToKeyboardWritingDirectionInRange:textStorage:textView:", v18, v20, v23, v24);

      }
    }
  }
  -[ICNoteEditorViewController calculateScrubberController](self, "calculateScrubberController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "hideIfNotScrubbing");

  -[ICNoteEditorViewController setPreviouslyHadMarkedText:](self, "setPreviouslyHadMarkedText:", v12);
  -[ICNoteEditorViewController setHasMadeEdits](self, "setHasMadeEdits");
  -[ICNoteEditorBaseViewController note](self, "note");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "calculateDocumentController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "scheduleUpdateAffectingChangeCounts:", 1);

  -[ICNoteEditorViewController inkPaletteController](self, "inkPaletteController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
    -[ICNoteEditorViewController ensureValidInkForNewDrawingOrNote](self, "ensureValidInkForNewDrawingOrNote");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICNoteEditorViewController ppt_textViewDidChange](self, "ppt_textViewDidChange");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "postNotificationName:object:", CFSTR("ICNoteEditorViewControllerDidEditNote"), v30);

}

- (void)setHasMadeEdits
{
  if (!-[ICNoteEditorViewController hasMadeEdits](self, "hasMadeEdits"))
  {
    -[ICNoteEditorViewController setHasMadeEdits:](self, "setHasMadeEdits:", 1);
    -[ICNoteEditorViewController updateBarButtons](self, "updateBarButtons");
  }
}

- (void)updateStyleSelectorStateIfNeededIgnoreTypingAttributes:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v3 = a3;
  -[ICNoteEditorViewController noteFormattingController](self, "noteFormattingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "popoverPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICNoteEditorViewController noteFormattingController](self, "noteFormattingController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "popoverPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
LABEL_5:
      -[ICNoteEditorViewController navigationItemConfiguration](self, "navigationItemConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "usesStyleMenu");

      if (!v11)
        return;
    }
  }
  else if (!-[ICNoteEditorViewController styleSelectorInputViewShowing](self, "styleSelectorInputViewShowing"))
  {
    goto LABEL_5;
  }
  -[ICNoteEditorViewController noteFormattingController](self, "noteFormattingController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateWithDataSource:ignoreTypingAttributes:", self, v3);

}

- (void)selectDrawingAttachmentIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextSelectionHidden:", 0);
  -[ICNoteEditorViewController selectedCanvasAttachment](self, "selectedCanvasAttachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setViewSelected:inWindow:", 0, v6);

  objc_msgSend(v12, "selectedRange");
  if (v7 == 1)
  {
    objc_msgSend(v12, "textStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], objc_msgSend(v12, "selectedRange"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    ICDynamicCast();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && v10)
    {
      -[ICNoteEditorViewController setSelectedCanvasAttachment:](self, "setSelectedCanvasAttachment:", v10);
      objc_msgSend(v12, "window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setViewSelected:inWindow:", 1, v11);

      objc_msgSend(v4, "setTextSelectionHidden:", 1);
    }

  }
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "selectedRange");
  v7 = v6;
  if (v5 != -[ICNoteEditorViewController lastSelectedRange](self, "lastSelectedRange") || v7 != v8)
  {
    objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "extendDeauthenticationTimer");

    if (!-[ICNoteEditorViewController isSelecting](self, "isSelecting"))
    {
      objc_msgSend(v4, "selectedRange");
      if (v10)
      {
        -[ICNoteEditorViewController setIsSelecting:](self, "setIsSelecting:", 1);
        -[ICNoteEditorViewController updateTextViewContentInsetsAnimated:](self, "updateTextViewContentInsetsAnimated:", 1);
      }
    }
    if (!-[ICNoteEditorViewController isSettingSelection](self, "isSettingSelection"))
    {
      -[ICNoteEditorViewController setIsSettingSelection:](self, "setIsSettingSelection:", 1);
      -[ICNoteEditorViewController textController](self, "textController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v4, "selectedRange");
      v14 = v13;
      objc_msgSend(v4, "typingAttributes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController textStorage](self, "textStorage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "typingAttributesForRange:forSelectionChange:currentTypingAttributes:inTextStorage:", v12, v14, 1, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTypingAttributes:", v17);

      -[ICNoteEditorViewController setIsSettingSelection:](self, "setIsSettingSelection:", 0);
    }
    -[ICNoteEditorViewController updateNoteUserActivityStateDelayer](self, "updateNoteUserActivityStateDelayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "requestFire");

    -[ICNoteEditorViewController updateBarButtons](self, "updateBarButtons");
    -[ICNoteEditorViewController selectDrawingAttachmentIfNeeded:](self, "selectDrawingAttachmentIfNeeded:", v4);
    if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    {
      -[ICNoteEditorViewController textController](self, "textController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "textStorage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CB3B18];
      v22 = objc_msgSend(v4, "selectedRange");
      objc_msgSend(v21, "valueWithRange:", v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "layoutManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController textView](self, "textView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "updateAttachmentsSelectionStateInTextStorage:forSelectedRanges:layoutManager:textView:", v20, v25, v26, v27);

    }
    -[ICNoteEditorViewController updateStyleSelectorStateIfNeededIgnoreTypingAttributes:](self, "updateStyleSelectorStateIfNeededIgnoreTypingAttributes:", 0);
    -[ICNoteEditorViewController textView](self, "textView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "icaxTextDidChangeSelection");

    v29 = objc_msgSend(v4, "selectedRange");
    -[ICNoteEditorViewController setLastSelectedRange:](self, "setLastSelectedRange:", v29, v30);
    objc_opt_class();
    -[ICNoteEditorViewController textView](self, "textView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "textStorage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICNoteEditorViewController textView](self, "textView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController hashtagController](self, "hashtagController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setHashtagKeyboardDelegate:", v34);

    -[ICNoteEditorViewController textView](self, "textView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController mentionsController](self, "mentionsController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setMentionsKeyboardDelegate:", v36);

    -[ICNoteEditorViewController mentionsController](self, "mentionsController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[ICNoteEditorViewController lastSelectedRange](self, "lastSelectedRange");
    v41 = v40;
    -[ICNoteEditorBaseViewController note](self, "note");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE1(v56) = objc_msgSend(v44, "languageHasSpaces");
    LOBYTE(v56) = 0;
    LOBYTE(v39) = objc_msgSend(v38, "checkForMentionInEditedRange:ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:", v39, v41, v33, v42, v43, 0, v56, 0);

    if ((v39 & 1) == 0)
    {
      -[ICNoteEditorViewController hashtagController](self, "hashtagController");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = -[ICNoteEditorViewController lastSelectedRange](self, "lastSelectedRange");
      v48 = v47;
      -[ICNoteEditorBaseViewController note](self, "note");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController textView](self, "textView");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController textView](self, "textView");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      BYTE1(v57) = objc_msgSend(v51, "languageHasSpaces");
      LOBYTE(v57) = 0;
      objc_msgSend(v45, "checkForHashtagInEditedRange:ofTextStorage:note:textView:allowAutoExplicitHashtag:isEndingEditing:languageHasSpaces:parentAttachment:", v46, v48, v33, v49, v50, 0, v57, 0);

    }
    -[ICNoteEditorViewController linkAcceleratorController](self, "linkAcceleratorController");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setDelegate:", self);

    -[ICNoteEditorViewController linkAcceleratorController](self, "linkAcceleratorController");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setLinkDelegate:", self);

    -[ICNoteEditorViewController linkAcceleratorController](self, "linkAcceleratorController");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "presentLinkAcceleratorIfNecessaryWithCompletionHandler:", &__block_literal_global_803);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "postNotificationName:object:", CFSTR("ICNoteEditorViewControllerSelectionDidChangeNotification"), self);

  }
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  BOOL v28;

  length = a4.length;
  v8 = a3;
  v9 = a5;
  -[ICNoteEditorBaseViewController note](self, "note");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_25;
  if ((objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode") & 1) == 0)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isInsertingTextFromKeyboardInput");

    if (v12)
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("\t")))
      {
        if ((objc_msgSend(MEMORY[0x1E0DC3938], "ic_isShiftKeyPressed") & 1) != 0)
          -[ICNoteEditorViewController shiftTab:](self, "shiftTab:", 0);
        else
          -[ICNoteEditorViewController tab:](self, "tab:", 0);
        goto LABEL_25;
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("\n"))
        && objc_msgSend(MEMORY[0x1E0DC3938], "ic_isShiftKeyPressed"))
      {
        -[ICNoteEditorViewController shiftReturn:](self, "shiftReturn:", 0);
LABEL_25:
        v28 = 0;
        goto LABEL_26;
      }
    }
  }
  -[ICNoteEditorBaseViewController note](self, "note");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textStorage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");
  v16 = objc_msgSend(v9, "length");

  if (objc_msgSend(v9, "length") > length)
  {
    v17 = v15 - length + v16;
    -[ICNoteEditorBaseViewController note](self, "note");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = objc_msgSend(v18, "allowsNewTextLength:", v17);

    if ((v17 & 1) == 0)
    {
      -[ICNoteEditorViewController warnUserNoteLengthExceeded](self, "warnUserNoteLengthExceeded");
      goto LABEL_25;
    }
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("\n")))
  {
    -[ICNoteEditorViewController textController](self, "textController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "insertNewlineForSpecialCasesInTextView:", v8);

    if (v20)
    {
      -[ICNoteEditorViewController updateBarButtons](self, "updateBarButtons");
      goto LABEL_25;
    }
  }
  -[ICNoteEditorViewController textView](self, "textView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "isInsertingTextFromKeyboardInput") & 1) != 0)
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "isEmpty") & 1) != 0)
    {
      v23 = objc_msgSend(v9, "length");

      if (v23 >= 0x41)
      {
        -[ICNoteEditorViewController textView](self, "textView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "typingAttributes");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "style");

        if (v27 <= 2)
          -[ICNoteEditorViewController setCurrentTextStyle:](self, "setCurrentTextStyle:", 3);
      }
      goto LABEL_23;
    }

  }
LABEL_23:
  v28 = 1;
LABEL_26:

  return v28;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v8;
  id v9;
  int IsExtension;
  int v11;

  v8 = a3;
  v9 = a4;
  IsExtension = _UIApplicationIsExtension();
  if (a6)
    v11 = 0;
  else
    v11 = IsExtension;
  if (v11 == 1)
    +[ICExtensionSafeAPIShims openURL:originatingView:completionHandler:](ICExtensionSafeAPIShims, "openURL:originatingView:completionHandler:", v9, v8, 0);

  return v11 ^ 1;
}

- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[5];
  id v66;
  _QWORD v67[5];
  id v68;
  _QWORD v69[5];
  id v70;
  id v71;

  v7 = a4;
  v8 = a5;
  v9 = 0x1E0DC3000;
  if (objc_msgSend(v7, "contentType"))
    goto LABEL_19;
  -[ICNoteEditorBaseViewController note](self, "note");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isSharedReadOnly"))
  {

LABEL_19:
    objc_msgSend(*(id *)(v9 + 3600), "configurationWithMenu:", v8);
    self = (ICNoteEditorViewController *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v11 = -[ICNoteEditorBaseViewController isEditingOnSecureScreen](self, "isEditingOnSecureScreen");

  if (v11)
    goto LABEL_19;
  objc_msgSend(v8, "children");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  v14 = objc_alloc(MEMORY[0x1E0D64C60]);
  -[ICNoteEditorViewController attachmentInsertionController](self, "attachmentInsertionController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithInsertionController:", v15);

  v17 = -[ICNoteEditorBaseViewController isEditingOnSystemPaper](self, "isEditingOnSystemPaper");
  v18 = MEMORY[0x1E0C809B0];
  if (!v17 && objc_msgSend(v16, "canConvertLinkAtLocationToAttachment:", objc_msgSend(v7, "range")))
  {
    v19 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0D64C60], "convertLinkToAttachmentActionTitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D64C60], "convertAttachmentToLinkSystemImageName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v18;
    v69[1] = 3221225472;
    v69[2] = __80__ICNoteEditorViewController_textView_menuConfigurationForTextItem_defaultMenu___block_invoke;
    v69[3] = &unk_1EA7DEA10;
    v69[4] = self;
    v70 = v16;
    v71 = v7;
    objc_msgSend(v19, "ic_actionWithTitle:imageName:handler:", v20, v21, v69);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "addObject:", v22);
  }
  v63 = v16;
  v23 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Edit Link"), &stru_1EA7E9860, 0);
  v64 = v13;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v18;
  v67[0] = v18;
  v67[1] = 3221225472;
  v67[2] = __80__ICNoteEditorViewController_textView_menuConfigurationForTextItem_defaultMenu___block_invoke_3;
  v67[3] = &unk_1EA7DEA38;
  v67[4] = self;
  v27 = v7;
  v68 = v27;
  objc_msgSend(v23, "ic_actionWithTitle:imageName:handler:", v25, CFSTR("pencil"), v67);
  v28 = objc_claimAutoreleasedReturnValue();

  v62 = (void *)v28;
  objc_msgSend(v64, "addObject:", v28);
  v29 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Remove Link"), &stru_1EA7E9860, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v26;
  v65[1] = 3221225472;
  v65[2] = __80__ICNoteEditorViewController_textView_menuConfigurationForTextItem_defaultMenu___block_invoke_4;
  v65[3] = &unk_1EA7DEA38;
  v65[4] = self;
  v32 = v27;
  v66 = v32;
  objc_msgSend(v29, "ic_actionWithTitle:imageName:handler:", v31, CFSTR("trash"), v65);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v64, "addObject:", v33);
  v34 = (void *)MEMORY[0x1E0DC39D0];
  v35 = (void *)objc_msgSend(v64, "copy");
  objc_msgSend(v34, "menuWithChildren:", v35);
  v61 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "link");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "absoluteString");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  NotesAppURLForNoteIdentifierOrTokenContentIdentifier();
  v38 = objc_claimAutoreleasedReturnValue();

  v60 = (void *)v38;
  objc_msgSend(MEMORY[0x1E0D639E0], "predicateForNotesMentionedInURL:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v39 && v40)
  {
    v59 = v33;
    v42 = (void *)MEMORY[0x1E0D63BB8];
    objc_msgSend(v40, "managedObjectContext");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "notesMatchingPredicate:context:", v39, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v44, "firstObject");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0x1E0DC3000uLL;
    if (v45)
    {
      -[ICNoteEditorViewController notePreviewView:](self, "notePreviewView:", v45);
      v46 = objc_claimAutoreleasedReturnValue();
      if (v46)
      {
        v47 = (void *)v46;
        v48 = objc_alloc(MEMORY[0x1E0DC3E18]);
        objc_msgSend(v47, "view");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v47;
        v50 = (void *)objc_msgSend(v48, "initWithView:", v49);

        v51 = (void *)v61;
        objc_msgSend(MEMORY[0x1E0DC3E10], "configurationWithPreview:menu:", v50, v61);
        self = (ICNoteEditorViewController *)objc_claimAutoreleasedReturnValue();

        v52 = 0;
        v44 = v58;
        v33 = v59;
        goto LABEL_18;
      }
    }

    v52 = 1;
    v33 = v59;
    goto LABEL_16;
  }
  v53 = objc_alloc(MEMORY[0x1E0CB3998]);
  objc_msgSend(v32, "link");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v53, "initWithURL:resolvingAgainstBaseURL:", v54, 0);

  objc_msgSend(v44, "scheme");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  self = (ICNoteEditorViewController *)objc_msgSend(v55, "isEqualToString:", CFSTR("x-apple-data-detectors"));

  v9 = 0x1E0DC3000uLL;
  if ((_DWORD)self)
  {
    v56 = (id)objc_msgSend(MEMORY[0x1E0DC3E10], "configurationWithMenu:", v8);
    v52 = 1;
LABEL_16:
    v51 = (void *)v61;
    goto LABEL_18;
  }
  v51 = (void *)v61;
  objc_msgSend(MEMORY[0x1E0DC3E10], "configurationWithMenu:", v61);
  self = (ICNoteEditorViewController *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
LABEL_18:

  if (v52)
    goto LABEL_19;
LABEL_20:

  return self;
}

void __80__ICNoteEditorViewController_textView_menuConfigurationForTextItem_defaultMenu___block_invoke(id *a1)
{
  void *v2;
  int v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(a1[4], "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canAddAttachment");

  v4 = a1[4];
  if (v3)
  {
    objc_msgSend(v4, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unmarkText");

    v6 = a1[5];
    v7 = a1[6];
    dispatchMainAfterDelay();

  }
  else
  {
    objc_msgSend(v4, "warnUserAttachmentLimitExceeded");
  }
}

uint64_t __80__ICNoteEditorViewController_textView_menuConfigurationForTextItem_defaultMenu___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "convertLinkAtLocationToAttachment:", objc_msgSend(*(id *)(a1 + 40), "range"));
}

uint64_t __80__ICNoteEditorViewController_textView_menuConfigurationForTextItem_defaultMenu___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "openLinkEditorForLinkTextItem:", *(_QWORD *)(a1 + 40));
}

uint64_t __80__ICNoteEditorViewController_textView_menuConfigurationForTextItem_defaultMenu___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeLinkForLinkTextItem:", *(_QWORD *)(a1 + 40));
}

- (void)textViewWritingToolsWillBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentMergeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginBlockingMergeForReason:textView:", 7, v8);

  objc_msgSend(v8, "TTTextStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsEditingViaWritingTools:", 1);

}

- (void)textViewWritingToolsDidEnd:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "TTTextStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsEditingViaWritingTools:", 0);

  -[ICNoteEditorBaseViewController note](self, "note");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentMergeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endBlockingMergeForReason:textView:", 7, v9);

  -[ICNoteEditorBaseViewController note](self, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "save");

}

- (id)textView:(id)a3 writingToolsIgnoredRangesInEnclosingRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  objc_opt_class();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "TTTextStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ICNoteEditorViewController textController](self, "textController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "TTTextStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorBaseViewController note](self, "note");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writingToolsIgnoredRangesForTextStorage:inEnclosingRange:note:", v11, location, length, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

- (BOOL)allowsNewTextLength:(unint64_t)a3
{
  void *v4;

  -[ICNoteEditorBaseViewController note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "allowsNewTextLength:", a3);

  return a3;
}

- (void)didInvokeAnalyticsCalloutBarButtonActionOfType:(int64_t)a3
{
  void *v5;
  id v6;

  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "submitNoteEditorCallOutBarButtonSelectionEventForModernNote:buttonTypeValue:", v5, a3);

}

- (void)didInvokeAnalyticsChecklistActionChecked:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 3;
  -[ICNoteEditorViewController submitChecklistAnalyticsEventForActionType:](self, "submitChecklistAnalyticsEventForActionType:", v3);
}

- (void)didInvokePasteWithAttributedString:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v4 = *MEMORY[0x1E0DC1160];
  v5 = a3;
  v6 = objc_msgSend(v5, "ic_range");
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__ICNoteEditorViewController_didInvokePasteWithAttributedString___block_invoke;
  v13[3] = &unk_1EA7DDC18;
  v13[4] = self;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v4, v6, v8, 0, v13);
  v9 = *MEMORY[0x1E0DC10F8];
  v10 = objc_msgSend(v5, "ic_range");
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __65__ICNoteEditorViewController_didInvokePasteWithAttributedString___block_invoke_2;
  v12[3] = &unk_1EA7DDC18;
  v12[4] = self;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v9, v10, v11, 0, v12);

}

void __65__ICNoteEditorViewController_didInvokePasteWithAttributedString___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v7;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "eventReporter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "submitAddLinkEvent:addApproach:url:", v6, 1, v4);

  }
LABEL_7:

}

void __65__ICNoteEditorViewController_didInvokePasteWithAttributedString___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "eventReporter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "submitAddLinkEvent:addApproach:contentType:isTokenized:", v5, 1, 1, 1);

  }
}

- (BOOL)handleTapGestureForAttribution:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  if (-[ICNoteEditorViewController attributionSidebarVisibility](self, "attributionSidebarVisibility") == 2)
  {
    -[ICNoteEditorViewController attributionSidebarView](self, "attributionSidebarView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleTapGesture:", v4);
LABEL_8:

    v11 = 1;
    goto LABEL_9;
  }
  -[ICNoteEditorViewController attributionSidebarController](self, "attributionSidebarController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasCompactWidth");

    -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v10;
    if (v9)
      objc_msgSend(v10, "hideActivityStreamWithCompletion:", 0);
    else
      objc_msgSend(v10, "hideAttributionHighlights");
    goto LABEL_8;
  }
  v11 = 0;
LABEL_9:

  return v11;
}

- (BOOL)shouldStartEditingForTapGesture:(id)a3
{
  id v4;
  NSObject *v5;
  char v6;
  BOOL v7;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  if (-[ICNoteEditorViewController attributionSidebarVisibility](self, "attributionSidebarVisibility") != 2)
  {
    if (-[ICNoteEditorViewController attributionSidebarVisibility](self, "attributionSidebarVisibility") == 1)
      goto LABEL_5;
    -[ICNoteEditorViewController dateOfLastStrokeOrNewDrawing](self, "dateOfLastStrokeOrNewDrawing");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteEditorViewController dateOfLastStrokeOrNewDrawing](self, "dateOfLastStrokeOrNewDrawing");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", v11);
      v13 = v12;

      if (v13 < 0.5)
      {
        v5 = os_log_create("com.apple.notes", "PencilKit");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          -[ICNoteEditorViewController shouldStartEditingForTapGesture:].cold.1(v5, v13, v14, v15);
        goto LABEL_3;
      }
      if (v13 < 1.5)
      {
        v16 = os_log_create("com.apple.notes", "PencilKit");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          -[ICNoteEditorViewController shouldStartEditingForTapGesture:].cold.2(v16, v13, v17, v18);

        -[ICNoteEditorViewController setDateOfLastStrokeOrNewDrawing:](self, "setDateOfLastStrokeOrNewDrawing:", 0);
        goto LABEL_5;
      }
    }
    -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "hasCompactWidth") & 1) != 0)
    {
      -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "presentedActivityStreamNavigationController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
        v5 = objc_claimAutoreleasedReturnValue();
        -[NSObject hideActivityStreamWithCompletion:](v5, "hideActivityStreamWithCompletion:", 0);
        goto LABEL_3;
      }
    }
    else
    {

    }
    v6 = 1;
    goto LABEL_6;
  }
  -[ICNoteEditorViewController attributionSidebarView](self, "attributionSidebarView");
  v5 = objc_claimAutoreleasedReturnValue();
  -[NSObject handleTapGesture:](v5, "handleTapGesture:", v4);
LABEL_3:

LABEL_5:
  v6 = 0;
LABEL_6:
  v7 = v6 & !-[ICNoteEditorViewController suspendTapGestureRecognizer](self, "suspendTapGestureRecognizer");

  return v7;
}

- (BOOL)shouldBlockHitTestOnTextView:(id)a3 event:(id)a4
{
  id v5;
  int v6;

  v5 = a4;
  if (-[ICNoteEditorViewController isDrawingStrokeWithPencil](self, "isDrawingStrokeWithPencil"))
    v6 = objc_msgSend(v5, "ic_isPencilEvent") ^ 1;
  else
    LOBYTE(v6) = 0;

  return v6;
}

- (BOOL)shouldShowMenuItems
{
  if (-[ICNoteEditorViewController isShowingIndentationItems](self, "isShowingIndentationItems"))
    return 0;
  else
    return !-[ICNoteEditorViewController isShowingChecklistItems](self, "isShowingChecklistItems");
}

- (BOOL)shouldInsertNewDrawingsAsPaper
{
  void *v2;
  char v3;

  -[ICNoteEditorViewController textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPaperEnabled");

  return v3;
}

- (void)updateUserAndDateViewVisibility
{
  void *v3;
  void *v4;
  double v5;
  _BOOL4 v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v32;
  id v33;
  _QWORD v34[5];

  if (-[ICNoteEditorBaseViewController isEditingOnSystemPaper](self, "isEditingOnSystemPaper"))
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "userTitleView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alpha");
    if (fabs(v5) >= 0.00999999978)
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "dateView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "alpha");
      v6 = fabs(v19) < 0.00999999978;

    }
    else
    {
      v6 = 1;
    }

    -[ICNoteEditorViewController textView](self, "textView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "safeAreaInsets");
    if (v21 == 0.0)
    {
      v24 = 0.0;
    }
    else
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "safeAreaInsets");
      v24 = -v23;

    }
    -[ICNoteEditorViewController textView](self, "textView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "contentOffset");
    v27 = v26;
    -[ICNoteEditorViewController textView](self, "textView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "contentInset");
    v30 = v29;

    if (v27 < v24 - v30 && v6)
    {
      v32 = (void *)MEMORY[0x1E0DC3F10];
      +[ICSystemPaperConstants linkBarAnimationDuration](ICSystemPaperConstants, "linkBarAnimationDuration");
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __61__ICNoteEditorViewController_updateUserAndDateViewVisibility__block_invoke;
      v34[3] = &unk_1EA7DD2D8;
      v34[4] = self;
      objc_msgSend(v32, "animateWithDuration:animations:", v34);
    }
  }
  else if (-[ICNoteEditorViewController usesCustomTransition](self, "usesCustomTransition"))
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeAreaInsets");
    v9 = v8;

    -[ICNoteEditorViewController textView](self, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentOffset");
    v12 = fabs(v11);

    if ((v12 - v9) * 0.0625 <= 1.0)
      v13 = (v12 - v9) * 0.0625;
    else
      v13 = 1.0;
    -[ICNoteEditorViewController textView](self, "textView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "userTitleView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAlpha:", v13);

    -[ICNoteEditorViewController textView](self, "textView");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dateView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAlpha:", v13);

  }
}

void __61__ICNoteEditorViewController_updateUserAndDateViewVisibility__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userTitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "textView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

}

- (void)textViewDidBreakRubberBand:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
    -[ICNoteEditorViewController setPreventSnappingToLastPaperDocument:](self, "setPreventSnappingToLastPaperDocument:", 1);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  CGFloat x;
  id v9;
  int IsTextKit2Enabled;
  double v11;
  double v12;
  uint64_t v13;
  _BOOL4 v14;
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
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *, uint64_t, uint64_t, _BYTE *);
  void *v36;
  ICNoteEditorViewController *v37;
  id v38;
  uint64_t *v39;
  CGPoint *v40;
  CGFloat v41;
  double v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  v11 = -a5->y;
  if (!IsTextKit2Enabled)
  {
    if (-[ICNoteEditorViewController userWantsToSeeDateLabel](self, "userWantsToSeeDateLabel"))
    {
      -[ICNoteEditorViewController textViewTopInsetThatWeWant](self, "textViewTopInsetThatWeWant");
      if (v16 < v11)
        goto LABEL_25;
      -[ICNoteEditorViewController ic_safeAreaDistanceFromTop](self, "ic_safeAreaDistanceFromTop");
      if (v17 > v11 || y < 0.0)
        goto LABEL_25;
      -[ICNoteEditorViewController setUserWantsToSeeDateLabel:](self, "setUserWantsToSeeDateLabel:", 0);
      -[ICNoteEditorViewController textViewTopInsetThatWeWant](self, "textViewTopInsetThatWeWant");
      a5->y = -v18;
      -[ICNoteEditorViewController updateTextViewContentInsetsAnimated:](self, "updateTextViewContentInsetsAnimated:", 1);
    }
    else
    {
      v19 = a5->y;
      -[ICNoteEditorViewController textViewTopInsetThatWeWant](self, "textViewTopInsetThatWeWant");
      if (vabdd_f64(-v19, v20) >= 0.00999999978 || y >= 0.0)
        goto LABEL_25;
      -[ICNoteEditorViewController setUserWantsToSeeDateLabel:](self, "setUserWantsToSeeDateLabel:", 1);
      -[ICNoteEditorViewController textViewTopInsetThatWeWant](self, "textViewTopInsetThatWeWant");
      a5->y = -v21;
      -[ICNoteEditorViewController updateTextViewContentInsetsAnimated:](self, "updateTextViewContentInsetsAnimated:", 1);
    }
LABEL_24:
    *((_BYTE *)v44 + 24) = 1;
    goto LABEL_25;
  }
  if ((objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") & 1) == 0)
  {
    -[ICNoteEditorViewController ic_safeAreaDistanceFromTop](self, "ic_safeAreaDistanceFromTop");
    v11 = v11 - v12;
  }
  v13 = -[ICNoteEditorViewController userWantsToSeeDateLabel](self, "userWantsToSeeDateLabel");
  if (-[ICNoteEditorViewController userWantsToSeeDateLabel](self, "userWantsToSeeDateLabel")
    || (-[ICNoteEditorViewController textViewTopInsetThatWeWant](self, "textViewTopInsetThatWeWant"),
        vabdd_f64(v11, v22) >= 0.00999999978)
    || y >= 0.0)
  {
    if (-[ICNoteEditorViewController userWantsToSeeDateLabel](self, "userWantsToSeeDateLabel"))
    {
      -[ICNoteEditorViewController textViewTopInsetThatWeWant](self, "textViewTopInsetThatWeWant");
      v14 = v11 < 0.0;
      if (v11 > v15)
        v14 = 1;
      if (y < 0.0)
        v14 = 1;
      v13 = v14 & v13;
    }
  }
  else
  {
    v13 = 1;
  }
  if ((_DWORD)v13 != -[ICNoteEditorViewController userWantsToSeeDateLabel](self, "userWantsToSeeDateLabel"))
  {
    -[ICNoteEditorViewController setUserWantsToSeeDateLabel:](self, "setUserWantsToSeeDateLabel:", v13);
    -[ICNoteEditorViewController updateTextViewContentInsetsAnimated:](self, "updateTextViewContentInsetsAnimated:", 1);
    goto LABEL_24;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "extendDeauthenticationTimer");

  if (!*((_BYTE *)v44 + 24))
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "textStorage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "textStorage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "ic_range");
    v30 = v29;
    v31 = *MEMORY[0x1E0DC10F8];
    v33 = MEMORY[0x1E0C809B0];
    v34 = 3221225472;
    v35 = __89__ICNoteEditorViewController_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke;
    v36 = &unk_1EA7DEAC8;
    v37 = self;
    v40 = a5;
    v38 = v9;
    v39 = &v43;
    v41 = x;
    v42 = y;
    objc_msgSend(v25, "enumerateAttribute:inRange:options:usingBlock:", v31, v28, v30, 2, &v33);

    if (*((_BYTE *)v44 + 24))
    {
      -[ICNoteEditorViewController textView](self, "textView", v33, v34, v35, v36, v37);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setShouldRubberBand:", 0);

    }
  }
  _Block_object_dispose(&v43, 8);

}

void __89__ICNoteEditorViewController_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double Height;
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
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  char v54;
  void *v55;
  int v56;
  uint64_t v57;
  char v58;
  _QWORD *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  int v68;
  uint64_t v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  double v78;
  double v79;
  uint64_t v80;
  double v81;
  double v82;
  double v83;
  double v84;
  uint64_t v85;
  _QWORD v86[7];
  CGRect v87;
  CGRect v88;
  CGRect v89;

  v8 = a2;
  objc_opt_class();
  ICDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "viewportShouldSnapToAttachmentView"))
  {
    objc_msgSend(*(id *)(a1 + 32), "attachmentViewForTextAttachment:characterIndex:", v9, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "bounds");
      Height = CGRectGetHeight(v87);
      objc_msgSend(*(id *)(a1 + 32), "textView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      objc_msgSend(*(id *)(a1 + 32), "textView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "safeAreaInsets");
      v24 = v17 + v23;
      v27 = v19 - (v25 + v26);
      v88.size.height = v21 - (v23 + v28);
      v88.origin.x = v15 + v25;
      v88.origin.y = v24;
      v88.size.width = v27;
      v29 = CGRectGetHeight(v88);

      if (Height < v29)
        goto LABEL_33;
    }
    objc_msgSend(*(id *)(a1 + 32), "textView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "textStorage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == objc_msgSend(v31, "length") - 1)
    {
      v32 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "lastPaperDocumentAttachmentView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v11, "isEqual:", v33);

      v32 = v34 ^ 1;
    }

    objc_msgSend(MEMORY[0x1E0D64CD0], "rootSettings");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v35, "isRubberBandingEnabled")
      || (v32 & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 32), "isEditing") & 1) != 0)
    {

    }
    else
    {
      v68 = objc_msgSend(v9, "viewportShouldSnapToAttachmentView");

      if (v68)
      {
        v69 = **(_QWORD **)(a1 + 56);
        objc_msgSend(*(id *)(a1 + 40), "contentSize");
        v71 = v70;
        objc_msgSend(*(id *)(a1 + 40), "bounds");
        v72 = CGRectGetHeight(v89);
        objc_msgSend(*(id *)(a1 + 32), "textView");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "bottomContentPadding");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "currentValue");
        v76 = v75;
        objc_msgSend(*(id *)(a1 + 32), "textView");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "textContainerInset");
        v79 = v78;

        if (v11)
        {
          objc_msgSend(v11, "bounds");
          objc_msgSend(v11, "convertPoint:toView:", *(_QWORD *)(a1 + 40));
          v69 = v80;
          v82 = v81;
          objc_msgSend(*(id *)(a1 + 40), "safeAreaInsets");
          v84 = v82 - v83;
        }
        else
        {
          v84 = v71 - v72 - v76 - v79;
        }
        if (*(double *)(*(_QWORD *)(a1 + 56) + 8) >= v84
          && (objc_msgSend(*(id *)(a1 + 32), "preventSnappingToLastPaperDocument") & 1) == 0)
        {
          v85 = *(_QWORD *)(a1 + 56);
          *(_QWORD *)v85 = v69;
          *(double *)(v85 + 8) = v84;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
          *a5 = 1;
          goto LABEL_33;
        }
      }
    }
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0D64CD0], "rootSettings");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "snapToPDFDistanceForEndDragging");
      v38 = v37;

      objc_msgSend(*(id *)(a1 + 32), "textView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "convertPoint:toView:", v11, **(double **)(a1 + 56), *(double *)(*(_QWORD *)(a1 + 56) + 8));
      v41 = v40;

      objc_msgSend(v11, "bounds");
      v43 = v42;
      v45 = v44;
      objc_msgSend(*(id *)(a1 + 40), "safeAreaInsets");
      v47 = v45 - v46;
      objc_msgSend(*(id *)(a1 + 32), "textView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "convertPoint:fromView:", v11, v43, v47);
      v50 = v49;
      v52 = v51;

      v53 = vabdd_f64(v47, v41);
      if (v53 < v38)
        v54 = 1;
      else
        v54 = v32;
      if ((v54 & 1) != 0)
      {
        if (v53 >= v38)
          goto LABEL_33;
      }
      else
      {
        if (*(double *)(*(_QWORD *)(a1 + 56) + 8) < v52)
          goto LABEL_33;
        objc_msgSend(*(id *)(a1 + 32), "textView");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "shouldRubberBand");

        if (!v56)
          goto LABEL_33;
      }
      v57 = *(_QWORD *)(a1 + 56);
      *(_QWORD *)v57 = v50;
      *(double *)(v57 + 8) = v52;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      *a5 = 1;
      if (*(double *)(a1 + 72) <= 0.0)
        v58 = 1;
      else
        v58 = v32;
      if ((v58 & 1) == 0 && objc_msgSend(v9, "viewportShouldSnapToAttachmentView"))
      {
        v59 = *(_QWORD **)(a1 + 56);
        objc_msgSend(*(id *)(a1 + 32), "textView");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "contentOffset");
        *v59 = v61;
        v59[1] = v62;

        objc_msgSend(*(id *)(a1 + 32), "textView");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "contentOffset");
        v65 = v52 - v64;

        v66 = *(double *)(a1 + 72) * 1000.0 / v65;
        objc_msgSend(*(id *)(a1 + 32), "textView");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "setShouldRubberBand:", 0);

        v86[0] = MEMORY[0x1E0C809B0];
        v86[1] = 3221225472;
        v86[2] = __89__ICNoteEditorViewController_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke_2;
        v86[3] = &unk_1EA7DEA60;
        v86[4] = *(_QWORD *)(a1 + 32);
        v86[5] = v50;
        *(double *)&v86[6] = v52;
        objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 196608, v86, &__block_literal_global_824, 0.0, v66);
      }
    }
LABEL_33:

  }
}

void __89__ICNoteEditorViewController_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke_2(uint64_t a1)
{
  double v1;
  double v2;
  id v3;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "textView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentOffset:", v1, v2);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;

  if (!a4)
  {
    -[ICNoteEditorBaseViewController note](self, "note", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "documentMergeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endBlockingMergeForReason:textView:", 1, v7);

    -[ICNoteEditorViewController setPreventSnappingToLastPaperDocument:](self, "setPreventSnappingToLastPaperDocument:", 0);
  }
}

- (void)_scrollViewDidInterruptDecelerating:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[ICNoteEditorBaseViewController note](self, "note", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentMergeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endBlockingMergeForReason:textView:", 1, v5);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[ICNoteEditorViewController prepareToSnapToPaperDocumentAtStartOfDragIfNecessary:](self, "prepareToSnapToPaperDocumentAtStartOfDragIfNecessary:", a3);
  objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendDeauthenticationTimer");

  -[ICNoteEditorBaseViewController note](self, "note");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentMergeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginBlockingMergeForReason:textView:", 1, v6);

}

- (id)lastPaperDocumentAttachmentView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[ICNoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invertedSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:", v7, 4);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    objc_opt_class();
    objc_msgSend(v3, "textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && objc_msgSend(v12, "viewportShouldSnapToAttachmentView"))
    {
      -[ICNoteEditorViewController attachmentViewForTextAttachment:characterIndex:](self, "attachmentViewForTextAttachment:characterIndex:", v12, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)attachmentViewForTextAttachment:(id)a3 characterIndex:(int64_t)a4
{
  id v6;
  int IsTextKit2Enabled;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  -[ICNoteEditorViewController textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (IsTextKit2Enabled)
  {
    objc_msgSend(v8, "textContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textLayoutManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "documentRange");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "location");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locationFromLocation:withOffset:", v13, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "viewProviderForTextAttachment:location:", v6, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
  }
  else
  {
    objc_msgSend(v8, "icLayoutManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "viewProviderForTextAttachment:characterIndex:", v6, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)prepareToSnapToPaperDocumentAtStartOfDragIfNecessary:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  double Height;
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
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  CGFloat v27;
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
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  _QWORD v51[5];
  id v52;
  id v53;
  id v54;
  CGRect v55;
  CGRect v56;

  v50 = a3;
  -[ICNoteEditorViewController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v50, "isEqual:", v4);

  if ((v5 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[scrollView isEqual:self.textView]", "-[ICNoteEditorViewController prepareToSnapToPaperDocumentAtStartOfDragIfNecessary:]", 1, 0, CFSTR("Unexpected scroll view: %@"), v50);
  -[ICNoteEditorViewController setPreventSnappingToLastPaperDocument:](self, "setPreventSnappingToLastPaperDocument:", 0);
  -[ICNoteEditorViewController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldRubberBand:", 0);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEmpty") & 1) != 0)
    goto LABEL_14;
  v10 = -[ICNoteEditorViewController isEditing](self, "isEditing");

  if ((v10 & 1) == 0)
  {
    -[ICNoteEditorViewController lastPaperDocumentAttachmentView](self, "lastPaperDocumentAttachmentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D64CD0], "rootSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isRubberBandingEnabled") && v9)
    {
      objc_msgSend(v9, "bounds");
      Height = CGRectGetHeight(v55);
      -[ICNoteEditorViewController textView](self, "textView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      -[ICNoteEditorViewController textView](self, "textView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "safeAreaInsets");
      v24 = v17 + v23;
      v27 = v19 - (v25 + v26);
      v56.size.height = v21 - (v23 + v28);
      v56.origin.x = v15 + v25;
      v56.origin.y = v24;
      v56.size.width = v27;
      v29 = CGRectGetHeight(v56);

      if (Height >= v29)
      {
        objc_msgSend(v9, "bounds");
        objc_msgSend(v50, "convertPoint:fromView:", v9);
        v31 = v30;
        v33 = v32;
        objc_msgSend(v50, "safeAreaInsets");
        v35 = v33 - v34;
        objc_msgSend(v50, "contentOffset");
        if (v36 < v35 || (objc_msgSend(v50, "contentOffset"), vabdd_f64(v37, v35) < 16.0))
        {
          -[ICNoteEditorViewController textView](self, "textView");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setShouldRubberBand:", 1);

          -[ICNoteEditorViewController textView](self, "textView");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setRubberBandContentOffset:", v31, v35);

        }
        objc_msgSend(v50, "contentOffset");
        -[ICNoteEditorViewController setPreventSnappingToLastPaperDocument:](self, "setPreventSnappingToLastPaperDocument:", v40 >= v35);
      }
    }
    else
    {

    }
    -[ICNoteEditorViewController textView](self, "textView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "textStorage");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = *MEMORY[0x1E0DC10F8];
    -[ICNoteEditorViewController textView](self, "textView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "textStorage");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "ic_range");
    v47 = v46;
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __83__ICNoteEditorViewController_prepareToSnapToPaperDocumentAtStartOfDragIfNecessary___block_invoke;
    v51[3] = &unk_1EA7DEAF0;
    v51[4] = self;
    v52 = v50;
    v53 = v7;
    v54 = v8;
    objc_msgSend(v42, "enumerateAttribute:inRange:options:usingBlock:", v49, v45, v47, 0, v51);

LABEL_14:
  }
  -[ICNoteEditorViewController textView](self, "textView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setDraggingSnapPoints:", v7);

}

void __83__ICNoteEditorViewController_prepareToSnapToPaperDocumentAtStartOfDragIfNecessary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a2;
  objc_opt_class();
  ICDynamicCast();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v20, "viewportShouldSnapToAttachmentView");
  v7 = v20;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "attachmentViewForTextAttachment:characterIndex:", v20, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "bounds");
      objc_msgSend(v9, "convertPoint:toView:", *(_QWORD *)(a1 + 40));
      v11 = v10;
      v13 = v12;
      objc_msgSend(*(id *)(a1 + 40), "safeAreaInsets");
      v15 = v13 - v14;
      objc_msgSend(*(id *)(a1 + 40), "contentOffset");
      if (vabdd_f64(v16, v15) > 16.0)
      {
        v17 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v11, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v18);

      }
      objc_msgSend(*(id *)(a1 + 32), "firstEmbeddedScrollViewInView:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v19);

    }
    v7 = v20;
  }

}

- (id)firstEmbeddedScrollViewInView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "subviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[ICNoteEditorViewController firstEmbeddedScrollViewInView:](self, "firstEmbeddedScrollViewInView:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v5 = (id)v11;

            goto LABEL_13;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }

    v5 = 0;
  }
LABEL_13:

  return v5;
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[ICNoteEditorViewController textView](self, "textView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userTitleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  if ((v6 & 1) == 0)
    -[ICNoteEditorViewController updateTextViewContentInsetsAnimated:](self, "updateTextViewContentInsetsAnimated:", 1);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[ICNoteEditorViewController updateNoteUserActivityStateDelayer](self, "updateNoteUserActivityStateDelayer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestFire");

  -[ICNoteEditorViewController setPreventSnappingToLastPaperDocument:](self, "setPreventSnappingToLastPaperDocument:", 0);
  -[ICNoteEditorBaseViewController note](self, "note");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentMergeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endBlockingMergeForReason:textView:", 1, v6);

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[ICNoteEditorBaseViewController note](self, "note", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentMergeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endBlockingMergeForReason:textView:", 1, v5);

}

- (void)userActivityWillSave:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[ICNoteEditorViewController userActivityUpdateQueue](self, "userActivityUpdateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__ICNoteEditorViewController_userActivityWillSave___block_invoke;
  block[3] = &unk_1EA7DD498;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __51__ICNoteEditorViewController_userActivityWillSave___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "noteUserActivityState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateUserActivity:", *(_QWORD *)(a1 + 40));

}

- (void)userActivity:(id)a3 didReceiveInputStream:(id)a4 outputStream:(id)a5
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0D63B18];
  v7 = a5;
  v8 = a4;
  objc_msgSend(v6, "sharedController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didReceiveInputStream:outputStream:", v8, v7);

}

- (id)userActivity
{
  void *v3;

  -[ICNoteEditorViewController noteUserActivity](self, "noteUserActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[ICNoteEditorViewController updateNoteUserActivityState](self, "updateNoteUserActivityState");
  return -[ICNoteEditorViewController noteUserActivity](self, "noteUserActivity");
}

- (void)presentAttachment:(id)a3
{
  -[ICNoteEditorViewController attachmentView:shouldPresentAttachment:](self, "attachmentView:shouldPresentAttachment:", 0, a3);
}

- (void)attachmentView:(id)a3 shouldPresentNote:(id)a4
{
  void *v5;
  char v6;
  id v7;

  -[ICNoteEditorViewController delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[ICNoteEditorViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "noteEditor:didTapAttachment:", self, 0);

  }
}

- (void)attachmentView:(id)a3 shouldPresentAttachment:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  ICAttachmentPresenter *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD7B0000, v8, OS_LOG_TYPE_INFO, "No attachment to present for attachment view", buf, 2u);
    }
    goto LABEL_16;
  }
  if (!objc_msgSend(MEMORY[0x1E0D64BE8], "canUpdateFullscreenSketchAttachment:", v7))
  {
    -[ICNoteEditorViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = objc_msgSend(v7, "attachmentType");

      if (v10 == 11)
      {
        v11 = 1;
LABEL_12:
        if (ICInternalSettingsIsAudioTranscriptionEnabled()
          && v11
          && objc_msgSend(v7, "attachmentType") == 4)
        {
          -[ICNoteEditorViewController audioAttachmentEditorCoordinator](self, "audioAttachmentEditorCoordinator");
          v8 = objc_claimAutoreleasedReturnValue();
          -[NSObject presentRecordingViewControllerForAttachment:](v8, "presentRecordingViewControllerForAttachment:", v7);
LABEL_16:

          goto LABEL_31;
        }
        if (!v11)
          goto LABEL_31;
        -[ICNoteEditorBaseViewController note](self, "note");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "attachmentsInOrder");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v13, "indexOfObject:", v7);
        if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v15 = os_log_create("com.apple.notes", "UI");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v7, "shortLoggingDescription");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v27 = v16;
            _os_log_impl(&dword_1DD7B0000, v15, OS_LOG_TYPE_INFO, "Could not find attachment %@ in its note. Falling back to showing just this attachment", buf, 0xCu);

          }
          v25 = v7;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
          v17 = objc_claimAutoreleasedReturnValue();

          v18 = 0;
          v13 = (void *)v17;
        }
        else
        {
          v18 = v14;
        }
        -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
          v20 = (ICAttachmentPresenter *)objc_claimAutoreleasedReturnValue();
          -[ICAttachmentPresenter presentAttachments:startingAtIndex:delegate:displayShowInNote:editable:selectedSubAttachment:presentingViewController:](v20, "presentAttachments:startingAtIndex:delegate:displayShowInNote:editable:selectedSubAttachment:presentingViewController:", v13, v18, self, 0, objc_msgSend(v7, "isReadOnly") ^ 1, 0, self);
        }
        else
        {
          -[ICNoteEditorViewController quickNoteiPhoneAttachmentPresenter](self, "quickNoteiPhoneAttachmentPresenter");
          v20 = (ICAttachmentPresenter *)objc_claimAutoreleasedReturnValue();
          -[ICAttachmentPresenter presentedViewController](v20, "presentedViewController");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "isBeingPresented"))
          {

          }
          else
          {
            -[ICNoteEditorViewController quickNoteiPhoneAttachmentPresenter](self, "quickNoteiPhoneAttachmentPresenter");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "galleryAttachmentEditorController");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
LABEL_30:

              goto LABEL_31;
            }
            v20 = -[ICAttachmentPresenter initWithViewControllerManager:attachments:startingAtIndex:delegate:displayShowInNote:editable:presentingViewController:]([ICAttachmentPresenter alloc], "initWithViewControllerManager:attachments:startingAtIndex:delegate:displayShowInNote:editable:presentingViewController:", 0, v13, v18, self, 0, objc_msgSend(v7, "isReadOnly") ^ 1, self);
            -[ICNoteEditorViewController setQuickNoteiPhoneAttachmentPresenter:](self, "setQuickNoteiPhoneAttachmentPresenter:", v20);
            objc_msgSend(v13, "objectAtIndexedSubscript:", v18);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICAttachmentPresenter presentAttachmentWithSelectedSubAttachment:](v20, "presentAttachmentWithSelectedSubAttachment:", v24);

          }
        }

        goto LABEL_30;
      }
      -[ICNoteEditorViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "noteEditor:didTapAttachment:", self, v7) ^ 1;
    }
    else
    {
      v11 = 1;
    }

    goto LABEL_12;
  }
  -[ICNoteEditorViewController showDrawingUpdateAlert](self, "showDrawingUpdateAlert");
  ICInternalSettingsIsAudioTranscriptionEnabled();
LABEL_31:

}

- (void)attachmentView:(id)a3 shouldShareAttachment:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a3;
  +[ICAttachmentActivityViewController makeWithAttachment:quickLookItemDelegate:completion:](ICAttachmentActivityViewController, "makeWithAttachment:quickLookItemDelegate:completion:", a4, self, &__block_literal_global_835);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "popoverPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSourceView:", v6);

  objc_msgSend(v6, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v18, "popoverPresentationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSourceRect:", v9, v11, v13, v15);

  objc_msgSend(v18, "popoverPresentationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCanOverlapSourceViewRect:", 1);

  -[ICNoteEditorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);
}

- (BOOL)attachmentView:(id)a3 shouldRespondToPanGestureTouch:(id)a4 forAttachment:(id)a5
{
  id v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;

  v7 = a4;
  if (objc_msgSend(a5, "attachmentType") == 9)
  {
    v8 = objc_msgSend(v7, "type");
    v9 = -[ICNoteEditorViewController isInkPickerShowing](self, "isInkPickerShowing");
    v10 = v8 == 2 || v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CGRect)notesQuickLookActivityItem:(id)a3 rectForPreviewItem:(id)a4 inView:(id *)a5 previewController:(id)a6
{
  void *v6;
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
  double v17;
  double v18;
  CGRect result;

  -[ICNoteEditorViewController textView](self, "textView", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)notesQuickLookActivityItem:(id)a3 transitionViewForPreviewItem:(id)a4 previewController:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a4;
  objc_opt_class();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNoteEditorViewController viewForAttachment:](self, "viewForAttachment:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)viewForAttachment:(id)a3
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
  id v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_opt_class();
    -[ICNoteEditorViewController textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "icTextLayoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "existingAttachmentViewForIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    ICDynamicCast();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "drawingInlineView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(v9, "quickLookTransitionView");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = v13;

    goto LABEL_16;
  }
  -[ICNoteEditorViewController textView](self, "textView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "supplementalViewForIdentifier:allowHiddenViews:", v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "drawingInlineView");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v23 = 0;
        goto LABEL_16;
      }
      objc_msgSend(v10, "quickLookTransitionView");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)v19;
LABEL_16:

    goto LABEL_17;
  }
  v20 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "shortLoggingDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412546;
    v26 = v21;
    v27 = 2112;
    v28 = (id)objc_opt_class();
    v22 = v28;
    _os_log_impl(&dword_1DD7B0000, v20, OS_LOG_TYPE_INFO, "Trying to find a transition view for %@, but the note editor's layout manager isn't an %@", (uint8_t *)&v25, 0x16u);

  }
  v23 = 0;
LABEL_17:

  return v23;
}

- (id)attachmentPresenter:(id)a3 transitionViewForAttachment:(id)a4
{
  return -[ICNoteEditorViewController viewForAttachment:](self, "viewForAttachment:", a4);
}

- (BOOL)attachmentPresenter:(id)a3 useFullPDFTransitionForAttachment:(id)a4
{
  return 1;
}

- (void)attachmentPresenterDidDismiss:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICNoteEditorViewController quickNoteiPhoneAttachmentPresenter](self, "quickNoteiPhoneAttachmentPresenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[ICNoteEditorViewController setQuickNoteiPhoneAttachmentPresenter:](self, "setQuickNoteiPhoneAttachmentPresenter:", 0);
}

- (void)showDrawingUpdateAlert
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
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
  _QWORD v35[4];
  id v36;
  char v37;
  _QWORD v38[4];
  id v39;
  char v40;
  _QWORD v41[4];
  id v42;
  char v43;
  id location[2];

  -[ICNoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textDragInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEnabled");

  v6 = (void *)MEMORY[0x1E0D64BE8];
  -[ICNoteEditorBaseViewController note](self, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "countOfUpdatableDrawingsInNote:", v7);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 > 1)
  {
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Update Drawings?"), &stru_1EA7E9860, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = CFSTR("You need to update these drawings to edit them.\n\nOnly devices upgraded to the latest version of iOS can edit these drawings.");
  }
  else
  {
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Update Drawing?"), &stru_1EA7E9860, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = CFSTR("You need to update this drawing to edit it.\n\nOnly devices upgraded to the latest version of iOS can edit this drawing.");
  }
  objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1EA7E9860, 0);
  v15 = objc_claimAutoreleasedReturnValue();

  v33 = (void *)v15;
  v34 = (void *)v11;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v11, v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v17 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Learn More"), &stru_1EA7E9860, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __52__ICNoteEditorViewController_showDrawingUpdateAlert__block_invoke;
  v41[3] = &unk_1EA7DEB38;
  objc_copyWeak(&v42, location);
  v43 = v5;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 0, v41);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v21);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v20;
  if (v8 >= 2)
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Update Drawings"), &stru_1EA7E9860, 0);
  else
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Update Drawing"), &stru_1EA7E9860, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0DC3448];
  v38[0] = v20;
  v38[1] = 3221225472;
  v38[2] = __52__ICNoteEditorViewController_showDrawingUpdateAlert__block_invoke_2;
  v38[3] = &unk_1EA7DEB38;
  objc_copyWeak(&v39, location);
  v40 = v5;
  objc_msgSend(v25, "actionWithTitle:style:handler:", v24, 0, v38);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v26);

  v27 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1EA7E9860, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v23;
  v35[1] = 3221225472;
  v35[2] = __52__ICNoteEditorViewController_showDrawingUpdateAlert__block_invoke_3;
  v35[3] = &unk_1EA7DEB38;
  objc_copyWeak(&v36, location);
  v37 = v5;
  objc_msgSend(v27, "actionWithTitle:style:handler:", v29, 1, v35);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v30);

  -[ICNoteEditorViewController textView](self, "textView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "textDragInteraction");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setEnabled:", 0);

  -[ICNoteEditorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v39);

  objc_destroyWeak(&v42);
  objc_destroyWeak(location);

}

void __52__ICNoteEditorViewController_showDrawingUpdateAlert__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v2 = (void *)MEMORY[0x1E0D64C10];
  v3 = *MEMORY[0x1E0D64990];
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v2, "presentWithTopic:presentingViewController:", v3, WeakRetained);

  v6 = *(unsigned __int8 *)(a1 + 40);
  v9 = objc_loadWeakRetained(v4);
  objc_msgSend(v9, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textDragInteraction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v6);

}

void __52__ICNoteEditorViewController_showDrawingUpdateAlert__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateDrawingAttachmentsInNote");

  v4 = *(unsigned __int8 *)(a1 + 40);
  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textDragInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v4);

}

void __52__ICNoteEditorViewController_showDrawingUpdateAlert__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id WeakRetained;

  v1 = *(unsigned __int8 *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textDragInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", v1);

}

- (void)updateDrawingAttachmentsInNote
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2_0(&dword_1DD7B0000, a3, (uint64_t)a3, "Manually updating all drawings in note %@", (uint8_t *)a2);

}

void __60__ICNoteEditorViewController_updateDrawingAttachmentsInNote__block_invoke(uint64_t a1)
{
  id v1;

  v1 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v1, "performSelector:withObject:afterDelay:", sel_showInkPicker_, v1, 0.25);

}

- (id)undoManager
{
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  -[ICNoteEditorViewController textViewUndoManager](self, "textViewUndoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "canRedo") & 1) != 0 || objc_msgSend(v3, "canUndo"))
  {
    v4 = v3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ICNoteEditorViewController;
    -[ICNoteEditorViewController undoManager](&v7, sel_undoManager);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (NSUndoManager)textViewUndoManager
{
  void *v2;
  void *v3;

  -[ICNoteEditorViewController textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUndoManager *)v3;
}

+ (UIMenu)formatKeyboardShortcutMenu
{
  void *v2;
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
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
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
  _QWORD v85[22];

  v85[20] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\t"), 0, sel_tab_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\t"), 0x20000, sel_shiftTab_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWantsPriorityOverSystemBehavior:", 1);
  v67 = (void *)MEMORY[0x1E0C99DE8];
  v4 = (void *)MEMORY[0x1E0DC3930];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "localizedStringForKey:value:table:", CFSTR("Title"), &stru_1EA7E9860, 0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("t"), 1179648, sel_setTitleStyle_, v81);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = v80;
  v5 = (void *)MEMORY[0x1E0DC3930];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "localizedStringForKey:value:table:", CFSTR("Heading"), &stru_1EA7E9860, 0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("h"), 1179648, sel_setHeadingStyle_, v78);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v85[1] = v77;
  v6 = (void *)MEMORY[0x1E0DC3930];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "localizedStringForKey:value:table:", CFSTR("Subheading"), &stru_1EA7E9860, 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("j"), 1179648, sel_setSubheadingStyle_, v75);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v85[2] = v74;
  v7 = (void *)MEMORY[0x1E0DC3930];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("Body"), &stru_1EA7E9860, 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("b"), 1179648, sel_setBodyStyle_, v72);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v85[3] = v71;
  v8 = (void *)MEMORY[0x1E0DC3930];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "localizedStringForKey:value:table:", CFSTR("Monostyled"), &stru_1EA7E9860, 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("m"), 1179648, sel_setFixedWidthStyle_, v69);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v85[4] = v68;
  v9 = (void *)MEMORY[0x1E0DC3930];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("Bulleted list"), &stru_1EA7E9860, 0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("7"), 1179648, sel_setBulletedListStyle_, v65);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v85[5] = v64;
  v10 = (void *)MEMORY[0x1E0DC3930];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("Dashed list"), &stru_1EA7E9860, 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("8"), 1179648, sel_setDashedListStyle_, v62);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v85[6] = v61;
  v11 = (void *)MEMORY[0x1E0DC3930];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("Numbered list"), &stru_1EA7E9860, 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("9"), 1179648, sel_setNumberedListStyle_, v59);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v85[7] = v58;
  v12 = (void *)MEMORY[0x1E0DC3930];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("Checklist"), &stru_1EA7E9860, 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("l"), 1179648, sel_toggleTodoStyle_, v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v85[8] = v55;
  v13 = (void *)MEMORY[0x1E0DC3930];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("Mark as Checked"), &stru_1EA7E9860, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("u"), 1179648, sel_toggleTodoChecked_, v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v85[9] = v52;
  v14 = (void *)MEMORY[0x1E0DC3930];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("Block Quote"), &stru_1EA7E9860, 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("'"), 0x100000, sel_toggleBlockQuote_, v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v85[10] = v49;
  v15 = (void *)MEMORY[0x1E0DC3930];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("Table"), &stru_1EA7E9860, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("t"), 1572864, sel_addTable_, v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v85[11] = v46;
  v16 = (void *)MEMORY[0x1E0DC3930];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("Decrease Indentation"), &stru_1EA7E9860, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("["), 0x100000, sel_indentLeft_, v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v85[12] = v43;
  v17 = (void *)MEMORY[0x1E0DC3930];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("Increase Indentation"), &stru_1EA7E9860, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("]"), 0x100000, sel_indentRight_, v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v85[13] = v40;
  v85[14] = v2;
  v83 = v3;
  v84 = v2;
  v85[15] = v3;
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0x20000, sel_shiftReturn_);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v85[16] = v18;
  v19 = (void *)MEMORY[0x1E0DC3930];
  v20 = *MEMORY[0x1E0DC4E30];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Move Item Up"), &stru_1EA7E9860, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", v20, 1310720, sel_moveSelectedListItemUp_, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v85[17] = v23;
  v24 = (void *)MEMORY[0x1E0DC3930];
  v25 = *MEMORY[0x1E0DC4D90];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Move Item Down"), &stru_1EA7E9860, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", v25, 1310720, sel_moveSelectedListItemDown_, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v85[18] = v28;
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("'"), 1572864, sel_toggleBlockQuote);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v85[19] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 20);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "arrayWithArray:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (ICInternalSettingsIsEmphasisEnabled())
  {
    v32 = (void *)MEMORY[0x1E0DC3930];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Highlight"), &stru_1EA7E9860, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("e"), 1179648, sel_toggleEmphasis_, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
      objc_msgSend(v31, "insertObject:atIndex:", v35, 0);

  }
  v36 = (void *)MEMORY[0x1E0DC39D0];
  v37 = (void *)objc_msgSend(v31, "copy");
  objc_msgSend(v36, "menuWithTitle:image:identifier:options:children:", &stru_1EA7E9860, 0, 0, 1, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIMenu *)v38;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode"))
  {
    v8 = objc_msgSend(v7, "_modifierFlags");
    objc_msgSend(v7, "_modifiedInput");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((v8 & 0x100000) != 0 && objc_msgSend(v9, "length") == 1)
    {
      v11 = objc_msgSend(v10, "characterAtIndex:", 0);
      if (v11 == 93)
      {
        -[ICNoteEditorViewController indentRight:](self, "indentRight:", 0);
        goto LABEL_11;
      }
      if (v11 == 91)
      {
        -[ICNoteEditorViewController indentLeft:](self, "indentLeft:", 0);
LABEL_11:

        goto LABEL_9;
      }
    }

  }
  v12.receiver = self;
  v12.super_class = (Class)ICNoteEditorViewController;
  -[ICNoteEditorViewController pressesBegan:withEvent:](&v12, sel_pressesBegan_withEvent_, v6, v7);
LABEL_9:

}

- (ICSelectorDelayer)applyAccessibilityInfoDelayer
{
  ICSelectorDelayer *applyAccessibilityInfoDelayer;
  ICSelectorDelayer *v4;
  ICSelectorDelayer *v5;

  applyAccessibilityInfoDelayer = self->_applyAccessibilityInfoDelayer;
  if (!applyAccessibilityInfoDelayer)
  {
    v4 = (ICSelectorDelayer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64268]), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", self, sel_applyAccessibilityInfo, 0, 1, 1.0);
    v5 = self->_applyAccessibilityInfoDelayer;
    self->_applyAccessibilityInfoDelayer = v4;

    applyAccessibilityInfoDelayer = self->_applyAccessibilityInfoDelayer;
  }
  return applyAccessibilityInfoDelayer;
}

- (void)applyAccessibilityInfo
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  char *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  ICNoteEditorViewController *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[ICNoteEditorViewController applyAccessibilityInfoDelayer](self, "applyAccessibilityInfoDelayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelPreviousFireRequests");

  if (-[ICNoteEditorViewController isDrawingStroke](self, "isDrawingStroke"))
  {
    -[ICNoteEditorViewController applyAccessibilityInfoDelayer](self, "applyAccessibilityInfoDelayer");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "requestFire");

    return;
  }
  v28 = self;
  -[ICNoteEditorViewController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputAssistantItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v5;
  objc_msgSend(v5, "leadingBarButtonGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "representativeItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Edit"), &stru_1EA7E9860, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v8;
  objc_msgSend(v8, "setIc_titleAndAccessibilityLabel:", v10);

  objc_msgSend(v7, "barButtonItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v12)
    goto LABEL_17;
  v13 = v12;
  v14 = *(_QWORD *)v30;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v30 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      v17 = (char *)objc_msgSend(v16, "action");
      if (v17 == sel_assistantCut)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        v20 = CFSTR("Cut");
      }
      else if (v17 == sel_assistantCopy)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        v20 = CFSTR("Copy");
      }
      else
      {
        if (v17 != sel_assistantPaste)
          continue;
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        v20 = CFSTR("Paste");
      }
      objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_1EA7E9860, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAccessibilityLabel:", v21);

    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  }
  while (v13);
LABEL_17:
  -[ICNoteEditorViewController backgroundView](v28, "backgroundView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](v28, "textView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "reparentAccessibilityChildrenOfElement:", v23);

  -[ICNoteEditorViewController backgroundView](v28, "backgroundView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAxChildReparentingController:", v28);

}

- (void)updateDateLabelAccessibility
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  CGRect v24;
  CGRect v25;

  -[ICNoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAccessibilityElement");

  -[ICNoteEditorViewController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[ICNoteEditorViewController textView](self, "textView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accessibilityFrame");
  v25.origin.x = v17;
  v25.origin.y = v18;
  v25.size.width = v19;
  v25.size.height = v20;
  v24.origin.x = v8;
  v24.origin.y = v10;
  v24.size.width = v12;
  v24.size.height = v14;
  v21 = CGRectContainsRect(v24, v25);

  if (v5 != v21)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dateView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setIsAccessibilityElement:", v21);

    UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], 0);
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICNoteEditorViewController;
  -[ICNoteEditorViewController _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[ICNoteEditorViewController applyAccessibilityInfo](self, "applyAccessibilityInfo");
  -[ICNoteEditorViewController updateDateLabelAccessibility](self, "updateDateLabelAccessibility");
  -[ICNoteEditorViewController updateBarButtons](self, "updateBarButtons");
}

- (void)icaxToggleTodoStyle
{
  -[ICNoteEditorViewController toggleTodoStyle:](self, "toggleTodoStyle:", 0);
}

- (void)blockAccessibilityScreenChangedNotificationsIfNecessaryForDuration:(double)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  -[ICNoteEditorViewController icSplitViewController](self, "icSplitViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "splitViewController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[ICNoteEditorViewController icSplitViewController](self, "icSplitViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "horizontalSizeClass");

    if (v8 != 1)
    {
      _UIAccessibilityBlockPostingOfNotification();
      dispatchMainAfterDelay();
    }
  }
  else
  {

  }
}

uint64_t __97__ICNoteEditorViewController_blockAccessibilityScreenChangedNotificationsIfNecessaryForDuration___block_invoke()
{
  return _UIAccessibilityUnblockPostingOfNotification();
}

- (BOOL)allowsAccessibilityChildReparenting
{
  void *v3;
  BOOL v4;
  void *v5;

  -[ICNoteEditorViewController passwordEntryViewController](self, "passwordEntryViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[ICNoteEditorViewController invitationViewController](self, "invitationViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  return v4;
}

- (void)runScrollPerformanceTest:(id)a3 iterations:(int)a4 offset:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  id v9;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  -[ICNoteEditorViewController textView](self, "textView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_performScrollTest:iterations:delta:", v8, v6, v5);

}

- (void)runTableHorizontalScrollPerformanceTest:(id)a3 iterations:(int)a4 offset:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[ICNoteEditorViewController textViewController](self, "textViewController", 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "childViewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          ICDynamicCast();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "scrollView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "_performScrollTest:iterations:delta:scrollAxis:", v8, v6, v5, 1);

          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)applicationDidEnterBackground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  if (-[ICNoteEditorViewController isEditing](self, "isEditing", a3))
  {
    -[ICNoteEditorViewController textViewInputAccessoryView](self, "textViewInputAccessoryView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 0.0);

  }
  objc_opt_class();
  -[ICNoteEditorViewController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__ICNoteEditorViewController_applicationDidEnterBackground___block_invoke;
    v7[3] = &unk_1EA7DD2D8;
    v7[4] = self;
    -[ICNoteEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v7);
  }

}

uint64_t __60__ICNoteEditorViewController_applicationDidEnterBackground___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanupAfterAddImageAttachmentOperation");
}

- (void)sceneWillDeactivate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqual:", v7);

  if (v8)
  {
    -[ICNoteEditorViewController showOrHideLockIconCoverViewControllerIfNeededIsBackgrounding:](self, "showOrHideLockIconCoverViewControllerIfNeededIsBackgrounding:", 1);
    if (-[ICNoteEditorViewController ic_isViewVisible](self, "ic_isViewVisible"))
    {
      -[ICNoteEditorBaseViewController note](self, "note");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[ICNoteEditorBaseViewController note](self, "note");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController submitNoteViewEventForModernNote:](self, "submitNoteViewEventForModernNote:", v10);

      }
    }
  }
}

void __47__ICNoteEditorViewController_sceneDidActivate___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "ic_isViewVisible"))
  {
    objc_msgSend(WeakRetained, "textView");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "window");
    v2 = objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
LABEL_5:

      goto LABEL_6;
    }
    v3 = (void *)v2;
    objc_msgSend(WeakRetained, "textStorage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (v5)
    {
      objc_msgSend(WeakRetained, "textView");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "layoutManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "textStorage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");

      objc_msgSend(v6, "ensureLayoutForCharacterRange:", 0, v8 != 0);
      goto LABEL_5;
    }
  }
LABEL_6:

}

void __57__ICNoteEditorViewController_applicationDidBecomeActive___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "textViewInputAccessoryView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)mergeRelatedOperationsDidEnd:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D63770]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!v13 || (v7 = objc_msgSend(v13, "unsignedIntegerValue") == 2, v8 = v13, v7))
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEditing");

    if ((v10 & 1) == 0)
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ic_resetDataDetectorsResults");

      -[ICNoteEditorViewController textView](self, "textView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ic_startDataDetectors");

    }
    -[ICNoteEditorViewController updateStyleSelectorStateIfNeededIgnoreTypingAttributes:](self, "updateStyleSelectorStateIfNeededIgnoreTypingAttributes:", 1);
    v8 = v13;
  }

}

- (BOOL)keyboardResizerAutoscrollAboveKeyboard
{
  return !-[ICNoteEditorViewController isEditingOnSystemPaperOnPad](self, "isEditingOnSystemPaperOnPad");
}

- (void)keyboardResizerAdjustInsetsWithKeyboardFrame:(CGRect)a3 scrollAboveHeight:(double)a4 duration:(double)a5
{
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v12;
  double v13;
  _BOOL4 IsNull;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat rect;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[ICNoteEditorViewController isEditingOnSystemPaperOnPad](self, "isEditingOnSystemPaperOnPad"))
    return;
  -[ICNoteEditorViewController ic_safeAreaDistanceFromBottom](self, "ic_safeAreaDistanceFromBottom");
  v13 = v12;
  v57.origin.x = x;
  v57.origin.y = y;
  v57.size.width = width;
  v57.size.height = height;
  IsNull = CGRectIsNull(v57);
  v53 = a5;
  v54 = x;
  v55 = y;
  rect = width;
  if (!IsNull)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "inputAccessoryView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      -[ICNoteEditorViewController textViewInputAccessoryView](self, "textViewInputAccessoryView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "intrinsicContentSize");
      height = height + v18;

    }
    v58.origin.x = x;
    v58.origin.y = y;
    v58.size.width = width;
    v58.size.height = height;
    v19 = CGRectGetHeight(v58) - a4;
    if (v19 < v13)
      v19 = v13;
    -[ICNoteEditorViewController setTextViewScrollIndicatorBottomInsetOverride:](self, "setTextViewScrollIndicatorBottomInsetOverride:", v19);
    -[ICNoteEditorViewController textViewMinimumBottomInset](self, "textViewMinimumBottomInset");
    -[ICNoteEditorViewController setTextViewMinimumBottomInset:](self, "setTextViewMinimumBottomInset:");
    -[ICNoteEditorViewController textView](self, "textView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_contentScrollInset");
    v22 = v21;
    v24 = v23;
    v26 = v25;

    -[ICNoteEditorViewController textView](self, "textView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_contentScrollInset");
    if (v31 == v24 && v28 == v22 && v30 == v26)
    {
      v32 = v29;

      if (v32 == a4)
        goto LABEL_15;
    }
    else
    {

    }
    -[ICNoteEditorViewController textView](self, "textView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_setContentScrollInset:", v22, v24, a4, v26);

    goto LABEL_15;
  }
  -[ICNoteEditorViewController textViewMinimumBottomInset](self, "textViewMinimumBottomInset");
  -[ICNoteEditorViewController setTextViewMinimumBottomInset:](self, "setTextViewMinimumBottomInset:");
  -[ICNoteEditorViewController setTextViewScrollIndicatorBottomInsetOverride:](self, "setTextViewScrollIndicatorBottomInsetOverride:", v13);
LABEL_15:
  -[ICNoteEditorViewController textViewScrollIndicatorBottomInsetOverride](self, "textViewScrollIndicatorBottomInsetOverride");
  -[ICNoteEditorViewController setTextViewScrollIndicatorBottomInsetOverride:](self, "setTextViewScrollIndicatorBottomInsetOverride:", v34 + 5.0);
  -[ICNoteEditorViewController setTextViewScrollIndicatorBottomInsetOverrideToRestore:](self, "setTextViewScrollIndicatorBottomInsetOverrideToRestore:", 0.0);
  -[ICNoteEditorViewController textView](self, "textView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "contentInset");
  v37 = v36;
  v39 = v38;
  v41 = v40;

  -[ICNoteEditorViewController textViewBottomInsetThatWeWantForEditing:](self, "textViewBottomInsetThatWeWantForEditing:", !IsNull);
  v43 = v42;
  -[ICNoteEditorViewController textViewScrollIndicatorInsetsThatWeWant](self, "textViewScrollIndicatorInsetsThatWeWant");
  v45 = v44;
  v47 = v46;
  v49 = v48;
  -[ICNoteEditorViewController textView](self, "textView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setContentInset:", v37, v39, v43, v41);

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setVerticalScrollIndicatorInsets:", v37, v45, v47, v49);

  }
  v59.origin.x = v54;
  v59.origin.y = v55;
  v59.size.width = rect;
  v59.size.height = height;
  if (!CGRectIsNull(v59))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController setKeyboardAnimateInFinishTime:](self, "setKeyboardAnimateInFinishTime:", v52);

  }
  dispatchMainAfterDelay();
}

uint64_t __102__ICNoteEditorViewController_keyboardResizerAdjustInsetsWithKeyboardFrame_scrollAboveHeight_duration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateBarButtons");
}

- (void)ensureValidInkForNewDrawingOrNote
{
  id v3;

  -[ICNoteEditorViewController currentValidToolForNewDrawingOrNote](self, "currentValidToolForNewDrawingOrNote");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController updateInkPickerAndTextViewToTool:](self, "updateInkPickerAndTextViewToTool:", v3);

}

- (void)updateInkPickerAndTextViewToTool:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[ICNoteEditorViewController createInkPickerControllerIfNecessary](self, "createInkPickerControllerIfNecessary");
  v4 = v10;
  if (v10)
  {
    -[ICNoteEditorViewController inkPaletteController](self, "inkPaletteController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelectedTool:", v10);

    if (-[ICNoteEditorViewController isNewInk:](self, "isNewInk:", v10)
      && -[ICNoteEditorViewController noteHasAnyPencilKitDrawings](self, "noteHasAnyPencilKitDrawings"))
    {
      -[ICNoteEditorViewController inkPaletteController](self, "inkPaletteController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "resetToPencilKitCompatibleInk");

    }
    -[ICNoteEditorViewController inkPaletteController](self, "inkPaletteController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectedTool");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setTool:", v8);

    v4 = v10;
  }

}

- (void)clearTextViewSelection
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  -[ICNoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedRange");
  v6 = v5;

  if (v6)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelectedRange:", v4, 0);

  }
}

- (void)setSearchRegexFinder:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_searchRegexFinder, a3);
  -[ICNoteEditorViewController showOrHideSearchPatternHighlightsDelayer](self, "showOrHideSearchPatternHighlightsDelayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestFire");

}

- (void)showOrHideSearchPatternHighlightsIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[ICNoteEditorViewController showOrHideSearchPatternHighlightsDelayer](self, "showOrHideSearchPatternHighlightsDelayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelPreviousFireRequests");

  if ((-[ICNoteEditorViewController isEditing](self, "isEditing") & 1) != 0)
    goto LABEL_5;
  -[ICNoteEditorViewController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "findInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isFindNavigatorVisible"))
  {

LABEL_5:
    v15 = 0;
    goto LABEL_6;
  }
  v6 = -[ICNoteEditorViewController isInkPickerShowing](self, "isInkPickerShowing");

  if (v6)
    goto LABEL_5;
  -[ICNoteEditorViewController searchRegexFinder](self, "searchRegexFinder");
  v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  if (!ICInternalSettingsIsTextKit2Enabled())
  {
    objc_opt_class();
    -[ICNoteEditorViewController textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHighlightPatternRegexFinder:", v15);

    goto LABEL_11;
  }
  objc_opt_class();
  -[ICNoteEditorViewController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLayoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v15;
  if (v15
    || (objc_msgSend(v9, "highlightPatternRegexFinder"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10 = 0,
        v11))
  {
    v15 = v10;
    objc_msgSend(v9, "setHighlightPatternRegexFinder:", v10);
    -[ICNoteEditorViewController authorHighlightsUpdater](self, "authorHighlightsUpdater");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSearchHighlightRegexFinder:", v15);

    -[ICNoteEditorViewController authorHighlightsUpdater](self, "authorHighlightsUpdater");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateAnimated:", 0);
LABEL_11:

  }
}

- (ICSelectorDelayer)showOrHideSearchPatternHighlightsDelayer
{
  ICSelectorDelayer *showOrHideSearchPatternHighlightsDelayer;
  ICSelectorDelayer *v4;
  ICSelectorDelayer *v5;

  showOrHideSearchPatternHighlightsDelayer = self->_showOrHideSearchPatternHighlightsDelayer;
  if (!showOrHideSearchPatternHighlightsDelayer)
  {
    v4 = (ICSelectorDelayer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64268]), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", self, sel_showOrHideSearchPatternHighlightsIfNecessary, 1, 1, 0.25);
    v5 = self->_showOrHideSearchPatternHighlightsDelayer;
    self->_showOrHideSearchPatternHighlightsDelayer = v4;

    showOrHideSearchPatternHighlightsDelayer = self->_showOrHideSearchPatternHighlightsDelayer;
  }
  return showOrHideSearchPatternHighlightsDelayer;
}

- (void)showInkPickerAndEndEditingIfNecessary
{
  if (-[ICNoteEditorViewController inkPickerState](self, "inkPickerState") != 2)
    -[ICNoteEditorViewController showInkPicker:animated:](self, "showInkPicker:animated:", 1, 1);
  if (-[ICNoteEditorViewController isEditing](self, "isEditing"))
    -[ICNoteEditorViewController setEditing:](self, "setEditing:", 0);
  -[ICNoteEditorViewController updateInlineDrawingsPaletteVisibility](self, "updateInlineDrawingsPaletteVisibility");
}

- (void)updateInlineDrawingsPaletteVisibility
{
  void *v3;
  void *v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSRange v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  NSRange v13;
  NSRange v14;

  -[ICNoteEditorBaseViewController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ic_range");
  v7 = v6;

  v13.location = -[ICNoteEditorViewController visibleRange](self, "visibleRange");
  ++v13.length;
  v14.location = v5;
  v14.length = v7;
  v8 = NSIntersectionRange(v13, v14);
  -[ICNoteEditorBaseViewController note](self, "note");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0DC10F8];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__ICNoteEditorViewController_updateInlineDrawingsPaletteVisibility__block_invoke;
  v12[3] = &unk_1EA7DDC18;
  v12[4] = self;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v11, v8.location, v8.length, 0, v12);

}

void __67__ICNoteEditorViewController_updateInlineDrawingsPaletteVisibility__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "inkPaletteController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updatePaletteVisibilityToVisible:", objc_msgSend(v4, "isInkPaletteShowing"));

  }
}

- (id)currentValidToolForNewDrawingOrNote
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  -[ICNoteEditorViewController inkPaletteController](self, "inkPaletteController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return v3;
  if (-[ICNoteEditorBaseViewController isEditingOnSystemPaper](self, "isEditingOnSystemPaper")
    && ICInternalSettingsIsSystemPaperEnabled())
  {
    -[ICNoteEditorViewController inkPaletteController](self, "inkPaletteController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorCorrectedTool");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v3 = (void *)v5;

    return v3;
  }
  -[ICNoteEditorViewController inkPaletteController](self, "inkPaletteController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedTool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[ICNoteEditorViewController inkPaletteController](self, "inkPaletteController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isHandwritingToolSelected"))
    {

    }
    else
    {
      -[ICNoteEditorViewController inkPaletteController](self, "inkPaletteController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isCanvasGenerationToolSelected");

      if ((v9 & 1) == 0)
      {

LABEL_12:
        -[ICNoteEditorViewController lastSavedInkingTool](self, "lastSavedInkingTool");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
  }
  if (!v3)
    goto LABEL_12;
LABEL_13:
  if (-[ICNoteEditorViewController isNewInk:](self, "isNewInk:", v3)
    && -[ICNoteEditorViewController noteHasAnyPencilKitDrawings](self, "noteHasAnyPencilKitDrawings"))
  {
    -[ICNoteEditorViewController inkPaletteController](self, "inkPaletteController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resetToPencilKitCompatibleInk");

    -[ICNoteEditorViewController inkPaletteController](self, "inkPaletteController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "selectedTool");
    v12 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v12;
  }
  if (!v3)
  {
    v13 = objc_alloc(MEMORY[0x1E0CD11B0]);
    v14 = *MEMORY[0x1E0CD1310];
    -[ICNoteEditorViewController defaultInkColor](self, "defaultInkColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v13, "initWithInkType:color:", v14, v4);
    goto LABEL_18;
  }
  return v3;
}

- (PKTool)lastSavedInkingTool
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataForKey:", CFSTR("currentInkData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v21 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v21);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v21;
    if (v4)
    {
      if ((objc_msgSend(v4, "_isHandwritingInk") & 1) != 0)
        v6 = objc_alloc_init(MEMORY[0x1E0CD1190]);
      else
        v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CD11B0]), "_initWithInk:", v4);
      v15 = v6;
    }
    else
    {
      v16 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[ICNoteEditorViewController lastSavedInkingTool].cold.1();

      v15 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryForKey:", CFSTR("currentInkTool"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringForKey:", CFSTR("currentInkTool"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("inkType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("color"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("width"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v9 && v10 && v11)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "ic_colorFromString:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = objc_alloc(MEMORY[0x1E0CD11B0]);
        objc_msgSend(v12, "doubleValue");
        v15 = (id)objc_msgSend(v14, "initWithInkType:color:width:", v9, v13);
      }
      else
      {
        v19 = os_log_create("com.apple.notes", "PencilKit");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v10;
          _os_log_impl(&dword_1DD7B0000, v19, OS_LOG_TYPE_DEFAULT, "Could not create ink color from serialized color string: %@", buf, 0xCu);
        }

        v15 = 0;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD1190], "className");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v4, "isEqualToString:", v17);

      if (v18)
        v15 = objc_alloc_init(MEMORY[0x1E0CD1190]);
      else
        v15 = 0;
    }

  }
  return (PKTool *)v15;
}

- (void)saveToolAsCurrentTool:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = (void *)MEMORY[0x1E0CB36F8];
      objc_msgSend(v3, "ink");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v9;

      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v8 = objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKey:](v8, "setObject:forKey:", v6, CFSTR("currentInkData"));
      }
      else
      {
        v8 = os_log_create("com.apple.notes", "PencilKit");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[ICNoteEditorViewController saveToolAsCurrentTool:].cold.1();
      }

    }
    else
    {
      v7 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[ICNoteEditorViewController saveToolAsCurrentTool:].cold.2();
    }

  }
}

- (id)defaultInkColor
{
  void *v3;
  BOOL v4;
  void *v5;

  -[ICNoteEditorViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "ic_isDark"))
  {

    goto LABEL_5;
  }
  v4 = -[ICNoteEditorViewController shouldForceLightContent](self, "shouldForceLightContent");

  if (v4)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (void)createInkPickerControllerIfNecessary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_1DD7B0000, v0, v1, "Hey this should never happen!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)showInkPicker:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  if (-[ICNoteEditorViewController isInkPickerShowing](self, "isInkPickerShowing"))
  {
    -[ICNoteEditorViewController doneEditing:](self, "doneEditing:", v10);
  }
  else
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0D64DE8], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isQuickNoteSessionActive");

      if (v6)
      {
        v7 = -[ICNoteEditorViewController addQuickNoteWithPencil:](self, "addQuickNoteWithPencil:", 1);
      }
      else
      {
        -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (id)objc_msgSend(v8, "showNewNoteWithApproach:sender:animated:", 2, self, 1);

      }
    }
    -[ICNoteEditorViewController showStyleSelectorPopover:animated:sender:](self, "showStyleSelectorPopover:animated:sender:", 0, 1, v10);
    -[ICNoteEditorViewController setInkPickerState:](self, "setInkPickerState:", 1);
    -[ICNoteEditorViewController showInkPickerAndEndEditingIfNecessary](self, "showInkPickerAndEndEditingIfNecessary");
    -[ICNoteEditorViewController clearTextViewSelection](self, "clearTextViewSelection");
  }

}

- (void)showInkPicker:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;

  v4 = a4;
  v5 = a3;
  if (!a3)
    goto LABEL_4;
  if (-[ICNoteEditorViewController _appearState](self, "_appearState") == 2)
  {
    -[ICNoteEditorViewController createInkPickerControllerIfNecessary](self, "createInkPickerControllerIfNecessary");
LABEL_4:
    -[ICNoteEditorViewController updateBarButtonsAnimated:](self, "updateBarButtonsAnimated:", v4);
    -[ICNoteEditorViewController inkPaletteController](self, "inkPaletteController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "showInkPalette:animated:", v5, v4);

    return;
  }
  -[ICNoteEditorViewController setShowInkPickerAfterViewAppears:](self, "setShowInkPickerAfterViewAppears:", 1);
}

- (BOOL)toggleInkPickerAnimated:(BOOL)a3
{
  void *v4;
  uint64_t v5;

  -[ICNoteEditorViewController inkPaletteController](self, "inkPaletteController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInkPaletteShowing") ^ 1;

  -[ICNoteEditorViewController showInkPicker:animated:](self, "showInkPicker:animated:", v5, 1);
  return v5;
}

- (void)hideInkPicker
{
  void *v3;

  if (-[ICNoteEditorViewController isInkPickerShowing](self, "isInkPickerShowing"))
  {
    -[ICNoteEditorViewController inkPaletteController](self, "inkPaletteController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "showInkPalette:animated:", 0, 1);

    -[ICNoteEditorViewController updateInlineDrawingsPaletteVisibility](self, "updateInlineDrawingsPaletteVisibility");
  }
}

- (BOOL)shouldEnablePencilGestures
{
  void *v3;
  uint64_t v4;
  void *v6;
  void *v7;
  char v8;

  -[ICNoteEditorViewController splitViewController](self, "splitViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "displayMode");

  if (v4 == 3)
    return 0;
  -[ICNoteEditorViewController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFindNavigatorVisible");

  return v8 ^ 1;
}

- (void)setupForFingerDrawing
{
  id v3;

  if (!-[ICNoteEditorBaseViewController isEditingOnSecureScreen](self, "isEditingOnSecureScreen")
    && (objc_msgSend(MEMORY[0x1E0DC3AC8], "prefersPencilOnlyDrawing") & 1) == 0)
  {
    -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateForFingerDrawingEnabled:", 1);

  }
}

- (void)cleanupAfterFingerDrawing
{
  id v3;

  if (!-[ICNoteEditorBaseViewController isEditingOnSecureScreen](self, "isEditingOnSecureScreen"))
  {
    -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateForFingerDrawingEnabled:", 0);

  }
}

- (id)inkPaletteUndoManager:(id)a3
{
  void *v3;
  void *v4;

  -[ICNoteEditorViewController textView](self, "textView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isNewInk:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "ink");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "inkFormatVersion") > 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)noteHasAnyPencilKitDrawings
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[ICNoteEditorBaseViewController note](self, "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__ICNoteEditorViewController_noteHasAnyPencilKitDrawings__block_invoke;
  v4[3] = &unk_1EA7DD4E8;
  v4[4] = &v5;
  objc_msgSend(v2, "enumerateAttachmentsInOrderUsingBlock:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __57__ICNoteEditorViewController_noteHasAnyPencilKitDrawings__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(a2, "isPencilKitDrawing");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (void)inkPalette:(id)a3 didPickTool:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  if (-[ICNoteEditorViewController isNewInk:](self, "isNewInk:", v7)
    && -[ICNoteEditorViewController noteHasAnyPencilKitDrawings](self, "noteHasAnyPencilKitDrawings"))
  {
    -[ICNoteEditorViewController upgradePencilKitDrawingsForNewInksPromptingIfNecessary](self, "upgradePencilKitDrawingsForNewInksPromptingIfNecessary");
  }
  -[ICNoteEditorViewController textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setTool:", v7);

  v9 = -[ICNoteEditorViewController isEditing](self, "isEditing");
  if (v9)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ink");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "_isHandwritingInk") ^ 1;

  }
  else
  {
    v12 = 0;
  }
  -[ICNoteEditorViewController textView](self, "textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ink");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (((v9 | objc_msgSend(v14, "_isHandwritingInk") ^ 1) & 1) != 0)
  {
    v15 = 0;
  }
  else
  {
    -[ICNoteEditorViewController paletteResponder](self, "paletteResponder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v16, "isFirstResponder") ^ 1;

  }
  if ((v12 | v15) == 1 && objc_msgSend(v6, "isInkPaletteShowing"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__ICNoteEditorViewController_inkPalette_didPickTool___block_invoke;
    block[3] = &unk_1EA7DD2D8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  -[ICNoteEditorViewController saveToolAsCurrentTool:](self, "saveToolAsCurrentTool:", v7);

}

void __53__ICNoteEditorViewController_inkPalette_didPickTool___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "paletteResponder");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "becomeFirstResponder");

}

- (void)upgradePencilKitDrawingsForNewInksPromptingIfNecessary
{
  _TtC11NotesEditor28ICInlineDrawingUpgradeHelper *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _TtC11NotesEditor28ICInlineDrawingUpgradeHelper *v8;

  v3 = [_TtC11NotesEditor28ICInlineDrawingUpgradeHelper alloc];
  -[ICNoteEditorBaseViewController note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICInlineDrawingUpgradeHelper initWithNote:managedObjectContext:textView:](v3, "initWithNote:managedObjectContext:textView:", v4, v6, v7);

  -[ICNoteEditorViewController upgradeAllAttachmentsInNoteWithUpgradeHelper:forSydney:](self, "upgradeAllAttachmentsInNoteWithUpgradeHelper:forSydney:", v8, 1);
}

- (void)inkPalette:(id)a3 didChangeColor:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[ICNoteEditorViewController textView](self, "textView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setSelectedInkColor:", v5);

}

- (void)inkPaletteDidToggleRuler:(id)a3 isRulerActive:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  -[ICNoteEditorViewController textView](self, "textView", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRulerEnabled:", v4);

}

- (id)inkPaletteButtonView:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!-[ICNoteEditorBaseViewController isEditingOnSystemPaper](self, "isEditingOnSystemPaper")
    || (objc_opt_respondsToSelector() & 1) == 0
    || (-[ICNoteEditorViewController app_systemPaperInkPaletteButtonView:](self, "app_systemPaperInkPaletteButtonView:", v4), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)inkPalette:(id)a3 shouldResignFirstResponder:(id)a4
{
  return 1;
}

- (void)inkPalette:(id)a3 willShowAnimated:(BOOL)a4
{
  id v4;

  -[ICNoteEditorViewController attributionSidebarController](self, "attributionSidebarController", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hideSidebarAnimated:", 1);

}

- (void)inkPalette:(id)a3 didShowAnimated:(BOOL)a4
{
  void *v5;
  void *v6;
  id v7;

  -[ICNoteEditorViewController updateBarButtonsAnimated:](self, "updateBarButtonsAnimated:", a4);
  -[ICNoteEditorViewController setupForFingerDrawing](self, "setupForFingerDrawing");
  -[ICNoteEditorViewController updateInlineDrawingsPaletteVisibility](self, "updateInlineDrawingsPaletteVisibility");
  -[ICNoteEditorViewController showOrHideSearchPatternHighlightsIfNecessary](self, "showOrHideSearchPatternHighlightsIfNecessary");
  -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateHostedNotesAppearance");

  UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICNoteEditorViewController ppt_inkPickerDidShow](self, "ppt_inkPickerDidShow");
  -[ICNoteEditorViewController navigationController](self, "navigationController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toolbar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityElementsHidden:", 1);

}

- (void)inkPalette:(id)a3 willHideAnimated:(BOOL)a4
{
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[ICNoteEditorViewController textView](self, "textView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_isHandwritingInk");

  if ((v7 & 1) == 0)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShouldAvoidBecomingFirstResponder:", 1);

  }
}

- (void)inkPalette:(id)a3 didHideAnimated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a4;
  -[ICNoteEditorViewController textView](self, "textView", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ink");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_isHandwritingInk");

  if ((v8 & 1) == 0)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShouldAvoidBecomingFirstResponder:", 0);

  }
  -[ICNoteEditorViewController updateInlineDrawingsPaletteVisibility](self, "updateInlineDrawingsPaletteVisibility");
  -[ICNoteEditorViewController updateBarButtonsAnimated:](self, "updateBarButtonsAnimated:", v4);
  -[ICNoteEditorViewController textView](self, "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRulerEnabled:", 0);

  v11 = (void *)MEMORY[0x1E0D64C18];
  -[ICNoteEditorViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sharedToolPickerForWindow:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRulerActive:", 0);

  -[ICNoteEditorViewController cleanupAfterFingerDrawing](self, "cleanupAfterFingerDrawing");
  -[ICNoteEditorViewController showOrHideSearchPatternHighlightsIfNecessary](self, "showOrHideSearchPatternHighlightsIfNecessary");
  -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateHostedNotesAppearance");

  -[ICNoteEditorViewController navigationController](self, "navigationController");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "toolbar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccessibilityElementsHidden:", 0);

}

- (void)inkPaletteDidHideWithDoneButton:(id)a3
{
  -[ICNoteEditorViewController updateBarButtonsAnimated:](self, "updateBarButtonsAnimated:", 0);
}

- (int64_t)icasPalettePositionFromPKPalettePosition:(int64_t)a3
{
  if ((unint64_t)a3 > 9)
    return 0;
  else
    return qword_1DD9E7100[a3];
}

- (void)inkPalette:(id)a3 didChangePalettePositionStart:(int64_t)a4 end:(int64_t)a5
{
  void *v8;
  void *v9;

  if (a4 != a5)
  {
    -[ICNoteEditorViewController eventReporter](self, "eventReporter", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorBaseViewController note](self, "note");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "submitPaletteEngagementEventForNote:startPosition:endPosition:", v9, -[ICNoteEditorViewController icasPalettePositionFromPKPalettePosition:](self, "icasPalettePositionFromPKPalettePosition:", a4), -[ICNoteEditorViewController icasPalettePositionFromPKPalettePosition:](self, "icasPalettePositionFromPKPalettePosition:", a5));

    performAfterExistingTransaction();
  }
}

void __75__ICNoteEditorViewController_inkPalette_didChangePalettePositionStart_end___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "viewControllerManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateHostedNotesAppearance");

}

- (UIView)rulerHostingView
{
  UIView *rulerHostingView;
  UIView *v4;
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
  UIView *v22;

  rulerHostingView = self->_rulerHostingView;
  if (!rulerHostingView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ICNoteEditorViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v4);

    -[ICNoteEditorViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3718];
    -[ICNoteEditorViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 3, 0, v8, 15, 1.0, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addConstraint:", v9);

    -[ICNoteEditorViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB3718];
    -[ICNoteEditorViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 4, 0, v12, 16, 1.0, -60.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addConstraint:", v13);

    -[ICNoteEditorViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB3718];
    -[ICNoteEditorViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 1, 0, v16, 1, 1.0, 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addConstraint:", v17);

    -[ICNoteEditorViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB3718];
    -[ICNoteEditorViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 2, 0, v20, 2, 1.0, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addConstraint:", v21);

    v22 = self->_rulerHostingView;
    self->_rulerHostingView = v4;

    rulerHostingView = self->_rulerHostingView;
  }
  return rulerHostingView;
}

- (BOOL)rulerHostWantsSharedRuler
{
  return 1;
}

- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  id v4;

  -[ICNoteEditorViewController textView](self, "textView", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEditable:", 1);

}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  y = a4.y;
  x = a4.x;
  -[ICNoteEditorViewController textView](self, "textView", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "_isHandwritingInk"))
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "canBecomeFirstResponder"))
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "pointInside:withEvent:", 0, x, y);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)textViewCanAddStroke:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  void *v16;
  int v17;

  -[ICNoteEditorViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "activationState"))
  {
LABEL_12:
    v15 = 0;
    goto LABEL_13;
  }
  -[ICNoteEditorBaseViewController note](self, "note");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ICNoteEditorBaseViewController note](self, "note");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEditable");

    if ((v10 & 1) == 0)
    {
      -[ICNoteEditorBaseViewController note](self, "note");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isDeletedOrInTrash");

      if (v17)
        -[ICNoteEditorViewController showRecoverNoteAlert](self, "showRecoverNoteAlert");
      goto LABEL_12;
    }
  }
  -[ICNoteEditorViewController textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hitTestPoint");
  -[ICNoteEditorViewController inlineDrawingAttachmentForPoint:](self, "inlineDrawingAttachmentForPoint:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12
    && (objc_msgSend(v12, "typeUTI"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D63688]),
        v13,
        v14))
  {
    -[ICNoteEditorViewController showDrawingUpdateAlert](self, "showDrawingUpdateAlert");
    v15 = 0;
  }
  else
  {
    v15 = 1;
  }

LABEL_13:
  return v15;
}

- (void)setIsDrawingStroke:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_isDrawingStroke = a3;
  -[ICNoteEditorBaseViewController note](self, "note");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsDrawingStroke:", v3);

}

- (void)textViewWillBeginStroke:(id)a3 forTouch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = a4;
  v7 = a3;
  if (-[ICNoteEditorViewController wasEditingBeforeDrawing](self, "wasEditingBeforeDrawing")
    && !-[ICNoteEditorViewController isInkPickerShowing](self, "isInkPickerShowing"))
  {
    -[ICNoteEditorViewController showInkPicker:animated:](self, "showInkPicker:animated:", 1, 1);
  }
  if (!-[ICNoteEditorViewController isDrawingStroke](self, "isDrawingStroke"))
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "documentMergeController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "beginBlockingMergeForReason:textView:", 5, v10);

  }
  -[ICNoteEditorViewController setCurrentStrokeStartTouch:](self, "setCurrentStrokeStartTouch:", v6);
  -[ICNoteEditorViewController setIsDrawingStroke:](self, "setIsDrawingStroke:", 1);
  v11 = objc_msgSend(v6, "type");

  -[ICNoteEditorViewController setIsDrawingStrokeWithPencil:](self, "setIsDrawingStrokeWithPencil:", v11 == 2);
  -[ICNoteEditorViewController setDidDrawWithPencilWithoutPalette:](self, "setDidDrawWithPencilWithoutPalette:", 0);
  -[ICNoteEditorViewController updateUIEnabledStatePencilActive:](self, "updateUIEnabledStatePencilActive:", -[ICNoteEditorViewController isDrawingStrokeWithPencil](self, "isDrawingStrokeWithPencil"));
  objc_msgSend(v7, "setInputAccessoryView:", 0);

  -[ICNoteEditorViewController updateBarButtons](self, "updateBarButtons");
}

- (void)updateUIEnabledStatePencilActive:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = !a3;
  -[ICNoteEditorViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toolbar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v4);

  -[ICNoteEditorViewController navigationController](self, "navigationController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", v4);

}

- (void)textViewDidEndStroke:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;

  -[ICNoteEditorViewController updateUIEnabledStatePencilActive:](self, "updateUIEnabledStatePencilActive:", 0);
  if (-[ICNoteEditorViewController isDrawingStroke](self, "isDrawingStroke"))
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "documentMergeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorViewController textView](self, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endBlockingMergeForReason:textView:", 5, v6);

  }
  v7 = -[ICNoteEditorViewController isDrawingStrokeWithPencil](self, "isDrawingStrokeWithPencil");
  -[ICNoteEditorViewController setIsDrawingStroke:](self, "setIsDrawingStroke:", 0);
  -[ICNoteEditorViewController setIsDrawingStrokeWithPencil:](self, "setIsDrawingStrokeWithPencil:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController setDateOfLastStrokeOrNewDrawing:](self, "setDateOfLastStrokeOrNewDrawing:", v8);

  -[ICNoteEditorViewController clearTextViewSelection](self, "clearTextViewSelection");
  -[ICNoteEditorViewController currentStrokeStartTouch](self, "currentStrokeStartTouch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textView](self, "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locationInView:", v10);
  v12 = v11;
  v14 = v13;

  -[ICNoteEditorViewController inlineDrawingAttachmentForPoint:](self, "inlineDrawingAttachmentForPoint:", v12, v14);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(v24, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v24, "inlineDrawingModel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handwritingRecognitionDrawing");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
        v19 = v17;
      else
        v19 = (id)objc_msgSend(v16, "newDrawingFromMergeableData");
      v20 = v19;

      if (v7)
        v21 = 1;
      else
        v21 = 2;
      -[ICNoteEditorViewController eventReporter](self, "eventReporter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "pushInlineDrawingDataForDrawing:drawingID:tool:", v20, v23, v21);

    }
  }
  -[ICNoteEditorViewController setCurrentStrokeStartTouch:](self, "setCurrentStrokeStartTouch:", 0);
  if (v7)
  {
    if (!-[ICNoteEditorViewController isInkPickerShowing](self, "isInkPickerShowing"))
      -[ICNoteEditorViewController setDidDrawWithPencilWithoutPalette:](self, "setDidDrawWithPencilWithoutPalette:", 1);
    -[ICNoteEditorViewController updateBarButtonsAnimated:](self, "updateBarButtonsAnimated:", 1);
  }

}

- (void)undoablySwitchToPPK:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[ICNoteEditorViewController textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "setPaperEnabled:", 1);
  }
  else
  {
    objc_msgSend(v5, "setPaperEnabled:", 0);

    -[ICNoteEditorViewController textView](self, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStylusDrawingEnabled:", 1);
  }

  -[ICNoteEditorViewController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDrawingDelegate:", self);

  -[ICNoteEditorViewController undoManager](self, "undoManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "prepareWithInvocationTarget:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "undoablySwitchToPPK:", !v3);

}

- (void)textView:(id)a3 upgradeDrawingAtIndex:(unint64_t)a4 itemProviders:(id)a5 insertionLocationInDrawing:(CGPoint)a6
{
  double y;
  double x;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _TtC11NotesEditor28ICInlineDrawingUpgradeHelper *v18;
  void *v19;
  void *v20;
  os_log_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;

  y = a6.y;
  x = a6.x;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  if ((objc_msgSend(MEMORY[0x1E0D64D30], "isEnabled") & 1) != 0)
  {
    -[ICNoteEditorViewController textView](self, "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textStorage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], a4, 0);
    v13 = objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    ICCheckedDynamicCast();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "attachment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[ICNoteEditorBaseViewController note](self, "note");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "managedObjectContext");
      v17 = objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = [_TtC11NotesEditor28ICInlineDrawingUpgradeHelper alloc];
        -[ICNoteEditorBaseViewController note](self, "note");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNoteEditorViewController textView](self, "textView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[ICInlineDrawingUpgradeHelper initWithNote:managedObjectContext:textView:](v18, "initWithNote:managedObjectContext:textView:", v19, v17, v20);

        objc_msgSend(v14, "attachment");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject upgradeWithAttachment:itemProviders:itemsLocation:](v21, "upgradeWithAttachment:itemProviders:itemsLocation:", v22, v10, x, y);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          -[ICNoteEditorViewController upgradeAllAttachmentsInNoteWithUpgradeHelper:](self, "upgradeAllAttachmentsInNoteWithUpgradeHelper:", v21);
        }
        else
        {
          v24 = os_log_create("com.apple.notes", "SystemPaper");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v14, "attachment");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "loggingDescription");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = 138412290;
            v28 = v26;
            _os_log_impl(&dword_1DD7B0000, v24, OS_LOG_TYPE_DEFAULT, "Upgrading drawing failed for: %@", (uint8_t *)&v27, 0xCu);

          }
        }

      }
      else
      {
        v21 = os_log_create("com.apple.notes", "SystemPaper");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_1DD7B0000, v21, OS_LOG_TYPE_DEFAULT, "Unable to upgrade drawing since note didn't have a MOC", (uint8_t *)&v27, 2u);
        }
      }

    }
    else
    {
      v17 = os_log_create("com.apple.notes", "SystemPaper");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_1DD7B0000, v17, OS_LOG_TYPE_DEFAULT, "Unable to upgrade drawing since inline drawing attachment wasn't found", (uint8_t *)&v27, 2u);
      }
    }

  }
  else
  {
    v13 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1DD7B0000, v13, OS_LOG_TYPE_DEFAULT, "Unable to upgrade drawing since Paper isn't enabled", (uint8_t *)&v27, 2u);
    }
  }

}

- (void)upgradeAllAttachmentsInNoteWithUpgradeHelper:(id)a3
{
  -[ICNoteEditorViewController upgradeAllAttachmentsInNoteWithUpgradeHelper:forSydney:](self, "upgradeAllAttachmentsInNoteWithUpgradeHelper:forSydney:", a3, 0);
}

- (void)upgradeAllAttachmentsInNoteWithUpgradeHelper:(id)a3 forSydney:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  id *v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
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
  dispatch_time_t v29;
  _QWORD block[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD aBlock[5];
  id v36;

  v4 = a4;
  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__ICNoteEditorViewController_upgradeAllAttachmentsInNoteWithUpgradeHelper_forSydney___block_invoke;
  aBlock[3] = &unk_1EA7DD498;
  aBlock[4] = self;
  v7 = v6;
  v36 = v7;
  v8 = _Block_copy(aBlock);
  v9 = -[ICNoteEditorBaseViewController isEditingOnSystemPaper](self, "isEditingOnSystemPaper");
  v10 = (id *)MEMORY[0x1E0D643C0];
  if (!v4)
    v10 = (id *)MEMORY[0x1E0D643B8];
  v11 = *v10;
  v12 = (id)*MEMORY[0x1E0D643B0];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLForKey:", v11);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLForKey:", v12);

  if (v9 || (v14 & 1) != 0 || (v16 & 1) != 0)
  {
    v29 = dispatch_time(0, 10000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__ICNoteEditorViewController_upgradeAllAttachmentsInNoteWithUpgradeHelper_forSydney___block_invoke_3;
    block[3] = &unk_1EA7DDE08;
    v31 = v8;
    dispatch_after(v29, MEMORY[0x1E0C80D38], block);
    v24 = v31;
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Drawings Will Be Updated"), &stru_1EA7E9860, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v20 = v11;
    v21 = v8;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Drawings will be updated as needed to allow using new drawing features.\n\nOnly devices upgraded to the latest version of iOS, iPadOS, or visionOS will be able to edit updated drawings."), &stru_1EA7E9860, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "alertControllerWithTitle:message:preferredStyle:", v19, v23, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v21;
    v11 = v20;

    v25 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA7E9860, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __85__ICNoteEditorViewController_upgradeAllAttachmentsInNoteWithUpgradeHelper_forSydney___block_invoke_2;
    v32[3] = &unk_1EA7DEB80;
    v34 = v8;
    v33 = v12;
    objc_msgSend(v25, "actionWithTitle:style:handler:", v27, 0, v32);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addAction:", v28);

    -[ICNoteEditorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v24, 1, 0);
  }

}

uint64_t __85__ICNoteEditorViewController_upgradeAllAttachmentsInNoteWithUpgradeHelper_forSydney___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "saveInlineDrawings");
  objc_msgSend(*(id *)(a1 + 32), "undoablySwitchToPPK:", 1);
  objc_msgSend(*(id *)(a1 + 40), "upgradeAllAttachmentsInNote");
  return objc_msgSend(*(id *)(a1 + 32), "becomeFirstResponder");
}

void __85__ICNoteEditorViewController_upgradeAllAttachmentsInNoteWithUpgradeHelper_forSydney___block_invoke_2(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", 1, *(_QWORD *)(a1 + 32));

}

uint64_t __85__ICNoteEditorViewController_upgradeAllAttachmentsInNoteWithUpgradeHelper_forSydney___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)inlineDrawingAttachmentForPoint:(CGPoint)a3
{
  double y;
  CGFloat x;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSRange v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v21[9];
  uint64_t v22;
  id *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  NSRange v34;
  NSRange v35;

  y = a3.y;
  x = a3.x;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__4;
  v32 = __Block_byref_object_dispose__4;
  v33 = 0;
  v22 = 0;
  v23 = (id *)&v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__4;
  v26 = __Block_byref_object_dispose__4;
  v27 = 0;
  -[ICNoteEditorViewController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textContainerInset");
  v8 = v7;

  -[ICNoteEditorBaseViewController note](self, "note");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "ic_range");
  v13 = v12;

  v34.location = -[ICNoteEditorViewController visibleRange](self, "visibleRange");
  ++v34.length;
  v35.location = v11;
  v35.length = v13;
  v14 = NSIntersectionRange(v34, v35);
  -[ICNoteEditorBaseViewController note](self, "note");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "textStorage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0DC10F8];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __62__ICNoteEditorViewController_inlineDrawingAttachmentForPoint___block_invoke;
  v21[3] = &unk_1EA7DEBA8;
  v21[4] = self;
  v21[5] = &v28;
  *(CGFloat *)&v21[7] = x;
  *(double *)&v21[8] = y - v8;
  v21[6] = &v22;
  objc_msgSend(v16, "enumerateAttribute:inRange:options:usingBlock:", v17, v14.location, v14.length, 0, v21);

  v18 = v23[5];
  if (!v18)
  {
    objc_storeStrong(v23 + 5, (id)v29[5]);
    v18 = v23[5];
  }
  v19 = v18;
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v19;
}

void __62__ICNoteEditorViewController_inlineDrawingAttachmentForPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int IsTextKit2Enabled;
  void *v14;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  CGRect v39;
  CGRect v40;

  v9 = a2;
  objc_opt_class();
  ICDynamicCast();
  v38 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v38, "attachment");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
    objc_msgSend(*(id *)(a1 + 32), "textView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (IsTextKit2Enabled)
    {
      objc_msgSend(v14, "ic_rectForRange:", a3, a4);
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
    }
    else
    {
      objc_msgSend(v14, "layoutManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "glyphRangeForCharacterRange:actualCharacterRange:", a3, a4, 0);
      v27 = v26;

      objc_msgSend(*(id *)(a1 + 32), "textView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "layoutManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "textView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "textContainer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "boundingRectForGlyphRange:inTextContainer:", v25, v27, v30);
      v17 = v31;
      v19 = v32;
      v21 = v33;
      v23 = v34;

    }
    v39.origin.x = v17;
    v39.origin.y = v19;
    v39.size.width = v21;
    v39.size.height = v23;
    if (CGRectGetMinY(v39) <= *(double *)(a1 + 64))
    {
      v40.origin.x = v17;
      v40.origin.y = v19;
      v40.size.width = v21;
      v40.size.height = v23;
      if (CGRectGetMaxY(v40) >= *(double *)(a1 + 64))
      {
        objc_msgSend(v38, "attachment");
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v37 = *(void **)(v36 + 40);
        *(_QWORD *)(v36 + 40) = v35;

        *a5 = 1;
      }
    }
  }

}

- (BOOL)textView:(id)a3 canAddDrawingAtIndex:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;

  v6 = a3;
  -[ICNoteEditorBaseViewController note](self, "note");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ICNoteEditorBaseViewController note](self, "note");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEditable");

    if (!v10)
      goto LABEL_4;
  }
  -[ICNoteEditorBaseViewController note](self, "note");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textStorage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D1CF60], a4, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
LABEL_4:
    -[ICNoteEditorBaseViewController note](self, "note");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isDeletedOrInTrash");

    if (v15)
      -[ICNoteEditorViewController showRecoverNoteAlert](self, "showRecoverNoteAlert");
  }
  else
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18
      || (v19 = (void *)v18,
          -[ICNoteEditorBaseViewController note](self, "note"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v20, "canAddAttachment"),
          v20,
          v19,
          (v21 & 1) != 0))
    {
      v16 = 1;
      goto LABEL_7;
    }
    -[ICNoteEditorViewController warnUserAttachmentLimitExceeded](self, "warnUserAttachmentLimitExceeded");
  }
  v16 = 0;
LABEL_7:

  return v16;
}

- (BOOL)textViewCanSelectDrawing:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  int v7;

  -[ICNoteEditorBaseViewController note](self, "note", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEditable");

  if ((v5 & 1) == 0)
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isDeletedOrInTrash");

    if (v7)
      -[ICNoteEditorViewController showRecoverNoteAlert](self, "showRecoverNoteAlert");
  }
  return v5;
}

- (void)textView:(id)a3 willAddDrawingAtIndex:(unint64_t)a4
{
  char v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[ICNoteEditorViewController ensureValidInkForNewDrawingOrNote](self, "ensureValidInkForNewDrawingOrNote", a3);
  -[ICNoteEditorViewController addNewNoteIfNeeded](self, "addNewNoteIfNeeded");
  v6 = objc_msgSend(MEMORY[0x1E0DC3AC8], "prefersPencilOnlyDrawing");
  -[ICNoteEditorViewController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if ((v6 & 1) == 0 && a4 + 1 < v9)
  {
    -[ICNoteEditorViewController setInkPickerState:](self, "setInkPickerState:", 1);
    -[ICNoteEditorViewController showInkPickerAndEndEditingIfNecessary](self, "showInkPickerAndEndEditingIfNecessary");
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController setDateOfLastStrokeOrNewDrawing:](self, "setDateOfLastStrokeOrNewDrawing:", v10);

  objc_msgSend(MEMORY[0x1E0D64C38], "updateTouchPredictionPointsFromOverride");
  objc_opt_class();
  -[ICNoteEditorViewController textView](self, "textView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textContentStorage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlwaysEnumerateTrailingParagraph:", 1);

}

- (void)textView:(id)a3 didRemoveDrawingAtIndex:(unint64_t)a4
{
  id v5;

  -[ICNoteEditorViewController textView](self, "textView", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorViewController textViewDidChange:](self, "textViewDidChange:", v5);

}

- (id)textView:(id)a3 newAttachmentForFileType:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  Class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a4;
  -[ICNoteEditorBaseViewController note](self, "note");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEditable");

  if (!v7)
    goto LABEL_7;
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CD12D8]))
  {
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CD12E0]))
    {
      -[ICNoteEditorBaseViewController note](self, "note");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "account");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ensureCriticalPaperDirectoriesExist");

      -[ICNoteEditorBaseViewController note](self, "note");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSystemPaperAttachmentWithIdentifier:", v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "managedObjectContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ic_save");
      v10 = (Class *)0x1E0D64D30;
      goto LABEL_6;
    }
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  -[ICNoteEditorBaseViewController note](self, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addInlineDrawingAttachmentWithAnalytics:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (Class *)0x1E0D64C40;
LABEL_6:

  v16 = (void *)objc_msgSend(objc_alloc(*v10), "initWithAttachment:", v9);
LABEL_8:

  return v16;
}

- (void)showHandwritingDebug:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[ICNoteEditorViewController handwritingDebugPresenter](self, "handwritingDebugPresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64BF8]), "initWithPresentingViewController:presentationStyle:delegate:", self, v6, self);
    -[ICNoteEditorViewController setHandwritingDebugPresenter:](self, "setHandwritingDebugPresenter:", v7);

  }
  -[ICNoteEditorViewController handwritingDebugPresenter](self, "handwritingDebugPresenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v3)
  {
    objc_msgSend(v8, "show");

  }
  else
  {
    objc_msgSend(v8, "hide");

    -[ICNoteEditorViewController setHandwritingDebugPresenter:](self, "setHandwritingDebugPresenter:", 0);
  }
}

- (id)radarTitleForHandwritingDebug
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[ICNoteEditorBaseViewController note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringWithFormat:", CFSTR("Handwriting recognition: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)drawingsForHandwritingDebug
{
  void *v2;
  void *v3;

  -[ICNoteEditorBaseViewController note](self, "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allDrawings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)handwritingDebugShouldClose
{
  -[ICNoteEditorViewController showHandwritingDebug:](self, "showHandwritingDebug:", 0);
}

- (void)performAddCollaboratorsActivity:(id)a3
{
  -[ICNoteEditorViewController _iCloudShareButtonPressed:](self, "_iCloudShareButtonPressed:", 0);
}

- (id)titleForAddCollaboratorsActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[ICNoteEditorBaseViewController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__ICNoteEditorViewController_titleForAddCollaboratorsActivity___block_invoke;
  v10[3] = &unk_1EA7DE5C8;
  v10[4] = self;
  v10[5] = &v11;
  objc_msgSend(v6, "performBlockAndWait:", v10);

  if (*((_BYTE *)v12 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("View Participants"), &stru_1EA7E9860, 0);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("person.crop.circle.badge.plus");
  }
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __63__ICNoteEditorViewController_titleForAddCollaboratorsActivity___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "note");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isSharedViaICloud");

}

- (id)systemImageNameForAddCollaboratorsActivity:(id)a3
{
  void *v3;
  int v4;

  -[ICNoteEditorBaseViewController note](self, "note", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSharedViaICloud");

  if (v4)
    return CFSTR("person.crop.circle.badge.checkmark");
  else
    return CFSTR("person.crop.circle.badge.plus");
}

- (void)createImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  const __CFData *v10;
  CGImageSourceRef v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  CGImageSource *v17;
  uint64_t v18;
  const __CFDictionary *v19;
  CGImageRef ThumbnailAtIndex;
  CGImage *v21;
  void *v22;
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (ICInternalSettingsIsGenerationToolEnabled())
  {
    objc_opt_class();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "attachmentType") == 3)
    {
      v7 = objc_msgSend(v6, "isPasswordProtected");
      objc_msgSend(v6, "media");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if ((v7 & 1) != 0)
      {
        objc_msgSend(v8, "data");
        v10 = (const __CFData *)objc_claimAutoreleasedReturnValue();
        v11 = CGImageSourceCreateWithData(v10, 0);
      }
      else
      {
        objc_msgSend(v8, "mediaURL");
        v10 = (const __CFData *)objc_claimAutoreleasedReturnValue();
        v11 = CGImageSourceCreateWithURL(v10, 0);
      }
      v17 = v11;

      if (v17)
      {
        v18 = *MEMORY[0x1E0CBD190];
        v23[0] = *MEMORY[0x1E0CBD2A0];
        v23[1] = v18;
        v24[0] = &unk_1EA821DD8;
        v24[1] = MEMORY[0x1E0C9AAB0];
        v23[2] = *MEMORY[0x1E0CBD178];
        v24[2] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
        v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v17, 0, v19);
        if (ThumbnailAtIndex)
        {
          v21 = ThumbnailAtIndex;
          -[ICNoteEditorViewController paperTextAttachmentManager](self, "paperTextAttachmentManager");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "insertMagicGenerativePlaygroundWithImage:", v21);

          CGImageRelease(v21);
        }
        CFRelease(v17);

      }
    }
    else
    {
      -[ICNoteEditorViewController textView](self, "textView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "selectedText");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v13, "length");
      -[ICNoteEditorViewController paperTextAttachmentManager](self, "paperTextAttachmentManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v14)
        objc_msgSend(v15, "insertMagicGenerativePlaygroundWithText:", v13);
      else
        objc_msgSend(v15, "insertMagicGenerativePlaygroundWithAutomaticContent");

    }
  }

}

- (void)mentionInsertedInNote:(id)a3 mentionID:(id)a4 participantID:(id)a5 viaAutoComplete:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "submitMentionAddEventForNote:mentionID:participantID:viaAutoComplete:", v12, v11, v10, v6);

}

- (void)inlineAttachmentDeleted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D63738]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isMentionAttachment"))
  {
    -[ICNoteEditorViewController eventReporter](self, "eventReporter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorBaseViewController note](self, "note");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "submitMentionDeleteEvent:", v8);
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend(v9, "isHashtagAttachment"))
  {
    -[ICNoteEditorViewController eventReporter](self, "eventReporter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteEditorBaseViewController note](self, "note");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "submitHashtagDeleteEvent:approachEnum:", v8, 4);
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v9, "accessibilityAnnounceDeletionWithVoiceOver");

}

- (void)hashtagInsertedInNote:(id)a3 tokenContentIdentifier:(id)a4 viaAutoComplete:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[ICNoteEditorViewController eventReporter](self, "eventReporter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "submitHashtagAddEventForNote:tokenContentIdentifier:viaAutoComplete:", v9, v8, v5);

}

- (id)noteEditorNavigationItemConfigurationTableAttachmentViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  -[ICNoteEditorViewController auxiliaryResponder](self, "auxiliaryResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNoteEditorViewController getTableControllerFor:](self, "getTableControllerFor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 addNoteFromBarButtonItem:(id)a4 event:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
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
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id from;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ICNoteEditorBaseViewController note](self, "note");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_3;
  v12 = (void *)v11;
  -[ICNoteEditorBaseViewController note](self, "note");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63A50], "currentAttachment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "note");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 == v15)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v9);
    v16 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Stop Recording?"), &stru_1EA7E9860, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Are you sure you want to create a new note? It will stop audio recording."), &stru_1EA7E9860, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "alertControllerWithTitle:message:preferredStyle:", v18, v20, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA7E9860, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __99__ICNoteEditorViewController_noteEditorNavigationItemConfiguration_addNoteFromBarButtonItem_event___block_invoke;
    v30[3] = &unk_1EA7DEBF8;
    objc_copyWeak(&v32, &location);
    objc_copyWeak(&v33, &from);
    v31 = v10;
    objc_msgSend(v22, "actionWithTitle:style:handler:", v24, 0, v30);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addAction:", v25);

    v26 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1EA7E9860, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "actionWithTitle:style:handler:", v28, 1, &__block_literal_global_1018);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addAction:", v29);

    -[ICNoteEditorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v21, 1, 0);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v32);

    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
LABEL_3:
    -[ICNoteEditorViewController addNote:event:shouldInstrumentAsNewNoteAffordanceUsage:](self, "addNote:event:shouldInstrumentAsNewNoteAffordanceUsage:", v9, v10, 1);
  }

}

void __99__ICNoteEditorViewController_noteEditorNavigationItemConfiguration_addNoteFromBarButtonItem_event___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D63A50];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __99__ICNoteEditorViewController_noteEditorNavigationItemConfiguration_addNoteFromBarButtonItem_event___block_invoke_2;
  v5[3] = &unk_1EA7DEBD0;
  objc_copyWeak(&v7, a1 + 5);
  objc_copyWeak(&v8, a1 + 6);
  v6 = a1[4];
  objc_msgSend(v4, "cancelCurrentAudioRecordingSessionWithCompletionHandler:", v5);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);

}

void __99__ICNoteEditorViewController_noteEditorNavigationItemConfiguration_addNoteFromBarButtonItem_event___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id WeakRetained;
  id v7;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "AudioTranscription");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __99__ICNoteEditorViewController_noteEditorNavigationItemConfiguration_addNoteFromBarButtonItem_event___block_invoke_2_cold_2();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __99__ICNoteEditorViewController_noteEditorNavigationItemConfiguration_addNoteFromBarButtonItem_event___block_invoke_2_cold_1();
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "addNote:event:shouldInstrumentAsNewNoteAffordanceUsage:", v7, *(_QWORD *)(a1 + 32), 1);

}

- (void)noteEditorNavigationItemConfiguration:(id)a3 addChecklistFromBarButtonItem:(id)a4
{
  -[ICNoteEditorViewController createTodoListItem:](self, "createTodoListItem:", a4);
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 addTableFromBarButtonItem:(id)a4
{
  -[ICNoteEditorViewController addTable:](self, "addTable:", a4);
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 changeStyleFromBarButtonItem:(id)a4
{
  -[ICNoteEditorViewController changeStyle:](self, "changeStyle:", a4);
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 closeAuxiliaryWindowFromBarButtonItem:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
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
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  id location;

  v6 = a3;
  v7 = a4;
  -[ICNoteEditorBaseViewController note](self, "note");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_3;
  v9 = (void *)v8;
  -[ICNoteEditorBaseViewController note](self, "note");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63A50], "currentAttachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "note");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v12)
  {
    objc_initWeak(&location, self);
    v14 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Stop Recording?"), &stru_1EA7E9860, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Are you sure you want to leave this note? It will stop audio recording."), &stru_1EA7E9860, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "alertControllerWithTitle:message:preferredStyle:", v16, v18, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA7E9860, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __106__ICNoteEditorViewController_noteEditorNavigationItemConfiguration_closeAuxiliaryWindowFromBarButtonItem___block_invoke;
    v31 = &unk_1EA7DEC40;
    objc_copyWeak(&v32, &location);
    objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 0, &v28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addAction:", v23, v28, v29, v30, v31);

    v24 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1EA7E9860, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "actionWithTitle:style:handler:", v26, 1, &__block_literal_global_1021);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addAction:", v27);

    -[ICNoteEditorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, 1, 0);
    objc_destroyWeak(&v32);

    objc_destroyWeak(&location);
  }
  else
  {
LABEL_3:
    -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "closeAuxiliaryWindow");

  }
}

void __106__ICNoteEditorViewController_noteEditorNavigationItemConfiguration_closeAuxiliaryWindowFromBarButtonItem___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "viewControllerManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "closeAuxiliaryWindow");

}

- (void)noteEditorNavigationItemConfiguration:(id)a3 deleteFromBarButtonItem:(id)a4
{
  -[ICNoteEditorViewController deleteCurrentNote:](self, "deleteCurrentNote:", a4);
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 doneEditingFromBarButtonItem:(id)a4
{
  -[ICNoteEditorViewController doneEditing:](self, "doneEditing:", a4);
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 inlineSketchFromBarButtonItem:(id)a4
{
  -[ICNoteEditorViewController showInkPicker:](self, "showInkPicker:", a4);
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 moveFromBarButtonItem:(id)a4
{
  -[ICNoteEditorViewController moveToFolderPressed:](self, "moveToFolderPressed:", a4);
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 quickNoteShowAllNotesFromBarButtonItem:(id)a4
{
  -[ICNoteEditorViewController quickNoteAllNotes:](self, "quickNoteAllNotes:", a4);
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 quickNoteDidCancelFromBarButtonItem:(id)a4
{
  -[ICNoteEditorViewController cancelFromSystemPaperCard:](self, "cancelFromSystemPaperCard:", a4);
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 quickNoteDidSaveFromBarButtonItem:(id)a4
{
  -[ICNoteEditorViewController saveFromSystemPaperCard:](self, "saveFromSystemPaperCard:", a4);
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 shareFromBarButtonItem:(id)a4
{
  -[ICNoteEditorViewController shareButtonPressedWithSender:](self, "shareButtonPressedWithSender:", a4);
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 toggleLockFromBarButtonItem:(id)a4
{
  -[ICNoteEditorViewController lockBarButtonPressed:](self, "lockBarButtonPressed:", a4);
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 toggleSidebarFromBarButtonItem:(id)a4
{
  id v4;

  -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleSidebar");

}

- (void)noteEditorNavigationItemConfiguration:(id)a3 redoFromBarButtonItem:(id)a4
{
  -[ICNoteEditorViewController redoAction:](self, "redoAction:", a4);
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 undoFromBarButtonItem:(id)a4
{
  -[ICNoteEditorViewController undoAction:](self, "undoAction:", a4);
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 insertMediaWithSourceType:(unint64_t)a4 mediaBarButtonItem:(id)a5
{
  -[ICNoteEditorViewController showInsertUIForSourceType:sender:](self, "showInsertUIForSourceType:sender:", a4, a5);
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 didCompleteAnimationFromInlineSketchBarButtonItem:(id)a4
{
  -[ICNoteEditorViewController setDidDrawWithPencilWithoutPalette:](self, "setDidDrawWithPencilWithoutPalette:", 0, a4);
}

- (void)noteEditorNavigationItemConfiguration:(id)a3 insertSidecarItemWithMenuItems:(id)a4 service:(int64_t)a5 mediaBarButtonItem:(id)a6
{
  -[ICNoteEditorViewController insertSidecarItems:service:](self, "insertSidecarItems:service:", a4, a5);
}

- (void)acceleratorOriginNeedsUpdate
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  -[ICNoteEditorViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedTextRange");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[ICNoteEditorViewController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "end");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "caretRectForPosition:", v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[ICNoteEditorViewController linkAcceleratorController](self, "linkAcceleratorController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateAcceleratorOriginWith:", v7, v9, v11, v13);

}

- (BOOL)languageHasSpaces
{
  void *v2;
  char v3;

  -[ICNoteEditorViewController textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "languageHasSpaces");

  return v3;
}

- (int64_t)writingDirection
{
  void *v2;
  int64_t v3;

  -[ICNoteEditorViewController textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ic_currentWritingDirection");

  return v3;
}

- (_NSRange)lastSelectedRangeForAccelerator
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[ICNoteEditorViewController textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectedRange");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)splitViewModeChangeDidEnd:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "displayMode") != 3 && objc_msgSend(v7, "displayMode") != 5)
  {
    -[ICNoteEditorViewController linkAcceleratorController](self, "linkAcceleratorController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentLinkAcceleratorIfNecessaryWithCompletionHandler:", &__block_literal_global_1023);

  }
}

- (id)contextMenuInteraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
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
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[5];
  id v51;
  _QWORD v52[4];
  id v53;
  ICNoteEditorViewController *v54;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Open Note"), &stru_1EA7E9860, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke;
  v52[3] = &unk_1EA7DEA38;
  v9 = v4;
  v53 = v9;
  v54 = self;
  objc_msgSend(v6, "ic_actionWithTitle:imageName:handler:", v8, CFSTR("note.text"), v52);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", v10);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Copy Link"), &stru_1EA7E9860, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke_2;
    v50[3] = &unk_1EA7DEA38;
    v50[4] = self;
    v51 = v9;
    objc_msgSend(v11, "ic_actionWithTitle:imageName:handler:", v13, CFSTR("doc.on.doc"), v50);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v14);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isSharedReadOnly"))
    {

    }
    else
    {
      v16 = -[ICNoteEditorBaseViewController isEditingOnSecureScreen](self, "isEditingOnSecureScreen");

      if (!v16)
      {
        v17 = (void *)MEMORY[0x1E0DC3428];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Edit Link"), &stru_1EA7E9860, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke_3;
        v48[3] = &unk_1EA7DEA38;
        v48[4] = self;
        v49 = v9;
        objc_msgSend(v17, "ic_actionWithTitle:imageName:handler:", v19, CFSTR("pencil"), v48);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v20);
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICNoteEditorBaseViewController note](self, "note");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isSharedReadOnly");

    if ((v22 & 1) == 0)
    {
      v23 = (void *)MEMORY[0x1E0DC3428];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Remove Link"), &stru_1EA7E9860, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke_4;
      v46[3] = &unk_1EA7DEA38;
      v46[4] = self;
      v47 = v9;
      objc_msgSend(v23, "ic_actionWithTitle:imageName:attributes:handler:", v25, CFSTR("trash"), 2, v46);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "addObject:", v26);
    }
  }
  objc_msgSend(v9, "tokenContentIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  NotesAppURLForNoteIdentifierOrTokenContentIdentifier();
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D639E0], "predicateForNotesMentionedInURL:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  v32 = 0;
  if (v29 && v30)
  {
    v33 = (void *)MEMORY[0x1E0D63BB8];
    objc_msgSend(v30, "managedObjectContext");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "notesMatchingPredicate:context:", v29, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "firstObject");
    v36 = objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v37 = (void *)v36;
      -[ICNoteEditorViewController notePreviewView:](self, "notePreviewView:", v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)MEMORY[0x1E0DC36B8];
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke_5;
      v44[3] = &unk_1EA7DECA8;
      v45 = v38;
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke_6;
      v42[3] = &unk_1EA7DECD0;
      v43 = v5;
      v40 = v38;
      objc_msgSend(v39, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v44, v42);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v32 = 0;
    }

  }
  return v32;
}

void __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "tokenContentIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NotesAppURLForTokenContentIdentifier();
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICExtensionSafeAPIShims openURL:originatingView:completionHandler:](ICExtensionSafeAPIShims, "openURL:originatingView:completionHandler:", v4, v3, 0);

}

void __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rangeForAttachment:", *(_QWORD *)(a1 + 40));
  v5 = v4;

  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectedRange:", v3, v5);

    objc_msgSend(*(id *)(a1 + 32), "textView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "copy:", *(_QWORD *)(a1 + 32));

  }
}

uint64_t __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "openLinkEditorForLink:", *(_QWORD *)(a1 + 40));
}

uint64_t __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rangeForAttachment:", *(_QWORD *)(a1 + 40));
  v5 = v4;

  return objc_msgSend(*(id *)(a1 + 32), "removeLinksFromRange:", v3, v5);
}

id __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke_5(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __53__ICNoteEditorViewController_contextMenuInteraction___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1EA7E9860, 0, 0, 0, *(_QWORD *)(a1 + 32));
}

- (id)notePreviewView:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICNoteEditorViewController notePreview:](self, "notePreview:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)uniqueCollapsibleSectionAffordanceExposures
{
  return -1;
}

- (int64_t)uniqueCollapsibleSectionAffordanceUsages
{
  return -1;
}

- (void)eventReporterLostSession:(id)a3
{
  ICNAEventReporter *eventReporter;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  v5 = a3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D62A18];
  objc_msgSend(v5, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeObserver:name:object:", self, v6, v7);
}

- (ICNAFindResultExposureReporter)findResultReporter
{
  ICNAFindResultExposureReporter *findResultReporter;
  id v4;
  void *v5;
  void *v6;
  ICNAFindResultExposureReporter *v7;
  ICNAFindResultExposureReporter *v8;

  findResultReporter = self->_findResultReporter;
  if (!findResultReporter)
  {
    v4 = objc_alloc(MEMORY[0x1E0D62A38]);
    -[ICNoteEditorViewController viewControllerManager](self, "viewControllerManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (ICNAFindResultExposureReporter *)objc_msgSend(v4, "initWithWindow:", v6);
    v8 = self->_findResultReporter;
    self->_findResultReporter = v7;

    findResultReporter = self->_findResultReporter;
  }
  return findResultReporter;
}

- (void)setAuxiliaryResponder:(id)a3
{
  objc_storeWeak((id *)&self->_auxiliaryResponder, a3);
}

- (void)setTextViewController:(id)a3
{
  objc_storeStrong((id *)&self->_textViewController, a3);
}

- (ICNoteEditorDelegate)delegate
{
  return (ICNoteEditorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (ICVisualAssetImportController)visualAssetImportController
{
  return self->_visualAssetImportController;
}

- (void)setStartEditingAfterViewAppears:(BOOL)a3
{
  self->_startEditingAfterViewAppears = a3;
}

- (void)setStyleSelectorInputViewPresenting:(BOOL)a3
{
  self->_styleSelectorInputViewPresenting = a3;
}

- (ICNoteEditorTextFindingController)textFindingController
{
  return self->_textFindingController;
}

- (ICAttributionSidebarController)attributionSidebarController
{
  return self->_attributionSidebarController;
}

- (void)setActivityStreamToolbar:(id)a3
{
  objc_storeStrong((id *)&self->_activityStreamToolbar, a3);
}

- (void)setDoNotAdvanceInsertionPointAfterInsertingAttachment:(BOOL)a3
{
  self->_doNotAdvanceInsertionPointAfterInsertingAttachment = a3;
}

- (NSString)hostBundleIdentifier
{
  return self->_hostBundleIdentifier;
}

- (void)setHostBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1208);
}

- (NSManagedObjectID)noteViewEventSourceObjectID
{
  return self->_noteViewEventSourceObjectID;
}

- (void)setNoteViewEventSourceObjectID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1216);
}

- (BOOL)canShowLinkBar
{
  return self->_canShowLinkBar;
}

- (BOOL)isPaperLinkBarShowing
{
  return self->_paperLinkBarShowing;
}

- (BOOL)needsToPerformInitialPaperAnimations
{
  return self->_needsToPerformInitialPaperAnimations;
}

- (void)setNeedsToPerformInitialPaperAnimations:(BOOL)a3
{
  self->_needsToPerformInitialPaperAnimations = a3;
}

- (ICPaperTextAttachmentManager)paperTextAttachmentManager
{
  return self->_paperTextAttachmentManager;
}

- (void)setPaperTextAttachmentManager:(id)a3
{
  objc_storeStrong((id *)&self->_paperTextAttachmentManager, a3);
}

- (void)setBluetoothKeyboardHintViewController:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothKeyboardHintViewController, a3);
}

- (UIBarButtonItem)collaborationBarButtonItem
{
  return self->_collaborationBarButtonItem;
}

- (BOOL)quickNoteiPhoneDidSaveOrCancel
{
  return self->_quickNoteiPhoneDidSaveOrCancel;
}

- (void)setQuickNoteiPhoneDidSaveOrCancel:(BOOL)a3
{
  self->_quickNoteiPhoneDidSaveOrCancel = a3;
}

- (ICAttachmentPresenter)quickNoteiPhoneAttachmentPresenter
{
  return self->_quickNoteiPhoneAttachmentPresenter;
}

- (void)setQuickNoteiPhoneAttachmentPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_quickNoteiPhoneAttachmentPresenter, a3);
}

- (ICNoteFormattingViewController)noteFormattingController
{
  return self->_noteFormattingController;
}

- (void)setNoteFormattingController:(id)a3
{
  objc_storeStrong((id *)&self->_noteFormattingController, a3);
}

- (void)setStyleSelectorDummyInputView:(id)a3
{
  objc_storeStrong((id *)&self->_styleSelectorDummyInputView, a3);
}

- (BOOL)suspendSelectedRangeUpdates
{
  return self->_suspendSelectedRangeUpdates;
}

- (void)setSuspendSelectedRangeUpdates:(BOOL)a3
{
  self->_suspendSelectedRangeUpdates = a3;
}

- (BOOL)suspendTapGestureRecognizer
{
  return self->_suspendTapGestureRecognizer;
}

- (void)setSuspendTapGestureRecognizer:(BOOL)a3
{
  self->_suspendTapGestureRecognizer = a3;
}

- (void)setAudioBarViewController:(id)a3
{
  objc_storeStrong((id *)&self->_audioBarViewController, a3);
}

- (ICNoteUserActivityState)noteUserActivityState
{
  return (ICNoteUserActivityState *)objc_getProperty(self, a2, 1296, 1);
}

- (NSArray)keyboardButtonItems
{
  return self->_keyboardButtonItems;
}

- (void)setKeyboardButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardButtonItems, a3);
}

- (BOOL)isEditingNewNote
{
  return self->_isEditingNewNote;
}

- (BOOL)isSettingEditing
{
  return self->_isSettingEditing;
}

- (void)setIsSettingEditing:(BOOL)a3
{
  self->_isSettingEditing = a3;
}

- (BOOL)isTogglingLock
{
  return self->_togglingLock;
}

- (void)setTogglingLock:(BOOL)a3
{
  self->_togglingLock = a3;
}

- (ICTTMergeableStringSelection)originalEndOfNote
{
  return self->_originalEndOfNote;
}

- (BOOL)isAddingImageAttachment
{
  return self->_isAddingImageAttachment;
}

- (void)setIsAddingImageAttachment:(BOOL)a3
{
  self->_isAddingImageAttachment = a3;
}

- (void)setDidEndEditingForAddingImageAttachment:(BOOL)a3
{
  self->_didEndEditingForAddingImageAttachment = a3;
}

- (BOOL)isConvertToTag
{
  return self->_isConvertToTag;
}

- (void)setIsConvertToTag:(BOOL)a3
{
  self->_isConvertToTag = a3;
}

- (NSDate)keyboardAnimateInFinishTime
{
  return self->_keyboardAnimateInFinishTime;
}

- (void)setKeyboardAnimateInFinishTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1320);
}

- (void)setInputAccessoryViewHeight:(double)a3
{
  self->_inputAccessoryViewHeight = a3;
}

- (ICCalculateRecognitionController)calculateRecognitionController
{
  return self->_calculateRecognitionController;
}

- (void)setCalculateRecognitionController:(id)a3
{
  objc_storeStrong((id *)&self->_calculateRecognitionController, a3);
}

- (ICCalculateScrubberController)calculateScrubberController
{
  return self->_calculateScrubberController;
}

- (void)setCalculateScrubberController:(id)a3
{
  objc_storeStrong((id *)&self->_calculateScrubberController, a3);
}

- (ICCalculateGraphingController)calculateGraphingController
{
  return self->_calculateGraphingController;
}

- (void)setCalculateGraphingController:(id)a3
{
  objc_storeStrong((id *)&self->_calculateGraphingController, a3);
}

- (LinkEditorViewController)linkEditorViewController
{
  return (LinkEditorViewController *)objc_loadWeakRetained((id *)&self->_linkEditorViewController);
}

- (void)setLinkEditorViewController:(id)a3
{
  objc_storeWeak((id *)&self->_linkEditorViewController, a3);
}

- (void)setPasswordEntryViewController:(id)a3
{
  objc_storeStrong((id *)&self->_passwordEntryViewController, a3);
}

- (void)setLockIconCoverViewController:(id)a3
{
  objc_storeStrong((id *)&self->_lockIconCoverViewController, a3);
}

- (void)setInvitationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_invitationViewController, a3);
}

- (double)textViewMinimumBottomInset
{
  return self->_textViewMinimumBottomInset;
}

- (void)setTextViewMinimumBottomInset:(double)a3
{
  self->_textViewMinimumBottomInset = a3;
}

- (void)setTextViewScrollIndicatorBottomInsetOverride:(double)a3
{
  self->_textViewScrollIndicatorBottomInsetOverride = a3;
}

- (double)textViewScrollIndicatorBottomInsetOverrideToRestore
{
  return self->_textViewScrollIndicatorBottomInsetOverrideToRestore;
}

- (void)setTextViewScrollIndicatorBottomInsetOverrideToRestore:(double)a3
{
  self->_textViewScrollIndicatorBottomInsetOverrideToRestore = a3;
}

- (UIAlertController)limitExceededAlertController
{
  return self->_limitExceededAlertController;
}

- (void)setLimitExceededAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_limitExceededAlertController, a3);
}

- (_NSRange)lastSelectedRange
{
  _NSRange *p_lastSelectedRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_lastSelectedRange = &self->_lastSelectedRange;
  location = self->_lastSelectedRange.location;
  length = p_lastSelectedRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setSavedScrollStates:(id)a3
{
  objc_storeStrong((id *)&self->_savedScrollStates, a3);
}

- (BOOL)shouldOverscrollScrollState
{
  return self->_shouldOverscrollScrollState;
}

- (void)setCurrentWritingDirection:(int64_t)a3
{
  self->_currentWritingDirection = a3;
}

- (ICSearchResultRegexMatchFinder)searchRegexFinder
{
  return self->_searchRegexFinder;
}

- (UITextRange)selectedTextRangeToRestoreAfterBarSourcedPopoverPresentation
{
  return self->_selectedTextRangeToRestoreAfterBarSourcedPopoverPresentation;
}

- (void)setSelectedTextRangeToRestoreAfterBarSourcedPopoverPresentation:(id)a3
{
  objc_storeStrong((id *)&self->_selectedTextRangeToRestoreAfterBarSourcedPopoverPresentation, a3);
}

- (void)setUpdateNoteUserActivityStateDelayer:(id)a3
{
  objc_storeStrong((id *)&self->_updateNoteUserActivityStateDelayer, a3);
}

- (void)setUserActivityUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityUpdateQueue, a3);
}

- (BOOL)isSelecting
{
  return self->_isSelecting;
}

- (void)setIsSelecting:(BOOL)a3
{
  self->_isSelecting = a3;
}

- (NSDate)keyboardDidShowAnimationDate
{
  return self->_keyboardDidShowAnimationDate;
}

- (void)setKeyboardDidShowAnimationDate:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardDidShowAnimationDate, a3);
}

- (BOOL)shouldBeginEditingAfterNoteUnlock
{
  return self->_shouldBeginEditingAfterNoteUnlock;
}

- (void)setShouldBeginEditingAfterNoteUnlock:(BOOL)a3
{
  self->_shouldBeginEditingAfterNoteUnlock = a3;
}

- (CGPoint)changePasswordContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_changePasswordContentOffset.x;
  y = self->_changePasswordContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setChangePasswordContentOffset:(CGPoint)a3
{
  self->_changePasswordContentOffset = a3;
}

- (BOOL)isPerformingDeleteAnimation
{
  return self->_isPerformingDeleteAnimation;
}

- (void)setIsPerformingDeleteAnimation:(BOOL)a3
{
  self->_isPerformingDeleteAnimation = a3;
}

- (BOOL)isSettingSelection
{
  return self->_isSettingSelection;
}

- (void)setIsSettingSelection:(BOOL)a3
{
  self->_isSettingSelection = a3;
}

- (ICInlineCanvasTextAttachment)selectedCanvasAttachment
{
  return (ICInlineCanvasTextAttachment *)objc_loadWeakRetained((id *)&self->_selectedCanvasAttachment);
}

- (void)setSelectedCanvasAttachment:(id)a3
{
  objc_storeWeak((id *)&self->_selectedCanvasAttachment, a3);
}

- (BOOL)isShowingIndentationItems
{
  return self->_showingIndentationItems;
}

- (void)setShowingIndentationItems:(BOOL)a3
{
  self->_showingIndentationItems = a3;
}

- (BOOL)isShowingChecklistItems
{
  return self->_showingChecklistItems;
}

- (void)setShowingChecklistItems:(BOOL)a3
{
  self->_showingChecklistItems = a3;
}

- (NSArray)extraItemsBeforeCustomCalloutOptions
{
  return self->_extraItemsBeforeCustomCalloutOptions;
}

- (void)setExtraItemsBeforeCustomCalloutOptions:(id)a3
{
  objc_storeStrong((id *)&self->_extraItemsBeforeCustomCalloutOptions, a3);
}

- (NSArray)swipeGestureRecognizers
{
  return self->_swipeGestureRecognizers;
}

- (NSLayoutConstraint)activityStreamToolbarBottomConstraint
{
  return self->_activityStreamToolbarBottomConstraint;
}

- (void)setActivityStreamToolbarBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_activityStreamToolbarBottomConstraint, a3);
}

- (BOOL)isPreviewingAttachmentFromNote
{
  return self->_isPreviewingAttachmentFromNote;
}

- (void)setIsPreviewingAttachmentFromNote:(BOOL)a3
{
  self->_isPreviewingAttachmentFromNote = a3;
}

- (BOOL)shouldClearBackgroundColorAfterPreview
{
  return self->_shouldClearBackgroundColorAfterPreview;
}

- (void)setShouldClearBackgroundColorAfterPreview:(BOOL)a3
{
  self->_shouldClearBackgroundColorAfterPreview = a3;
}

- (BOOL)shouldClearCornerRadiusAfterPreview
{
  return self->_shouldClearCornerRadiusAfterPreview;
}

- (void)setShouldClearCornerRadiusAfterPreview:(BOOL)a3
{
  self->_shouldClearCornerRadiusAfterPreview = a3;
}

- (BOOL)hasKeyboardBeenVisibleBefore
{
  return self->_hasKeyboardBeenVisibleBefore;
}

- (void)setHasKeyboardBeenVisibleBefore:(BOOL)a3
{
  self->_hasKeyboardBeenVisibleBefore = a3;
}

- (BOOL)shouldInputAccessoryViewButtonsBeVisible
{
  return self->_shouldInputAccessoryViewButtonsBeVisible;
}

- (void)setShouldInputAccessoryViewButtonsBeVisible:(BOOL)a3
{
  self->_shouldInputAccessoryViewButtonsBeVisible = a3;
}

- (void)setApplyAccessibilityInfoDelayer:(id)a3
{
  objc_storeStrong((id *)&self->_applyAccessibilityInfoDelayer, a3);
}

- (BOOL)previouslyHadMarkedText
{
  return self->_previouslyHadMarkedText;
}

- (void)setPreviouslyHadMarkedText:(BOOL)a3
{
  self->_previouslyHadMarkedText = a3;
}

- (BOOL)wasWindowlessDuringTransitionToSize
{
  return self->_wasWindowlessDuringTransitionToSize;
}

- (void)setWasWindowlessDuringTransitionToSize:(BOOL)a3
{
  self->_wasWindowlessDuringTransitionToSize = a3;
}

- (void)setRulerHostingView:(id)a3
{
  objc_storeStrong((id *)&self->_rulerHostingView, a3);
}

- (void)setInkPaletteController:(id)a3
{
  objc_storeStrong((id *)&self->_inkPaletteController, a3);
}

- (unint64_t)inkPickerState
{
  return self->_inkPickerState;
}

- (void)setInkPickerState:(unint64_t)a3
{
  self->_inkPickerState = a3;
}

- (ICHandwritingDebugPresenter)handwritingDebugPresenter
{
  return self->_handwritingDebugPresenter;
}

- (void)setHandwritingDebugPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_handwritingDebugPresenter, a3);
}

- (void)setDateOfLastStrokeOrNewDrawing:(id)a3
{
  objc_storeStrong((id *)&self->_dateOfLastStrokeOrNewDrawing, a3);
}

- (void)setIsDrawingStrokeWithPencil:(BOOL)a3
{
  self->_isDrawingStrokeWithPencil = a3;
}

- (UITouch)currentStrokeStartTouch
{
  return self->_currentStrokeStartTouch;
}

- (void)setCurrentStrokeStartTouch:(id)a3
{
  objc_storeStrong((id *)&self->_currentStrokeStartTouch, a3);
}

- (ICInkToolPickerResponder)paletteResponder
{
  return self->_paletteResponder;
}

- (void)setPaletteResponder:(id)a3
{
  objc_storeStrong((id *)&self->_paletteResponder, a3);
}

- (BOOL)wasEditingBeforeDrawing
{
  return self->_wasEditingBeforeDrawing;
}

- (void)setWasEditingBeforeDrawing:(BOOL)a3
{
  self->_wasEditingBeforeDrawing = a3;
}

- (BOOL)tableButtonsShowMore
{
  return self->_tableButtonsShowMore;
}

- (void)setTableButtonsShowMore:(BOOL)a3
{
  self->_tableButtonsShowMore = a3;
}

- (ICSelectorDelayer)noteOrFolderChangedCallbackSelectorDelayer
{
  return self->_noteOrFolderChangedCallbackSelectorDelayer;
}

- (void)setNoteOrFolderChangedCallbackSelectorDelayer:(id)a3
{
  objc_storeStrong((id *)&self->_noteOrFolderChangedCallbackSelectorDelayer, a3);
}

- (NSUUID)createdGalleryAttachmentUUID
{
  return self->_createdGalleryAttachmentUUID;
}

- (void)setCreatedGalleryAttachmentUUID:(id)a3
{
  objc_storeStrong((id *)&self->_createdGalleryAttachmentUUID, a3);
}

- (NSArray)indentKeyCommands
{
  return self->_indentKeyCommands;
}

- (void)setIndentKeyCommands:(id)a3
{
  objc_storeStrong((id *)&self->_indentKeyCommands, a3);
}

- (NSArray)indentRTLKeyCommands
{
  return self->_indentRTLKeyCommands;
}

- (void)setIndentRTLKeyCommands:(id)a3
{
  objc_storeStrong((id *)&self->_indentRTLKeyCommands, a3);
}

- (BOOL)isLoadingStyleSelectorInputView
{
  return self->_isLoadingStyleSelectorInputView;
}

- (BOOL)shouldRemoveEmptyNoteWhenViewDisappeared
{
  return self->_shouldRemoveEmptyNoteWhenViewDisappeared;
}

- (void)setShouldRemoveEmptyNoteWhenViewDisappeared:(BOOL)a3
{
  self->_shouldRemoveEmptyNoteWhenViewDisappeared = a3;
}

- (ICShareNoteExporter)noteExporter
{
  return self->_noteExporter;
}

- (void)setNoteExporter:(id)a3
{
  objc_storeStrong((id *)&self->_noteExporter, a3);
}

- (void)setUpdateContentSizeCategoryWhenVisible:(BOOL)a3
{
  self->_updateContentSizeCategoryWhenVisible = a3;
}

- (void)setShowOrHideSearchPatternHighlightsDelayer:(id)a3
{
  objc_storeStrong((id *)&self->_showOrHideSearchPatternHighlightsDelayer, a3);
}

- (BOOL)shouldFireNoteViewEventOnViewDisappear
{
  return self->_shouldFireNoteViewEventOnViewDisappear;
}

- (void)setShouldFireNoteViewEventOnViewDisappear:(BOOL)a3
{
  self->_shouldFireNoteViewEventOnViewDisappear = a3;
}

- (NSDate)noteLastModificationDate
{
  return self->_noteLastModificationDate;
}

- (void)setShowInsertUIAfterViewAppears:(BOOL)a3
{
  self->_showInsertUIAfterViewAppears = a3;
}

- (void)setAddToDoListAfterViewAppears:(BOOL)a3
{
  self->_addToDoListAfterViewAppears = a3;
}

- (void)setAddDocumentScanAfterViewAppears:(BOOL)a3
{
  self->_addDocumentScanAfterViewAppears = a3;
}

- (void)setShouldAllowAttributionSidebar:(BOOL)a3
{
  self->_shouldAllowAttributionSidebar = a3;
}

- (NSMutableSet)enabledSubviews
{
  return self->_enabledSubviews;
}

- (void)setEnabledSubviews:(id)a3
{
  objc_storeStrong((id *)&self->_enabledSubviews, a3);
}

- (ICSystemPaperLinkBarViewController)paperLinkBarViewController
{
  return self->_paperLinkBarViewController;
}

- (void)setPaperLinkBarViewController:(id)a3
{
  objc_storeStrong((id *)&self->_paperLinkBarViewController, a3);
}

- (NSLayoutConstraint)paperLinkBarTopConstraint
{
  return self->_paperLinkBarTopConstraint;
}

- (void)setPaperLinkBarTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paperLinkBarTopConstraint, a3);
}

- (BOOL)linksBarNeedsAnimationWhileEditorIsVisible
{
  return self->_linksBarNeedsAnimationWhileEditorIsVisible;
}

- (void)setLinksBarNeedsAnimationWhileEditorIsVisible:(BOOL)a3
{
  self->_linksBarNeedsAnimationWhileEditorIsVisible = a3;
}

- (ICManagedObjectContextChangeController)inlineAttachmentChangeController
{
  return self->_inlineAttachmentChangeController;
}

- (void)setInlineAttachmentChangeController:(id)a3
{
  objc_storeStrong((id *)&self->_inlineAttachmentChangeController, a3);
}

- (void)setUnsupportedNoteTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_unsupportedNoteTapGestureRecognizer, a3);
}

- (BOOL)preventSnappingToLastPaperDocument
{
  return self->_preventSnappingToLastPaperDocument;
}

- (void)setPreventSnappingToLastPaperDocument:(BOOL)a3
{
  self->_preventSnappingToLastPaperDocument = a3;
}

- (void)setFindResultReporter:(id)a3
{
  objc_storeStrong((id *)&self->_findResultReporter, a3);
}

- (ICAudioAttachmentEditorCoordinator)audioAttachmentEditorCoordinator
{
  return self->_audioAttachmentEditorCoordinator;
}

- (void)setAudioAttachmentEditorCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_audioAttachmentEditorCoordinator, a3);
}

- (UIBarButtonItem)icaxToggleTodoBarItem
{
  return self->_icaxToggleTodoBarItem;
}

- (UIBarButtonItem)icaxSelectStyleBarItem
{
  return self->_icaxSelectStyleBarItem;
}

- (UIBarButtonItem)icaxAddAttachmentBarItem
{
  return self->_icaxAddAttachmentBarItem;
}

- (UIBarButtonItem)icaxDrawBarButton
{
  return self->_icaxDrawBarButton;
}

- (UIBarButtonItem)icaxDrawBarButtonCompact
{
  return self->_icaxDrawBarButtonCompact;
}

- (UIBarButtonItem)icaxCameraBarButton
{
  return self->_icaxCameraBarButton;
}

- (UIBarButtonItem)icaxCameraBarButtonCompact
{
  return self->_icaxCameraBarButtonCompact;
}

- (UIBarButtonItem)icaxRecordAudioBarButton
{
  return self->_icaxRecordAudioBarButton;
}

- (UIBarButtonItem)icaxRecordAudioBarButtonCompact
{
  return self->_icaxRecordAudioBarButtonCompact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationItemConfiguration, 0);
  objc_storeStrong((id *)&self->_icaxRecordAudioBarButtonCompact, 0);
  objc_storeStrong((id *)&self->_icaxRecordAudioBarButton, 0);
  objc_storeStrong((id *)&self->_icaxCameraBarButtonCompact, 0);
  objc_storeStrong((id *)&self->_icaxCameraBarButton, 0);
  objc_storeStrong((id *)&self->_icaxDrawBarButtonCompact, 0);
  objc_storeStrong((id *)&self->_icaxDrawBarButton, 0);
  objc_storeStrong((id *)&self->_icaxAddAttachmentBarItem, 0);
  objc_storeStrong((id *)&self->_icaxSelectStyleBarItem, 0);
  objc_storeStrong((id *)&self->_icaxToggleTodoBarItem, 0);
  objc_storeStrong((id *)&self->_audioAttachmentEditorCoordinator, 0);
  objc_storeStrong((id *)&self->_findResultReporter, 0);
  objc_storeStrong((id *)&self->_activityItemsConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_unsupportedNoteTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_unsupportedNoteView, 0);
  objc_storeStrong((id *)&self->_inlineAttachmentChangeController, 0);
  objc_storeStrong((id *)&self->_noteAndFolderChangeController, 0);
  objc_storeStrong((id *)&self->_paperLinkBarTopConstraint, 0);
  objc_storeStrong((id *)&self->_paperLinkBarViewController, 0);
  objc_storeStrong((id *)&self->_enabledSubviews, 0);
  objc_destroyWeak((id *)&self->_previousNote);
  objc_storeStrong((id *)&self->_noteLastModificationDate, 0);
  objc_storeStrong((id *)&self->_showOrHideSearchPatternHighlightsDelayer, 0);
  objc_storeStrong((id *)&self->_noteExporter, 0);
  objc_storeStrong((id *)&self->_indentRTLKeyCommands, 0);
  objc_storeStrong((id *)&self->_indentKeyCommands, 0);
  objc_storeStrong((id *)&self->_createdGalleryAttachmentUUID, 0);
  objc_storeStrong((id *)&self->_noteOrFolderChangedCallbackSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_paletteResponder, 0);
  objc_storeStrong((id *)&self->_currentStrokeStartTouch, 0);
  objc_storeStrong((id *)&self->_dateOfLastStrokeOrNewDrawing, 0);
  objc_storeStrong((id *)&self->_handwritingDebugPresenter, 0);
  objc_storeStrong((id *)&self->_inkPaletteController, 0);
  objc_storeStrong((id *)&self->_rulerHostingView, 0);
  objc_storeStrong((id *)&self->_applyAccessibilityInfoDelayer, 0);
  objc_storeStrong((id *)&self->_activityStreamToolbarBottomConstraint, 0);
  objc_storeStrong((id *)&self->_swipeGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_extraItemsBeforeCustomCalloutOptions, 0);
  objc_destroyWeak((id *)&self->_selectedCanvasAttachment);
  objc_storeStrong((id *)&self->_keyboardDidShowAnimationDate, 0);
  objc_storeStrong((id *)&self->_userActivityUpdateQueue, 0);
  objc_storeStrong((id *)&self->_updateNoteUserActivityStateDelayer, 0);
  objc_storeStrong((id *)&self->_selectedTextRangeToRestoreAfterBarSourcedPopoverPresentation, 0);
  objc_storeStrong((id *)&self->_searchRegexFinder, 0);
  objc_storeStrong((id *)&self->_archivedScrollStateToApply, 0);
  objc_storeStrong((id *)&self->_savedScrollStates, 0);
  objc_storeStrong((id *)&self->_limitExceededAlertController, 0);
  objc_storeStrong((id *)&self->_invitationViewController, 0);
  objc_storeStrong((id *)&self->_lockIconCoverViewController, 0);
  objc_storeStrong((id *)&self->_passwordEntryViewController, 0);
  objc_destroyWeak((id *)&self->_linkEditorViewController);
  objc_storeStrong((id *)&self->_calculateGraphingController, 0);
  objc_storeStrong((id *)&self->_calculateScrubberController, 0);
  objc_storeStrong((id *)&self->_calculateRecognitionController, 0);
  objc_storeStrong((id *)&self->_linkAcceleratorController, 0);
  objc_storeStrong((id *)&self->_keyboardAnimateInFinishTime, 0);
  objc_storeStrong((id *)&self->_originalEndOfNote, 0);
  objc_storeStrong((id *)&self->_keyboardButtonItems, 0);
  objc_storeStrong((id *)&self->_noteUserActivityState, 0);
  objc_storeStrong((id *)&self->_noteUserActivity, 0);
  objc_storeStrong((id *)&self->_audioBarViewController, 0);
  objc_storeStrong((id *)&self->_styleSelectorDummyInputView, 0);
  objc_storeStrong((id *)&self->_noteFormattingController, 0);
  objc_storeStrong((id *)&self->_styleSelectorController, 0);
  objc_storeStrong((id *)&self->_quickNoteiPhoneAttachmentPresenter, 0);
  objc_storeStrong((id *)&self->_collaborationBarButtonItem, 0);
  objc_storeStrong((id *)&self->_bluetoothKeyboardHintViewController, 0);
  objc_storeStrong((id *)&self->_paperTextAttachmentManager, 0);
  objc_storeStrong((id *)&self->_noteViewEventSourceObjectID, 0);
  objc_storeStrong((id *)&self->_hostBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activityStreamToolbar, 0);
  objc_storeStrong((id *)&self->_attributionSidebarController, 0);
  objc_storeStrong((id *)&self->_textFindingController, 0);
  objc_storeStrong((id *)&self->_textViewInputAccessoryView, 0);
  objc_destroyWeak((id *)&self->_viewControllerManager);
  objc_storeStrong((id *)&self->_collaborationButtonsController, 0);
  objc_storeStrong((id *)&self->_mentionsController, 0);
  objc_storeStrong((id *)&self->_hashtagController, 0);
  objc_storeStrong((id *)&self->_visualAssetImportController, 0);
  objc_storeStrong((id *)&self->_attachmentInsertionController, 0);
  objc_storeStrong((id *)&self->_authorHighlightsUpdater, 0);
  objc_storeStrong((id *)&self->_authorHighlightsController, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textViewController, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_destroyWeak((id *)&self->_auxiliaryStylingController);
  objc_destroyWeak((id *)&self->_auxiliaryResponder);
}

- (void)updateSelectionOnUndo:(id)a3
{
  -[ICNoteEditorViewController setSelectedRange:](self, "setSelectedRange:", objc_msgSend(a3, "rangeValue"), 0);
}

- (void)viewDidAppear:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_1DD7B0000, v0, v1, "Could not create ink picker when view appeared", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)viewDidDisappear:(uint64_t)a1 .cold.1(uint64_t a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = (id)objc_opt_class();
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1DD7B0000, v5, v6, "Setting note editor note to nil in %@ %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_0();
}

- (void)observeDrawingConverted:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DD7B0000, v0, v1, "could not find final attachment %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)managedObjectContextChangeController:performUpdatesForManagedObjectIDs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1DD7B0000, v0, v1, "Refreshing text styling because the user's hashtag library changed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)attachmentInsertionController:didAddAttachment:atRange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_1DD7B0000, v0, v1, "ICNoteEditorController attempted to handle adding an attachment at an NSNotFound location.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)attachmentInsertionController:didAddAttachment:atRange:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_1DD7B0000, v0, v1, "ICNoteEditorController attempted to handle adding an attachment at an invalid range.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)documentCameraPresentingViewController:(NSObject *)a3 didFinishWithInfoCollection:imageCache:warnUser:closeViewController:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "note");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 134218498;
  v10 = v6;
  v11 = 2112;
  v12 = v8;
  v13 = 2048;
  v14 = a2;
  _os_log_debug_impl(&dword_1DD7B0000, a3, OS_LOG_TYPE_DEBUG, "Document camera attachment too big %p %@ %lu", (uint8_t *)&v9, 0x20u);

}

- (void)documentCameraPresentingViewController:(void *)a1 didFinishWithInfoCollection:imageCache:warnUser:closeViewController:.cold.2(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1DD7B0000, v5, v6, "Can't add document camera attachment %p %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_0();
}

void __137__ICNoteEditorViewController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a2 + 40), "ic_loggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1DD7B0000, a3, OS_LOG_TYPE_ERROR, "Failed to create paper document from ICDocCamDocumentInfoCollection with error: %@ -- deleting attachment %@", v5, 0x16u);

  OUTLINED_FUNCTION_0_0();
}

- (void)setPaperLinkBarShowing:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_1DD7B0000, v0, v1, "Tried to set isVisible to YES when the link bar is disabled. Refusing to do so.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)setPaperLinkBarShowing:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1DD7B0000, v0, v1, "Preventing attempt to show link bar because canShowLinkBar is NO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)setPaperLinkBarShowing:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_1DD7B0000, v0, v1, "Tried to call -setPaperLinkBarShowing: when the editor view controller wasn't editing in a system paper PIP context.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)setPaperLinkBarShowing:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_1DD7B0000, v0, v1, "Not toggling visiblity for link bar since the device doesn't support system paper.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)setPaperLinkBarShowing:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_1DD7B0000, v0, v1, "Not toggling visiblity for system paper link bar since SystemPaper isn't enabled.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __74__ICNoteEditorViewController_presentRecordingStoppedAlertForNoteIfNeeded___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1DD7B0000, v0, v1, "Cancelled current audio recording session after switching notes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __74__ICNoteEditorViewController_presentRecordingStoppedAlertForNoteIfNeeded___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DD7B0000, v0, v1, "Error cancelling current audio recording session after switching notes {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

uint64_t __59__ICNoteEditorViewController_noteDecryptedStatusDidChange___block_invoke_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[ICNoteEditorViewController insertSidecarItems:service:].cold.1(v0);
}

- (void)insertSidecarItems:service:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1DD7B0000, v0, v1, "Inserting photos from Sidecar…", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)insertSidecarItems:service:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1DD7B0000, v0, v1, "Inserting scanned document from Sidecar…", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)insertSidecarItems:service:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1DD7B0000, v0, v1, "Cannot insert sketch from Sidecar because the maximum number of attachments has been reached", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)insertSidecarItems:(os_log_t)log service:.cold.4(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DD7B0000, log, OS_LOG_TYPE_ERROR, "Cannot insert sketch from Sidecar because UTI is not supported", buf, 2u);
}

- (void)insertSidecarItems:service:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1DD7B0000, v0, v1, "Inserting sketch from Sidecar…", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __57__ICNoteEditorViewController_insertSidecarItems_service___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_1DD7B0000, v0, v1, "Cannot insert scanned document from Sidecar", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)addToTags:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;
  NSRange v8;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8.location = objc_msgSend(v3, "selectedRange");
  NSStringFromRange(v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_1DD7B0000, a2, v5, "Adopting tag for inline attachment at %@", v6);

  OUTLINED_FUNCTION_0_0();
}

- (void)shouldStartEditingForTapGesture:(uint64_t)a3 .cold.1(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 134217984;
  v5 = a2;
  OUTLINED_FUNCTION_2_0(&dword_1DD7B0000, a1, a4, "Blocked start editing with time interval: %g", (uint8_t *)&v4);
  OUTLINED_FUNCTION_6();
}

- (void)shouldStartEditingForTapGesture:(uint64_t)a3 .cold.2(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 134217984;
  v5 = a2;
  OUTLINED_FUNCTION_2_0(&dword_1DD7B0000, a1, a4, "Blocked start editing with longer time interval: %g", (uint8_t *)&v4);
  OUTLINED_FUNCTION_6();
}

- (void)lastSavedInkingTool
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DD7B0000, v0, v1, "Could not decode ink, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)saveToolAsCurrentTool:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DD7B0000, v0, v1, "Could not encode ink, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)saveToolAsCurrentTool:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_1DD7B0000, v0, v1, "Could not save non-backed ink tool.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __99__ICNoteEditorViewController_noteEditorNavigationItemConfiguration_addNoteFromBarButtonItem_event___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1DD7B0000, v0, v1, "Cancelled current audio recording session after closing single-note window", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __99__ICNoteEditorViewController_noteEditorNavigationItemConfiguration_addNoteFromBarButtonItem_event___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DD7B0000, v0, v1, "Error cancelling current audio recording session after closing single-note window {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
