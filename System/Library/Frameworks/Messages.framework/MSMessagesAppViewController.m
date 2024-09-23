@implementation MSMessagesAppViewController

- (void)dealloc
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[MSMessagesAppViewController dealloc]";
  _os_log_debug_impl(&dword_1DB1A9000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  char v9;
  int v10;
  BOOL v11;
  double v12;
  objc_super v13;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  _MSMainBundleIdentifier();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.gamerdelights.gamepigeon.ext")) & 1) != 0)
  {
    v9 = dyld_program_sdk_at_least();

    if ((v9 & 1) == 0)
    {
      v10 = IMSharedHelperDeviceIsiPad();
      v11 = bottom == 34.0 && top == 34.0;
      v12 = 0.0;
      if (!v11)
        v12 = top;
      if (v10)
        top = v12;
    }
  }
  else
  {

  }
  v13.receiver = self;
  v13.super_class = (Class)MSMessagesAppViewController;
  -[MSMessagesAppViewController _setContentOverlayInsets:](&v13, sel__setContentOverlayInsets_, top, left, bottom, right);
  -[MSMessagesAppViewController _setNavigationControllerContentInsetAdjustment:](self, "_setNavigationControllerContentInsetAdjustment:", top, 0.0, bottom, 0.0);
}

- (MSMessagesAppViewController)initWithCoder:(id)a3
{
  MSMessagesAppViewController *v3;
  _MSMessagesAppPresentationControllerDelegate *v4;
  _MSMessagesAppPresentationControllerDelegate *sheetPresentationControllerDelegate;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSMessagesAppViewController;
  v3 = -[MSMessagesAppViewController initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v3)
  {
    v4 = -[_MSMessagesAppPresentationControllerDelegate initWithMessagesAppViewController:]([_MSMessagesAppPresentationControllerDelegate alloc], "initWithMessagesAppViewController:", v3);
    sheetPresentationControllerDelegate = v3->_sheetPresentationControllerDelegate;
    v3->_sheetPresentationControllerDelegate = v4;

    -[MSMessagesAppViewController _setUpEmojiDragNotificationObservers](v3, "_setUpEmojiDragNotificationObservers");
  }
  return v3;
}

- (MSMessagesAppViewController)init
{
  return -[MSMessagesAppViewController initWithShouldBeSheetPresentationControllerDelegate:](self, "initWithShouldBeSheetPresentationControllerDelegate:", 1);
}

- (MSMessagesAppViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3
{
  _BOOL4 v3;
  MSMessagesAppViewController *v4;
  _MSMessagesAppPresentationControllerDelegate *v5;
  _MSMessagesAppPresentationControllerDelegate *sheetPresentationControllerDelegate;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSMessagesAppViewController;
  v4 = -[MSMessagesAppViewController init](&v8, sel_init);
  if (v4)
  {
    if (v3)
    {
      v5 = -[_MSMessagesAppPresentationControllerDelegate initWithMessagesAppViewController:]([_MSMessagesAppPresentationControllerDelegate alloc], "initWithMessagesAppViewController:", v4);
      sheetPresentationControllerDelegate = v4->_sheetPresentationControllerDelegate;
      v4->_sheetPresentationControllerDelegate = v5;

    }
    -[MSMessagesAppViewController _setUpEmojiDragNotificationObservers](v4, "_setUpEmojiDragNotificationObservers");
  }
  return v4;
}

- (_MSMessageComposeExtensionImplProtocol)appContext
{
  _MSMessageComposeExtensionImplProtocol *appContext;

  appContext = self->_appContext;
  if (appContext)
    return appContext;
  -[MSMessagesAppViewController extensionContext](self, "extensionContext");
  return (_MSMessageComposeExtensionImplProtocol *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_setUpEmojiDragNotificationObservers
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__emojiStickerDragStarted, *MEMORY[0x1E0CEB950], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__emojiStickerDragEnded, *MEMORY[0x1E0CEB968], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__emojiStickerDragEnded, *MEMORY[0x1E0CEB958], 0);

}

- (void)_emojiStickerDragStarted
{
  void *v2;
  id v3;

  -[MSMessagesAppViewController activeConversation](self, "activeConversation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stickerDruidDragStarted");

}

- (void)_emojiStickerDragEnded
{
  void *v2;
  id v3;

  -[MSMessagesAppViewController activeConversation](self, "activeConversation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stickerDruidDragEndedWithPayload:", 0);

}

- (void)_conversation:(id)a3 willSelectMessage:(id)a4
{
  if (a3)
  {
    if (a4)
      -[MSMessagesAppViewController willSelectMessage:conversation:](self, "willSelectMessage:conversation:", a4, a3);
  }
}

- (void)_conversation:(id)a3 didSelectMessage:(id)a4
{
  if (a3)
  {
    if (a4)
      -[MSMessagesAppViewController didSelectMessage:conversation:](self, "didSelectMessage:conversation:", a4, a3);
  }
}

- (void)requestPresentationStyle:(MSMessagesAppPresentationStyle)presentationStyle
{
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ms_defaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (presentationStyle > MSMessagesAppPresentationStyleTranscript)
      v6 = CFSTR("Other");
    else
      v6 = off_1EA25C580[presentationStyle];
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1DB1A9000, v5, OS_LOG_TYPE_DEFAULT, "Requesting presentation style %@", (uint8_t *)&v8, 0xCu);
  }

  -[MSMessagesAppViewController appContext](self, "appContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestPresentationStyle:", presentationStyle);

}

