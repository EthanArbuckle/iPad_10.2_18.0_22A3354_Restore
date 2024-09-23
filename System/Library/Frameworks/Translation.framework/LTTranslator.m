@implementation LTTranslator

uint64_t __27___LTTranslator_initialize__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = _LTOSLogXPC();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __27___LTTranslator_initialize__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  return objc_msgSend((id)_interruptionController, "_didReceiveInterruption");
}

void __69___LTTranslator_onDeviceModeEnabledWithDedicatedMachPort_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69___LTTranslator_onDeviceModeEnabledWithDedicatedMachPort_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __69___LTTranslator_onDeviceModeEnabledWithDedicatedMachPort_completion___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69___LTTranslator_onDeviceModeEnabledWithDedicatedMachPort_completion___block_invoke_2;
  v7[3] = &unk_2506946E0;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a2, "onDeviceModeEnabled:", v7);

}

uint64_t __69___LTTranslator_onDeviceModeEnabledWithDedicatedMachPort_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __29___LTTranslator__clearCaches__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = _LTOSLogXPC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __29___LTTranslator__clearCaches__block_invoke_cold_1();

}

uint64_t __29___LTTranslator__clearCaches__block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clearCaches");
}

void __54___LTTranslator_languageAssetsWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54___LTTranslator_languageAssetsWithOptions_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __54___LTTranslator_languageAssetsWithOptions_completion___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54___LTTranslator_languageAssetsWithOptions_completion___block_invoke_2;
  v8[3] = &unk_250694770;
  v6 = *(_QWORD *)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v10 = v5;
  v7 = v5;
  objc_msgSend(a2, "languageAssetsWithOptions:completion:", v6, v8);

}

uint64_t __54___LTTranslator_languageAssetsWithOptions_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __63___LTTranslator_setLanguageAssets_options_progress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    v4 = _LTOSLogXPC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __63___LTTranslator_setLanguageAssets_options_progress_completion___block_invoke_cold_1();
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __63___LTTranslator_setLanguageAssets_options_progress_completion___block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "assetRequestWithService:done:", a2, a3);
}

void __42___LTTranslator_addLanguages_useCellular___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = _LTOSLogXPC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __42___LTTranslator_addLanguages_useCellular___block_invoke_cold_1();

}

void __42___LTTranslator_addLanguages_useCellular___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void (**v6)(void);

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(unsigned __int8 *)(a1 + 40);
  v6 = a3;
  objc_msgSend(a2, "addLanguages:useCellular:", v4, v5);
  v6[2]();

}

void __33___LTTranslator_removeLanguages___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = _LTOSLogXPC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __33___LTTranslator_removeLanguages___block_invoke_cold_1();

}

void __33___LTTranslator_removeLanguages___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void (**v5)(void);

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "removeLanguages:", v4);
  v5[2]();

}

void __40___LTTranslator__offlineLanguageStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __40___LTTranslator__offlineLanguageStatus___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __40___LTTranslator__offlineLanguageStatus___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40___LTTranslator__offlineLanguageStatus___block_invoke_2;
  v7[3] = &unk_250694770;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a2, "_offlineLanguageStatus:", v7);

}

uint64_t __40___LTTranslator__offlineLanguageStatus___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __72___LTTranslator__downloadAssetForLanguagePair_userInitiated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __72___LTTranslator__downloadAssetForLanguagePair_userInitiated_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __72___LTTranslator__downloadAssetForLanguagePair_userInitiated_completion___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = *(unsigned __int8 *)(a1 + 48);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72___LTTranslator__downloadAssetForLanguagePair_userInitiated_completion___block_invoke_2;
  v9[3] = &unk_250694858;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = v5;
  v8 = v5;
  objc_msgSend(a2, "_downloadAssetForLanguagePair:userInitiated:completion:", v7, v6, v9);

}

