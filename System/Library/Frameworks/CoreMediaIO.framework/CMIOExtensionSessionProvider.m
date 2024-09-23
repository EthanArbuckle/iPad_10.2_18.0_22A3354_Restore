@implementation CMIOExtensionSessionProvider

+ (CMIOExtensionSessionProvider)sessionProviderWithEndpoint:(id)a3 delegate:(id)a4
{
  return (CMIOExtensionSessionProvider *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEndpoint:delegate:", a3, a4);
}

- (CMIOExtensionSessionProvider)initWithEndpoint:(id)a3 delegate:(id)a4
{
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  CMIOExtensionSessionProvider *v10;
  CMIOExtensionSessionProvider *v12;
  xpc_connection_t v13;
  xpc_connection_t v14;
  CMIOExtensionProviderHostContext *hostContext;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  _QWORD v19[5];
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  CMIOExtensionSessionProvider *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (!a3 || MEMORY[0x23492FDC4](a3, a2) != MEMORY[0x24BDACFB0])
  {

    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = *MEMORY[0x24BDBCAB8];
    v9 = CFSTR("Invalid argument - endpoint");
LABEL_4:
    objc_msgSend(v7, "raise:format:", v8, v9);
    return 0;
  }
  v20.receiver = self;
  v20.super_class = (Class)CMIOExtensionSessionProvider;
  v12 = -[CMIOExtensionSessionProvider init](&v20, sel_init);
  v10 = v12;
  if (!v12)
    return v10;
  v12->_lock._os_unfair_lock_opaque = 0;
  v13 = xpc_connection_create_from_endpoint((xpc_endpoint_t)a3);
  if (!v13)
  {

    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = *MEMORY[0x24BDBCAB8];
    v9 = CFSTR("Invalid connection");
    goto LABEL_4;
  }
  v14 = v13;
  v10->_hostContext = -[CMIOExtensionProviderHostContext initWithConnection:delegate:]([CMIOExtensionProviderHostContext alloc], "initWithConnection:delegate:", v13, v10);
  xpc_release(v14);
  objc_storeWeak((id *)&v10->_delegate, a4);
  v10->_deviceIDs = (NSArray *)objc_opt_new();
  v10->_devicesMap = (NSMutableDictionary *)objc_opt_new();
  v10->_streamsMap = (NSMutableDictionary *)objc_opt_new();
  v10->_description = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<CMIOExtensionSessionProvider> provider bundleID %@ endpoint %p"), (id)objc_msgSend(a4, "copyProviderBundleID"), a3);
  hostContext = v10->_hostContext;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __58__CMIOExtensionSessionProvider_initWithEndpoint_delegate___block_invoke;
  v19[3] = &unk_250457FB0;
  v19[4] = v10;
  -[CMIOExtensionProviderHostContext pluginStates:](hostContext, "pluginStates:", v19);
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v16 = CMIOLog();
    if (v16)
    {
      v17 = v16;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        *(_DWORD *)buf = 136315906;
        v22 = v18;
        v23 = 1024;
        v24 = 1312;
        v25 = 2080;
        v26 = "-[CMIOExtensionSessionProvider initWithEndpoint:delegate:]";
        v27 = 2112;
        v28 = v10;
        _os_log_impl(&dword_2330C2000, v17, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  return v10;
}

void __58__CMIOExtensionSessionProvider_initWithEndpoint_delegate___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  NSObject *v6;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  CMIOExtensionSessionDevice *v19;
  uint64_t v20;
  CMIOExtensionSessionDevice *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  const char *v37;
  const char *v38;
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  CMIOExtensionSessionDevice *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  if (a5)
  {
    v6 = CMIOLog();
    if (v6)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __58__CMIOExtensionSessionProvider_initWithEndpoint_delegate___block_invoke_cold_1();
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 1;
  }
  else
  {
    v10 = +[CMIOExtensionProvider internalProperties](CMIOExtensionProvider, "internalProperties");
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __58__CMIOExtensionSessionProvider_initWithEndpoint_delegate___block_invoke_2;
    v45[3] = &unk_250457E58;
    v45[4] = v10;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = (id)objc_msgSend(a2, "keysOfEntriesPassingTest:", v45);
    v39 = a2;
    v11 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", 0x250459518);
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = (id)objc_msgSend(v11, "value");

    v13 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v42;
      v40 = a1;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v42 != v17)
            objc_enumerationMutation(v14);
          v19 = *(CMIOExtensionSessionDevice **)(*((_QWORD *)&v41 + 1) + 8 * i);
          v20 = objc_msgSend(a3, "objectForKeyedSubscript:", v19);
          if (v20)
          {
            v21 = -[CMIOExtensionSessionDevice initWithPropertyStates:streamsStates:provider:]([CMIOExtensionSessionDevice alloc], "initWithPropertyStates:streamsStates:provider:", v20, a4, *(_QWORD *)(a1 + 32));
            os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
            v22 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", -[NSUUID UUIDString](-[CMIOExtensionSessionDevice deviceID](v21, "deviceID"), "UUIDString"));
            if (!v22)
            {
              v23 = *(_QWORD *)(a1 + 32);
              v24 = v16;
              v25 = v13;
              v26 = v17;
              v27 = a3;
              v28 = v14;
              v29 = a4;
              v30 = *(void **)(v23 + 56);
              v31 = -[NSUUID UUIDString](-[CMIOExtensionSessionDevice deviceID](v21, "deviceID"), "UUIDString");
              v32 = v30;
              a4 = v29;
              v14 = v28;
              a3 = v27;
              v17 = v26;
              v13 = v25;
              v16 = v24;
              a1 = v40;
              objc_msgSend(v32, "setObject:forKey:", v21, v31);
            }

            v13 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allValues"), "copy");
            os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
            if (v22)
            {
              v33 = CMIOLog();
              if (v33)
              {
                v34 = v33;
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  v37 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
                  *(_DWORD *)buf = 136315906;
                  v47 = v37;
                  v48 = 1024;
                  v49 = 1289;
                  v50 = 2080;
                  v51 = "-[CMIOExtensionSessionProvider initWithEndpoint:delegate:]_block_invoke";
                  v52 = 2114;
                  v53 = v21;
                  _os_log_error_impl(&dword_2330C2000, v34, OS_LOG_TYPE_ERROR, "%s:%d:%s Mapping error for %{public}@", buf, 0x26u);
                }
              }
            }

          }
          else
          {
            v35 = CMIOLog();
            if (v35)
            {
              v36 = v35;
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                v38 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
                *(_DWORD *)buf = 136315906;
                v47 = v38;
                v48 = 1024;
                v49 = 1271;
                v50 = 2080;
                v51 = "-[CMIOExtensionSessionProvider initWithEndpoint:delegate:]_block_invoke";
                v52 = 2114;
                v53 = v19;
                _os_log_error_impl(&dword_2330C2000, v36, OS_LOG_TYPE_ERROR, "%s:%d:%s missing device properties for %{public}@", buf, 0x26u);
              }
            }
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
      }
      while (v16);
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = objc_msgSend(v39, "mutableCopy");
    objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 16)), "provider:initializeDevices:properties:", *(_QWORD *)(a1 + 32), v13, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    if (v13)
    {
      objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 16)), "provider:availableDevicesChanged:", *(_QWORD *)(a1 + 32), v13);

    }
  }
}

