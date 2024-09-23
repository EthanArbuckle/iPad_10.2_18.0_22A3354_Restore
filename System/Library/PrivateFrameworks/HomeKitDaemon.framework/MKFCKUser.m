@implementation MKFCKUser

- (BOOL)exportOwnerUserSettingsFromLocalModel:(id)a3 context:(id)a4
{
  id v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;

  v5 = a3;
  if (objc_msgSend(v5, "isOwner"))
  {
    v6 = -[MKFCKUser ownerAllowExplicitContent](self, "ownerAllowExplicitContent");
    objc_msgSend(v5, "allowExplicitContent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if (v6 != v8)
    {
      objc_msgSend(v5, "allowExplicitContent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKUser setOwnerAllowExplicitContent:](self, "setOwnerAllowExplicitContent:", objc_msgSend(v9, "BOOLValue"));

    }
    v10 = -[MKFCKUser ownerAllowiTunesAccount](self, "ownerAllowiTunesAccount");
    objc_msgSend(v5, "allowiTunesAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if (v10 != v12)
    {
      objc_msgSend(v5, "allowiTunesAccount");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKUser setOwnerAllowiTunesAccount:](self, "setOwnerAllowiTunesAccount:", objc_msgSend(v13, "BOOLValue"));

    }
    v14 = -[MKFCKUser ownerDolbyAtmosEnabled](self, "ownerDolbyAtmosEnabled");
    objc_msgSend(v5, "dolbyAtmosEnabled");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    if (v14 != v16)
    {
      objc_msgSend(v5, "dolbyAtmosEnabled");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKUser setOwnerDolbyAtmosEnabled:](self, "setOwnerDolbyAtmosEnabled:", objc_msgSend(v17, "BOOLValue"));

    }
    v18 = -[MKFCKUser ownerLosslessMusicEnabled](self, "ownerLosslessMusicEnabled");
    objc_msgSend(v5, "losslessMusicEnabled");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");

    if (v18 != v20)
    {
      objc_msgSend(v5, "losslessMusicEnabled");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKUser setOwnerLosslessMusicEnabled:](self, "setOwnerLosslessMusicEnabled:", objc_msgSend(v21, "BOOLValue"));

    }
    v22 = -[MKFCKUser ownerPlaybackInfluencesEnabled](self, "ownerPlaybackInfluencesEnabled");
    objc_msgSend(v5, "playbackInfluencesEnabled");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "BOOLValue");

    if (v22 != v24)
    {
      objc_msgSend(v5, "playbackInfluencesEnabled");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKUser setOwnerPlaybackInfluencesEnabled:](self, "setOwnerPlaybackInfluencesEnabled:", objc_msgSend(v25, "BOOLValue"));

    }
    v26 = -[MKFCKUser ownerSiriIdentifyVoiceEnabled](self, "ownerSiriIdentifyVoiceEnabled");
    objc_msgSend(v5, "siriIdentifyVoiceEnabled");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "BOOLValue");

    if (v26 != v28)
    {
      objc_msgSend(v5, "siriIdentifyVoiceEnabled");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKUser setOwnerSiriIdentifyVoiceEnabled:](self, "setOwnerSiriIdentifyVoiceEnabled:", objc_msgSend(v29, "BOOLValue"));

    }
    v30 = -[MKFCKUser ownerActivityNotificationsEnabledForPersonalRequests](self, "ownerActivityNotificationsEnabledForPersonalRequests");
    objc_msgSend(v5, "activityNotificationsEnabledForPersonalRequests");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "BOOLValue");

    if (v30 != v32)
    {
      objc_msgSend(v5, "activityNotificationsEnabledForPersonalRequests");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKUser setOwnerActivityNotificationsEnabledForPersonalRequests:](self, "setOwnerActivityNotificationsEnabledForPersonalRequests:", objc_msgSend(v33, "BOOLValue"));

    }
    -[MKFCKUser ownerCharacteristicAuthorizationData](self, "ownerCharacteristicAuthorizationData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ownerCharacteristicAuthorizationData");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = HMFEqualObjects();

    if ((v36 & 1) == 0)
    {
      objc_msgSend(v5, "ownerCharacteristicAuthorizationData");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKUser setOwnerCharacteristicAuthorizationData:](self, "setOwnerCharacteristicAuthorizationData:", v37);

    }
    v38 = -[MKFCKUser sharePhotosFaceClassifications](self, "sharePhotosFaceClassifications");
    objc_msgSend(v5, "sharePhotosFaceClassifications");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "BOOLValue");

    if (v38 != v40)
    {
      objc_msgSend(v5, "sharePhotosFaceClassifications");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKUser setSharePhotosFaceClassifications:](self, "setSharePhotosFaceClassifications:", objc_msgSend(v41, "BOOLValue"));

    }
    -[MKFCKUser photosPersonDataZoneUUID](self, "photosPersonDataZoneUUID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photosPersonDataZoneUUID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = HMFEqualObjects();

    if ((v44 & 1) == 0)
    {
      objc_msgSend(v5, "photosPersonDataZoneUUID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKUser setPhotosPersonDataZoneUUID:](self, "setPhotosPersonDataZoneUUID:", v45);

    }
    -[MKFCKUser ownerMatCredIPKExternalRepresentation](self, "ownerMatCredIPKExternalRepresentation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "matCredIPKExternalRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = HMFEqualObjects();

    if ((v48 & 1) == 0)
    {
      objc_msgSend(v5, "matCredIPKExternalRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKUser setOwnerMatCredIPKExternalRepresentation:](self, "setOwnerMatCredIPKExternalRepresentation:", v49);

    }
  }

  return 1;
}

- (BOOL)importOwnerUserSettingsIntoLocalModel:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  int v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;

  v5 = a3;
  if (-[MKFCKUser isOwner](self, "isOwner"))
  {
    objc_msgSend(v5, "allowExplicitContent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");
    v8 = -[MKFCKUser ownerAllowExplicitContent](self, "ownerAllowExplicitContent");

    if (v7 != v8)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MKFCKUser ownerAllowExplicitContent](self, "ownerAllowExplicitContent"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAllowExplicitContent:", v9);

    }
    objc_msgSend(v5, "allowiTunesAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");
    v12 = -[MKFCKUser ownerAllowiTunesAccount](self, "ownerAllowiTunesAccount");

    if (v11 != v12)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MKFCKUser ownerAllowiTunesAccount](self, "ownerAllowiTunesAccount"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAllowiTunesAccount:", v13);

    }
    objc_msgSend(v5, "dolbyAtmosEnabled");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");
    v16 = -[MKFCKUser ownerDolbyAtmosEnabled](self, "ownerDolbyAtmosEnabled");

    if (v15 != v16)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MKFCKUser ownerDolbyAtmosEnabled](self, "ownerDolbyAtmosEnabled"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDolbyAtmosEnabled:", v17);

    }
    objc_msgSend(v5, "losslessMusicEnabled");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");
    v20 = -[MKFCKUser ownerLosslessMusicEnabled](self, "ownerLosslessMusicEnabled");

    if (v19 != v20)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MKFCKUser ownerLosslessMusicEnabled](self, "ownerLosslessMusicEnabled"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setLosslessMusicEnabled:", v21);

    }
    objc_msgSend(v5, "playbackInfluencesEnabled");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "BOOLValue");
    v24 = -[MKFCKUser ownerPlaybackInfluencesEnabled](self, "ownerPlaybackInfluencesEnabled");

    if (v23 != v24)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MKFCKUser ownerPlaybackInfluencesEnabled](self, "ownerPlaybackInfluencesEnabled"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPlaybackInfluencesEnabled:", v25);

    }
    objc_msgSend(v5, "siriIdentifyVoiceEnabled");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "BOOLValue");
    v28 = -[MKFCKUser ownerSiriIdentifyVoiceEnabled](self, "ownerSiriIdentifyVoiceEnabled");

    if (v27 != v28)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MKFCKUser ownerSiriIdentifyVoiceEnabled](self, "ownerSiriIdentifyVoiceEnabled"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSiriIdentifyVoiceEnabled:", v29);

    }
    objc_msgSend(v5, "activityNotificationsEnabledForPersonalRequests");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "BOOLValue");
    v32 = -[MKFCKUser ownerActivityNotificationsEnabledForPersonalRequests](self, "ownerActivityNotificationsEnabledForPersonalRequests");

    if (v31 != v32)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MKFCKUser ownerActivityNotificationsEnabledForPersonalRequests](self, "ownerActivityNotificationsEnabledForPersonalRequests"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setActivityNotificationsEnabledForPersonalRequests:", v33);

    }
    objc_msgSend(v5, "ownerCharacteristicAuthorizationData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFCKUser ownerCharacteristicAuthorizationData](self, "ownerCharacteristicAuthorizationData");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = HMFEqualObjects();

    if ((v36 & 1) == 0)
    {
      -[MKFCKUser ownerCharacteristicAuthorizationData](self, "ownerCharacteristicAuthorizationData");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setOwnerCharacteristicAuthorizationData:", v37);

    }
    objc_msgSend(v5, "sharePhotosFaceClassifications");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "BOOLValue");
    v40 = -[MKFCKUser sharePhotosFaceClassifications](self, "sharePhotosFaceClassifications");

    if (v39 != v40)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MKFCKUser sharePhotosFaceClassifications](self, "sharePhotosFaceClassifications"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSharePhotosFaceClassifications:", v41);

    }
    objc_msgSend(v5, "photosPersonDataZoneUUID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFCKUser photosPersonDataZoneUUID](self, "photosPersonDataZoneUUID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = HMFEqualObjects();

    if ((v44 & 1) == 0)
    {
      -[MKFCKUser photosPersonDataZoneUUID](self, "photosPersonDataZoneUUID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPhotosPersonDataZoneUUID:", v45);

    }
    objc_msgSend(v5, "matCredIPKExternalRepresentation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFCKUser ownerMatCredIPKExternalRepresentation](self, "ownerMatCredIPKExternalRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = HMFEqualObjects();

    if ((v48 & 1) == 0)
    {
      -[MKFCKUser ownerMatCredIPKExternalRepresentation](self, "ownerMatCredIPKExternalRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMatCredIPKExternalRepresentation:", v49);

    }
  }

  return 1;
}

