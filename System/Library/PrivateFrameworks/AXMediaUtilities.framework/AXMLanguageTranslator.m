@implementation AXMLanguageTranslator

- (AXMLanguageTranslator)init
{
  AXMLanguageTranslator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXMLanguageTranslator;
  result = -[AXMLanguageTranslator init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

+ (id)allowedTargetLocalesForTranslation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  _QWORD v15[12];

  v15[11] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("zh_CN"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("it_IT"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("ja_JP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("ar_AE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("de_DE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v5;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("es_ES"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v6;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("fr_FR"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v7;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("ru_RU"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[8] = v8;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("pt_BR"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[9] = v9;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("ko_KR"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_proposedTranslationLocaleForLocale:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[AXMLanguageTranslator allowedTargetLocalesForTranslation](AXMLanguageTranslator, "allowedTargetLocalesForTranslation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v3))
  {
    v5 = v3;
  }
  else
  {
    +[AXMLocSupport sharedInstance](AXMLocSupport, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localeMatchingBaseLanguageOfLocale:fromLocales:", v3, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  AXMediaLogLanguageTranslation();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "localeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_1B0E3B000, v7, OS_LOG_TYPE_DEFAULT, "inLocale: '%@' proposed: '%@'", (uint8_t *)&v11, 0x16u);

  }
  return v5;
}

- (void)availableTranslationLocales:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  uint64_t v6;
  id LTTranslatorClass;
  _QWORD v8[4];
  void (**v9)(id, _QWORD);
  id v10;
  id location[7];
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = (void (**)(id, _QWORD))a3;
  AXMediaLogLanguageTranslation();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0E3B000, v5, OS_LOG_TYPE_DEFAULT, "Requesting available translation locales", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v13 = buf;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  v6 = MEMORY[0x1E0C809B0];
  location[1] = (id)MEMORY[0x1E0C809B0];
  location[2] = (id)3221225472;
  location[3] = __53__AXMLanguageTranslator_availableTranslationLocales___block_invoke;
  location[4] = &unk_1E625CA50;
  location[5] = self;
  location[6] = buf;
  AX_PERFORM_WITH_LOCK();
  if (objc_msgSend(*((id *)v13 + 5), "count"))
  {
    v4[2](v4, *((_QWORD *)v13 + 5));
  }
  else
  {
    objc_initWeak(location, self);
    LTTranslatorClass = get_LTTranslatorClass();
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __53__AXMLanguageTranslator_availableTranslationLocales___block_invoke_2;
    v8[3] = &unk_1E625D480;
    objc_copyWeak(&v10, location);
    v9 = v4;
    objc_msgSend(LTTranslatorClass, "availableLocalePairsForTask:completion:", 1, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(location);
  }
  _Block_object_dispose(buf, 8);

}

void __53__AXMLanguageTranslator_availableTranslationLocales___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __53__AXMLanguageTranslator_availableTranslationLocales___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint64_t v24;
  id WeakRetained;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AXMLanguageTranslator allowedTargetLocalesForTranslation](AXMLanguageTranslator, "allowedTargetLocalesForTranslation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (void *)MEMORY[0x1E0C99E20];
  +[AXMLocSupport sharedInstance](AXMLocSupport, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "en_USLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObject:", v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v12, "sourceLocale", v24);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[AXMLocSupport sharedInstance](AXMLocSupport, "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "en_USLocale");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v13, "isEquivalentTo:", v15);

        if (v16)
        {
          objc_msgSend(v12, "targetLocale");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            if (objc_msgSend(v27, "containsObject:", v17))
            {
              objc_msgSend(v26, "addObject:", v17);
            }
            else
            {
              AXMediaLogLanguageTranslation();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v17, "localeIdentifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v33 = v19;
                _os_log_impl(&dword_1B0E3B000, v18, OS_LOG_TYPE_INFO, "Filtering available locale. Not allowed: %@", buf, 0xCu);

              }
            }
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v9);
  }

  objc_msgSend(v26, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  AXMediaLogLanguageTranslation();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "_descriptionForLocales:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = v22;
    _os_log_impl(&dword_1B0E3B000, v21, OS_LOG_TYPE_DEFAULT, "Available translation locales: %@", buf, 0xCu);

  }
  v23 = v20;
  AX_PERFORM_WITH_LOCK();
  (*(void (**)(void))(*(_QWORD *)(v24 + 32) + 16))();

}

void __53__AXMLanguageTranslator_availableTranslationLocales___block_invoke_44(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

}

- (void)userSelectableTranslationLocales:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__AXMLanguageTranslator_userSelectableTranslationLocales___block_invoke;
  v6[3] = &unk_1E625D4C8;
  v7 = v4;
  v5 = v4;
  -[AXMLanguageTranslator availableTranslationLocales:](self, "availableTranslationLocales:", v6);

}

