@implementation _SFWebProcessPlugInAutoFillPageController

- (_SFWebProcessPlugInAutoFillPageController)initWithPlugIn:(id)a3 contextController:(id)a4
{
  id v6;
  _SFWebProcessPlugInAutoFillPageController *v7;
  uint64_t v8;
  _WKRemoteObjectInterface *activityControllerInterface;
  void *v10;
  _SFFormMetadataController *v11;
  _SFFormMetadataController *formMetadataController;
  uint64_t v13;
  _WKRemoteObjectInterface *autoFillerInterface;
  void *v15;
  _SFWebProcessPlugInAutoFillPageController *v16;
  objc_super v18;

  v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_SFWebProcessPlugInAutoFillPageController;
  v7 = -[WBSWebProcessPlugInPageController initWithPlugIn:contextController:](&v18, sel_initWithPlugIn_contextController_, a3, v6);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EE770D08);
    v8 = objc_claimAutoreleasedReturnValue();
    activityControllerInterface = v7->_activityControllerInterface;
    v7->_activityControllerInterface = (_WKRemoteObjectInterface *)v8;

    objc_msgSend(v6, "_remoteObjectRegistry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerExportedObject:interface:", v7, v7->_activityControllerInterface);

    v11 = -[_SFFormMetadataController initWithPageController:]([_SFFormMetadataController alloc], "initWithPageController:", v7);
    formMetadataController = v7->_formMetadataController;
    v7->_formMetadataController = v11;

    objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EE770C58);
    v13 = objc_claimAutoreleasedReturnValue();
    autoFillerInterface = v7->_autoFillerInterface;
    v7->_autoFillerInterface = (_WKRemoteObjectInterface *)v13;

    objc_msgSend(v6, "_remoteObjectRegistry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerExportedObject:interface:", v7, v7->_autoFillerInterface);

    v16 = v7;
  }

  return v7;
}

- (void)setFormMetadataController:(id)a3
{
  objc_storeStrong((id *)&self->_formMetadataController, a3);
}

- (void)willDestroyBrowserContextController:(id)a3
{
  id v4;
  void *v5;
  _WKRemoteObjectInterface *autoFillerInterface;
  void *v7;
  _WKRemoteObjectInterface *activityControllerInterface;
  _SFFormMetadataController *formMetadataController;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "_remoteObjectRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterExportedObject:interface:", self, self->_autoFillerInterface);

  autoFillerInterface = self->_autoFillerInterface;
  self->_autoFillerInterface = 0;

  objc_msgSend(v4, "_remoteObjectRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unregisterExportedObject:interface:", self, self->_activityControllerInterface);

  activityControllerInterface = self->_activityControllerInterface;
  self->_activityControllerInterface = 0;

  -[_SFFormMetadataController invalidate](self->_formMetadataController, "invalidate");
  formMetadataController = self->_formMetadataController;
  self->_formMetadataController = 0;

  v10.receiver = self;
  v10.super_class = (Class)_SFWebProcessPlugInAutoFillPageController;
  -[WBSWebProcessPlugInPageController willDestroyBrowserContextController:](&v10, sel_willDestroyBrowserContextController_, v4);

}

