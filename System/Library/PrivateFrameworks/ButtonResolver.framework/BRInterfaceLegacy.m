@implementation BRInterfaceLegacy

- (BRInterfaceLegacy)init
{
  BRInterfaceLegacy *v2;
  BRInterfaceLegacy *v3;
  NSMutableArray *v4;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BRInterfaceLegacy;
  v2 = -[BRInterface init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_maxAssetSlots = -1;
    v2->_unusedAssetSlots = -1;
    v2->_isReady = 0;
    v2->_client = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v3->_services = v4;
    if (v4)
    {
      v3->_block = 0;
      v3->_tapOnly = 0;
      v3->_doublePressTimeoutUs = 0;
      v3->_triplePressTimeoutUs = 0;
      v3->_doubleTapTimeoutUs = 0;
      v3->_tripleTapTimeoutUs = 0;
      v3->_longPressTimeoutUs = 0;
    }
    else
    {
      v6 = _BRLog_log_1;
      if (!_BRLog_log_1)
      {
        v6 = os_log_create("com.apple.ButtonResolver", "default");
        _BRLog_log_1 = (uint64_t)v6;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[BRInterfaceLegacy init].cold.1(v6, v7, v8);

      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  __IOHIDEventSystemClient *client;
  objc_super v4;

  client = self->_client;
  if (client)
    CFRelease(client);

  v4.receiver = self;
  v4.super_class = (Class)BRInterfaceLegacy;
  -[BRInterface dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRInterfaceLegacy;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", -[BRInterface description](&v5, sel_description));
  objc_msgSend(v3, "appendFormat:", CFSTR("Services: %@;\n"), self->_services);
  objc_msgSend(v3, "appendFormat:", CFSTR("DoublePressTO: %lu;\n"), self->_doublePressTimeoutUs);
  objc_msgSend(v3, "appendFormat:", CFSTR("TriplePressTO: %lu;\n"), self->_triplePressTimeoutUs);
  objc_msgSend(v3, "appendFormat:", CFSTR("DoubleTapTO: %lu;\n"), self->_doubleTapTimeoutUs);
  objc_msgSend(v3, "appendFormat:", CFSTR("TripleTapTO: %lu;\n"), self->_tripleTapTimeoutUs);
  objc_msgSend(v3, "appendFormat:", CFSTR("LongPressTO: %lu;\n"), self->_longPressTimeoutUs);
  return v3;
}

- (id)propertyList
{
  void *v3;
  const char *v4;
  NSObject *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRInterfaceLegacy;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", -[BRInterface propertyList](&v7, sel_propertyList));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_doublePressTimeoutUs), CFSTR("DoublePressTO"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_triplePressTimeoutUs), CFSTR("TriplePressTO"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_doubleTapTimeoutUs), CFSTR("DoubleTapTO"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_tripleTapTimeoutUs), CFSTR("TripleTapTO"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_longPressTimeoutUs), CFSTR("LongPressTO"));
  if (self->_tapOnly)
    v4 = "Y";
  else
    v4 = "N";
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s;"), v4),
    CFSTR("TapOnly"));
  v5 = _BRLog_log_1;
  if (!_BRLog_log_1)
  {
    v5 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_1 = (uint64_t)v5;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BRInterfaceLegacy propertyList].cold.1();
  return v3;
}

+ (id)interface
{
  return objc_alloc_init(BRInterfaceLegacy);
}

- (void)_findServices
{
  __IOHIDEventSystemClient *v3;
  OS_dispatch_queue *v4;
  _QWORD block[5];

  v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
  self->_client = v3;
  if (v3)
  {
    IOHIDEventSystemClientSetMatchingMultiple();
    v4 = -[BRInterface queue](self, "queue");
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__BRInterfaceLegacy__findServices__block_invoke;
    block[3] = &unk_24D4A3E38;
    block[4] = self;
    dispatch_async((dispatch_queue_t)v4, block);
  }
}

void __34__BRInterfaceLegacy__findServices__block_invoke(uint64_t a1)
{
  CFArrayRef v2;
  CFArrayRef v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "queue");
  IOHIDEventSystemClientScheduleWithDispatchQueue();
  IOHIDEventSystemClientRegisterDeviceMatchingCallback();
  v2 = IOHIDEventSystemClientCopyServices(*(IOHIDEventSystemClientRef *)(*(_QWORD *)(a1 + 32) + 56));
  v3 = v2;
  if (v2)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v4 = -[__CFArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          v4 = serviceAddedCallback(v4, *(void **)(a1 + 32), *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v4 = -[__CFArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        v5 = v4;
      }
      while (v4);
    }
  }

}

- (void)serviceAddedHandler:(__IOHIDServiceClient *)a3
{
  NSObject *v5;

  -[NSMutableArray addObject:](self->_services, "addObject:");
  IOHIDServiceClientRegisterRemovalCallback();
  -[BRInterfaceLegacy _setDefaultServicePropertiesOnService:](self, "_setDefaultServicePropertiesOnService:", a3);
  if (!self->_isReady)
  {
    self->_isReady = 1;
    if (self->_block)
    {
      dispatch_async((dispatch_queue_t)-[BRInterface queue](self, "queue"), self->_block);

      self->_block = 0;
    }
    else
    {
      v5 = _BRLog_log_1;
      if (!_BRLog_log_1)
      {
        v5 = os_log_create("com.apple.ButtonResolver", "default");
        _BRLog_log_1 = (uint64_t)v5;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[BRInterfaceLegacy serviceAddedHandler:].cold.1(v5);
    }
  }
}

- (void)serviceRemovedHandler:(__IOHIDServiceClient *)a3
{
  NSMutableArray *services;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  services = self->_services;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](services, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(services);
      v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
      if (CFEqual(v10, a3))
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](services, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_16;
      }
    }
    if (!v10)
      goto LABEL_16;
    v11 = _BRLog_log_1;
    if (!_BRLog_log_1)
    {
      v11 = os_log_create("com.apple.ButtonResolver", "default");
      _BRLog_log_1 = (uint64_t)v11;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[BRInterfaceLegacy serviceRemovedHandler:].cold.2((__IOHIDServiceClient *)v10, v11);
    -[NSMutableArray removeObject:](self->_services, "removeObject:", v10);
  }
  else
  {
LABEL_16:
    v12 = _BRLog_log_1;
    if (!_BRLog_log_1)
    {
      v12 = os_log_create("com.apple.ButtonResolver", "default");
      _BRLog_log_1 = (uint64_t)v12;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[BRInterfaceLegacy serviceRemovedHandler:].cold.1(a3, v12);
  }
}

- (BOOL)_servicesSetProperty:(void *)a3 forKey:(__CFString *)a4
{
  NSObject *v7;
  OS_dispatch_queue *v8;
  BOOL v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  v7 = _BRLog_log_1;
  if (!_BRLog_log_1)
  {
    v7 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_1 = (uint64_t)v7;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BRInterfaceLegacy _servicesSetProperty:forKey:].cold.1();
  v8 = -[BRInterface queue](self, "queue");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__BRInterfaceLegacy__servicesSetProperty_forKey___block_invoke;
  v11[3] = &unk_24D4A3EB0;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = a4;
  v11[7] = a3;
  dispatch_sync((dispatch_queue_t)v8, v11);
  v9 = *((_BYTE *)v13 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  return v9;
}

void __49__BRInterfaceLegacy__servicesSetProperty_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  NSObject *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = IOHIDServiceClientSetProperty(*(IOHIDServiceClientRef *)(*((_QWORD *)&v8 + 1)+ 8 * i), *(CFStringRef *)(a1 + 48), *(CFTypeRef *)(a1 + 56));
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        {
          v7 = _BRLog_log_1;
          if (!_BRLog_log_1)
          {
            v7 = os_log_create("com.apple.ButtonResolver", "default");
            _BRLog_log_1 = (uint64_t)v7;
          }
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            __49__BRInterfaceLegacy__servicesSetProperty_forKey___block_invoke_cold_1();
          return;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
}

- (BOOL)_setDefaultServicePropertiesOnService:(__IOHIDServiceClient *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  NSObject *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(&unk_24D4A6878, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(&unk_24D4A6878);
        if (!IOHIDServiceClientSetProperty(a3, *(CFStringRef *)(*((_QWORD *)&v11 + 1) + 8 * v7), &unk_24D4A5EC8))
        {
          v9 = _BRLog_log_1;
          if (!_BRLog_log_1)
          {
            v9 = os_log_create("com.apple.ButtonResolver", "default");
            _BRLog_log_1 = (uint64_t)v9;
          }
          v8 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
          if (v8)
          {
            -[BRInterfaceLegacy _setDefaultServicePropertiesOnService:].cold.1();
            LOBYTE(v8) = 0;
          }
          return v8;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(&unk_24D4A6878, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  LOBYTE(v8) = 1;
  return v8;
}

- (BOOL)setGlobalConfigs:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)setConfigs:(id)a3 withAssets:(id)a4 forStates:(id)a5 error:(id *)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v16;

  v16 = 0;
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(a2), CFSTR("start")));
  if (objc_msgSend(a5, "count"))
  {
    v11 = 0;
    while (1)
    {
      if (a3)
        v12 = objc_msgSend(a3, "objectAtIndexedSubscript:", v11);
      else
        v12 = 0;
      v13 = objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v11), "unsignedIntegerValue");
      if (v12 == objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
        v12 = 0;
      if (!-[BRInterfaceLegacy tapOnly](self, "tapOnly")
        || +[BRInterfaceLegacy _isTapState:](BRInterfaceLegacy, "_isTapState:", v13))
      {
        -[BRInterfaceLegacy _setConfig:forState:error:](self, "_setConfig:forState:error:", v12, v13, &v16);
        v14 = v16;
        if (v16)
          break;
      }
      if (++v11 >= (unint64_t)objc_msgSend(a5, "count"))
      {
        v14 = v16;
        break;
      }
    }
    if (a6 && v14)
      *a6 = v14;
  }
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(a2), CFSTR("end")));
  return v16 == 0;
}

