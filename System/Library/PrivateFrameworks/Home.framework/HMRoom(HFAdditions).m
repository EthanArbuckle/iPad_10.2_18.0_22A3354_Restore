@implementation HMRoom(HFAdditions)

- (HFReorderableHomeKitItemList)hf_reorderableServicesList
{
  return -[HFReorderableHomeKitItemList initWithApplicationDataContainer:category:]([HFReorderableHomeKitItemList alloc], "initWithApplicationDataContainer:category:", a1, CFSTR("roomServices"));
}

- (uint64_t)hf_hasVisibleAccessories
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_16_3);

  return v2;
}

- (id)hf_allCameraProfiles
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_flatMap:", &__block_literal_global_99);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_unitaryCameraProfile
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_allCameraProfiles");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count") == 1)
  {
    objc_msgSend(v1, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)hf_allServices
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "accessories", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "services");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObjectsFromArray:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

- (id)hf_allZones
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a1, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zones");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__HMRoom_HFAdditions__hf_allZones__block_invoke;
  v6[3] = &unk_1EA72E450;
  v6[4] = a1;
  objc_msgSend(v3, "na_filter:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hf_allUniqueMediaProfileContainersExcludingMediaGroups
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_2_14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "hf_pairedHomePods");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "na_filter:", &__block_literal_global_4_3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)hf_pairedHomePods
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_map:", &__block_literal_global_6_3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_homePodPairsNotInHomeTheaterGroup
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_pairedHomePods");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_8_4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_homePodsNotInHomeTheaterGroup
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_10_5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)availableHomeTheaterMediaPartnerFor:()HFAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v10;
  uint64_t v11;
  void *v12;
  id *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  if (+[HFMediaHelper isHomePod:](HFMediaHelper, "isHomePod:", v4)
    || +[HFMediaHelper isHomePodMediaSystem:](HFMediaHelper, "isHomePodMediaSystem:", v4))
  {
    objc_msgSend(a1, "accessories");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __59__HMRoom_HFAdditions__availableHomeTheaterMediaPartnerFor___block_invoke;
    v19[3] = &unk_1EA727840;
    v20 = v4;
    objc_msgSend(v5, "na_firstObjectPassingTest:", v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "mediaProfile");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v8 = v7;
  }
  else
  {
    if (!+[HFMediaHelper isAppleTV:](HFMediaHelper, "isAppleTV:", v4))
    {
      v8 = 0;
      goto LABEL_5;
    }
    objc_msgSend(a1, "hf_homePodPairsNotInHomeTheaterGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      objc_msgSend(a1, "hf_homePodPairsNotInHomeTheaterGroup");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __59__HMRoom_HFAdditions__availableHomeTheaterMediaPartnerFor___block_invoke_2;
      v17[3] = &unk_1EA72CE40;
      v13 = &v18;
      v18 = v4;
      objc_msgSend(v12, "na_firstObjectPassingTest:", v17);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "hf_homePodsNotInHomeTheaterGroup");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __59__HMRoom_HFAdditions__availableHomeTheaterMediaPartnerFor___block_invoke_3;
      v15[3] = &unk_1EA727840;
      v13 = &v16;
      v16 = v4;
      objc_msgSend(v12, "na_firstObjectPassingTest:", v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "mediaProfile");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v7 = *v13;
  }

LABEL_5:
  return v8;
}

- (id)availableHomePodsSupportingStereoPairingVersions:()HFAdditions
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(a1, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__HMRoom_HFAdditions__availableHomePodsSupportingStereoPairingVersions___block_invoke;
  v7[3] = &__block_descriptor_40_e21_B16__0__HMAccessory_8l;
  v7[4] = a3;
  objc_msgSend(v4, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)hf_hasAtleastOneHomePod
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_12_7);

  return v2;
}

- (id)hf_allVisibleServices
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_flatMap:", &__block_literal_global_14_5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hf_visibleAccessories
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_15_4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hf_shouldShowAnnounceButtonForThisRoom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  unsigned int v7;
  NSObject *v8;
  _DWORD v10[2];
  __int16 v11;
  unsigned int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeAccessControlForUser:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "isAnnounceAccessAllowed");
  v7 = objc_msgSend(a1, "hf_atleastOneMediaAccessorySupportsAndHasAnnounceEnabled");
  HFLogForCategory(7uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109634;
    v10[1] = v6;
    v11 = 1024;
    v12 = v7;
    v13 = 2112;
    v14 = a1;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "isAnnounceAccessAllowedForThisUser = %d, atleastOneMediaAccessorySupportsAnnounce = [%d], for room = %@", (uint8_t *)v10, 0x18u);
  }

  return v6 & v7;
}

- (uint64_t)hf_shouldShowAnnounceFeatureForThisRoom
{
  uint64_t v2;
  NSObject *v3;
  _DWORD v5[2];
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "hf_atleastOneHomePodSupportsAnnounce");
  HFLogForCategory(7uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109378;
    v5[1] = v2;
    v6 = 2112;
    v7 = a1;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "atleastOneHomePodSupportsAnnounce = [%d], for room = %@", (uint8_t *)v5, 0x12u);
  }

  return v2;
}

- (uint64_t)hf_atleastOneHomePodSupportsAnnounce
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_17_6);

  return v2;
}

- (uint64_t)hf_atleastOneMediaAccessorySupportsAndHasAnnounceEnabled
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_18_3);

  return v2;
}

- (uint64_t)hf_hasAtleastOneReachableHomePod
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_any:", &__block_literal_global_20_5);

  return v2;
}

- (HFRoomDashboardReorderableItemList)hf_reorderableDashboardSectionList
{
  return -[HFRoomDashboardReorderableItemList initWithApplicationDataContainer:category:]([HFRoomDashboardReorderableItemList alloc], "initWithApplicationDataContainer:category:", a1, CFSTR("dashboardSections"));
}

- (id)hf_dashboardSectionReorderableUUIDStringComparator
{
  void *v1;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, val);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__HMRoom_HFAdditions__hf_dashboardSectionReorderableUUIDStringComparator__block_invoke;
  v3[3] = &unk_1EA72F048;
  objc_copyWeak(&v4, &location);
  v1 = _Block_copy(v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
  return v1;
}

- (id)hf_roomsSortDescriptorUsingDashboardSectionOrder
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0CB3928]);
  objc_msgSend(a1, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_dashboardSectionReorderableUUIDStringComparator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithKey:ascending:comparator:", CFSTR("uniqueIdentifier.UUIDString"), 1, v4);

  return v5;
}

- (id)hf_allNonEmptyActionSets
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a1, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_allNonEmptyActionSets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__HMRoom_HFAdditions__hf_allNonEmptyActionSets__block_invoke;
  v6[3] = &unk_1EA728840;
  v6[4] = a1;
  objc_msgSend(v3, "na_filter:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hf_accessoryRepresentableUsageCountsWithFilter:()HFAdditions
{
  id v4;
  HFBiomeUsageCountsFetchRequest *v5;
  void *v6;
  HFBiomeUsageCountsFetchRequest *v7;
  void *v8;

  v4 = a3;
  v5 = [HFBiomeUsageCountsFetchRequest alloc];
  objc_msgSend(a1, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFBiomeUsageCountsFetchRequest initWithHome:](v5, "initWithHome:", v6);

  -[HFBiomeAbstractFetchRequest setRoom:](v7, "setRoom:", a1);
  -[HFBiomeUsageCountsFetchRequest setFilter:](v7, "setFilter:", v4);

  -[HFBiomeAbstractFetchRequest fetch](v7, "fetch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
