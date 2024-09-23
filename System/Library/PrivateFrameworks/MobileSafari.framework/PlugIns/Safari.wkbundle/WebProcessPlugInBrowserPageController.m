@implementation WebProcessPlugInBrowserPageController

- (void)_setupPageLoadTestController
{
  uint64_t v2;
  _WKRemoteObjectInterface *v4;
  _WKRemoteObjectInterface *pageLoadTestControllerInterface;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;

  objc_msgSend_remoteObjectInterfaceWithProtocol_(MEMORY[0x24BDFA9B0], a2, (uint64_t)&unk_255923AC0, v2);
  v4 = (_WKRemoteObjectInterface *)objc_claimAutoreleasedReturnValue();
  pageLoadTestControllerInterface = self->_pageLoadTestControllerInterface;
  self->_pageLoadTestControllerInterface = v4;

  objc_msgSend_browserContextController(self, v6, v7, v8);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__remoteObjectRegistry(v14, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerExportedObject_interface_(v12, v13, (uint64_t)self, (uint64_t)self->_pageLoadTestControllerInterface);

}

- (void)_setupTouchIconFetcherController
{
  uint64_t v2;
  _WKRemoteObjectInterface *v4;
  _WKRemoteObjectInterface *touchIconFetcherControllerInterface;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;

  objc_msgSend_remoteObjectInterfaceWithProtocol_(MEMORY[0x24BDFA9B0], a2, (uint64_t)&unk_255923B98, v2);
  v4 = (_WKRemoteObjectInterface *)objc_claimAutoreleasedReturnValue();
  touchIconFetcherControllerInterface = self->_touchIconFetcherControllerInterface;
  self->_touchIconFetcherControllerInterface = v4;

  objc_msgSend_browserContextController(self, v6, v7, v8);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__remoteObjectRegistry(v14, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerExportedObject_interface_(v12, v13, (uint64_t)self, (uint64_t)self->_touchIconFetcherControllerInterface);

}

- (void)_readPageLoadTestParameters
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  MeasurementControllerBase *pageLoadTestMeasurementController;
  PageLoadTestMeasurementController *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  MeasurementControllerBase *v23;
  MeasurementControllerBase *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;

  objc_msgSend_webProcessPlugIn(self, a2, v2, v3);
  v63 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_plugInController(v63, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_parameters(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForKey_(v12, v13, (uint64_t)CFSTR("enablePageLoadMeasurementCollection"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    pageLoadTestMeasurementController = self->_pageLoadTestMeasurementController;

    if (pageLoadTestMeasurementController)
      return;
    v17 = [PageLoadTestMeasurementController alloc];
    objc_msgSend_browserContextController(self, v18, v19, v20);
    v64 = (id)objc_claimAutoreleasedReturnValue();
    v23 = (MeasurementControllerBase *)objc_msgSend_initWithPluginPageContextController_(v17, v21, (uint64_t)v64, v22);
    v24 = self->_pageLoadTestMeasurementController;
    self->_pageLoadTestMeasurementController = v23;

    objc_msgSend_webProcessPlugIn(self, v25, v26, v27);
    v65 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_plugInController(v65, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parameters(v31, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueForKey_(v35, v36, (uint64_t)CFSTR("pageLoadMeasurementVersionNumber"), v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend_intValue(v38, v39, v40, v41);
    objc_msgSend_setVersion_(self->_pageLoadTestMeasurementController, v43, v42, v44);

    objc_msgSend_webProcessPlugIn(self, v45, v46, v47);
    v63 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_plugInController(v63, v48, v49, v50);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parameters(v8, v51, v52, v53);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueForKey_(v12, v54, (uint64_t)CFSTR("pageLoadMeasurementAllSubresourcesFinishedLoadingDelay"), v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v56, v57, v58, v59);
    objc_msgSend_setAllSubresourcesFinishedLoadingDelay_(self->_pageLoadTestMeasurementController, v60, v61, v62);

  }
}

- (WebProcessPlugInBrowserPageController)initWithPlugIn:(id)a3 contextController:(id)a4
{
  id v6;
  id v7;
  WebProcessPlugInBrowserPageController *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  WebProcessPlugInBrowserPageController *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  SafariFormMetadataController *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  WebProcessPlugInBrowserPageController *v25;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)WebProcessPlugInBrowserPageController;
  v8 = -[_SFWebProcessPlugInReaderEnabledPageController initWithPlugIn:contextController:](&v27, sel_initWithPlugIn_contextController_, v6, v7);
  v12 = v8;
  if (v8)
  {
    objc_msgSend__setupPageLoadTestController(v8, v9, v10, v11);
    objc_msgSend__readPageLoadTestParameters(v12, v13, v14, v15);
    v12->_haveCheckedIfPageLoadTestIsEnabled = 0;
    objc_msgSend__setupTouchIconFetcherController(v12, v16, v17, v18);
    v19 = [SafariFormMetadataController alloc];
    v22 = (void *)objc_msgSend_initWithPageController_(v19, v20, (uint64_t)v12, v21);
    objc_msgSend_setFormMetadataController_(v12, v23, (uint64_t)v22, v24);
    v25 = v12;

  }
  return v12;
}

- (unint64_t)webProcessPlugInBrowserContextControllerRenderingProgressEvents:(id)a3
{
  return 256;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  objc_super v8;

  objc_msgSend_browserContextController(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLoadDelegate_(v5, v6, 0, v7);

  v8.receiver = self;
  v8.super_class = (Class)WebProcessPlugInBrowserPageController;
  -[WebProcessPlugInBrowserPageController dealloc](&v8, sel_dealloc);
}

- (void)willDestroyBrowserContextController:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  _WKRemoteObjectInterface *pageLoadTestControllerInterface;
  const char *v11;
  _WKRemoteObjectInterface *touchIconFetcherControllerInterface;
  objc_super v13;

  v4 = a3;
  objc_msgSend__remoteObjectRegistry(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unregisterExportedObject_interface_(v8, v9, (uint64_t)self, (uint64_t)self->_pageLoadTestControllerInterface);
  pageLoadTestControllerInterface = self->_pageLoadTestControllerInterface;
  self->_pageLoadTestControllerInterface = 0;

  objc_msgSend_unregisterExportedObject_interface_(v8, v11, (uint64_t)self, (uint64_t)self->_touchIconFetcherControllerInterface);
  touchIconFetcherControllerInterface = self->_touchIconFetcherControllerInterface;
  self->_touchIconFetcherControllerInterface = 0;

  v13.receiver = self;
  v13.super_class = (Class)WebProcessPlugInBrowserPageController;
  -[_SFWebProcessPlugInReaderEnabledPageController willDestroyBrowserContextController:](&v13, sel_willDestroyBrowserContextController_, v4);

}

- (void)fetchTouchIconURLs
{
  uint64_t v2;
  uint64_t v3;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  id v40;

  objc_msgSend_mainFrame(self, a2, v2, v3);
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BE833C8]);
  v8 = (void *)objc_msgSend_initWithWebProcessPlugInFrame_(v5, v6, (uint64_t)v40, v7);
  objc_msgSend_URL(v40, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appleTouchIconURLs(v8, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend_mutableCopy(v16, v17, v18, v19);

  objc_msgSend_URLWithString_relativeToURL_(MEMORY[0x24BDBCF48], v21, (uint64_t)CFSTR("/apple-touch-icon-precomposed.png"), (uint64_t)v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v20, v23, (uint64_t)v22, v24);

  objc_msgSend_URLWithString_relativeToURL_(MEMORY[0x24BDBCF48], v25, (uint64_t)CFSTR("/apple-touch-icon.png"), (uint64_t)v12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v20, v27, (uint64_t)v26, v28);

  objc_msgSend_faviconURLs(v8, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v20, v33, (uint64_t)v32, v34);

  objc_msgSend__touchIconFetcherObserverProxy(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_didFetchTouchIconURLs_forURL_(v38, v39, (uint64_t)v20, (uint64_t)v12);

}

- (id)_touchIconFetcherObserverProxy
{
  uint64_t v2;
  TouchIconFetcherObserver *touchIconFetcherObserverProxy;
  TouchIconFetcherObserver *v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  TouchIconFetcherObserver *v17;
  TouchIconFetcherObserver *v18;

  touchIconFetcherObserverProxy = self->_touchIconFetcherObserverProxy;
  if (touchIconFetcherObserverProxy)
  {
    v4 = touchIconFetcherObserverProxy;
  }
  else
  {
    objc_msgSend_remoteObjectInterfaceWithProtocol_(MEMORY[0x24BDFA9B0], a2, (uint64_t)&unk_255929900, v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_browserContextController(self, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__remoteObjectRegistry(v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_remoteObjectProxyWithInterface_(v14, v15, (uint64_t)v6, v16);
    v17 = (TouchIconFetcherObserver *)objc_claimAutoreleasedReturnValue();
    v18 = self->_touchIconFetcherObserverProxy;
    self->_touchIconFetcherObserverProxy = v17;

    v4 = self->_touchIconFetcherObserverProxy;
  }
  return v4;
}

- (void)enablePageMemoryMeasurementCollection:(id)a3
{
  PageMemoryMeasurementController *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  MeasurementControllerBase *v10;
  MeasurementControllerBase *pageLoadTestMeasurementController;
  id v12;

  v12 = a3;
  v4 = [PageMemoryMeasurementController alloc];
  objc_msgSend_browserContextController(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (MeasurementControllerBase *)objc_msgSend_initWithPluginPageContextController_pagesNeedingMemoryWarningSent_(v4, v9, (uint64_t)v8, (uint64_t)v12);
  pageLoadTestMeasurementController = self->_pageLoadTestMeasurementController;
  self->_pageLoadTestMeasurementController = v10;

}

- (void)_logPageLoadStarted:(id)a3
{
  kdebug_trace();
}

- (void)_logPageLoadCompleted:(id)a3 withErrorCode:(int64_t)a4
{
  kdebug_trace();
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didStartProvisionalLoadForFrame:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WebProcessPlugInBrowserPageController;
  -[_SFWebProcessPlugInReaderEnabledPageController webProcessPlugInBrowserContextController:didStartProvisionalLoadForFrame:](&v17, sel_webProcessPlugInBrowserContextController_didStartProvisionalLoadForFrame_, v6, v7);
  objc_msgSend_mainFrame(v6, v8, v9, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v7)
  {
    objc_msgSend__logPageLoadStarted_(self, v12, (uint64_t)v7, v13);
    if (!self->_haveCheckedIfPageLoadTestIsEnabled)
      objc_msgSend__readPageLoadTestParameters(self, v14, v15, v16);
    self->_haveCheckedIfPageLoadTestIsEnabled = 1;
    objc_msgSend_webProcessPlugInBrowserContextController_didStartProvisionalLoadForFrame_(self->_pageLoadTestMeasurementController, v14, (uint64_t)v6, (uint64_t)v7);
  }

}

- (void)webProcessPlugInBrowserContextController:(id)a3 didCommitLoadForFrame:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WebProcessPlugInBrowserPageController;
  -[_SFWebProcessPlugInReaderEnabledPageController webProcessPlugInBrowserContextController:didCommitLoadForFrame:](&v12, sel_webProcessPlugInBrowserContextController_didCommitLoadForFrame_, v6, v7);
  objc_msgSend_webProcessPlugInBrowserContextController_didCommitLoadForFrame_(self->_pageLoadTestMeasurementController, v8, (uint64_t)v6, (uint64_t)v7);
  objc_msgSend_mainFrame(v6, v9, v10, v11);

}

- (void)webProcessPlugInBrowserContextController:(id)a3 didFinishDocumentLoadForFrame:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)WebProcessPlugInBrowserPageController;
  -[_SFWebProcessPlugInReaderEnabledPageController webProcessPlugInBrowserContextController:didFinishDocumentLoadForFrame:](&v9, sel_webProcessPlugInBrowserContextController_didFinishDocumentLoadForFrame_, v6, v7);
  objc_msgSend_webProcessPlugInBrowserContextController_didFinishDocumentLoadForFrame_(self->_pageLoadTestMeasurementController, v8, (uint64_t)v6, (uint64_t)v7);

}

- (void)webProcessPlugInBrowserContextController:(id)a3 didFinishLoadForFrame:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  const char *v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WebProcessPlugInBrowserPageController;
  -[_SFWebProcessPlugInReaderEnabledPageController webProcessPlugInBrowserContextController:didFinishLoadForFrame:](&v14, sel_webProcessPlugInBrowserContextController_didFinishLoadForFrame_, v6, v7);
  objc_msgSend_mainFrame(v6, v8, v9, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v7)
  {
    objc_msgSend__logPageLoadCompleted_withErrorCode_(self, v12, (uint64_t)v7, 0);
    objc_msgSend_webProcessPlugInBrowserContextController_didFinishLoadForFrame_(self->_pageLoadTestMeasurementController, v13, (uint64_t)v6, (uint64_t)v7);
  }

}

- (void)webProcessPlugInBrowserContextController:(id)a3 didFirstVisuallyNonEmptyLayoutForFrame:(id)a4
{
  MEMORY[0x24BEDD108](self->_pageLoadTestMeasurementController, sel_webProcessPlugInBrowserContextController_didFirstVisuallyNonEmptyLayoutForFrame_, a3, a4);
}

- (void)webProcessPlugInBrowserContextController:(id)a3 renderingProgressDidChange:(unint64_t)a4
{
  id v6;
  const char *v7;
  objc_super v8;

  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WebProcessPlugInBrowserPageController;
  -[_SFWebProcessPlugInReaderEnabledPageController webProcessPlugInBrowserContextController:renderingProgressDidChange:](&v8, sel_webProcessPlugInBrowserContextController_renderingProgressDidChange_, v6, a4);
  objc_msgSend_webProcessPlugInBrowserContextController_renderingProgressDidChange_(self->_pageLoadTestMeasurementController, v7, (uint64_t)v6, a4);

}

- (void)webProcessPlugInBrowserContextController:(id)a3 didHandleOnloadEventsForFrame:(id)a4
{
  MEMORY[0x24BEDD108](self->_pageLoadTestMeasurementController, sel_webProcessPlugInBrowserContextController_didHandleOnloadEventsForFrame_, a3, a4);
}

- (void)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 didInitiateLoadForResource:(unint64_t)a5 request:(id)a6
{
  MEMORY[0x24BEDD108](self->_pageLoadTestMeasurementController, sel_webProcessPlugInBrowserContextController_frame_didInitiateLoadForResource_request_, a3, a4);
}

- (void)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 didFinishLoadForResource:(unint64_t)a5
{
  MEMORY[0x24BEDD108](self->_pageLoadTestMeasurementController, sel_webProcessPlugInBrowserContextController_frame_didFinishLoadForResource_, a3, a4);
}

- (void)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 didFailLoadForResource:(unint64_t)a5 error:(id)a6
{
  MEMORY[0x24BEDD108](self->_pageLoadTestMeasurementController, sel_webProcessPlugInBrowserContextController_frame_didFailLoadForResource_error_, a3, a4);
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didFailProvisionalLoadWithErrorForFrame:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  id v23;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_mainFrame(v23, v10, v11, v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 == v8)
  {
    v17 = objc_msgSend_code(v9, v14, v15, v16);

    if (v17 != -999)
    {
      v21 = objc_msgSend_code(v9, v18, v19, v20);
      objc_msgSend__logPageLoadCompleted_withErrorCode_(self, v22, (uint64_t)v8, v21);
    }
  }
  else
  {

  }
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didFailLoadWithErrorForFrame:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  id v23;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_mainFrame(v23, v10, v11, v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 == v8)
  {
    v18 = objc_msgSend_code(v9, v14, v15, v16);

    if (v18 != -999)
    {
      v21 = objc_msgSend_code(v9, v17, v19, v20);
      objc_msgSend__logPageLoadCompleted_withErrorCode_(self, v22, (uint64_t)v8, v21);
    }
  }
  else
  {

  }
  objc_msgSend_webProcessPlugInBrowserContextController_didFailLoadWithErrorForFrame_error_(self->_pageLoadTestMeasurementController, v17, (uint64_t)v23, (uint64_t)v8, v9);

}

- (void)webProcessPlugInBrowserContextController:(id)a3 didRemoveFrameFromHierarchy:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WebProcessPlugInBrowserPageController;
  -[_SFWebProcessPlugInAutoFillPageController webProcessPlugInBrowserContextController:didRemoveFrameFromHierarchy:](&v4, sel_webProcessPlugInBrowserContextController_didRemoveFrameFromHierarchy_, a3, a4);
}

- (void)webProcessPlugInBrowserContextController:(id)a3 globalObjectIsAvailableForFrame:(id)a4 inScriptWorld:(id)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WebProcessPlugInBrowserPageController;
  -[_SFWebProcessPlugInReaderEnabledPageController webProcessPlugInBrowserContextController:globalObjectIsAvailableForFrame:inScriptWorld:](&v5, sel_webProcessPlugInBrowserContextController_globalObjectIsAvailableForFrame_inScriptWorld_, a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchIconFetcherObserverProxy, 0);
  objc_storeStrong((id *)&self->_pageLoadTestMeasurementController, 0);
  objc_storeStrong((id *)&self->_touchIconFetcherControllerInterface, 0);
  objc_storeStrong((id *)&self->_pageLoadTestControllerInterface, 0);
}

@end
