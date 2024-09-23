@implementation SFFormAutocompleteState

- (SFFormAutocompleteState)initWithFrame:(id)a3 form:(id)a4 textField:(id)a5 inputSession:(id)a6 autoFillController:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SFFormAutocompleteState *v18;
  SFFormAutocompleteState *v19;
  void *v20;
  uint64_t v21;
  WBSFormControlMetadata *textFieldMetadata;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  WBSFormAutoFillMetadataCorrector *metadataCorrector;
  void *v28;
  SFCreditCardFillingViewController *v29;
  SFCreditCardFillingViewController *creditCardViewController;
  WBSAuthenticationServicesAgentProxy *v31;
  WBSAuthenticationServicesAgentProxy *authenticationServicesAgentProxy;
  void *v33;
  SFFormAutocompleteState *v34;
  objc_super v36;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v36.receiver = self;
  v36.super_class = (Class)SFFormAutocompleteState;
  v18 = -[SFFormAutocompleteState init](&v36, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_autoFillController, v17);
    +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v19->_dataController, v20);

    objc_storeStrong((id *)&v19->_formMetadata, a4);
    v19->_formType = objc_msgSend(v14, "type");
    objc_storeStrong((id *)&v19->_frame, a3);
    objc_storeStrong((id *)&v19->_inputSession, a6);
    v21 = objc_msgSend(v15, "copy");
    textFieldMetadata = v19->_textFieldMetadata;
    v19->_textFieldMetadata = (WBSFormControlMetadata *)v21;

    if (objc_msgSend(v17, "metadataCorrectionsEnabled"))
    {
      v23 = objc_alloc(MEMORY[0x1E0D8A940]);
      objc_msgSend(v13, "webui_URL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "host");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v23, "initWithDomain:", v25);
      metadataCorrector = v19->_metadataCorrector;
      v19->_metadataCorrector = (WBSFormAutoFillMetadataCorrector *)v26;

      -[WBSFormAutoFillMetadataCorrector enqueueCorrectionsRequestForFormMetadata:completionHandler:](v19->_metadataCorrector, "enqueueCorrectionsRequestForFormMetadata:completionHandler:", v14, 0);
    }
    objc_msgSend(v17, "oneTimeCodeProvider");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:", v19);

    if (objc_msgSend(MEMORY[0x1E0DD9910], "shouldDisplayHideMyEmailForControl:", v19->_textFieldMetadata))
      -[SFFormAutocompleteState _startHideMyEmailRecordUpdate](v19, "_startHideMyEmailRecordUpdate");
    v29 = -[SFCreditCardFillingViewController initWithFormAutocompleteState:]([SFCreditCardFillingViewController alloc], "initWithFormAutocompleteState:", v19);
    creditCardViewController = v19->_creditCardViewController;
    v19->_creditCardViewController = v29;

    v31 = (WBSAuthenticationServicesAgentProxy *)objc_alloc_init(MEMORY[0x1E0D8A778]);
    authenticationServicesAgentProxy = v19->_authenticationServicesAgentProxy;
    v19->_authenticationServicesAgentProxy = v31;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", v19, sel_newAutoFillablePasskeysAvailable_, *MEMORY[0x1E0D8B498], 0);

    v34 = v19;
  }

  return v19;
}

- (void)invalidate
{
  NSArray *cachedCredentialMatches;
  WBSFormMetadata *formMetadata;
  NSDictionary *formValues;
  SFFormAutoFillFrameHandle *frame;
  WBSMultiRoundAutoFillManager *multiRoundAutoFillManager;
  NSArray *cachedRelatedCredentialMatches;
  WBSFormControlMetadata *textFieldMetadata;
  void *v10;
  WBSFormAutoFillMetadataCorrector *metadataCorrector;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  if (objc_msgSend(WeakRetained, "waitingForCreditCardDataFromWallet"))
    objc_msgSend(WeakRetained, "setAutoFillSpinnerVisibility:textFieldMetadata:frame:", 0, self->_textFieldMetadata, self->_frame);
  self->_action = 0;
  cachedCredentialMatches = self->_cachedCredentialMatches;
  self->_cachedCredentialMatches = 0;

  self->_fetchingLoginCredentialSuggestions = 0;
  formMetadata = self->_formMetadata;
  self->_formMetadata = 0;

  formValues = self->_formValues;
  self->_formType = 0;
  self->_formValues = 0;

  frame = self->_frame;
  self->_frame = 0;

  self->_invalidated = 1;
  multiRoundAutoFillManager = self->_multiRoundAutoFillManager;
  self->_multiRoundAutoFillManager = 0;

  cachedRelatedCredentialMatches = self->_cachedRelatedCredentialMatches;
  self->_cachedRelatedCredentialMatches = 0;

  textFieldMetadata = self->_textFieldMetadata;
  self->_textFieldMetadata = 0;

  self->_performingPageLevelAutoFill = 0;
  objc_msgSend(WeakRetained, "oneTimeCodeProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:", self);

  metadataCorrector = self->_metadataCorrector;
  self->_metadataCorrector = 0;

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SFFormAutocompleteState;
  -[SFFormAutocompleteState dealloc](&v2, sel_dealloc);
}

- (void)updateSuggestions
{
  void *v3;
  char v4;

  -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safari_isEligibleToShowNotSecureWarning");

  if ((v4 & 1) == 0)
    -[SFFormAutocompleteState _updateSuggestions:](self, "_updateSuggestions:", 255);
}

- (void)_updateSuggestions:(unint64_t)a3
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  dispatch_time_t v21;
  NSObject *v22;
  int IsPad;
  unint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  int v66;
  void *v67;
  _BOOL4 v68;
  void *v69;
  char v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  void *v77;
  id v78;
  void *v79;
  id WeakRetained;
  void *v82;
  void *v83;
  void *v85;
  uint8_t buf[16];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[4];
  NSObject *v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  _QWORD v100[4];
  char v101;
  _BYTE v102[128];
  _QWORD v103[4];

  v103[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  objc_msgSend(WeakRetained, "webView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v79, "webui_setInputDashboardViewController:", 0);
  -[_SFFormAutoFillInputSession formInputSession](self->_inputSession, "formInputSession");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8A020], "sharedFeatureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldAutoFillPasswordsFromKeychain");

  objc_msgSend(WeakRetained, "oneTimeCodeProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSFormControlMetadata ancestorFrameURLs](self->_textFieldMetadata, "ancestorFrameURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WBSFormControlMetadata oneTimeCodeFieldClassification](self->_textFieldMetadata, "oneTimeCodeFieldClassification");
  objc_msgSend(WeakRetained, "savedAccountContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs:fieldClassification:inContext:", v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v100[0] = MEMORY[0x1E0C809B0];
  v100[1] = 3221225472;
  v100[2] = __46__SFFormAutocompleteState__updateSuggestions___block_invoke;
  v100[3] = &__block_descriptor_33_e31_B16__0__SFAutoFillOneTimeCode_8l;
  v101 = v4;
  objc_msgSend(v9, "safari_filterObjectsUsingBlock:", v100);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v82, "count");
  v78 = objc_alloc_init(MEMORY[0x1E0D8A040]);
  -[WBSFormControlMetadata ancestorFrameURLs](self->_textFieldMetadata, "ancestorFrameURLs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastObject");
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  v94 = 0;
  v95 = &v94;
  v96 = 0x3032000000;
  v97 = __Block_byref_object_copy__4;
  v98 = __Block_byref_object_dispose__4;
  v99 = 0;
  objc_msgSend(v83, "host");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    v15 = dispatch_group_create();
    dispatch_group_enter(v15);
    objc_msgSend(v83, "host");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = v16;
    objc_msgSend(v83, "host");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "safari_highLevelDomainForPasswordManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v103[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = v10;
    v91[1] = 3221225472;
    v91[2] = __46__SFFormAutocompleteState__updateSuggestions___block_invoke_22;
    v91[3] = &unk_1E4AC3AC8;
    v93 = &v94;
    v20 = v15;
    v92 = v20;
    objc_msgSend(v78, "fetchOneTimeCodeCredentialIdentitiesMatchingDomains:completion:", v19, v91);

    v21 = dispatch_time(0, 5000000000);
    if (dispatch_group_wait(v20, v21))
    {
      v22 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[SFFormAutocompleteState _updateSuggestions:].cold.3(v22);
    }

  }
  if ((v11 || objc_msgSend((id)v95[5], "count"))
    && objc_msgSend(MEMORY[0x1E0D8A950], "shouldDisplayOneTimeCodeForControl:inForm:", self->_textFieldMetadata, self->_formMetadata))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v82, "count");
    IsPad = _SFDeviceIsPad();
    v24 = 1;
    if (IsPad)
      v24 = 2;
    v25 = v75;
    if (v24 < v75)
    {
      if (_SFDeviceIsPad())
        v25 = 2;
      else
        v25 = 1;
    }
    v74 = objc_msgSend((id)v95[5], "count");
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v26 = (id)v95[5];
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
    if (v27)
    {
      v28 = 0;
      v29 = *(_QWORD *)v88;
      while (2)
      {
        v30 = 0;
        v76 = v28 + v27;
        v73 = v28;
        v31 = v28 + 1;
        do
        {
          if (*(_QWORD *)v88 != v29)
            objc_enumerationMutation(v26);
          v32 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v30);
          +[_SFTextSuggestion textSuggestionWithCredentialIdentity:submitForm:](_SFTextSuggestion, "textSuggestionWithCredentialIdentity:submitForm:", v32, 1, v73);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D8A060], "titleForCredentialIdentity:formURL:", v32, v83);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setHeaderText:", v34);

          objc_msgSend(v32, "user");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setDisplayText:", v35);

          objc_msgSend(v85, "addObject:", v33);
          if (v31 + v30 >= v25)
          {
            if (v25 <= v73 + 1)
              v37 = v73 + 1;
            else
              v37 = v25;
            v76 = v37;
            goto LABEL_35;
          }
          ++v30;
        }
        while (v27 != v30);
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
        v28 = v76;
        if (v27)
          continue;
        break;
      }
    }
    else
    {
      v76 = 0;
    }
LABEL_35:

    if (objc_msgSend(v82, "count") && v25 != v76)
    {
      v38 = 0;
      do
      {
        objc_msgSend(v82, "objectAtIndexedSubscript:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        +[_SFTextSuggestion textSuggestionWithOneTimeCode:](_SFTextSuggestion, "textSuggestionWithOneTimeCode:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "localizedSubtitleForContext:", 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setHeaderText:", v41);

        objc_msgSend(v39, "localizedTitleForContext:", 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setDisplayText:", v42);

        objc_msgSend(v85, "addObject:", v40);
        ++v38;
      }
      while (v25 - v76 != v38);
    }
    if (v74 + v75 > v25)
      -[SFFormAutocompleteState _addPasswordsAutoFillSuggestionToSuggestions:forPurpose:](self, "_addPasswordsAutoFillSuggestionToSuggestions:forPurpose:", v85, 1);
    if (objc_msgSend(v85, "count"))
    {
      -[WBSFormControlMetadata uniqueID](self->_textFieldMetadata, "uniqueID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "reportAutoFillOfferedType:forTextFieldWithID:forFormMetadata:", 2, v43, self->_formMetadata);

    }
    objc_msgSend(v77, "setSuggestions:", v85);
    v44 = WBS_LOG_CHANNEL_PREFIXOneTimeCodeAutoFill();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      -[SFFormAutocompleteState _updateSuggestions:].cold.2();
    goto LABEL_87;
  }
  if (objc_msgSend(v82, "count"))
  {
    if (self->_textFieldMetadata)
    {
      v36 = WBS_LOG_CHANNEL_PREFIXOneTimeCodeAutoFill();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3B2D000, v36, OS_LOG_TYPE_INFO, "Did not suggested verification code autofill because current text field is not verification code friendly", buf, 2u);
      }
    }
    else
    {
      v45 = WBS_LOG_CHANNEL_PREFIXOneTimeCodeAutoFill();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        -[SFFormAutocompleteState _updateSuggestions:].cold.1(v45, v46, v47, v48, v49, v50, v51, v52);
    }
  }
  if (-[SFFormAutocompleteState _shouldShowPasswordOptions](self, "_shouldShowPasswordOptions"))
  {
    if (-[SFFormAutocompleteState action](self, "action") == 7)
    {
      if (objc_msgSend(MEMORY[0x1E0D6C088], "shouldShowLoginIntroduction"))
      {
        objc_msgSend(v79, "firstResponder");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "reloadInputViews");

      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "automaticPasswordForPasswordField:inForm:isFrame:", self->_textFieldMetadata, self->_formMetadata, self->_frame);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v54)
        goto LABEL_83;
      +[_SFTextSuggestion textSuggestionWithGeneratedPassword:](_SFTextSuggestion, "textSuggestionWithGeneratedPassword:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(MEMORY[0x1E0D8A8F8], "isPasswordManagerAppEnabledAndInstalled"))
      {
        if (objc_msgSend(WeakRetained, "shouldSuggestToCustomizeStrongPassword"))
        {
          +[_SFTextSuggestion textSuggestionToCustomizeGeneratedPassword](_SFTextSuggestion, "textSuggestionToCustomizeGeneratedPassword");
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          _WBSLocalizedString();
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setDisplayText:", v57);
          v55 = v56;
        }
        else
        {
          _WBSLocalizedString();
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setDisplayText:", v57);
        }

      }
      objc_msgSend(v55, "displayText");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v67 == 0;

      if (v68)
      {
        _WBSLocalizedString();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setHeaderText:", v69);

        objc_msgSend(v55, "setDisplayText:", v54);
      }
      objc_msgSend(v85, "addObject:", v55);
      v70 = objc_msgSend(MEMORY[0x1E0D8A8F8], "isPasswordManagerAppEnabledAndInstalled");

      if ((v70 & 1) == 0)
LABEL_83:
        -[SFFormAutocompleteState _addPasswordsAutoFillSuggestionToSuggestions:forPurpose:](self, "_addPasswordsAutoFillSuggestionToSuggestions:forPurpose:", v85, 0);
      if (objc_msgSend(v85, "count"))
      {
        -[WBSFormControlMetadata uniqueID](self->_textFieldMetadata, "uniqueID");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "reportAutoFillOfferedType:forTextFieldWithID:forFormMetadata:", 1, v71, self->_formMetadata);

      }
      -[_SFFormAutoFillInputSession formInputSession](self->_inputSession, "formInputSession");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setSuggestions:", v85);

LABEL_87:
      goto LABEL_88;
    }
    if (-[SFFormAutocompleteState action](self, "action") == 8
      && objc_msgSend(MEMORY[0x1E0D6C088], "shouldShowLoginIntroduction"))
    {
      objc_msgSend(v79, "firstResponder");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v58;
      if (v58)
        objc_msgSend(v58, "reloadInputViews");

    }
    objc_msgSend(MEMORY[0x1E0D8A020], "sharedFeatureManager");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "shouldAutoFillPasswords");

    if (v61)
      -[SFFormAutocompleteState _suggestLoginCredentialsShowingQuickTypeKey:](self, "_suggestLoginCredentialsShowingQuickTypeKey:", 1);
  }
  else if (-[SFFormAutocompleteState _shouldOfferCreditCardDataAfterUserHasFilledCreditCardData:](self, "_shouldOfferCreditCardDataAfterUserHasFilledCreditCardData:", self->_textFieldMetadata))
  {
    -[SFFormAutocompleteState _showCreditCardDataSuggestionsAfterUserHasFilledCreditCardData](self, "_showCreditCardDataSuggestionsAfterUserHasFilledCreditCardData");
  }
  else if (objc_msgSend(WeakRetained, "waitingForCreditCardDataFromWallet"))
  {
    objc_msgSend(WeakRetained, "setAutoFillSpinnerVisibility:textFieldMetadata:frame:", 1, self->_textFieldMetadata, self->_frame);
  }
  else
  {
    if (-[SFFormAutocompleteState shouldOfferToAutoFillCreditCardData](self, "shouldOfferToAutoFillCreditCardData")
      && -[SFFormAutocompleteState _canAutoFillCreditCardData](self, "_canAutoFillCreditCardData"))
    {
      objc_msgSend(WeakRetained, "webView");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSFormControlMetadata value](self->_textFieldMetadata, "value");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "safari_stringByTrimmingWhitespace");
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v63, "length") && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v85, "webui_setInputDashboardViewController:", self->_creditCardViewController);
      -[WBSFormControlMetadata uniqueID](self->_textFieldMetadata, "uniqueID");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "reportAutoFillOfferedType:forTextFieldWithID:forFormMetadata:", 3, v64, self->_formMetadata);

      goto LABEL_87;
    }
    if (((a3 & 1) == 0
       || !-[SFFormAutocompleteState _suggestUsernamesForRegistrationIfPossible:](self, "_suggestUsernamesForRegistrationIfPossible:", a3))&& (!objc_msgSend(WeakRetained, "shouldAutofillESimInformation")|| !-[SFFormAutocompleteState _didGatherESimInformation](self, "_didGatherESimInformation")))
    {
      v65 = objc_loadWeakRetained((id *)&self->_dataController);
      v66 = objc_msgSend(v65, "shouldAutoFillFromAddressBook");

      if (v66)
        -[SFFormAutocompleteState _gatherAndShowAddressBookAutoFillSuggestionsWithCorrections](self, "_gatherAndShowAddressBookAutoFillSuggestionsWithCorrections");
    }
  }
LABEL_88:
  _Block_object_dispose(&v94, 8);

}

BOOL __46__SFFormAutocompleteState__updateSuggestions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "source") != 2 || *(_BYTE *)(a1 + 32) != 0;
}

void __46__SFFormAutocompleteState__updateSuggestions___block_invoke_22(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (BOOL)_didGatherESimInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", 0);
  if (-[WBSFormControlMetadata looksLikeEIDField](self->_textFieldMetadata, "looksLikeEIDField"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v3, "retrieveDeviceIdentifier:clientBundleIdentifier:error:", 1, v5, &v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;

    +[_SFTextSuggestion textSuggestionWithESimDataType:](_SFTextSuggestion, "textSuggestionWithESimDataType:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _SFDeviceIsPad();
  }
  else
  {
    if (!-[WBSFormControlMetadata looksLikeIMEIField](self->_textFieldMetadata, "looksLikeIMEIField"))
      goto LABEL_11;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v3, "retrieveDeviceIdentifier:clientBundleIdentifier:error:", 2, v10, &v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v16;

    +[_SFTextSuggestion textSuggestionWithESimDataType:](_SFTextSuggestion, "textSuggestionWithESimDataType:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _SFDeviceIsPad();
  }
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHeaderText:", v11);

  objc_msgSend(v8, "setDisplayText:", v6);
  v12 = v7 == 0;
  if (v7)
  {
    v13 = WBS_LOG_CHANNEL_PREFIXESim();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SFFormAutocompleteState _didGatherESimInformation].cold.1(v13, v7);
    goto LABEL_10;
  }
  if (!v8)
  {
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  v18[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFFormAutoFillInputSession formInputSession](self->_inputSession, "formInputSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSuggestions:", v7);

LABEL_10:
LABEL_12:

  return v12;
}

- (void)_gatherAndShowAddressBookAutoFillSuggestionsWithCorrections
{
  id WeakRetained;
  WBSFormAutoFillMetadataCorrector *metadataCorrector;
  WBSFormMetadata *formMetadata;
  _QWORD v6[5];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  if ((objc_msgSend(WeakRetained, "metadataCorrectionsEnabled") & 1) != 0)
  {
    metadataCorrector = self->_metadataCorrector;
    formMetadata = self->_formMetadata;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __86__SFFormAutocompleteState__gatherAndShowAddressBookAutoFillSuggestionsWithCorrections__block_invoke;
    v6[3] = &unk_1E4AC15B8;
    v6[4] = self;
    v7 = WeakRetained;
    -[WBSFormAutoFillMetadataCorrector enqueueCorrectionsRequestForFormMetadata:completionHandler:](metadataCorrector, "enqueueCorrectionsRequestForFormMetadata:completionHandler:", formMetadata, v6);

  }
  else
  {
    -[SFFormAutocompleteState _gatherAndShowAddressBookAutoFillSuggestions](self, "_gatherAndShowAddressBookAutoFillSuggestions");
  }

}

uint64_t __86__SFFormAutocompleteState__gatherAndShowAddressBookAutoFillSuggestionsWithCorrections__block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_correctedFormMetadata:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 224);
    *(_QWORD *)(v4 + 224) = v3;

    objc_msgSend(*(id *)(a1 + 32), "_bestTextFieldMetadataForMetadata:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 232);
    *(_QWORD *)(v7 + 232) = v6;

    objc_msgSend(*(id *)(a1 + 32), "_textDidChangeInForm:textField:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232));
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224);
    objc_msgSend(*(id *)(a1 + 40), "webView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216);
    objc_msgSend(*(id *)(a1 + 40), "savedAccountContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "textDidChangeInForm:inWebView:frame:context:", v10, v11, v12, v13);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_gatherAndShowAddressBookAutoFillSuggestions");
}

- (void)autoFill
{
  -[SFFormAutocompleteState _setUpMultiRoundAutoFillManagerIfNecessary](self, "_setUpMultiRoundAutoFillManagerIfNecessary");
  -[SFFormAutocompleteState _performAutoFill](self, "_performAutoFill");
}

- (void)_performAutoFill
{
  NSArray *cachedCredentialMatches;
  WBSFormMetadata *formMetadata;
  NSDictionary *formValues;
  NSArray *cachedRelatedCredentialMatches;
  id WeakRetained;
  void *v8;
  SFFormAutoFillFrameHandle *frame;
  uint64_t v10;
  _QWORD v11[5];

  switch(self->_action)
  {
    case 2:
      self->_action = 1;
      cachedCredentialMatches = self->_cachedCredentialMatches;
      self->_cachedCredentialMatches = 0;

      formMetadata = self->_formMetadata;
      self->_formMetadata = 0;

      formValues = self->_formValues;
      self->_formValues = 0;

      cachedRelatedCredentialMatches = self->_cachedRelatedCredentialMatches;
      self->_cachedRelatedCredentialMatches = 0;

      WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
      -[WBSFormControlMetadata uniqueID](self->_textFieldMetadata, "uniqueID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      frame = self->_frame;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __43__SFFormAutocompleteState__performAutoFill__block_invoke;
      v11[3] = &unk_1E4AC3B18;
      v11[4] = self;
      objc_msgSend(WeakRetained, "fetchMetadataForTextField:inFrame:withCompletion:", v8, frame, v11);

      break;
    case 4:
      v10 = 1;
      goto LABEL_5;
    case 5:
      v10 = 0;
LABEL_5:
      -[SFFormAutocompleteState _autoFillSingleCreditCardData:](self, "_autoFillSingleCreditCardData:", v10);
      break;
    case 6:
      -[SFFormAutocompleteState captureCreditCardDataWithCameraAndFill](self, "captureCreditCardDataWithCameraAndFill");
      break;
    case 7:
      -[SFFormAutocompleteState _suggestPasswordForNewAccountOrChangePasswordForm](self, "_suggestPasswordForNewAccountOrChangePasswordForm");
      break;
    default:
      return;
  }
}

void __43__SFFormAutocompleteState__performAutoFill__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v8 = objc_msgSend(WeakRetained, "metadataCorrectionsEnabled");

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "_correctedFormMetadata:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 224);
    *(_QWORD *)(v10 + 224) = v9;

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 232), a3);
  v12 = *(_QWORD **)(a1 + 32);
  if (v12[28])
  {
    v13 = objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0);
    if ((unint64_t)(v13 - 1) < 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "_presentContactsAccessSettingsAlert");
    }
    else if ((unint64_t)(v13 - 3) >= 2)
    {
      if (!v13)
      {
        v14 = objc_alloc_init(MEMORY[0x1E0C97298]);
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __43__SFFormAutocompleteState__performAutoFill__block_invoke_2;
        v15[3] = &unk_1E4AC3AF0;
        v15[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v14, "requestAccessForEntityType:completionHandler:", 0, v15);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_gatherFormValues");
    }
  }
  else
  {
    objc_msgSend(v12, "updateAutoFillButton");
  }

}

void __43__SFFormAutocompleteState__performAutoFill__block_invoke_2(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __43__SFFormAutocompleteState__performAutoFill__block_invoke_3;
  v2[3] = &unk_1E4AC08D8;
  v3 = a2;
  v2[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

uint64_t __43__SFFormAutocompleteState__performAutoFill__block_invoke_3(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "_gatherFormValues");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 2;
  return objc_msgSend(*(id *)(a1 + 32), "updateAutoFillButton");
}

- (void)_gatherFormValues
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__SFFormAutocompleteState__gatherFormValues__block_invoke;
  v2[3] = &unk_1E4AC05E0;
  v2[4] = self;
  -[SFFormAutocompleteState _gatherFormValuesWithCompletionHandler:](self, "_gatherFormValuesWithCompletionHandler:", v2);
}

_QWORD *__44__SFFormAutocompleteState__gatherFormValues__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;

  v2 = objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0);
  result = *(_QWORD **)(a1 + 32);
  if (v2 == 2)
    return (_QWORD *)objc_msgSend(result, "updateAutoFillButton");
  v4 = result[1];
  if (v4 != 2)
  {
    if (v4 != 1)
      return result;
    return (_QWORD *)objc_msgSend(result, "updateAutoFillButton");
  }
  return (_QWORD *)objc_msgSend(result, "_offerToAutoFillContact");
}

- (void)_presentContactsAccessSettingsAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  _WBSLocalizedString();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v13, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("ContactsAccessPrompt"));

  v6 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, &__block_literal_global_31);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("OpenSettingsButton"));
  v9 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("CancelButton"));
  objc_msgSend(v4, "addAction:", v11);
  objc_msgSend(v4, "addAction:", v8);
  self->_action = 2;
  -[SFFormAutocompleteState _viewControllerToPresentFrom](self, "_viewControllerToPresentFrom");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentViewController:animated:completion:", v4, 1, 0);

}

void __62__SFFormAutocompleteState__presentContactsAccessSettingsAlert__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=Privacy&path=CONTACTS"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v1, MEMORY[0x1E0C9AA70]);

}

- (void)_setUpMultiRoundAutoFillManagerIfNecessary
{
  WBSMultiRoundAutoFillManager *v3;
  WBSMultiRoundAutoFillManager *multiRoundAutoFillManager;

  if (self->_action == 2)
  {
    v3 = (WBSMultiRoundAutoFillManager *)objc_alloc_init(MEMORY[0x1E0D8AA28]);
    multiRoundAutoFillManager = self->_multiRoundAutoFillManager;
    self->_multiRoundAutoFillManager = v3;
  }
  else
  {
    multiRoundAutoFillManager = self->_multiRoundAutoFillManager;
    self->_multiRoundAutoFillManager = 0;
  }

}

