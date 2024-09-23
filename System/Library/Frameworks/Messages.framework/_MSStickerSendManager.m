@implementation _MSStickerSendManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_5);
  return (id)sharedInstance_sharedInstance_1;
}

- (void)insertSticker:(id)a3 forceStage:(BOOL)a4 frameInRemoteView:(CGRect)a5 completionHandler:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v10;
  _MSStickerSendManagerDelegate **p_delegate;
  id v14;
  id WeakRetained;
  id v16;
  MSStickerUsageEvent *v17;
  void *v18;
  id v19;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4;
  v19 = a6;
  p_delegate = &self->_delegate;
  v14 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v16 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v16, "insertSticker:forceStage:frameInRemoteView:completionHandler:", v14, v10, v19, x, y, width, height);

    v17 = -[MSStickerUsageEvent initWithSticker:]([MSStickerUsageEvent alloc], "initWithSticker:", v14);
    -[MSStickerUsageEvent setUsageType:](v17, "setUsageType:", 0);
    -[MSStickerUsageEvent send](v17, "send");
  }
  else
  {
    v17 = -[_MSMessageMediaPayload initWithSticker:]([_MSMessageMediaPayload alloc], "initWithSticker:", v14);

    -[MSStickerUsageEvent setSourceFrame:](v17, "setSourceFrame:", x, y, width, height);
    +[_MSMessageAppContext activeExtensionContext](_MSMessageAppContext, "activeExtensionContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stageMediaItem:skipShelf:forceStage:completionHandler:", v17, 0, v10, &__block_literal_global_5);
    objc_msgSend(v18, "requestPresentationStyle:", 0);

  }
}

- (void)startDragSticker:(id)a3 frameInRemoteView:(CGRect)a4 fence:(id)a5 completionHandler:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  _MSStickerSendManagerDelegate **p_delegate;
  id v13;
  id v14;
  id v15;
  id WeakRetained;
  _MSMessageMediaPayload *v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  p_delegate = &self->_delegate;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v17 = (_MSMessageMediaPayload *)objc_loadWeakRetained((id *)p_delegate);
    -[_MSMessageMediaPayload startDragSticker:frameInRemoteView:fence:completionHandler:](v17, "startDragSticker:frameInRemoteView:fence:completionHandler:", v15, v14, v13, x, y, width, height);
  }
  else
  {
    v17 = -[_MSMessageMediaPayload initWithSticker:]([_MSMessageMediaPayload alloc], "initWithSticker:", v15);

    +[_MSMessageAppContext activeExtensionContext](_MSMessageAppContext, "activeExtensionContext");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startDragMediaItem:frameInRemoteView:fence:completionHandler:", v17, v14, v13, x, y, width, height);
  }

}

- (void)stickerDragMoved:(id)a3 frameInRemoteView:(CGRect)a4 rotation:(double)a5 scale:(double)a6 fence:(id)a7 completionHandler:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  _MSStickerSendManagerDelegate **p_delegate;
  id v18;
  id v19;
  id WeakRetained;
  _MSMessageMediaPayload *v21;
  id v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v22 = a7;
  p_delegate = &self->_delegate;
  v18 = a8;
  v19 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v21 = (_MSMessageMediaPayload *)objc_loadWeakRetained((id *)p_delegate);
    -[_MSMessageMediaPayload stickerDragMoved:frameInRemoteView:rotation:scale:fence:completionHandler:](v21, "stickerDragMoved:frameInRemoteView:rotation:scale:fence:completionHandler:", v19, v22, v18, x, y, width, height, a5, a6);
  }
  else
  {
    v21 = -[_MSMessageMediaPayload initWithSticker:]([_MSMessageMediaPayload alloc], "initWithSticker:", v19);

    +[_MSMessageAppContext activeExtensionContext](_MSMessageAppContext, "activeExtensionContext");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dragMediaItemMoved:frameInRemoteView:rotation:scale:completionHandler:", v21, v18, x, y, width, height, a5, a6);
  }

}

- (void)stickerDragCanceled
{
  id v2;

  +[_MSMessageAppContext activeExtensionContext](_MSMessageAppContext, "activeExtensionContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dragMediaItemCanceled");

}

- (void)stickerDruidDragStarted
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  ms_defaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[_MSStickerSendManager stickerDruidDragStarted]";
    _os_log_impl(&dword_1DB1A9000, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  +[_MSMessageAppContext activeExtensionContext](_MSMessageAppContext, "activeExtensionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stickerDruidDragStarted");

}

- (void)stickerDruidDragEndedWithMSSticker:(id)a3
{
  id v4;
  NSObject *v5;
  _MSStickerSendManagerDelegate **p_delegate;
  id WeakRetained;
  void *v8;
  _MSMessageMediaPayload *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ms_defaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[_MSStickerSendManager stickerDruidDragEndedWithMSSticker:]";
    _os_log_impl(&dword_1DB1A9000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "stickerDruidDragEndedWithMSSticker:", v4);
  }
  else
  {
    +[_MSMessageAppContext activeExtensionContext](_MSMessageAppContext, "activeExtensionContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_MSMessageMediaPayload initWithSticker:]([_MSMessageMediaPayload alloc], "initWithSticker:", v4);
    objc_msgSend(v8, "stickerDruidDragEndedWithPayload:", v9);

  }
}

- (void)canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[_MSMessageAppContext activeExtensionContext](_MSMessageAppContext, "activeExtensionContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "canShowBrowserForPluginIdentifier:completion:", v6, v5);

}

- (void)showBrowserForPluginIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a3;
  +[_MSMessageAppContext activeExtensionContext](_MSMessageAppContext, "activeExtensionContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "showBrowserForPluginIdentifier:style:completion:", v8, a4, v7);

}

- (_MSStickerSendManagerDelegate)delegate
{
  return (_MSStickerSendManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)hostBundleID
{
  return self->_hostBundleID;
}

- (void)setHostBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_hostBundleID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostBundleID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