- (void)runJavaScriptForActivity:(id)a3 withScript:(id)a4 object:(id)a5 invokeMethod:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD);
  WKWebProcessPlugInScriptWorld *v16;
  WKWebProcessPlugInScriptWorld *isolatedWorld;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, _QWORD))a7;
  if (!self->_isolatedWorld)
  {
    objc_msgSend(MEMORY[0x1E0CEF628], "world");
    v16 = (WKWebProcessPlugInScriptWorld *)objc_claimAutoreleasedReturnValue();
    isolatedWorld = self->_isolatedWorld;
    self->_isolatedWorld = v16;

    -[WKWebProcessPlugInScriptWorld makeAllShadowRootsOpen](self->_isolatedWorld, "makeAllShadowRootsOpen");
  }
  -[WBSWebProcessPlugInPageController mainFrame](self, "mainFrame");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "jsContextForWorld:", self->_isolatedWorld);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v29, "isEqualToString:", CFSTR("WebClipMetadataJS")))
  {
    +[_SFWebClipMetadataFetcher metadataFetcherScriptSource](_SFWebClipMetadataFetcher, "metadataFetcherScriptSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v19, "evaluateScript:", v20);

  }
  if (objc_msgSend(v12, "length"))
    v22 = (id)objc_msgSend(v19, "evaluateScript:", v12);
  objc_msgSend(v19, "globalObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "valueForProperty:", v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[WKWebProcessPlugInScriptWorld clearWrappers](self->_isolatedWorld, "clearWrappers");
  if ((objc_msgSend(v24, "isUndefined") & 1) != 0
    || (objc_msgSend(v24, "valueForProperty:", v14),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        v26 = objc_msgSend(v25, "isUndefined"),
        v25,
        v26))
  {
    v15[2](v15, 0);
  }
  else
  {
    objc_msgSend(v24, "invokeMethod:withArguments:", v14, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "toDictionary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v15)[2](v15, v28);

  }
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didStartProvisionalLoadForFrame:(id)a4
{
  -[_SFFormMetadataController didStartProvisionalLoadForFrame:](self->_formMetadataController, "didStartProvisionalLoadForFrame:", a4);
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didCommitLoadForFrame:(id)a4
{
  _SFFormMetadataController *formMetadataController;
  id v5;

  formMetadataController = self->_formMetadataController;
  +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSFormMetadataController recursivelyClearMetadataForFrames:](formMetadataController, "recursivelyClearMetadataForFrames:", v5);

}

- (void)webProcessPlugInBrowserContextController:(id)a3 didRemoveFrameFromHierarchy:(id)a4
{
  _SFFormMetadataController *formMetadataController;
  id v5;

  formMetadataController = self->_formMetadataController;
  +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSFormMetadataController clearMetadataForFrame:](formMetadataController, "clearMetadataForFrame:", v5);

}

- (void)webProcessPlugInBrowserContextController:(id)a3 didSameDocumentNavigation:(int64_t)a4 forFrame:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a5;
  objc_msgSend(a3, "mainFrame");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v8 == v10)
  {
    -[_SFFormMetadataController didSameDocumentNavigation:inFrame:](self->_formMetadataController, "didSameDocumentNavigation:inFrame:", a4, v10);
    v9 = v10;
  }

}

- (void)autoFillFormAsynchronouslyInFrame:(id)a3 withValues:(id)a4 setAutoFilled:(BOOL)a5 selectFieldAfterFilling:(id)a6
{
  -[_SFWebProcessPlugInAutoFillPageController autoFillFormAsynchronouslyInFrame:withValues:setAutoFilled:focusFieldAfterFilling:fieldToFocus:submitForm:](self, "autoFillFormAsynchronouslyInFrame:withValues:setAutoFilled:focusFieldAfterFilling:fieldToFocus:submitForm:", a3, a4, a5, 1, a6, 0);
}

- (void)autoFillFormAsynchronouslyInFrame:(id)a3 withValues:(id)a4 setAutoFilled:(BOOL)a5 focusFieldAfterFilling:(BOOL)a6 fieldToFocus:(id)a7
{
  -[_SFWebProcessPlugInAutoFillPageController autoFillFormAsynchronouslyInFrame:withValues:setAutoFilled:focusFieldAfterFilling:fieldToFocus:submitForm:](self, "autoFillFormAsynchronouslyInFrame:withValues:setAutoFilled:focusFieldAfterFilling:fieldToFocus:submitForm:", a3, a4, a5, a6, a7, 0);
}

- (void)autoFillFormAsynchronouslyInFrame:(id)a3 withValues:(id)a4 setAutoFilled:(BOOL)a5 focusFieldAfterFilling:(BOOL)a6 fieldToFocus:(id)a7 submitForm:(BOOL)a8
{
  uint64_t v8;

  LOBYTE(v8) = a8;
  -[_SFWebProcessPlugInAutoFillPageController autoFillFormAsynchronouslyInFrame:withValues:setAutoFilled:focusFieldAfterFilling:fieldToFocus:fieldsToObscure:submitForm:](self, "autoFillFormAsynchronouslyInFrame:withValues:setAutoFilled:focusFieldAfterFilling:fieldToFocus:fieldsToObscure:submitForm:", a3, a4, a5, a6, a7, 0, v8);
}

