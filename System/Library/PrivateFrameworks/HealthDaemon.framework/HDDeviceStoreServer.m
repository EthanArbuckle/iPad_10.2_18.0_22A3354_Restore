@implementation HDDeviceStoreServer

- (void)remote_fetchDevicesMatchingValues:(id)a3 forProperty:(id)a4 completion:(id)a5
{
  void (**v8)(id, void *, id);
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v8 = (void (**)(id, void *, id))a5;
  v9 = a4;
  v10 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deviceManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v12, "devicesWithProperty:matchingValues:error:", v9, v10, &v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v15;
  v8[2](v8, v13, v14);

}

- (void)remote_fetchGymkitAndBluetoothDevicesMatchingValues:(id)a3 forProperty:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  HDDeviceStoreServer *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void (**v62)(id, _QWORD, id);
  id v63;
  id v64;
  void *v65;
  id obj;
  void *v67;
  HDDeviceStoreServer *v68;
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  id v84;
  id v85;
  uint8_t buf[4];
  HDDeviceStoreServer *v87;
  __int16 v88;
  uint64_t v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  -[HDStandardTaskServer profile](self, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sourceManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0CB7560];
  v85 = 0;
  objc_msgSend(v12, "allSourcesForBundleIdentifier:error:", v13, &v85);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v85;

  if (v14)
  {
    v68 = self;
    -[HDStandardTaskServer profile](self, "profile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sourceManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0CB7588];
    v84 = v15;
    objc_msgSend(v17, "allSourcesForBundleIdentifier:error:", v18, &v84);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v84;

    v65 = (void *)v19;
    if (v19)
    {
      v62 = v10;
      v63 = v8;
      v64 = v9;
      v21 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v22 = v14;
      v23 = v21;
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v61 = v22;
      v24 = v22;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
      v26 = v68;
      if (v25)
      {
        v27 = v25;
        v28 = *(_QWORD *)v81;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v81 != v28)
              objc_enumerationMutation(v24);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * i), "persistentID"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v30);

          }
          v27 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
        }
        while (v27);
      }

      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v31 = v65;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v76, v91, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v77;
        do
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v77 != v34)
              objc_enumerationMutation(v31);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * j), "persistentID"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v36);

          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v76, v91, 16);
        }
        while (v33);
      }

      -[HDStandardTaskServer profile](v68, "profile");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "dataProvenanceManager");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDStandardTaskServer profile](v68, "profile");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v20;
      objc_msgSend(v38, "deviceIDsForSourceIDs:profile:error:", v23, v39, &v75);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v75;

      v60 = v40;
      if (v40)
      {
        v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        obj = v40;
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v90, 16, v40);
        v67 = v42;
        if (v43)
        {
          v44 = v43;
          v45 = *(_QWORD *)v72;
          do
          {
            for (k = 0; k != v44; ++k)
            {
              v47 = v41;
              if (*(_QWORD *)v72 != v45)
                objc_enumerationMutation(obj);
              v48 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * k);
              -[HDStandardTaskServer profile](v26, "profile");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "deviceManager");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = v41;
              objc_msgSend(v50, "deviceForPersistentID:error:", v48, &v70);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = v70;

              if (v51)
              {
                objc_msgSend(v67, "addObject:", v51);
                v26 = v68;
              }
              else
              {
                _HKInitializeLogging();
                v52 = *MEMORY[0x1E0CB52B0];
                v26 = v68;
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v87 = v68;
                  v88 = 2114;
                  v89 = v48;
                  _os_log_error_impl(&dword_1B7802000, v52, OS_LOG_TYPE_ERROR, "%@: Failed to fetch device with ID: %{public}@", buf, 0x16u);
                }
              }

            }
            v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v90, 16);
          }
          while (v44);
        }
        v53 = v41;

        -[HDStandardTaskServer profile](v26, "profile");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "deviceManager");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v41;
        v8 = v63;
        objc_msgSend(v55, "devicesWithProperty:matchingValues:error:", v64, v63, &v69);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v69;

        if (v56)
        {
          objc_msgSend(v56, "allObjects");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v67;
          objc_msgSend(v67, "addObjectsFromArray:", v57);

          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v67);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v62;
          ((void (**)(id, void *, id))v62)[2](v62, v59, 0);

        }
        else
        {
          v10 = v62;
          v62[2](v62, 0, v41);
          v58 = v67;
        }

      }
      else
      {
        v10 = v62;
        v62[2](v62, 0, v41);
        v8 = v63;
      }

      v20 = v41;
      v9 = v64;
      v14 = v61;
    }
    else
    {
      v10[2](v10, 0, v20);
    }

    v15 = v20;
  }
  else
  {
    v10[2](v10, 0, v15);
  }

}

- (void)remote_fetchAllDevicesWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = (void (**)(id, void *, id))a3;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v6, "allDevicesWithError:", &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;

  v4[2](v4, v7, v8);
}

- (void)remote_deleteDevice:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, id);
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v6 = (void (**)(id, uint64_t, id))a4;
  v7 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v10 = objc_msgSend(v9, "deleteDevice:error:", v7, &v12);

  v11 = v12;
  v6[2](v6, v10, v11);

}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6600], "taskIdentifier");
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
