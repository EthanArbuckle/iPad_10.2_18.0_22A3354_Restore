@implementation AFSuggestionGenerationManager

+ (id)sharedInstance
{
  void *v2;

  v2 = (void *)instance;
  if (!instance)
  {
    if (sharedInstance_onceToken != -1)
      dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
    v2 = (void *)instance;
  }
  return v2;
}

void __47__AFSuggestionGenerationManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AFSuggestionGenerationManager initPrivate]([AFSuggestionGenerationManager alloc], "initPrivate");
  v1 = (void *)instance;
  instance = (uint64_t)v0;

}

- (id)initPrivate
{
  AFSuggestionGenerationManager *v2;
  AFSuggestionGenerationManager *v3;
  uint64_t v4;
  OS_dispatch_queue *queue;
  void *v6;
  id v7;
  uint64_t v8;
  _ICPredictionManaging *inputContextPredictionManager;
  AFLocalizationManager *v10;
  AFLocalizationManager *localizationManager;
  objc_super v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v13.receiver = self;
  v13.super_class = (Class)AFSuggestionGenerationManager;
  v2 = -[AFSuggestionGenerationManager init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AFSuggestionGenerationManager _makeQueue](v2, "_makeQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v15 = 0;
    v16 = &v15;
    v17 = 0x2050000000;
    v6 = (void *)get_ICInputContextFactoryClass_softClass;
    v18 = get_ICInputContextFactoryClass_softClass;
    if (!get_ICInputContextFactoryClass_softClass)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __get_ICInputContextFactoryClass_block_invoke;
      v14[3] = &unk_2508535B8;
      v14[4] = &v15;
      __get_ICInputContextFactoryClass_block_invoke((uint64_t)v14);
      v6 = (void *)v16[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v15, 8);
    objc_msgSend(v7, "predictionManager");
    v8 = objc_claimAutoreleasedReturnValue();
    inputContextPredictionManager = v3->_inputContextPredictionManager;
    v3->_inputContextPredictionManager = (_ICPredictionManaging *)v8;

    v10 = -[AFLocalizationManager initForLocalizedStrings]([AFLocalizationManager alloc], "initForLocalizedStrings");
    localizationManager = v3->_localizationManager;
    v3->_localizationManager = v10;

  }
  return v3;
}

- (id)inputContextPredictionManager
{
  return self->_inputContextPredictionManager;
}

- (id)_makeQueue
{
  NSObject *v2;
  dispatch_queue_t v3;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("com.apple.AutoFillCore.AFSuggestionGenerationManager", v2);

  return v3;
}

- (BOOL)needContactAutofill:(unint64_t)a3
{
  return a3 - 5 < 3;
}

- (void)generateAutoFillSuggestionsWithAutoFillMode:(unint64_t)a3 textPrefix:(id)a4 documentTraits:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  AFSuggestionGenerationManager *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  id v32;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v27 = MEMORY[0x24BDAC760];
  v28 = 3221225472;
  v29 = __121__AFSuggestionGenerationManager_generateAutoFillSuggestionsWithAutoFillMode_textPrefix_documentTraits_completionHandler___block_invoke;
  v30 = &unk_2508534C8;
  v13 = v11;
  v31 = v13;
  v14 = v12;
  v32 = v14;
  v15 = (void *)MEMORY[0x23B803990](&v27);
  if (a3 != 1)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      +[AFCredentialManager sharedInstance](AFCredentialManager, "sharedInstance", v27, v28, v29, v30, v31);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "generateSignupAutoFillWithAutoFillMode:documentTraits:completionHandler:", a3, v13, v14);
