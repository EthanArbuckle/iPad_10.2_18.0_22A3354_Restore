@implementation _LTTranslator

+ (void)initialize
{
  _LTInterruptionHandler *v2;
  void *v3;
  _LTBlockBasedInterruptionHandler *v4;
  void *v5;
  void *v6;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(_LTInterruptionHandler);
    v3 = (void *)_interruptionController;
    _interruptionController = (uint64_t)v2;

    v4 = objc_alloc_init(_LTBlockBasedInterruptionHandler);
    v5 = (void *)_legacyInterruptionHandler;
    _legacyInterruptionHandler = (uint64_t)v4;

    objc_msgSend((id)_interruptionController, "addObserver:", _legacyInterruptionHandler);
    v6 = (void *)internalInterruptionHandler;
    internalInterruptionHandler = (uint64_t)&__block_literal_global_14;

  }
}

+ (id)interruptionHandler
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)_legacyInterruptionHandler, "handler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &__block_literal_global_4;
  v4 = _Block_copy(v2);

  return v4;
}

+ (void)setInterruptionHandler:(id)a3
{
  objc_msgSend((id)_legacyInterruptionHandler, "setHandler:", a3);
}

+ (_LTInterruptionHandler)interruptionController
{
  return (_LTInterruptionHandler *)(id)_interruptionController;
}

+ (void)onDeviceModeEnabled:(id)a3
{
  objc_msgSend(a1, "onDeviceModeEnabledWithDedicatedMachPort:completion:", 1, a3);
}

+ (void)onDeviceModeEnabledWithDedicatedMachPort:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;

  v4 = a3;
  v5 = a4;
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69___LTTranslator_onDeviceModeEnabledWithDedicatedMachPort_completion___block_invoke;
  v10[3] = &unk_2506946B8;
  v12 = v4;
  v11 = v5;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __69___LTTranslator_onDeviceModeEnabledWithDedicatedMachPort_completion___block_invoke_6;
  v8[3] = &unk_250694708;
  v9 = v11;
  v7 = v11;
  +[_LTTranslator _getTextServiceProxyWithDelegate:useDedicatedTextMachPort:errorHandler:block:](_LTTranslator, "_getTextServiceProxyWithDelegate:useDedicatedTextMachPort:errorHandler:block:", 0, v4, v10, v8);

}

+ (void)_clearCaches
{
  +[_LTTranslator _getSyncServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getSyncServiceProxyWithDelegate:errorHandler:block:", 0, &__block_literal_global_9_0, &__block_literal_global_12_0);
}

+ (void)languageAssetsWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  unint64_t v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54___LTTranslator_languageAssetsWithOptions_completion___block_invoke;
  v11[3] = &unk_2506944F8;
  v12 = v5;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __54___LTTranslator_languageAssetsWithOptions_completion___block_invoke_13;
  v8[3] = &unk_250694798;
  v9 = v12;
  v10 = a3;
  v7 = v12;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, v11, v8);

}

+ (void)setLanguageAssets:(id)a3 options:(unint64_t)a4 progress:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  _LTLanguageAssetRequest *v12;
  _LTLanguageAssetRequest *v13;
  id v14;
  _QWORD v15[4];
  _LTLanguageAssetRequest *v16;
  _QWORD v17[4];
  id v18;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = -[_LTLanguageAssetRequest initWithLanguageAssets:options:progress:completion:]([_LTLanguageAssetRequest alloc], "initWithLanguageAssets:options:progress:completion:", v11, a4, v10, v9);

  v13 = v12;
  v16 = v13;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __63___LTTranslator_setLanguageAssets_options_progress_completion___block_invoke;
  v17[3] = &unk_2506944F8;
  v18 = v9;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __63___LTTranslator_setLanguageAssets_options_progress_completion___block_invoke_17;
  v15[3] = &unk_2506947C0;
  v14 = v9;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", v13, v17, v15);

}

+ (void)addLanguages:(id)a3 useCellular:(BOOL)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42___LTTranslator_addLanguages_useCellular___block_invoke_19;
  v7[3] = &unk_250694808;
  v8 = v5;
  v9 = a4;
  v6 = v5;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, &__block_literal_global_18_0, v7);

}

