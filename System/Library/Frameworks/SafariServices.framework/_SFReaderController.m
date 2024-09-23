@implementation _SFReaderController

- (WBSReaderConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (_SFReaderController)initWithWebView:(id)a3
{
  id v3;
  _SFReaderController *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *bookmarkIdentifierToReadingListItemInfoCompletionMap;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  WBSReaderConfigurationManager *configurationManager;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_SFReaderController;
  v3 = a3;
  v4 = -[_SFReaderController init](&v13, sel_init);
  objc_storeWeak((id *)&v4->_webView, v3);

  -[_SFReaderController _setUpReaderActivityListener](v4, "_setUpReaderActivityListener", v13.receiver, v13.super_class);
  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  bookmarkIdentifierToReadingListItemInfoCompletionMap = v4->_bookmarkIdentifierToReadingListItemInfoCompletionMap;
  v4->_bookmarkIdentifierToReadingListItemInfoCompletionMap = v5;

  v7 = objc_alloc_init(MEMORY[0x1E0D8AB78]);
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:forKeyPath:options:context:", v4, *MEMORY[0x1E0D4F530], 3, kvoContext_0);
  objc_msgSend(v8, "dictionaryForKey:", *MEMORY[0x1E0D4F5D0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8AB68]), "initWithPersistedSettingsAsDictionaryRepresentation:fontManager:prefersLargerDefaultFontSize:", v9, v7, _SFDeviceIsPad());
  configurationManager = v4->_configurationManager;
  v4->_configurationManager = (WBSReaderConfigurationManager *)v10;

  objc_storeWeak((id *)&v4->_fontManager, v7);
  -[WBSReaderConfigurationManager setIsOLEDDisplay:](v4->_configurationManager, "setIsOLEDDisplay:", MGGetBoolAnswer());
  -[_SFReaderController _updateJavaScriptEnabled](v4, "_updateJavaScriptEnabled");

  return v4;
}

- (void)_updateJavaScriptEnabled
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSReaderConfigurationManager setJavaScriptEnabled:](self->_configurationManager, "setJavaScriptEnabled:", objc_msgSend(v3, "_sf_javaScriptEnabled"));

}

- (void)_setUpReaderActivityListener
{
  _WKRemoteObjectInterface *v3;
  _WKRemoteObjectInterface *eventsListenerInterface;
  id WeakRetained;
  id v6;

  objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EE744C18);
  v3 = (_WKRemoteObjectInterface *)objc_claimAutoreleasedReturnValue();
  eventsListenerInterface = self->_eventsListenerInterface;
  self->_eventsListenerInterface = v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "_remoteObjectRegistry");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "registerExportedObject:interface:", self, self->_eventsListenerInterface);
}

- (void)setWebViewUIDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_webViewUIDelegate, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, *MEMORY[0x1E0D4F530], kvoContext_0);

  -[_SFReaderController invalidate](self, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)_SFReaderController;
  -[_SFReaderController dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  id WeakRetained;
  void *v4;
  _WKRemoteObjectInterface *eventsListenerInterface;

  if (self->_eventsListenerInterface)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    objc_msgSend(WeakRetained, "_remoteObjectRegistry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "unregisterExportedObject:interface:", self, self->_eventsListenerInterface);
    eventsListenerInterface = self->_eventsListenerInterface;
    self->_eventsListenerInterface = 0;

  }
  objc_storeWeak((id *)&self->_readerControllerProxy, 0);
}

- (id)readerControllerProxy
{
  SFReaderWebProcessControllerProtocol **p_readerControllerProxy;
  void *WeakRetained;
  id v5;
  void *v6;
  void *v7;

  p_readerControllerProxy = &self->_readerControllerProxy;
  WeakRetained = objc_loadWeakRetained((id *)&self->_readerControllerProxy);
  if (!WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_webView);
    objc_msgSend(v5, "_remoteObjectRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EE770E88);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxyWithInterface:", v7);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_storeWeak((id *)p_readerControllerProxy, WeakRetained);
  return WeakRetained;
}

- (void)setReaderInitialTopScrollOffset:(int64_t)a3 configuration:(id)a4 isViewingArchive:(BOOL)a5
{
  -[_SFReaderController setReaderInitialTopScrollOffset:configuration:isViewingArchive:scrollOffsetDictionary:](self, "setReaderInitialTopScrollOffset:configuration:isViewingArchive:scrollOffsetDictionary:", a3, a4, a5, 0);
}

