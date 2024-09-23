@implementation CMIOExtensionSessionDevice

+ (id)sessionDeviceWithPropertyStates:(id)a3 streamsStates:(id)a4 provider:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPropertyStates:streamsStates:provider:", a3, a4, a5);
}

- (CMIOExtensionSessionDevice)initWithPropertyStates:(id)a3 streamsStates:(id)a4 provider:(id)a5
{
  CMIOExtensionSessionDevice *v8;
  CMIOExtensionSessionDevice *v9;
  id v10;
  void *v11;
  id *p_streamIDs;
  void *v13;
  CMIOExtensionSessionDevice *v14;
  int v16;
  uint64_t v17;
  CMIOExtensionSessionStream *v18;
  CMIOExtensionSessionStream *v19;
  char v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  CMIOExtensionSessionStream *v29;
  CMIOExtensionSessionDualStream *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  uint64_t v37;
  CMIOExtensionSessionStream *v38;
  NSObject *v39;
  NSObject *v40;
  const char *v41;
  NSObject *v42;
  NSObject *v43;
  const char *v44;
  NSObject *v45;
  NSObject *v46;
  const char *v47;
  os_unfair_lock_s *lock;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[5];
  objc_super v54;
  uint8_t v55[128];
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  if (!a3 || !a4 || !a5)
  {

    goto LABEL_9;
  }
  v54.receiver = self;
  v54.super_class = (Class)CMIOExtensionSessionDevice;
  v8 = -[CMIOExtensionSessionDevice init](&v54, sel_init);
  if (!v8)
    return 0;
  v9 = v8;
  v8->_lock._os_unfair_lock_opaque = 0;
  lock = &v8->_lock;
  v10 = +[CMIOExtensionDevice internalProperties](CMIOExtensionDevice, "internalProperties");
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __76__CMIOExtensionSessionDevice_initWithPropertyStates_streamsStates_provider___block_invoke;
  v53[3] = &unk_250457E58;
  v53[4] = v10;
  v9->_availableProperties = (NSSet *)(id)objc_msgSend(a3, "keysOfEntriesPassingTest:", v53);
  v9->_localizedName = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x250459538), "value");
  v11 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", 0x250459558);
  v9->_deviceID = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", objc_msgSend(v11, "value"));
  v9->_legacyDeviceID = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x250459578), "value");
  v9->_manufacturer = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("4cc_lmak_glob_0000")), "value");
  v9->_modelID = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CMIOExtensionPropertyDeviceModel")), "value");
  v9->_runningSomewhere = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x2504595B8), "value"), "BOOLValue");
  v9->_streamIDs = (NSArray *)(id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x250459598), "value");
  p_streamIDs = (id *)&v9->_streamIDs;
  v9->_deviceControlPID = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x2504595F8), "value"), "intValue");
  v13 = (void *)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("4cc_cfds_glob_0000")), "value");
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      LODWORD(v13) = objc_msgSend(v13, "BOOLValue");
      goto LABEL_19;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v13, "length") == 1)
      {
        buf[0] = 0;
        objc_msgSend(v13, "getBytes:length:", buf, 1);
        v16 = buf[0];
LABEL_17:
        LODWORD(v13) = v16 != 0;
        goto LABEL_19;
      }
      if (objc_msgSend(v13, "length") == 4)
      {
        *(_DWORD *)buf = 0;
        objc_msgSend(v13, "getBytes:length:", buf, 4);
        v16 = *(_DWORD *)buf;
        goto LABEL_17;
      }
    }
    LODWORD(v13) = 0;
  }