+ (void)removeLanguages:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33___LTTranslator_removeLanguages___block_invoke_21;
  v5[3] = &unk_2506947C0;
  v6 = v3;
  v4 = v3;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, &__block_literal_global_20, v5);

}

+ (void)_offlineLanguageStatus:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40___LTTranslator__offlineLanguageStatus___block_invoke;
  v8[3] = &unk_2506944F8;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __40___LTTranslator__offlineLanguageStatus___block_invoke_22;
  v6[3] = &unk_250694830;
  v7 = v9;
  v5 = v9;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, v8, v6);

}

+ (void)_downloadAssetForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  BOOL v15;
  _QWORD v16[4];
  id v17;

  v7 = a3;
  v8 = a5;
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __72___LTTranslator__downloadAssetForLanguagePair_userInitiated_completion___block_invoke;
  v16[3] = &unk_2506944F8;
  v17 = v8;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __72___LTTranslator__downloadAssetForLanguagePair_userInitiated_completion___block_invoke_23;
  v12[3] = &unk_250694880;
  v15 = a4;
  v13 = v7;
  v14 = v17;
  v10 = v17;
  v11 = v7;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, v16, v12);

}

+ (void)_purgeAssetForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  BOOL v15;
  _QWORD v16[4];
  id v17;

  v7 = a3;
  v8 = a5;
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __69___LTTranslator__purgeAssetForLanguagePair_userInitiated_completion___block_invoke;
  v16[3] = &unk_2506944F8;
  v17 = v8;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __69___LTTranslator__purgeAssetForLanguagePair_userInitiated_completion___block_invoke_24;
  v12[3] = &unk_250694880;
  v15 = a4;
  v13 = v7;
  v14 = v17;
  v10 = v17;
  v11 = v7;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, v16, v12);

}

+ (void)_purgeAllAssets:(id)a3
{
  objc_msgSend(a1, "_purgeAllAssetsExcludingConfig:completion:", 0, a3);
}

+ (void)_purgeAllAssetsExcludingConfig:(BOOL)a3 completion:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59___LTTranslator__purgeAllAssetsExcludingConfig_completion___block_invoke;
  v11[3] = &unk_2506944F8;
  v12 = v5;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __59___LTTranslator__purgeAllAssetsExcludingConfig_completion___block_invoke_25;
  v8[3] = &unk_2506948A8;
  v10 = a3;
  v9 = v12;
  v7 = v12;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, v11, v8);

}

+ (void)_updateAllAssets:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34___LTTranslator__updateAllAssets___block_invoke;
  v8[3] = &unk_2506944F8;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __34___LTTranslator__updateAllAssets___block_invoke_26;
  v6[3] = &unk_250694830;
  v7 = v9;
  v5 = v9;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, v8, v6);

}

+ (void)_updateHotfix:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __31___LTTranslator__updateHotfix___block_invoke;
  v8[3] = &unk_2506944F8;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __31___LTTranslator__updateHotfix___block_invoke_27;
  v6[3] = &unk_250694830;
  v7 = v9;
  v5 = v9;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, v8, v6);

}

+ (void)_deleteHotfix:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __31___LTTranslator__deleteHotfix___block_invoke;
  v8[3] = &unk_2506944F8;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __31___LTTranslator__deleteHotfix___block_invoke_28;
  v6[3] = &unk_250694830;
  v7 = v9;
  v5 = v9;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, v8, v6);

}

+ (void)installedLocales:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34___LTTranslator_installedLocales___block_invoke;
  v8[3] = &unk_2506944F8;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __34___LTTranslator_installedLocales___block_invoke_29;
  v6[3] = &unk_250694830;
  v7 = v9;
  v5 = v9;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, v8, v6);

}

