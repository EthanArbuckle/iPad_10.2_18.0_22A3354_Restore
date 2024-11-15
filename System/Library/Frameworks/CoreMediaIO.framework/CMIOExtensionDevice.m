@implementation CMIOExtensionDevice

+ (id)internalProperties
{
  if (internalProperties_onceToken_216 != -1)
    dispatch_once(&internalProperties_onceToken_216, &__block_literal_global_217);
  return (id)internalProperties_gInternalDeviceProperties;
}

uint64_t __41__CMIOExtensionDevice_internalProperties__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", 0x250459538, 0x250459558, 0x250459578, 0x250459598, 0x2504595B8, 0x2504595F8, 0);
  internalProperties_gInternalDeviceProperties = result;
  return result;
}

+ (id)internalWritableProperties
{
  if (internalWritableProperties_onceToken != -1)
    dispatch_once(&internalWritableProperties_onceToken, &__block_literal_global_218);
  return (id)internalWritableProperties_gInternalDeviceProperties;
}

uint64_t __49__CMIOExtensionDevice_internalWritableProperties__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", 0x2504595F8, 0);
  internalWritableProperties_gInternalDeviceProperties = result;
  return result;
}

+ (CMIOExtensionDevice)deviceWithLocalizedName:(NSString *)localizedName deviceID:(NSUUID *)deviceID legacyDeviceID:(NSString *)legacyDeviceID source:(id)source
{
  return (CMIOExtensionDevice *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLocalizedName:deviceID:legacyDeviceID:source:", localizedName, deviceID, legacyDeviceID, source);
}

+ (CMIOExtensionDevice)deviceWithLocalizedName:(NSString *)localizedName deviceID:(NSUUID *)deviceID source:(id)source
{
  return (CMIOExtensionDevice *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLocalizedName:deviceID:source:", localizedName, deviceID, source);
}

- (CMIOExtensionDevice)initWithLocalizedName:(NSString *)localizedName deviceID:(NSUUID *)deviceID legacyDeviceID:(NSString *)legacyDeviceID source:(id)source
{
  CMIOExtensionDevice *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMIOExtensionDevice;
  v10 = -[CMIOExtensionDevice init](&v12, sel_init);
  if (v10)
  {
    v10->_localizedName = (NSString *)-[NSString copy](localizedName, "copy");
    v10->_deviceID = (NSUUID *)-[NSUUID copy](deviceID, "copy");
    v10->_legacyDeviceID = (NSString *)-[NSString copy](legacyDeviceID, "copy");
    objc_storeWeak((id *)&v10->_source, source);
    v10->_streamsLock._os_unfair_lock_opaque = 0;
    v10->_streams = (NSMutableArray *)objc_opt_new();
    v10->_changedPropertiesLock._os_unfair_lock_opaque = 0;
    v10->_changedProperties = (NSMutableDictionary *)objc_opt_new();
    v10->_description = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<CMIOExtensionDevice: name %@, ID %@>"), v10->_localizedName, v10->_deviceID);
  }
  return v10;
}

- (CMIOExtensionDevice)initWithLocalizedName:(NSString *)localizedName deviceID:(NSUUID *)deviceID source:(id)source
{
  return -[CMIOExtensionDevice initWithLocalizedName:deviceID:legacyDeviceID:source:](self, "initWithLocalizedName:deviceID:legacyDeviceID:source:", localizedName, deviceID, cmio_VDCAssistantDeviceUIDForUSBAssistantNSUUID(deviceID), source);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMIOExtensionDevice;
  -[CMIOExtensionDevice dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return self->_description;
}

- (id)_clientQueue_internalPropertyStatesForProperties:(id)a3
{
  void *v5;
  unint64_t v6;
  CMIOExtensionPropertyState *v7;
  CMIOExtensionPropertyState *v8;
  CMIOExtensionPropertyState *v9;
  CMIOExtensionPropertyState *v10;
  CMIOExtensionPropertyState *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CMIOExtensionPropertyState *v18;
  CMIOExtensionPropertyState *v19;
  CMIOExtensionPropertyState *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = 0x24BDD1000;
  if (a3)
  {
    if (objc_msgSend(a3, "containsObject:", 0x250459538))
    {
      v7 = -[CMIOExtensionPropertyState initWithValue:attributes:]([CMIOExtensionPropertyState alloc], "initWithValue:attributes:", self->_localizedName, +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
      objc_msgSend(v5, "setObject:forKey:", v7, 0x250459538);

    }
    if ((objc_msgSend(a3, "containsObject:", 0x250459558) & 1) == 0)
      goto LABEL_8;
  }
  else
  {
    v8 = -[CMIOExtensionPropertyState initWithValue:attributes:]([CMIOExtensionPropertyState alloc], "initWithValue:attributes:", self->_localizedName, +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
    objc_msgSend(v5, "setObject:forKey:", v8, 0x250459538);

  }
  v9 = -[CMIOExtensionPropertyState initWithValue:attributes:]([CMIOExtensionPropertyState alloc], "initWithValue:attributes:", -[NSUUID UUIDString](self->_deviceID, "UUIDString"), +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
  objc_msgSend(v5, "setObject:forKey:", v9, 0x250459558);

  if (!a3)
  {
    v11 = -[CMIOExtensionPropertyState initWithValue:attributes:]([CMIOExtensionPropertyState alloc], "initWithValue:attributes:", self->_legacyDeviceID, +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
    objc_msgSend(v5, "setObject:forKey:", v11, 0x250459578);

    goto LABEL_13;
  }
LABEL_8:
  if (objc_msgSend(a3, "containsObject:", 0x250459578))
  {
    v10 = -[CMIOExtensionPropertyState initWithValue:attributes:]([CMIOExtensionPropertyState alloc], "initWithValue:attributes:", self->_legacyDeviceID, +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
    objc_msgSend(v5, "setObject:forKey:", v10, 0x250459578);

  }
  if ((objc_msgSend(a3, "containsObject:", 0x250459598) & 1) != 0)
  {
LABEL_13:
    v12 = (void *)objc_opt_new();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = -[CMIOExtensionDevice streams](self, "streams", 0);
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(v12, "addObject:", objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v17++), "streamID"), "UUIDString"));
        }
        while (v15 != v17);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v15);
    }
    v18 = -[CMIOExtensionPropertyState initWithValue:attributes:]([CMIOExtensionPropertyState alloc], "initWithValue:attributes:", v12, +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));

    objc_msgSend(v5, "setObject:forKey:", v18, 0x250459598);
    v6 = 0x24BDD1000uLL;
    if (!a3)
      goto LABEL_22;
  }
  if (!objc_msgSend(a3, "containsObject:", 0x2504595B8))
    goto LABEL_23;
LABEL_22:
  v19 = -[CMIOExtensionPropertyState initWithValue:attributes:]([CMIOExtensionPropertyState alloc], "initWithValue:attributes:", objc_msgSend(*(id *)(v6 + 1760), "numberWithBool:", self->_runningSomewhere), +[CMIOExtensionPropertyAttributes readOnlyPropertyAttribute](CMIOExtensionPropertyAttributes, "readOnlyPropertyAttribute"));
  objc_msgSend(v5, "setObject:forKey:", v19, 0x2504595B8);

  if (a3)
  {
LABEL_23:
    if (!objc_msgSend(a3, "containsObject:", 0x2504595F8))
      goto LABEL_25;
  }
  v20 = -[CMIOExtensionPropertyState initWithValue:]([CMIOExtensionPropertyState alloc], "initWithValue:", objc_msgSend(*(id *)(v6 + 1760), "numberWithUnsignedInt:", self->_deviceControlPID));
  objc_msgSend(v5, "setObject:forKey:", v20, 0x2504595F8);

LABEL_25:
  if (objc_msgSend(v5, "count"))
    return v5;
  else
    return 0;
}

- (id)_clientQueue_setAndRemoveInternalPropertyValuesForClient:(id)a3 propertyValues:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  CMIOExtensionPropertyState *v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v8 = +[CMIOExtensionDevice internalWritableProperties](CMIOExtensionDevice, "internalWritableProperties", a3, a4, a5);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __101__CMIOExtensionDevice__clientQueue_setAndRemoveInternalPropertyValuesForClient_propertyValues_error___block_invoke;
  v16[3] = &unk_2504576A8;
  v16[4] = v8;
  v16[5] = &v17;
  objc_msgSend(a4, "enumerateKeysAndObjectsUsingBlock:", v16);
  if (*((_BYTE *)v18 + 24))
  {
    v9 = a4;
  }
  else
  {
    v9 = (id)objc_msgSend(a4, "mutableCopy");
    v10 = (void *)objc_opt_new();
    v11 = (void *)objc_msgSend(a4, "objectForKey:", 0x2504595F8);
    v12 = v11;
    if (v11)
    {
      if ((int)objc_msgSend(v11, "intValue") < 1)
        v13 = -1;
      else
        v13 = objc_msgSend(a3, "pid");
      self->_deviceControlPID = v13;
      objc_msgSend(v9, "removeObjectForKey:", 0x2504595F8);
      v14 = -[CMIOExtensionPropertyState initWithValue:]([CMIOExtensionPropertyState alloc], "initWithValue:", v12);
      objc_msgSend(v10, "setObject:forKey:", v14, 0x2504595F8);

    }
    -[CMIOExtensionDevice notifyPropertiesChanged:](self, "notifyPropertiesChanged:", v10);

  }
  _Block_object_dispose(&v17, 8);
  return v9;
}