- (void)setReaderInitialTopScrollOffset:(int64_t)a3 configuration:(id)a4 isViewingArchive:(BOOL)a5 scrollOffsetDictionary:(id)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a5;
  v13 = a6;
  v10 = a4;
  -[_SFReaderController readerControllerProxy](self, "readerControllerProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setReaderInitialTopScrollOffset:configuration:isViewingArchive:", a3, v10, v6);

  if (v13)
  {
    -[_SFReaderController readerControllerProxy](self, "readerControllerProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInitalArticleScrollPositionAsDictionary:", v13);

  }
}

- (void)collectReadingListInfoWithBookmarkID:(int)a3 completionHandler:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  NSMutableDictionary *bookmarkIdentifierToReadingListItemInfoCompletionMap;
  void *v9;
  void *v10;
  id v11;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInt:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  bookmarkIdentifierToReadingListItemInfoCompletionMap = self->_bookmarkIdentifierToReadingListItemInfoCompletionMap;
  v9 = (void *)objc_msgSend(v7, "copy");

  -[NSMutableDictionary setObject:forKey:](bookmarkIdentifierToReadingListItemInfoCompletionMap, "setObject:forKey:", v9, v11);
  -[_SFReaderController readerControllerProxy](self, "readerControllerProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectReadingListItemInfoWithBookmarkID:", v11);

}

- (void)prepareReaderPrintingIFrameWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id readerPrintContentCompletionHandler;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_msgSend(v4, "copy");
  readerPrintContentCompletionHandler = self->_readerPrintContentCompletionHandler;
  self->_readerPrintContentCompletionHandler = v5;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65___SFReaderController_prepareReaderPrintingIFrameWithCompletion___block_invoke;
  v8[3] = &unk_1E4AC1E40;
  objc_copyWeak(&v10, &location);
  v7 = v4;
  v9 = v7;
  -[_SFReaderController setUpReaderWebViewIfNeededAndPerformBlock:](self, "setUpReaderWebViewIfNeededAndPerformBlock:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (BOOL)_readerWebViewIsReady
{
  id WeakRetained;
  char v4;
  id v5;
  BOOL contentIsReady;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  v5 = objc_loadWeakRetained((id *)&self->_readerWebView);
  contentIsReady = v5 != 0;
  if (v5 && (v4 & 1) != 0)
    contentIsReady = self->_contentIsReady;

  return contentIsReady;
}

- (void)_performActionsDelayedUntilReaderWebViewIsReady
{
  NSTimer *actionsDelayedUntilReaderWebViewIsReadyTimer;
  void (**actionsDelayedUntilReaderWebViewIsReady)(id, BOOL);
  id v5;

  -[NSTimer invalidate](self->_actionsDelayedUntilReaderWebViewIsReadyTimer, "invalidate");
  actionsDelayedUntilReaderWebViewIsReadyTimer = self->_actionsDelayedUntilReaderWebViewIsReadyTimer;
  self->_actionsDelayedUntilReaderWebViewIsReadyTimer = 0;

  actionsDelayedUntilReaderWebViewIsReady = (void (**)(id, BOOL))self->_actionsDelayedUntilReaderWebViewIsReady;
  if (actionsDelayedUntilReaderWebViewIsReady)
  {
    actionsDelayedUntilReaderWebViewIsReady[2](actionsDelayedUntilReaderWebViewIsReady, -[_SFReaderController _readerWebViewIsReady](self, "_readerWebViewIsReady"));
    v5 = self->_actionsDelayedUntilReaderWebViewIsReady;
  }
  else
  {
    v5 = 0;
  }
  self->_actionsDelayedUntilReaderWebViewIsReady = 0;

}

- (void)setUpReaderWebViewIfNeededAndPerformBlock:(id)a3
{
  void (**v4)(id, _BOOL8);
  id WeakRetained;
  _BOOL8 v6;
  void *v7;
  id v8;
  void *v9;
  id actionsDelayedUntilReaderWebViewIsReady;
  void *v11;
  id v12;
  NSTimer *v13;
  NSTimer *actionsDelayedUntilReaderWebViewIsReadyTimer;
  id v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(id, _BOOL8);

  v4 = (void (**)(id, _BOOL8))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = -[_SFReaderController _readerWebViewIsReady](self, "_readerWebViewIsReady");
  if (v6 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    if (v4)
      v4[2](v4, v6);
  }
  else if (self->_actionsDelayedUntilReaderWebViewIsReady)
  {
    v7 = (void *)MEMORY[0x1A8598C40]();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __65___SFReaderController_setUpReaderWebViewIfNeededAndPerformBlock___block_invoke;
    v16[3] = &unk_1E4AC1E68;
    v17 = v7;
    v18 = v4;
    v8 = v7;
    v9 = (void *)MEMORY[0x1A8598C40](v16);
    actionsDelayedUntilReaderWebViewIsReady = self->_actionsDelayedUntilReaderWebViewIsReady;
    self->_actionsDelayedUntilReaderWebViewIsReady = v9;

  }
  else
  {
    v11 = (void *)MEMORY[0x1A8598C40](v4);
    v12 = self->_actionsDelayedUntilReaderWebViewIsReady;
    self->_actionsDelayedUntilReaderWebViewIsReady = v11;

    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__performActionsDelayedUntilReaderWebViewIsReadyDidTimeout_, 0, 0, 1.0);
    v13 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    actionsDelayedUntilReaderWebViewIsReadyTimer = self->_actionsDelayedUntilReaderWebViewIsReadyTimer;
    self->_actionsDelayedUntilReaderWebViewIsReadyTimer = v13;

    v15 = objc_loadWeakRetained((id *)&self->_readerWebView);
    if (!v15)
      objc_msgSend(WeakRetained, "createReaderWebViewForReaderController:", self);
  }

}

