@implementation CMIOExtensionDiscoverySession

uint64_t __47__CMIOExtensionDiscoverySession_initWithQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUpRegistration");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_6);
  return (id)_discoverySession;
}

- (NSArray)devices
{
  NSObject *queue;
  NSArray *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__CMIOExtensionDiscoverySession_devices__block_invoke;
  v6[3] = &unk_250458470;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(queue, v6);
  v4 = (NSArray *)(id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __47__CMIOExtensionDiscoverySession_sharedInstance__block_invoke()
{
  CMIOExtensionDiscoverySession *v0;
  NSObject *v1;
  uint64_t result;

  v0 = [CMIOExtensionDiscoverySession alloc];
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = -[CMIOExtensionDiscoverySession initWithQueue:](v0, "initWithQueue:", dispatch_queue_create("com.apple.coremediaio.extension.discoverysession", v1));
  _discoverySession = result;
  return result;
}

- (CMIOExtensionDiscoverySession)initWithQueue:(id)a3
{
  CMIOExtensionDiscoverySession *v4;
  CMIOExtensionDiscoverySession *v5;
  NSObject *queue;
  _QWORD block[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CMIOExtensionDiscoverySession;
  v4 = -[CMIOExtensionDiscoverySession init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_queue = (OS_dispatch_queue *)a3;
    v4->_providersByBundleIdentifier = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v5->_extensionEventPublisher = (OS_xpc_event_publisher *)xpc_event_publisher_create();
    queue = v5->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__CMIOExtensionDiscoverySession_initWithQueue___block_invoke;
    block[3] = &unk_2504576D0;
    block[4] = v5;
    dispatch_async(queue, block);
  }
  return v5;
}

- (void)setUpRegistration
{
  xpc_event_publisher_set_handler();
  xpc_event_publisher_set_error_handler();
  xpc_event_publisher_activate();
}

uint64_t __40__CMIOExtensionDiscoverySession_devices__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allValues", 0);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if (objc_msgSend((id)objc_msgSend(v7, "devices"), "count"))
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObjectsFromArray:", objc_msgSend(v7, "devices"));
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_queue);

  v3.receiver = self;
  v3.super_class = (Class)CMIOExtensionDiscoverySession;
  -[CMIOExtensionDiscoverySession dealloc](&v3, sel_dealloc);
}

- (void)postDeviceChangeNotification
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_7);
}

uint64_t __61__CMIOExtensionDiscoverySession_postDeviceChangeNotification__block_invoke()
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("CMIOExtensionDevicesChangedNotification"), 0);
}

- (void)_invalidateProvider:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  if (a3)
  {
    v4 = objc_msgSend(a3, "bundleID");
    if (v4)
    {
      v5 = v4;
      dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
      -[NSMutableDictionary removeObjectForKey:](self->_providersByBundleIdentifier, "removeObjectForKey:", v5);
      -[CMIOExtensionDiscoverySession postDeviceChangeNotification](self, "postDeviceChangeNotification");
    }
  }
}

- (id)copyProviderBundleID
{
  return CFSTR("NA");
}

- (void)provider:(id)a3 didFailWithError:(id)a4
{
  NSObject *v7;
  NSObject *v8;
  NSObject *queue;
  _QWORD v10[6];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = CMIOLog();
  if (v7)
  {
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
      v13 = 1024;
      v14 = 117;
      v15 = 2080;
      v16 = "-[CMIOExtensionDiscoverySession provider:didFailWithError:]";
      v17 = 2080;
      v18 = "-[CMIOExtensionDiscoverySession provider:didFailWithError:]";
      v19 = 2112;
      v20 = a3;
      v21 = 2112;
      v22 = a4;
      _os_log_impl(&dword_2330C2000, v8, OS_LOG_TYPE_DEFAULT, "%s:%d:%s  %s %@ %@", buf, 0x3Au);
    }
  }
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__CMIOExtensionDiscoverySession_provider_didFailWithError___block_invoke;
  v10[3] = &unk_2504577C0;
  v10[4] = self;
  v10[5] = a3;
  dispatch_async(queue, v10);
}

uint64_t __59__CMIOExtensionDiscoverySession_provider_didFailWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateProvider:", *(_QWORD *)(a1 + 40));
}

- (void)providerHasBeenInvalidated:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *queue;
  _QWORD v8[6];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = CMIOLog();
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
      v11 = 1024;
      v12 = 125;
      v13 = 2080;
      v14 = "-[CMIOExtensionDiscoverySession providerHasBeenInvalidated:]";
      v15 = 2080;
      v16 = "-[CMIOExtensionDiscoverySession providerHasBeenInvalidated:]";
      v17 = 2112;
      v18 = a3;
      _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s  %s %@", buf, 0x30u);
    }
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__CMIOExtensionDiscoverySession_providerHasBeenInvalidated___block_invoke;
  v8[3] = &unk_2504577C0;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async(queue, v8);
}