uint64_t __101__CMIOExtensionDevice__clientQueue_setAndRemoveInternalPropertyValuesForClient_propertyValues_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (BOOL)didRegister:(id *)a3
{
  os_unfair_lock_s *p_streamsLock;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  p_streamsLock = &self->_streamsLock;
  os_unfair_lock_lock(&self->_streamsLock);
  v6 = (void *)-[NSMutableArray copy](self->_streams, "copy");
  os_unfair_lock_unlock(p_streamsLock);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v10)
        objc_enumerationMutation(v6);
      v12 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v11);
      v32 = 0;
      if ((objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "registerStream:withDeviceID:error:", v12, self->_deviceID, &v32) & 1) == 0)break;
      objc_msgSend(v7, "addObject:", v12);
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v18 = CMIOLog();
    if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionDevice didRegister:].cold.1();
      if (!a3)
        goto LABEL_21;
    }
    else if (!a3)
    {
LABEL_21:
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v19 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v25 != v21)
              objc_enumerationMutation(v7);
            objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "unregisterStream:withDeviceID:notify:error:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), self->_deviceID, 0, 0);
          }
          v20 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
        }
        while (v20);
      }
      v13 = 0;
      goto LABEL_29;
    }
    *a3 = v32;
    goto LABEL_21;
  }
