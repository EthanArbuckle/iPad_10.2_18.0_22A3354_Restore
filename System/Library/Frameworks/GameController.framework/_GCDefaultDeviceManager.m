@implementation _GCDefaultDeviceManager

- (_GCDefaultDeviceManager)initWithIdentifier:(id)a3 matchingFilter:(id)a4 probeScore:(id)a5
{
  id v8;
  id v9;
  id v10;
  _GCDefaultDeviceManager *v11;
  uint64_t v12;
  NSObject *identifier;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  NSMutableSet *v20;
  NSMutableSet *claimedServices;
  NSMutableDictionary *v22;
  NSMutableDictionary *physicalDevices;
  NSMutableDictionary *v24;
  NSMutableDictionary *hiddenPhysicalDevices;
  void *v26;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)_GCDefaultDeviceManager;
  v11 = -[_GCDefaultDeviceManager init](&v28, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copyWithZone:", 0);
    identifier = v11->_identifier;
    v11->_identifier = v12;

    objc_storeStrong((id *)&v11->_probeScore, a5);
    objc_storeStrong((id *)&v11->_matchingFilter, a4);
    -[_GCDeviceMatchingFilter identifier](v11->_matchingFilter, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("_GCDefaultDeviceManager.%@)"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = objc_retainAutorelease(v15);
    v18 = dispatch_queue_create((const char *)objc_msgSend(v17, "cStringUsingEncoding:", 4), v16);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v18;

    v20 = (NSMutableSet *)objc_alloc_init((Class)&off_254DEBF30);
    claimedServices = v11->_claimedServices;
    v11->_claimedServices = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init((Class)&off_254DEBD30);
    physicalDevices = v11->_physicalDevices;
    v11->_physicalDevices = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init((Class)&off_254DEBD30);
    hiddenPhysicalDevices = v11->_hiddenPhysicalDevices;
    v11->_hiddenPhysicalDevices = v24;

    +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v11, sel_refreshPhysicalDeviceConfiguration_, CFSTR("GCRefreshPhysicalDeviceConfigurationNotification"), 0);

  }
  return v11;
}

- (id)makeDeviceWithConfiguration:(id)a3 dependencies:(id)a4
{
  id v7;
  id v8;
  _GCDefaultLogicalDevice *v9;
  void *v10;
  _GCFusedLogicalDevice *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  const char *v32;
  _GCDefaultDeviceManager *v33;
  id v34;
  id obj;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "count") == 1)
  {
    v9 = [_GCDefaultLogicalDevice alloc];
    objc_msgSend(v8, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_GCDefaultLogicalDevice initWithPhysicalDevice:configuration:manager:](v9, "initWithPhysicalDevice:configuration:manager:", v10, v7, self);

    -[_GCDefaultDeviceManager delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v12, "deviceManager:prepareLogicalDevice:", self, v11);

    goto LABEL_25;
  }
  if (objc_msgSend(v8, "count") != 2)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDefaultDeviceManager.m"), 124, CFSTR("Bad configuration: %@"), v7);

    v11 = 0;
    goto LABEL_25;
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (!v14)
  {

    v16 = 0;
    goto LABEL_27;
  }
  v15 = v14;
  v32 = a2;
  v33 = self;
  v34 = v8;
  obj = v13;
  v16 = 0;
  v17 = 0;
  v36 = *(_QWORD *)v38;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v38 != v36)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
      objc_msgSend(v19, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deviceDependencies");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = v7;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v20, "isEqual:", v23);

      v7 = v22;
      v25 = v19;
      if (v24)
        v26 = v17;
      else
        v26 = v16;
      if (v24)
        v17 = v25;
      else
        v16 = v25;

    }
    v13 = obj;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  }
  while (v15);

  self = v33;
  v8 = v34;
  a2 = v32;
  if (!v17)
  {
LABEL_27:
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDefaultDeviceManager.m"), 111, CFSTR("Dependencies did not contain primary device. %@"), v13);

    v17 = 0;
    if (v16)
      goto LABEL_21;
LABEL_28:
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDefaultDeviceManager.m"), 112, CFSTR("Dependencies did not contain secondary device. %@"), v13);

    goto LABEL_21;
  }
  if (!v16)
    goto LABEL_28;
