@implementation NEVPNConnectivityManager

- (unint64_t)visibilityStyle
{
  return self->_visibilityStyle;
}

- (unint64_t)connectivityState
{
  return self->_connectivityState;
}

- (BOOL)usesPolicyBasedRouting
{
  return self->_usesPolicyBasedRouting;
}

- (void)setVisibilityStyle:(unint64_t)a3
{
  self->_visibilityStyle = a3;
}

- (void)setUsesPolicyBasedRouting:(BOOL)a3
{
  self->_usesPolicyBasedRouting = a3;
}

- (void)setHasRelayConfigurations:(BOOL)a3
{
  self->_hasRelayConfigurations = a3;
}

- (void)setConnectivityState:(unint64_t)a3
{
  self->_connectivityState = a3;
}

- (NEVPNConnectivityManagerDelegate)delegate
{
  return (NEVPNConnectivityManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

void __45__NEVPNConnectivityManager_initWithDelegate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  const char *v4;
  uint8_t v5[16];

  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEFAULT, "NEVPNConnectivityManager: Configurations changed", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[NEVPNConnectivityManager refreshConfigurations](WeakRetained, v4);

}

- (void)refreshConfigurations
{
  id v3;
  SEL v4;
  _QWORD v5[5];

  if (a1)
  {
    v3 = objc_getProperty(a1, a2, 56, 1);
    objc_setProperty_atomic(a1, v4, 0, 56);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __49__NEVPNConnectivityManager_refreshConfigurations__block_invoke;
    v5[3] = &unk_1E3CC41F0;
    v5[4] = a1;
    -[NEVPNConnectivityManager cancelSessions:withCompletionHandler:](a1, v3, v5);

  }
}

- (void)cancelSessions:(void *)a3 withCompletionHandler:
{
  id v5;
  void (**v6)(_QWORD);
  NSObject *v7;
  SEL v8;
  id v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  void (**v14)(_QWORD);
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (objc_msgSend(v5, "count"))
    {
      ne_log_obj();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19BD16000, v7, OS_LOG_TYPE_DEFAULT, "Canceling sessions", buf, 2u);
      }

      v9 = objc_getProperty(a1, v8, 48, 1);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __65__NEVPNConnectivityManager_cancelSessions_withCompletionHandler___block_invoke;
      block[3] = &unk_1E3CC3A30;
      v12 = v5;
      v13 = v9;
      v14 = v6;
      v10 = v9;
      dispatch_async(v10, block);

    }
    else if (v6)
    {
      v6[2](v6);
    }
  }

}

void __49__NEVPNConnectivityManager_refreshConfigurations__block_invoke(uint64_t a1, const char *a2)
{
  id Property;
  const char *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[5];

  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 40, 1);
  v5 = Property;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    v7 = objc_getProperty(v6, v4, 48, 1);
    v8 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__NEVPNConnectivityManager_refreshConfigurations__block_invoke_2;
  v9[3] = &unk_1E3CC4188;
  v9[4] = v8;
  objc_msgSend(v5, "loadConfigurationsWithCompletionQueue:handler:", v7, v9);

}

