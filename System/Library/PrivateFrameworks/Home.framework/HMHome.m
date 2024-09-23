@implementation HMHome

uint64_t __42__HMHome_Additions__hf_allVisibleServices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_visibleServices");
}

uint64_t __57__HMHome_Additions__hf_audioAnalysisSupportedAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isAudioAnalysisSupportedDevice");
}

uint64_t __44__HMHome_Additions__hf_walletKeyAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsWalletKey");
}

uint64_t __32__HMHome_Additions__hf_homePods__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isHomePod");
}

uint64_t __35__HMHome_Additions__hf_hasHomePods__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isHomePod");
}

uint64_t __35__HMHome_Additions__hf_hasAppleTVs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isAppleTV");
}

uint64_t __45__HMHome_Additions__hf_hasVisibleAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isVisibleAccessory");
}

uint64_t __56__HMHome_Additions__hf_accessoriesSupportingAccessCodes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsAccessCodes");
}

uint64_t __49__HMHome_Additions__hf_hasSecureRecordingCameras__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isCamera");
}

uint64_t __77__HMHome_Additions__hf_atleastOneMediaAccessorySupportsAndHasAnnounceEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;

  v2 = a2;
  if ((objc_msgSend(v2, "hf_isHomePod") & 1) != 0)
  {
    objc_msgSend(v2, "mediaProfile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hf_settingsValueManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_accessorySettingAtKeyPath:", CFSTR("root.announce.enabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(v4, "valueForSetting:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (!v9)
      goto LABEL_16;
  }
  else
  {
    objc_msgSend(v2, "hf_siriEndpointProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
LABEL_17:
      v14 = 0;
      goto LABEL_18;
    }
    objc_msgSend(v2, "mediaProfile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hf_mediaAccessoryCommonSettingsManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(v11, "settingValueForKeyPath:", HFAnnounceEnabledKeyPath);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v7;
    else
      v12 = 0;
    v13 = v12;

    if (!v13)
    {

LABEL_16:
      v7 = 0;
      goto LABEL_17;
    }
    objc_msgSend(v13, "BOOLValue");

  }
  if ((objc_msgSend(v7, "BOOLValue") & 1) == 0)
    goto LABEL_17;
  v14 = objc_msgSend(v2, "supportsAnnounce");
LABEL_18:

  return v14;
}

uint64_t __41__HMHome_Additions__hf_allCameraProfiles__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cameraProfiles");
}

uint64_t __55__HMHome_AbstractionAdditions__hf_accessoryLikeObjects__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_accessoryLikeObjects");
}

uint64_t __63__HMHome_Additions__hf_siriEndpointCapableAccessoriesToOnboard__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "hf_siriEndpointProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "supportsOnboarding"))
    v3 = objc_msgSend(v2, "isNeedsOnboarding");
  else
    v3 = 0;

  return v3;
}

uint64_t __42__HMHome_Additions__hf_visibleAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isVisibleAccessory");
}

uint64_t __40__HMHome_Additions__hf_mediaAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isMediaAccessory");
}

uint64_t __43__HMHome_Additions__hf_roomWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __56__HMHome_Additions__hf_allProgrammableSwitchAccessories__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __44__HMHome_Additions__hf_hasRMVCapableAppleTV__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "hf_isAppleTV"))
    v3 = objc_msgSend(v2, "hf_supportsRMVOnAppleTV");
  else
    v3 = 0;

  return v3;
}

void __65__HMHome_Additions__hf_fetchWalletKeyDeviceStateForCurrentDevice__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  HFLogForCategory(0x42uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v17 = v10;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "(%@) Fetched Wallet Key Device State for current device: %@. Updating cache.", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v5);
    objc_setAssociatedObject(WeakRetained, "hf_cachedWalletKeyDeviceStateForCurrentDeviceKey", v5, (void *)1);
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__HMHome_Additions__hf_fetchWalletKeyDeviceStateForCurrentDevice__block_invoke_268;
    v13[3] = &unk_1EA72F510;
    v14 = v5;
    v15 = WeakRetained;
    objc_msgSend(v11, "dispatchWalletKeyDeviceStateObserverMessage:sender:", v13, 0);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v17 = v12;
      v18 = 2112;
      v19 = v6;
      _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "(%@) Could not fetch Wallet Key Device State for current device: %@", buf, 0x16u);
    }

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", -1);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6);
  }
  objc_setAssociatedObject(WeakRetained, "hf_fetchWalletKeyDeviceStateFuture", 0, (void *)1);

}

uint64_t __60__HMHome_Additions__hf_allCameraProfilesSupportingRecording__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  unint64_t v3;

  objc_msgSend(a2, "userSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportedFeatures");

  return (v3 >> 1) & 1;
}

BOOL __49__HMHome_Additions__hf_hasSecureRecordingCameras__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  char v3;

  objc_msgSend(a2, "userSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportedFeatures");

  return (v3 & 6) != 0;
}

id __40__HMHome_Additions__hf_allLightProfiles__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "lightProfiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __74__HMHome_Additions__hf_dashboardSectionReorderableHomeKitObjectComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "hf_reorderableDashboardSectionList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "sortedIdentifiersWithIdentifier1:identifier2:", v10, v12))
    v13 = -1;
  else
    v13 = 1;

  return v13;
}

uint64_t __71__HMHome_Additions__hf_dashboardSectionReorderableUUIDStringComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  int v9;
  uint64_t v10;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "hf_reorderableDashboardSectionList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sortedIdentifiersWithIdentifier1:identifier2:", v6, v5);

  if (v9)
    v10 = -1;
  else
    v10 = 1;

  return v10;
}

id __37__HMHome_Additions__hf_walletKeyUUID__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(a2, "walletKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __56__HMHome_Additions__hf_allProgrammableSwitchAccessories__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__HMHome_Additions__hf_allProgrammableSwitchAccessories__block_invoke_2;
  v6[3] = &unk_1EA7283A0;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __49__HMHome_Additions__hf_hasSecureRecordingCameras__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "cameraProfiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_126);

  return v3;
}

BOOL __41__HMHome_Additions__hf_hasVisibleServies__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "hf_visibleServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

id __36__HMHome_Additions__hf_orderedRooms__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "hf_dashboardSectionReorderableHomeKitObjectComparator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    NSLog(CFSTR("Could not create room comparator for Home = %@."), WeakRetained);
  objc_msgSend(WeakRetained, "hf_activeRooms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __50__HMHome_HFUserHandleAdditions__hf_userForHandle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "userID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

id __54__HMHome_HFDebugging__hf_stateDumpBuilderWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a2;
  objc_msgSend(v3, "hf_displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ : UUID %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __54__HMHome_HFDebugging__hf_stateDumpBuilderWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a2;
  objc_msgSend(v3, "hf_displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ : UUID %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __79__HMHome_HFFavoritingAdditions__hf_favoriteCameraCountExcludingHomeKitObjects___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;

  v3 = a2;
  v4 = objc_msgSend(v3, "hf_effectiveShowInHomeDashboard");
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0)
    v5 = 0;
  else
    v5 = objc_msgSend(v3, "hf_isCamera") & v4;

  return v5;
}

uint64_t __40__HMHome_Additions__hf_canAddHomeMember__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEnabled");
}

uint64_t __37__HMHome_Additions__hf_roomWithName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __40__HMHome_Additions__hf_setSelectedRoom___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "home:didSelectRoom:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __43__HMHome_Additions__hf_zoneWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __48__HMHome_Additions__hf_updateNetworkProtection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory(0x39uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v12 = v6;
    v13 = 2112;
    v14 = WeakRetained;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Updating network protection mode to %li for home %@", buf, 0x16u);
  }

  v7 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__HMHome_Additions__hf_updateNetworkProtection___block_invoke_60;
  v9[3] = &unk_1EA726360;
  v9[4] = WeakRetained;
  v10 = v3;
  v8 = v3;
  objc_msgSend(WeakRetained, "updateNetworkProtection:completionHandler:", v7, v9);

}

void __48__HMHome_Additions__hf_updateNetworkProtection___block_invoke_60(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__HMHome_Additions__hf_updateNetworkProtection___block_invoke_2;
  v6[3] = &unk_1EA726918;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "dispatchHomeObserverMessage:sender:", v6, 0);

  if (v3)
  {
    HFLogForCategory(0x39uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v3;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Failed to update network protection mode with error %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

uint64_t __48__HMHome_Additions__hf_updateNetworkProtection___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "homeDidUpdateProtectionMode:", *(_QWORD *)(a1 + 32));
}

BOOL __50__HMHome_Additions__hf_accessoryWithMatterNodeID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "matterNodeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

uint64_t __54__HMHome_Additions__hf_mediaSystemForSymptomsHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__HMHome_Additions__hf_mediaSystemForSymptomsHandler___block_invoke_2;
  v6[3] = &unk_1EA727840;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __54__HMHome_Additions__hf_mediaSystemForSymptomsHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "symptomsHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __51__HMHome_Additions__hf_allNetworkRouterAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isNetworkRouter");
}