uint64_t __58__CMIOExtensionSessionProvider_initWithEndpoint_delegate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  CMIOExtensionSessionProvider *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v3 = CMIOLog();
    if (v3)
    {
      v4 = v3;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v8 = 1024;
        v9 = 1319;
        v10 = 2080;
        v11 = "-[CMIOExtensionSessionProvider dealloc]";
        v12 = 2112;
        v13 = self;
        _os_log_impl(&dword_2330C2000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)CMIOExtensionSessionProvider;
  -[CMIOExtensionSessionProvider dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  return self->_description;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  NSString *bundleID;

  bundleID = self->_bundleID;
  self->_bundleID = (NSString *)a3;

}

- (CMIOExtensionSessionProviderDelegate)delegate
{
  return (CMIOExtensionSessionProviderDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)refreshExtensionConnection
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = CMIOLog();
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
      v7 = 1024;
      v8 = 1360;
      v9 = 2080;
      v10 = "-[CMIOExtensionSessionProvider refreshExtensionConnection]";
      _os_log_impl(&dword_2330C2000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s ", (uint8_t *)&v5, 0x1Cu);
    }
  }
  -[CMIOExtensionProviderHostContext refreshExtensionConnection](self->_hostContext, "refreshExtensionConnection");
  self->_invalidated = 0;
}

- (NSArray)devices
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (NSArray *)-[NSMutableDictionary allValues](self->_devicesMap, "allValues");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSSet)availableProperties
{
  return self->_availableProperties;
}