LABEL_19:
  objc_storeWeak((id *)&v9->_provider, a5);
  v9->_propertyStates = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  v9->_streams = (NSMutableArray *)objc_opt_new();
  v9->_description = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<CMIOExtensionSessionDevice: ID %@, legacy: %@>"), v9->_deviceID, v9->_legacyDeviceID);
  if ((_DWORD)v13)
  {
    if (objc_msgSend(*p_streamIDs, "count") != 2)
    {
      v45 = CMIOLog();
      if (v45 && os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionSessionDevice initWithPropertyStates:streamsStates:provider:].cold.2();
      goto LABEL_71;
    }
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 1;
    while (1)
    {
      v21 = v20;
      v22 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(*p_streamIDs, "objectAtIndexedSubscript:", v17));
      if (!v22)
      {
        v26 = CMIOLog();
        if (v26)
        {
          v27 = v26;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v47 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
            v28 = objc_msgSend(*p_streamIDs, "objectAtIndexedSubscript:", v17);
            *(_DWORD *)buf = 136315906;
            v57 = v47;
            v58 = 1024;
            v59 = 830;
            v60 = 2080;
            v61 = "-[CMIOExtensionSessionDevice initWithPropertyStates:streamsStates:provider:]";
            v62 = 2114;
            v63 = v28;
            _os_log_error_impl(&dword_2330C2000, v27, OS_LOG_TYPE_ERROR, "%s:%d:%s missing stream properties for %{public}@", buf, 0x26u);
          }
        }
        goto LABEL_40;
      }
      v23 = v22;
      v24 = objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("4cc_cfac_glob_0000")), "value");
      if (v24)
      {
        v25 = (void *)v24;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((objc_msgSend(v25, "BOOLValue") & 1) != 0)
            goto LABEL_36;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v25, "length") == 1)
            {
              buf[0] = 0;
              objc_msgSend(v25, "getBytes:length:", buf, 1);
              if (buf[0])
                goto LABEL_36;
            }
            else if (objc_msgSend(v25, "length") == 4)
            {
              *(_DWORD *)buf = 0;
              objc_msgSend(v25, "getBytes:length:", buf, 4);
              if (*(_DWORD *)buf)
              {
LABEL_36:
                if (!v19)
                  v19 = +[CMIOExtensionSessionStream sessionStreamWithPropertyStates:provider:](CMIOExtensionSessionStream, "sessionStreamWithPropertyStates:provider:", v23, a5);
                goto LABEL_40;
              }
            }
          }
        }
        if (!v18)
          v18 = +[CMIOExtensionSessionStream sessionStreamWithPropertyStates:provider:](CMIOExtensionSessionStream, "sessionStreamWithPropertyStates:provider:", v23, a5);
      }
LABEL_40:
      v20 = 0;
      v17 = 1;
      if ((v21 & 1) == 0)
      {
        if (v19 && v18)
        {
          v29 = v19;
          v14 = v9;
          v30 = +[CMIOExtensionSessionDualStream sessionDualStreamWithPrimaryStream:secondaryStream:](CMIOExtensionSessionDualStream, "sessionDualStreamWithPrimaryStream:secondaryStream:", v18, v29);
          if (objc_msgSend(a5, "registerStream:streamID:", v30, -[NSUUID UUIDString](-[CMIOExtensionSessionStream streamID](v18, "streamID"), "UUIDString"))&& objc_msgSend(a5, "registerStream:streamID:", v30, -[NSUUID UUIDString](-[CMIOExtensionSessionStream streamID](v29, "streamID"), "UUIDString")))
          {
            os_unfair_lock_lock(lock);
            -[NSMutableArray addObject:](v9->_streams, "addObject:", v30);
            os_unfair_lock_unlock(lock);
          }
          goto LABEL_59;
        }
        v46 = CMIOLog();
        if (v46 && os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionSessionDevice initWithPropertyStates:streamsStates:provider:].cold.1();
LABEL_71:

LABEL_9:
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Invalid argument"));
        return 0;
      }
    }
  }
  v14 = v9;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v31 = *p_streamIDs;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v50 != v34)
          objc_enumerationMutation(v31);
        v36 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        v37 = objc_msgSend(a4, "objectForKeyedSubscript:", v36);
        if (v37)
        {
          v38 = +[CMIOExtensionSessionStream sessionStreamWithPropertyStates:provider:](CMIOExtensionSessionStream, "sessionStreamWithPropertyStates:provider:", v37, a5);
          if (objc_msgSend(a5, "registerStream:streamID:", v38, v36))
          {
            os_unfair_lock_lock(lock);
            -[NSMutableArray addObject:](v14->_streams, "addObject:", v38);
            os_unfair_lock_unlock(lock);
          }
        }
        else
        {
          v39 = CMIOLog();
          if (v39)
          {
            v40 = v39;
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              v41 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
              *(_DWORD *)buf = 136315906;
              v57 = v41;
              v58 = 1024;
              v59 = 892;
              v60 = 2080;
              v61 = "-[CMIOExtensionSessionDevice initWithPropertyStates:streamsStates:provider:]";
              v62 = 2114;
              v63 = v36;
              _os_log_error_impl(&dword_2330C2000, v40, OS_LOG_TYPE_ERROR, "%s:%d:%s missing stream properties for %{public}@", buf, 0x26u);
            }
          }
        }
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v33);
  }
