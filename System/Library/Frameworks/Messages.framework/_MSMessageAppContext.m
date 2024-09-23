@implementation _MSMessageAppContext

+ (id)activeExtensionContext
{
  void *v2;
  void *v3;

  +[_MSExtensionGlobalState sharedInstance](_MSExtensionGlobalState, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeExtensionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_MSMessageAppContext)initWithAppContext:(id)a3
{
  id v4;
  _MSMessageAppContext *v5;
  _MSMessageAppContext *v6;
  id v7;
  uint64_t v8;
  NSMapTable *conversationsByIdentifier;
  _MSMessageAppContext *v10;
  objc_super v12;

  v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)_MSMessageAppContext;
    v5 = -[_MSMessageAppContext init](&v12, sel_init);
    v6 = v5;
    if (v5)
    {
      v7 = objc_storeWeak((id *)&v5->_context, v4);
      objc_msgSend(v4, "setContainingContext:", v6);

      objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
      v8 = objc_claimAutoreleasedReturnValue();
      conversationsByIdentifier = v6->_conversationsByIdentifier;
      v6->_conversationsByIdentifier = (NSMapTable *)v8;

    }
    self = v6;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_keepContextAlive
{
  _MSMessageComposeExtensionImplProtocol *WeakRetained;
  _MSMessageComposeExtensionImplProtocol *keepAliveContext;

  WeakRetained = (_MSMessageComposeExtensionImplProtocol *)objc_loadWeakRetained((id *)&self->_context);
  keepAliveContext = self->_keepAliveContext;
  self->_keepAliveContext = WeakRetained;

}

- (void)_releaseKeepAliveContext
{
  _MSMessageComposeExtensionImplProtocol *keepAliveContext;

  keepAliveContext = self->_keepAliveContext;
  self->_keepAliveContext = 0;

}

- (void)setHostContext:(id)a3
{
  _MSMessageComposeExtensionImplProtocol **p_context;
  id v4;
  id WeakRetained;

  p_context = &self->_context;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_context);
  objc_msgSend(WeakRetained, "setHostContext:", v4);

}

- (_MSMessageComposeHostImplProtocol)hostContext
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "hostContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_MSMessageComposeHostImplProtocol *)v3;
}

- (unint64_t)presentationStyle
{
  id WeakRetained;
  unint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v3 = objc_msgSend(WeakRetained, "presentationStyle");

  return v3;
}

- (unint64_t)presentationContext
{
  id WeakRetained;
  unint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v3 = objc_msgSend(WeakRetained, "presentationContext");

  return v3;
}

- (void)setPresentationContext:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "setPresentationContext:", a3);

}

- (void)setPresentationStyle:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "setPresentationStyle:", a3);

}

- (id)updatedConversationForConversationState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  MSConversation *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  NSMapTable *conversationsByIdentifier;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "conversationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_conversationsByIdentifier, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "_updateWithState:", v4);
  }
  else
  {
    v8 = [MSConversation alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    v7 = -[MSConversation _initWithState:context:](v8, "_initWithState:context:", v4, WeakRetained);

    -[_MSMessageAppContext viewController](self, "viewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "conformsToProtocol:", &unk_1F02D84F0))
    {
      -[_MSMessageAppContext viewController](self, "viewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDelegate:", v11);

    }
    conversationsByIdentifier = self->_conversationsByIdentifier;
    objc_msgSend(v7, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](conversationsByIdentifier, "setObject:forKey:", v7, v13);

  }
  return v7;
}

- (UIViewController)viewController
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v3;
}

- (UIViewController)stickerViewController
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "stickerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v3;
}

- (void)stageAppItem:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  _MSMessageComposeExtensionImplProtocol **p_context;
  id v8;
  id v9;
  id WeakRetained;

  v5 = a4;
  p_context = &self->_context;
  v8 = a5;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_context);
  objc_msgSend(WeakRetained, "stageAppItem:skipShelf:completionHandler:", v9, v5, v8);

}

- (void)stageMediaItem:(id)a3 skipShelf:(BOOL)a4 forceStage:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _MSMessageComposeExtensionImplProtocol **p_context;
  id v10;
  id v11;
  id WeakRetained;

  v6 = a5;
  v7 = a4;
  p_context = &self->_context;
  v10 = a6;
  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_context);
  objc_msgSend(WeakRetained, "stageMediaItem:skipShelf:forceStage:completionHandler:", v11, v7, v6, v10);

}

