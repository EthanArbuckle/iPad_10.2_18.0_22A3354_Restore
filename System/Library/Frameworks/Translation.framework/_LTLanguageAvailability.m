@implementation _LTLanguageAvailability

- (_LTLanguageAvailability)init
{
  _LTLanguageAvailability *v2;
  _LTLanguageAvailability *v3;
  _LTPreflightChecker *v4;
  _LTPreflightChecker *preflightChecker;
  _LTLanguageStatus *v6;
  uint64_t v7;
  _LTLanguageStatus *languageStatusListener;
  _LTLanguageAvailability *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_LTLanguageAvailability;
  v2 = -[_LTLanguageAvailability init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v2->_localeProvider, v2);
    v4 = objc_alloc_init(_LTPreflightChecker);
    preflightChecker = v3->_preflightChecker;
    v3->_preflightChecker = v4;

    -[_LTPreflightChecker setDelegate:](v3->_preflightChecker, "setDelegate:", v3);
    objc_initWeak(&location, v3);
    v6 = [_LTLanguageStatus alloc];
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __31___LTLanguageAvailability_init__block_invoke;
    v14 = &unk_2506937A8;
    objc_copyWeak(&v15, &location);
    v7 = -[_LTLanguageStatus initWithObservationType:useDedicatedMachPort:observations:](v6, "initWithObservationType:useDedicatedMachPort:observations:", 1, 1, &v11);
    languageStatusListener = v3->_languageStatusListener;
    v3->_languageStatusListener = (_LTLanguageStatus *)v7;

    -[_LTLanguageAvailability _updateCachedValues](v3, "_updateCachedValues", v11, v12, v13, v14);
    v9 = v3;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (void)supportedLanguagesWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60___LTLanguageAvailability_supportedLanguagesWithCompletion___block_invoke;
  v6[3] = &unk_2506937D0;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[_LTLanguageAvailability _supportedLocalePairsWithCompletion:](self, "_supportedLocalePairsWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)statusFromLanguage:(id)a3 toLanguage:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68___LTLanguageAvailability_statusFromLanguage_toLanguage_completion___block_invoke;
  v10[3] = &unk_2506937F8;
  v11 = v8;
  v9 = v8;
  -[_LTLanguageAvailability _checkStatusWithSourceLanguage:targetLanguage:sourceSample:completion:](self, "_checkStatusWithSourceLanguage:targetLanguage:sourceSample:completion:", a3, a4, 0, v10);

}

- (void)statusForSourceSample:(id)a3 toLanguage:(id)a4 completion:(id)a5
{
  -[_LTLanguageAvailability _checkStatusWithSourceLanguage:targetLanguage:sourceSample:completion:](self, "_checkStatusWithSourceLanguage:targetLanguage:sourceSample:completion:", 0, a4, a3, a5);
}

- (void)_checkStatusWithSourceLanguage:(id)a3 targetLanguage:(id)a4 sourceSample:(id)a5 completion:(id)a6
{
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
  id v22;
  id v23;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke;
  v18[3] = &unk_2506938C0;
  objc_copyWeak(&v23, &location);
  v14 = v12;
  v19 = v14;
  v15 = v10;
  v20 = v15;
  v16 = v11;
  v21 = v16;
  v17 = v13;
  v22 = v17;
  -[_LTLanguageAvailability _supportedLocalePairsWithCompletion:](self, "_supportedLocalePairsWithCompletion:", v18);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

- (void)setLocaleProvider:(id)a3
{
  _QWORD v4[5];

  objc_storeWeak((id *)&self->_localeProvider, a3);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45___LTLanguageAvailability_setLocaleProvider___block_invoke;
  v4[3] = &unk_2506938E8;
  v4[4] = self;
  os_unfair_lock_lock(&self->_lock);
  __45___LTLanguageAvailability_setLocaleProvider___block_invoke((uint64_t)v4);
  os_unfair_lock_unlock(&self->_lock);
  -[_LTLanguageAvailability _updateCachedValues](self, "_updateCachedValues");
}

- (void)setLocaleResolver:(id)a3
{
  -[_LTPreflightChecker setLocaleResolver:](self->_preflightChecker, "setLocaleResolver:", a3);
}

- (_LTPreflightLocaleResolving)localeResolver
{
  return -[_LTPreflightChecker localeResolver](self->_preflightChecker, "localeResolver");
}

- (void)_updateCachedValues
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id from;
  id location;
  _QWORD v12[2];
  void (*v13)(uint64_t);
  void *v14;
  _LTLanguageAvailability *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__17;
  v21 = __Block_byref_object_dispose__18;
  v22 = 0;
  p_lock = &self->_lock;
  v4 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v13 = __46___LTLanguageAvailability__updateCachedValues__block_invoke;
  v14 = &unk_250693780;
  v15 = self;
  v16 = &v17;
  v5 = v12;
  os_unfair_lock_lock(p_lock);
  v13((uint64_t)v5);

  os_unfair_lock_unlock(p_lock);
  objc_initWeak(&location, (id)v18[5]);
  objc_initWeak(&from, self);
  v6 = (void *)v18[5];
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __46___LTLanguageAvailability__updateCachedValues__block_invoke_2;
  v7[3] = &unk_250693938;
  objc_copyWeak(&v8, &from);
  objc_copyWeak(&v9, &location);
  objc_msgSend(v6, "supportedLocalePairsWithCompletion:", v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v17, 8);

}

- (void)_didUpdateCachedValues
{
  os_unfair_lock_s *p_lock;
  _QWORD *v4;
  uint64_t v5;
  id WeakRetained;
  _QWORD v7[2];
  void (*v8)(_QWORD *);
  void *v9;
  _LTLanguageAvailability *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *(*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__17;
  v23 = __Block_byref_object_dispose__18;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  p_lock = &self->_lock;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v8 = __49___LTLanguageAvailability__didUpdateCachedValues__block_invoke;
  v9 = &unk_250693960;
  v10 = self;
  v11 = &v19;
  v12 = &v13;
  v4 = v7;
  os_unfair_lock_lock(p_lock);
  v8(v4);

  os_unfair_lock_unlock(p_lock);
  v5 = v14[5];
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v20[5]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "languageAvailabilityDidUpdate:", self);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

}

- (id)_uniqueLocalesFromSupportedPairs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "sourceLocale", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        objc_msgSend(v10, "targetLocale");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_supportedLocalePairsWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD v9[2];
  void (*v10)(uint64_t);
  void *v11;
  void (**v12)(_QWORD);
  id v13;
  id location;
  _QWORD v15[2];
  void (*v16)(uint64_t);
  void *v17;
  _LTLanguageAvailability *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = (void (**)(_QWORD))a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__17;
  v24 = __Block_byref_object_dispose__18;
  v25 = 0;
  p_lock = &self->_lock;
  v6 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v16 = __63___LTLanguageAvailability__supportedLocalePairsWithCompletion___block_invoke;
  v17 = &unk_250693780;
  v18 = self;
  v19 = &v20;
  v7 = v15;
  os_unfair_lock_lock(&self->_lock);
  v16((uint64_t)v7);

  os_unfair_lock_unlock(&self->_lock);
  if (v21[5])
  {
    v4[2](v4);
  }
  else
  {
    objc_initWeak(&location, self);
    v9[0] = v6;
    v9[1] = 3221225472;
    v10 = __63___LTLanguageAvailability__supportedLocalePairsWithCompletion___block_invoke_2;
    v11 = &unk_2506939B0;
    objc_copyWeak(&v13, &location);
    v12 = v4;
    v8 = v9;
    os_unfair_lock_lock(p_lock);
    v10((uint64_t)v8);

    os_unfair_lock_unlock(p_lock);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v20, 8);

}