- (BOOL)importSharedUserSettingsIntoLocalModel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (-[MKFCKUser isOwner](self, "isOwner"))
  {
    v8 = 1;
  }
  else
  {
    -[MKFCKUser _resolveSharedUserDataRootWithContext:](self, "_resolveSharedUserDataRootWithContext:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v8 = objc_msgSend(v9, "importIntoLocalModel:context:", v6, v7);
    else
      v8 = 1;

  }
  return v8;
}

- (id)_resolveSharedUserDataRootWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  MKFCKUser *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  MKFCKUser *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  const char *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint32_t v37;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id obj;
  MKFCKUser *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[MKFCKSharedUserDataRoot fetchRequest](MKFCKSharedUserDataRoot, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD1758];
  -[MKFCKUser homeModelID](self, "homeModelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("homeModelID"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v8);

  v49 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v5, &v49);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v49;
  if (!v9)
  {
    v29 = (void *)MEMORY[0x227676638]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKUser homeModelID](v30, "homeModelID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v52 = v32;
      v53 = 2160;
      v54 = 1752392040;
      v55 = 2112;
      v56 = v33;
      v57 = 2114;
      v58 = v10;
      v34 = "%{public}@Failed to fetch shared user data roots for home %{mask.hash}@: %{public}@";
      v35 = v31;
      v36 = OS_LOG_TYPE_ERROR;
      v37 = 42;
LABEL_19:
      _os_log_impl(&dword_2218F0000, v35, v36, v34, buf, v37);

    }
