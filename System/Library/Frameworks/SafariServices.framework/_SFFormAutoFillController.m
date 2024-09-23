@implementation _SFFormAutoFillController

- (void)setMetadataCorrectionsEnabled:(BOOL)a3
{
  self->_metadataCorrectionsEnabled = a3;
}

- (_SFFormAutoFillController)initWithWebView:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  _SFFormAutoFillController *v8;
  _SFFormAutoFillController *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *formTelemetryDataMonitorQueue;
  void *v12;
  uint64_t v13;
  _WKRemoteObjectInterface *remoteObjectInterface;
  _WKRemoteObjectInterface *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _WKRemoteObjectInterface *v19;
  void *v20;
  void *v21;
  _WKRemoteObjectInterface *v22;
  void *v23;
  void *v24;
  _WKRemoteObjectInterface *v25;
  void *v26;
  _WKRemoteObjectInterface *v27;
  void *v28;
  _WKRemoteObjectInterface *v29;
  void *v30;
  _WKRemoteObjectInterface *v31;
  void *v32;
  _WKRemoteObjectInterface *v33;
  void *v34;
  _WKRemoteObjectInterface *v35;
  void *v36;
  _WKRemoteObjectInterface *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  SFFormAutoFiller *autoFiller;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _SFFormAutoFillController *v51;
  objc_super v53;

  v6 = a3;
  v7 = a4;
  v53.receiver = self;
  v53.super_class = (Class)_SFFormAutoFillController;
  v8 = -[_SFFormAutoFillController init](&v53, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_webView, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    v10 = dispatch_queue_create("com.apple.mobilesafari.FormTelemetryDataMonitorQueue", 0);
    formTelemetryDataMonitorQueue = v9->_formTelemetryDataMonitorQueue;
    v9->_formTelemetryDataMonitorQueue = (OS_dispatch_queue *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EE749708);
    v13 = objc_claimAutoreleasedReturnValue();
    remoteObjectInterface = v9->_remoteObjectInterface;
    v9->_remoteObjectInterface = (_WKRemoteObjectInterface *)v13;

    v15 = v9->_remoteObjectInterface;
    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](v15, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_didCollectURLsForPreFilling_atURL_inFrame_, 0, 0);

    v19 = v9->_remoteObjectInterface;
    metadataClasses();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setByAddingObjectsFromSet:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](v19, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_didCollectFormMetadataForPreFilling_atURL_, 0, 0);

    v22 = v9->_remoteObjectInterface;
    metadataClasses();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setByAddingObjectsFromSet:", v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](v22, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_didCollectFormMetadataForPageLevelAutoFill_atURL_, 0, 0);

    v25 = v9->_remoteObjectInterface;
    metadataClasses();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](v25, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_textDidChangeInTextField_inForm_inFrame_, 0, 0);

    v27 = v9->_remoteObjectInterface;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](v27, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_textDidChangeInTextField_inForm_inFrame_, 1, 0);

    -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](v9->_remoteObjectInterface, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_textDidChangeInTextField_inForm_inFrame_, 2, 0);
    v29 = v9->_remoteObjectInterface;
    metadataClasses();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](v29, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_didFillGeneratedPasswordInForm_inFrame_, 0, 0);

    -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](v9->_remoteObjectInterface, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_didFillGeneratedPasswordInForm_inFrame_, 1, 0);
    -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](v9->_remoteObjectInterface, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_willNavigateFrame_withUnsubmittedForm_, 0, 0);
    v31 = v9->_remoteObjectInterface;
    metadataClasses();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](v31, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_willNavigateFrame_withUnsubmittedForm_, 1, 0);

    v33 = v9->_remoteObjectInterface;
    metadataClasses();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](v33, "setClasses:forSelector:argumentIndex:ofReply:", v34, sel_didUpdateUnsubmittedForm_inFrame_, 0, 0);

    -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](v9->_remoteObjectInterface, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_didUpdateUnsubmittedForm_inFrame_, 1, 0);
    v35 = v9->_remoteObjectInterface;
    metadataClasses();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](v35, "setClasses:forSelector:argumentIndex:ofReply:", v36, sel_didRemoveAutomaticStrongPasswordInForm_inputSessionUserObject_inFrame_, 0, 0);

    v37 = v9->_remoteObjectInterface;
    metadataClasses();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setByAddingObjectsFromSet:", v12);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](v37, "setClasses:forSelector:argumentIndex:ofReply:", v39, sel_didRemoveAutomaticStrongPasswordInForm_inputSessionUserObject_inFrame_, 1, 0);

    -[_WKRemoteObjectInterface setClasses:forSelector:argumentIndex:ofReply:](v9->_remoteObjectInterface, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_didRemoveAutomaticStrongPasswordInForm_inputSessionUserObject_inFrame_, 2, 0);
    objc_msgSend(v6, "_remoteObjectRegistry");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "registerExportedObject:interface:", v9, v9->_remoteObjectInterface);
    objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EE770C58);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setClasses:forSelector:argumentIndex:ofReply:", v42, sel_getMetadataForTextField_inFrame_atURL_completionHandler_, 0, 1);

    metadataClasses();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setClasses:forSelector:argumentIndex:ofReply:", v43, sel_getMetadataForTextField_inFrame_atURL_completionHandler_, 1, 1);

    metadataClasses();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setClasses:forSelector:argumentIndex:ofReply:", v44, sel_diagnosticsFormMetadataWithCompletionHandler_, 0, 1);

    objc_msgSend(v40, "remoteObjectProxyWithInterface:", v41);
    v45 = objc_claimAutoreleasedReturnValue();
    autoFiller = v9->_autoFiller;
    v9->_autoFiller = (SFFormAutoFiller *)v45;

    objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObserver:", v9);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addObserver:selector:name:object:", v9, sel_handleDidSaveAccountWithGeneratedPasswordNotification_, *MEMORY[0x1E0DD9940], v49);

    +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addObserver:selector:name:object:", v9, sel_handleDidUpdatePasswordForPreviouslySavedAccount_, *MEMORY[0x1E0DD9948], v50);

    v51 = v9;
  }

  return v9;
}

- (void)prefillFormsSoonIfNeeded
{
  id WeakRetained;
  char v4;
  NSTimer *v5;
  NSTimer *prefillTimer;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_msgSend(WeakRetained, "formAutoFillControllerCanPrefillForm:", self);

  if ((v4 & 1) != 0)
  {
    -[NSTimer invalidate](self->_prefillTimer, "invalidate");
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__prefillTimerFired_, 0, 0, 0.25);
    v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    prefillTimer = self->_prefillTimer;
    self->_prefillTimer = v5;

  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[_SFFormAutoFillController invalidate](self, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DD9940], v4);

  +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DD9948], v5);

  v6.receiver = self;
  v6.super_class = (Class)_SFFormAutoFillController;
  -[_SFFormAutoFillController dealloc](&v6, sel_dealloc);
}

- (void)invalidate
{
  WBUFormAutoFillWebView **p_webView;
  void *v4;
  _WKRemoteObjectInterface *remoteObjectInterface;
  SFFormAutocompleteState *state;
  NSTimer *prefillTimer;
  id WeakRetained;
  id v9;

  p_webView = &self->_webView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "_remoteObjectRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterExportedObject:interface:", self, self->_remoteObjectInterface);

  remoteObjectInterface = self->_remoteObjectInterface;
  self->_remoteObjectInterface = 0;

  -[SFFormAutocompleteState invalidate](self->_state, "invalidate");
  state = self->_state;
  self->_state = 0;

  -[NSTimer invalidate](self->_prefillTimer, "invalidate");
  prefillTimer = self->_prefillTimer;
  self->_prefillTimer = 0;

  objc_storeWeak((id *)p_webView, 0);
  objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:", self);

}

- (void)_prefillTimerFired:(id)a3
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "formAutoFillControllerURLForFormAutoFill:", self);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[SFFormAutoFiller collectURLsForPrefillingAtURL:](self->_autoFiller, "collectURLsForPrefillingAtURL:", v5);
}

- (void)offerToSaveUnsubmittedFormDataIfNeeded
{
  -[_SFFormAutoFillController willNavigateFrame:withUnsubmittedForm:](self, "willNavigateFrame:withUnsubmittedForm:", self->_unsubmittedFormFrame, self->_unsubmittedForm);
}

- (void)autoFill
{
  -[SFFormAutocompleteState autoFill](self->_state, "autoFill");
}

- (void)insertTextSuggestion:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFFormAutocompleteState showAllPasswordsButtonTapped](self->_state, "showAllPasswordsButtonTapped");
  }
  else if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFFormAutoFillController autoFillTextSuggestion:](self, "autoFillTextSuggestion:", v4);
  }

}

- (void)updateSuggestions
{
  -[SFFormAutocompleteState updateSuggestions](self->_state, "updateSuggestions");
}

- (void)_fieldFocused:(id)a3 inForm:(id)a4 inFrame:(id)a5 inputSession:(id)a6
{
  id v10;
  id v11;
  id v12;
  SFFormAutocompleteState *v13;
  SFFormAutocompleteState *state;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[SFFormAutocompleteState invalidate](self->_state, "invalidate");
  v13 = -[SFFormAutocompleteState initWithFrame:form:textField:inputSession:autoFillController:]([SFFormAutocompleteState alloc], "initWithFrame:form:textField:inputSession:autoFillController:", v11, v10, v17, v12, self);
  state = self->_state;
  self->_state = v13;

  objc_msgSend(v12, "formInputSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SFFormAutocompleteState action](self->_state, "action") != 7)
    -[SFFormAutocompleteState updateAutoFillButton](self->_state, "updateAutoFillButton");
  if (objc_msgSend(MEMORY[0x1E0DD9910], "textFieldLooksLikeCreditCardNumericFormField:", v17))
  {
    objc_msgSend(v15, "setForceSecureTextEntry:", 1);
  }
  else if (!objc_msgSend(v17, "isSecureTextField"))
  {
    goto LABEL_7;
  }
  -[_SFFormAutoFillController _didFocusSensitiveFormField](self, "_didFocusSensitiveFormField");
LABEL_7:
  if (objc_msgSend(v17, "looksLikeOneTimeCodeField"))
  {
    -[_SFFormAutoFillController oneTimeCodeProvider](self, "oneTimeCodeProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "didFocusOneTimeCodeField");

  }
}

- (void)usernameFieldFocused:(id)a3 inForm:(id)a4 inFrame:(id)a5 inputSession:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[_SFFormAutoFillController _didFocusSensitiveFormField](self, "_didFocusSensitiveFormField");
  -[_SFFormAutoFillController _fieldFocused:inForm:inFrame:inputSession:](self, "_fieldFocused:inForm:inFrame:inputSession:", v13, v10, v11, v12);

}

- (void)fetchMetadataForTextField:(id)a3 inFrame:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  SFFormAutoFiller *autoFiller;
  id WeakRetained;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  autoFiller = self->_autoFiller;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "formAutoFillControllerURLForFormAutoFill:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFFormAutoFiller getMetadataForTextField:inFrame:atURL:completionHandler:](autoFiller, "getMetadataForTextField:inFrame:atURL:completionHandler:", v13, v8, v12, v9);

}

- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 setAutoFilled:(BOOL)a5 focusFieldAfterFilling:(BOOL)a6 fieldToFocus:(id)a7 submitForm:(BOOL)a8
{
  uint64_t v8;

  LOBYTE(v8) = a8;
  -[_SFFormAutoFillController autoFillFormInFrame:withValues:setAutoFilled:focusFieldAfterFilling:fieldToFocus:fieldsToObscure:submitForm:](self, "autoFillFormInFrame:withValues:setAutoFilled:focusFieldAfterFilling:fieldToFocus:fieldsToObscure:submitForm:", a3, a4, a5, a6, a7, 0, v8);
}

- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 setAutoFilled:(BOOL)a5 focusFieldAfterFilling:(BOOL)a6 fieldToFocus:(id)a7 fieldsToObscure:(id)a8 submitForm:(BOOL)a9
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t v21;
  WBSCreditCardData *lastFilledCreditCardData;
  NSDictionary *lastFilledCreditCardDataTypes;
  uint64_t v24;
  id v25;

  v11 = a6;
  v12 = a5;
  v25 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  v18 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v15, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFFormAutoFillController _addValuesAutoFilledForCurrentPage:](self, "_addValuesAutoFilledForCurrentPage:", v20);

  LOBYTE(v24) = a9;
  -[SFFormAutoFiller autoFillFormAsynchronouslyInFrame:withValues:setAutoFilled:focusFieldAfterFilling:fieldToFocus:fieldsToObscure:submitForm:](self->_autoFiller, "autoFillFormAsynchronouslyInFrame:withValues:setAutoFilled:focusFieldAfterFilling:fieldToFocus:fieldsToObscure:submitForm:", v25, v15, v12, v11, v16, v17, v24);
  v21 = -[SFFormAutocompleteState action](self->_state, "action");
  if (v21 == 2 || v21 == 8)
  {
    lastFilledCreditCardData = self->_lastFilledCreditCardData;
    self->_lastFilledCreditCardData = 0;

    lastFilledCreditCardDataTypes = self->_lastFilledCreditCardDataTypes;
    self->_lastFilledCreditCardDataTypes = 0;

  }
}

- (void)autoFillForm:(int64_t)a3 inFrame:(id)a4 withGeneratedPassword:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  dispatch_time_t v20;
  int64_t v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD v24[4];
  NSObject *v25;

  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFFormAutoFillController _addValuesAutoFilledForCurrentPage:](self, "_addValuesAutoFilledForCurrentPage:", v10);

  v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "generatedPassword");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D8A970], "sharedStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __72___SFFormAutoFillController_autoFillForm_inFrame_withGeneratedPassword___block_invoke;
    v24[3] = &unk_1E4AC1F50;
    v25 = v11;
    objc_msgSend(v14, "updateGeneratedPassword:withPassword:completionHandler:", v13, v9, v24);

    WeakRetained = v25;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    objc_msgSend(v8, "webui_URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = a3;
    objc_msgSend(MEMORY[0x1E0D8A970], "sharedStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C92C70], "safari_HTMLFormProtectionSpaceForURL:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(WeakRetained, "webui_privateBrowsingEnabled");
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __72___SFFormAutoFillController_autoFillForm_inFrame_withGeneratedPassword___block_invoke_3;
    v22[3] = &unk_1E4AC1F50;
    v23 = v11;
    objc_msgSend(v17, "addGeneratedPassword:forProtectionSpace:inPrivateBrowsingSession:completionHandler:", v9, v18, v19, v22);

    a3 = v21;
  }

  v20 = dispatch_time(0, 1000000000);
  dispatch_group_wait(v11, v20);
  self->_didFillStrongPasswordFromStreamlinedAutoFillView = 1;
  -[SFFormAutoFiller autoFillForm:inFrame:withGeneratedPassword:](self->_autoFiller, "autoFillForm:inFrame:withGeneratedPassword:", a3, v8, v9);

}

