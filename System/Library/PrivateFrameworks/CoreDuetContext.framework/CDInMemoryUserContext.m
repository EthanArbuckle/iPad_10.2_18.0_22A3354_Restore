@implementation CDInMemoryUserContext

void __55___CDInMemoryUserContext_contextForDeviceWithDeviceID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "unsafe_contextForDeviceWithDeviceID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __72___CDInMemoryUserContext_valuesForKeyPaths_inContextsMatchingPredicate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v25;
    v17 = *(_QWORD *)v25;
    do
    {
      v5 = 0;
      v18 = v3;
      do
      {
        if (*(_QWORD *)v25 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v5);
        if (objc_msgSend(v6, "evaluatePredicate:", *(_QWORD *)(a1 + 40)))
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v8 = *(id *)(a1 + 48);
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v21;
            do
            {
              for (i = 0; i != v10; ++i)
              {
                if (*(_QWORD *)v21 != v11)
                  objc_enumerationMutation(v8);
                v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
                objc_msgSend(v6, "objectForKeyedSubscript:", v13);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                if (v14)
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v13);

              }
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v10);
          }

          v15 = *(void **)(a1 + 56);
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v7);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v16);

          v4 = v17;
          v3 = v18;
        }
        ++v5;
      }
      while (v5 != v3);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v3);
  }

}

void __36___CDInMemoryUserContext_allDevices__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[_CDDevice localDevice](_CDDevice, "localDevice");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  objc_msgSend(*(id *)(a1 + 40), "unsafe_remoteDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v2);

}

void __38___CDInMemoryUserContext_allDeviceIDs__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
  objc_msgSend(*(id *)(a1 + 40), "unsafe_remoteDeviceIDs");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    objc_msgSend(*(id *)(a1 + 32), "unionSet:", v2);

}

void __41___CDInMemoryUserContext_remoteDeviceIDs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "unsafe_remoteDeviceIDs");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __81___CDInMemoryUserContext_activateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  _BOOL4 v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  int v32;
  NSObject *v33;
  _BOOL4 v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id obj;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSObject *log;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  _BYTE v65[18];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __81___CDInMemoryUserContext_activateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 40), "unsafe_remoteDevicesByDeviceIDForRemoteUserContextProxySourceDeviceUUID:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v3, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = *(id *)(a1 + 32);
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
  if (v51)
  {
    v11 = *(_QWORD *)v61;
    *(_QWORD *)&v10 = 138412290;
    v44 = v10;
    v48 = a1;
    v49 = v3;
    v46 = v9;
    v47 = v6;
    v45 = *(_QWORD *)v61;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v61 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v12);
        objc_msgSend(v13, "deviceID", v44);
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v14);
        objc_msgSend(v9, "addObject:", v13);
        objc_msgSend(v3, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (void *)v14;
        objc_msgSend(*(id *)(a1 + 40), "unsafe_contextForDeviceWithDeviceID:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v15;
        v53 = v12;
        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
          log = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
            goto LABEL_13;
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)v65 = v55;
          v20 = log;
          v21 = "Activating new device %{public}@ in memory";
          goto LABEL_41;
        }
        v17 = objc_msgSend(v15, "isCompanion");
        v18 = objc_msgSend(v13, "isCompanion");
        objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
        log = objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(log, OS_LOG_TYPE_DEBUG);
        if (v17 != v18)
        {
          if (!v19)
          {
LABEL_13:

            objc_msgSend(v16, "setDevice:", v13);
            objc_msgSend(*(id *)(a1 + 40), "unsafe_multiDeviceRegistrations");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "mutableCopy");

            -[NSObject addObjectsFromArray:](v23, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
            log = v23;
            v24 = -[NSObject count](v23, "count");
            objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
            if (v24)
            {
              if (v26)
              {
                v36 = -[NSObject count](log, "count");
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v65 = v36;
                *(_WORD *)&v65[4] = 2112;
                *(_QWORD *)&v65[6] = v55;
                _os_log_debug_impl(&dword_18DD73000, v25, OS_LOG_TYPE_DEBUG, "Possibly registering %d existing multi-device registrations with device %@ in memory", buf, 0x12u);
              }

              v58 = 0u;
              v59 = 0u;
              v56 = 0u;
              v57 = 0u;
              v25 = log;
              v27 = -[NSObject countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
              if (v27)
              {
                v28 = v27;
                v29 = *(_QWORD *)v57;
                do
                {
                  for (i = 0; i != v28; ++i)
                  {
                    if (*(_QWORD *)v57 != v29)
                      objc_enumerationMutation(v25);
                    v31 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
                    v32 = objc_msgSend(v13, "matchesDeviceTypes:", objc_msgSend(v31, "deviceTypes"));
                    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
                    v33 = objc_claimAutoreleasedReturnValue();
                    v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG);
                    if (v32)
                    {
                      if (v34)
                      {
                        *(_DWORD *)buf = 138543618;
                        *(_QWORD *)v65 = v55;
                        *(_WORD *)&v65[8] = 2112;
                        *(_QWORD *)&v65[10] = v31;
                        _os_log_debug_impl(&dword_18DD73000, v33, OS_LOG_TYPE_DEBUG, "Registering existing multi-device registration with device %{public}@ in memory: %@", buf, 0x16u);
                      }

                      objc_msgSend(v16, "registerCallback:", v31);
                    }
                    else
                    {
                      if (v34)
                      {
                        *(_DWORD *)buf = 138543618;
                        *(_QWORD *)v65 = v55;
                        *(_WORD *)&v65[8] = 2112;
                        *(_QWORD *)&v65[10] = v31;
                        _os_log_debug_impl(&dword_18DD73000, v33, OS_LOG_TYPE_DEBUG, "Skipping existing multi-device registration because device type does not match for device %{public}@ in memory: %@", buf, 0x16u);
                      }

                    }
                  }
                  v28 = -[NSObject countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
                }
                while (v28);
                a1 = v48;
                v3 = v49;
                v9 = v46;
                v6 = v47;
                v11 = v45;
              }
              v35 = v53;
            }
            else
            {
              v35 = v53;
              if (v26)
              {
                *(_DWORD *)buf = v44;
                *(_QWORD *)v65 = v55;
                _os_log_debug_impl(&dword_18DD73000, v25, OS_LOG_TYPE_DEBUG, "No existing multi-device registrations to register with device %@ in memory", buf, 0xCu);
              }
            }

            goto LABEL_38;
          }
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)v65 = v55;
          v20 = log;
          v21 = "Activating existing device %{public}@ in memory";
LABEL_41:
          _os_log_debug_impl(&dword_18DD73000, v20, OS_LOG_TYPE_DEBUG, v21, buf, 0xCu);
          goto LABEL_13;
        }
        if (v19)
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)v65 = v55;
          _os_log_debug_impl(&dword_18DD73000, log, OS_LOG_TYPE_DEBUG, "No need to activate already-active device %{public}@ in memory", buf, 0xCu);
        }
        v35 = v53;