LABEL_5:

      goto LABEL_21;
    }
    if (a3 == 9)
    {
      -[AFSuggestionGenerationManager generateCreditCardAutoFillWithCompletionHandler:](self, "generateCreditCardAutoFillWithCompletionHandler:", v14, v27, v28, v29, v30, v31);
      goto LABEL_21;
    }
    if (!-[AFSuggestionGenerationManager needContactAutofill:](self, "needContactAutofill:", a3, v27, v28, v29, v30, v31))
    {
      if (a3 != 8)
      {
        (*((void (**)(id, _QWORD))v14 + 2))(v14, 0);
        goto LABEL_21;
      }
      +[AFCredentialManager sharedInstance](AFCredentialManager, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "generateOneTimeCodeAutoFillSuggestionsWithDocumentTraits:completionHandler:", v13, v14);
      goto LABEL_5;
    }
    objc_msgSend(v13, "textInputTraits");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "textContentType");
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20 != CFSTR("email"))
    {

LABEL_11:
      v22 = self;
      v23 = v10;
      v24 = v13;
      v25 = v14;
LABEL_20:
      -[AFSuggestionGenerationManager generateContactAutoFillSuggestionsWithTextPrefix:documentTraits:completionHandler:](v22, "generateContactAutoFillSuggestionsWithTextPrefix:documentTraits:completionHandler:", v23, v24, v25);
      goto LABEL_21;
    }
    if (v10)
    {
      v26 = objc_msgSend(v10, "length");

      if (v26)
        goto LABEL_11;
    }
    else
    {

    }
    v22 = self;
    v23 = v10;
    v24 = v13;
    v25 = v15;
    goto LABEL_20;
  }
  +[AFCredentialManager sharedInstance](AFCredentialManager, "sharedInstance", v27, v28, v29, v30, v31);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "generateLoginAutoFillWithDocumentTraits:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  (*((void (**)(id, void *))v14 + 2))(v14, v17);
LABEL_21:

}

void __121__AFSuggestionGenerationManager_generateAutoFillSuggestionsWithAutoFillMode_textPrefix_documentTraits_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD v9[5];
  id v10;

  v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy_;
  v9[4] = __Block_byref_object_dispose_;
  v10 = (id)objc_msgSend(v3, "copy");
  +[AFCredentialManager sharedInstance](AFCredentialManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __121__AFSuggestionGenerationManager_generateAutoFillSuggestionsWithAutoFillMode_textPrefix_documentTraits_completionHandler___block_invoke_29;
  v6[3] = &unk_2508534A0;
  v8 = v9;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "generateHideMyEmailAutoFillWithRenderTraits:completionHandler:", v5, v6);

  _Block_object_dispose(v9, 8);
}

void __121__AFSuggestionGenerationManager_generateAutoFillSuggestionsWithAutoFillMode_textPrefix_documentTraits_completionHandler___block_invoke_29(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "arrayByAddingObject:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __121__AFSuggestionGenerationManager_generateAutoFillSuggestionsWithAutoFillMode_textPrefix_documentTraits_completionHandler___block_invoke_2;
  v8[3] = &unk_250853478;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = v6;
  v10 = v7;
  AFDispatchAsync(MEMORY[0x24BDAC9B8], v8);

}