- (void)annotateForm:(int64_t)a3 inFrame:(id)a4 withValues:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v8, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFFormAutoFillController _addValuesAutoFilledForCurrentPage:](self, "_addValuesAutoFilledForCurrentPage:", v11);

  -[SFFormAutoFiller annotateForm:inFrame:withValues:](self->_autoFiller, "annotateForm:inFrame:withValues:", a3, v12, v8);
}

- (void)fillTextField:(id)a3 inFrame:(id)a4 withGeneratedPassword:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFFormAutoFillController _addValuesAutoFilledForCurrentPage:](self, "_addValuesAutoFilledForCurrentPage:", v10);

  -[SFFormAutoFiller fillTextField:inFrame:withGeneratedPassword:](self->_autoFiller, "fillTextField:inFrame:withGeneratedPassword:", v11, v8, v9);
}

- (void)autoFillOneTimeCodeFieldsInFrame:(id)a3 withValue:(id)a4 shouldSubmit:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;

  v5 = a5;
  v10 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFFormAutoFillController _addValuesAutoFilledForCurrentPage:](self, "_addValuesAutoFilledForCurrentPage:", v9);

  -[SFFormAutoFiller autoFillOneTimeCodeFieldsInFrame:withValue:shouldSubmit:](self->_autoFiller, "autoFillOneTimeCodeFieldsInFrame:withValue:shouldSubmit:", v10, v8, v5);
}

- (void)setFormControls:(id)a3 areAutoFilled:(BOOL)a4 andClearField:(id)a5 inFrame:(id)a6
{
  -[SFFormAutoFiller setFormControls:areAutoFilled:andClearField:inFrame:](self->_autoFiller, "setFormControls:areAutoFilled:andClearField:inFrame:", a3, a4, a5, a6);
}

- (void)clearFieldsAndSetFormControlsToNotAutoFilled:(id)a3 inFrame:(id)a4 completionHandler:(id)a5
{
  -[SFFormAutoFiller clearFieldsAndSetFormControlsToNotAutoFilled:inFrame:completionHandler:](self->_autoFiller, "clearFieldsAndSetFormControlsToNotAutoFilled:inFrame:completionHandler:", a3, a4, a5);
}

- (void)willSubmitForm:(id)a3 inFrame:(id)a4 submissionHandler:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id WeakRetained;
  void *v14;
  int v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  v10 = objc_msgSend(v16, "uniqueID");
  if (self->_metadataCorrectionsEnabled)
    v11 = -[NSMutableIndexSet containsIndex:](self->_uniqueIDsOfFormsThatWereAutoFilled, "containsIndex:", v10);
  else
    v11 = 0;
  +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLastFilledCreditCardData:", self->_lastFilledCreditCardData);
  objc_msgSend(v12, "setPreviouslyFilledVirtualCardNumbers:", self->_previouslyFilledVirtualCardNumbers);
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  -[_SFFormAutoFillController savedAccountContext](self, "savedAccountContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "webView:frame:willNavigateFromForm:inContext:bySubmitting:processMetadataCorrections:uniqueIDsOfControlsThatWereAutoFilled:submissionHandler:", WeakRetained, v8, v16, v14, 1, v11, self->_uniqueIDsOfControlsThatWereAutoFilled, v9);

  if (v15)
    v9[2](v9);
  objc_msgSend(v12, "setLastFilledCreditCardData:", 0);
  -[_SFFormAutoFillController _removeUniqueIDsOfAutoFilledForm:](self, "_removeUniqueIDsOfAutoFilledForm:", v16);
  -[_SFFormAutoFillController sendEventsForAutoFillTelemetry](self, "sendEventsForAutoFillTelemetry");
  -[_SFFormAutoFillController _dismissAutoFillInternalFeedbackNoticeImmediately:](self, "_dismissAutoFillInternalFeedbackNoticeImmediately:", 0);

}

- (WBUFormAutoFillWebView)webView
{
  return (WBUFormAutoFillWebView *)objc_loadWeakRetained((id *)&self->_webView);
}

- (void)suppressSoftwareKeyboardOnWebView:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "_setSuppressSoftwareKeyboard:", v3);

}

- (void)fieldWillFocusWithInputSession:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *externalCredentialIdentitiesForStreamlinedAutoFill;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id WeakRetained;
  dispatch_time_t v23;
  void *v24;
  void *v25;
  SFFormAutocompleteState *state;
  id v27;
  id *v28;
  id *v29;
  _BOOL4 attemptedOfferingStreamlinedLogin;
  _QWORD v31[4];
  id v32;
  id v33;
  _SFFormAutoFillController *v34;
  id v35;
  _QWORD block[4];
  id v37;
  id location;

  v4 = a3;
  -[_SFFormAutoFillController _restoreInputAssistantItemsIfNecessary](self, "_restoreInputAssistantItemsIfNecessary");
  v5 = self->_externalCredentialIdentitiesForStreamlinedAutoFill;
  externalCredentialIdentitiesForStreamlinedAutoFill = self->_externalCredentialIdentitiesForStreamlinedAutoFill;
  self->_externalCredentialIdentitiesForStreamlinedAutoFill = 0;

  objc_msgSend(v4, "autoFillInputSessionUserObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v4, "frameHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(v8, "webui_URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "safari_isEligibleToShowNotSecureWarning");

    objc_msgSend(v4, "formMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
LABEL_21:

      goto LABEL_22;
    }
    v13 = (void *)MEMORY[0x1E0D8AA30];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("usernameField"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "formControlMetadataFromSerializedData:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0D8AA30];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("passwordField"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "formControlMetadataFromSerializedData:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[_SFFormAutoFillController usernameFieldFocused:inForm:inFrame:inputSession:](self, "usernameFieldFocused:inForm:inFrame:inputSession:", v15, v12, v9, v4);
    }
    else
    {
      if (!v18)
      {
        v28 = (id *)MEMORY[0x1E0D8A948];
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("textField"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "formControlMetadataFromSerializedData:", v21);
        v29 = (id *)objc_claimAutoreleasedReturnValue();

        if ((v11 & 1) == 0)
          -[_SFFormAutoFillController textFieldFocused:inForm:inFrame:inputSession:](self, "textFieldFocused:inForm:inFrame:inputSession:", v29, v12, v9, v4);

        goto LABEL_20;
      }
      -[_SFFormAutoFillController passwordFieldFocused:inForm:inFrame:inputSession:](self, "passwordFieldFocused:inForm:inFrame:inputSession:", v18, v12, v9, v4);
    }
    if ((v11 & 1) == 0)
    {
      if (v15 | v18)
      {
        v19 = objc_msgSend(v12, "type");
        if (!-[_SFFormAutoFillController _presentStrongPasswordIntroductionIfNeededWithAutoFillInputSession:](self, "_presentStrongPasswordIntroductionIfNeededWithAutoFillInputSession:", v4)&& !-[_SFFormAutoFillController _presentStreamlinedStrongPasswordInputViewIfNeededWithInputSession:formType:](self, "_presentStreamlinedStrongPasswordInputViewIfNeededWithInputSession:formType:", v4, v19))
        {
          objc_msgSend(v4, "focusedElementInfo");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[_SFFormAutoFillController elementIsBeingFocusedForStreamlinedLogin:](self, "elementIsBeingFocusedForStreamlinedLogin:", v20))
          {

            goto LABEL_18;
          }
          attemptedOfferingStreamlinedLogin = self->_attemptedOfferingStreamlinedLogin;

          if (!attemptedOfferingStreamlinedLogin)
          {
LABEL_18:
            if (v19 == 3)
            {
              objc_initWeak(&location, self);
              self->_attemptedOfferingStreamlinedLogin = 1;
              WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
              objc_msgSend(WeakRetained, "_setSuppressSoftwareKeyboard:", 1);

              v23 = dispatch_time(0, 3000000000);
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __60___SFFormAutoFillController_fieldWillFocusWithInputSession___block_invoke;
              block[3] = &unk_1E4AC11B8;
              objc_copyWeak(&v37, &location);
              dispatch_after(v23, MEMORY[0x1E0C80D38], block);
              objc_msgSend(v9, "webui_URL");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              state = self->_state;
              v31[0] = MEMORY[0x1E0C809B0];
              v31[1] = 3221225472;
              v31[2] = __60___SFFormAutoFillController_fieldWillFocusWithInputSession___block_invoke_2;
              v31[3] = &unk_1E4AC1F78;
              v32 = v9;
              v33 = v25;
              v34 = self;
              v35 = v4;
              v27 = v25;
              -[SFFormAutocompleteState getTextSuggestionForStreamlinedAutoFillWithCredentialIdentity:completion:](state, "getTextSuggestionForStreamlinedAutoFillWithCredentialIdentity:completion:", v27, v31);

              objc_destroyWeak(&v37);
              objc_destroyWeak(&location);
            }
          }
        }
      }
    }
LABEL_20:

    goto LABEL_21;
  }
LABEL_23:

}

- (NSUUID)tabIDForAutoFill
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "tabIDForAutoFill");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (BOOL)_presentStreamlinedStrongPasswordInputViewIfNeededWithInputSession:(id)a3 formType:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  char v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _SFAutoFillInputView *v31;
  _SFAutoFillInputView *autoFillInputView;
  _SFAutoFillInputView *v33;
  void *v34;
  void *v35;
  uint8_t v36[16];

  v6 = a3;
  if (self->_didCloseStrongPasswordIntroductionView
    || (objc_msgSend(MEMORY[0x1E0D6C088], "hasThirdPartyPasswordManagerEnabledAndPasswordsAppDisabledForAutoFill") & 1) != 0
    || !objc_msgSend(MEMORY[0x1E0D8A8F8], "isPasswordManagerAppEnabledAndInstalled"))
  {
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0D8A020], "sharedFeatureManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldAutoFillPasswordsFromKeychain");

  v9 = (a4 & 0xFFFFFFFFFFFFFFFELL) == 4 ? v8 : 0;
  if ((v9 & 1) == 0)
    goto LABEL_10;
  -[SFFormAutocompleteState textFieldMetadata](self->_state, "textFieldMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "formMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "oldPasswordElementUniqueID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "isEqualToString:", v13);

  if ((v14 & 1) != 0 || self->_didFillStrongPasswordFromStreamlinedAutoFillView)
  {
LABEL_10:
    v15 = 0;
  }
  else
  {
    +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "autoFillQuirksManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "passwordGenerationManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "frameHandle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "webui_URL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "defaultRequirementsForURL:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v19, "passwordGenerationIsDisallowedByRequirements:", v22);
    if ((v23 & 1) == 0)
    {
      v24 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v36 = 0;
        _os_log_impl(&dword_1A3B2D000, v24, OS_LOG_TYPE_DEFAULT, "Presenting streamlined strong password view in custom input view", v36, 2u);
      }
      v25 = objc_alloc(MEMORY[0x1E0D6C098]);
      objc_msgSend(v6, "frameHandle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "webui_URL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "host");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "safari_highLevelDomainFromHost");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v25, "initWithDomain:", v29);

      v31 = -[_SFAutoFillInputView initWithStreamlinedStrongPasswordViewController:]([_SFAutoFillInputView alloc], "initWithStreamlinedStrongPasswordViewController:", v30);
      autoFillInputView = self->_autoFillInputView;
      self->_autoFillInputView = v31;

      -[_SFAutoFillInputView setDelegate:](self->_autoFillInputView, "setDelegate:", self);
      v33 = self->_autoFillInputView;
      objc_msgSend(v6, "formInputSession");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setCustomInputView:", v33);

      objc_msgSend(v6, "formInputSession");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setAccessoryViewShouldNotShow:", 1);

      -[_SFFormAutoFillController _hideInputAssistantItemsIfNecessary](self, "_hideInputAssistantItemsIfNecessary");
    }
    v15 = v23 ^ 1;

  }
  return v15;
}

- (BOOL)_presentStrongPasswordIntroductionIfNeededWithAutoFillInputSession:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  PMSafariAutoFillStrongPasswordIntroductionViewController *v15;
  PMSafariAutoFillStrongPasswordIntroductionViewController *strongPasswordIntroductionViewController;
  NSObject *v17;
  _SFAutoFillInputView *autoFillInputView;
  _SFAutoFillInputView *v19;
  _SFAutoFillInputView *v20;
  void *v21;
  void *v22;
  _DWORD v24[2];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "formMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 >= 4 && (v6 - 4 >= 2 || objc_msgSend(MEMORY[0x1E0D6C088], "shouldShowLoginIntroduction")))
  {
    +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "autoFillQuirksManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "passwordGenerationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "frameHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "webui_URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "defaultRequirementsForURL:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v10, "passwordGenerationIsDisallowedByRequirements:", v13);
    if ((v14 & 1) == 0)
    {
      if (!self->_strongPasswordIntroductionViewController)
      {
        v15 = (PMSafariAutoFillStrongPasswordIntroductionViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C088]), "initWithMode:", 0);
        strongPasswordIntroductionViewController = self->_strongPasswordIntroductionViewController;
        self->_strongPasswordIntroductionViewController = v15;

        -[PMSafariAutoFillStrongPasswordIntroductionViewController setDelegate:](self->_strongPasswordIntroductionViewController, "setDelegate:", self);
      }
      v17 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v24[0] = 67109120;
        v24[1] = 0;
        _os_log_impl(&dword_1A3B2D000, v17, OS_LOG_TYPE_DEFAULT, "Presenting strong password introduction in custom input view; mode=%d",
          (uint8_t *)v24,
          8u);
      }
      autoFillInputView = self->_autoFillInputView;
      if (!autoFillInputView)
      {
        v19 = -[_SFAutoFillInputView initWithIntroductionViewController:]([_SFAutoFillInputView alloc], "initWithIntroductionViewController:", self->_strongPasswordIntroductionViewController);
        v20 = self->_autoFillInputView;
        self->_autoFillInputView = v19;

        autoFillInputView = self->_autoFillInputView;
      }
      objc_msgSend(v4, "formInputSession");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setCustomInputView:", autoFillInputView);

      objc_msgSend(v4, "formInputSession");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setAccessoryViewShouldNotShow:", 1);

      -[_SFFormAutoFillController _hideInputAssistantItemsIfNecessary](self, "_hideInputAssistantItemsIfNecessary");
    }

    v7 = v14 ^ 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)reloadFirstResponderInputViews
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "firstResponder");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "reloadInputViews");
}

- (void)hideInputAccessoryView
{
  void *v3;
  void *v4;

  -[SFFormAutocompleteState inputSession](self->_state, "inputSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formInputSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessoryViewShouldNotShow:", 1);

  -[_SFFormAutoFillController _hideInputAssistantItemsIfNecessary](self, "_hideInputAssistantItemsIfNecessary");
}