LABEL_20:

    objc_autoreleasePoolPop(v29);
    v28 = 0;
    goto LABEL_23;
  }
  if (!objc_msgSend(v9, "count"))
  {
    v29 = (void *)MEMORY[0x227676638]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKUser homeModelID](v30, "homeModelID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v52 = v32;
      v53 = 2160;
      v54 = 1752392040;
      v55 = 2112;
      v56 = v33;
      v34 = "%{public}@No shared user data roots for home %{mask.hash}@";
      v35 = v31;
      v36 = OS_LOG_TYPE_INFO;
      v37 = 32;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  v44 = self;
  v40 = v10;
  v41 = v5;
  v42 = v4;
  objc_msgSend(v4, "hmd_coreData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "container");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v39 = v9;
  obj = v9;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v46;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v46 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v17, "objectID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "recordForManagedObjectID:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          -[MKFCKUser reverseShareID](v44, "reverseShareID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "share");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "recordID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v20, "isEqual:", v22);

          if ((v23 & 1) != 0)
          {
            v28 = v17;

            goto LABEL_22;
          }
        }

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (v14)
        continue;
      break;
    }
  }

  v24 = (void *)MEMORY[0x227676638]();
  v25 = v44;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v52 = v27;
    _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Failed to find associated shared data root for user", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v24);
  v28 = 0;
