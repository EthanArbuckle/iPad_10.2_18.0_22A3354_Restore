@implementation _SFWebProcessPlugInReaderEnabledPageController

- (_SFWebProcessPlugInReaderEnabledPageController)initWithPlugIn:(id)a3 contextController:(id)a4
{
  id v6;
  id v7;
  _SFWebProcessPlugInReaderEnabledPageController *v8;
  _SFWebProcessPlugInReaderEnabledPageController *v9;
  SFWebProcessPlugInPageExtensionController *v10;
  SFWebProcessPlugInPageExtensionController *extensionController;
  SFWebProcessPlugInCertificateWarningController *v12;
  SFWebProcessPlugInCertificateWarningController *certificateWarningController;
  _SFWebProcessSharingLinkExtractor *v14;
  _SFWebProcessSharingLinkExtractor *sharingLinkExtractor;
  _SFWebProcessPlugInReaderEnabledPageController *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_SFWebProcessPlugInReaderEnabledPageController;
  v8 = -[_SFWebProcessPlugInAutoFillPageController initWithPlugIn:contextController:](&v18, sel_initWithPlugIn_contextController_, v6, v7);
  v9 = v8;
  if (v8)
  {
    -[_SFWebProcessPlugInReaderEnabledPageController _setUpReaderControllerInterface](v8, "_setUpReaderControllerInterface");
    v10 = -[SFWebProcessPlugInPageExtensionController initWithBrowserContextController:]([SFWebProcessPlugInPageExtensionController alloc], "initWithBrowserContextController:", v7);
    extensionController = v9->_extensionController;
    v9->_extensionController = v10;

    v12 = -[SFWebProcessPlugInCertificateWarningController initWithPageController:]([SFWebProcessPlugInCertificateWarningController alloc], "initWithPageController:", v9);
    certificateWarningController = v9->_certificateWarningController;
    v9->_certificateWarningController = v12;

    v14 = -[_SFWebProcessSharingLinkExtractor initWithPageController:]([_SFWebProcessSharingLinkExtractor alloc], "initWithPageController:", v9);
    sharingLinkExtractor = v9->_sharingLinkExtractor;
    v9->_sharingLinkExtractor = v14;

    v16 = v9;
  }

  return v9;
}

- (void)_setUpReaderControllerInterface
{
  _WKRemoteObjectInterface *v3;
  _WKRemoteObjectInterface *availabilityControllerInterface;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EE770E88);
  v3 = (_WKRemoteObjectInterface *)objc_claimAutoreleasedReturnValue();
  availabilityControllerInterface = self->_availabilityControllerInterface;
  self->_availabilityControllerInterface = v3;

  -[WBSWebProcessPlugInPageController browserContextController](self, "browserContextController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_remoteObjectRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerExportedObject:interface:", self, self->_availabilityControllerInterface);

}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  return self;
}

- (void)willDestroyBrowserContextController:(id)a3
{
  id v4;
  ReaderAvailabilityController *value;
  SFWebProcessPlugInPageExtensionController *extensionController;
  objc_super v7;

  v4 = a3;
  -[_SFWebProcessPlugInReaderEnabledPageController _clearReaderControllerInterface](self, "_clearReaderControllerInterface");
  value = self->_readerAvailabilityController.__ptr_.__value_;
  self->_readerAvailabilityController.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(ReaderAvailabilityController *))(*(_QWORD *)value + 8))(value);
  -[_SFWebProcessPlugInReaderEnabledPageController setReaderPageController:](self, "setReaderPageController:", 0);
  extensionController = self->_extensionController;
  self->_extensionController = 0;

  v7.receiver = self;
  v7.super_class = (Class)_SFWebProcessPlugInReaderEnabledPageController;
  -[_SFWebProcessPlugInAutoFillPageController willDestroyBrowserContextController:](&v7, sel_willDestroyBrowserContextController_, v4);

}

- (void)articleContentDidChange
{
  -[_SFReaderWebProcessPlugInPageController reloadArticle](self->_readerPageController, "reloadArticle");
}