- (BOOL)enableStates:(id)a3 error:(id *)a4
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  uint64_t v15;
  id *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(a2), CFSTR("start")));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v16 = a4;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(a3);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((!-[BRInterfaceLegacy tapOnly](self, "tapOnly")
           || +[BRInterfaceLegacy _isTapState:](BRInterfaceLegacy, "_isTapState:", objc_msgSend(v12, "unsignedIntegerValue")))&& !-[BRInterfaceLegacy _enableState:](self, "_enableState:", objc_msgSend(v12, "unsignedIntegerValue")))
        {
          v15 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -536870212, 0);
          v13 = v15 != 0;
          if (v16 && v15)
          {
            *v16 = (id)v15;
            v13 = 1;
          }
          goto LABEL_12;
        }
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_12:
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(a2), CFSTR("end")));
  return !v13;
}

- (BOOL)disableStates:(id)a3 clearAsset:(BOOL)a4 error:(id *)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  BOOL v14;
  uint64_t v16;
  id *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(a2), CFSTR("start")));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v17 = a5;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(a3);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((!-[BRInterfaceLegacy tapOnly](self, "tapOnly")
           || +[BRInterfaceLegacy _isTapState:](BRInterfaceLegacy, "_isTapState:", objc_msgSend(v13, "unsignedIntegerValue")))&& !-[BRInterfaceLegacy _disableState:](self, "_disableState:", objc_msgSend(v13, "unsignedIntegerValue")))
        {
          v16 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -536870212, 0);
          v14 = v16 != 0;
          if (v17 && v16)
          {
            *v17 = (id)v16;
            v14 = 1;
          }
          goto LABEL_12;
        }
      }
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_12:
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(a2), CFSTR("end")));
  return !v14;
}

