@implementation MRAVOutputContext

- (NSArray)outputDevices
{
  MRAVOutputContext *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSArray copy](v2->_outputDevices, "copy");
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)_notifyChangesInOutputDevicesWithAdded:(id)a3 removed:(id)a4 updated:(id)a5 previous:(id)a6 newDevices:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t m;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  char v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  void *v53;
  int v54;
  NSObject *v55;
  void *v56;
  int v57;
  NSObject *v58;
  void *v59;
  int v60;
  NSObject *v61;
  void *v62;
  void *v64;
  id v65;
  id v66;
  id obj;
  uint64_t v68;
  id v69;
  MRAVOutputContext *v70;
  id v71;
  id v72;
  id v73;
  _QWORD v74[5];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint8_t buf[4];
  id v96;
  __int16 v97;
  MRAVOutputContext *v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = self;
  objc_msgSend(v17, "postNotificationName:object:", CFSTR("kMRAVOutputContextDevicesDidChangeNotification"), self);

  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v18 = v13;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v92;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v92 != v21)
          objc_enumerationMutation(v18);
        -[MRAVOutputContext _notfiyOutputDeviceRemoved:](self, "_notfiyOutputDeviceRemoved:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i));
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
    }
    while (v20);
  }

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = v12;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v88;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v88 != v25)
          objc_enumerationMutation(obj);
        -[MRAVOutputContext _notifyOutputDeviceAdded:](self, "_notifyOutputDeviceAdded:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * j));
      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
    }
    while (v24);
  }

  if (objc_msgSend(obj, "count") || objc_msgSend(v18, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "postNotificationName:object:userInfo:", CFSTR("MRAVOutputContextOutputDevicesDidChangeNotification"), self, 0);

  }
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v66 = v16;
  v28 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
  if (v28)
  {
    v29 = v28;
    v30 = 0;
    v31 = *(_QWORD *)v84;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v84 != v31)
          objc_enumerationMutation(v66);
        v30 += objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * k), "isPersonalRoute");
      }
      v29 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
    }
    while (v29);
  }
  else
  {
    v30 = 0;
  }

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v69 = v15;
  v33 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v79, v100, 16);
  if (v33)
  {
    v34 = v33;
    v35 = 0;
    v36 = *(_QWORD *)v80;
    do
    {
      for (m = 0; m != v34; ++m)
      {
        if (*(_QWORD *)v80 != v36)
          objc_enumerationMutation(v69);
        v35 += objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * m), "isPersonalRoute");
      }
      v34 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v79, v100, 16);
    }
    while (v34);
  }
  else
  {
    v35 = 0;
  }

  if (v30 > v35)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "postNotificationName:object:", CFSTR("MRAVOutputContextDidAddPersonalDeviceNotification"), self);

  }
  v64 = v18;
  if (v30 < v35)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "postNotificationName:object:", CFSTR("MRAVOutputContextDidRemovePersonalDeviceNotification"), self);

  }
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v65 = v14;
  v40 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v75, v99, 16);
  if (v40)
  {
    v41 = v40;
    v42 = MEMORY[0x1E0C809B0];
    v68 = *(_QWORD *)v76;
    do
    {
      v43 = 0;
      do
      {
        if (*(_QWORD *)v76 != v68)
          objc_enumerationMutation(v65);
        v44 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v43);
        v74[0] = v42;
        v74[1] = 3221225472;
        v74[2] = __96__MRAVOutputContext__notifyChangesInOutputDevicesWithAdded_removed_updated_previous_newDevices___block_invoke;
        v74[3] = &unk_1E30C5F68;
        v74[4] = v44;
        objc_msgSend(v69, "msv_firstWhere:", v74);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v45)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, v70, CFSTR("MRAVOutputContext.m"), 398, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("previousOutputDevice"));

        }
        if (_notifyChangesInOutputDevicesWithAdded_removed_updated_previous_newDevices__onceToken != -1)
          dispatch_once(&_notifyChangesInOutputDevicesWithAdded_removed_updated_previous_newDevices__onceToken, &__block_literal_global_101);
        v72 = 0;
        v73 = 0;
        v71 = 0;
        v46 = objc_msgSend(v45, "isEqualToOutputDevice:denyList:addedProperties:removedProperties:changedProperties:", v44, _notifyChangesInOutputDevicesWithAdded_removed_updated_previous_newDevices__denyList, &v73, &v72, &v71);
        v47 = v73;
        v48 = v72;
        v49 = v71;
        if ((v46 & 1) == 0)
        {
          v50 = v41;
          if (-[MRAVOutputContext shouldLog](v70, "shouldLog"))
          {
            _MRLogForCategory(0);
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v44, "debugName");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v96 = v52;
              v97 = 2114;
              v98 = v70;
              _os_log_impl(&dword_193827000, v51, OS_LOG_TYPE_DEFAULT, "[OutputContext] Updated outputDevice %{public}@ for context: %{public}@", buf, 0x16u);

            }
            if (objc_msgSend(v47, "count"))
            {
              +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = objc_msgSend(v53, "verboseOutputContextLogging");

              if (v54)
              {
                MRLogCategoryDiscoveryOversize();
                v55 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v96 = v47;
                  _os_log_impl(&dword_193827000, v55, OS_LOG_TYPE_DEFAULT, "[OutputContext] Added Fields: %{public}@", buf, 0xCu);
                }

              }
            }
            if (objc_msgSend(v48, "count"))
            {
              +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = objc_msgSend(v56, "verboseOutputContextLogging");

              if (v57)
              {
                MRLogCategoryDiscoveryOversize();
                v58 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v96 = v48;
                  _os_log_impl(&dword_193827000, v58, OS_LOG_TYPE_DEFAULT, "[OutputContext] Removed Fields: %{public}@", buf, 0xCu);
                }

              }
            }
            if (objc_msgSend(v49, "count"))
            {
              +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = objc_msgSend(v59, "verboseOutputContextLogging");

              if (v60)
              {
                MRLogCategoryDiscoveryOversize();
                v61 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v96 = v49;
                  _os_log_impl(&dword_193827000, v61, OS_LOG_TYPE_DEFAULT, "[OutputContext] Changed Values: %{public}@", buf, 0xCu);
                }

              }
            }
          }
          -[MRAVOutputContext _notifyOutputDeviceChanged:](v70, "_notifyOutputDeviceChanged:", v44);
          v41 = v50;
        }

        ++v43;
      }
      while (v41 != v43);
      v41 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v75, v99, 16);
    }
    while (v41);
  }

}

