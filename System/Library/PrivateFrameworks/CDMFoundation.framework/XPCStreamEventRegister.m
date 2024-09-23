@implementation XPCStreamEventRegister

+ (id)registerFromDagServiceNames:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t i;
  Class v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  objc_class *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v37;
  __int128 v38;
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
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v3;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v46 != v34)
          objc_enumerationMutation(obj);
        v7 = NSClassFromString(*(NSString **)(*((_QWORD *)&v45 + 1) + 8 * i));
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v32 = v7;
          v33 = i;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          -[objc_class xpcEventStreamsSupported](v7, "xpcEventStreamsSupported");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v42;
            do
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v42 != v11)
                  objc_enumerationMutation(v8);
                v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
                objc_msgSend(v13, "streamName");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "eventName");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(a1, "_registrationKeyFromStreamName:eventName:", v14, v15);
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v4, "objectForKey:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v17)
                {
                  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "setValue:forKey:", v18, v16);

                }
                objc_msgSend(v4, "objectForKey:", v16);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "addObject:", v13);

              }
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
            }
            while (v10);
          }

          v7 = v32;
          i = v33;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          -[objc_class xpcActivitySupported](v7, "xpcActivitySupported");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v38;
            do
            {
              for (k = 0; k != v22; ++k)
              {
                if (*(_QWORD *)v38 != v23)
                  objc_enumerationMutation(v20);
                v25 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * k);
                objc_msgSend(v5, "objectForKey:", v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v26)
                {
                  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "setValue:forKey:", v27, v25);

                }
                objc_msgSend(v5, "objectForKey:", v25);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "addObject:", v7);

              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
            }
            while (v22);
          }

        }
      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v35);
  }

  objc_msgSend(a1, "registerWithRegistrations:withActivityServicesMap:", v4, v5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

+ (id)_registrationKeyFromStreamName:(id)a3 eventName:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), a3, a4);
}

+ (XPCStreamEventRegister)registerWithRegistrations:(id)a3 withActivityServicesMap:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[XPCStreamEventRegister _initWithRegistrationsMap:withActivityServicesMap:]([XPCStreamEventRegister alloc], "_initWithRegistrationsMap:withActivityServicesMap:", v6, v5);

  return (XPCStreamEventRegister *)v7;
}

- (id)_initWithRegistrationsMap:(id)a3 withActivityServicesMap:(id)a4
{
  id v7;
  id v8;
  XPCStreamEventRegister *v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)XPCStreamEventRegister;
  v9 = -[XPCStreamEventRegister init](&v12, sel_init);
  objc_storeStrong((id *)&v9->_registrationsMap, a3);
  objc_storeStrong((id *)&v9->_activityServicesMap, a4);
  CDMOSLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[XPCStreamEventRegister _initWithRegistrationsMap:withActivityServicesMap:]";
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    _os_log_debug_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_DEBUG, "%s Registered with xpc events:\n%@\n and activities\n%@", buf, 0x20u);
  }

  return v9;
}

