@implementation _SFFormMetadataController

- (void)invalidate
{
  id v3;
  void *v4;
  SFFormMetadataObserver *observer;

  v3 = objc_storeWeak((id *)&self->_pageController, 0);
  objc_msgSend(0, "browserContextController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setFormDelegate:", 0);

  observer = self->_observer;
  self->_observer = 0;

}

- (_SFFormMetadataController)initWithPageController:(id)a3
{
  id v4;
  _SFFormMetadataController *v5;
  _SFFormMetadataController *v6;
  void *v7;
  _SFFormMetadataController *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFFormMetadataController;
  v5 = -[WBSFormMetadataController init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_pageController, v4);
    objc_msgSend(v4, "browserContextController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setFormDelegate:", v6);

    v8 = v6;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[_SFFormMetadataController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_SFFormMetadataController;
  -[_SFFormMetadataController dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textDidChangeEventCoalescer, 0);
  objc_storeStrong((id *)&self->_unsubmittedFormFrame, 0);
  objc_storeStrong((id *)&self->_unsubmittedForm, 0);
  objc_storeStrong((id *)&self->_assistedNodeMetadata, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_destroyWeak((id *)&self->_pageController);
  objc_storeStrong((id *)&self->_scriptWorld, 0);
}

- (WKWebProcessPlugInScriptWorld)scriptWorld
{
  WKWebProcessPlugInScriptWorld *scriptWorld;
  WKWebProcessPlugInScriptWorld *v4;
  WKWebProcessPlugInScriptWorld *v5;

  scriptWorld = self->_scriptWorld;
  if (!scriptWorld)
  {
    objc_msgSend(MEMORY[0x1E0CEF628], "world");
    v4 = (WKWebProcessPlugInScriptWorld *)objc_claimAutoreleasedReturnValue();
    v5 = self->_scriptWorld;
    self->_scriptWorld = v4;

    -[WKWebProcessPlugInScriptWorld makeAllShadowRootsOpen](self->_scriptWorld, "makeAllShadowRootsOpen");
    -[WKWebProcessPlugInScriptWorld disableOverrideBuiltinsBehavior](self->_scriptWorld, "disableOverrideBuiltinsBehavior");
    scriptWorld = self->_scriptWorld;
  }
  return scriptWorld;
}

- (void)collectURLsForPreFilling
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  SFFormAutoFillFrameHandle *v7;
  id v8;

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);
  objc_msgSend(WeakRetained, "mainFrame");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  addURLsInFrameTreeToArray(v4, v8);
  -[_SFFormMetadataController _observer](self, "_observer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SFFormAutoFillFrameHandle initWithWebProcessPlugInFrame:]([SFFormAutoFillFrameHandle alloc], "initWithWebProcessPlugInFrame:", v4);
  objc_msgSend(v5, "didCollectURLsForPreFilling:atURL:inFrame:", v8, v6, v7);

}

- (BOOL)_formContainsAutoFilledElements:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a3, "controls", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isAutoFilledTextField") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)collectFormMetadataForTesting
{
  -[_SFFormMetadataController _collectFormMetadataForPreFilling:](self, "_collectFormMetadataForPreFilling:", 0);
}

- (void)collectFormMetadataForPreFilling
{
  -[_SFFormMetadataController _collectFormMetadataForPreFilling:](self, "_collectFormMetadataForPreFilling:", 1);
}

- (void)collectFormMetadataForPageLevelAutoFill
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __68___SFFormMetadataController_collectFormMetadataForPageLevelAutoFill__block_invoke;
  v2[3] = &unk_1E4AC1AD8;
  v2[4] = self;
  -[_SFFormMetadataController _collectFormMetadataWithRequestType:ignoreAutoFilledForms:completionHandler:](self, "_collectFormMetadataWithRequestType:ignoreAutoFilledForms:completionHandler:", 0, 0, v2);
}

- (NSArray)diagnosticsFormMetadata
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);
  objc_msgSend(WeakRetained, "browserContextController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainFrame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  -[WBSFormMetadataController getMetadataForAllFormsInPageWithMainFrame:requestType:frames:formMetadata:](self, "getMetadataForAllFormsInPageWithMainFrame:requestType:frames:formMetadata:", v6, 4, 0, &v9);
  v7 = v9;

  return (NSArray *)v7;
}

