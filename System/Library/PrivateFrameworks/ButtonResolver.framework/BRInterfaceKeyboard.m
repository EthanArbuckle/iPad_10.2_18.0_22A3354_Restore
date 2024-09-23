@implementation BRInterfaceKeyboard

- (BRInterfaceKeyboard)init
{
  BRInterfaceKeyboard *v2;
  BRInterfaceKeyboard *v3;
  uint64_t v4;
  NSMutableDictionary *v5;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BRInterfaceKeyboard;
  v2 = -[BRInterface init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_maxAssetSlots = -1;
    v2->_unusedAssetSlots = -1;
    v2->_isReady = 1;
    v2->_client = 0;
    v4 = objc_opt_new();
    v3->_services = (NSMutableSet *)v4;
    if (v4 && (v5 = (NSMutableDictionary *)objc_opt_new(), v3->_propertyCache = v5, v3->_services))
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", &unk_24D4A6890, CFSTR("PressCountUsagePairs"));
      v3->_doublePressTimeoutUs = 0;
      v3->_triplePressTimeoutUs = 0;
      v3->_longPressTimeoutUs = 0;
    }
    else
    {
      v7 = _BRLog_log_2;
      if (!_BRLog_log_2)
      {
        v7 = os_log_create("com.apple.ButtonResolver", "default");
        _BRLog_log_2 = (uint64_t)v7;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[BRInterfaceKeyboard init].cold.1(v7, v8, v9);

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
  v4.super_class = (Class)BRInterfaceKeyboard;
  -[BRInterface dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRInterfaceKeyboard;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", -[BRInterface description](&v5, sel_description));
  objc_msgSend(v3, "appendFormat:", CFSTR("Services: %@;\n"), self->_services);
  objc_msgSend(v3, "appendFormat:", CFSTR("DoublePressTO: %lu;\n"), self->_doublePressTimeoutUs);
  objc_msgSend(v3, "appendFormat:", CFSTR("TriplePressTO: %lu;\n"), self->_triplePressTimeoutUs);
  objc_msgSend(v3, "appendFormat:", CFSTR("LongPressTO: %lu;\n"), self->_longPressTimeoutUs);
  return v3;
}

- (id)propertyList
{
  void *v3;
  NSObject *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BRInterfaceKeyboard;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", -[BRInterface propertyList](&v6, sel_propertyList));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_doublePressTimeoutUs), CFSTR("DoublePressTO"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_triplePressTimeoutUs), CFSTR("TriplePressTO"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_longPressTimeoutUs), CFSTR("LongPressTO"));
  v4 = _BRLog_log_2;
  if (!_BRLog_log_2)
  {
    v4 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_2 = (uint64_t)v4;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[BRInterfaceKeyboard propertyList].cold.1();
  return v3;
}

+ (id)interface
{
  return objc_alloc_init(BRInterfaceKeyboard);
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
  uint64_t v14;
  void *v15;
  void *v17;

  v17 = 0;
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(a2), CFSTR("start")));
  if (objc_msgSend(a5, "count"))
  {
    v11 = 0;
    while (1)
    {
      v12 = a3 ? objc_msgSend(a3, "objectAtIndexedSubscript:", v11) : 0;
      v13 = objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v11), "unsignedIntegerValue");
      v14 = v12 == objc_msgSend(MEMORY[0x24BDBCEF8], "null") ? 0 : v12;
      -[BRInterfaceKeyboard _setConfig:forState:error:](self, "_setConfig:forState:error:", v14, v13, &v17);
      v15 = v17;
      if (v17)
        break;
      if (++v11 >= (unint64_t)objc_msgSend(a5, "count"))
      {
        v15 = v17;
        break;
      }
    }
    if (a6 && v15)
      *a6 = v15;
  }
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(a2), CFSTR("end")));
  return v17 == 0;
}

- (BOOL)enableStates:(id)a3 error:(id *)a4
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(a2), CFSTR("start")));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(a3);
        if (!-[BRInterfaceKeyboard _enableState:](self, "_enableState:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "unsignedIntegerValue")))
        {
          v14 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -536870212, 0);
          v12 = v14 != 0;
          if (a4 && v14)
          {
            *a4 = v14;
            v12 = 1;
          }
          goto LABEL_10;
        }
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_10:
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(a2), CFSTR("end")));
  return !v12;
}