- (id)handleableXPCEventStreams
{
  void *v3;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_registrationsMap;
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        -[NSDictionary objectForKeyedSubscript:](self->_registrationsMap, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8), (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "streamName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)handleableXPCActivities
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  __CFString *v11;
  xpc_object_t v12;
  void *v13;
  xpc_object_t v14;
  const __CFString *v15;
  char *v17;
  char *v18;
  char *v19;
  char *string;
  int64_t v21;
  const char *v22;
  char *key;
  char *v24;
  char *v25;
  int64_t v26;
  const char *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[NSDictionary allKeys](self->_activityServicesMap, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    key = (char *)*MEMORY[0x24BDAC680];
    v21 = *MEMORY[0x24BDAC628];
    v22 = (const char *)*MEMORY[0x24BDAC5D8];
    v8 = (const char *)*MEMORY[0x24BDAC6B8];
    v9 = (const char *)*MEMORY[0x24BDAC698];
    v19 = (char *)*MEMORY[0x24BDAC6E0];
    string = (char *)*MEMORY[0x24BDAC6A8];
    v17 = (char *)*MEMORY[0x24BDAC6D0];
    v18 = (char *)*MEMORY[0x24BDAC598];
    v26 = *MEMORY[0x24BDAC600];
    v27 = (const char *)*MEMORY[0x24BDAC5F0];
    v24 = (char *)*MEMORY[0x24BDAC6E8];
    v25 = (char *)*MEMORY[0x24BDAC6A0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v4);
        v11 = *(__CFString **)(*((_QWORD *)&v28 + 1) + 8 * v10);
        if (v11 == CFSTR("com.apple.siri.cdm.xpc_activity.maintenance"))
        {
          v12 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_int64(v12, v27, v26);
          xpc_dictionary_set_BOOL(v12, v8, 1);
          xpc_dictionary_set_string(v12, v9, v25);
          xpc_dictionary_set_BOOL(v12, v24, 1);
          v13 = v3;
          v14 = v12;
          v15 = CFSTR("com.apple.siri.cdm.xpc_activity.maintenance");
        }
        else
        {
          if (v11 != CFSTR("com.apple.siri.cdm.xpc_activity.post_install"))
            goto LABEL_11;
          v12 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_BOOL(v12, key, 1);
          xpc_dictionary_set_int64(v12, v22, v21);
          xpc_dictionary_set_BOOL(v12, v8, 0);
          xpc_dictionary_set_string(v12, v9, string);
          xpc_dictionary_set_BOOL(v12, v19, 1);
          xpc_dictionary_set_BOOL(v12, v18, 1);
          xpc_dictionary_set_BOOL(v12, v17, 1);
          v13 = v3;
          v14 = v12;
          v15 = CFSTR("com.apple.siri.cdm.xpc_activity.post_install");
        }
        objc_msgSend(v13, "setObject:forKey:", v14, v15);

LABEL_11:
        ++v10;
      }
      while (v6 != v10);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)handleXPCEvent:(id)a3 fromStream:(id)a4 currentConfig:(id)a5 withSelfMetadata:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  BOOL v27;
  NSObject *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[XPCStreamEventUtils getXPCEventName:](XPCStreamEventUtils, "getXPCEventName:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend((id)objc_opt_class(), "_registrationKeyFromStreamName:eventName:", v11, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_registrationsMap, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16 != 0;
    CDMOSLoggerForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
    if (v16)
    {
      if (v19)
      {
        *(_DWORD *)buf = 136315650;
        v37 = "-[XPCStreamEventRegister handleXPCEvent:fromStream:currentConfig:withSelfMetadata:]";
        v38 = 2112;
        v39 = v14;
        v40 = 2112;
        v41 = v11;
        _os_log_debug_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_DEBUG, "%s Found matching registrations for XPC event %@ from stream %@. Calling handlers.", buf, 0x20u);
      }

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v30 = v16;
      v18 = v16;
      v20 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v20)
      {
        v21 = v20;
        v27 = v17;
        v28 = v15;
        v29 = v14;
        v22 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v32 != v22)
              objc_enumerationMutation(v18);
            v24 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            objc_msgSend(v12, "assetCollection");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "invoke:fromStream:withAssets:withSelfMetadata:", v10, v11, v25, v13);

          }
          v21 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        }
        while (v21);
        v15 = v28;
        v14 = v29;
        v17 = v27;
      }
      v16 = v30;
    }
    else if (v19)
    {
      *(_DWORD *)buf = 136315650;
      v37 = "-[XPCStreamEventRegister handleXPCEvent:fromStream:currentConfig:withSelfMetadata:]";
      v38 = 2112;
      v39 = v14;
      v40 = 2112;
      v41 = v11;
      _os_log_debug_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_DEBUG, "%s There was no matching registration for XPC event %@ from stream %@. Doing nothing.", buf, 0x20u);
    }

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[XPCStreamEventRegister handleXPCEvent:fromStream:currentConfig:withSelfMetadata:]";
      _os_log_error_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_ERROR, "%s [ERR]: Error extracting XPC event name", buf, 0xCu);
    }
    v17 = 0;
  }

  return v17;
}

- (BOOL)handleXPCActivity:(id)a3 fromIdentifier:(id)a4 withAssetCollection:(id)a5 withSelfMetadata:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  objc_class *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v26 = a5;
  v10 = a6;
  v11 = v9;
  -[NSDictionary objectForKeyedSubscript:](self->_activityServicesMap, "objectForKeyedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v13);
          v18 = *(objc_class **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v19 = objc_opt_respondsToSelector();
          CDMOSLoggerForCategory(0);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if ((v19 & 1) != 0)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromClass(v18);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v33 = "-[XPCStreamEventRegister handleXPCActivity:fromIdentifier:withAssetCollection:withSelfMetadata:]";
              v34 = 2112;
              v35 = v23;
              _os_log_debug_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_DEBUG, "%s Calling handleXPCActivity on service %@", buf, 0x16u);

            }
            -[objc_class handleXPCActivity:withAssets:withSelfMetadata:](v18, "handleXPCActivity:withAssets:withSelfMetadata:", v11, v26, v10);
          }
          else
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              NSStringFromClass(v18);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v33 = "-[XPCStreamEventRegister handleXPCActivity:fromIdentifier:withAssetCollection:withSelfMetadata:]";
              v34 = 2112;
              v35 = v22;
              _os_log_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_INFO, "%s [WARN]: Found service [%@] that does not support handleXPCActivity yet is registered for an activity?", buf, 0x16u);

            }
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v15);
    }
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[XPCStreamEventRegister handleXPCActivity:fromIdentifier:withAssetCollection:withSelfMetadata:]";
      v34 = 2112;
      v35 = v9;
      _os_log_debug_impl(&dword_21A2A0000, v24, OS_LOG_TYPE_DEBUG, "%s There were no services found supporting xpc activity: %@. Doing nothing.", buf, 0x16u);
    }

  }
  return v13 != 0;
}

- (NSDictionary)registrationsMap
{
  return self->_registrationsMap;
}

- (NSDictionary)activityServicesMap
{
  return self->_activityServicesMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityServicesMap, 0);
  objc_storeStrong((id *)&self->_registrationsMap, 0);
}

+ (id)emptyRegister
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "registerWithRegistrations:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (XPCStreamEventRegister)registerWithRegistrations:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[XPCStreamEventRegister registerWithRegistrations:withActivityServicesMap:](XPCStreamEventRegister, "registerWithRegistrations:withActivityServicesMap:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (XPCStreamEventRegister *)v6;
}

@end