void __58__AXMLanguageTranslator_userSelectableTranslationLocales___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "ax_filteredArrayUsingBlock:", &__block_literal_global_9);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __58__AXMLanguageTranslator_userSelectableTranslationLocales___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;

  v2 = a2;
  +[AXMLocSupport sharedInstance](AXMLocSupport, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "en_USLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isEquivalentTo:", v4);

  return v5 ^ 1u;
}

- (void)installedTranslationLocales:(id)a3
{
  id v4;
  NSObject *v5;
  id LTTranslatorClass;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  AXMediaLogLanguageTranslation();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0E3B000, v5, OS_LOG_TYPE_DEFAULT, "Requesting installed translation locales", buf, 2u);
  }

  LTTranslatorClass = get_LTTranslatorClass();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__AXMLanguageTranslator_installedTranslationLocales___block_invoke;
  v8[3] = &unk_1E625D4F0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(LTTranslatorClass, "installedLocales:", v8);

}

void __53__AXMLanguageTranslator_installedTranslationLocales___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[3];
  _QWORD v13[3];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_descriptionForLocales:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXMediaLogLanguageTranslation();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_1B0E3B000, v5, OS_LOG_TYPE_DEFAULT, "Installed translation locales: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CF2D78], "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date", CFSTR("locales"), CFSTR("date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  v12[2] = CFSTR("process");
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:forAssetType:", v10, CFSTR("InstalledTranslationLocales"), *MEMORY[0x1E0CF2DD0]);

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);

}

- (void)installOfflineTranslationModelForLocales:(id)a3 fallBackToBaseLanguageIfNeeded:(BOOL)a4 forceReinstall:(BOOL)a5 progress:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  BOOL v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v13 = a7;
  AXMediaLogLanguageTranslation();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[AXMLanguageTranslator _descriptionForLocales:](self, "_descriptionForLocales:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v15;
    _os_log_impl(&dword_1B0E3B000, v14, OS_LOG_TYPE_DEFAULT, "Requesting installation of translation assets: %@", buf, 0xCu);

  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __132__AXMLanguageTranslator_installOfflineTranslationModelForLocales_fallBackToBaseLanguageIfNeeded_forceReinstall_progress_completion___block_invoke;
  v19[3] = &unk_1E625D590;
  v19[4] = self;
  v20 = v11;
  v23 = a4;
  v21 = v13;
  v22 = v12;
  v16 = v12;
  v17 = v13;
  v18 = v11;
  -[AXMLanguageTranslator availableTranslationLocales:](self, "availableTranslationLocales:", v19);

}

void __132__AXMLanguageTranslator_installOfflineTranslationModelForLocales_fallBackToBaseLanguageIfNeeded_forceReinstall_progress_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_filteredLocalesToInstallFromAvailableLocales:requestedLocales:fallBackToBaseLanguageIfNeeded:", a2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (objc_msgSend(v4, "count"))
  {
    +[AXMLocSupport sharedInstance](AXMLocSupport, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "en_USLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "containsObject:", v6);

    if ((v7 & 1) == 0)
    {
      +[AXMLocSupport sharedInstance](AXMLocSupport, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "en_USLocale");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v9);

    }
    AXMediaLogLanguageTranslation();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "_descriptionForLocales:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v11;
      _os_log_impl(&dword_1B0E3B000, v10, OS_LOG_TYPE_DEFAULT, "Requesting installation of translation assets after processing: %@", buf, 0xCu);

    }
    v12 = *(void **)(a1 + 32);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __132__AXMLanguageTranslator_installOfflineTranslationModelForLocales_fallBackToBaseLanguageIfNeeded_forceReinstall_progress_completion___block_invoke_61;
    v24[3] = &unk_1E625D568;
    v13 = v4;
    v14 = *(_QWORD *)(a1 + 32);
    v25 = v13;
    v26 = v14;
    v27 = *(id *)(a1 + 56);
    v28 = *(id *)(a1 + 48);
    objc_msgSend(v12, "installedTranslationLocales:", v24);

  }
  else
  {
    v15 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_descriptionForLocales:", *(_QWORD *)(a1 + 40));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _AXMMakeError(0, CFSTR("Requested locales '%@' not available to install"), v17, v18, v19, v20, v21, v22, (uint64_t)v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v23);

  }
}