- (MSMessagesAppPresentationStyle)presentationStyle
{
  void *v2;
  MSMessagesAppPresentationStyle v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[MSMessagesAppViewController appContext](self, "appContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "presentationStyle");

  ms_defaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v3 > MSMessagesAppPresentationStyleTranscript)
      v5 = CFSTR("Other");
    else
      v5 = off_1EA25C580[v3];
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1DB1A9000, v4, OS_LOG_TYPE_DEFAULT, "Getting presentation style %@", (uint8_t *)&v7, 0xCu);
  }

  return v3;
}

- (MSMessagesAppPresentationContext)presentationContext
{
  void *v2;
  MSMessagesAppPresentationContext v3;

  -[MSMessagesAppViewController appContext](self, "appContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "presentationContext");

  return v3;
}

- (void)requestStickerExtensionMetadataDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  ms_defaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DB1A9000, v5, OS_LOG_TYPE_DEFAULT, "Requesting Sticker Extension Metadata", v7, 2u);
  }

  -[MSMessagesAppViewController appContext](self, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_requestStickerExtensionMetadataDictionary:", v4);

}

- (void)requestPresentationWithStickerType:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ms_defaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218242;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1DB1A9000, v8, OS_LOG_TYPE_DEFAULT, "Requesting presentation of string app with type: %ld and identifier %@", (uint8_t *)&v10, 0x16u);
  }

  -[MSMessagesAppViewController appContext](self, "appContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_requestPresentationWithStickerType:identifier:", v6, v7);

}

