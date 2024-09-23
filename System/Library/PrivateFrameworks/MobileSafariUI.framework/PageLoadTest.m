@implementation PageLoadTest

- (PageLoadTest)initWithTabDocument:(id)a3
{
  return -[PageLoadTest initWithTabDocument:pagesNeedingMemoryWarningSent:](self, "initWithTabDocument:pagesNeedingMemoryWarningSent:", a3, 0);
}

- (PageLoadTest)initWithTabDocument:(id)a3 pagesNeedingMemoryWarningSent:(id)a4
{
  id v7;
  id v8;
  PageLoadTest *v9;
  PageLoadTest *v10;
  PageLoadTest *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PageLoadTest;
  v9 = -[PageLoadTest init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pagesNeedingMemoryWarningSent, a4);
    objc_storeStrong((id *)&v10->_tabDocument, a3);
    -[PageLoadTest _setUpWebProcessForPageLoadMeasurementCollection](v10, "_setUpWebProcessForPageLoadMeasurementCollection");
    v11 = v10;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[PageLoadTest _invalidateRemoteObjects](self, "_invalidateRemoteObjects");
  v3.receiver = self;
  v3.super_class = (Class)PageLoadTest;
  -[PageLoadTest dealloc](&v3, sel_dealloc);
}

- (void)_invalidateRemoteObjects
{
  void *v3;
  _WKRemoteObjectInterface *eventsListenerInterface;
  id v5;

  -[TabDocument webView](self->_tabDocument, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_remoteObjectRegistry");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "unregisterExportedObject:interface:", self, self->_eventsListenerInterface);
  eventsListenerInterface = self->_eventsListenerInterface;
  self->_eventsListenerInterface = 0;

}

- (void)_setUpWebProcessForPageLoadMeasurementCollection
{
  -[PageLoadTest _setUpPageLoadTestEventsListener](self, "_setUpPageLoadTestEventsListener");
  -[PageLoadTest _enablePageLoadMeasurementCollection](self, "_enablePageLoadMeasurementCollection");
}

- (void)_setUpPageLoadTestEventsListener
{
  void *v3;
  _WKRemoteObjectInterface *v4;
  _WKRemoteObjectInterface *eventsListenerInterface;
  id v6;

  -[TabDocument webView](self->_tabDocument, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_remoteObjectRegistry");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1F024BE58);
  v4 = (_WKRemoteObjectInterface *)objc_claimAutoreleasedReturnValue();
  eventsListenerInterface = self->_eventsListenerInterface;
  self->_eventsListenerInterface = v4;

  objc_msgSend(v6, "registerExportedObject:interface:", self, self->_eventsListenerInterface);
}

- (void)_enablePageLoadMeasurementCollection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[TabDocument webView](self->_tabDocument, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_remoteObjectRegistry");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1F024BEB8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxyWithInterface:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_pagesNeedingMemoryWarningSent)
    objc_msgSend(v5, "enablePageMemoryMeasurementCollection:");

}

- (void)resetAfterWebProcessCrash
{
  -[PageLoadTest _invalidateRemoteObjects](self, "_invalidateRemoteObjects");
  -[PageLoadTest _setUpWebProcessForPageLoadMeasurementCollection](self, "_setUpWebProcessForPageLoadMeasurementCollection");
}

- (void)didFinishPageLoadWithLoadData:(id)a3
{
  TabDocument *tabDocument;
  id v4;
  id v5;

  tabDocument = self->_tabDocument;
  v4 = a3;
  -[TabDocument pageLoadStatistics](tabDocument, "pageLoadStatistics");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pageLoadFinishedForTestsWK2WithLoadData:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsListenerInterface, 0);
  objc_storeStrong((id *)&self->_pagesNeedingMemoryWarningSent, 0);
  objc_storeStrong((id *)&self->_tabDocument, 0);
}

@end