- (void)autoFillFormAsynchronouslyInFrame:(id)a3 withValues:(id)a4 setAutoFilled:(BOOL)a5 focusFieldAfterFilling:(BOOL)a6 fieldToFocus:(id)a7 fieldsToObscure:(id)a8 submitForm:(BOOL)a9
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;

  v11 = a6;
  v12 = a5;
  v21 = a4;
  v15 = a7;
  v16 = a8;
  objc_msgSend(a3, "frameHandle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CEF618], "lookUpFrameFromHandle:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v20) = a9;
    -[_SFFormMetadataController autoFillFormInFrame:withValues:fillSynchronously:setAutoFilled:focusFieldAfterFilling:fieldToFocus:fieldsToObscure:submitForm:](self->_formMetadataController, "autoFillFormInFrame:withValues:fillSynchronously:setAutoFilled:focusFieldAfterFilling:fieldToFocus:fieldsToObscure:submitForm:", v19, v21, 0, v12, v11, v15, v16, v20);

  }
}

- (void)autoFillFormSynchronouslyInFrame:(id)a3 withValues:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0CEF618];
  v7 = a4;
  objc_msgSend(a3, "frameHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lookUpFrameFromHandle:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[WBSFormMetadataController autoFillFormSynchronouslyInFrame:withValues:](self->_formMetadataController, "autoFillFormSynchronouslyInFrame:withValues:", v10, v7);
}

- (void)autoFillForm:(int64_t)a3 inFrame:(id)a4 withGeneratedPassword:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v13 = a5;
  v8 = (void *)MEMORY[0x1E0CEF618];
  objc_msgSend(a4, "frameHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lookUpFrameFromHandle:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[_SFFormMetadataController fillForm:inFrame:withPassword:focusedFieldControlID:](self->_formMetadataController, "fillForm:inFrame:withPassword:focusedFieldControlID:", v11, v13, 0, (double)a3);
}

- (void)annotateForm:(int64_t)a3 inFrame:(id)a4 withValues:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a5;
  objc_msgSend(a4, "frameHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CEF618], "lookUpFrameFromHandle:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[WBSFormMetadataController annotateForm:inFrame:withValues:](self->_formMetadataController, "annotateForm:inFrame:withValues:", v10, v11, (double)a3);
  }

}

- (void)fillTextField:(id)a3 inFrame:(id)a4 withGeneratedPassword:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x1E0CEF618];
  v9 = a5;
  v10 = a3;
  objc_msgSend(a4, "frameHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lookUpFrameFromHandle:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[WBSFormMetadataController fillField:inFrame:withGeneratedPassword:](self->_formMetadataController, "fillField:inFrame:withGeneratedPassword:", v10, v13, v9);
}

- (void)autoFillOneTimeCodeFieldsInFrame:(id)a3 withValue:(id)a4 shouldSubmit:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a5;
  v8 = (void *)MEMORY[0x1E0CEF618];
  v9 = a4;
  objc_msgSend(a3, "frameHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lookUpFrameFromHandle:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[WBSFormMetadataController autoFillOneTimeCodeFieldsInFrame:withValue:shouldSubmit:](self->_formMetadataController, "autoFillOneTimeCodeFieldsInFrame:withValue:shouldSubmit:", v12, v9, v5);
}

- (void)focusFormForStreamlinedLogin:(int64_t)a3 inFrame:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CEF618];
  objc_msgSend(a4, "frameHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lookUpFrameFromHandle:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[_SFFormMetadataController focusFormForStreamlinedLogin:inFrame:](self->_formMetadataController, "focusFormForStreamlinedLogin:inFrame:", v9, (double)a3);
}