+ (void)installedLocalesForTask:(int64_t)a3 completion:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  int64_t v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52___LTTranslator_installedLocalesForTask_completion___block_invoke;
  v11[3] = &unk_2506944F8;
  v12 = v5;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __52___LTTranslator_installedLocalesForTask_completion___block_invoke_31;
  v8[3] = &unk_2506948F8;
  v9 = v12;
  v10 = a3;
  v7 = v12;
  +[_LTTranslator _getTextServiceProxyWithDelegate:useDedicatedTextMachPort:errorHandler:block:](_LTTranslator, "_getTextServiceProxyWithDelegate:useDedicatedTextMachPort:errorHandler:block:", 0, 1, v11, v8);

}

+ (void)_getAssetSize:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __31___LTTranslator__getAssetSize___block_invoke;
  v8[3] = &unk_2506944F8;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __31___LTTranslator__getAssetSize___block_invoke_32;
  v6[3] = &unk_250694830;
  v7 = v9;
  v5 = v9;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, v8, v6);

}

+ (void)installOfflineLocales:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  objc_msgSend(v7, "setCompletionHandler:", v6);
  v11 = v7;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50___LTTranslator_installOfflineLocales_completion___block_invoke;
  v12[3] = &unk_2506944F8;
  v13 = v6;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50___LTTranslator_installOfflineLocales_completion___block_invoke_34;
  v10[3] = &unk_2506947C0;
  v8 = v7;
  v9 = v6;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", v8, v12, v10);

}

+ (void)availableLocalePairsForTask:(int64_t)a3 completion:(id)a4
{
  objc_msgSend(a1, "availableLocalePairsForTask:useDedicatedMachPort:completion:", a3, 0, a4);
}

+ (void)availableLocalePairsForTask:(int64_t)a3 useDedicatedMachPort:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  int64_t v12;
  _QWORD v13[4];
  id v14;
  BOOL v15;

  v5 = a4;
  v7 = a5;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77___LTTranslator_availableLocalePairsForTask_useDedicatedMachPort_completion___block_invoke;
  v13[3] = &unk_2506946B8;
  v15 = v5;
  v14 = v7;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __77___LTTranslator_availableLocalePairsForTask_useDedicatedMachPort_completion___block_invoke_35;
  v10[3] = &unk_2506948F8;
  v11 = v14;
  v12 = a3;
  v9 = v14;
  +[_LTTranslator _getTextServiceProxyWithDelegate:useDedicatedTextMachPort:errorHandler:block:](_LTTranslator, "_getTextServiceProxyWithDelegate:useDedicatedTextMachPort:errorHandler:block:", 0, v5, v13, v10);

}

+ (void)additionalLikelyPreferredLocalesForLocale:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __70___LTTranslator_additionalLikelyPreferredLocalesForLocale_completion___block_invoke;
  v13[3] = &unk_2506944F8;
  v14 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __70___LTTranslator_additionalLikelyPreferredLocalesForLocale_completion___block_invoke_36;
  v10[3] = &unk_250694948;
  v11 = v5;
  v12 = v14;
  v8 = v14;
  v9 = v5;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, v13, v10);

}

+ (void)configInfoForLocale:(id)a3 otherLocale:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __60___LTTranslator_configInfoForLocale_otherLocale_completion___block_invoke;
  v18[3] = &unk_2506944F8;
  v19 = v9;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __60___LTTranslator_configInfoForLocale_otherLocale_completion___block_invoke_37;
  v14[3] = &unk_250694998;
  v15 = v7;
  v16 = v8;
  v17 = v19;
  v11 = v19;
  v12 = v8;
  v13 = v7;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, v18, v14);

}

+ (void)onDeviceModeSupported:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39___LTTranslator_onDeviceModeSupported___block_invoke;
  v8[3] = &unk_2506944F8;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __39___LTTranslator_onDeviceModeSupported___block_invoke_39;
  v6[3] = &unk_250694830;
  v7 = v9;
  v5 = v9;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, v8, v6);

}

