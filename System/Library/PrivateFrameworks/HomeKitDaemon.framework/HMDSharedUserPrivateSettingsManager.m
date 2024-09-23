@implementation HMDSharedUserPrivateSettingsManager

- (HMDSharedUserPrivateSettingsManager)initWithCoreData:(id)a3 cloudTransform:(id)a4 homeManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDSharedUserPrivateSettingsManager *v12;
  HMDSharedUserPrivateSettingsManager *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDSharedUserPrivateSettingsManager;
  v12 = -[HMDSharedUserPrivateSettingsManager init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_coreData, a3);
    objc_storeStrong((id *)&v13->_cloudTransform, a4);
    objc_storeWeak((id *)&v13->_homeManager, v11);
    +[MKFCKSharedUserDataRoot entity](MKFCKSharedUserDataRoot, "entity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    +[MKFCKSharedUserPrivateRoot entity](MKFCKSharedUserPrivateRoot, "entity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerCloudChangeListener:forEntities:", v13, v16);

  }
  return v13;
}

- (id)settingsForHome:(id)a3 ofType:(int64_t)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  uint64_t v8;
  id v9;
  void *v10;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (a4 == 1)
  {
    v8 = 40;
  }
  else
  {
    if (a4 != 2)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v8 = 48;
  }
  v9 = *(id *)((char *)&self->super.isa + v8);
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (id)updateSettingsForHome:(id)a3 ofType:(int64_t)a4 withValues:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  int64_t v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(v11, "count");
  v14 = (void *)MEMORY[0x24BE3F180];
  if (v13)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __87__HMDSharedUserPrivateSettingsManager_updateSettingsForHome_ofType_withValues_context___block_invoke;
    v17[3] = &unk_24E7953F8;
    v17[4] = self;
    v21 = a4;
    v18 = v10;
    v19 = v12;
    v20 = v11;
    objc_msgSend(v14, "inContext:perform:", v19, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithNoValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)authorizationDataForCharacteristicWithInstanceID:(id)a3 accessoryUUID:(id)a4 homeModelID:(id)a5
{
  id v8;
  id v9;
  id v10;
  os_unfair_lock_s *p_lock;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_characteristicAuthorizationDataByHomeModelID, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v14;
}