uint64_t __121__AFSuggestionGenerationManager_generateAutoFillSuggestionsWithAutoFillMode_textPrefix_documentTraits_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)generateCreditCardAutoFillWithCompletionHandler:(id)a3
{
  void *v3;
  id v4;
  id v5;
  BOOL v6;
  NSObject *v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  AFSuggestion *v27;
  NSObject *v28;
  void *v29;
  void (**v30)(id, id);
  void *v31;
  id obj;
  uint64_t v33;
  id v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v30 = (void (**)(id, id))a3;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2050000000;
  v3 = (void *)getSFSafariCreditCardStoreClass_softClass;
  v49 = getSFSafariCreditCardStoreClass_softClass;
  if (!getSFSafariCreditCardStoreClass_softClass)
  {
    v41 = MEMORY[0x24BDAC760];
    v42 = 3221225472;
    v43 = (uint64_t)__getSFSafariCreditCardStoreClass_block_invoke;
    v44 = &unk_2508535B8;
    v45 = &v46;
    __getSFSafariCreditCardStoreClass_block_invoke((uint64_t)&v41);
    v3 = (void *)v47[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v46, 8);
  v40 = 0;
  objc_msgSend(v4, "savedCreditCardsWithError:", &v40);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v40;
  v29 = v5;
  if (v31)
    v6 = v5 == 0;
  else
    v6 = 0;
  if (v6)
  {
    v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v31;
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
    if (v35)
    {
      v33 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v37 != v33)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          objc_msgSend(v9, "objectForKey:", CFSTR("CardNumber"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("cc-number"));
            v12 = v11;
            v41 = 0;
            v42 = (uint64_t)&v41;
            v43 = 0x2020000000;
            v13 = getWBSCreditCardTypeFromNumberSymbolLoc_ptr;
            v44 = getWBSCreditCardTypeFromNumberSymbolLoc_ptr;
            if (!getWBSCreditCardTypeFromNumberSymbolLoc_ptr)
            {
              v14 = (void *)SafariCoreLibrary();
              v13 = dlsym(v14, "WBSCreditCardTypeFromNumber");
              *(_QWORD *)(v42 + 24) = v13;
              getWBSCreditCardTypeFromNumberSymbolLoc_ptr = v13;
            }
            _Block_object_dispose(&v41, 8);
            if (!v13)
              goto LABEL_42;
            v15 = ((uint64_t (*)(id))v13)(v12);

            v41 = 0;
            v42 = (uint64_t)&v41;
            v43 = 0x2020000000;
            v16 = getWBSCreditCardTypeLocalizedNameForGeneratingCardNamesSymbolLoc_ptr;
            v44 = getWBSCreditCardTypeLocalizedNameForGeneratingCardNamesSymbolLoc_ptr;
            if (!getWBSCreditCardTypeLocalizedNameForGeneratingCardNamesSymbolLoc_ptr)
            {
              v17 = (void *)SafariCoreLibrary();
              v16 = dlsym(v17, "WBSCreditCardTypeLocalizedNameForGeneratingCardNames");
              *(_QWORD *)(v42 + 24) = v16;
              getWBSCreditCardTypeLocalizedNameForGeneratingCardNamesSymbolLoc_ptr = v16;
            }
            _Block_object_dispose(&v41, 8);
            if (!v16)
            {
LABEL_42:
              -[AFSuggestionGenerationManager generateCreditCardAutoFillWithCompletionHandler:].cold.3();
              __break(1u);
            }
            ((void (*)(uint64_t))v16)(v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
              objc_msgSend(v10, "setObject:forKey:", v18, CFSTR("cc-type"));

          }
          objc_msgSend(v9, "objectForKey:", CFSTR("ExpirationDate"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v10, "setObject:forKey:", v19, CFSTR("cc-exp"));
          objc_msgSend(v9, "objectForKey:", CFSTR("CardholderName"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend(v10, "setObject:forKey:", v20, CFSTR("cc-name"));
          objc_msgSend(v9, "objectForKey:", CFSTR("CardSecurityCode"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend(v10, "setObject:forKey:", v21, CFSTR("cc-csc"));
          objc_msgSend(v9, "objectForKey:", CFSTR("CardNameUIString"));
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v22;
          v24 = CFSTR("Credit Card");
          if (v22)
            v24 = (__CFString *)v22;
          v25 = v24;
          if ((unint64_t)objc_msgSend(v11, "length") < 0xB)
          {
            v26 = 0;
          }
          else
          {
            objc_msgSend(v11, "substringFromIndex:", objc_msgSend(v11, "length") - 4);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v27 = -[AFSuggestion initWithTitle:subTitle:creditCardPayload:customInfoType:]([AFSuggestion alloc], "initWithTitle:subTitle:creditCardPayload:customInfoType:", v25, v26, v10, 13);

          objc_msgSend(v34, "addObject:", v27);
        }
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
      }
      while (v35);
    }

    AFSuggestionGenerationManagerOSLogFacility();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[AFSuggestionGenerationManager generateCreditCardAutoFillWithCompletionHandler:].cold.2(v34, v28);

    v30[2](v30, v34);
  }
  else
  {
    AFSuggestionGenerationManagerOSLogFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AFSuggestionGenerationManager generateCreditCardAutoFillWithCompletionHandler:].cold.1((uint64_t)v29);

    v30[2](v30, 0);
  }

}

- (void)generateContactAutoFillSuggestionsWithTextPrefix:(id)a3 documentTraits:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  OS_dispatch_queue *queue;
  int v22;
  id v23;
  dispatch_block_t v24;
  NSObject *v25;
  void *v26;
  _QWORD block[5];
  id v28;
  id v29;
  uint64_t *v30;
  int v31;
  int v32;
  _QWORD v33[4];
  id v34;
  AFSuggestionGenerationManager *v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[8];

  v48[6] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    v44 = 0;
    v45 = &v44;
    v46 = 0x2050000000;
    v12 = (void *)get_ICProactiveTriggerClass_softClass;
    v47 = get_ICProactiveTriggerClass_softClass;
    v13 = MEMORY[0x24BDAC760];
    if (!get_ICProactiveTriggerClass_softClass)
    {
      v48[0] = MEMORY[0x24BDAC760];
      v48[1] = 3221225472;
      v48[2] = __get_ICProactiveTriggerClass_block_invoke;
      v48[3] = &unk_2508535B8;
      v48[4] = &v44;
      __get_ICProactiveTriggerClass_block_invoke((uint64_t)v48);
      v12 = (void *)v45[3];
    }
    v14 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v44, 8);
    v15 = [v14 alloc];
    objc_msgSend(v9, "textInputTraits");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "textContentType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithContext:inputContextHistory:contentType:", v8, 0, v17);

    objc_msgSend((id)v39[5], "addObject:", v18);
    v33[0] = v13;
    v33[1] = 3221225472;
    v33[2] = __115__AFSuggestionGenerationManager_generateContactAutoFillSuggestionsWithTextPrefix_documentTraits_completionHandler___block_invoke;
    v33[3] = &unk_2508534F0;
    v34 = v11;
    v37 = v10;
    v35 = self;
    v36 = v8;
    v19 = (void *)MEMORY[0x23B803990](v33);
    v20 = _os_feature_enabled_impl();
    queue = self->_queue;
    if (v20)
      v22 = 3;
    else
      v22 = 2;
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __115__AFSuggestionGenerationManager_generateContactAutoFillSuggestionsWithTextPrefix_documentTraits_completionHandler___block_invoke_52;
    block[3] = &unk_250853540;
    block[4] = self;
    v30 = &v38;
    v31 = 0;
    v32 = v22;
    v28 = v9;
    v29 = v19;
    v23 = v19;
    v24 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
    AFDispatchAsync(queue, v24);

  }
  else
  {
    AFSuggestionGenerationManagerOSLogFacility();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s Proactive Quicktype 2 feature flag not enabled"), "-[AFSuggestionGenerationManager generateContactAutoFillSuggestionsWithTextPrefix:documentTraits:completionHandler:]");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFSuggestionGenerationManager generateContactAutoFillSuggestionsWithTextPrefix:documentTraits:completionHandler:].cold.1(v26, (uint64_t)v48, v25);
    }

    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }
  _Block_object_dispose(&v38, 8);

}