LABEL_38:

        v12 = v35 + 1;
      }
      while (v12 != v51);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
      v51 = v37;
    }
    while (v37);
  }

  v38 = objc_msgSend(v3, "count");
  if (v38 != objc_msgSend(v6, "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDContextQueries keyPathForMDCSDeviceIDsWithProxySourceDeviceUUID:](_CDContextQueries, "keyPathForMDCSDeviceIDsWithProxySourceDeviceUUID:", *(_QWORD *)(a1 + 48));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v41, v40);

    +[_CDContextQueries keyPathForMDCSDevicesWithProxySourceDeviceUUID:](_CDContextQueries, "keyPathForMDCSDevicesWithProxySourceDeviceUUID:", *(_QWORD *)(a1 + 48));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v43, v42);

  }
}

void __43___CDInMemoryUserContext_registerCallback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __43___CDInMemoryUserContext_registerCallback___block_invoke_cold_2(a1);

  if (!*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __43___CDInMemoryUserContext_registerCallback___block_invoke_cold_1(a1, v3);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 24), "addObject:", *(_QWORD *)(a1 + 48));
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v24;
    *(_QWORD *)&v6 = 138543618;
    v22 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9);
        v11 = *(void **)(a1 + 40);
        if (!v11 || objc_msgSend(v11, "containsObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9)))
        {
          objc_msgSend(*(id *)(a1 + 56), "deviceWithDeviceID:fromDevices:", v10, *(_QWORD *)(a1 + 64), v22, (_QWORD)v23);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "matchesDeviceTypes:", objc_msgSend(*(id *)(a1 + 48), "deviceTypes")))
          {
            objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              v19 = *(_QWORD *)(a1 + 48);
              *(_DWORD *)buf = v22;
              v28 = v10;
              v29 = 2112;
              v30 = v19;
              _os_log_debug_impl(&dword_18DD73000, v13, OS_LOG_TYPE_DEBUG, "Registering multi-device registration callback with device %{public}@: %@", buf, 0x16u);
            }

            objc_msgSend(*(id *)(a1 + 56), "unsafe_contextForDeviceWithDeviceID:", v10);
            v14 = objc_claimAutoreleasedReturnValue();
            -[NSObject registerCallback:](v14, "registerCallback:", *(_QWORD *)(a1 + 48));
            goto LABEL_22;
          }
          objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
          if (v12)
          {
            if (v15)
            {
              v16 = *(_QWORD *)(a1 + 48);
              *(_DWORD *)buf = v22;
              v28 = v10;
              v29 = 2112;
              v30 = v16;
              v17 = v14;
              v18 = "Not registering non-matching multi-device registration callback with device %{public}@: %@";
              goto LABEL_26;
            }
          }
          else if (v15)
          {
            v20 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = v22;
            v28 = v10;
            v29 = 2112;
            v30 = v20;
            v17 = v14;
            v18 = "Not registering multi-device registration callback with unknown device %{public}@: %@";
LABEL_26:
            _os_log_debug_impl(&dword_18DD73000, v17, OS_LOG_TYPE_DEBUG, v18, buf, 0x16u);
          }