uint64_t __51__HMHome_Additions__hf_allTargetControlAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isRemoteControl");
}

unint64_t __45__HMHome_Additions__hf_primaryResidentDevice__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "status") >> 1) & 1;
}

uint64_t __46__HMHome_Additions__hf_enabledResidentDevices__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isEnabled"))
    v3 = objc_msgSend(v2, "capabilities") & 1;
  else
    v3 = 0;

  return v3;
}

uint64_t __42__HMHome_Additions__hf_actionSetWithUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

unint64_t __78__HMHome_Additions__hf_hasResidentDeviceCapableOfSupportingThreadBorderRouter__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "capabilities") >> 16) & 1;
}

unint64_t __77__HMHome_Additions__hf_hasResidentDeviceCapableOfSupportingMatterSharedAdmin__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "capabilities") >> 26) & 1;
}

unint64_t __64__HMHome_Additions__hf_hasResidentDeviceCapableOfSupportingCHIP__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "capabilities") >> 22) & 1;
}

unint64_t __73__HMHome_Additions__hf_hasResidentDeviceCapableOfSupportingActivityZones__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "capabilities") >> 12) & 1;
}

unint64_t __82__HMHome_Additions__hf_hasResidentDeviceCapableOfSupportingEnhancedDetectionModes__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "capabilities") >> 20) & 1;
}

id __50__HMHome_Additions__hf_residentDevicesAddedToHome__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __50__HMHome_Additions__hf_residentDevicesAddedToHome__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  if (objc_msgSend(v3, "hf_isResidentAppleTV"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "containsObject:", v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __45__HMHome_Additions__hf_hasReachableResidents__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isReachable");
}

uint64_t __48__HMHome_Additions__hf_serviceGroupsForService___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "hf_isSupported"))
  {
    objc_msgSend(v3, "services");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __51__HMHome_Additions__hf_serviceGroupWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __48__HMHome_Additions__hf_mediaSystemForAccessory___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "components");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__HMHome_Additions__hf_mediaSystemForAccessory___block_invoke_2;
  v6[3] = &unk_1EA72E690;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __48__HMHome_Additions__hf_mediaSystemForAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "mediaProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

uint64_t __50__HMHome_Additions__hf_mediaSystemWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __53__HMHome_Additions__hf_appleTVUsingAudioDestination___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "audioDestinationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioDestinationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v6;
}

uint64_t __67__HMHome_Additions__hf_relatedHomeTheaterMediaProfileContainerFor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(v3, "hf_backingAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "hf_backingAccessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
  }
  else
  {
    objc_opt_class();
    v7 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v6 = v8;

    v5 = v6;
  }
  objc_msgSend(v5, "audioDestinationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "audioDestinationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  return v11;
}

BOOL __53__HMHome_Additions__hf_appleTVsSupportingHomeTheater__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "audioDestinationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availableDestinations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

uint64_t __56__HMHome_Additions__accessoriesSupportingSoftwareUpdate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_supportsSoftwareUpdate");
}

uint64_t __62__HMHome_Additions__hf_hasAccessoriesSupportingSoftwareUpdate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_supportsSoftwareUpdate");
}

uint64_t __72__HMHome_Additions__hf_hasFirstPartyAccessoriesSupportingSoftwareUpdate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isHomePod");
}

uint64_t __72__HMHome_Additions__hf_hasThirdPartyAccessoriesSupportingSoftwareUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "hf_supportsSoftwareUpdate"))
    v3 = objc_msgSend(v2, "hf_isHomePod") ^ 1;
  else
    v3 = 0;

  return v3;
}

uint64_t __69__HMHome_Additions__hf_accessoriesWithValidSoftwareOrFirmwareUpdates__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_hasValidSoftwareOrFirmwareUpdate");
}

id __60__HMHome_Additions__hf_accessoriesSupportingNaturalLighting__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_99_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __60__HMHome_Additions__hf_accessoriesSupportingNaturalLighting__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessory");
}

uint64_t __63__HMHome_Additions__hf_homeKitObjectsSupportingNaturalLighting__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "services");
}

id __63__HMHome_Additions__hf_homeKitObjectsSupportingNaturalLighting__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hf_isMultiServiceAccessory") & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(v2, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_showAsIndividualServices");

  if ((v5 & 1) != 0)
  {
LABEL_5:
    v6 = v2;
    goto LABEL_6;
  }
  objc_msgSend(v2, "accessory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v7 = v6;

  return v7;
}

uint64_t __53__HMHome_Additions__hf_containsActionableAccessories__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HFNullValueSource *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  v3 = objc_alloc_init(HFNullValueSource);
  +[HFServiceItem serviceItemForService:valueSource:](HFServiceItem, "serviceItemForService:valueSource:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "containsActions");
  return v5;
}

uint64_t __44__HMHome_Additions__hf_allAccessoryProfiles__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "profiles");
}

uint64_t __51__HMHome_Additions__hf_accessoryProfilesWithClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

id __55__HMHome_Additions__hf_allNetworkConfigurationProfiles__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

uint64_t __65__HMHome_Additions__hf_allLightProfilesSupportingNaturalLighting__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportedFeatures") & 1;

  return v3;
}

uint64_t __52__HMHome_Additions__hf_cameraProfileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __57__HMHome_Additions__hf_cameraProfileForSignificantEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cameraProfileUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

BOOL __60__HMHome_Additions__hf_allCameraProfilesWithDoorbellService__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_serviceOfType:", *MEMORY[0x1E0CB9A08]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

BOOL __72__HMHome_Additions__hf_allCameraProfilesWithSmartMotionRecordingEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL8 v14;
  int v16;
  id v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "userSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accessModeForPresenceType:", 3);

  objc_msgSend(v3, "userSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "accessModeForPresenceType:", 4);

  objc_msgSend(v3, "userSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "recordingEventTriggers");

  v11 = v5 == 2 || v7 == 2;
  v12 = *(_QWORD *)(a1 + 32) & v9;
  HFLogForCategory(0x13uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412802;
    v17 = v3;
    v18 = 1024;
    v19 = v11;
    v20 = 1024;
    v21 = v12 != 0;
    _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "Camera %@ streamAndRecord %d recordingEvents %d", (uint8_t *)&v16, 0x18u);
  }

  if (v12)
    v14 = v11;
  else
    v14 = 0;

  return v14;
}

uint64_t __49__HMHome_Additions__hf_allMediaProfileContainers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mediaProfile");
}

uint64_t __49__HMHome_Additions__hf_allMediaProfileContainers__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_isMediaAccessory");

  return v3;
}

BOOL __75__HMHome_Additions__hf_allUniqueMediaProfileContainersExcludingMediaGroups__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "hf_backingAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_backingAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "hf_mediaSystemForAccessory:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 == 0;
}

id __55__HMHome_Additions__hf_allUniqueMediaProfileContainers__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "hf_isMediaAccessory"))
  {
    objc_msgSend(v2, "mediaProfile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

BOOL __55__HMHome_Additions__hf_allUniqueMediaProfileContainers__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "hf_backingAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_backingAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "hf_mediaSystemForAccessory:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 == 0;
}

uint64_t __48__HMHome_Additions__hf_allHomePodsOrStereoPairs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mediaProfile");
}

BOOL __48__HMHome_Additions__hf_allHomePodsOrStereoPairs__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hf_isHomePod"))
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v6, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hf_mediaSystemForAccessory:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __51__HMHome_Additions__hf_allHomePodProfileContainers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mediaProfile");
}

uint64_t __51__HMHome_Additions__hf_allHomePodProfileContainers__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hf_isHomePod");

  return v7;
}

BOOL __61__HMHome_Additions__hf_allHomePodsOrStereoPairsThatWillChime__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HFMediaHelper isDoorbellChimeEnabled:](HFMediaHelper, "isDoorbellChimeEnabled:", a2);
}

unint64_t __50__HMHome_Additions__hf_isFaceRecognitionAvailable__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "capabilities") >> 13) & 1;
}

void __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  char v11;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0CBA6D0]);
  objc_msgSend(v4, "setFaceClassificationEnabled:", *(unsigned __int8 *)(a1 + 40));
  v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke_2;
  v8[3] = &unk_1EA72EC00;
  v11 = *(_BYTE *)(a1 + 40);
  v8[4] = v5;
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  objc_msgSend(v5, "updatePersonManagerSettings:completion:", v6, v8);

}

