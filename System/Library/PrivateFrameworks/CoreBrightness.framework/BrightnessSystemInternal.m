@implementation BrightnessSystemInternal

uint64_t __57__BrightnessSystemInternal_notifyClientsForProperty_key___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  uint64_t result;
  uint64_t inited;
  NSObject *v5;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
    {
      result = objc_msgSend(a3, "indexOfObject:", a1[4]);
      if (result != 0x7FFFFFFFFFFFFFFFLL)
      {
        if ((*(_BYTE *)(a1[5] + 88) & 1) == 0
          || (result = objc_msgSend((id)objc_msgSend(*(id *)(a1[5] + 80), "objectForKey:", a2), "intValue"),
              (_DWORD)result != 2))
        {
          if (*(_QWORD *)(a1[5] + 104))
          {
            v5 = *(NSObject **)(a1[5] + 104);
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              inited = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              inited = init_default_corebrightness_log();
            v5 = inited;
          }
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v9, a2);
            _os_log_debug_impl(&dword_1B5291000, v5, OS_LOG_TYPE_DEBUG, "passed for client %@", v9, 0xCu);
          }
          return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1[5] + 48), "objectForKey:", a2), "remoteObjectProxy"), "notifyChangedProperty:value:", a1[4], a1[6]);
        }
      }
    }
  }
  return result;
}

void __32__BrightnessSystemInternal_init__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t inited;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  id v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  uint64_t v15;
  uint64_t v16;
  os_log_type_t v17;
  os_log_t v18;
  id v19;
  id v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t v27[16];
  uint8_t v28[24];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v26 = a1;
  v25 = a2;
  v24 = a3;
  v23 = a4;
  v22 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = objc_msgSend(v24, "intValue");
    if (v21)
    {
      if (v21 == 1)
      {
        if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
        {
          v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 104);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            inited = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            inited = init_default_corebrightness_log();
          v5 = inited;
        }
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v27, v25);
          _os_log_error_impl(&dword_1B5291000, v5, OS_LOG_TYPE_ERROR, "BSI-barrier: Disabling client %@", v27, 0xCu);
        }
        v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 2);
        if (v9)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setObject:forKey:", v9, v25);

        }
      }
    }
    else
    {
      v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 1);
      if (v20)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setObject:forKey:", v20, v25);

      }
      v19 = 0;
      v19 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", v25);
      v18 = 0;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
      {
        v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 104);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v6 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v6 = init_default_corebrightness_log();
        v7 = v6;
      }
      v18 = v7;
      v17 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v28, v25, (uint64_t)v19);
        _os_log_debug_impl(&dword_1B5291000, v18, v17, "BSI-barrier: Sending barrier to client %@, connection %@", v28, 0x16u);
      }
      v10 = MEMORY[0x1E0C809B0];
      v11 = -1073741824;
      v12 = 0;
      v13 = __32__BrightnessSystemInternal_init__block_invoke_83;
      v14 = &unk_1E68EA540;
      v15 = *(_QWORD *)(a1 + 32);
      v16 = v25;
      objc_msgSend(v19, "scheduleSendBarrierBlock:", &v10);
    }
  }
}

uint64_t __32__BrightnessSystemInternal_init__block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *global_queue;
  dispatch_time_t when;
  id obj;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t, uint64_t, void *, uint64_t);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = a1;
  v13 = a1;
  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) & 1) != 0)
  {
    v1 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    v7 = MEMORY[0x1E0C809B0];
    v8 = -1073741824;
    v9 = 0;
    v10 = __32__BrightnessSystemInternal_init__block_invoke_3;
    v11 = &unk_1E68EA568;
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", &v7);
    when = dispatch_time(0, 10000000000);
    global_queue = dispatch_get_global_queue(17, 0);
    dispatch_after(when, global_queue, *(dispatch_block_t *)(*(_QWORD *)(a1 + 32) + 96));
  }
  return objc_sync_exit(obj);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(id *);
  void *v10;
  BrightnessSystemInternal *v11;
  BacklightdExportedObj *v12;
  id v13;
  id v14;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(id *);
  void *v19;
  BrightnessSystemInternal *v20;
  BacklightdExportedObj *v21;
  id v22;
  id v23;
  id v24;
  BacklightdExportedObj *v25;
  id v26;
  char v27;
  id v28;
  id v29;
  SEL v30;
  BrightnessSystemInternal *v31;

  v31 = self;
  v30 = a2;
  v29 = a3;
  v28 = a4;
  v27 = 1;
  v26 = objc_alloc_init(MEMORY[0x1E0CB3B50]);
  if (v26)
  {
    objc_msgSend(v26, "setProtocol:", &unk_1EF12E668);
    v25 = objc_alloc_init(BacklightdExportedObj);
    if (v25)
    {
      -[BacklightdExportedObj setServer:](v25, "setServer:", v31);
      -[BacklightdExportedObj setConnection:](v25, "setConnection:", v28);
      objc_msgSend(v28, "setExportedInterface:", v26);
      objc_msgSend(v28, "setExportedObject:", v25);
      v24 = objc_alloc_init(MEMORY[0x1E0CB3B50]);
      if (v24)
      {
        objc_msgSend(v24, "setProtocol:", &unk_1EF12D100);
        objc_msgSend(v28, "setRemoteObjectInterface:", v24);
        -[BrightnessSystemInternal clientConnectedWithExpObj:](v31, "clientConnectedWithExpObj:", v25);
        v5 = MEMORY[0x1E0C809B0];
        v15 = MEMORY[0x1E0C809B0];
        v16 = -1073741824;
        v17 = 0;
        v18 = __63__BrightnessSystemInternal_listener_shouldAcceptNewConnection___block_invoke;
        v19 = &unk_1E68EA4D0;
        v20 = v31;
        v21 = v25;
        v22 = v24;
        v23 = v26;
        objc_msgSend(v28, "setInvalidationHandler:", &v15);
        v6 = v5;
        v7 = -1073741824;
        v8 = 0;
        v9 = __63__BrightnessSystemInternal_listener_shouldAcceptNewConnection___block_invoke_2;
        v10 = &unk_1E68EA4D0;
        v11 = v31;
        v12 = v25;
        v13 = v24;
        v14 = v26;
        objc_msgSend(v28, "setInterruptionHandler:", &v6);
        objc_msgSend(v28, "resume");
      }
      else
      {

        v27 = 0;
      }
    }
    else
    {

      v27 = 0;
    }
  }
  else
  {
    v27 = 0;
  }
  return v27 & 1;
}

