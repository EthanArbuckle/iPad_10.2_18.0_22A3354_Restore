@implementation HMDConfigurationLogEvent

- (BOOL)isResidentCapable
{
  return self->_isResidentCapable;
}

- (NSArray)homeConfigurations
{
  return self->_homeConfigurations;
}

- (unsigned)databaseSize
{
  return self->_databaseSize;
}

- (unsigned)metadataVersion
{
  return self->_metadataVersion;
}

- (HMDConfigurationLogEvent)initWithHomeManager:(id)a3 widgetDataSource:(id)a4 metadataVersion:(unsigned int)a5
{
  uint64_t v5;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  HMDHomeConfigurationLogEvent *v15;
  HMDConfigurationLogEvent *v16;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v5 = *(_QWORD *)&a5;
  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v7, "homes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(obj);
        v15 = -[HMDHomeConfigurationLogEvent initWithHome:configuredWidgetsCount:]([HMDHomeConfigurationLogEvent alloc], "initWithHome:configuredWidgetsCount:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14++), objc_msgSend(v8, "configuredWidgetsCount"));
        -[HMDHomeConfigurationLogEvent setHomeIndex:](v15, "setHomeIndex:", v12 + v14);
        -[HMDHomeConfigurationLogEvent setDatabaseSize:](v15, "setDatabaseSize:", objc_msgSend(v7, "homeDatabaseSize"));
        -[HMDHomeConfigurationLogEvent setMetadataVersion:](v15, "setMetadataVersion:", v5);
        objc_msgSend(v9, "addObject:", v15);

      }
      while (v11 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v12 += v14;
    }
    while (v11);
  }

  v16 = -[HMDConfigurationLogEvent initWithHomeConfigurations:widgetDataSource:isFMFDevice:](self, "initWithHomeConfigurations:widgetDataSource:isFMFDevice:", v9, v8, isThisDeviceDesignatedFMFDevice());
  return v16;
}