- (int64_t)action
{
  int64_t action;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  int v8;
  NSDictionary *formValues;
  _QWORD v11[5];

  action = self->_action;
  if (!action)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
    if (-[SFFormAutocompleteState _shouldOfferCreditCardDataAfterUserHasFilledCreditCardData:](self, "_shouldOfferCreditCardDataAfterUserHasFilledCreditCardData:", self->_textFieldMetadata))
    {
      if (objc_msgSend(WeakRetained, "isControlASelectElement:", self->_textFieldMetadata))
        action = 5;
      else
        action = 4;
LABEL_6:
      self->_action = action;
LABEL_22:

      return action;
    }
    if (-[SFFormAutocompleteState shouldOfferToAutoFillCreditCardData](self, "shouldOfferToAutoFillCreditCardData"))
    {
      self->_action = 1;
      if (!-[SFFormAutocompleteState _canAutoFillCreditCardData](self, "_canAutoFillCreditCardData"))
      {
        if (+[_SFCreditCardCaptureViewController canCapture](_SFCreditCardCaptureViewController, "canCapture"))
        {
          action = 6;
        }
        else
        {
          action = 1;
        }
        goto LABEL_6;
      }
      -[SFFormAutocompleteState _updateCreditCardAutoFillAction](self, "_updateCreditCardAutoFillAction");
    }
    else
    {
      if (-[SFFormAutocompleteState _shouldUsePasswordGenerationAssistanceForTextField](self, "_shouldUsePasswordGenerationAssistanceForTextField"))
      {
        -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_loadWeakRetained((id *)&self->_autoFillController);
        objc_msgSend(v6, "webView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(WeakRetained, "shouldAutoGeneratePasswordsForURL:inWebView:", v5, v7);

        if (v8)
        {
          action = -[SFFormAutocompleteState _passwordGenerationAssistanceAction](self, "_passwordGenerationAssistanceAction");
          self->_action = action;
          goto LABEL_22;
        }
      }
      self->_action = 1;
      formValues = self->_formValues;
      if ((!formValues
         || -[NSDictionary count](formValues, "count")
         || -[NSArray count](self->_cachedCredentialMatches, "count")
         || -[NSArray count](self->_cachedRelatedCredentialMatches, "count")
         || -[SFFormAutocompleteState _textFieldIsEmptyPasswordField](self, "_textFieldIsEmptyPasswordField"))
        && !self->_gatheringFormValues
        && self->_formMetadata)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __33__SFFormAutocompleteState_action__block_invoke;
        v11[3] = &unk_1E4AC05E0;
        v11[4] = self;
        -[SFFormAutocompleteState _gatherFormValuesWithCompletionHandler:](self, "_gatherFormValuesWithCompletionHandler:", v11);
      }
    }
    action = self->_action;
    goto LABEL_22;
  }
  return action;
}

uint64_t __33__SFFormAutocompleteState_action__block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "updateAutoFillButton");
  return result;
}

- (int64_t)_actionForLoginForm
{
  void *v3;
  id WeakRetained;
  char v5;
  int64_t v6;

  -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  v5 = objc_msgSend(WeakRetained, "shouldAllowPasswordAutoFillOnURL:allowExternalCredentials:", v3, 0);

  if ((v5 & 1) != 0)
  {
    v6 = 8;
  }
  else if (-[SFFormAutocompleteState _shouldAllowExternalPasswordAutoFillOnURL:](self, "_shouldAllowExternalPasswordAutoFillOnURL:", v3))
  {
    v6 = 8;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)_textDidChangeInForm:(id)a3 textField:(id)a4
{
  id v7;
  id WeakRetained;
  int v9;
  int64_t action;
  int64_t v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (!self->_hasNotedThatTextDidChangeInPasswordField)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
    v9 = objc_msgSend(WeakRetained, "isPasswordFieldForUserCredentialsWithMetadata:formMetadata:", self->_textFieldMetadata, self->_formMetadata);

    if (v9)
      self->_hasNotedThatTextDidChangeInPasswordField = 1;
  }
  if (!self->_gatheringFormValues)
  {
    objc_storeStrong((id *)&self->_textFieldMetadata, a4);
    objc_storeStrong((id *)&self->_formMetadata, a3);
    if (self->_formType == 3)
    {
      action = self->_action;
      v11 = -[SFFormAutocompleteState _actionForLoginForm](self, "_actionForLoginForm");
      self->_action = v11;
      if (v11 != action)
        -[SFFormAutocompleteState updateAutoFillButton](self, "updateAutoFillButton");
    }
  }

}

- (void)updateCachedFormMetadataAfterFilling:(id)a3
{
  objc_storeStrong((id *)&self->_formMetadata, a3);
}

- (void)updateAutoFillButton
{
  int64_t action;
  void *v4;
  id v5;

  action = self->_action;
  if ((unint64_t)(action - 4) < 2 || action == 7 || action == 2)
  {
    _WBSLocalizedString();
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[_SFFormAutoFillInputSession formInputSession](self->_inputSession, "formInputSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessoryViewCustomButtonTitle:", v5);

}

- (BOOL)_textFieldIsEmptyPasswordField
{
  void *v3;
  BOOL v4;

  if (!-[WBSFormControlMetadata isSecureTextField](self->_textFieldMetadata, "isSecureTextField"))
    return 0;
  -[WBSFormControlMetadata value](self->_textFieldMetadata, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") == 0;

  return v4;
}

- (BOOL)_suggestUsernamesForRegistrationIfPossible:(unint64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[4];
  id v15[3];
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D8A020], "sharedFeatureManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldAutoFillPasswordsFromKeychain");

  if ((v6 & 1) != 0
    && -[WBSFormMetadata type](self->_formMetadata, "type") == 4
    && (-[WBSFormControlMetadata addressBookLabel](self->_textFieldMetadata, "addressBookLabel"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("email")),
        v7,
        ((v8 | -[WBSFormControlMetadata isLabeledUsernameField](self->_textFieldMetadata, "isLabeledUsernameField")) & 1) != 0))
  {
    if (_SFDeviceIsPad())
      v9 = 2;
    else
      v9 = 1;
    objc_msgSend(MEMORY[0x1E0D8A070], "sharedProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSFormControlMetadata value](self->_textFieldMetadata, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70__SFFormAutocompleteState__suggestUsernamesForRegistrationIfPossible___block_invoke;
    v14[3] = &unk_1E4AC3B88;
    objc_copyWeak(v15, &location);
    v15[1] = (id)v9;
    v15[2] = (id)a3;
    objc_msgSend(v10, "suggestedUsersOfType:matchingText:completionHandler:", v8, v11, v14);

    objc_destroyWeak(v15);
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  objc_destroyWeak(&location);
  return v12;
}

void __70__SFFormAutocompleteState__suggestUsernamesForRegistrationIfPossible___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  __int128 v8;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__SFFormAutocompleteState__suggestUsernamesForRegistrationIfPossible___block_invoke_2;
  v5[3] = &unk_1E4AC3B60;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v8 = *(_OWORD *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __70__SFFormAutocompleteState__suggestUsernamesForRegistrationIfPossible___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id *v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_24;
  objc_msgSend(WeakRetained[8], "formInputSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v6)
  {
    v7 = v6;
    v26 = v4;
    v27 = v3;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v35;
LABEL_4:
    v11 = 0;
    v28 = v8 + v7;
    while (1)
    {
      if (*(_QWORD *)v35 != v10)
        objc_enumerationMutation(v5);
      if (v8 + v11 == *(_QWORD *)(a1 + 48))
        break;
      v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v11);
      objc_msgSend(v12, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[_SFTextSuggestion textSuggestionWithUsername:](_SFTextSuggestion, "textSuggestionWithUsername:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setDisplayText:", v15);

      objc_msgSend(v29, "addObject:", v14);
      v9 |= objc_msgSend(v12, "type") == 2;

      if (v7 == ++v11)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        v8 = v28;
        if (v7)
          goto LABEL_4;
        break;
      }
    }

    v4 = v26;
    v3 = v27;
    if ((v9 & 1) == 0)
      goto LABEL_20;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v5 = v29;
    v16 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(v5);
          v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          _WBSLocalizedString();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setHeaderText:", v21);

        }
        v17 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v17);
      v4 = v26;
      v3 = v27;
    }
  }

LABEL_20:
  objc_msgSend(v3, "_addHideMyEmailSuggestionsIfNecessary:hideMyEmailRecord:", v29, v3[22], v26, v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "mutableCopy");

  objc_msgSend(v3, "_addPasswordsAutoFillSuggestionToSuggestions:forPurpose:", v23, 0);
  if (objc_msgSend(v23, "count"))
  {
    v24 = objc_loadWeakRetained(v3 + 2);
    objc_msgSend(v3[29], "uniqueID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "reportAutoFillOfferedType:forTextFieldWithID:forFormMetadata:", 1, v25, v3[28]);

    objc_msgSend(v4, "setSuggestions:", v23);
  }
  else
  {
    objc_msgSend(v3, "_updateSuggestions:", *(_QWORD *)(a1 + 56) & 0xFFFFFFFFFFFFFFFELL);
  }

LABEL_24:
}

- (void)_autoFillFormWithUsername:(id)a3
{
  WBSFormControlMetadata *textFieldMetadata;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  SFFormAutoFillFrameHandle *frame;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  textFieldMetadata = self->_textFieldMetadata;
  v5 = a3;
  -[WBSFormControlMetadata uniqueID](textFieldMetadata, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D8A950];
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nextFieldAfterControls:inForm:", v8, self->_formMetadata);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  frame = self->_frame;
  v13 = v6;
  v14 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "autoFillFormInFrame:withValues:setAutoFilled:focusFieldAfterFilling:fieldToFocus:submitForm:", frame, v12, 1, v9 != 0, v9, 0);

}

- (void)_setShowingKeyboardInputView:(BOOL)a3
{
  _BOOL4 v3;
  UIView *v5;
  UIView *emptyInputView;
  void *v7;
  UIView *v8;
  id v9;

  v3 = a3;
  if (!self->_emptyInputView && !a3)
  {
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    emptyInputView = self->_emptyInputView;
    self->_emptyInputView = v5;

  }
  -[_SFFormAutoFillInputSession formInputSession](self->_inputSession, "formInputSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v8 = 0;
  else
    v8 = self->_emptyInputView;
  v9 = v7;
  objc_msgSend(v7, "setCustomInputView:", v8);
  objc_msgSend(v9, "setAccessoryViewShouldNotShow:", !v3);

}

- (void)textDidChangeInFrame:(id)a3 form:(id)a4 textField:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  id WeakRetained;
  WBSFormMetadata *v13;
  WBSFormMetadata *formMetadata;
  id v15;
  void *v16;
  SFFormAutoFillFrameHandle *frame;
  void *v18;
  NSString *v19;
  NSString *v20;
  NSString *prefixForSuggestions;
  id v22;

  v22 = a4;
  v8 = a5;
  if (objc_msgSend(a3, "isEqual:", self->_frame))
  {
    objc_msgSend(v8, "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSFormControlMetadata uniqueID](self->_textFieldMetadata, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if (v11)
    {
      objc_storeStrong((id *)&self->_textFieldMetadata, a5);
      WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
      if (objc_msgSend(WeakRetained, "metadataCorrectionsEnabled"))
      {
        -[SFFormAutocompleteState _correctedFormMetadata:](self, "_correctedFormMetadata:", v22);
        v13 = (WBSFormMetadata *)objc_claimAutoreleasedReturnValue();
        formMetadata = self->_formMetadata;
        self->_formMetadata = v13;

      }
      -[SFFormAutocompleteState _textDidChangeInForm:textField:](self, "_textDidChangeInForm:textField:", self->_formMetadata, self->_textFieldMetadata);
      if (objc_msgSend(v8, "isSecureTextField")
        && objc_msgSend(v8, "isAutoFilledTextField"))
      {
        v15 = objc_loadWeakRetained((id *)&self->_dataController);
        objc_msgSend(WeakRetained, "webView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        frame = self->_frame;
        objc_msgSend(WeakRetained, "savedAccountContext");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "textDidChangeInForm:inWebView:frame:context:", v22, v16, frame, v18);

      }
      if ((objc_msgSend(v8, "isSecureTextField") & 1) == 0)
      {
        objc_msgSend(v8, "value");
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19 == self->_prefixForSuggestions || -[NSString isEqualToString:](v19, "isEqualToString:"))
        {

        }
        else
        {
          prefixForSuggestions = self->_prefixForSuggestions;
          self->_prefixForSuggestions = v20;

          -[SFFormAutocompleteState updateSuggestions](self, "updateSuggestions");
        }
      }

    }
  }

}

- (void)_gatherFormValuesWithCompletionHandler:(id)a3
{
  id v4;
  id WeakRetained;
  WBSFormMetadata *formMetadata;
  WBSFormControlMetadata *textFieldMetadata;
  SFFormAutoFillFrameHandle *frame;
  WBSMultiRoundAutoFillManager *multiRoundAutoFillManager;
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  self->_gatheringFormValues = 1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  formMetadata = self->_formMetadata;
  textFieldMetadata = self->_textFieldMetadata;
  multiRoundAutoFillManager = self->_multiRoundAutoFillManager;
  frame = self->_frame;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__SFFormAutocompleteState__gatherFormValuesWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E4AC3BB0;
  v11[4] = self;
  v10 = v4;
  v12 = v10;
  v13 = &v14;
  objc_msgSend(WeakRetained, "gatherValuesForForm:focusedTextFieldMetadata:inFrame:multiRoundAutoFillManager:completionHandler:", formMetadata, textFieldMetadata, frame, multiRoundAutoFillManager, v11);

  *((_BYTE *)v15 + 24) = 0;
  _Block_object_dispose(&v14, 8);

}

void __66__SFFormAutocompleteState__gatherFormValuesWithCompletionHandler___block_invoke(_QWORD *a1, void *a2, char a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD *v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  id WeakRetained;
  void *v16;
  char v17;
  id v18;

  v5 = a2;
  *(_BYTE *)(a1[4] + 56) = 0;
  v18 = v5;
  if (v5)
    v6 = (id)objc_msgSend(v5, "copy");
  else
    v6 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  v7 = v6;
  objc_storeStrong((id *)(a1[4] + 48), v6);

  v8 = (_QWORD *)a1[4];
  if (v8[5])
  {
    v9 = objc_msgSend(v8, "_shouldAllowGeneratedPassword");
    v10 = a1[4];
    v11 = *(_QWORD *)(v10 + 40);
    if (v11 == 3)
    {
      v12 = objc_msgSend((id)v10, "_actionForLoginForm");
    }
    else
    {
      v13 = (v9 & (v11 == 4)) == 0;
      v12 = 7;
      if (v13)
        v12 = 8;
      if ((v9 & 1) != 0)
        goto LABEL_16;
      v14 = objc_msgSend(*(id *)(v10 + 48), "count");
      v10 = a1[4];
      v12 = 2;
      if (v14 || (a3 & 1) != 0)
        goto LABEL_16;
      if (objc_msgSend(*(id *)(v10 + 232), "isSecureTextField")
        && (WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24)),
            objc_msgSend(*(id *)(a1[4] + 216), "webui_URL"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(WeakRetained, "shouldAllowPasswordAutoFillOnURL:allowExternalCredentials:", v16, 1),
            v16,
            WeakRetained,
            (v17 & 1) != 0))
      {
        v12 = 8;
      }
      else
      {
        v12 = 1;
      }
    }
    v10 = a1[4];
LABEL_16:
    *(_QWORD *)(v10 + 8) = v12;
    (*(void (**)(_QWORD, BOOL))(a1[5] + 16))(a1[5], *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) == 0);
  }

}

- (void)autoFillTextSuggestion:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  SFFormAutoFillFrameHandle *frame;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _SFFormAutoFillInputSession *inputSession;
  id v15;

  v15 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  switch(objc_msgSend(v15, "textSuggestionType"))
  {
    case 0:
      objc_msgSend(v15, "oneTimeCode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFormAutocompleteState _fillOneTimeCodeAfterAuthenticationIfNeeded:inFrame:shouldSubmit:](self, "_fillOneTimeCodeAfterAuthenticationIfNeeded:inFrame:shouldSubmit:", v5, self->_frame, -[WBSFormControlMetadata oneTimeCodeIsEligibleForAutomaticLogin](self->_textFieldMetadata, "oneTimeCodeIsEligibleForAutomaticLogin"));
      goto LABEL_18;
    case 1:
      if (objc_msgSend(MEMORY[0x1E0D8A8F8], "isPasswordManagerAppEnabledAndInstalled"))
      {
        v8 = -[WBSFormMetadata uniqueID](self->_formMetadata, "uniqueID");
        frame = self->_frame;
        objc_msgSend(v15, "generatedPassword");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "autoFillForm:inFrame:withGeneratedPassword:", v8, frame, v10);

        objc_msgSend(WeakRetained, "setShouldSuggestToCustomizeStrongPassword:", 1);
        objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "didSelectNewStrongPassword");

        -[SFFormAutocompleteState updateSuggestions](self, "updateSuggestions");
      }
      else
      {
        inputSession = self->_inputSession;
        objc_msgSend(v15, "generatedPassword");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "beginAutomaticPasswordInteractionWithInputSession:generatedPassword:", inputSession, v5);
LABEL_18:

      }
LABEL_19:

      return;
    case 2:
      -[SFFormAutocompleteState presentCustomizeStrongPasswordAlert](self, "presentCustomizeStrongPasswordAlert");
      goto LABEL_19;
    case 3:
      objc_msgSend(v15, "username");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFormAutocompleteState _autoFillFormWithUsername:](self, "_autoFillFormWithUsername:", v5);
      goto LABEL_18;
    case 4:
      objc_msgSend(v15, "savedAccountMatch");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFormAutocompleteState _fillSavedAccountMatchAfterAuthenticationIfNeeded:setAsDefaultCredential:submitForm:](self, "_fillSavedAccountMatchAfterAuthenticationIfNeeded:setAsDefaultCredential:submitForm:", v5, 1, objc_msgSend(v15, "submitForm"));
      goto LABEL_18;
    case 5:
      objc_msgSend(v15, "singleDisplayData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFormAutocompleteState _autoFillDisplayData:setAutoFilled:](self, "_autoFillDisplayData:setAutoFilled:", v5, 1);
      goto LABEL_18;
    case 6:
      objc_msgSend(v15, "credentialIdentity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFormAutocompleteState _fillCredentialIdentity:submitForm:](self, "_fillCredentialIdentity:submitForm:", v5, objc_msgSend(v15, "submitForm"));
      goto LABEL_18;
    case 7:
      objc_msgSend(v15, "creditCardData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFormAutocompleteState _fillCreditCardDataAfterAuthenticationIfNeeded:](self, "_fillCreditCardDataAfterAuthenticationIfNeeded:", v6);

      objc_msgSend(WeakRetained, "webView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "webui_setInputDashboardViewController:", 0);

      goto LABEL_19;
    case 8:
      objc_msgSend(v15, "singleCreditCardData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "singleCreditCardData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFormAutocompleteState _fillSingleCreditCardDataValue:creditCardDataType:](self, "_fillSingleCreditCardDataValue:creditCardDataType:", v12, objc_msgSend(v13, "type"));

      goto LABEL_18;
    case 9:
      objc_msgSend(v15, "emailRecord");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFormAutocompleteState _autoFillHideMyEmailRecord:](self, "_autoFillHideMyEmailRecord:", v5);
      goto LABEL_18;
    case 10:
      -[SFFormAutocompleteState _provisionHideMyEmailRecord](self, "_provisionHideMyEmailRecord");
      goto LABEL_19;
    case 11:
      -[SFFormAutocompleteState _autofillESimData:](self, "_autofillESimData:", objc_msgSend(v15, "eSimDataType"));
      goto LABEL_19;
    default:
      goto LABEL_19;
  }
}

- (void)_autofillESimData:(int64_t)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id WeakRetained;
  SFFormAutocompleteState *v26;
  void *v27;
  void *v28;
  id v29;

  v5 = a3 == 1;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", 0);
  v7 = v6;
  if (a3)
    v8 = 2 * v5;
  else
    v8 = 1;
  v29 = 0;
  objc_msgSend(v6, "retrieveDeviceIdentifier:error:", v8, &v29);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v29;
  if (v10)
  {
    v11 = WBS_LOG_CHANNEL_PREFIXESim();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SFFormAutocompleteState _autofillESimData:].cold.1(v11, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSFormMetadata controls](self->_formMetadata, "controls");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");
    if (v14)
    {
      v15 = v14;
      v26 = self;
      v27 = 0;
      v28 = v7;
      v16 = 0;
      v17 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", v16, v26, v27, v28);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "looksLikeEIDField");
        if (!a3 && (v19 & 1) != 0 || (v20 = objc_msgSend(v18, "looksLikeIMEIField"), a3 == 1) && v20)
        {
          objc_msgSend(v18, "uniqueID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, v21);

          if (v16 + 1 < v15)
            v22 = v16 + 1;
          else
            v22 = 0x7FFFFFFFFFFFFFFFLL;
          if (v17 == 0x7FFFFFFFFFFFFFFFLL)
            v17 = v22;
        }

        ++v16;
      }
      while (v15 != v16);
      if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v23 = 0;
      }
      else
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", v17);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "uniqueID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v10 = v27;
      v7 = v28;
      self = v26;
    }
    else
    {
      v23 = 0;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
    objc_msgSend(WeakRetained, "autoFillFormInFrame:withValues:setAutoFilled:focusFieldAfterFilling:fieldToFocus:submitForm:", self->_frame, v12, 1, v23 != 0, v23, 0);

  }
}

- (id)_viewControllerToPresentFrom
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  objc_msgSend(WeakRetained, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    do
    {
      v4 = v3;
      objc_msgSend(MEMORY[0x1E0DC3F20], "viewControllerForView:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "superview");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    while (v3 && !v5);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_presentViewController:(id)a3 presentingViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;

  v7 = a5;
  v11 = a3;
  v9 = a4;
  v10 = a6;
  if (objc_msgSend(v9, "modalPresentationStyle") == 7)
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 0, 0);
  objc_msgSend(v9, "presentViewController:animated:completion:", v11, v7, v10);

}

- (BOOL)_shouldShowPasswordOptions
{
  void *v3;
  id WeakRetained;
  char v5;
  int64_t v6;
  uint64_t v7;
  BOOL v8;
  unint64_t v9;
  char v10;

  -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  v5 = objc_msgSend(WeakRetained, "shouldAllowPasswordAutoFillOnURL:allowExternalCredentials:", v3, 0);

  if ((v5 & 1) != 0
    || -[SFFormAutocompleteState _shouldAllowExternalPasswordAutoFillOnURL:](self, "_shouldAllowExternalPasswordAutoFillOnURL:", v3))
  {
    v6 = -[SFFormAutocompleteState action](self, "action");
    v7 = -[WBSFormMetadata type](self->_formMetadata, "type");
    if (v6 == 8)
    {
      v8 = 1;
    }
    else
    {
      v9 = v7 - 3;
      v10 = -[WBSFormControlMetadata isSecureTextField](self->_textFieldMetadata, "isSecureTextField");
      if (v9 < 3)
        v8 = v10;
      else
        v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_offerToForgetSavedAccount:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  SFFormAutocompleteState *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  SFFormAutocompleteState *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  SFFormAutocompleteState *v37;
  id v38;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  objc_msgSend(WeakRetained, "webView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "webui_presentingViewController");
  v10 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "user");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  objc_msgSend(MEMORY[0x1E0DD9910], "keychainSyncEnabled");
  v13 = (void *)MEMORY[0x1E0CB3940];
  v31 = v7;
  v32 = (void *)v10;
  v14 = self;
  _WBSLocalizedString();
  if (v12)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "user");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "highLevelDomain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "highLevelDomain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v18, 0, _SFDeviceIsPad());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __72__SFFormAutocompleteState__offerToForgetSavedAccount_completionHandler___block_invoke;
  v35[3] = &unk_1E4AC01B8;
  v36 = v6;
  v37 = v14;
  v23 = v14;
  v24 = v31;
  v38 = v24;
  v25 = v6;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 2, v35);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAction:", v26);

  v27 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v22;
  v33[1] = 3221225472;
  v33[2] = __72__SFFormAutocompleteState__offerToForgetSavedAccount_completionHandler___block_invoke_2;
  v33[3] = &unk_1E4AC01E0;
  v34 = v24;
  v29 = v24;
  objc_msgSend(v27, "actionWithTitle:style:handler:", v28, 1, v33);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAction:", v30);

  -[SFFormAutocompleteState _presentViewController:presentingViewController:animated:completion:](v23, "_presentViewController:presentingViewController:animated:completion:", v19, v32, 1, 0);
}

void __72__SFFormAutocompleteState__offerToForgetSavedAccount_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeCredentialTypes:forSavedAccount:", 1, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "_setUserAndPasswordFieldsAutoFilled:clearPasswordField:", 0, 1);
  v3 = objc_alloc_init(MEMORY[0x1E0DCCBB0]);
  objc_msgSend(v3, "schedulePasswordIconsCleanup");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __72__SFFormAutocompleteState__offerToForgetSavedAccount_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_getLoginFormUser:(id *)a3 password:(id *)a4 userIsAutoFilled:(BOOL *)a5 passwordIsAutoFilled:(BOOL *)a6
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id *v16;
  BOOL *v17;
  id WeakRetained;
  void *v19;
  id v20;
  void *v21;
  SFFormAutocompleteState *v22;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  *a5 = 0;
  *a6 = 0;
  -[WBSFormMetadata userNameElementUniqueID](self->_formMetadata, "userNameElementUniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSFormMetadata passwordElementUniqueID](self->_formMetadata, "passwordElementUniqueID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length") || objc_msgSend(v25, "length"))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v22 = self;
    -[WBSFormMetadata controls](self->_formMetadata, "controls");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v14, "uniqueID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = a3;
          v17 = a5;
          if ((objc_msgSend(v15, "isEqualToString:", v9) & 1) != 0
            || (v16 = a4, v17 = a6, objc_msgSend(v15, "isEqualToString:", v25)))
          {
            objc_msgSend(v14, "value");
            *v16 = (id)objc_claimAutoreleasedReturnValue();
            *v17 = objc_msgSend(v14, "isAutoFilledTextField");
          }

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v11);
    }

    if (!*a3)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v22->_dataController);
      -[SFFormAutoFillFrameHandle webui_URL](v22->_frame, "webui_URL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_loadWeakRetained((id *)&v22->_autoFillController);
      objc_msgSend(v20, "savedAccountContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "lastUsedUsernameWithPasswordForURL:inContext:", v19, v21);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      if (*a3)
        *a5 = 1;
    }
  }

}

- (void)_fetchPotentialCredentialMatchesWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  WBSFormMetadata *v7;
  void *v8;
  id credentialMatchesCompletionHandler;
  void *v10;
  id v11;
  WBSFormMetadata *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  WBSFormMetadata *v23;
  id v24;
  id v25;
  SFFormAutocompleteState *v26;
  _QWORD v27[4];
  id v28;
  void (**v29)(id, void *);

  v4 = (void (**)(id, void *))a3;
  -[SFFormAutocompleteState _cachedPotentialCredentialMatches](self, "_cachedPotentialCredentialMatches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v4[2](v4, v5);
  }
  else
  {
    if (self->_credentialMatchesCompletionHandler)
    {
      v6 = (void *)MEMORY[0x1A8598C40]();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __74__SFFormAutocompleteState__fetchPotentialCredentialMatchesWithCompletion___block_invoke;
      v27[3] = &unk_1E4AC3BD8;
      v28 = v6;
      v29 = v4;
      v7 = v6;
      v8 = (void *)MEMORY[0x1A8598C40](v27);
      credentialMatchesCompletionHandler = self->_credentialMatchesCompletionHandler;
      self->_credentialMatchesCompletionHandler = v8;

    }
    else
    {
      v10 = (void *)MEMORY[0x1A8598C40](v4);
      v11 = self->_credentialMatchesCompletionHandler;
      self->_credentialMatchesCompletionHandler = v10;

      v12 = self->_formMetadata;
      -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
      -[_SFFormAutoFillInputSession frameHandle](self->_inputSession, "frameHandle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "webFrameIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      dispatch_get_global_queue(33, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__SFFormAutocompleteState__fetchPotentialCredentialMatchesWithCompletion___block_invoke_2;
      block[3] = &unk_1E4AC3C00;
      v22 = WeakRetained;
      v23 = v12;
      v24 = v13;
      v25 = v16;
      v26 = self;
      v18 = v16;
      v19 = v13;
      v7 = v12;
      v20 = WeakRetained;
      dispatch_async(v17, block);

    }
  }

}

void __74__SFFormAutocompleteState__fetchPotentialCredentialMatchesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __74__SFFormAutocompleteState__fetchPotentialCredentialMatchesWithCompletion___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  WeakRetained = objc_loadWeakRetained((id *)(a1[8] + 16));
  objc_msgSend(WeakRetained, "savedAccountContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exactFQDNAndHighLevelDomainSavedAccountMatchesForForm:atURL:webFrameIdentifier:savedAccountContext:", v3, v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__SFFormAutocompleteState__fetchPotentialCredentialMatchesWithCompletion___block_invoke_3;
  v10[3] = &unk_1E4ABFB20;
  v10[4] = a1[8];
  v11 = v8;
  v9 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __74__SFFormAutocompleteState__fetchPotentialCredentialMatchesWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  objc_msgSend(*(id *)(a1 + 40), "first");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

  objc_msgSend(*(id *)(a1 + 40), "second");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v5;

  v8 = *(_QWORD **)(a1 + 32);
  v9 = v8[12];
  if (v9)
  {
    objc_msgSend(v8, "_cachedPotentialCredentialMatches");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 96);
    *(_QWORD *)(v11 + 96) = 0;

  }
}

- (id)_cachedPotentialCredentialMatches
{
  NSArray *cachedCredentialMatches;
  NSArray *cachedRelatedCredentialMatches;
  NSArray *v5;

  cachedCredentialMatches = self->_cachedCredentialMatches;
  cachedRelatedCredentialMatches = self->_cachedRelatedCredentialMatches;
  if (cachedCredentialMatches)
  {
    -[NSArray arrayByAddingObjectsFromArray:](cachedCredentialMatches, "arrayByAddingObjectsFromArray:", cachedRelatedCredentialMatches);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = cachedRelatedCredentialMatches;
  }
  return v5;
}

- (void)_fillSavedAccount:(id)a3 setAutoFilled:(BOOL)a4 setAsDefaultCredential:(BOOL)a5 focusFieldAfterFilling:(BOOL)a6 submitForm:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id v12;
  id WeakRetained;
  void *v14;
  __CFString *v15;
  unint64_t formType;
  BOOL v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  _BOOL4 v52;
  void *v53;
  _BOOL4 v54;
  _BOOL4 v55;
  void *v56;
  __CFString *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;
  _QWORD v65[3];

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  v65[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  objc_msgSend(v12, "user");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "password");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  formType = self->_formType;
  v17 = formType == 5 || formType == 3;
  v54 = v10;
  v55 = v8;
  if (v17)
  {
    objc_msgSend((id)objc_opt_class(), "valuesFromUser:password:forLoginOrChangePasswordForm:", v14, v15, self->_formMetadata);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v51 = v7;
    -[WBSFormControlMetadata uniqueID](self->_textFieldMetadata, "uniqueID");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
    {
      v21 = &stru_1E4AC8470;
      if (v15)
        v21 = v15;
      v64 = v19;
      v65[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, &v64, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[WBSFormControlMetadata dictionaryRepresentation](self->_textFieldMetadata, "dictionaryRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v22, "mutableCopy");

      objc_msgSend(v23, "removeObjectForKey:", *MEMORY[0x1E0D8B0A0]);
      v24 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[SFFormAutocompleteState _fillSavedAccount:setAutoFilled:setAsDefaultCredential:focusFieldAfterFilling:submitForm:].cold.1();

      v18 = (void *)MEMORY[0x1E0C9AA70];
    }

    v7 = v51;
  }
  if (self->_performingPageLevelAutoFill && !objc_msgSend(v18, "count"))
  {
    -[SFFormAutocompleteState _finishPageLevelAutoFillWithResult:](self, "_finishPageLevelAutoFillWithResult:", 5);
  }
  else
  {
    v57 = v15;
    v25 = objc_loadWeakRetained((id *)&self->_autoFillController);
    objc_msgSend(WeakRetained, "annotationsFromUsername:forLoginOrChangePasswordForm:", v14, self->_formMetadata);
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26)
      objc_msgSend(v25, "annotateForm:inFrame:withValues:", -[WBSFormMetadata uniqueID](self->_formMetadata, "uniqueID"), self->_frame, v26);
    v53 = (void *)v26;
    v56 = WeakRetained;
    v58 = v14;
    if (v9)
    {
      v52 = v7;
      -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C92C70], "safari_HTMLFormProtectionSpaceForURL:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "protectionSpaces");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "protectionSpacesForAdditionalSites");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "arrayByAddingObjectsFromArray:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v32, "containsObject:", v28))
      {
        objc_msgSend(v25, "savedAccountContext");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setSavedAccountAsDefault:forProtectionSpace:context:", v12, v28, v33);
      }
      else
      {
        objc_msgSend(v28, "host");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "safari_highLevelDomainForPasswordManager");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sharedGroupID");
        v50 = v18;
        v35 = v27;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (id)objc_msgSend(v29, "saveUser:password:forProtectionSpace:highLevelDomain:groupID:", v58, v57, v28, v34, v36);

        v27 = v35;
        v18 = v50;

      }
      WeakRetained = v56;
      v14 = v58;
      v7 = v52;
    }
    -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v39 = objc_msgSend(WeakRetained, "shouldSubmitForm:withUser:password:onURL:", self->_formMetadata, v14, v57, v38);
    else
      v39 = 0;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    objc_msgSend(v18, "allKeys");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v60 != v43)
            objc_enumerationMutation(v40);
          objc_msgSend(v25, "reportAutoFillOfferedType:forTextFieldWithID:forFormMetadata:", 1, *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i), self->_formMetadata);
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      }
      while (v42);
    }

    objc_msgSend(v25, "autoFillFormInFrame:withValues:setAutoFilled:focusFieldAfterFilling:fieldToFocus:submitForm:", self->_frame, v18, v54, v55, 0, v39);
    WeakRetained = v56;
    if ((_DWORD)v39)
      objc_msgSend(v56, "didAutomaticallySubmitFormWhenFillingOnURL:formMetadata:", v38, self->_formMetadata);
    if (self->_performingPageLevelAutoFill)
      -[SFFormAutocompleteState _finishPageLevelAutoFillWithResult:](self, "_finishPageLevelAutoFillWithResult:", 0);
    +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "user");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = *MEMORY[0x1E0D8B278];
    objc_msgSend(v25, "tabIDForAutoFill");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "webView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "didFillPasswordForUsername:fromProviderWithBundleIdentifier:inTabWithID:currentURL:isPrivate:", v46, v47, v48, v38, objc_msgSend(v49, "webui_privateBrowsingEnabled"));

    v15 = v57;
    v14 = v58;
  }

}

- (void)_fillCredential:(id)a3 setAutoFilled:(BOOL)a4 setAsDefaultCredential:(BOOL)a5 focusFieldAfterFilling:(BOOL)a6 submitForm:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  id v11;
  id WeakRetained;
  void *v13;
  __CFString *v14;
  unint64_t formType;
  BOOL v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  id v40;
  _BOOL4 v41;
  _BOOL4 v42;
  _BOOL4 v43;
  __CFString *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;
  _QWORD v51[3];

  v41 = a7;
  v7 = a6;
  v8 = a5;
  v9 = a4;
  v51[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  objc_msgSend(v11, "user");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "password");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  formType = self->_formType;
  v16 = formType == 5 || formType == 3;
  v42 = v9;
  v43 = v7;
  if (v16)
  {
    objc_msgSend((id)objc_opt_class(), "valuesFromUser:password:forLoginOrChangePasswordForm:", v13, v14, self->_formMetadata);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WBSFormControlMetadata uniqueID](self->_textFieldMetadata, "uniqueID");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
    {
      v20 = &stru_1E4AC8470;
      if (v14)
        v20 = v14;
      v50 = v18;
      v51[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = v13;
      -[WBSFormControlMetadata dictionaryRepresentation](self->_textFieldMetadata, "dictionaryRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v22, "mutableCopy");

      objc_msgSend(v23, "removeObjectForKey:", *MEMORY[0x1E0D8B0A0]);
      v24 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[SFFormAutocompleteState _fillSavedAccount:setAutoFilled:setAsDefaultCredential:focusFieldAfterFilling:submitForm:].cold.1();

      v17 = (void *)MEMORY[0x1E0C9AA70];
      v13 = v21;
    }

  }
  if (self->_performingPageLevelAutoFill && !objc_msgSend(v17, "count"))
  {
    -[SFFormAutocompleteState _finishPageLevelAutoFillWithResult:](self, "_finishPageLevelAutoFillWithResult:", 5);
  }
  else
  {
    v25 = objc_loadWeakRetained((id *)&self->_autoFillController);
    objc_msgSend(WeakRetained, "annotationsFromUsername:forLoginOrChangePasswordForm:", v13, self->_formMetadata);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      objc_msgSend(v25, "annotateForm:inFrame:withValues:", -[WBSFormMetadata uniqueID](self->_formMetadata, "uniqueID"), self->_frame, v26);
    v44 = v14;
    if (v8)
    {
      -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
      v27 = v13;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C92C70], "safari_HTMLFormProtectionSpaceForURL:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "safari_setDefaultCredential:forHTMLFormProtectionSpace:", v11, v29);

      v13 = v27;
      v14 = v44;
    }
    -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = WeakRetained;
    v40 = v11;
    if (v41)
      v32 = objc_msgSend(WeakRetained, "shouldSubmitForm:withUser:password:onURL:", self->_formMetadata, v13, v14, v31);
    else
      v32 = 0;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v17, "allKeys", v13);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v46 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(v25, "reportAutoFillOfferedType:forTextFieldWithID:forFormMetadata:", 1, *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i), self->_formMetadata);
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v35);
    }

    objc_msgSend(v25, "autoFillFormInFrame:withValues:setAutoFilled:focusFieldAfterFilling:fieldToFocus:submitForm:", self->_frame, v17, v42, v43, 0, v32);
    WeakRetained = v39;
    if ((_DWORD)v32)
      objc_msgSend(v39, "didAutomaticallySubmitFormWhenFillingOnURL:formMetadata:", v31, self->_formMetadata);
    v11 = v40;
    v13 = v38;
    if (self->_performingPageLevelAutoFill)
      -[SFFormAutocompleteState _finishPageLevelAutoFillWithResult:](self, "_finishPageLevelAutoFillWithResult:", 0);

    v14 = v44;
  }

}

+ (void)_getMatchesFromFormProtectionSpace:(id)a3 matchesFromOtherProtectionSpaces:(id)a4 withFormURL:(id)a5 credentialMatches:(id)a6 lastGeneratedPassword:(id)a7 currentUser:(id)a8 currentPassword:(id)a9 forUserNamesOnly:(BOOL)a10
{
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id obj;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  BOOL v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v34 = a4;
  v15 = a6;
  v36 = a7;
  v16 = a8;
  v37 = a9;
  objc_msgSend(MEMORY[0x1E0C92C70], "safari_HTMLFormProtectionSpaceForURL:", a5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v15;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v47 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v22, "user");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "password");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v24;
        v26 = &stru_1E4AC8470;
        if (v24)
          v26 = (__CFString *)v24;
        v27 = v26;

        if ((objc_msgSend(v23, "length") || (objc_msgSend(v36, "isEqualToString:", v27) & 1) == 0 && !a10)
          && ((objc_msgSend(v23, "length") || objc_msgSend(v16, "length"))
           && !objc_msgSend(v23, "isEqualToString:", v16)
           || (-[__CFString isEqualToString:](v27, "isEqualToString:", v37) & 1) == 0))
        {
          objc_msgSend(v39, "objectForKeyedSubscript:", v23);
          v28 = (id)objc_claimAutoreleasedReturnValue();
          if (!v28)
          {
            v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v28, v23);
          }
          objc_msgSend(v28, "objectForKeyedSubscript:", v27);
          v29 = (id)objc_claimAutoreleasedReturnValue();
          if (!v29)
          {
            v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, v27);
          }
          objc_msgSend(v29, "addObject:", v22);
          ++v19;

        }
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }

  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __192__SFFormAutocompleteState__getMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_withFormURL_credentialMatches_lastGeneratedPassword_currentUser_currentPassword_forUserNamesOnly___block_invoke;
  v40[3] = &unk_1E4AC3CB8;
  v45 = a10;
  v41 = v33;
  v42 = v35;
  v43 = v34;
  v44 = v19;
  v30 = v34;
  v31 = v35;
  v32 = v33;
  objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v40);
  objc_msgSend(v31, "sortUsingComparator:", &__block_literal_global_125);
  objc_msgSend(v30, "sortUsingComparator:", &__block_literal_global_126);

}

void __192__SFFormAutocompleteState__getMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_withFormURL_credentialMatches_lastGeneratedPassword_currentUser_currentPassword_forUserNamesOnly___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  char v20;
  _QWORD v21[4];
  id v22;

  v5 = a2;
  v6 = (objc_class *)MEMORY[0x1E0CB3550];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __192__SFFormAutocompleteState__getMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_withFormURL_credentialMatches_lastGeneratedPassword_currentUser_currentPassword_forUserNamesOnly___block_invoke_2;
  v21[3] = &unk_1E4AC3C68;
  v10 = v8;
  v22 = v10;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v21);
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __192__SFFormAutocompleteState__getMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_withFormURL_credentialMatches_lastGeneratedPassword_currentUser_currentPassword_forUserNamesOnly___block_invoke_4;
  v13[3] = &unk_1E4AC3C90;
  v14 = *(id *)(a1 + 32);
  v15 = v10;
  v20 = *(_BYTE *)(a1 + 64);
  v19 = *(_QWORD *)(a1 + 56);
  v16 = v5;
  v17 = *(id *)(a1 + 40);
  v18 = *(id *)(a1 + 48);
  v11 = v5;
  v12 = v10;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v13);

}

void __192__SFFormAutocompleteState__getMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_withFormURL_credentialMatches_lastGeneratedPassword_currentUser_currentPassword_forUserNamesOnly___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_107);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "unionSet:", v6);
}

uint64_t __192__SFFormAutocompleteState__getMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_withFormURL_credentialMatches_lastGeneratedPassword_currentUser_currentPassword_forUserNamesOnly___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "host");
}

void __192__SFFormAutocompleteState__getMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_withFormURL_credentialMatches_lastGeneratedPassword_currentUser_currentPassword_forUserNamesOnly___block_invoke_4(id *a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  SFCredentialDisplayData *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v9, "protectionSpace");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqual:", a1[4]))
        {

LABEL_13:
          v12 = 1;
          goto LABEL_14;
        }
        objc_msgSend(v9, "autoFillPasskey");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          goto LABEL_13;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      v12 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_14:

  objc_msgSend(v4, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    v15 = a1[4];
  }
  else
  {
    objc_msgSend(v13, "protectionSpace");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  objc_msgSend(v15, "host");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(a1[5], "countForObject:", v17) >= 2)
  {
    objc_msgSend(v16, "safari_addressString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "safari_simplifiedUserVisibleURLString");
    v19 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v19;
  }
  objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "enabledExtensions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22 == 1)
  {
    objc_msgSend(MEMORY[0x1E0D8A020], "sharedFeatureManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "shouldAutoFillPasswordsFromKeychain");

  }
  objc_msgSend(v14, "autoFillPasskey");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    detailStringForPasskey(v14);
    v25 = objc_claimAutoreleasedReturnValue();
LABEL_31:
    v35 = (void *)v25;
    goto LABEL_32;
  }
  if (v12)
  {
    objc_msgSend(v14, "customTitle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "length");

    if (!v27)
    {
      _WBSLocalizedString();
      v25 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
LABEL_28:
    objc_msgSend(v14, "customTitle");
    v25 = objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v14, "customTitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "length");

    if (v29)
      goto LABEL_28;
    v34 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", v31, v17);
    v33 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v4, "count");
    objc_msgSend(v30, "localizedStringWithFormat:", v31, v17, v32, (_QWORD)v39);
    v33 = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v33;

LABEL_32:
  if (objc_msgSend(a1[6], "length"))
  {
    v36 = 0;
  }
  else
  {
    objc_msgSend(v16, "safari_creationDateOfCredentialWithUser:", &stru_1E4AC8470);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37 = -[SFCredentialDisplayData initWithMatch:detail:creationDate:]([SFCredentialDisplayData alloc], "initWithMatch:detail:creationDate:", v14, v35, v36);
  v38 = 8;
  if (v12)
    v38 = 7;
  objc_msgSend(a1[v38], "addObject:", v37);

}

uint64_t __192__SFFormAutocompleteState__getMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_withFormURL_credentialMatches_lastGeneratedPassword_currentUser_currentPassword_forUserNamesOnly___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "match");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "match");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __192__SFFormAutocompleteState__getMatchesFromFormProtectionSpace_matchesFromOtherProtectionSpaces_withFormURL_credentialMatches_lastGeneratedPassword_currentUser_currentPassword_forUserNamesOnly___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "match");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "match");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)_offerToAutoFillFromPotentialCredentialMatches
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int IsPad;
  uint64_t v9;
  uint64_t v10;
  SFFormAutocompleteState *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD);
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void (**v26)(_QWORD);
  void *v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  BOOL v31;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v54[4];
  id v55;
  id v56;
  SFFormAutocompleteState *v57;
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[5];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[4];
  id v67;
  SFFormAutocompleteState *v68;
  id v69;
  uint64_t *v70;
  BOOL v71;
  _QWORD v72[6];
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  id v79;
  id v80;
  __int16 v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v81 = 0;
  v80 = 0;
  v79 = 0;
  -[SFFormAutocompleteState _getLoginFormUser:password:userIsAutoFilled:passwordIsAutoFilled:](self, "_getLoginFormUser:password:userIsAutoFilled:passwordIsAutoFilled:", &v80, &v79, (char *)&v81 + 1, &v81);
  v42 = v80;
  v43 = v79;
  v73 = 0;
  v74 = &v73;
  v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__127;
  v77 = __Block_byref_object_dispose__128;
  v78 = 0;
  -[SFFormAutocompleteState _cachedPotentialCredentialMatches](self, "_cachedPotentialCredentialMatches");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  objc_msgSend(WeakRetained, "webView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v50, "webui_lastGeneratedPasswordForCurrentBackForwardItem");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "webui_presentingViewController");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSFormMetadata passwordElementUniqueID](self->_formMetadata, "passwordElementUniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  objc_msgSend(MEMORY[0x1E0D8A020], "sharedFeatureManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v5, "shouldAutoFillPasswordsFromKeychain");

  if ((_DWORD)v3)
  {
    LOBYTE(v38) = v4 == 0;
    +[SFFormAutocompleteState _getMatchesFromFormProtectionSpace:matchesFromOtherProtectionSpaces:withFormURL:credentialMatches:lastGeneratedPassword:currentUser:currentPassword:forUserNamesOnly:](SFFormAutocompleteState, "_getMatchesFromFormProtectionSpace:matchesFromOtherProtectionSpaces:withFormURL:credentialMatches:lastGeneratedPassword:currentUser:currentPassword:forUserNamesOnly:", v48, v47, v51, v45, v44, v42, v43, v38);
  }
  objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enabledExtensions");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFFormAutocompleteState externalCredentialIdentities](self, "externalCredentialIdentities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IsPad = _SFDeviceIsPad();
  v9 = MEMORY[0x1E0C809B0];
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke;
  v72[3] = &unk_1E4AC3D40;
  v72[4] = self;
  v72[5] = &v73;
  +[SFFormAutoFillMultipleLoginsAlertController alertControllerWithMatchesFromFormProtectionSpace:matchesFromOtherProtectionSpaces:externalCredentials:preferredStyle:formURL:completionHandler:](SFFormAutoFillMultipleLoginsAlertController, "alertControllerWithMatchesFromFormProtectionSpace:matchesFromOtherProtectionSpaces:externalCredentials:preferredStyle:formURL:completionHandler:", v48, v47, v7, IsPad, v51, v72);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    v66[0] = v9;
    v66[1] = 3221225472;
    v66[2] = __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_2;
    v66[3] = &unk_1E4AC3DE0;
    v67 = v51;
    v68 = self;
    v71 = v4 == 0;
    v70 = &v73;
    v40 = v46;
    v69 = v40;
    v41 = (void *)MEMORY[0x1A8598C40](v66);
    _WBSLocalizedString();
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = self;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v52, "count"))
    {
      v39 = (void *)v10;
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v13 = v52;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v63;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v63 != v15)
              objc_enumerationMutation(v13);
            v17 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
            v61[0] = v9;
            v61[1] = 3221225472;
            v61[2] = __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_3;
            v61[3] = &unk_1E4ABFC78;
            v61[4] = &v73;
            -[SFFormAutocompleteState _actionForPresentingPasswordManagerExtension:completionHandler:](self, "_actionForPresentingPasswordManagerExtension:completionHandler:", v17, v61);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v18);

          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
        }
        while (v14);
      }

      if (!objc_msgSend(MEMORY[0x1E0D8A8F8], "isPasswordManagerAppEnabled"))
        objc_msgSend(MEMORY[0x1E0DD9910], "keychainSyncEnabled");
      _WBSLocalizedString();
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = self;
    }
    v19 = (void *)MEMORY[0x1E0DC3448];
    v59[0] = v9;
    v59[1] = 3221225472;
    v59[2] = __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_4;
    v59[3] = &unk_1E4AC01E0;
    v20 = v41;
    v60 = v20;
    v21 = (void *)v10;
    objc_msgSend(v19, "actionWithTitle:style:handler:", v10, 0, v59);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v9;
    v54[1] = 3221225472;
    v54[2] = __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_5;
    v54[3] = &unk_1E4AC06B8;
    v23 = v12;
    v55 = v23;
    v24 = v49;
    v56 = v24;
    v57 = v11;
    v25 = v22;
    v58 = v25;
    v26 = (void (**)(_QWORD))MEMORY[0x1A8598C40](v54);
    -[SFFormAutocompleteState externalCredentialIdentities](self, "externalCredentialIdentities");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");

    v29 = objc_msgSend(v52, "count");
    objc_msgSend(MEMORY[0x1E0D8A020], "sharedFeatureManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = objc_msgSend(v30, "shouldAutoFillPasswordsFromKeychain");
    v31 = v28 < 2;

    if (v29 + v19 < 2 && v31)
    {
      objc_msgSend(v50, "webui_preventNavigationDuringAutoFillPrompt");
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v74[5];
      v74[5] = v33;

      if (objc_msgSend(v52, "count"))
      {
        objc_msgSend(v52, "firstObject");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFFormAutocompleteState _presentCredentialListForExtension:completionHandler:](self, "_presentCredentialListForExtension:completionHandler:", v35, v74[5]);

      }
      else
      {
        v20[2](v20);
      }
    }
    else
    {
      v26[2](v26);
      objc_msgSend(v50, "webui_preventNavigationDuringAutoFillPrompt");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v74[5];
      v74[5] = v36;

      -[SFFormAutocompleteState _presentViewController:presentingViewController:animated:completion:](self, "_presentViewController:presentingViewController:animated:completion:", v24, v40, 1, 0);
    }

  }
  _Block_object_dispose(&v73, 8);

}

void __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_fillSavedAccountMatchAfterAuthenticationIfNeeded:setAsDefaultCredential:submitForm:", v3, 1, 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_fillCredentialIdentity:submitForm:", v3, 0);
    }
    else if (v3)
    {
      __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();

}

void __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  SFAccountPickerConfiguration *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  SFAccountPickerViewController *v24;
  uint64_t v25;
  SFAccountPickerViewController *v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  id WeakRetained;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  SFAccountPickerViewController *v49;
  id v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  id v54;
  _QWORD v55[6];
  id v56;
  id v57;
  _QWORD v58[2];
  _QWORD v59[2];
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  id v63;
  __int16 v64;
  id v65;
  _QWORD v66[4];

  v66[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "safari_userVisibleString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_highLevelDomainFromHost");
  v4 = objc_claimAutoreleasedReturnValue();

  v47 = (void *)v4;
  if (v4)
  {
    v66[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v56 = 0;
  v57 = 0;
  objc_msgSend(MEMORY[0x1E0D8AAA8], "getHintStringsForAppID:appNames:matchedSites:urlString:outServiceNameHintStrings:outDomainHintStrings:", 0, 0, v5, 0, &v57, &v56);
  v6 = v57;
  v7 = v56;
  v8 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v40 = v8;
    v41 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 134218498;
    v61 = v41;
    v62 = 2112;
    v63 = v6;
    v64 = 2112;
    v65 = v7;
    _os_log_debug_impl(&dword_1A3B2D000, v40, OS_LOG_TYPE_DEBUG, "Requested hint strings for number of matchedSites %lu, got service name hint strings: %@ and domain hint strings: %@", buf, 0x20u);

  }
  v45 = v5;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
  v9 = objc_alloc_init(SFAccountPickerConfiguration);
  v10 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v11, v46);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountPickerConfiguration setPrompt:](v9, "setPrompt:", v12);

  v13 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v14, v46);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountPickerConfiguration setPromptWhenPasskeysAreAvailable:](v9, "setPromptWhenPasskeysAreAvailable:", v15);

  -[SFAccountPickerConfiguration setMinimumNumberOfCredentialsToShowLikelyMatchesSection:](v9, "setMinimumNumberOfCredentialsToShowLikelyMatchesSection:", 10);
  -[SFAccountPickerConfiguration setForUserNamesOnly:](v9, "setForUserNamesOnly:", *(unsigned __int8 *)(a1 + 64));
  v44 = v6;
  -[SFAccountPickerConfiguration setServiceNameHintStrings:](v9, "setServiceNameHintStrings:", v6);
  v43 = v7;
  -[SFAccountPickerConfiguration setDomainHintStrings:](v9, "setDomainHintStrings:", v7);
  -[SFAccountPickerConfiguration setShouldEnableAddingNewPasswordsIfPossible:](v9, "setShouldEnableAddingNewPasswordsIfPossible:", 1);
  v16 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 232), "ancestorFrameURLs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "frameIsKnownToAskForCredentialsFromOtherServicesFromAncestorFrameURLs:", v17);

  if ((v18 & 1) == 0)
    -[SFAccountPickerConfiguration setAddPasswordSuggestedDomain:](v9, "setAddPasswordSuggestedDomain:", v4);
  objc_msgSend(MEMORY[0x1E0D00358], "sharedManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isDeviceConfiguredToAllowPasskeys");

  -[SFAccountPickerConfiguration setShouldShowAutoFillPasskeys:](v9, "setShouldShowAutoFillPasskeys:", v20);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "frameHandle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "webFrameIdentifier");
  v22 = objc_claimAutoreleasedReturnValue();
  -[SFAccountPickerConfiguration setCurrentWebFrameIdentifierForAutoFillPasskeys:](v9, "setCurrentWebFrameIdentifierForAutoFillPasskeys:", v22);

  -[SFAccountPickerConfiguration setShouldShowPasskeysInAccountPicker:](v9, "setShouldShowPasskeysInAccountPicker:", v20);
  objc_msgSend(WeakRetained, "savedAccountContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountPickerConfiguration setSavedAccountContext:](v9, "setSavedAccountContext:", v23);

  v24 = [SFAccountPickerViewController alloc];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_153;
  v55[3] = &unk_1E4AC3D68;
  v25 = *(_QWORD *)(a1 + 56);
  v55[4] = *(_QWORD *)(a1 + 40);
  v55[5] = v25;
  v26 = -[SFAccountPickerViewController initWithConfiguration:completionHandler:](v24, "initWithConfiguration:completionHandler:", v9, v55);
  -[SFAccountPickerViewController setModalPresentationStyle:](v26, "setModalPresentationStyle:", 2);
  v27 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
  v28 = WBSAuthenticationPolicyForPasswordManager();
  v54 = 0;
  LOBYTE(v22) = objc_msgSend(v27, "canEvaluatePolicy:error:", v28, &v54);
  v29 = v54;
  v30 = v29;
  if ((v22 & 1) != 0)
  {
    v58[0] = &unk_1E4B25C78;
    +[SFAutoFillAuthenticationUtilities passcodePromptForViewingSavedAccounts](SFAutoFillAuthenticationUtilities, "passcodePromptForViewingSavedAccounts");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = &unk_1E4B25C90;
    v59[0] = v31;
    +[SFAutoFillAuthenticationUtilities customAuthenticationTitleForViewingSavedAccounts](SFAutoFillAuthenticationUtilities, "customAuthenticationTitleForViewingSavedAccounts");
    v32 = v30;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = v32;
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_158;
    v48[3] = &unk_1E4AC3DB8;
    v49 = v26;
    v35 = v27;
    v36 = *(_QWORD *)(a1 + 40);
    v37 = *(void **)(a1 + 48);
    v50 = v35;
    v51 = v36;
    v38 = v37;
    v39 = *(_QWORD *)(a1 + 56);
    v52 = v38;
    v53 = v39;
    objc_msgSend(v35, "evaluatePolicy:options:reply:", v28, v34, v48);

  }
  else if (objc_msgSend(v29, "code") == -5)
  {
    objc_msgSend(*(id *)(a1 + 40), "_presentViewController:presentingViewController:animated:completion:", v26, *(_QWORD *)(a1 + 48), 1, 0);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) + 16))();
  }

}