- (void)clientConnectedWithExpObj:(id)a3
{
  void *v4;
  id v5;

  objc_sync_enter(self);
  if (!self->_clientsProps)
    self->_clientsProps = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  v4 = (void *)objc_msgSend(a3, "copyClientID");
  -[NSMutableDictionary setObject:forKey:](self->_clientsProps, "setObject:forKey:", v5, v4);

  if (!self->_clients)
    self->_clients = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSMutableDictionary setObject:forKey:](self->_clients, "setObject:forKey:", objc_msgSend(a3, "connection"), v4);

  objc_sync_exit(self);
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4 client:(id)a5
{
  if (!self->bl)
    return 0;
  -[BrightnessSystemInternal setOwnedProperty:forKey:client:](self, "setOwnedProperty:forKey:client:", a3, a4, a5);
  if (-[BrightnessSystemInternal isACombinableProperty:](self, "isACombinableProperty:", a4))
    return -[BrightnessSystemInternal setCombinableProperty:forKey:client:](self, "setCombinableProperty:forKey:client:", a3, a4, a5);
  else
    return -[BLControl setPropertyWithKey:property:client:](self->bl, "setPropertyWithKey:property:client:", a4, a3, a5);
}

- (BOOL)isACombinableProperty:(id)a3
{
  return (objc_msgSend(a3, "isEqual:", CFSTR("CoreBrightnessFeaturesDisabled"), a3, a2, self) & 1) != 0;
}

- (void)setOwnedProperty:(id)a3 forKey:(id)a4 client:(id)a5
{
  void *v5;
  void *v6;
  BOOL v7;
  char v8;

  if (a5 && a3 && a4)
  {
    v8 = 0;
    v7 = 0;
    if ((objc_msgSend(a4, "isEqual:", CFSTR("BypassBlueLightReduction")) & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("BypassBLRValue"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = 1;
          v7 = objc_msgSend(v6, "intValue") == 0;
        }
      }
    }
    else if ((objc_msgSend(a4, "isEqual:", CFSTR("MinNits")) & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("nits"));
        objc_msgSend(a3, "valueForKey:", CFSTR("period"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v8 = 1;
            v7 = objc_msgSend(v5, "intValue") == 0;
          }
        }
      }
    }
    else if ((objc_msgSend(a4, "isEqual:", CFSTR("PreStrobe")) & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = 1;
        v7 = objc_msgSend(a3, "intValue") == 0;
      }
    }
    else if ((objc_msgSend(a4, "isEqual:", CFSTR("CBPersonaEnrollment")) & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = 1;
        v7 = objc_msgSend(a3, "intValue") == 0;
      }
    }
    if ((v8 & 1) != 0)
    {
      objc_sync_enter(self);
      if (!self->_ownedProps && !v7)
        self->_ownedProps = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
      if (self->_ownedProps)
      {
        if (v7)
          -[NSMutableDictionary removeObjectForKey:](self->_ownedProps, "removeObjectForKey:", a4);
        else
          -[NSMutableDictionary setObject:forKey:](self->_ownedProps, "setObject:forKey:", a5, a4);
      }
      objc_sync_exit(self);
    }
  }
}