uint64_t __60__CMIOExtensionDiscoverySession_providerHasBeenInvalidated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateProvider:", *(_QWORD *)(a1 + 40));
}

- (void)provider:(id)a3 propertiesChanged:(id)a4
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = CMIOLog();
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136316162;
      v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
      v9 = 1024;
      v10 = 133;
      v11 = 2080;
      v12 = "-[CMIOExtensionDiscoverySession provider:propertiesChanged:]";
      v13 = 2080;
      v14 = "-[CMIOExtensionDiscoverySession provider:propertiesChanged:]";
      v15 = 2112;
      v16 = a4;
      _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s  %s %@", (uint8_t *)&v7, 0x30u);
    }
  }
}

- (void)provider:(id)a3 availableDevicesChanged:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = CMIOLog();
  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136316162;
      v9 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
      v10 = 1024;
      v11 = 139;
      v12 = 2080;
      v13 = "-[CMIOExtensionDiscoverySession provider:availableDevicesChanged:]";
      v14 = 2080;
      v15 = "-[CMIOExtensionDiscoverySession provider:availableDevicesChanged:]";
      v16 = 2112;
      v17 = a4;
      _os_log_impl(&dword_2330C2000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d:%s  %s %@", (uint8_t *)&v8, 0x30u);
    }
  }
  -[CMIOExtensionDiscoverySession postDeviceChangeNotification](self, "postDeviceChangeNotification");
}

- (void)completeRegistrationForBundleID:(id)a3 token:(unint64_t)a4
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  xpc_object_t v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = CMIOLog();
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
      v11 = 1024;
      v12 = 161;
      v13 = 2080;
      v14 = "-[CMIOExtensionDiscoverySession completeRegistrationForBundleID:token:]";
      v15 = 2114;
      v16 = a3;
      _os_log_impl(&dword_2330C2000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s Register for bundleID %{public}@", buf, 0x26u);
    }
  }
  v7 = a3;
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_event_publisher_fire_with_reply();
  xpc_release(v8);
}

void __71__CMIOExtensionDiscoverySession_completeRegistrationForBundleID_token___block_invoke(_QWORD *a1, xpc_object_t xdict)
{
  _xpc_endpoint_s *value;
  const uint8_t *uuid;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  _xpc_connection_s *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  xpc_object_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD v21[8];
  _QWORD handler[8];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  _xpc_endpoint_s *v32;
  __int16 v33;
  const uint8_t *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  value = (_xpc_endpoint_s *)xpc_dictionary_get_value(xdict, "endpoint");
  uuid = xpc_dictionary_get_uuid(xdict, "mach-o-uuid");
  v6 = CMIOLog();
  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
      v9 = a1[4];
      *(_DWORD *)buf = 136316418;
      v24 = v8;
      v25 = 1024;
      v26 = 168;
      v27 = 2080;
      v28 = "-[CMIOExtensionDiscoverySession completeRegistrationForBundleID:token:]_block_invoke";
      v29 = 2114;
      v30 = v9;
      v31 = 2048;
      v32 = value;
      v33 = 2048;
      v34 = uuid;
      _os_log_impl(&dword_2330C2000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d:%s Receive registration for bundleID %{public}@ endpoint %p uuidBytes %p", buf, 0x3Au);
    }
  }
  if (value && MEMORY[0x23492FDC4](value) == MEMORY[0x24BDACFB0])
  {
    v13 = xpc_connection_create_from_endpoint(value);
    xpc_connection_set_target_queue(v13, *(dispatch_queue_t *)(a1[5] + 16));
    v14 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __71__CMIOExtensionDiscoverySession_completeRegistrationForBundleID_token___block_invoke_15;
    handler[3] = &unk_2504584C0;
    v15 = a1[5];
    handler[4] = a1[4];
    handler[5] = v13;
    v16 = a1[6];
    handler[6] = v15;
    handler[7] = v16;
    xpc_connection_set_event_handler(v13, handler);
    xpc_connection_resume(v13);
    v17 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v17, "MessageType", 0x19uLL);
    v19 = a1[4];
    v18 = a1[5];
    v20 = *(NSObject **)(v18 + 16);
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __71__CMIOExtensionDiscoverySession_completeRegistrationForBundleID_token___block_invoke_2;
    v21[3] = &unk_2504584E8;
    v21[4] = v19;
    v21[5] = v13;
    v21[6] = value;
    v21[7] = v18;
    xpc_connection_send_message_with_reply(v13, v17, v20, v21);
    xpc_release(v17);
    xpc_release(v13);
  }
  else
  {
    v10 = CMIOLog();
    if (v10)
    {
      v11 = v10;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
        *(_DWORD *)buf = 136315650;
        v24 = v12;
        v25 = 1024;
        v26 = 170;
        v27 = 2080;
        v28 = "-[CMIOExtensionDiscoverySession completeRegistrationForBundleID:token:]_block_invoke";
        _os_log_impl(&dword_2330C2000, v11, OS_LOG_TYPE_DEFAULT, "%s:%d:%s returning early because a valid endpoint was not provided", buf, 0x1Cu);
      }
    }
  }
}

