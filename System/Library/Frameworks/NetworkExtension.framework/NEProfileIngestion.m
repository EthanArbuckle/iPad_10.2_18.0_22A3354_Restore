@implementation NEProfileIngestion

- (NEProfileIngestion)initWithNameAndType:(id)a3 payloadType:(id)a4
{
  id v6;
  id v7;
  NEProfileIngestion *v8;
  uint64_t v9;
  NSString *clientName;
  uint64_t v11;
  NSString *payloadType;
  NEConfigurationManager *v13;
  NEConfigurationManager *manager;
  NSObject *v15;
  void *v17;
  id v18;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)NEProfileIngestion;
  v8 = -[NEProfileIngestion init](&v19, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    clientName = v8->_clientName;
    v8->_clientName = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    payloadType = v8->_payloadType;
    v8->_payloadType = (NSString *)v11;

    v13 = -[NEConfigurationManager initSynchronous]([NEConfigurationManager alloc], "initSynchronous");
    manager = v8->_manager;
    v8->_manager = v13;

    if (!v8->_manager)
    {

      v8 = 0;
    }
  }
  ne_log_obj();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v17 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412802;
    v21 = v17;
    v22 = 2112;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    v18 = v17;
    _os_log_debug_impl(&dword_19BD16000, v15, OS_LOG_TYPE_DEBUG, "%@ initWithNameAndType name %@, type %@", buf, 0x20u);

  }
  return v8;
}

- (NEProfileIngestion)initWithName:(id)a3
{
  return -[NEProfileIngestion initWithNameAndType:payloadType:](self, "initWithNameAndType:payloadType:", a3, 0);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NEProfileIngestion;
  -[NEProfileIngestion dealloc](&v2, sel_dealloc);
}

- (BOOL)loadConfigurationsForceReloadFromDisk
{
  NEProfileIngestion *v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  id v8;
  int v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v2 = self;
  v25 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 1;
    -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");

    -[NEProfileIngestion manager](v2, "manager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C80D38];
    v5 = MEMORY[0x1E0C80D38];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__NEProfileIngestion_loadConfigurationsWithRefreshOption___block_invoke;
    v12[3] = &unk_1E3CC3500;
    v12[4] = v2;
    v12[5] = &v13;
    objc_msgSend(v3, "loadConfigurationsWithCompletionQueue:handler:", v4, v12);

    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = (id)objc_opt_class();
      v9 = *((unsigned __int8 *)v14 + 24);
      -[NEProfileIngestion currentConfigurations](v2, "currentConfigurations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 138413058;
      v18 = v8;
      v19 = 1024;
      v20 = 1;
      v21 = 1024;
      v22 = v9;
      v23 = 2048;
      v24 = v11;
      _os_log_debug_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEBUG, "%@ loadConfigurationsWithRefreshOption (refresh = %d) done, error = %d, #configs loaded %lu", buf, 0x22u);

    }
    LOBYTE(v2) = *((_BYTE *)v14 + 24) == 0;
    _Block_object_dispose(&v13, 8);
  }
  return (char)v2;
}

- (id)findConfigurationByName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[NEProfileIngestion currentConfigurations](self, "currentConfigurations", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v6);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "name");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v4);

          if (v11)
          {
            v5 = v9;
            goto LABEL_12;
          }
        }
        v5 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return v5;
}

- (id)setAsideConfigurationName:(id)a3 unsetAside:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v23;
  void *v24;
  const char *v25;
  int v26;
  _BYTE v27[14];
  __int16 v28;
  void *v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NEProfileIngestion findConfigurationByConfigurationID:](self, "findConfigurationByConfigurationID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v26 = 138412802;
    *(_QWORD *)v27 = v6;
    *(_WORD *)&v27[8] = 1024;
    *(_DWORD *)&v27[10] = v4;
    v28 = 2112;
    v29 = v7;
    _os_log_debug_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEBUG, "setAsideConfigurationName: configID %@, unset %d, configurations %@", (uint8_t *)&v26, 0x1Cu);
  }

  if (!v7)
  {
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v26 = 138412290;
      *(_QWORD *)v27 = v6;
      _os_log_debug_impl(&dword_19BD16000, v16, OS_LOG_TYPE_DEBUG, "setAsideConfigurationName can't find configuration of ID  %@", (uint8_t *)&v26, 0xCu);
    }
    goto LABEL_16;
  }
  objc_msgSend(v7, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v4)
  {
    objc_msgSend(v9, "stringByAppendingString:", v6);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v11 = objc_msgSend(v9, "hasSuffix:", v6);

  if (v11)
  {
    objc_msgSend(v7, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");
    v14 = objc_msgSend(v6, "length");

    v15 = v13 - v14;
    if (v13 == v14)
    {
      ne_log_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v26 = 138412290;
        *(_QWORD *)v27 = v6;
        v17 = "setAsideConfigurationName: unset-aside failed. Name '%@' would be empty after unset-aside";
LABEL_26:
        _os_log_error_impl(&dword_19BD16000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v26, 0xCu);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
    objc_msgSend(v7, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "substringToIndex:", v15);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v16 = v18;

    -[NEProfileIngestion findConfigurationByName:](self, "findConfigurationByName:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      ne_log_obj();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
LABEL_14:

        goto LABEL_16;
      }
      v26 = 67109378;
      *(_DWORD *)v27 = v4;
      *(_WORD *)&v27[4] = 2112;
      *(_QWORD *)&v27[6] = v16;
      v25 = "setAsideConfigurationName failed (unSetAside = %d), name '%@' in use.";
    }
    else
    {
      objc_msgSend(v7, "payloadInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(v7, "payloadInfo");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setIsSetAside:", !v4);

        objc_msgSend(v7, "setName:", v16);
        -[NEProfileIngestion saveConfiguration:returnError:](self, v7, 0);
        v21 = v7;
        goto LABEL_17;
      }
      ne_log_obj();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      v26 = 67109378;
      *(_DWORD *)v27 = v4;
      *(_WORD *)&v27[4] = 2112;
      *(_QWORD *)&v27[6] = v16;
      v25 = "setAsideConfigurationName failed (unSetAside = %d), configuration '%@' is missing payload info.";
    }
    _os_log_error_impl(&dword_19BD16000, v20, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v26, 0x12u);
    goto LABEL_14;
  }
  ne_log_obj();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v26 = 138412290;
    *(_QWORD *)v27 = v6;
    v17 = "setAsideConfigurationName: unset-aside failed. Name '%@' is not a set-aside name";
    goto LABEL_26;
  }
LABEL_16:
  v21 = 0;
LABEL_17:

  return v21;
}

- (id)findConfigurationByPayloadUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v4;
    _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "findConfigurationByPayloadUUID for payloadUUID %@", buf, 0xCu);
  }

  -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v6)
    {
      v8 = *(_QWORD *)v23;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v7);
          v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v9);
          ne_log_obj();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v10, "payloadInfo");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              objc_msgSend(v10, "payloadInfo");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "payloadUUID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v28 = v19;
              _os_log_debug_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEBUG, "findConfigurationByPayloadUUID check config with payloadUUID %@", buf, 0xCu);

            }
            else
            {
              *(_DWORD *)buf = 138412290;
              v28 = 0;
              _os_log_debug_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEBUG, "findConfigurationByPayloadUUID check config with payloadUUID %@", buf, 0xCu);
            }

          }
          objc_msgSend(v10, "payloadInfo");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            objc_msgSend(v10, "payloadInfo");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "payloadUUID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", v4);

            if ((v16 & 1) != 0)
            {
              v6 = v10;
              goto LABEL_21;
            }
          }
          v9 = (char *)v9 + 1;
        }
        while (v6 != v9);
        v20 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        v6 = (id)v20;
      }
      while (v20);
    }
LABEL_21:

  }
  return v6;
}

- (id)findConfigurationByConfigurationID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "length"))
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19BD16000, v7, OS_LOG_TYPE_DEBUG, "findConfigurationByConfigurationID failed: empty identifier", buf, 2u);
    }
    v6 = 0;
LABEL_16:

    goto LABEL_17;
  }
  -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NEProfileIngestion currentConfigurations](self, "currentConfigurations", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v6 = (id)-[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v6)
    {
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v7);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "UUIDString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v5);

          if ((v13 & 1) != 0)
          {
            v6 = v10;
            goto LABEL_16;
          }
        }
        v6 = (id)-[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        if (v6)
          continue;
        break;
      }
    }
    goto LABEL_16;
  }
LABEL_17:

  return v6;
}

- (BOOL)isInstalled:(id)a3
{
  void *v3;

  -[NEProfileIngestion findConfigurationByPayloadUUID:](self, "findConfigurationByPayloadUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (void)removeAllConfigurationsWithPayload:(id)a3 profile:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  NSObject *v34;
  id v35;
  uint8_t v36[128];
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (isa_nsstring(v6) && (isa_nsstring(v7) & 1) != 0)
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v38 = v6;
      v39 = 2112;
      v40 = v7;
      _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEFAULT, "Removing existing configurations with payload UUID %@ and profile UUID %@", buf, 0x16u);
    }

    v9 = (void *)MEMORY[0x1E0CB3880];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __65__NEProfileIngestion_removeAllConfigurationsWithPayload_profile___block_invoke;
    v33[3] = &unk_1E3CC3528;
    v28 = v6;
    v34 = v6;
    v27 = v7;
    v35 = v7;
    objc_msgSend(v9, "predicateWithBlock:", v33);
    v10 = objc_claimAutoreleasedReturnValue();
    -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)v10;
    objc_msgSend(v11, "filteredArrayUsingPredicate:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v17);
          v19 = -[NEProfileIngestion removeConfiguration:](self, "removeConfiguration:", v18);
          ne_log_obj();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v19)
          {
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              goto LABEL_15;
            objc_msgSend(v18, "name");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "identifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v38 = v22;
            v39 = 2112;
            v40 = v23;
            _os_log_impl(&dword_19BD16000, v21, OS_LOG_TYPE_DEFAULT, "Removed duplicate configuration %@ (%@)", buf, 0x16u);
            goto LABEL_13;
          }
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v18, "name");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "identifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v38 = v22;
            v39 = 2112;
            v40 = v23;
            _os_log_error_impl(&dword_19BD16000, v21, OS_LOG_TYPE_ERROR, "Failed to remove duplicate configuration %@ (%@)", buf, 0x16u);