- (void)generateSnapshotWithContentSize:(CGSize)a3 completion:(id)a4
{
  double height;
  double width;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  double v10;
  CGFloat v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _BOOL8 v16;
  int v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _BYTE v21[24];
  void *v22;
  uint64_t v23;
  CGSize v24;
  CGSize v25;
  CGRect v26;

  height = a3.height;
  width = a3.width;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _QWORD))a4;
  v26.origin.x = 0.0;
  v26.origin.y = 0.0;
  v26.size.width = width;
  v26.size.height = height;
  if (CGRectIsEmpty(v26))
  {
    ms_defaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v21 = 136315138;
      *(_QWORD *)&v21[4] = "-[MSMessagesAppViewController generateSnapshotWithContentSize:completion:]";
      _os_log_impl(&dword_1DB1A9000, v8, OS_LOG_TYPE_DEFAULT, "%s Not taking a new snapshot because bounds were empty", v21, 0xCu);
    }

    v7[2](v7, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    v11 = v10;
    v24.width = width;
    v24.height = height;
    UIGraphicsBeginImageContextWithOptions(v24, 1, v11);

    -[MSMessagesAppViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v21 = 0;
    *(_QWORD *)&v21[8] = v21;
    *(_QWORD *)&v21[16] = 0x2020000000;
    v13 = getCKIsRunningInMacCatalystSymbolLoc_ptr;
    v22 = getCKIsRunningInMacCatalystSymbolLoc_ptr;
    if (!getCKIsRunningInMacCatalystSymbolLoc_ptr)
    {
      v14 = (void *)ChatKitLibrary();
      v13 = dlsym(v14, "CKIsRunningInMacCatalyst");
      *(_QWORD *)(*(_QWORD *)&v21[8] + 24) = v13;
      getCKIsRunningInMacCatalystSymbolLoc_ptr = v13;
    }
    _Block_object_dispose(v21, 8);
    if (!v13)
    {
      -[MSMessagesAppViewController generateSnapshotWithContentSize:completion:].cold.1();
      __break(1u);
    }
    v16 = ((unsigned int (*)(uint64_t))v13)(v15) != 0;
    v17 = objc_msgSend(v12, "drawViewHierarchyInRect:afterScreenUpdates:", v16, 0.0, 0.0, width, height, *(_QWORD *)v21);

    if (v17)
    {
      UIGraphicsGetImageFromCurrentImageContext();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    UIGraphicsEndImageContext();
    ms_defaultLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v25.width = width;
      v25.height = height;
      NSStringFromCGSize(v25);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v21 = 136315650;
      *(_QWORD *)&v21[4] = "-[MSMessagesAppViewController generateSnapshotWithContentSize:completion:]";
      *(_WORD *)&v21[12] = 2112;
      *(_QWORD *)&v21[14] = v20;
      *(_WORD *)&v21[22] = 2112;
      v22 = v18;
      _os_log_impl(&dword_1DB1A9000, v19, OS_LOG_TYPE_DEFAULT, "%s Took new snapshot with size %@. snapshotImage: %@", v21, 0x20u);

    }
    ((void (**)(id, void *))v7)[2](v7, v18);

  }
}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  -[MSMessagesAppViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  -[MSMessagesAppViewController generateSnapshotWithContentSize:completion:](self, "generateSnapshotWithContentSize:completion:", v9, v6, v8);
}

- (BOOL)_isAppleInternalAppAndWantsSafeAreaInsets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  _MSMainBundleIdentifier();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple.")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "infoDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MSMessagesOverlayAppearanceDisableInsetsForGrabber"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    v6 = dyld_program_sdk_at_least();
  }

  return v6;
}

- (UIEdgeInsets)additionalSafeAreaInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  UIEdgeInsets result;

  if (-[MSMessagesAppViewController _isAppleInternalAppAndWantsSafeAreaInsets](self, "_isAppleInternalAppAndWantsSafeAreaInsets")&& -[MSMessagesAppViewController _ms_isInSheet](self, "_ms_isInSheet"))
  {
    v3 = 0.0;
    v4 = 20.0;
    v5 = 0.0;
    v6 = 0.0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MSMessagesAppViewController;
    -[MSMessagesAppViewController additionalSafeAreaInsets](&v7, sel_additionalSafeAreaInsets);
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v3;
  result.top = v4;
  return result;
}