- (NEVPNConnectivityManager)initWithDelegate:(id)a3
{
  id v4;
  NEVPNConnectivityManager *v5;
  NEVPNConnectivityManager *v6;
  NEConfigurationManager *v7;
  NEConfigurationManager *configManager;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  NEConfigurationManager *v12;
  OS_dispatch_queue *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD block[4];
  NEVPNConnectivityManager *v18;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NEVPNConnectivityManager;
  v5 = -[NEVPNConnectivityManager init](&v22, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = -[NEConfigurationManager initForAllUsers]([NEConfigurationManager alloc], "initForAllUsers");
    configManager = v6->_configManager;
    v6->_configManager = v7;

    *(_OWORD *)&v6->_visibilityStyle = xmmword_19BED7500;
    v6->_hasRelayConfigurations = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("Connectivity manager queue", v9);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    objc_initWeak(&location, v6);
    v12 = v6->_configManager;
    v13 = v6->_queue;
    v14 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __45__NEVPNConnectivityManager_initWithDelegate___block_invoke;
    v19[3] = &unk_1E3CC3BF0;
    objc_copyWeak(&v20, &location);
    -[NEConfigurationManager setChangedQueue:andHandler:](v12, "setChangedQueue:andHandler:", v13, v19);
    v15 = v6->_queue;
    block[0] = v14;
    block[1] = 3221225472;
    block[2] = __45__NEVPNConnectivityManager_initWithDelegate___block_invoke_29;
    block[3] = &unk_1E3CC41F0;
    v18 = v6;
    dispatch_async(v15, block);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (BOOL)hasRelayConfigurations
{
  return self->_hasRelayConfigurations;
}

void __49__NEVPNConnectivityManager_refreshConfigurations__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NEVPNConnectivitySession *v16;
  const char *v17;
  NEVPNConnectivitySession *v18;
  void *v19;
  id Property;
  void *v21;
  void *v22;
  id *v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  void *v27;
  SEL v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v43 = (uint64_t)v6;
      _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "Failed to load NetworkExtension configurations: %@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_15862);
    v36 = v5;
    v35 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v43 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEFAULT, "Loaded %lu VPN configurations", buf, 0xCu);
    }

    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v8;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v39;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v39 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v14);
          v16 = [NEVPNConnectivitySession alloc];
          v18 = v16;
          v19 = *(void **)(a1 + 32);
          if (v19)
          {
            Property = objc_getProperty(*(id *)(a1 + 32), v17, 48, 1);
            v16 = v18;
            v21 = v15;
            v22 = v19;
          }
          else
          {
            v21 = v15;
            v22 = 0;
            Property = 0;
          }
          v23 = -[NEVPNConnectivitySession initWithConfiguration:delegate:queue:](v16, v21, v22, Property);
          ne_log_obj();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v23)
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(objc_getProperty(v23, v26, 8, 1), "name");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(objc_getProperty(v23, v28, 8, 1), "identifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v43 = (uint64_t)v27;
              v44 = 2112;
              v45 = v29;
              _os_log_impl(&dword_19BD16000, v25, OS_LOG_TYPE_DEFAULT, "Now tracking VPN configuration %@ (%@)", buf, 0x16u);

            }
            objc_msgSend(v10, "addObject:", v23);
          }
          else
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v15, "name");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "identifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v43 = (uint64_t)v30;
              v44 = 2112;
              v45 = v31;
              _os_log_error_impl(&dword_19BD16000, v25, OS_LOG_TYPE_ERROR, "Failed to track VPN configuration %@ (%@)", buf, 0x16u);

            }
          }

          ++v14;
        }
        while (v12 != v14);
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        v12 = v32;
      }
      while (v32);
    }

    v34 = *(void **)(a1 + 32);
    if (v34)
    {
      objc_setProperty_atomic(v34, v33, v10, 56);
      v34 = *(void **)(a1 + 32);
    }
    v6 = 0;
    -[NEVPNConnectivityManager refreshConnectivityState](v34, v33);

    v5 = v36;
    v7 = v35;
  }

}