- (void)updateExistingStreamlinedSuggestionIfNecessary:(id)a3
{
  -[_SFAutoFillInputView updateSuggestionIfNecessary:](self->_autoFillInputView, "updateSuggestionIfNecessary:", a3);
}

- (void)_hideInputAssistantItemsIfNecessary
{
  id WeakRetained;
  void *v4;
  NSArray *v5;
  NSArray *preservedLeadingBarButtonGroups;
  NSArray *v7;
  NSArray *preservedTrailingBarButtonGroups;
  id v9;

  if (!self->_preservedLeadingBarButtonGroups && !self->_preservedTrailingBarButtonGroups)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    objc_msgSend(WeakRetained, "firstResponder");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "inputAssistantItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingBarButtonGroups");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    preservedLeadingBarButtonGroups = self->_preservedLeadingBarButtonGroups;
    self->_preservedLeadingBarButtonGroups = v5;

    objc_msgSend(v4, "trailingBarButtonGroups");
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    preservedTrailingBarButtonGroups = self->_preservedTrailingBarButtonGroups;
    self->_preservedTrailingBarButtonGroups = v7;

    objc_msgSend(v4, "setLeadingBarButtonGroups:", MEMORY[0x1E0C9AA60]);
    objc_msgSend(v4, "setTrailingBarButtonGroups:", MEMORY[0x1E0C9AA60]);

  }
}

- (void)_restoreInputAssistantItemsIfNecessary
{
  id WeakRetained;
  void *v4;
  NSArray *preservedLeadingBarButtonGroups;
  NSArray *preservedTrailingBarButtonGroups;
  id v7;

  if (self->_preservedLeadingBarButtonGroups || self->_preservedTrailingBarButtonGroups)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    objc_msgSend(WeakRetained, "firstResponder");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "inputAssistantItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLeadingBarButtonGroups:", self->_preservedLeadingBarButtonGroups);
    objc_msgSend(v4, "setTrailingBarButtonGroups:", self->_preservedTrailingBarButtonGroups);
    preservedLeadingBarButtonGroups = self->_preservedLeadingBarButtonGroups;
    self->_preservedLeadingBarButtonGroups = 0;

    preservedTrailingBarButtonGroups = self->_preservedTrailingBarButtonGroups;
    self->_preservedTrailingBarButtonGroups = 0;

    objc_msgSend(v7, "reloadInputViews");
  }
}

- (void)fieldDidFocusWithInputSession:(id)a3
{
  -[SFFormAutocompleteState updateSuggestions](self->_state, "updateSuggestions", a3);
}

- (void)fieldFocusedWithInputSession:(id)a3
{
  _SFFormAutoFillInputSession *v4;
  id v5;

  v5 = a3;
  v4 = -[_SFFormAutoFillInputSession initWithFormInputSession:]([_SFFormAutoFillInputSession alloc], "initWithFormInputSession:", v5);
  -[_SFFormAutoFillController _fieldFocusedWithInputSession:](self, "_fieldFocusedWithInputSession:", v4);

}

- (void)_fieldFocusedWithInputSession:(id)a3
{
  id v4;

  v4 = a3;
  -[_SFFormAutoFillController fieldWillFocusWithInputSession:](self, "fieldWillFocusWithInputSession:");
  -[_SFFormAutoFillController fieldDidFocusWithInputSession:](self, "fieldDidFocusWithInputSession:", v4);

}

- (void)willSubmitFormValues:(id)a3 userObject:(id)a4 submissionHandler:(id)a5
{
  void (**v7)(_QWORD);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v7 = (void (**)(_QWORD))a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v14;
    objc_msgSend(v8, "objectForKey:", CFSTR("frame"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFFormAutoFillFrameHandle frameHandleFromSerializedData:](SFFormAutoFillFrameHandle, "frameHandleFromSerializedData:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)MEMORY[0x1E0D8A958];
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("form"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "formMetadataFromSerializedData:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        -[_SFFormAutoFillController willSubmitForm:inFrame:submissionHandler:](self, "willSubmitForm:inFrame:submissionHandler:", v13, v10, v7);
      else
        v7[2](v7);

    }
    else
    {
      v7[2](v7);
    }

  }
  else
  {
    v7[2](v7);
  }

}

+ (void)_getExternalLoginCredentialSuggestionsForDomains:(id)a3 webFrameIdentifier:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getEnabledExtensionsSynchronously");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0D8A778]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __108___SFFormAutoFillController__getExternalLoginCredentialSuggestionsForDomains_webFrameIdentifier_completion___block_invoke;
      v16[3] = &unk_1E4AC1FC8;
      v17 = v7;
      v18 = v9;
      objc_msgSend(v13, "getPasskeyAssertionRequestParametersForApplicationIdentifier:completionHandler:", v15, v16);

    }
    else
    {
      (*((void (**)(id, _QWORD))v9 + 2))(v9, MEMORY[0x1E0C9AA60]);
    }
  }

}

+ (void)_getExternalLoginCredentialSuggestionsForDomains:(id)a3 pageURL:(id)a4 webFrameIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v13)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __116___SFFormAutoFillController__getExternalLoginCredentialSuggestionsForDomains_pageURL_webFrameIdentifier_completion___block_invoke;
    v15[3] = &unk_1E4AC1FF0;
    v17 = v13;
    v18 = a1;
    v16 = v11;
    objc_msgSend(a1, "_getExternalLoginCredentialSuggestionsForDomains:webFrameIdentifier:completion:", v10, v12, v15);

  }
}

+ (id)_filterAndSortCredentialIdentities:(id)a3 pageURL:(id)a4 exactMatchesOnly:(BOOL)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  _BOOL4 v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v26 = a5;
  v38 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  objc_msgSend(a4, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "safari_highLevelDomainFromHost");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 330, 0, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v9 = v27;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v13, "site");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v14, "isEqualToString:", v7) & 1) != 0 || objc_msgSend(v13, "type") == 2)
          {
            objc_msgSend(v32, "addObject:", v13);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://%@"), v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 330, 0, 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v17 = objc_msgSend(v16, "isEqualToString:", v30);
            v18 = v31;
            if ((v17 & 1) != 0
              || (objc_msgSend(v14, "safari_highLevelDomainFromHost"),
                  v19 = (void *)objc_claimAutoreleasedReturnValue(),
                  v20 = objc_msgSend(v28, "isEqualToString:", v19),
                  v19,
                  v18 = v29,
                  v20))
            {
              objc_msgSend(v18, "addObject:", v13);
            }

          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v10);
    }

    objc_msgSend(v32, "sortUsingComparator:", &__block_literal_global_14);
    objc_msgSend(v31, "sortUsingComparator:", &__block_literal_global_14);
    objc_msgSend(v29, "sortUsingComparator:", &__block_literal_global_14);
    if (objc_msgSend(v31, "count"))
    {
      if (objc_msgSend(v32, "count"))
      {
        objc_msgSend(v31, "arrayByAddingObjectsFromArray:", v29);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "mutableCopy");

        v29 = (void *)v22;
      }
      else
      {
        v21 = v32;
        v32 = v31;
      }

    }
    if (v26)
    {
      v24 = v32;
    }
    else
    {
      objc_msgSend(v32, "arrayByAddingObjectsFromArray:", v29);
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = v24;

  }
  else
  {
    v23 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v23;
}

- (BOOL)shouldShowPasswordManagementAppOnboardingViews
{
  if (self->_didCloseStrongPasswordIntroductionView)
    return 0;
  else
    return objc_msgSend(MEMORY[0x1E0D6C088], "shouldShowLoginIntroduction");
}

- (void)didCollectURLsForPreFilling:(id)a3 atURL:(id)a4 inFrame:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD *v41;
  id v42;
  id location;
  _QWORD v44[3];
  char v45;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "formAutoFillControllerURLForFormAutoFill:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqual:", v12) & 1) != 0)
  {
    -[_SFFormAutoFillController testController](self, "testController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "autoFillControllerShouldCollectFormMetadataForTesting:", self))
    {
      -[SFFormAutoFiller collectFormMetadataForTestingAtURL:](self->_autoFiller, "collectFormMetadataForTestingAtURL:", v12);
    }
    else
    {
      v44[0] = 0;
      v44[1] = v44;
      v44[2] = 0x2020000000;
      v45 = 0;
      objc_initWeak(&location, self);
      v22 = v13;
      objc_msgSend(v8, "safari_mapObjectsUsingBlock:", &__block_literal_global_210);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_opt_class();
      objc_msgSend(v10, "webFrameIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = MEMORY[0x1E0C809B0];
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_2;
      v38[3] = &unk_1E4AC20C0;
      objc_copyWeak(&v42, &location);
      v17 = v8;
      v39 = v17;
      v18 = v9;
      v40 = v18;
      v41 = v44;
      objc_msgSend(v14, "_getExternalLoginCredentialSuggestionsForDomains:webFrameIdentifier:completion:", v23, v15, v38);

      v36[0] = 0;
      v36[1] = v36;
      v36[2] = 0x3032000000;
      v36[3] = __Block_byref_object_copy__0;
      v36[4] = __Block_byref_object_dispose__0;
      objc_msgSend(v17, "objectEnumerator");
      v37 = (id)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      v31 = &v30;
      v32 = 0x3032000000;
      v33 = __Block_byref_object_copy__212;
      v34 = __Block_byref_object_dispose__213;
      v35 = 0;
      v24[0] = v16;
      v24[1] = 3221225472;
      v24[2] = __71___SFFormAutoFillController_didCollectURLsForPreFilling_atURL_inFrame___block_invoke_214;
      v24[3] = &unk_1E4AC2160;
      v28 = v44;
      v29 = &v30;
      v27 = v36;
      v24[4] = self;
      v25 = v18;
      v26 = v10;
      v19 = (void *)MEMORY[0x1A8598C40](v24);
      v20 = MEMORY[0x1A8598C40]();
      v21 = (void *)v31[5];
      v31[5] = v20;

      (*(void (**)(void))(v31[5] + 16))();
      _Block_object_dispose(&v30, 8);

      _Block_object_dispose(v36, 8);
      objc_destroyWeak(&v42);

      objc_destroyWeak(&location);
      _Block_object_dispose(v44, 8);
      v13 = v22;
    }

  }
}

- (_SFAuthenticationContext)authenticationContext
{
  void *v2;
  void *v3;

  +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autoFillAuthenticationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_SFAuthenticationContext *)v3;
}

- (void)_authenticateForAutoFillForHighLevelDomain:(id)a3 withCompletion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  -[_SFFormAutoFillController authenticationContext](self, "authenticationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87___SFFormAutoFillController__authenticateForAutoFillForHighLevelDomain_withCompletion___block_invoke;
  v8[3] = &unk_1E4AC2188;
  objc_copyWeak(&v10, &location);
  v7 = v5;
  v9 = v7;
  objc_msgSend(v6, "authenticateForClient:userInitiated:completion:", self, 1, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)authenticateIfNeededForAutoFillAuthenticationType:(int64_t)a3 user:(id)a4 shouldForceAuthentication:(BOOL)a5 withCompletion:(id)a6
{
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  char v12;
  char v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a6;
  self->_authenticationType = a3;
  if (a5
    || ((+[_SFManagedFeatureObserver sharedObserver](_SFManagedFeatureObserver, "sharedObserver"),
         v11 = (void *)objc_claimAutoreleasedReturnValue(),
         v12 = objc_msgSend(v11, "authenticationRequiredToAutoFill"),
         a3 == 4)
      ? (v13 = 1)
      : (v13 = v12),
        v11,
        (v13 & 1) != 0))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "formAutoFillControllerURLForFormAutoFill:", self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "host");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "safari_highLevelDomainFromHost");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "formAutoFillControllerGetAuthenticationForAutoFill:completion:", self, v10);
    else
      -[_SFFormAutoFillController _authenticateForAutoFillForHighLevelDomain:withCompletion:](self, "_authenticateForAutoFillForHighLevelDomain:withCompletion:", v17, v10);

  }
  else
  {
    v10[2](v10, 1, 0);
  }

}

- (SFAppAutoFillOneTimeCodeProvider)oneTimeCodeProvider
{
  void *v2;
  void *v3;

  +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oneTimeCodeProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SFAppAutoFillOneTimeCodeProvider *)v3;
}

- (WBSSavedAccountContext)savedAccountContext
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "currentSavedAccountContextForFormAutoFillController:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D8ABF0], "defaultContext");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D8ABF0], "defaultContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (WBSSavedAccountContext *)v7;
}

- (id)_websiteForAuthenticationPrompt
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "formAutoFillControllerURLForFormAutoFill:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safari_highLevelDomainFromHost");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = v5;
  v8 = v6;

  return v8;
}

- (id)_preFillDisabledHosts
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)-[_SFFormAutoFillController _preFillDisabledHosts]::disabledHosts;
  if (!-[_SFFormAutoFillController _preFillDisabledHosts]::disabledHosts)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("idmsa.apple.com"), CFSTR("idmsac.apple.com"), CFSTR("idmsac.corp.apple.com"), CFSTR("idmsauth.corp.apple.com"), 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)-[_SFFormAutoFillController _preFillDisabledHosts]::disabledHosts;
    -[_SFFormAutoFillController _preFillDisabledHosts]::disabledHosts = v3;

    v2 = (void *)-[_SFFormAutoFillController _preFillDisabledHosts]::disabledHosts;
  }
  return v2;
}