- (void)setFormControls:(id)a3 areAutoFilled:(BOOL)a4 andClearField:(id)a5 inFrame:(id)a6
{
  _BOOL8 v7;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a4;
  v15 = a5;
  v10 = (void *)MEMORY[0x1E0CEF618];
  v11 = a3;
  objc_msgSend(a6, "frameHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lookUpFrameFromHandle:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSFormMetadataController setFormControls:inFrame:asAutoFilled:](self->_formMetadataController, "setFormControls:inFrame:asAutoFilled:", v11, v14, v7);
  if (v15)
    -[_SFFormMetadataController clearField:inFrame:](self->_formMetadataController, "clearField:inFrame:", v15, v14);

}

- (void)clearFieldsAndSetFormControlsToNotAutoFilled:(id)a3 inFrame:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x1E0CEF618];
  v9 = a5;
  v10 = a3;
  objc_msgSend(a4, "frameHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lookUpFrameFromHandle:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[WBSFormMetadataController clearFieldsAndSetFormControlsToNotAutoFilled:inFrame:completionHandler:](self->_formMetadataController, "clearFieldsAndSetFormControlsToNotAutoFilled:inFrame:completionHandler:", v10, v13, v9);
}

- (void)collectURLsForPrefillingAtURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v4 = a3;
  -[WBSWebProcessPlugInPageController browserContextController](self, "browserContextController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainFrame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v4);

  if (v8)
    -[_SFFormMetadataController collectURLsForPreFilling](self->_formMetadataController, "collectURLsForPreFilling");
}

- (void)collectFormMetadataForTestingAtURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v4 = a3;
  -[WBSWebProcessPlugInPageController browserContextController](self, "browserContextController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainFrame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v4);

  if (v8)
    -[_SFFormMetadataController collectFormMetadataForTesting](self->_formMetadataController, "collectFormMetadataForTesting");
}

- (void)collectFormMetadataForPrefillingAtURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v4 = a3;
  -[WBSWebProcessPlugInPageController browserContextController](self, "browserContextController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainFrame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v4);

  if (v8)
    -[_SFFormMetadataController collectFormMetadataForPreFilling](self->_formMetadataController, "collectFormMetadataForPreFilling");
}

- (void)collectFormMetadataForPageLevelAutoFillAtURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v4 = a3;
  -[WBSWebProcessPlugInPageController browserContextController](self, "browserContextController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainFrame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v4);

  if (v8)
    -[_SFFormMetadataController collectFormMetadataForPageLevelAutoFill](self->_formMetadataController, "collectFormMetadataForPageLevelAutoFill");
}

- (void)getMetadataForTextField:(id)a3 inFrame:(id)a4 atURL:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v10 = a4;
  v11 = a6;
  v12 = a5;
  -[WBSWebProcessPlugInPageController browserContextController](self, "browserContextController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mainFrame");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqual:", v12);

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CEF618];
    objc_msgSend(v10, "frameHandle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lookUpFrameFromHandle:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[WBSFormMetadataController getMetadataForTextField:inFrame:completionHandler:](self->_formMetadataController, "getMetadataForTextField:inFrame:completionHandler:", v21, v20, v11);
  }

}