LABEL_21:
  v11 = -[_GCFusedLogicalDevice initWithPrimaryPhysicalDevice:secondaryPhysicalDevice:configuration:manager:]([_GCFusedLogicalDevice alloc], "initWithPrimaryPhysicalDevice:secondaryPhysicalDevice:configuration:manager:", v17, v16, v7, self);
  -[_GCDefaultDeviceManager delegate](self, "delegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v27, "deviceManager:prepareLogicalDevice:", self, v11);

LABEL_25:
  return v11;
}

- (id)configurationIdentifierForDevice:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc((Class)&off_254DEDEA8);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("LOGICAL_DEVICE(%@)"), v5);
  return v6;
}

- (void)_onqueue_registerDefaultConfigurationForDevice:(id)a3 replaceExisting:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v4 = a4;
  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[_GCDefaultDeviceManager configurationIdentifierForDevice:](self, "configurationIdentifierForDevice:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCDefaultDeviceManager identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DF640C(&off_254DF6B98, "configurationWithIdentifier:priority:deviceIdentifier:deviceDependencies:deviceBuilder:", v7, 10, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v6) = objc_opt_isKindOfClass();

  if ((v6 & 1) != 0)
    objc_msgSend(v11, "setTransient:", 1);
  -[_GCDefaultDeviceManager deviceRegistry](self, "deviceRegistry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deviceConfigurationRegistry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addConfiguration:replaceExisting:", v11, v4);

}

- (void)refreshPhysicalDeviceConfiguration:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *queue;
  _QWORD v8[4];
  id v9;
  _GCDefaultDeviceManager *v10;
  id v11;
  id location;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_254DCA530);

  if (v6)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __62___GCDefaultDeviceManager_refreshPhysicalDeviceConfiguration___block_invoke;
    v8[3] = &unk_24D2B3DE0;
    objc_copyWeak(&v11, &location);
    v9 = v4;
    v10 = self;
    dispatch_async(queue, v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

- (id)matchHIDService:(id)a3
{
  int v4;
  NSNumber **p_probeScore;

  v4 = -[_GCDeviceMatchingFilter match:](self->_matchingFilter, "match:", a3);
  p_probeScore = &self->_probeScore;
  if (!v4)
    p_probeScore = (NSNumber **)MEMORY[0x24BE3A6A0];
  return *p_probeScore;
}

- (void)_onqueue_checkAndHideDuplicateDevice:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v18 = a3;
  objc_msgSend(v18, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMutableDictionary allKeys](self->_physicalDevices, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_physicalDevices, "objectForKeyedSubscript:", v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqual:", v4);

      if ((v13 & 1) != 0)
        break;

      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v10;

    if (!v11)
      goto LABEL_14;
    v15 = v18;
    if (v11 == v18)
    {
      v11 = v18;
    }
    else
    {
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v4;
          _os_log_impl(&dword_215181000, v17, OS_LOG_TYPE_INFO, "Identifier '%@' is already registered with this device manager. Possible duplicate identifier? Relinquishing old device, then claiming incoming device.", buf, 0xCu);
        }

      }
      -[_GCDefaultDeviceManager _onqueue_relinquishHIDDevice:](self, "_onqueue_relinquishHIDDevice:", v14);
      -[NSMutableDictionary setObject:forKey:](self->_hiddenPhysicalDevices, "setObject:forKey:", v11, v14);
    }
  }
  else
  {
LABEL_9:

    v14 = 0;
LABEL_14:
    v15 = v18;
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[_GCDefaultDeviceManager _onqueue_checkAndHideDuplicateDevice:].cold.1(v16);

    }
    v11 = 0;
  }

}