- (void)refreshConnectivityState
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  id Property;
  id v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  const char *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  const char *v28;
  const char *v29;
  id v30;
  id v31;
  void *v32;
  BOOL v33;
  id v34;
  id v35;
  void *v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  _QWORD *v42;
  NSObject *v43;
  const char *v44;
  id v45;
  void *v46;
  SEL v47;
  id v48;
  void *v49;
  SEL v50;
  id v51;
  NSObject *v52;
  void *v53;
  id obj;
  NSObject *group;
  id self;
  _QWORD block[15];
  NSObject *v58;
  _QWORD *v59;
  _QWORD *v60;
  uint64_t *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  char v73;
  _QWORD v74[3];
  char v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD v80[4];
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  void *v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = a1;
    v80[0] = 0;
    v80[1] = v80;
    v80[2] = 0x2020000000;
    v80[3] = 0;
    v76 = 0;
    v77 = &v76;
    v78 = 0x2020000000;
    v79 = 2;
    v74[0] = 0;
    v74[1] = v74;
    v74[2] = 0x2020000000;
    v75 = 1;
    v70 = 0;
    v71 = &v70;
    v72 = 0x2020000000;
    v73 = 0;
    v3 = objc_getProperty(a1, a2, 56, 1);
    v53 = (void *)objc_msgSend(v3, "copy");
    self = v2;

    v4 = objc_msgSend(v53, "count");
    if (v4)
    {
      if (v4 == 1)
      {
        objc_msgSend(v53, "firstObject");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v5;
        if (v5)
          Property = objc_getProperty(v5, v6, 8, 1);
        else
          Property = 0;
        v9 = Property;
        objc_msgSend(v9, "relay");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {

          v4 = 2;
        }
        else
        {
          objc_msgSend(v53, "firstObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v11;
          if (v11)
            v14 = objc_getProperty(v11, v12, 8, 1);
          else
            v14 = 0;
          v15 = v14;
          objc_msgSend(v15, "VPN");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEnabled");

          if (v17)
            v4 = 1;
          else
            v4 = 2;
        }
      }
      else
      {
        v4 = 2;
      }
    }
    v77[3] = v4;
    group = dispatch_group_create();
    if (v77[3])
    {
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v19 = v53;
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
      if (!v21)
        goto LABEL_38;
      v22 = *(_QWORD *)v67;
      while (1)
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v67 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v23);
          if (v24)
            v25 = objc_getProperty(*(id *)(*((_QWORD *)&v66 + 1) + 8 * v23), v20, 8, 1);
          else
            v25 = 0;
          v26 = v25;
          objc_msgSend(v26, "appVPN");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {

LABEL_27:
            v77[3] = 2;
            goto LABEL_28;
          }
          if (v24)
            v30 = objc_getProperty(v24, v28, 8, 1);
          else
            v30 = 0;
          v31 = v30;
          objc_msgSend(v31, "alwaysOnVPN");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v32 == 0;

          if (!v33)
            goto LABEL_27;
LABEL_28:
          if (v24)
            v34 = objc_getProperty(v24, v29, 8, 1);
          else
            v34 = 0;
          v35 = v34;
          objc_msgSend(v35, "relay");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v36 == 0;

          if (!v37)
            *((_BYTE *)v71 + 24) = 1;
          ++v23;
        }
        while (v21 != v23);
        v38 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
        v21 = v38;
        if (!v38)
        {
LABEL_38:

          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          obj = v19;
          v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v85, 16);
          if (v39)
          {
            v40 = *(_QWORD *)v63;
            do
            {
              for (i = 0; i != v39; ++i)
              {
                if (*(_QWORD *)v63 != v40)
                  objc_enumerationMutation(obj);
                v42 = *(_QWORD **)(*((_QWORD *)&v62 + 1) + 8 * i);
                if (v42 && v42[2])
                {
                  ne_log_obj();
                  v43 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                  {
                    v45 = objc_getProperty(v42, v44, 8, 1);
                    objc_msgSend(v45, "name");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    v48 = objc_getProperty(v42, v47, 8, 1);
                    objc_msgSend(v48, "identifier");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v82 = v46;
                    v83 = 2112;
                    v84 = v49;
                    _os_log_impl(&dword_19BD16000, v43, OS_LOG_TYPE_DEFAULT, "Fetching status of %@ (%@)", buf, 0x16u);

                  }
                  dispatch_group_enter(group);
                  v51 = objc_getProperty(self, v50, 48, 1);
                  block[9] = MEMORY[0x1E0C809B0];
                  block[10] = 3221225472;
                  block[11] = __52__NEVPNConnectivityManager_refreshConnectivityState__block_invoke;
                  block[12] = &unk_1E3CC24C8;
                  v59 = v80;
                  v60 = v74;
                  v61 = &v76;
                  block[13] = v42;
                  block[14] = self;
                  v58 = group;
                  ne_session_get_status();

                }
              }
              v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v85, 16);
            }
            while (v39);
          }

          v2 = self;
          break;
        }
      }
    }
    v52 = objc_getProperty(v2, v18, 48, 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__NEVPNConnectivityManager_refreshConnectivityState__block_invoke_39;
    block[3] = &unk_1E3CC24F0;
    block[4] = v2;
    block[5] = &v76;
    block[6] = v80;
    block[7] = &v70;
    block[8] = v74;
    dispatch_group_notify(group, v52, block);

    _Block_object_dispose(&v70, 8);
    _Block_object_dispose(v74, 8);
    _Block_object_dispose(&v76, 8);
    _Block_object_dispose(v80, 8);
  }
}