- (void)didDetermineReaderAvailability:(id)a3
{
  SFReaderEventsListener *readerActivityListenerProxy;
  id v5;

  v5 = a3;
  readerActivityListenerProxy = self->_readerActivityListenerProxy;
  if (!readerActivityListenerProxy)
  {
    -[_SFWebProcessPlugInReaderEnabledPageController _setUpReaderActivityListenerProxy](self, "_setUpReaderActivityListenerProxy");
    readerActivityListenerProxy = self->_readerActivityListenerProxy;
  }
  -[SFReaderEventsListener didDetermineReaderAvailability:](readerActivityListenerProxy, "didDetermineReaderAvailability:", v5);

}

- (void)didDetermineAdditionalTextSamples:(id)a3
{
  SFReaderEventsListener *readerActivityListenerProxy;
  id v5;

  v5 = a3;
  readerActivityListenerProxy = self->_readerActivityListenerProxy;
  if (!readerActivityListenerProxy)
  {
    -[_SFWebProcessPlugInReaderEnabledPageController _setUpReaderActivityListenerProxy](self, "_setUpReaderActivityListenerProxy");
    readerActivityListenerProxy = self->_readerActivityListenerProxy;
  }
  -[SFReaderEventsListener didDetermineAdditionalTextSamples:](readerActivityListenerProxy, "didDetermineAdditionalTextSamples:", v5);

}

- (void)readerTextWasExtracted:(id)a3 withMetadata:(id)a4 wasDeterminingAvailability:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  SFReaderEventsListener *readerActivityListenerProxy;
  id v10;

  v5 = a5;
  v10 = a3;
  v8 = a4;
  readerActivityListenerProxy = self->_readerActivityListenerProxy;
  if (!readerActivityListenerProxy)
  {
    -[_SFWebProcessPlugInReaderEnabledPageController _setUpReaderActivityListenerProxy](self, "_setUpReaderActivityListenerProxy");
    readerActivityListenerProxy = self->_readerActivityListenerProxy;
  }
  -[SFReaderEventsListener readerTextWasExtracted:withMetadata:wasDeterminingAvailabilility:](readerActivityListenerProxy, "readerTextWasExtracted:withMetadata:wasDeterminingAvailabilility:", v10, v8, v5);

}

- (void)_setUpReaderActivityListenerProxy
{
  void *v3;
  void *v4;
  SFReaderEventsListener *v5;
  SFReaderEventsListener *readerActivityListenerProxy;
  id v7;

  -[WBSWebProcessPlugInPageController browserContextController](self, "browserContextController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_remoteObjectRegistry");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EE744C18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxyWithInterface:", v4);
  v5 = (SFReaderEventsListener *)objc_claimAutoreleasedReturnValue();
  readerActivityListenerProxy = self->_readerActivityListenerProxy;
  self->_readerActivityListenerProxy = v5;

}

- (void)_clearReaderControllerInterface
{
  void *v3;
  _WKRemoteObjectInterface *availabilityControllerInterface;
  id v5;

  if (self->_readerAvailabilityController.__ptr_.__value_)
  {
    -[WBSWebProcessPlugInPageController browserContextController](self, "browserContextController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_remoteObjectRegistry");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "unregisterExportedObject:interface:", self, self->_availabilityControllerInterface);
    availabilityControllerInterface = self->_availabilityControllerInterface;
    self->_availabilityControllerInterface = 0;

  }
}

- (void)_detectAvailabilityAfterDelay:(double)a3 loadEvent:(int)a4
{
  ReaderAvailabilityController *value;

  value = self->_readerAvailabilityController.__ptr_.__value_;
  if (!*((_BYTE *)value + 104))
  {
    SafariShared::ReaderAvailabilityController::setCanRunAvailabilityDetection((SafariShared::ReaderAvailabilityController *)value);
    SafariShared::ReaderAvailabilityController::detectAvailabilityAfterDelay();
  }
}

- (void)_detectReaderAvailabilityAfterSameDocumentNavigation
{
  ReaderAvailabilityController *value;

  value = self->_readerAvailabilityController.__ptr_.__value_;
  if (!*((_BYTE *)value + 104))
  {
    SafariShared::ReaderAvailabilityController::setCanRunAvailabilityDetection((SafariShared::ReaderAvailabilityController *)value);
    SafariShared::ReaderAvailabilityController::detectAvailabilityAfterSameDocumentNavigation((SafariShared::ReaderAvailabilityController *)self->_readerAvailabilityController.__ptr_.__value_);
  }
}