- (void)stageRichLink:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  _MSMessageComposeExtensionImplProtocol **p_context;
  id v8;
  id v9;
  id WeakRetained;

  v5 = a4;
  p_context = &self->_context;
  v8 = a5;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_context);
  objc_msgSend(WeakRetained, "stageRichLink:skipShelf:completionHandler:", v9, v5, v8);

}

- (void)stageAssetArchive:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  id WeakRetained;
  uint8_t v12[16];

  v5 = a4;
  v8 = a5;
  v9 = a3;
  ms_defaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1DB1A9000, v10, OS_LOG_TYPE_DEFAULT, "Called -stageAssetArchive:skipShelf:completionHandler:", v12, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "stageAssetArchive:skipShelf:completionHandler:", v9, v5, v8);

}

- (void)removeAssetArchiveWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  uint8_t v10[16];

  v6 = a4;
  v7 = a3;
  ms_defaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1DB1A9000, v8, OS_LOG_TYPE_DEFAULT, "Called -removeAssetArchiveWithIdentifier:completionHandler:", v10, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "removeAssetArchiveWithIdentifier:completionHandler:", v7, v6);

}

- (void)startDragMediaItem:(id)a3 frameInRemoteView:(CGRect)a4 fence:(id)a5 completionHandler:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  _MSMessageComposeExtensionImplProtocol **p_context;
  id v13;
  id v14;
  id v15;
  id WeakRetained;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  p_context = &self->_context;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_context);
  objc_msgSend(WeakRetained, "startDragMediaItem:frameInRemoteView:fence:completionHandler:", v15, v14, v13, x, y, width, height);

}

- (void)dragMediaItemMoved:(id)a3 frameInRemoteView:(CGRect)a4 rotation:(double)a5 scale:(double)a6 completionHandler:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  _MSMessageComposeExtensionImplProtocol **p_context;
  id v15;
  id v16;
  id WeakRetained;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  p_context = &self->_context;
  v15 = a7;
  v16 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_context);
  objc_msgSend(WeakRetained, "dragMediaItemMoved:frameInRemoteView:rotation:scale:completionHandler:", v16, v15, x, y, width, height, a5, a6);

}

- (void)dragMediaItemCanceled
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "dragMediaItemCanceled");

}

- (void)stickerDruidDragStarted
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "stickerDruidDragStarted");

}

- (void)stickerDruidDragEndedWithPayload:(id)a3
{
  _MSMessageComposeExtensionImplProtocol **p_context;
  id v4;
  id WeakRetained;

  p_context = &self->_context;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_context);
  objc_msgSend(WeakRetained, "stickerDruidDragEndedWithPayload:", v4);

}

- (void)stickerDruidDragEndedWithPayload:(id)a3 pluginIdentifier:(id)a4
{
  _MSMessageComposeExtensionImplProtocol **p_context;
  id v6;
  id v7;
  id WeakRetained;

  p_context = &self->_context;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_context);
  objc_msgSend(WeakRetained, "stickerDruidDragEndedWithPayload:pluginIdentifier:", v7, v6);

}

- (void)requestPresentationStyle:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "requestPresentationStyle:", a3);

}

- (void)requestPresentationStyleExpanded:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "requestPresentationStyleExpanded:", v3);

}

- (void)requestFullScreenModalPresentationWithSize:(CGSize)a3
{
  double height;
  double width;
  id WeakRetained;

  height = a3.height;
  width = a3.width;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "requestFullScreenModalPresentationWithSize:", width, height);

}

- (void)dismiss
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "dismiss");

}

- (void)dismissAndPresentPhotosApp
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "dismissAndPresentPhotosApp");

}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 completion:(id)a6
{
  _MSMessageComposeExtensionImplProtocol **p_context;
  id v10;
  id v11;
  id v12;
  id v13;
  id WeakRetained;

  p_context = &self->_context;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_context);
  objc_msgSend(WeakRetained, "presentAlertWithTitle:message:buttonTitle:completion:", v13, v12, v11, v10);

}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 destructiveButtonTitle:(id)a6 completion:(id)a7
{
  _MSMessageComposeExtensionImplProtocol **p_context;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id WeakRetained;

  p_context = &self->_context;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_context);
  objc_msgSend(WeakRetained, "presentAlertWithTitle:message:buttonTitle:destructiveButtonTitle:completion:", v16, v15, v14, v13, v12);

}