- (void)scheduleReadyNotificationWithBlock:(id)a3
{
  OS_dispatch_queue *v5;
  _QWORD v6[6];

  v5 = -[BRInterface queue](self, "queue");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__BRInterfaceLegacy_scheduleReadyNotificationWithBlock___block_invoke;
  v6[3] = &unk_24D4A3E88;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync((dispatch_queue_t)v5, v6);
  -[BRInterfaceLegacy _findServices](self, "_findServices");
}

uint64_t __56__BRInterfaceLegacy_scheduleReadyNotificationWithBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "copy");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = result;
  return result;
}

- (BOOL)_setConfig:(id)a3 forState:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  char isKindOfClass;
  BOOL v10;
  uint64_t v11;
  const __CFString *v12;
  objc_class *v13;
  uint64_t v14;
  void *v16;

  v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MaxTime"));
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = 0;
  if ((isKindOfClass & 1) == 0)
    v8 = 0;
  switch(a4)
  {
    case 0uLL:
      v11 = *MEMORY[0x24BDBD270];
      v12 = CFSTR("PressCountTrackingEnabled");
      goto LABEL_12;
    case 2uLL:
      if (!v8)
        goto LABEL_13;
      if (!-[BRInterfaceLegacy _servicesSetProperty:forKey:](self, "_servicesSetProperty:forKey:", v8, CFSTR("PressCountDoublePressTimeout")))goto LABEL_25;
      v13 = (objc_class *)objc_msgSend(v8, "unsignedIntegerValue");
      v10 = 0;
      v14 = 80;
      goto LABEL_23;
    case 4uLL:
      if (!v8)
        goto LABEL_13;
      if (!-[BRInterfaceLegacy _servicesSetProperty:forKey:](self, "_servicesSetProperty:forKey:", v8, CFSTR("PressCountTriplePressTimeout")))goto LABEL_25;
      v13 = (objc_class *)objc_msgSend(v8, "unsignedIntegerValue");
      v10 = 0;
      v14 = 88;
      goto LABEL_23;
    case 6uLL:
      v11 = *MEMORY[0x24BDBD270];
      v12 = CFSTR("TapTrackingEnabled");
LABEL_12:
      if (-[BRInterfaceLegacy _servicesSetProperty:forKey:](self, "_servicesSetProperty:forKey:", v11, v12))
        goto LABEL_13;
      goto LABEL_25;
    case 8uLL:
      if (!v8)
        goto LABEL_13;
      if (!-[BRInterfaceLegacy _servicesSetProperty:forKey:](self, "_servicesSetProperty:forKey:", v8, CFSTR("DoubleTapTimeout")))goto LABEL_25;
      v13 = (objc_class *)objc_msgSend(v8, "unsignedIntegerValue");
      v10 = 0;
      v14 = 96;
      goto LABEL_23;
    case 0xAuLL:
      if (!v8)
        goto LABEL_13;
      if (!-[BRInterfaceLegacy _servicesSetProperty:forKey:](self, "_servicesSetProperty:forKey:", v8, CFSTR("TripleTapTimeout")))goto LABEL_25;
      v13 = (objc_class *)objc_msgSend(v8, "unsignedIntegerValue");
      v10 = 0;
      v14 = 104;
      goto LABEL_23;
    case 0xEuLL:
      if (v8)
      {
        if (-[BRInterfaceLegacy _servicesSetProperty:forKey:](self, "_servicesSetProperty:forKey:", v8, CFSTR("LongPressTimeout")))
        {
          v13 = (objc_class *)objc_msgSend(v8, "unsignedIntegerValue");
          v10 = 0;
          v14 = 112;
LABEL_23:
          *(Class *)((char *)&self->super.super.isa + v14) = v13;
        }
        else
        {
LABEL_25:
          v16 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -536870199, 0);
          v10 = v16 != 0;
          if (a5 && v16)
          {
            *a5 = v16;
            v10 = 1;
          }
        }
      }
      else
      {
LABEL_13:
        v10 = 0;
      }
      return !v10;
    default:
      return !v10;
  }
}