LABEL_22:

        }
        ++v9;
      }
      while (v7 != v9);
      v21 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      v7 = v21;
    }
    while (v21);
  }

}

void __45___CDInMemoryUserContext_deregisterCallback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __45___CDInMemoryUserContext_deregisterCallback___block_invoke_cold_1(a1);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 24), "removeObject:", *(_QWORD *)(a1 + 48));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v22;
    *(_QWORD *)&v5 = 138543618;
    v20 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v8);
        objc_msgSend(*(id *)(a1 + 56), "deviceWithDeviceID:fromDevices:", v9, *(_QWORD *)(a1 + 64), v20, (_QWORD)v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "matchesDeviceTypes:", objc_msgSend(*(id *)(a1 + 48), "deviceTypes")))
        {
          objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            v17 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = v20;
            v26 = v9;
            v27 = 2112;
            v28 = v17;
            _os_log_debug_impl(&dword_18DD73000, v11, OS_LOG_TYPE_DEBUG, "Deregistering multi-device registration callback with device %{public}@: %@", buf, 0x16u);
          }

          objc_msgSend(*(id *)(a1 + 56), "unsafe_contextForDeviceWithDeviceID:", v9);
          v12 = objc_claimAutoreleasedReturnValue();
          -[NSObject deregisterCallback:](v12, "deregisterCallback:", *(_QWORD *)(a1 + 48));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
          if (v10)
          {
            if (!v13)
              goto LABEL_16;
            v14 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = v20;
            v26 = v9;
            v27 = 2112;
            v28 = v14;
            v15 = v12;
            v16 = "Not de-registering non-matching multi-device registration callback with device %{public}@: %@";
          }
          else
          {
            if (!v13)
              goto LABEL_16;
            v18 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = v20;
            v26 = v9;
            v27 = 2112;
            v28 = v18;
            v15 = v12;
            v16 = "Not de-registering multi-device registration callback with unknown device %{public}@: %@";
          }
          _os_log_debug_impl(&dword_18DD73000, v15, OS_LOG_TYPE_DEBUG, v16, buf, 0x16u);
        }
LABEL_16:

        ++v8;
      }
      while (v6 != v8);
      v19 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      v6 = v19;
    }
    while (v19);
  }

}

uint64_t __53___CDInMemoryUserContext_hasMultiDeviceRegistrations__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "unsafe_hasMultiDeviceRegistrations");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __37___CDInMemoryUserContext_description__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("User Context: %@"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37___CDInMemoryUserContext_description__block_invoke_2;
  v4[3] = &unk_1E26D4FF8;
  v5 = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

uint64_t __37___CDInMemoryUserContext_description__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\nDevice %@ context: %@"), a2, a3);
}

void __81___CDInMemoryUserContext_activateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v3;
  void *v4;
  _DWORD v5[2];
  __int16 v6;
  void *v7;

  v3 = OUTLINED_FUNCTION_2_1(a1);
  _CDPrettyPrintCollection();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 67109378;
  v5[1] = v3;
  v6 = 2114;
  v7 = v4;
  _os_log_debug_impl(&dword_18DD73000, a2, OS_LOG_TYPE_DEBUG, "Activating %d devices in memory: %{public}@", (uint8_t *)v5, 0x12u);

  OUTLINED_FUNCTION_1_1();
}

void __43___CDInMemoryUserContext_registerCallback___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 48);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_18DD73000, a2, OS_LOG_TYPE_DEBUG, "Pending all device multi-device registration callback: %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __43___CDInMemoryUserContext_registerCallback___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_0(&dword_18DD73000, v1, v2, "Registering with up to %d devices (%d named) multi-device registration callback: %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_1();
}

void __45___CDInMemoryUserContext_deregisterCallback___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2_1(a1);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_0(&dword_18DD73000, v1, v2, "Possibly deregistering multi-device registration callback with %d (%d named) devices: %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_1();
}

@end