- (id)updateAuthorizationDataForCharacteristicWithInstanceID:(id)a3 accessoryUUID:(id)a4 homeModelID:(id)a5 authorizationData:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)MEMORY[0x24BE3F180];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __146__HMDSharedUserPrivateSettingsManager_updateAuthorizationDataForCharacteristicWithInstanceID_accessoryUUID_homeModelID_authorizationData_context___block_invoke;
  v25[3] = &unk_24E78C000;
  v25[4] = self;
  v26 = v14;
  v27 = v16;
  v28 = v13;
  v29 = v15;
  v30 = v12;
  v18 = v12;
  v19 = v15;
  v20 = v13;
  v21 = v16;
  v22 = v14;
  objc_msgSend(v17, "inContext:perform:", v21, v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void)willStartListeningWithContext:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *v6;
  NSMutableDictionary *privateSettingsByHome;
  NSMutableDictionary *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *sharedSettingsByHome;
  NSMutableDictionary *v12;
  void *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *characteristicAuthorizationDataByHomeModelID;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  HMDSharedUserPrivateSettingsManager *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  _BYTE buf[24];
  void *v32;
  NSMutableDictionary *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  privateSettingsByHome = self->_privateSettingsByHome;
  self->_privateSettingsByHome = v6;

  v8 = self->_privateSettingsByHome;
  +[MKFCKSharedUserPrivateRoot entity](MKFCKSharedUserPrivateRoot, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSharedUserPrivateSettingsManager _populateSettings:fromEntity:context:](self, v8, v9, v4);

  v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  sharedSettingsByHome = self->_sharedSettingsByHome;
  self->_sharedSettingsByHome = v10;

  v12 = self->_sharedSettingsByHome;
  +[MKFCKSharedUserDataRoot entity](MKFCKSharedUserDataRoot, "entity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSharedUserPrivateSettingsManager _populateSettings:fromEntity:context:](self, v12, v13, v4);

  v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  characteristicAuthorizationDataByHomeModelID = self->_characteristicAuthorizationDataByHomeModelID;
  self->_characteristicAuthorizationDataByHomeModelID = v14;

  v16 = self->_characteristicAuthorizationDataByHomeModelID;
  v29 = v4;
  +[MKFCKSharedUserPrivateRoot entity](MKFCKSharedUserPrivateRoot, "entity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB678]), "initWithEntityName:", v18);
  objc_msgSend(v29, "hmd_coreData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "cloudPrivateStore");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAffectedStores:", v22);

  v30 = 0;
  objc_msgSend(v29, "executeFetchRequest:error:", v19, &v30);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v30;
  if (v23)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __88__HMDSharedUserPrivateSettingsManager__populateCharacteristicAuthorizationData_context___block_invoke;
    v32 = &unk_24E78C028;
    v33 = v16;
    objc_msgSend(v23, "hmf_enumerateWithAutoreleasePoolUsingBlock:", buf);

  }
  else
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2112;
      v32 = v24;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch private %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v25);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)didInsertOrUpdateModel:(id)a3 changedProperties:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id WeakRetained;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  uint64_t *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;

  v6 = a3;
  v7 = a4;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v6, "entity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFCKSharedUserPrivateRoot entity](MKFCKSharedUserPrivateRoot, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isKindOfEntity:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = 40;
  }
  else
  {
    objc_msgSend(v6, "entity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKFCKSharedUserDataRoot entity](MKFCKSharedUserDataRoot, "entity");
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v12, "isKindOfEntity:", v13);
    if (!v14)
    {
      v20 = 1;
      v9 = (void *)v13;
      goto LABEL_20;
    }
    v11 = 48;
    v9 = (void *)v13;
  }
  v15 = *(id *)((char *)&self->super.isa + v11);
  objc_msgSend(v6, "homeModelID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v32 = v7;
    objc_msgSend(v15, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
      v19 = v17;
    else
      v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v21 = v19;

    objc_msgSend(v9, "hmd_attributesBySettingsPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __80__HMDSharedUserPrivateSettingsManager_didInsertOrUpdateModel_changedProperties___block_invoke;
    v37[3] = &unk_24E78C0A0;
    v23 = v32;
    v38 = v23;
    v24 = v21;
    v39 = v24;
    v25 = v6;
    v40 = v25;
    v41 = &v46;
    objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v37);

    if (*((_BYTE *)v47 + 24))
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v24, v16);
    v26 = v25;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;
    v28 = v27;

    if (v28)
    {
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __80__HMDSharedUserPrivateSettingsManager_didInsertOrUpdateModel_changedProperties___block_invoke_2;
      v33[3] = &unk_24E78C0C8;
      v33[4] = self;
      v34 = v16;
      v35 = v28;
      v36 = &v42;
      objc_msgSend(v23, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v33);

    }
    v20 = 0;
    v7 = v32;
  }
  else
  {
    v20 = 1;
  }

LABEL_20:
  os_unfair_lock_unlock(&self->_lock);
  if (!v20)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
    if (*((_BYTE *)v47 + 24))
    {
      objc_msgSend(v6, "modelID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "notifyClientsOfUserSettingsChangeWithReason:sourceUUID:", CFSTR("User Settings updated (Cloud)"), v30);

    }
    if (*((_BYTE *)v43 + 24))
    {
      objc_msgSend(v6, "modelID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", CFSTR("Authorization Data Changed"), v31, 1);

    }
  }
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicAuthorizationDataByHomeModelID, 0);
  objc_storeStrong((id *)&self->_sharedSettingsByHome, 0);
  objc_storeStrong((id *)&self->_privateSettingsByHome, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_cloudTransform, 0);
  objc_storeStrong((id *)&self->_coreData, 0);
}