- (void)clearAutoFillMetadata
{
  _SFFormMetadataController *formMetadataController;
  void *v3;
  void *v4;
  id v5;

  formMetadataController = self->_formMetadataController;
  -[WBSWebProcessPlugInPageController browserContextController](self, "browserContextController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainFrame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSFormMetadataController recursivelyClearMetadataForFrames:](formMetadataController, "recursivelyClearMetadataForFrames:", v4);

}

- (void)substitutePasswordElementsWithAutomaticPasswordElementsInFrame:(id)a3 formID:(int64_t)a4 focusedPasswordControlUniqueID:(id)a5 passwordControlUniqueIDs:(id)a6 automaticPassword:(id)a7 blurAfterSubstitution:(BOOL)a8 completionHandler:(id)a9
{
  _BOOL8 v9;
  void *v16;
  void (**v17)(id, void *);
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v9 = a8;
  v16 = (void *)MEMORY[0x1E0CEF618];
  v17 = (void (**)(id, void *))a9;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  objc_msgSend(a3, "frameHandle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lookUpFrameFromHandle:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", v22);
  v24 = (id)objc_claimAutoreleasedReturnValue();

  -[WBSFormMetadataController substitutePasswordElementsWithAutomaticPasswordElementsInFrame:formID:focusedPasswordControlUniqueID:passwordControlUniqueIDs:automaticPassword:blurAfterSubstitution:](self->_formMetadataController, "substitutePasswordElementsWithAutomaticPasswordElementsInFrame:formID:focusedPasswordControlUniqueID:passwordControlUniqueIDs:automaticPassword:blurAfterSubstitution:", v24, v20, v19, v18, v9, (double)a4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v17[2](v17, v23);
}

- (void)removeAutomaticPasswordElementsInFrame:(id)a3 focusedPasswordControlUniqueID:(id)a4 passwordControlUniqueIDs:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x1E0CEF618];
  v9 = a5;
  v10 = a4;
  objc_msgSend(a3, "frameHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lookUpFrameFromHandle:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[_SFFormMetadataController removeAutomaticPasswordElementsInFrame:focusedPasswordControlUniqueID:passwordControlUniqueIDs:blurAfterRemoval:](self->_formMetadataController, "removeAutomaticPasswordElementsInFrame:focusedPasswordControlUniqueID:passwordControlUniqueIDs:blurAfterRemoval:", v13, v10, v9, 0);
}

- (void)removeAutomaticPasswordVisualTreatmentInFrame:(id)a3 passwordControlUniqueIDs:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0CEF618];
  v7 = a4;
  objc_msgSend(a3, "frameHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lookUpFrameFromHandle:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[_SFFormMetadataController removeAutomaticPasswordVisualTreatmentInFrame:passwordControlUniqueIDs:](self->_formMetadataController, "removeAutomaticPasswordVisualTreatmentInFrame:passwordControlUniqueIDs:", v10, v7);
}

- (void)automaticPasswordSheetDimissedInFrame:(id)a3 focusedPasswordControlUniqueID:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0CEF618];
  v7 = a4;
  objc_msgSend(a3, "frameHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lookUpFrameFromHandle:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[WBSFormMetadataController automaticPasswordSheetDimissedInFrame:focusedPasswordControlUniqueID:](self->_formMetadataController, "automaticPasswordSheetDimissedInFrame:focusedPasswordControlUniqueID:", v10, v7);
}

- (void)setStrongPasswordElementViewableIfAppropriate:(BOOL)a3 frame:(id)a4 passwordControlUniqueIDs:(id)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  v8 = (void *)MEMORY[0x1E0CEF618];
  v9 = a5;
  objc_msgSend(a4, "frameHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lookUpFrameFromHandle:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[_SFFormMetadataController setStrongPasswordElementViewableIfAppropriate:frame:passwordControlUniqueIDs:](self->_formMetadataController, "setStrongPasswordElementViewableIfAppropriate:frame:passwordControlUniqueIDs:", v6, v12, v9);
}

- (void)setAutoFillSpinnerVisibility:(BOOL)a3 textFieldMetadata:(id)a4 frame:(id)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  v8 = (void *)MEMORY[0x1E0CEF618];
  v9 = a4;
  objc_msgSend(a5, "frameHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lookUpFrameFromHandle:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[WBSFormMetadataController setAutoFillSpinnerVisibility:textFieldMetadata:frame:](self->_formMetadataController, "setAutoFillSpinnerVisibility:textFieldMetadata:frame:", v6, v9, v12);
}

- (void)diagnosticsFormMetadataWithCompletionHandler:(id)a3
{
  _SFFormMetadataController *formMetadataController;
  id v5;
  id v6;

  formMetadataController = self->_formMetadataController;
  v5 = a3;
  -[_SFFormMetadataController diagnosticsFormMetadata](formMetadataController, "diagnosticsFormMetadata");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (_SFFormMetadataController)formMetadataController
{
  return self->_formMetadataController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formMetadataController, 0);
  objc_storeStrong((id *)&self->_isolatedWorld, 0);
  objc_storeStrong((id *)&self->_autoFillerInterface, 0);
  objc_storeStrong((id *)&self->_activityControllerInterface, 0);
}

@end
