@implementation AFEnablementFlowConfigurationProvider

- (AFEnablementFlowConfigurationProvider)init
{
  AFEnablementFlowConfigurationProvider *v2;
  AFSettingsConnection *v3;
  AFSettingsConnection *settingsConnection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AFEnablementFlowConfigurationProvider;
  v2 = -[AFEnablementFlowConfigurationProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AFSettingsConnection);
    settingsConnection = v2->_settingsConnection;
    v2->_settingsConnection = v3;

  }
  return v2;
}

- (void)configurationForEnablementFlow:(int64_t)a3 recognitionLanguageCodes:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  AFEnablementConfigurationProviderParameters *v10;
  void *v11;
  uint64_t v12;
  AFEnablementConfigurationProviderParameters *v13;

  v8 = a5;
  v9 = a4;
  v10 = [AFEnablementConfigurationProviderParameters alloc];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = 0;
  v13 = -[AFEnablementConfigurationProviderParameters initWithEnablementFlow:newUser:userStatusFetchError:dateStartedResolvingUserStatus:dateEndedResolvingUserStatus:experiment:experimentFetchError:dateStartedResolvingExperiment:dateEndedResolvingExperiment:outputVoiceCountForRecognitionLanguage:recognitionLanguageWithMultipleOutputVoicesExists:](v10, "initWithEnablementFlow:newUser:userStatusFetchError:dateStartedResolvingUserStatus:dateEndedResolvingUserStatus:experiment:experimentFetchError:dateStartedResolvingExperiment:dateEndedResolvingExperiment:outputVoiceCountForRecognitionLanguage:recognitionLanguageWithMultipleOutputVoicesExists:", a3, 0, 0, 0, 0, 0, 0, 0, 0, v11, v12);

  -[AFEnablementFlowConfigurationProvider _resolveIfNewUserWithParameters:forRecognitionLanguages:completion:](self, "_resolveIfNewUserWithParameters:forRecognitionLanguages:completion:", v13, v9, v8);
}

- (void)_resolveIfNewUserWithParameters:(id)a3 forRecognitionLanguages:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  AFSettingsConnection *settingsConnection;
  _QWORD v25[4];
  id v26;
  void (**v27)(id, void *);
  uint64_t *v28;
  id v29;
  id location;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__31209;
  v35 = __Block_byref_object_dispose__31210;
  v11 = v8;
  v36 = v11;
  objc_msgSend(v11, "mutatedCopyWithMutator:", &__block_literal_global_31223);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v32[5];
  v32[5] = v12;

  if (objc_msgSend((id)v32[5], "enablementFlow") == 9)
  {
    v14 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v38 = "-[AFEnablementFlowConfigurationProvider _resolveIfNewUserWithParameters:forRecognitionLanguages:completion:]";
      _os_log_impl(&dword_19AF50000, v14, OS_LOG_TYPE_INFO, "%s Tinker Enablement flow, treat as new user", buf, 0xCu);
    }
    objc_msgSend((id)v32[5], "mutatedCopyWithMutator:", &__block_literal_global_50);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v32[5];
    v32[5] = v15;

    -[AFEnablementFlowConfigurationProvider _resolveVoiceSelection:forRecognitionLanguages:completion:](self, "_resolveVoiceSelection:forRecognitionLanguages:completion:", v32[5], v9, v10);
  }
  else
  {
    -[AFEnablementFlowConfigurationProvider _storedRecognitionLanguageCode](self, "_storedRecognitionLanguageCode");
    v17 = objc_claimAutoreleasedReturnValue();
    -[AFEnablementFlowConfigurationProvider _storedVoiceInfo](self, "_storedVoiceInfo");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v17 | v18)
    {
      v19 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v38 = "-[AFEnablementFlowConfigurationProvider _resolveIfNewUserWithParameters:forRecognitionLanguages:completion:]";
        v39 = 2112;
        v40 = v17;
        v41 = 2112;
        v42 = v18;
        _os_log_impl(&dword_19AF50000, v19, OS_LOG_TYPE_INFO, "%s Not a new user. Language Stored: %@, outputVoice stored: %@", buf, 0x20u);
      }
      objc_msgSend((id)v32[5], "mutatedCopyWithMutator:", &__block_literal_global_52);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v32[5];
      v32[5] = v20;

      +[AFEnablementFlowConfigurationProvider _createConfigurationForParameters:](AFEnablementFlowConfigurationProvider, "_createConfigurationForParameters:", v32[5]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v22);

    }
    else
    {
      objc_initWeak(&location, self);
      v23 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v38 = "-[AFEnablementFlowConfigurationProvider _resolveIfNewUserWithParameters:forRecognitionLanguages:completion:]";
        _os_log_impl(&dword_19AF50000, v23, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
      }
      settingsConnection = self->_settingsConnection;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __108__AFEnablementFlowConfigurationProvider__resolveIfNewUserWithParameters_forRecognitionLanguages_completion___block_invoke_54;
      v25[3] = &unk_1E3A33F00;
      objc_copyWeak(&v29, &location);
      v28 = &v31;
      v27 = v10;
      v26 = v9;
      -[AFSettingsConnection hasEverSetLanguageCodeWithCompletion:](settingsConnection, "hasEverSetLanguageCodeWithCompletion:", v25);

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }

  }
  _Block_object_dispose(&v31, 8);

}