void __80__HMDSharedUserPrivateSettingsManager_didInsertOrUpdateModel_changedProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (!v6 || objc_msgSend(v6, "containsObject:", v5))
  {
    v7 = *(void **)(a1 + 48);
    objc_msgSend(v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v10);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

void __80__HMDSharedUserPrivateSettingsManager_didInsertOrUpdateModel_changedProperties___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("characteristicAuthorizationData"));

  if (v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "characteristicAuthorizationData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 40);
      v16 = 138544130;
      v17 = v13;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating characteristic authorization data %@ -> %@ for home uuid: %@", (uint8_t *)&v16, 0x2Au);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 48), "characteristicAuthorizationData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKeyedSubscript:", v15, *(_QWORD *)(a1 + 40));

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *a3 = 1;

  }
}

- (void)_populateSettings:(void *)a3 fromEntity:(void *)a4 context:
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = objc_alloc(MEMORY[0x24BDBB678]);
    objc_msgSend(v8, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithEntityName:", v11);

    objc_msgSend(v9, "hmd_coreData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cloudPrivateStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAffectedStores:", v15);

    v29 = 0;
    objc_msgSend(v9, "executeFetchRequest:error:", v12, &v29);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v29;
    if (v16)
    {
      objc_msgSend(v8, "hmd_attributesBySettingsPath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __76__HMDSharedUserPrivateSettingsManager__populateSettings_fromEntity_context___block_invoke;
      v26[3] = &unk_24E78C078;
      v27 = v7;
      v28 = v18;
      v19 = v18;
      objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v26);

    }
    else
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = a1;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v25 = v20;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v31 = v23;
        v32 = 2112;
        v33 = v24;
        v34 = 2112;
        v35 = v17;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch private %@: %@", buf, 0x20u);

        v20 = v25;
      }

      objc_autoreleasePoolPop(v20);
    }

  }
}

void __88__HMDSharedUserPrivateSettingsManager__populateCharacteristicAuthorizationData_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "homeModelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v5, "characteristicAuthorizationData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);

  }
}