LABEL_59:
  if (CMIOModuleLogLevel_once != -1)
    dispatch_once(&CMIOModuleLogLevel_once, &__block_literal_global_351);
  if (CMIOModuleLogLevel_cmioLevel >= 1)
  {
    v42 = CMIOLog();
    if (v42)
    {
      v43 = v42;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v44 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        *(_DWORD *)buf = 136315906;
        v57 = v44;
        v58 = 1024;
        v59 = 908;
        v60 = 2080;
        v61 = "-[CMIOExtensionSessionDevice initWithPropertyStates:streamsStates:provider:]";
        v62 = 2112;
        v63 = (uint64_t)v14;
        _os_log_impl(&dword_2330C2000, v43, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  return v14;
}

uint64_t __76__CMIOExtensionSessionDevice_initWithPropertyStates_streamsStates_provider___block_invoke(uint64_t a1, uint64_t a2)
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
  CMIOExtensionSessionDevice *v13;
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
        v9 = 915;
        v10 = 2080;
        v11 = "-[CMIOExtensionSessionDevice dealloc]";
        v12 = 2112;
        v13 = self;
        _os_log_impl(&dword_2330C2000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)CMIOExtensionSessionDevice;
  -[CMIOExtensionSessionDevice dealloc](&v5, sel_dealloc);
}

- (id)description
{
  return self->_description;
}

- (void)updatePropertyStates:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  CMIOExtensionSessionDevice *v18;
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
        v11 = 136315906;
        v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v13 = 1024;
        v14 = 938;
        v15 = 2080;
        v16 = "-[CMIOExtensionSessionDevice updatePropertyStates:]";
        v17 = 2112;
        v18 = self;
        _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", (uint8_t *)&v11, 0x26u);
      }
    }
  }
  if (objc_msgSend(a3, "count"))
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary addEntriesFromDictionary:](self->_propertyStates, "addEntriesFromDictionary:", a3);
    os_unfair_lock_unlock(&self->_lock);
    v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", 0x2504595B8);
    if (v7)
    {
      v8 = objc_msgSend((id)objc_msgSend(v7, "value"), "BOOLValue");
      -[CMIOExtensionSessionDevice setRunningSomewhere:](self, "setRunningSomewhere:", v8);
      objc_msgSend(objc_loadWeak((id *)&self->_delegate), "device:runningSomewhereChanged:", self, v8);
    }
    v9 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", 0x2504595F8);
    if (v9)
    {
      v10 = objc_msgSend((id)objc_msgSend(v9, "value"), "intValue");
      -[CMIOExtensionSessionDevice setDeviceControlPID:](self, "setDeviceControlPID:", v10);
      objc_msgSend(objc_loadWeak((id *)&self->_delegate), "device:deviceControlPIDChanged:", self, v10);
    }
    objc_msgSend(objc_loadWeak((id *)&self->_delegate), "device:propertiesChanged:", self, a3);
  }
}

- (void)updateStreamIDs:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSArray *streamIDs;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id Weak;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[7];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint8_t v43[128];
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  CMIOExtensionSessionDevice *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
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
        *(_DWORD *)buf = 136316162;
        v45 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v46 = 1024;
        v47 = 971;
        v48 = 2080;
        v49 = "-[CMIOExtensionSessionDevice updateStreamIDs:]";
        v50 = 2112;
        v51 = self;
        v52 = 2112;
        v53 = a3;
        _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, streamIDs %@", buf, 0x30u);
      }
    }
  }
  if (a3)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", a3);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", self->_streamIDs);
    streamIDs = self->_streamIDs;
    self->_streamIDs = (NSArray *)a3;

    v31 = v8;
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
    v32 = v7;
    objc_msgSend(v10, "minusSet:", v7);
    v40 = 0u;
    v41 = 0u;
    v39 = 0u;
    v38 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v39 != v14)
            objc_enumerationMutation(v10);
          v16 = objc_msgSend(objc_loadWeak((id *)&self->_provider), "unregisterStreamID:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
          if (v16)
          {
            v17 = (void *)v16;
            os_unfair_lock_lock(&self->_lock);
            -[NSMutableArray removeObject:](self->_streams, "removeObject:", v17);
            os_unfair_lock_unlock(&self->_lock);
            v18 = (void *)objc_msgSend(v17, "delegate");
            v13 = 1;
            objc_msgSend(v17, "setInvalidated:", 1);
            objc_msgSend(v18, "streamHasBeenInvalidated:", v17);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v12);
      if ((v13 & 1) != 0)
      {
        os_unfair_lock_lock(&self->_lock);
        v19 = (void *)-[NSMutableArray copy](self->_streams, "copy");
        os_unfair_lock_unlock(&self->_lock);
        objc_msgSend(objc_loadWeak((id *)&self->_delegate), "device:availableStreamsChanged:", self, v19);

      }
    }
    v20 = (void *)objc_msgSend(v7, "mutableCopy", v10);
    objc_msgSend(v20, "minusSet:", v31);
    Weak = objc_loadWeak((id *)&self->_provider);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v35;
      v25 = MEMORY[0x24BDAC760];
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v35 != v24)
            objc_enumerationMutation(v20);
          v27 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
          v28 = (void *)objc_msgSend(Weak, "hostContext");
          v33[0] = v25;
          v33[1] = 3221225472;
          v33[2] = __46__CMIOExtensionSessionDevice_updateStreamIDs___block_invoke;
          v33[3] = &unk_250457F88;
          v33[4] = Weak;
          v33[5] = v27;
          v33[6] = self;
          objc_msgSend(v28, "streamPropertyStatesWithStreamID:properties:reply:", v27, 0, v33);
        }
        v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v23);
    }

  }
  else
  {
    v29 = CMIOLog();
    if (v29 && os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[CMIOExtensionSessionDevice updateStreamIDs:].cold.1();
  }
}