- (BOOL)_ms_isInSheet
{
  BOOL v3;
  void *v4;

  if (-[MSMessagesAppViewController presentationStyle](self, "presentationStyle") == MSMessagesAppPresentationStyleTranscript)
    return 0;
  -[MSMessagesAppViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "_presentationSemanticContext") == 2;

  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double Alpha;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MSMessagesAppViewController;
  -[MSMessagesAppViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[MSMessagesAppViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHitTestsAsOpaque:", 1);

  -[MSMessagesAppViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  Alpha = CGColorGetAlpha((CGColorRef)objc_msgSend(v6, "CGColor"));

  if (Alpha <= 0.1)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSMessagesAppViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v8);

  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _MSMessagesAppPresentationControllerDelegate *sheetPresentationControllerDelegate;
  void *v8;
  objc_super v9;

  v4 = a4;
  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSMessagesAppViewController;
  -[MSMessagesAppViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v9, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  sheetPresentationControllerDelegate = self->_sheetPresentationControllerDelegate;
  if (sheetPresentationControllerDelegate)
  {
    objc_msgSend(v6, "_rootSheetPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", sheetPresentationControllerDelegate);

  }
}

- (void)setInitialFrameBeforeAppearance:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  self->_initialFrameBeforeAppearance = a3;
  if (!CGRectEqualToRect(a3, *MEMORY[0x1E0C9D648]))
  {
    -[MSMessagesAppViewController view](self, "view");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFrame:", x, y, width, height);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MSMessagesAppViewController;
  -[MSMessagesAppViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[MSMessagesAppViewController setInitialFrameBeforeAppearance:](self, "setInitialFrameBeforeAppearance:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MSMessagesAppViewController;
  -[MSMessagesAppViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (-[MSMessagesAppViewController displaysAfterAppearance](self, "displaysAfterAppearance"))
    -[MSMessagesAppViewController setReadyForDisplay](self, "setReadyForDisplay");
  if (!-[MSMessagesAppViewController viewHasAppeared](self, "viewHasAppeared"))
    -[MSMessagesAppViewController setViewHasAppeared:](self, "setViewHasAppeared:", 1);
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MSMessagesAppViewController;
  -[MSMessagesAppViewController viewSafeAreaInsetsDidChange](&v2, sel_viewSafeAreaInsetsDidChange);
}

- (BOOL)displaysAfterAppearance
{
  return 1;
}

- (void)setProvidesExplicitSizeSnapshot
{
  void *v3;

  if (!-[MSMessagesAppViewController providesExplicitSizeSnapshot](self, "providesExplicitSizeSnapshot"))
  {
    -[MSMessagesAppViewController appContext](self, "appContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_remoteViewProvidesExplicitSizeSnapshot");

    -[MSMessagesAppViewController setProvidesExplicitSizeSnapshot:](self, "setProvidesExplicitSizeSnapshot:", 1);
  }
}

- (void)setNeedsSizeMatchBeforeSnapshotSwap
{
  void *v3;

  if (!-[MSMessagesAppViewController needsSizeMatchBeforeSnapshotSwap](self, "needsSizeMatchBeforeSnapshotSwap"))
  {
    -[MSMessagesAppViewController appContext](self, "appContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_remoteViewNeedsSizeMatchBeforeSnapshotSwap");

    -[MSMessagesAppViewController setNeedsSizeMatchBeforeSnapshotSwap:](self, "setNeedsSizeMatchBeforeSnapshotSwap:", 1);
  }
}

- (void)setReadyForDisplay
{
  void *v3;

  if (!-[MSMessagesAppViewController isReadyForDisplay](self, "isReadyForDisplay"))
  {
    -[MSMessagesAppViewController appContext](self, "appContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_remoteViewDidBecomeReadyForDisplay");

    -[MSMessagesAppViewController setIsReadyForDisplay:](self, "setIsReadyForDisplay:", 1);
  }
}

- (void)requestResize
{
  id v2;

  -[MSMessagesAppViewController appContext](self, "appContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestResize");

}

- (void)contentDidLoad
{
  id v2;

  -[MSMessagesAppViewController appContext](self, "appContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentDidLoad");

}

- (UIEdgeInsets)_balloonMaskEdgeInsets
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  NSObject *v7;
  NSObject *v8;
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
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  UIEdgeInsets result;

  -[MSMessagesAppViewController activeConversation](self, "activeConversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFromMe");

  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v5 = (void *)getCKUIBehaviorClass_softClass;
  v26 = getCKUIBehaviorClass_softClass;
  if (!getCKUIBehaviorClass_softClass)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __getCKUIBehaviorClass_block_invoke;
    v22[3] = &unk_1EA25C548;
    v22[4] = &v23;
    __getCKUIBehaviorClass_block_invoke((uint64_t)v22);
    v5 = (void *)v24[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v23, 8);
  IMLogHandleForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[MSMessagesAppViewController _balloonMaskEdgeInsets].cold.2(v6, v8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[MSMessagesAppViewController _balloonMaskEdgeInsets].cold.1();
  }

  -[objc_class sharedBehaviors](objc_retainAutorelease(v6), "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pluginBalloonInsetsForMessageFromMe:", v4);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (void)_validateMessageForSending:(id)a3 conversation:(id)a4 completionHandler:(id)a5
{
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 1, 0);
}

- (void)_validateMessageForSending:(id)a3 conversation:(id)a4 associatedText:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, uint64_t, _QWORD))a6 + 2))(a6, 1, 0);
}