- (id)copyPropertyForKey:(id)a3 client:(id)a4
{
  void *context;
  uint64_t inited;
  NSObject *logHandle;
  id v8;
  id v9;
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v14, (uint64_t)a4, (uint64_t)a3);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "client=%@ key=%@", v14, 0x16u);
  }
  if ((objc_msgSend(a3, "isEqual:", CFSTR("CBSystemInitDuration")) & 1) != 0)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", self->_initDuration);
  if (!self->bl)
    return 0;
  if (-[BrightnessSystemInternal isACombinableProperty:](self, "isACombinableProperty:", a3))
    v9 = -[BrightnessSystemInternal newAggregatedPropertyForCombinablePropertiesForKey:](self, "newAggregatedPropertyForCombinablePropertiesForKey:", a3);
  else
    v9 = -[BLControl copyPropertyWithKey:client:](self->bl, "copyPropertyWithKey:client:", a3, a4);
  v8 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = a3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = (id)objc_msgSend(a3, "getKeyString");
  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("StatusInfo")) & 1) != 0)
  {
    context = (void *)MEMORY[0x1B5E4A8B0]();
    v9 = -[BrightnessSystemInternal adjustDictionaryToBeValidPropertyList:](self, "adjustDictionaryToBeValidPropertyList:", v9);
    objc_autoreleasePoolPop(context);
  }
  return v9;
}

- (void)setNotificationProperties:(id)a3 forClient:(id)a4
{
  uint64_t inited;
  NSObject *logHandle;
  void *v6;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v10, (uint64_t)a4, (uint64_t)a3);
    _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_INFO, "client=%@ keys=%@", v10, 0x16u);
  }
  if (a3 && a4)
  {
    objc_sync_enter(self);
    -[NSMutableDictionary setObject:forKey:](self->_clientsProps, "setObject:forKey:", a3, a4);
    if (self->_checkConnections)
    {
      if (objc_msgSend(a3, "count"))
      {
        if (!self->_clientsConnectionState)
          self->_clientsConnectionState = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        if (!-[NSMutableDictionary objectForKey:](self->_clientsConnectionState, "objectForKey:", a4))
        {
          v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
          if (v6)
          {
            -[NSMutableDictionary setObject:forKey:](self->_clientsConnectionState, "setObject:forKey:", v6, a4);

          }
        }
      }
      else
      {
        -[NSMutableDictionary removeObjectForKey:](self->_clientsConnectionState, "removeObjectForKey:", a4);
      }
    }
    objc_sync_exit(self);
  }
}

uint64_t __32__BrightnessSystemInternal_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  float v3;
  id obj;
  void *v7;
  char v8;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", a2) & 1) != 0)
  {
    v8 = 0;
    if (CBU_IsAccessory())
    {
      v8 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("Brightness"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "floatValue");
          if (v3 == *(float *)(*(_QWORD *)(a1 + 32) + 32))
          {
            v8 = 0;
          }
          else
          {
            *(float *)(*(_QWORD *)(a1 + 32) + 32) = v3;
            v8 = 1;
          }
        }
      }
    }
    if ((v8 & 1) != 0)
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
  }
  objc_sync_exit(obj);
  return objc_msgSend(*(id *)(a1 + 32), "notifyClientsForProperty:key:", a3, a2);
}

- (void)notifyClientsForProperty:(id)a3 key:(id)a4
{
  NSMutableDictionary *clientsProps;
  BrightnessSystemInternal *obj;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t (*v11)(_QWORD *, uint64_t, void *);
  void *v12;
  id v13;
  BrightnessSystemInternal *v14;
  id v15;
  os_log_type_t v16;
  os_log_t v17;
  id v18;
  id v19;
  SEL v20;
  BrightnessSystemInternal *v21;
  uint8_t v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21 = self;
  v20 = a2;
  v19 = a3;
  v18 = a4;
  v17 = 0;
  if (self->_logHandle)
  {
    logHandle = v21->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v17 = logHandle;
  v16 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v22, (uint64_t)v18, (uint64_t)v19);
    _os_log_debug_impl(&dword_1B5291000, v17, v16, "key=%@ property=%@", v22, 0x16u);
  }
  obj = v21;
  objc_sync_enter(v21);
  clientsProps = v21->_clientsProps;
  v8 = MEMORY[0x1E0C809B0];
  v9 = -1073741824;
  v10 = 0;
  v11 = __57__BrightnessSystemInternal_notifyClientsForProperty_key___block_invoke;
  v12 = &unk_1E68EA518;
  v13 = v18;
  v14 = v21;
  v15 = v19;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](clientsProps, "enumerateKeysAndObjectsUsingBlock:", &v8);
  objc_sync_exit(obj);
}

void __63__BrightnessSystemInternal_listener_shouldAcceptNewConnection___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "clientDisconnectedWithExpObj:", a1[5]);

}

void __63__BrightnessSystemInternal_listener_shouldAcceptNewConnection___block_invoke_2(id *a1)
{
  objc_msgSend(a1[4], "clientDisconnectedWithExpObj:", a1[5]);

}

- (void)clientDisconnectedWithExpObj:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "copyClientID");
  -[BrightnessSystemInternal undoOwnedPropertiesForClient:](self, "undoOwnedPropertiesForClient:", v3);
  -[BrightnessSystemInternal undoCombinablePropertiesForClient:](self, "undoCombinablePropertiesForClient:", v3);
  objc_sync_enter(self);
  if (self->_clientsConnectionState)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_clientsConnectionState, "removeObjectForKey:", v3);
    if (!-[NSMutableDictionary count](self->_clientsConnectionState, "count"))
    {

      self->_clientsConnectionState = 0;
    }
  }
  if (self->_clientsProps)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_clientsProps, "removeObjectForKey:", v3);
    if (!-[NSMutableDictionary count](self->_clientsProps, "count"))
    {

      self->_clientsProps = 0;
    }
  }
  if (self->_clients)
    -[NSMutableDictionary removeObjectForKey:](self->_clients, "removeObjectForKey:", v3);

  objc_sync_exit(self);
}