void __46__CMIOExtensionSessionDevice_updateStreamIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  CMIOExtensionSessionStream *v5;
  id v6;

  if (a3)
  {
    v3 = CMIOLog();
    if (v3)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        __46__CMIOExtensionSessionDevice_updateStreamIDs___block_invoke_cold_1();
    }
  }
  else
  {
    v5 = +[CMIOExtensionSessionStream sessionStreamWithPropertyStates:provider:](CMIOExtensionSessionStream, "sessionStreamWithPropertyStates:provider:", a2, *(_QWORD *)(a1 + 32));
    if (objc_msgSend(*(id *)(a1 + 32), "registerStream:streamID:", v5, *(_QWORD *)(a1 + 40)))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 8));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "addObject:", v5);
      v6 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "copy");
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 8));
      if (v6)
      {
        objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(a1 + 48) + 16)), "device:availableStreamsChanged:", *(_QWORD *)(a1 + 48), v6);

      }
    }
  }
}

- (void)unregister
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CMIOExtensionSessionProvider **p_provider;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = -[CMIOExtensionSessionDevice streams](self, "streams", 0);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    p_provider = &self->_provider;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(objc_loadWeak((id *)p_provider), "unregisterStreamID:", objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "streamID"), "UUIDString"));
      }
      while (v5 != v8);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
}

- (CMIOExtensionSessionDeviceDelegate)delegate
{
  return (CMIOExtensionSessionDeviceDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)streams
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_streams, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
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
  CMIOExtensionSessionDevice *v29;
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
        v25 = 1109;
        v26 = 2080;
        v27 = "-[CMIOExtensionSessionDevice cachedPropertyStatesForProperties:]";
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
  uint64_t v9;
  void *v10;
  NSString *v11;
  uint64_t v12;
  _QWORD v13[6];
  uint64_t v14;
  const __CFString *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  CMIOExtensionSessionDevice *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
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
        v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v18 = 1024;
        v19 = 1141;
        v20 = 2080;
        v21 = "-[CMIOExtensionSessionDevice propertyStatesForProperties:reply:]";
        v22 = 2112;
        v23 = self;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@", buf, 0x26u);
      }
    }
  }
  v9 = objc_msgSend(objc_loadWeak((id *)&self->_provider), "hostContext");
  if (v9)
  {
    v10 = (void *)v9;
    if (!availableProperties)
      availableProperties = self->_availableProperties;
    v11 = -[NSUUID UUIDString](self->_deviceID, "UUIDString");
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __64__CMIOExtensionSessionDevice_propertyStatesForProperties_reply___block_invoke;
    v13[3] = &unk_250457E80;
    v13[4] = self;
    v13[5] = a4;
    objc_msgSend(v10, "devicePropertyStatesWithDeviceID:properties:reply:", v11, availableProperties, v13);
  }
  else
  {
    v12 = *MEMORY[0x24BDD1100];
    v14 = *MEMORY[0x24BDD0FC8];
    v15 = CFSTR("Invalid session");
    (*((void (**)(id, _QWORD, uint64_t))a4 + 2))(a4, 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v12, -50, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1)));
  }
}

