@implementation HMMediaSystem

void __50__HMMediaSystem_HFAdditions__hf_fakeDebugSymptoms__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "hf_fakeDebugSymptoms");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

uint64_t __66__HMMediaSystem_HFIncludedContextProtocol__hf_isOnForContextType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isOnForContextType:", *(_QWORD *)(a1 + 32));
}

uint64_t __68__HMMediaSystem_HFIncludedContextProtocol__hf_hasSetForContextType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_hasSetForContextType:", *(_QWORD *)(a1 + 32));
}

uint64_t __72__HMMediaSystem_HFIncludedContextProtocol__hf_shouldHideForContextType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_shouldHideForContextType:", *(_QWORD *)(a1 + 32));
}

BOOL __61__HMMediaSystem_HFHomeKitObjectConformance__hf_isValidObject__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "mediaProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

uint64_t __61__HMMediaSystem_HFHomeKitObjectConformance__hf_isValidObject__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __64__HMMediaSystem_HFMediaAccessoryProfileAdditions__mediaProfiles__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mediaProfile");
}

uint64_t __72__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_isCurrentAccessory__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentAccessory");
}

uint64_t __65__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_isReachable__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  int v4;

  v2 = a2;
  v3 = objc_msgSend(v2, "isReachable");
  v4 = objc_msgSend(v2, "hf_fakeUnreachableError");

  return v3 & ~v4;
}

uint64_t __75__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_isAppleMusicReachable__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "remoteLoginHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isControllable");

  return v3;
}

uint64_t __82__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_isAccessorySettingsReachable__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isControllable");

  return v3;
}

id __75__HMMediaSystem_HFMediaAccessoryProfileAdditions__homekitObjectIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __90__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_appleMusicCurrentLoggedInAccountDSID__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "mediaProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_appleMusicCurrentLoggedInAccountDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __86__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_homePodSupportsMultiUserLanguage__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0CFE9B0]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_homePodSupportsMultiUserLanguage__block_invoke_2;
  v6[3] = &unk_1EA73A080;
  v7 = v3;
  v8 = *(_OWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v4, "fetchSupportedMultiUserLanguageCodes:", v6);

}

void __86__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_homePodSupportsMultiUserLanguage__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412546;
      v28 = v26;
      v29 = 2112;
      v30 = v6;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages [%@]", (uint8_t *)&v27, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
    goto LABEL_20;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(void **)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138412802;
    v28 = v9;
    v29 = 2112;
    v30 = v10;
    v31 = 2112;
    v32 = v5;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ Supported voice recognition languages %@", (uint8_t *)&v27, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "accessories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "anyObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "hf_isSiriEndpoint"))
  {

LABEL_10:
    objc_msgSend(*(id *)(a1 + 40), "hf_siriLanguageOptionsManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "selectedLanguageOption");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "homeManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hasOptedToHH2");

  if (v15)
    goto LABEL_10;
  objc_msgSend(*(id *)(a1 + 40), "hf_settingsAdapterManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "adapterForIdentifier:", CFSTR("SiriLanguageAdapter"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v19 = v18;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v21 = v20;

  objc_msgSend(v21, "selectedLanguageOption");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  if (v17
    && (objc_msgSend(v17, "recognitionLanguage"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v23 = objc_msgSend(v5, "containsObject:", v22),
        v22,
        (v23 & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }
  else
  {
    v24 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 45);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "finishWithError:", v25);

  }
LABEL_20:

}

uint64_t __81__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_isForcedVisibleInHomeStatus__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isForcedVisibleInHomeStatus");
}

void __62__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_tileSize__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[HFHomeKitObjectSettingsStore tileSizeForObject:](HFHomeKitObjectSettingsStore, "tileSizeForObject:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_safeAddObject:", v3);

}

id __66__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_setTileSize___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HFHomeKitObjectSettingsStore setTileSize:forObject:](HFHomeKitObjectSettingsStore, "setTileSize:forObject:", *(_QWORD *)(a1 + 32), a2);
}

uint64_t __66__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_setTileSize___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

id __71__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_containedServices__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __78__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_containedCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_containedCharacteristics");
}

uint64_t __63__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_isInRoom___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);

  return v6;
}

uint64_t __62__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_safeRoom__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "room");
}

uint64_t __65__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_moveToRoom___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_moveToRoom:", *(_QWORD *)(a1 + 32));
}

uint64_t __62__HMMediaSystem_HFMediaAccessoryProfileAdditions__hf_identify__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_identifyHomePod");
}

@end