uint64_t __72___LTTranslator__downloadAssetForLanguagePair_userInitiated_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __69___LTTranslator__purgeAssetForLanguagePair_userInitiated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69___LTTranslator__purgeAssetForLanguagePair_userInitiated_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __69___LTTranslator__purgeAssetForLanguagePair_userInitiated_completion___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = *(unsigned __int8 *)(a1 + 48);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69___LTTranslator__purgeAssetForLanguagePair_userInitiated_completion___block_invoke_2;
  v9[3] = &unk_250694858;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = v5;
  v8 = v5;
  objc_msgSend(a2, "_purgeAssetForLanguagePair:userInitiated:completion:", v7, v6, v9);

}

uint64_t __69___LTTranslator__purgeAssetForLanguagePair_userInitiated_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __59___LTTranslator__purgeAllAssetsExcludingConfig_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59___LTTranslator__purgeAllAssetsExcludingConfig_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __59___LTTranslator__purgeAllAssetsExcludingConfig_completion___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v6 = *(unsigned __int8 *)(a1 + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59___LTTranslator__purgeAllAssetsExcludingConfig_completion___block_invoke_2;
  v8[3] = &unk_250694858;
  v9 = *(id *)(a1 + 32);
  v10 = v5;
  v7 = v5;
  objc_msgSend(a2, "_purgeAllAssetsExcludingConfig:completion:", v6, v8);

}

uint64_t __59___LTTranslator__purgeAllAssetsExcludingConfig_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __34___LTTranslator__updateAllAssets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __34___LTTranslator__updateAllAssets___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __34___LTTranslator__updateAllAssets___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34___LTTranslator__updateAllAssets___block_invoke_2;
  v7[3] = &unk_250694858;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a2, "_updateAllAssets:", v7);

}

uint64_t __34___LTTranslator__updateAllAssets___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __31___LTTranslator__updateHotfix___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __31___LTTranslator__updateHotfix___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __31___LTTranslator__updateHotfix___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __31___LTTranslator__updateHotfix___block_invoke_2;
  v7[3] = &unk_250694858;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a2, "_updateHotfix:", v7);

}

uint64_t __31___LTTranslator__updateHotfix___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __31___LTTranslator__deleteHotfix___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __31___LTTranslator__deleteHotfix___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __31___LTTranslator__deleteHotfix___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __31___LTTranslator__deleteHotfix___block_invoke_2;
  v7[3] = &unk_250694858;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a2, "_deleteHotfix:", v7);

}

uint64_t __31___LTTranslator__deleteHotfix___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __34___LTTranslator_installedLocales___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __34___LTTranslator_installedLocales___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __34___LTTranslator_installedLocales___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34___LTTranslator_installedLocales___block_invoke_2;
  v7[3] = &unk_2506948D0;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a2, "installedLocales:", v7);

}

uint64_t __34___LTTranslator_installedLocales___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __52___LTTranslator_installedLocalesForTask_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __52___LTTranslator_installedLocalesForTask_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __52___LTTranslator_installedLocalesForTask_completion___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52___LTTranslator_installedLocalesForTask_completion___block_invoke_2;
  v8[3] = &unk_2506948D0;
  v6 = *(_QWORD *)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v10 = v5;
  v7 = v5;
  objc_msgSend(a2, "installedLocalesForTask:completion:", v6, v8);

}

uint64_t __52___LTTranslator_installedLocalesForTask_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __31___LTTranslator__getAssetSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __31___LTTranslator__getAssetSize___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __31___LTTranslator__getAssetSize___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __31___LTTranslator__getAssetSize___block_invoke_2;
  v7[3] = &unk_250694920;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a2, "_getAssetSize:", v7);

}

uint64_t __31___LTTranslator__getAssetSize___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __50___LTTranslator_installOfflineLocales_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    v4 = _LTOSLogXPC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __63___LTTranslator_setLanguageAssets_options_progress_completion___block_invoke_cold_1();
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __50___LTTranslator_installOfflineLocales_completion___block_invoke_34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startInstallationWithService:done:", a2, a3);
}

