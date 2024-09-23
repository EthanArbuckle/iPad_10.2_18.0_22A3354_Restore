@implementation HKMedicationsDeviceInfo(HealthMedicationsDaemonPlugin)

+ (id)localDeviceInfo
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v0 = objc_alloc(MEMORY[0x1E0D2C500]);
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "currentDeviceDisplayName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDeviceProductType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "currentOSVersionStruct");
  else
    memset(v9, 0, sizeof(v9));
  v7 = (void *)objc_msgSend(v0, "_initLocalDeviceWithName:model:operatingSystemVersion:scheduleCompatibilityVersion:", v2, v4, v9, 1);

  return v7;
}

+ (id)deviceInfoFromStorageGroup:()HealthMedicationsDaemonPlugin syncIdentityManager:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v31;
  uint64_t v32;
  id v33;
  id v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v34 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v5, "storageEntries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v12, "key");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v9);
  }

  objc_msgSend(v5, "deviceContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "syncIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hardwareIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_Name"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringValue:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_Model"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringValue:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_OperatingSystemVersion"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringValue:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_ScheduleCompatibilityVersion"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "numberValue:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  if (v16 && v18 && v20 && v22 && v24)
  {
    v37 = 0uLL;
    v38 = 0;
    HKNSOperatingSystemVersionFromString();
    v32 = objc_msgSend(v24, "integerValue");
    objc_msgSend(v5, "deviceContext");
    v33 = v5;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "syncIdentity");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "currentSyncIdentity");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "identity");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v27, "isEqual:", v29);

    v5 = v33;
    v35 = 0uLL;
    v36 = 0;
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2C500]), "initWithHardwareIdentifier:name:model:operatingSystemVersion:scheduleCompatibilityVersion:localDevice:", v16, v18, v20, &v35, v32, v31);
  }

  return v25;
}

@end