- (OpaqueJSValue)originalArticleFinder
{
  OpaqueJSValue *result;

  result = (OpaqueJSValue *)self->_readerAvailabilityController.__ptr_.__value_;
  if (result)
    return (OpaqueJSValue *)SafariShared::ReaderAvailabilityController::originalArticleFinder(result);
  return result;
}

- (void)setReaderInitialTopScrollOffset:(int64_t)a3 configuration:(id)a4 isViewingArchive:(BOOL)a5
{
  self->_cachedReaderTopScrollOffset = a3;
  objc_storeStrong((id *)&self->_initialReaderConfiguration, a4);
  self->_viewingReadingListArchive = a5;
}

- (void)setConfiguration:(id)a3
{
  _SFReaderWebProcessPlugInPageController *readerPageController;
  id v5;

  v5 = a3;
  readerPageController = self->_readerPageController;
  if (readerPageController)
    -[_SFReaderWebProcessPlugInPageController setConfiguration:](readerPageController, "setConfiguration:", v5);

}

- (void)activateFont:(id)a3
{
  id v3;
  uint64_t v4;
  CTFontDescriptorRef v5;
  const __CFArray *v6;
  _QWORD v7[3];
  _QWORD v8[3];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0CA82D8];
  v7[0] = *MEMORY[0x1E0CA8300];
  v7[1] = v4;
  v8[0] = v3;
  v8[1] = MEMORY[0x1E0C9AAB0];
  v7[2] = *MEMORY[0x1E0CA82E0];
  v8[2] = MEMORY[0x1E0C9AAB0];
  v5 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3));
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

  CTFontDescriptorMatchFontDescriptorsWithProgressHandler(v6, 0, &__block_literal_global_40);
}

- (void)setReaderIsActive:(BOOL)a3
{
  _SFReaderWebProcessPlugInPageController *readerPageController;

  readerPageController = self->_readerPageController;
  if (readerPageController)
    -[_SFReaderWebProcessPlugInPageController setReaderIsActive:](readerPageController, "setReaderIsActive:", a3);
}

- (void)setArticleLocale:(id)a3
{
  _SFReaderWebProcessPlugInPageController *readerPageController;
  id v5;

  v5 = a3;
  readerPageController = self->_readerPageController;
  if (readerPageController)
    -[_SFReaderWebProcessPlugInPageController setArticleLocale:](readerPageController, "setArticleLocale:", v5);

}

- (void)setArticleSummary:(id)a3 withSummaryHeader:(id)a4 tableOfContentsHeader:(id)a5 readerURLString:(id)a6 titles:(id)a7 paths:(id)a8 trailingText:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _SFReaderWebProcessPlugInPageController *readerPageController;
  id v22;

  v22 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  readerPageController = self->_readerPageController;
  if (readerPageController)
    -[_SFReaderWebProcessPlugInPageController setArticleSummary:withSummaryHeader:tableOfContentsHeader:readerURLString:titles:paths:trailingText:](readerPageController, "setArticleSummary:withSummaryHeader:tableOfContentsHeader:readerURLString:titles:paths:trailingText:", v22, v15, v16, v17, v18, v19, v20);

}

- (void)setOnDeviceSummaryButtonWithTitle:(id)a3
{
  _SFReaderWebProcessPlugInPageController *readerPageController;
  id v5;

  v5 = a3;
  readerPageController = self->_readerPageController;
  if (readerPageController)
    -[_SFReaderWebProcessPlugInPageController setOnDeviceSummaryButtonWithTitle:](readerPageController, "setOnDeviceSummaryButtonWithTitle:", v5);

}

- (void)updateSummaryTextAddingSummarizedChunk:(id)a3
{
  _SFReaderWebProcessPlugInPageController *readerPageController;
  id v5;

  v5 = a3;
  readerPageController = self->_readerPageController;
  if (readerPageController)
    -[_SFReaderWebProcessPlugInPageController updateSummaryTextAddingSummarizedChunk:](readerPageController, "updateSummaryTextAddingSummarizedChunk:", v5);

}