LABEL_22:
  v5 = v41;
  v4 = v42;
  v9 = v39;
  v10 = v40;

LABEL_23:
  return v28;
}

- (BOOL)isOwner
{
  void *v2;
  BOOL v3;

  -[MKFCKUser ownedHome](self, "ownedHome");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  _BOOL4 v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  int v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  _BOOL4 v36;
  _MKFUserAccessCode *v37;
  _MKFUserAccessCode *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  char v48;
  void *v50;
  MKFCKUser *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  _QWORD v65[4];
  id v66;
  _BYTE buf[24];
  void *v68;
  id v69;
  MKFCKUser *v70;
  id v71;
  uint64_t *v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  if (!-[MKFCKModel copyPropertiesIntoLocalModel:context:](self, "copyPropertiesIntoLocalModel:context:", v7, v8)
    || !-[MKFCKUser importOwnerUserSettingsIntoLocalModel:context:](self, "importOwnerUserSettingsIntoLocalModel:context:", v7, v8))
  {
    goto LABEL_18;
  }
  v9 = -[MKFCKUser importSharedUserSettingsIntoLocalModel:context:](self, "importSharedUserSettingsIntoLocalModel:context:", v7, v8);
  v10 = 0;
  if (!self || !v9)
    goto LABEL_19;
  v11 = v7;
  objc_msgSend(v11, "accountHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteDestinationString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserID:", v13);

  v14 = v8;
  v15 = v11;
  objc_msgSend(v15, "entity");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "relationshipsByName");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("personsFromPhotos_"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKUser entity](self, "entity");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "relationshipsByName");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("personsFromPhotos"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v15;
  v19 = v16;
  v20 = v17;
  v21 = v14;
  v56 = v19;
  objc_msgSend(v19, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valueForKey:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x24BDAC760];
  v65[0] = MEMORY[0x24BDAC760];
  v65[1] = 3221225472;
  v65[2] = __98__MKFCKHomeObject__importRelationshipsIntoLocalModel_localRelationship_cloudRelationship_context___block_invoke;
  v65[3] = &unk_24E78F998;
  v26 = v24;
  v66 = v26;
  objc_msgSend(v23, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v65);

  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 1;
  objc_msgSend(v20, "name");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFCKUser valueForKey:](self, "valueForKey:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = v25;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __98__MKFCKHomeObject__importRelationshipsIntoLocalModel_localRelationship_cloudRelationship_context___block_invoke_2;
  v68 = &unk_24E77B6D0;
  v29 = v21;
  v69 = v29;
  v70 = self;
  v30 = v26;
  v71 = v30;
  v72 = &v61;
  objc_msgSend(v28, "hmf_enumerateWithAutoreleasePoolUsingBlock:", buf);
  v31 = *((unsigned __int8 *)v62 + 24);
  if (*((_BYTE *)v62 + 24))
  {
    -[MKFCKUser home](self, "home");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_maybeDeleteStaleLocalModels:context:", v30, v29);

  }
  _Block_object_dispose(&v61, 8);

  if (!v31)
  {
LABEL_18:
    v10 = 0;
    goto LABEL_19;
  }
  v33 = v18;
  v34 = v29;
  -[MKFCKUser homeAccessCode](self, "homeAccessCode");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "length") == 0;

  objc_msgSend(v33, "accessCode");
  v37 = (_MKFUserAccessCode *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v36)
  {

    if (v38)
    {
      v50 = (void *)MEMORY[0x227676638]();
      v51 = self;
      HMFGetOSLogHandle();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "accessCode");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v53;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v54;
        *(_WORD *)&buf[22] = 2112;
        v68 = v33;
        _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_INFO, "%{public}@Deleting the MKFUserAccessCode %@ for User %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v50);
      objc_msgSend(v33, "accessCode");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "deleteObject:", v55);

    }
  }
  else
  {
    if (!v37)
    {
      v38 = -[_MKFUserAccessCode initWithContext:]([_MKFUserAccessCode alloc], "initWithContext:", v34);
      -[MKFCKUser modelID](self, "modelID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDUserAccessCodeModel modelUUIDWithUUID:](HMDUserAccessCodeModel, "modelUUIDWithUUID:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKFUserAccessCode setModelID:](v38, "setModelID:", v40);

    }
    -[_MKFUserAccessCode accessCode](v38, "accessCode");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFCKUser homeAccessCode](self, "homeAccessCode");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = HMFEqualObjects();

    if ((v43 & 1) == 0)
    {
      -[MKFCKUser homeAccessCode](self, "homeAccessCode");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKFUserAccessCode setAccessCode:](v38, "setAccessCode:", v44);

    }
    -[_MKFUserAccessCode user](v38, "user");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = HMFEqualObjects();

    if ((v46 & 1) == 0)
      -[_MKFUserAccessCode setUser:](v38, "setUser:", v33);
    objc_msgSend(v33, "accessCode");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = HMFEqualObjects();

    if ((v48 & 1) == 0)
      objc_msgSend(v33, "setAccessCode:", v38);

  }
  v10 = -[MKFCKUser _importOutgoingInvitationRelationshipIntoLocalModel:context:](self, v33, v34);