void __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HFLogForCategory(0x13uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(void **)(a1 + 32);
      v7 = *(unsigned __int8 *)(a1 + 56);
      objc_msgSend(v6, "personManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v16 = v6;
      v17 = 1024;
      v18 = v7;
      v19 = 2112;
      v20 = v8;
      v21 = 2112;
      v22 = v3;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "%@: Failed to update face recognition enabled(%d) for person manager %@ with error %@", buf, 0x26u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
  }
  else
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke_140;
    v12 = &unk_1EA7277C8;
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v5, "dispatchHomeObserverMessage:sender:", &v9, 0);

    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult", v9, v10, v11, v12, v13);
  }

}

void __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke_140(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "home:didUpdatePersonManagerSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke_2_143(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  char v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CBA6E8]);
  objc_msgSend(v5, "setImportingFromPhotoLibraryEnabled:", 0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke_3;
  v10[3] = &unk_1EA72EC50;
  v6 = *(_QWORD *)(a1 + 32);
  v14 = *(_BYTE *)(a1 + 40);
  v10[4] = v6;
  v11 = v4;
  v12 = v3;
  v13 = v5;
  v7 = v5;
  v8 = v3;
  v9 = v4;
  objc_msgSend(v9, "updatePhotosPersonManagerSettings:completion:", v7, v10);

}

void __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HFLogForCategory(0x13uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(unsigned __int8 *)(a1 + 64);
      v8 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(a1 + 40);
      objc_msgSend(v7, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v17 = v8;
      v18 = 1024;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      v22 = 2112;
      v23 = v9;
      v24 = 2112;
      v25 = v3;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "%@: Failed to update face recognition enabled(%d) for user %@ (%@) with error %@", buf, 0x30u);

    }
    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v3);
  }
  else
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke_145;
    v13 = &unk_1EA72EC28;
    v14 = *(id *)(a1 + 40);
    v15 = *(id *)(a1 + 56);
    objc_msgSend(v5, "dispatchUserObserverMessage:sender:", &v10, 0);

    objc_msgSend(*(id *)(a1 + 48), "finishWithNoResult", v10, v11, v12, v13);
  }

}

void __50__HMHome_Additions__hf_setFaceRecognitionEnabled___block_invoke_145(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "user:didUpdatePersonManagerSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __47__HMHome_Additions__hf_allPhotosPersonManagers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "photosPersonManager");
}

uint64_t __52__HMHome_Additions__hf_personManagerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __34__HMHome_Additions__hf_allPersons__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v3 = (void *)MEMORY[0x1E0D519C0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__HMHome_Additions__hf_allPersons__block_invoke_2;
  v7[3] = &unk_1EA7268F0;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "futureWithCompletionHandlerAdapterBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __34__HMHome_Additions__hf_allPersons__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchAllPersonsWithCompletion:", a2);
}

id __34__HMHome_Additions__hf_allPersons__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(a2, "na_flatMap:", &__block_literal_global_160);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __34__HMHome_Additions__hf_allPersons__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allObjects");
}

uint64_t __45__HMHome_Additions__hf_personWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_personWithIdentifier:", *(_QWORD *)(a1 + 32));
}

id __45__HMHome_Additions__hf_personWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a2, "na_map:", &__block_literal_global_163_1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D519C0];
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithError:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

id __45__HMHome_Additions__hf_personWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

void __101__HMHome_Additions__hf_setPhotosLibrarySettingsForUser_importPhotosLibraryEnabled_shareFacesEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0CBA6E8]);
  objc_msgSend(v4, "setImportingFromPhotoLibraryEnabled:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(v4, "setSharingFaceClassificationsEnabled:", *(unsigned __int8 *)(a1 + 49));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __101__HMHome_Additions__hf_setPhotosLibrarySettingsForUser_importPhotosLibraryEnabled_shareFacesEnabled___block_invoke_2;
  v8[3] = &unk_1EA72EDE8;
  v5 = *(void **)(a1 + 32);
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v10 = v5;
  v11 = v3;
  v6 = v3;
  v7 = v4;
  objc_msgSend(v10, "updatePersonManagerSettings:completion:", v7, v8);

}

void __101__HMHome_Additions__hf_setPhotosLibrarySettingsForUser_importPhotosLibraryEnabled_shareFacesEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HFLogForCategory(0x13uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138413058;
      v16 = v6;
      v17 = 2080;
      v18 = "-[HMHome(Additions) hf_setPhotosLibrarySettingsForUser:importPhotosLibraryEnabled:shareFacesEnabled:]_block_invoke_2";
      v19 = 2112;
      v20 = v7;
      v21 = 2112;
      v22 = v8;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "%@ %s: Failed to update external person manager settings %@ for user %@", buf, 0x2Au);
    }

    objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v3);
  }
  else
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __101__HMHome_Additions__hf_setPhotosLibrarySettingsForUser_importPhotosLibraryEnabled_shareFacesEnabled___block_invoke_170;
    v12 = &unk_1EA72EC28;
    v13 = *(id *)(a1 + 48);
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v5, "dispatchUserObserverMessage:sender:", &v9, 0);

    objc_msgSend(*(id *)(a1 + 56), "finishWithNoResult", v9, v10, v11, v12);
  }

}

void __101__HMHome_Additions__hf_setPhotosLibrarySettingsForUser_importPhotosLibraryEnabled_shareFacesEnabled___block_invoke_170(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "user:didUpdatePersonManagerSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __69__HMHome_Additions__hf_accessoriesRequiringManualWiFiReconfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "hf_networkConfigurationProfiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_174_0);

  return v3;
}

uint64_t __69__HMHome_Additions__hf_accessoriesRequiringManualWiFiReconfiguration__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_requiresManualWiFiReconfiguration");
}

uint64_t __61__HMHome_Additions__hf_updateAutomaticSoftwareUpdateEnabled___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAutomaticSoftwareUpdateEnabled:completionHandler:", *(unsigned __int8 *)(a1 + 40), a2);
}

uint64_t __80__HMHome_Additions__hf_updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled:completionHandler:", *(unsigned __int8 *)(a1 + 40), a2);
}

uint64_t __32__HMHome_Additions__hf_appleTVs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isAppleTV");
}

BOOL __46__HMHome_Additions__hf_allResidentAccessories__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "hf_linkedResidentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __50__HMHome_Additions__hf_personalRequestAccessories__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CBA358], "isAccessorySupported:", a2);
}

uint64_t __52__HMHome_Additions__hf_tvViewingProfilesAccessories__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CBA5F8], "isAccessorySupported:", a2);
}

BOOL __47__HMHome_Additions__hf_siriEndPointAccessories__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "hf_siriEndpointProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __56__HMHome_Additions__hf_allSiriEndPointProfileContainers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mediaProfile");
}

uint64_t __56__HMHome_Additions__hf_allSiriEndPointProfileContainers__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hf_isSiriEndpoint");

  return v7;
}

uint64_t __69__HMHome_Additions__hf_allSiriEndPointProfileContainersThatWillChime__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "hf_mediaAccessoryCommonSettingsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settingValueForKeyPath:", HFDoorbellChimeEnabledKeyPath);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "BOOLValue");
  return v8;
}

uint64_t __68__HMHome_Additions__hf_accessoryCategoriesReorderableItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  int v9;
  uint64_t v10;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "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");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sortedItemsWithItem1:item2:", v6, v5);

  if (v9)
    v10 = -1;
  else
    v10 = 1;

  return v10;
}

uint64_t __65__HMHome_Additions__hf_dashboardSectionReorderableItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  int v9;
  uint64_t v10;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "hf_reorderableDashboardSectionList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sortedItemsWithItem1:item2:", v6, v5);

  if (v9)
    v10 = -1;
  else
    v10 = 1;

  return v10;
}

uint64_t __48__HMHome_Additions__hf_setNotesApplicationData___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hf_updateApplicationData:handleError:completionHandler:", *(_QWORD *)(a1 + 40), 1, a2);
}

void __59__HMHome_Additions__hf_setHomeHasOnboardedApplicationData___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "applicationData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 0, v3);

}

void __64__HMHome_Additions__hf_setHomeHasMigratedServicesToAccessories___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "applicationData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 0, v3);

}

void __54__HMHome_Additions__hf_setHomeHasMigratedForRedesign___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "applicationData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 0, v3);

}

void __71__HMHome_Additions__hf_hasAcceptedTermsAndConditionsForHomePodVersion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (HFPreferencesBooleanValueForKey(CFSTR("HFPreferencesRemoveAllSoftwareUpdateLicenseVersionsFromHomeKey")) == 2)
  {
    objc_msgSend(WeakRetained, "applicationData");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], CFSTR("HFApplicationHomePodTermsAndConditionsAcceptedKey"));

    objc_msgSend(WeakRetained, "applicationData");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "hf_updateApplicationData:handleError:completionHandler:", v2, 1, &__block_literal_global_211);

    HFPreferencesRemoveValueForKey(CFSTR("HFPreferencesRemoveAllSoftwareUpdateLicenseVersionsFromHomeKey"));
  }

}