void __132__AXMLanguageTranslator_installOfflineTranslationModelForLocales_fallBackToBaseLanguageIfNeeded_forceReinstall_progress_completion___block_invoke_61(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  id v11;
  void *v12;
  id LTTranslatorClass;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 buf;
  Class (*v23)(uint64_t);
  void *v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    objc_msgSend(v4, "addObjectsFromArray:", v3);
  objc_msgSend(v4, "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXMediaLogLanguageTranslation();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "_descriptionForLocales:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1B0E3B000, v6, OS_LOG_TYPE_DEFAULT, "Requesting installation of translation assets after combining with currently installed: %@", (uint8_t *)&buf, 0xCu);

  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v8 = (void *)get_LTInstallRequestClass_softClass;
  v21 = get_LTInstallRequestClass_softClass;
  v9 = MEMORY[0x1E0C809B0];
  if (!get_LTInstallRequestClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v23 = __get_LTInstallRequestClass_block_invoke;
    v24 = &unk_1E625C4E8;
    v25 = &v18;
    __get_LTInstallRequestClass_block_invoke((uint64_t)&buf);
    v8 = (void *)v19[3];
  }
  v10 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v18, 8);
  v11 = [v10 alloc];
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __132__AXMLanguageTranslator_installOfflineTranslationModelForLocales_fallBackToBaseLanguageIfNeeded_forceReinstall_progress_completion___block_invoke_62;
  v16[3] = &unk_1E625D518;
  v17 = *(id *)(a1 + 48);
  v12 = (void *)objc_msgSend(v11, "initWithLocales:useCellular:progressHandler:", v5, 0, v16);
  LTTranslatorClass = get_LTTranslatorClass();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __132__AXMLanguageTranslator_installOfflineTranslationModelForLocales_fallBackToBaseLanguageIfNeeded_forceReinstall_progress_completion___block_invoke_2;
  v14[3] = &unk_1E625D540;
  v15 = *(id *)(a1 + 56);
  objc_msgSend(LTTranslatorClass, "installOfflineLocales:completion:", v12, v14);

}

void __132__AXMLanguageTranslator_installOfflineTranslationModelForLocales_fallBackToBaseLanguageIfNeeded_forceReinstall_progress_completion___block_invoke_62(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  AXMTranslationModelInstallStatus *v15;
  void *v16;
  void *v17;
  double v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (*(_QWORD *)(a1 + 32))
  {
    v19 = v6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          v15 = objc_alloc_init(AXMTranslationModelInstallStatus);
          objc_msgSend(v14, "localeIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXMTranslationModelInstallStatus setLocaleIdentifier:](v15, "setLocaleIdentifier:", v16);

          objc_msgSend(v14, "progress");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "fractionCompleted");
          -[AXMTranslationModelInstallStatus setProgress:](v15, "setProgress:", (uint64_t)v18);

          -[AXMTranslationModelInstallStatus setState:](v15, "setState:", objc_msgSend(v14, "offlineState"));
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    v7 = v19;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

uint64_t __132__AXMLanguageTranslator_installOfflineTranslationModelForLocales_fallBackToBaseLanguageIfNeeded_forceReinstall_progress_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_filteredLocalesToInstallFromAvailableLocales:(id)a3 requestedLocales:(id)a4 fallBackToBaseLanguageIfNeeded:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v5 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v27;
    *(_QWORD *)&v12 = 138412290;
    v25 = v12;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v7, "containsObject:", v16, v25, (_QWORD)v26))
        {
          objc_msgSend(v9, "addObject:", v16);
        }
        else
        {
          if (!v5)
            goto LABEL_15;
          AXMediaLogLanguageTranslation();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v16, "localeIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v25;
            v31 = v18;
            _os_log_impl(&dword_1B0E3B000, v17, OS_LOG_TYPE_DEFAULT, "No exact match for translation asset matching '%@'. falling back to base language", buf, 0xCu);

          }
          +[AXMLocSupport sharedInstance](AXMLocSupport, "sharedInstance");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "localeMatchingBaseLanguageOfLocale:fromLocales:", v16, v7);
          v20 = objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            AXMediaLogLanguageTranslation();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              -[NSObject localeIdentifier](v20, "localeIdentifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v25;
              v31 = v22;
              _os_log_impl(&dword_1B0E3B000, v21, OS_LOG_TYPE_DEFAULT, "Found fallback locale: %@", buf, 0xCu);

            }
            objc_msgSend(v9, "addObject:", v20);
          }
          else
          {
LABEL_15:
            AXMediaLogLanguageTranslation();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v16, "localeIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v25;
              v31 = v23;
              _os_log_impl(&dword_1B0E3B000, v20, OS_LOG_TYPE_DEFAULT, "Cannot install requested translation locale '%@'. Not available", buf, 0xCu);

            }
          }

        }
      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v13);
  }

  return v9;
}