LABEL_13:

          }
LABEL_15:

          ++v17;
        }
        while (v15 != v17);
        v24 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
        v15 = v24;
      }
      while (v24);
    }

    v25 = v34;
    v7 = v27;
    v6 = v28;
  }
  else
  {
    ne_log_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v38 = v6;
      v39 = 2112;
      v40 = v7;
      _os_log_error_impl(&dword_19BD16000, v25, OS_LOG_TYPE_ERROR, "Payload UUID (%@) and/or profile UUID (%@) is invalid", buf, 0x16u);
    }
  }

}

- (BOOL)createConfigurationFromPayload:(id)a3 payloadType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char *v9;
  void *v10;
  __CFString **v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  char *v16;
  NEProfileIngestion *v17;
  char *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  int v38;
  NSObject *v39;
  BOOL v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  char v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  NSObject *v58;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t j;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t k;
  void *v78;
  NSObject *v79;
  void *v80;
  id v81;
  char *v82;
  NSObject *v83;
  void *v84;
  id v85;
  void *v86;
  const char *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  NEProfileIngestion *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t m;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  uint64_t n;
  void *v111;
  NSObject *v112;
  void *v113;
  id v114;
  char *v115;
  void *v116;
  id v117;
  NSObject *v118;
  id v119;
  void *v120;
  void *v121;
  id v122;
  id v123;
  id v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  NEProfileIngestion *v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  _QWORD v152[4];
  id v153;
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  uint8_t v158[128];
  uint8_t buf[4];
  id v160;
  __int16 v161;
  const char *v162;
  __int16 v163;
  char *v164;
  uint64_t v165;

  v165 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "payloadAtom");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("UserDefinedName"));
  v9 = (char *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VPNSubType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PayloadDisplayName"));
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.webcontent-filter")) & 1) != 0)
      {
        v11 = kNECFPluginBundleIDKey;
      }
      else
      {
        v12 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.dnsProxy.managed"));
        v11 = kNEVPNTypeKey;
        if (v12)
          v11 = &kNEDNSProxyAppBundleIdentifierKey;
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", *v11);
      v9 = (char *)objc_claimAutoreleasedReturnValue();
    }
  }
  ne_log_obj();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v160 = v7;
    v161 = 2112;
    v162 = v9;
    _os_log_debug_impl(&dword_19BD16000, v13, OS_LOG_TYPE_DEBUG, "createConfigurationFromPayload type %@, name '%@'", buf, 0x16u);
  }

  -[NEProfileIngestion findConfigurationByName:](self, "findConfigurationByName:", v9);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v131 = self;
  if (!v14)
    goto LABEL_129;
  v125 = (void *)v14;
  v128 = v10;
  v16 = v9;
  v17 = self;
  v18 = v16;
  v120 = v8;
  v122 = v6;
  if (v17)
  {
    objc_msgSend(v16, "componentsSeparatedByString:", CFSTR(" "));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");
    v21 = v20 - 1;
    if (v20 > 1)
    {
      v24 = v7;
      objc_msgSend(v19, "objectAtIndex:", v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "length");
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789 "));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringByTrimmingCharactersInSet:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v28, "length"))
      {
        v22 = v18;
        v23 = 0;
      }
      else
      {
        objc_msgSend(v19, "objectAtIndex:", v21);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (int)objc_msgSend(v29, "intValue");

        objc_msgSend(v18, "substringToIndex:", objc_msgSend(v18, "length") - v26);
        v22 = (char *)objc_claimAutoreleasedReturnValue();
      }

      v7 = v24;
    }
    else
    {
      v22 = v18;
      v23 = 0;
    }
    -[NEProfileIngestion currentConfigurations](v131, "currentConfigurations");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = 0;
      v32 = v23 + 1;
      do
      {
        objc_msgSend(v22, "stringByAppendingFormat:", CFSTR(" %ld"), v32);
        v9 = (char *)objc_claimAutoreleasedReturnValue();

        -[NEProfileIngestion findConfigurationByName:](v131, "findConfigurationByName:", v9);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        ++v32;
        v31 = v9;
      }
      while (v33);
    }
    else
    {
      ne_log_obj();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19BD16000, v34, OS_LOG_TYPE_ERROR, "resolveConfigurationNameConflict system configurations disappeared", buf, 2u);
      }

      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  ne_log_obj();
  v35 = objc_claimAutoreleasedReturnValue();
  v8 = v120;
  v6 = v122;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    v84 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412802;
    v160 = v84;
    v161 = 2112;
    v162 = v18;
    v163 = 2112;
    v164 = v9;
    v85 = v84;
    _os_log_debug_impl(&dword_19BD16000, v35, OS_LOG_TYPE_DEBUG, "%@ createConfigurationFromPayload: rename %@ to %@", buf, 0x20u);

  }
  v15 = v125;
  v10 = v128;
  self = v131;
  if (v9)
  {
LABEL_129:
    if (isa_nsstring(v10)
      && +[NETunnelProviderProtocol isLegacyPluginType:](NETunnelProviderProtocol, "isLegacyPluginType:", v10))
    {
      -[NEProfileIngestion manager](self, "manager");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v152[0] = MEMORY[0x1E0C809B0];
      v152[1] = 3221225472;
      v152[2] = __65__NEProfileIngestion_createConfigurationFromPayload_payloadType___block_invoke;
      v152[3] = &unk_1E3CC3588;
      v153 = v6;
      objc_msgSend(v36, "fetchUpgradeInfoForPluginType:completionQueue:handler:", v10, MEMORY[0x1E0C80D38], v152);

    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.vpn.managed")))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VPNType"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("PPTP"));

      if (v38)
      {
        ne_log_obj();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_19BD16000, v39, OS_LOG_TYPE_DEBUG, "ingesting PPTP not supported", buf, 2u);
        }

        -[NEProfileIngestion setIngestedConfiguration:](self, "setIngestedConfiguration:", 0);
        v40 = 1;