- (void)_scheduleOutputContextDidChangeNotification
{
  MRAVOutputContext *v2;
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_postChangedScheduled)
  {
    v2->_postChangedScheduled = 1;
    v3 = dispatch_time(0, 100000000);
    objc_msgSend((id)objc_opt_class(), "notificationQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__MRAVOutputContext__scheduleOutputContextDidChangeNotification__block_invoke;
    block[3] = &unk_1E30C5CA8;
    block[4] = v2;
    dispatch_after(v3, v4, block);

  }
  objc_sync_exit(v2);

}

- (void)_reloadWithOutputDevices:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  -[MRAVOutputContext outputDevicesSnapshot](self, "outputDevicesSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRAVOutputContext setOutputDevices:](self, "setOutputDevices:", v5);
  v8 = (void *)MEMORY[0x1E0C99E60];
  -[MRAVOutputContext outputDevicesSnapshot](self, "outputDevicesSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v5, "count");
  if (v11 != objc_msgSend(v10, "count"))
  {
    _MRLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MRAVOutputContext _reloadWithOutputDevices:].cold.1(v12);

  }
  objc_msgSend(v7, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mr_allOutputDevices");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mr_allOutputDevices");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVOutputContext _compareOutputDeviceList:withNewOutputDeviceList:](self, "_compareOutputDeviceList:withNewOutputDeviceList:", v14, v16);

}