void __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_153(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_fillSavedAccount:setAutoFilled:setAsDefaultCredential:focusFieldAfterFilling:submitForm:", v3, 1, 0, 0, 0);
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();

}

void __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_158(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;

  v4 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_2_159;
  v11[3] = &unk_1E4AC3D90;
  v12 = v4;
  v13 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v14 = v5;
  v15 = v6;
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 64);
  v16 = v8;
  v17 = v9;
  v10 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

uint64_t __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_2_159(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "setAuthenticatedContext:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 56), "_presentViewController:presentingViewController:animated:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), 1, 0);
}

uint64_t __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_5(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;
  int v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "addAction:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6++), (_QWORD)v9);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 24));
  v8 = objc_msgSend(WeakRetained, "shouldAutoFillPasswords");

  if (v8)
    objc_msgSend(*(id *)(a1 + 40), "addAction:", *(_QWORD *)(a1 + 56));
}

- (void)_addActionForAlertController:(id)a3 title:(id)a4 detail:(id)a5 handler:(id)a6
{
  id v9;
  id v10;

  v9 = a3;
  +[SFMultipleLineAlertAction actionWithTitle:detail:handler:](SFMultipleLineAlertAction, "actionWithTitle:detail:handler:", a4, a5, a6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v10);

}

- (void)_offerToAutoFillFromAvailableOneTimeCodes
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D8A040]);
  -[WBSFormControlMetadata ancestorFrameURLs](self->_textFieldMetadata, "ancestorFrameURLs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    objc_msgSend(v5, "host");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(v5, "host");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_highLevelDomainForPasswordManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__SFFormAutocompleteState__offerToAutoFillFromAvailableOneTimeCodes__block_invoke;
    v12[3] = &unk_1E4ABFD00;
    v12[4] = self;
    objc_msgSend(v3, "fetchOneTimeCodeCredentialIdentitiesMatchingDomains:completion:", v11, v12);

  }
  else
  {
    -[SFFormAutocompleteState _buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities:](self, "_buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities:", MEMORY[0x1E0C9AA60]);
  }

}

uint64_t __68__SFFormAutocompleteState__offerToAutoFillFromAvailableOneTimeCodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities:", a2);
}

- (void)_buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  NSObject *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  char v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id WeakRetained;
  void *v64;
  void *v65;
  id obj;
  uint64_t v67;
  uint64_t v68;
  SFFormAutocompleteState *v69;
  void *v70;
  id i;
  id v72;
  _QWORD v73[5];
  _QWORD v74[5];
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[5];
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[4];
  NSObject *v87;
  void *v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id location;
  _BYTE v99[21];
  _BYTE v100[128];
  uint8_t v101[4];
  uint64_t v102;
  uint8_t buf[4];
  void *v104;
  _BYTE v105[128];
  uint8_t v106[4];
  uint64_t v107;
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v69 = self;
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  objc_msgSend(WeakRetained, "oneTimeCodeProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSFormControlMetadata ancestorFrameURLs](self->_textFieldMetadata, "ancestorFrameURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WBSFormControlMetadata oneTimeCodeFieldClassification](v69->_textFieldMetadata, "oneTimeCodeFieldClassification");
  objc_msgSend(WeakRetained, "savedAccountContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentOneTimeCodesForWebBrowserWithWebsiteFrameURLs:fieldClassification:inContext:", v6, v7, v8);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFFormAutoFillFrameHandle webui_URL](v69->_frame, "webui_URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safari_userVisibleString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0DC3450];
  v12 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v13, v62);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", 0, v14, 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSFormControlMetadata ancestorFrameURLs](v69->_textFieldMetadata, "ancestorFrameURLs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastObject");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "getEnabledExtensionsSynchronously");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  obj = v4;
  v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v108, 16);
  if (v68)
  {
    v67 = *(_QWORD *)v95;
    do
    {
      for (i = 0; i != (id)v68; i = (char *)i + 1)
      {
        if (*(_QWORD *)v95 != v67)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v17, "type") == 4)
        {
          v92 = 0u;
          v93 = 0u;
          v90 = 0u;
          v91 = 0u;
          v18 = v65;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
          if (v19)
          {
            v20 = *(_QWORD *)v91;
LABEL_9:
            v21 = 0;
            while (1)
            {
              if (*(_QWORD *)v91 != v20)
                objc_enumerationMutation(v18);
              v22 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v21);
              objc_msgSend(v22, "sf_bundleIdentifierForContainingApp");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "owningExtensionState");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "providerBundleID");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v23, "isEqualToString:", v25);

              if ((v26 & 1) != 0)
                break;
              if (v19 == ++v21)
              {
                v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
                if (v19)
                  goto LABEL_9;
                goto LABEL_15;
              }
            }
            v27 = v22;

            if (!v27)
              goto LABEL_21;
            objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "extensionSupportsOneTimeCodes:", v27);

            if ((v30 & 1) != 0)
            {
              objc_msgSend(v17, "user");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D8A060], "titleForCredentialIdentity:formURL:", v17, v64);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v86[0] = MEMORY[0x1E0C809B0];
              v86[1] = 3221225472;
              v86[2] = __102__SFFormAutocompleteState__buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities___block_invoke;
              v86[3] = &unk_1E4ABFFE8;
              objc_copyWeak(&v89, &location);
              v27 = v27;
              v87 = v27;
              v88 = v17;
              -[SFFormAutocompleteState _addActionForAlertController:title:detail:handler:](v69, "_addActionForAlertController:title:detail:handler:", v70, v31, v32, v86);

              objc_destroyWeak(&v89);
            }
            else
            {
              v35 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                -[NSObject identifier](v27, "identifier");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFFormAutocompleteState _buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities:].cold.1(v36, v101, &v102, v35);
              }

            }
          }
          else
          {
LABEL_15:

LABEL_21:
            v27 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v17, "owningExtensionState");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "providerBundleID");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v104 = v34;
              _os_log_error_impl(&dword_1A3B2D000, v27, OS_LOG_TYPE_ERROR, "failed to find enabled extension matching credential identity, expected %{public}@", buf, 0xCu);

            }
          }
        }
        else
        {
          v27 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v17, "type");
            SFStringFromCredentialIdentityType();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFFormAutocompleteState _buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities:].cold.2(v28, v106, &v107, v27);
          }
        }

      }
      v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v108, 16);
    }
    while (v68);
  }

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v72 = v61;
  v37 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v82, v100, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v83;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v83 != v38)
          objc_enumerationMutation(v72);
        v40 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * j);
        objc_msgSend(v40, "localizedSubtitleForContext:", 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "localizedTitleForContext:", 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v80[0] = MEMORY[0x1E0C809B0];
        v80[1] = 3221225472;
        v80[2] = __102__SFFormAutocompleteState__buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities___block_invoke_2;
        v80[3] = &unk_1E4AC0888;
        objc_copyWeak(&v81, &location);
        v80[4] = v40;
        -[SFFormAutocompleteState _addActionForAlertController:title:detail:handler:](v69, "_addActionForAlertController:title:detail:handler:", v70, v41, v42, v80);

        objc_destroyWeak(&v81);
      }
      v37 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v82, v100, 16);
    }
    while (v37);
  }

  v79 = 0u;
  v77 = 0u;
  v78 = 0u;
  v76 = 0u;
  v43 = v65;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v76, v99, 16);
  if (v44)
  {
    v45 = *(_QWORD *)v77;
    do
    {
      for (k = 0; k != v44; ++k)
      {
        if (*(_QWORD *)v77 != v45)
          objc_enumerationMutation(v43);
        v47 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * k);
        objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "extensionSupportsOneTimeCodes:", v47);

        if ((v49 & 1) != 0)
        {
          v50 = objc_alloc(MEMORY[0x1E0CA5870]);
          objc_msgSend(v47, "sf_bundleIdentifierForContainingApp");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = (void *)objc_msgSend(v50, "initWithBundleIdentifier:allowPlaceholder:error:", v51, 0, 0);
          objc_msgSend(v52, "localizedName");
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          v54 = (void *)MEMORY[0x1E0DC3448];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@…"), v53);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v74[0] = MEMORY[0x1E0C809B0];
          v74[1] = 3221225472;
          v74[2] = __102__SFFormAutocompleteState__buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities___block_invoke_3;
          v74[3] = &unk_1E4AC0888;
          objc_copyWeak(&v75, &location);
          v74[4] = v47;
          objc_msgSend(v54, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v55, 0, 0, v74, &__block_literal_global_182_0);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "addAction:", v56);

          objc_destroyWeak(&v75);
        }
      }
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v76, v99, 16);
    }
    while (v44);
  }

  v57 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = MEMORY[0x1E0C809B0];
  v73[1] = 3221225472;
  v73[2] = __102__SFFormAutocompleteState__buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities___block_invoke_5;
  v73[3] = &unk_1E4AC0010;
  v73[4] = v69;
  objc_msgSend(v57, "actionWithTitle:style:handler:", v58, 1, v73);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "addAction:", v59);

  -[SFFormAutocompleteState _viewControllerToPresentFrom](v69, "_viewControllerToPresentFrom");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFFormAutocompleteState _presentViewController:presentingViewController:animated:completion:](v69, "_presentViewController:presentingViewController:animated:completion:", v70, v60, 1, 0);

  objc_destroyWeak(&location);
}

void __102__SFFormAutocompleteState__buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = objc_alloc(MEMORY[0x1E0C92640]);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_alloc(MEMORY[0x1E0C925C8]);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C925C0]), "_initWithFoundationCredentialIdentity:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_msgSend(v4, "initWithCredentialIdentity:", v5);
    v7 = objc_msgSend(v2, "initWithExtension:oneTimeCodeCredentialRequest:", v3, v6);
    v8 = WeakRetained[19];
    WeakRetained[19] = (id)v7;

    objc_msgSend(WeakRetained[19], "setDelegate:");
    objc_msgSend(WeakRetained[19], "setDismissOnBackground:", 1);
  }

}

void __102__SFFormAutocompleteState__buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_fillOneTimeCodeAfterAuthenticationIfNeeded:inFrame:shouldSubmit:", *(_QWORD *)(a1 + 32), WeakRetained[27], objc_msgSend(WeakRetained[29], "oneTimeCodeIsEligibleForAutomaticLogin"));
    WeakRetained = v3;
  }

}

void __102__SFFormAutocompleteState__buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = objc_alloc(MEMORY[0x1E0C92648]);
    v3 = (void *)objc_msgSend(v2, "initOneTimeCodeCredentialListWithExtension:serviceIdentifiers:", *(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AA60]);
    objc_msgSend(v3, "setDelegate:", WeakRetained);
    objc_msgSend(v3, "setDismissOnBackground:", 1);
    objc_msgSend(WeakRetained, "_viewControllerToPresentFrom");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentViewController:animated:completion:", v3, 1, 0);

  }
}

uint64_t __102__SFFormAutocompleteState__buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities___block_invoke_4()
{
  return 1;
}

uint64_t __102__SFFormAutocompleteState__buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setShowingKeyboardInputView:", 1);
}

- (void)_fillSavedAccountMatchAfterAuthenticationIfNeeded:(id)a3 setAsDefaultCredential:(BOOL)a4 submitForm:(BOOL)a5
{
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;
  BOOL v19;

  v8 = a3;
  objc_msgSend(v8, "autoFillPasskey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  objc_msgSend(v8, "user");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "shouldRequireUserVerification");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __111__SFFormAutocompleteState__fillSavedAccountMatchAfterAuthenticationIfNeeded_setAsDefaultCredential_submitForm___block_invoke;
  v15[3] = &unk_1E4AC3E28;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = a4;
  v19 = a5;
  v13 = v8;
  v14 = v9;
  objc_msgSend(WeakRetained, "authenticateIfNeededForAutoFillAuthenticationType:user:shouldForceAuthentication:withCompletion:", v9 != 0, v11, v12, v15);

}

void __111__SFFormAutocompleteState__fillSavedAccountMatchAfterAuthenticationIfNeeded_setAsDefaultCredential_submitForm___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    v7 = WeakRetained;
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(WeakRetained, "savedAccountContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(void **)(v9 + 192);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __111__SFFormAutocompleteState__fillSavedAccountMatchAfterAuthenticationIfNeeded_setAsDefaultCredential_submitForm___block_invoke_2;
      v12[3] = &unk_1E4ABFE00;
      v13 = v7;
      objc_msgSend(v11, "userSelectedAutoFillPasskey:authenticatedLAContext:savedAccountContext:completionHandler:", v10, v5, v8, v12);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "savedAccount");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_fillSavedAccount:setAutoFilled:setAsDefaultCredential:focusFieldAfterFilling:submitForm:", v8, 1, *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(unsigned __int8 *)(a1 + 57));
    }

  }
}

void __111__SFFormAutocompleteState__fillSavedAccountMatchAfterAuthenticationIfNeeded_setAsDefaultCredential_submitForm___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__SFFormAutocompleteState__fillSavedAccountMatchAfterAuthenticationIfNeeded_setAsDefaultCredential_submitForm___block_invoke_3;
  block[3] = &unk_1E4ABFE00;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __111__SFFormAutocompleteState__fillSavedAccountMatchAfterAuthenticationIfNeeded_setAsDefaultCredential_submitForm___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didCompleteWithPasskey");
}

- (void)_fillCredentialAfterAuthenticationIfNeeded:(id)a3 setAsDefaultCredential:(BOOL)a4 submitForm:(BOOL)a5
{
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;
  BOOL v15;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  objc_msgSend(v8, "user");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __104__SFFormAutocompleteState__fillCredentialAfterAuthenticationIfNeeded_setAsDefaultCredential_submitForm___block_invoke;
  v12[3] = &unk_1E4AC3E50;
  v12[4] = self;
  v13 = v8;
  v14 = a4;
  v15 = a5;
  v11 = v8;
  objc_msgSend(WeakRetained, "authenticateIfNeededForAutoFillAuthenticationType:user:shouldForceAuthentication:withCompletion:", 0, v10, 0, v12);

}

uint64_t __104__SFFormAutocompleteState__fillCredentialAfterAuthenticationIfNeeded_setAsDefaultCredential_submitForm___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_fillCredential:setAutoFilled:setAsDefaultCredential:focusFieldAfterFilling:submitForm:", *(_QWORD *)(result + 40), 1, *(unsigned __int8 *)(result + 48), *(unsigned __int8 *)(result + 49), *(unsigned __int8 *)(result + 49));
  return result;
}

- (void)_fillOneTimeCodeAfterAuthenticationIfNeeded:(id)a3 inFrame:(id)a4 shouldSubmit:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  unint64_t v13;
  id WeakRetained;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  BOOL v20;
  id location;

  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __92__SFFormAutocompleteState__fillOneTimeCodeAfterAuthenticationIfNeeded_inFrame_shouldSubmit___block_invoke;
  v16[3] = &unk_1E4AC3E78;
  objc_copyWeak(&v19, &location);
  v10 = v9;
  v17 = v10;
  v11 = v8;
  v18 = v11;
  v20 = a5;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8598C40](v16);
  v13 = objc_msgSend(v11, "source");
  if (v13 >= 2)
  {
    if (v13 == 2)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
      objc_msgSend(v11, "user");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "authenticateIfNeededForAutoFillAuthenticationType:user:shouldForceAuthentication:withCompletion:", 5, v15, 0, v12);

    }
  }
  else
  {
    v12[2](v12, 1, 0);
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __92__SFFormAutocompleteState__fillOneTimeCodeAfterAuthenticationIfNeeded_inFrame_shouldSubmit___block_invoke(uint64_t a1, int a2)
{
  id *WeakRetained;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id *v8;

  if (a2)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      v8 = WeakRetained;
      v4 = objc_loadWeakRetained(WeakRetained + 2);
      v5 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "code");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "autoFillOneTimeCodeFieldsInFrame:withValue:shouldSubmit:", v5, v6, *(unsigned __int8 *)(a1 + 56));

      objc_msgSend(v4, "oneTimeCodeProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "consumeOneTimeCode:", *(_QWORD *)(a1 + 40));

      objc_msgSend(v8, "updateSuggestions");
      WeakRetained = v8;
    }

  }
}

- (void)_suggestLoginCredentialsShowingQuickTypeKey:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  int v17;
  id *v18;
  id *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  _QWORD v21[4];
  void (**v22)(_QWORD, _QWORD, _QWORD);
  uint64_t *v23;
  uint64_t *v24;
  _QWORD v25[4];
  NSObject *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD block[4];
  id v35;
  id v36;
  SFFormAutocompleteState *v37;
  NSObject *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _QWORD v46[4];
  id v47;
  BOOL v48;
  id location;
  _QWORD v50[3];

  v3 = a3;
  v50[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  if (!self->_fetchingLoginCredentialSuggestions)
  {
    self->_fetchingLoginCredentialSuggestions = 1;
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __71__SFFormAutocompleteState__suggestLoginCredentialsShowingQuickTypeKey___block_invoke;
    v46[3] = &unk_1E4AC3EA0;
    v18 = &v47;
    objc_copyWeak(&v47, &location);
    v48 = v3;
    v20 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8598C40](v46);
    if (v3)
    {
      self->_quickTypeBarTrailingButtonPurpose = 0;
      objc_msgSend(MEMORY[0x1E0DC34B8], "autofillExtrasSuggestion", &v47);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFFormAutoFillInputSession formInputSession](self->_inputSession, "formInputSession");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSuggestions:", v6);

    }
    v8 = dispatch_group_create();
    -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__4;
    v44 = __Block_byref_object_dispose__4;
    v45 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "host");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safari_domainFromHost");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safari_highLevelDomainFromHost");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v10, "addObject:", v12);
    if (v13)
      objc_msgSend(v10, "addObject:", v13);
    v14 = objc_msgSend(v10, "count", v18);
    if (v14)
    {
      dispatch_group_enter(v8);
      dispatch_get_global_queue(33, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __71__SFFormAutocompleteState__suggestLoginCredentialsShowingQuickTypeKey___block_invoke_2;
      block[3] = &unk_1E4AC3EC8;
      v35 = v10;
      v36 = v9;
      v37 = self;
      v39 = &v40;
      v38 = v8;
      dispatch_async(v15, block);

    }
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__4;
    v32 = __Block_byref_object_dispose__4;
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0D8A020], "sharedFeatureManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "shouldAutoFillPasswordsFromKeychain");

    if (v17)
    {
      dispatch_group_enter(v8);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __71__SFFormAutocompleteState__suggestLoginCredentialsShowingQuickTypeKey___block_invoke_4;
      v25[3] = &unk_1E4AC3AC8;
      v27 = &v28;
      v26 = v8;
      -[SFFormAutocompleteState _getMatchingKeychainCredentialsIncludingCredentialsWithEmptyUsernames:withCompletion:](self, "_getMatchingKeychainCredentialsIncludingCredentialsWithEmptyUsernames:withCompletion:", 1, v25);

    }
    else if (!v14)
    {
      v20[2](v20, v29[5], v41[5]);
      goto LABEL_14;
    }
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __71__SFFormAutocompleteState__suggestLoginCredentialsShowingQuickTypeKey___block_invoke_5;
    v21[3] = &unk_1E4AC3EF0;
    v22 = v20;
    v23 = &v28;
    v24 = &v40;
    dispatch_group_notify(v8, MEMORY[0x1E0C80D38], v21);

LABEL_14:
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&v40, 8);
    objc_destroyWeak(v19);
  }
  objc_destroyWeak(&location);
}

void __71__SFFormAutocompleteState__suggestLoginCredentialsShowingQuickTypeKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BYTE *WeakRetained;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  id v49;
  id obj;
  id obja;
  void *v52;
  id v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[104] = 0;
    if (!WeakRetained[105])
    {
      obj = a3;
      v45 = a1;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)*((_QWORD *)v8 + 9);
      v47 = v5;
      if (v10)
      {
        v11 = v10;
      }
      else
      {
        v12 = objc_loadWeakRetained((id *)v8 + 3);
        v13 = (void *)objc_opt_class();
        objc_msgSend(*((id *)v8 + 28), "userNameElementUniqueID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "valueOfControlWithUniqueID:inForm:", v14, *((_QWORD *)v8 + 28));
        v11 = (id)objc_claimAutoreleasedReturnValue();

      }
      v54 = objc_msgSend(v11, "length");
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v46 = v6;
      v15 = v6;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      v53 = v11;
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v60;
LABEL_8:
        v19 = 0;
        while (1)
        {
          if (*(_QWORD *)v60 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v19);
          if (objc_msgSend(v9, "count"))
            break;
          objc_msgSend(v20, "user");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (v54 && !objc_msgSend(v21, "safari_hasCaseInsensitivePrefix:", v11))
          {
            objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("@"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "firstObject");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v22, "safari_hasCaseInsensitivePrefix:", v23))
            {
              objc_msgSend(v8, "_textSuggestionForExternalCredentialIdentity:submitForm:", v20, 0);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "addObject:", v25);

            }
            v11 = v53;
          }
          else
          {
            objc_msgSend(v8, "_textSuggestionForExternalCredentialIdentity:submitForm:", v20, 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v23);
          }

          if (v17 == ++v19)
          {
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
            if (v17)
              goto LABEL_8;
            break;
          }
        }
      }

      objc_storeStrong((id *)v8 + 18, obj);
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v26 = v47;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v56;
        v48 = *(_QWORD *)v56;
        v49 = v26;
LABEL_22:
        v30 = 0;
        obja = (id)v28;
        while (1)
        {
          if (*(_QWORD *)v56 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v30);
          if (objc_msgSend(v9, "count"))
            break;
          objc_msgSend(v31, "match");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "user");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v54 && !objc_msgSend(v33, "safari_hasCaseInsensitivePrefix:", v11))
          {
            v35 = v8;
            objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("@"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "firstObject");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            v37 = objc_msgSend(v33, "safari_hasCaseInsensitivePrefix:", v34);
            objc_msgSend(v31, "match");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "autoFillPasskey");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "requestUsedNonEmptyAllowList");

            if ((v37 & 1) != 0 || v40)
            {
              v8 = v35;
              objc_msgSend(v35, "_textSuggestionForCredentialDisplayData:submitForm:", v31, 0);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "addObject:", v41);

            }
            else
            {
              v8 = v35;
            }
            v11 = v53;
            v29 = v48;
            v26 = v49;
            v28 = (uint64_t)obja;
          }
          else
          {
            objc_msgSend(v8, "_textSuggestionForCredentialDisplayData:submitForm:", v31, 0);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v34);
          }

          if (v28 == ++v30)
          {
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
            if (v28)
              goto LABEL_22;
            break;
          }
        }
      }

      objc_msgSend(v9, "addObjectsFromArray:", v52);
      if (*(_BYTE *)(v45 + 40))
        objc_msgSend(v8, "_addPasswordsAutoFillSuggestionToSuggestions:forPurpose:", v9, 0);
      objc_msgSend(*((id *)v8 + 8), "formInputSession");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_loadWeakRetained((id *)v8 + 2);
      objc_msgSend(*((id *)v8 + 29), "uniqueID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "reportAutoFillOfferedType:forTextFieldWithID:forFormMetadata:", 1, v44, *((_QWORD *)v8 + 28));

      objc_msgSend(v42, "setSuggestions:", v9);
      v6 = v46;
      v5 = v47;
    }
  }

}

void __71__SFFormAutocompleteState__suggestLoginCredentialsShowingQuickTypeKey___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 64), "frameHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webFrameIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__SFFormAutocompleteState__suggestLoginCredentialsShowingQuickTypeKey___block_invoke_3;
  v8[3] = &unk_1E4AC3AC8;
  v7 = *(_OWORD *)(a1 + 56);
  v6 = (id)v7;
  v9 = v7;
  +[_SFFormAutoFillController _getExternalLoginCredentialSuggestionsForDomains:pageURL:webFrameIdentifier:completion:](_SFFormAutoFillController, "_getExternalLoginCredentialSuggestionsForDomains:pageURL:webFrameIdentifier:completion:", v2, v3, v5, v8);

}