- (int64_t)currentAppearance
{
  return -[WBSReaderConfigurationManager darkModeEnabled](self->_configurationManager, "darkModeEnabled");
}

- (BOOL)isLoadingNextPage
{
  return 0;
}

- (BOOL)shouldCreateArticleFinder
{
  return 1;
}

- (void)deactivateReaderNow:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "readerController:didDeactivateReaderWithMode:", self, a3);

}

- (id)scrollPositionInformation
{
  return 0;
}

- (void)createArticleFinder
{
  id v2;

  -[_SFReaderController readerControllerProxy](self, "readerControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepareToTransitionToReader");

}

- (void)didFinishPresentationUpdateAfterTransitioningToReader
{
  id v2;

  -[_SFReaderController readerControllerProxy](self, "readerControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didFinishPresentationUpdateAfterTransitioningToReader");

}

- (void)didCreateReaderWebView:(id)a3
{
  WKWebView **p_readerWebView;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  self->_contentIsReady = 0;
  p_readerWebView = &self->_readerWebView;
  v5 = a3;
  objc_storeWeak((id *)p_readerWebView, v5);
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setShouldAllowUserInstalledFonts:", 1);

  objc_msgSend(v5, "_handle");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[_SFReaderController createArticleFinder](self, "createArticleFinder");
  -[_SFReaderController readerControllerProxy](self, "readerControllerProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didCreateReaderPageContextHandle:", v9);

}

- (void)loadNewArticle
{
  id v2;

  -[_SFReaderController readerControllerProxy](self, "readerControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadNewReaderArticle");

}

- (NSURL)readerURL
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(WeakRetained, "readerURLForReaderController:", self),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = objc_loadWeakRetained((id *)&self->_webView);
    objc_msgSend(v5, "_committedURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_URLByReplacingSchemeWithString:", CFSTR("safari-reader"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSURL *)v4;
}