- (BOOL)_enableState:(unint64_t)a3
{
  uint64_t v4;
  const __CFString *v5;
  BOOL result;

  switch(a3)
  {
    case 0uLL:
      v4 = *MEMORY[0x24BDBD270];
      v5 = CFSTR("PressCountTrackingEnabled");
      goto LABEL_14;
    case 2uLL:
      if (!self->_doublePressTimeoutUs)
        goto LABEL_15;
      v4 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
      v5 = CFSTR("PressCountDoublePressTimeout");
      goto LABEL_14;
    case 4uLL:
      if (!self->_triplePressTimeoutUs)
        goto LABEL_15;
      v4 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
      v5 = CFSTR("PressCountTriplePressTimeout");
      goto LABEL_14;
    case 6uLL:
      v4 = *MEMORY[0x24BDBD270];
      v5 = CFSTR("TapTrackingEnabled");
      goto LABEL_14;
    case 8uLL:
      if (!self->_doubleTapTimeoutUs)
        goto LABEL_15;
      v4 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
      v5 = CFSTR("DoubleTapTimeout");
      goto LABEL_14;
    case 0xAuLL:
      if (!self->_tripleTapTimeoutUs)
        goto LABEL_15;
      v4 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
      v5 = CFSTR("TripleTapTimeout");
      goto LABEL_14;
    case 0xEuLL:
      if (!self->_longPressTimeoutUs)
        goto LABEL_15;
      v4 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
      v5 = CFSTR("LongPressTimeout");
LABEL_14:
      result = -[BRInterfaceLegacy _servicesSetProperty:forKey:](self, "_servicesSetProperty:forKey:", v4, v5);
      break;
    default:
LABEL_15:
      result = 1;
      break;
  }
  return result;
}