- (void)_collectFormMetadataForPreFilling:(BOOL)a3
{
  _BOOL8 shouldListenForFormChanges;
  uint64_t v4;
  _QWORD v5[5];

  shouldListenForFormChanges = self->_shouldListenForFormChanges;
  if (a3)
    v4 = 1;
  else
    v4 = 2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63___SFFormMetadataController__collectFormMetadataForPreFilling___block_invoke;
  v5[3] = &unk_1E4AC1AD8;
  v5[4] = self;
  -[_SFFormMetadataController _collectFormMetadataWithRequestType:ignoreAutoFilledForms:completionHandler:](self, "_collectFormMetadataWithRequestType:ignoreAutoFilledForms:completionHandler:", v4, shouldListenForFormChanges, v5);
}

- (void)_collectFormMetadataWithRequestType:(unint64_t)a3 ignoreAutoFilledForms:(BOOL)a4 completionHandler:(id)a5
{
  _SFWebProcessPlugInPageController **p_pageController;
  void (**v9)(id, id);
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _SFFormMetadataController *v22;
  BOOL v23;
  id v24;
  id v25;

  p_pageController = &self->_pageController;
  v9 = (void (**)(id, id))a5;
  WeakRetained = objc_loadWeakRetained((id *)p_pageController);
  objc_msgSend(WeakRetained, "browserContextController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mainFrame");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = 0;
  -[WBSFormMetadataController getMetadataForAllFormsInPageWithMainFrame:requestType:frames:formMetadata:](self, "getMetadataForAllFormsInPageWithMainFrame:requestType:frames:formMetadata:", v13, a3, &v25, &v24);
  v14 = v25;
  v15 = v24;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __105___SFFormMetadataController__collectFormMetadataWithRequestType_ignoreAutoFilledForms_completionHandler___block_invoke;
  v19[3] = &unk_1E4AC1B00;
  v20 = v16;
  v21 = v15;
  v23 = a4;
  v22 = self;
  v17 = v15;
  v18 = v16;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v19);
  v9[2](v9, v18);

}

- (void)clearScriptWorld
{
  WKWebProcessPlugInScriptWorld *scriptWorld;
  WKWebProcessPlugInScriptWorld *v4;

  scriptWorld = self->_scriptWorld;
  if (scriptWorld)
  {
    -[WKWebProcessPlugInScriptWorld clearWrappers](scriptWorld, "clearWrappers");
    v4 = self->_scriptWorld;
    self->_scriptWorld = 0;

  }
}

- (id)formAutoFillNodeForJSWrapper:(OpaqueJSValue *)a3 inContext:(OpaqueJSContext *)a4
{
  return -[SFFormAutoFillNode initWithJSWrapper:inContext:]([SFFormAutoFillNode alloc], "initWithJSWrapper:inContext:", a3, a4);
}