- (void)_resolveVoiceSelection:(id)a3 forRecognitionLanguages:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void (**v33)(id, void *);
  id obj;
  void *v35;
  _QWORD v36[4];
  id v37;
  void *v38;
  uint64_t *v39;
  _QWORD v40[4];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v33 = (void (**)(id, void *))a5;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__31209;
  v50 = __Block_byref_object_dispose__31210;
  v31 = v7;
  v51 = v31;
  v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v53 = "-[AFEnablementFlowConfigurationProvider _resolveVoiceSelection:forRecognitionLanguages:completion:]";
    _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v31);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v43;
    v12 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        AFOutputVoiceLanguageForRecognitionLanguage(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0C99D20];
        +[AFVoiceInfo allVoicesForSiriSessionLanguage:](AFVoiceInfo, "allVoicesForSiriSessionLanguage:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "arrayWithArray:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = (void *)MEMORY[0x1E0CB3880];
        v40[0] = v12;
        v40[1] = 3221225472;
        v40[2] = __99__AFEnablementFlowConfigurationProvider__resolveVoiceSelection_forRecognitionLanguages_completion___block_invoke;
        v40[3] = &unk_1E3A33F28;
        v20 = v15;
        v41 = v20;
        objc_msgSend(v19, "predicateWithBlock:", v40);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "filteredArrayUsingPredicate:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          v53 = "-[AFEnablementFlowConfigurationProvider _resolveVoiceSelection:forRecognitionLanguages:completion:]";
          v54 = 2112;
          v55 = v22;
          v56 = 2112;
          v57 = v20;
          v58 = 2112;
          v59 = v14;
          _os_log_impl(&dword_19AF50000, v23, OS_LOG_TYPE_INFO, "%s Output voices %@ for default output language %@ for recognition language %@", buf, 0x2Au);
        }
        if (v22)
          objc_msgSend(v35, "addObjectsFromArray:", v22);
        if ((unint64_t)objc_msgSend(v22, "count") >= 2)
        {
          objc_msgSend((id)v47[5], "mutatedCopyWithMutator:", &__block_literal_global_67_31217);
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = (void *)v47[5];
          v47[5] = v24;

        }
        v26 = (void *)v47[5];
        v36[0] = v12;
        v36[1] = 3221225472;
        v36[2] = __99__AFEnablementFlowConfigurationProvider__resolveVoiceSelection_forRecognitionLanguages_completion___block_invoke_2;
        v36[3] = &unk_1E3A33F70;
        v39 = &v46;
        v27 = v22;
        v37 = v27;
        v38 = v14;
        objc_msgSend(v26, "mutatedCopyWithMutator:", v36);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)v47[5];
        v47[5] = v28;

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
    }
    while (v10);
  }

  +[AFEnablementFlowConfigurationProvider _createConfigurationForParameters:](AFEnablementFlowConfigurationProvider, "_createConfigurationForParameters:", v47[5]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2](v33, v30);

  _Block_object_dispose(&v46, 8);
}