- (void)claimHIDService:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  unint64_t v8;
  NSObject *queue;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  id v15;
  SEL v16;
  os_activity_scope_state_s state;

  v5 = a3;
  v6 = _os_activity_create(&dword_215181000, "[Default Device Manager] Claim HID Service", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[_GCDefaultDeviceManager claimHIDService:].cold.1();

  }
  -[_GCDefaultDeviceManager matchHIDService:](self, "matchHIDService:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BE3A6A0];

  if ((unint64_t)v7 <= v8)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDefaultDeviceManager.m"), 214, CFSTR("%@ does not match against %@ but is trying to claim it"), self, v5);

  }
  if (-[NSMutableSet containsObject:](self->_claimedServices, "containsObject:", v5))
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDefaultDeviceManager.m"), 215, CFSTR("%@ has already claimed %@"), self, v5);

  }
  -[NSMutableSet addObject:](self->_claimedServices, "addObject:", v5);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43___GCDefaultDeviceManager_claimHIDService___block_invoke;
  block[3] = &unk_24D2B3D48;
  block[4] = self;
  v15 = v5;
  v16 = a2;
  v10 = v5;
  dispatch_async(queue, block);

  os_activity_scope_leave(&state);
}

- (void)_onqueue_registerPhysicalDevice:(id)a3 serviceInfo:(id)a4 checkForDuplicateDevice:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  _GCDefaultDeviceManager *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v5 = a5;
  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (v5)
    -[_GCDefaultDeviceManager _onqueue_checkAndHideDuplicateDevice:](self, "_onqueue_checkAndHideDuplicateDevice:", v8);
  if (v8)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = 138412546;
        v14 = self;
        v15 = 2112;
        v16 = v8;
        _os_log_impl(&dword_215181000, v12, OS_LOG_TYPE_INFO, "%@: Adding %@", (uint8_t *)&v13, 0x16u);
      }

    }
    -[NSMutableDictionary setObject:forKey:](self->_physicalDevices, "setObject:forKey:", v8, v9);
    -[_GCDefaultDeviceManager _onqueue_registerDefaultConfigurationForDevice:replaceExisting:](self, "_onqueue_registerDefaultConfigurationForDevice:replaceExisting:", v8, 1);
    -[_GCDefaultDeviceManager delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "deviceManager:willPublishPhysicalDevice:", self, v8);
    -[_GCDefaultDeviceManager deviceRegistry](self, "deviceRegistry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deviceManager:deviceDidConnect:", self, v8);

  }
}

- (void)_onqueue_relinquishHIDDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *hiddenPhysicalDevices;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  _GCDefaultDeviceManager *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKey:](self->_physicalDevices, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[_GCDefaultDeviceManager _onqueue_relinquishHIDDevice:].cold.2();

    }
    -[_GCDefaultDeviceManager deviceRegistry](self, "deviceRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceManager:deviceDidDisconnect:", self, v5);

    -[NSMutableDictionary removeObjectForKey:](self->_physicalDevices, "removeObjectForKey:", v4);
  }
  -[NSMutableDictionary objectForKey:](self->_hiddenPhysicalDevices, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[_GCDefaultDeviceManager _onqueue_relinquishHIDDevice:].cold.1();

    }
    -[NSMutableDictionary removeObjectForKey:](self->_hiddenPhysicalDevices, "removeObjectForKey:", v4);
  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__1;
  v32 = __Block_byref_object_dispose__1;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  hiddenPhysicalDevices = self->_hiddenPhysicalDevices;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __56___GCDefaultDeviceManager__onqueue_relinquishHIDDevice___block_invoke;
  v18[3] = &unk_24D2B3E08;
  v9 = v5;
  v19 = v9;
  v20 = &v28;
  v21 = &v22;
  -[NSMutableDictionary enumerateKeysAndObjectsWithOptions:usingBlock:](hiddenPhysicalDevices, "enumerateKeysAndObjectsWithOptions:usingBlock:", 0, v18);
  if (v29[5])
  {
    objc_msgSend(v4, "stringPropertyForKey:", CFSTR("Transport"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v29[5], "stringPropertyForKey:", CFSTR("Transport"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = v29[5];
        *(_DWORD *)buf = 138412802;
        v35 = self;
        v36 = 2112;
        v37 = v4;
        v38 = 2112;
        v39 = v16;
        _os_log_impl(&dword_215181000, v15, OS_LOG_TYPE_INFO, "%@ Service %@ was relinquished, but we found cached hidden service %@ with the same identifier...", buf, 0x20u);
      }

    }
    if (objc_msgSend(v10, "isEqual:", v11))
    {
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v35 = self;
          _os_log_impl(&dword_215181000, v12, OS_LOG_TYPE_INFO, "%@ The two services have the same transport and the same identifier. Possible state inconsistency in the service stack - ignoring the hidden service", buf, 0xCu);
        }

      }
    }
    else
    {
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v35 = self;
          _os_log_impl(&dword_215181000, v17, OS_LOG_TYPE_INFO, "%@ The two services have differing transports but the same identifier. Possible BT controller plugged in via wired connection. Resurfacing the hidden service.", buf, 0xCu);
        }

      }
      -[_GCDefaultDeviceManager _onqueue_registerPhysicalDevice:serviceInfo:checkForDuplicateDevice:](self, "_onqueue_registerPhysicalDevice:serviceInfo:checkForDuplicateDevice:", v23[5], v29[5], 0);
    }

  }
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
}