- (void)destroyServer
{
  objc_sync_enter(self);
  self->_checkConnections = 0;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  -[BLControl stop](self->bl, "stop");
  -[BrightnessSystemInternal registerNotificationBlock:](self, "registerNotificationBlock:", 0);
  if (self->_clients)
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_clients, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_3);
  objc_sync_exit(self);
}

uint64_t __41__BrightnessSystemInternal_destroyServer__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
    return objc_msgSend(a3, "invalidate");
  return result;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  BrightnessSystemInternal *v4;

  v4 = self;
  v3 = a2;

  v4->_listener = 0;
  v4->bl = 0;

  v4->_callbackProps = 0;
  v4->_ownedProps = 0;

  v4->_combinableProps = 0;
  v4->_clients = 0;

  v4->_clientsConnectionState = 0;
  if (v4->_logHandle)
  {

    v4->_logHandle = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)BrightnessSystemInternal;
  -[BrightnessSystemInternal dealloc](&v2, sel_dealloc);
}

- (BrightnessSystemInternal)init
{
  void *v2;
  NSObject *global_queue;
  uint64_t inited;
  NSObject *v6;
  dispatch_time_t when;
  NSObject *log;
  os_log_type_t type;
  NSObject *v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t (*v20)(uint64_t, uint64_t, void *);
  void *v21;
  id v22;
  uint8_t v23[7];
  char v24;
  NSObject *v25;
  objc_super v26;
  BOOL v27;
  CFAbsoluteTime Current;
  SEL v29;
  id v30;
  uint8_t v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v30 = self;
  v29 = a2;
  Current = CFAbsoluteTimeGetCurrent();
  v27 = CFPreferencesGetAppBooleanValue(CFSTR("CBInitNotificationPreference"), CFSTR("com.apple.CoreBrightness"), 0) != 0;
  if (v27)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter"), "postNotificationName:object:", CFSTR("CBSystemInitStart"), 0);
  v26.receiver = v30;
  v26.super_class = (Class)BrightnessSystemInternal;
  v30 = -[BrightnessSystemInternal init](&v26, sel_init);
  if (v30)
  {
    *((_QWORD *)v30 + 1) = objc_alloc_init(BLControl);
    *((_QWORD *)v30 + 3) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v30 + 13) = os_log_create("com.apple.CoreBrightness.BrightnessSystemInternal", "default");
    if (!*((_QWORD *)v30 + 13))
    {
      v25 = 0;
      v10 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      v25 = v10;
      v24 = 16;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        log = v25;
        type = v24;
        __os_log_helper_16_0_0(v23);
        _os_log_error_impl(&dword_1B5291000, log, type, "failed to create log handle", v23, 2u);
      }
    }
    if (*((_QWORD *)v30 + 1))
    {
      if ((objc_msgSend(*((id *)v30 + 1), "start") & 1) != 0)
      {
        v2 = (void *)*((_QWORD *)v30 + 1);
        v17 = MEMORY[0x1E0C809B0];
        v18 = -1073741824;
        v19 = 0;
        v20 = __32__BrightnessSystemInternal_init__block_invoke;
        v21 = &unk_1E68E9F38;
        v22 = v30;
        objc_msgSend(v2, "registerNotificationBlock:", &v17);
        *((_QWORD *)v30 + 5) = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.backlightd"));
        if (*((_QWORD *)v30 + 5))
        {
          objc_msgSend(*((id *)v30 + 5), "setDelegate:", v30);
          objc_msgSend(*((id *)v30 + 5), "resume");
        }
        *((_BYTE *)v30 + 88) = 1;
        v11 = MEMORY[0x1E0C809B0];
        v12 = -1073741824;
        v13 = 0;
        v14 = __32__BrightnessSystemInternal_init__block_invoke_2;
        v15 = &unk_1E68E9E60;
        v16 = v30;
        *((_QWORD *)v30 + 12) = objc_msgSend(&v11, "copy");
        when = dispatch_time(0, 10000000000);
        global_queue = dispatch_get_global_queue(17, 0);
        dispatch_after(when, global_queue, *((dispatch_block_t *)v30 + 12));
        *((CFAbsoluteTime *)v30 + 14) = CFAbsoluteTimeGetCurrent() - Current;
        if (*((_QWORD *)v30 + 13))
        {
          v6 = *((_QWORD *)v30 + 13);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            inited = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            inited = init_default_corebrightness_log();
          v6 = inited;
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v31, *((_QWORD *)v30 + 14));
          _os_log_debug_impl(&dword_1B5291000, v6, OS_LOG_TYPE_DEBUG, "Init done after %0.4fs", v31, 0xCu);
        }
      }
      else
      {

        *((_QWORD *)v30 + 1) = 0;
        v30 = 0;
      }
    }
  }
  if (v27)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter"), "postNotificationName:object:", CFSTR("CBSystemInitDone"), 0);
  return (BrightnessSystemInternal *)v30;
}