- (id)cachedPropertyStateForProperty:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (id)-[NSMutableDictionary objectForKey:](self->_propertyStates, "objectForKey:", a3);
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)cachedPropertyStatesForProperties:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  void *v14;
  os_unfair_lock_s *p_lock;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  CMIOExtensionSessionProvider *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v5 = CMIOLog();
    if (v5)
    {
      v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v23 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v24 = 1024;
        v25 = 1395;
        v26 = 2080;
        v27 = "-[CMIOExtensionSessionProvider cachedPropertyStatesForProperties:]";
        v28 = 2112;
        v29 = self;
        _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  if (a3)
  {
    v7 = (void *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(a3);
          v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          os_unfair_lock_lock(&self->_lock);
          v13 = (id)-[NSMutableDictionary objectForKey:](self->_propertyStates, "objectForKey:", v12);
          os_unfair_lock_unlock(&self->_lock);
          if (v13)
            objc_msgSend(v7, "setObject:forKey:", v13, v12);
        }
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }
    v14 = (void *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v7);

  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v14 = (void *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_propertyStates);
    os_unfair_lock_unlock(p_lock);
  }
  return v14;
}

- (void)propertyStatesForProperties:(id)availableProperties reply:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  CMIOExtensionProviderHostContext *hostContext;
  _QWORD v10[6];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  CMIOExtensionSessionProvider *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v13 = 1024;
        v14 = 1427;
        v15 = 2080;
        v16 = "-[CMIOExtensionSessionProvider propertyStatesForProperties:reply:]";
        v17 = 2112;
        v18 = self;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  if (!availableProperties)
    availableProperties = self->_availableProperties;
  hostContext = self->_hostContext;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__CMIOExtensionSessionProvider_propertyStatesForProperties_reply___block_invoke;
  v10[3] = &unk_250457E80;
  v10[4] = self;
  v10[5] = a4;
  -[CMIOExtensionProviderHostContext pluginPropertyStatesForProperties:reply:](hostContext, "pluginPropertyStatesForProperties:reply:", availableProperties, v10);
}

uint64_t __66__CMIOExtensionSessionProvider_propertyStatesForProperties_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addEntriesFromDictionary:", a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setPropertyValues:(id)a3 reply:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  CMIOExtensionProviderHostContext *hostContext;
  _QWORD v10[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  CMIOExtensionSessionProvider *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v13 = 1024;
        v14 = 1444;
        v15 = 2080;
        v16 = "-[CMIOExtensionSessionProvider setPropertyValues:reply:]";
        v17 = 2112;
        v18 = self;
        v19 = 2112;
        v20 = a3;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, propertyValues %@", buf, 0x30u);
      }
    }
  }
  hostContext = self->_hostContext;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__CMIOExtensionSessionProvider_setPropertyValues_reply___block_invoke;
  v10[3] = &unk_250457EA8;
  v10[4] = a4;
  -[CMIOExtensionProviderHostContext setPluginPropertyValues:reply:](hostContext, "setPluginPropertyValues:reply:", a3, v10);
}

uint64_t __56__CMIOExtensionSessionProvider_setPropertyValues_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)completeTransaction
{
  -[CMIOExtensionProviderHostContext completeTransaction](self->_hostContext, "completeTransaction");
}

- (BOOL)registerStream:(id)a3 streamID:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  CMIOExtensionSessionProvider *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136316162;
        v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v14 = 1024;
        v15 = 1458;
        v16 = 2080;
        v17 = "-[CMIOExtensionSessionProvider registerStream:streamID:]";
        v18 = 2112;
        v19 = self;
        v20 = 2112;
        v21 = a3;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, stream %@", (uint8_t *)&v12, 0x30u);
      }
    }
  }
  os_unfair_lock_lock(&self->_lock);
  v9 = -[NSMutableDictionary objectForKey:](self->_streamsMap, "objectForKey:", a4);
  if (v9)
  {
    os_unfair_lock_unlock(&self->_lock);
    v10 = CMIOLog();
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionSessionProvider registerStream:streamID:].cold.1();
  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](self->_streamsMap, "setObject:forKey:", a3, a4);
    os_unfair_lock_unlock(&self->_lock);
  }
  return v9 == 0;
}