LABEL_57:

        goto LABEL_58;
      }
      v119 = v7;
      v54 = v6;
      v55 = -[NEConfiguration initWithVPNPayload:configurationName:grade:]([NEConfiguration alloc], v6, v9, 1);
      goto LABEL_54;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.vpn.managed.alwayson")))
    {
      -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        v123 = v6;
        v126 = v15;
        v129 = v10;
        v42 = v8;
        v43 = v7;
        v150 = 0u;
        v151 = 0u;
        v148 = 0u;
        v149 = 0u;
        -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v148, v158, 16);
        if (v45)
        {
          v46 = v45;
          v47 = *(_QWORD *)v149;
          while (2)
          {
            for (i = 0; i != v46; ++i)
            {
              if (*(_QWORD *)v149 != v47)
                objc_enumerationMutation(v44);
              v49 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * i);
              objc_msgSend(v49, "alwaysOnVPN");
              v50 = objc_claimAutoreleasedReturnValue();
              if (v50)
              {
                v51 = (void *)v50;
                objc_msgSend(v49, "payloadInfo");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = objc_msgSend(v52, "isSetAside");

                if ((v53 & 1) == 0)
                {
                  ne_log_obj();
                  v83 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
                  {
                    v116 = (void *)objc_opt_class();
                    *(_DWORD *)buf = 138412290;
                    v160 = v116;
                    v117 = v116;
                    _os_log_error_impl(&dword_19BD16000, v83, OS_LOG_TYPE_ERROR, "%@ createConfigurationFromPayload: installations of multiple Always-On VPN configs are not allowed.", buf, 0xCu);

                  }
                  v40 = 0;
                  v7 = v43;
                  v8 = v42;
                  v15 = v126;
                  v10 = v129;
                  v6 = v123;
                  goto LABEL_57;
                }
              }
            }
            v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v148, v158, 16);
            if (v46)
              continue;
            break;
          }
        }

        v7 = v43;
        v8 = v42;
        v15 = v126;
        v10 = v129;
        self = v131;
        v6 = v123;
      }
      v119 = v7;
      v54 = v6;
      v55 = -[NEConfiguration initWithAlwaysOnVPNPayload:configurationName:grade:]((__CFString *)[NEConfiguration alloc], v6, v9, 1);
      goto LABEL_54;
    }
    v119 = v7;
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.vpn.managed.applayer")))
    {
      v54 = v6;
      v55 = -[NEConfiguration initWithAppLayerVPNPayload:configurationName:grade:]([NEConfiguration alloc], v6, v9, 1);
LABEL_54:
      v56 = v55;
      -[NEProfileIngestion setIngestedConfiguration:](self, "setIngestedConfiguration:", v55);
LABEL_55:

      -[NEProfileIngestion ingestedConfiguration](self, "ingestedConfiguration");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v57 != 0;

      ne_log_obj();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        v86 = (void *)objc_opt_class();
        v87 = "no";
        if (v57)
          v87 = "yes";
        *(_DWORD *)buf = 138412546;
        v160 = v86;
        v161 = 2080;
        v162 = v87;
        v88 = v86;
        _os_log_debug_impl(&dword_19BD16000, v58, OS_LOG_TYPE_DEBUG, "%@ createConfigurationFromPayload: configuration created (%s)", buf, 0x16u);

      }
      v6 = v54;
      v7 = v119;
      goto LABEL_57;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.webcontent-filter")))
    {
      v127 = v15;
      v130 = v10;
      v121 = v8;
      v60 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      if (v61)
      {
        v146 = 0u;
        v147 = 0u;
        v144 = 0u;
        v145 = 0u;
        -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v144, v157, 16);
        if (v63)
        {
          v64 = v63;
          v65 = *(_QWORD *)v145;
          do
          {
            for (j = 0; j != v64; ++j)
            {
              if (*(_QWORD *)v145 != v65)
                objc_enumerationMutation(v62);
              v67 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * j);
              objc_msgSend(v67, "contentFilter");
              v68 = (void *)objc_claimAutoreleasedReturnValue();

              if (v68)
              {
                objc_msgSend(v67, "payloadInfo");
                v69 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v69)
                  objc_msgSend(v60, "addObject:", v67);
              }
            }
            v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v144, v157, 16);
          }
          while (v64);
        }

        self = v131;
      }
      v70 = -[NEConfiguration initWithContentFilterPayload:configurationName:grade:]([NEConfiguration alloc], v6, v9, 1);
      -[NEProfileIngestion setIngestedConfiguration:](self, "setIngestedConfiguration:", v70);

      -[NEProfileIngestion ingestedConfiguration](self, "ingestedConfiguration");
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v71)
      {
        v54 = v6;
        v8 = v121;
        v10 = v130;
        v56 = v60;
        goto LABEL_122;
      }
      v124 = v6;
      -[NEProfileIngestion ingestedConfiguration](self, "ingestedConfiguration");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setName:", v9);

      v142 = 0u;
      v143 = 0u;
      v140 = 0u;
      v141 = 0u;
      v73 = v60;
      v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v140, v156, 16);
      if (v74)
      {
        v75 = v74;
        v76 = *(_QWORD *)v141;
        do
        {
          for (k = 0; k != v75; ++k)
          {
            if (*(_QWORD *)v141 != v76)
              objc_enumerationMutation(v73);
            v78 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * k);
            ne_log_obj();
            v79 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
            {
              v80 = (void *)objc_opt_class();
              v81 = v80;
              objc_msgSend(v78, "identifier");
              v82 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v160 = v80;
              v161 = 2112;
              v162 = v82;
              _os_log_impl(&dword_19BD16000, v79, OS_LOG_TYPE_INFO, "%@ createConfigurationFromPayload: Removing overridden content filter configuration %@.", buf, 0x16u);

              self = v131;
            }

            -[NEProfileIngestion removeConfiguration:](self, "removeConfiguration:", v78);
          }
          v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v140, v156, 16);
        }
        while (v75);
      }
      v56 = v73;
    }
    else
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.networkusagerules")))
      {
        v54 = v6;
        v55 = -[NEConfiguration initWithPathControllerPayload:configurationName:grade:]([NEConfiguration alloc], v6, v9, 1);
        goto LABEL_54;
      }
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.dnsProxy.managed")))
      {
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.dnsSettings.managed")))
        {
          v54 = v6;
          v55 = -[NEConfiguration initWithDNSSettingsPayload:configurationName:grade:]([NEConfiguration alloc], v6, v9, 2);
        }
        else
        {
          if (!objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.relay.managed")))
          {
            ne_log_obj();
            v118 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v160 = v7;
              _os_log_error_impl(&dword_19BD16000, v118, OS_LOG_TYPE_ERROR, "NEProfileIngestion createConfigurationFromPayload: unsupported payload type '%@'", buf, 0xCu);
            }

            v40 = 0;
            goto LABEL_57;
          }
          v54 = v6;
          v55 = -[NEConfiguration initWithRelayPayload:configurationName:grade:]([NEConfiguration alloc], v6, v9, 1);
        }
        goto LABEL_54;
      }
      v127 = v15;
      v130 = v10;
      v121 = v8;
      v89 = v6;
      v90 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
      v91 = (void *)objc_claimAutoreleasedReturnValue();

      if (v91)
      {
        v92 = self;
        v93 = v89;
        v138 = 0u;
        v139 = 0u;
        v136 = 0u;
        v137 = 0u;
        -[NEProfileIngestion currentConfigurations](v92, "currentConfigurations");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v136, v155, 16);
        if (v95)
        {
          v96 = v95;
          v97 = *(_QWORD *)v137;
          do
          {
            for (m = 0; m != v96; ++m)
            {
              if (*(_QWORD *)v137 != v97)
                objc_enumerationMutation(v94);
              v99 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * m);
              objc_msgSend(v99, "dnsProxy");
              v100 = objc_claimAutoreleasedReturnValue();
              if (v100)
              {
                v101 = (void *)v100;
                objc_msgSend(v99, "payloadInfo");
                v102 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v102)
                  objc_msgSend(v90, "addObject:", v99);
              }
            }
            v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v136, v155, 16);
          }
          while (v96);
        }

        v89 = v93;
        self = v131;
      }
      v103 = -[NEConfiguration initWithDNSProxyPayload:configurationName:grade:]([NEConfiguration alloc], v89, v9);
      -[NEProfileIngestion setIngestedConfiguration:](self, "setIngestedConfiguration:", v103);

      -[NEProfileIngestion ingestedConfiguration](self, "ingestedConfiguration");
      v104 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v104)
      {
        v54 = v89;
        v8 = v121;
        v10 = v130;
        v56 = v90;
        goto LABEL_122;
      }
      v124 = v89;
      -[NEProfileIngestion ingestedConfiguration](self, "ingestedConfiguration");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "setName:", v9);

      v134 = 0u;
      v135 = 0u;
      v132 = 0u;
      v133 = 0u;
      v56 = v90;
      v106 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v132, v154, 16);
      if (v106)
      {
        v107 = v106;
        v108 = *(_QWORD *)v133;
        do
        {
          v109 = v56;
          for (n = 0; n != v107; ++n)
          {
            if (*(_QWORD *)v133 != v108)
              objc_enumerationMutation(v109);
            v111 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * n);
            ne_log_obj();
            v112 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
            {
              v113 = (void *)objc_opt_class();
              v114 = v113;
              objc_msgSend(v111, "identifier");
              v115 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v160 = v113;
              v161 = 2112;
              v162 = v115;
              _os_log_impl(&dword_19BD16000, v112, OS_LOG_TYPE_INFO, "%@ createConfigurationFromPayload: Removing overridden DNS proxy configuration %@.", buf, 0x16u);

              self = v131;
            }

            -[NEProfileIngestion removeConfiguration:](self, "removeConfiguration:", v111);
          }
          v56 = v109;
          v107 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v132, v154, 16);
        }
        while (v107);
      }
    }

    v8 = v121;
    v54 = v124;
    v10 = v130;
LABEL_122:
    v15 = v127;
    goto LABEL_55;
  }
  v40 = 0;
LABEL_58:

  return v40;
}

- (BOOL)saveIngestedConfiguration
{
  NEProfileIngestion *v2;
  void *v3;

  v2 = self;
  -[NEProfileIngestion ingestedConfiguration](self, "ingestedConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[NEProfileIngestion saveConfiguration:returnError:](v2, v3, 0);

  return (char)v2;
}

- (BOOL)saveIngestedConfiguration:(id *)a3
{
  void *v5;

  -[NEProfileIngestion ingestedConfiguration](self, "ingestedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[NEProfileIngestion saveConfiguration:returnError:](self, v5, a3);

  return (char)a3;
}

- (BOOL)removeConfiguration:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  unint64_t i;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  BOOL v25;
  void *v26;
  NSObject *v27;
  id v29;
  void *v30;
  id v31;
  void *v32;
  int v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  int v38;
  _QWORD v39[4];
  NSObject *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "payloadInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v5, "isSetAside");

  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  if (v4)
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v29 = (id)objc_opt_class();
      objc_msgSend(v4, "name");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v47 = v29;
      v48 = 2112;
      v49 = v30;
      _os_log_debug_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEBUG, "%@ removeConfiguration: '%@'", buf, 0x16u);

    }
    -[NEProfileIngestion manager](self, "manager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C80D38];
    v9 = MEMORY[0x1E0C80D38];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __42__NEProfileIngestion_removeConfiguration___block_invoke;
    v39[3] = &unk_1E3CC3D10;
    v10 = v4;
    v40 = v10;
    v41 = &v42;
    objc_msgSend(v7, "removeConfiguration:withCompletionQueue:handler:", v10, v8, v39);

    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v31 = (id)objc_opt_class();
      -[NSObject name](v10, "name");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *((unsigned __int8 *)v43 + 24);
      *(_DWORD *)buf = 138412802;
      v47 = v31;
      v48 = 2112;
      v49 = v32;
      v50 = 1024;
      v51 = v33;
      _os_log_debug_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEBUG, "%@ removeConfiguration '%@', ok = %d", buf, 0x1Cu);

    }
    -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

    if (!v13)
    {
      for (i = 0; ; ++i)
      {
        -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = i < objc_msgSend(v15, "count");

        if (!v16)
          break;
        -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndex:", i);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "UUIDString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject identifier](v10, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "UUIDString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v20, "isEqualToString:", v22);

        if (v23)
        {
          -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "removeObjectAtIndex:", i);

          ne_log_obj();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            v36 = (id)objc_opt_class();
            -[NSObject name](v10, "name");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v47 = v36;
            v48 = 2112;
            v49 = v37;
            _os_log_debug_impl(&dword_19BD16000, v27, OS_LOG_TYPE_DEBUG, "%@ removeConfiguration '%@' from cached list", buf, 0x16u);

          }
          break;
        }

      }
    }
    if (v38)
      -[NEProfileIngestion enableAlwaysOnVpnInternal:](self, 0);
    v25 = *((_BYTE *)v43 + 24) != 0;
    v24 = v40;
  }
  else
  {
    ne_log_obj();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v34 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v47 = v34;
      v35 = v34;
      _os_log_debug_impl(&dword_19BD16000, v24, OS_LOG_TYPE_DEBUG, "%@ removeConfiguration skipped: empty configuration.", buf, 0xCu);

    }
    v25 = 1;
  }

  _Block_object_dispose(&v42, 8);
  return v25;
}