void __76__HMDSharedUserPrivateSettingsManager__populateSettings_fromEntity_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v7 = a2;
  objc_msgSend(v7, "homeModelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);
    v5 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __76__HMDSharedUserPrivateSettingsManager__populateSettings_fromEntity_context___block_invoke_2;
    v8[3] = &unk_24E78C050;
    v9 = v4;
    v10 = v7;
    v6 = v4;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

void __76__HMDSharedUserPrivateSettingsManager__populateSettings_fromEntity_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(a3, "name");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

uint64_t __146__HMDSharedUserPrivateSettingsManager_updateAuthorizationDataForCharacteristicWithInstanceID_accessoryUUID_homeModelID_authorizationData_context___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  id WeakRetained;
  void *v47;
  _BOOL4 v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  id v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  NSObject *v60;
  void *v61;
  id v62;
  id v63;
  uint64_t v64;
  os_unfair_lock_s *lock;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  uint8_t v78[128];
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  id v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  _QWORD v89[4];

  v89[1] = *MEMORY[0x24BDAC8D0];
  lock = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  v2 = objc_alloc(MEMORY[0x24BDBB678]);
  +[MKFCKSharedUserPrivateRoot entity](MKFCKSharedUserPrivateRoot, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)objc_msgSend(v2, "initWithEntityName:", v4);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("homeModelID"), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setPredicate:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "cloudPrivateStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v89[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v89, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setAffectedStores:", v7);

  objc_msgSend(v70, "setFetchLimit:", 1);
  v8 = *(void **)(a1 + 48);
  v77 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v70, &v77);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v77;
  objc_msgSend(v9, "firstObject");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "mutableCopy");

    v12 = (void *)v11;
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v71 = v12;
    objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (void *)objc_msgSend(v13, "mutableCopy");

    if (!v69)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(a1 + 64);
      v18 = *(_QWORD *)(a1 + 72);
      v20 = *(_QWORD *)(a1 + 56);
      v21 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544386;
      v80 = v17;
      v81 = 2112;
      v82 = v19;
      v83 = 2112;
      v84 = v18;
      v85 = 2112;
      v86 = v20;
      v87 = 2112;
      v88 = v21;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating authorization data: %@ for characteristic with instance ID: %@ with accessory uuid:%@ home uuid: %@ ", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(v69, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 72));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToData:", *(_QWORD *)(a1 + 64));

    if (v23)
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v26 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *(_QWORD *)(a1 + 64);
        v28 = *(void **)(a1 + 72);
        v30 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138544130;
        v80 = v27;
        v81 = 2112;
        v82 = v28;
        v83 = 2112;
        v84 = v30;
        v85 = 2112;
        v86 = v29;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Authorization data for characteristic with instance ID: %@ of accessory with uuid: %@ is already set to: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v24);
      v31 = 1;
      v32 = 1;
    }
    else
    {
      objc_msgSend(v69, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
      v40 = (void *)objc_msgSend(v69, "copy");
      objc_msgSend(v71, "setObject:forKeyedSubscript:", v40, *(_QWORD *)(a1 + 56));

      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      objc_msgSend(v71, "allKeys");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
      if (v42)
      {
        v43 = *(_QWORD *)v74;
        do
        {
          for (i = 0; i != v42; ++i)
          {
            if (*(_QWORD *)v74 != v43)
              objc_enumerationMutation(v41);
            v45 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
            WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
            objc_msgSend(WeakRetained, "accessoryWithUUID:", v45);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v47 == 0;

            if (v48)
            {
              v49 = (void *)MEMORY[0x227676638]();
              v50 = *(id *)(a1 + 32);
              HMFGetOSLogHandle();
              v51 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v80 = v52;
                v81 = 2112;
                v82 = v45;
                _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_INFO, "%{public}@Removing characteristic authorization data for removed accessory: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v49);
              objc_msgSend(v71, "setObject:forKeyedSubscript:", 0, v45);
            }
          }
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
        }
        while (v42);
      }

      v53 = objc_msgSend(v71, "copy");
      objc_msgSend(v68, "setCharacteristicAuthorizationData:", v53);

      v54 = *(void **)(a1 + 48);
      v72 = 0;
      LOBYTE(v53) = objc_msgSend(v54, "save:", &v72);
      v55 = v72;
      v56 = objc_msgSend(*(id *)(a1 + 48), "reset");
      if ((v53 & 1) != 0)
      {
        v57 = (void *)objc_msgSend(v71, "copy");
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKeyedSubscript:", v57, *(_QWORD *)(a1 + 40));
        v31 = 0;
      }
      else
      {
        v58 = (void *)MEMORY[0x227676638](v56);
        v59 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v60 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v80 = v61;
          v81 = 2112;
          v82 = v55;
          _os_log_impl(&dword_2218F0000, v60, OS_LOG_TYPE_ERROR, "%{public}@Failed to save authorization data:%@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v58);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
        v62 = (id)objc_claimAutoreleasedReturnValue();
        v57 = v62;
        if (v62)
        {
          v63 = v62;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
          objc_claimAutoreleasedReturnValue();
        }

        v31 = 1;
      }

      v32 = 2;
    }

  }
  else
  {
    v33 = (void *)MEMORY[0x227676638]();
    v34 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v35 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v80 = v36;
      v81 = 2112;
      v82 = v67;
      _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to update authorization data, unable to fetch user settings container: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37)
    {
      v39 = v37;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
    }
    v71 = v38;

    v31 = 1;
    v32 = 2;
  }

  if (v31)
    v64 = v32;
  else
    v64 = 1;
  os_unfair_lock_unlock(lock);
  return v64;
}