void __71__HMHome_Additions__hf_hasAcceptedTermsAndConditionsForHomePodVersion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "[START UPDATE] Unable to remove software update license versions & update application data: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "[START UPDATE] Successfully removed all software update license agreement versions", (uint8_t *)&v5, 2u);
  }

}

void __94__HMHome_Additions__hf_markTermsAndConditionsAsAcceptedForHomePodWithLicenseAgreementVersion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "applicationData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 1, v3);

}

unint64_t __51__HMHome_Additions__hf_supportsPerUserRemoteAccess__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "capabilities") >> 1) & 1;
}

unint64_t __56__HMHome_Additions__hf_supportsRemoteAccessRestrictions__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "capabilities") >> 2) & 1;
}

unint64_t __60__HMHome_Additions__hf_enabledResidentsSupportsMediaActions__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "capabilities") >> 9) & 1;
}

unint64_t __60__HMHome_Additions__hf_enabledResidentsSupportsNaturalLight__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "capabilities") >> 14) & 1;
}

unint64_t __76__HMHome_Additions__hf_hasEnabledResidentSupportingThirdPartySoftwareUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  unint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isEnabled"))
    v3 = ((unint64_t)objc_msgSend(v2, "capabilities") >> 23) & 1;
  else
    v3 = 0;

  return v3;
}

uint64_t __40__HMHome_Additions__hf_allNonAdminUsers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "homeAccessControlForUser:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isAdministrator") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "homeAccessControlForUser:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isOwner") ^ 1;

  }
  return v5;
}

uint64_t __40__HMHome_Additions__hf_allNonOwnerUsers__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "homeAccessControlForUser:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOwner") ^ 1;

  return v3;
}

uint64_t __52__HMHome_Additions__hf_hasAtLeastOneRestrictedGuest__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "homeAccessControlForUser:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRestrictedGuest");

  return v3;
}

unint64_t __53__HMHome_Additions__hf_supportsSharedEventAutomation__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "capabilities") >> 3) & 1;
}

uint64_t __43__HMHome_Additions__hf_hasMediaAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isMediaAccessory");
}

uint64_t __40__HMHome_Additions__hf_numberOfHomePods__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "hf_isHomePod");
  if ((_DWORD)result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL __67__HMHome_Additions__hf_allHomePodsSupportRemoteProfileInstallation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v2 = a2;
  objc_msgSend(v2, "softwareVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "majorVersion") > 0x11)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v2, "softwareVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "majorVersion") == 17)
    {
      objc_msgSend(v2, "softwareVersion");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (unint64_t)objc_msgSend(v5, "minorVersion") > 1;

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

unint64_t __50__HMHome_Additions__hf_hasCameraRecordingResident__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "capabilities") >> 6) & 1;
}

unint64_t __57__HMHome_Additions__hf_supportsReachabilityNotifications__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "capabilities") >> 17) & 1;
}

void __53__HMHome_Additions__hf_startReprovisioningAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x24uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Reprovision status - accessory: %@ error:%@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __57__HMHome_Additions__hf_atleastOneHomePodSupportsAnnounce__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsAnnounce");
}

uint64_t __53__HMHome_Additions__hf_hasAtleastOneReachableHomePod__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isControllable");
}

uint64_t __56__HMHome_Additions__hf_hasAtLeastOneHomePodWithSettings__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isControllable");

  return v3;
}

BOOL __61__HMHome_Additions__hf_canEnableAudioAnalysisAfterHH2Upgrade__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v2 = a2;
  objc_msgSend(v2, "softwareVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "majorVersion") > 0x10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v2, "softwareVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "majorVersion") == 16)
    {
      objc_msgSend(v2, "softwareVersion");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (unint64_t)objc_msgSend(v5, "minorVersion") > 3;

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

unint64_t __52__HMHome_Additions__hf_shouldShowActivityLogSetting__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "capabilities") >> 27) & 1;
}

uint64_t __56__HMHome_Additions__hf_hasAtleastOneOasisEnabledHomePod__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  __int128 v6;
  uint64_t v7;

  objc_msgSend(a2, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D283A8];
  v7 = *(_QWORD *)(MEMORY[0x1E0D283A8] + 16);
  objc_msgSend(MEMORY[0x1E0D286A0], "versionFromOperatingSystemVersion:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isAtLeastVersion:", v3);

  return v4;
}

uint64_t __66__HMHome_Additions__hf_atleastOneMediaAccessorySupportingJustSiri__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsJustSiri");
}

uint64_t __78__HMHome_Additions__hf_atLeastOneMediaAccessoryWithSupportingJustSiriLanguage__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsJustSiri");
}

uint64_t __78__HMHome_Additions__hf_atLeastOneMediaAccessoryWithSupportingJustSiriLanguage__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "mediaProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFMediaHelper siriLanguageOptionFor:](HFMediaHelper, "siriLanguageOptionFor:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "recognitionLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC8650], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCompactVoiceTriggerAvailableForLanguageCode:", v4);

  HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v4;
    v11 = 1024;
    v12 = v6;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "siriLanguageCode: %@, isSupportedJSLanguage: %{BOOL}d", (uint8_t *)&v9, 0x12u);
  }

  return v6;
}

void __58__HMHome_Additions__hf_setCameraRecordingHasBeenOnboarded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    HFLogForCategory(9uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_error_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_ERROR, "Failed to set user has acknowledged camera recording onboarding. Error: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

uint64_t __45__HMHome_Additions__hf_hasAnyVisibleTriggers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_shouldDisplayTrigger");
}

uint64_t __46__HMHome_Additions__hf_hasAutomatableProfiles__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_offersAutomation");
}

void __48__HMHome_Additions__hf_updateColorPalette_type___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "applicationData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 1, v3);

}

uint64_t __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateMediaPeerToPeerEnabled:completionHandler:", *(unsigned __int8 *)(a1 + 40), a2);
}

uint64_t __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke_256(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateMinimumMediaUserPrivilege:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "accessPassword");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "accessPassword");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "compare:", v3);

  return v4;
}

void __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke_258(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "accessRequiresPassword"))
  {
    objc_msgSend(*(id *)(a1 + 32), "accessPassword");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    v5 = &stru_1EA741FF8;
    if (v3)
      v5 = (__CFString *)v3;
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "updateMediaPassword:completionHandler:", v6, v7);

}

id __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke_2_261(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "hf_updateAccessControlDescriptor:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke_3;
  v8[3] = &unk_1EA72F4A8;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __54__HMHome_Additions__hf_updateAccessControlDescriptor___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", *(_QWORD *)(a1 + 32));
}

uint64_t __57__HMHome_Additions__hf_restrictedGuestAllowedAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isRestrictedGuestAllowedAccessory");
}

void __65__HMHome_Additions__hf_fetchWalletKeyDeviceStateForCurrentDevice__block_invoke_268(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "walletKeyDeviceStateUpdated:inHome:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

id __36__HMHome_Additions__hf_hasWalletKey__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0D519C0];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "walletKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", v4 != 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __36__HMHome_Additions__hf_hasWalletKey__block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
}

id __47__HMHome_Additions__hf_walletKeyInWalletAppURL__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  id v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory(0x42uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "walletKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "customURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138413058;
    v14 = WeakRetained;
    v15 = 2080;
    v16 = "-[HMHome(Additions) hf_walletKeyInWalletAppURL]_block_invoke";
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v3;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "(%@:%s) returning url %@ for newly fetched %@.", (uint8_t *)&v13, 0x2Au);

  }
  v8 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(v3, "walletKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "customURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "futureWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __47__HMHome_Additions__hf_walletKeyInWalletAppURL__block_invoke_278(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  id v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory(0x42uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    +[HFWalletUtilities walletAppURL](HFWalletUtilities, "walletAppURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138413058;
    v12 = WeakRetained;
    v13 = 2080;
    v14 = "-[HMHome(Additions) hf_walletKeyInWalletAppURL]_block_invoke";
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "(%@:%s) returning default wallet app url %@ because of error: %@", (uint8_t *)&v11, 0x2Au);

  }
  v7 = (void *)MEMORY[0x1E0D519C0];
  +[HFWalletUtilities walletAppURL](HFWalletUtilities, "walletAppURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __66__HMHome_Additions__hf_enableExpressModeForWalletKeyWithAuthData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__HMHome_Additions__hf_enableExpressModeForWalletKeyWithAuthData___block_invoke_2;
  v7[3] = &unk_1EA72F608;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v6 = v3;
  v8 = v6;
  objc_msgSend(WeakRetained, "enableExpressForWalletKeyWithAuthData:completion:", v5, v7);

  objc_destroyWeak(&v9);
}