- (void)dealloc
{
  id v3;
  SEL v4;
  objc_super v5;

  if (self)
  {
    v3 = objc_getProperty(self, a2, 56, 1);
    objc_setProperty_atomic(self, v4, 0, 56);
    -[NEVPNConnectivityManager cancelSessions:withCompletionHandler:](self, v3, 0);
  }
  else
  {
    -[NEVPNConnectivityManager cancelSessions:withCompletionHandler:](0, 0, 0);
    v3 = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)NEVPNConnectivityManager;
  -[NEVPNConnectivityManager dealloc](&v5, sel_dealloc);
}

- (id)toggleVPNConnectivity:(BOOL)a3
{
  const char *v4;
  id Property;
  id v6;
  uint64_t v7;
  const char *v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  id v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  id v22;
  void *v23;
  char v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  id v30;
  const char *v31;
  __int128 v32;
  uint64_t v33;
  void *v34;
  _QWORD *v35;
  id v36;
  void *v37;
  NSObject *v38;
  const char *v39;
  id v40;
  void *v41;
  char v42;
  uint64_t v43;
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
  uint64_t v56;
  const __CFString *v57;
  uint8_t buf[4];
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[NEVPNConnectivityManager setConnectivityState:](self, "setConnectivityState:", 1);
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    if (self)
      Property = objc_getProperty(self, v4, 56, 1);
    else
      Property = 0;
    v6 = Property;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (!v7)
    {
LABEL_31:

      v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v27 = *MEMORY[0x1E0CB2FE0];
      v56 = *MEMORY[0x1E0CB2D50];
      v57 = CFSTR("No enabled VPN configurations are available");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, 2, v6);
      goto LABEL_59;
    }
    v10 = v7;
    v11 = *(_QWORD *)v52;
    *(_QWORD *)&v9 = 138412290;
    v45 = v9;
LABEL_6:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v52 != v11)
        objc_enumerationMutation(v6);
      v13 = *(_QWORD **)(*((_QWORD *)&v51 + 1) + 8 * v12);
      if (v13)
      {
        if (objc_msgSend(objc_getProperty(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v12), v8, 8, 1), "isEnabled"))
        {
          v14 = objc_getProperty(v13, v8, 8, 1);
LABEL_12:
          objc_msgSend(v14, "VPN", v45);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            ne_log_obj();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              if (v13)
                v18 = objc_getProperty(v13, v17, 8, 1);
              else
                v18 = 0;
              objc_msgSend(v18, "name");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v45;
              v59 = v19;
              _os_log_impl(&dword_19BD16000, v16, OS_LOG_TYPE_DEFAULT, "Starting %@", buf, 0xCu);

            }
            if (v13 && v13[2])
            {
              ne_session_start();
              v28 = 0;
              goto LABEL_59;
            }
            ne_log_obj();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              if (v13)
                v22 = objc_getProperty(v13, v21, 8, 1);
              else
                v22 = 0;
              objc_msgSend(v22, "name");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v45;
              v59 = v23;
              _os_log_error_impl(&dword_19BD16000, v20, OS_LOG_TYPE_ERROR, "No ne_session available for %@", buf, 0xCu);

            }
          }
        }
      }
      else
      {
        v24 = objc_msgSend(0, "isEnabled");
        v14 = 0;
        if ((v24 & 1) != 0)
          goto LABEL_12;
      }
      if (v10 == ++v12)
      {
        v25 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
        v10 = v25;
        if (!v25)
          goto LABEL_31;
        goto LABEL_6;
      }
    }
  }
  -[NEVPNConnectivityManager setConnectivityState:](self, "setConnectivityState:", 3);
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  if (self)
    v30 = objc_getProperty(self, v29, 56, 1);
  else
    v30 = 0;
  v6 = v30;
  v28 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v28)
  {
    v33 = *(_QWORD *)v48;
    *(_QWORD *)&v32 = 138412290;
    v46 = v32;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v48 != v33)
          objc_enumerationMutation(v6);
        v35 = *(_QWORD **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v34);
        if (v35)
        {
          if (!objc_msgSend(objc_getProperty(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v34), v31, 8, 1), "isEnabled"))goto LABEL_48;
          v36 = objc_getProperty(v35, v31, 8, 1);
        }
        else
        {
          v42 = objc_msgSend(0, "isEnabled");
          v36 = 0;
          if ((v42 & 1) == 0)
            goto LABEL_48;
        }
        objc_msgSend(v36, "VPN", v46, (_QWORD)v47);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          if (v35 && v35[2])
          {
            ne_session_stop();
          }
          else
          {
            ne_log_obj();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              if (v35)
                v40 = objc_getProperty(v35, v39, 8, 1);
              else
                v40 = 0;
              objc_msgSend(v40, "name");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v46;
              v59 = v41;
              _os_log_error_impl(&dword_19BD16000, v38, OS_LOG_TYPE_ERROR, "No ne_session available for %@", buf, 0xCu);

            }
          }
        }