uint64_t __64__CMIOExtensionSessionDevice_propertyStatesForProperties_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addEntriesFromDictionary:", a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setPropertyValues:(id)a3 reply:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSString *v11;
  uint64_t v12;
  _QWORD v13[5];
  uint64_t v14;
  const __CFString *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  CMIOExtensionSessionDevice *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
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
        v17 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v18 = 1024;
        v19 = 1163;
        v20 = 2080;
        v21 = "-[CMIOExtensionSessionDevice setPropertyValues:reply:]";
        v22 = 2112;
        v23 = self;
        v24 = 2112;
        v25 = a3;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, propertyValues %@", buf, 0x30u);
      }
    }
  }
  v9 = objc_msgSend(objc_loadWeak((id *)&self->_provider), "hostContext");
  if (v9)
  {
    v10 = (void *)v9;
    v11 = -[NSUUID UUIDString](self->_deviceID, "UUIDString");
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __54__CMIOExtensionSessionDevice_setPropertyValues_reply___block_invoke;
    v13[3] = &unk_250457EA8;
    v13[4] = a4;
    objc_msgSend(v10, "setDevicePropertyValuesWithDeviceID:propertyValues:reply:", v11, a3, v13);
  }
  else
  {
    v12 = *MEMORY[0x24BDD1100];
    v14 = *MEMORY[0x24BDD0FC8];
    v15 = CFSTR("Invalid session");
    (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v12, -50, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1)));
  }
}

uint64_t __54__CMIOExtensionSessionDevice_setPropertyValues_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setDeviceControlPID:(int)a3 reply:(id)a4
{
  uint64_t v5;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSString *v12;
  uint64_t v13;
  _QWORD v14[5];
  uint64_t v15;
  const __CFString *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  CMIOExtensionSessionDevice *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v5 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x24BDAC8D0];
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
        *(_DWORD *)buf = 136316163;
        v18 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
        v19 = 1024;
        v20 = 1177;
        v21 = 2080;
        v22 = "-[CMIOExtensionSessionDevice setDeviceControlPID:reply:]";
        v23 = 2112;
        v24 = self;
        v25 = 1025;
        v26 = v5;
        _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %{private}d", buf, 0x2Cu);
      }
    }
  }
  v9 = objc_msgSend(objc_loadWeak((id *)&self->_provider), "hostContext");
  if (v9)
  {
    v10 = (void *)v9;
    v11 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5), 0x2504595F8);
    v12 = -[NSUUID UUIDString](self->_deviceID, "UUIDString");
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __56__CMIOExtensionSessionDevice_setDeviceControlPID_reply___block_invoke;
    v14[3] = &unk_250457EA8;
    v14[4] = a4;
    objc_msgSend(v10, "setDevicePropertyValuesWithDeviceID:propertyValues:reply:", v12, v11, v14);
  }
  else
  {
    v13 = *MEMORY[0x24BDD1100];
    v15 = *MEMORY[0x24BDD0FC8];
    v16 = CFSTR("Invalid session");
    (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v13, -50, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1)));
  }
}

uint64_t __56__CMIOExtensionSessionDevice_setDeviceControlPID_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  if (a2)
  {
    v3 = CMIOLog();
    if (v3)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        __56__CMIOExtensionSessionDevice_setDeviceControlPID_reply___block_invoke_cold_1();
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)completeTransaction
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
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSUUID)deviceID
{
  return self->_deviceID;
}

- (NSString)legacyDeviceID
{
  return self->_legacyDeviceID;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)isRunningSomewhere
{
  return self->_runningSomewhere;
}

- (void)setRunningSomewhere:(BOOL)a3
{
  self->_runningSomewhere = a3;
}

- (int)deviceControlPID
{
  return self->_deviceControlPID;
}

- (void)setDeviceControlPID:(int)a3
{
  self->_deviceControlPID = a3;
}

- (CMIOExtensionSessionProvider)provider
{
  return (CMIOExtensionSessionProvider *)objc_loadWeak((id *)&self->_provider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_provider);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithPropertyStates:streamsStates:provider:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s dual stream expecting 2 streams with different center stage", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithPropertyStates:streamsStates:provider:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionSession.m");
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s dual stream expecting 2 streams %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)updateStreamIDs:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s nil streamIDs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __46__CMIOExtensionSessionDevice_updateStreamIDs___block_invoke_cold_1()
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

void __56__CMIOExtensionSessionDevice_setDeviceControlPID_reply___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s setting deviceControlPID error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