void __71__SFFormAutocompleteState__suggestLoginCredentialsShowingQuickTypeKey___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __71__SFFormAutocompleteState__suggestLoginCredentialsShowingQuickTypeKey___block_invoke_4(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __71__SFFormAutocompleteState__suggestLoginCredentialsShowingQuickTypeKey___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)_addPasswordsAutoFillSuggestionToSuggestions:(id)a3 forPurpose:(int64_t)a4
{
  void *v4;
  id v5;
  id v6;

  self->_quickTypeBarTrailingButtonPurpose = a4;
  v4 = (void *)MEMORY[0x1E0DC34B8];
  v5 = a3;
  objc_msgSend(v4, "autofillExtrasSuggestion");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

- (void)_getMatchingKeychainCredentialsIncludingCredentialsWithEmptyUsernames:(BOOL)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  SFFormAutocompleteState *v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;
  id v27;
  id v28;
  __int16 v29;

  v6 = a4;
  -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v27 = 0;
  v28 = 0;
  -[SFFormAutocompleteState _getLoginFormUser:password:userIsAutoFilled:passwordIsAutoFilled:](self, "_getLoginFormUser:password:userIsAutoFilled:passwordIsAutoFilled:", &v28, &v27, (char *)&v29 + 1, &v29);
  v10 = v28;
  v11 = v27;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __112__SFFormAutocompleteState__getMatchingKeychainCredentialsIncludingCredentialsWithEmptyUsernames_withCompletion___block_invoke;
  v18[3] = &unk_1E4AC3F58;
  v26 = a3;
  v19 = v8;
  v20 = v9;
  v21 = v7;
  v22 = self;
  v23 = v10;
  v24 = v11;
  v25 = v6;
  v12 = v6;
  v13 = v11;
  v14 = v10;
  v15 = v7;
  v16 = v9;
  v17 = v8;
  -[SFFormAutocompleteState _fetchPotentialCredentialMatchesWithCompletion:](self, "_fetchPotentialCredentialMatchesWithCompletion:", v18);

}

void __112__SFFormAutocompleteState__getMatchingKeychainCredentialsIncludingCredentialsWithEmptyUsernames_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v3 = a2;
  v17 = v3;
  if (!*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(v3, "safari_filterObjectsUsingBlock:", &__block_literal_global_190);
    v4 = objc_claimAutoreleasedReturnValue();

    v17 = (id)v4;
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 56) + 16));
  objc_msgSend(WeakRetained, "webView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "webui_lastGeneratedPasswordForCurrentBackForwardItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 72);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 224), "passwordElementUniqueID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = objc_msgSend(v13, "length") == 0;
  +[SFFormAutocompleteState _getMatchesFromFormProtectionSpace:matchesFromOtherProtectionSpaces:withFormURL:credentialMatches:lastGeneratedPassword:currentUser:currentPassword:forUserNamesOnly:](SFFormAutocompleteState, "_getMatchesFromFormProtectionSpace:matchesFromOtherProtectionSpaces:withFormURL:credentialMatches:lastGeneratedPassword:currentUser:currentPassword:forUserNamesOnly:", v5, v6, v7, v17, v10, v12, v11, v16);

  v14 = *(_QWORD *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 32), "arrayByAddingObjectsFromArray:", *(_QWORD *)(a1 + 40));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

}

BOOL __112__SFFormAutocompleteState__getMatchingKeychainCredentialsIncludingCredentialsWithEmptyUsernames_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "user");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)_textSuggestionForCredentialDisplayData:(id)a3 submitForm:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "match");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_SFTextSuggestion textSuggestionWithSavedAccountMatch:submitForm:](_SFTextSuggestion, "textSuggestionWithSavedAccountMatch:submitForm:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "match");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "user");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFCredentialDisplayData descriptionForPasswordWithUser:creationDate:](SFCredentialDisplayData, "descriptionForPasswordWithUser:creationDate:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDisplayText:", v11);

  objc_msgSend(v5, "detail");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setHeaderText:", v12);
  return v7;
}

- (void)showAllPasswordsButtonTapped
{
  int64_t quickTypeBarTrailingButtonPurpose;

  quickTypeBarTrailingButtonPurpose = self->_quickTypeBarTrailingButtonPurpose;
  if (quickTypeBarTrailingButtonPurpose == 1)
  {
    -[SFFormAutocompleteState _offerToAutoFillFromAvailableOneTimeCodes](self, "_offerToAutoFillFromAvailableOneTimeCodes");
  }
  else if (!quickTypeBarTrailingButtonPurpose)
  {
    -[SFFormAutocompleteState _offerToAutoFillFromPotentialCredentialMatches](self, "_offerToAutoFillFromPotentialCredentialMatches");
  }
}

- (BOOL)_hasMatchWithUser:(id)a3 password:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  id obj;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[SFFormAutocompleteState _cachedPotentialCredentialMatches](self, "_cachedPotentialCredentialMatches");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v10 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v11 = v18;
        v12 = v6;
        objc_msgSend(v10, "user");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "length") || objc_msgSend(v13, "length"))
          && !objc_msgSend(v13, "isEqualToString:", v11))
        {

        }
        else
        {
          objc_msgSend(v10, "password");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v12);

          if ((v15 & 1) != 0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_14;
          }
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }
LABEL_14:

  return v7;
}

- (void)_getShouldOfferForgetPassword:(BOOL *)a3 savePassword:(BOOL *)a4
{
  id WeakRetained;
  void *v8;
  char v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  __int16 v19;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(WeakRetained, "shouldAllowPasswordAutoFillOnURL:allowExternalCredentials:", v8, 0);

  if ((v9 & 1) != 0)
  {
    v19 = 0;
    v17 = 0;
    v18 = 0;
    -[SFFormAutocompleteState _getLoginFormUser:password:userIsAutoFilled:passwordIsAutoFilled:](self, "_getLoginFormUser:password:userIsAutoFilled:passwordIsAutoFilled:", &v18, &v17, (char *)&v19 + 1, &v19);
    v10 = v18;
    v11 = v17;
    if (!self->_hasDeterminedIfURLIsAllowedByWhiteList)
    {
      -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      self->_URLIsAllowedByWhiteList = objc_msgSend(WeakRetained, "whiteListAllowsURL:", v12);

      self->_hasDeterminedIfURLIsAllowedByWhiteList = 1;
    }
    v13 = (_BYTE)v19
       && (HIBYTE(v19) || !objc_msgSend(v10, "length"))
       && -[SFFormAutocompleteState _hasMatchWithUser:password:](self, "_hasMatchWithUser:password:", v10, v11);
    *a3 = v13;
    if (self->_URLIsAllowedByWhiteList
      && (v10 ? (v14 = HIBYTE(v19) == 0) : (v14 = 0), (v14 || !(_BYTE)v19) && objc_msgSend(v11, "length")))
    {
      -[WBSFormControlMetadata uniqueID](self->_textFieldMetadata, "uniqueID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSFormMetadata passwordElementUniqueID](self->_formMetadata, "passwordElementUniqueID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = objc_msgSend(v15, "isEqualToString:", v16);

    }
    else
    {
      *a4 = 0;
    }

  }
  else
  {
    *a3 = 0;
    *a4 = 0;
  }

}

- (void)_setUserAndPasswordFieldsAutoFilled:(BOOL)a3 clearPasswordField:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSFormMetadata passwordElementUniqueID](self->_formMetadata, "passwordElementUniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    objc_msgSend(v12, "addObject:", v7);
  -[WBSFormMetadata userNameElementUniqueID](self->_formMetadata, "userNameElementUniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
    objc_msgSend(v12, "addObject:", v8);
  if (objc_msgSend(v12, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
    v10 = WeakRetained;
    if (v4)
      v11 = v7;
    else
      v11 = 0;
    objc_msgSend(WeakRetained, "setFormControls:areAutoFilled:andClearField:inFrame:", v12, v5, v11, self->_frame);

  }
}

- (BOOL)_shouldUsePasswordGenerationAssistanceForTextField
{
  unint64_t v3;
  int v4;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (self->_formMetadata
    && (v3 = -[WBSFormControlMetadata maxLength](self->_textFieldMetadata, "maxLength"),
        v3 >= objc_msgSend(MEMORY[0x1E0D8AA98], "minimumPasswordLength")))
  {
    -[WBSFormControlMetadata classification](self->_textFieldMetadata, "classification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D8AF70]);

    if (v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
      objc_msgSend(WeakRetained, "autoFillQuirksManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "passwordGenerationManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "defaultRequirementsForURL:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "passwordGenerationIsDisallowedByRequirements:", v11))
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v4) = objc_msgSend(v12, "BOOLForKey:", CFSTR("WBUDebugOverridePasswordGenerationIsDisallowedByRequirements"));

      }
      else
      {
        LOBYTE(v4) = 1;
      }

    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

+ (BOOL)_shouldSaveCredentialsInProtectionSpace:(id)a3 savedAccountContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  v7 = (void *)MEMORY[0x1E0D8AC00];
  objc_msgSend(v5, "safari_URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "criteriaForExactFQDNPasswordMatchesOfURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setOptions:", objc_msgSend(v9, "options") | 4);
  objc_msgSend(v9, "setContext:", v6);
  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__SFFormAutocompleteState__shouldSaveCredentialsInProtectionSpace_savedAccountContext___block_invoke;
  v12[3] = &unk_1E4AC3F80;
  v12[4] = &v13;
  objc_msgSend(v10, "getSavedAccountsMatchingCriteria:withSynchronousCompletionHandler:", v9, v12);

  LOBYTE(v10) = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return (char)v10;
}

void __87__SFFormAutocompleteState__shouldSaveCredentialsInProtectionSpace_savedAccountContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a2, "exactMatches", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "user");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D8A950], "dontSaveMarker");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

        if (v10)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

- (BOOL)_passwordGenerationAssistanceAutoFillButtonEnabled
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;

  -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  objc_msgSend(MEMORY[0x1E0C92C70], "safari_HTMLFormProtectionSpaceForURL:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_class();
  objc_msgSend(WeakRetained, "savedAccountContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "_shouldSaveCredentialsInProtectionSpace:savedAccountContext:", v5, v7);

  if (!(_DWORD)v6)
    goto LABEL_4;
  v8 = (void *)objc_opt_class();
  v9 = objc_loadWeakRetained((id *)&self->_dataController);
  objc_msgSend(v9, "autoFillQuirksManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "passwordGenerationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "protectionSpaceForGeneratedPasswordsInProtectionSpace:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "savedAccountContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "_shouldSaveCredentialsInProtectionSpace:savedAccountContext:", v12, v13);

  if ((_DWORD)v8)
    v14 = -[WBSFormMetadata usesRelAsync](self->_formMetadata, "usesRelAsync") ^ 1;
  else
LABEL_4:
    LOBYTE(v14) = 0;

  return v14;
}

- (int64_t)_passwordGenerationAssistanceAction
{
  if (-[SFFormAutocompleteState _passwordGenerationAssistanceAutoFillButtonEnabled](self, "_passwordGenerationAssistanceAutoFillButtonEnabled"))
  {
    return 7;
  }
  else
  {
    return 1;
  }
}

- (void)_generateAndSuggestPasswordWithCompletionHandler:(id)a3
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  objc_msgSend(WeakRetained, "webView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WBSFormControlMetadata maxLength](self->_textFieldMetadata, "maxLength");
  -[WBSFormMetadata passwordRequirements](self->_formMetadata, "passwordRequirements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained((id *)&self->_dataController);
  -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "autoGeneratedPasswordForURL:respectingPasswordRequirements:maxLength:", v9, v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3940];
  if (_SFDeviceIsPad())
    v12 = CFSTR("%@\n%@");
  else
    v12 = CFSTR("%@\n\n%@");
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v12, v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB3940];
  if (_SFDeviceIsPad())
    v16 = CFSTR("\n%@");
  else
    v16 = CFSTR("%@");
  _WBSLocalizedString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _WBSLocalizedString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0DD9908];
  v30[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __76__SFFormAutocompleteState__generateAndSuggestPasswordWithCompletionHandler___block_invoke;
  v27[3] = &unk_1E4AC3FA8;
  v28 = v10;
  v29 = v4;
  v23 = v10;
  v24 = v4;
  LOBYTE(v25) = 1;
  objc_msgSend(v21, "showAutoFillPromptInWebView:title:message:cancelButtonTitle:otherButtonTitles:cancelWhenAppEntersBackground:makeFirstButtonSuggestedAction:headerViewController:completionHandler:", v26, v14, v18, v19, v22, 1, v25, 0, v27);

}

void __76__SFFormAutocompleteState__generateAndSuggestPasswordWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
    v4 = 0;
  else
    v4 = *(_QWORD *)(a1 + 32);
  v5 = a2 == 0;
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
  objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didShowPasswordGenerationPromptWithPasswordAccepted:", v5);

}

- (void)_suggestPasswordForNewAccountOrChangePasswordForm
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __76__SFFormAutocompleteState__suggestPasswordForNewAccountOrChangePasswordForm__block_invoke;
  v2[3] = &unk_1E4AC3FD0;
  v2[4] = self;
  -[SFFormAutocompleteState _generateAndSuggestPasswordWithCompletionHandler:](self, "_generateAndSuggestPasswordWithCompletionHandler:", v2);
}

void __76__SFFormAutocompleteState__suggestPasswordForNewAccountOrChangePasswordForm__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "length"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(WeakRetained, "autoFillForm:inFrame:withGeneratedPassword:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "uniqueID"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216), v4);

  }
}

- (BOOL)_shouldAllowGeneratedPassword
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SFFormAutocompleteState _textFieldIsEmptyPasswordField](self, "_textFieldIsEmptyPasswordField")
    && (v5 = objc_loadWeakRetained((id *)&self->_autoFillController),
        objc_msgSend(v5, "webView"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(WeakRetained, "shouldAutoGeneratePasswordsForURL:inWebView:", v4, v6),
        v6,
        v5,
        v7))
  {
    objc_msgSend(WeakRetained, "autoFillQuirksManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "passwordGenerationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "defaultRequirementsForURL:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "manualPasswordGenerationIsDisallowedByRequirements:", v10) ^ 1;

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)shouldOfferToAutoFillCreditCardData
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  if (objc_msgSend(WeakRetained, "mayFillCreditCardDataInFrame:", self->_frame))
    v4 = objc_msgSend(MEMORY[0x1E0DD9910], "textFieldLooksLikeCreditCardFormField:inForm:", self->_textFieldMetadata, self->_formMetadata);
  else
    v4 = 0;

  return v4;
}

- (BOOL)currentTextFieldLooksLikeCardSecurityCodeFieldButNotCardNumberOrCardholderField
{
  if ((-[WBSFormControlMetadata looksLikeCreditCardNumberField](self->_textFieldMetadata, "looksLikeCreditCardNumberField") & 1) != 0|| (-[WBSFormControlMetadata looksLikeCreditCardCardholderField](self->_textFieldMetadata, "looksLikeCreditCardCardholderField") & 1) != 0)
  {
    return 0;
  }
  else
  {
    return -[WBSFormControlMetadata looksLikeCreditCardSecurityCodeField](self->_textFieldMetadata, "looksLikeCreditCardSecurityCodeField");
  }
}

- (BOOL)_shouldOfferCreditCardDataAfterUserHasFilledCreditCardData:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  objc_msgSend(WeakRetained, "lastFilledCreditCardData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)&self->_dataController);
    if (objc_msgSend(v7, "shouldAutoFillFromCreditCardData")
      && objc_msgSend(v7, "mayFillCreditCardDataInFrame:", self->_frame))
    {
      if ((objc_msgSend(MEMORY[0x1E0DD9910], "isFieldUnidentified:", v4) & 1) != 0)
        v8 = 1;
      else
        v8 = objc_msgSend(MEMORY[0x1E0DD9910], "textFieldLooksLikeCreditCardFormField:inForm:", self->_textFieldMetadata, self->_formMetadata);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_sortedSingleCreditCardDataArray:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  objc_msgSend(WeakRetained, "lastFilledCreditCardDataTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__SFFormAutocompleteState__sortedSingleCreditCardDataArray___block_invoke;
    v16[3] = &unk_1E4AC3FF8;
    v17 = v9;
    v18 = v11;
    v19 = v10;
    v12 = v10;
    v13 = v11;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v16);
    objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = v4;
  }

  return v14;
}

void __60__SFFormAutocompleteState__sortedSingleCreditCardDataArray___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a2;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v7, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "containsObject:", v5);

  v6 = 48;
  if ((_DWORD)v3)
    v6 = 40;
  objc_msgSend(*(id *)(a1 + v6), "addObject:", v7);

}

- (void)_showCreditCardDataSuggestionsAfterUserHasFilledCreditCardData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SFSingleCreditCardData *v9;
  void *v10;
  SFSingleCreditCardData *v11;
  void *v12;
  SFSingleCreditCardData *v13;
  void *v14;
  void *v15;
  SFSingleCreditCardData *v16;
  void *v17;
  id v18;
  SFSingleCreditCardData *v19;
  void *v20;
  void *v21;
  SFSingleCreditCardData *v22;
  void *v23;
  SFSingleCreditCardData *v24;
  void *v25;
  SFSingleCreditCardData *v26;
  void *v27;
  SFSingleCreditCardData *v28;
  void *v29;
  SFSingleCreditCardData *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id WeakRetained;
  void *v48;
  SFFormAutocompleteState *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  objc_msgSend(WeakRetained, "lastFilledCreditCardData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    if ((objc_msgSend(v4, "isVirtualCard") & 1) != 0)
    {
      objc_msgSend(v4, "virtualCard");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "displayablePANSuffix");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      WBSDisplayTextForCreditCardNumber();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      WBSDisplayTextForCreditCardNumber();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = [SFSingleCreditCardData alloc];
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SFSingleCreditCardData initWithHeaderText:displayText:type:value:](v9, "initWithHeaderText:displayText:type:value:", v10, v8, 0, v5);
    objc_msgSend(v3, "addObject:", v11);

  }
  objc_msgSend(v4, "cardSecurityCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
  {
    v13 = [SFSingleCreditCardData alloc];
    _WBSLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&stru_1E4AC8470, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(v12, "length"), CFSTR("•"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SFSingleCreditCardData initWithHeaderText:displayText:type:value:](v13, "initWithHeaderText:displayText:type:value:", v14, v15, 1, v12);
    objc_msgSend(v3, "addObject:", v16);

  }
  v44 = v12;
  objc_msgSend(v4, "expirationDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v18, "setDateFormat:", CFSTR("MM/yy"));
    v19 = [SFSingleCreditCardData alloc];
    _WBSLocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringFromDate:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[SFSingleCreditCardData initWithHeaderText:displayText:type:value:](v19, "initWithHeaderText:displayText:type:value:", v20, v21, 2, v17);
    objc_msgSend(v3, "addObject:", v22);

  }
  objc_msgSend(v4, "cardholderName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "length"))
  {
    v24 = [SFSingleCreditCardData alloc];
    _WBSLocalizedString();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[SFSingleCreditCardData initWithHeaderText:displayText:type:value:](v24, "initWithHeaderText:displayText:type:value:", v25, v23, 3, v23);
    objc_msgSend(v3, "addObject:", v26);

  }
  if (objc_msgSend(v5, "length"))
  {
    WBSCreditCardTypeFromNumber();
    WBSCreditCardTypeLocalizedName();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "length"))
    {
      v28 = [SFSingleCreditCardData alloc];
      _WBSLocalizedString();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[SFSingleCreditCardData initWithHeaderText:displayText:type:value:](v28, "initWithHeaderText:displayText:type:value:", v29, v27, 4, v5);
      objc_msgSend(v3, "addObject:", v30);

    }
  }
  v45 = v5;
  v46 = v4;
  v48 = v3;
  -[SFFormAutocompleteState _sortedSingleCreditCardDataArray:](v49, "_sortedSingleCreditCardDataArray:", v3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v33 = v31;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v51;
LABEL_18:
    v37 = 0;
    while (1)
    {
      if (*(_QWORD *)v51 != v36)
        objc_enumerationMutation(v33);
      v38 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v37);
      if ((unint64_t)objc_msgSend(v32, "count") > 1)
        break;
      +[_SFTextSuggestion textSuggestionWithSingleCreditCardDataValue:](_SFTextSuggestion, "textSuggestionWithSingleCreditCardDataValue:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "displayText");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setDisplayText:", v40);

      objc_msgSend(v38, "headerText");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setHeaderText:", v41);

      objc_msgSend(v32, "addObject:", v39);
      if (v35 == ++v37)
      {
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
        if (v35)
          goto LABEL_18;
        break;
      }
    }
  }

  if (objc_msgSend(v32, "count"))
  {
    -[WBSFormControlMetadata uniqueID](v49->_textFieldMetadata, "uniqueID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "reportAutoFillOfferedType:forTextFieldWithID:forFormMetadata:", 3, v42, v49->_formMetadata);

  }
  -[_SFFormAutoFillInputSession formInputSession](v49->_inputSession, "formInputSession");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setSuggestions:", v32);

}

- (void)_fillCreditCardDataAfterAuthenticationIfNeeded:(id)a3
{
  id v4;
  WBSCreditCardData *previouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance;
  void *v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  previouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance = self->_previouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance;
  self->_previouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance = 0;

  if (objc_msgSend(v4, "isCardBalanceZeroOrNegative"))
  {
    -[SFFormAutocompleteState _presentLowBalanceAppleCashAlertForCard:](self, "_presentLowBalanceAppleCashAlertForCard:", v4);
  }
  else
  {
    objc_msgSend(v4, "virtualCard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0DD98F8], "sharedCreditCardDataController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "authenticationRequiredForVirtualCard:", v6))
        v8 = 4;
      else
        v8 = 3;

    }
    else
    {
      v8 = 2;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__SFFormAutocompleteState__fillCreditCardDataAfterAuthenticationIfNeeded___block_invoke;
    v10[3] = &unk_1E4AC4020;
    v10[4] = self;
    v11 = v4;
    objc_msgSend(WeakRetained, "authenticateIfNeededForAutoFillAuthenticationType:user:shouldForceAuthentication:withCompletion:", v8, 0, 0, v10);

  }
}

uint64_t __74__SFFormAutocompleteState__fillCreditCardDataAfterAuthenticationIfNeeded___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_fillCreditCardData:", *(_QWORD *)(result + 40));
  return result;
}

- (void)_fillSingleCreditCardDataValue:(id)a3 creditCardDataType:(int64_t)a4
{
  id v6;
  id WeakRetained;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  v8 = 0x1E0D8A000uLL;
  v36 = v6;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8AC60]), "initWithValue:type:", v6, a4);
  objc_msgSend(WeakRetained, "lastFilledCreditCardData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsVirtualCard:", objc_msgSend(v10, "isVirtualCard"));

  v11 = objc_loadWeakRetained((id *)&self->_dataController);
  v41 = 0;
  v42 = 0;
  objc_msgSend(v11, "getFormFieldValues:andFieldToFocus:withSingleCreditCardData:inField:inForm:", &v42, &v41, v9, self->_textFieldMetadata, self->_formMetadata);
  v12 = v42;
  v34 = v41;

  objc_msgSend(MEMORY[0x1E0DD98F8], "sharedCreditCardDataController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v9;
  objc_msgSend(v13, "fieldsToObscureWhenFillingSingleCreditCardData:formFieldValues:", v9, v12);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "lastFilledCreditCardDataTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSFormControlMetadata uniqueID](self->_textFieldMetadata, "uniqueID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(WeakRetained, "lastFilledCreditCardDataTypes");
    v32 = v12;
    v17 = a4;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSFormControlMetadata uniqueID](self->_textFieldMetadata, "uniqueID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "integerValue");

    v8 = 0x1E0D8A000;
    a4 = v17;
    v12 = v32;
  }
  else
  {
    v21 = 5;
  }

  v22 = objc_msgSend(MEMORY[0x1E0D8A960], "formFieldTypeForFormControlMetadata:formMetadata:", self->_textFieldMetadata, self->_formMetadata);
  objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v8 + 3168), "stringForSingleCreditCardDataType:", a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v8 + 3168), "stringForSingleCreditCardDataType:", v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "didUseCreditCardAutoFillEscapeHatchFillingNewType:forPreviousType:fieldType:", v24, v25, v22);

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v12, "allKeys");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v38 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(WeakRetained, "reportAutoFillOfferedType:forTextFieldWithID:forFormMetadata:", 3, *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i), self->_formMetadata);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v28);
  }

  LOBYTE(v31) = 0;
  objc_msgSend(WeakRetained, "autoFillFormInFrame:withValues:setAutoFilled:focusFieldAfterFilling:fieldToFocus:fieldsToObscure:submitForm:", self->_frame, v12, 1, 0, v34, v33, v31);

}

- (BOOL)_canAutoFillCreditCardData
{
  id WeakRetained;
  BOOL v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  if (objc_msgSend(WeakRetained, "shouldAutoFillFromCreditCardData"))
    v4 = self->_formMetadata != 0;
  else
    v4 = 0;

  return v4;
}

- (void)_updateAutoFillActionToCaptureCreditCardAndFill
{
  if (+[_SFCreditCardCaptureViewController canCapture](_SFCreditCardCaptureViewController, "canCapture"))
  {
    self->_action = 6;
    -[SFFormAutocompleteState updateAutoFillButton](self, "updateAutoFillButton");
  }
}

- (void)_updateCreditCardAutoFillAction
{
  void *v3;
  BOOL v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  BOOL v9;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DD98F8], "sharedCreditCardDataController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SFFormAutocompleteState currentTextFieldLooksLikeCardSecurityCodeFieldButNotCardNumberOrCardholderField](self, "currentTextFieldLooksLikeCardSecurityCodeFieldButNotCardNumberOrCardholderField");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__SFFormAutocompleteState__updateCreditCardAutoFillAction__block_invoke;
  v6[3] = &unk_1E4AC4070;
  objc_copyWeak(&v8, &location);
  v5 = v3;
  v7 = v5;
  v9 = v4;
  objc_msgSend(v5, "getCreditCardDataWithCompletionHandler:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __58__SFFormAutocompleteState__updateCreditCardAutoFillAction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  char v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__SFFormAutocompleteState__updateCreditCardAutoFillAction__block_invoke_2;
  v5[3] = &unk_1E4AC4048;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v9 = *(_BYTE *)(a1 + 48);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v8);
}

void __58__SFFormAutocompleteState__updateCreditCardAutoFillAction__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id *v5;
  uint64_t i;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id *v12;
  void *v13;
  id *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = *(id *)(a1 + 32);
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v23;
      v5 = WeakRetained + 3;
      v18 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v23 != v4)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v8 = objc_loadWeakRetained(v5);
          v21 = 0;
          objc_msgSend(v8, "getFormFieldValues:andFieldToFocus:andCreditCardDataTypesThatWillBeFilled:forCreditCardForm:fromCreditCardData:", &v21, 0, 0, WeakRetained[28], v7);
          v9 = v21;

          if (objc_msgSend(v9, "count") && (objc_msgSend(v7, "shouldHide") & 1) == 0)
          {
            objc_msgSend(v7, "cardSecurityCode");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v10, "length"))
            {

LABEL_19:
              WeakRetained[1] = (id)3;
              objc_msgSend(WeakRetained, "updateAutoFillButton", v18);

              goto LABEL_20;
            }
            objc_msgSend(v7, "virtualCard");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              v12 = v5;
              v13 = *(void **)(a1 + 40);
              objc_msgSend(v7, "virtualCard");
              v14 = WeakRetained;
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v13;
              v5 = v12;
              v17 = objc_msgSend(v16, "authenticationRequiredForVirtualCard:", v15);

              WeakRetained = v14;
              v4 = v18;
            }
            else
            {
              v17 = 0;
            }

            if (!*(_BYTE *)(a1 + 56) || (v17 & 1) != 0)
              goto LABEL_19;
          }

        }
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v3)
          continue;
        break;
      }
    }

    objc_msgSend(WeakRetained, "_updateAutoFillActionToCaptureCreditCardAndFill");
  }