- (BOOL)_disableState:(unint64_t)a3
{
  void *v3;
  const __CFString *v4;
  BOOL result;

  switch(a3)
  {
    case 0uLL:
      v3 = (void *)*MEMORY[0x24BDBD268];
      v4 = CFSTR("PressCountTrackingEnabled");
      goto LABEL_3;
    case 2uLL:
      v3 = &unk_24D4A5EE0;
      v4 = CFSTR("PressCountDoublePressTimeout");
      goto LABEL_3;
    case 4uLL:
      v3 = &unk_24D4A5EE0;
      v4 = CFSTR("PressCountTriplePressTimeout");
      goto LABEL_3;
    case 6uLL:
      v3 = (void *)*MEMORY[0x24BDBD268];
      v4 = CFSTR("TapTrackingEnabled");
      goto LABEL_3;
    case 8uLL:
      v3 = &unk_24D4A5EE0;
      v4 = CFSTR("DoubleTapTimeout");
      goto LABEL_3;
    case 0xAuLL:
      v3 = &unk_24D4A5EE0;
      v4 = CFSTR("TripleTapTimeout");
      goto LABEL_3;
    case 0xEuLL:
      v3 = &unk_24D4A5EE0;
      v4 = CFSTR("LongPressTimeout");
LABEL_3:
      result = -[BRInterfaceLegacy _servicesSetProperty:forKey:](self, "_servicesSetProperty:forKey:", v3, v4);
      break;
    default:
      result = 1;
      break;
  }
  return result;
}

+ (BOOL)_isTapState:(unint64_t)a3
{
  return a3 - 6 < 6;
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (unint64_t)maxAssetSlots
{
  return self->_maxAssetSlots;
}

- (unint64_t)unusedAssetSlots
{
  return self->_unusedAssetSlots;
}

- (BOOL)tapOnly
{
  return self->_tapOnly;
}

- (void)setTapOnly:(BOOL)a3
{
  self->_tapOnly = a3;
}

- (void)init
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[BRInterfaceLegacy init]";
  OUTLINED_FUNCTION_5(&dword_215E56000, a1, a3, "%s failed!", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)propertyList
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_215E56000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)serviceAddedHandler:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_215E56000, log, OS_LOG_TYPE_ERROR, "Unexpected error: block is nil!", v1, 2u);
}

- (void)serviceRemovedHandler:(__IOHIDServiceClient *)a1 .cold.1(__IOHIDServiceClient *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  CFTypeRef RegistryID;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 138412290;
  RegistryID = IOHIDServiceClientGetRegistryID(a1);
  OUTLINED_FUNCTION_5(&dword_215E56000, a2, v3, "No service removed for %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_4();
}

- (void)serviceRemovedHandler:(__IOHIDServiceClient *)a1 .cold.2(__IOHIDServiceClient *a1, NSObject *a2)
{
  int v3;
  CFTypeRef RegistryID;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  RegistryID = IOHIDServiceClientGetRegistryID(a1);
  _os_log_debug_impl(&dword_215E56000, a2, OS_LOG_TYPE_DEBUG, "service removed: %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_4();
}

- (void)_servicesSetProperty:forKey:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  v4 = v0;
  v5 = v1;
  _os_log_debug_impl(&dword_215E56000, v2, OS_LOG_TYPE_DEBUG, "%s property: %@ key: %@", (uint8_t *)v3, 0x20u);
}

void __49__BRInterfaceLegacy__servicesSetProperty_forKey___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_215E56000, v0, v1, "%s error setting property on service %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_setDefaultServicePropertiesOnService:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_215E56000, v0, v1, "%s error setting default property on service %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