LABEL_9:
  v13 = 1;
  self->_isRegistered = 1;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "setParent:", self);
      }
      v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v15);
    v13 = 1;
  }
LABEL_29:

  return v13;
}

- (void)didUnregister
{
  os_unfair_lock_s *p_streamsLock;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  p_streamsLock = &self->_streamsLock;
  os_unfair_lock_lock(&self->_streamsLock);
  v4 = (void *)-[NSMutableArray copy](self->_streams, "copy");
  os_unfair_lock_unlock(p_streamsLock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v28, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v17;
    *(_QWORD *)&v6 = 136315906;
    v14 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v15 = 0;
        if ((objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider", v14), "unregisterStream:withDeviceID:notify:error:", v10, self->_deviceID, 0, &v15) & 1) == 0)
        {
          v11 = CMIOLog();
          if (v11)
          {
            v12 = v11;
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              v13 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
              *(_DWORD *)buf = v14;
              v21 = v13;
              v22 = 1024;
              v23 = 1532;
              v24 = 2080;
              v25 = "-[CMIOExtensionDevice didUnregister]";
              v26 = 2114;
              v27 = v15;
              _os_log_error_impl(&dword_2330C2000, v12, OS_LOG_TYPE_ERROR, "%s:%d:%s unregisterStream error %{public}@", buf, 0x26u);
            }
          }
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v28, 16);
    }
    while (v7);
  }

  self->_isRegistered = 0;
}

- (NSArray)streams
{
  os_unfair_lock_s *p_streamsLock;
  void *v4;

  p_streamsLock = &self->_streamsLock;
  os_unfair_lock_lock(&self->_streamsLock);
  v4 = (void *)-[NSMutableArray copy](self->_streams, "copy");
  os_unfair_lock_unlock(p_streamsLock);
  return (NSArray *)v4;
}