uint64_t __32__BrightnessSystemInternal_init__block_invoke_83(uint64_t a1)
{
  uint64_t inited;
  NSObject *v3;
  id obj;
  void *v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKey:", *(_QWORD *)(a1 + 40)))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
    if (v6)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setObject:forKey:", v6, *(_QWORD *)(a1 + 40));

      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
      {
        v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 104);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        v3 = inited;
      }
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v7, *(_QWORD *)(a1 + 40));
        _os_log_debug_impl(&dword_1B5291000, v3, OS_LOG_TYPE_DEBUG, "BSI-barrier: Resetting state for client %@", v7, 0xCu);
      }
    }
  }
  return objc_sync_exit(obj);
}

- (id)adjustDictionaryToBeValidPropertyList:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id obj;
  uint64_t v17;
  _QWORD v18[8];
  uint64_t v19;
  id v20;
  _QWORD __b[8];
  id v22;
  id v23;
  id v24;
  SEL v25;
  BrightnessSystemInternal *v26;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v26 = self;
  v25 = a2;
  v24 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = (id)objc_opt_new();
    memset(__b, 0, sizeof(__b));
    obj = v24;
    v17 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
    if (v17)
    {
      v13 = *(_QWORD *)__b[2];
      v14 = 0;
      v15 = v17;
      while (1)
      {
        v12 = v14;
        if (*(_QWORD *)__b[2] != v13)
          objc_enumerationMutation(obj);
        v22 = 0;
        v22 = *(id *)(__b[1] + 8 * v14);
        v11 = v23;
        v10 = -[BrightnessSystemInternal adjustDictionaryToBeValidPropertyList:](v26, "adjustDictionaryToBeValidPropertyList:", objc_msgSend(v24, "objectForKeyedSubscript:", v22));
        objc_msgSend(v11, "setObject:forKey:", v10, objc_msgSend(v22, "description"));
        ++v14;
        if (v12 + 1 >= v15)
        {
          v14 = 0;
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
          if (!v15)
            break;
        }
      }
    }
    return v23;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = (id)objc_opt_new();
      memset(v18, 0, sizeof(v18));
      v8 = v24;
      v9 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", v18, v28, 16);
      if (v9)
      {
        v5 = *(_QWORD *)v18[2];
        v6 = 0;
        v7 = v9;
        while (1)
        {
          v4 = v6;
          if (*(_QWORD *)v18[2] != v5)
            objc_enumerationMutation(v8);
          v19 = 0;
          v19 = *(_QWORD *)(v18[1] + 8 * v6);
          objc_msgSend(v20, "addObject:", -[BrightnessSystemInternal adjustDictionaryToBeValidPropertyList:](v26, "adjustDictionaryToBeValidPropertyList:", v19));
          ++v6;
          if (v4 + 1 >= v7)
          {
            v6 = 0;
            v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v18, v28, 16);
            if (!v7)
              break;
          }
        }
      }
      return v20;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return v24;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return v24;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return v24;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return v24;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return v24;
      else
        return (id)objc_msgSend(v24, "description");
    }
  }
}

- (BOOL)isAlsSupported
{
  BOOL v3;
  id cf1;

  v3 = 0;
  cf1 = -[BrightnessSystemInternal copyPropertyForKey:client:](self, "copyPropertyForKey:client:", CFSTR("BLControlAlsSupported"), 0);
  if (cf1)
  {
    v3 = CFEqual(cf1, (CFTypeRef)*MEMORY[0x1E0C9AE50]) != 0;

  }
  return v3;
}

- (void)registerNotificationBlock:(id)a3
{
  -[BrightnessSystemInternal registerNotificationBlock:forProperties:](self, "registerNotificationBlock:forProperties:", a3, &unk_1E6917480);
}

- (void)registerNotificationBlock:(id)a3 forProperties:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v9;
  _QWORD __b[8];
  uint64_t v12;
  int v13;
  id v14;
  id v15;
  SEL v16;
  BrightnessSystemInternal *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = a4;
  objc_sync_enter(self);
  if (v17->_callback)
  {
    _Block_release(v17->_callback);
    v17->_callback = 0;
  }
  if (v15)
    v17->_callback = _Block_copy(v15);
  -[NSMutableArray removeAllObjects](v17->_callbackProps, "removeAllObjects");
  if (v14)
  {
    memset(__b, 0, sizeof(__b));
    obj = v14;
    v9 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
    if (v9)
    {
      v5 = *(_QWORD *)__b[2];
      v6 = 0;
      v7 = v9;
      while (1)
      {
        v4 = v6;
        if (*(_QWORD *)__b[2] != v5)
          objc_enumerationMutation(obj);
        v12 = 0;
        v12 = *(_QWORD *)(__b[1] + 8 * v6);
        -[NSMutableArray addObject:](v17->_callbackProps, "addObject:", v12);
        ++v6;
        if (v4 + 1 >= v7)
        {
          v6 = 0;
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
          if (!v7)
            break;
        }
      }
    }
    v13 = 0;
  }
  else
  {
    v13 = 1;
  }
  objc_sync_exit(self);
}