- (NSArray)outputDevicesSnapshot
{
  MRAVOutputContext *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSArray copy](v2->_outputDevicesSnapshot, "copy");
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)setOutputDevices:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  MRAVDistantOutputDevice *v12;
  void *v13;
  MRAVDistantOutputDevice *v14;
  MRAVOutputContext *v15;
  NSArray *outputDevices;
  NSArray *v17;
  NSArray *outputDevicesSnapshot;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = (NSArray *)v4;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
        v12 = [MRAVDistantOutputDevice alloc];
        objc_msgSend(v11, "descriptor", (_QWORD)v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[MRAVDistantOutputDevice initWithDescriptor:](v12, "initWithDescriptor:", v13);
        -[NSArray addObject:](v5, "addObject:", v14);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v15 = self;
  objc_sync_enter(v15);
  outputDevices = v15->_outputDevices;
  v15->_outputDevices = v6;
  v17 = v6;

  outputDevicesSnapshot = v15->_outputDevicesSnapshot;
  v15->_outputDevicesSnapshot = v5;

  objc_sync_exit(v15);
}

- (void)_compareOutputDeviceList:(id)a3 withNewOutputDeviceList:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v52 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v12 = v6;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v48;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v48 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
              if (objc_msgSend(v11, "isEqualFuzzy:", v17))
              {
                objc_msgSend(v37, "addObject:", v17);

                goto LABEL_16;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
            if (v14)
              continue;
            break;
          }
        }

        objc_msgSend(v36, "addObject:", v11);
LABEL_16:
        ;
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    }
    while (v8);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v18 = v6;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v44;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v44 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * k);
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v24 = obj;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v40;
          while (2)
          {
            for (m = 0; m != v26; ++m)
            {
              if (*(_QWORD *)v40 != v27)
                objc_enumerationMutation(v24);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * m), "isEqualFuzzy:", v23) & 1) != 0)
              {

                goto LABEL_33;
              }
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
            if (v26)
              continue;
            break;
          }
        }

        objc_msgSend(v35, "addObject:", v23);
LABEL_33:
        ;
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
    }
    while (v20);
  }

  objc_msgSend((id)objc_opt_class(), "notificationQueue");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v18;
  v31 = obj;
  v32 = v37;
  v33 = v36;
  v34 = v35;
  msv_dispatch_async_on_queue();

}

+ (OS_dispatch_queue)notificationQueue
{
  if (notificationQueue___once != -1)
    dispatch_once(&notificationQueue___once, &__block_literal_global_89_0);
  return (OS_dispatch_queue *)(id)notificationQueue_queue;
}

+ (id)sharedAudioPresentationContext
{
  return +[MRAVConcreteOutputContext sharedAudioPresentationContext](MRAVConcreteOutputContext, "sharedAudioPresentationContext");
}

uint64_t __70__MRAVOutputContext__compareOutputDeviceList_withNewOutputDeviceList___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyChangesInOutputDevicesWithAdded:removed:updated:previous:newDevices:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

void __64__MRAVOutputContext__scheduleOutputContextDidChangeNotification__block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) = 0;
  objc_sync_exit(v2);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("MRAVOutputContextDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_notifyOutputDeviceAdded:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  id v20;
  const __CFString *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  MRAVOutputContext *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[MRAVOutputContext shouldLog](self, "shouldLog"))
  {
    _MRLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "debugName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v6;
      v25 = 2114;
      v26 = self;
      _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[OutputContext] Added outputDevice %{public}@ for context: %{public}@", buf, 0x16u);

    }
    +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "verboseOutputContextLogging");

    if (v8)
    {
      MRLogCategoryDiscoveryOversize();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "descriptor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v10;
        v25 = 2114;
        v26 = self;
        _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[OutputContext] Added outputDevice %{public}@ for context: %{public}@", buf, 0x16u);

      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = CFSTR("MRAVOutputContextOutputDeviceUserInfoKey");
  v22 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("MRAVOutputContextDidAddOutputDeviceNotification"), self, v12);

  if (objc_msgSend(v4, "isLocalDevice"))
  {
    if (-[MRAVOutputContext shouldLog](self, "shouldLog"))
    {
      +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "verboseOutputContextLogging");

      if (v14)
      {
        MRLogCategoryDiscoveryOversize();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "debugName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v24 = v16;
          v25 = 2114;
          v26 = self;
          _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_DEFAULT, "[OutputContext] Added localOutputDevice %{public}@ for context: %{public}@", buf, 0x16u);

        }
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = CFSTR("MRAVOutputContextOutputDeviceUserInfoKey");
    v20 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("MRAVOutputContextDidAddLocalDeviceNotification"), self, v18);

  }
}