- (void)presentAlertSheetWith:(id)a3 styles:(id)a4 completion:(id)a5
{
  _MSMessageComposeExtensionImplProtocol **p_context;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  p_context = &self->_context;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_context);
  objc_msgSend(WeakRetained, "presentAlertSheetWith:styles:completion:", v10, v9, v8);

}

- (void)presentAlertSheetWithTitle:(id)a3 message:(id)a4 buttonTitles:(id)a5 styles:(id)a6 completion:(id)a7
{
  _MSMessageComposeExtensionImplProtocol **p_context;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id WeakRetained;

  p_context = &self->_context;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_context);
  objc_msgSend(WeakRetained, "presentAlertSheetWithTitle:message:buttonTitles:styles:completion:", v16, v15, v14, v13, v12);

}

- (void)_remoteViewProvidesExplicitSizeSnapshot
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "_remoteViewProvidesExplicitSizeSnapshot");

}

- (void)_remoteViewNeedsSizeMatchBeforeSnapshotSwap
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "_remoteViewNeedsSizeMatchBeforeSnapshotSwap");

}

- (void)_remoteViewDidBecomeReadyForDisplay
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "_remoteViewDidBecomeReadyForDisplay");

}

- (void)_requestStickerExtensionMetadataDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  -[_MSMessageAppContext viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67___MSMessageAppContext__requestStickerExtensionMetadataDictionary___block_invoke;
  v8[3] = &unk_1EA25C5C8;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

- (void)_requestPresentationWithStickerType:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[_MSMessageAppContext viewController](self, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71___MSMessageAppContext__requestPresentationWithStickerType_identifier___block_invoke;
  block[3] = &unk_1EA25C5F0;
  v13 = v8;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  v11 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)requestResize
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "requestResize");

}

- (void)contentDidLoad
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "contentDidLoad");

}

- (void)requestHostSceneIdentifierWithCompletion:(id)a3
{
  _MSMessageComposeExtensionImplProtocol **p_context;
  id v4;
  id WeakRetained;

  p_context = &self->_context;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_context);
  objc_msgSend(WeakRetained, "requestHostSceneIdentifierWithCompletion:", v4);

}

- (void)canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4
{
  _MSMessageComposeExtensionImplProtocol **p_context;
  id v6;
  id v7;
  id WeakRetained;

  p_context = &self->_context;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_context);
  objc_msgSend(WeakRetained, "canShowBrowserForPluginIdentifier:completion:", v7, v6);

}

- (void)showBrowserForPluginIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5
{
  _MSMessageComposeExtensionImplProtocol **p_context;
  id v8;
  id v9;
  id WeakRetained;

  p_context = &self->_context;
  v8 = a5;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_context);
  objc_msgSend(WeakRetained, "showBrowserForPluginIdentifier:style:completion:", v9, a4, v8);

}

- (void)_setHostBundleID:(id)a3
{
  _MSMessageComposeExtensionImplProtocol **p_context;
  id v4;
  id WeakRetained;

  p_context = &self->_context;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_context);
  objc_msgSend(WeakRetained, "_setHostBundleID:", v4);

}

- ($115C4C562B26FF47E01F9F4EA65B5887)balloonHostAuditToken
{
  __int128 v4;
  _MSMessageComposeExtensionImplProtocol **p_context;
  id WeakRetained;
  id v7;
  void *v8;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  *(_QWORD *)&v4 = -1;
  *((_QWORD *)&v4 + 1) = -1;
  *(_OWORD *)retstr->var0 = v4;
  *(_OWORD *)&retstr->var0[4] = v4;
  p_context = &self->_context;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_context);
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "balloonHostAuditToken");
    }
    else
    {
      v19 = 0u;
      v20 = 0u;
    }
    v18 = v20;
    *(_OWORD *)retstr->var0 = v19;
    *(_OWORD *)&retstr->var0[4] = v18;

  }
  else
  {
    LODWORD(v19) = 8;
    result = ($115C4C562B26FF47E01F9F4EA65B5887 *)task_info(*MEMORY[0x1E0C83DA0], 0xFu, (task_info_t)retstr, (mach_msg_type_number_t *)&v19);
    if ((_DWORD)result)
    {
      ms_traceLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[_MSMessageAppContext balloonHostAuditToken].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    }
  }
  return result;
}