LABEL_20:

}

- (void)_fillCreditCardData:(id)a3
{
  _SFFormAutoFillController **p_autoFillController;
  id v5;
  id WeakRetained;

  p_autoFillController = &self->_autoFillController;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_autoFillController);
  objc_msgSend(WeakRetained, "fillCreditCardData:inFrame:textFieldMetadata:formMetadata:", v5, self->_frame, self->_textFieldMetadata, self->_formMetadata);

}

- (void)_presentLowBalanceAppleCashAlertForCard:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;

  v4 = a3;
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "balance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "formattedStringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v5, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("ConfirmYourCardPrompt"));

  v13 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("ChooseDifferentCardButton"));
  v16 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __67__SFFormAutocompleteState__presentLowBalanceAppleCashAlertForCard___block_invoke;
  v21[3] = &unk_1E4AC0128;
  v21[4] = self;
  v22 = v4;
  v18 = v4;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 0, v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setAccessibilityIdentifier:", CFSTR("AddMoneyButton"));
  objc_msgSend(v11, "addAction:", v15);
  objc_msgSend(v11, "addAction:", v19);
  objc_msgSend(v11, "setPreferredAction:", v15);
  -[SFFormAutocompleteState _viewControllerToPresentFrom](self, "_viewControllerToPresentFrom");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "presentViewController:animated:completion:", v11, 1, 0);

}

void __67__SFFormAutocompleteState__presentLowBalanceAppleCashAlertForCard___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  PKPeerPaymentGetTopUpSensitiveURL();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 240), *(id *)(a1 + 40));
}

- (void)presentUnavailableVirtualCardAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0DD98F8], "sharedCreditCardDataController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "titleForUnavailableVirtualCardAlert");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageForUnavailableVirtualCardAlert");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v8);

  -[SFFormAutocompleteState _viewControllerToPresentFrom](self, "_viewControllerToPresentFrom");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFFormAutocompleteState _presentViewController:presentingViewController:animated:completion:](self, "_presentViewController:presentingViewController:animated:completion:", v5, v9, 1, 0);

}

- (void)presentCustomizeStrongPasswordAlert
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  SFFormAutocompleteState *v29;
  _QWORD v30[4];
  id v31;
  SFFormAutocompleteState *v32;

  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_domainFromHost");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v25, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __62__SFFormAutocompleteState_presentCustomizeStrongPasswordAlert__block_invoke;
  v30[3] = &unk_1E4AC0128;
  v12 = WeakRetained;
  v31 = v12;
  v32 = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, v30);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v11;
  v27[1] = 3221225472;
  v27[2] = __62__SFFormAutocompleteState_presentCustomizeStrongPasswordAlert__block_invoke_2;
  v27[3] = &unk_1E4AC0128;
  v28 = v12;
  v29 = self;
  v24 = v12;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 0, &__block_literal_global_273);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 1, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v13);
  objc_msgSend(v8, "addAction:", v16);
  objc_msgSend(v8, "addAction:", v19);
  objc_msgSend(v8, "addAction:", v22);
  -[SFFormAutocompleteState _viewControllerToPresentFrom](self, "_viewControllerToPresentFrom");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "presentViewController:animated:completion:", v8, 1, 0);

}

void __62__SFFormAutocompleteState_presentCustomizeStrongPasswordAlert__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "automaticPasswordForPasswordField:inForm:isFrame:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 232), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 224), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 216));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "autoFillForm:inFrame:withGeneratedPassword:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 224), "uniqueID"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 216), v3);
  objc_msgSend(*(id *)(a1 + 32), "makeStrongPasswordFieldViewableAndEditable:", 1);
  objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didSelectNewStrongPassword");

}

void __62__SFFormAutocompleteState_presentCustomizeStrongPasswordAlert__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "alphanumericStrongPassword");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "autoFillForm:inFrame:withGeneratedPassword:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 224), "uniqueID"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 216), v3);
  objc_msgSend(*(id *)(a1 + 32), "makeStrongPasswordFieldViewableAndEditable:", 1);
  objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didChooseStrongPasswordWithoutSpecialCharacters");

}

void __62__SFFormAutocompleteState_presentCustomizeStrongPasswordAlert__block_invoke_3()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8A050], "passwordManagerURL");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v0, 0);

}

- (void)captureCreditCardDataWithCameraAndFill
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id creditCardCaptureCompletionHandler;
  _SFCreditCardCaptureViewController *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id location;

  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  objc_msgSend(WeakRetained, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webui_preventNavigationDuringAutoFillPrompt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    do
    {
      objc_msgSend(MEMORY[0x1E0DC3F20], "viewControllerForView:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        break;
      v8 = v10;
    }
    while (!v9);

  }
  else
  {
    v9 = 0;
  }
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __65__SFFormAutocompleteState_captureCreditCardDataWithCameraAndFill__block_invoke;
  v20[3] = &unk_1E4AC40E0;
  v12 = v9;
  v21 = v12;
  v13 = v5;
  v22 = v13;
  objc_copyWeak(&v23, &location);
  v14 = (void *)objc_msgSend(v20, "copy");
  creditCardCaptureCompletionHandler = self->_creditCardCaptureCompletionHandler;
  self->_creditCardCaptureCompletionHandler = v14;

  v16 = objc_alloc_init(_SFCreditCardCaptureViewController);
  -[_SFCreditCardCaptureViewController setDelegate:](v16, "setDelegate:", self);
  objc_msgSend(WeakRetained, "suppressSoftwareKeyboardOnWebView:", 1);
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __65__SFFormAutocompleteState_captureCreditCardDataWithCameraAndFill__block_invoke_3;
  v18[3] = &unk_1E4ABFE00;
  v17 = WeakRetained;
  v19 = v17;
  -[SFFormAutocompleteState _presentViewController:presentingViewController:animated:completion:](self, "_presentViewController:presentingViewController:animated:completion:", v16, v12, 1, v18);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __65__SFFormAutocompleteState_captureCreditCardDataWithCameraAndFill__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__SFFormAutocompleteState_captureCreditCardDataWithCameraAndFill__block_invoke_2;
  v6[3] = &unk_1E4AC40B8;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  v7 = v5;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v6);
  objc_destroyWeak(&v9);

}

void __65__SFFormAutocompleteState_captureCreditCardDataWithCameraAndFill__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "cardNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_fillCreditCardData:", *(_QWORD *)(a1 + 32));

  }
}

uint64_t __65__SFFormAutocompleteState_captureCreditCardDataWithCameraAndFill__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "suppressSoftwareKeyboardOnWebView:", 0);
}

- (void)_autoFillSingleCreditCardData:(int64_t)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  SFSingleCreditCardData *v10;
  void *v11;
  SFSingleCreditCardData *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  SFSingleCreditCardData *v17;
  void *v18;
  void *v19;
  void *v20;
  SFSingleCreditCardData *v21;
  void *v22;
  void *v23;
  SFSingleCreditCardData *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id location[2];

  objc_initWeak(location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "lastFilledCreditCardData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cardNumber");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 && objc_msgSend(v34, "length"))
  {
    v8 = WeakRetained;
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SFSingleCreditCardData initWithHeaderText:displayText:type:value:]([SFSingleCreditCardData alloc], "initWithHeaderText:displayText:type:value:", 0, v9, 0, v34);
    objc_msgSend(v6, "addObject:", v10);

    WeakRetained = v8;
  }
  objc_msgSend(v7, "cardSecurityCode");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 && objc_msgSend(v33, "length"))
  {
    _WBSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SFSingleCreditCardData initWithHeaderText:displayText:type:value:]([SFSingleCreditCardData alloc], "initWithHeaderText:displayText:type:value:", 0, v11, 1, v33);
    objc_msgSend(v6, "addObject:", v12);

  }
  objc_msgSend(v7, "expirationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v15, "setDateFormat:", CFSTR("MM/yy"));
    _WBSLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SFSingleCreditCardData initWithHeaderText:displayText:type:value:]([SFSingleCreditCardData alloc], "initWithHeaderText:displayText:type:value:", 0, v16, 2, v14);
    objc_msgSend(v6, "addObject:", v17);

    v13 = v14;
  }
  objc_msgSend(v7, "cardholderName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (a3 && objc_msgSend(v18, "length"))
  {
    _WBSLocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SFSingleCreditCardData initWithHeaderText:displayText:type:value:]([SFSingleCreditCardData alloc], "initWithHeaderText:displayText:type:value:", 0, v20, 3, v19);
    objc_msgSend(v6, "addObject:", v21);

    v13 = v14;
  }
  if (objc_msgSend(v34, "length"))
  {
    WBSCreditCardTypeFromNumber();
    WBSCreditCardTypeLocalizedName();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "length"))
    {
      _WBSLocalizedString();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[SFSingleCreditCardData initWithHeaderText:displayText:type:value:]([SFSingleCreditCardData alloc], "initWithHeaderText:displayText:type:value:", 0, v23, 4, v34);
      objc_msgSend(v6, "addObject:", v24);

      v13 = v14;
    }

  }
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "firstObject");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "value");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    -[SFFormAutocompleteState _fillSingleCreditCardDataValue:creditCardDataType:](self, "_fillSingleCreditCardDataValue:creditCardDataType:", v26, objc_msgSend(v25, "type"));
  }
  else
  {
    v27 = WeakRetained;
    -[SFFormAutocompleteState _sortedSingleCreditCardDataArray:](self, "_sortedSingleCreditCardDataArray:", v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __57__SFFormAutocompleteState__autoFillSingleCreditCardData___block_invoke;
    v41[3] = &unk_1E4AC4108;
    v31 = v29;
    v42 = v31;
    objc_msgSend(v28, "enumerateObjectsUsingBlock:", v41);
    objc_msgSend(MEMORY[0x1E0DD98F8], "sharedCreditCardDataController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v30;
    v35[1] = 3221225472;
    v35[2] = __57__SFFormAutocompleteState__autoFillSingleCreditCardData___block_invoke_2;
    v35[3] = &unk_1E4AC4180;
    v35[4] = self;
    v36 = v7;
    v26 = v31;
    v37 = v26;
    WeakRetained = v27;
    v38 = v27;
    objc_copyWeak(&v40, location);
    v25 = v28;
    v39 = v25;
    objc_msgSend(v32, "getCreditCardDataWithCompletionHandler:", v35);

    objc_destroyWeak(&v40);
    v13 = v14;
  }

  objc_destroyWeak(location);
}

void __57__SFFormAutocompleteState__autoFillSingleCreditCardData___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "displayText");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __57__SFFormAutocompleteState__autoFillSingleCreditCardData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SFFormAutocompleteState__autoFillSingleCreditCardData___block_invoke_3;
  block[3] = &unk_1E4AC4158;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v5 = v3;
  objc_copyWeak(&v12, (id *)(a1 + 72));
  v11 = *(id *)(a1 + 64);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __57__SFFormAutocompleteState__autoFillSingleCreditCardData___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_createCreditCardHeaderViewControllerForEscapeHatchAlertControllerForCard:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 48), "count") >= 2)
  {
    v3 = *(void **)(a1 + 56);
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DD9908];
  objc_msgSend(*(id *)(a1 + 64), "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 56);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__SFFormAutocompleteState__autoFillSingleCreditCardData___block_invoke_4;
  v10[3] = &unk_1E4AC4130;
  objc_copyWeak(&v12, (id *)(a1 + 80));
  v11 = *(id *)(a1 + 72);
  LOBYTE(v9) = 0;
  objc_msgSend(v6, "showAutoFillPromptInWebView:title:message:cancelButtonTitle:otherButtonTitles:cancelWhenAppEntersBackground:makeFirstButtonSuggestedAction:headerViewController:completionHandler:", v7, 0, 0, v5, v8, 0, v9, v2, v10);

  objc_destroyWeak(&v12);
}

void __57__SFFormAutocompleteState__autoFillSingleCreditCardData___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2 != -1 && WeakRetained)
  {
    v7 = WeakRetained;
    if (objc_msgSend(*(id *)(a1 + 32), "count") == a2)
    {
      objc_msgSend(v7, "_clearAutoFilledCreditCardFieldsAndShowAllCreditCards");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_fillSingleCreditCardDataValue:creditCardDataType:", v6, objc_msgSend(v5, "type"));

    }
    WeakRetained = v7;
  }

}

- (void)_clearAutoFilledCreditCardFieldsAndShowAllCreditCards
{
  id WeakRetained;
  WBSFormControlMetadata *textFieldMetadata;
  WBSFormMetadata *formMetadata;
  SFFormAutoFillFrameHandle *frame;
  id v7;
  _QWORD v8[4];
  id v9;
  SFFormAutocompleteState *v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  formMetadata = self->_formMetadata;
  textFieldMetadata = self->_textFieldMetadata;
  frame = self->_frame;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__SFFormAutocompleteState__clearAutoFilledCreditCardFieldsAndShowAllCreditCards__block_invoke;
  v8[3] = &unk_1E4ABFB20;
  v9 = WeakRetained;
  v10 = self;
  v7 = WeakRetained;
  objc_msgSend(v7, "clearAutoFilledCreditCardFieldsInFrame:textFieldMetadata:formMetadata:completionHandler:", frame, textFieldMetadata, formMetadata, v8);

}

void __80__SFFormAutocompleteState__clearAutoFilledCreditCardFieldsAndShowAllCreditCards__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 232), "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(v4 + 216);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__SFFormAutocompleteState__clearAutoFilledCreditCardFieldsAndShowAllCreditCards__block_invoke_2;
  v7[3] = &unk_1E4AC41A8;
  v7[4] = v4;
  v8 = v5;
  objc_msgSend(v2, "fetchMetadataForTextField:inFrame:withCompletion:", v3, v6, v7);

}

void __80__SFFormAutocompleteState__clearAutoFilledCreditCardFieldsAndShowAllCreditCards__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v14 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v7 = objc_msgSend(WeakRetained, "metadataCorrectionsEnabled");

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "_correctedFormMetadata:", v14);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 224);
    *(_QWORD *)(v9 + 224) = v8;

  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 232);
  *(_QWORD *)(v11 + 232) = v5;
  v13 = v5;

  objc_msgSend(*(id *)(a1 + 40), "setLastFilledCreditCardData:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setLastFilledCreditCardDataTypes:", 0);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 3;
  objc_msgSend(*(id *)(a1 + 32), "updateAutoFillButton");
  objc_msgSend(*(id *)(a1 + 32), "updateSuggestions");

}

- (id)_createCreditCardHeaderViewControllerForEscapeHatchAlertControllerForCard:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSString *v18;
  BOOL IsAccessibilityCategory;
  id v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[9];

  v53[7] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0DC3890]);
  SFCreditCardIconForType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithImage:", v5);

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (objc_msgSend(v3, "isVirtualCard"))
  {
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __101__SFFormAutocompleteState__createCreditCardHeaderViewControllerForEscapeHatchAlertControllerForCard___block_invoke;
    v51[3] = &unk_1E4AC2640;
    v52 = v6;
    objc_msgSend(v3, "virtualCardArtworkWithSize:completionHandler:", v51, 40.0, 26.0);

  }
  else
  {
    objc_msgSend(v3, "cardNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WBSCreditCardTypeFromNumber();
    SFCreditCardIconForType();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v8);

  }
  objc_msgSend(v6, "setContentMode:", 1);
  LODWORD(v9) = 1148846080;
  objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 0, v9);
  LODWORD(v10) = 1148846080;
  objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 1, v10);
  v11 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v3, "cardName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v3;
  if (objc_msgSend(v12, "length"))
    objc_msgSend(v3, "cardName");
  else
    _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v13);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v14);

  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B60]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v15);

  objc_msgSend(v11, "setNumberOfLines:", 2);
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "preferredContentSizeCategory");
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v18);

  if (!IsAccessibilityCategory)
    objc_msgSend(v16, "addArrangedSubview:", v6);
  objc_msgSend(v16, "addArrangedSubview:", v11);
  objc_msgSend(v16, "setAxis:", 0);
  objc_msgSend(v16, "setSpacing:", 10.0);
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v49 = v6;
  v20 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v20, "addSubview:", v16);
  v39 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v16, "centerXAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerXAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = 1144750080;
  objc_msgSend(v46, "sf_withPriority:", v21);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v45;
  objc_msgSend(v16, "centerYAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerYAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v42;
  objc_msgSend(v20, "heightAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintGreaterThanOrEqualToConstant:", 66.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v40;
  objc_msgSend(v20, "heightAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "heightAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintGreaterThanOrEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v36;
  objc_msgSend(v20, "heightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToConstant:", 0.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = 1132003328;
  objc_msgSend(v33, "sf_withPriority:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v23;
  objc_msgSend(v16, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v25, 1.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v53[5] = v26;
  objc_msgSend(v20, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v28, 1.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v53[6] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 7);
  v35 = v11;
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "activateConstraints:", v30);

  v31 = objc_alloc_init(MEMORY[0x1E0D4EBA0]);
  objc_msgSend(v31, "setView:", v20);

  return v31;
}

uint64_t __101__SFFormAutocompleteState__createCreditCardHeaderViewControllerForEscapeHatchAlertControllerForCard___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:", a2);
}

- (void)performPageLevelAutoFill
{
  void *v3;
  uint64_t v4;
  SFFormAutocompleteState *v5;
  uint64_t v6;
  void *v7;
  int v8;
  id WeakRetained;
  void *v10;
  int v11;

  self->_performingPageLevelAutoFill = 1;
  -[WBSFormMetadata controls](self->_formMetadata, "controls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    switch(self->_formType)
    {
      case 1uLL:
      case 4uLL:
      case 5uLL:
        self->_action = 2;
        if (!self->_multiRoundAutoFillManager)
          -[SFFormAutocompleteState _setUpMultiRoundAutoFillManagerIfNecessary](self, "_setUpMultiRoundAutoFillManagerIfNecessary");
        -[SFFormAutocompleteState _performPageLevelContactAutoFill](self, "_performPageLevelContactAutoFill");
        return;
      case 2uLL:
        v6 = 2;
        goto LABEL_14;
      case 3uLL:
        self->_action = 8;
        objc_msgSend(MEMORY[0x1E0D8A020], "sharedFeatureManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "shouldAutoFillPasswords");

        if (v8)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
          -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(WeakRetained, "shouldAllowPasswordAutoFillOnURL:allowExternalCredentials:", v10, 0);

          if (v11)
          {
            -[SFFormAutocompleteState _performPageLevelCredentialAutoFill](self, "_performPageLevelCredentialAutoFill");
            return;
          }
          v6 = 5;
        }
        else
        {
          v6 = 1;
        }
LABEL_14:
        v5 = self;
        break;
      default:
        v6 = 3;
        goto LABEL_14;
    }
  }
  else
  {
    v5 = self;
    v6 = 4;
  }
  -[SFFormAutocompleteState _finishPageLevelAutoFillWithResult:](v5, "_finishPageLevelAutoFillWithResult:", v6);
}

- (void)_performPageLevelCredentialAutoFill
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__SFFormAutocompleteState__performPageLevelCredentialAutoFill__block_invoke;
  v2[3] = &unk_1E4ABFD00;
  v2[4] = self;
  -[SFFormAutocompleteState _fetchPotentialCredentialMatchesWithCompletion:](self, "_fetchPotentialCredentialMatchesWithCompletion:", v2);
}

void __62__SFFormAutocompleteState__performPageLevelCredentialAutoFill__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "count");
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v6, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_fillSavedAccountMatchAfterAuthenticationIfNeeded:setAsDefaultCredential:submitForm:", v5, 0, 1);

  }
  else
  {
    objc_msgSend(v4, "_finishPageLevelAutoFillWithResult:", 5);
  }

}

- (void)_performPageLevelContactAutoFill
{
  id WeakRetained;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  if (objc_msgSend(WeakRetained, "shouldAutoFillFromAddressBook"))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __59__SFFormAutocompleteState__performPageLevelContactAutoFill__block_invoke;
    v4[3] = &unk_1E4ABFE00;
    v4[4] = self;
    objc_msgSend(WeakRetained, "performWhenReady:", v4);
  }

}

void __59__SFFormAutocompleteState__performPageLevelContactAutoFill__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "lastFilledContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "me");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(v8 + 224);
  objc_msgSend(*(id *)(v8 + 216), "webui_URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "host");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safari_domainFromHost");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = 1;
  objc_msgSend(v3, "valuesForStandardForm:inDomain:autoFillDataType:matches:preferredLabel:multiRoundAutoFillManager:contact:allowingIdentifiedAddressBookLabelToOverridePreferredIdentifier:", v9, v12, 0, 0, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208), v7, v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "count");
  v15 = *(_QWORD **)(a1 + 32);
  if (v14)
  {
    v16 = (void *)v15[26];
    objc_msgSend((id)objc_opt_class(), "controlsConsideredByAutoFillInForm:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addControlUniqueIDsIgnoredByFollowUpAutoFill:", v17);

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v13, "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(WeakRetained, "reportAutoFillOfferedType:forTextFieldWithID:forFormMetadata:", 4, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224));
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v20);
    }

    objc_msgSend(WeakRetained, "autoFillFormInFrame:withValues:setAutoFilled:focusFieldAfterFilling:fieldToFocus:submitForm:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216), v13, 1, 0, 0, 0);
    v15 = *(_QWORD **)(a1 + 32);
    v23 = 0;
  }
  else
  {
    v23 = 5;
  }
  objc_msgSend(v15, "_finishPageLevelAutoFillWithResult:", v23);

}

- (void)_finishPageLevelAutoFillWithResult:(int64_t)a3
{
  id WeakRetained;

  if (a3)
  {
    if (!-[WBSMultiRoundAutoFillManager currentAutoFillAttemptTrigger](self->_multiRoundAutoFillManager, "currentAutoFillAttemptTrigger"))-[SFFormAutocompleteState _showPageLevelAutoFillNotAvailableAlertForResult:](self, "_showPageLevelAutoFillNotAvailableAlertForResult:", a3);
    -[SFFormAutocompleteState invalidate](self, "invalidate");
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  objc_msgSend(WeakRetained, "didPerformPageLevelAutoFill:", a3 == 0);

}

- (void)_showPageLevelAutoFillNotAvailableAlertForResult:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[SFFormAutocompleteState _titleForPageLevelAutoFillNotAvailableAlertForResult:](self, "_titleForPageLevelAutoFillNotAvailableAlertForResult:");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[SFFormAutocompleteState _messageForPageLevelAutoFillNotAvailableAlertForResult:](self, "_messageForPageLevelAutoFillNotAvailableAlertForResult:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v11, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v9);

  -[SFFormAutocompleteState _viewControllerToPresentFrom](self, "_viewControllerToPresentFrom");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFFormAutocompleteState _presentViewController:presentingViewController:animated:completion:](self, "_presentViewController:presentingViewController:animated:completion:", v6, v10, 1, 0);

}

- (id)_titleForPageLevelAutoFillNotAvailableAlertForResult:(int64_t)a3
{
  void *v3;

  v3 = 0;
  if ((unint64_t)a3 <= 5 && (((1 << a3) & 0x36) != 0 || a3 == 3))
  {
    _WBSLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_messageForPageLevelAutoFillNotAvailableAlertForResult:(int64_t)a3
{
  void *v3;

  v3 = 0;
  if ((unint64_t)a3 <= 5 && (((1 << a3) & 0x36) != 0 || a3 == 3))
  {
    _WBSLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)creditCardCaptureViewControllerDidCancel:(id)a3
{
  id creditCardCaptureCompletionHandler;
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))MEMORY[0x1A8598C40](self->_creditCardCaptureCompletionHandler, a2, a3);
  creditCardCaptureCompletionHandler = self->_creditCardCaptureCompletionHandler;
  self->_creditCardCaptureCompletionHandler = 0;

  v5[2](v5, 0);
}

- (void)creditCardCaptureViewController:(id)a3 didCaptureCreditCard:(id)a4
{
  id creditCardCaptureCompletionHandler;
  id v6;
  id v7;
  void (**v8)(id, id);

  creditCardCaptureCompletionHandler = self->_creditCardCaptureCompletionHandler;
  v6 = a4;
  v8 = (void (**)(id, id))MEMORY[0x1A8598C40](creditCardCaptureCompletionHandler);
  v7 = self->_creditCardCaptureCompletionHandler;
  self->_creditCardCaptureCompletionHandler = 0;

  v8[2](v8, v6);
}

- (void)_gatherAndShowAddressBookAutoFillSuggestions
{
  id WeakRetained;
  WBSFormControlMetadata *textFieldMetadata;
  NSString *prefixForSuggestions;
  id v6;
  void *v7;
  _QWORD v8[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  textFieldMetadata = self->_textFieldMetadata;
  prefixForSuggestions = self->_prefixForSuggestions;
  v6 = objc_loadWeakRetained((id *)&self->_autoFillController);
  objc_msgSend(v6, "lastFilledContact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__SFFormAutocompleteState__gatherAndShowAddressBookAutoFillSuggestions__block_invoke;
  v8[3] = &unk_1E4ABFD00;
  v8[4] = self;
  objc_msgSend(WeakRetained, "gatherAutoFillDisplayDataWithTextField:displayedInQuickType:prefix:contact:completionHandler:", textFieldMetadata, 1, prefixForSuggestions, v7, v8);

}

void __71__SFFormAutocompleteState__gatherAndShowAddressBookAutoFillSuggestions__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_suggestionsForAutoFillDisplayData:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_addHideMyEmailSuggestionsIfNecessary:hideMyEmailRecord:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "formInputSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "reportAutoFillOfferedType:forTextFieldWithID:forFormMetadata:", 4, v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224));

    v7 = v8;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v4, "setSuggestions:", v7);

}

- (id)_suggestionsForAutoFillDisplayData:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "safari_mapAndFilterObjectsWithOptions:usingBlock:", 0, &__block_literal_global_304);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

id __62__SFFormAutocompleteState__suggestionsForAutoFillDisplayData___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a2;
  if (a3 < 2)
  {
    +[_SFTextSuggestion textSuggestionWithSingleDisplayData:](_SFTextSuggestion, "textSuggestionWithSingleDisplayData:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisplayText:", v8);

    objc_msgSend(v6, "fillMatches");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12)
    {
      objc_msgSend(v6, "label");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "length"))
      {
        objc_msgSend(MEMORY[0x1E0C97338], "localizedStringForLabel:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setHeaderText:", v14);
      }
      else
      {
        v15 = (void *)MEMORY[0x1E0DD9910];
        objc_msgSend(v10, "property");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedLowercaseContactProperty:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setHeaderText:", v16);

      }
    }

  }
  else
  {
    v7 = 0;
    *a4 = 1;
  }

  return v7;
}