- (BOOL)shouldLog
{
  return (MRProcessIsMediaRemoteDaemon() & 1) != 0 || -[MRAVOutputContext type](self, "type") == 3;
}

void __38__MRAVOutputContext_notificationQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.MRAVOutputContext.notificationQueue", v2);
  v1 = (void *)notificationQueue_queue;
  notificationQueue_queue = (uint64_t)v0;

}

- (NSString)uniqueIdentifier
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVOutputContext uniqueIdentifier]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (NSString)contextID
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVOutputContext contextID]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (unsigned)type
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVOutputContext type]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (NSArray)outputDeviceUIDs
{
  void *v2;
  void *v3;

  -[MRAVOutputContext outputDevices](self, "outputDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mr_compactMap:", &__block_literal_global_54);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __37__MRAVOutputContext_outputDeviceUIDs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uid");
}

- (NSArray)personalDevices
{
  void *v2;
  void *v3;

  -[MRAVOutputContext outputDevices](self, "outputDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mr_compactMap:", &__block_literal_global_85_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __36__MRAVOutputContext_personalDevices__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "isPersonalRoute"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSArray)personalDeviceUIDs
{
  void *v2;
  void *v3;

  -[MRAVOutputContext personalDevices](self, "personalDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mr_compactMap:", &__block_literal_global_86_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __39__MRAVOutputContext_personalDeviceUIDs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uid");
}

- (BOOL)containsOutputDevice:(id)a3
{
  void *v4;

  objc_msgSend(a3, "uid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[MRAVOutputContext containsOutputDeviceUID:](self, "containsOutputDeviceUID:", v4);

  return (char)self;
}

- (BOOL)containsOutputDeviceUID:(id)a3
{
  void *v3;
  BOOL v4;

  -[MRAVOutputContext outputDeviceForUID:](self, "outputDeviceForUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)outputDeviceForUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[MRAVOutputContext outputDevices](self, "outputDevices", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "containsUID:", v4) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)containsLocalDevice
{
  void *v3;

  v3 = (void *)MRMediaRemoteCopyDeviceUID();
  LOBYTE(self) = -[MRAVOutputContext containsOutputDeviceUID:](self, "containsOutputDeviceUID:", v3);

  return (char)self;
}

- (MRAVOutputDevice)predictedOutputDevice
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVOutputContext predictedOutputDevice]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (unsigned)volumeControlCapabilities
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVOutputContext volumeControlCapabilities]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (BOOL)isVolumeControlAvailable
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVOutputContext isVolumeControlAvailable]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (BOOL)supportsVolumeControl
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVOutputContext supportsVolumeControl]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (float)volume
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVOutputContext volume]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (void)setVolume:(float)a3
{
  -[MRAVOutputContext setVolume:details:](self, "setVolume:details:", 0);
}

- (void)setVolume:(float)a3 details:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVOutputContext setVolume:details:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (void)setVolumeMuted:(BOOL)a3
{
  -[MRAVOutputContext setVolumeMuted:details:](self, "setVolumeMuted:details:", a3, 0);
}

- (void)setVolumeMuted:(BOOL)a3 details:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVOutputContext setVolumeMuted:details:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (BOOL)isVolumeMuted
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVOutputContext isVolumeMuted]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (void)adjustVolume:(int64_t)a3 details:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVOutputContext adjustVolume:details:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (BOOL)supportsMultipleBluetoothOutputDevices
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVOutputContext supportsMultipleBluetoothOutputDevices]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (void)modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C99DA0];
  v11 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVOutputContext modifyTopologyWithRequest:withReplyQueue:completion:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (void)resetPredictedOutputDevice
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVOutputContext resetPredictedOutputDevice]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

+ (id)sharedSystemAudioContext
{
  return +[MRAVConcreteOutputContext sharedSystemAudioContext](MRAVConcreteOutputContext, "sharedSystemAudioContext");
}

+ (id)sharedSystemScreenContext
{
  return +[MRAVConcreteOutputContext sharedSystemScreenContext](MRAVConcreteOutputContext, "sharedSystemScreenContext");
}

+ (id)iTunesContext
{
  return +[MRAVConcreteOutputContext iTunesContext](MRAVConcreteOutputContext, "iTunesContext");
}