void __77___LTTranslator_availableLocalePairsForTask_useDedicatedMachPort_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77___LTTranslator_availableLocalePairsForTask_useDedicatedMachPort_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __77___LTTranslator_availableLocalePairsForTask_useDedicatedMachPort_completion___block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __77___LTTranslator_availableLocalePairsForTask_useDedicatedMachPort_completion___block_invoke_2;
  v8[3] = &unk_2506948D0;
  v6 = *(_QWORD *)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v10 = v5;
  v7 = v5;
  objc_msgSend(a2, "availableLocalePairsForTask:completion:", v6, v8);

}

uint64_t __77___LTTranslator_availableLocalePairsForTask_useDedicatedMachPort_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __70___LTTranslator_additionalLikelyPreferredLocalesForLocale_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70___LTTranslator_additionalLikelyPreferredLocalesForLocale_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __70___LTTranslator_additionalLikelyPreferredLocalesForLocale_completion___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70___LTTranslator_additionalLikelyPreferredLocalesForLocale_completion___block_invoke_2;
  v8[3] = &unk_2506948D0;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = v5;
  v7 = v5;
  objc_msgSend(a2, "additionalLikelyPreferredLocalesForLocale:completion:", v6, v8);

}

uint64_t __70___LTTranslator_additionalLikelyPreferredLocalesForLocale_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __60___LTTranslator_configInfoForLocale_otherLocale_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60___LTTranslator_configInfoForLocale_otherLocale_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __60___LTTranslator_configInfoForLocale_otherLocale_completion___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60___LTTranslator_configInfoForLocale_otherLocale_completion___block_invoke_2;
  v9[3] = &unk_250694970;
  v10 = *(id *)(a1 + 48);
  v11 = v5;
  v8 = v5;
  objc_msgSend(a2, "configInfoForLocale:otherLocale:completion:", v6, v7, v9);

}

uint64_t __60___LTTranslator_configInfoForLocale_otherLocale_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __39___LTTranslator_onDeviceModeSupported___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __39___LTTranslator_onDeviceModeSupported___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __39___LTTranslator_onDeviceModeSupported___block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39___LTTranslator_onDeviceModeSupported___block_invoke_2;
  v7[3] = &unk_2506949C0;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a2, "onDeviceModeSupported:", v7);

}

uint64_t __39___LTTranslator_onDeviceModeSupported___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __84___LTTranslator_shouldPresentSystemFirstUseConsentWithDedicatedMachPort_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __84___LTTranslator_shouldPresentSystemFirstUseConsentWithDedicatedMachPort_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __84___LTTranslator_shouldPresentSystemFirstUseConsentWithDedicatedMachPort_completion___block_invoke_42(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __84___LTTranslator_shouldPresentSystemFirstUseConsentWithDedicatedMachPort_completion___block_invoke_2;
  v7[3] = &unk_2506946E0;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a2, "shouldPresentSystemFirstUseConsent:", v7);

}

uint64_t __84___LTTranslator_shouldPresentSystemFirstUseConsentWithDedicatedMachPort_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __59___LTTranslator_taskIsSupportedInCurrentRegion_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59___LTTranslator_taskIsSupportedInCurrentRegion_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __59___LTTranslator_taskIsSupportedInCurrentRegion_completion___block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDBCEA0];
  v7 = a2;
  objc_msgSend(v6, "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDBCAE8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __59___LTTranslator_taskIsSupportedInCurrentRegion_completion___block_invoke_2;
  v12[3] = &unk_2506946E0;
  v10 = *(_QWORD *)(a1 + 40);
  v13 = *(id *)(a1 + 32);
  v14 = v5;
  v11 = v5;
  objc_msgSend(v7, "task:isSupportedInCountry:completion:", v10, v9, v12);

}