- (void)_startHideMyEmailRecordUpdate
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D8A980], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__SFFormAutocompleteState__startHideMyEmailRecordUpdate__block_invoke;
  v5[3] = &unk_1E4AC4210;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "getRecordForURL:completionHandler:", v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__SFFormAutocompleteState__startHideMyEmailRecordUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__SFFormAutocompleteState__startHideMyEmailRecordUpdate__block_invoke_2;
  v5[3] = &unk_1E4ABFF70;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __56__SFFormAutocompleteState__startHideMyEmailRecordUpdate__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 22, *(id *)(a1 + 32));
    objc_msgSend(v3, "updateSuggestions");
    WeakRetained = v3;
  }

}

- (void)_autoFillHideMyEmailRecord:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  objc_msgSend(WeakRetained, "valuesForFormWithMetadata:hideMyEmailRecord:", self->_formMetadata, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_loadWeakRetained((id *)&self->_autoFillController);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "allKeys", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "reportAutoFillOfferedType:forTextFieldWithID:forFormMetadata:", 4, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12++), self->_formMetadata);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v13 = (void *)MEMORY[0x1E0D8A950];
  objc_msgSend(v6, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nextFieldAfterControls:inForm:", v14, self->_formMetadata);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "autoFillFormInFrame:withValues:setAutoFilled:focusFieldAfterFilling:fieldToFocus:submitForm:", self->_frame, v6, 1, v15 != 0, v15, 0);
}

- (void)_provisionHideMyEmailRecord
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D8A980], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__SFFormAutocompleteState__provisionHideMyEmailRecord__block_invoke;
  v5[3] = &unk_1E4AC4210;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "provisionRecordForURL:completionHandler:", v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __54__SFFormAutocompleteState__provisionHideMyEmailRecord__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__SFFormAutocompleteState__provisionHideMyEmailRecord__block_invoke_2;
  v5[3] = &unk_1E4ABFF70;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __54__SFFormAutocompleteState__provisionHideMyEmailRecord__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      v5 = WeakRetained;
      v4 = objc_msgSend(v3, "state");
      WeakRetained = v5;
      if (!v4)
      {
        objc_msgSend(v5, "_autoFillHideMyEmailRecord:", *(_QWORD *)(a1 + 32));
        WeakRetained = v5;
      }
    }
  }

}

- (id)_addHideMyEmailSuggestionsIfNecessary:(id)a3 hideMyEmailRecord:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (v7
    && (objc_msgSend(MEMORY[0x1E0DD9910], "shouldDisplayHideMyEmailForControl:", self->_textFieldMetadata) & 1) != 0
    && (!objc_msgSend(v7, "state") || objc_msgSend(v7, "state") == 1))
  {
    if (!v6)
      v6 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      objc_msgSend(v6, "subarrayWithRange:", 0, 1);
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v8;
    }
    v9 = (void *)objc_msgSend(v6, "mutableCopy");
    if (objc_msgSend(v7, "state"))
    {
      -[SFFormAutocompleteState _hideMyEmailCreationSuggestion](self, "_hideMyEmailCreationSuggestion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);
    }
    else
    {
      -[SFFormAutocompleteState _hideMyEmailSuggestionForRecord:](self, "_hideMyEmailSuggestionForRecord:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "insertObject:atIndex:", v10, 0);
    }

  }
  else
  {
    v6 = v6;
    v9 = v6;
  }

  return v9;
}

- (id)_hideMyEmailSuggestionForRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[_SFTextSuggestion textSuggestionWithHideMyEmailRecord:](_SFTextSuggestion, "textSuggestionWithHideMyEmailRecord:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHeaderText:", v5);

  objc_msgSend(v3, "privateEmailAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setDisplayText:", v6);
  return v4;
}

- (id)_hideMyEmailCreationSuggestion
{
  void *v2;
  void *v3;

  +[_SFTextSuggestion textSuggestionToProvisionHideMyEmailRecord](_SFTextSuggestion, "textSuggestionToProvisionHideMyEmailRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDisplayText:", v3);

  return v2;
}

- (void)_autoFillWithSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SFFormAutoFillFrameHandle *frame;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D8A950];
  objc_msgSend(v4, "controlIDToValueMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextFieldAfterControls:inForm:", v7, self->_formMetadata);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v4, "controlIDToValueMap", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(WeakRetained, "reportAutoFillOfferedType:forTextFieldWithID:forFormMetadata:", 4, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15++), self->_formMetadata);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  frame = self->_frame;
  objc_msgSend(v4, "controlIDToValueMap");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "autoFillFormInFrame:withValues:setAutoFilled:focusFieldAfterFilling:fieldToFocus:submitForm:", frame, v17, 1, v8 != 0, v8, 0);

}

- (void)_offerToAutoFillContact
{
  void *v2;
  void *v3;
  void *v4;
  WBSFormMetadata *formMetadata;
  id v6;
  WBSHideMyEmailRecord *hideMyEmailRecord;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t i;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  WBSFormControlMetadata *textFieldMetadata;
  void *v55;
  WBSHideMyEmailRecord *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  id WeakRetained;
  id obj;
  uint64_t v78;
  id v79;
  id v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v87;
  void *v88;
  id v89;
  id v90;
  _QWORD v91[5];
  _QWORD v92[5];
  _QWORD v93[5];
  id v94;
  id v95;
  _QWORD v96[5];
  _QWORD v97[4];
  id v98;
  SFFormAutocompleteState *v99;
  _QWORD v100[5];
  id v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _QWORD v106[4];
  id v107;
  id v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD v113[5];
  id v114;
  id location;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  v80 = objc_loadWeakRetained((id *)&self->_dataController);
  objc_msgSend(WeakRetained, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webui_presentingViewController");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "lastFilledContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v79 = v3;
  }
  else
  {
    objc_msgSend(v80, "me");
    v79 = (id)objc_claimAutoreleasedReturnValue();
  }

  formMetadata = self->_formMetadata;
  v114 = 0;
  v6 = (id)objc_msgSend(v80, "valuesForContactFormWithMetadata:matches:multiRoundAutoFillManager:existingMatches:contact:", formMetadata, &v114, self->_multiRoundAutoFillManager, 0, v79);
  v72 = v114;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, _SFDeviceIsPad());
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  hideMyEmailRecord = self->_hideMyEmailRecord;
  if (hideMyEmailRecord && !-[WBSHideMyEmailRecord state](hideMyEmailRecord, "state", v72))
  {
    v8 = (void *)MEMORY[0x1E0DC3448];
    -[WBSHideMyEmailRecord privateEmailAddress](self->_hideMyEmailRecord, "privateEmailAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v113[0] = MEMORY[0x1E0C809B0];
    v113[1] = 3221225472;
    v113[2] = __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke;
    v113[3] = &unk_1E4AC0010;
    v113[4] = self;
    objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v113);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "addAction:", v10);

  }
  objc_msgSend(MEMORY[0x1E0D8A950], "specifierForControl:", self->_textFieldMetadata, v72);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D8A950];
  objc_msgSend(v75, "property");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isNameProperty:", v12))
  {

  }
  else
  {
    objc_msgSend(v75, "component");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DD9930]);

    if (!v14)
    {
      v53 = -[SFFormAutocompleteState _bestTextFieldMetadataForMetadata:](self, "_bestTextFieldMetadataForMetadata:", self->_textFieldMetadata);
      textFieldMetadata = self->_textFieldMetadata;
      objc_msgSend(WeakRetained, "lastFilledContact");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v97[0] = MEMORY[0x1E0C809B0];
      v97[1] = 3221225472;
      v97[2] = __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_4;
      v97[3] = &unk_1E4AC00B0;
      v98 = v82;
      v99 = self;
      objc_msgSend(v80, "gatherAutoFillDisplayDataWithTextField:displayedInQuickType:prefix:contact:completionHandler:", textFieldMetadata, 0, 0, v55, v97);

      v52 = v98;
      goto LABEL_51;
    }
  }
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v79, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setTitle:", v15);

  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  objc_msgSend(v80, "recentlyUsedAutoFillSets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v109, v121, 16);
  obj = v16;
  if (!v17)
  {
    v88 = 0;
    goto LABEL_40;
  }
  v81 = v17;
  v88 = 0;
  v78 = *(_QWORD *)v110;
  v89 = (id)*MEMORY[0x1E0C96FF8];
  v18 = (void *)*MEMORY[0x1E0C97070];
  do
  {
    v87 = 0;
    v84 = v88;
    do
    {
      if (*(_QWORD *)v110 != v78)
        objc_enumerationMutation(obj);
      v83 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v87);
      objc_msgSend(v83, "fillMatches");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v85, "count"))
        goto LABEL_29;
      v118 = 0u;
      v119 = 0u;
      v116 = 0u;
      v117 = 0u;
      v19 = v85;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v116, v122, 16);
      if (!v20)
      {

LABEL_29:
        v88 = 0;
        goto LABEL_30;
      }
      v21 = 0;
      v22 = *(_QWORD *)v117;
      v23 = 1;
      v24 = 1;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v117 != v22)
            objc_enumerationMutation(v19);
          v26 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
          objc_msgSend(v26, "label");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27 == 0;

          if (!v28)
          {
            objc_msgSend(v26, "label");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "isEqualToString:", v89);

            objc_msgSend(v26, "label");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "isEqualToString:", v18);

            v23 &= v30;
            v24 &= v32;
            v21 = 1;
          }
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v116, v122, 16);
      }
      while (v20);

      if ((v21 & 1) == 0)
        goto LABEL_29;
      if ((v23 & 1) != 0)
      {
        v33 = v89;
      }
      else
      {
        if ((v24 & 1) == 0)
          goto LABEL_29;
        v33 = v18;
      }
      v88 = v33;
LABEL_30:

      objc_msgSend(v80, "contactAutoFillSetForRecentlyUsedAutoFillSet:contact:form:", v83, v79, self->_formMetadata);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "fillDisplayProperties");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v35, "count"))
      {
        _WBSLocalizedString();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        _WBSLocalizedString();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "componentsJoinedByString:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v106[0] = MEMORY[0x1E0C809B0];
        v106[1] = 3221225472;
        v106[2] = __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_2;
        v106[3] = &unk_1E4AC0888;
        objc_copyWeak(&v108, &location);
        v107 = v34;
        -[SFFormAutocompleteState _addActionForAlertController:title:detail:handler:](self, "_addActionForAlertController:title:detail:handler:", v82, v36, v38, v106);

        objc_destroyWeak(&v108);
      }

      v84 = v88;
      ++v87;
    }
    while (v87 != v81);
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v121, 16);
    v81 = v39;
  }
  while (v39);
LABEL_40:

  objc_msgSend(v80, "orderedHomeAndWorkSetsForContact:form:", v79, self->_formMetadata);
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v90 = (id)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v102, v120, 16);
  if (v40)
  {
    v41 = *(_QWORD *)v103;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v103 != v41)
          objc_enumerationMutation(v90);
        v43 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * j);
        objc_msgSend(v43, "label");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v88, "isEqualToString:", v44);

        if ((v45 & 1) == 0)
        {
          v46 = (void *)MEMORY[0x1E0C97338];
          objc_msgSend(v43, "label");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "localizedStringForLabel:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "fillDisplayProperties");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          _WBSLocalizedString();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "componentsJoinedByString:", v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v100[0] = MEMORY[0x1E0C809B0];
          v100[1] = 3221225472;
          v100[2] = __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_3;
          v100[3] = &unk_1E4AC0888;
          objc_copyWeak(&v101, &location);
          v100[4] = v43;
          -[SFFormAutocompleteState _addActionForAlertController:title:detail:handler:](self, "_addActionForAlertController:title:detail:handler:", v82, v48, v51, v100);

          objc_destroyWeak(&v101);
        }
      }
      v40 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v102, v120, 16);
    }
    while (v40);
  }

  v52 = v88;
LABEL_51:

  v56 = self->_hideMyEmailRecord;
  if (v56 && -[WBSHideMyEmailRecord state](v56, "state") == 1)
  {
    v57 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v96[0] = MEMORY[0x1E0C809B0];
    v96[1] = 3221225472;
    v96[2] = __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_7;
    v96[3] = &unk_1E4AC0010;
    v96[4] = self;
    objc_msgSend(v57, "actionWithTitle:style:handler:", v58, 0, v96);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "addAction:", v59);

  }
  v60 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = MEMORY[0x1E0C809B0];
  v93[0] = MEMORY[0x1E0C809B0];
  v93[1] = 3221225472;
  v93[2] = __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_8;
  v93[3] = &unk_1E4AC09C8;
  v93[4] = self;
  v63 = v73;
  v94 = v63;
  v64 = v79;
  v95 = v64;
  objc_msgSend(v60, "actionWithTitle:style:handler:", v61, 0, v93);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "addAction:", v65);

  v66 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = v62;
  v92[1] = 3221225472;
  v92[2] = __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_9;
  v92[3] = &unk_1E4AC0010;
  v92[4] = self;
  objc_msgSend(v66, "actionWithTitle:style:handler:", v67, 0, v92);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "addAction:", v68);

  v69 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = v62;
  v91[1] = 3221225472;
  v91[2] = __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_10;
  v91[3] = &unk_1E4AC0010;
  v91[4] = self;
  objc_msgSend(v69, "actionWithTitle:style:handler:", v70, 1, v91);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "addAction:", v71);

  if (v82)
  {
    -[SFFormAutocompleteState _setShowingKeyboardInputView:](self, "_setShowingKeyboardInputView:", 0);
    -[SFFormAutocompleteState _presentViewController:presentingViewController:animated:completion:](self, "_presentViewController:presentingViewController:animated:completion:", v82, v74, 1, 0);
  }

  objc_destroyWeak(&location);
}

uint64_t __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_autoFillHideMyEmailRecord:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));
}

void __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_autoFillWithSet:", *(_QWORD *)(a1 + 32));

}

void __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_autoFillWithSet:", *(_QWORD *)(a1 + 32));

}

void __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_4(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_5;
  v6[3] = &unk_1E4AC4238;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v6);

}

void __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(v3, "valueString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (objc_msgSend(v7, "length"))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97338], "localizedStringForLabel:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v8, v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = v8;
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_6;
  v15[3] = &unk_1E4AC0128;
  v15[4] = *(_QWORD *)(a1 + 40);
  v16 = v3;
  v13 = v3;
  objc_msgSend(v5, "actionWithTitle:style:handler:", v12, 0, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v14);

}

uint64_t __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_autoFillDisplayData:setAutoFilled:", *(_QWORD *)(a1 + 40), 1);
}

uint64_t __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_provisionHideMyEmailRecord");
}

uint64_t __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_switchToCustomInputViewWithMatches:contact:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showOtherContactOptions");
}

uint64_t __50__SFFormAutocompleteState__offerToAutoFillContact__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setShowingKeyboardInputView:", 1);
}

- (void)_autoFillDisplayData:(id)a3 setAutoFilled:(BOOL)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;
  WBSFormMetadata *formMetadata;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  void *v38;
  _QWORD v39[3];

  v31 = a4;
  v39[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  objc_msgSend(v5, "fillMatches");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0D8ABA8]);
  objc_msgSend(v5, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(v5, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithFillMatches:skipMatches:label:", v7, MEMORY[0x1E0C9AA60], v10);
  }
  else
  {
    objc_msgSend(v7, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "property");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithFillMatches:skipMatches:label:", v7, MEMORY[0x1E0C9AA60], v12);

  }
  v13 = (unint64_t)objc_msgSend(v7, "count") < 2;
  formMetadata = self->_formMetadata;
  objc_msgSend(WeakRetained, "me");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "valuesForContactFormWithMetadata:matches:multiRoundAutoFillManager:existingMatches:shouldUseExistingMatchesToFillFocusedField:contact:", formMetadata, 0, 0, v11, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = WeakRetained;
  v30 = (void *)v11;
  if (!objc_msgSend(v16, "count")
    && objc_msgSend(v7, "count") == 1
    && (-[WBSFormMetadata containsActiveElement](self->_formMetadata, "containsActiveElement") & 1) == 0)
  {
    -[WBSFormControlMetadata uniqueID](self->_textFieldMetadata, "uniqueID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 && v19)
    {
      v38 = v17;
      v39[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
      v20 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v20;
    }

  }
  v21 = (void *)MEMORY[0x1E0D8A950];
  objc_msgSend(v16, "allKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "nextFieldAfterControls:inForm:", v22, self->_formMetadata);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_loadWeakRetained((id *)&self->_autoFillController);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v16, "allKeys");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v34;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v34 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(v24, "reportAutoFillOfferedType:forTextFieldWithID:forFormMetadata:", 4, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v29++), self->_formMetadata);
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v27);
  }

  objc_msgSend(v24, "autoFillFormInFrame:withValues:setAutoFilled:focusFieldAfterFilling:fieldToFocus:submitForm:", self->_frame, v16, v31, v23 != 0, v23, 0);
}

- (void)_switchToCustomInputViewWithMatches:(id)a3 contact:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id customAutoFillContactCompletionHandler;
  SFContactAutoFillViewController *v16;
  SFContactAutoFillViewController *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  id v25;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  objc_msgSend(WeakRetained, "webView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "webui_preventNavigationDuringAutoFillPrompt");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFFormAutocompleteState _viewControllerToPresentFrom](self, "_viewControllerToPresentFrom");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __71__SFFormAutocompleteState__switchToCustomInputViewWithMatches_contact___block_invoke;
  v22 = &unk_1E4AC4288;
  v12 = v11;
  v23 = v12;
  objc_copyWeak(&v25, &location);
  v13 = v10;
  v24 = v13;
  v14 = (void *)MEMORY[0x1A8598C40](&v19);
  customAutoFillContactCompletionHandler = self->_customAutoFillContactCompletionHandler;
  self->_customAutoFillContactCompletionHandler = v14;

  v16 = [SFContactAutoFillViewController alloc];
  v17 = -[SFContactAutoFillViewController initWithMatches:contact:](v16, "initWithMatches:contact:", v6, v7, v19, v20, v21, v22);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v17);
  objc_msgSend(v18, "setModalPresentationStyle:", 2);
  -[SFContactAutoFillViewController setAutoFiller:](v17, "setAutoFiller:", self);
  -[SFFormAutocompleteState _setShowingKeyboardInputView:](self, "_setShowingKeyboardInputView:", 0);
  -[SFFormAutocompleteState _presentViewController:presentingViewController:animated:completion:](self, "_presentViewController:presentingViewController:animated:completion:", v18, v12, 1, 0);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __71__SFFormAutocompleteState__switchToCustomInputViewWithMatches_contact___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__SFFormAutocompleteState__switchToCustomInputViewWithMatches_contact___block_invoke_2;
  v3[3] = &unk_1E4AC4260;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v3);

  objc_destroyWeak(&v5);
}

uint64_t __71__SFFormAutocompleteState__switchToCustomInputViewWithMatches_contact___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setShowingKeyboardInputView:", 1);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_showOtherContactOptions
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id displayOtherContactsCompletionHandler;
  void *v12;
  objc_class *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  objc_msgSend(WeakRetained, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webui_preventNavigationDuringAutoFillPrompt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFFormAutocompleteState _viewControllerToPresentFrom](self, "_viewControllerToPresentFrom");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__SFFormAutocompleteState__showOtherContactOptions__block_invoke;
  v15[3] = &unk_1E4AC42D8;
  v8 = v6;
  v16 = v8;
  objc_copyWeak(&v18, &location);
  v9 = v5;
  v17 = v9;
  v10 = (void *)MEMORY[0x1A8598C40](v15);
  displayOtherContactsCompletionHandler = self->_displayOtherContactsCompletionHandler;
  self->_displayOtherContactsCompletionHandler = v10;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v12 = (void *)getCNContactPickerViewControllerClass_softClass;
  v24 = getCNContactPickerViewControllerClass_softClass;
  if (!getCNContactPickerViewControllerClass_softClass)
  {
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __getCNContactPickerViewControllerClass_block_invoke;
    v20[3] = &unk_1E4ABFC78;
    v20[4] = &v21;
    __getCNContactPickerViewControllerClass_block_invoke((uint64_t)v20);
    v12 = (void *)v22[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v21, 8);
  v14 = objc_alloc_init(v13);
  objc_msgSend(v14, "setDelegate:", self);
  objc_msgSend(v14, "setModalPresentationStyle:", 2);
  -[SFFormAutocompleteState _setShowingKeyboardInputView:](self, "_setShowingKeyboardInputView:", 0);
  objc_msgSend(v8, "presentViewController:animated:completion:", v14, 1, 0);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __51__SFFormAutocompleteState__showOtherContactOptions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__SFFormAutocompleteState__showOtherContactOptions__block_invoke_2;
  v10[3] = &unk_1E4AC42B0;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  v8 = v5;
  v11 = v8;
  v9 = v6;
  v12 = v9;
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v10);

  objc_destroyWeak(&v14);
}

void __51__SFFormAutocompleteState__showOtherContactOptions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 40))
      objc_msgSend(WeakRetained, "_switchToCustomInputViewWithMatches:contact:");
    else
      objc_msgSend(WeakRetained, "_setShowingKeyboardInputView:", 1);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)dismissCustomAutoFill
{
  id customAutoFillContactCompletionHandler;
  id v4;
  void (**v5)(void);

  customAutoFillContactCompletionHandler = self->_customAutoFillContactCompletionHandler;
  if (customAutoFillContactCompletionHandler)
  {
    v5 = (void (**)(void))MEMORY[0x1A8598C40](customAutoFillContactCompletionHandler, a2);
    v4 = self->_customAutoFillContactCompletionHandler;
    self->_customAutoFillContactCompletionHandler = 0;

    v5[2]();
  }
}

- (void)performAutoFillWithMatchSelections:(id)a3 doNotFill:(id)a4 contact:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  id v28;
  id WeakRetained;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  SFFormAutoFillFrameHandle *frame;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[5];
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  void *v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v45 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v58 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v16, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "length");

        if (v18)
        {
          objc_msgSend(v16, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "property");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, v20);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    }
    while (v13);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v21 = v9;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v54;
    v25 = *MEMORY[0x1E0D8B358];
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v54 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * j), "property");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v25, v27);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
    }
    while (v23);
  }

  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __80__SFFormAutocompleteState_performAutoFillWithMatchSelections_doNotFill_contact___block_invoke;
  v51[3] = &unk_1E4AC4300;
  v51[4] = self;
  v28 = v45;
  v52 = v28;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v51);
  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  v30 = objc_loadWeakRetained((id *)&self->_dataController);
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8ABA8]), "initWithFillMatches:skipMatches:label:", v11, v21, 0);
  objc_msgSend(v30, "valuesForContactFormWithMetadata:matches:multiRoundAutoFillManager:existingMatches:contact:", self->_formMetadata, 0, self->_multiRoundAutoFillManager);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0DD9910], "contactIsMe:", v28))
    objc_msgSend(v30, "saveRecentlyUsedAutoFillSetWithMatchesToFill:matchesForDoNotFill:", v11, v21);
  v44 = v30;
  v31 = (void *)MEMORY[0x1E0D8A950];
  objc_msgSend(v46, "allKeys");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "nextFieldAfterControls:inForm:", v32, self->_formMetadata);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(v46, "allKeys");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v48;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v48 != v36)
          objc_enumerationMutation(v33);
        objc_msgSend(WeakRetained, "reportAutoFillOfferedType:forTextFieldWithID:forFormMetadata:", 4, *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * k), self->_formMetadata);
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
    }
    while (v35);
  }

  objc_msgSend(WeakRetained, "autoFillFormInFrame:withValues:setAutoFilled:focusFieldAfterFilling:fieldToFocus:submitForm:", self->_frame, v46, 1, v42 != 0, v42, 0);
  v41 = -[WBSFormMetadata uniqueID](self->_formMetadata, "uniqueID");
  frame = self->_frame;
  v61 = *MEMORY[0x1E0D8B098];
  objc_msgSend(v28, "identifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v39;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "annotateForm:inFrame:withValues:", v41, frame, v40);

  objc_msgSend(WeakRetained, "setLastFilledContact:", v28);
  -[SFFormAutocompleteState dismissCustomAutoFill](self, "dismissCustomAutoFill");

}

void __80__SFFormAutocompleteState_performAutoFillWithMatchSelections_doNotFill_contact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(*(_QWORD *)(a1 + 32) + 24);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "setPreferredIdentifier:forProperty:withContact:", v6, v7, *(_QWORD *)(a1 + 40));

}

- (void)contactPickerDidCancel:(id)a3
{
  id displayOtherContactsCompletionHandler;
  id v5;

  v5 = (id)MEMORY[0x1A8598C40](self->_displayOtherContactsCompletionHandler, a2, a3);
  displayOtherContactsCompletionHandler = self->_displayOtherContactsCompletionHandler;
  self->_displayOtherContactsCompletionHandler = 0;

  (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id displayOtherContactsCompletionHandler;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;
  id WeakRetained;
  WBSFormMetadata *formMetadata;
  id v11;
  id v12;
  id v13;

  displayOtherContactsCompletionHandler = self->_displayOtherContactsCompletionHandler;
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8598C40](displayOtherContactsCompletionHandler);
  v8 = self->_displayOtherContactsCompletionHandler;
  self->_displayOtherContactsCompletionHandler = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  formMetadata = self->_formMetadata;
  v13 = 0;
  v11 = (id)objc_msgSend(WeakRetained, "valuesForContactFormWithMetadata:matches:multiRoundAutoFillManager:existingMatches:contact:", formMetadata, &v13, self->_multiRoundAutoFillManager, 0, v6);
  v12 = v13;

  ((void (**)(_QWORD, id, id))v7)[2](v7, v12, v6);
}

- (id)_correctedFormMetadata:(id)a3
{
  id v4;
  WBSFormAutoFillMetadataCorrector *metadataCorrector;
  id v6;
  void *v7;

  v4 = a3;
  metadataCorrector = self->_metadataCorrector;
  if (metadataCorrector)
  {
    -[WBSFormAutoFillMetadataCorrector bestAvailableMetadataFromMetadata:](metadataCorrector, "bestAvailableMetadataFromMetadata:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (id)_bestTextFieldMetadataForMetadata:(id)a3
{
  id v4;
  WBSFormAutoFillMetadataCorrector *metadataCorrector;
  id v6;
  void *v7;

  v4 = a3;
  metadataCorrector = self->_metadataCorrector;
  if (metadataCorrector)
  {
    -[WBSFormAutoFillMetadataCorrector bestAvailableMetadataFromControlMetadata:](metadataCorrector, "bestAvailableMetadataFromControlMetadata:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (void)getTextSuggestionForStreamlinedAutoFillWithCredentialIdentity:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  id WeakRetained;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  _QWORD v15[5];
  void (**v16)(id, void *);
  char v17;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataController);
  objc_msgSend(WeakRetained, "autoFillQuirksManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isAutomaticLoginDisallowedOnURL:", v10) & 1) != 0)
    v11 = 0;
  else
    v11 = -[WBSFormMetadata isEligibleForAutomaticLogin](self->_formMetadata, "isEligibleForAutomaticLogin");

  if (v6)
  {
    -[SFFormAutocompleteState _textSuggestionForExternalCredentialIdentity:submitForm:](self, "_textSuggestionForExternalCredentialIdentity:submitForm:", v6, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D8A020], "sharedFeatureManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "shouldAutoFillPasswordsFromKeychain");

    if (v14)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __100__SFFormAutocompleteState_getTextSuggestionForStreamlinedAutoFillWithCredentialIdentity_completion___block_invoke;
      v15[3] = &unk_1E4AC4328;
      v15[4] = self;
      v16 = v7;
      v17 = v11;
      -[SFFormAutocompleteState _getMatchingKeychainCredentialsIncludingCredentialsWithEmptyUsernames:withCompletion:](self, "_getMatchingKeychainCredentialsIncludingCredentialsWithEmptyUsernames:withCompletion:", 0, v15);

    }
    else
    {
      v7[2](v7, 0);
    }
  }

}

void __100__SFFormAutocompleteState_getTextSuggestionForStreamlinedAutoFillWithCredentialIdentity_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v6 = (id)v3;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_textSuggestionForCredentialDisplayData:submitForm:", v3, *(unsigned __int8 *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }

}