- (void)_becomeActiveWithConversationState:(id)a3 presentationState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[_MSMessageAppContext viewController](self, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77___MSMessageAppContext__becomeActiveWithConversationState_presentationState___block_invoke;
  v12[3] = &unk_1EA25C618;
  v12[4] = self;
  v13 = v7;
  v14 = v6;
  v15 = v8;
  v9 = v8;
  v10 = v6;
  v11 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

- (void)_resignActive
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  -[_MSMessageAppContext viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37___MSMessageAppContext__resignActive__block_invoke;
  v5[3] = &unk_1EA25C640;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

- (void)_canSendMessage:(id)a3 conversationState:(id)a4 associatedText:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[_MSMessageAppContext _keepContextAlive](self, "_keepContextAlive");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84___MSMessageAppContext__canSendMessage_conversationState_associatedText_completion___block_invoke;
  block[3] = &unk_1EA25C690;
  block[4] = self;
  v19 = v11;
  v20 = v10;
  v21 = v12;
  v22 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v10;
  v17 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)_conversationDidChangeWithConversationState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v4 = a3;
  -[_MSMessageAppContext viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68___MSMessageAppContext__conversationDidChangeWithConversationState___block_invoke;
  block[3] = &unk_1EA25C5F0;
  block[4] = self;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)_requestContentSizeThatFits:(id)a3 presentationStyle:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a3;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88___MSMessageAppContext__requestContentSizeThatFits_presentationStyle_completionHandler___block_invoke;
  block[3] = &unk_1EA25C6B8;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)_presentationWillChangeToPresentationState:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67___MSMessageAppContext__presentationWillChangeToPresentationState___block_invoke;
  v6[3] = &unk_1EA25C640;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)_presentationDidChangeToPresentationState:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66___MSMessageAppContext__presentationDidChangeToPresentationState___block_invoke;
  v6[3] = &unk_1EA25C640;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)_didUpdateMessage:(id)a3 conversationState:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60___MSMessageAppContext__didUpdateMessage_conversationState___block_invoke;
  block[3] = &unk_1EA25C5F0;
  block[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)_didReceiveMessage:(id)a3 conversationState:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61___MSMessageAppContext__didReceiveMessage_conversationState___block_invoke;
  block[3] = &unk_1EA25C5F0;
  block[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)_didStartSendingMessage:(id)a3 conversationState:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[_MSMessageAppContext _keepContextAlive](self, "_keepContextAlive");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66___MSMessageAppContext__didStartSendingMessage_conversationState___block_invoke;
  block[3] = &unk_1EA25C5F0;
  block[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)_didCancelSendingMessage:(id)a3 conversationState:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[_MSMessageAppContext _keepContextAlive](self, "_keepContextAlive");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67___MSMessageAppContext__didCancelSendingMessage_conversationState___block_invoke;
  block[3] = &unk_1EA25C5F0;
  block[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)_didSelectGPAsset:(id)a3 sandboxExtension:(id)a4 recipeData:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[_MSMessageAppContext _keepContextAlive](self, "_keepContextAlive");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81___MSMessageAppContext__didSelectGPAsset_sandboxExtension_recipeData_completion___block_invoke;
  block[3] = &unk_1EA25C690;
  block[4] = self;
  v19 = v10;
  v20 = v12;
  v21 = v11;
  v22 = v13;
  v14 = v13;
  v15 = v11;
  v16 = v12;
  v17 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)_requestSnapshotThatFits:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  ms_traceLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[_MSMessageAppContext _requestSnapshotThatFits:completion:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60___MSMessageAppContext__requestSnapshotThatFits_completion___block_invoke;
  block[3] = &unk_1EA25C6B8;
  block[4] = self;
  v19 = v6;
  v20 = v7;
  v16 = v7;
  v17 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)_requestSnapshotWithCompletion:(id)a3
{
  -[_MSMessageAppContext _requestSnapshotThatFits:completion:](self, "_requestSnapshotThatFits:completion:", 0, a3);
}