- (void)_cachedLocaleStatusWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD v9[2];
  void (*v10)(uint64_t);
  void *v11;
  void (**v12)(_QWORD);
  id v13;
  id location;
  _QWORD v15[2];
  void (*v16)(uint64_t);
  void *v17;
  _LTLanguageAvailability *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = (void (**)(_QWORD))a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__17;
  v24 = __Block_byref_object_dispose__18;
  v25 = 0;
  p_lock = &self->_lock;
  v6 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v16 = __61___LTLanguageAvailability__cachedLocaleStatusWithCompletion___block_invoke;
  v17 = &unk_250693780;
  v18 = self;
  v19 = &v20;
  v7 = v15;
  os_unfair_lock_lock(&self->_lock);
  v16((uint64_t)v7);

  os_unfair_lock_unlock(&self->_lock);
  if (v21[5])
  {
    v4[2](v4);
  }
  else
  {
    objc_initWeak(&location, self);
    v9[0] = v6;
    v9[1] = 3221225472;
    v10 = __61___LTLanguageAvailability__cachedLocaleStatusWithCompletion___block_invoke_2;
    v11 = &unk_2506939B0;
    objc_copyWeak(&v13, &location);
    v12 = v4;
    v8 = v9;
    os_unfair_lock_lock(p_lock);
    v10((uint64_t)v8);

    os_unfair_lock_unlock(p_lock);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v20, 8);

}