- (void)undoOwnedPropertiesForClient:(id)a3
{
  double v3;
  double v4;
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);
  void *v11;
  BrightnessSystemInternal *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  SEL v24;
  BrightnessSystemInternal *v25;

  v25 = self;
  v24 = a2;
  v23 = a3;
  if (a3)
  {
    v22 = 0;
    objc_sync_enter(v25);
    if (v25->_ownedProps)
    {
      if ((objc_msgSend(v23, "isEqual:", -[NSMutableDictionary objectForKey:](v25->_ownedProps, "objectForKey:", CFSTR("BypassBlueLightReduction"))) & 1) != 0)
      {
        v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
        v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
        LODWORD(v3) = 2.0;
        v20 = (id)objc_msgSend(v6, "initWithFloat:", v3);
        if (v21)
        {
          if (v20)
          {
            v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v21, CFSTR("BypassBLRValue"), v20, CFSTR("BypassBLRPeriod"), 0);
            if (v19)
            {
              v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              objc_msgSend(v22, "setValue:forKey:", v19, CFSTR("BypassBlueLightReduction"));

              -[NSMutableDictionary removeObjectForKey:](v25->_ownedProps, "removeObjectForKey:", CFSTR("BypassBlueLightReduction"));
            }
          }
        }

      }
      if ((objc_msgSend(v23, "isEqual:", -[NSMutableDictionary objectForKey:](v25->_ownedProps, "objectForKey:", CFSTR("PreStrobe"))) & 1) != 0)
      {
        v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
        if (v18)
        {
          if (!v22)
            v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v22, "setValue:forKey:", v18, CFSTR("PreStrobe"));

          -[NSMutableDictionary removeObjectForKey:](v25->_ownedProps, "removeObjectForKey:", CFSTR("PreStrobe"));
        }
      }
      if ((objc_msgSend(v23, "isEqual:", -[NSMutableDictionary objectForKey:](v25->_ownedProps, "objectForKey:", CFSTR("CBPersonaEnrollment"))) & 1) != 0)
      {
        v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
        if (v17)
        {
          if (!v22)
            v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v22, "setValue:forKey:", v17, CFSTR("CBPersonaEnrollment"));

          -[NSMutableDictionary removeObjectForKey:](v25->_ownedProps, "removeObjectForKey:", CFSTR("CBPersonaEnrollment"));
        }
      }
      if ((objc_msgSend(v23, "isEqual:", -[NSMutableDictionary objectForKey:](v25->_ownedProps, "objectForKey:", CFSTR("MinNits"))) & 1) != 0)
      {
        v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
        v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
        LODWORD(v4) = 0.5;
        v15 = (id)objc_msgSend(v5, "initWithFloat:", v4);
        if (v16)
        {
          if (v15)
          {
            v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v16, CFSTR("nits"), v15, CFSTR("period"), 0);
            if (v14)
            {
              if (!v22)
                v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              objc_msgSend(v22, "setValue:forKey:", v14, CFSTR("MinNits"));

              -[NSMutableDictionary removeObjectForKey:](v25->_ownedProps, "removeObjectForKey:", CFSTR("MinNits"));
            }
          }
        }

      }
    }
    objc_sync_exit(v25);
    if (v22)
    {
      v7 = MEMORY[0x1E0C809B0];
      v8 = -1073741824;
      v9 = 0;
      v10 = __57__BrightnessSystemInternal_undoOwnedPropertiesForClient___block_invoke;
      v11 = &unk_1E68EA590;
      v12 = v25;
      v13 = v23;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", &v7);

    }
  }
}

uint64_t __57__BrightnessSystemInternal_undoOwnedPropertiesForClient___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setPropertyWithKey:property:client:", a2, a3, *(_QWORD *)(a1 + 40));
  return result;
}

- (BOOL)setCombinableProperty:(id)a3 forKey:(id)a4 client:(id)a5
{
  uint64_t v6;
  NSObject *v7;
  uint64_t inited;
  NSObject *logHandle;
  id v10;
  id v11;
  id v12;
  char v13;
  char v18;
  uint8_t v19[16];
  uint8_t v20[40];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v20, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
    _os_log_debug_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEBUG, "setCombinableProperty %@ for key %@ and client %@", v20, 0x20u);
  }
  if (a3 && a4)
  {
    objc_sync_enter(self);
    if (!self->_combinableProps)
      self->_combinableProps = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_combinableProps, "objectForKeyedSubscript:", a4);
    if (!v12)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_combinableProps, "setObject:forKeyedSubscript:", v12, a4);

    }
    if (self->_logHandle)
    {
      v7 = self->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v6 = init_default_corebrightness_log();
      v7 = v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v19, (uint64_t)self->_combinableProps);
      _os_log_debug_impl(&dword_1B5291000, v7, OS_LOG_TYPE_DEBUG, "setCombinableProperty _combinableProps is now %@", v19, 0xCu);
    }
    if (a5)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", a3, a5);
    else
      objc_msgSend(v12, "setObject:forKeyedSubscript:", a3, CFSTR("server"));
    objc_sync_exit(self);
    v11 = -[BrightnessSystemInternal newAggregatedPropertyForCombinablePropertiesForKey:](self, "newAggregatedPropertyForCombinablePropertiesForKey:", a4);
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", 0x7FFFFFFFFFFFFFFFLL);
    v13 = -[BLControl setPropertyWithKey:property:client:](self->bl, "setPropertyWithKey:property:client:", a4, v11, v10);

    v18 = v13 & 1;
  }
  else
  {
    v18 = 0;
  }
  return v18 & 1;
}