- (void)collectReaderContentForMailWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65___SFReaderController_collectReaderContentForMailWithCompletion___block_invoke;
  v6[3] = &unk_1E4AC1E40;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[_SFReaderController setUpReaderWebViewIfNeededAndPerformBlock:](self, "setUpReaderWebViewIfNeededAndPerformBlock:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)_collectReaderContentForMailWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id readerMailContentCompletionHandler;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A8598C40](self->_readerMailContentCompletionHandler);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __66___SFReaderController__collectReaderContentForMailWithCompletion___block_invoke;
  v14 = &unk_1E4AC1E90;
  v15 = v5;
  v16 = v4;
  v6 = v4;
  v7 = v5;
  v8 = (void *)MEMORY[0x1A8598C40](&v11);
  readerMailContentCompletionHandler = self->_readerMailContentCompletionHandler;
  self->_readerMailContentCompletionHandler = v8;

  -[_SFReaderController readerControllerProxy](self, "readerControllerProxy", v11, v12, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectReaderContentForMail");

}

- (void)setReaderLanguageTag:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_fontManager);
  objc_msgSend(WeakRetained, "updateLanguageTag:", v4);

  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44___SFReaderController_setReaderLanguageTag___block_invoke;
  block[3] = &unk_1E4AC0328;
  block[4] = self;
  objc_copyWeak(&v8, &location);
  dispatch_async(v6, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (NSString)readerLanguageTag
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_fontManager);
  objc_msgSend(WeakRetained, "languageTag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setReaderFont:(id)a3
{
  WBSReaderConfigurationManager *configurationManager;
  WBSReaderFontManager **p_fontManager;
  id v6;
  id WeakRetained;
  void *v8;

  configurationManager = self->_configurationManager;
  p_fontManager = &self->_fontManager;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_fontManager);
  objc_msgSend(WeakRetained, "languageTag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSReaderConfigurationManager setFont:forLanguageTag:](configurationManager, "setFont:forLanguageTag:", v6, v8);

  -[_SFReaderController _saveConfigurationAndSendToWebProcess](self, "_saveConfigurationAndSendToWebProcess");
}

- (void)setReaderTheme:(int64_t)a3 forAppearance:(int64_t)a4
{
  -[WBSReaderConfigurationManager setTheme:forAppearance:](self->_configurationManager, "setTheme:forAppearance:", a3, a4);
  -[_SFReaderController _saveConfigurationAndSendToWebProcess](self, "_saveConfigurationAndSendToWebProcess");
}

- (BOOL)canDecreaseReaderTextSize
{
  return -[WBSReaderConfigurationManager canMakeTextSmaller](self->_configurationManager, "canMakeTextSmaller");
}

- (BOOL)canIncreaseReaderTextSize
{
  return -[WBSReaderConfigurationManager canMakeTextBigger](self->_configurationManager, "canMakeTextBigger");
}

- (void)increaseReaderTextSize
{
  -[WBSReaderConfigurationManager makeTextBigger](self->_configurationManager, "makeTextBigger");
  -[_SFReaderController _saveConfigurationAndSendToWebProcess](self, "_saveConfigurationAndSendToWebProcess");
}

- (void)decreaseReaderTextSize
{
  -[WBSReaderConfigurationManager makeTextSmaller](self->_configurationManager, "makeTextSmaller");
  -[_SFReaderController _saveConfigurationAndSendToWebProcess](self, "_saveConfigurationAndSendToWebProcess");
}

- (void)resetReaderTextSize
{
  -[WBSReaderConfigurationManager resetTextSize](self->_configurationManager, "resetTextSize");
  -[_SFReaderController _saveConfigurationAndSendToWebProcess](self, "_saveConfigurationAndSendToWebProcess");
}

- (void)_saveConfigurationAndSendToWebProcess
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSReaderConfigurationManager configurationToSave](self->_configurationManager, "configurationToSave");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, *MEMORY[0x1E0D4F5D0]);

  -[_SFReaderController sendConfigurationToWebProcess](self, "sendConfigurationToWebProcess");
}

- (void)sendConfigurationToWebProcess
{
  void *v3;
  id v4;

  -[_SFReaderController readerControllerProxy](self, "readerControllerProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSReaderConfigurationManager configurationToSendToWebPage](self->_configurationManager, "configurationToSendToWebPage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConfiguration:", v3);

}

- (void)activateFont:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_SFReaderController readerControllerProxy](self, "readerControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activateFont:", v4);

}

- (void)setReaderIsActive:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_SFReaderController readerControllerProxy](self, "readerControllerProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReaderIsActive:", v3);

}

- (WBSReaderFontManager)fontManager
{
  return (WBSReaderFontManager *)objc_loadWeakRetained((id *)&self->_fontManager);
}

- (void)didDetermineReaderAvailability:(id)a3
{
  NSString *unfilteredArticleText;
  NSString *readerTextForSummarization;
  id v6;

  v6 = a3;
  self->_readerAvailable = objc_msgSend(v6, "isReaderAvailable");
  self->_doesPageUseSearchEngineOptimizationMetadata = objc_msgSend(v6, "doesPageUseSearchEngineOptimizationMetadata");
  if (!self->_readerAvailable)
  {
    unfilteredArticleText = self->_unfilteredArticleText;
    self->_unfilteredArticleText = 0;

    readerTextForSummarization = self->_readerTextForSummarization;
    self->_readerTextForSummarization = 0;

  }
  -[_SFReaderController _sendReaderAvailabilityNotificationForState:reason:](self, "_sendReaderAvailabilityNotificationForState:reason:", v6, objc_msgSend(v6, "isSameDocumentNavigation"));

}