- (id)_storedRecognitionLanguageCode
{
  void *v2;
  void *v3;

  +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_languageCodeWithFallback:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_storedVoiceInfo
{
  void *v2;
  void *v3;

  +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_outputVoiceWithFallback:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AFSettingsConnection)settingsConnection
{
  return self->_settingsConnection;
}

- (void)setSettingsConnection:(id)a3
{
  objc_storeStrong((id *)&self->_settingsConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsConnection, 0);
}

uint64_t __99__AFEnablementFlowConfigurationProvider__resolveVoiceSelection_forRecognitionLanguages_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __99__AFEnablementFlowConfigurationProvider__resolveVoiceSelection_forRecognitionLanguages_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v5 = a2;
  objc_msgSend(v4, "outputVoiceCountForRecognitionLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, *(_QWORD *)(a1 + 40));

  objc_msgSend(v5, "setOutputVoiceCountForRecognitionLanguage:", v8);
}

uint64_t __99__AFEnablementFlowConfigurationProvider__resolveVoiceSelection_forRecognitionLanguages_completion___block_invoke_66(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRecognitionLanguageWithMultipleOutputVoicesExists:", 1);
}

void __108__AFEnablementFlowConfigurationProvider__resolveIfNewUserWithParameters_forRecognitionLanguages_completion___block_invoke_54(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v28 = "-[AFEnablementFlowConfigurationProvider _resolveIfNewUserWithParameters:forRecognitionLanguages:completion:]_block_invoke";
    v29 = 1024;
    v30 = a2;
    v31 = 2112;
    v32 = v5;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s hasEverSetLanguageCode: %d, error:%@", buf, 0x1Cu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "mutatedCopyWithMutator:", &__block_literal_global_56_31229);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  if (!WeakRetained)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "mutatedCopyWithMutator:", &__block_literal_global_57_31230);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

LABEL_8:
    v20 = *(_QWORD *)(a1 + 40);
    +[AFEnablementFlowConfigurationProvider _createConfigurationForParameters:](AFEnablementFlowConfigurationProvider, "_createConfigurationForParameters:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v21);

    goto LABEL_9;
  }
  if (!v5)
  {
    if (!a2)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "mutatedCopyWithMutator:", &__block_literal_global_59_31231);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = v22;

      objc_msgSend(WeakRetained, "_resolveVoiceSelection:forRecognitionLanguages:completion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __108__AFEnablementFlowConfigurationProvider__resolveIfNewUserWithParameters_forRecognitionLanguages_completion___block_invoke_3;
  v25[3] = &unk_1E3A33EB8;
  v26 = v5;
  objc_msgSend(v11, "mutatedCopyWithMutator:", v25);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  v15 = *(_QWORD *)(a1 + 40);
  +[AFEnablementFlowConfigurationProvider _createConfigurationForParameters:](AFEnablementFlowConfigurationProvider, "_createConfigurationForParameters:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

LABEL_9:
}

uint64_t __108__AFEnablementFlowConfigurationProvider__resolveIfNewUserWithParameters_forRecognitionLanguages_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserStatusFetchError:", *(_QWORD *)(a1 + 32));
}

uint64_t __108__AFEnablementFlowConfigurationProvider__resolveIfNewUserWithParameters_forRecognitionLanguages_completion___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setNewUser:", 1);
}

void __108__AFEnablementFlowConfigurationProvider__resolveIfNewUserWithParameters_forRecognitionLanguages_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[AFError errorWithCode:](AFError, "errorWithCode:", 41);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserStatusFetchError:", v3);

}

void __108__AFEnablementFlowConfigurationProvider__resolveIfNewUserWithParameters_forRecognitionLanguages_completion___block_invoke_55(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v3 = a2;
  objc_msgSend(v2, "now");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDateEndedResolvingUserStatus:", v4);

}