- (void)_handleTextInputPayload:(id)a3 withPayloadID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73___MSMessageAppContext__handleTextInputPayload_withPayloadID_completion___block_invoke;
  v14[3] = &unk_1EA25C6E0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

- (void)_didRemoveAssetArchiveWithIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[_MSMessageAppContext _keepContextAlive](self, "_keepContextAlive");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61___MSMessageAppContext__didRemoveAssetArchiveWithIdentifier___block_invoke;
  v6[3] = &unk_1EA25C640;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)_prepareForPresentationWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69___MSMessageAppContext__prepareForPresentationWithCompletionHandler___block_invoke;
  v6[3] = &unk_1EA25C5C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)_volumeButtonPressed:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45___MSMessageAppContext__volumeButtonPressed___block_invoke;
  v3[3] = &unk_1EA25C758;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

- (void)_setPluginIdentifierToShow:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[_MSMessageAppContext viewController](self, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "_setPluginIdentifierToShow:completion:", v8, v6);

}

- (void)_addStickerToStoreWithRepresentations:(id)a3 completionWithStickerIDs:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[_MSMessageAppContext viewController](self, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "_addStickerToStoreWithRepresentations:completionWithStickerIDs:", v8, v6);

}

- (void)_addStickerToStoreWithRepresentations:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[_MSMessageAppContext viewController](self, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "_addStickerToStoreWithRepresentations:completionHandler:", v8, v6);

}

- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  id v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v11 = a5;
  -[_MSMessageAppContext viewController](self, "viewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "_addStickerToStoreWithRepresentations:sourceRect:completion:", v13, v11, x, y, width, height);

}

- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 effect:(int64_t)a5 completion:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a6;
  v14 = a3;
  -[_MSMessageAppContext viewController](self, "viewController");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v15, "_addStickerToStoreWithRepresentations:sourceRect:effect:completion:", v14, a5, v13, x, y, width, height);
  else
    -[_MSMessageAppContext _addStickerToStoreWithRepresentations:sourceRect:completion:](self, "_addStickerToStoreWithRepresentations:sourceRect:completion:", v14, v13, x, y, width, height);

}

- (void)_addStickerToStoreWithUISticker:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  id v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v11 = a5;
  -[_MSMessageAppContext viewController](self, "viewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "_addStickerToStoreWithUISticker:sourceRect:completion:", v13, v11, x, y, width, height);

}

- (void)_prepareForAddStickerFromSubjectLift
{
  id v2;

  -[_MSMessageAppContext viewController](self, "viewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "_prepareForAddStickerFromSubjectLift");

}

- (void)_addStickerAnimationDidFinishWithCompletion:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MSMessageAppContext viewController](self, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "_addStickerAnimationDidFinishWithCompletion:", v5);

}

- (void)_didRemoveStickerPreview
{
  id v2;

  -[_MSMessageAppContext viewController](self, "viewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "_didRemoveStickerPreview");

}

- (void)_animatedStickerCreationProgressChanged:(id)a3 progress:(double)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[_MSMessageAppContext viewController](self, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "_animatedStickerCreationProgressChanged:progress:", v7, a4);

}

- (_MSMessageComposeExtensionImplProtocol)containingContext
{
  return self->_containingContext;
}

- (void)setContainingContext:(id)a3
{
  objc_storeStrong((id *)&self->_containingContext, a3);
}

- (MSConversation)activeConversation
{
  return self->_activeConversation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConversation, 0);
  objc_storeStrong((id *)&self->_containingContext, 0);
  objc_storeStrong((id *)&self->_conversationsByIdentifier, 0);
  objc_storeStrong((id *)&self->_keepAliveContext, 0);
  objc_destroyWeak((id *)&self->_context);
}

- (void)balloonHostAuditToken
{
  OUTLINED_FUNCTION_0_1(&dword_1DB1A9000, a1, a3, "failed to get audit token for self: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_requestSnapshotThatFits:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DB1A9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