- (id)authenticationMessageForContext:(id)a3
{
  id v4;
  int64_t authenticationType;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  authenticationType = self->_authenticationType;
  if (authenticationType == 5)
  {
    +[SFAutoFillAuthenticationUtilities customAuthenticationTitleForFillingTimeBasedOneTimeCode](SFAutoFillAuthenticationUtilities, "customAuthenticationTitleForFillingTimeBasedOneTimeCode");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v7 = (void *)v8;
    goto LABEL_11;
  }
  if (authenticationType == 1)
  {
    +[SFAutoFillAuthenticationUtilities customAuthenticationTitleForFillingSavedPasskey](SFAutoFillAuthenticationUtilities, "customAuthenticationTitleForFillingSavedPasskey");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (authenticationType)
  {
    +[SFAutoFillAuthenticationUtilities customAuthenticationTitleForFillingCreditCard](SFAutoFillAuthenticationUtilities, "customAuthenticationTitleForFillingCreditCard");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!-[_SFFormAutoFillController _showingAutoFillInputView](self, "_showingAutoFillInputView"))
  {
    +[SFAutoFillAuthenticationUtilities customAuthenticationTitleForFillingSavedPassword](SFAutoFillAuthenticationUtilities, "customAuthenticationTitleForFillingSavedPassword");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[_SFFormAutoFillController _websiteForAuthenticationPrompt](self, "_websiteForAuthenticationPrompt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFAutoFillAuthenticationUtilities customAuthenticationTitleForLoggingInWithSavedAccountOnWebsite:](SFAutoFillAuthenticationUtilities, "customAuthenticationTitleForLoggingInWithSavedAccountOnWebsite:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v7;
}

- (id)passcodePromptForContext:(id)a3
{
  id v4;
  int64_t authenticationType;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  authenticationType = self->_authenticationType;
  if (authenticationType == 5)
  {
    +[SFAutoFillAuthenticationUtilities passcodePromptForFillingTimeBasedOneTimeCode](SFAutoFillAuthenticationUtilities, "passcodePromptForFillingTimeBasedOneTimeCode");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v7 = (void *)v8;
    goto LABEL_11;
  }
  if (authenticationType == 1)
  {
    +[SFAutoFillAuthenticationUtilities customAuthenticationTitleForFillingSavedPasskey](SFAutoFillAuthenticationUtilities, "customAuthenticationTitleForFillingSavedPasskey");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (authenticationType)
  {
    +[SFAutoFillAuthenticationUtilities passcodePromptForFillingCreditCard](SFAutoFillAuthenticationUtilities, "passcodePromptForFillingCreditCard");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!-[_SFFormAutoFillController _showingAutoFillInputView](self, "_showingAutoFillInputView"))
  {
    +[SFAutoFillAuthenticationUtilities passcodePromptForFillingSavedAccount](SFAutoFillAuthenticationUtilities, "passcodePromptForFillingSavedAccount");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[_SFFormAutoFillController _websiteForAuthenticationPrompt](self, "_websiteForAuthenticationPrompt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFAutoFillAuthenticationUtilities passcodePromptForLoggingInWithSavedAccountOnWebsite:](SFAutoFillAuthenticationUtilities, "passcodePromptForLoggingInWithSavedAccountOnWebsite:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v7;
}

- (BOOL)_showingAutoFillInputView
{
  void *v3;
  void *v4;
  _SFAutoFillInputView *v5;
  _SFAutoFillInputView *autoFillInputView;
  void *v7;
  void *v8;
  _SFAutoFillInputView *v9;
  BOOL v10;

  if (!self->_autoFillInputView)
    return 0;
  if (!self->_strongPasswordIntroductionViewController)
    goto LABEL_5;
  -[SFFormAutocompleteState inputSession](self->_state, "inputSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formInputSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customInputView");
  v5 = (_SFAutoFillInputView *)objc_claimAutoreleasedReturnValue();
  autoFillInputView = self->_autoFillInputView;

  if (v5 == autoFillInputView)
    return 1;
  if (!self->_autoFillInputView)
    return 0;
LABEL_5:
  -[SFFormAutocompleteState inputSession](self->_state, "inputSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "formInputSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "customInputView");
  v9 = (_SFAutoFillInputView *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == self->_autoFillInputView;

  return v10;
}

- (BOOL)displayMessageAsTitleForContext:(id)a3
{
  return 1;
}

- (id)authenticationCustomUIProgressObserverForContext:(id)a3
{
  return 0;
}

- (void)didCollectFormMetadataForPreFilling:(id)a3 atURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SFFormsMetadataProvider *WeakRetained;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  SFFormsMetadataProvider *v15;
  void *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[_SFFormAutoFillController testController](self, "testController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "autoFillControllerShouldCollectFormMetadataForTesting:", self))
  {
    WeakRetained = -[SFFormsMetadataProvider initWithFrameHandleToFormsDictionary:]([SFFormsMetadataProvider alloc], "initWithFrameHandleToFormsDictionary:", v6);
    objc_msgSend(v8, "autoFillController:didCollectFormMetadataForTesting:forURL:", self, WeakRetained, v7);
  }
  else
  {
    WeakRetained = (SFFormsMetadataProvider *)objc_loadWeakRetained((id *)&self->_delegate);
    -[SFFormsMetadataProvider formAutoFillControllerURLForFormAutoFill:](WeakRetained, "formAutoFillControllerURLForFormAutoFill:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "isEqual:", v10);

    if ((v11 & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "autoFillQuirksManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isStreamlinedLoginDisallowedOnURL:", v7);

      if ((v14 & 1) == 0
        && objc_msgSend(v12, "shouldAllowPasswordAutoFillOnURL:allowExternalCredentials:", v7, 1)
        && (-[SFFormsMetadataProvider formAutoFillControllerShouldDisableStreamlinedLogin:](WeakRetained, "formAutoFillControllerShouldDisableStreamlinedLogin:", self) & 1) == 0)
      {
        v15 = -[SFFormsMetadataProvider initWithFrameHandleToFormsDictionary:]([SFFormsMetadataProvider alloc], "initWithFrameHandleToFormsDictionary:", v6);
        v18 = 0;
        objc_msgSend(v12, "metadataOfBestFormForStreamlinedLogin:frame:", v15, &v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = v18;
          if ((objc_msgSend(v12, "mayPreFillInFrame:", v17) & 1) != 0)
            -[SFFormAutoFiller focusFormForStreamlinedLogin:inFrame:](self->_autoFiller, "focusFormForStreamlinedLogin:inFrame:", objc_msgSend(v16, "uniqueID"), v17);

        }
      }

    }
  }

}

- (void)didCollectFormMetadataForPageLevelAutoFill:(id)a3 atURL:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  char v10;
  SFFormsMetadataProvider *v11;
  void *v12;
  void *v13;
  SFFormAutocompleteState *stateForPageLevelAutoFill;
  id v15;
  SFFormAutocompleteState *v16;
  SFFormAutocompleteState *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "formAutoFillControllerURLForFormAutoFill:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = -[SFFormsMetadataProvider initWithFrameHandleToFormsDictionary:]([SFFormsMetadataProvider alloc], "initWithFrameHandleToFormsDictionary:", v6);
    v18 = 0;
    +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "metadataOfActiveFormOrBestFormForPageLevelAutoFill:frame:", v11, &v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      stateForPageLevelAutoFill = self->_stateForPageLevelAutoFill;
      if (stateForPageLevelAutoFill)
      {
        -[SFFormAutocompleteState updateCachedFormMetadataAfterFilling:](stateForPageLevelAutoFill, "updateCachedFormMetadataAfterFilling:", v13);
      }
      else
      {
        v15 = v18;
        v16 = -[SFFormAutocompleteState initWithFrame:form:textField:inputSession:autoFillController:]([SFFormAutocompleteState alloc], "initWithFrame:form:textField:inputSession:autoFillController:", v15, v13, 0, 0, self);
        v17 = self->_stateForPageLevelAutoFill;
        self->_stateForPageLevelAutoFill = v16;

      }
      -[SFFormAutocompleteState performPageLevelAutoFill](self->_stateForPageLevelAutoFill, "performPageLevelAutoFill");
    }

  }
}

- (void)textDidChangeInTextField:(id)a3 inForm:(id)a4 inFrame:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "length");

  v14 = MEMORY[0x1E0C809B0];
  v12 = v9;
  v13 = v8;
  WBSDispatchAsyncAndReleaseOnMainQueue();
  if (-[NSMutableIndexSet containsIndex:](self->_uniqueIDsOfFormsThatWereAutoFilled, "containsIndex:", objc_msgSend(v12, "uniqueID", v14, 3221225472, __69___SFFormAutoFillController_textDidChangeInTextField_inForm_inFrame___block_invoke, &unk_1E4AC21B0, self)))-[_SFFormAutoFillController _presentAutoFillInternalFeedbackActivityNotificationIfNeeded](self, "_presentAutoFillInternalFeedbackActivityNotificationIfNeeded");
  -[_SFFormAutoFillController didUpdateUnsubmittedForm:inFrame:](self, "didUpdateUnsubmittedForm:inFrame:", v12, v10);
  -[SFFormAutocompleteState textDidChangeInFrame:form:textField:](self->_state, "textDidChangeInFrame:form:textField:", v10, v12, v13);

}

- (void)didFillGeneratedPasswordInForm:(id)a3 inFrame:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  WBSDispatchAsyncAndReleaseOnMainQueue();
  -[_SFFormAutoFillController didUpdateUnsubmittedForm:inFrame:](self, "didUpdateUnsubmittedForm:inFrame:", v12, v7, v11, 3221225472, __68___SFFormAutoFillController_didFillGeneratedPasswordInForm_inFrame___block_invoke, &unk_1E4AC0590, self);
  +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  -[_SFFormAutoFillController savedAccountContext](self, "savedAccountContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didFillFormWithGeneratedPassword:inWebView:frame:context:", v12, WeakRetained, v7, v10);

}

- (void)willNavigateFrame:(id)a3 withUnsubmittedForm:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableSet *valuesAutoFilledForCurrentPage;
  WBSFormMetadata *unsubmittedForm;
  SFFormAutoFillFrameHandle *unsubmittedFormFrame;
  WBSCreditCardData *lastFilledCreditCardData;
  CNContact *lastFilledContact;
  SFFormAutoFillFrameHandle *frameHandleForAutomaticPasswords;
  WBSFormMetadata *formMetadataForAutomaticPasswords;
  WBSFormControlMetadata *passwordFieldMetadataForAutomaticPasswords;
  NSArray *uniqueIDsOfPasswordElementsForAutomaticPasswords;
  NSString *uniqueIDOfFocusedPasswordElementWithAutomaticPassword;
  id v25;

  v25 = a3;
  v6 = a4;
  self->_attemptedOfferingStreamlinedLogin = 0;
  v7 = objc_msgSend(v6, "uniqueID");
  if (self->_metadataCorrectionsEnabled)
    v8 = -[NSMutableIndexSet containsIndex:](self->_uniqueIDsOfFormsThatWereAutoFilled, "containsIndex:", v7);
  else
    v8 = 0;
  +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLastFilledCreditCardData:", self->_lastFilledCreditCardData);
  objc_msgSend(v9, "setPreviouslyFilledVirtualCardNumbers:", self->_previouslyFilledVirtualCardNumbers);
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  -[_SFFormAutoFillController savedAccountContext](self, "savedAccountContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "webView:frame:willNavigateFromForm:inContext:bySubmitting:processMetadataCorrections:uniqueIDsOfControlsThatWereAutoFilled:submissionHandler:", WeakRetained, v25, v6, v11, 0, v8, self->_uniqueIDsOfControlsThatWereAutoFilled, &__block_literal_global_240);

  *(_WORD *)&self->_didFillStrongPasswordFromStreamlinedAutoFillView = 0;
  self->_shouldSuggestToCustomizeStrongPassword = 0;
  if (objc_msgSend(MEMORY[0x1E0D8A8F8], "isPasswordManagerAppEnabledAndInstalled"))
  {
    +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "generatedPassword");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setGeneratedPassword:", 0);

    }
  }
  -[_SFFormAutoFillController _removeUniqueIDsOfAutoFilledForm:](self, "_removeUniqueIDsOfAutoFilledForm:", v6);
  -[_SFFormAutoFillController sendEventsForAutoFillTelemetry](self, "sendEventsForAutoFillTelemetry");
  valuesAutoFilledForCurrentPage = self->_valuesAutoFilledForCurrentPage;
  self->_valuesAutoFilledForCurrentPage = 0;

  self->_hasPresentedAutoFillInternalFeedbackNoticeForCurrentPage = 0;
  -[_SFFormAutoFillController _dismissAutoFillInternalFeedbackNoticeImmediately:](self, "_dismissAutoFillInternalFeedbackNoticeImmediately:", 1);
  unsubmittedForm = self->_unsubmittedForm;
  self->_unsubmittedForm = 0;

  unsubmittedFormFrame = self->_unsubmittedFormFrame;
  self->_unsubmittedFormFrame = 0;

  self->_waitingForCreditCardDataFromWallet = 0;
  lastFilledCreditCardData = self->_lastFilledCreditCardData;
  self->_lastFilledCreditCardData = 0;

  objc_msgSend(v9, "setLastFilledCreditCardData:", 0);
  lastFilledContact = self->_lastFilledContact;
  self->_lastFilledContact = 0;

  frameHandleForAutomaticPasswords = self->_frameHandleForAutomaticPasswords;
  self->_frameHandleForAutomaticPasswords = 0;

  formMetadataForAutomaticPasswords = self->_formMetadataForAutomaticPasswords;
  self->_formMetadataForAutomaticPasswords = 0;

  passwordFieldMetadataForAutomaticPasswords = self->_passwordFieldMetadataForAutomaticPasswords;
  self->_passwordFieldMetadataForAutomaticPasswords = 0;

  uniqueIDsOfPasswordElementsForAutomaticPasswords = self->_uniqueIDsOfPasswordElementsForAutomaticPasswords;
  self->_uniqueIDsOfPasswordElementsForAutomaticPasswords = 0;

  uniqueIDOfFocusedPasswordElementWithAutomaticPassword = self->_uniqueIDOfFocusedPasswordElementWithAutomaticPassword;
  self->_uniqueIDOfFocusedPasswordElementWithAutomaticPassword = 0;

  self->_didCloseStrongPasswordIntroductionView = 0;
  self->_didFillStrongPasswordFromStreamlinedAutoFillView = 0;

}

- (void)didUpdateUnsubmittedForm:(id)a3 inFrame:(id)a4
{
  WBSFormMetadata *v6;
  SFFormAutoFillFrameHandle *v7;
  WBSFormMetadata *unsubmittedForm;
  SFFormAutoFillFrameHandle *unsubmittedFormFrame;
  WBSFormMetadata *v10;

  v6 = (WBSFormMetadata *)a3;
  v7 = (SFFormAutoFillFrameHandle *)a4;
  unsubmittedForm = self->_unsubmittedForm;
  self->_unsubmittedForm = v6;
  v10 = v6;

  unsubmittedFormFrame = self->_unsubmittedFormFrame;
  self->_unsubmittedFormFrame = v7;

}

- (void)sendEventsForAutoFillTelemetry
{
  WBSDispatchAsyncAndReleaseOnMainQueue();
}

- (void)_updateFormTelemetryDataMonitorWithFormMetadata:(id)a3 textFieldMetadata:(id)a4 textFieldValueLength:(unint64_t)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a4;
  -[_SFFormAutoFillController _createFormTelemetryDataMonitorIfNeeded](self, "_createFormTelemetryDataMonitorIfNeeded");
  -[WBSFormTelemetryDataMonitor updateFormTelemetryWithFormMetadata:textFieldMetadata:textFieldValueLength:](self->_formTelemetryDataMonitor, "updateFormTelemetryWithFormMetadata:textFieldMetadata:textFieldValueLength:", v9, v8, a5);

}

- (void)reportAutoFillOfferedType:(unint64_t)a3 forTextFieldWithID:(id)a4 forFormMetadata:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a4;
  v9 = a5;
  v7 = v9;
  v8 = v6;
  WBSDispatchAsyncAndReleaseOnMainQueue();

}