- (void)_installedLocalesWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id from;
  id location;
  _QWORD v15[2];
  void (*v16)(uint64_t);
  void *v17;
  _LTLanguageAvailability *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__17;
  v24 = __Block_byref_object_dispose__18;
  v25 = 0;
  v5 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v16 = __59___LTLanguageAvailability__installedLocalesWithCompletion___block_invoke;
  v17 = &unk_250693780;
  v18 = self;
  v19 = &v20;
  v6 = v15;
  os_unfair_lock_lock(&self->_lock);
  v16((uint64_t)v6);

  os_unfair_lock_unlock(&self->_lock);
  objc_initWeak(&location, (id)v21[5]);
  objc_initWeak(&from, self);
  v7 = (void *)v21[5];
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __59___LTLanguageAvailability__installedLocalesWithCompletion___block_invoke_2;
  v9[3] = &unk_250693A00;
  objc_copyWeak(&v11, &from);
  objc_copyWeak(&v12, &location);
  v8 = v4;
  v10 = v8;
  objc_msgSend(v7, "currentlyInstalledLocalesWithCompletion:", v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v20, 8);

}

- (void)supportedLocalePairsWithCompletion:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62___LTLanguageAvailability_supportedLocalePairsWithCompletion___block_invoke;
  v5[3] = &unk_250693A28;
  v6 = v3;
  v4 = v3;
  +[_LTTranslator availableLocalePairsForTask:useDedicatedMachPort:completion:](_LTTranslator, "availableLocalePairsForTask:useDedicatedMachPort:completion:", 5, 1, v5);

}

- (void)currentlyInstalledLocalesWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67___LTLanguageAvailability_currentlyInstalledLocalesWithCompletion___block_invoke;
  v6[3] = &unk_2506937D0;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[_LTLanguageAvailability _cachedLocaleStatusWithCompletion:](self, "_cachedLocaleStatusWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)preflightChecker:(id)a3 continueCheckingFromStep:(int64_t)a4 forConfiguration:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, id, _QWORD);
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;

  v9 = a3;
  v10 = a5;
  v11 = (void (**)(id, id, _QWORD))a6;
  if (a4 == 2)
  {
    v21 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[_LTLanguageAvailability preflightChecker:continueCheckingFromStep:forConfiguration:completion:].cold.2(v21, v22, v23, v24, v25, v26, v27, v28);
    v29 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v10, "effectiveSourceLocale");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "effectiveTargetLocale");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "lt_unsupportedPairingErrorWithSource:target:", v30, v31);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      goto LABEL_6;
LABEL_10:
    v11[2](v11, v10, 0);
    goto LABEL_11;
  }
  if (a4)
    goto LABEL_10;
  v12 = _LTOSLogTextAPI();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[_LTLanguageAvailability preflightChecker:continueCheckingFromStep:forConfiguration:completion:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TranslationErrorDomain"), 21, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
    goto LABEL_10;
LABEL_6:
  ((void (**)(id, id, void *))v11)[2](v11, 0, v20);

LABEL_11:
}

- (BOOL)isTranslationSupportedOnCurrentDeviceForPreflightChecker:(id)a3
{
  return 1;
}

- (_LTTextSessionLocaleProviding)localeProvider
{
  return (_LTTextSessionLocaleProviding *)objc_loadWeakRetained((id *)&self->_localeProvider);
}

- (_LTLanguageAvailabilityDelegate)delegate
{
  return (_LTLanguageAvailabilityDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)allowOnlineTranslation
{
  return self->_allowOnlineTranslation;
}

- (void)setAllowOnlineTranslation:(BOOL)a3
{
  self->_allowOnlineTranslation = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_localeProvider);
  objc_storeStrong((id *)&self->_preflightChecker, 0);
  objc_storeStrong((id *)&self->_languageStatusListener, 0);
  objc_storeStrong(&self->_languageStatusCompletionHandler, 0);
  objc_storeStrong(&self->_supportedLocalePairsCompletionHandler, 0);
  objc_storeStrong((id *)&self->_cachedSupportedLocalePairs, 0);
}

- (void)preflightChecker:(uint64_t)a3 continueCheckingFromStep:(uint64_t)a4 forConfiguration:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_235438000, a1, a3, "Preflight checks were unable to automatically determine the source language for a language availability check; won't"
    " ask user to disambiguate",
    a5,
    a6,
    a7,
    a8,
    0);
}

- (void)preflightChecker:(uint64_t)a3 continueCheckingFromStep:(uint64_t)a4 forConfiguration:(uint64_t)a5 completion:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_235438000, a1, a3, "Preflight checks showed translation isn't supported on the current device, but can't show error to user, so reporting unsupported pairing", a5, a6, a7, a8, 0);
}

@end
