@implementation MKFCKSharedUserDataRoot

- (id)fetchEquivalentModels:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MKFCKSharedUserDataRoot;
  -[MKFCKModel fetchEquivalentModels:](&v18, sel_fetchEquivalentModels_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MKFCKSharedUserDataRoot managedObjectContext](self, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmd_coreData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "container");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "valueForKey:", CFSTR("objectID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchSharesMatchingObjectIDs:error:", v9, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[MKFCKSharedUserDataRoot objectID](self, "objectID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __49__MKFCKSharedUserDataRoot_fetchEquivalentModels___block_invoke;
      v16[3] = &unk_24E77C6D8;
      v16[4] = v10;
      v17 = v12;
      v13 = v12;
      objc_msgSend(v5, "hmf_objectsPassingTest:", v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)importIntoLocalModelWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MKFCKSharedUserDataRoot *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MKFCKSharedUserData workingStoreHomeMember](self, "workingStoreHomeMember");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "castIfMemberIsGuest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(v6, "castIfMemberIsUser");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[MKFCKSharedUserDataRoot importIntoLocalModel:context:](self, "importIntoLocalModel:context:", v17, v4);

      goto LABEL_11;
    }
    objc_msgSend(v6, "castIfMemberIsGuest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[MKFCKSharedUserDataRoot matCredIPKExternalRepresentation](self, "matCredIPKExternalRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setMatCredIPKExternalRepresentation:", v9);

    }
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKSharedUserDataRoot objectID](v11, "objectID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hmd_debugIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v13;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to resolve working store user for shared settings import of %@, skipping import", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }
  LOBYTE(v16) = 1;
LABEL_11:

  return v16;
}

- (BOOL)importIntoLocalModel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  v8 = -[MKFCKSharedUserDataRoot _importSharedUserSettingsIntoLocalModel:context:](self, "_importSharedUserSettingsIntoLocalModel:context:", v6, v7)&& -[MKFCKSharedUserDataRoot importPersonsIntoLocalModel:context:](self, "importPersonsIntoLocalModel:context:", v6, v7)&& -[MKFCKSharedUserDataRoot importAccessorySettingsIntoLocalModel:context:](self, "importAccessorySettingsIntoLocalModel:context:", v6, v7);

  return v8;
}

- (BOOL)_importSharedUserSettingsIntoLocalModel:(id)a3 context:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a3;
  objc_msgSend(v5, "numberWithBool:", -[MKFCKSharedUserDataRoot allowExplicitContent](self, "allowExplicitContent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowExplicitContent:", v7);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MKFCKSharedUserDataRoot allowiTunesAccount](self, "allowiTunesAccount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowiTunesAccount:", v8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MKFCKSharedUserDataRoot dolbyAtmosEnabled](self, "dolbyAtmosEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDolbyAtmosEnabled:", v9);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MKFCKSharedUserDataRoot losslessMusicEnabled](self, "losslessMusicEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLosslessMusicEnabled:", v10);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MKFCKSharedUserDataRoot playbackInfluencesEnabled](self, "playbackInfluencesEnabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaybackInfluencesEnabled:", v11);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MKFCKSharedUserDataRoot siriIdentifyVoiceEnabled](self, "siriIdentifyVoiceEnabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSiriIdentifyVoiceEnabled:", v12);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MKFCKSharedUserDataRoot activityNotificationsEnabledForPersonalRequests](self, "activityNotificationsEnabledForPersonalRequests"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActivityNotificationsEnabledForPersonalRequests:", v13);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MKFCKSharedUserDataRoot sharePhotosFaceClassifications](self, "sharePhotosFaceClassifications"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSharePhotosFaceClassifications:", v14);

  -[MKFCKSharedUserDataRoot photosPersonDataZoneUUID](self, "photosPersonDataZoneUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPhotosPersonDataZoneUUID:", v15);

  -[MKFCKSharedUserDataRoot matCredIPKExternalRepresentation](self, "matCredIPKExternalRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMatCredIPKExternalRepresentation:", v16);

  return 1;
}

uint64_t __49__MKFCKSharedUserDataRoot_fetchEquivalentModels___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = HMFEqualObjects();

  return v5;
}