- (void)getReaderArtitleTitleWithReply:(id)a3
{
  void (**v4)(id, void *);
  ReaderAvailabilityController *value;
  void *v6;
  void (**v7)(id, void *);

  v4 = (void (**)(id, void *))a3;
  value = self->_readerAvailabilityController.__ptr_.__value_;
  v7 = v4;
  if (value)
  {
    (*(void (**)(ReaderAvailabilityController *))(*(_QWORD *)value + 16))(value);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v6);

  }
  else
  {
    v4[2](v4, 0);
  }

}

- (void)checkReaderAvailability
{
  ReaderAvailabilityController *value;
  uint64_t v4;
  id v5;

  value = self->_readerAvailabilityController.__ptr_.__value_;
  if (value)
  {
    v4 = (*(uint64_t (**)(ReaderAvailabilityController *, SEL))(*(_QWORD *)value + 128))(value, a2);
    v5 = objc_alloc_init(MEMORY[0x1E0D8AB60]);
    objc_msgSend(v5, "setReaderAvailable:", v4);
    -[SFReaderEventsListener didDetermineReaderAvailabilityForDynamicCheck:](self->_readerActivityListenerProxy, "didDetermineReaderAvailabilityForDynamicCheck:", v5);

  }
}

- (void)prepareToTransitionToReader
{
  ReaderAvailabilityController *value;

  value = self->_readerAvailabilityController.__ptr_.__value_;
  if (value)
    SafariShared::ReaderAvailabilityController::prepareToTransitionToReader((SafariShared::ReaderAvailabilityController *)value);
}

- (void)didCreateReaderPageContextHandle:(id)a3
{
  id v4;

  +[_SFReaderWebProcessPlugInPageController readerPageControllerForContextHandle:](_SFReaderWebProcessPlugInPageController, "readerPageControllerForContextHandle:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_SFReaderWebProcessPlugInPageController setOriginalPageController:](self->_readerPageController, "setOriginalPageController:", 0);
    objc_msgSend(v4, "setOriginalPageController:", self);
    -[_SFWebProcessPlugInReaderEnabledPageController setReaderPageController:](self, "setReaderPageController:", v4);
  }

}

- (void)loadNewReaderArticle
{
  if (self->_readerPageController)
  {
    -[_SFWebProcessPlugInReaderEnabledPageController prepareToTransitionToReader](self, "prepareToTransitionToReader");
    -[_SFReaderWebProcessPlugInPageController loadNewArticle](self->_readerPageController, "loadNewArticle");
  }
}

- (void)collectReadingListItemInfoWithBookmarkID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  SafariServices::ReaderAvailabilityController::collectReadingListItemInformation((SafariServices::ReaderAvailabilityController *)self->_readerAvailabilityController.__ptr_.__value_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[SFReaderEventsListener didCollectReadingListItemInfo:bookmarkID:](self->_readerActivityListenerProxy, "didCollectReadingListItemInfo:bookmarkID:", v4, v5);

}

- (void)didSetReaderConfiguration:(id)a3
{
  -[SFReaderEventsListener didSetReaderConfiguration:](self->_readerActivityListenerProxy, "didSetReaderConfiguration:", a3);
}

- (void)readerContentDidBecomeReadyWithArticleText:(id)a3
{
  -[SFReaderEventsListener contentDidBecomeReadyWithArticleText:](self->_readerActivityListenerProxy, "contentDidBecomeReadyWithArticleText:", a3);
}

- (void)didRequestOnDeviceSummary
{
  -[SFReaderEventsListener didRequestOnDeviceSummary](self->_readerActivityListenerProxy, "didRequestOnDeviceSummary");
}

- (void)didSetSummary
{
  -[SFReaderEventsListener didSetSummary](self->_readerActivityListenerProxy, "didSetSummary");
}

- (void)collectReaderContentForMail
{
  id v3;

  -[_SFReaderWebProcessPlugInPageController collectReaderContentFromPrintAndMailingFrame](self->_readerPageController, "collectReaderContentFromPrintAndMailingFrame");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SFReaderEventsListener didCollectReaderContentForMail:](self->_readerActivityListenerProxy, "didCollectReaderContentForMail:");

}

