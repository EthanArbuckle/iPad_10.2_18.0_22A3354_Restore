@implementation SFReaderEnabledWebViewController

- (void)dealloc
{
  objc_super v3;

  -[_SFReaderController invalidate](self->_readerController, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SFReaderEnabledWebViewController;
  -[SFWebViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  _SFReaderController *v3;
  void *v4;
  _SFReaderController *v5;
  _SFReaderController *readerController;
  _WKRemoteObjectInterface *v7;
  _WKRemoteObjectInterface *appBannerMetaTagContentObserverInterface;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SFReaderEnabledWebViewController;
  -[SFWebViewController loadView](&v11, sel_loadView);
  v3 = [_SFReaderController alloc];
  -[SFWebViewController webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_SFReaderController initWithWebView:](v3, "initWithWebView:", v4);
  readerController = self->_readerController;
  self->_readerController = v5;

  -[_SFReaderController setDelegate:](self->_readerController, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EE781A38);
  v7 = (_WKRemoteObjectInterface *)objc_claimAutoreleasedReturnValue();
  appBannerMetaTagContentObserverInterface = self->_appBannerMetaTagContentObserverInterface;
  self->_appBannerMetaTagContentObserverInterface = v7;

  -[SFWebViewController webView](self, "webView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_remoteObjectRegistry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerExportedObject:interface:", self, self->_appBannerMetaTagContentObserverInterface);

}

- (void)setUpReaderWithReaderWebView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  -[_SFReaderController didCreateReaderWebView:](self->_readerController, "didCreateReaderWebView:");
  -[_SFReaderController configurationManager](self->_readerController, "configurationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationToSendToWebPage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SFReaderController setReaderInitialTopScrollOffset:configuration:isViewingArchive:](self->_readerController, "setReaderInitialTopScrollOffset:configuration:isViewingArchive:", 0, v5, 0);
  objc_msgSend(v11, "setNavigationDelegate:", self->_readerController);
  v6 = (void *)MEMORY[0x1E0C92C80];
  -[_SFReaderController readerURL](self->_readerController, "readerURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_nonAppInitiatedRequestWithURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "safari_requestBySettingAdvancedPrivacyProtectionsFlagIsEnabled:", self->_supportsAdvancedPrivacyProtections);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (id)objc_msgSend(v11, "loadRequest:", v9);
}

- (void)invalidate
{
  void *v3;
  void *v4;
  _WKRemoteObjectInterface *appBannerMetaTagContentObserverInterface;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFReaderEnabledWebViewController;
  -[SFWebViewController invalidate](&v6, sel_invalidate);
  if (self->_appBannerMetaTagContentObserverInterface)
  {
    -[SFWebViewController webView](self, "webView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_remoteObjectRegistry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unregisterExportedObject:interface:", self, self->_appBannerMetaTagContentObserverInterface);

    appBannerMetaTagContentObserverInterface = self->_appBannerMetaTagContentObserverInterface;
    self->_appBannerMetaTagContentObserverInterface = 0;

  }
}

- (void)webView:(id)a3 didCommitNavigation:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)SFReaderEnabledWebViewController;
  -[SFWebViewController webView:didCommitNavigation:](&v8, sel_webView_didCommitNavigation_, v6, v7);
  -[_SFReaderController setReaderAvailable:](self->_readerController, "setReaderAvailable:", 0);

}

- (void)readerController:(id)a3 didDetermineReaderAvailability:(id)a4 dueTo:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didDetermineReaderAvailability:", objc_msgSend(v10, "isReaderAvailable"));

  -[SFWebViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "webViewControllerDidDetermineReaderAvailability:dueTo:", self, a5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "textSamples");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "webViewController:didExtractTextSamplesForTranslation:", self, v9);

  }
}

- (void)readerController:(id)a3 didDetermineAdditionalTextSamples:(id)a4 dueTo:(int64_t)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (id)WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "textSamples");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134217984;
    v12 = objc_msgSend(v10, "count");
    _os_log_debug_impl(&dword_1A3B2D000, v7, OS_LOG_TYPE_DEBUG, "Determined %lu additional text samples for translation", (uint8_t *)&v11, 0xCu);

  }
  -[SFWebViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "textSamples");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "webViewController:didExtractTextSamplesForTranslation:", self, v9);

  }
}

- (void)readerController:(id)a3 didClickLinkRequestingNewWindowInReaderWithRequest:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[SFWebViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "webViewController:didClickLinkInReaderWithRequest:", self, v6);

}

- (void)readerController:(id)a3 didClickLinkInReaderWithRequest:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[SFWebViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "webViewController:didClickLinkInReaderWithRequest:", self, v6);

}

- (void)createReaderWebViewForReaderController:(id)a3
{
  id v4;

  -[SFWebViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createReaderWebViewForWebViewController:", self);

}

- (void)readerController:(id)a3 contentDidBecomeReadyWithDetectedLanguage:(id)a4
{
  id v5;

  -[SFWebViewController delegate](self, "delegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "webViewControllerReaderDidBecomeReady:", self);

}

- (void)didFindAppBannerWithContent:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SFWebViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webViewController:didFindAppBannerWithContent:", self, v5);

}

- (_SFReaderController)readerController
{
  return self->_readerController;
}

- (BOOL)supportsAdvancedPrivacyProtections
{
  return self->_supportsAdvancedPrivacyProtections;
}

- (void)setSupportsAdvancedPrivacyProtections:(BOOL)a3
{
  self->_supportsAdvancedPrivacyProtections = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerController, 0);
  objc_storeStrong((id *)&self->_appBannerMetaTagContentObserverInterface, 0);
}

@end