+ (void)shouldPresentSystemFirstUseConsentWithDedicatedMachPort:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v5)(id, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[4];
  void (**v12)(id, _QWORD);
  _QWORD v13[4];
  void (**v14)(id, _QWORD);
  uint8_t buf[16];

  v4 = a3;
  v5 = (void (**)(id, _QWORD))a4;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "infoDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDBD288]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.Translate")))
  {
    v9 = _LTOSLogOnboarding();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235438000, v9, OS_LOG_TYPE_INFO, "Not showing first-use consent because it's running in the Translate app", buf, 2u);
    }
    v5[2](v5, 0);
  }
  else
  {
    v10 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __84___LTTranslator_shouldPresentSystemFirstUseConsentWithDedicatedMachPort_completion___block_invoke;
    v13[3] = &unk_2506944F8;
    v14 = v5;
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = __84___LTTranslator_shouldPresentSystemFirstUseConsentWithDedicatedMachPort_completion___block_invoke_42;
    v11[3] = &unk_250694708;
    v12 = v14;
    +[_LTTranslator _getTextServiceProxyWithDelegate:useDedicatedTextMachPort:errorHandler:block:](_LTTranslator, "_getTextServiceProxyWithDelegate:useDedicatedTextMachPort:errorHandler:block:", 0, v4, v13, v11);

  }
}

+ (void)taskIsSupportedInCurrentRegion:(int64_t)a3 completion:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  int64_t v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59___LTTranslator_taskIsSupportedInCurrentRegion_completion___block_invoke;
  v11[3] = &unk_2506944F8;
  v12 = v5;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __59___LTTranslator_taskIsSupportedInCurrentRegion_completion___block_invoke_43;
  v8[3] = &unk_250694798;
  v9 = v12;
  v10 = a3;
  v7 = v12;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, v11, v8);

}

+ (void)autoDetectSpeechUnsupportedPairsWithCompletion:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64___LTTranslator_autoDetectSpeechUnsupportedPairsWithCompletion___block_invoke;
  v8[3] = &unk_2506944F8;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __64___LTTranslator_autoDetectSpeechUnsupportedPairsWithCompletion___block_invoke_45;
  v6[3] = &unk_250694830;
  v7 = v9;
  v5 = v9;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, v8, v6);

}

+ (void)modalitiesPerLocaleWithCompletion:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51___LTTranslator_modalitiesPerLocaleWithCompletion___block_invoke;
  v8[3] = &unk_2506944F8;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __51___LTTranslator_modalitiesPerLocaleWithCompletion___block_invoke_46;
  v6[3] = &unk_250694830;
  v7 = v9;
  v5 = v9;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, v8, v6);

}

+ (void)textStreamingConfigurationWithCompletion:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58___LTTranslator_textStreamingConfigurationWithCompletion___block_invoke;
  v8[3] = &unk_2506944F8;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __58___LTTranslator_textStreamingConfigurationWithCompletion___block_invoke_48;
  v6[3] = &unk_250694830;
  v7 = v9;
  v5 = v9;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, v8, v6);

}

+ (void)task:(int64_t)a3 isSupportedInCountry:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  int64_t v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = a5;
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __54___LTTranslator_task_isSupportedInCountry_completion___block_invoke;
  v16[3] = &unk_2506944F8;
  v17 = v8;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __54___LTTranslator_task_isSupportedInCountry_completion___block_invoke_50;
  v12[3] = &unk_250694A38;
  v14 = v17;
  v15 = a3;
  v13 = v7;
  v10 = v17;
  v11 = v7;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, v16, v12);

}

+ (void)languageForText:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __44___LTTranslator_languageForText_completion___block_invoke;
  v13[3] = &unk_2506944F8;
  v14 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __44___LTTranslator_languageForText_completion___block_invoke_51;
  v10[3] = &unk_250694948;
  v11 = v5;
  v12 = v14;
  v8 = v14;
  v9 = v5;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, v13, v10);

}

+ (void)languagesForText:(id)a3 completion:(id)a4
{
  objc_msgSend(a1, "languagesForText:usingModel:strategy:useDedicatedTextMachPort:completion:", a3, 0, 0, 0, a4);
}

+ (void)languagesForText:(id)a3 usingModel:(unint64_t)a4 completion:(id)a5
{
  objc_msgSend(a1, "languagesForText:usingModel:strategy:useDedicatedTextMachPort:completion:", a3, a4, 0, 0, a5);
}