void __115__AFSuggestionGenerationManager_generateContactAutoFillSuggestionsWithTextPrefix_documentTraits_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  NSObject *v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  if (v6)
  {
    v8 = v7;
    AFSuggestionGenerationManagerOSLogFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __115__AFSuggestionGenerationManager_generateContactAutoFillSuggestionsWithTextPrefix_documentTraits_completionHandler___block_invoke_cold_2((uint64_t)v6, -v8);
  }
  else
  {
    if (objc_msgSend(v5, "count") >= 1)
    {
      objc_msgSend(*(id *)(a1 + 40), "generateSuggestionsForContactAutoFill:textPrefix:", v5, *(_QWORD *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      goto LABEL_7;
    }
    AFSuggestionGenerationManagerOSLogFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __115__AFSuggestionGenerationManager_generateContactAutoFillSuggestionsWithTextPrefix_documentTraits_completionHandler___block_invoke_cold_1(v9);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_7:

}

void __115__AFSuggestionGenerationManager_generateContactAutoFillSuggestionsWithTextPrefix_documentTraits_completionHandler___block_invoke_52(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "inputContextPredictionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 40), "appId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "recipientId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_DWORD *)(a1 + 64);
  v8 = *(_DWORD *)(a1 + 68);
  v18 = 0;
  objc_msgSend(v2, "searchWithTriggers:application:recipient:localeIdentifier:isResponseDenyListed:shouldDisableAutoCaps:timeoutInMilliseconds:resultLimit:error:", v3, v4, v5, v6, 0, 1, __PAIR64__(v8, v7), &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v18;

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __115__AFSuggestionGenerationManager_generateContactAutoFillSuggestionsWithTextPrefix_documentTraits_completionHandler___block_invoke_2;
  v14[3] = &unk_250853518;
  v11 = *(id *)(a1 + 48);
  v16 = v10;
  v17 = v11;
  v15 = v9;
  v12 = v10;
  v13 = v9;
  AFDispatchAsync(MEMORY[0x24BDAC9B8], v14);

}

uint64_t __115__AFSuggestionGenerationManager_generateContactAutoFillSuggestionsWithTextPrefix_documentTraits_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)generateSuggestionsForContactAutoFill:(id)a3 textPrefix:(id)a4
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  id v23;
  __CFString *v24;
  __CFString *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  unint64_t v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  char v34;
  __CFString *v35;
  _BOOL4 v36;
  __CFString *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __CFString *v43;
  id v44;
  __CFString *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  AFSuggestion *v55;
  uint64_t v56;
  void *v58;
  int v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  id obj;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v61 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    v5 = 1;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v5 - 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "isEqualToString:", v9);

      v59 = v10;
      if ((v10 & 1) == 0)
        break;
      ++v5;
    }
    while (v5 < objc_msgSend(v4, "count"));
  }
  else
  {
    v59 = 1;
  }
  -[AFLocalizationManager _truncationSentinel](self->_localizationManager, "_truncationSentinel");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v4;
  v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
  if (v62)
  {
    v60 = *(_QWORD *)v68;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v68 != v60)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v11);
        objc_msgSend(v12, "operationData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = &stru_250853C50;
        if (!v13)
        {
          objc_msgSend(v12, "value");
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(v12, "label");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          v17 = objc_msgSend(v12, "shouldAggregate");

          if (v17)
          {
            -[AFLocalizationManager localizedStringForKey:](self->_localizationManager, "localizedStringForKey:", CFSTR("LOCATION_AGGREGATED_NAME_AND_ADDRESS"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)MEMORY[0x24BDD17C8];
            v66 = 0;
            objc_msgSend(v12, "label");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "value");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringWithValidatedFormat:validFormatSpecifiers:error:", v18, CFSTR("%@%@"), &v66, v20, v21);
            v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v23 = v66;
            v24 = &stru_250853C50;
            if (v22)
              v24 = v22;
            v25 = v24;

            if (v23)
            {
              AFSuggestionGenerationManagerOSLogFacility();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                -[AFSuggestionGenerationManager generateSuggestionsForContactAutoFill:textPrefix:].cold.3();

            }
            v14 = v25;
          }
        }
        AFSuggestionGenerationManagerOSLogFacility();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          -[AFSuggestionGenerationManager generateSuggestionsForContactAutoFill:textPrefix:].cold.2();

        -[AFLocalizationManager localizedStringForKey:](self->_localizationManager, "localizedStringForKey:", CFSTR("PARENTHESIZED_LABEL"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(obj, "count");
        v30 = objc_msgSend(v12, "flags");
        objc_msgSend(v12, "label");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "length"))
        {
          if (v29 > 1)
            v32 = v59;
          else
            v32 = 0;
          objc_msgSend(v12, "label");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("unlabeled"));

          v35 = 0;
          v36 = 0;
          if (((v32 | v30) & 1) != 0 && (v34 & 1) == 0)
          {
            objc_msgSend(v12, "label");
            v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v35 = v37;
            v36 = v37 != 0;
            if ((v30 & 1) != 0)
            {
              if (v37)
              {
                v38 = v37;
                v35 = v38;
                goto LABEL_48;
              }
            }
          }
        }
        else
        {

          v36 = 0;
          v35 = 0;
        }
        objc_msgSend(v12, "name");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39 && v36)
        {
          v40 = (void *)MEMORY[0x24BDD17C8];
          v65 = 0;
          objc_msgSend(v12, "name");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "stringByAppendingString:", v58);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "stringWithValidatedFormat:validFormatSpecifiers:error:", v28, CFSTR("%@%@"), &v65, v42, v35);
          v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v44 = v65;
          v45 = &stru_250853C50;
          if (v43)
            v45 = v43;
          v38 = v45;

          if (v44)
          {
            AFSuggestionGenerationManagerOSLogFacility();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              -[AFSuggestionGenerationManager generateSuggestionsForContactAutoFill:textPrefix:].cold.1();

          }