- (void)_scheduleOutputContextDeviceDidChangeNotification
{
  MRAVOutputContext *v2;
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_postOutputDeviceChangedScheduled)
  {
    v2->_postOutputDeviceChangedScheduled = 1;
    v3 = dispatch_time(0, 300000000);
    objc_msgSend((id)objc_opt_class(), "notificationQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__MRAVOutputContext__scheduleOutputContextDeviceDidChangeNotification__block_invoke;
    block[3] = &unk_1E30C5CA8;
    block[4] = v2;
    dispatch_after(v3, v4, block);

  }
  objc_sync_exit(v2);

}

uint64_t __70__MRAVOutputContext__scheduleOutputContextDeviceDidChangeNotification__block_invoke(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  objc_sync_exit(v2);

  return objc_msgSend(*(id *)(a1 + 32), "_reloadOutputDevices");
}

- (void)_scheduleOutputContextDevicesDidChangeNotification
{
  MRAVOutputContext *v2;
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_postOutputDevicesChangedScheduled)
  {
    v2->_postOutputDevicesChangedScheduled = 1;
    v3 = dispatch_time(0, 100000000);
    objc_msgSend((id)objc_opt_class(), "notificationQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__MRAVOutputContext__scheduleOutputContextDevicesDidChangeNotification__block_invoke;
    block[3] = &unk_1E30C5CA8;
    block[4] = v2;
    dispatch_after(v3, v4, block);

  }
  objc_sync_exit(v2);

}

uint64_t __71__MRAVOutputContext__scheduleOutputContextDevicesDidChangeNotification__block_invoke(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = 0;
  objc_sync_exit(v2);

  return objc_msgSend(*(id *)(a1 + 32), "_reloadOutputDevices");
}

- (void)_reloadOutputDevices
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRAVOutputContext _reloadOutputDevices]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

uint64_t __96__MRAVOutputContext__notifyChangesInOutputDevicesWithAdded_removed_updated_previous_newDevices___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualFuzzy:", *(_QWORD *)(a1 + 32));
}

void __96__MRAVOutputContext__notifyChangesInOutputDevicesWithAdded_removed_updated_previous_newDevices___block_invoke_2()
{
  void *v0;

  v0 = (void *)_notifyChangesInOutputDevicesWithAdded_removed_updated_previous_newDevices__denyList;
  _notifyChangesInOutputDevicesWithAdded_removed_updated_previous_newDevices__denyList = (uint64_t)&unk_1E3143BA8;

}

- (void)_notfiyOutputDeviceRemoved:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  id v16;
  const __CFString *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  MRAVOutputContext *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[MRAVOutputContext shouldLog](self, "shouldLog"))
  {
    _MRLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "debugName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v6;
      v21 = 2114;
      v22 = self;
      _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[OutputContext] Removed outputDevice %{public}@ for context: %{public}@", buf, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("MRAVOutputContextOutputDeviceUserInfoKey");
  v18 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MRAVOutputContextDidRemoveOutputDeviceNotification"), self, v8);

  if (objc_msgSend(v4, "isLocalDevice"))
  {
    if (-[MRAVOutputContext shouldLog](self, "shouldLog"))
    {
      +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "verboseOutputContextLogging");

      if (v10)
      {
        MRLogCategoryDiscoveryOversize();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "debugName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v20 = v12;
          v21 = 2114;
          v22 = self;
          _os_log_impl(&dword_193827000, v11, OS_LOG_TYPE_DEFAULT, "[OutputContext] Removed localOutputDevice %{public}@ for context: %{public}@", buf, 0x16u);

        }
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("MRAVOutputContextOutputDeviceUserInfoKey");
    v16 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("MRAVOutputContextDidRemoveLocalDeviceNotification"), self, v14);

  }
}

