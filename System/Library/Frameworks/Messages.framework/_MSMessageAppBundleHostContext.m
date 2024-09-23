@implementation _MSMessageAppBundleHostContext

- (_MSMessageAppBundleHostContext)initWithAppContext:(id)a3
{
  id v5;
  _MSMessageAppBundleHostContext *v6;
  _MSMessageAppBundleHostContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MSMessageAppBundleHostContext;
  v6 = -[_MSMessageAppBundleHostContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appContext, a3);

  return v7;
}

- (void)_stageAppItem:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v11;
  id v12;
  id v13;

  v6 = a4;
  v13 = a3;
  v8 = a5;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v12, "_stageAppItem:skipShelf:completionHandler:", v13, v6, v8);

  }
}

- (void)_stageMediaItem:(id)a3 skipShelf:(BOOL)a4 forceStage:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v13;
  id v14;
  id v15;

  v7 = a5;
  v8 = a4;
  v15 = a3;
  v10 = a6;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    v14 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v14, "_stageMediaItem:skipShelf:forceStage:completionHandler:", v15, v8, v7, v10);

  }
}

- (void)_stageRichLink:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v11;
  id v12;
  id v13;

  v6 = a4;
  v13 = a3;
  v8 = a5;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v12, "_stageRichLink:skipShelf:completionHandler:", v13, v6, v8);

  }
}

- (void)_startDragMediaItem:(id)a3 frameInRemoteView:(CGRect)a4 fence:(id)a5 completionHandler:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v17;
  id v18;
  id v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v19 = a3;
  v13 = a5;
  v14 = a6;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    v18 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v18, "_startDragMediaItem:frameInRemoteView:fence:completionHandler:", v19, v13, v14, x, y, width, height);

  }
}

- (void)_dragMediaItemMoved:(id)a3 frameInRemoteView:(CGRect)a4 rotation:(double)a5 scale:(double)a6 completionHandler:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v18;
  id v19;
  id v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v20 = a3;
  v15 = a7;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    v19 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v19, "_dragMediaItemMoved:frameInRemoteView:rotation:scale:completionHandler:", v20, v15, x, y, width, height, a5, a6);

  }
}

- (void)_dragMediaItemCanceled
{
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v4;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "_dragMediaItemCanceled");

  }
}

- (void)_stickerDruidDragStarted
{
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v4;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "_stickerDruidDragStarted");

  }
}

- (void)_stickerDruidDragEndedWithPayload:(id)a3
{
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "_stickerDruidDragEndedWithPayload:", v8);

  }
}

- (void)_stickerDruidDragEndedWithPayload:(id)a3 pluginIdentifier:(id)a4
{
  id v6;
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v10, "_stickerDruidDragEndedWithPayload:pluginIdentifier:", v11, v6);

  }
}

- (void)_requestPresentationStyle:(unint64_t)a3
{
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "_requestPresentationStyle:", a3);

  }
}

- (void)_requestFullScreenModalPresentationWithSize:(CGSize)a3
{
  double height;
  double width;
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v7;
  id v8;

  height = a3.height;
  width = a3.width;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "_requestFullScreenModalPresentationWithSize:", width, height);

  }
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v15;
  id v16;
  id v17;

  v17 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    v16 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v16, "_presentAlertWithTitle:message:buttonTitle:completion:", v17, v10, v11, v12);

  }
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 destructiveButtonTitle:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v18;
  id v19;
  id v20;

  v20 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    v19 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v19, "_presentAlertWithTitle:message:buttonTitle:destructiveButtonTitle:completion:", v20, v12, v13, v14, v15);

  }
}

- (void)_presentAlertSheetWith:(id)a3 styles:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v12;
  id v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v13 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v13, "_presentAlertSheetWith:styles:completion:", v14, v8, v9);

  }
}

- (void)_presentAlertSheetWithTitle:(id)a3 message:(id)a4 buttonTitles:(id)a5 styles:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v18;
  id v19;
  id v20;

  v20 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    v19 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v19, "_presentAlertSheetWithTitle:message:buttonTitles:styles:completion:", v20, v12, v13, v14, v15);

  }
}

- (void)_dismiss
{
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v4;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "_dismiss");

  }
}

- (void)_dismissAndPresentPhotosApp
{
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v4;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "_dismissAndPresentPhotosApp");

  }
}

- (void)_updateSnapshotForNextLaunch:(id)a3
{
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "_updateSnapshotForNextLaunch:", v8);

  }
}

- (void)_remoteViewProvidesExplicitSizeSnapshot
{
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v4;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "_remoteViewProvidesExplicitSizeSnapshot");

  }
}

- (void)_remoteViewNeedsSizeMatchBeforeSnapshotSwap
{
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v4;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "_remoteViewNeedsSizeMatchBeforeSnapshotSwap");

  }
}

- (void)_remoteViewDidBecomeReadyForDisplay
{
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v4;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "_remoteViewDidBecomeReadyForDisplay");

  }
}

- (void)_requestStickerExtensionMetadataDictionary:(id)a3
{
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "_requestStickerExtensionMetadataDictionary:", v8);

  }
}

- (void)_requestPresentationWithStickerType:(id)a3 identifier:(id)a4
{
  id v6;
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v10, "_requestPresentationWithStickerType:identifier:", v11, v6);

  }
}

- (void)_openURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v10, "_openURL:completionHandler:", v11, v6);

  }
}

- (void)_requestResize
{
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v4;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "_requestResize");

  }
}

- (void)_contentDidLoad
{
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v4;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "_contentDidLoad");

  }
}

- (void)_stageAssetArchive:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v11;
  id v12;
  id v13;

  v6 = a4;
  v13 = a3;
  v8 = a5;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v12, "_stageAssetArchive:skipShelf:completionHandler:", v13, v6, v8);

  }
}

- (void)_removeAssetArchiveWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v10, "_removeAssetArchiveWithIdentifier:completionHandler:", v11, v6);

  }
}

- (void)_requestHostSceneIdentifierWithCompletion:(id)a3
{
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "_requestHostSceneIdentifierWithCompletion:", v8);

  }
  else if (v8)
  {
    v8[2](v8, 0);
  }

}

- (void)_canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v10, "_canShowBrowserForPluginIdentifier:completion:", v11, v6);

  }
  else if (v6)
  {
    v6[2](v6, 0);
  }

}

- (void)_showBrowserForPluginIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  _MSMessageComposeHostProtocol **p_delegate;
  id WeakRetained;
  char v11;
  id v12;
  id v13;

  v13 = a3;
  v8 = (void (**)(_QWORD))a5;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v12, "_showBrowserForPluginIdentifier:style:completion:", v13, a4, v8);

  }
  else if (v8)
  {
    v8[2](v8);
  }

}

- (_MSMessageComposeHostProtocol)delegate
{
  return (_MSMessageComposeHostProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_MSMessageComposeExtensionProtocol)appContext
{
  return self->_appContext;
}

- (void)setAppContext:(id)a3
{
  objc_storeStrong((id *)&self->_appContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