- (void)installOfflineTranslationModelForLanguageCodeIfNeeded:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  AXMediaLogLanguageTranslation();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v8;
    _os_log_impl(&dword_1B0E3B000, v11, OS_LOG_TYPE_DEFAULT, "Requesting install of translation asset for languageCode: %@", buf, 0xCu);
  }

  +[AXMLocSupport sharedInstance](AXMLocSupport, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localeForLanguageCode:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    +[AXMLocSupport sharedInstance](AXMLocSupport, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "localeBaseLanguageIsEnglish:", v13);

    if (v21)
    {
      AXMediaLogLanguageTranslation();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0E3B000, v22, OS_LOG_TYPE_DEFAULT, "Locale base language is English. no download required", buf, 2u);
      }

      if (v10)
        v10[2](v10, 0);
    }
    else
    {
      v25 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMLanguageTranslator installOfflineTranslationModelForLocales:fallBackToBaseLanguageIfNeeded:forceReinstall:progress:completion:](self, "installOfflineTranslationModelForLocales:fallBackToBaseLanguageIfNeeded:forceReinstall:progress:completion:", v24, 1, 0, v9, v10);

    }
  }
  else if (v10)
  {
    _AXMMakeError(0, CFSTR("No locale produced for language code: %@"), v14, v15, v16, v17, v18, v19, (uint64_t)v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v10)[2](v10, v23);

  }
}

- (void)translateText:(id)a3 toLocale:(id)a4 respectAllowList:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  objc_class *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE buf[24];
  void *v50;
  uint64_t *v51;
  uint64_t v52;

  v7 = a5;
  v52 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v11)
  {
    if (!v7)
    {
      v13 = v11;
      goto LABEL_9;
    }
    -[AXMLanguageTranslator _proposedTranslationLocaleForLocale:](self, "_proposedTranslationLocaleForLocale:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {

LABEL_9:
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
      v45 = 0;
      v46 = &v45;
      v47 = 0x2050000000;
      v22 = (void *)get_LTTextTranslationRequestClass_softClass;
      v48 = get_LTTextTranslationRequestClass_softClass;
      v23 = MEMORY[0x1E0C809B0];
      if (!get_LTTextTranslationRequestClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __get_LTTextTranslationRequestClass_block_invoke;
        v50 = &unk_1E625C4E8;
        v51 = &v45;
        __get_LTTextTranslationRequestClass_block_invoke((uint64_t)buf);
        v22 = (void *)v46[3];
      }
      v24 = objc_retainAutorelease(v22);
      _Block_object_dispose(&v45, 8);
      v25 = (void *)objc_msgSend([v24 alloc], "initWithSourceLocale:targetLocale:", v21, v13);
      objc_msgSend(v25, "setTaskHint:", 1);
      objc_msgSend(v25, "setCensorSpeech:", 0);
      objc_msgSend(v25, "setForcedOfflineTranslation:", 1);
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v10);
      objc_msgSend(v25, "setText:", v26);

      AXMediaLogLanguageTranslation();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v21, "localeIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localeIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v28;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v29;
        *(_WORD *)&buf[22] = 2112;
        v50 = v10;
        _os_log_impl(&dword_1B0E3B000, v27, OS_LOG_TYPE_DEFAULT, "Will translate from: '%@' to '%@' : %@", buf, 0x20u);

      }
      v43[0] = v23;
      v43[1] = 3221225472;
      v43[2] = __76__AXMLanguageTranslator_translateText_toLocale_respectAllowList_completion___block_invoke;
      v43[3] = &unk_1E625D5B8;
      v44 = v12;
      objc_msgSend(v25, "setTextTranslationHandler:", v43);
      -[AXMLanguageTranslator translator](self, "translator");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "translate:", v25);

      v11 = v13;
      goto LABEL_14;
    }
    v31 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "localeIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("No suitable proposed locale for given target: %@"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    AXMediaLogLanguageTranslation();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v33;
      _os_log_impl(&dword_1B0E3B000, v34, OS_LOG_TYPE_DEFAULT, "Will not perform translation. %@", buf, 0xCu);
    }

    _AXMMakeError(0, CFSTR("%@"), v35, v36, v37, v38, v39, v40, (uint64_t)v33);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v41);

  }
  else
  {
    AXMediaLogLanguageTranslation();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0E3B000, v14, OS_LOG_TYPE_DEFAULT, "Will not perform translation. No target locale was provided", buf, 2u);
    }

    _AXMMakeError(0, CFSTR("No target locale was provided"), v15, v16, v17, v18, v19, v20, v42);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v12 + 2))(v12, 0, v11);
  }