LABEL_48:
          objc_msgSend(v12, "value");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = -[__CFString isEqualToString:](v38, "isEqualToString:", v50);

          if (!v51)
            goto LABEL_50;
          goto LABEL_49;
        }
        objc_msgSend(v12, "name");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          objc_msgSend(v12, "name");
          v48 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v12, "label");
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v49)
          {
            v38 = 0;
            goto LABEL_49;
          }
          objc_msgSend(v12, "label");
          v48 = objc_claimAutoreleasedReturnValue();
        }
        v38 = (__CFString *)v48;
        if (v48)
          goto LABEL_48;
LABEL_49:

        v38 = &stru_250853C50;
LABEL_50:
        objc_msgSend(v12, "value");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "flags") & 4) != 0)
        {
          objc_msgSend(v12, "label");
          v53 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "name");
          v54 = objc_claimAutoreleasedReturnValue();

          v38 = (__CFString *)v53;
          v52 = (void *)v54;
        }
        v55 = -[AFSuggestion initWithTitle:subTitle:usernameAndPasswordPayload:leadingImage:trailingImage:customInfoType:]([AFSuggestion alloc], "initWithTitle:subTitle:usernameAndPasswordPayload:leadingImage:trailingImage:customInfoType:", v38, v14, 0, 0, 0, 0);
        objc_msgSend(v61, "addObject:", v55);

        ++v11;
      }
      while (v62 != v11);
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
      v62 = v56;
    }
    while (v56);
  }

  return v61;
}