uint64_t __59___LTTranslator_taskIsSupportedInCurrentRegion_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __64___LTTranslator_autoDetectSpeechUnsupportedPairsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64___LTTranslator_autoDetectSpeechUnsupportedPairsWithCompletion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __64___LTTranslator_autoDetectSpeechUnsupportedPairsWithCompletion___block_invoke_45(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64___LTTranslator_autoDetectSpeechUnsupportedPairsWithCompletion___block_invoke_2;
  v7[3] = &unk_2506948D0;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a2, "autoDetectSpeechUnsupportedPairsWithCompletion:", v7);

}

uint64_t __64___LTTranslator_autoDetectSpeechUnsupportedPairsWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __51___LTTranslator_modalitiesPerLocaleWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __51___LTTranslator_modalitiesPerLocaleWithCompletion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __51___LTTranslator_modalitiesPerLocaleWithCompletion___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51___LTTranslator_modalitiesPerLocaleWithCompletion___block_invoke_2;
  v7[3] = &unk_2506949E8;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a2, "modalitiesPerLocaleWithCompletion:", v7);

}

uint64_t __51___LTTranslator_modalitiesPerLocaleWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __58___LTTranslator_textStreamingConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58___LTTranslator_textStreamingConfigurationWithCompletion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __58___LTTranslator_textStreamingConfigurationWithCompletion___block_invoke_48(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58___LTTranslator_textStreamingConfigurationWithCompletion___block_invoke_2;
  v7[3] = &unk_250694A10;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a2, "textStreamingConfigurationWithCompletion:", v7);

}

uint64_t __58___LTTranslator_textStreamingConfigurationWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __54___LTTranslator_task_isSupportedInCountry_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59___LTTranslator_taskIsSupportedInCurrentRegion_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __54___LTTranslator_task_isSupportedInCountry_completion___block_invoke_50(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54___LTTranslator_task_isSupportedInCountry_completion___block_invoke_2;
  v9[3] = &unk_2506946E0;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v10 = *(id *)(a1 + 40);
  v11 = v5;
  v8 = v5;
  objc_msgSend(a2, "task:isSupportedInCountry:completion:", v7, v6, v9);

}

uint64_t __54___LTTranslator_task_isSupportedInCountry_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __44___LTTranslator_languageForText_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __44___LTTranslator_languageForText_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __44___LTTranslator_languageForText_completion___block_invoke_51(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44___LTTranslator_languageForText_completion___block_invoke_2;
  v8[3] = &unk_250694A60;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = v5;
  v7 = v5;
  objc_msgSend(a2, "languageForText:completion:", v6, v8);

}

uint64_t __44___LTTranslator_languageForText_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __90___LTTranslator_languagesForText_usingModel_strategy_useDedicatedTextMachPort_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __90___LTTranslator_languagesForText_usingModel_strategy_useDedicatedTextMachPort_completion___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __90___LTTranslator_languagesForText_usingModel_strategy_useDedicatedTextMachPort_completion___block_invoke_57(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __90___LTTranslator_languagesForText_usingModel_strategy_useDedicatedTextMachPort_completion___block_invoke_2;
  v10[3] = &unk_250694A88;
  v8 = *(_QWORD *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = v5;
  v9 = v5;
  objc_msgSend(a2, "languagesForText:usingModel:strategy:completion:", v8, v6, v7, v10);

}

uint64_t __90___LTTranslator_languagesForText_usingModel_strategy_useDedicatedTextMachPort_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __65___LTTranslator__getServiceProxyWithDelegate_errorHandler_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65___LTTranslator__getServiceProxyWithDelegate_errorHandler_block___block_invoke_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __65___LTTranslator__getServiceProxyWithDelegate_errorHandler_block___block_invoke_62(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = _LTOSLogXPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_235438000, v2, OS_LOG_TYPE_INFO, "Connection done", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __94___LTTranslator__getTextServiceProxyWithDelegate_useDedicatedTextMachPort_errorHandler_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __94___LTTranslator__getTextServiceProxyWithDelegate_useDedicatedTextMachPort_errorHandler_block___block_invoke_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __94___LTTranslator__getTextServiceProxyWithDelegate_useDedicatedTextMachPort_errorHandler_block___block_invoke_65(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = _LTOSLogXPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_235438000, v2, OS_LOG_TYPE_INFO, "Text translation connection done", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __69___LTTranslator__getSyncServiceProxyWithDelegate_errorHandler_block___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __39___LTTranslator_preheatForRequestSync___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = _LTOSLogXPC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __39___LTTranslator_preheatForRequestSync___block_invoke_cold_1();

}

void __39___LTTranslator_preheatForRequestSync___block_invoke_67(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "requestContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preheatWithContext:completion:", v4, &__block_literal_global_68);

}

void __46___LTTranslator_preheatForRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46___LTTranslator_preheatForRequest_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __46___LTTranslator_preheatForRequest_completion___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "requestContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46___LTTranslator_preheatForRequest_completion___block_invoke_2;
  v10[3] = &unk_250694858;
  v11 = *(id *)(a1 + 40);
  v12 = v5;
  v9 = v5;
  objc_msgSend(v7, "preheatWithContext:completion:", v8, v10);

}