- (BOOL)removeConfigurationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NEProfileIngestion findConfigurationByConfigurationID:](self, "findConfigurationByConfigurationID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NEProfileIngestion removeConfiguration:](self, "removeConfiguration:", v5);
  }
  else
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412546;
      v10 = (id)objc_opt_class();
      v11 = 2112;
      v12 = v4;
      v8 = v10;
      _os_log_debug_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEBUG, "%@ removeConfigurationWithIdentifier failed: no configuration found with id %@", (uint8_t *)&v9, 0x16u);

    }
  }

  return 1;
}

- (id)getCertificatesForConfigurationWithIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NEProfileIngestion findConfigurationByConfigurationID:](self, "findConfigurationByConfigurationID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getCertificates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)removeIngestedConfiguration
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[NEProfileIngestion ingestedConfiguration](self, "ingestedConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412290;
      v10 = (id)objc_opt_class();
      v8 = v10;
      _os_log_debug_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEBUG, "%@ removeIngestedConfiguration skipped: current configuration does not exist", (uint8_t *)&v9, 0xCu);

    }
    return 1;
  }
  -[NEProfileIngestion ingestedConfiguration](self, "ingestedConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NEProfileIngestion removeConfiguration:](self, "removeConfiguration:", v4);

  if (v5)
  {
    -[NEProfileIngestion setIngestedConfiguration:](self, "setIngestedConfiguration:", 0);
    return 1;
  }
  return 0;
}

- (BOOL)updateDefaultAfterAddingConfiguration
{
  NEProfileIngestion *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
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
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v48;
  uint64_t v49;
  void *v50;
  NEProfileIngestion *v51;
  void *v52;
  int v53;
  void *v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  int v63;
  _BYTE v64[128];
  uint64_t v65;

  v2 = self;
  v65 = *MEMORY[0x1E0C80C00];
  -[NEProfileIngestion ingestedConfiguration](self, "ingestedConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v48 = v4;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    -[NEProfileIngestion currentConfigurations](v2, "currentConfigurations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v57;
      v50 = v5;
      v51 = v2;
      v49 = *(_QWORD *)v57;
LABEL_4:
      v9 = 0;
      v55 = v7;
      while (1)
      {
        if (*(_QWORD *)v57 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v9);
        objc_msgSend(v10, "payloadInfo");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
          goto LABEL_13;
        v12 = (void *)v11;
        objc_msgSend(v10, "payloadInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isSetAside"))
          goto LABEL_11;
        objc_msgSend(v10, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEProfileIngestion ingestedConfiguration](v2, "ingestedConfiguration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isEqual:", v16) & 1) != 0)
          break;
        objc_msgSend(v10, "payloadInfo");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "profileIdentifier");
        v52 = v14;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEProfileIngestion ingestedConfiguration](v2, "ingestedConfiguration");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "payloadInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "profileIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v17, "isEqualToString:", v20);

        v5 = v50;
        v8 = v49;

        v2 = v51;
        v7 = v55;
        if (!v53)
          goto LABEL_13;
        -[NEProfileIngestion ingestedConfiguration](v51, "ingestedConfiguration");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v23 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v23, "UUIDString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringByAppendingString:", v24);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "name");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v23) = objc_msgSend(v25, "isEqualToString:", v12);

        if ((v23 & 1) != 0)
        {
          v27 = v10;

          v2 = v51;
          if (!v27)
            goto LABEL_25;
          -[NSObject VPN](v27, "VPN");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
            -[NSObject VPN](v27, "VPN");
          else
            -[NSObject appVPN](v27, "appVPN");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          -[NEProfileIngestion ingestedConfiguration](v51, "ingestedConfiguration");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "VPN");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[NEProfileIngestion ingestedConfiguration](v51, "ingestedConfiguration");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v36;
          if (v35)
            objc_msgSend(v36, "VPN");
          else
            objc_msgSend(v36, "appVPN");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33
            && v38
            && (v39 = (void *)objc_opt_class(), objc_msgSend(v39, "isEqual:", objc_opt_class())))
          {
            ne_log_obj();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              -[NEProfileIngestion ingestedConfiguration](v51, "ingestedConfiguration");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "name");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v33, "isOnDemandEnabled");
              *(_DWORD *)buf = 138412546;
              v61 = v42;
              v62 = 1024;
              v63 = v43;
              _os_log_impl(&dword_19BD16000, v40, OS_LOG_TYPE_DEFAULT, "%@: Using onDemandEnabled setting from set-aside configuration (%d)", buf, 0x12u);

            }
            objc_msgSend(v38, "setOnDemandEnabled:", objc_msgSend(v33, "isOnDemandEnabled"));
          }
          else
          {
            ne_log_obj();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              -[NEProfileIngestion ingestedConfiguration](v51, "ingestedConfiguration");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "name");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v61 = v46;
              _os_log_impl(&dword_19BD16000, v44, OS_LOG_TYPE_DEFAULT, "%@: VPN type mis-match with set-aside configuration", buf, 0xCu);

            }
          }

          goto LABEL_41;
        }
        v5 = v50;
        v2 = v51;
        v8 = v49;
LABEL_12:

LABEL_13:
        if (v7 == ++v9)
        {
          v26 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
          v7 = v26;
          if (v26)
            goto LABEL_4;
          goto LABEL_19;
        }
      }

      v7 = v55;
LABEL_11:

      goto LABEL_12;
    }
LABEL_19:

LABEL_25:
    ne_log_obj();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      -[NEProfileIngestion ingestedConfiguration](v2, "ingestedConfiguration");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "name");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v61 = v32;
      _os_log_impl(&dword_19BD16000, v27, OS_LOG_TYPE_DEFAULT, "%@: No set-aside configuration", buf, 0xCu);

    }
LABEL_41:
    v4 = v48;
  }
  else
  {
    ne_log_obj();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      -[NEProfileIngestion ingestedConfiguration](v2, "ingestedConfiguration");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v61 = v29;
      _os_log_error_impl(&dword_19BD16000, v27, OS_LOG_TYPE_ERROR, "The ingested configuration (%@) has no name, cannot update from the set aside version of the configuration", buf, 0xCu);

    }
  }

  return v4 != 0;
}

- (BOOL)updateDefaultAfterDeletingConfiguration
{
  NSObject *v2;
  uint8_t v4[16];

  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEBUG, "To-DO: updateDefaultAfterDeletingConfiguration", v4, 2u);
  }

  return 1;
}

- (id)copyManagedConfigurationIDs
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[NEProfileIngestion currentConfigurations](self, "currentConfigurations", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v10, "payloadInfo");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "payloadUUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v10, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "UUIDString");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v14);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

  }
  v15 = (void *)objc_msgSend(v3, "copy");

  return v15;
}

- (BOOL)enableAlwaysOnVpn
{
  NSObject *v3;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = (id)objc_opt_class();
    v5 = v7;
    _os_log_debug_impl(&dword_19BD16000, v3, OS_LOG_TYPE_DEBUG, "%@ enableAlwaysOnVpn", (uint8_t *)&v6, 0xCu);

  }
  return -[NEProfileIngestion enableAlwaysOnVpnInternal:](self, 1);
}

- (BOOL)lockConfigurations
{
  NSObject *v2;
  uint8_t v4[16];

  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEBUG, "TO-DO: lockConfigurations", v4, 2u);
  }

  return 1;
}

- (void)unlockConfigurations
{
  NSObject *v2;
  uint8_t v3[16];

  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_debug_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEBUG, "TO-DO: unlockConfigurations", v3, 2u);
  }

}

- (void)enableDefaultService
{
  NSObject *v2;
  uint8_t v3[16];

  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_debug_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEBUG, "TO-DO: enableDefaultService: activate last service after removing current service", v3, 2u);
  }

}

