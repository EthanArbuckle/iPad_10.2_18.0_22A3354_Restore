@implementation _SFReaderWebProcessPlugInPageController

- (_SFReaderWebProcessPlugInPageController)initWithPlugIn:(id)a3 contextController:(id)a4
{
  id v6;
  id v7;
  _SFReaderWebProcessPlugInPageController *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _SFReaderWebProcessPlugInPageController *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_SFReaderWebProcessPlugInPageController;
  v8 = -[WBSWebProcessPlugInPageController initWithPlugIn:contextController:](&v15, sel_initWithPlugIn_contextController_, v6, v7);
  if (v8)
  {
    v9 = (void *)contextHandleToReaderPageController;
    if (!contextHandleToReaderPageController)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)contextHandleToReaderPageController;
      contextHandleToReaderPageController = v10;

      v9 = (void *)contextHandleToReaderPageController;
    }
    objc_msgSend(v7, "handle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, v12);

    v13 = v8;
  }

  return v8;
}

- (void)willDestroyBrowserContextController:(id)a3
{
  id v4;
  id WeakRetained;
  WebProcessPlugInReaderJSController *value;
  objc_super v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_originalPageController);
  objc_msgSend(WeakRetained, "setReaderPageController:", 0);

  -[WKWebProcessPlugInScriptWorld clearWrappers](self->_isolatedWorldForNextPageDetection, "clearWrappers");
  value = self->_readerJSController.__ptr_.__value_;
  self->_readerJSController.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(WebProcessPlugInReaderJSController *))(*(_QWORD *)value + 8))(value);
  v7.receiver = self;
  v7.super_class = (Class)_SFReaderWebProcessPlugInPageController;
  -[WBSWebProcessPlugInPageController willDestroyBrowserContextController:](&v7, sel_willDestroyBrowserContextController_, v4);

}

+ (id)readerPageControllerForContextHandle:(id)a3
{
  objc_msgSend((id)contextHandleToReaderPageController, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (OpaqueJSValue)originalArticleFinder
{
  id WeakRetained;
  OpaqueJSValue *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_originalPageController);
  v3 = (OpaqueJSValue *)objc_msgSend(WeakRetained, "originalArticleFinder");

  return v3;
}

- (void)_initializeReaderJSControllerForFrame:(id)a3
{
  SafariServices::WebProcessPlugInReaderJSController *v4;
  WebProcessPlugInReaderJSController *value;
  WKWebProcessPlugInFrame *v6;

  v6 = (WKWebProcessPlugInFrame *)a3;
  if (!self->_readerJSController.__ptr_.__value_)
  {
    v4 = (SafariServices::WebProcessPlugInReaderJSController *)operator new();
    SafariServices::WebProcessPlugInReaderJSController::WebProcessPlugInReaderJSController(v4, v6, self);
    value = self->_readerJSController.__ptr_.__value_;
    self->_readerJSController.__ptr_.__value_ = (WebProcessPlugInReaderJSController *)v4;
    if (value)
      (*(void (**)(WebProcessPlugInReaderJSController *))(*(_QWORD *)value + 8))(value);
  }

}

- (void)loadNewArticle
{
  WebProcessPlugInReaderJSController *value;

  value = self->_readerJSController.__ptr_.__value_;
  if (value)
    SafariShared::ReaderJSController::loadNewArticle((SafariShared::ReaderJSController *)value);
}

- (void)reloadArticle
{
  WebProcessPlugInReaderJSController *value;

  value = self->_readerJSController.__ptr_.__value_;
  if (value)
    SafariShared::ReaderJSController::reloadArticle((SafariShared::ReaderJSController *)value);
}

- (void)setConfiguration:(id)a3
{
  WebProcessPlugInReaderJSController *value;
  NSDictionary *v5;

  v5 = (NSDictionary *)a3;
  value = self->_readerJSController.__ptr_.__value_;
  if (value)
    SafariShared::ReaderJSController::setConfiguration((SafariShared::ReaderJSController *)value, v5);

}

- (void)setReaderIsActive:(BOOL)a3
{
  WebProcessPlugInReaderJSController *value;

  value = self->_readerJSController.__ptr_.__value_;
  if (value)
    SafariShared::ReaderJSController::setReaderIsActive((SafariShared::ReaderJSController *)value);
}

- (void)setArticleLocale:(id)a3
{
  WebProcessPlugInReaderJSController *value;
  NSString *v5;

  v5 = (NSString *)a3;
  value = self->_readerJSController.__ptr_.__value_;
  if (value)
    SafariShared::ReaderJSController::setArticleLocale((SafariShared::ReaderJSController *)value, v5);

}

- (void)setArticleSummary:(id)a3 withSummaryHeader:(id)a4 tableOfContentsHeader:(id)a5 readerURLString:(id)a6 titles:(id)a7 paths:(id)a8 trailingText:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v21 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (self->_readerJSController.__ptr_.__value_)
    SafariShared::ReaderJSController::setArticleSummary();

}

