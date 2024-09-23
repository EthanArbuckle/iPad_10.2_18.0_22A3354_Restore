@implementation INPreferences

uint64_t __42__INPreferences_requestSiriAuthorization___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (void)requestSiriAuthorization:(void *)handler
{
  void *v4;
  id v5;

  v4 = handler;
  objc_msgSend(a1, "sharedPreferences");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestSiriAuthorization:", v4);

}

- (void)requestSiriAuthorization:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  _QWORD v6[4];
  void (**v7)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    if (+[_INSiriAuthorizationManager _isSiriAuthorizationRestricted](_INSiriAuthorizationManager, "_isSiriAuthorizationRestricted"))
    {
      v4[2](v4, 1);
    }
    else
    {
      -[INPreferences assertThisProcessHasSiriEntitlement](self, "assertThisProcessHasSiriEntitlement");
      -[_INVocabularyConnection settingsService](self->_assistantdConnection, "settingsService");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __42__INPreferences_requestSiriAuthorization___block_invoke;
      v6[3] = &unk_1E228BB80;
      v7 = v4;
      objc_msgSend(v5, "requestSiriAuthorization:", v6);

    }
  }

}

- (void)assertThisProcessHasSiriEntitlement
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__INPreferences_assertThisProcessHasSiriEntitlement__block_invoke;
  block[3] = &unk_1E2294DE0;
  block[4] = self;
  if (assertThisProcessHasSiriEntitlement_onlyCheckOnceToken != -1)
    dispatch_once(&assertThisProcessHasSiriEntitlement_onlyCheckOnceToken, block);
}

+ (id)sharedPreferences
{
  if (sharedPreferences_singletonToken != -1)
    dispatch_once(&sharedPreferences_singletonToken, &__block_literal_global_27414);
  return (id)sSharedPreferences;
}

uint64_t __52__INPreferences_assertThisProcessHasSiriEntitlement__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = INThisProcessHasEntitlement(CFSTR("com.apple.developer.siri"), 1);
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_THROW_EXCEPTION_FOR_PROCESS_MISSING_ENTITLEMENT_com_apple_developer_siri");
  return result;
}

void __34__INPreferences_sharedPreferences__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[INPreferences _init]([INPreferences alloc], "_init");
  v1 = (void *)sSharedPreferences;
  sSharedPreferences = (uint64_t)v0;

}

- (id)_init
{
  INPreferences *v2;
  _INVocabularyConnection *v3;
  _INVocabularyConnection *assistantdConnection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)INPreferences;
  v2 = -[INPreferences init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_INVocabularyConnection);
    assistantdConnection = v2->_assistantdConnection;
    v2->_assistantdConnection = v3;

  }
  return v2;
}

void __42__INPreferences_requestSiriAuthorization___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__INPreferences_requestSiriAuthorization___block_invoke_2;
  v3[3] = &unk_1E228BB58;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