- (void)usernameFieldFocused:(id)a3 fieldMetadata:(id)a4 inForm:(id)a5 inFrame:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  SFFormAutoFillFrameHandle *v14;
  void *v15;
  NSDictionary *v16;
  NSDictionary *assistedNodeMetadata;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a4;
  objc_msgSend(a6, "plugInFrame");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = CFSTR("usernameField");
  objc_msgSend(v10, "serializedData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v12;
  v18[1] = CFSTR("form");
  objc_msgSend(v9, "serializedData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19[1] = v13;
  v18[2] = CFSTR("frame");
  v14 = -[SFFormAutoFillFrameHandle initWithWebProcessPlugInFrame:]([SFFormAutoFillFrameHandle alloc], "initWithWebProcessPlugInFrame:", v11);
  -[SFFormAutoFillFrameHandle serializedData](v14, "serializedData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  assistedNodeMetadata = self->_assistedNodeMetadata;
  self->_assistedNodeMetadata = v16;

}

- (void)passwordFieldFocused:(id)a3 inFrame:(id)a4 textFieldMetadata:(id)a5 formMetadata:(id)a6 isPasswordFieldForUserCredentials:(BOOL)a7
{
  NSDictionary *v8;
  NSDictionary *assistedNodeMetadata;

  if (a7)
  {
    -[_SFFormMetadataController _assistedNodeMetadataWithPasswordField:passwordFieldMetadata:formMetadata:inFrame:](self, "_assistedNodeMetadataWithPasswordField:passwordFieldMetadata:formMetadata:inFrame:", a3, a5, a6, a4);
    v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    assistedNodeMetadata = self->_assistedNodeMetadata;
    self->_assistedNodeMetadata = v8;

  }
}

- (id)_assistedNodeMetadataWithPasswordField:(id)a3 passwordFieldMetadata:(id)a4 formMetadata:(id)a5 inFrame:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  SFFormAutoFillFrameHandle *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(a6, "plugInFrame");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = CFSTR("passwordField");
  objc_msgSend(v10, "serializedData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = v13;
  v23[1] = CFSTR("form");
  objc_msgSend(v9, "serializedData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v24[1] = v14;
  v23[2] = CFSTR("frame");
  v15 = -[SFFormAutoFillFrameHandle initWithWebProcessPlugInFrame:]([SFFormAutoFillFrameHandle alloc], "initWithWebProcessPlugInFrame:", v12);
  -[SFFormAutoFillFrameHandle serializedData](v15, "serializedData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v16;
  v23[3] = CFSTR("autoFillButtonType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "htmlInputElementAutoFillButtonType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v17;
  v23[4] = CFSTR("lastAutoFillButtonType");
  v18 = (void *)MEMORY[0x1E0CB37E8];
  v19 = objc_msgSend(v11, "htmlInputElementLastAutoFillButtonType");

  objc_msgSend(v18, "numberWithInteger:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_observer
{
  SFFormMetadataObserver *observer;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  SFFormMetadataObserver *v8;
  SFFormMetadataObserver *v9;

  observer = self->_observer;
  if (!observer)
  {
    objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EE749708);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);
    objc_msgSend(WeakRetained, "browserContextController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_remoteObjectRegistry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteObjectProxyWithInterface:", v4);
    v8 = (SFFormMetadataObserver *)objc_claimAutoreleasedReturnValue();
    v9 = self->_observer;
    self->_observer = v8;

    observer = self->_observer;
  }
  return observer;
}

- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 fillSynchronously:(BOOL)a5 setAutoFilled:(BOOL)a6 selectFieldAfterFilling:(id)a7
{
  -[WBSFormMetadataController autoFillFormInFrame:withValues:fillSynchronously:setAutoFilled:focusFieldAfterFilling:fieldToFocus:](self, "autoFillFormInFrame:withValues:fillSynchronously:setAutoFilled:focusFieldAfterFilling:fieldToFocus:", a3, a4, a5, a6, 1, a7);
}

- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 fillSynchronously:(BOOL)a5 setAutoFilled:(BOOL)a6 focusFieldAfterFilling:(BOOL)a7 fieldToFocus:(id)a8 fieldsToObscure:(id)a9 submitForm:(BOOL)a10
{
  objc_super v11;

  self->_autoFillInProgress = 1;
  v11.receiver = self;
  v11.super_class = (Class)_SFFormMetadataController;
  -[WBSFormMetadataController autoFillFormInFrame:withValues:fillSynchronously:setAutoFilled:focusFieldAfterFilling:fieldToFocus:fieldsToObscure:submitForm:](&v11, sel_autoFillFormInFrame_withValues_fillSynchronously_setAutoFilled_focusFieldAfterFilling_fieldToFocus_fieldsToObscure_submitForm_, a3, a4, a5, a6, a7, a8, a9, a10);
}

- (id)fillForm:(double)a3 inFrame:(id)a4 withPassword:(id)a5 focusedFieldControlID:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  WBSFormMetadata *v13;
  WBSFormMetadata *unsubmittedForm;
  WKWebProcessPlugInFrame *v15;
  WKWebProcessPlugInFrame *unsubmittedFormFrame;
  void *v17;
  WBSFormMetadata *v18;
  SFFormAutoFillFrameHandle *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)_SFFormMetadataController;
  v10 = a4;
  -[WBSFormMetadataController fillForm:inFrame:withPassword:focusedFieldControlID:](&v21, sel_fillForm_inFrame_withPassword_focusedFieldControlID_, v10, a5, a6, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSFormMetadataController formElementWithFormID:inFrame:](self, "formElementWithFormID:inFrame:", v10, a3, v21.receiver, v21.super_class);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSFormMetadataController metadataForForm:inFrame:requestType:](self, "metadataForForm:inFrame:requestType:", v12, v10, 0);
  v13 = (WBSFormMetadata *)objc_claimAutoreleasedReturnValue();
  unsubmittedForm = self->_unsubmittedForm;
  self->_unsubmittedForm = v13;

  objc_msgSend(v10, "plugInFrame");
  v15 = (WKWebProcessPlugInFrame *)objc_claimAutoreleasedReturnValue();

  unsubmittedFormFrame = self->_unsubmittedFormFrame;
  self->_unsubmittedFormFrame = v15;

  -[_SFFormMetadataController _observer](self, "_observer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = self->_unsubmittedForm;
  v19 = -[SFFormAutoFillFrameHandle initWithWebProcessPlugInFrame:]([SFFormAutoFillFrameHandle alloc], "initWithWebProcessPlugInFrame:", self->_unsubmittedFormFrame);
  objc_msgSend(v17, "didFillGeneratedPasswordInForm:inFrame:", v18, v19);

  return v11;
}

- (void)removeAutomaticPasswordElementsInFrame:(id)a3 focusedPasswordControlUniqueID:(id)a4 passwordControlUniqueIDs:(id)a5 blurAfterRemoval:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SFFormAutoFillFrameHandle *v21;
  id v22;
  id v23;
  objc_super v24;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (-[WBSFormMetadataController autoFillFrameIsValid:](self, "autoFillFrameIsValid:", v10))
  {
    v24.receiver = self;
    v24.super_class = (Class)_SFFormMetadataController;
    -[WBSFormMetadataController removeAutomaticPasswordElementsInFrame:focusedPasswordControlUniqueID:passwordControlUniqueIDs:blurAfterRemoval:](&v24, sel_removeAutomaticPasswordElementsInFrame_focusedPasswordControlUniqueID_passwordControlUniqueIDs_blurAfterRemoval_, v10, v11, v12, v6);
    -[WBSFormMetadataController formAutoFillNodeForField:inFrame:](self, "formAutoFillNodeForField:inFrame:", v11, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = 0;
    -[WBSFormMetadataController getMetadataForTextField:inFrame:textFieldMetadata:formMetadata:requestType:](self, "getMetadataForTextField:inFrame:textFieldMetadata:formMetadata:requestType:", v13, v10, &v23, &v22, 3);
    v14 = v23;
    v15 = v22;
    v16 = v22;
    objc_msgSend(v10, "plugInFrame");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_unsubmittedForm, v15);
    if (v16)
      v18 = v17;
    else
      v18 = 0;
    objc_storeStrong((id *)&self->_unsubmittedFormFrame, v18);
    v19 = 0;
    if (v13 && v14 && v16)
    {
      -[_SFFormMetadataController _assistedNodeMetadataWithPasswordField:passwordFieldMetadata:formMetadata:inFrame:](self, "_assistedNodeMetadataWithPasswordField:passwordFieldMetadata:formMetadata:inFrame:", v13, v14, v16, v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[_SFFormMetadataController _observer](self, "_observer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SFFormAutoFillFrameHandle initWithWebProcessPlugInFrame:]([SFFormAutoFillFrameHandle alloc], "initWithWebProcessPlugInFrame:", v17);
    objc_msgSend(v20, "didRemoveAutomaticStrongPasswordInForm:inputSessionUserObject:inFrame:", v16, v19, v21);

  }
}

- (void)removeAutomaticPasswordVisualTreatmentInFrame:(id)a3 passwordControlUniqueIDs:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (-[WBSFormMetadataController autoFillFrameIsValid:](self, "autoFillFrameIsValid:", v6))
  {
    v8.receiver = self;
    v8.super_class = (Class)_SFFormMetadataController;
    -[WBSFormMetadataController removeAutomaticPasswordVisualTreatmentInFrame:passwordControlUniqueIDs:](&v8, sel_removeAutomaticPasswordVisualTreatmentInFrame_passwordControlUniqueIDs_, v6, v7);
  }

}

- (void)setStrongPasswordElementViewableIfAppropriate:(BOOL)a3 frame:(id)a4 passwordControlUniqueIDs:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  objc_super v10;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  if (-[WBSFormMetadataController autoFillFrameIsValid:](self, "autoFillFrameIsValid:", v8))
  {
    v10.receiver = self;
    v10.super_class = (Class)_SFFormMetadataController;
    -[WBSFormMetadataController setStrongPasswordElementViewableIfAppropriate:frame:passwordControlUniqueIDs:](&v10, sel_setStrongPasswordElementViewableIfAppropriate_frame_passwordControlUniqueIDs_, v6, v8, v9);
  }

}

- (void)clearField:(id)a3 inFrame:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  WBSFormMetadata **p_unsubmittedForm;
  void *v13;
  WKWebProcessPlugInFrame **p_unsubmittedFormFrame;
  void *v15;
  WBSFormMetadata *v16;
  SFFormAutoFillFrameHandle *v17;
  id v18;
  id v19;
  objc_super v20;

  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_SFFormMetadataController;
  v7 = a3;
  -[WBSFormMetadataController clearField:inFrame:](&v20, sel_clearField_inFrame_, v7, v6);
  -[WBSFormMetadataController formAutoFillNodeForField:inFrame:](self, "formAutoFillNodeForField:inFrame:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  v19 = 0;
  -[WBSFormMetadataController getMetadataForTextField:inFrame:textFieldMetadata:formMetadata:requestType:](self, "getMetadataForTextField:inFrame:textFieldMetadata:formMetadata:requestType:", v8, v6, &v19, &v18, 3);
  v9 = v19;
  v10 = v18;
  v11 = v18;

  p_unsubmittedForm = &self->_unsubmittedForm;
  objc_storeStrong((id *)&self->_unsubmittedForm, v10);
  if (v11)
  {
    objc_msgSend(v6, "plugInFrame");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  p_unsubmittedFormFrame = &self->_unsubmittedFormFrame;
  objc_storeStrong((id *)&self->_unsubmittedFormFrame, v13);
  if (v11)

  -[_SFFormMetadataController _observer](self, "_observer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *p_unsubmittedForm;
  v17 = -[SFFormAutoFillFrameHandle initWithWebProcessPlugInFrame:]([SFFormAutoFillFrameHandle alloc], "initWithWebProcessPlugInFrame:", *p_unsubmittedFormFrame);
  objc_msgSend(v15, "didUpdateUnsubmittedForm:inFrame:", v16, v17);

}

- (void)autoFilledField:(id)a3 inForm:(id)a4 inFrame:(id)a5
{
  id v7;
  unint64_t v8;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "type");
  if (v8 <= 5 && ((1 << v8) & 0x3A) != 0)
  {
    -[_SFFormMetadataController _observer](self, "_observer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "autoFilledField:inForm:", v11, v7);

  }
}

- (void)finishedAutoFillingForm:(id)a3 inFrame:(id)a4 shouldSubmit:(BOOL)a5
{
  _BOOL8 v5;
  WKWebProcessPlugInFrame *v9;
  WKWebProcessPlugInFrame *unsubmittedFormFrame;
  WKWebProcessPlugInFrame *v11;
  SFFormAutoFillFrameHandle *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a5;
  v15 = a3;
  objc_msgSend(a4, "plugInFrame");
  v9 = (WKWebProcessPlugInFrame *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_unsubmittedForm, a3);
  unsubmittedFormFrame = self->_unsubmittedFormFrame;
  self->_unsubmittedFormFrame = v9;
  v11 = v9;

  self->_autoFillInProgress = 0;
  v12 = -[SFFormAutoFillFrameHandle initWithWebProcessPlugInFrame:]([SFFormAutoFillFrameHandle alloc], "initWithWebProcessPlugInFrame:", v11);
  -[_SFFormMetadataController _observer](self, "_observer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "didUpdateUnsubmittedForm:inFrame:", self->_unsubmittedForm, v12);

  if (objc_msgSend(v15, "type") == 3
    || objc_msgSend(v15, "type") == 5
    || objc_msgSend(v15, "type") == 1
    || objc_msgSend(v15, "type") == 4)
  {
    -[_SFFormMetadataController _observer](self, "_observer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "autoFillDidFinishWithUpdatedFormMetadata:inFrame:shouldSubmit:", v15, v12, v5);

  }
}

- (void)finishedAutoFillingOneTimeCode:(id)a3 inFrame:(id)a4 shouldSubmit:(BOOL)a5
{
  _BOOL8 v5;
  id v6;

  v5 = a5;
  -[_SFFormMetadataController _observer](self, "_observer", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didFillOneTimeCodeAndShouldSubmit:", v5);

}

- (void)focusFormForStreamlinedLogin:(double)a3 inFrame:(id)a4
{
  objc_super v5;

  self->_focusingFormForStreamlinedLogin = 1;
  v5.receiver = self;
  v5.super_class = (Class)_SFFormMetadataController;
  -[WBSFormMetadataController focusFormForStreamlinedLogin:inFrame:](&v5, sel_focusFormForStreamlinedLogin_inFrame_, a4, a3);
  self->_focusingFormForStreamlinedLogin = 0;
}

- (void)_willNavigateFrameWithUnsubmittedForm:(id)a3
{
  id v4;
  int IsDescendantOfFrame;
  void *v6;
  SFFormAutoFillFrameHandle *v7;
  WBSFormMetadata *unsubmittedForm;
  WKWebProcessPlugInFrame *unsubmittedFormFrame;
  id v10;

  v4 = a3;
  if (self->_unsubmittedForm)
  {
    v10 = v4;
    IsDescendantOfFrame = frameIsDescendantOfFrame(self->_unsubmittedFormFrame, v4);
    v4 = v10;
    if (IsDescendantOfFrame)
    {
      -[_SFFormMetadataController _observer](self, "_observer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[SFFormAutoFillFrameHandle initWithWebProcessPlugInFrame:]([SFFormAutoFillFrameHandle alloc], "initWithWebProcessPlugInFrame:", self->_unsubmittedFormFrame);
      objc_msgSend(v6, "willNavigateFrame:withUnsubmittedForm:", v7, self->_unsubmittedForm);

      unsubmittedForm = self->_unsubmittedForm;
      self->_unsubmittedForm = 0;

      unsubmittedFormFrame = self->_unsubmittedFormFrame;
      self->_unsubmittedFormFrame = 0;

      v4 = v10;
    }
  }

}

- (void)didStartProvisionalLoadForFrame:(id)a3
{
  _SFWebProcessPlugInPageController **p_pageController;
  id WeakRetained;
  id v6;
  id v7;

  p_pageController = &self->_pageController;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_pageController);
  objc_msgSend(WeakRetained, "mainFrame");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
    self->_shouldListenForFormChanges = 0;
  -[_SFFormMetadataController _willNavigateFrameWithUnsubmittedForm:](self, "_willNavigateFrameWithUnsubmittedForm:", v7);

}

- (void)didSameDocumentNavigation:(int64_t)a3 inFrame:(id)a4
{
  if (a3)
    -[_SFFormMetadataController _willNavigateFrameWithUnsubmittedForm:](self, "_willNavigateFrameWithUnsubmittedForm:", a4);
}

- (BOOL)shouldIncludeNonEmptyFields
{
  return 1;
}

- (void)_checkSearchURLTemplateStringInFrame:(id)a3 autoFillFrame:(id)a4 autoFillNode:(id)a5 controller:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (a5)
  {
    -[WBSFormMetadataController visibleNonEmptyTextFieldsInForm:inFrame:](self, "visibleNonEmptyTextFieldsInForm:inFrame:", a5, v11);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    v15 = v13;
    if (v14)
    {
      v16 = v14;
      v15 = 0;
      v17 = *(_QWORD *)v23;
      while (2)
      {
        v18 = 0;
        v19 = v15;
        do
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v13);
          v20 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v18);
          v21 = objc_msgSend(v20, "isHTMLInputElementUserEdited", (_QWORD)v22);
          if (v19 && (v21 & 1) != 0)
          {
            v15 = v13;
LABEL_15:

            goto LABEL_16;
          }
          v15 = v20;

          ++v18;
          v19 = v15;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v16)
          continue;
        break;
      }

      if (v15)
      {
        -[WBSFormMetadataController formSubmissionURLStringForSearchTextField:inFrame:useStrictDetection:](self, "formSubmissionURLStringForSearchTextField:inFrame:useStrictDetection:", v15, v11, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          -[_SFFormMetadataController didFindSearchURLTemplateString:inFrame:pageController:](self, "didFindSearchURLTemplateString:inFrame:pageController:", v19, v10, v12);
        goto LABEL_15;
      }
    }
    else
    {
LABEL_16:

    }
  }

}

- (void)_webProcessPlugInBrowserContextController:(id)a3 textDidChangeInTextField:(id)a4 inFrame:(id)a5 initiatedByUserTyping:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  WBSBlockCoalescer *v13;
  WBSBlockCoalescer *textDidChangeEventCoalescer;
  WBSBlockCoalescer *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!self->_textDidChangeEventCoalescer)
  {
    v12 = objc_alloc(MEMORY[0x1E0D8A7C8]);
    v13 = (WBSBlockCoalescer *)objc_msgSend(v12, "initWithMinimumTimeIntervalBeforeExecution:queue:", MEMORY[0x1E0C80D38], 0.1);
    textDidChangeEventCoalescer = self->_textDidChangeEventCoalescer;
    self->_textDidChangeEventCoalescer = v13;

  }
  objc_initWeak(&location, self);
  v15 = self->_textDidChangeEventCoalescer;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __126___SFFormMetadataController__webProcessPlugInBrowserContextController_textDidChangeInTextField_inFrame_initiatedByUserTyping___block_invoke;
  v18[3] = &unk_1E4AC07A8;
  objc_copyWeak(&v21, &location);
  v16 = v10;
  v19 = v16;
  v17 = v11;
  v20 = v17;
  -[WBSBlockCoalescer scheduleBlock:](v15, "scheduleBlock:", v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (id)_webProcessPlugInBrowserContextController:(id)a3 willBeginInputSessionForElement:(id)a4 inFrame:(id)a5 userIsInteracting:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  _BOOL4 v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSDictionary *v22;
  NSDictionary *assistedNodeMetadata;
  BOOL v24;
  id v25;
  void *v26;
  SFFormAutoFillFrameHandle *v27;
  void *v28;
  NSDictionary *v29;
  void *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[3];
  _QWORD v36[4];

  v6 = a6;
  v36[3] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = self->_autoFillInProgress || self->_focusingFormForStreamlinedLogin;
  if ((objc_msgSend(v9, "isTextField") & 1) == 0 && !objc_msgSend(v9, "isSelectElement"))
    goto LABEL_17;
  if (v11 || v6)
    goto LABEL_9;
  if (GSEventIsHardwareKeyboardAttached())
    goto LABEL_9;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);
  objc_msgSend(WeakRetained, "webProcessPlugIn");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "plugInController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "parameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueForKey:", CFSTR("launchedToTest"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  if (v17)
  {
LABEL_9:
    +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFFormAutoFillNode autoFillNodeWithNodeHandle:](SFFormAutoFillNode, "autoFillNodeWithNodeHandle:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v34 = 0;
    -[WBSFormMetadataController getMetadataForTextField:inFrame:textFieldMetadata:formMetadata:requestType:](self, "getMetadataForTextField:inFrame:textFieldMetadata:formMetadata:requestType:", v19, v18, &v34, &v33, 0);
    v20 = v34;
    v21 = v33;
    -[WBSFormMetadataController textFieldFocused:inFrame:textFieldMetadata:formMetadata:](self, "textFieldFocused:inFrame:textFieldMetadata:formMetadata:", v19, v18, v20, v21);
    v22 = self->_assistedNodeMetadata;
    assistedNodeMetadata = self->_assistedNodeMetadata;
    self->_assistedNodeMetadata = 0;

    if (v22)
      v24 = 1;
    else
      v24 = v21 == 0;
    if (!v24)
    {
      v35[0] = CFSTR("textField");
      objc_msgSend(v20, "serializedData");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v31;
      v35[1] = CFSTR("form");
      objc_msgSend(v21, "serializedData");
      v32 = v9;
      v25 = v10;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v26;
      v35[2] = CFSTR("frame");
      v27 = -[SFFormAutoFillFrameHandle initWithWebProcessPlugInFrame:]([SFFormAutoFillFrameHandle alloc], "initWithWebProcessPlugInFrame:", v25);
      -[SFFormAutoFillFrameHandle serializedData](v27, "serializedData");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v36[2] = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
      v22 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

      v10 = v25;
      v9 = v32;

    }
    if (self->_focusingFormForStreamlinedLogin)
    {
      v29 = (NSDictionary *)-[NSDictionary mutableCopy](v22, "mutableCopy");
      -[NSDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("focusingForStreamlinedLogin"));

      v22 = v29;
    }

  }
  else
  {
LABEL_17:
    v22 = 0;
  }

  return v22;
}

- (void)_webProcessPlugInBrowserContextController:(id)a3 willSendSubmitEventToForm:(id)a4 inFrame:(id)a5 targetFrame:(id)a6 values:(id)a7
{
  WKWebProcessPlugInFrame *v9;
  id v10;
  void *v11;
  WBSFormMetadata *v12;
  WBSFormMetadata *unsubmittedForm;
  WKWebProcessPlugInFrame *unsubmittedFormFrame;
  WKWebProcessPlugInFrame *v15;
  void *v16;
  WBSFormMetadata *v17;
  SFFormAutoFillFrameHandle *v18;
  id v19;

  v9 = (WKWebProcessPlugInFrame *)a5;
  v10 = a4;
  +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", v9);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  +[SFFormAutoFillNode autoFillNodeWithNodeHandle:](SFFormAutoFillNode, "autoFillNodeWithNodeHandle:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSFormMetadataController willSendSubmitEventForForm:inFrame:](self, "willSendSubmitEventForForm:inFrame:", v11, v19);
  -[WBSFormMetadataController metadataForForm:inFrame:requestType:](self, "metadataForForm:inFrame:requestType:", v11, v19, 0);
  v12 = (WBSFormMetadata *)objc_claimAutoreleasedReturnValue();
  unsubmittedForm = self->_unsubmittedForm;
  self->_unsubmittedForm = v12;

  unsubmittedFormFrame = self->_unsubmittedFormFrame;
  self->_unsubmittedFormFrame = v9;
  v15 = v9;

  -[_SFFormMetadataController _observer](self, "_observer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = self->_unsubmittedForm;
  v18 = -[SFFormAutoFillFrameHandle initWithWebProcessPlugInFrame:]([SFFormAutoFillFrameHandle alloc], "initWithWebProcessPlugInFrame:", self->_unsubmittedFormFrame);
  objc_msgSend(v16, "didUpdateUnsubmittedForm:inFrame:", v17, v18);

}

- (id)_webProcessPlugInBrowserContextController:(id)a3 willSubmitForm:(id)a4 toFrame:(id)a5 fromFrame:(id)a6 withValues:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SFFormAutoFillFrameHandle *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  SFFormAutoFillFrameHandle *v24;
  void *v25;
  void *v26;
  WBSFormMetadata *unsubmittedForm;
  WKWebProcessPlugInFrame *unsubmittedFormFrame;
  void *v29;
  id v30;
  void *v31;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a4;
  +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFFormAutoFillNode autoFillNodeWithNodeHandle:](SFFormAutoFillNode, "autoFillNodeWithNodeHandle:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSFormMetadataController metadataForForm:inFrame:requestType:addUserEditedStateForUserNameAndPasswordFields:](self, "metadataForForm:inFrame:requestType:addUserEditedStateForUserNameAndPasswordFields:", v16, v15, 0, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[WBSFormMetadataController willSubmitForm:inFrame:](self, "willSubmitForm:inFrame:", v16, v15);
    v34[0] = CFSTR("form");
    objc_msgSend(v17, "serializedData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = CFSTR("frame");
    v35[0] = v18;
    v19 = -[SFFormAutoFillFrameHandle initWithWebProcessPlugInFrame:]([SFFormAutoFillFrameHandle alloc], "initWithWebProcessPlugInFrame:", v13);
    v33 = v15;
    v20 = v17;
    v21 = v13;
    v22 = v11;
    v23 = v12;
    v24 = v19;
    -[SFFormAutoFillFrameHandle serializedData](v19, "serializedData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v23;
    v11 = v22;
    v13 = v21;
    v17 = v20;
    v15 = v33;

  }
  else
  {
    unsubmittedForm = self->_unsubmittedForm;
    self->_unsubmittedForm = 0;

    unsubmittedFormFrame = self->_unsubmittedFormFrame;
    self->_unsubmittedFormFrame = 0;

    -[_SFFormMetadataController _observer](self, "_observer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "didUpdateUnsubmittedForm:inFrame:", 0, 0);

    -[WBSFormMetadataController willSubmitForm:inFrame:](self, "willSubmitForm:inFrame:", v16, v15);
    v26 = 0;
  }
  objc_msgSend(v11, "mainFrame");
  v30 = (id)objc_claimAutoreleasedReturnValue();

  if (v30 == v13)
  {
    -[WBSFormMetadataController visibleNonEmptyTextFieldsInForm:inFrame:](self, "visibleNonEmptyTextFieldsInForm:inFrame:", v16, v15);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "count"))
      -[_SFFormMetadataController _checkSearchURLTemplateStringInFrame:autoFillFrame:autoFillNode:controller:](self, "_checkSearchURLTemplateStringInFrame:autoFillFrame:autoFillNode:controller:", v12, v15, v16, v11);

  }
  return v26;
}

- (BOOL)_webProcessPlugInBrowserContextControllerShouldNotifyOnFormChanges:(id)a3
{
  return self->_shouldListenForFormChanges;
}

@end
