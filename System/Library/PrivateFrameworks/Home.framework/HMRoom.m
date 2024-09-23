@implementation HMRoom

uint64_t __47__HMRoom_HFAdditions__hf_hasVisibleAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isVisibleAccessory");
}

uint64_t __55__HMRoom_AbstractionAdditions__hf_accessoryLikeObjects__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_accessoryLikeObjects");
}

uint64_t __43__HMRoom_HFAdditions__hf_allCameraProfiles__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cameraProfiles");
}

uint64_t __34__HMRoom_HFAdditions__hf_allZones__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "rooms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __77__HMRoom_HFAdditions__hf_allUniqueMediaProfileContainersExcludingMediaGroups__block_invoke(uint64_t a1, void *a2)
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

BOOL __77__HMRoom_HFAdditions__hf_allUniqueMediaProfileContainersExcludingMediaGroups__block_invoke_2(uint64_t a1, void *a2)
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

id __40__HMRoom_HFAdditions__hf_pairedHomePods__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  if (objc_msgSend(v2, "hf_isHomePod"))
  {
    objc_msgSend(v2, "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hf_mediaSystemForAccessory:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

BOOL __59__HMRoom_HFAdditions__hf_homePodPairsNotInHomeTheaterGroup__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v2 = a2;
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioDestinationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "hf_appleTVUsingAudioDestination:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == 0;

  return v6;
}

BOOL __55__HMRoom_HFAdditions__hf_homePodsNotInHomeTheaterGroup__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a2;
  if (objc_msgSend(v2, "hf_isHomePod")
    && (objc_msgSend(v2, "home"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "hf_mediaSystemForAccessory:", v2),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    objc_msgSend(v2, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "audioDestinationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_appleTVUsingAudioDestination:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8 == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

BOOL __59__HMRoom_HFAdditions__availableHomeTheaterMediaPartnerFor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  if (objc_msgSend(v3, "hf_isAppleTV"))
    v4 = +[HFMediaHelper canMediaProfileContainer:supportHomeTheaterWithAppleTV:](HFMediaHelper, "canMediaProfileContainer:supportHomeTheaterWithAppleTV:", *(_QWORD *)(a1 + 32), v3);
  else
    v4 = 0;

  return v4;
}

BOOL __59__HMRoom_HFAdditions__availableHomeTheaterMediaPartnerFor___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  _BOOL8 v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "hf_backingAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[HFMediaHelper canMediaProfileContainer:supportHomeTheaterWithAppleTV:](HFMediaHelper, "canMediaProfileContainer:supportHomeTheaterWithAppleTV:", v3, v4);

  return v5;
}

BOOL __59__HMRoom_HFAdditions__availableHomeTheaterMediaPartnerFor___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "mediaProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hf_backingAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[HFMediaHelper canMediaProfileContainer:supportHomeTheaterWithAppleTV:](HFMediaHelper, "canMediaProfileContainer:supportHomeTheaterWithAppleTV:", v3, v4);

  return v5;
}

BOOL __72__HMRoom_HFAdditions__availableHomePodsSupportingStereoPairingVersions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  v6 = objc_msgSend(v3, "hf_isHomePod")
    && (objc_msgSend(v3, "home"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "hf_mediaSystemForAccessory:", v3),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5)
    && (*(_QWORD *)(a1 + 32) & objc_msgSend(v3, "supportedStereoPairVersions")) != 0;

  return v6;
}

uint64_t __46__HMRoom_HFAdditions__hf_hasAtleastOneHomePod__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isHomePod");
}

uint64_t __44__HMRoom_HFAdditions__hf_allVisibleServices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_visibleServices");
}

uint64_t __44__HMRoom_HFAdditions__hf_visibleAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isVisibleAccessory");
}

uint64_t __59__HMRoom_HFAdditions__hf_atleastOneHomePodSupportsAnnounce__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "hf_isHomePod"))
    v3 = objc_msgSend(v2, "supportsAnnounce");
  else
    v3 = 0;

  return v3;
}

void *__79__HMRoom_HFAdditions__hf_atleastOneMediaAccessorySupportsAndHasAnnounceEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;

  v2 = a2;
  if (objc_msgSend(v2, "hf_isHomePod"))
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

    if (v9)
    {
      v10 = objc_msgSend(v9, "BOOLValue");

      if ((v10 & 1) == 0)
        goto LABEL_17;
      goto LABEL_14;
    }

    goto LABEL_16;
  }
  objc_msgSend(v2, "hf_siriEndpointProfile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v2, "mediaProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hf_mediaAccessoryCommonSettingsManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(v4, "settingValueForKeyPath:", HFAnnounceEnabledKeyPath);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    if (v15)
    {
      v16 = objc_msgSend(v15, "BOOLValue");

      if (v16)
      {
LABEL_14:
        v11 = (void *)objc_msgSend(v2, "supportsAnnounce");
        goto LABEL_18;
      }
LABEL_17:
      v11 = 0;
      goto LABEL_18;
    }
LABEL_16:

    goto LABEL_17;
  }
LABEL_18:

  return v11;
}

uint64_t __55__HMRoom_HFAdditions__hf_hasAtleastOneReachableHomePod__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  if (objc_msgSend(v2, "hf_isHomePod"))
  {
    objc_msgSend(v2, "mediaProfile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "settings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isControllable");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __73__HMRoom_HFAdditions__hf_dashboardSectionReorderableUUIDStringComparator__block_invoke(uint64_t a1, void *a2, void *a3)
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

uint64_t __47__HMRoom_HFAdditions__hf_allNonEmptyActionSets__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  objc_msgSend(a2, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__HMRoom_HFAdditions__hf_allNonEmptyActionSets__block_invoke_2;
  v6[3] = &unk_1EA72BC40;
  v6[4] = *(_QWORD *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __47__HMRoom_HFAdditions__hf_allNonEmptyActionSets__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  objc_msgSend(a2, "hf_affectedAccessoryRepresentables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__HMRoom_HFAdditions__hf_allNonEmptyActionSets__block_invoke_3;
  v6[3] = &unk_1EA72B188;
  v6[4] = *(_QWORD *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __47__HMRoom_HFAdditions__hf_allNonEmptyActionSets__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isInRoom:", *(_QWORD *)(a1 + 32));
}

BOOL __44__HMRoom_HFDemoMode__hf_demoModeAccessories__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2 == v3;

  return v4;
}

void __55__HMRoom_HFApplicationData___hf_updateApplicationData___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home:didUpdateApplicationDataForRoom:", v3, *(_QWORD *)(a1 + 32));

  }
}

void __84__HMRoom_HFApplicationData__hf_updateApplicationData_handleError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString **v8;
  int v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  id v15;

  v15 = a2;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasOptedToHH2") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "residentDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    v8 = HFOperationUpdateApplicationDataResidentSync;
    if (!v7)
      v8 = HFOperationUpdateApplicationDataCloudSync;
  }
  else
  {

    v8 = HFOperationUpdateApplicationDataCloudSync;
  }
  v9 = *(unsigned __int8 *)(a1 + 56);
  v10 = *v8;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
    objc_msgSend(v11, "handleError:operationType:options:retryBlock:cancelBlock:", v15, v10, 0, 0, 0);
  else
    objc_msgSend(v11, "logError:operationDescription:", v15, v10);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "applicationData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_hf_updateApplicationData:", v14);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