- (BOOL)_handleTextInputPayload:(id)a3 withPayloadID:(id)a4
{
  return 0;
}

- (void)_prepareForPresentationWithCompletionHandler:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[MSMessagesAppViewController appContext](self, "appContext");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentAlertWithTitle:message:buttonTitle:completion:", v13, v12, v11, v10);

}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 destructiveButtonTitle:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[MSMessagesAppViewController appContext](self, "appContext");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentAlertWithTitle:message:buttonTitle:destructiveButtonTitle:completion:", v16, v15, v14, v13, v12);

}

- (void)_presentAlertSheetWith:(id)a3 styles:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MSMessagesAppViewController appContext](self, "appContext");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentAlertSheetWith:styles:completion:", v10, v9, v8);

}

- (void)_presentContextMenuWithButtonTitles:(id)a3 imageNames:(id)a4 buttonFrame:(CGRect)a5 completion:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  id v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  -[MSMessagesAppViewController appContext](self, "appContext");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "presentContextMenuWithButtonTitles:imageNames:buttonFrame:completion:", v15, v14, v13, x, y, width, height);

}

- (void)_presentAlertSheetWithTitle:(id)a3 message:(id)a4 buttonTitles:(id)a5 styles:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[MSMessagesAppViewController appContext](self, "appContext");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentAlertSheetWithTitle:message:buttonTitles:styles:completion:", v16, v15, v14, v13, v12);

}

- (void)_requestHostSceneIdentifierWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MSMessagesAppViewController appContext](self, "appContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestHostSceneIdentifierWithCompletion:", v4);

}

- (BOOL)_presentationStyleIsFullScreenModal:(unint64_t)a3
{
  return a3 == 3;
}

- (void)_setAppPresentationStyle:(unint64_t)a3
{
  id v4;

  -[MSMessagesAppViewController appContext](self, "appContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentationStyle:", a3);

}

- (void)_requestFullScreenModalPresentationWithSize:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[MSMessagesAppViewController appContext](self, "appContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestFullScreenModalPresentationWithSize:", width, height);

}