- (void)_createFormTelemetryDataMonitorIfNeeded
{
  WBSFormTelemetryDataMonitor *v3;
  WBSFormTelemetryDataMonitor *formTelemetryDataMonitor;

  if (!self->_formTelemetryDataMonitor)
  {
    v3 = (WBSFormTelemetryDataMonitor *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A960]), "initWithWebpageLocale:", self->_cachedWebpageLocale);
    formTelemetryDataMonitor = self->_formTelemetryDataMonitor;
    self->_formTelemetryDataMonitor = v3;

  }
}

- (void)setUpFormTelemetryDataMonitorWithWebpageLocale:(id)a3
{
  objc_storeStrong((id *)&self->_cachedWebpageLocale, a3);
}

- (void)_addUniqueIDsOfAutoFilledForm:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableIndexSet *uniqueIDsOfFormsThatWereAutoFilled;
  NSMutableIndexSet *v7;
  NSMutableIndexSet *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSMutableSet *uniqueIDsOfControlsThatWereAutoFilled;
  NSMutableSet *v16;
  NSMutableSet *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "uniqueID");
  uniqueIDsOfFormsThatWereAutoFilled = self->_uniqueIDsOfFormsThatWereAutoFilled;
  if (uniqueIDsOfFormsThatWereAutoFilled)
  {
    -[NSMutableIndexSet addIndex:](uniqueIDsOfFormsThatWereAutoFilled, "addIndex:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", v5);
    v7 = (NSMutableIndexSet *)objc_claimAutoreleasedReturnValue();
    v8 = self->_uniqueIDsOfFormsThatWereAutoFilled;
    self->_uniqueIDsOfFormsThatWereAutoFilled = v7;

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "controls", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isAutoFilledTextField") & 1) != 0)
        {
          objc_msgSend(v13, "uniqueID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "length"))
          {
            uniqueIDsOfControlsThatWereAutoFilled = self->_uniqueIDsOfControlsThatWereAutoFilled;
            if (uniqueIDsOfControlsThatWereAutoFilled)
            {
              -[NSMutableSet addObject:](uniqueIDsOfControlsThatWereAutoFilled, "addObject:", v14);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v14);
              v16 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
              v17 = self->_uniqueIDsOfControlsThatWereAutoFilled;
              self->_uniqueIDsOfControlsThatWereAutoFilled = v16;

            }
          }

        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

}

- (void)_removeUniqueIDsOfAutoFilledForm:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableIndexSet removeIndex:](self->_uniqueIDsOfFormsThatWereAutoFilled, "removeIndex:", objc_msgSend(v4, "uniqueID"));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(v4, "controls", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "uniqueID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          -[NSMutableSet removeObject:](self->_uniqueIDsOfControlsThatWereAutoFilled, "removeObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)autoFilledField:(id)a3 inForm:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "length");

  v8 = v6;
  v9 = v5;
  WBSDispatchAsyncAndReleaseOnMainQueue();

}

- (void)autoFillDidFinishWithUpdatedFormMetadata:(id)a3 inFrame:(id)a4 shouldSubmit:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  SFFormAutocompleteState *stateForPageLevelAutoFill;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  SFFormAutocompleteState *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  _QWORD v19[5];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[_SFFormAutoFillController _addUniqueIDsOfAutoFilledForm:](self, "_addUniqueIDsOfAutoFilledForm:", v8);
  stateForPageLevelAutoFill = self->_stateForPageLevelAutoFill;
  if (stateForPageLevelAutoFill)
  {
    if (!v5
      && (v11 = -[SFFormAutocompleteState action](stateForPageLevelAutoFill, "action"),
          stateForPageLevelAutoFill = self->_stateForPageLevelAutoFill,
          v11)
      && (-[SFFormAutocompleteState multiRoundAutoFillManager](stateForPageLevelAutoFill, "multiRoundAutoFillManager"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "shouldAttemptFollowUpAutoFillInFormWithMetadata:requestType:", v8, 0),
          v12,
          stateForPageLevelAutoFill = self->_stateForPageLevelAutoFill,
          v13))
    {
      -[SFFormAutocompleteState multiRoundAutoFillManager](stateForPageLevelAutoFill, "multiRoundAutoFillManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __91___SFFormAutoFillController_autoFillDidFinishWithUpdatedFormMetadata_inFrame_shouldSubmit___block_invoke;
      v19[3] = &unk_1E4AC1080;
      v19[4] = self;
      objc_msgSend(v14, "dispatchFollowUpAutoFillOfFormWithMetdata:autoFillBlock:", v8, v19);

    }
    else
    {
      -[SFFormAutocompleteState invalidate](stateForPageLevelAutoFill, "invalidate");
      v15 = self->_stateForPageLevelAutoFill;
      self->_stateForPageLevelAutoFill = 0;

    }
  }
  if (objc_msgSend(v8, "type") == 4)
  {
    +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    -[_SFFormAutoFillController savedAccountContext](self, "savedAccountContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "textDidChangeInForm:inWebView:frame:context:", v8, WeakRetained, v9, v18);

  }
  else if (objc_msgSend(v8, "type") == 3
         || objc_msgSend(v8, "type") == 5
         || -[SFFormAutocompleteState shouldOfferToAutoFillCreditCardData](self->_state, "shouldOfferToAutoFillCreditCardData"))
  {
    -[SFFormAutocompleteState updateCachedFormMetadataAfterFilling:](self->_state, "updateCachedFormMetadataAfterFilling:", v8);
    -[SFFormAutocompleteState updateSuggestions](self->_state, "updateSuggestions");
    if (-[SFFormAutocompleteState action](self->_state, "action") != 3
      && -[SFFormAutocompleteState action](self->_state, "action") != 6
      && -[SFFormAutocompleteState action](self->_state, "action") != 4
      && -[SFFormAutocompleteState action](self->_state, "action") != 5)
    {
      -[_SFFormAutoFillController _dismissKeyboardAndSimulateCarriageReturnKeyEvents:](self, "_dismissKeyboardAndSimulateCarriageReturnKeyEvents:", v5);
    }
  }

}

- (void)didCompleteWithPasskey
{
  -[_SFFormAutoFillController _dismissKeyboardAndSimulateCarriageReturnKeyEvents:](self, "_dismissKeyboardAndSimulateCarriageReturnKeyEvents:", 0);
}

- (id)_simulatedWebEventForReturnKeyWithType:(int)a3
{
  uint64_t v4;

  BYTE2(v4) = 0;
  LOWORD(v4) = 0;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF658]), "initWithKeyEventType:timeStamp:characters:charactersIgnoringModifiers:modifiers:isRepeating:withFlags:withInputManagerHint:keyCode:isTabKey:", *(_QWORD *)&a3, CFSTR("\n"), CFSTR("\n"), 0, 0, 0, (double)(unint64_t)GSCurrentEventTimestamp(), 0, v4);
}

- (id)_simulatedBEKeyEntryForReturnKeyWithType:(int)a3
{
  uint64_t v3;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  Class (*v16)(uint64_t);
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v3 = *(_QWORD *)&a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v5 = (void *)getUIKeyEventClass(void)::softClass;
  v22 = getUIKeyEventClass(void)::softClass;
  if (!getUIKeyEventClass(void)::softClass)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = ___ZL18getUIKeyEventClassv_block_invoke;
    v17 = &unk_1E4ABFDC0;
    v18 = &v19;
    ___ZL18getUIKeyEventClassv_block_invoke((uint64_t)&v14);
    v5 = (void *)v20[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v19, 8);
  v7 = [v6 alloc];
  -[_SFFormAutoFillController _simulatedWebEventForReturnKeyWithType:](self, "_simulatedWebEventForReturnKeyWithType:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithWebEvent:", v8);

  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v10 = (void *)getBEKeyEntryClass(void)::softClass;
  v22 = getBEKeyEntryClass(void)::softClass;
  if (!getBEKeyEntryClass(void)::softClass)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = ___ZL18getBEKeyEntryClassv_block_invoke;
    v17 = &unk_1E4ABFDC0;
    v18 = &v19;
    ___ZL18getBEKeyEntryClassv_block_invoke((uint64_t)&v14);
    v10 = (void *)v20[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v19, 8);
  v12 = (void *)objc_msgSend([v11 alloc], "_initWithUIKitKeyEvent:", v9);

  return v12;
}

- (void)_dismissKeyboardAndSimulateCarriageReturnKeyEvents:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  _SFFormAutoFillController *v21;
  _QWORD v22[4];
  id v23;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "becomeFirstResponder");
  objc_msgSend(WeakRetained, "firstResponder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE7D6CA0)
    && objc_msgSend(v6, "conformsToProtocol:", &unk_1EE7D76A8))
  {
    if (!v3)
    {
      objc_msgSend(v6, "clearSelection");
      goto LABEL_13;
    }
    -[_SFFormAutoFillController _simulatedWebEventForReturnKeyWithType:](self, "_simulatedWebEventForReturnKeyWithType:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleKeyWebEvent:", v7);

    -[_SFFormAutoFillController _simulatedWebEventForReturnKeyWithType:](self, "_simulatedWebEventForReturnKeyWithType:", 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __80___SFFormAutoFillController__dismissKeyboardAndSimulateCarriageReturnKeyEvents___block_invoke;
    v22[3] = &unk_1E4AC21F8;
    v23 = v6;
    objc_msgSend(v23, "handleKeyWebEvent:withCompletionHandler:", v8, v22);

    v9 = v23;
LABEL_8:

    goto LABEL_13;
  }
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE7D8130))
  {
    if (!v3)
    {
      objc_msgSend(v6, "setSelectedTextRange:", 0);
      goto LABEL_13;
    }
    -[_SFFormAutoFillController _simulatedBEKeyEntryForReturnKeyWithType:](self, "_simulatedBEKeyEntryForReturnKeyWithType:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __80___SFFormAutoFillController__dismissKeyboardAndSimulateCarriageReturnKeyEvents___block_invoke_2;
    v19[3] = &unk_1E4AC2248;
    v20 = v6;
    v21 = self;
    objc_msgSend(v20, "handleKeyEntry:withCompletionHandler:", v10, v19);

    v9 = v20;
    goto LABEL_8;
  }
  v11 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[_SFFormAutoFillController _dismissKeyboardAndSimulateCarriageReturnKeyEvents:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
LABEL_13:

}

- (void)didRemoveAutomaticStrongPasswordInForm:(id)a3 inputSessionUserObject:(id)a4 inFrame:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _SFFormAutoFillInputSession *v12;
  _SFFormAutoFillInputSession *inputSessionForAutomaticPasswords;
  void *v14;
  id WeakRetained;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18 = MEMORY[0x1E0C809B0];
  v11 = v8;
  WBSDispatchAsyncAndReleaseOnMainQueue();
  -[_SFFormAutoFillController didUpdateUnsubmittedForm:inFrame:](self, "didUpdateUnsubmittedForm:inFrame:", v11, v10, v18, 3221225472, __99___SFFormAutoFillController_didRemoveAutomaticStrongPasswordInForm_inputSessionUserObject_inFrame___block_invoke, &unk_1E4AC0590, self);
  v12 = self->_inputSessionForAutomaticPasswords;
  inputSessionForAutomaticPasswords = self->_inputSessionForAutomaticPasswords;
  self->_inputSessionForAutomaticPasswords = 0;

  +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  -[_SFFormAutoFillController savedAccountContext](self, "savedAccountContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textDidChangeInForm:inWebView:frame:context:", v11, WeakRetained, v10, v16);

  if (v9 && v12)
  {
    -[_SFFormAutoFillInputSession autoFillInputSessionByReplacingInputSessionUserObject:](v12, "autoFillInputSessionByReplacingInputSessionUserObject:", v9);
    v17 = objc_claimAutoreleasedReturnValue();

    v12 = (_SFFormAutoFillInputSession *)v17;
    -[_SFFormAutoFillController _fieldFocusedWithInputSession:](self, "_fieldFocusedWithInputSession:", v17);
  }

}

- (void)removeAutomaticPasswordVisualTreatment
{
  -[_SFFormAutoFillController _removeAutomaticPasswordButtonInitiatedByUser:removeVisualTreatmentOnly:](self, "_removeAutomaticPasswordButtonInitiatedByUser:removeVisualTreatmentOnly:", 0, 1);
}

- (void)removeAutomaticPasswordButtonInitiatedByUser:(BOOL)a3
{
  -[_SFFormAutoFillController _removeAutomaticPasswordButtonInitiatedByUser:removeVisualTreatmentOnly:](self, "_removeAutomaticPasswordButtonInitiatedByUser:removeVisualTreatmentOnly:", a3, 0);
}

- (void)_removeAutomaticPasswordButtonInitiatedByUser:(BOOL)a3 removeVisualTreatmentOnly:(BOOL)a4
{
  SFFormAutoFiller *autoFiller;
  SFFormAutoFillFrameHandle *frameHandleForAutomaticPasswords;
  NSArray *uniqueIDsOfPasswordElementsForAutomaticPasswords;
  NSString *uniqueIDOfFocusedPasswordElementWithAutomaticPassword;
  _SFFormAutoFillInputSession *inputSessionForAutomaticPasswords;
  id v11;

  if (self->_frameHandleForAutomaticPasswords)
  {
    autoFiller = self->_autoFiller;
    if (a4)
      -[SFFormAutoFiller removeAutomaticPasswordVisualTreatmentInFrame:passwordControlUniqueIDs:](autoFiller, "removeAutomaticPasswordVisualTreatmentInFrame:passwordControlUniqueIDs:");
    else
      -[SFFormAutoFiller removeAutomaticPasswordElementsInFrame:focusedPasswordControlUniqueID:passwordControlUniqueIDs:](autoFiller, "removeAutomaticPasswordElementsInFrame:focusedPasswordControlUniqueID:passwordControlUniqueIDs:");
    frameHandleForAutomaticPasswords = self->_frameHandleForAutomaticPasswords;
    self->_frameHandleForAutomaticPasswords = 0;

    uniqueIDsOfPasswordElementsForAutomaticPasswords = self->_uniqueIDsOfPasswordElementsForAutomaticPasswords;
    self->_uniqueIDsOfPasswordElementsForAutomaticPasswords = 0;

    uniqueIDOfFocusedPasswordElementWithAutomaticPassword = self->_uniqueIDOfFocusedPasswordElementWithAutomaticPassword;
    self->_uniqueIDOfFocusedPasswordElementWithAutomaticPassword = 0;

    if (!a3)
    {
      inputSessionForAutomaticPasswords = self->_inputSessionForAutomaticPasswords;
      self->_inputSessionForAutomaticPasswords = 0;

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("_SFAutomaticPasswordDismissedByUser"), self);

  }
}