- (void)prepareReaderContentForPrinting
{
  void *v3;
  SFReaderEventsListener *readerActivityListenerProxy;
  void *v5;
  id v6;

  -[_SFReaderWebProcessPlugInPageController printingMailingFrame](self->_readerPageController, "printingMailingFrame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  readerActivityListenerProxy = self->_readerActivityListenerProxy;
  v6 = v3;
  objc_msgSend(v3, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFReaderEventsListener didPrepareReaderContentForPrinting:](readerActivityListenerProxy, "didPrepareReaderContentForPrinting:", v5);

}

- (void)collectArticleContent
{
  SFReaderEventsListener *readerActivityListenerProxy;
  id v4;

  SafariServices::ReaderAvailabilityController::articleContent((SafariServices::ReaderAvailabilityController *)self->_readerAvailabilityController.__ptr_.__value_);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  readerActivityListenerProxy = self->_readerActivityListenerProxy;
  if (!readerActivityListenerProxy)
  {
    -[_SFWebProcessPlugInReaderEnabledPageController _setUpReaderActivityListenerProxy](self, "_setUpReaderActivityListenerProxy");
    readerActivityListenerProxy = self->_readerActivityListenerProxy;
  }
  -[SFReaderEventsListener didCollectArticleContent:](readerActivityListenerProxy, "didCollectArticleContent:", v4);

}

- (void)webProcessPlugInBrowserContextController:(id)a3 didStartProvisionalLoadForFrame:(id)a4
{
  id v6;
  id v7;
  id v8;
  ReaderAvailabilityController *value;
  SafariServices::ReaderAvailabilityController *v10;
  ReaderAvailabilityController *v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_SFWebProcessPlugInReaderEnabledPageController;
  -[_SFWebProcessPlugInAutoFillPageController webProcessPlugInBrowserContextController:didStartProvisionalLoadForFrame:](&v12, sel_webProcessPlugInBrowserContextController_didStartProvisionalLoadForFrame_, v6, v7);
  objc_msgSend(v6, "mainFrame");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    value = self->_readerAvailabilityController.__ptr_.__value_;
    if (value)
    {
      SafariShared::ReaderAvailabilityController::setCanRunAvailabilityDetection((SafariShared::ReaderAvailabilityController *)value);
    }
    else
    {
      v10 = (SafariServices::ReaderAvailabilityController *)operator new();
      SafariServices::ReaderAvailabilityController::ReaderAvailabilityController(v10, self);
      v11 = self->_readerAvailabilityController.__ptr_.__value_;
      self->_readerAvailabilityController.__ptr_.__value_ = (ReaderAvailabilityController *)v10;
      if (v11)
        (*(void (**)(ReaderAvailabilityController *))(*(_QWORD *)v11 + 8))(v11);
    }
  }

}

- (void)webProcessPlugInBrowserContextController:(id)a3 globalObjectIsAvailableForFrame:(id)a4 inScriptWorld:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v11, "mainFrame");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v8)
    -[SFWebProcessPlugInCertificateWarningController injectCertificateWarningBindingsForFrame:inScriptWorld:](self->_certificateWarningController, "injectCertificateWarningBindingsForFrame:inScriptWorld:", v8, v9);

}

- (void)webProcessPlugInBrowserContextController:(id)a3 didCommitLoadForFrame:(id)a4
{
  id v6;
  id v7;
  id v8;
  ReaderAvailabilityController *value;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)_SFWebProcessPlugInReaderEnabledPageController;
  -[_SFWebProcessPlugInAutoFillPageController webProcessPlugInBrowserContextController:didCommitLoadForFrame:](&v10, sel_webProcessPlugInBrowserContextController_didCommitLoadForFrame_, v6, v7);
  objc_msgSend(v6, "mainFrame");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    value = self->_readerAvailabilityController.__ptr_.__value_;
    if (value)
      SafariServices::ReaderAvailabilityController::clearAvailability((SafariServices::ReaderAvailabilityController *)value);
    -[SFWebProcessPlugInPageExtensionController clearExtensionScriptWorlds](self->_extensionController, "clearExtensionScriptWorlds");
  }

}