- (id)newAggregatedPropertyForCombinablePropertiesForKey:(id)a3
{
  uint64_t v3;
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;
  double v9;
  double v10;
  double v11;
  id v13;
  uint64_t v14;
  NSObject *v15;
  float v16;
  float v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id obj;
  uint64_t inited;
  NSObject *logHandle;
  _BYTE v27[12];
  void *context;
  float v30;
  float v31;
  float v32;
  BOOL v33;
  float v34;
  char v35;
  BOOL v36;
  id v37;
  _QWORD __b[8];
  uint64_t v39;
  char v40;
  char v41;
  float v42;
  float v43;
  float v44;
  char v45;
  float v46;
  char v47;
  char v48;
  os_log_type_t type;
  os_log_t v50;
  id v51;
  float v52;
  float v53;
  id v54;
  id v55;
  SEL v56;
  BrightnessSystemInternal *v57;
  uint8_t v58[16];
  _BYTE v59[128];
  uint8_t v60[24];
  uint64_t v61;

  *(_DWORD *)&v27[8] = 0;
  v61 = *MEMORY[0x1E0C80C00];
  v57 = self;
  v56 = a2;
  v55 = a3;
  v3 = objc_sync_enter(self);
  v54 = 0;
  context = (void *)MEMORY[0x1B5E4A8B0](v3);
  *(_QWORD *)v27 = objc_msgSend(v55, "isEqual:", CFSTR("CoreBrightnessFeaturesDisabled"));
  if ((v27[0] & 1) != 0)
  {
    v53 = 1.0;
    v52 = 1.0;
    v51 = 0;
    v50 = 0;
    if (v57->_logHandle)
    {
      logHandle = v57->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v50 = logHandle;
    type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v60, (uint64_t)v55, (uint64_t)v57->_combinableProps);
      _os_log_debug_impl(&dword_1B5291000, v50, type, "copyAggregatedPropertyForCombinablePropertiesForKey. key: %@, combinableProps: %@", v60, 0x16u);
    }
    if (v57->_combinableProps
      && -[NSMutableDictionary objectForKeyedSubscript:](v57->_combinableProps, "objectForKeyedSubscript:", v55)
      && objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v57->_combinableProps, "objectForKeyedSubscript:", v55), "count"))
    {
      v48 = 0;
      v47 = 0;
      v46 = 2.0;
      v45 = 0;
      v44 = 0.0;
      v43 = 10.0;
      v42 = 10.0;
      v41 = 0;
      v40 = 0;
      memset(__b, 0, sizeof(__b));
      obj = (id)-[NSMutableDictionary objectForKeyedSubscript:](v57->_combinableProps, "objectForKeyedSubscript:", v55);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v59, 16);
      if (v23)
      {
        v20 = *(_QWORD *)__b[2];
        v21 = *(_QWORD *)&v27[4];
        v22 = v23;
        while (1)
        {
          v19 = v21;
          if (*(_QWORD *)__b[2] != v20)
            objc_enumerationMutation(obj);
          v39 = 0;
          v39 = *(_QWORD *)(__b[1] + 8 * v21);
          v18 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](v57->_combinableProps, "objectForKeyedSubscript:", v55);
          v37 = (id)objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v39), "mutableCopy");
          v4 = v37;
          if (objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Status")))
          {
            objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Status")), CFSTR("DisableWPShift"));
            if (objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("FixBrightnessNits"))
              && (objc_msgSend((id)objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Status")), "BOOLValue") & 1) != 0)
            {
              objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("FixBrightnessNits")), CFSTR("OverrideBrightnessWithFixedNits"));
            }
            else if (objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("FixBrightness"))
                   && (objc_msgSend((id)objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Status")), "BOOLValue") & 1) != 0)
            {
              objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("FixBrightness")), CFSTR("OverrideBrightnessWithFixedSliderPosition"));
            }
          }
          v36 = objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("OverrideBrightnessWithFixedNits")) != 0;
          v35 = objc_msgSend((id)objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("DisableWPShift")), "BOOLValue") & 1;
          objc_msgSend((id)objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("OverrideBrightnessWithFixedNits")), "floatValue");
          v34 = v5;
          v33 = objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("OverrideBrightnessWithFixedSliderPosition")) != 0;
          objc_msgSend((id)objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("OverrideBrightnessWithFixedSliderPosition")), "floatValue");
          v32 = v6;
          objc_msgSend((id)objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("ReenablementRampPeriod")), "floatValue");
          v31 = v7;
          objc_msgSend((id)objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("DisablementRampPeriod")), "floatValue");
          v30 = v8;
          if (objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("ReenablementRampPeriod")) && v31 < v42)
          {
            v42 = v31;
            v40 = 1;
          }
          if (objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("DisablementRampPeriod")) && v30 < v43)
          {
            v43 = v30;
            v41 = 1;
          }
          if (v36)
            v48 = 1;
          if (v33)
            v45 = 1;
          if ((v35 & 1) != 0)
            v47 = 1;
          if (v34 > v46)
            v46 = v34;
          *(float *)&v9 = v32;
          if (v32 > v44)
          {
            *(float *)&v9 = v32;
            v44 = v32;
          }
          ++v21;
          if (v19 + 1 >= v22)
          {
            v21 = *(_QWORD *)&v27[4];
            v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v59, 16, v9);
            if (!v22)
              break;
          }
        }
      }
      v51 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      objc_msgSend(v51, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v47 & 1), CFSTR("DisableWPShift"));
      if ((v48 & 1) != 0)
      {
        *(float *)&v10 = v46;
        objc_msgSend(v51, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10), CFSTR("OverrideBrightnessWithFixedNits"));
      }
      if ((v45 & 1) != 0)
      {
        *(float *)&v10 = v44;
        objc_msgSend(v51, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10), CFSTR("OverrideBrightnessWithFixedSliderPosition"));
      }
      if ((v40 & 1) != 0)
        v17 = v42;
      else
        v17 = 1.0;
      *(float *)&v10 = v17;
      objc_msgSend(v51, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10), CFSTR("ReenablementRampPeriod"));
      if ((v41 & 1) != 0)
        v16 = v43;
      else
        v16 = 1.0;
      *(float *)&v11 = v16;
      objc_msgSend(v51, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11), CFSTR("DisablementRampPeriod"));
    }
    else
    {
      v51 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", &unk_1E6917678);
    }
    v54 = v51;
    if (v57->_logHandle)
    {
      v15 = v57->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v14 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v14 = init_default_corebrightness_log();
      v15 = v14;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v58, (uint64_t)v54);
      _os_log_debug_impl(&dword_1B5291000, v15, OS_LOG_TYPE_DEBUG, "copyAggregatedPropertyForCombinablePropertiesForKey return dictionary %@", v58, 0xCu);
    }
  }
  objc_autoreleasePoolPop(context);
  v13 = v54;
  objc_sync_exit(self);
  return v13;
}