- (void)authenticateIfNecessaryForSuggestion:(id)a3 completionHandler:(id)a4
{
  -[AFSuggestionGenerationManager authenticateIfNecessaryForSuggestion:documentTraits:completionHandler:](self, "authenticateIfNecessaryForSuggestion:documentTraits:completionHandler:", a3, 0, a4);
}

- (void)authenticateIfNecessaryForSuggestion:(id)a3 documentTraits:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  objc_msgSend(v20, "usernameAndPasswordPayload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    +[AFCredentialManager sharedInstance](AFCredentialManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "usernameAndPasswordPayload");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v16 = (void *)v13;
    objc_msgSend(v12, "shouldAcceptAutoFill:withPayload:documentTraits:completionHandler:", v20, v13, v8, v9);

    goto LABEL_6;
  }
  objc_msgSend(v20, "oneTimeCodePayload");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    +[AFCredentialManager sharedInstance](AFCredentialManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "oneTimeCodePayload");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(v20, "creditCardPayload");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    objc_msgSend(v20, "creditCardPayload");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFSuggestionGenerationManager _authenticateIfNecessaryForCreditCardSuggestion:withPayload:documentTraits:completionHandler:](self, "_authenticateIfNecessaryForCreditCardSuggestion:withPayload:documentTraits:completionHandler:", v20, v19, v8, v9);

  }
  else
  {
    v9[2](v9, 1);
  }
LABEL_6:

}