void __71__CMIOExtensionDiscoverySession_completeRegistrationForBundleID_token___block_invoke_15(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD block[7];

  if (MEMORY[0x23492FDC4](a2) == MEMORY[0x24BDACFB8])
  {
    v4 = CMIOLog();
    if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __71__CMIOExtensionDiscoverySession_completeRegistrationForBundleID_token___block_invoke_15_cold_1();
    if (a2 == MEMORY[0x24BDACF38])
    {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 48), "_invalidateProvider:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)));
    }
    else if (a2 == MEMORY[0x24BDACF30])
    {
      objc_msgSend(*(id *)(a1 + 48), "_invalidateProvider:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)));
      v5 = *(_QWORD *)(a1 + 48);
      v6 = *(_QWORD *)(a1 + 56);
      v7 = *(NSObject **)(v5 + 16);
      block[0] = MEMORY[0x24BDAC760];
      block[2] = __71__CMIOExtensionDiscoverySession_completeRegistrationForBundleID_token___block_invoke_16;
      block[3] = &unk_250458498;
      block[1] = 3221225472;
      v8 = *(_QWORD *)(a1 + 32);
      block[4] = v5;
      block[5] = v8;
      block[6] = v6;
      dispatch_async(v7, block);
    }
  }
}

uint64_t __71__CMIOExtensionDiscoverySession_completeRegistrationForBundleID_token___block_invoke_16(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeRegistrationForBundleID:token:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __71__CMIOExtensionDiscoverySession_completeRegistrationForBundleID_token___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  CMIOExtensionSessionProvider *v9;
  CMIOExtensionSessionProvider *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x23492FDC4](a2);
  if (v3 == MEMORY[0x24BDACFB8])
  {
    v11 = CMIOLog();
    if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __71__CMIOExtensionDiscoverySession_completeRegistrationForBundleID_token___block_invoke_2_cold_1();
  }
  else if (v3 == MEMORY[0x24BDACFA0])
  {
    v4 = CMIOLog();
    if (v4)
    {
      v5 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
        v7 = a1[4];
        v8 = a1[5];
        v12 = 136316162;
        v13 = v6;
        v14 = 1024;
        v15 = 206;
        v16 = 2080;
        v17 = "-[CMIOExtensionDiscoverySession completeRegistrationForBundleID:token:]_block_invoke";
        v18 = 2114;
        v19 = v7;
        v20 = 2048;
        v21 = v8;
        _os_log_impl(&dword_2330C2000, v5, OS_LOG_TYPE_DEFAULT, "%s:%d:%s Complete Registration for %{public}@ (%p) ", (uint8_t *)&v12, 0x30u);
      }
    }
    v9 = -[CMIOExtensionSessionProvider initWithEndpoint:delegate:]([CMIOExtensionSessionProvider alloc], "initWithEndpoint:delegate:", a1[6], a1[7]);
    if (v9)
    {
      v10 = v9;
      -[CMIOExtensionSessionProvider setBundleID:](v9, "setBundleID:", a1[4]);
      objc_msgSend(*(id *)(a1[7] + 24), "setObject:forKeyedSubscript:", v10, a1[4]);

    }
  }
}

void __50__CMIOExtensionDiscoverySession_setUpRegistration__block_invoke(uint64_t a1, int a2, uint64_t a3, xpc_object_t xdict)
{
  const char *string;
  NSObject *v7;
  id v8;

  if (!a2)
  {
    string = xpc_dictionary_get_string(xdict, "CMIOExtensionBundleIdentifier");
    if (string && *string)
    {
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", string, 4);
      objc_msgSend(*(id *)(a1 + 32), "completeRegistrationForBundleID:token:", v8, a3);

    }
    else
    {
      v7 = CMIOLog();
      if (v7)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          __50__CMIOExtensionDiscoverySession_setUpRegistration__block_invoke_cold_1();
      }
    }
  }
}

void __50__CMIOExtensionDiscoverySession_setUpRegistration__block_invoke_23()
{
  NSObject *v0;

  v0 = CMIOLog();
  if (v0)
  {
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      __50__CMIOExtensionDiscoverySession_setUpRegistration__block_invoke_23_cold_1();
  }
}

void __71__CMIOExtensionDiscoverySession_completeRegistrationForBundleID_token___block_invoke_15_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x3Au);
}

void __71__CMIOExtensionDiscoverySession_completeRegistrationForBundleID_token___block_invoke_2_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x30u);
}

void __50__CMIOExtensionDiscoverySession_setUpRegistration__block_invoke_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x1Cu);
  OUTLINED_FUNCTION_2();
}

void __50__CMIOExtensionDiscoverySession_setUpRegistration__block_invoke_23_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionDiscoverySession.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x22u);
  OUTLINED_FUNCTION_2();
}

@end