- (void)setOnDeviceSummaryButtonWithTitle:(id)a3
{
  WebProcessPlugInReaderJSController *value;
  NSString *v5;

  v5 = (NSString *)a3;
  value = self->_readerJSController.__ptr_.__value_;
  if (value)
    SafariShared::ReaderJSController::setOnDeviceSummaryButtonWithTitle((SafariShared::ReaderJSController *)value, v5);

}

- (void)updateSummaryTextAddingSummarizedChunk:(id)a3
{
  WebProcessPlugInReaderJSController *value;
  NSString *v5;

  v5 = (NSString *)a3;
  value = self->_readerJSController.__ptr_.__value_;
  if (value)
    SafariShared::ReaderJSController::updateSummaryTextAddingSummarizedChunk((SafariShared::ReaderJSController *)value, v5);

}

- (id)isolatedWorldForNextPageDetection
{
  WKWebProcessPlugInScriptWorld *isolatedWorldForNextPageDetection;
  WKWebProcessPlugInScriptWorld *v4;
  WKWebProcessPlugInScriptWorld *v5;

  isolatedWorldForNextPageDetection = self->_isolatedWorldForNextPageDetection;
  if (!isolatedWorldForNextPageDetection)
  {
    objc_msgSend(MEMORY[0x1E0CEF628], "world");
    v4 = (WKWebProcessPlugInScriptWorld *)objc_claimAutoreleasedReturnValue();
    v5 = self->_isolatedWorldForNextPageDetection;
    self->_isolatedWorldForNextPageDetection = v4;

    -[WKWebProcessPlugInScriptWorld makeAllShadowRootsOpen](self->_isolatedWorldForNextPageDetection, "makeAllShadowRootsOpen");
    -[WKWebProcessPlugInScriptWorld disableOverrideBuiltinsBehavior](self->_isolatedWorldForNextPageDetection, "disableOverrideBuiltinsBehavior");
    isolatedWorldForNextPageDetection = self->_isolatedWorldForNextPageDetection;
  }
  return isolatedWorldForNextPageDetection;
}

- (id)collectReaderContentFromPrintAndMailingFrame
{
  SafariServices::WebProcessPlugInReaderJSController *value;

  value = (SafariServices::WebProcessPlugInReaderJSController *)self->_readerJSController.__ptr_.__value_;
  if (value)
  {
    SafariServices::WebProcessPlugInReaderJSController::contentInPrintingMailingFrame(value);
    value = (SafariServices::WebProcessPlugInReaderJSController *)objc_claimAutoreleasedReturnValue();
  }
  return value;
}

- (id)printingMailingFrame
{
  SafariShared::JSUtilities **value;

  value = (SafariShared::JSUtilities **)self->_readerJSController.__ptr_.__value_;
  if (value)
  {
    SafariServices::WebProcessPlugInReaderJSController::printingMailingFrame(value);
    value = (SafariShared::JSUtilities **)objc_claimAutoreleasedReturnValue();
  }
  return value;
}

- (void)webProcessPlugInBrowserContextController:(id)a3 globalObjectIsAvailableForFrame:(id)a4 inScriptWorld:(id)a5
{
  id v6;
  id v7;

  v7 = a4;
  -[WBSWebProcessPlugInPageController mainFrame](self, "mainFrame");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
    -[_SFReaderWebProcessPlugInPageController _initializeReaderJSControllerForFrame:](self, "_initializeReaderJSControllerForFrame:", v7);

}

- (_SFWebProcessPlugInReaderEnabledPageController)originalPageController
{
  return (_SFWebProcessPlugInReaderEnabledPageController *)objc_loadWeakRetained((id *)&self->_originalPageController);
}

- (void)setOriginalPageController:(id)a3
{
  objc_storeWeak((id *)&self->_originalPageController, a3);
}

- (void).cxx_destruct
{
  WebProcessPlugInReaderJSController *value;

  objc_destroyWeak((id *)&self->_originalPageController);
  objc_storeStrong((id *)&self->_isolatedWorldForNextPageDetection, 0);
  value = self->_readerJSController.__ptr_.__value_;
  self->_readerJSController.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(WebProcessPlugInReaderJSController *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