- (void)_sendReaderAvailabilityNotificationForState:(id)a3 reason:(int64_t)a4
{
  id v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "readerController:didDetermineReaderAvailability:dueTo:", self, v6, a4);
  v8 = objc_msgSend(v6, "isReaderAvailable");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("isAvailable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("readerAvailabilityDidChange"), self, v11);

}

- (void)didSetReaderConfiguration:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "readerController:didSetReaderConfiguration:", self, v5);

}

- (void)didCollectReadingListItemInfo:(id)a3 bookmarkID:(id)a4
{
  id v6;
  id WeakRetained;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "readerController:didCollectReadingListItemInfo:bookmarkID:", self, v9, v6);
  -[NSMutableDictionary objectForKey:](self->_bookmarkIdentifierToReadingListItemInfoCompletionMap, "objectForKey:", v6);
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_bookmarkIdentifierToReadingListItemInfoCompletionMap, "removeObjectForKey:", v6);
    ((void (**)(_QWORD, id, uint64_t))v8)[2](v8, v9, objc_msgSend(v6, "unsignedIntValue"));
  }

}

- (void)didCollectReaderContentForMail:(id)a3
{
  id WeakRetained;
  void (**v5)(_QWORD, _QWORD);
  id readerMailContentCompletionHandler;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "readerController:didCollectReaderContentForMail:", self, v7);
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A8598C40](self->_readerMailContentCompletionHandler);
  if (v5)
  {
    readerMailContentCompletionHandler = self->_readerMailContentCompletionHandler;
    self->_readerMailContentCompletionHandler = 0;

    ((void (**)(_QWORD, id))v5)[2](v5, v7);
  }

}

- (void)collectArticleContent
{
  id v2;

  -[_SFReaderController readerControllerProxy](self, "readerControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectArticleContent");

}

- (void)didCollectArticleContent:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "readerController:didCollectArticleContent:", self, v5);

}

- (void)didDetermineAdditionalTextSamples:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "readerController:didDetermineAdditionalTextSamples:dueTo:", self, v5, objc_msgSend(v5, "isSameDocumentNavigation"));

}

- (void)didPrepareReaderContentForPrinting:(id)a3
{
  id WeakRetained;
  void (**v5)(_QWORD, _QWORD);
  id readerPrintContentCompletionHandler;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "readerController:didPrepareReaderContentForPrinting:", self, v7);
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A8598C40](self->_readerPrintContentCompletionHandler);
  if (v5)
  {
    readerPrintContentCompletionHandler = self->_readerPrintContentCompletionHandler;
    self->_readerPrintContentCompletionHandler = 0;

    ((void (**)(_QWORD, id))v5)[2](v5, v7);
  }

}

- (void)contentDidBecomeReadyWithArticleText:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  id v7;

  self->_contentIsReady = 1;
  v4 = a3;
  -[_SFReaderController _performActionsDelayedUntilReaderWebViewIsReady](self, "_performActionsDelayedUntilReaderWebViewIsReady");
  objc_msgSend(v4, "safari_bestKnownLanguageTag");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[_SFReaderController setReaderLanguageTag:](self, "setReaderLanguageTag:", v7);
  -[_SFReaderController readerControllerProxy](self, "readerControllerProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArticleLocale:", v7);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "readerController:contentDidBecomeReadyWithDetectedLanguage:", self, v7);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "filteredArticleTextDidBecomeReadyForReaderController:", self);

}

- (void)readerTextWasExtracted:(id)a3 withMetadata:(id)a4 wasDeterminingAvailabilility:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSString *v9;
  NSString *unfilteredArticleText;
  id WeakRetained;
  id v12;

  v5 = a5;
  v12 = a3;
  v8 = a4;
  if (v12 || v8 || !v5)
  {
    v9 = (NSString *)objc_msgSend(v12, "copy");
    unfilteredArticleText = self->_unfilteredArticleText;
    self->_unfilteredArticleText = v9;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "readerController:didExtractArticleText:withMetadata:", self, v12, v8);

  }
}