- (HMDConfigurationLogEvent)initWithHomeConfigurations:(id)a3 widgetDataSource:(id)a4 isFMFDevice:(BOOL)a5
{
  id v9;
  id v10;
  HMDConfigurationLogEvent *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HMDConfigurationLogEvent;
  v11 = -[HMMLogEvent init](&v25, sel_init);
  if (v11)
  {
    v20 = v9;
    os_unfair_lock_lock_with_options();
    v11->_instanceId = ++_currentInstanceId;
    os_unfair_lock_unlock((os_unfair_lock_t)&_lock_33283);
    v19 = v10;
    v11->_totalWidgets = objc_msgSend(v10, "configuredWidgetsCount");
    objc_storeStrong((id *)&v11->_homeConfigurations, a3);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[HMDConfigurationLogEvent homeConfigurations](v11, "homeConfigurations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          ++v11->_totalHomes;
          v11->_totalHomeCategoryBitMask |= objc_msgSend(v17, "homeCategoryBitMask");
          v11->_totalAppleMediaCategoryBitMask |= objc_msgSend(v17, "appleMediaCategoryBitMask");
          v11->_totalThirdPartyMediaCategoryBitMask |= objc_msgSend(v17, "thirdPartyMediaCategoryBitMask");
          if (objc_msgSend(v17, "numAccessories"))
          {
            ++v11->_totalNonEmptyHomes;
            if (objc_msgSend(v17, "isOwnerUser"))
              ++v11->_totalOwnedHomes;
            if (objc_msgSend(v17, "numResidentsEnabled"))
              ++v11->_totalResidentEnabledHomes;
            v11->_isResidentCapable |= objc_msgSend(v17, "isCurrentDeviceResidentCapable");
            v11->_isResidentEnabled |= objc_msgSend(v17, "isCurrentDeviceResidentEnabled");
            v11->_isPrimaryResidentForSomeHome |= objc_msgSend(v17, "isCurrentDevicePrimaryResident");
            v11->_isResidentFirstEnabledAnyHome |= objc_msgSend(v17, "isResidentFirstEnabled");
            v11->_isResidentElectionV2EnabledAnyHome |= objc_msgSend(v17, "isResidentElectionV2Enabled");
            v11->_totalResidentElectionBitMask |= objc_msgSend(v17, "residentElectionBitMask");
            v11->_totalUsers += objc_msgSend(v17, "numUsers");
            v11->_totalAdminUsers += objc_msgSend(v17, "numAdmins");
            v11->_totalRestrictedGuests += objc_msgSend(v17, "numRestrictedGuests");
            v11->_currentUserPrivilegeBitMask |= objc_msgSend(v17, "currentUserPrivilegeBitMask");
            v11->_totalUserPrivilegeBitMask |= objc_msgSend(v17, "userPrivilegeBitMask");
            v11->_totalAccessories += objc_msgSend(v17, "numAccessories");
            v11->_totalCertifiedAccessories += objc_msgSend(v17, "numCertifiedAccessories");
            v11->_totalSmartHomeAccessories += objc_msgSend(v17, "numSmartHomeAccessories");
            v11->_totalHAPAccessories += objc_msgSend(v17, "numHAPAccessories");
            v11->_totalHAPIPAccessories += objc_msgSend(v17, "numHAPIPAccessories");
            v11->_totalHAPBTAccessories += objc_msgSend(v17, "numHAPBTAccessories");
            v11->_totalCHIPAccessories += objc_msgSend(v17, "numCHIPAccessories");
            v11->_totalThreadAccessories += objc_msgSend(v17, "numThreadAccessories");
            v11->_totalBridgedAccessories += objc_msgSend(v17, "numBridgedAccessories");
            v11->_totalTelevisionServiceAccessories += objc_msgSend(v17, "numTelevisionServiceAccessories");
            v11->_totalCameraAccessories += objc_msgSend(v17, "numCameraAccessories");
            v11->_totalCameraAccessoriesRecordingEnabled += objc_msgSend(v17, "numCameraAccessoriesRecordingEnabled");
            v11->_totalAppleMediaAccessories += objc_msgSend(v17, "numAppleMediaAccessories");
            v11->_totalAppleAudioAccessories += objc_msgSend(v17, "numAppleAudioAccessories");
            v11->_totalAppleTVAccessories += objc_msgSend(v17, "numAppleTVAccessories");
            v11->_totalThirdPartyMediaAccessories += objc_msgSend(v17, "numThirdPartyMediaAccessories");
            v11->_totalHAPSpeakerAccessories += objc_msgSend(v17, "numPrimaryHAPSpeakerServiceAccessories");
            v11->_totalWholeHouseAudioAccessories += objc_msgSend(v17, "numWholeHouseAudioAccessories");
            v11->_totalEnabledResidents += objc_msgSend(v17, "numResidentsEnabled");
            v11->_totalScenes += objc_msgSend(v17, "numConfiguredScenes");
            v11->_totalTriggers += objc_msgSend(v17, "numTriggers");
            v11->_totalActiveTriggers += objc_msgSend(v17, "numActiveTriggers");
            v11->_databaseSize = objc_msgSend(v17, "databaseSize");
            v11->_metadataVersion = objc_msgSend(v17, "metadataVersion");
            v11->_isResidentSelectionEnabledAnyHome |= objc_msgSend(v17, "isResidentSelectionEnabled");
            v11->_isResidentSelectionModeAutoAnyHome |= objc_msgSend(v17, "residentSelectionMode") == 3;
            v11->_isResidentSelectionModeCoordinationAnyHome |= objc_msgSend(v17, "residentSelectionMode") == 1;
            v11->_isResidentSelectionModeManualAnyHome |= objc_msgSend(v17, "residentSelectionMode") == 2;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v14);
    }

    v11->_isFMFDevice = a5;
    v10 = v19;
    v9 = v20;
  }

  return v11;
}

- (BOOL)isTelevisionOnlyConfiguration
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[HMDConfigurationLogEvent totalAccessories](self, "totalAccessories");
  if (v3)
  {
    v4 = -[HMDConfigurationLogEvent totalAccessories](self, "totalAccessories");
    LOBYTE(v3) = v4 == -[HMDConfigurationLogEvent totalTelevisionServiceAccessories](self, "totalTelevisionServiceAccessories");
  }
  return v3;
}

- (BOOL)isMediaOnlyConfiguration
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[HMDConfigurationLogEvent totalAccessories](self, "totalAccessories");
  if (v3)
  {
    v4 = -[HMDConfigurationLogEvent totalAccessories](self, "totalAccessories");
    v5 = -[HMDConfigurationLogEvent totalTelevisionServiceAccessories](self, "totalTelevisionServiceAccessories");
    v6 = -[HMDConfigurationLogEvent totalHAPSpeakerAccessories](self, "totalHAPSpeakerAccessories") + v5;
    v7 = -[HMDConfigurationLogEvent totalWholeHouseAudioAccessories](self, "totalWholeHouseAudioAccessories");
    LOBYTE(v3) = v4 == v6
                     + v7
                     + -[HMDConfigurationLogEvent totalAppleMediaAccessories](self, "totalAppleMediaAccessories");
  }
  return v3;
}

- (BOOL)isSubmitted
{
  return 0;
}

- (unint64_t)instanceId
{
  return self->_instanceId;
}

- (unint64_t)totalHomes
{
  return self->_totalHomes;
}

- (unint64_t)totalNonEmptyHomes
{
  return self->_totalNonEmptyHomes;
}