- (BOOL)shouldAuthenticateToAcceptAutoFill
{
  void *v2;
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  BOOL v7;
  _Unwind_Exception *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v2 = (void *)getMCProfileConnectionClass_softClass;
  v18 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = (uint64_t)__getMCProfileConnectionClass_block_invoke;
    v13 = &unk_2508535B8;
    v14 = &v15;
    __getMCProfileConnectionClass_block_invoke((uint64_t)&v10);
    v2 = (void *)v16[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v15, 8);
  objc_msgSend(v3, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = (uint64_t)&v10;
  v12 = 0x2020000000;
  v5 = (_QWORD *)getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr;
  v13 = (void *)getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr;
  if (!getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr)
  {
    v6 = (void *)ManagedConfigurationLibrary();
    v5 = dlsym(v6, "MCFeatureAuthenticationBeforeAutoFillRequired");
    *(_QWORD *)(v11 + 24) = v5;
    getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v10, 8);
  if (!v5)
  {
    v9 = (_Unwind_Exception *)-[AFSuggestionGenerationManager generateCreditCardAutoFillWithCompletionHandler:].cold.3();
    _Block_object_dispose(&v15, 8);
    _Unwind_Resume(v9);
  }
  v7 = objc_msgSend(v4, "effectiveBoolValueForSetting:", *v5) == 1;

  return v7;
}

- (void)_authenticateIfNecessaryForCreditCardSuggestion:(id)a3 withPayload:(id)a4 documentTraits:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  void *v33;
  __CFString *v34;
  void *v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  _QWORD v41[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[4];
  _QWORD v49[6];

  v49[4] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    if (v10
      && (v14 = objc_msgSend(v10, "customInfoType"),
          -[AFSuggestionGenerationManager shouldAuthenticateToAcceptAutoFill](self, "shouldAuthenticateToAcceptAutoFill"))&& v14 == 13)
    {
      v42 = 0;
      v43 = &v42;
      v44 = 0x2050000000;
      v15 = (void *)getLAContextClass_softClass;
      v45 = getLAContextClass_softClass;
      if (!getLAContextClass_softClass)
      {
        v41[0] = MEMORY[0x24BDAC760];
        v41[1] = 3221225472;
        v41[2] = __getLAContextClass_block_invoke;
        v41[3] = &unk_2508535B8;
        v41[4] = &v42;
        __getLAContextClass_block_invoke((uint64_t)v41);
        v15 = (void *)v43[3];
      }
      v16 = objc_retainAutorelease(v15);
      _Block_object_dispose(&v42, 8);
      v17 = objc_alloc_init(v16);
      -[AFSuggestionGenerationManager setLaContext:](self, "setLaContext:", v17);

      v35 = (void *)MGCopyAnswer();
      v18 = (void *)MEMORY[0x24BDD17C8];
      +[AFSuggestionGenerationManager sharedInstance](AFSuggestionGenerationManager, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizationManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:", CFSTR("CREDIT_CARD_AUTH_PASSCODE_TITLE"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
      objc_msgSend(v18, "stringWithValidatedFormat:validFormatSpecifiers:error:", v21, CFSTR("%@"), &v40, v35);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v36 = v40;
      v23 = &stru_250853C50;
      if (v22)
        v23 = v22;
      v34 = v23;

      +[AFSuggestionGenerationManager sharedInstance](AFSuggestionGenerationManager, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizationManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:", CFSTR("CREDIT_CARD_AUTH_ALERT_TITLE"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        AFCredentialManagerOSLogFacility();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[AFSuggestionGenerationManager _authenticateIfNecessaryForCreditCardSuggestion:withPayload:documentTraits:completionHandler:].cold.2((uint64_t)v36);

      }
      if (!v26)
        -[AFSuggestionGenerationManager _authenticateIfNecessaryForCreditCardSuggestion:withPayload:documentTraits:completionHandler:].cold.1();
      if (objc_msgSend(v12, "processId"))
      {
        v48[0] = &unk_250855C70;
        v48[1] = &unk_250855C88;
        v49[0] = v26;
        v49[1] = v34;
        v49[2] = MEMORY[0x24BDBD1C8];
        v48[2] = &unk_250855CA0;
        v48[3] = &unk_250855CB8;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v12, "processId"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v49[3] = v28;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 4);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v46[0] = &unk_250855C70;
        v46[1] = &unk_250855C88;
        v47[0] = v26;
        v47[1] = v34;
        v46[2] = &unk_250855CA0;
        v47[2] = MEMORY[0x24BDBD1C8];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[AFSuggestionGenerationManager laContext](self, "laContext");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      v31 = objc_msgSend(v30, "canEvaluatePolicy:error:", 2, &v39);
      v32 = v39;

      if (v31)
      {
        -[AFSuggestionGenerationManager laContext](self, "laContext");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __126__AFSuggestionGenerationManager__authenticateIfNecessaryForCreditCardSuggestion_withPayload_documentTraits_completionHandler___block_invoke;
        v37[3] = &unk_250853590;
        v37[4] = self;
        v38 = v13;
        objc_msgSend(v33, "evaluatePolicy:options:reply:", 2, v29, v37);

      }
      else
      {
        -[AFSuggestionGenerationManager setLaContext:](self, "setLaContext:", 0);
        (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
      }

    }
    else
    {
      (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
    }
  }

}

void __126__AFSuggestionGenerationManager__authenticateIfNecessaryForCreditCardSuggestion_withPayload_documentTraits_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __126__AFSuggestionGenerationManager__authenticateIfNecessaryForCreditCardSuggestion_withPayload_documentTraits_completionHandler___block_invoke_2;
  v9 = &unk_250853568;
  v4 = *(id *)(a1 + 40);
  v10 = v3;
  v11 = v4;
  v5 = v3;
  AFDispatchAsync(MEMORY[0x24BDAC9B8], &v6);
  objc_msgSend(*(id *)(a1 + 32), "setLaContext:", 0, v6, v7, v8, v9);

}

uint64_t __126__AFSuggestionGenerationManager__authenticateIfNecessaryForCreditCardSuggestion_withPayload_documentTraits_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) != 0);
}

- (AFLocalizationManager)localizationManager
{
  return self->_localizationManager;
}

- (LAContext)laContext
{
  return self->_laContext;
}

- (void)setLaContext:(id)a3
{
  objc_storeStrong((id *)&self->_laContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_laContext, 0);
  objc_storeStrong((id *)&self->_localizationManager, 0);
  objc_storeStrong((id *)&self->_inputContextPredictionManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)generateCreditCardAutoFillWithCompletionHandler:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s Couldn't get credentials from Safari: %@"), "-[AFSuggestionGenerationManager generateCreditCardAutoFillWithCompletionHandler:]", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_236D9D000, v2, v3, "%@", v4);

  OUTLINED_FUNCTION_0();
}