- (void)automaticPasswordSheetDismissed
{
  SFFormAutoFillFrameHandle *frameHandleForAutomaticPasswords;

  if (-[NSString length](self->_uniqueIDOfFocusedPasswordElementWithAutomaticPassword, "length"))
  {
    frameHandleForAutomaticPasswords = self->_frameHandleForAutomaticPasswords;
    if (frameHandleForAutomaticPasswords)
      -[SFFormAutoFiller automaticPasswordSheetDimissedInFrame:focusedPasswordControlUniqueID:](self->_autoFiller, "automaticPasswordSheetDimissedInFrame:focusedPasswordControlUniqueID:", frameHandleForAutomaticPasswords, self->_uniqueIDOfFocusedPasswordElementWithAutomaticPassword);
  }
}

- (void)prepareForShowingAutomaticStrongPasswordWithInputSession:(id)a3
{
  objc_storeStrong((id *)&self->_inputSessionForAutomaticPasswords, a3);
}

- (id)automaticPasswordForPasswordField:(id)a3 inForm:(id)a4 isFrame:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(a3, "maxLength");
  objc_msgSend(v7, "passwordRequirements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "webui_URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "autoGeneratedPasswordForURL:respectingPasswordRequirements:maxLength:", v12, v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)alphanumericStrongPassword
{
  NSString *alphanumericStrongPassword;
  NSString *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  alphanumericStrongPassword = self->_alphanumericStrongPassword;
  if (alphanumericStrongPassword)
  {
    v4 = (NSString *)-[NSString copy](alphanumericStrongPassword, "copy");
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8AA98]), "initWithPasswordRequirementsByDomain:", 0);
    objc_msgSend(v5, "generated15CharacterAlphanumericPassword");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_alphanumericStrongPassword;
    self->_alphanumericStrongPassword = v6;

    v4 = self->_alphanumericStrongPassword;
  }
  return v4;
}

- (void)replaceCurrentPasswordWithPassword:(id)a3
{
  id v4;
  void *v5;
  SFFormAutoFiller *autoFiller;
  void *v7;
  SFFormAutoFiller *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *uniqueIDOfFocusedPasswordElementWithAutomaticPassword;
  NSArray *uniqueIDsOfPasswordElementsForAutomaticPasswords;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  dispatch_time_t v20;
  uint64_t v21;
  void *v22;
  NSString *v23;
  NSString *currentStrongPassword;
  _QWORD v25[4];
  NSObject *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[5];

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFFormAutoFillController _addValuesAutoFilledForCurrentPage:](self, "_addValuesAutoFilledForCurrentPage:", v5);

  }
  if ((-[NSString isEqual:](self->_currentStrongPassword, "isEqual:", v4) & 1) == 0)
  {
    autoFiller = self->_autoFiller;
    -[_SFFormAutoFillInputSession frameHandle](self->_inputSessionForAutomaticPasswords, "frameHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFFormAutoFiller removeAutomaticPasswordVisualTreatmentInFrame:passwordControlUniqueIDs:](autoFiller, "removeAutomaticPasswordVisualTreatmentInFrame:passwordControlUniqueIDs:", v7, self->_uniqueIDsOfPasswordElementsForAutomaticPasswords);

    v8 = self->_autoFiller;
    -[_SFFormAutoFillInputSession frameHandle](self->_inputSessionForAutomaticPasswords, "frameHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFFormAutoFillInputSession formMetadata](self->_inputSessionForAutomaticPasswords, "formMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "uniqueID");
    v12 = MEMORY[0x1E0C809B0];
    uniqueIDOfFocusedPasswordElementWithAutomaticPassword = self->_uniqueIDOfFocusedPasswordElementWithAutomaticPassword;
    uniqueIDsOfPasswordElementsForAutomaticPasswords = self->_uniqueIDsOfPasswordElementsForAutomaticPasswords;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __64___SFFormAutoFillController_replaceCurrentPasswordWithPassword___block_invoke;
    v34[3] = &unk_1E4AC0F90;
    v34[4] = self;
    -[SFFormAutoFiller substitutePasswordElementsWithAutomaticPasswordElementsInFrame:formID:focusedPasswordControlUniqueID:passwordControlUniqueIDs:automaticPassword:blurAfterSubstitution:completionHandler:](v8, "substitutePasswordElementsWithAutomaticPasswordElementsInFrame:formID:focusedPasswordControlUniqueID:passwordControlUniqueIDs:automaticPassword:blurAfterSubstitution:completionHandler:", v9, v11, uniqueIDOfFocusedPasswordElementWithAutomaticPassword, uniqueIDsOfPasswordElementsForAutomaticPasswords, v4, 0, v34);

    +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "generatedPassword");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = dispatch_group_create();
      dispatch_group_enter(v17);
      v28 = 0;
      v29 = &v28;
      v30 = 0x3032000000;
      v31 = __Block_byref_object_copy__0;
      v32 = __Block_byref_object_dispose__0;
      v33 = 0;
      objc_msgSend(MEMORY[0x1E0D8A970], "sharedStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v12;
      v25[1] = 3221225472;
      v25[2] = __64___SFFormAutoFillController_replaceCurrentPasswordWithPassword___block_invoke_3;
      v25[3] = &unk_1E4AC2270;
      v27 = &v28;
      v19 = v17;
      v26 = v19;
      objc_msgSend(v18, "updateGeneratedPassword:withPassword:completionHandler:", v16, v4, v25);

      v20 = dispatch_time(0, 1000000000);
      dispatch_group_wait(v19, v20);
      v21 = v29[5];
      +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setGeneratedPassword:", v21);

      _Block_object_dispose(&v28, 8);
    }

    v23 = (NSString *)objc_msgSend(v4, "copy");
    currentStrongPassword = self->_currentStrongPassword;
    self->_currentStrongPassword = v23;

  }
}

- (void)makeStrongPasswordFieldViewableAndEditable:(BOOL)a3
{
  SFFormAutoFillFrameHandle *frameHandleForAutomaticPasswords;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  frameHandleForAutomaticPasswords = self->_frameHandleForAutomaticPasswords;
  if (frameHandleForAutomaticPasswords)
  {
    -[SFFormAutoFiller setStrongPasswordElementViewableIfAppropriate:frame:passwordControlUniqueIDs:](self->_autoFiller, "setStrongPasswordElementViewableIfAppropriate:frame:passwordControlUniqueIDs:", a3, frameHandleForAutomaticPasswords, self->_uniqueIDsOfPasswordElementsForAutomaticPasswords);
    if ((objc_msgSend(MEMORY[0x1E0D8A8F8], "isPasswordManagerAppEnabledAndInstalled") & 1) == 0)
    {
      +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "generatedPassword");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0D8A970], "sharedStore");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeGeneratedPassword:completionHandler:", v6, 0);

        +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setGeneratedPassword:", 0);

      }
    }
    if ((objc_msgSend(MEMORY[0x1E0D8A8F8], "isPasswordManagerAppEnabledAndInstalled") & 1) == 0)
      -[_SFFormAutoFillController _removeAutomaticPasswordButtonInitiatedByUser:removeVisualTreatmentOnly:](self, "_removeAutomaticPasswordButtonInitiatedByUser:removeVisualTreatmentOnly:", 0, 1);
  }
}

- (void)copyCurrentStrongPassword
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setString:", self->_currentStrongPassword);

}

- (void)beginAutomaticPasswordInteractionWithInputSession:(id)a3 generatedPassword:(id)a4
{
  id v6;
  id WeakRetained;
  WBSCreditCardData *lastFilledCreditCardData;
  NSDictionary *lastFilledCreditCardDataTypes;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "formAutoFillControllerUserChoseToUseGeneratedPassword:", self);
  lastFilledCreditCardData = self->_lastFilledCreditCardData;
  self->_lastFilledCreditCardData = 0;

  lastFilledCreditCardDataTypes = self->_lastFilledCreditCardDataTypes;
  self->_lastFilledCreditCardDataTypes = 0;

  v10 = -[_SFFormAutoFillController _beginAutomaticPasswordInteractionWithInputSession:generatedPassword:ignorePreviousDecision:](self, "_beginAutomaticPasswordInteractionWithInputSession:generatedPassword:ignorePreviousDecision:", v11, v6, 1);
}

- (id)beginAutomaticPasswordInteractionWithInputSession:(id)a3
{
  -[_SFFormAutoFillController _beginAutomaticPasswordInteractionWithInputSession:generatedPassword:ignorePreviousDecision:](self, "_beginAutomaticPasswordInteractionWithInputSession:generatedPassword:ignorePreviousDecision:", a3, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_beginAutomaticPasswordInteractionWithInputSession:(id)a3 generatedPassword:(id)a4 ignorePreviousDecision:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSString *v25;
  NSString *defaultStrongPassword;
  NSString *v27;
  NSString *currentStrongPassword;
  id v29;
  void *v31;
  id v32;
  id WeakRetained;
  void *v34;
  void *v35;
  void *v36;
  void (**v37)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void (**v50)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v51[5];
  _BYTE v52[9];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(MEMORY[0x1E0D8A8F8], "isPasswordManagerAppEnabledAndInstalled")
    && ((objc_msgSend(MEMORY[0x1E0D8A8F8], "isAutomaticStrongPasswordsEnabled") & 1) == 0
     || self->_didCloseStrongPasswordIntroductionView))
  {
    goto LABEL_18;
  }
  if (objc_msgSend(MEMORY[0x1E0D8A8F8], "hasInternalContent"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("SFDebugEnableAutomaticStrongPasswords"));

    if ((v11 & 1) != 0)
      goto LABEL_18;
  }
  objc_msgSend(v8, "focusedElementInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "type");

  if (v13 != 3)
  {
LABEL_18:
    v19 = 0;
  }
  else
  {
    objc_msgSend(v8, "autoFillInputSessionUserObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v8, "frameHandle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)MEMORY[0x1E0D8AA30];
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("passwordField"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "formControlMetadataFromSerializedData:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v8, "formMetadata");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (v43)
          {
            +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
            v52[0] = 0;
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v42, "textFieldIsEligibleForAutomaticStrongPassword:form:ignorePreviousDecision:textFieldCurrentlyContainsStrongPassword:", v18, v43, v5, v52) & 1) != 0)
            {
              objc_msgSend(v18, "uniqueID");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "passwordElementUniqueID");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "confirmPasswordElementUniqueID");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v51[0] = MEMORY[0x1E0C809B0];
              v51[1] = 3221225472;
              v51[2] = __121___SFFormAutoFillController__beginAutomaticPasswordInteractionWithInputSession_generatedPassword_ignorePreviousDecision___block_invoke;
              v51[3] = &unk_1E4AC2298;
              v51[4] = self;
              v37 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A8598C40](v51);
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if (v40)
                objc_msgSend(v41, "addObject:", v40);
              if (v39)
                objc_msgSend(v41, "addObject:", v39);
              ((void (**)(_QWORD, void *, void *, void *, void *, void *))v37)[2](v37, v15, v43, v18, v41, v38);
              if (v52[0])
              {
                objc_msgSend(v8, "focusedElementInfo");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "value");
                v19 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(v15, "webui_URL");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "autoFillQuirksManager");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "passwordGenerationManager");
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                v35 = v21;
                objc_msgSend(v21, "defaultRequirementsForURL:", v36);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v21, "passwordGenerationIsDisallowedByRequirements:", v34) & 1) != 0)
                {
                  v19 = 0;
                }
                else
                {
                  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
                  if ((objc_msgSend(v42, "shouldAutoGeneratePasswordsForURL:inWebView:", v36) & 1) != 0)
                  {
                    v32 = objc_loadWeakRetained((id *)&self->_delegate);
                    if ((objc_opt_respondsToSelector() & 1) != 0
                      && (objc_msgSend(v32, "formAutoFillControllerDidUserDeclineAutomaticStrongPasswordForCurrentDomain:", self) & 1) != 0)
                    {
                      v19 = 0;
                    }
                    else
                    {
                      -[_SFFormAutoFillController automaticPasswordForPasswordField:inForm:isFrame:](self, "automaticPasswordForPasswordField:inForm:isFrame:", v18, v43, v15);
                      v22 = objc_claimAutoreleasedReturnValue();
                      v31 = (void *)v22;
                      if (v9)
                        v23 = v9;
                      else
                        v23 = (void *)v22;
                      v19 = v23;
                      if (v19)
                      {
                        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v19);
                        v24 = (void *)objc_claimAutoreleasedReturnValue();
                        -[_SFFormAutoFillController _addValuesAutoFilledForCurrentPage:](self, "_addValuesAutoFilledForCurrentPage:", v24);

                        v25 = (NSString *)objc_msgSend(v31, "copy");
                        defaultStrongPassword = self->_defaultStrongPassword;
                        self->_defaultStrongPassword = v25;

                        ((void (**)(_QWORD, void *, void *, void *, void *, void *))v37)[2](v37, v15, v43, v18, v41, v38);
                        if ((objc_msgSend(MEMORY[0x1E0D8A8F8], "isPasswordManagerAppEnabledAndInstalled") & 1) == 0)
                        {
                          v27 = (NSString *)objc_msgSend(v19, "copy");
                          currentStrongPassword = self->_currentStrongPassword;
                          self->_currentStrongPassword = v27;

                          v44[0] = MEMORY[0x1E0C809B0];
                          v44[1] = 3221225472;
                          v44[2] = __121___SFFormAutoFillController__beginAutomaticPasswordInteractionWithInputSession_generatedPassword_ignorePreviousDecision___block_invoke_2;
                          v44[3] = &unk_1E4AC22C0;
                          v50 = v37;
                          v45 = v15;
                          v46 = v43;
                          v47 = v18;
                          v48 = v41;
                          v49 = v38;
                          -[_SFFormAutoFillController fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution:completionHandler:](self, "fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution:completionHandler:", v5, v44);

                        }
                        v29 = v19;
                      }

                    }
                  }
                  else
                  {
                    v19 = 0;
                  }

                }
              }

            }
            else
            {
              v19 = 0;
            }

          }
          else
          {
            v19 = 0;
          }

        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  return v19;
}