LABEL_48:
        v34 = (char *)v34 + 1;
      }
      while (v28 != v34);
      v43 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      v28 = (void *)v43;
    }
    while (v43);
  }
LABEL_59:

  return v28;
}

- (void)sessionStatusDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  id Property;
  const char *v8;
  void *v9;
  id v10;
  void *v11;
  const char *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
      Property = objc_getProperty(v4, v6, 8, 1);
    else
      Property = 0;
    objc_msgSend(Property, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v10 = objc_getProperty(v4, v8, 8, 1);
    else
      v10 = 0;
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v9;
    v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEFAULT, "Session status of %@ (%@) changed", (uint8_t *)&v13, 0x16u);

  }
  -[NEVPNConnectivityManager refreshConnectivityState](self, v12);

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __52__NEVPNConnectivityManager_refreshConnectivityState__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  const char *v5;
  id Property;
  const char *v7;
  void *v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  _QWORD *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  NSObject *v27;
  const char *v28;
  id v29;
  const char *v30;
  void *v31;
  id v32;
  void *v33;
  const char *v34;
  void *v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v5, 8, 1);
    objc_msgSend(Property, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(id *)(a1 + 32);
    if (v9)
      v9 = objc_getProperty(v9, v7, 8, 1);
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v38 = v8;
    v39 = 2112;
    v40 = v10;
    v41 = 2080;
    v42 = ne_session_status_to_string();
    _os_log_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEFAULT, "VPN %@ (%@) is %s", buf, 0x20u);

  }
  objc_opt_self();
  if ((a2 - 1) > 4)
    v12 = 4;
  else
    v12 = qword_19BED71C8[a2 - 1];
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(_QWORD *)(v13 + 24);
  if (v12 == v14 || v14 == 2)
  {
    if ((unint64_t)(v12 - 1) > 1)
      goto LABEL_33;
    goto LABEL_29;
  }
  if (v12 == 1)
  {
    *(_QWORD *)(v13 + 24) = 1;
LABEL_29:
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      v19 = *(id *)(a1 + 32);
      if (v19)
        v19 = objc_getProperty(v19, v11, 8, 1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v19, "usesPolicyBasedRouting");
    }
    goto LABEL_33;
  }
  if (v12 != 3)
  {
    if (v12 != 2)
      goto LABEL_33;
    v16 = *(id *)(a1 + 32);
    if (v16)
      v16 = objc_getProperty(v16, v11, 8, 1);
    objc_msgSend(v16, "relay");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      v18 = 5;
    else
      v18 = 2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v18;
    goto LABEL_29;
  }
  if (v14 != 1)
    *(_QWORD *)(v13 + 24) = 3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) != 1)
    goto LABEL_49;
  v20 = *(_QWORD **)(a1 + 32);
  if (!v20)
    goto LABEL_49;
  if (!v20[2])
    goto LABEL_49;
  objc_msgSend(objc_getProperty(v20, v11, 8, 1), "VPN");
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
    goto LABEL_49;