- (void)generateCreditCardAutoFillWithCompletionHandler:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s Generated %lu credit card suggestions"), "-[AFSuggestionGenerationManager generateCreditCardAutoFillWithCompletionHandler:]", objc_msgSend(a1, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_236D9D000, a2, v4, "%@", v5);

  OUTLINED_FUNCTION_0();
}

- (uint64_t)generateCreditCardAutoFillWithCompletionHandler:.cold.3()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[AFSuggestionGenerationManager generateContactAutoFillSuggestionsWithTextPrefix:documentTraits:completionHandler:].cold.1(v0);
}

- (void)generateContactAutoFillSuggestionsWithTextPrefix:(void *)a1 documentTraits:(uint64_t)a2 completionHandler:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2(&dword_236D9D000, a3, (uint64_t)a3, "%@", (uint8_t *)a2);

}

void __115__AFSuggestionGenerationManager_generateContactAutoFillSuggestionsWithTextPrefix_documentTraits_completionHandler___block_invoke_cold_1(NSObject *a1)
{
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s There were no prediction results."), "-[AFSuggestionGenerationManager generateContactAutoFillSuggestionsWithTextPrefix:documentTraits:completionHandler:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_236D9D000, a1, v3, "%@", v4);

  OUTLINED_FUNCTION_0();
}

void __115__AFSuggestionGenerationManager_generateContactAutoFillSuggestionsWithTextPrefix_documentTraits_completionHandler___block_invoke_cold_2(uint64_t a1, double a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s Error returned from InputContext: %@, response time = %lf seconds"), "-[AFSuggestionGenerationManager generateContactAutoFillSuggestionsWithTextPrefix:documentTraits:completionHandler:]_block_invoke", a1, *(_QWORD *)&a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v2;
  OUTLINED_FUNCTION_1(&dword_236D9D000, v3, v4, "%@", (uint8_t *)&v5);

}

- (void)generateSuggestionsForContactAutoFill:textPrefix:.cold.1()
{
  _QWORD *v0;
  _DWORD *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s ERROR: invalid localized format for key PARENTHESIZED_LABEL: %@"), "-[AFSuggestionGenerationManager generateSuggestionsForContactAutoFill:textPrefix:]", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *v1 = 138412290;
  *v0 = v3;
  OUTLINED_FUNCTION_3(&dword_236D9D000, v4, v5, "%@");

  OUTLINED_FUNCTION_5();
}

- (void)generateSuggestionsForContactAutoFill:textPrefix:.cold.2()
{
  NSObject *v0;
  _QWORD *v1;
  uint8_t *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  OUTLINED_FUNCTION_4();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%s Rendering results with value= %@"), "-[AFSuggestionGenerationManager generateSuggestionsForContactAutoFill:textPrefix:]", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v2 = 138412290;
  *v1 = v6;
  _os_log_debug_impl(&dword_236D9D000, v0, OS_LOG_TYPE_DEBUG, "%@", v2, 0xCu);

}

- (void)generateSuggestionsForContactAutoFill:textPrefix:.cold.3()
{
  _QWORD *v0;
  _DWORD *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s ERROR: invalid localized format for key LOCATION_AGGREGATED_NAME_AND_ADDRESS: %@"), "-[AFSuggestionGenerationManager generateSuggestionsForContactAutoFill:textPrefix:]", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *v1 = 138412290;
  *v0 = v3;
  OUTLINED_FUNCTION_3(&dword_236D9D000, v4, v5, "%@");

  OUTLINED_FUNCTION_5();
}

- (void)_authenticateIfNecessaryForCreditCardSuggestion:withPayload:documentTraits:completionHandler:.cold.1()
{
  __assert_rtn("-[AFSuggestionGenerationManager _authenticateIfNecessaryForCreditCardSuggestion:withPayload:documentTraits:completionHandler:]", "AFSuggestionGenerationManager.m", 418, "localizedAuthTitle");
}

- (void)_authenticateIfNecessaryForCreditCardSuggestion:(uint64_t)a1 withPayload:documentTraits:completionHandler:.cold.2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s invalid localized format for key CREDIT_CARD_AUTH_PASSCODE_TITLE: %@"), "-[AFSuggestionGenerationManager _authenticateIfNecessaryForCreditCardSuggestion:withPayload:documentTraits:completionHandler:]", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_236D9D000, v2, v3, "%@", v4);

  OUTLINED_FUNCTION_0();
}

@end