- (id)unregisterStreamID:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  CMIOExtensionSessionProvider *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v5 = CMIOLog();
    if (v5)
    {
      v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136316162;
        v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v11 = 1024;
        v12 = 1477;
        v13 = 2080;
        v14 = "-[CMIOExtensionSessionProvider unregisterStreamID:]";
        v15 = 2112;
        v16 = self;
        v17 = 2112;
        v18 = a3;
        _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, stream %@", (uint8_t *)&v9, 0x30u);
      }
    }
  }
  os_unfair_lock_lock(&self->_lock);
  v7 = (id)-[NSMutableDictionary objectForKey:](self->_streamsMap, "objectForKey:", a3);
  -[NSMutableDictionary removeObjectForKey:](self->_streamsMap, "removeObjectForKey:", a3);
  os_unfair_lock_unlock(&self->_lock);
  return v7;
}

- (void)extension:(id)a3 didFailWithError:(id)a4
{
  NSObject *v6;

  v6 = CMIOLog();
  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[CMIOExtensionSessionProvider extension:didFailWithError:].cold.1();
  objc_msgSend(objc_loadWeak((id *)&self->_delegate), "provider:didFailWithError:", self, a4);
}

- (void)extensionHasBeenInvalidated:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  CMIOExtensionSessionProvider *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v4 = CMIOLog();
    if (v4)
    {
      v5 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315906;
        v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v8 = 1024;
        v9 = 1498;
        v10 = 2080;
        v11 = "-[CMIOExtensionSessionProvider extensionHasBeenInvalidated:]";
        v12 = 2112;
        v13 = self;
        _os_log_impl(&dword_2330C2000, v5, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v6, 0x26u);
      }
    }
  }
  self->_invalidated = 1;
  objc_msgSend(objc_loadWeak((id *)&self->_delegate), "providerHasBeenInvalidated:", self);
}

- (void)extension:(id)a3 pluginPropertiesChanged:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  CMIOExtensionSessionProvider *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v6 = CMIOLog();
    if (v6)
    {
      v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315906;
        v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v11 = 1024;
        v12 = 1506;
        v13 = 2080;
        v14 = "-[CMIOExtensionSessionProvider extension:pluginPropertiesChanged:]";
        v15 = 2112;
        v16 = self;
        _os_log_impl(&dword_2330C2000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v9, 0x26u);
      }
    }
  }
  if (objc_msgSend(a4, "count"))
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary addEntriesFromDictionary:](self->_propertyStates, "addEntriesFromDictionary:", a4);
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(objc_loadWeak((id *)&self->_delegate), "provider:propertiesChanged:", self, a4);
  }
  else
  {
    v8 = CMIOLog();
    if (v8)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionSessionProvider extension:pluginPropertiesChanged:].cold.1();
    }
  }
}

- (void)extension:(id)a3 availableDevicesChanged:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSArray *deviceIDs;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  CMIOExtensionProviderHostContext *hostContext;
  NSObject *v29;
  void *v30;
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint8_t v41[128];
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  CMIOExtensionSessionProvider *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v6 = CMIOLog();
    if (v6)
    {
      v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v43 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v44 = 1024;
        v45 = 1525;
        v46 = 2080;
        v47 = "-[CMIOExtensionSessionProvider extension:availableDevicesChanged:]";
        v48 = 2112;
        v49 = self;
        _os_log_impl(&dword_2330C2000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  if (a4)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", a4);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", self->_deviceIDs);
    deviceIDs = self->_deviceIDs;
    self->_deviceIDs = (NSArray *)a4;

    v11 = (void *)objc_msgSend(v9, "mutableCopy");
    v30 = (void *)v8;
    objc_msgSend(v11, "minusSet:", v8);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(v11);
          v17 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          os_unfair_lock_lock(&self->_lock);
          v18 = (id)-[NSMutableDictionary objectForKey:](self->_devicesMap, "objectForKey:", v17);
          -[NSMutableDictionary removeObjectForKey:](self->_devicesMap, "removeObjectForKey:", v17);
          os_unfair_lock_unlock(&self->_lock);
          if (v18)
          {
            objc_msgSend(v18, "unregister");
            v19 = (void *)objc_msgSend(v18, "delegate");
            v14 = 1;
            objc_msgSend(v18, "setInvalidated:", 1);
            objc_msgSend(v19, "deviceHasBeenInvalidated:", v18);
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v13);
      if ((v14 & 1) != 0)
      {
        os_unfair_lock_lock(&self->_lock);
        v20 = -[NSMutableDictionary allValues](self->_devicesMap, "allValues");
        os_unfair_lock_unlock(&self->_lock);
        objc_msgSend(objc_loadWeak((id *)&self->_delegate), "provider:availableDevicesChanged:", self, v20);
      }
    }
    v21 = (void *)objc_msgSend(v30, "mutableCopy");
    objc_msgSend(v21, "minusSet:", v9);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v33;
      v25 = MEMORY[0x24BDAC760];
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v33 != v24)
            objc_enumerationMutation(v21);
          v27 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
          hostContext = self->_hostContext;
          v31[0] = v25;
          v31[1] = 3221225472;
          v31[2] = __66__CMIOExtensionSessionProvider_extension_availableDevicesChanged___block_invoke;
          v31[3] = &unk_250457FD8;
          v31[4] = self;
          -[CMIOExtensionProviderHostContext deviceStatesWithDeviceID:reply:](hostContext, "deviceStatesWithDeviceID:reply:", v27, v31);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v23);
    }

  }
  else
  {
    v29 = CMIOLog();
    if (v29 && os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionSessionProvider extension:availableDevicesChanged:].cold.1();
  }
}