void __66__HMHome_Additions__hf_enableExpressModeForWalletKeyWithAuthData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  void *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3)
  {
    v20 = CFSTR("HFErrorHandlerOptionFailedItemName");
    objc_msgSend(WeakRetained, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = CFSTR("HFErrorUserInfoOptionsKey");
    v18[1] = CFSTR("HFErrorUserInfoOperationKey");
    v19[0] = v7;
    v19[1] = CFSTR("HFOperationAddWalletKey");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hf_errorWithAddedUserInfo:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0x42uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412802;
      v13 = v5;
      v14 = 2080;
      v15 = "-[HMHome(Additions) hf_enableExpressModeForWalletKeyWithAuthData:]_block_invoke_2";
      v16 = 2112;
      v17 = v9;
      _os_log_error_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_ERROR, "(%@:%s) When trying to enable Express Mode for Wallet Key, error occurred %@", (uint8_t *)&v12, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v9);
  }
  else
  {
    HFLogForCategory(0x42uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = v5;
      v14 = 2080;
      v15 = "-[HMHome(Additions) hf_enableExpressModeForWalletKeyWithAuthData:]_block_invoke";
      _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "(%@:%s) completed enabling express mode for wallet key with auth data", (uint8_t *)&v12, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }

}

void __75__HMHome_Additions__hf_enableUWBForWalletKeyWithAuthData_enableNFCExpress___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(unsigned __int8 *)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__HMHome_Additions__hf_enableUWBForWalletKeyWithAuthData_enableNFCExpress___block_invoke_2;
  v8[3] = &unk_1EA72F608;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v7 = v3;
  v9 = v7;
  objc_msgSend(WeakRetained, "setExpressSettingsAuthData:enableUWB:enableNFCExpress:completion:", v5, v6, v6, v8);

  objc_destroyWeak(&v10);
}

void __75__HMHome_Additions__hf_enableUWBForWalletKeyWithAuthData_enableNFCExpress___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  void *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3)
  {
    v20 = CFSTR("HFErrorHandlerOptionFailedItemName");
    objc_msgSend(WeakRetained, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = CFSTR("HFErrorUserInfoOptionsKey");
    v18[1] = CFSTR("HFErrorUserInfoOperationKey");
    v19[0] = v7;
    v19[1] = CFSTR("HFOperationAddWalletKey");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hf_errorWithAddedUserInfo:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0x42uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412802;
      v13 = v5;
      v14 = 2080;
      v15 = "-[HMHome(Additions) hf_enableUWBForWalletKeyWithAuthData:enableNFCExpress:]_block_invoke_2";
      v16 = 2112;
      v17 = v9;
      _os_log_error_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_ERROR, "(%@:%s) When trying to enable UWB for wallet key, error occurred %@", (uint8_t *)&v12, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v9);
  }
  else
  {
    HFLogForCategory(0x42uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = v5;
      v14 = 2080;
      v15 = "-[HMHome(Additions) hf_enableUWBForWalletKeyWithAuthData:enableNFCExpress:]_block_invoke";
      _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "(%@:%s) completed enabling UWB for wallet key with auth data", (uint8_t *)&v12, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }

}

uint64_t __54__HMHome_Additions__hf_accessoriesSupportingUWBUnlock__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsUWBUnlock");
}

void __48__HMHome_Additions__hf_addWalletKeyWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9[2];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__HMHome_Additions__hf_addWalletKeyWithOptions___block_invoke_2;
  v7[3] = &unk_1EA72F6A0;
  objc_copyWeak(v9, (id *)(a1 + 32));
  v9[1] = *(id *)(a1 + 40);
  v6 = v3;
  v8 = v6;
  objc_msgSend(WeakRetained, "addWalletKeyWithOptions:completionHandler:", v5, v7);

  objc_destroyWeak(v9);
}

void __48__HMHome_Additions__hf_addWalletKeyWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  __CFString *v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  NSObject *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[2];
  _QWORD v24[2];
  const __CFString *v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  __CFString *v38;
  __int16 v39;
  __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = *(_QWORD *)(a1 + 48);
  if (_os_feature_enabled_impl())
  {
    v9 = *(_QWORD *)(a1 + 48);
    HFLogForCategory(0x42uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("with");
      *(_DWORD *)buf = 138413826;
      v28 = WeakRetained;
      v29 = 2080;
      v30 = "-[HMHome(Additions) hf_addWalletKeyWithOptions:]_block_invoke_2";
      if ((v8 & 1) != 0)
        v12 = CFSTR("with");
      else
        v12 = CFSTR("without");
      v32 = v12;
      if ((v8 & 2) != 0)
        v13 = CFSTR("with");
      else
        v13 = CFSTR("without");
      v31 = 2112;
      if ((v9 & 4) == 0)
        v11 = CFSTR("without");
      v33 = 2112;
      v34 = v13;
      v35 = 2112;
      v36 = v11;
      v37 = 2112;
      v38 = v5;
      v39 = 2112;
      v40 = v6;
      _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "(%@:%s) When adding wallet key %@ notification, %@ enabling express mode, and %@ UWB unlock, uuid is %@. error is %@", buf, 0x48u);
    }

  }
  HFLogForCategory(0x42uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = CFSTR("with");
    *(_DWORD *)buf = 138413570;
    v28 = WeakRetained;
    v29 = 2080;
    v30 = "-[HMHome(Additions) hf_addWalletKeyWithOptions:]_block_invoke";
    if ((v8 & 1) != 0)
      v16 = CFSTR("with");
    else
      v16 = CFSTR("without");
    v31 = 2112;
    if ((v8 & 2) == 0)
      v15 = CFSTR("without");
    v32 = v16;
    v33 = 2112;
    v34 = v15;
    v35 = 2112;
    v36 = v5;
    v37 = 2112;
    v38 = v6;
    _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "(%@:%s) When adding wallet key %@ notification and %@ enabling express mode, uuid is %@. error is %@", buf, 0x3Eu);
  }

  if (v6)
  {
    v25 = CFSTR("HFErrorHandlerOptionFailedItemName");
    objc_msgSend(WeakRetained, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = CFSTR("HFErrorUserInfoOptionsKey");
    v23[1] = CFSTR("HFErrorUserInfoOperationKey");
    v24[0] = v18;
    v24[1] = CFSTR("HFOperationAddWalletKey");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString hf_errorWithAddedUserInfo:](v6, "hf_errorWithAddedUserInfo:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v20);

  }
  else
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __48__HMHome_Additions__hf_addWalletKeyWithOptions___block_invoke_289;
    v22[3] = &unk_1EA726918;
    v22[4] = WeakRetained;
    objc_msgSend(v21, "dispatchHomeObserverMessage:sender:", v22, 0);

    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v5);
  }

}

void __48__HMHome_Additions__hf_addWalletKeyWithOptions___block_invoke_289(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "homeDidAddWalletKey:", *(_QWORD *)(a1 + 32));

}

void __63__HMHome_Additions__hf_addWalletKeyToPairedWatchesWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9[2];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__HMHome_Additions__hf_addWalletKeyToPairedWatchesWithOptions___block_invoke_2;
  v7[3] = &unk_1EA72F6C8;
  objc_copyWeak(v9, (id *)(a1 + 32));
  v9[1] = *(id *)(a1 + 40);
  v6 = v3;
  v8 = v6;
  objc_msgSend(WeakRetained, "addWalletKeyToPairedWatchesWithOptions:completion:", v5, v7);

  objc_destroyWeak(v9);
}

void __63__HMHome_Additions__hf_addWalletKeyToPairedWatchesWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  __CFString *v3;
  __CFString *WeakRetained;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  const __CFString *v23;
  void *v24;
  uint8_t buf[4];
  __CFString *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (__CFString *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 48);
  if (_os_feature_enabled_impl())
  {
    v6 = *(_QWORD *)(a1 + 48);
    HFLogForCategory(0x42uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("with");
      *(_DWORD *)buf = 138413826;
      v26 = WeakRetained;
      v27 = 2080;
      v28 = "-[HMHome(Additions) hf_addWalletKeyToPairedWatchesWithOptions:]_block_invoke_2";
      if ((v5 & 1) != 0)
        v9 = CFSTR("with");
      else
        v9 = CFSTR("without");
      if ((v5 & 2) != 0)
        v10 = CFSTR("with");
      else
        v10 = CFSTR("without");
      v29 = 2112;
      v30 = WeakRetained;
      if ((v6 & 4) == 0)
        v8 = CFSTR("without");
      v31 = 2112;
      v32 = v9;
      v33 = 2112;
      v34 = v10;
      v35 = 2112;
      v36 = v8;
      v37 = 2112;
      v38 = v3;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) When adding wallet key to paired Apple watches for home %@ %@ notification, %@ enabling express mode, and %@ UWB unlock, error is %@", buf, 0x48u);
    }

  }
  HFLogForCategory(0x42uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v3)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v19 = CFSTR("with");
      *(_DWORD *)buf = 138413058;
      v26 = WeakRetained;
      if ((v5 & 1) != 0)
        v20 = CFSTR("with");
      else
        v20 = CFSTR("without");
      v27 = 2112;
      v28 = (const char *)v20;
      if ((v5 & 2) == 0)
        v19 = CFSTR("without");
      v29 = 2112;
      v30 = v19;
      v31 = 2112;
      v32 = v3;
      _os_log_error_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_ERROR, "When adding wallet key to paried Apple Watches for home %@ %@ notification and %@ enabling express mode, error occurred: %@", buf, 0x2Au);
    }

    v23 = CFSTR("HFErrorHandlerOptionFailedItemName");
    -[__CFString name](WeakRetained, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = CFSTR("HFErrorUserInfoOptionsKey");
    v21[1] = CFSTR("HFErrorUserInfoOperationKey");
    v22[0] = v14;
    v22[1] = CFSTR("HFOperationAddWalletKey");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString hf_errorWithAddedUserInfo:](v3, "hf_errorWithAddedUserInfo:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v16);

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17 = CFSTR("with");
      if ((v5 & 1) != 0)
        v18 = CFSTR("with");
      else
        v18 = CFSTR("without");
      *(_DWORD *)buf = 138412802;
      v26 = WeakRetained;
      v27 = 2112;
      v28 = (const char *)v18;
      if ((v5 & 2) == 0)
        v17 = CFSTR("without");
      v29 = 2112;
      v30 = v17;
      _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "Successfully added wallet key to paired Apple Watches for home %@ %@ notification and %@ enabling express mode", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }

}