- (BOOL)updatePerAppMappingRules:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NEProfileIngestion *v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  __CFString *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  char v49;
  void *v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t k;
  void *v58;
  NSObject *v59;
  __CFString *v60;
  NSObject *v61;
  __CFString *v62;
  void *v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  __CFString *v73;
  __CFString *v74;
  void *v75;
  void *v76;
  void *v77;
  NEPerApp *v78;
  void *v79;
  void *v80;
  void *v81;
  __CFString *v82;
  void *v83;
  void *v84;
  void *v85;
  NEPerApp *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  NEPerApp *v91;
  void *v92;
  uint64_t v93;
  __CFString *v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t m;
  void *v100;
  void *v101;
  void *v102;
  NSObject *v103;
  NSObject *v104;
  NSObject *v105;
  uint64_t v106;
  id v108;
  void *v109;
  id v110;
  __int128 v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  id v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  void *v122;
  char v123;
  __CFString *v124;
  void *v125;
  uint64_t v126;
  __CFString *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  uint64_t v132;
  NEProfileIngestion *v133;
  id obj;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  uint8_t v166[128];
  uint8_t buf[4];
  id v168;
  __int16 v169;
  id v170;
  __int16 v171;
  void *v172;
  __int16 v173;
  void *v174;
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  uint64_t v178;

  v178 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v168 = (id)objc_opt_class();
    v169 = 2112;
    v170 = v4;
    v108 = v168;
    _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "%@ updatePerAppMappingRules %@", buf, 0x16u);

  }
  v133 = self;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = 0u;
  v160 = 0u;
  v161 = 0u;
  v162 = 0u;
  obj = v4;
  v129 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v159, v177, 16);
  if (v129)
  {
    v126 = *(_QWORD *)v160;
    do
    {
      for (i = 0; i != v129; ++i)
      {
        if (*(_QWORD *)v160 != v126)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v159 + 1) + 8 * i);
        objc_msgSend(obj, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v155 = 0u;
        v156 = 0u;
        v157 = 0u;
        v158 = 0u;
        v131 = v9;
        objc_msgSend(v9, "allValues");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v155, v176, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v156;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v156 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * j);
              objc_msgSend(v6, "objectForKeyedSubscript:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v16)
              {
                objc_msgSend(MEMORY[0x1E0C99E20], "set");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v15);
              }
              objc_msgSend(v16, "addObject:", v8);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v155, v176, 16);
          }
          while (v12);
        }

      }
      v129 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v159, v177, 16);
    }
    while (v129);
  }

  ne_log_obj();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v133;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v109 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v168 = v109;
    v169 = 2112;
    v170 = v6;
    v110 = v109;
    _os_log_debug_impl(&dword_19BD16000, v17, OS_LOG_TYPE_DEBUG, "%@ updatePerAppMappingRules appIDsByPerAppUUID %@", buf, 0x16u);

  }
  v153 = 0u;
  v154 = 0u;
  v151 = 0u;
  v152 = 0u;
  -[NEProfileIngestion currentConfigurations](v133, "currentConfigurations");
  v116 = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v151, v175, 16);
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v152;
    *(_QWORD *)&v20 = 138413058;
    v111 = v20;
    v112 = *(_QWORD *)v152;
    do
    {
      v23 = 0;
      v114 = v21;
      do
      {
        if (*(_QWORD *)v152 != v22)
          objc_enumerationMutation(v116);
        v24 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * v23);
        objc_msgSend(v24, "externalIdentifier", v111);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        if (v130)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "appVPN");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v118 = v24;
          if (v25)
          {
            objc_msgSend(v24, "appVPN");
            v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v27 = CFSTR("VPNUUID");
            v124 = 0;
            v127 = CFSTR("VPNUUID");
            v28 = v26;
          }
          else
          {
            objc_msgSend(v24, "relay");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              objc_msgSend(v24, "relay");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "perApp");
              v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

              v31 = CFSTR("RelayUUID");
              v28 = 0;
              v124 = v26;
              v127 = CFSTR("RelayUUID");
            }
            else
            {
              v32 = v23;
              objc_msgSend(v24, "contentFilter");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "perApp");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              if (v34)
                objc_msgSend(v24, "contentFilter");
              else
                objc_msgSend(v24, "dnsProxy");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "perApp");
              v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v24, "contentFilter");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "perApp");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = CFSTR("ContentFilterUUID");
              if (!v37)
                v38 = CFSTR("DNSProxyUUID");
              v127 = v38;

              v28 = 0;
              v124 = v26;
              v18 = v133;
              v23 = v32;
            }
          }
          v39 = -[__CFString copyAppRuleIDs](v26, "copyAppRuleIDs");
          if (v39)
          {
            v40 = (void *)v39;
            v120 = v23;
            ne_log_obj();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              v63 = (void *)objc_opt_class();
              v64 = v63;
              objc_msgSend(v118, "name");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v111;
              v168 = v63;
              v169 = 2112;
              v170 = v65;
              v171 = 2112;
              v172 = v130;
              v173 = 2112;
              v174 = v40;
              _os_log_debug_impl(&dword_19BD16000, v41, OS_LOG_TYPE_DEBUG, "%@ updatePerAppMappingRules config %@ perAppUUID %@, existing appRules %@", buf, 0x2Au);

            }
            v149 = 0u;
            v150 = 0u;
            v147 = 0u;
            v148 = 0u;
            v42 = v40;
            v43 = -[__CFString countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v147, v166, 16);
            if (v43)
            {
              v44 = v43;
              v45 = *(_QWORD *)v148;
              do
              {
                v46 = 0;
                do
                {
                  if (*(_QWORD *)v148 != v45)
                    objc_enumerationMutation(v42);
                  v47 = *(id *)(*((_QWORD *)&v147 + 1) + 8 * v46);
                  v48 = v47;
                  if (!v18)
                  {

LABEL_49:
                    objc_msgSend(obj, "objectForKey:", v48);
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((-[NEProfileIngestion matchConfigAppUUID:configUUIDType:configAppUUID:]((uint64_t)v18, v50, v127, v130) & 1) == 0)objc_msgSend(v122, "addObject:", v48);

                    goto LABEL_52;
                  }
                  if (isAutoCreatedRule__onceToken != -1)
                    dispatch_once(&isAutoCreatedRule__onceToken, &__block_literal_global_19052);
                  v49 = objc_msgSend((id)isAutoCreatedRule__autoRuleIdentifiers, "containsObject:", v48);

                  if ((v49 & 1) == 0)
                    goto LABEL_49;
LABEL_52:
                  ++v46;
                }
                while (v44 != v46);
                v51 = -[__CFString countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v147, v166, 16);
                v44 = v51;
              }
              while (v51);
            }

            v145 = 0u;
            v146 = 0u;
            v143 = 0u;
            v144 = 0u;
            v52 = v122;
            v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v143, v165, 16);
            if (v53)
            {
              v54 = v53;
              v55 = 0;
              v56 = *(_QWORD *)v144;
              do
              {
                for (k = 0; k != v54; ++k)
                {
                  if (*(_QWORD *)v144 != v56)
                    objc_enumerationMutation(v52);
                  v58 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * k);
                  ne_log_obj();
                  v59 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v168 = v58;
                    _os_log_impl(&dword_19BD16000, v59, OS_LOG_TYPE_DEFAULT, "updatePerAppMappingRules: Removing PerApp rule for identifier %@.", buf, 0xCu);
                  }

                  if (v28)
                    v60 = v28;
                  else
                    v60 = v124;
                  if ((-[__CFString removeAppRuleByID:](v60, "removeAppRuleByID:", v58) & 1) != 0)
                  {
                    v55 = 1;
                  }
                  else
                  {
                    ne_log_obj();
                    v61 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      v168 = v58;
                      _os_log_error_impl(&dword_19BD16000, v61, OS_LOG_TYPE_ERROR, "updatePerAppMappingRules: Could not remove perApp rule for identifier %@.", buf, 0xCu);
                    }

                  }
                }
                v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v143, v165, 16);
              }
              while (v54);

              v18 = v133;
              if ((v55 & 1) != 0)
                -[NEProfileIngestion saveConfiguration:returnError:](v133, v118, 0);
            }
            else
            {

            }
            v62 = v124;
            v22 = v112;
            v21 = v114;
            v23 = v120;
          }
          else
          {
            v42 = v28;
            v28 = v124;
            v62 = v127;
          }

        }
        ++v23;
      }
      while (v23 != v21);
      v21 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v151, v175, 16);
    }
    while (v21);
  }

  v141 = 0u;
  v142 = 0u;
  v139 = 0u;
  v140 = 0u;
  -[NEProfileIngestion currentConfigurations](v18, "currentConfigurations");
  v117 = (id)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v139, v164, 16);
  if (!v66)
    goto LABEL_132;
  v67 = v66;
  v68 = *(_QWORD *)v140;
  v113 = *(_QWORD *)v140;
  do
  {
    v69 = 0;
    v115 = v67;
    do
    {
      if (*(_QWORD *)v140 != v68)
        objc_enumerationMutation(v117);
      v70 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * v69);
      objc_msgSend(v70, "externalIdentifier");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      if (v71)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", v71);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "appVPN");
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        if (v72)
        {
          objc_msgSend(v70, "appVPN");
          v132 = objc_claimAutoreleasedReturnValue();
          v73 = CFSTR("VPNUUID");
          v74 = CFSTR("VPNUUID");
        }
        else
        {
          v132 = 0;
          v73 = 0;
        }
        objc_msgSend(v70, "contentFilter");
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        if (v75)
        {
          objc_msgSend(v70, "contentFilter");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "perApp");
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v77)
          {
            v78 = objc_alloc_init(NEPerApp);
            objc_msgSend(v70, "contentFilter");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "setPerApp:", v78);

          }
          v80 = v70;
          objc_msgSend(v70, "contentFilter");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = CFSTR("ContentFilterUUID");
          goto LABEL_102;
        }
        objc_msgSend(v70, "dnsProxy");
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        if (v83)
        {
          objc_msgSend(v70, "dnsProxy");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "perApp");
          v85 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v85)
          {
            v86 = objc_alloc_init(NEPerApp);
            objc_msgSend(v70, "dnsProxy");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "setPerApp:", v86);

          }
          v80 = v70;
          objc_msgSend(v70, "dnsProxy");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = CFSTR("DNSProxyUUID");
          goto LABEL_102;
        }
        objc_msgSend(v70, "relay");
        v88 = (void *)objc_claimAutoreleasedReturnValue();

        if (v88)
        {
          objc_msgSend(v70, "relay");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "perApp");
          v90 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v90)
          {
            v91 = objc_alloc_init(NEPerApp);
            objc_msgSend(v70, "relay");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "setPerApp:", v91);

          }
          v80 = v70;
          objc_msgSend(v70, "relay");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = CFSTR("RelayUUID");