+ (void)languagesForText:(id)a3 usingModel:(unint64_t)a4 useDedicatedTextMachPort:(BOOL)a5 completion:(id)a6
{
  objc_msgSend(a1, "languagesForText:usingModel:strategy:useDedicatedTextMachPort:completion:", a3, a4, 0, a5, a6);
}

+ (void)languagesForText:(id)a3 usingModel:(unint64_t)a4 strategy:(unint64_t)a5 useDedicatedTextMachPort:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD v21[4];
  id v22;
  BOOL v23;

  v8 = a6;
  v11 = a3;
  v12 = a7;
  v13 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __90___LTTranslator_languagesForText_usingModel_strategy_useDedicatedTextMachPort_completion___block_invoke;
  v21[3] = &unk_2506946B8;
  v23 = v8;
  v22 = v12;
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __90___LTTranslator_languagesForText_usingModel_strategy_useDedicatedTextMachPort_completion___block_invoke_57;
  v16[3] = &unk_250694AB0;
  v19 = a4;
  v20 = a5;
  v17 = v11;
  v18 = v22;
  v14 = v22;
  v15 = v11;
  +[_LTTranslator _getTextServiceProxyWithDelegate:useDedicatedTextMachPort:errorHandler:block:](_LTTranslator, "_getTextServiceProxyWithDelegate:useDedicatedTextMachPort:errorHandler:block:", 0, v8, v21, v16);

}

+ (void)_getServiceProxyWithDelegate:(id)a3 errorHandler:(id)a4 block:(id)a5
{
  id v7;
  id v8;
  _QWORD *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void (*v18)(_QWORD *, void *, _QWORD *);
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = _LTOSLogXPC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235438000, v10, OS_LOG_TYPE_INFO, "Creating service proxy", buf, 2u);
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.translationd"), 0);
  _LTTranslationServiceXPCInterface();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRemoteObjectInterface:", v12);

  if (v7)
  {
    objc_msgSend(v11, "setExportedObject:", v7);
    _LTTranslationServiceDelegateXPCInterface();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setExportedInterface:", v13);

  }
  objc_msgSend(v11, "setInterruptionHandler:", internalInterruptionHandler);
  objc_msgSend(v11, "resume");
  v14 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __65___LTTranslator__getServiceProxyWithDelegate_errorHandler_block___block_invoke;
  v22[3] = &unk_250694AD8;
  v15 = v11;
  v23 = v15;
  v24 = v8;
  v16 = v8;
  objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __65___LTTranslator__getServiceProxyWithDelegate_errorHandler_block___block_invoke_62;
  v20[3] = &unk_2506938E8;
  v21 = v15;
  v18 = (void (*)(_QWORD *, void *, _QWORD *))v9[2];
  v19 = v15;
  v18(v9, v17, v20);

}

+ (void)_getTextServiceProxyWithDelegate:(id)a3 useDedicatedTextMachPort:(BOOL)a4 errorHandler:(id)a5 block:(id)a6
{
  _BOOL4 v8;
  id v9;
  id v10;
  _QWORD *v11;
  NSObject *v12;
  __CFString *v13;
  objc_class *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void (*v23)(_QWORD *, void *, _QWORD *);
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[16];

  v8 = a4;
  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = _LTOSLogXPC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235438000, v12, OS_LOG_TYPE_INFO, "Creating text-only service proxy", buf, 2u);
  }
  v13 = CFSTR("com.apple.translationd");
  if (v8)
    v13 = CFSTR("com.apple.translation.text");
  v14 = (objc_class *)MEMORY[0x24BDD1988];
  v15 = v13;
  v16 = (void *)objc_msgSend([v14 alloc], "initWithMachServiceName:options:", v15, 0);

  _LTTextTranslationServiceXPCInterface();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRemoteObjectInterface:", v17);

  if (v9)
  {
    objc_msgSend(v16, "setExportedObject:", v9);
    _LTTranslationServiceDelegateXPCInterface();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setExportedInterface:", v18);

  }
  objc_msgSend(v16, "setInterruptionHandler:", internalInterruptionHandler);
  objc_msgSend(v16, "resume");
  v19 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __94___LTTranslator__getTextServiceProxyWithDelegate_useDedicatedTextMachPort_errorHandler_block___block_invoke;
  v27[3] = &unk_250694AD8;
  v20 = v16;
  v28 = v20;
  v29 = v10;
  v21 = v10;
  objc_msgSend(v20, "remoteObjectProxyWithErrorHandler:", v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  v25[1] = 3221225472;
  v25[2] = __94___LTTranslator__getTextServiceProxyWithDelegate_useDedicatedTextMachPort_errorHandler_block___block_invoke_65;
  v25[3] = &unk_2506938E8;
  v26 = v20;
  v23 = (void (*)(_QWORD *, void *, _QWORD *))v11[2];
  v24 = v20;
  v23(v11, v22, v25);

}