- (void)oneTimeCodeProviderReceivedCode:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SFFormAutocompleteState_oneTimeCodeProviderReceivedCode___block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __59__SFFormAutocompleteState_oneTimeCodeProviderReceivedCode___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = WBS_LOG_CHANNEL_PREFIXOneTimeCodeAutoFill();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __59__SFFormAutocompleteState_oneTimeCodeProviderReceivedCode___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  return objc_msgSend(*(id *)(a1 + 32), "updateSuggestions");
}

- (void)newAutoFillablePasskeysAvailable:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SFFormAutocompleteState_newAutoFillablePasskeysAvailable___block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __60__SFFormAutocompleteState_newAutoFillablePasskeysAvailable___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];
  uint8_t buf[16];

  v2 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3B2D000, v2, OS_LOG_TYPE_INFO, "Received new passkeys available notification. Refreshing AutoFill state.", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_clearCachedCredentials");
  objc_msgSend(*(id *)(a1 + 32), "updateSuggestions");
  v3 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__SFFormAutocompleteState_newAutoFillablePasskeysAvailable___block_invoke_331;
  v15[3] = &unk_1E4ABFD00;
  v15[4] = *(_QWORD *)(a1 + 32);
  v4 = (void *)MEMORY[0x1A8598C40](v15);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96))
  {
    v5 = (void *)MEMORY[0x1A8598C40]();
    v12[0] = v3;
    v12[1] = 3221225472;
    v12[2] = __60__SFFormAutocompleteState_newAutoFillablePasskeysAvailable___block_invoke_2;
    v12[3] = &unk_1E4AC3BD8;
    v13 = v4;
    v14 = v5;
    v6 = v5;
    v7 = MEMORY[0x1A8598C40](v12);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 96);
    *(_QWORD *)(v8 + 96) = v7;

  }
  else
  {
    v10 = MEMORY[0x1A8598C40](v4);
    v11 = *(_QWORD *)(a1 + 32);
    v6 = *(id *)(v11 + 96);
    *(_QWORD *)(v11 + 96) = v10;
  }

}

void __60__SFFormAutocompleteState_newAutoFillablePasskeysAvailable___block_invoke_331(uint64_t a1, void *a2)
{
  void *v3;
  SFCredentialDisplayData *v4;
  void *v5;
  void *v6;
  void *v7;
  SFCredentialDisplayData *v8;
  void *v9;
  id WeakRetained;
  id v11;

  objc_msgSend(a2, "firstObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "autoFillPasskey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [SFCredentialDisplayData alloc];
    detailStringForPasskey(v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "savedAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "creationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SFCredentialDisplayData initWithMatch:detail:creationDate:](v4, "initWithMatch:detail:creationDate:", v11, v5, v7);

    objc_msgSend(*(id *)(a1 + 32), "_textSuggestionForCredentialDisplayData:submitForm:", v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(WeakRetained, "updateExistingStreamlinedSuggestionIfNecessary:", v9);

  }
}

void __60__SFFormAutocompleteState_newAutoFillablePasskeysAvailable___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_clearCachedCredentials
{
  NSArray *cachedCredentialMatches;
  NSArray *cachedRelatedCredentialMatches;
  NSArray *cachedExternalCredentialIdentities;

  cachedCredentialMatches = self->_cachedCredentialMatches;
  self->_cachedCredentialMatches = 0;

  cachedRelatedCredentialMatches = self->_cachedRelatedCredentialMatches;
  self->_cachedRelatedCredentialMatches = 0;

  cachedExternalCredentialIdentities = self->_cachedExternalCredentialIdentities;
  self->_cachedExternalCredentialIdentities = 0;

}

- (id)externalCredentialIdentities
{
  if (self->_cachedExternalCredentialIdentities)
    return self->_cachedExternalCredentialIdentities;
  else
    return MEMORY[0x1E0C9AA60];
}

- (id)_textSuggestionForExternalCredentialIdentity:(id)a3 submitForm:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a4;
  v6 = a3;
  +[_SFTextSuggestion textSuggestionWithCredentialIdentity:submitForm:](_SFTextSuggestion, "textSuggestionWithCredentialIdentity:submitForm:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFCredentialDisplayData descriptionForPasswordWithUser:creationDate:](SFCredentialDisplayData, "descriptionForPasswordWithUser:creationDate:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDisplayText:", v9);

  v10 = (void *)MEMORY[0x1E0D8A060];
  -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "titleForCredentialIdentity:formURL:", v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setHeaderText:", v12);
  return v7;
}

- (BOOL)_shouldAllowExternalPasswordAutoFillOnURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D8A020], "sharedFeatureManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "shouldAutoFillPasswords"))
  {
    v5 = (void *)MEMORY[0x1E0D8AA88];
    objc_msgSend(v3, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "mayAutoFillPasswordOnHost:", v6))
    {
      objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "getEnabledExtensionsSynchronously");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count") != 0;

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_fillCredentialIdentity:(id)a3 submitForm:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v6 = a3;
  objc_msgSend(v6, "owningExtensionState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "providerBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__SFFormAutocompleteState__fillCredentialIdentity_submitForm___block_invoke;
  v11[3] = &unk_1E4AC4378;
  v13 = a4;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "getExtensionWithBundleID:completion:", v8, v11);

}

void __62__SFFormAutocompleteState__fillCredentialIdentity_submitForm___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  char v9;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __62__SFFormAutocompleteState__fillCredentialIdentity_submitForm___block_invoke_2;
  v6[3] = &unk_1E4AC3978;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[1] = 3221225472;
  v9 = *(_BYTE *)(a1 + 48);
  v7 = v4;
  v8 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __62__SFFormAutocompleteState__fillCredentialIdentity_submitForm___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void **v10;
  char v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _QWORD v28[5];
  id v29;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 168) = *(_BYTE *)(a1 + 56);
  v2 = objc_msgSend(*(id *)(a1 + 40), "type");
  switch(v2)
  {
    case 4:
      objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void **)(a1 + 48);
      v11 = objc_msgSend(v9, "extensionSupportsOneTimeCodes:", *(_QWORD *)(a1 + 48));

      if ((v11 & 1) != 0)
      {
        v12 = objc_alloc(MEMORY[0x1E0C92640]);
        v13 = *(_QWORD *)(a1 + 48);
        v14 = objc_alloc(MEMORY[0x1E0C925C8]);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C925C0]), "_initWithFoundationCredentialIdentity:", *(_QWORD *)(a1 + 40));
        v16 = (void *)objc_msgSend(v14, "initWithCredentialIdentity:", v15);
        v17 = objc_msgSend(v12, "initWithExtension:oneTimeCodeCredentialRequest:", v13, v16);
        v18 = *(_QWORD *)(a1 + 32);
        v19 = *(void **)(v18 + 152);
        *(_QWORD *)(v18 + 152) = v17;

LABEL_7:
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setDelegate:");
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setDismissOnBackground:", 1);
        return;
      }
      v27 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        __62__SFFormAutocompleteState__fillCredentialIdentity_submitForm___block_invoke_2_cold_1(v10, v27);
      break;
    case 2:
      v20 = *(void **)(*(_QWORD *)(a1 + 32) + 192);
      v21 = (void *)MEMORY[0x1E0CB34D0];
      v22 = *(id *)(a1 + 40);
      objc_msgSend(v21, "mainBundle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bundleIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "serviceIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "credentialID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __62__SFFormAutocompleteState__fillCredentialIdentity_submitForm___block_invoke_3;
      v28[3] = &unk_1E4AC4350;
      v28[4] = *(_QWORD *)(a1 + 32);
      v29 = *(id *)(a1 + 48);
      objc_msgSend(v20, "getExternalPasskeyRequestForApplicationIdentifier:relyingPartyIdentifier:credentialID:completionHandler:", v24, v25, v26, v28);

      break;
    case 1:
      v3 = objc_alloc(MEMORY[0x1E0C92640]);
      v4 = *(_QWORD *)(a1 + 48);
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C925D8]), "initWithFoundationCredentialIdentity:", *(_QWORD *)(a1 + 40));
      v6 = objc_msgSend(v3, "initWithExtension:credentialIdentity:", v4, v5);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 152);
      *(_QWORD *)(v7 + 152) = v6;

      goto LABEL_7;
    default:
      return;
  }
}

uint64_t __62__SFFormAutocompleteState__fillCredentialIdentity_submitForm___block_invoke_3(uint64_t result, void *a2)
{
  uint64_t v2;
  objc_class *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (a2)
  {
    v2 = result;
    v3 = (objc_class *)MEMORY[0x1E0C92640];
    v4 = a2;
    v5 = objc_msgSend([v3 alloc], "initWithExtension:passkeyAssertionRequest:", *(_QWORD *)(v2 + 40), v4);

    v6 = *(_QWORD *)(v2 + 32);
    v7 = *(void **)(v6 + 152);
    *(_QWORD *)(v6 + 152) = v5;

    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 152), "setDelegate:");
    return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 152), "setDismissOnBackground:", 1);
  }
  return result;
}

- (void)_fillASPasswordCredential:(id)a3 needsAuthentication:(BOOL)a4 setAutoFilled:(BOOL)a5 submitForm:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL4 v8;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v10 = (void *)MEMORY[0x1E0C92C60];
  v11 = a3;
  objc_msgSend(v11, "user");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "password");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "safari_credentialWithUser:password:persistence:", v12, v13, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[SFFormAutocompleteState _fillCredentialAfterAuthenticationIfNeeded:setAsDefaultCredential:submitForm:](self, "_fillCredentialAfterAuthenticationIfNeeded:setAsDefaultCredential:submitForm:", v14, 0, v6);
  else
    -[SFFormAutocompleteState _fillCredential:setAutoFilled:setAsDefaultCredential:focusFieldAfterFilling:submitForm:](self, "_fillCredential:setAutoFilled:setAsDefaultCredential:focusFieldAfterFilling:submitForm:", v14, v7, 0, v6, v6);

}

- (void)_fillASOneTimeCodeCredential:(id)a3 setAutoFilled:(BOOL)a4 submitForm:(BOOL)a5
{
  _BOOL8 v5;
  _SFFormAutoFillController **p_autoFillController;
  id v8;
  SFFormAutoFillFrameHandle *frame;
  void *v10;
  id WeakRetained;

  v5 = a5;
  p_autoFillController = &self->_autoFillController;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_autoFillController);
  frame = self->_frame;
  objc_msgSend(v8, "code");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "autoFillOneTimeCodeFieldsInFrame:withValue:shouldSubmit:", frame, v10, v5);
  -[SFFormAutocompleteState updateSuggestions](self, "updateSuggestions");

}

- (id)_actionForPresentingPasswordManagerExtension:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayNameForExtension:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0DC3448];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __90__SFFormAutocompleteState__actionForPresentingPasswordManagerExtension_completionHandler___block_invoke;
  v18[3] = &unk_1E4AC43A0;
  objc_copyWeak(&v21, &location);
  v14 = v6;
  v19 = v14;
  v15 = v7;
  v20 = v15;
  objc_msgSend(v13, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v12, 0, 0, v18, &__block_literal_global_339);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v16;
}

void __90__SFFormAutocompleteState__actionForPresentingPasswordManagerExtension_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_presentCredentialListForExtension:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __90__SFFormAutocompleteState__actionForPresentingPasswordManagerExtension_completionHandler___block_invoke_2()
{
  return 1;
}

- (void)_presentCredentialListForExtension:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id externalCredentialListCompletionHandler;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  WBSAuthenticationServicesAgentProxy *authenticationServicesAgentProxy;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  SFFormAutocompleteState *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A8598C40](self->_externalCredentialListCompletionHandler);
  v9 = v8;
  v10 = MEMORY[0x1E0C809B0];
  if (v7 && v8)
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __80__SFFormAutocompleteState__presentCredentialListForExtension_completionHandler___block_invoke;
    v29[3] = &unk_1E4AC1748;
    v30 = v8;
    v31 = v7;
    v11 = (void *)MEMORY[0x1A8598C40](v29);
    externalCredentialListCompletionHandler = self->_externalCredentialListCompletionHandler;
    self->_externalCredentialListCompletionHandler = v11;

    v13 = v30;
LABEL_6:

    goto LABEL_7;
  }
  if (v7)
  {
    v14 = (void *)MEMORY[0x1A8598C40](v7);
    v13 = self->_externalCredentialListCompletionHandler;
    self->_externalCredentialListCompletionHandler = v14;
    goto LABEL_6;
  }
LABEL_7:
  v15 = objc_alloc(MEMORY[0x1E0C925B8]);
  -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "safari_originalDataAsString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithIdentifier:type:", v17, 1);
  v32[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bundleIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v10;
  v25[1] = 3221225472;
  v25[2] = __80__SFFormAutocompleteState__presentCredentialListForExtension_completionHandler___block_invoke_2;
  v25[3] = &unk_1E4AC43E8;
  v26 = v6;
  v27 = v19;
  v28 = self;
  v23 = v19;
  v24 = v6;
  -[WBSAuthenticationServicesAgentProxy getPasskeyAssertionRequestParametersForApplicationIdentifier:completionHandler:](authenticationServicesAgentProxy, "getPasskeyAssertionRequestParametersForApplicationIdentifier:completionHandler:", v22, v25);

}

uint64_t __80__SFFormAutocompleteState__presentCredentialListForExtension_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __80__SFFormAutocompleteState__presentCredentialListForExtension_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0C92648];
  v4 = a2;
  v6 = (id)objc_msgSend([v3 alloc], "initWithExtension:serviceIdentifiers:requestParameters:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v4);

  objc_msgSend(v6, "setDelegate:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v6, "setDismissOnBackground:", 1);
  objc_msgSend(*(id *)(a1 + 48), "_viewControllerToPresentFrom");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)credentialListViewController:(id)a3 didFinishWithCredential:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id externalCredentialListCompletionHandler;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1A8598C40](self->_externalCredentialListCompletionHandler);
  externalCredentialListCompletionHandler = self->_externalCredentialListCompletionHandler;
  self->_externalCredentialListCompletionHandler = 0;

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __91__SFFormAutocompleteState_credentialListViewController_didFinishWithCredential_completion___block_invoke;
  v23[3] = &unk_1E4AC1748;
  v24 = v11;
  v25 = v10;
  v22 = v10;
  v21 = v11;
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v23);
  if (v9)
    -[SFFormAutocompleteState _fillASPasswordCredential:needsAuthentication:setAutoFilled:submitForm:](self, "_fillASPasswordCredential:needsAuthentication:setAutoFilled:submitForm:", v9, 0, 0, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "user");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extension");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "tabIDForAutoFill");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "webView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "didFillPasswordForUsername:fromProviderWithBundleIdentifier:inTabWithID:currentURL:isPrivate:", v15, v17, v18, v19, objc_msgSend(v20, "webui_privateBrowsingEnabled"));

}

uint64_t __91__SFFormAutocompleteState_credentialListViewController_didFinishWithCredential_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)credentialListViewController:(id)a3 didFinishWithOneTimeCodeCredential:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id externalCredentialListCompletionHandler;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  SFFormAutocompleteState *v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1A8598C40](self->_externalCredentialListCompletionHandler);
  externalCredentialListCompletionHandler = self->_externalCredentialListCompletionHandler;
  self->_externalCredentialListCompletionHandler = 0;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__SFFormAutocompleteState_credentialListViewController_didFinishWithOneTimeCodeCredential_completion___block_invoke;
  block[3] = &unk_1E4AC4410;
  v21 = v11;
  v22 = v10;
  v18 = v8;
  v19 = v9;
  v20 = self;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __102__SFFormAutocompleteState_credentialListViewController_didFinishWithOneTimeCodeCredential_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __102__SFFormAutocompleteState_credentialListViewController_didFinishWithOneTimeCodeCredential_completion___block_invoke_2;
  v7 = &unk_1E4AC1748;
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, &v4);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    objc_msgSend(*(id *)(a1 + 48), "_fillASOneTimeCodeCredential:setAutoFilled:submitForm:", v3, 0, 0, v4, v5, v6, v7, v8);

}

uint64_t __102__SFFormAutocompleteState_credentialListViewController_didFinishWithOneTimeCodeCredential_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)presentUIForPasswordCredentialAuthenticationViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SFFormAutocompleteState _viewControllerToPresentFrom](self, "_viewControllerToPresentFrom");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  id v9;
  _BOOL4 submitExternalCredential;
  _ASCredentialAuthenticationViewController *externalCredentialViewController;
  id v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v9 = a4;
  submitExternalCredential = self->_submitExternalCredential;
  self->_submitExternalCredential = 0;
  externalCredentialViewController = self->_externalCredentialViewController;
  self->_externalCredentialViewController = 0;
  v12 = a6;

  objc_msgSend(v22, "presentingViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "dismissViewControllerAnimated:completion:", 1, v12);
  if (v9)
    -[SFFormAutocompleteState _fillASPasswordCredential:needsAuthentication:setAutoFilled:submitForm:](self, "_fillASPasswordCredential:needsAuthentication:setAutoFilled:submitForm:", v9, v13 == 0, 1, submitExternalCredential);
  WeakRetained = objc_loadWeakRetained((id *)&self->_autoFillController);
  +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "user");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "extension");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "tabIDForAutoFill");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFFormAutoFillFrameHandle webui_URL](self->_frame, "webui_URL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "webView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "didFillPasswordForUsername:fromProviderWithBundleIdentifier:inTabWithID:currentURL:isPrivate:", v16, v18, v19, v20, objc_msgSend(v21, "webui_privateBrowsingEnabled"));

}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithOneTimeCodeCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  _BOOL4 submitExternalCredential;
  _ASCredentialAuthenticationViewController *externalCredentialViewController;
  id v11;
  id v12;
  void *v13;
  id v14;

  v14 = a4;
  submitExternalCredential = self->_submitExternalCredential;
  self->_submitExternalCredential = 0;
  externalCredentialViewController = self->_externalCredentialViewController;
  self->_externalCredentialViewController = 0;
  v11 = a6;
  v12 = a3;

  objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, v11);
  v13 = v14;
  if (v14)
  {
    -[SFFormAutocompleteState _fillASOneTimeCodeCredential:setAutoFilled:submitForm:](self, "_fillASOneTimeCodeCredential:setAutoFilled:submitForm:", v14, 1, submitExternalCredential);
    v13 = v14;
  }

}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  _ASCredentialAuthenticationViewController *externalCredentialViewController;
  id v10;
  id v11;
  id v12;

  externalCredentialViewController = self->_externalCredentialViewController;
  self->_externalCredentialViewController = 0;
  v10 = a6;
  v12 = a4;
  v11 = a3;

  objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, v10);
  -[SFFormAutocompleteState _completePasskeyAssertionWithCredential:completionHandler:](self, "_completePasskeyAssertionWithCredential:completionHandler:", v12, v10);

}

- (void)credentialListViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  SFFormAutocompleteState *v17;

  v8 = a3;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __107__SFFormAutocompleteState_credentialListViewController_didFinishWithPasskeyAssertionCredential_completion___block_invoke;
  v15 = &unk_1E4ABFB20;
  v16 = v8;
  v17 = self;
  v9 = v8;
  v10 = a5;
  v11 = a4;
  dispatch_async(MEMORY[0x1E0C80D38], &v12);
  -[SFFormAutocompleteState _completePasskeyAssertionWithCredential:completionHandler:](self, "_completePasskeyAssertionWithCredential:completionHandler:", v11, v10, v12, v13, v14, v15);

}

uint64_t __107__SFFormAutocompleteState_credentialListViewController_didFinishWithPasskeyAssertionCredential_completion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __107__SFFormAutocompleteState_credentialListViewController_didFinishWithPasskeyAssertionCredential_completion___block_invoke_2;
  v3[3] = &unk_1E4ABFE00;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, v3);
}

uint64_t __107__SFFormAutocompleteState_credentialListViewController_didFinishWithPasskeyAssertionCredential_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_completePasskeyAssertionWithCredential:(id)a3 completionHandler:(id)a4
{
  void *v6;
  void (**v7)(_QWORD);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WBSAuthenticationServicesAgentProxy *authenticationServicesAgentProxy;
  _QWORD block[5];

  self->_submitExternalCredential = 0;
  authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
  v6 = (void *)MEMORY[0x1E0CB34D0];
  v7 = (void (**)(_QWORD))a4;
  v8 = a3;
  objc_msgSend(v6, "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "relyingParty");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "authenticatorData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "signature");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userHandle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "credentialID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSAuthenticationServicesAgentProxy completeAssertionWithExternalPasskeyForApplicationIdentifier:relyingPartyIdentifier:authenticatorData:signature:userHandle:credentialID:](authenticationServicesAgentProxy, "completeAssertionWithExternalPasskeyForApplicationIdentifier:relyingPartyIdentifier:authenticatorData:signature:userHandle:credentialID:", v10, v11, v12, v13, v14, v15);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__SFFormAutocompleteState__completePasskeyAssertionWithCredential_completionHandler___block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v7[2](v7);

}

void __85__SFFormAutocompleteState__completePasskeyAssertionWithCredential_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "didCompleteWithPasskey");

}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (_SFFormAutoFillInputSession)inputSession
{
  return self->_inputSession;
}

- (WBSMultiRoundAutoFillManager)multiRoundAutoFillManager
{
  return self->_multiRoundAutoFillManager;
}

- (SFFormAutoFillFrameHandle)frame
{
  return self->_frame;
}

- (WBSFormMetadata)formMetadata
{
  return self->_formMetadata;
}

- (WBSFormControlMetadata)textFieldMetadata
{
  return self->_textFieldMetadata;
}

- (WBSCreditCardData)previouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance
{
  return self->_previouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance;
}

- (void)setPreviouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance:(id)a3
{
  objc_storeStrong((id *)&self->_previouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslySelectedVirtualCardWhereUserRequestedToIncreaseBalance, 0);
  objc_storeStrong((id *)&self->_textFieldMetadata, 0);
  objc_storeStrong((id *)&self->_formMetadata, 0);
  objc_storeStrong((id *)&self->_frame, 0);
  objc_storeStrong((id *)&self->_multiRoundAutoFillManager, 0);
  objc_storeStrong((id *)&self->_authenticationServicesAgentProxy, 0);
  objc_storeStrong((id *)&self->_creditCardViewController, 0);
  objc_storeStrong((id *)&self->_hideMyEmailRecord, 0);
  objc_storeStrong(&self->_externalCredentialListCompletionHandler, 0);
  objc_storeStrong((id *)&self->_externalCredentialViewController, 0);
  objc_storeStrong((id *)&self->_cachedExternalCredentialIdentities, 0);
  objc_storeStrong((id *)&self->_metadataCorrector, 0);
  objc_storeStrong(&self->_creditCardCaptureCompletionHandler, 0);
  objc_storeStrong(&self->_customAutoFillContactCompletionHandler, 0);
  objc_storeStrong(&self->_displayOtherContactsCompletionHandler, 0);
  objc_storeStrong(&self->_credentialMatchesCompletionHandler, 0);
  objc_storeStrong((id *)&self->_cachedRelatedCredentialMatches, 0);
  objc_storeStrong((id *)&self->_cachedCredentialMatches, 0);
  objc_storeStrong((id *)&self->_prefixForSuggestions, 0);
  objc_storeStrong((id *)&self->_inputSession, 0);
  objc_storeStrong((id *)&self->_formValues, 0);
  objc_storeStrong((id *)&self->_emptyInputView, 0);
  objc_destroyWeak((id *)&self->_dataController);
  objc_destroyWeak((id *)&self->_autoFillController);
}

- (void)_updateSuggestions:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1A3B2D000, a1, a3, "Did not suggested verification code autofill because no text field is focused", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_updateSuggestions:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_1A3B2D000, v0, OS_LOG_TYPE_DEBUG, "Adding verification code suggestions: %{private}@", v1, 0xCu);
  OUTLINED_FUNCTION_3_2();
}

- (void)_updateSuggestions:(os_log_t)log .cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_ERROR, "Timed out while fetching one time code credential identities", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_didGatherESimInformation
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_2(&dword_1A3B2D000, v3, v5, "Did not retrieve device identifier from CoreTelephony with error %{public}@.", v6);

  OUTLINED_FUNCTION_6();
}

- (void)_autofillESimData:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_2(&dword_1A3B2D000, v3, v5, "Did not retrieve autofill value from CoreTelephony with error %@.", v6);

  OUTLINED_FUNCTION_6();
}

- (void)_fillSavedAccount:setAutoFilled:setAsDefaultCredential:focusFieldAfterFilling:submitForm:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_2(&dword_1A3B2D000, v0, v1, "Tried to fill password but didn't have control unique ID for metadata: %{private}@", v2);
  OUTLINED_FUNCTION_3_2();
}

void __73__SFFormAutocompleteState__offerToAutoFillFromPotentialCredentialMatches__block_invoke_cold_1()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E4AC8470);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/SafariServices/iOS/MobileSafari/SafariServices/SFFormAutocompleteState.m");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %@"), v0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "!match", "-[SFFormAutocompleteState _offerToAutoFillFromPotentialCredentialMatches]_block_invoke", v3, 1693, v5);
    v4 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v1, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "!match", "-[SFFormAutocompleteState _offerToAutoFillFromPotentialCredentialMatches]_block_invoke", v3, 1693, &stru_1E4AC8470);
    v4 = objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@\n%@"), v4, v6);

  abort();
}

- (void)_buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities:(_QWORD *)a3 .cold.1(void *a1, uint8_t *a2, _QWORD *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543362;
  *a3 = a1;
  OUTLINED_FUNCTION_1_2(&dword_1A3B2D000, a4, (uint64_t)a3, "Fetched one time code credential identities for extension that does not support one time codes: %{public}@", a2);

}

- (void)_buildAndPresentOneTimeCodeAlertControllerWithExternalCredentialIdentities:(_QWORD *)a3 .cold.2(void *a1, uint8_t *a2, _QWORD *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138412290;
  *a3 = a1;
  OUTLINED_FUNCTION_1_2(&dword_1A3B2D000, a4, (uint64_t)a3, "expected one time code credential identity, got type %@", a2);

}

void __59__SFFormAutocompleteState_oneTimeCodeProviderReceivedCode___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1A3B2D000, a1, a3, "Codes were updated", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __62__SFFormAutocompleteState__fillCredentialIdentity_submitForm___block_invoke_2_cold_1(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_2(&dword_1A3B2D000, v3, v5, "Fetched one time code credential identities for extension that does not support one time codes: %{public}@", v6);

  OUTLINED_FUNCTION_6();
}

@end