uint64_t __46___LTTranslator_preheatForRequest_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __24___LTTranslator_cleanup__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = _LTOSLogXPC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24___LTTranslator_cleanup__block_invoke_cold_1();

}

void __24___LTTranslator_cleanup__block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  void (**v4)(void);

  v4 = a3;
  objc_msgSend(a2, "cleanup");
  v4[2]();

}

void __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "_translationFailedWithError:", v3);

}

uint64_t __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke_78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startTranslationWithTextService:done:", a2, a3);
}

void __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke_2_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "_translationFailedWithError:", v3);

}

uint64_t __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke_79(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startTranslationWithService:done:", a2, a3);
}

void __21___LTTranslator_log___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = _LTOSLogXPC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __21___LTTranslator_log___block_invoke_cold_1();

}

void __21___LTTranslator_log___block_invoke_82(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void (**v5)(void);

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "logWithRequestData:", v4);
  v5[2]();

}

void __42___LTTranslator_selfLoggingEventWithData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __42___LTTranslator_selfLoggingEventWithData___block_invoke_cold_1(a1, v4);

}

void __42___LTTranslator_selfLoggingEventWithData___block_invoke_85(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void (**v5)(void);

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "selfLoggingEventWithData:", v4);
  v5[2]();

}

void __81___LTTranslator_selfLoggingInvocationStartedWithData_invocationStartedTier1Data___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __81___LTTranslator_selfLoggingInvocationStartedWithData_invocationStartedTier1Data___block_invoke_cold_1(a1, v4);

}

void __81___LTTranslator_selfLoggingInvocationStartedWithData_invocationStartedTier1Data___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void (**v6)(void);

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  objc_msgSend(a2, "selfLoggingInvocationStartedWithData:invocationStartedTier1Data:", v4, v5);
  v6[2]();

}

void __71___LTTranslator_selfLoggingLanguageIdentificationCompletedWithLIDData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __42___LTTranslator_selfLoggingEventWithData___block_invoke_cold_1(a1, v4);

}

void __71___LTTranslator_selfLoggingLanguageIdentificationCompletedWithLIDData___block_invoke_87(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void (**v5)(void);

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "selfLoggingLanguageIdentificationCompletedWithLIDData:", v4);
  v5[2]();

}

void __27___LTTranslator_initialize__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_235438000, a1, a3, "Connection to translationd was interrupted, the process exited or crashed", a5, a6, a7, a8, 0);
}

void __69___LTTranslator_onDeviceModeEnabledWithDedicatedMachPort_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_235438000, v0, v1, "Failed to complete onDeviceModeEnabled check, using dedicated mach port %{BOOL}i: %@");
  OUTLINED_FUNCTION_1();
}