+ (void)_getSyncServiceProxyWithDelegate:(id)a3 errorHandler:(id)a4 block:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *);
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  v10 = _LTOSLogXPC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235438000, v10, OS_LOG_TYPE_INFO, "Creating SYNC service proxy", buf, 2u);
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:options:", CFSTR("com.apple.translationd"), 0);
  _LTTranslationServiceXPCInterface();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRemoteObjectInterface:", v12);

  if (v7)
  {
    objc_msgSend(v11, "setExportedObject:", v7);
    _LTTranslationServiceDelegateXPCInterface();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setExportedInterface:", v13);

  }
  objc_msgSend(v11, "setInterruptionHandler:", internalInterruptionHandler);
  objc_msgSend(v11, "resume");
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __69___LTTranslator__getSyncServiceProxyWithDelegate_errorHandler_block___block_invoke;
  v20 = &unk_250694AD8;
  v21 = v11;
  v22 = v8;
  v14 = v8;
  v15 = v11;
  objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", &v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v16);

  objc_msgSend(v15, "invalidate", v17, v18, v19, v20);
}

- (void)preheatForRequestSync:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39___LTTranslator_preheatForRequestSync___block_invoke_67;
  v5[3] = &unk_250694B40;
  v6 = v3;
  v4 = v3;
  +[_LTTranslator _getSyncServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getSyncServiceProxyWithDelegate:errorHandler:block:", 0, &__block_literal_global_66, v5);

}

- (void)preheatForRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __46___LTTranslator_preheatForRequest_completion___block_invoke;
  v13[3] = &unk_2506944F8;
  v14 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __46___LTTranslator_preheatForRequest_completion___block_invoke_69;
  v10[3] = &unk_250694948;
  v11 = v5;
  v12 = v14;
  v8 = v14;
  v9 = v5;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, v13, v10);

}

- (void)cleanup
{
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, &__block_literal_global_70, &__block_literal_global_72);
}

- (void)translate:(id)a3
{
  -[_LTTranslator translate:useDedicatedTextMachPort:](self, "translate:useDedicatedTextMachPort:", a3, 0);
}

- (void)translate:(id)a3 useDedicatedTextMachPort:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  _BOOL4 v31;
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = _LTOSLogXPC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v31 = v4;
    _os_log_impl(&dword_235438000, v6, OS_LOG_TYPE_INFO, "Starting translation for request (using dedicated text mach port = %{BOOL}i)", buf, 8u);
  }
  objc_msgSend(v5, "serviceDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if ((objc_msgSend(v5, "_canUseTextService") & 1) != 0)
    {
      v8 = MEMORY[0x24BDAC760];
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke;
      v28[3] = &unk_250694BA8;
      v29 = v5;
      v26[0] = v8;
      v26[1] = 3221225472;
      v26[2] = __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke_78;
      v26[3] = &unk_250694BD0;
      v27 = v29;
      +[_LTTranslator _getTextServiceProxyWithDelegate:useDedicatedTextMachPort:errorHandler:block:](_LTTranslator, "_getTextServiceProxyWithDelegate:useDedicatedTextMachPort:errorHandler:block:", v7, 1, v28, v26);

      v9 = v29;
    }
    else
    {
      v11 = _LTOSLogXPC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_LTTranslator translate:useDedicatedTextMachPort:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
      v19 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CLIENT_REQUIRES_TEXT_SERVICE_ERROR_DESCRIPTION"), &stru_250695360, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lt_errorWithCode:description:userInfo:", 17, v20, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_translationFailedWithError:", v21);

    }
  }
  else
  {
    v10 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke_2;
    v24[3] = &unk_250694BA8;
    v25 = v5;
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke_79;
    v22[3] = &unk_2506947C0;
    v23 = v25;
    +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", v7, v24, v22);

    v9 = v25;
  }

}

