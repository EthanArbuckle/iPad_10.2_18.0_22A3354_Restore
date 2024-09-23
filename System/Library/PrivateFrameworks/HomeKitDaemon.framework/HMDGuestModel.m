@implementation HMDGuestModel

- (BOOL)shouldIgnoreProperty:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = shouldIgnoreProperty__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&shouldIgnoreProperty__onceToken, &__block_literal_global_164512);
  v5 = objc_msgSend((id)shouldIgnoreProperty__ignoredPropertySet, "containsObject:", v4);

  return v5;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDGuestModel *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[HMDGuestModel shouldIgnoreProperty:](self, "shouldIgnoreProperty:", v9))
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v14;
      v21 = 2114;
      v22 = v9;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring property [%{public}@] as it is not applicable for _MKFGuest entity", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v15 = 0;
  }
  else
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("allowedAccessoryUUIDs")))
    {
      objc_msgSend(v8, "allowedAccessoryUUIDs");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18.receiver = self;
      v18.super_class = (Class)HMDGuestModel;
      -[HMDUserModel cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](&v18, sel_cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo_, v8, v9, v10);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v16;
  }

  return v15;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("allowedAccessories_")))
  {
    if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("allowedAccessoryUUIDs")))
    {
      v18 = 0;
      v19 = &v18;
      v20 = 0x3032000000;
      v21 = __Block_byref_object_copy__164507;
      v22 = __Block_byref_object_dispose__164508;
      v11 = (void *)MEMORY[0x24BDBCEF0];
      -[HMDGuestModel allowedAccessoryUUIDs](self, "allowedAccessoryUUIDs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithCapacity:", objc_msgSend(v12, "count"));
      v23 = (id)objc_claimAutoreleasedReturnValue();

      -[HMDGuestModel allowedAccessoryUUIDs](self, "allowedAccessoryUUIDs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __82__HMDGuestModel_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke;
      v17[3] = &unk_24E78B298;
      v17[4] = &v18;
      objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v17);

      v14 = (id)v19[5];
      _Block_object_dispose(&v18, 8);

    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)HMDGuestModel;
    -[HMDUserModel cd_generateValueForProperty:managedObjectField:context:](&v16, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

void __82__HMDGuestModel_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "cd_getMKFAccessoryFromAccessory:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v5);
    v4 = v5;
  }

}

void __48__HMDGuestModel_CoreData__shouldIgnoreProperty___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[32];

  v4[31] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = CFSTR("activityNotificationsEnabledForPersonalRequests");
  v4[1] = CFSTR("allowExplicitContent");
  v4[2] = CFSTR("allowiTunesAccount");
  v4[3] = CFSTR("analysisAccessSelection");
  v4[4] = CFSTR("changeTag");
  v4[5] = CFSTR("dolbyAtmosEnabled");
  v4[6] = CFSTR("losslessMusicEnabled");
  v4[7] = CFSTR("ownerAddSceneButtonPresentedCount");
  v4[8] = CFSTR("ownerCharacteristicAuthorizationData");
  v4[9] = CFSTR("ownerCompletedSwitchingHomesOnboardingUI");
  v4[10] = CFSTR("ownerDismissed2024EnergyOnboarding");
  v4[11] = CFSTR("ownerDismissedAccessCodeOnboarding");
  v4[12] = CFSTR("ownerDismissedAccessoryFirmwareUpdateOnboarding");
  v4[13] = CFSTR("ownerDismissedAnnounceOnboarding");
  v4[14] = CFSTR("ownerDismissedCameraRecordingOnboarding");
  v4[15] = CFSTR("ownerDismissedCameraRecordingSetupBanner");
  v4[16] = CFSTR("ownerDismissedCameraUpgradeOfferBanner");
  v4[17] = CFSTR("ownerDismissedHomeTheaterOnboarding");
  v4[18] = CFSTR("ownerDismissedIdentifyVoiceOnboarding");
  v4[19] = CFSTR("ownerDismissedIdentifyVoiceSetupBanner");
  v4[20] = CFSTR("ownerDismissedNaturalLightingOnboarding");
  v4[21] = CFSTR("ownerDismissedTVViewingProfileOnboarding");
  v4[22] = CFSTR("ownerDismissedTVViewingProfileSetupBanner");
  v4[23] = CFSTR("ownerDismissedUserSplitMediaAccountWarning");
  v4[24] = CFSTR("ownerDismissedWalletKeyExpressModeOnboarding");
  v4[25] = CFSTR("ownerDismissedWelcomeUI");
  v4[26] = CFSTR("ownerHasUserSeenRMVNewLanguageNotification");
  v4[27] = CFSTR("photosPersonDataZoneUUIDString");
  v4[28] = CFSTR("playbackInfluencesEnabled");
  v4[29] = CFSTR("sharePhotosFaceClassifications");
  v4[30] = CFSTR("siriIdentifyVoiceEnabled");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 31);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)shouldIgnoreProperty__ignoredPropertySet;
  shouldIgnoreProperty__ignoredPropertySet = v2;

}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)CFSTR("home");
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (id)properties
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__HMDGuestModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_180115 != -1)
    dispatch_once(&properties_onceToken_180115, block);
  return (id)properties__properties_180116;
}

void __27__HMDGuestModel_properties__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v10 = CFSTR("allowedAccessoryUUIDs");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)&OBJC_METACLASS___HMDGuestModel;
  objc_msgSendSuper2(&v9, sel_properties);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addEntriesFromDictionary:", v4);
  v7 = objc_msgSend(v6, "copy");
  v8 = (void *)properties__properties_180116;
  properties__properties_180116 = v7;

  objc_autoreleasePoolPop(v2);
}

@end