void __29___LTTranslator__clearCaches__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to clear caches: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __54___LTTranslator_languageAssetsWithOptions_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to get language asset status %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63___LTTranslator_setLanguageAssets_options_progress_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to install offline locales: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __42___LTTranslator_addLanguages_useCellular___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to add language %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __33___LTTranslator_removeLanguages___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed remove language %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __40___LTTranslator__offlineLanguageStatus___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete get offline language status: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __72___LTTranslator__downloadAssetForLanguagePair_userInitiated_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete _downloadAssetForLanguagePair %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __69___LTTranslator__purgeAssetForLanguagePair_userInitiated_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete _purgeAssetForLanguagePair %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __59___LTTranslator__purgeAllAssetsExcludingConfig_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete purging all assets: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __34___LTTranslator__updateAllAssets___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete updating all assets: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __31___LTTranslator__updateHotfix___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete updating hotfix: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __31___LTTranslator__deleteHotfix___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete deleting hotfix: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __34___LTTranslator_installedLocales___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete installedLocales %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __52___LTTranslator_installedLocalesForTask_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete -installedLocalesForTask:completion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __31___LTTranslator__getAssetSize___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete getting asset size: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __77___LTTranslator_availableLocalePairsForTask_useDedicatedMachPort_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_235438000, v0, v1, "Failed to complete availableLocalePairsForTask, using dedicated mach port: %i: %@");
  OUTLINED_FUNCTION_1();
}

void __70___LTTranslator_additionalLikelyPreferredLocalesForLocale_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete additionalLikelyPreferredLocalesForLocale %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60___LTTranslator_configInfoForLocale_otherLocale_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete configInfoForLocale %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __39___LTTranslator_onDeviceModeSupported___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete onDeviceModeSupported check: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __84___LTTranslator_shouldPresentSystemFirstUseConsentWithDedicatedMachPort_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete checking whether to present system first time use consent: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __59___LTTranslator_taskIsSupportedInCurrentRegion_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete taskIsSupportedInCurrentRegion %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64___LTTranslator_autoDetectSpeechUnsupportedPairsWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete autoDetectSpeechUnsupportedPairsWithCompletion %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __51___LTTranslator_modalitiesPerLocaleWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete modalitiesPerLocaleWithCompletion %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __58___LTTranslator_textStreamingConfigurationWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete textStreamingConfigurationWithCompletion %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __44___LTTranslator_languageForText_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete text-LID request %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __90___LTTranslator_languagesForText_usingModel_strategy_useDedicatedTextMachPort_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("whitelist");
  if (!*(_BYTE *)(a1 + 40))
    v3 = CFSTR("entitlement");
  v4 = 138543618;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_235438000, log, OS_LOG_TYPE_ERROR, "Failed to complete text-LID %{public}@-based request %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __65___LTTranslator__getServiceProxyWithDelegate_errorHandler_block___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Connection error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __94___LTTranslator__getTextServiceProxyWithDelegate_useDedicatedTextMachPort_errorHandler_block___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Text translation connection error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __39___LTTranslator_preheatForRequestSync___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete sync preheat request: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46___LTTranslator_preheatForRequest_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete preheat request %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __24___LTTranslator_cleanup__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to initiate cleanup: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete getting text service for translation with dedicated mach port: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __52___LTTranslator_translate_useDedicatedTextMachPort___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete getting text service for translation without dedicated mach port: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __21___LTTranslator_log___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Failed to complete logging request: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __42___LTTranslator_selfLoggingEventWithData___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_6_1(a1, a2);
  objc_msgSend(v2, "invocationId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_235438000, v5, v6, "Failed to send SELF logging event [%@] %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_0();
}

void __81___LTTranslator_selfLoggingInvocationStartedWithData_invocationStartedTier1Data___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_6_1(a1, a2);
  objc_msgSend(v2, "invocationId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_235438000, v5, v6, "Failed to send SELF logging invocation started and started tier 1 [%{public}@] %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_0();
}

@end