- (void)webProcessPlugInBrowserContextController:(id)a3 didSameDocumentNavigation:(int64_t)a4 forFrame:(id)a5
{
  id v8;
  id v9;
  id v10;
  ReaderAvailabilityController *value;
  objc_super v12;

  v8 = a3;
  v9 = a5;
  v12.receiver = self;
  v12.super_class = (Class)_SFWebProcessPlugInReaderEnabledPageController;
  -[_SFWebProcessPlugInAutoFillPageController webProcessPlugInBrowserContextController:didSameDocumentNavigation:forFrame:](&v12, sel_webProcessPlugInBrowserContextController_didSameDocumentNavigation_forFrame_, v8, a4, v9);
  objc_msgSend(v8, "mainFrame");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v9)
  {
    value = self->_readerAvailabilityController.__ptr_.__value_;
    if (value)
    {
      SafariServices::ReaderAvailabilityController::clearAvailability((SafariServices::ReaderAvailabilityController *)value);
      -[_SFWebProcessPlugInReaderEnabledPageController _detectReaderAvailabilityAfterSameDocumentNavigation](self, "_detectReaderAvailabilityAfterSameDocumentNavigation");
    }
  }

}

- (void)webProcessPlugInBrowserContextController:(id)a3 didFinishDocumentLoadForFrame:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_msgSend(v8, "mainFrame");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6 && self->_readerAvailabilityController.__ptr_.__value_)
  {
    if (-[_SFWebProcessPlugInReaderEnabledPageController readerHasBeenActivatedRecently](self, "readerHasBeenActivatedRecently"))
    {
      -[_SFWebProcessPlugInReaderEnabledPageController _detectAvailabilityAfterDelay:loadEvent:](self, "_detectAvailabilityAfterDelay:loadEvent:", 1, 0.1);
    }
    SafariShared::ReaderAvailabilityController::didFinishDocumentLoad((SafariShared::ReaderAvailabilityController *)self->_readerAvailabilityController.__ptr_.__value_);
  }

}

- (void)webProcessPlugInBrowserContextController:(id)a3 didFinishLoadForFrame:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "mainFrame");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    if (self->_readerAvailabilityController.__ptr_.__value_)
    {
      -[_SFWebProcessPlugInReaderEnabledPageController _detectAvailabilityAfterDelay:loadEvent:](self, "_detectAvailabilityAfterDelay:loadEvent:", 2, 0.1);
      SafariShared::ReaderAvailabilityController::didFinishLoad((SafariShared::ReaderAvailabilityController *)self->_readerAvailabilityController.__ptr_.__value_);
    }
    -[_SFWebProcessPlugInReaderEnabledPageController _searchForSmartAppBannerMetaContent](self, "_searchForSmartAppBannerMetaContent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[_SFWebProcessPlugInReaderEnabledPageController _appBannerMetaTagObserverProxy](self, "_appBannerMetaTagObserverProxy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "didFindAppBannerWithContent:", v8);

    }
  }

}

- (BOOL)readerHasBeenActivatedRecently
{
  void *v2;
  void *v3;
  void *v4;
  SafariShared::ReaderAvailabilityController *v5;
  NSDate *v6;
  char HasBeenActivatedRecently;

  if (!self->_readerAvailabilityController.__ptr_.__value_)
    return 0;
  -[WBSWebProcessPlugInPageController webProcessPlugIn](self, "webProcessPlugIn");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "plugInController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", *MEMORY[0x1E0D8B318]);
  v5 = (SafariShared::ReaderAvailabilityController *)objc_claimAutoreleasedReturnValue();

  HasBeenActivatedRecently = SafariShared::ReaderAvailabilityController::readerHasBeenActivatedRecently(v5, v6);
  return HasBeenActivatedRecently;
}

- (void)webProcessPlugInBrowserContextController:(id)a3 renderingProgressDidChange:(unint64_t)a4
{
  __int16 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  if ((v4 & 0x100) != 0
    && self->_readerAvailabilityController.__ptr_.__value_
    && -[_SFWebProcessPlugInReaderEnabledPageController readerHasBeenActivatedRecently](self, "readerHasBeenActivatedRecently"))
  {
    -[_SFWebProcessPlugInReaderEnabledPageController _detectAvailabilityAfterDelay:loadEvent:](self, "_detectAvailabilityAfterDelay:loadEvent:", 0, 1.0);
  }

}