- (void)didRequestOnDeviceSummary
{
  SFOnDeviceSummarization *v3;
  SFOnDeviceSummarization *summarizer;
  id v5;
  NSUUID *v6;
  NSUUID *readerSweepAnimationEffectUUID;
  NSObject *v8;
  id WeakRetained;
  uint8_t buf[16];

  if (objc_msgSend(MEMORY[0x1E0D4ECE8], "isRestricted"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didFindSummarizationRestrictionsForReaderController:", self);

  }
  else
  {
    if (!self->_summarizer)
    {
      v3 = (SFOnDeviceSummarization *)objc_alloc_init(MEMORY[0x1E0D4ECE8]);
      summarizer = self->_summarizer;
      self->_summarizer = v3;

      -[SFOnDeviceSummarization setDelegate:](self->_summarizer, "setDelegate:", self);
    }
    v5 = objc_loadWeakRetained((id *)&self->_readerWebView);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "_enableTextIndicatorStylingAfterElementWithID:", CFSTR("onDeviceSummaryButton"));
      v6 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      readerSweepAnimationEffectUUID = self->_readerSweepAnimationEffectUUID;
      self->_readerSweepAnimationEffectUUID = v6;

    }
    v8 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3B2D000, v8, OS_LOG_TYPE_INFO, "Safari did begin summarization animation", buf, 2u);
    }
    -[SFOnDeviceSummarization summarizeArticleText:](self->_summarizer, "summarizeArticleText:", self->_readerTextForSummarization);

  }
}

- (void)owningWebViewDidCommitNavigation
{
  NSString *unfilteredArticleText;
  NSString *readerTextForSummarization;

  unfilteredArticleText = self->_unfilteredArticleText;
  self->_unfilteredArticleText = 0;

  readerTextForSummarization = self->_readerTextForSummarization;
  self->_readerTextForSummarization = 0;

}

- (void)checkReaderAvailability
{
  id WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "_unreachableURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[_SFReaderController readerControllerProxy](self, "readerControllerProxy");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "checkReaderAvailability");

  }
}

- (void)setArticleSummary:(id)a3 withSummaryHeader:(id)a4 tableOfContentsHeader:(id)a5 readerURLString:(id)a6 titles:(id)a7 paths:(id)a8 trailingText:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  -[_SFReaderController readerControllerProxy](self, "readerControllerProxy");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setArticleSummary:withSummaryHeader:tableOfContentsHeader:readerURLString:titles:paths:trailingText:", v22, v21, v20, v19, v18, v17, v16);

}

- (void)setOnDeviceSummaryButtonWithTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_SFReaderController readerControllerProxy](self, "readerControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOnDeviceSummaryButtonWithTitle:", v4);

}

- (void)updateSummaryTextAddingSummarizedChunk:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_SFReaderController readerControllerProxy](self, "readerControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateSummaryTextAddingSummarizedChunk:", v4);

}

- (void)getReaderArticleTitleWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_SFReaderController readerControllerProxy](self, "readerControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getReaderArtitleTitleWithReply:", v4);

}

- (void)didFinishSummarization:(id)a3
{
  SFOnDeviceSummarization *v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;
  NSUUID *readerSweepAnimationEffectUUID;
  id v9;
  SFOnDeviceSummarization *v10;

  v4 = (SFOnDeviceSummarization *)a3;
  if (self->_summarizer == v4)
  {
    v10 = v4;
    -[SFOnDeviceSummarization summary](v4, "summary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    v4 = v10;
    if (v6)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_readerWebView);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(WeakRetained, "_disableTextIndicatorStylingWithUUID:", self->_readerSweepAnimationEffectUUID);
        readerSweepAnimationEffectUUID = self->_readerSweepAnimationEffectUUID;
        self->_readerSweepAnimationEffectUUID = 0;

      }
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v9, "readerController:didFinishOnDemandSummarization:", self, v10);

      v4 = v10;
    }
  }

}