LABEL_19:

  return v10;
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  MKFCKUser *v17;
  NSObject *v18;
  void *v19;
  int v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  MKFCKUser *v37;
  void *v38;
  void *v39;
  BOOL v40;
  MKFCKUser *v41;
  NSObject *v42;
  void *v43;
  BOOL v44;
  MKFCKUser *v45;
  NSObject *v46;
  void *v47;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *contextb;
  void *context;
  void *contexta;
  _QWORD v56[4];
  id v57;
  _BYTE *v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;
  _QWORD v63[3];
  _BYTE v64[24];
  MKFCKUser *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v9, "hmf_isEmpty") & 1) == 0)
  {
    *(_QWORD *)v64 = 0;
    *(_QWORD *)&v64[8] = v64;
    *(_QWORD *)&v64[16] = 0x2020000000;
    LOBYTE(v65) = 1;
    v11 = (void *)MEMORY[0x24BDBCF20];
    v63[0] = CFSTR("bulletinConditions_");
    v63[1] = CFSTR("bulletinRegistrations_");
    v63[2] = CFSTR("notificationRegistrations_");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v56[0] = MEMORY[0x24BDAC760];
    v56[1] = 3221225472;
    v56[2] = __60__MKFCKUser_exportFromLocalModel_updatedProperties_context___block_invoke;
    v56[3] = &unk_24E798868;
    v14 = v13;
    v57 = v14;
    v58 = v64;
    v15 = objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v56);
    if (*(_BYTE *)(*(_QWORD *)&v64[8] + 24))
    {
      v16 = (void *)MEMORY[0x227676638](v15);
      v17 = self;
      HMFGetOSLogHandle();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = v19;
        v61 = 2112;
        v62 = v8;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Skipping cloud export from MKFUser %@ since all updated properties are non-cloud sync properties", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);

      _Block_object_dispose(v64, 8);
LABEL_26:
      v44 = 1;
      goto LABEL_27;
    }

    _Block_object_dispose(v64, 8);
  }
  if (-[MKFCKModel copyPropertiesFromLocalModel:context:](self, "copyPropertiesFromLocalModel:context:", v8, v10))
  {
    v20 = !-[MKFCKUser exportOwnerUserSettingsFromLocalModel:context:](self, "exportOwnerUserSettingsFromLocalModel:context:", v8, v10);
    if (!self)
      LOBYTE(v20) = 1;
    if ((v20 & 1) == 0)
    {
      v21 = v10;
      v22 = v8;
      objc_msgSend(v22, "entity");
      contextb = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(contextb, "relationshipsByName");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("personsFromPhotos_"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKUser entity](self, "entity");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "relationshipsByName");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("personsFromPhotos"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v21;
      v26 = v24;
      v27 = v23;
      v28 = v22;
      objc_msgSend(v26, "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKUser valueForKey:](self, "valueForKey:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      -[MKFCKUser home](self, "home");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v31, "_exportRelationshipsFromLocalModel:localRelationship:cloudRelationship:cloudModels:context:", v28, v27, v26, v30, v25);

      if (v49)
      {
        objc_msgSend(v28, "accessCode");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v32)
        {
          objc_msgSend(v32, "accessCode");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKFCKUser setHomeAccessCode:](self, "setHomeAccessCode:", v34);

        }
        v35 = v28;
        v36 = v25;
        objc_msgSend(v35, "invitation");
        v37 = (MKFCKUser *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          +[MKFCKModel fetchWithLocalModel:context:](MKFCKOutgoingInvitation, "fetchWithLocalModel:context:", v37, v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
          {
            -[MKFCKUser invitation](self, "invitation");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v39 == v38;

            if (!v40)
            {
              context = (void *)MEMORY[0x227676638]();
              v41 = self;
              HMFGetOSLogHandle();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v64 = 138543874;
                *(_QWORD *)&v64[4] = v43;
                *(_WORD *)&v64[12] = 2112;
                *(_QWORD *)&v64[14] = v38;
                *(_WORD *)&v64[22] = 2112;
                v65 = v41;
                _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Linking invitation [%@] to pendingUser : [%@]", v64, 0x20u);

              }
              objc_autoreleasePoolPop(context);
              -[MKFCKUser setInvitation:](v41, "setInvitation:", v38);
            }
          }
          else
          {
            contexta = (void *)MEMORY[0x227676638]();
            v45 = self;
            HMFGetOSLogHandle();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v64 = 138543874;
              *(_QWORD *)&v64[4] = v47;
              *(_WORD *)&v64[12] = 2112;
              *(_QWORD *)&v64[14] = v35;
              *(_WORD *)&v64[22] = 2112;
              v65 = v37;
              _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_INFO, "%{public}@Cannot fulfill relationship between user and outgoing invitation yet: %@.invitation = %@", v64, 0x20u);

            }
            objc_autoreleasePoolPop(contexta);
          }

        }
        goto LABEL_26;
      }
    }
  }
  v44 = 0;
LABEL_27:

  return v44;
}

void __60__MKFCKUser_exportFromLocalModel_updatedProperties_context___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "containsObject:", v6);

  if ((v5 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
}

- (BOOL)_importOutgoingInvitationRelationshipIntoLocalModel:(void *)a3 context:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(a1, "invitation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(a1, "invitation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fetchLocalModelWithContext:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      v11 = v10;

      if (v11)
      {
        objc_msgSend(v5, "invitation");
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 != v11)
          objc_msgSend(v5, "setInvitation:", v11);
      }
      else
      {
        v13 = (void *)MEMORY[0x227676638]();
        v14 = a1;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543874;
          v19 = v16;
          v20 = 2112;
          v21 = v14;
          v22 = 2112;
          v23 = 0;
          _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Cannot fulfill relationship between pending user and outgoing invitation yet: %@.invitation = %@", (uint8_t *)&v18, 0x20u);

        }
        objc_autoreleasePoolPop(v13);
      }

    }
  }

  return a1 != 0;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCKUser"));
}

@end