- (BOOL)addStream:(CMIOExtensionStream *)stream error:(NSError *)outError
{
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString **v13;
  uint64_t *v14;
  NSObject *v15;
  NSError *v16;
  BOOL result;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  const __CFString *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  CMIOExtensionDevice *v32;
  __int16 v33;
  CMIOExtensionStream *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = CMIOLogLevel(1);
  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v26 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v27 = 1024;
      v28 = 1553;
      v29 = 2080;
      v30 = "-[CMIOExtensionDevice addStream:error:]";
      v31 = 2112;
      v32 = self;
      v33 = 2112;
      v34 = stream;
      _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  if (!stream || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v15 = CMIOLog();
    if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionDevice addStream:error:].cold.1();
      if (!outError)
        return 0;
    }
    else if (!outError)
    {
      return 0;
    }
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BDD1100];
    v23 = *MEMORY[0x24BDD0FC8];
    v24 = CFSTR("Invalid stream");
    v12 = (void *)MEMORY[0x24BDBCE70];
    v13 = &v24;
    v14 = &v23;
    goto LABEL_15;
  }
  os_unfair_lock_lock(&self->_streamsLock);
  if ((-[NSMutableArray containsObject:](self->_streams, "containsObject:", stream) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_streamsLock);
    v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionDevice addStream:error:].cold.2();
      if (outError)
        goto LABEL_10;
    }
    else if (outError)
    {
LABEL_10:
      v10 = (void *)MEMORY[0x24BDD1540];
      v11 = *MEMORY[0x24BDD1100];
      v21 = *MEMORY[0x24BDD0FC8];
      v22 = CFSTR("Stream already included");
      v12 = (void *)MEMORY[0x24BDBCE70];
      v13 = &v22;
      v14 = &v21;
LABEL_15:
      v16 = (NSError *)objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, -50, objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 1, v21, v22, v23, v24));
      result = 0;
      *outError = v16;
      return result;
    }
    return 0;
  }
  -[NSMutableArray addObject:](self->_streams, "addObject:", stream);
  os_unfair_lock_unlock(&self->_streamsLock);
  v18 = CMIOLog();
  if (v18)
  {
    v19 = v18;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v20 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      *(_DWORD *)buf = 136316162;
      v26 = v20;
      v27 = 1024;
      v28 = 1581;
      v29 = 2080;
      v30 = "-[CMIOExtensionDevice addStream:error:]";
      v31 = 2114;
      v32 = self;
      v33 = 2114;
      v34 = stream;
      _os_log_impl(&dword_2330C2000, v19, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, %{public}@", buf, 0x30u);
    }
  }
  if (!self->_isRegistered)
    return 1;
  if ((objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "registerStream:withDeviceID:error:", stream, self->_deviceID, outError) & 1) != 0)
  {
    -[CMIOExtensionStream setParent:](stream, "setParent:", self);
    return 1;
  }
  os_unfair_lock_lock(&self->_streamsLock);
  -[NSMutableArray removeObject:](self->_streams, "removeObject:", stream);
  os_unfair_lock_unlock(&self->_streamsLock);
  return 0;
}

- (BOOL)removeStream:(CMIOExtensionStream *)stream error:(NSError *)outError
{
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  id v12;
  NSUUID *deviceID;
  BOOL v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString **v19;
  uint64_t *v20;
  NSError *v21;
  NSObject *v22;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  const __CFString *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  CMIOExtensionDevice *v35;
  __int16 v36;
  CMIOExtensionStream *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = CMIOLogLevel(1);
  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v29 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      v30 = 1024;
      v31 = 1599;
      v32 = 2080;
      v33 = "-[CMIOExtensionDevice removeStream:error:]";
      v34 = 2112;
      v35 = self;
      v36 = 2112;
      v37 = stream;
      _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %@, %@", buf, 0x30u);
    }
  }
  if (!stream || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v15 = CMIOLog();
    if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionDevice removeStream:error:].cold.1();
      if (!outError)
        return 0;
    }
    else if (!outError)
    {
      return 0;
    }
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD1100];
    v26 = *MEMORY[0x24BDD0FC8];
    v27 = CFSTR("Invalid stream");
    v18 = (void *)MEMORY[0x24BDBCE70];
    v19 = &v27;
    v20 = &v26;