LABEL_33:
  v23 = (void *)v21;
  v24 = *(id *)(a1 + 32);
  if (v24)
    v24 = objc_getProperty(v24, v22, 8, 1);
  objc_msgSend(v24, "VPN");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isOnDemandEnabled");

  if (v26)
  {
    ne_log_obj();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v29 = *(id *)(a1 + 32);
      if (v29)
        v29 = objc_getProperty(v29, v28, 8, 1);
      objc_msgSend(v29, "name");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = *(id *)(a1 + 32);
      if (v32)
        v32 = objc_getProperty(v32, v30, 8, 1);
      objc_msgSend(v32, "identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v38 = v31;
      v39 = 2112;
      v40 = v33;
      _os_log_impl(&dword_19BD16000, v27, OS_LOG_TYPE_DEFAULT, "Fetching extended status of %@ (%@)", buf, 0x16u);

    }
    v35 = *(void **)(a1 + 40);
    if (v35)
      objc_getProperty(v35, v34, 48, 1);
    v36 = *(id *)(a1 + 48);
    ne_session_get_info();

  }
  else
  {
LABEL_49:
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void __52__NEVPNConnectivityManager_refreshConnectivityState__block_invoke_39(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  const char *v7;
  int v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setVisibilityStyle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  objc_msgSend(*(id *)(a1 + 32), "setConnectivityState:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  objc_msgSend(*(id *)(a1 + 32), "setHasRelayConfigurations:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  objc_msgSend(*(id *)(a1 + 32), "setUsesPolicyBasedRouting:", 0);
  if ((unint64_t)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) - 1) <= 1)
    objc_msgSend(*(id *)(a1 + 32), "setUsesPolicyBasedRouting:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = objc_msgSend(v3, "connectivityState");
    if (v3)
    {
      if (v4 > 5)
        v5 = CFSTR("NEVPNConnectivityStateInactive");
      else
        v5 = off_1E3CC2550[v4];
    }
    else
    {
      v5 = 0;
    }
    v6 = objc_msgSend(*(id *)(a1 + 32), "visibilityStyle");
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      v7 = ", has relays";
    else
      v7 = "";
    v8 = objc_msgSend(*(id *)(a1 + 32), "usesPolicyBasedRouting");
    v9 = "does not use";
    v13 = 138413058;
    v14 = v5;
    v15 = 2048;
    if (v8)
      v9 = "uses";
    v16 = v6;
    v17 = 2082;
    v18 = v7;
    v19 = 2080;
    v20 = v9;
    _os_log_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEFAULT, "VPN connectivity state is now %@, visibility state is now %ld%{public}s, %s policy-based routing", (uint8_t *)&v13, 0x2Au);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_19BD16000, v12, OS_LOG_TYPE_DEFAULT, "NEVPNConnectivityManager: invoking delegate", (uint8_t *)&v13, 2u);
    }

    objc_msgSend(v10, "connectivityManagerDidChange:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_error_impl(&dword_19BD16000, v12, OS_LOG_TYPE_ERROR, "NEVPNConnectivityManager: delegate is nil", (uint8_t *)&v13, 2u);
    }

  }
}