void __108__AFEnablementFlowConfigurationProvider__resolveIfNewUserWithParameters_forRecognitionLanguages_completion___block_invoke_51(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v3 = a2;
  objc_msgSend(v2, "now");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDateEndedResolvingUserStatus:", v4);

}

void __108__AFEnablementFlowConfigurationProvider__resolveIfNewUserWithParameters_forRecognitionLanguages_completion___block_invoke_49(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v4 = a2;
  objc_msgSend(v2, "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDateEndedResolvingUserStatus:", v3);

  objc_msgSend(v4, "setNewUser:", 1);
}

void __108__AFEnablementFlowConfigurationProvider__resolveIfNewUserWithParameters_forRecognitionLanguages_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v3 = a2;
  objc_msgSend(v2, "now");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDateStartedResolvingUserStatus:", v4);

}

+ (id)_createConfigurationForParameters:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  AFEnablementConfiguration *v11;
  void *v12;
  AFEnablementConfiguration *v13;
  void *v15;
  int v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "+[AFEnablementFlowConfigurationProvider _createConfigurationForParameters:]";
    v21 = 2112;
    v22 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  objc_msgSend(v3, "userStatusFetchError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_9:
    v7 = 0;
    v8 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v3, "experimentFetchError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 || !objc_msgSend(v3, "recognitionLanguageWithMultipleOutputVoicesExists"))
    goto LABEL_9;
  if ((objc_msgSend(v3, "newUser") & 1) != 0)
  {
    v7 = +[AFEnablementFlowConfigurationProvider _shouldAllowRandomVoiceSelectionForEnablementFlow:](AFEnablementFlowConfigurationProvider, "_shouldAllowRandomVoiceSelectionForEnablementFlow:", objc_msgSend(v3, "enablementFlow"));
    v8 = 1;
  }
  else
  {
    +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "shouldSkipIntelligenceVoiceSelectionUpsell");

    v7 = v16 ^ 1u;
    v8 = v7;
  }
LABEL_10:
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__AFEnablementFlowConfigurationProvider__createConfigurationForParameters___block_invoke;
  v17[3] = &unk_1E3A34448;
  v18 = v3;
  v9 = v3;
  v10 = (void *)MEMORY[0x1A1AC0C3C](v17);
  v11 = [AFEnablementConfiguration alloc];
  objc_msgSend(v9, "outputVoiceCountForRecognitionLanguage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AFEnablementConfiguration initWithRequiresVoiceSelection:voiceSelectionAllowsChooseForMe:voiceCountForRecognitionLanguage:completionLoggingBlock:](v11, "initWithRequiresVoiceSelection:voiceSelectionAllowsChooseForMe:voiceCountForRecognitionLanguage:completionLoggingBlock:", v8, v7, v12, v10);

  return v13;
}

+ (void)_emitEnablementFlowLoggingForConfigurationParameters:(id)a3 didEnable:(BOOL)a4
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "userStatusFetchError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enablementFlow");
  v8 = v4;
  v6 = v5;
  v7 = v4;
  AnalyticsSendEventLazy();

}

+ (BOOL)_shouldAllowRandomVoiceSelectionForEnablementFlow:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 4;
}

id __104__AFEnablementFlowConfigurationProvider__emitEnablementFlowLoggingForConfigurationParameters_didEnable___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3 > 9)
    v4 = CFSTR("(unknown)");
  else
    v4 = off_1E3A32D20[v3];
  v5 = v4;
  objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("flow"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "newUser"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("newUser"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("didEnable"));

  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v8, "code"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v9, CFSTR("errorCode"));

  }
  return v2;
}

uint64_t __75__AFEnablementFlowConfigurationProvider__createConfigurationForParameters___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[AFEnablementFlowConfigurationProvider _emitEnablementFlowLoggingForConfigurationParameters:didEnable:](AFEnablementFlowConfigurationProvider, "_emitEnablementFlowLoggingForConfigurationParameters:didEnable:", *(_QWORD *)(a1 + 32), a2);
}

@end