- (void)_notifyOutputDeviceChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("MRAVOutputContextOutputDeviceUserInfoKey");
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("MRAVOutputContextOutputDeviceDidChangeNotification"), self, v6);

  if (objc_msgSend(v4, "isLocalDevice"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("MRAVOutputContextOutputDeviceUserInfoKey");
    v10 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MRAVOutputContextLocalDeviceDidChangeNotification"), self, v8);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDevicesSnapshot, 0);
  objc_storeStrong((id *)&self->_outputDevices, 0);
}

- (void)addOutputDevices:(id)a3 withCallbackQueue:(id)a4 block:(id)a5
{
  -[MRAVOutputContext addOutputDevices:initiator:withCallbackQueue:block:](self, "addOutputDevices:initiator:withCallbackQueue:block:", a3, 0, a4, a5);
}

- (void)addOutputDevices:(id)a3 initiator:(id)a4 withCallbackQueue:(id)a5 block:(id)a6
{
  -[MRAVOutputContext addOutputDevices:initiator:fadeAudio:withCallbackQueue:block:](self, "addOutputDevices:initiator:fadeAudio:withCallbackQueue:block:", a3, a4, 0, a5, a6);
}

- (void)addOutputDevices:(id)a3 initiator:(id)a4 fadeAudio:(BOOL)a5 withCallbackQueue:(id)a6 block:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  MRRequestDetails *v16;
  void *v17;
  void *v18;
  MRRequestDetails *v19;
  MRGroupTopologyModificationRequest *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v8 = a5;
  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = [MRRequestDetails alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[MRRequestDetails initWithName:requestID:reason:](v16, "initWithName:requestID:reason:", CFSTR("OutputContext.addOutputDevices"), v18, v14);

  v20 = -[MRGroupTopologyModificationRequest initWithRequestDetails:type:outputDevices:]([MRGroupTopologyModificationRequest alloc], "initWithRequestDetails:type:outputDevices:", v19, 1, v15);
  -[MRGroupTopologyModificationRequest setFadeAudio:](v20, "setFadeAudio:", v8);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __94__MRAVOutputContext_Deprecated__addOutputDevices_initiator_fadeAudio_withCallbackQueue_block___block_invoke;
  v22[3] = &unk_1E30C6798;
  v23 = v12;
  v21 = v12;
  -[MRAVOutputContext modifyTopologyWithRequest:withReplyQueue:completion:](self, "modifyTopologyWithRequest:withReplyQueue:completion:", v20, v13, v22);

}

uint64_t __94__MRAVOutputContext_Deprecated__addOutputDevices_initiator_fadeAudio_withCallbackQueue_block___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setOutputDevices:(id)a3 withCallbackQueue:(id)a4 block:(id)a5
{
  -[MRAVOutputContext setOutputDevices:initiator:withCallbackQueue:block:](self, "setOutputDevices:initiator:withCallbackQueue:block:", a3, 0, a4, a5);
}

- (void)setOutputDevices:(id)a3 initiator:(id)a4 withCallbackQueue:(id)a5 block:(id)a6
{
  -[MRAVOutputContext setOutputDevices:initiator:password:fadeAudio:withCallbackQueue:block:](self, "setOutputDevices:initiator:password:fadeAudio:withCallbackQueue:block:", a3, a4, 0, 0, a5, a6);
}

- (void)setOutputDevices:(id)a3 withPassword:(id)a4 withCallbackQueue:(id)a5 block:(id)a6
{
  -[MRAVOutputContext setOutputDevices:initiator:password:fadeAudio:withCallbackQueue:block:](self, "setOutputDevices:initiator:password:fadeAudio:withCallbackQueue:block:", a3, 0, a4, 0, a5, a6);
}

- (void)setOutputDevices:(id)a3 initiator:(id)a4 password:(id)a5 fadeAudio:(BOOL)a6 withCallbackQueue:(id)a7 block:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  MRRequestDetails *v19;
  void *v20;
  void *v21;
  MRRequestDetails *v22;
  MRGroupTopologyModificationRequest *v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v9 = a6;
  v14 = a8;
  v15 = a7;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = [MRRequestDetails alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "UUIDString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[MRRequestDetails initWithName:requestID:reason:](v19, "initWithName:requestID:reason:", CFSTR("OutputContext.setOutputDevices"), v21, v17);

  v23 = -[MRGroupTopologyModificationRequest initWithRequestDetails:type:outputDevices:]([MRGroupTopologyModificationRequest alloc], "initWithRequestDetails:type:outputDevices:", v22, 3, v18);
  -[MRGroupTopologyModificationRequest setFadeAudio:](v23, "setFadeAudio:", v9);
  -[MRGroupTopologyModificationRequest setPassword:](v23, "setPassword:", v16);

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __103__MRAVOutputContext_Deprecated__setOutputDevices_initiator_password_fadeAudio_withCallbackQueue_block___block_invoke;
  v25[3] = &unk_1E30C6798;
  v26 = v14;
  v24 = v14;
  -[MRAVOutputContext modifyTopologyWithRequest:withReplyQueue:completion:](self, "modifyTopologyWithRequest:withReplyQueue:completion:", v23, v15, v25);

}

uint64_t __103__MRAVOutputContext_Deprecated__setOutputDevices_initiator_password_fadeAudio_withCallbackQueue_block___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeOutputDevices:(id)a3 withCallbackQueue:(id)a4 block:(id)a5
{
  -[MRAVOutputContext removeOutputDevices:initiator:withCallbackQueue:block:](self, "removeOutputDevices:initiator:withCallbackQueue:block:", a3, 0, a4, a5);
}

- (void)removeOutputDevices:(id)a3 initiator:(id)a4 withCallbackQueue:(id)a5 block:(id)a6
{
  -[MRAVOutputContext removeOutputDevices:initiator:fadeAudio:withCallbackQueue:block:](self, "removeOutputDevices:initiator:fadeAudio:withCallbackQueue:block:", a3, a4, 0, a5, a6);
}

- (void)removeOutputDevices:(id)a3 initiator:(id)a4 fadeAudio:(BOOL)a5 withCallbackQueue:(id)a6 block:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  MRRequestDetails *v16;
  void *v17;
  void *v18;
  MRRequestDetails *v19;
  MRGroupTopologyModificationRequest *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v8 = a5;
  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = [MRRequestDetails alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[MRRequestDetails initWithName:requestID:reason:](v16, "initWithName:requestID:reason:", CFSTR("OutputContext.removeOutputDevices"), v18, v14);

  v20 = -[MRGroupTopologyModificationRequest initWithRequestDetails:type:outputDevices:]([MRGroupTopologyModificationRequest alloc], "initWithRequestDetails:type:outputDevices:", v19, 2, v15);
  -[MRGroupTopologyModificationRequest setFadeAudio:](v20, "setFadeAudio:", v8);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __97__MRAVOutputContext_Deprecated__removeOutputDevices_initiator_fadeAudio_withCallbackQueue_block___block_invoke;
  v22[3] = &unk_1E30C6798;
  v23 = v12;
  v21 = v12;
  -[MRAVOutputContext modifyTopologyWithRequest:withReplyQueue:completion:](self, "modifyTopologyWithRequest:withReplyQueue:completion:", v20, v13, v22);

}

uint64_t __97__MRAVOutputContext_Deprecated__removeOutputDevices_initiator_fadeAudio_withCallbackQueue_block___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeAllOutputDevicesWithCallbackQueue:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  MRRequestDetails *v8;
  void *v9;
  void *v10;
  MRRequestDetails *v11;
  MRGroupTopologyModificationRequest *v12;
  void *v13;
  MRGroupTopologyModificationRequest *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v7 = a3;
  v8 = [MRRequestDetails alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MRRequestDetails initWithName:requestID:reason:](v8, "initWithName:requestID:reason:", CFSTR("OutputContext.removeAllOutputDevices"), v10, 0);

  v12 = [MRGroupTopologyModificationRequest alloc];
  -[MRAVOutputContext outputDevices](self, "outputDevices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MRGroupTopologyModificationRequest initWithRequestDetails:type:outputDevices:](v12, "initWithRequestDetails:type:outputDevices:", v11, 2, v13);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__MRAVOutputContext_Deprecated__removeAllOutputDevicesWithCallbackQueue_block___block_invoke;
  v16[3] = &unk_1E30C6798;
  v17 = v6;
  v15 = v6;
  -[MRAVOutputContext modifyTopologyWithRequest:withReplyQueue:completion:](self, "modifyTopologyWithRequest:withReplyQueue:completion:", v14, v7, v16);

}

uint64_t __79__MRAVOutputContext_Deprecated__removeAllOutputDevicesWithCallbackQueue_block___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_reloadWithOutputDevices:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193827000, log, OS_LOG_TYPE_ERROR, "[OutputContext] Output devices became nil during processing", v1, 2u);
}

@end