- (unint64_t)totalOwnedHomes
{
  return self->_totalOwnedHomes;
}

- (unint64_t)totalResidentEnabledHomes
{
  return self->_totalResidentEnabledHomes;
}

- (unint64_t)totalHomeCategoryBitMask
{
  return self->_totalHomeCategoryBitMask;
}

- (unint64_t)totalAppleMediaCategoryBitMask
{
  return self->_totalAppleMediaCategoryBitMask;
}

- (unint64_t)totalThirdPartyMediaCategoryBitMask
{
  return self->_totalThirdPartyMediaCategoryBitMask;
}

- (int64_t)totalUsers
{
  return self->_totalUsers;
}

- (int64_t)totalAdminUsers
{
  return self->_totalAdminUsers;
}

- (int64_t)totalRestrictedGuests
{
  return self->_totalRestrictedGuests;
}

- (unint64_t)totalUserPrivilegeBitMask
{
  return self->_totalUserPrivilegeBitMask;
}

- (unint64_t)currentUserPrivilegeBitMask
{
  return self->_currentUserPrivilegeBitMask;
}

- (unint64_t)totalAccessories
{
  return self->_totalAccessories;
}

- (unint64_t)totalCertifiedAccessories
{
  return self->_totalCertifiedAccessories;
}

- (unint64_t)totalSmartHomeAccessories
{
  return self->_totalSmartHomeAccessories;
}

- (unint64_t)totalHAPAccessories
{
  return self->_totalHAPAccessories;
}

- (unint64_t)totalHAPIPAccessories
{
  return self->_totalHAPIPAccessories;
}

- (unint64_t)totalHAPBTAccessories
{
  return self->_totalHAPBTAccessories;
}

- (unint64_t)totalCHIPAccessories
{
  return self->_totalCHIPAccessories;
}

- (unint64_t)totalThreadAccessories
{
  return self->_totalThreadAccessories;
}

- (unint64_t)totalBridgedAccessories
{
  return self->_totalBridgedAccessories;
}

- (unint64_t)totalTelevisionServiceAccessories
{
  return self->_totalTelevisionServiceAccessories;
}

- (unint64_t)totalCameraAccessories
{
  return self->_totalCameraAccessories;
}

- (unint64_t)totalCameraAccessoriesRecordingEnabled
{
  return self->_totalCameraAccessoriesRecordingEnabled;
}

- (unint64_t)totalAppleMediaAccessories
{
  return self->_totalAppleMediaAccessories;
}

- (unint64_t)totalAppleAudioAccessories
{
  return self->_totalAppleAudioAccessories;
}

- (unint64_t)totalAppleTVAccessories
{
  return self->_totalAppleTVAccessories;
}

- (unint64_t)totalThirdPartyMediaAccessories
{
  return self->_totalThirdPartyMediaAccessories;
}

- (unint64_t)totalWholeHouseAudioAccessories
{
  return self->_totalWholeHouseAudioAccessories;
}

- (unint64_t)totalHAPSpeakerAccessories
{
  return self->_totalHAPSpeakerAccessories;
}

- (unint64_t)totalEnabledResidents
{
  return self->_totalEnabledResidents;
}

- (unint64_t)totalScenes
{
  return self->_totalScenes;
}

- (unint64_t)totalTriggers
{
  return self->_totalTriggers;
}

- (unint64_t)totalActiveTriggers
{
  return self->_totalActiveTriggers;
}

- (int64_t)totalWidgets
{
  return self->_totalWidgets;
}

- (BOOL)isResidentEnabled
{
  return self->_isResidentEnabled;
}

- (BOOL)isPrimaryResidentForSomeHome
{
  return self->_isPrimaryResidentForSomeHome;
}

- (BOOL)isResidentFirstEnabledAnyHome
{
  return self->_isResidentFirstEnabledAnyHome;
}

- (BOOL)isResidentElectionV2EnabledAnyHome
{
  return self->_isResidentElectionV2EnabledAnyHome;
}

- (unint64_t)totalResidentElectionBitMask
{
  return self->_totalResidentElectionBitMask;
}

- (BOOL)isFMFDevice
{
  return self->_isFMFDevice;
}

- (BOOL)isResidentSelectionEnabledAnyHome
{
  return self->_isResidentSelectionEnabledAnyHome;
}

- (BOOL)isResidentSelectionModeAutoAnyHome
{
  return self->_isResidentSelectionModeAutoAnyHome;
}

- (BOOL)isResidentSelectionModeCoordinationAnyHome
{
  return self->_isResidentSelectionModeCoordinationAnyHome;
}

- (BOOL)isResidentSelectionModeManualAnyHome
{
  return self->_isResidentSelectionModeManualAnyHome;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeConfigurations, 0);
}

@end