void __51__HMHome_Additions__hf_setHasOnboardedForWalletKey__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__HMHome_Additions__hf_setHasOnboardedForWalletKey__block_invoke_2;
  v7[3] = &unk_1EA72F608;
  objc_copyWeak(&v9, v4);
  v6 = v3;
  v8 = v6;
  objc_msgSend(WeakRetained, "setHasOnboardedForWalletKeyWithCompletion:", v7);

  objc_destroyWeak(&v9);
}

void __51__HMHome_Additions__hf_setHasOnboardedForWalletKey__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  HFLogForCategory(0x42uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412546;
      v8 = WeakRetained;
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "When turning on has onboarded for wallet key flag for home %@, error occurred: %@", (uint8_t *)&v7, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = WeakRetained;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Successfully turned on has onboarded for wallet key flag for home %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }

}

unint64_t __53__HMHome_Additions__hf_hasHomeHubSupportingWalletKey__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "capabilities") >> 18) & 1;
}

id __77__HMHome_Additions__hf_formattedErrorForWalletKeyDeviceStateForCurrentDevice__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(v3, "canAddWalletKey"))
  {
    objc_msgSend(v3, "walletKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v23 = CFSTR("HFErrorHandlerOptionFailedItemName");
      objc_msgSend(*(id *)(a1 + 32), "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "mutableCopy");

      v10 = objc_msgSend(v3, "canAddWalletKeyErrorCode");
      v11 = v10;
      if (v10 == 8)
      {
        _HFLocalizedStringWithDefaultValue(CFSTR("HFErrorButtonTitleShowInAppStore"), CFSTR("HFErrorButtonTitleShowInAppStore"), 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("HFErrorButtonTitleCancel");
      }
      else
      {
        if (v10 == 5)
        {
          v12 = CFSTR("HFErrorButtonTitleOpenWallet");
        }
        else
        {
          if (v10 != 2)
          {
            v13 = 0;
            v15 = 0;
            goto LABEL_14;
          }
          v12 = CFSTR("HFErrorButtonTitleiCloudSettings");
        }
        _HFLocalizedStringWithDefaultValue(v12, v12, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("HFErrorButtonTitleNotNow");
      }
      _HFLocalizedStringWithDefaultValue(v14, v14, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
      objc_msgSend(v9, "na_safeSetObject:forKey:", v13, CFSTR("HFErrorHandlerOptionRetryButtonText"));
      objc_msgSend(v9, "na_safeSetObject:forKey:", v15, CFSTR("HFErrorHandlerOptionCancelButtonTextKey"));
      v21[0] = CFSTR("HFErrorUserInfoOptionsKey");
      v16 = (void *)objc_msgSend(v9, "copy");
      v21[1] = CFSTR("HFErrorUserInfoOperationKey");
      v22[0] = v16;
      v22[1] = CFSTR("HFOperationAddWalletKey");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "mutableCopy");

      v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v20 = (void *)objc_msgSend(v19, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB9328], v11, v18);
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v20);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_4;
    }
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:

  return v5;
}

uint64_t __77__HMHome_Additions__hf_formattedErrorForWalletKeyDeviceStateForCurrentDevice__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", a2);
}

void __65__HMHome_Additions__hf_fetchWalletKeyDeviceStateForPairedWatches__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__HMHome_Additions__hf_fetchWalletKeyDeviceStateForPairedWatches__block_invoke_2;
  v7[3] = &unk_1EA72F758;
  objc_copyWeak(&v9, v4);
  v6 = v3;
  v8 = v6;
  objc_msgSend(WeakRetained, "fetchWalletKeyDeviceStateForPairedWatchesWithCompletion:", v7);

  objc_destroyWeak(&v9);
}

void __65__HMHome_Additions__hf_fetchWalletKeyDeviceStateForPairedWatches__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  id WeakRetained;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  HFLogForCategory(0x42uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = &stru_1EA741FF8;
    v11 = 138413058;
    if (v6)
      v9 = v6;
    v12 = WeakRetained;
    v13 = 2080;
    v14 = "-[HMHome(Additions) hf_fetchWalletKeyDeviceStateForPairedWatches]_block_invoke_2";
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "(%@:%s) Completed wallet key device state for all paired watch devices %@. %@", (uint8_t *)&v11, 0x2Au);
  }

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v5);
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    if (v6)
      objc_msgSend(v10, "finishWithError:", v6);
    else
      objc_msgSend(v10, "finishWithNoResult");
  }

}

void __59__HMHome_Additions___hf_fetchWalletKeyColorFromAccessories__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__HMHome_Additions___hf_fetchWalletKeyColorFromAccessories__block_invoke_2;
  v6[3] = &unk_1EA72F780;
  v6[4] = WeakRetained;
  v7 = v3;
  v5 = v3;
  objc_msgSend(WeakRetained, "fetchWalletKeyColorWithCompletion:", v6);

}

void __59__HMHome_Additions___hf_fetchWalletKeyColorFromAccessories__block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x42uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    HMHomeWalletKeyColorAsString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v5;
    v11 = 2080;
    v12 = "-[HMHome(Additions) _hf_fetchWalletKeyColorFromAccessories]_block_invoke_2";
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "(%@:%s) Fetched wallet key color %@", (uint8_t *)&v9, 0x20u);

  }
  v7 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finishWithResult:", v8);

}

id __63__HMHome_Additions___hf_existingWalletKeyColorForCurrentDevice__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "walletKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D519C0];
  if (v3)
  {
    +[HFWalletUtilities walletKeyColorOfDeviceState:](HFWalletUtilities, "walletKeyColorOfDeviceState:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithResult:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

uint64_t __63__HMHome_Additions___hf_existingWalletKeyColorForCurrentDevice__block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

id __47__HMHome_Additions__hf_walletKeyColorToDisplay__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v6);
  else
    objc_msgSend(*(id *)(a1 + 32), "_hf_fetchWalletKeyColorFromAccessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __52__HMHome_Additions__hf_setHasOnboardedForAccessCode__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HMHome_Additions__hf_setHasOnboardedForAccessCode__block_invoke_2;
  v7[3] = &unk_1EA72F608;
  objc_copyWeak(&v9, v4);
  v6 = v3;
  v8 = v6;
  objc_msgSend(WeakRetained, "setHasOnboardedForAccessCodeWithCompletion:", v7);

  objc_destroyWeak(&v9);
}

void __52__HMHome_Additions__hf_setHasOnboardedForAccessCode__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  HFLogForCategory(0x32uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412546;
      v8 = WeakRetained;
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "When turning on has onboarded for access code flag for home %@, error occurred: %@", (uint8_t *)&v7, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = WeakRetained;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Successfully turned on has onboarded for access code flag for home %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }

}

unint64_t __55__HMHome_Additions__hf_hasHomeHubSupportingAccessCodes__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "capabilities") >> 21) & 1;
}

id __52__HMHome_Additions__hf_hasWalletKeyCompatibleDevice__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(v3, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(WeakRetained, "hf_walletKeyDeviceStatesOfCompatiblePairedWatches");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__HMHome_Additions__hf_hasWalletKeyCompatibleDevice__block_invoke_2;
    v9[3] = &unk_1EA72A438;
    objc_copyWeak(&v10, v4);
    objc_msgSend(v7, "flatMap:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v10);

  }
  return v6;
}