- (INPreferences)init
{
  INPreferences *v3;

  objc_msgSend((id)objc_opt_class(), "sharedPreferences");
  v3 = (INPreferences *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateWithExtensionContext:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
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
  objc_msgSend(a3, "inputItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "userInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("Session Language"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          -[INPreferences _setCachedSiriLanguageCode:](self, "_setCachedSiriLanguageCode:", v10);

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

}

- (BOOL)_weAreRunningAsAnExtension
{
  return self->_cachedSiriLanguageCode != 0;
}

- (void)_THROW_EXCEPTION_FOR_PROCESS_MISSING_ENTITLEMENT_com_apple_developer_siri
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Use of the class %@ from an app requires the entitlement %@. Did you enable the Siri capability in your Xcode project?"), self, CFSTR("com.apple.developer.siri"));
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_claimAutoreleasedReturnValue(), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (int64_t)_siriAuthorizationStatus
{
  int64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (-[INPreferences _weAreRunningAsAnExtension](self, "_weAreRunningAsAnExtension"))
    return 3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 2;
  if (+[_INSiriAuthorizationManager _isSiriAuthorizationRestricted](_INSiriAuthorizationManager, "_isSiriAuthorizationRestricted"))
  {
    v3 = 1;
  }
  else
  {
    -[INPreferences assertThisProcessHasSiriEntitlement](self, "assertThisProcessHasSiriEntitlement");
    v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    -[_INVocabularyConnection settingsService](self->_assistantdConnection, "settingsService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__INPreferences__siriAuthorizationStatus__block_invoke;
    v9[3] = &unk_1E228BB30;
    v11 = &v12;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "fetchSiriAuthorization:", v9);

    v7 = dispatch_time(0, 5000000000);
    dispatch_group_wait(v6, v7);
    v3 = v13[3];

  }
  _Block_object_dispose(&v12, 8);
  return v3;
}

- (id)_siriLanguageCode
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  dispatch_time_t v11;
  id v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__27395;
  v21 = __Block_byref_object_dispose__27396;
  v22 = (id)-[NSString copy](self->_cachedSiriLanguageCode, "copy");
  v3 = (void *)v18[5];
  if (!v3)
  {
    if (INThisProcessIsAssistantd_onceToken != -1)
      dispatch_once(&INThisProcessIsAssistantd_onceToken, &__block_literal_global_68956);
    if (INThisProcessIsAssistantd_isAssistantd)
    {
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v4 = (void *)getAFPreferencesClass_softClass;
      v27 = getAFPreferencesClass_softClass;
      if (!getAFPreferencesClass_softClass)
      {
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __getAFPreferencesClass_block_invoke;
        v23[3] = &unk_1E22953C0;
        v23[4] = &v24;
        __getAFPreferencesClass_block_invoke((uint64_t)v23);
        v4 = (void *)v25[3];
      }
      v5 = objc_retainAutorelease(v4);
      _Block_object_dispose(&v24, 8);
      objc_msgSend(v5, "sharedPreferences");
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject languageCode](v6, "languageCode");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v18[5];
      v18[5] = v7;
    }
    else
    {
      -[INPreferences assertThisProcessHasSiriEntitlement](self, "assertThisProcessHasSiriEntitlement");
      v9 = dispatch_group_create();
      dispatch_group_enter(v9);
      -[_INVocabularyConnection settingsService](self->_assistantdConnection, "settingsService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __34__INPreferences__siriLanguageCode__block_invoke;
      v14[3] = &unk_1E228BBA8;
      v16 = &v17;
      v6 = v9;
      v15 = v6;
      objc_msgSend(v10, "fetchCurrentSiriLanguageCode:", v14);

      v11 = dispatch_time(0, 5000000000);
      dispatch_group_wait(v6, v11);
      v8 = v15;
    }

    v3 = (void *)v18[5];
  }
  v12 = v3;
  _Block_object_dispose(&v17, 8);

  return v12;
}

- (void)_verifyProcessCanDonateIntentWithName:(id)a3 completion:(id)a4
{
  id v6;
  _INVocabularyConnection *assistantdConnection;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  if (v6)
  {
    assistantdConnection = self->_assistantdConnection;
    v8 = a3;
    -[_INVocabularyConnection settingsService](assistantdConnection, "settingsService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__INPreferences__verifyProcessCanDonateIntentWithName_completion___block_invoke;
    v10[3] = &unk_1E228BBD0;
    v11 = v6;
    objc_msgSend(v9, "verifyProcessCanDonateIntentWithName:completion:", v8, v10);

  }
}

- (NSString)_cachedSiriLanguageCode
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)_setCachedSiriLanguageCode:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSiriLanguageCode, 0);
  objc_storeStrong((id *)&self->_assistantdConnection, 0);
}

void __66__INPreferences__verifyProcessCanDonateIntentWithName_completion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__INPreferences__verifyProcessCanDonateIntentWithName_completion___block_invoke_2;
  v5[3] = &unk_1E228D700;
  v6 = *(id *)(a1 + 32);
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __66__INPreferences__verifyProcessCanDonateIntentWithName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __34__INPreferences__siriLanguageCode__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __41__INPreferences__siriAuthorizationStatus__block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (INSiriAuthorizationStatus)siriAuthorizationStatus
{
  void *v2;
  INSiriAuthorizationStatus v3;

  objc_msgSend(a1, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_siriAuthorizationStatus");

  return v3;
}

+ (NSString)siriLanguageCode
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_siriLanguageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (void)_verifyProcessCanDonateIntentWithName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "sharedPreferences");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_verifyProcessCanDonateIntentWithName:completion:", v7, v6);

}

@end