- (id)_appBannerMetaTagObserverProxy
{
  SFAppBannerMetaTagContentObserver *appBannerObserverProxy;
  void *v4;
  void *v5;
  void *v6;
  SFAppBannerMetaTagContentObserver *v7;
  SFAppBannerMetaTagContentObserver *v8;

  appBannerObserverProxy = self->_appBannerObserverProxy;
  if (!appBannerObserverProxy)
  {
    -[WBSWebProcessPlugInPageController browserContextController](self, "browserContextController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_remoteObjectRegistry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EE781A38);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteObjectProxyWithInterface:", v6);
    v7 = (SFAppBannerMetaTagContentObserver *)objc_claimAutoreleasedReturnValue();
    v8 = self->_appBannerObserverProxy;
    self->_appBannerObserverProxy = v7;

    appBannerObserverProxy = self->_appBannerObserverProxy;
  }
  return appBannerObserverProxy;
}

- (id)_appBannerMetaElementInHeaderElement:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a3, "firstChild");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v4;
        objc_msgSend(v5, "tagName");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("META"));

        if (!v7)
        {
          objc_msgSend(v5, "getAttribute:", CFSTR("name"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("apple-itunes-app"));

          if (!v9)
          {

            return v5;
          }
        }

      }
      objc_msgSend(v4, "nextSibling");
      v5 = (id)objc_claimAutoreleasedReturnValue();

      v4 = v5;
      if (!v5)
        return v5;
    }
  }
  v5 = 0;
  return v5;
}

- (id)_searchForSmartAppBannerMetaContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  -[WBSWebProcessPlugInPageController browserContextController](self, "browserContextController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainFrameDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "body");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parentNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstChild");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        objc_msgSend(v8, "tagName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("HEAD"));

        if (!v10)
        {
          -[_SFWebProcessPlugInReaderEnabledPageController _appBannerMetaElementInHeaderElement:](self, "_appBannerMetaElementInHeaderElement:", v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "getAttribute:", CFSTR("content"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_8;
        }

      }
      objc_msgSend(v7, "nextSibling");
      v11 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v11;
    }
    while (v11);
  }
  v12 = 0;
LABEL_8:

  return v12;
}

- (_SFReaderWebProcessPlugInPageController)readerPageController
{
  return self->_readerPageController;
}

- (void)setReaderPageController:(id)a3
{
  objc_storeStrong((id *)&self->_readerPageController, a3);
}

- (NSDictionary)initalArticleScrollPositionAsDictionary
{
  return self->_initalArticleScrollPositionAsDictionary;
}

- (void)setInitalArticleScrollPositionAsDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (int64_t)cachedReaderTopScrollOffset
{
  return self->_cachedReaderTopScrollOffset;
}

- (void)setCachedReaderTopScrollOffset:(int64_t)a3
{
  self->_cachedReaderTopScrollOffset = a3;
}

- (NSDictionary)initialReaderConfiguration
{
  return self->_initialReaderConfiguration;
}

- (BOOL)isViewingReadingListArchive
{
  return self->_viewingReadingListArchive;
}

- (void).cxx_destruct
{
  ReaderAvailabilityController *value;

  objc_storeStrong((id *)&self->_initialReaderConfiguration, 0);
  objc_storeStrong((id *)&self->_initalArticleScrollPositionAsDictionary, 0);
  objc_storeStrong((id *)&self->_appBannerObserverProxy, 0);
  objc_storeStrong((id *)&self->_certificateWarningController, 0);
  objc_storeStrong((id *)&self->_sharingLinkExtractor, 0);
  objc_storeStrong((id *)&self->_extensionController, 0);
  objc_storeStrong((id *)&self->_initialScrollPositionAsDictionary, 0);
  objc_storeStrong((id *)&self->_readerPageController, 0);
  objc_storeStrong((id *)&self->_readerActivityListenerProxy, 0);
  objc_storeStrong((id *)&self->_availabilityControllerInterface, 0);
  value = self->_readerAvailabilityController.__ptr_.__value_;
  self->_readerAvailabilityController.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(ReaderAvailabilityController *))(*(_QWORD *)value + 8))(value);
}

@end