- (void)fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  SFFormAutoFillFrameHandle *v7;
  WBSFormMetadata *v8;
  WBSFormControlMetadata *v9;
  WBSFormControlMetadata *v10;
  id WeakRetained;
  void *v12;
  NSString *v13;
  NSString *defaultStrongPassword;
  void *v15;
  NSString *currentStrongPassword;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  SFFormAutoFiller *autoFiller;
  uint64_t v22;
  NSArray *uniqueIDsOfPasswordElementsForAutomaticPasswords;
  NSString *uniqueIDOfFocusedPasswordElementWithAutomaticPassword;
  NSString *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  _BOOL4 v37;
  NSObject *v38;
  void *v39;
  void *v40;
  WBSFormControlMetadata *v41;
  void *v42;
  SFFormAutoFillFrameHandle *v43;
  WBSFormMetadata *v44;
  _QWORD block[4];
  SFFormAutoFillFrameHandle *v46;
  _SFFormAutoFillController *v47;
  WBSFormMetadata *v48;
  id v49;
  _QWORD *v50;
  _QWORD v51[4];
  NSObject *v52;
  _QWORD *v53;
  _QWORD v54[4];
  NSObject *v55;
  id v56;
  _QWORD v57[5];
  id v58;

  v4 = a3;
  v6 = a4;
  if (objc_msgSend(MEMORY[0x1E0D8A8F8], "isPasswordManagerAppEnabledAndInstalled"))
  {
    -[SFFormAutocompleteState frame](self->_state, "frame");
    v7 = (SFFormAutoFillFrameHandle *)objc_claimAutoreleasedReturnValue();
    -[SFFormAutocompleteState formMetadata](self->_state, "formMetadata");
    v8 = (WBSFormMetadata *)objc_claimAutoreleasedReturnValue();
    -[SFFormAutocompleteState textFieldMetadata](self->_state, "textFieldMetadata");
    v9 = (WBSFormControlMetadata *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = self->_frameHandleForAutomaticPasswords;
    v8 = self->_formMetadataForAutomaticPasswords;
    v9 = self->_passwordFieldMetadataForAutomaticPasswords;
  }
  v10 = v9;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  -[SFFormAutoFillFrameHandle webui_URL](v7, "webui_URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_defaultStrongPassword)
  {
    -[_SFFormAutoFillController automaticPasswordForPasswordField:inForm:isFrame:](self, "automaticPasswordForPasswordField:inForm:isFrame:", v10, v8, v7);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    defaultStrongPassword = self->_defaultStrongPassword;
    self->_defaultStrongPassword = v13;

  }
  if (self->_currentStrongPassword
    || (objc_storeStrong((id *)&self->_currentStrongPassword, self->_defaultStrongPassword), self->_currentStrongPassword))
  {
    v42 = v6;
    v43 = v7;
    v44 = v8;
    v41 = v10;
    v39 = v12;
    +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v4;
    v57[0] = 0;
    v57[1] = v57;
    v57[2] = 0x3032000000;
    v57[3] = __Block_byref_object_copy__0;
    v57[4] = __Block_byref_object_dispose__0;
    v58 = 0;
    v38 = dispatch_group_create();
    dispatch_group_enter(v38);
    objc_msgSend(MEMORY[0x1E0D8A970], "sharedStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    currentStrongPassword = self->_currentStrongPassword;
    objc_msgSend(MEMORY[0x1E0C92C70], "safari_HTMLFormProtectionSpaceForURL:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(WeakRetained, "webui_privateBrowsingEnabled");
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __121___SFFormAutoFillController_fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution_completionHandler___block_invoke;
    v54[3] = &unk_1E4AC22E8;
    v19 = v38;
    v55 = v19;
    v20 = v40;
    v56 = v20;
    objc_msgSend(v15, "addGeneratedPassword:forProtectionSpace:inPrivateBrowsingSession:completionHandler:", currentStrongPassword, v17, v18, v54);
    v36 = v20;

    dispatch_group_enter(v19);
    autoFiller = self->_autoFiller;
    v22 = -[WBSFormMetadata uniqueID](v44, "uniqueID");
    uniqueIDOfFocusedPasswordElementWithAutomaticPassword = self->_uniqueIDOfFocusedPasswordElementWithAutomaticPassword;
    uniqueIDsOfPasswordElementsForAutomaticPasswords = self->_uniqueIDsOfPasswordElementsForAutomaticPasswords;
    v25 = self->_currentStrongPassword;
    v26 = MEMORY[0x1E0C809B0];
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __121___SFFormAutoFillController_fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution_completionHandler___block_invoke_3;
    v51[3] = &unk_1E4AC2310;
    v53 = v57;
    v27 = v19;
    v52 = v27;
    v7 = v43;
    -[SFFormAutoFiller substitutePasswordElementsWithAutomaticPasswordElementsInFrame:formID:focusedPasswordControlUniqueID:passwordControlUniqueIDs:automaticPassword:blurAfterSubstitution:completionHandler:](autoFiller, "substitutePasswordElementsWithAutomaticPasswordElementsInFrame:formID:focusedPasswordControlUniqueID:passwordControlUniqueIDs:automaticPassword:blurAfterSubstitution:completionHandler:", v43, v22, uniqueIDOfFocusedPasswordElementWithAutomaticPassword, uniqueIDsOfPasswordElementsForAutomaticPasswords, v25, v37, v51);
    block[0] = v26;
    block[1] = 3221225472;
    block[2] = __121___SFFormAutoFillController_fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution_completionHandler___block_invoke_4;
    block[3] = &unk_1E4AC2338;
    v46 = v43;
    v47 = self;
    v50 = v57;
    v8 = v44;
    v48 = v44;
    v6 = v42;
    v49 = v42;
    dispatch_group_notify(v27, MEMORY[0x1E0C80D38], block);

    _Block_object_dispose(v57, 8);
    v10 = v41;
    v12 = v39;
  }
  else
  {
    v28 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[_SFFormAutoFillController fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution:completionHandler:].cold.1(v28, v29, v30, v31, v32, v33, v34, v35);
  }

}

- (void)fillCreditCardData:(id)a3 inFrame:(id)a4 textFieldMetadata:(id)a5 formMetadata:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id location;

  v25 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v24 = v11;
  objc_msgSend(MEMORY[0x1E0DD98F8], "sharedCreditCardDataController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFFormAutoFillController authenticationContext](self, "authenticationContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "externalizedContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", *MEMORY[0x1E0D8B178]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFFormAutoFillController showSpinnerInFormSoon:frame:](self, "showSpinnerInFormSoon:frame:", v11, v10);
  self->_waitingForCreditCardDataFromWallet = 1;
  objc_initWeak(&location, self);
  objc_msgSend(v10, "webui_URL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "host");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __87___SFFormAutoFillController_fillCreditCardData_inFrame_textFieldMetadata_formMetadata___block_invoke;
  v26[3] = &unk_1E4AC2388;
  objc_copyWeak(&v31, &location);
  v18 = v16;
  v27 = v18;
  v19 = v12;
  v28 = v19;
  v22 = v16;
  v20 = v13;
  v29 = v20;
  v21 = v10;
  v30 = v21;
  objc_msgSend(v20, "getCreditCardDataToFill:host:externalizedContext:completionHandler:", v25, v17, v15, v26, v10, v22);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

}

- (void)showSpinnerInFormSoon:(id)a3 frame:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  id v10;
  id v11;
  WBSDispatchSourceTimer *v12;
  WBSDispatchSourceTimer *timerToShowSpinnerInForm;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E0D8A8C8];
  v9 = *MEMORY[0x1E0D8B178];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57___SFFormAutoFillController_showSpinnerInFormSoon_frame___block_invoke;
  v14[3] = &unk_1E4AC23B0;
  objc_copyWeak(&v17, &location);
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "scheduledTimerWithInterval:repeats:handler:", 0, v14, v9);
  v12 = (WBSDispatchSourceTimer *)objc_claimAutoreleasedReturnValue();
  timerToShowSpinnerInForm = self->_timerToShowSpinnerInForm;
  self->_timerToShowSpinnerInForm = v12;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)stopShowingSpinnerInFormSoon:(double)a3 textFieldMetadata:(id)a4 frame:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  WBSDispatchSourceTimer *v13;
  WBSDispatchSourceTimer *timerToStopShowingSpinnerInForm;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, self);
  v10 = (void *)MEMORY[0x1E0D8A8C8];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82___SFFormAutoFillController_stopShowingSpinnerInFormSoon_textFieldMetadata_frame___block_invoke;
  v15[3] = &unk_1E4AC23B0;
  objc_copyWeak(&v18, &location);
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "scheduledTimerWithInterval:repeats:handler:", 0, v15, a3);
  v13 = (WBSDispatchSourceTimer *)objc_claimAutoreleasedReturnValue();
  timerToStopShowingSpinnerInForm = self->_timerToStopShowingSpinnerInForm;
  self->_timerToStopShowingSpinnerInForm = v13;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)setAutoFillSpinnerVisibility:(BOOL)a3 textFieldMetadata:(id)a4 frame:(id)a5
{
  -[SFFormAutoFiller setAutoFillSpinnerVisibility:textFieldMetadata:frame:](self->_autoFiller, "setAutoFillSpinnerVisibility:textFieldMetadata:frame:", a3, a4, a5);
}

- (void)clearAutoFilledCreditCardFieldsInFrame:(id)a3 textFieldMetadata:(id)a4 formMetadata:(id)a5 completionHandler:(id)a6
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a6;
  -[NSDictionary allKeys](self->_creditCardFormValues, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFFormAutoFiller clearFieldsAndSetFormControlsToNotAutoFilled:inFrame:completionHandler:](self->_autoFiller, "clearFieldsAndSetFormControlsToNotAutoFilled:inFrame:completionHandler:", v9, v10, v8);

}

- (BOOL)elementIsBeingFocusedForStreamlinedLogin:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "userObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "safari_BOOLForKey:", CFSTR("focusingForStreamlinedLogin"));
  else
    v4 = 0;

  return v4;
}

- (void)performPageLevelAutoFill
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "formAutoFillControllerURLForFormAutoFill:", self);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[SFFormAutoFiller collectFormMetadataForPageLevelAutoFillAtURL:](self->_autoFiller, "collectFormMetadataForPageLevelAutoFillAtURL:", v4);
}

- (void)didPerformPageLevelAutoFill:(BOOL)a3
{
  void *v4;
  SFFormAutocompleteState *stateForPageLevelAutoFill;

  if (!a3
    || (-[SFFormAutocompleteState multiRoundAutoFillManager](self->_stateForPageLevelAutoFill, "multiRoundAutoFillManager"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, !v4))
  {
    -[SFFormAutocompleteState invalidate](self->_stateForPageLevelAutoFill, "invalidate");
    stateForPageLevelAutoFill = self->_stateForPageLevelAutoFill;
    self->_stateForPageLevelAutoFill = 0;

  }
}

- (void)collectDiagnosticsForAutoFillWithCompletionHandler:(id)a3
{
  -[_SFFormAutoFillController _collectDiagnosticsForAutoFillIncludingPageContents:completionHandler:](self, "_collectDiagnosticsForAutoFillIncludingPageContents:completionHandler:", 1, a3);
}

- (void)_collectDiagnosticsForAutoFillIncludingPageContents:(BOOL)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  SFFormAutoFiller *autoFiller;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0D8A788]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "formAutoFillControllerURLForFormAutoFill:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setUrl:", v8);
  objc_msgSend(v6, "setSensitiveValuesForRedaction:", self->_valuesAutoFilledForCurrentPage);
  autoFiller = self->_autoFiller;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __99___SFFormAutoFillController__collectDiagnosticsForAutoFillIncludingPageContents_completionHandler___block_invoke;
  v12[3] = &unk_1E4AC23D8;
  v10 = v6;
  v13 = v10;
  v11 = v5;
  v14 = v11;
  -[SFFormAutoFiller diagnosticsFormMetadataWithCompletionHandler:](autoFiller, "diagnosticsFormMetadataWithCompletionHandler:", v12);

}

- (void)_presentAutoFillInternalFeedbackActivityNotificationIfNeeded
{
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id v6;
  id location;

  if (objc_msgSend(MEMORY[0x1E0D8A8F8], "isInternalInstall"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "resetPendingAutoFillInternalFeedbackToastDismissalTimer");
    if (!self->_hasPresentedAutoFillInternalFeedbackNoticeForCurrentPage)
    {
      self->_hasPresentedAutoFillInternalFeedbackNoticeForCurrentPage = 1;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_initWeak(&location, self);
        v4[0] = MEMORY[0x1E0C809B0];
        v4[1] = 3221225472;
        v4[2] = __89___SFFormAutoFillController__presentAutoFillInternalFeedbackActivityNotificationIfNeeded__block_invoke;
        v4[3] = &unk_1E4AC2400;
        objc_copyWeak(&v6, &location);
        v5 = WeakRetained;
        -[_SFFormAutoFillController _collectDiagnosticsForAutoFillIncludingPageContents:completionHandler:](self, "_collectDiagnosticsForAutoFillIncludingPageContents:completionHandler:", 0, v4);

        objc_destroyWeak(&v6);
        objc_destroyWeak(&location);
      }
    }

  }
}

- (void)_dismissAutoFillInternalFeedbackNoticeImmediately:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0D8A8F8], "isInternalInstall"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "dismissAutoFillInternalFeedbackActivityForFormAutoFillController:immediately:", self, v3);

  }
}

- (void)_addValuesAutoFilledForCurrentPage:(id)a3
{
  id v4;
  NSMutableSet *valuesAutoFilledForCurrentPage;
  void *v6;
  NSMutableSet *v7;
  NSMutableSet *v8;
  id v9;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D8A8F8], "isInternalInstall") & 1) != 0)
  {
    objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_1072);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    valuesAutoFilledForCurrentPage = self->_valuesAutoFilledForCurrentPage;
    if (valuesAutoFilledForCurrentPage)
    {
      -[NSMutableSet unionSet:](valuesAutoFilledForCurrentPage, "unionSet:");
    }
    else
    {
      v7 = (NSMutableSet *)objc_msgSend(v9, "mutableCopy");
      v8 = self->_valuesAutoFilledForCurrentPage;
      self->_valuesAutoFilledForCurrentPage = v7;

    }
    v6 = v9;
  }
  else
  {
    v6 = v4;
  }

}

- (void)_didFocusSensitiveFormField
{
  void *v3;
  int v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "formAutoFillControllerDidFocusSensitiveFormField:", self);
  if (objc_msgSend(MEMORY[0x1E0D8A8F8], "isPasswordManagerAppEnabledAndInstalled"))
  {
    objc_msgSend(MEMORY[0x1E0D8A020], "sharedFeatureManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "shouldAutoFillPasswordsFromKeychain");

    if (v4)
      -[_SFFormAutoFillController makeStrongPasswordFieldViewableAndEditable:](self, "makeStrongPasswordFieldViewableAndEditable:", 1);
  }

}

- (id)_customInputViewFromAutoFillInputSession
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[_SFFormAutoFillInputSession formInputSession](self->_inputSessionForAutomaticPasswords, "formInputSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customInputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFFormAutoFillController _customInputViewFromAutoFillInputSession].cold.1(v7, v9, v5);
    }

    v4 = 0;
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

- (void)_ensureCurrentStrongPasswordExists
{
  void *v3;
  NSString *v4;
  NSString *currentStrongPassword;
  id v6;

  -[_SFFormAutoFillController automaticPasswordForPasswordField:inForm:isFrame:](self, "automaticPasswordForPasswordField:inForm:isFrame:", self->_passwordFieldMetadataForAutomaticPasswords, self->_formMetadataForAutomaticPasswords, self->_frameHandleForAutomaticPasswords);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    v4 = (NSString *)objc_msgSend(v3, "copy");
    currentStrongPassword = self->_currentStrongPassword;
    self->_currentStrongPassword = v4;

    v3 = v6;
  }

}