LABEL_16:
    v21 = (NSError *)objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, -50, objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, 1, v24, v25, v26, v27));
    v14 = 0;
    *outError = v21;
    return v14;
  }
  os_unfair_lock_lock(&self->_streamsLock);
  if (!-[NSMutableArray containsObject:](self->_streams, "containsObject:", stream))
  {
    os_unfair_lock_unlock(&self->_streamsLock);
    v22 = CMIOLog();
    if (v22 && os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      -[CMIOExtensionDevice removeStream:error:].cold.2();
      if (outError)
        goto LABEL_20;
    }
    else if (outError)
    {
LABEL_20:
      v16 = (void *)MEMORY[0x24BDD1540];
      v17 = *MEMORY[0x24BDD1100];
      v24 = *MEMORY[0x24BDD0FC8];
      v25 = CFSTR("Stream not present");
      v18 = (void *)MEMORY[0x24BDBCE70];
      v19 = &v25;
      v20 = &v24;
      goto LABEL_16;
    }
    return 0;
  }
  -[NSMutableArray removeObject:](self->_streams, "removeObject:", stream);
  os_unfair_lock_unlock(&self->_streamsLock);
  v9 = CMIOLog();
  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      *(_DWORD *)buf = 136316162;
      v29 = v11;
      v30 = 1024;
      v31 = 1627;
      v32 = 2080;
      v33 = "-[CMIOExtensionDevice removeStream:error:]";
      v34 = 2114;
      v35 = self;
      v36 = 2114;
      v37 = stream;
      _os_log_impl(&dword_2330C2000, v10, OS_LOG_TYPE_INFO, "%s:%d:%s %{public}@, %{public}@", buf, 0x30u);
    }
  }
  if (!self->_isRegistered)
    return 1;
  v12 = +[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider");
  deviceID = self->_deviceID;
  v14 = 1;
  objc_msgSend(v12, "unregisterStream:withDeviceID:notify:error:", stream, deviceID, 1, outError);
  return v14;
}

- (void)notifyPropertiesChanged:(NSDictionary *)propertyStates
{
  os_unfair_lock_s *p_changedPropertiesLock;
  NSObject *v6;
  _QWORD block[5];

  p_changedPropertiesLock = &self->_changedPropertiesLock;
  os_unfair_lock_lock(&self->_changedPropertiesLock);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_changedProperties, "addEntriesFromDictionary:", propertyStates);
  os_unfair_lock_unlock(p_changedPropertiesLock);
  v6 = objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "clientQueue");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__CMIOExtensionDevice_notifyPropertiesChanged___block_invoke;
  block[3] = &unk_2504576D0;
  block[4] = self;
  dispatch_async(v6, block);
}

void __47__CMIOExtensionDevice_notifyPropertiesChanged___block_invoke(uint64_t a1)
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  if (objc_msgSend(v2, "count"))
    objc_msgSend(+[CMIOExtensionProvider sharedProvider](CMIOExtensionProvider, "sharedProvider"), "_clientQueue_notifyDevicePropertiesChangedWithDeviceID:propertyStates:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), v2);

}

- (NSString)localizedName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSUUID)deviceID
{
  return (NSUUID *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)legacyDeviceID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (id)source
{
  return objc_loadWeak((id *)&self->_source);
}

- (BOOL)isRegistered
{
  return self->_isRegistered;
}

- (void)setIsRegistered:(BOOL)a3
{
  self->_isRegistered = a3;
}

- (CMIOExtensionProvider)parent
{
  return (CMIOExtensionProvider *)objc_loadWeak((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_source);
  objc_destroyWeak((id *)&self->_parent);
}

- (void)didRegister:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_11(&dword_2330C2000, v0, v1, "%s:%d:%s registerStream error %{public}@ for stream %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)addStream:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid stream", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addStream:error:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Stream already included", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removeStream:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Invalid stream", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removeStream:error:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_2330C2000, v0, v1, "%s:%d:%s Stream not present", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