void __66__CMIOExtensionSessionProvider_extension_availableDevicesChanged___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v4;
  CMIOExtensionSessionDevice *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;

  if (a4)
  {
    v4 = CMIOLog();
    if (v4)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __66__CMIOExtensionSessionProvider_extension_availableDevicesChanged___block_invoke_cold_2();
    }
  }
  else
  {
    v6 = -[CMIOExtensionSessionDevice initWithPropertyStates:streamsStates:provider:]([CMIOExtensionSessionDevice alloc], "initWithPropertyStates:streamsStates:provider:", a2, a3, *(_QWORD *)(a1 + 32));
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", -[NSUUID UUIDString](-[CMIOExtensionSessionDevice deviceID](v6, "deviceID"), "UUIDString"));
    v8 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 8));
      v9 = CMIOLog();
      if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __66__CMIOExtensionSessionProvider_extension_availableDevicesChanged___block_invoke_cold_1();
    }
    else
    {
      objc_msgSend(*(id *)(v8 + 56), "setObject:forKey:", v6, -[NSUUID UUIDString](-[CMIOExtensionSessionDevice deviceID](v6, "deviceID"), "UUIDString"));
      v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allValues");
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
      objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 16)), "provider:availableDevicesChanged:", *(_QWORD *)(a1 + 32), v10);
    }

  }
}

- (void)extension:(id)a3 devicePropertiesChangedWithDeviceID:(id)a4 propertyStates:(id)a5
{
  NSObject *v8;
  NSObject *v9;
  id v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  CMIOExtensionSessionProvider *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v8 = CMIOLog();
    if (v8)
    {
      v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315906;
        v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v13 = 1024;
        v14 = 1619;
        v15 = 2080;
        v16 = "-[CMIOExtensionSessionProvider extension:devicePropertiesChangedWithDeviceID:propertyStates:]";
        v17 = 2112;
        v18 = self;
        _os_log_impl(&dword_2330C2000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v11, 0x26u);
      }
    }
  }
  os_unfair_lock_lock(&self->_lock);
  v10 = (id)-[NSMutableDictionary objectForKey:](self->_devicesMap, "objectForKey:", a4);
  os_unfair_lock_unlock(&self->_lock);
  if (v10)
    objc_msgSend(v10, "updatePropertyStates:", a5);
}

- (void)extension:(id)a3 availableStreamsChangedWithDeviceID:(id)a4 streamIDs:(id)a5
{
  NSObject *v8;
  NSObject *v9;
  id v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  CMIOExtensionSessionProvider *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v8 = CMIOLog();
    if (v8)
    {
      v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315906;
        v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v13 = 1024;
        v14 = 1635;
        v15 = 2080;
        v16 = "-[CMIOExtensionSessionProvider extension:availableStreamsChangedWithDeviceID:streamIDs:]";
        v17 = 2112;
        v18 = self;
        _os_log_impl(&dword_2330C2000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v11, 0x26u);
      }
    }
  }
  os_unfair_lock_lock(&self->_lock);
  v10 = (id)-[NSMutableDictionary objectForKey:](self->_devicesMap, "objectForKey:", a4);
  os_unfair_lock_unlock(&self->_lock);
  if (v10)
    objc_msgSend(v10, "updateStreamIDs:", a5);
}