LABEL_102:
          objc_msgSend(v81, "perApp");
          v93 = objc_claimAutoreleasedReturnValue();

          v94 = v82;
          v73 = v94;
          v70 = v80;
        }
        else
        {
          v93 = 0;
        }
        if (v132 | v93)
        {
          v119 = v69;
          v137 = 0u;
          v138 = 0u;
          v135 = 0u;
          v136 = 0u;
          v95 = v121;
          v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v135, v163, 16);
          if (v96)
          {
            v97 = v96;
            v125 = (void *)v93;
            v128 = v70;
            v123 = 0;
            v98 = *(_QWORD *)v136;
            do
            {
              for (m = 0; m != v97; ++m)
              {
                if (*(_QWORD *)v136 != v98)
                  objc_enumerationMutation(v95);
                v100 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * m);
                objc_msgSend(obj, "objectForKey:", v100);
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                if ((-[NEProfileIngestion matchConfigAppUUID:configUUIDType:configAppUUID:]((uint64_t)v133, v101, v73, v71) & 1) != 0)
                {
                  v102 = (void *)v132;
                  if (!v132)
                    v102 = v125;
                  v103 = objc_msgSend(v102, "copyAppRuleByID:", v100);
                  if (!v103)
                  {
                    ne_log_obj();
                    v104 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v168 = v100;
                      _os_log_impl(&dword_19BD16000, v104, OS_LOG_TYPE_DEFAULT, "updatePerAppMappingRules: Adding PerApp rule for identifier %@.", buf, 0xCu);
                    }

                    if ((objc_msgSend(v128, "setPerAppRuleSettings:withAppIdentifier:", MEMORY[0x1E0C9AA70], v100) & 1) != 0)
                    {
                      v103 = 0;
                      v123 = 1;
                    }
                    else
                    {
                      ne_log_obj();
                      v105 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v168 = v100;
                        _os_log_error_impl(&dword_19BD16000, v105, OS_LOG_TYPE_ERROR, "updatePerAppMappingRules: Could not set PerApp rule for identifier %@", buf, 0xCu);
                      }

                      v103 = 0;
                    }
                  }
                }
                else
                {
                  ne_log_obj();
                  v103 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v168 = v100;
                    _os_log_impl(&dword_19BD16000, v103, OS_LOG_TYPE_DEFAULT, "updatePerAppMappingRules: Add for appID %@ failed - UUID/type mismatch ", buf, 0xCu);
                  }
                }

              }
              v97 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v135, v163, 16);
            }
            while (v97);

            v68 = v113;
            v67 = v115;
            v69 = v119;
            v93 = (uint64_t)v125;
            if ((v123 & 1) != 0)
              -[NEProfileIngestion saveConfiguration:returnError:](v133, v128, 0);
          }
          else
          {

            v67 = v115;
            v69 = v119;
          }
        }

      }
      ++v69;
    }
    while (v69 != v67);
    v106 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v139, v164, 16);
    v67 = v106;
  }
  while (v106);
LABEL_132:

  return 1;
}

- (BOOL)updateAppLayerVPNMappingRules:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  id v8;
  int v9;
  id v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v9 = 138412802;
    v10 = (id)objc_opt_class();
    v11 = 2080;
    v12 = "-[NEProfileIngestion updateAppLayerVPNMappingRules:]";
    v13 = 2112;
    v14 = v4;
    v8 = v10;
    _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "%@ %s %@", (uint8_t *)&v9, 0x20u);

  }
  v6 = -[NEProfileIngestion updatePerAppMappingRules:](self, "updatePerAppMappingRules:", v4);

  return v6;
}

- (BOOL)updateAccountIdentifiers:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v29;
  id obj;
  NEProfileIngestion *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v31 = self;
  -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v4)
  {
    v5 = v4;
    v32 = *(_QWORD *)v38;
    v6 = 1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v38 != v32)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v8, "appVPN");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          v10 = objc_msgSend(&unk_1E3D03AD0, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v34;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v34 != v12)
                  objc_enumerationMutation(&unk_1E3D03AD0);
                v14 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
                objc_msgSend(v8, "appVPN");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "removeAppRuleByID:", v14);

              }
              v11 = objc_msgSend(&unk_1E3D03AD0, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            }
            while (v11);
          }
          objc_msgSend(v8, "externalIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v8, "externalIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKeyedSubscript:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v18, "mailAccountIdentifiers");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "count");

            if (v20)
            {
              objc_msgSend(v18, "mailAccountIdentifiers");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setMailDomains:accountIdentifiers:", 0, v21);

            }
            objc_msgSend(v18, "calendarAccountIdentifiers");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "count");

            if (v23)
            {
              objc_msgSend(v18, "calendarAccountIdentifiers");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setCalendarDomains:accountIdentifiers:", 0, v24);

            }
            objc_msgSend(v18, "contactsAccountIdentifiers");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "count");

            if (v26)
            {
              objc_msgSend(v18, "contactsAccountIdentifiers");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setContactsDomains:accountIdentifiers:", 0, v27);

            }
          }
          v6 &= -[NEProfileIngestion saveConfiguration:returnError:](v31, v8, 0);
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6 & 1;
}

- (BOOL)updateManagedAppRules:(id)a3
{
  NSObject *v4;
  __int128 v5;
  uint64_t i;
  void *v7;
  void *Property;
  const char *v9;
  void *v10;
  id v11;
  int v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  id v41;
  void *v42;
  void *v43;
  char v44;
  uint64_t v45;
  NEPathRule *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t k;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v65;
  __int128 v66;
  id v67;
  id obj;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  NEProfileIngestion *v73;
  void *v74;
  id v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  id v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  uint8_t v110[128];
  uint8_t buf[4];
  id v112;
  __int16 v113;
  id v114;
  __int16 v115;
  void *v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v67 = a3;
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v112 = (id)objc_opt_class();
    v113 = 2112;
    v114 = v67;
    v65 = v112;
    _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "%@ updateManagedAppRules %@", buf, 0x16u);

  }
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
  if (v70)
  {
    v69 = *(_QWORD *)v96;
    *(_QWORD *)&v5 = 138412802;
    v66 = v5;
    v73 = self;
    do
    {
      for (i = 0; i != v70; ++i)
      {
        if (*(_QWORD *)v96 != v69)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
        if (objc_msgSend(v7, "grade", v66) != 1)
          continue;
        v71 = i;
        objc_msgSend(v7, "pathController");
        Property = (void *)objc_claimAutoreleasedReturnValue();
        v10 = Property;
        if (Property)
          Property = objc_getProperty(Property, v9, 32, 1);
        v11 = Property;
        v12 = isa_nsarray(v11);

        i = v71;
        if (!v12)
          continue;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = 0u;
        v92 = 0u;
        v93 = 0u;
        v94 = 0u;
        v75 = v67;
        v79 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v91, v108, 16);
        if (!v79)
          goto LABEL_70;
        v78 = *(_QWORD *)v92;
        v74 = v7;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v92 != v78)
              objc_enumerationMutation(v75);
            v14 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v13);
            if (isa_nsstring(v14))
            {
              v15 = v14;
              v16 = v7;
              v85 = v15;
              if (self)
              {
                objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("*"));
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v103 = 0u;
                v104 = 0u;
                v105 = 0u;
                v106 = 0u;
                objc_msgSend(v16, "pathController");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = v18;
                if (v18)
                  v18 = objc_getProperty(v18, v19, 32, 1);
                v76 = v16;
                v77 = v13;
                v21 = v18;

                v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v103, buf, 16);
                if (v22)
                {
                  v23 = v22;
                  v24 = 0;
                  v25 = 0;
                  v26 = *(_QWORD *)v104;
                  v80 = *(_QWORD *)v104;
                  v81 = v21;
                  do
                  {
                    v27 = 0;
                    v82 = v23;
                    do
                    {
                      if (*(_QWORD *)v104 != v26)
                      {
                        v28 = v27;
                        objc_enumerationMutation(v21);
                        v27 = v28;
                      }
                      v84 = v27;
                      v29 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v27);
                      if (isa_nsdictionary(v29))
                      {
                        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("AppIdentifierMatches"));
                        v30 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v30)
                        {
                          v86 = v29;
                          v31 = v30;
                          if (isa_nsarray(v30))
                          {
                            v101 = 0u;
                            v102 = 0u;
                            v99 = 0u;
                            v100 = 0u;
                            v83 = v31;
                            v32 = v31;
                            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v99, v110, 16);
                            if (v33)
                            {
                              v34 = v33;
                              v35 = *(_QWORD *)v100;
                              do
                              {
                                for (j = 0; j != v34; ++j)
                                {
                                  if (*(_QWORD *)v100 != v35)
                                    objc_enumerationMutation(v32);
                                  v37 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * j);
                                  if (isa_nsstring(v37))
                                  {
                                    objc_msgSend(v37, "stringByTrimmingCharactersInSet:", v17);
                                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                                    if (objc_msgSend(v15, "hasPrefix:", v38))
                                    {
                                      v39 = objc_msgSend(v38, "length");
                                      v40 = v39;
                                      if (!v25 || v24 < v39)
                                      {
                                        v41 = v86;

                                        v24 = v40;
                                        v25 = v41;
                                        v15 = v85;
                                      }
                                    }

                                  }
                                }
                                v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v99, v110, 16);
                              }
                              while (v34);
                            }

                            v26 = v80;
                            v21 = v81;
                            v23 = v82;
                            v30 = v83;
                          }
                          else
                          {
                            v30 = v31;
                          }
                        }
                        else if (!v25)
                        {
                          v25 = v29;
                          v30 = 0;
                          v24 = 0;
                        }

                      }
                      v27 = v84 + 1;
                    }
                    while (v84 + 1 != v23);
                    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v103, buf, 16);
                  }
                  while (v23);
                }
                else
                {
                  v25 = 0;
                }

                self = v73;
                v7 = v74;
                v16 = v76;
                v13 = v77;
              }
              else
              {
                v25 = 0;
              }

              if (isa_nsdictionary(v25))
              {
                objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("AllowRoamingCellularData"));
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("AllowCellularData"));
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                if (isa_nsnumber(v42))
                {
                  v44 = objc_msgSend(v42, "BOOLValue");
                  if ((isa_nsnumber(v43) & 1) == 0)
                  {
                    if ((v44 & 1) == 0)
                    {
                      v45 = 0;
                      goto LABEL_61;
                    }
                    goto LABEL_64;
                  }
                }
                else
                {
                  if (!isa_nsnumber(v43))
                    goto LABEL_64;
                  v44 = 1;
                }
                v45 = objc_msgSend(v43, "BOOLValue") ^ 1;
                if ((v45 & 1) != 0 || (v44 & 1) == 0)
                {
LABEL_61:
                  v46 = -[NEAppRule initWithSigningIdentifier:]([NEPathRule alloc], "initWithSigningIdentifier:", v85);
                  -[NEPathRule setCellularBehavior:](v46, "setCellularBehavior:", v45);
                  if (v46)
                    objc_msgSend(v72, "addObject:", v46);

                }