id __52__HMHome_Additions__hf_hasWalletKeyCompatibleDevice__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  id v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = objc_msgSend(v3, "count");

  HFLogForCategory(0x42uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412802;
    v12 = WeakRetained;
    v13 = 2080;
    v14 = "-[HMHome(Additions) hf_hasWalletKeyCompatibleDevice]_block_invoke_2";
    v15 = 1024;
    v16 = v5 != 0;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "(%@:%s) Returning %{BOOL}d because current device and paired watches are not wallet key compatible", (uint8_t *)&v11, 0x1Cu);
  }

  v7 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5 != 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __58__HMHome_Additions__hf_isCurrentDeviceWalletKeyCompatible__block_invoke(uint64_t a1, uint64_t a2)
{
  _BOOL8 v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = +[HFWalletUtilities isWalletKeyDeviceStateCompatible:](HFWalletUtilities, "isWalletKeyDeviceStateCompatible:", a2);
  v3 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __58__HMHome_Additions__hf_isCurrentDeviceWalletKeyCompatible__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  int v8;
  id v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory(0x42uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412802;
    v9 = WeakRetained;
    v10 = 2080;
    v11 = "-[HMHome(Additions) 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]_block_invoke_2";
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "(%@:%s) Returning NO for wallet key compatibility for current device because of %@", (uint8_t *)&v8, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __70__HMHome_Additions__hf_walletKeyDeviceStatesOfCompatiblePairedWatches__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v6, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10), (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[HFWalletUtilities isWalletKeyDeviceStateCompatible:](HFWalletUtilities, "isWalletKeyDeviceStateCompatible:", v11))
        {
          objc_msgSend(v5, "na_safeAddObject:", v11);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
    }
    while (v8);
  }

  HFLogForCategory(0x42uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v22 = WeakRetained;
    v23 = 2080;
    v24 = "-[HMHome(Additions) hf_walletKeyDeviceStatesOfCompatiblePairedWatches]_block_invoke";
    v25 = 2112;
    v26 = v6;
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "(%@:%s) Among %@, wallet key device states of compatible paired watches are %@", buf, 0x2Au);
  }

  v13 = (void *)MEMORY[0x1E0D519C0];
  v14 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v13, "futureWithResult:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __70__HMHome_Additions__hf_walletKeyDeviceStatesOfCompatiblePairedWatches__block_invoke_315(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  int v8;
  id v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory(0x42uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412802;
    v9 = WeakRetained;
    v10 = 2080;
    v11 = "-[HMHome(Additions) hf_walletKeyDeviceStatesOfCompatiblePairedWatches]_block_invoke";
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "(%@:%s) Returning empty array for wallet key device states of compatible paired watches because of %@", (uint8_t *)&v8, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AA60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __60__HMHome_Additions__hf_fetchAvailableWalletKeyEncodedPKPass__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__HMHome_Additions__hf_fetchAvailableWalletKeyEncodedPKPass__block_invoke_2;
  v7[3] = &unk_1EA72F898;
  objc_copyWeak(&v9, v4);
  v6 = v3;
  v8 = v6;
  objc_msgSend(WeakRetained, "fetchAvailableWalletKeyEncodedPKPass:", v7);

  objc_destroyWeak(&v9);
}

void __60__HMHome_Additions__hf_fetchAvailableWalletKeyEncodedPKPass__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  HFLogForCategory(0x32uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315650;
      v11 = "-[HMHome(Additions) hf_fetchAvailableWalletKeyEncodedPKPass]_block_invoke_2";
      v12 = 2112;
      v13 = WeakRetained;
      v14 = 2112;
      v15 = v6;
      _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "(%s) When fetching available wallet key encoded pass for home %@, error occurred: %@", (uint8_t *)&v10, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "-[HMHome(Additions) hf_fetchAvailableWalletKeyEncodedPKPass]_block_invoke";
      v12 = 2112;
      v13 = WeakRetained;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "(%s) Successfully fetched available wallet key's encoded pass for home %@", (uint8_t *)&v10, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v5);
  }

}

void __59__HMHome_Additions__hf_fetchExistingWalletKeyEncodedPKPass__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__HMHome_Additions__hf_fetchExistingWalletKeyEncodedPKPass__block_invoke_2;
  v7[3] = &unk_1EA72F898;
  objc_copyWeak(&v9, v4);
  v6 = v3;
  v8 = v6;
  objc_msgSend(WeakRetained, "fetchWalletKeyEncodedPKPass:", v7);

  objc_destroyWeak(&v9);
}

void __59__HMHome_Additions__hf_fetchExistingWalletKeyEncodedPKPass__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  HFLogForCategory(0x32uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315650;
      v11 = "-[HMHome(Additions) hf_fetchExistingWalletKeyEncodedPKPass]_block_invoke_2";
      v12 = 2112;
      v13 = WeakRetained;
      v14 = 2112;
      v15 = v6;
      _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "(%s) When fetching existing wallet key encoded pass for home %@, error occurred: %@", (uint8_t *)&v10, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "-[HMHome(Additions) hf_fetchExistingWalletKeyEncodedPKPass]_block_invoke";
      v12 = 2112;
      v13 = WeakRetained;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "(%s) Successfully fetched existing encoded pass for home %@", (uint8_t *)&v10, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v5);
  }

}

uint64_t __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsCHIP");
}

id __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  objc_msgSend(v2, "hf_allConnectedHomeToCHIPAccessoryPairingFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke_3;
  v7[3] = &unk_1EA728350;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D519C0];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addEntriesFromDictionary:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8++), (_QWORD)v13);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v9 = (void *)MEMORY[0x1E0D519C0];
  v10 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v9, "futureWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke_6;
  v9[3] = &unk_1EA72F968;
  v10 = v3;
  v4 = v3;
  objc_msgSend(v2, "na_each:", v9);

  v5 = (void *)MEMORY[0x1E0D519C0];
  v6 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v5, "futureWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke_7;
  v7[3] = &unk_1EA72F940;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a3, "na_each:", v7);

}

void __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v13 = v3;
  objc_msgSend(v3, "ecosystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v13, "ecosystem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v13, "ecosystem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", *(_QWORD *)(a1 + 40));

}

id __55__HMHome_Additions__hf_ecosystemAccessoryUUIDMapFuture__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HFLogForCategory(0x2DuLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "%@ failed due to %@", (uint8_t *)&v8, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AA70]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __58__HMHome_Additions__hf_setShowPredictedScenesOnDashboard___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "applicationData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_updateApplicationData:handleError:completionHandler:", v4, 1, v3);

}

void __58__HMHome_Additions__hf_setShowPredictedScenesOnDashboard___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__HMHome_Additions__hf_setShowPredictedScenesOnDashboard___block_invoke_3;
  v3[3] = &unk_1EA726918;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "dispatchHomeObserverMessage:sender:", v3, 0);

}

void __58__HMHome_Additions__hf_setShowPredictedScenesOnDashboard___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "homeDidUpdateApplicationData:", *(_QWORD *)(a1 + 32));

}

uint64_t __36__HMHome_Additions__hf_hasFavorites__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_effectiveIsFavorite");
}

uint64_t __62__HMHome_Additions__hf_atleastOneMediaAccessoryHasSiriEnabled__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "hf_settingsValueManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForSettingAtKeyPath:", CFSTR("root.siri.allowHeySiri"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

uint64_t __62__HMHome_Additions__hf_atleastOneMediaAccessoryHasSiriEnabled__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_mediaAccessoryCommonSettingsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "settingValueForKeyPath:", HFAllowHeySiriSettingKeyPath);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

uint64_t __51__HMHome_Additions__hf_minimumDescriptionsOfHomes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_minimumDescription");
}