- (void)relinquishHIDService:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *queue;
  id v8;
  NSObject *v9;
  void *v10;
  _QWORD block[5];
  id v12;
  os_activity_scope_state_s state;

  v5 = a3;
  v6 = _os_activity_create(&dword_215181000, "[Default Device Manager] Relinquish HID Service", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[_GCDefaultDeviceManager relinquishHIDService:].cold.1();

  }
  if ((-[NSMutableSet containsObject:](self->_claimedServices, "containsObject:", v5) & 1) == 0)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCDefaultDeviceManager.m"), 311, CFSTR("%@ has not claimed %@"), self, v5);

  }
  -[NSMutableSet removeObject:](self->_claimedServices, "removeObject:", v5);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48___GCDefaultDeviceManager_relinquishHIDService___block_invoke;
  block[3] = &unk_24D2B2B48;
  block[4] = self;
  v12 = v5;
  v8 = v5;
  dispatch_async(queue, block);

  os_activity_scope_leave(&state);
}

- (BOOL)acceptDriverConnection:(id)a3 forHIDService:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64___GCDefaultDeviceManager_acceptDriverConnection_forHIDService___block_invoke;
  block[3] = &unk_24D2B3D70;
  block[4] = self;
  v13 = v7;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

  return 1;
}

- (BOOL)acceptFilterConnection:(id)a3 forHIDService:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64___GCDefaultDeviceManager_acceptFilterConnection_forHIDService___block_invoke;
  block[3] = &unk_24D2B3D70;
  block[4] = self;
  v13 = v7;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

  return 1;
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 56, 1);
}

- (_GCPhysicalDeviceRegistry)deviceRegistry
{
  return (_GCPhysicalDeviceRegistry *)objc_loadWeakRetained((id *)&self->_deviceRegistry);
}

- (void)setDeviceRegistry:(id)a3
{
  objc_storeWeak((id *)&self->_deviceRegistry, a3);
}

- (_GCDefaultDeviceManagerDelegate)delegate
{
  return (_GCDefaultDeviceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_deviceRegistry);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_hiddenPhysicalDevices, 0);
  objc_storeStrong((id *)&self->_physicalDevices, 0);
  objc_storeStrong((id *)&self->_claimedServices, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_matchingFilter, 0);
  objc_storeStrong((id *)&self->_probeScore, 0);
}

- (void)_onqueue_checkAndHideDuplicateDevice:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_215181000, log, OS_LOG_TYPE_DEBUG, "currentlyConnectedDevice is nil", v1, 2u);
}

- (void)claimHIDService:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_7(&dword_215181000, v0, v1, "%@: Asked to claim %@");
  OUTLINED_FUNCTION_2_6();
}

- (void)_onqueue_relinquishHIDDevice:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_7(&dword_215181000, v0, v1, "%@: Removing hidden device %@");
  OUTLINED_FUNCTION_2_6();
}

- (void)_onqueue_relinquishHIDDevice:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_7(&dword_215181000, v0, v1, "%@: Removing %@");
  OUTLINED_FUNCTION_2_6();
}

- (void)relinquishHIDService:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_7(&dword_215181000, v0, v1, "%@: Asked to relinquish %@");
  OUTLINED_FUNCTION_2_6();
}

@end