+ (id)rootKeyPath
{
  return 0;
}

+ (id)createWithHomeModelID:(id)a3 persistentStore:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContext:", v8);
  objc_msgSend(v8, "assignObject:toPersistentStore:", v11, v9);

  objc_msgSend(v11, "setModelID:", v10);
  objc_msgSend(v11, "setHomeModelID:", v10);

  return v11;
}

+ (BOOL)importInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  return objc_msgSend(a1, "_importInsertOrUpdateWithObjectID:context:", a3, a5);
}

+ (BOOL)importUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  return objc_msgSend(a1, "_importInsertOrUpdateWithObjectID:context:", a3, a6, a5);
}

+ (BOOL)importDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  return 1;
}

+ (BOOL)_importInsertOrUpdateWithObjectID:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "hmd_cloudPrivateStoreIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    +[MKFCKModel modelWithObjectID:context:error:](MKFCKSharedUserDataRoot, "modelWithObjectID:context:error:", v5, v6, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "importIntoLocalModelWithContext:", v6);

  }
  return v11;
}

+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  return 1;
}

+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  return 1;
}

+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  return 1;
}

+ (id)entityDescriptionFromContext:(id)a3
{
  void *v3;
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBB658];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entityForName:inManagedObjectContext:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)importPersonsIntoLocalModel:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  _MKFPhotosPerson *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  id v31;
  void *v32;
  id v34;
  id obj;
  _QWORD v36[4];
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v34 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  -[MKFCKSharedUserDataRoot personsFromPhotos](self, "personsFromPhotos");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[MKFCKSharedUserDataRoot personsFromPhotos](self, "personsFromPhotos");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        v14 = v9;
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v15, "modelID", v34);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MKFModel modelWithModelID:context:](_MKFPhotosPerson, "modelWithModelID:context:", v16, v6);
        v17 = (_MKFPhotosPerson *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          v17 = -[_MKFPhotosPerson initWithContext:]([_MKFPhotosPerson alloc], "initWithContext:", v6);
          objc_msgSend(v15, "modelID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MKFPhotosPerson setModelID:](v17, "setModelID:", v18);

          objc_msgSend(v15, "writerTimestamp");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MKFPhotosPerson setWriterTimestamp:](v17, "setWriterTimestamp:", v19);

          -[_MKFPhotosPerson setUser:](v17, "setUser:", v34);
        }
        -[_MKFPhotosPerson name](v17, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = HMFEqualObjects();

        if ((v22 & 1) == 0)
        {
          objc_msgSend(v15, "name");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MKFPhotosPerson setName:](v17, "setName:", v23);

        }
        -[_MKFPhotosPerson photoLibraryPersonUUID](v17, "photoLibraryPersonUUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "photoLibraryPersonUUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = HMFEqualObjects();

        if ((v26 & 1) == 0)
        {
          objc_msgSend(v15, "photoLibraryPersonUUID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MKFPhotosPerson setPhotoLibraryPersonUUID:](v17, "setPhotoLibraryPersonUUID:", v27);

        }
        v9 = v14;
        objc_msgSend(v14, "addObject:", v17);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v11);
  }

  objc_msgSend(v34, "personsFromPhotos");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isEqualToSet:", v9);

  if ((v29 & 1) == 0)
  {
    objc_msgSend(v34, "personsFromPhotos");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __72__MKFCKSharedUserDataRoot_Persons__importPersonsIntoLocalModel_context___block_invoke;
    v36[3] = &unk_24E78A5C0;
    v31 = v9;
    v37 = v31;
    v38 = v6;
    objc_msgSend(v30, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v36);

    v32 = (void *)objc_msgSend(v31, "copy");
    objc_msgSend(v34, "setPersonsFromPhotos_:", v32);

  }
  return 1;
}

void __72__MKFCKSharedUserDataRoot_Persons__importPersonsIntoLocalModel_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v3);

}

- (BOOL)importAccessorySettingsIntoLocalModel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[MKFCKSharedUserDataRoot accessorySettings](self, "accessorySettings", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "importIntoLocalUserModel:context:", v6, v7))
        {
          v13 = 0;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCKSharedUserDataRoot"));
}

@end