- (void)didDetermineReaderAvailabilityForDynamicCheck:(id)a3
{
  id v4;

  if (!self->_readerAvailable)
  {
    v4 = a3;
    self->_readerAvailable = objc_msgSend(v4, "isReaderAvailable");
    -[_SFReaderController _sendReaderAvailabilityNotificationForState:reason:](self, "_sendReaderAvailabilityNotificationForState:reason:", v4, 2);

  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v8;
  _QWORD *v9;
  id WeakRetained;
  void *v11;
  _SFSyntheticClickContext *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void (*v19)(_QWORD *, uint64_t);
  _QWORD *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  uint64_t v29;
  void *v30;
  int v31;
  id v32;

  v32 = a3;
  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v8, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "_syntheticClickType") == 2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = -[_SFSyntheticClickContext initWithWebView:navigationAction:]([_SFSyntheticClickContext alloc], "initWithWebView:navigationAction:", v32, v8);
    objc_msgSend(WeakRetained, "readerController:didTwoFingerTapLinkInReaderWithContext:", self, v12);
    goto LABEL_4;
  }
  objc_msgSend(v8, "targetFrame");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13 && !objc_msgSend(v8, "navigationType"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "readerController:didClickLinkRequestingNewWindowInReaderWithRequest:", self, v11);
    v19 = (void (*)(_QWORD *, uint64_t))v9[2];
    goto LABEL_19;
  }
  objc_msgSend(v8, "targetFrame");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isMainFrame");

  if ((v15 & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1E0D8AB80];
    objc_msgSend(v32, "URL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = objc_msgSend(v16, "readerPageWithURL:canLoadFrameWithURL:", v17, v18);

    v19 = (void (*)(_QWORD *, uint64_t))v9[2];
    if ((_DWORD)v16)
    {
      v20 = v9;
      v21 = 1;
LABEL_20:
      v19(v20, v21);
      goto LABEL_21;
    }
LABEL_19:
    v20 = v9;
    v21 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v11, "URL");
  v12 = (_SFSyntheticClickContext *)objc_claimAutoreleasedReturnValue();
  if (-[_SFSyntheticClickContext isFileURL](v12, "isFileURL"))
  {
    ((void (*)(_QWORD *, uint64_t))v9[2])(v9, 1);
    goto LABEL_10;
  }
  if (-[_SFSyntheticClickContext safari_hasScheme:](v12, "safari_hasScheme:", CFSTR("safari-reader")))
  {
    v22 = objc_loadWeakRetained((id *)&self->_webView);
    objc_msgSend(v22, "_committedURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "host");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)v24;
      -[_SFSyntheticClickContext host](v12, "host");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "host");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "isEqualToString:", v27);

      v29 = v28;
    }
    else
    {
      v29 = 1;
    }
    ((void (*)(_QWORD *, uint64_t))v9[2])(v9, v29);

    goto LABEL_10;
  }
  if ((-[_SFSyntheticClickContext safari_isDataURL](v12, "safari_isDataURL") & 1) == 0)
  {
    -[_SFSyntheticClickContext absoluteString](v12, "absoluteString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "safari_isJavaScriptURLString");

    if (!v31 && !objc_msgSend(v8, "navigationType") && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "readerController:didClickLinkInReaderWithRequest:", self, v11);
  }
LABEL_4:
  ((void (*)(_QWORD *, _QWORD))v9[2])(v9, 0);
LABEL_10:

LABEL_21:
}

- (void)_webView:(id)a3 getAlternateURLFromImage:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webViewUIDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_webView:getAlternateURLFromImage:completionHandler:", v11, v8, v9);

}

- (id)_webView:(id)a3 actionsForElement:(id)a4 defaultActions:(id)a5
{
  WKUIDelegatePrivate **p_webViewUIDelegate;
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;

  p_webViewUIDelegate = &self->_webViewUIDelegate;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_webViewUIDelegate);
  objc_msgSend(WeakRetained, "_webView:actionsForElement:defaultActions:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)_webView:(id)a3 shouldIncludeAppLinkActionsForElement:(id)a4
{
  return 0;
}

- (void)_webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webViewUIDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_webView:contextMenuConfigurationForElement:completionHandler:", v11, v8, v9);

}

- (void)_webView:(id)a3 contextMenuWillPresentForElement:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webViewUIDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_webView:contextMenuWillPresentForElement:", v8, v6);

}

- (void)_webView:(id)a3 contextMenuForElement:(id)a4 willCommitWithAnimator:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webViewUIDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_webView:contextMenuForElement:willCommitWithAnimator:", v11, v8, v9);

}

- (void)_webView:(id)a3 contextMenuDidEndForElement:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webViewUIDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_webView:contextMenuDidEndForElement:", v8, v6);

}

- (void)_webView:(id)a3 dataInteraction:(id)a4 sessionWillBegin:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_webView:dataInteraction:sessionWillBegin:", v11, v8, v9);

}

- (void)_webView:(id)a3 dataInteraction:(id)a4 session:(id)a5 didEndWithOperation:(unint64_t)a6
{
  id v10;
  id v11;
  id WeakRetained;
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_webView:dataInteraction:session:didEndWithOperation:", v13, v10, v11, a6);

}