uint64_t __87__HMDSharedUserPrivateSettingsManager_updateSettingsForHome_ofType_withValues_context___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  char v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  int v39;
  id v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  void *context;
  id obj;
  _QWORD v51[4];
  id v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  _BYTE *v57;
  id v58;
  uint8_t v59[4];
  void *v60;
  __int16 v61;
  uint64_t v62;
  _BYTE buf[24];
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  _QWORD v67[4];

  v67[1] = *MEMORY[0x24BDAC8D0];
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  v3 = *(_QWORD *)(a1 + 64);
  if (v3 == 2)
  {
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
    +[MKFCKSharedUserDataRoot entity](MKFCKSharedUserDataRoot, "entity");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;
    v7 = objc_alloc(MEMORY[0x24BDBB678]);
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithEntityName:", v8);

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("homeModelID"), *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicate:", v10);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "cloudPrivateStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAffectedStores:", v12);

    objc_msgSend(v9, "setFetchLimit:", 1);
    v13 = *(void **)(a1 + 48);
    v58 = 0;
    objc_msgSend(v13, "executeFetchRequest:error:", v9, &v58);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v58;
    objc_msgSend(v14, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v26 = (void *)MEMORY[0x227676638]();
      v27 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v28 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v29;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v15;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch user settings container: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30)
      {
        v32 = v30;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
        objc_claimAutoreleasedReturnValue();
      }

      v39 = 1;
      goto LABEL_31;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v64 = __Block_byref_object_copy__169921;
    v65 = __Block_byref_object_dispose__169922;
    v66 = 0;
    objc_msgSend(v6, "hmd_attributesBySettingsPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(void **)(a1 + 56);
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __87__HMDSharedUserPrivateSettingsManager_updateSettingsForHome_ofType_withValues_context___block_invoke_9;
    v51[3] = &unk_24E78BFD8;
    v19 = v17;
    v20 = *(_QWORD *)(a1 + 32);
    v52 = v19;
    v53 = v20;
    v54 = v6;
    v57 = buf;
    v55 = *(id *)(a1 + 40);
    v56 = v16;
    objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v51);
    v22 = (id *)(*(_QWORD *)&buf[8] + 40);
    v21 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v21)
    {
      v21;
    }
    else
    {
      v33 = *(void **)(a1 + 48);
      obj = 0;
      v34 = objc_msgSend(v33, "save:", &obj);
      objc_storeStrong(v22, obj);
      v35 = objc_msgSend(*(id *)(a1 + 48), "reset");
      if ((v34 & 1) != 0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        if (v36)
        {
          objc_msgSend(v36, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 56));
        }
        else
        {
          v47 = (void *)objc_msgSend(*(id *)(a1 + 56), "mutableCopy");
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v47, *(_QWORD *)(a1 + 40));

        }
        v39 = 0;
        goto LABEL_30;
      }
      context = (void *)MEMORY[0x227676638](v35);
      v40 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v41 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v59 = 138543618;
        v60 = v42;
        v61 = 2112;
        v62 = v43;
        _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to save: %@", v59, 0x16u);

      }
      objc_autoreleasePoolPop(context);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      v44 = (id)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      if (v44)
      {
        v46 = v44;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
        objc_claimAutoreleasedReturnValue();
      }

    }
    v39 = 1;
LABEL_30:

    _Block_object_dispose(buf, 8);
LABEL_31:

    if (v39)
      v38 = 2;
    else
      v38 = 1;
    goto LABEL_34;
  }
  if (v3 == 1)
  {
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
    +[MKFCKSharedUserPrivateRoot entity](MKFCKSharedUserPrivateRoot, "entity");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v25 = v23;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  v38 = 2;
LABEL_34:
  os_unfair_lock_unlock(v2);
  return v38;
}

void __87__HMDSharedUserPrivateSettingsManager_updateSettingsForHome_ofType_withValues_context___block_invoke_9(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x227676638]();
  v11 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = v7;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v8;
      v16 = v10;
      v17 = *(void **)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 48), "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v29 = v14;
      v30 = 2112;
      v31 = v17;
      v10 = v16;
      v8 = v15;
      v32 = 2112;
      v33 = v27;
      v34 = 2112;
      v35 = v18;
      v36 = 2112;
      v37 = v19;
      v38 = 2112;
      v39 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating shared user setting %@/%@ (%@.%@) = %@", buf, 0x3Eu);

      v7 = v27;
    }

    objc_autoreleasePoolPop(v10);
    v20 = *(void **)(a1 + 64);
    objc_msgSend(v9, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setValue:forKey:", v8, v21);

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v22;
      v30 = 2112;
      v31 = v23;
      v32 = 2112;
      v33 = v7;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Invalid settings key path for %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;

    *a4 = 1;
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19_169932 != -1)
    dispatch_once(&logCategory__hmf_once_t19_169932, &__block_literal_global_169933);
  return (id)logCategory__hmf_once_v20_169934;
}

void __50__HMDSharedUserPrivateSettingsManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v20_169934;
  logCategory__hmf_once_v20_169934 = v0;

}

@end