- (BOOL)disableStates:(id)a3 clearAsset:(BOOL)a4 error:(id *)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(a2), CFSTR("start")));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(a3);
        if (!-[BRInterfaceKeyboard _disableState:](self, "_disableState:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "unsignedIntegerValue")))
        {
          v15 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -536870212, 0);
          v13 = v15 != 0;
          if (a5 && v15)
          {
            *a5 = v15;
            v13 = 1;
          }
          goto LABEL_10;
        }
      }
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_10:
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(a2), CFSTR("end")));
  return !v13;
}

- (void)scheduleReadyNotificationWithBlock:(id)a3
{
  -[BRInterfaceKeyboard _findServices](self, "_findServices");
  dispatch_async((dispatch_queue_t)-[BRInterface queue](self, "queue"), a3);
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
    IOHIDEventSystemClientSetMatching();
    v4 = -[BRInterface queue](self, "queue");
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__BRInterfaceKeyboard__findServices__block_invoke;
    block[3] = &unk_24D4A3E38;
    block[4] = self;
    dispatch_async((dispatch_queue_t)v4, block);
  }
}

void __36__BRInterfaceKeyboard__findServices__block_invoke(uint64_t a1)
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
  v2 = IOHIDEventSystemClientCopyServices(*(IOHIDEventSystemClientRef *)(*(_QWORD *)(a1 + 32) + 48));
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
          LODWORD(v4) = serviceAddedCallback_0(v4, *(void **)(a1 + 32), *(IOHIDServiceClientRef *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v4 = -[__CFArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        v5 = v4;
      }
      while (v4);
    }
  }

}