LABEL_64:

              }
            }
            ++v13;
          }
          while (v13 != v79);
          v47 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v91, v108, 16);
          v79 = v47;
        }
        while (v47);
LABEL_70:

        ne_log_obj();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          v61 = (void *)objc_opt_class();
          v62 = v61;
          objc_msgSend(v7, "name");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v66;
          v112 = v61;
          v113 = 2112;
          v114 = v63;
          v115 = 2112;
          v116 = v72;
          _os_log_debug_impl(&dword_19BD16000, v48, OS_LOG_TYPE_DEBUG, "%@ newPathRules for %@: %@", buf, 0x20u);

        }
        objc_msgSend(v7, "pathController");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "pathRules");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "count");
        v52 = v72;
        v53 = objc_msgSend(v72, "count");

        if (v51 == v53)
        {
          v89 = 0u;
          v90 = 0u;
          v87 = 0u;
          v88 = 0u;
          objc_msgSend(v7, "pathController");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "pathRules");
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v87, v107, 16);
          if (v56)
          {
            v57 = v56;
            v58 = *(_QWORD *)v88;
            while (2)
            {
              for (k = 0; k != v57; ++k)
              {
                if (*(_QWORD *)v88 != v58)
                  objc_enumerationMutation(v55);
                if (!objc_msgSend(v72, "containsObject:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * k)))
                {

                  v52 = v72;
                  goto LABEL_83;
                }
              }
              v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v87, v107, 16);
              if (v57)
                continue;
              break;
            }
          }

          v52 = v72;
        }
        else
        {
LABEL_83:
          objc_msgSend(v7, "pathController");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "setPathRules:", v52);

          -[NEProfileIngestion saveConfiguration:returnError:](self, v7, 0);
        }

        i = v71;
      }
      v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
    }
    while (v70);
  }

  return 1;
}

- (NSString)clientName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)payloadType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NEConfigurationManager)manager
{
  return (NEConfigurationManager *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableArray)currentConfigurations
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentConfigurations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NEConfiguration)ingestedConfiguration
{
  return (NEConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIngestedConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ingestedConfiguration, 0);
  objc_storeStrong((id *)&self->_currentConfigurations, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_payloadType, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
}

- (BOOL)saveConfiguration:(_QWORD *)a3 returnError:
{
  id v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  _BOOL8 v16;
  id v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(_QWORD *, void *);
  void *v28;
  void *v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 0;
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__18982;
    v37 = __Block_byref_object_dispose__18983;
    v38 = 0;
    if (!v5
      || (objc_msgSend(v5, "name"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "length") == 0,
          v7,
          v8))
    {
      ne_log_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v44 = v23;
        v24 = v23;
        _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, "%@ saveConfigurationByConfiguration failed: empty configuration or configuration name", buf, 0xCu);

      }
    }
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v18 = (id)objc_opt_class();
      objc_msgSend(v6, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v44 = v18;
      v45 = 2112;
      v46 = v19;
      _os_log_debug_impl(&dword_19BD16000, v10, OS_LOG_TYPE_DEBUG, "%@ saveConfiguration: '%@'", buf, 0x16u);

    }
    objc_msgSend(a1, "manager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C80D38];
    v13 = MEMORY[0x1E0C80D38];
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __52__NEProfileIngestion_saveConfiguration_returnError___block_invoke;
    v28 = &unk_1E3CC35E0;
    v29 = a1;
    v14 = v6;
    v30 = v14;
    v31 = &v33;
    v32 = &v39;
    objc_msgSend(v11, "saveConfiguration:withCompletionQueue:handler:", v14, v12, &v25);

    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v20 = (id)objc_opt_class();
      objc_msgSend(v14, "name", v25, v26, v27, v28, v29);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *((unsigned __int8 *)v40 + 24);
      *(_DWORD *)buf = 138413058;
      v44 = v20;
      v45 = 2112;
      v46 = v21;
      v47 = 1024;
      v48 = v22;
      v49 = 2112;
      v50 = v14;
      _os_log_debug_impl(&dword_19BD16000, v15, OS_LOG_TYPE_DEBUG, "%@ saveConfiguration '%@', ok = %d, configuration %@", buf, 0x26u);

    }
    if (a3)
      *a3 = objc_retainAutorelease((id)v34[5]);
    v16 = *((_BYTE *)v40 + 24) != 0;

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v39, 8);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __52__NEProfileIngestion_saveConfiguration_returnError___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "code") != 9)
  {
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_opt_class();
      v15 = (void *)a1[5];
      v16 = v14;
      objc_msgSend(v15, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      convert_error_to_string(v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412802;
      v20 = v14;
      v21 = 2112;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      _os_log_error_impl(&dword_19BD16000, v11, OS_LOG_TYPE_ERROR, "%@ Error occurred when saving configuration '%@': %@", (uint8_t *)&v19, 0x20u);

    }
    v12 = *(_QWORD *)(a1[6] + 8);
    v13 = v4;
    v5 = *(NSObject **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v13;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (void *)objc_opt_class();
      v7 = (void *)a1[5];
      v8 = v6;
      objc_msgSend(v7, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      convert_error_to_string(v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412802;
      v20 = v6;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v10;
      _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "%@ saved configuration '%@': %@", (uint8_t *)&v19, 0x20u);

    }
  }

}

- (uint64_t)matchConfigAppUUID:(void *)a3 configUUIDType:(void *)a4 configAppUUID:
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", v14, (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isEqual:", v8) && objc_msgSend(v15, "isEqual:", v9))
          {

            v11 = 1;
            goto LABEL_13;
          }

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __40__NEProfileIngestion_isAutoCreatedRule___block_invoke()
{
  void *v0;

  v0 = (void *)isAutoCreatedRule__autoRuleIdentifiers;
  isAutoCreatedRule__autoRuleIdentifiers = (uint64_t)&unk_1E3D03AB8;

}