- (unint64_t)_webView:(id)a3 willUpdateDataInteractionOperationToOperation:(unint64_t)a4 forSession:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  unint64_t v11;

  v8 = a3;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = objc_msgSend(WeakRetained, "_webView:willUpdateDataInteractionOperationToOperation:forSession:", v8, a4, v9);
  else
    v11 = 0;

  return v11;
}

- (BOOL)_webView:(id)a3 performDataInteractionOperationWithItemProviders:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  char v9;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend(WeakRetained, "_webView:performDataInteractionOperationWithItemProviders:", v6, v7);
  else
    v9 = 1;

  return v9;
}

- (void)_webView:(id)a3 dataInteractionOperationWasHandled:(BOOL)a4 forSession:(id)a5 itemProviders:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id WeakRetained;
  id v13;

  v8 = a4;
  v13 = a3;
  v10 = a5;
  v11 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_webView:dataInteractionOperationWasHandled:forSession:itemProviders:", v13, v8, v10, v11);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  _SFReaderController *v17;
  objc_super v18;

  v10 = a3;
  if ((void *)kvoContext_0 == a6)
  {
    v12 = *MEMORY[0x1E0CB2CC8];
    v13 = a5;
    objc_msgSend(v13, "objectForKeyedSubscript:", v12);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v14 = objc_claimAutoreleasedReturnValue();

    if (v11 | v14 && (objc_msgSend((id)v11, "isEqual:", v14) & 1) == 0)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __70___SFReaderController_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v15[3] = &unk_1E4ABFB20;
      v16 = v10;
      v17 = self;
      dispatch_async(MEMORY[0x1E0C80D38], v15);

    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)_SFReaderController;
    v11 = (uint64_t)a5;
    -[_SFReaderController observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
  }

}

- (WKWebView)webView
{
  return (WKWebView *)objc_loadWeakRetained((id *)&self->_webView);
}

- (WKWebView)readerWebView
{
  return (WKWebView *)objc_loadWeakRetained((id *)&self->_readerWebView);
}

- (_SFReaderControllerDelegate)delegate
{
  return (_SFReaderControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isReaderAvailable
{
  return self->_readerAvailable;
}

- (void)setReaderAvailable:(BOOL)a3
{
  self->_readerAvailable = a3;
}

- (BOOL)contentIsReady
{
  return self->_contentIsReady;
}

- (void)setContentIsReady:(BOOL)a3
{
  self->_contentIsReady = a3;
}

- (WKUIDelegatePrivate)webViewUIDelegate
{
  return (WKUIDelegatePrivate *)objc_loadWeakRetained((id *)&self->_webViewUIDelegate);
}

- (NSString)unfilteredArticleText
{
  return self->_unfilteredArticleText;
}

- (NSString)readerTextForSummarization
{
  return self->_readerTextForSummarization;
}

- (void)setReaderTextForSummarization:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BOOL)doesPageUseSearchEngineOptimizationMetadata
{
  return self->_doesPageUseSearchEngineOptimizationMetadata;
}

- (void)setDoesPageUseSearchEngineOptimizationMetadata:(BOOL)a3
{
  self->_doesPageUseSearchEngineOptimizationMetadata = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerTextForSummarization, 0);
  objc_storeStrong((id *)&self->_unfilteredArticleText, 0);
  objc_destroyWeak((id *)&self->_webViewUIDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_readerWebView);
  objc_destroyWeak((id *)&self->_webView);
  objc_storeStrong((id *)&self->_readerSweepAnimationEffectUUID, 0);
  objc_storeStrong((id *)&self->_summarizer, 0);
  objc_storeStrong((id *)&self->_actionsDelayedUntilReaderWebViewIsReadyTimer, 0);
  objc_storeStrong(&self->_actionsDelayedUntilReaderWebViewIsReady, 0);
  objc_storeStrong((id *)&self->_bookmarkIdentifierToReadingListItemInfoCompletionMap, 0);
  objc_storeStrong(&self->_readerPrintContentCompletionHandler, 0);
  objc_storeStrong(&self->_readerMailContentCompletionHandler, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_destroyWeak((id *)&self->_fontManager);
  objc_storeStrong((id *)&self->_eventsListenerInterface, 0);
  objc_destroyWeak((id *)&self->_readerControllerProxy);
}

@end