void __64__HMHome_HFUserNotificationTopics___hf_groupedServiceTypeTopics__block_invoke_2()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  HFUserNotificationServiceTopic *v3;
  void *v4;
  uint64_t v5;
  id v6;
  HFImageIconDescriptor *v7;
  HFUserNotificationServiceTopic *v8;
  void *v9;
  HFUserNotificationServiceTopic *v10;
  id v11;
  HFImageIconDescriptor *v12;
  HFUserNotificationServiceTopic *v13;
  void *v14;
  HFUserNotificationServiceTopic *v15;
  id v16;
  void *v17;
  HFUserNotificationServiceTopic *v18;
  void *v19;
  HFUserNotificationServiceTopic *v20;
  uint64_t v21;
  void *v22;
  HFImageIconDescriptor *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 26.0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (qword_1ED379518 != -1)
    dispatch_once(&qword_1ED379518, &__block_literal_global_160_0);
  v1 = (id)qword_1ED379520;
  +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", *MEMORY[0x1E0CB9B28]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = [HFUserNotificationServiceTopic alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFUserNotificationServiceTopic initWithServiceTypes:accessoryCategoryTypes:topicNameLocalizationKey:iconForAccessoryType:](v3, "initWithServiceTypes:accessoryCategoryTypes:topicNameLocalizationKey:iconForAccessoryType:", v1, v4, CFSTR("HFUserNotificationServiceTopicName_AllBlindsAndWindowsGroup"), v2);

  v25 = (void *)v2;
  v26 = v1;
  v24 = (void *)v5;
  if (qword_1ED379528 != -1)
    dispatch_once(&qword_1ED379528, &__block_literal_global_164_1);
  v6 = (id)qword_1ED379530;
  v7 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", CFSTR("door.right.hand.open"), v0);
  v8 = [HFUserNotificationServiceTopic alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HFUserNotificationServiceTopic initWithServiceTypes:accessoryCategoryTypes:topicNameLocalizationKey:iconDescriptor:](v8, "initWithServiceTypes:accessoryCategoryTypes:topicNameLocalizationKey:iconDescriptor:", v6, v9, CFSTR("HFUserNotificationServiceTopicName_AllDoorsGroup"), v7);

  v23 = v7;
  if (qword_1ED379538 != -1)
    dispatch_once(&qword_1ED379538, &__block_literal_global_170);
  v11 = (id)qword_1ED379540;
  v27 = (void *)v0;
  v12 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", CFSTR("lock.fill"), v0);
  v13 = [HFUserNotificationServiceTopic alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HFUserNotificationServiceTopic initWithServiceTypes:accessoryCategoryTypes:topicNameLocalizationKey:iconDescriptor:](v13, "initWithServiceTypes:accessoryCategoryTypes:topicNameLocalizationKey:iconDescriptor:", v11, v14, CFSTR("HFUserNotificationServiceTopicName_AllLocksGroup"), v12);

  if (qword_1ED379548 != -1)
    dispatch_once(&qword_1ED379548, &__block_literal_global_176_2);
  v16 = (id)qword_1ED379550;
  +[HFServiceIconFactory iconDescriptorForAccessoryCategoryOrServiceType:](HFServiceIconFactory, "iconDescriptorForAccessoryCategoryOrServiceType:", *MEMORY[0x1E0CB7A98]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = [HFUserNotificationServiceTopic alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HFUserNotificationServiceTopic initWithServiceTypes:accessoryCategoryTypes:topicNameLocalizationKey:iconDescriptor:](v18, "initWithServiceTypes:accessoryCategoryTypes:topicNameLocalizationKey:iconDescriptor:", v16, v19, CFSTR("HFUserNotificationServiceTopicName_AllSensorsGroup"), v17);

  v28[0] = v24;
  v28[1] = v10;
  v28[2] = v20;
  v28[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
  v21 = objc_claimAutoreleasedReturnValue();

  v22 = (void *)qword_1ED379510;
  qword_1ED379510 = v21;

}

void __64__HMHome_HFUserNotificationTopics___hf_groupedServiceTypeTopics__block_invoke_5()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB9B30];
  v5[0] = *MEMORY[0x1E0CB9B28];
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED379520;
  qword_1ED379520 = v3;

}

void __64__HMHome_HFUserNotificationTopics___hf_groupedServiceTypeTopics__block_invoke_7()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB9A28];
  v5[0] = *MEMORY[0x1E0CB9A00];
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED379530;
  qword_1ED379530 = v3;

}

void __64__HMHome_HFUserNotificationTopics___hf_groupedServiceTypeTopics__block_invoke_9()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB9A80];
  v5[0] = *MEMORY[0x1E0CB9A78];
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED379540;
  qword_1ED379540 = v3;

}

void __64__HMHome_HFUserNotificationTopics___hf_groupedServiceTypeTopics__block_invoke_11()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[9];

  v8[8] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB99E0];
  v8[0] = *MEMORY[0x1E0CB99E8];
  v8[1] = v1;
  v2 = *MEMORY[0x1E0CB9A60];
  v8[2] = *MEMORY[0x1E0CB99F0];
  v8[3] = v2;
  v3 = *MEMORY[0x1E0CB9A98];
  v8[4] = *MEMORY[0x1E0CB9A90];
  v8[5] = v3;
  v4 = *MEMORY[0x1E0CB9AA8];
  v8[6] = *MEMORY[0x1E0CB9AB8];
  v8[7] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_1ED379550;
  qword_1ED379550 = v6;

}

void __96__HMHome_HFUserNotificationTopics___hf_standaloneTopicNameLocalizationKeyForPrimaryServiceType___block_invoke_2()
{
  void *v0;

  v0 = (void *)qword_1ED379560;
  qword_1ED379560 = MEMORY[0x1E0C9AA70];

}

uint64_t __56__HMHome_HFUserNotificationTopics___hf_accessoryTopics___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "hf_isCamera"))
    v3 = objc_msgSend(v2, "hf_isNotificationSupportedCamera");
  else
    v3 = 0;

  return v3;
}

id __68__HMHome_HFUserNotificationTopics__hf_userNotificationServiceTopics__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "hf_visibleServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_filter:", &__block_literal_global_192_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __68__HMHome_HFUserNotificationTopics__hf_userNotificationServiceTopics__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  void *v4;

  v2 = a2;
  if ((objc_msgSend(v2, "hf_isCameraContainedMotionSensor") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "hf_userNotificationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4 != 0;

  }
  return v3;
}

uint64_t __68__HMHome_HFUserNotificationTopics__hf_userNotificationServiceTopics__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_effectiveServiceType");
}

HFUserNotificationServiceTopic *__68__HMHome_HFUserNotificationTopics__hf_userNotificationServiceTopics__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  HFUserNotificationServiceTopic *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __68__HMHome_HFUserNotificationTopics__hf_userNotificationServiceTopics__block_invoke_5;
  v16 = &unk_1EA738420;
  v5 = v3;
  v17 = v5;
  objc_msgSend(v4, "na_firstObjectPassingTest:", &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_hf_standaloneTopicNameLocalizationKeyForPrimaryServiceType:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CBA7E0], "localizedDescriptionForServiceType:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("Unknown (%@)"), v11, v13, v14, v15, v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v8 = -[HFUserNotificationServiceTopic initWithServiceType:topicNameLocalizationKey:]([HFUserNotificationServiceTopic alloc], "initWithServiceType:topicNameLocalizationKey:", v5, v9);

  }
  return v8;
}

uint64_t __68__HMHome_HFUserNotificationTopics__hf_userNotificationServiceTopics__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "serviceTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __71__HMHome_HFUserNotificationTopics__hf_userNotificationTopicForService___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "serviceTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hf_effectiveServiceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

uint64_t __77__HMHome_HFUserNotificationTopics__hf_userNotificationTopicForCameraProfile___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "accessoryCategoryTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __70__HMHome_HFUserNotificationTopics__hf_servicesAffectedByServiceTopic___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__HMHome_HFUserNotificationTopics__hf_servicesAffectedByServiceTopic___block_invoke_2;
  v6[3] = &unk_1EA7283A0;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_filter:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __70__HMHome_HFUserNotificationTopics__hf_servicesAffectedByServiceTopic___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "hf_userNotificationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "serviceTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hf_effectiveServiceType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "containsObject:", v6))
      v7 = objc_msgSend(v3, "hf_isCameraContainedMotionSensor") ^ 1;
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __76__HMHome_HFUserNotificationTopics__hf_cameraProfilesAffectedByServiceTopic___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "cameraProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__HMHome_HFUserNotificationTopics__hf_cameraProfilesAffectedByServiceTopic___block_invoke_2;
  v6[3] = &unk_1EA72E998;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_filter:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __76__HMHome_HFUserNotificationTopics__hf_cameraProfilesAffectedByServiceTopic___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(v3, "hf_userNotificationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "accessoryCategoryTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "category");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "categoryType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "containsObject:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __90__HMHome_HFUserNotificationTopics__hf_safetyAndSecurityAccessoriesAffectedByServiceTopic___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  if (objc_msgSend(v3, "hf_isAudioAnalysisSupportedDevice"))
  {
    objc_msgSend(*(id *)(a1 + 32), "accessoryCategoryTypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "category");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "categoryType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __55__HMHome_HFApplicationData___hf_updateApplicationData___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "homeDidUpdateApplicationData:", *(_QWORD *)(a1 + 32));

}

void __84__HMHome_HFApplicationData__hf_updateApplicationData_handleError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString **v7;
  int v8;
  __CFString *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  id v14;

  v14 = a2;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasOptedToHH2") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "residentDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    v7 = HFOperationUpdateApplicationDataResidentSync;
    if (!v6)
      v7 = HFOperationUpdateApplicationDataCloudSync;
  }
  else
  {

    v7 = HFOperationUpdateApplicationDataCloudSync;
  }
  v8 = *(unsigned __int8 *)(a1 + 56);
  v9 = *v7;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
    objc_msgSend(v10, "handleError:operationType:options:retryBlock:cancelBlock:", v14, v9, 0, 0, 0);
  else
    objc_msgSend(v10, "logError:operationDescription:", v14, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "applicationData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_hf_updateApplicationData:", v13);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