LABEL_14:

}

void __76__AXMLanguageTranslator_translateText_toLocale_respectAllowList_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  AXMTranslatedText *v19;
  void *v20;
  void *v21;
  _BYTE v22[12];
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  AXMediaLogLanguageTranslation();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v22 = 138412802;
    *(_QWORD *)&v22[4] = v7;
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_1B0E3B000, v10, OS_LOG_TYPE_DEFAULT, "Did finish translation. Translation text: '%@'. result: '%@'. Error?: '%@'", v22, 0x20u);
  }

  if (v9)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(v8, "translations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v19 = objc_alloc_init(AXMTranslatedText);
      objc_msgSend(v12, "formattedString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMTranslatedText setText:](v19, "setText:", v20);

      objc_msgSend(v12, "confidence");
      -[AXMTranslatedText setConfidence:](v19, "setConfidence:");
      -[AXMTranslatedText setLowConfidence:](v19, "setLowConfidence:", objc_msgSend(v12, "isLowConfidence"));
      objc_msgSend(v8, "locale");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMTranslatedText setTargetLocale:](v19, "setTargetLocale:", v21);

    }
    else
    {
      _AXMMakeError(0, CFSTR("Could not produce translation"), v13, v14, v15, v16, v17, v18, *(uint64_t *)v22);
      v19 = (AXMTranslatedText *)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (id)translateText:(id)a3 toLocale:(id)a4 respectAllowList:(BOOL)a5 metrics:(id)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  dispatch_semaphore_t v15;
  void *v16;
  NSObject *v17;
  dispatch_time_t v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  NSObject *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__4;
  v38 = __Block_byref_object_dispose__4;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__4;
  v32 = __Block_byref_object_dispose__4;
  v33 = 0;
  v15 = dispatch_semaphore_create(0);
  objc_msgSend(v14, "startMeasure:", CFSTR("Translate text"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __79__AXMLanguageTranslator_translateText_toLocale_respectAllowList_metrics_error___block_invoke;
  v24 = &unk_1E625D5E0;
  v26 = &v34;
  v27 = &v28;
  v17 = v15;
  v25 = v17;
  -[AXMLanguageTranslator translateText:toLocale:respectAllowList:completion:](self, "translateText:toLocale:respectAllowList:completion:", v12, v13, v9, &v21);
  v18 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v17, v18);
  objc_msgSend(v16, "endMeasurement", v21, v22, v23, v24);
  if (a7)
    *a7 = objc_retainAutorelease((id)v29[5]);
  v19 = (id)v35[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v19;
}

void __79__AXMLanguageTranslator_translateText_toLocale_respectAllowList_metrics_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (_LTTranslator)translator
{
  _LTTranslator *translator;
  _LTTranslator *v4;
  _LTTranslator *v5;

  translator = self->_translator;
  if (!translator)
  {
    v4 = (_LTTranslator *)objc_alloc_init((Class)get_LTTranslatorClass());
    v5 = self->_translator;
    self->_translator = v4;

    translator = self->_translator;
  }
  return translator;
}

- (id)_localeIdentifiersForLocales:(id)a3
{
  return (id)objc_msgSend(a3, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_85);
}

uint64_t __54__AXMLanguageTranslator__localeIdentifiersForLocales___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localeIdentifier");
}

- (id)_descriptionForLocales:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXMLanguageTranslator _localeIdentifiersForLocales:](self, "_localeIdentifiersForLocales:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@]"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_canonicalLocaleForLocale:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v5))
  {
    v6 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)_canonicalLocalesForLocales:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__AXMLanguageTranslator__canonicalLocalesForLocales___block_invoke;
  v4[3] = &unk_1E625D648;
  v4[4] = self;
  objc_msgSend(a3, "ax_flatMappedArrayUsingBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __53__AXMLanguageTranslator__canonicalLocalesForLocales___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_canonicalLocaleForLocale:", a2);
}

- (void)setTranslator:(id)a3
{
  objc_storeStrong((id *)&self->_translator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translator, 0);
  objc_storeStrong((id *)&self->_cachedAvailableTranslationLocales, 0);
}

@end