- (void)log:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v4)
  {
    v5 = _LTOSLogXPC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_LTTranslator log:].cold.1();
  }
  else
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __21___LTTranslator_log___block_invoke_82;
    v6[3] = &unk_2506947C0;
    v7 = v3;
    +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, &__block_literal_global_81, v6);

  }
}

- (id)startTranslationSession
{
  _LTTranslationSession *v3;
  void *v4;
  _LTTranslationSession *v5;

  v3 = [_LTTranslationSession alloc];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_LTTranslationSession initWithTranslator:selfLoggingInvocationId:](v3, "initWithTranslator:selfLoggingInvocationId:", self, v4);

  return v5;
}

- (id)startTranslationSessionWithSELFLoggingInvocationId:(id)a3
{
  id v4;
  _LTTranslationSession *v5;

  v4 = a3;
  v5 = -[_LTTranslationSession initWithTranslator:selfLoggingInvocationId:]([_LTTranslationSession alloc], "initWithTranslator:selfLoggingInvocationId:", self, v4);

  return v5;
}

+ (void)selfLoggingEventWithData:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42___LTTranslator_selfLoggingEventWithData___block_invoke;
  v8[3] = &unk_250694BA8;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __42___LTTranslator_selfLoggingEventWithData___block_invoke_85;
  v6[3] = &unk_2506947C0;
  v7 = v9;
  v5 = v9;
  +[_LTTranslator _getServiceProxyWithDelegate:errorHandler:block:](_LTTranslator, "_getServiceProxyWithDelegate:errorHandler:block:", 0, v8, v6);

}

+ (void)selfLoggingInvocationStartedWithData:(id)a3 invocationStartedTier1Data:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __81___LTTranslator_selfLoggingInvocationStartedWithData_invocationStartedTier1Data___block_invoke;
  v13[3] = &unk_250694BA8;
  v14 = v5;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __81___LTTranslator_selfLoggingInvocationStartedWithData_invocationStartedTier1Data___block_invoke_86;
  v10[3] = &unk_250694C18;
  v11 = v14;
  v12 = v6;
  v8 = v6;
  v9 = v14;
  +[_LTTranslator _getTextServiceProxyWithDelegate:useDedicatedTextMachPort:errorHandler:block:](_LTTranslator, "_getTextServiceProxyWithDelegate:useDedicatedTextMachPort:errorHandler:block:", 0, 1, v13, v10);

}

+ (void)selfLoggingLanguageIdentificationCompletedWithLIDData:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71___LTTranslator_selfLoggingLanguageIdentificationCompletedWithLIDData___block_invoke;
  v8[3] = &unk_250694BA8;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __71___LTTranslator_selfLoggingLanguageIdentificationCompletedWithLIDData___block_invoke_87;
  v6[3] = &unk_250694BD0;
  v7 = v9;
  v5 = v9;
  +[_LTTranslator _getTextServiceProxyWithDelegate:useDedicatedTextMachPort:errorHandler:block:](_LTTranslator, "_getTextServiceProxyWithDelegate:useDedicatedTextMachPort:errorHandler:block:", 0, 1, v8, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)translate:(uint64_t)a3 useDedicatedTextMachPort:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_235438000, a1, a3, "Refusing to translate text since request isn't allowed to use dedicated mach port", a5, a6, a7, a8, 0);
}

- (void)log:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to serialize logging request: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