- (uint64_t)enableAlwaysOnVpnInternal:(void *)a1
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  id v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  void *v29;
  id v30;
  const char *v31;
  void *v32;
  char v33;
  _BOOL4 v34;
  uint64_t v35;
  void *v37;
  id v38;
  const char *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  const char *v45;
  id v46;
  void *v47;
  int v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  _QWORD v57[2];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = a1;
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v55 = (id)objc_opt_class();
    v56 = 1024;
    LODWORD(v57[0]) = a2;
    v41 = v55;
    _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "%@ enableAlwaysOnVpnInternal with sanityCheck %d", buf, 0x12u);

  }
  objc_msgSend(v3, "loadConfigurationsForceReloadFromDisk");
  objc_msgSend(v3, "currentConfigurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(v3, "currentConfigurations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (v7)
    {
      v8 = v7;
      v48 = a2;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = *(_QWORD *)v51;
      v49 = v3;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v51 != v12)
            objc_enumerationMutation(v6);
          v14 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          objc_msgSend(v14, "alwaysOnVPN");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v16 = v14;

            -[NSObject payloadInfo](v16, "payloadInfo");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isSetAside");

            ne_log_obj();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              v20 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412546;
              v55 = v20;
              v56 = 2112;
              v57[0] = v16;
              v21 = v20;
              _os_log_debug_impl(&dword_19BD16000, v19, OS_LOG_TYPE_DEBUG, "%@ enableAlwaysOnVpnInternal: Always-On VPN configs found %@", buf, 0x16u);

              v3 = v49;
            }
            ++v11;
            v10 += v18;

            v9 = v16;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      }
      while (v8);

      if (v11 >= 2)
      {
        if (v48)
        {
          ne_log_obj();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v11 == 2 && v10 == 1)
          {
            if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
LABEL_28:

              goto LABEL_30;
            }
            v24 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412802;
            v55 = v24;
            v56 = 1024;
            LODWORD(v57[0]) = 2;
            WORD2(v57[0]) = 1024;
            *(_DWORD *)((char *)v57 + 6) = 1;
            v25 = v24;
            v26 = "%@ enableAlwaysOnVpnInternal: Sanity check OK, %d Always-On VPN configs found (%d set aside).";
            v27 = v23;
            v28 = 24;
LABEL_42:
            _os_log_debug_impl(&dword_19BD16000, v27, OS_LOG_TYPE_DEBUG, v26, buf, v28);

            goto LABEL_28;
          }
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
LABEL_38:

            v35 = 0;
            goto LABEL_31;
          }
          v47 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412802;
          v55 = v47;
          v56 = 1024;
          LODWORD(v57[0]) = v11;
          WORD2(v57[0]) = 1024;
          *(_DWORD *)((char *)v57 + 6) = v10;
          v38 = v47;
          v39 = "%@ enableAlwaysOnVpnInternal: Sanity check failed. %d Always-On VPN configs found (%d set aside). Enabli"
                "ng will be disallowed.";
        }
        else
        {
          ne_log_obj();
          v23 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            goto LABEL_38;
          v37 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412802;
          v55 = v37;
          v56 = 1024;
          LODWORD(v57[0]) = v11;
          WORD2(v57[0]) = 1024;
          *(_DWORD *)((char *)v57 + 6) = v10;
          v38 = v37;
          v39 = "%@ enableAlwaysOnVpnInternal: %d Always-On VPN configs found (%d set aside), skip enabling new AOVpn configs.";
        }
        _os_log_error_impl(&dword_19BD16000, v23, OS_LOG_TYPE_ERROR, v39, buf, 0x18u);

        goto LABEL_38;
      }
      if (v9)
      {
        -[NSObject alwaysOnVPN](v9, "alwaysOnVPN");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "isEnabled");

        ne_log_obj();
        v23 = objc_claimAutoreleasedReturnValue();
        v34 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
        if ((v33 & 1) == 0)
        {
          if (v34)
          {
            v44 = (void *)objc_opt_class();
            v45 = "";
            if (v48)
              v45 = " anyway";
            *(_DWORD *)buf = 138412546;
            v55 = v44;
            v56 = 2080;
            v57[0] = v45;
            v46 = v44;
            _os_log_debug_impl(&dword_19BD16000, v23, OS_LOG_TYPE_DEBUG, "%@ enableAlwaysOnVpnInternal: enable the only Always-On VPN config%s.", buf, 0x16u);

          }
          -[NSObject alwaysOnVPN](v9, "alwaysOnVPN");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 1;
          objc_msgSend(v40, "setEnabled:", 1);

          -[NEProfileIngestion saveConfiguration:returnError:](v3, v9, 0);
          goto LABEL_31;
        }
        if (!v34)
          goto LABEL_28;
        v43 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v55 = v43;
        v25 = v43;
        v26 = "%@ enableAlwaysOnVpnInternal: the only Always-On VPN config is already enabled.";
        v27 = v23;
        v28 = 12;
        goto LABEL_42;
      }
    }
    else
    {

    }
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      goto LABEL_30;
    v42 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v55 = v42;
    v30 = v42;
    v31 = "%@ enableAlwaysOnVpnInternal: no Always-On VPN configs to enable";
LABEL_40:
    _os_log_debug_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEBUG, v31, buf, 0xCu);

    goto LABEL_30;
  }
  ne_log_obj();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v29 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v55 = v29;
    v30 = v29;
    v31 = "%@ enableAlwaysOnVpnInternal: empty configuration database";
    goto LABEL_40;
  }
LABEL_30:
  v35 = 1;
LABEL_31:

  return v35;
}

void __42__NEProfileIngestion_removeConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      convert_error_to_string(v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "Error occurred when removing configurations '%@': %@", (uint8_t *)&v7, 0x16u);

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

uint64_t __65__NEProfileIngestion_createConfigurationFromPayload_payloadType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPluginUpgradeInfo:", a2);
}

uint64_t __65__NEProfileIngestion_removeAllConfigurationsWithPayload_profile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "payloadInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "payloadInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "payloadUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32)))
      {
        objc_msgSend(v3, "payloadInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "profileUUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 40));

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __58__NEProfileIngestion_loadConfigurationsWithRefreshOption___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      convert_error_to_string(v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v14;
      _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "loadConfigurationsWithRefreshOption Failed to load the current configurations: %@", (uint8_t *)&v15, 0xCu);

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  v8 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "setCurrentConfigurations:", v8);

  objc_msgSend(*(id *)(a1 + 32), "ingestedConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "ingestedConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "findConfigurationByConfigurationID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(*(id *)(a1 + 32), "setIngestedConfiguration:", v13);

  }
}

+ (id)getServiceIDForPayload:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  const __SCPreferences *v6;
  const __SCPreferences *v7;
  CFArrayRef v8;
  CFArrayRef v9;
  NSObject *v10;
  const __CFArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  const __SCNetworkService *v16;
  const __SCNetworkProtocol *v17;
  const __SCNetworkProtocol *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v27;
  void *v28;
  id v29;
  NSObject *log;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PayloadType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v37 = (uint64_t)v3;
    _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "getServiceIDForPayload start with payload stub %@", buf, 0xCu);
  }

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.vpn.managed")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.vpn.managed.applayer")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.vpn.managed.alwayson")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.webcontent-filter")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.networkusagerules")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.dnsSettings.managed")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.relay.managed")) & 1) == 0)
  {
    ne_log_obj();
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19BD16000, log, OS_LOG_TYPE_DEBUG, "getServiceIDForPayload: ignore non-NetworkExtension payload", buf, 2u);
    }
    goto LABEL_40;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PayloadUUID"));
  log = objc_claimAutoreleasedReturnValue();
  if (!log)
  {
    ne_log_obj();
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, log, OS_LOG_TYPE_ERROR, "getServiceIDForPayload payload stub has no payload UUID", buf, 2u);
    }
    goto LABEL_40;
  }
  v6 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("NEProfileIngestion Migrator"), 0);
  if (!v6)
  {
    ne_log_obj();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v24, OS_LOG_TYPE_ERROR, "getServiceIDForPayload failed to create SCPreference", buf, 2u);
    }

LABEL_40:
    v22 = 0;
    goto LABEL_49;
  }
  v7 = v6;
  v8 = SCNetworkServiceCopyAll(v6);
  if (!v8)
  {
    v22 = 0;
    goto LABEL_46;
  }
  v9 = v8;
  ne_log_obj();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v27 = -[__CFArray count](v9, "count");
    *(_DWORD *)buf = 134217984;
    v37 = v27;
    _os_log_debug_impl(&dword_19BD16000, v10, OS_LOG_TYPE_DEBUG, "getServiceIDForPayload found %lu services", buf, 0xCu);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v11 = v9;
  v12 = -[__CFArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (!v12)
  {
    v22 = 0;
    goto LABEL_45;
  }
  v13 = v12;
  v28 = v4;
  v29 = v3;
  v14 = *(_QWORD *)v32;
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v32 != v14)
        objc_enumerationMutation(v11);
      v16 = *(const __SCNetworkService **)(*((_QWORD *)&v31 + 1) + 8 * i);
      if (!v16
        || (v17 = SCNetworkServiceCopyProtocol(*(SCNetworkServiceRef *)(*((_QWORD *)&v31 + 1) + 8 * i), CFSTR("com.apple.payload"))) == 0)
      {
        v20 = 0;
        v21 = 0;
        goto LABEL_32;
      }
      v18 = v17;
      SCNetworkProtocolGetConfiguration(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (!v19)
      {
        v21 = 0;
LABEL_31:
        CFRelease(v18);
        goto LABEL_32;
      }
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("PayloadUUID"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!isa_nsstring(v21) || !objc_msgSend(v21, "isEqualToString:", log))
        goto LABEL_31;
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", SCNetworkServiceGetServiceID(v16));
      ne_log_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = (uint64_t)v22;
        _os_log_impl(&dword_19BD16000, v23, OS_LOG_TYPE_DEFAULT, "getServiceIDForPayload found matching service '%@'", buf, 0xCu);
      }

      CFRelease(v18);
      if (v22)
      {

        goto LABEL_43;
      }
LABEL_32:

    }
    v13 = -[__CFArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v13)
      continue;
    break;
  }
  v22 = 0;
LABEL_43:
  v4 = v28;
  v3 = v29;
LABEL_45:

  CFRelease(v11);
LABEL_46:
  CFRelease(v7);
  ne_log_obj();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v37 = (uint64_t)v22;
    _os_log_debug_impl(&dword_19BD16000, v25, OS_LOG_TYPE_DEBUG, "getServiceIDForPayload found matching service %@", buf, 0xCu);
  }

LABEL_49:
  return v22;
}

@end