void __52__NEVPNConnectivityManager_refreshConnectivityState__block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int64_t int64;
  NSObject *v11;
  const char *v12;
  id Property;
  const char *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  id v34;
  const char *v35;
  void *v36;
  id v37;
  void *v38;
  int v39;
  int64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v5 = v3;
  if (v3)
  {
    v6 = MEMORY[0x1A1ACFDA4](v3);
    v7 = MEMORY[0x1E0C812F8];
    if (v6 == MEMORY[0x1E0C812F8])
    {
      xpc_dictionary_get_value(v5, "VPN");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v8 && MEMORY[0x1A1ACFDA4](v8) == v7)
      {
        int64 = xpc_dictionary_get_int64(v9, "OnDemandAction");
        ne_log_obj();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          Property = *(id *)(a1 + 32);
          if (Property)
            Property = objc_getProperty(Property, v12, 8, 1);
          objc_msgSend(Property, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = *(id *)(a1 + 32);
          if (v16)
            v16 = objc_getProperty(v16, v14, 8, 1);
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 134218498;
          v40 = int64;
          v41 = 2112;
          v42 = v15;
          v43 = 2112;
          v44 = v17;
          _os_log_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEFAULT, "Got on demand action of %ld for %@ (%@)", (uint8_t *)&v39, 0x20u);

        }
        if (int64 == 2)
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 2;
      }

    }
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 1)
  {
    v18 = *(id *)(a1 + 32);
    if (v18)
      v18 = objc_getProperty(v18, v4, 8, 1);
    objc_msgSend(v18, "VPN");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "protocol");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "type");

    if (v21 == 4)
    {
      v23 = *(id *)(a1 + 32);
      if (v23)
        v23 = objc_getProperty(v23, v22, 8, 1);
      objc_msgSend(v23, "VPN");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "protocol");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "providerBundleIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "pluginType");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[NELaunchServices pluginProxyWithIdentifier:type:pluginClass:extensionPoint:](NELaunchServices, "pluginProxyWithIdentifier:type:pluginClass:extensionPoint:", v26, v27, 5, 0);
      v28 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "providerBundleIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "pluginType");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[NELaunchServices pluginProxyWithIdentifier:type:pluginClass:extensionPoint:](NELaunchServices, "pluginProxyWithIdentifier:type:pluginClass:extensionPoint:", v29, v30, 2, 0);
      v31 = objc_claimAutoreleasedReturnValue();

      if (!(v28 | v31))
      {
        ne_log_obj();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v34 = *(id *)(a1 + 32);
          if (v34)
            v34 = objc_getProperty(v34, v33, 8, 1);
          objc_msgSend(v34, "name");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = *(id *)(a1 + 32);
          if (v37)
            v37 = objc_getProperty(v37, v35, 8, 1);
          objc_msgSend(v37, "identifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 138412546;
          v40 = (int64_t)v36;
          v41 = 2112;
          v42 = v38;
          _os_log_impl(&dword_19BD16000, v32, OS_LOG_TYPE_DEFAULT, "Provider is not available for %@ (%@)", (uint8_t *)&v39, 0x16u);

        }
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 2;
      }

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __65__NEVPNConnectivityManager_cancelSessions_withCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  const char *v9;
  _QWORD *v10;
  NSObject *Property;
  NSObject *v12;
  id obj;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD block[5];
  _QWORD *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_group_create();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        dispatch_group_enter(v2);
        v16[0] = v4;
        v16[1] = 3221225472;
        v16[2] = __65__NEVPNConnectivityManager_cancelSessions_withCompletionHandler___block_invoke_2;
        v16[3] = &unk_1E3CC41F0;
        v17 = v2;
        v10 = v16;
        if (v8)
        {
          Property = objc_getProperty(v8, v9, 40, 1);
          block[0] = v4;
          block[1] = 3221225472;
          block[2] = __56__NEVPNConnectivitySession_cancelWithCompletionHandler___block_invoke;
          block[3] = &unk_1E3CC46A8;
          block[4] = v8;
          v23 = v10;
          dispatch_async(Property, block);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v5);
  }

  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __65__NEVPNConnectivityManager_cancelSessions_withCompletionHandler___block_invoke_3;
  v14[3] = &unk_1E3CC4720;
  v12 = *(NSObject **)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  dispatch_group_notify(v2, v12, v14);

}

void __65__NEVPNConnectivityManager_cancelSessions_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __65__NEVPNConnectivityManager_cancelSessions_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __45__NEVPNConnectivityManager_initWithDelegate___block_invoke_29(uint64_t a1, const char *a2)
{
  -[NEVPNConnectivityManager refreshConfigurations](*(void **)(a1 + 32), a2);
}

BOOL __49__NEVPNConnectivityManager_refreshConfigurations__block_invoke_45(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "VPN");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(v2, "appVPN");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v4 = 1;
      }
      else
      {
        objc_msgSend(v2, "alwaysOnVPN");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          v4 = 1;
        }
        else
        {
          objc_msgSend(v2, "relay");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = v7 != 0;

        }
      }

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