- (void)undoCombinablePropertiesForClient:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t inited;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v20[8];
  uint64_t v21;
  os_log_type_t type;
  os_log_t oslog;
  id v24;
  _QWORD __b[8];
  uint64_t v26;
  id v27;
  id v28;
  SEL v29;
  id obj;
  _BYTE v31[128];
  uint8_t v32[24];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  obj = self;
  v29 = a2;
  v28 = a3;
  if (a3)
  {
    v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = obj;
    objc_sync_enter(obj);
    memset(__b, 0, sizeof(__b));
    v16 = (id)*((_QWORD *)obj + 9);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", __b, v33, 16);
    if (v17)
    {
      v12 = *(_QWORD *)__b[2];
      v13 = 0;
      v14 = v17;
      while (1)
      {
        v11 = v13;
        if (*(_QWORD *)__b[2] != v12)
          objc_enumerationMutation(v16);
        v26 = 0;
        v26 = *(_QWORD *)(__b[1] + 8 * v13);
        v24 = 0;
        v24 = (id)objc_msgSend(*((id *)obj + 9), "objectForKeyedSubscript:", v26);
        if (objc_msgSend(v24, "objectForKeyedSubscript:", v28))
        {
          objc_msgSend(v24, "removeObjectForKey:", v28);
          oslog = 0;
          if (*((_QWORD *)obj + 13))
          {
            v10 = *((_QWORD *)obj + 13);
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT)
              inited = _COREBRIGHTNESS_LOG_DEFAULT;
            else
              inited = init_default_corebrightness_log();
            v10 = inited;
          }
          oslog = v10;
          type = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v32, (uint64_t)v28);
            _os_log_debug_impl(&dword_1B5291000, oslog, type, "undoCombinableProperties for client %@", v32, 0xCu);
          }
          objc_msgSend(v27, "addObject:", v26);
        }
        ++v13;
        if (v11 + 1 >= v14)
        {
          v13 = 0;
          v14 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", __b, v33, 16);
          if (!v14)
            break;
        }
      }
    }
    objc_sync_exit(v15);
    memset(v20, 0, sizeof(v20));
    v7 = v27;
    v8 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", v20, v31, 16);
    if (v8)
    {
      v4 = *(_QWORD *)v20[2];
      v5 = 0;
      v6 = v8;
      while (1)
      {
        v3 = v5;
        if (*(_QWORD *)v20[2] != v4)
          objc_enumerationMutation(v7);
        v21 = 0;
        v21 = *(_QWORD *)(v20[1] + 8 * v5);
        v19 = (id)objc_msgSend(obj, "newAggregatedPropertyForCombinablePropertiesForKey:", v21);
        v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", 0x7FFFFFFFFFFFFFFFLL);
        objc_msgSend(*((id *)obj + 1), "setPropertyWithKey:property:client:", v21, v19, v18);

        ++v5;
        if (v3 + 1 >= v6)
        {
          v5 = 0;
          v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", v20, v31, 16);
          if (!v6)
            break;
        }
      }
    }

  }
}

@end