- (BOOL)_setConfig:(id)a3 forState:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  char isKindOfClass;
  BOOL v10;
  objc_class *v11;
  uint64_t v12;
  void *v14;

  v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MaxTime"));
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = 0;
  if ((isKindOfClass & 1) == 0)
    v8 = 0;
  switch(__ROR8__(a4, 1))
  {
    case 0:
      if (-[BRInterfaceKeyboard _servicesSetProperty:forKey:](self, "_servicesSetProperty:forKey:", *MEMORY[0x24BDBD270], CFSTR("PressCountTrackingEnabled")))
      {
        goto LABEL_16;
      }
      goto LABEL_18;
    case 1:
      if (!v8)
        goto LABEL_16;
      if (!-[BRInterfaceKeyboard _servicesSetProperty:forKey:](self, "_servicesSetProperty:forKey:", v8, CFSTR("PressCountDoublePressTimeout")))goto LABEL_18;
      v11 = (objc_class *)objc_msgSend(v8, "unsignedIntegerValue");
      v10 = 0;
      v12 = 64;
      goto LABEL_15;
    case 2:
      if (!v8)
        goto LABEL_16;
      if (!-[BRInterfaceKeyboard _servicesSetProperty:forKey:](self, "_servicesSetProperty:forKey:", v8, CFSTR("PressCountTriplePressTimeout")))goto LABEL_18;
      v11 = (objc_class *)objc_msgSend(v8, "unsignedIntegerValue");
      v10 = 0;
      v12 = 72;
      goto LABEL_15;
    case 7:
      if (v8)
      {
        if (-[BRInterfaceKeyboard _servicesSetProperty:forKey:](self, "_servicesSetProperty:forKey:", v8, CFSTR("LongPressTimeout")))
        {
          v11 = (objc_class *)objc_msgSend(v8, "unsignedIntegerValue");
          v10 = 0;
          v12 = 80;
LABEL_15:
          *(Class *)((char *)&self->super.super.isa + v12) = v11;
        }
        else
        {
LABEL_18:
          v14 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -536870199, 0);
          v10 = v14 != 0;
          if (a5 && v14)
          {
            *a5 = v14;
            v10 = 1;
          }
        }
      }
      else
      {
LABEL_16:
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

  switch(__ROR8__(a3, 1))
  {
    case 0:
      v4 = *MEMORY[0x24BDBD270];
      v5 = CFSTR("PressCountTrackingEnabled");
      goto LABEL_9;
    case 1:
      if (!self->_doublePressTimeoutUs)
        goto LABEL_10;
      v4 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
      v5 = CFSTR("PressCountDoublePressTimeout");
      goto LABEL_9;
    case 2:
      if (!self->_triplePressTimeoutUs)
        goto LABEL_10;
      v4 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
      v5 = CFSTR("PressCountTriplePressTimeout");
      goto LABEL_9;
    case 7:
      if (!self->_longPressTimeoutUs)
        goto LABEL_10;
      v4 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
      v5 = CFSTR("LongPressTimeout");
LABEL_9:
      result = -[BRInterfaceKeyboard _servicesSetProperty:forKey:](self, "_servicesSetProperty:forKey:", v4, v5);
      break;
    default:
LABEL_10:
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

  switch(__ROR8__(a3, 1))
  {
    case 0:
      v3 = (void *)*MEMORY[0x24BDBD268];
      v4 = CFSTR("PressCountTrackingEnabled");
      goto LABEL_3;
    case 1:
      v3 = &unk_24D4A5F58;
      v4 = CFSTR("PressCountDoublePressTimeout");
      goto LABEL_3;
    case 2:
      v3 = &unk_24D4A5F58;
      v4 = CFSTR("PressCountTriplePressTimeout");
      goto LABEL_3;
    case 7:
      v3 = &unk_24D4A5F58;
      v4 = CFSTR("LongPressTimeout");
LABEL_3:
      result = -[BRInterfaceKeyboard _servicesSetProperty:forKey:](self, "_servicesSetProperty:forKey:", v3, v4);
      break;
    default:
      result = 1;
      break;
  }
  return result;
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
  v7 = _BRLog_log_2;
  if (!_BRLog_log_2)
  {
    v7 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_2 = (uint64_t)v7;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BRInterfaceKeyboard _servicesSetProperty:forKey:].cold.1();
  v8 = -[BRInterface queue](self, "queue");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__BRInterfaceKeyboard__servicesSetProperty_forKey___block_invoke;
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

uint64_t __51__BRInterfaceKeyboard__servicesSetProperty_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  NSObject *v7;
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
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = IOHIDServiceClientSetProperty(*(IOHIDServiceClientRef *)(*((_QWORD *)&v9 + 1)+ 8 * i), *(CFStringRef *)(a1 + 48), *(CFTypeRef *)(a1 + 56));
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        {
          v7 = _BRLog_log_2;
          if (!_BRLog_log_2)
          {
            v7 = os_log_create("com.apple.ButtonResolver", "default");
            _BRLog_log_2 = (uint64_t)v7;
          }
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            __51__BRInterfaceKeyboard__servicesSetProperty_forKey___block_invoke_cold_1();
          return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (BOOL)_setCachedPropertiesOnService:(__IOHIDServiceClient *)a3
{
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  const __CFString *v10;
  const void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  __int128 v16;
  NSMutableDictionary *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const void *v25;
  __int16 v26;
  const __CFString *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_propertyCache;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v19;
    *(_QWORD *)&v6 = 136315650;
    v16 = v6;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(const __CFString **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v11 = (const void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_propertyCache, "objectForKeyedSubscript:", v10, v16);
        v12 = _BRLog_log_2;
        if (!_BRLog_log_2)
        {
          v12 = os_log_create("com.apple.ButtonResolver", "default");
          _BRLog_log_2 = (uint64_t)v12;
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v16;
          v23 = "-[BRInterfaceKeyboard _setCachedPropertiesOnService:]";
          v24 = 2112;
          v25 = v11;
          v26 = 2112;
          v27 = v10;
          _os_log_debug_impl(&dword_215E56000, v12, OS_LOG_TYPE_DEBUG, "%s property: %@ key: %@", buf, 0x20u);
        }
        if (!IOHIDServiceClientSetProperty(a3, v10, v11))
        {
          v14 = _BRLog_log_2;
          if (!_BRLog_log_2)
          {
            v14 = os_log_create("com.apple.ButtonResolver", "default");
            _BRLog_log_2 = (uint64_t)v14;
          }
          v13 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
          if (v13)
          {
            -[BRInterfaceKeyboard _setCachedPropertiesOnService:].cold.1();
            LOBYTE(v13) = 0;
          }
          return v13;
        }
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
      if (v7)
        continue;
      break;
    }
  }
  LOBYTE(v13) = 1;
  return v13;
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

- (NSMutableSet)services
{
  return self->_services;
}

- (void)init
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[BRInterfaceKeyboard init]";
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

void __51__BRInterfaceKeyboard__servicesSetProperty_forKey___block_invoke_cold_1()
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

- (void)_setCachedPropertiesOnService:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_215E56000, v0, v1, "%s error setting cached property on service %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