- (void)generateAndFillStrongPassword
{
  void *v3;

  if (!self->_currentStrongPassword)
  {
    -[_SFFormAutoFillController _ensureCurrentStrongPasswordExists](self, "_ensureCurrentStrongPasswordExists");
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self->_currentStrongPassword);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFFormAutoFillController _addValuesAutoFilledForCurrentPage:](self, "_addValuesAutoFilledForCurrentPage:", v3);

  }
  -[_SFFormAutoFillController fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution:completionHandler:](self, "fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution:completionHandler:", 0, &__block_literal_global_1076);
  self->_didFillStrongPasswordFromStreamlinedAutoFillView = 1;
}

- (void)userDidSelectUseKeyboard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SFFormAutocompleteState inputSession](self->_state, "inputSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formInputSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCustomInputView:", 0);

  -[SFFormAutocompleteState inputSession](self->_state, "inputSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formInputSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessoryViewShouldNotShow:", 0);

  -[_SFFormAutoFillController _restoreInputAssistantItemsIfNecessary](self, "_restoreInputAssistantItemsIfNecessary");
}

- (void)userDidSelectShowMorePasswords
{
  -[SFFormAutocompleteState showAllPasswordsButtonTapped](self->_state, "showAllPasswordsButtonTapped");
}

- (void)_showICloudKeychainViewInCurrentInputView
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[_SFFormAutoFillController _customInputViewFromAutoFillInputSession](self, "_customInputViewFromAutoFillInputSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A3B2D000, v4, OS_LOG_TYPE_DEFAULT, "Transitioning to iCloud Keychain view", v6, 2u);
    }
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C088]), "initWithMode:", 3);
    objc_msgSend(v5, "setDelegate:", self);
    objc_msgSend(v3, "replaceContentsOfViewWithStrongPasswordIntroductionViewController:", v5);
    objc_storeStrong((id *)&self->_strongPasswordIntroductionViewController, v5);
    -[_SFFormAutoFillController hideInputAccessoryView](self, "hideInputAccessoryView");

  }
}

- (void)autoFillTextSuggestion:(id)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[SFFormAutocompleteState autoFillTextSuggestion:](self->_state, "autoFillTextSuggestion:");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_loadWeakRetained((id *)&self->_webView);
  if (objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EE7D8190))
  {
    objc_msgSend(v17, "savedAccountMatch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "savedAccountMatch");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "savedAccount");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "user");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "tabIDForAutoFill");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "URL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v5, "webui_privateBrowsingEnabled");
        objc_msgSend(v8, "didFillPasswordForUsername:fromProviderWithBundleIdentifier:inTabWithID:currentURL:isPrivate:", v11, *MEMORY[0x1E0D8B278], v12, v13, v14);
LABEL_7:

        goto LABEL_8;
      }
    }
    objc_msgSend(v17, "credentialIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v17, "credentialIdentity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "user");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "owningExtensionState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "providerBundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "tabIDForAutoFill");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "didFillPasswordForUsername:fromProviderWithBundleIdentifier:inTabWithID:currentURL:isPrivate:", v10, v12, v13, v16, objc_msgSend(v5, "webui_privateBrowsingEnabled"));

      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)autoFillInputViewShouldClose:(id)a3
{
  self->_didCloseStrongPasswordIntroductionView = 1;
  -[_SFFormAutoFillController _dismissKeyboardAndSimulateCarriageReturnKeyEvents:](self, "_dismissKeyboardAndSimulateCarriageReturnKeyEvents:", 0);
}

- (unint64_t)autoFillFormType
{
  return -[WBSFormMetadata type](self->_formMetadataForAutomaticPasswords, "type");
}

- (BOOL)shouldGenerateStrongPasswordForFormOfType:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (void)fetchIconForURLWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D8AD40]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithTitle:url:minimumIconSize:maximumIconSize:", &stru_1E4AC8470, v7, 48.0, 48.0, 64.0, 64.0);

  objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66___SFFormAutoFillController_fetchIconForURLWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E4AC2488;
  v10 = v4;
  v13 = v10;
  v11 = (id)objc_msgSend(v9, "registerRequest:priority:responseHandler:", v8, 2, v12);

}

- (void)strongPasswordIntroductionViewController:(id)a3 shouldPerformAction:(unint64_t)a4 willShowAdditionalView:(BOOL)a5
{
  uint64_t v7;
  id v8;

  v8 = a3;
  v7 = objc_msgSend(v8, "mode");
  if (a4 != 1 || v7)
  {
    if ((v7 & 0xFFFFFFFFFFFFFFFELL) == 2)
      -[_SFFormAutoFillController _dismissKeyboardAndSimulateCarriageReturnKeyEvents:](self, "_dismissKeyboardAndSimulateCarriageReturnKeyEvents:", 0);
  }
  else
  {
    self->_didCloseStrongPasswordIntroductionView = 1;
    -[_SFFormAutoFillController _dismissKeyboardAndSimulateCarriageReturnKeyEvents:](self, "_dismissKeyboardAndSimulateCarriageReturnKeyEvents:", 0);
  }

}

- (void)imageForStrongPasswordIntroductionViewController:(id)a3 completionHandler:(id)a4
{
  -[_SFFormAutoFillController fetchIconForURLWithCompletionHandler:](self, "fetchIconForURLWithCompletionHandler:", a4);
}

- (id)placeholderImageForStrongPasswordIntroductionViewController:(id)a3
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0D4EF90];
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generateFavoritesIconForTitle:url:backgroundColor:shouldRemoveGrammaticalArticles:fontWeight:fontDesign:fontSize:", &stru_1E4AC8470, v5, v6, 1, 0, 1, 56.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)strongPasswordIntroductionViewController:(id)a3 automaticStrongPasswordWithFormat:(unint64_t)a4
{
  void *v4;
  id v7;
  uint64_t v8;

  v7 = a3;
  if (a4 == 1)
  {
    -[_SFFormAutoFillController alphanumericStrongPassword](self, "alphanumericStrongPassword");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!a4)
  {
    -[_SFFormAutoFillController defaultStrongPassword](self, "defaultStrongPassword");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v4 = (void *)v8;
  }

  return v4;
}

- (id)recentlySavedAccountForStrongPasswordIntroductionViewController:(id)a3
{
  return self->_recentlySavedAccountFromStreamlinedAutoFill;
}

- (void)handleDidSaveAccountWithGeneratedPasswordNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (self->_didFillStrongPasswordFromStreamlinedAutoFillView
    && !self->_didPostAccountSavedNotificationForAccountSavedWithFilledStrongPassword)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DD9950]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_storeStrong((id *)&self->_recentlySavedAccountFromStreamlinedAutoFill, v7);
      if (!objc_msgSend(MEMORY[0x1E0D6C088], "shouldShowViewsInMode:", 3))
      {
        objc_msgSend(MEMORY[0x1E0D8AAC8], "sharedNotificationManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __83___SFFormAutoFillController_handleDidSaveAccountWithGeneratedPasswordNotification___block_invoke_3;
        v12[3] = &unk_1E4AC24F8;
        v12[4] = self;
        v13 = v7;
        objc_msgSend(v11, "requestStatusWithCompletionHandler:", v12);

        goto LABEL_11;
      }
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __83___SFFormAutoFillController_handleDidSaveAccountWithGeneratedPasswordNotification___block_invoke_2;
      v14[3] = &unk_1E4AC1080;
      v14[4] = self;
      v8 = MEMORY[0x1E0C80D38];
      v9 = v14;
    }
    else
    {
      v10 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3B2D000, v10, OS_LOG_TYPE_DEFAULT, "No account saved; dismissing keyboard", buf, 2u);
      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __83___SFFormAutoFillController_handleDidSaveAccountWithGeneratedPasswordNotification___block_invoke;
      block[3] = &unk_1E4AC1080;
      block[4] = self;
      v8 = MEMORY[0x1E0C80D38];
      v9 = block;
    }
    dispatch_async(v8, v9);
LABEL_11:

  }
}

- (void)handleDidUpdatePasswordForPreviouslySavedAccount:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  if (self->_didFillStrongPasswordFromStreamlinedAutoFillView
    && self->_didPostAccountSavedNotificationForAccountSavedWithFilledStrongPassword)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A3B2D000, v5, OS_LOG_TYPE_DEFAULT, "Scheduling password updated notification", v9, 2u);
    }
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DD9950]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&self->_recentlySavedAccountFromStreamlinedAutoFill, v7);
    objc_msgSend(MEMORY[0x1E0D8AAC8], "sharedNotificationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "schedulePasswordUpdatedNotificationForSavedAccount:completionHandler:", v7, &__block_literal_global_1219);

  }
}

- (BOOL)metadataCorrectionsEnabled
{
  return self->_metadataCorrectionsEnabled;
}

- (NSString)defaultStrongPassword
{
  return self->_defaultStrongPassword;
}

- (NSString)currentStrongPassword
{
  return self->_currentStrongPassword;
}

- (BOOL)shouldSuggestToCustomizeStrongPassword
{
  return self->_shouldSuggestToCustomizeStrongPassword;
}

- (void)setShouldSuggestToCustomizeStrongPassword:(BOOL)a3
{
  self->_shouldSuggestToCustomizeStrongPassword = a3;
}

- (NSDictionary)creditCardFormValues
{
  return self->_creditCardFormValues;
}

- (CNContact)lastFilledContact
{
  return self->_lastFilledContact;
}

- (void)setLastFilledContact:(id)a3
{
  objc_storeStrong((id *)&self->_lastFilledContact, a3);
}

- (BOOL)waitingForCreditCardDataFromWallet
{
  return self->_waitingForCreditCardDataFromWallet;
}

- (void)setWaitingForCreditCardDataFromWallet:(BOOL)a3
{
  self->_waitingForCreditCardDataFromWallet = a3;
}

- (WBSCreditCardData)lastFilledCreditCardData
{
  return self->_lastFilledCreditCardData;
}

- (void)setLastFilledCreditCardData:(id)a3
{
  objc_storeStrong((id *)&self->_lastFilledCreditCardData, a3);
}

- (NSMutableSet)previouslyFilledVirtualCardNumbers
{
  return self->_previouslyFilledVirtualCardNumbers;
}

- (void)setPreviouslyFilledVirtualCardNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_previouslyFilledVirtualCardNumbers, a3);
}

- (NSDictionary)lastFilledCreditCardDataTypes
{
  return self->_lastFilledCreditCardDataTypes;
}

- (void)setLastFilledCreditCardDataTypes:(id)a3
{
  objc_storeStrong((id *)&self->_lastFilledCreditCardDataTypes, a3);
}

- (BOOL)didCloseStrongPasswordIntroductionView
{
  return self->_didCloseStrongPasswordIntroductionView;
}

- (void)setDidCloseStrongPasswordIntroductionView:(BOOL)a3
{
  self->_didCloseStrongPasswordIntroductionView = a3;
}

- (BOOL)shouldAutofillESimInformation
{
  return self->_shouldAutofillESimInformation;
}

- (void)setShouldAutofillESimInformation:(BOOL)a3
{
  self->_shouldAutofillESimInformation = a3;
}

- (_SFFormAutoFillTestController)testController
{
  return (_SFFormAutoFillTestController *)objc_loadWeakRetained((id *)&self->_testController);
}

- (void)setTestController:(id)a3
{
  objc_storeWeak((id *)&self->_testController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_testController);
  objc_storeStrong((id *)&self->_lastFilledCreditCardDataTypes, 0);
  objc_storeStrong((id *)&self->_previouslyFilledVirtualCardNumbers, 0);
  objc_storeStrong((id *)&self->_lastFilledCreditCardData, 0);
  objc_storeStrong((id *)&self->_lastFilledContact, 0);
  objc_storeStrong((id *)&self->_creditCardFormValues, 0);
  objc_storeStrong((id *)&self->_currentStrongPassword, 0);
  objc_storeStrong((id *)&self->_defaultStrongPassword, 0);
  objc_storeStrong((id *)&self->_recentlySavedAccountFromStreamlinedAutoFill, 0);
  objc_storeStrong((id *)&self->_strongPasswordIntroductionViewController, 0);
  objc_storeStrong((id *)&self->_valuesAutoFilledForCurrentPage, 0);
  objc_storeStrong((id *)&self->_timerToStopShowingSpinnerInForm, 0);
  objc_storeStrong((id *)&self->_timerToShowSpinnerInForm, 0);
  objc_storeStrong((id *)&self->_externalCredentialIdentitiesForStreamlinedAutoFill, 0);
  objc_storeStrong((id *)&self->_preservedTrailingBarButtonGroups, 0);
  objc_storeStrong((id *)&self->_preservedLeadingBarButtonGroups, 0);
  objc_storeStrong((id *)&self->_autoFillInputView, 0);
  objc_storeStrong((id *)&self->_alphanumericStrongPassword, 0);
  objc_storeStrong((id *)&self->_passwordFieldMetadataForAutomaticPasswords, 0);
  objc_storeStrong((id *)&self->_formMetadataForAutomaticPasswords, 0);
  objc_storeStrong((id *)&self->_inputSessionForAutomaticPasswords, 0);
  objc_storeStrong((id *)&self->_frameHandleForAutomaticPasswords, 0);
  objc_storeStrong((id *)&self->_uniqueIDsOfPasswordElementsForAutomaticPasswords, 0);
  objc_storeStrong((id *)&self->_uniqueIDOfFocusedPasswordElementWithAutomaticPassword, 0);
  objc_storeStrong((id *)&self->_formTelemetryDataMonitorQueue, 0);
  objc_storeStrong((id *)&self->_formTelemetryDataMonitor, 0);
  objc_storeStrong((id *)&self->_cachedWebpageLocale, 0);
  objc_storeStrong((id *)&self->_uniqueIDsOfControlsThatWereAutoFilled, 0);
  objc_storeStrong((id *)&self->_uniqueIDsOfFormsThatWereAutoFilled, 0);
  objc_storeStrong((id *)&self->_unsubmittedFormFrame, 0);
  objc_storeStrong((id *)&self->_unsubmittedForm, 0);
  objc_storeStrong((id *)&self->_prefillTimer, 0);
  objc_storeStrong((id *)&self->_stateForPageLevelAutoFill, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_autoFiller, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_webView);
}

- (void)_dismissKeyboardAndSimulateCarriageReturnKeyEvents:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "WebView's first responder doesn't conform to either BETextInput, or UIWKInteractionViewProtocol and UITextInputPrivate. Refusing to try automatic login.", a5, a6, a7, a8, 0);
}

- (void)fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "Couldn't generate a strong password, so there's nothing to fill", a5, a6, a7, a8, 0);
}

- (void)_customInputViewFromAutoFillInputSession
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_ERROR, "Found unexpected input view of type %@", buf, 0xCu);

}

@end