- (double)_percentExpanded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;

  -[MSMessagesAppViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_rootSheetPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_detentValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") > 1)
  {
    -[MSMessagesAppViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;
    -[MSMessagesAppViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safeAreaInsets");
    v13 = v10 - v12;
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v7 = (v13 - v16) / (v18 - v16);

  }
  else if (-[MSMessagesAppViewController presentationStyle](self, "presentationStyle") == MSMessagesAppPresentationStyleExpanded)
  {
    v7 = 1.0;
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (CGRect)initialFrameBeforeAppearance
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialFrameBeforeAppearance.origin.x;
  y = self->_initialFrameBeforeAppearance.origin.y;
  width = self->_initialFrameBeforeAppearance.size.width;
  height = self->_initialFrameBeforeAppearance.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (MSConversation)activeConversation
{
  return self->_activeConversation;
}

- (void)setActiveConversation:(id)a3
{
  objc_storeStrong((id *)&self->_activeConversation, a3);
}

- (BOOL)viewHasAppeared
{
  return self->_viewHasAppeared;
}

- (void)setViewHasAppeared:(BOOL)a3
{
  self->_viewHasAppeared = a3;
}

- (_MSMessagesAppPresentationControllerDelegate)sheetPresentationControllerDelegate
{
  return self->_sheetPresentationControllerDelegate;
}

- (void)setSheetPresentationControllerDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_sheetPresentationControllerDelegate, a3);
}

- (void)setAppContext:(id)a3
{
  objc_storeStrong((id *)&self->_appContext, a3);
}

- (BOOL)isReadyForDisplay
{
  return self->_isReadyForDisplay;
}

- (void)setIsReadyForDisplay:(BOOL)a3
{
  self->_isReadyForDisplay = a3;
}

- (BOOL)providesExplicitSizeSnapshot
{
  return self->_providesExplicitSizeSnapshot;
}

- (void)setProvidesExplicitSizeSnapshot:(BOOL)a3
{
  self->_providesExplicitSizeSnapshot = a3;
}

- (BOOL)needsSizeMatchBeforeSnapshotSwap
{
  return self->_needsSizeMatchBeforeSnapshotSwap;
}

- (void)setNeedsSizeMatchBeforeSnapshotSwap:(BOOL)a3
{
  self->_needsSizeMatchBeforeSnapshotSwap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_storeStrong((id *)&self->_sheetPresentationControllerDelegate, 0);
  objc_storeStrong((id *)&self->_activeConversation, 0);
}

- (void)dismiss
{
  id v2;

  -[MSMessagesAppViewController appContext](self, "appContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismiss");

}

- (void)willTransitionToPresentationStyle:(MSMessagesAppPresentationStyle)presentationStyle
{
  _BOOL4 v4;
  id v5;

  v4 = -[MSMessagesAppViewController _isInsideUserGeneratedStickerExtension](self, "_isInsideUserGeneratedStickerExtension");
  if (presentationStyle == MSMessagesAppPresentationStyleCompact && v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA900], "_ms_currentFirstResponder");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resignFirstResponder");

  }
}

- (BOOL)_isInsideUserGeneratedStickerExtension
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[_MSMessageAppContext activeExtensionContext](_MSMessageAppContext, "activeExtensionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v2, "inputItems", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "userInfo");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("context-is-sue"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqual:", &unk_1EA267990);

          if ((v10 & 1) != 0)
          {
            v11 = 1;
            goto LABEL_13;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v5)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_13:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_dismissAndPresentPhotosApp
{
  id v2;

  -[MSMessagesAppViewController appContext](self, "appContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissAndPresentPhotosApp");

}

- (void)_setPluginIdentifierToShow:(id)a3 completion:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB28A8];
  v7 = a4;
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 3328, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, double, double, double, double))a4 + 2))(v7, v8, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));

}

- (void)_addStickerToStoreWithRepresentations:(id)a3 completionWithStickerIDs:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB28A8];
  v7 = a4;
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 3328, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id, double, double, double, double))a4 + 2))(v7, 0, v8, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));

}

- (void)addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB28A8];
  v8 = a5;
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 3328, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a5 + 2))(v8, 0, v9);

}

- (void)_addStickerToStoreWithUISticker:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  id v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v11 = (void (**)(id, _QWORD, void *))a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "representations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSMessagesAppViewController _addStickerToStoreWithRepresentations:sourceRect:effect:completion:](self, "_addStickerToStoreWithRepresentations:sourceRect:effect:completion:", v12, objc_msgSend(v13, "effectType"), v11, x, y, width, height);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v12);
  }

}

- (void)_addStickerAnimationDidFinishWithCompletion:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (uint64_t)generateSnapshotWithContentSize:completion:.cold.1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[MSMessagesAppViewController _balloonMaskEdgeInsets].cold.1(v0);
}

- (void)_balloonMaskEdgeInsets
{
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138413058;
  v5 = v3;
  v6 = 2080;
  OUTLINED_FUNCTION_0();
  v7 = "/Library/Caches/com.apple.xbs/Sources/Messages/ChatKit/Messages/Messages/Source/Extension/MSMessagesAppViewController.m";
  _os_log_debug_impl(&dword_1DB1A9000, a2, OS_LOG_TYPE_DEBUG, "Loaded weak linked class: '%@': %s:%i (%s)", (uint8_t *)&v4, 0x26u);

}

@end