- (void)extension:(id)a3 streamPropertiesChangedWithStreamID:(id)a4 propertyStates:(id)a5
{
  NSObject *v8;
  NSObject *v9;
  os_unfair_lock_s *p_lock;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  CMIOExtensionSessionProvider *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v8 = CMIOLog();
    if (v8)
    {
      v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315906;
        v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v14 = 1024;
        v15 = 1651;
        v16 = 2080;
        v17 = "-[CMIOExtensionSessionProvider extension:streamPropertiesChangedWithStreamID:propertyStates:]";
        v18 = 2112;
        v19 = self;
        _os_log_impl(&dword_2330C2000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v12, 0x26u);
      }
    }
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v11 = (id)-[NSMutableDictionary objectForKey:](self->_streamsMap, "objectForKey:", a4);
  os_unfair_lock_unlock(p_lock);
  if (v11)
    objc_msgSend(v11, "updatePropertyStates:streamID:", a5, a4);
}

- (void)extension:(id)a3 receivedSampleWithStreamID:(id)a4 sample:(id)a5
{
  NSObject *v8;
  NSObject *v9;
  os_unfair_lock_s *p_lock;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  CMIOExtensionSessionProvider *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v8 = CMIOLog();
    if (v8)
    {
      v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315906;
        v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v14 = 1024;
        v15 = 1667;
        v16 = 2080;
        v17 = "-[CMIOExtensionSessionProvider extension:receivedSampleWithStreamID:sample:]";
        v18 = 2112;
        v19 = self;
        _os_log_impl(&dword_2330C2000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v12, 0x26u);
      }
    }
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v11 = (id)-[NSMutableDictionary objectForKey:](self->_streamsMap, "objectForKey:", a4);
  os_unfair_lock_unlock(p_lock);
  if (v11)
    objc_msgSend(v11, "receivedSample:streamID:", a5, a4);
}

- (void)extension:(id)a3 pullSampleWithStreamID:(id)a4 reply:(id)a5
{
  NSObject *v8;
  NSObject *v9;
  os_unfair_lock_s *p_lock;
  id v11;
  void *v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v15;
  const __CFString *v16;
  _BYTE buf[12];
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  CMIOExtensionSessionProvider *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v8 = CMIOLog();
    if (v8)
    {
      v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v18 = 1024;
        v19 = 1683;
        v20 = 2080;
        v21 = "-[CMIOExtensionSessionProvider extension:pullSampleWithStreamID:reply:]";
        v22 = 2112;
        v23 = self;
        _os_log_impl(&dword_2330C2000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v11 = (id)-[NSMutableDictionary objectForKey:](self->_streamsMap, "objectForKey:", a4);
  os_unfair_lock_unlock(p_lock);
  if (v11)
  {
    *(_QWORD *)buf = 0;
    v14 = 0;
    v12 = (void *)objc_msgSend(v11, "copySample:streamID:error:", &v14, a4, buf);
    (*((void (**)(id, void *, _QWORD, _QWORD))a5 + 2))(a5, v12, v14, *(_QWORD *)buf);

  }
  else
  {
    v13 = *MEMORY[0x24BDD1100];
    v15 = *MEMORY[0x24BDD0FC8];
    v16 = CFSTR("Invalid stream");
    (*((void (**)(id, _QWORD, _QWORD, uint64_t))a5 + 2))(a5, 0, 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v13, -50, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1)));
  }
}

- (void)extension:(id)a3 streamScheduledOutputChangedWithStreamID:(id)a4 scheduledOutput:(id)a5
{
  NSObject *v8;
  NSObject *v9;
  os_unfair_lock_s *p_lock;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  CMIOExtensionSessionProvider *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v8 = CMIOLog();
    if (v8)
    {
      v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315906;
        v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v14 = 1024;
        v15 = 1707;
        v16 = 2080;
        v17 = "-[CMIOExtensionSessionProvider extension:streamScheduledOutputChangedWithStreamID:scheduledOutput:]";
        v18 = 2112;
        v19 = self;
        _os_log_impl(&dword_2330C2000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v12, 0x26u);
      }
    }
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v11 = (id)-[NSMutableDictionary objectForKey:](self->_streamsMap, "objectForKey:", a4);
  os_unfair_lock_unlock(p_lock);
  if (v11)
    objc_msgSend(v11, "receivedScheduledOutput:streamID:", a5, a4);
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (CMIOExtensionProviderHostContext)hostContext
{
  return self->_hostContext;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __58__CMIOExtensionSessionProvider_initWithEndpoint_delegate___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s failed getting the states of the plugin error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)registerStream:streamID:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Mapping error for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)extension:didFailWithError:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)extension:pluginPropertiesChanged:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s empty properties", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)extension:availableDevicesChanged:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s nil deviceIDs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__CMIOExtensionSessionProvider_extension_availableDevicesChanged___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Mapping error for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__CMIOExtensionSessionProvider_extension_availableDevicesChanged___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
