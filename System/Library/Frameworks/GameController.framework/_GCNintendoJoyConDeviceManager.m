@implementation _GCNintendoJoyConDeviceManager

- (_GCNintendoJoyConDeviceManager)init
{
  _GCNintendoJoyConDeviceManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  NSMutableSet *v5;
  NSMutableSet *claimedServices;
  uint64_t v7;
  NSMutableDictionary *pendingDevices;
  NSMutableDictionary *v9;
  NSMutableDictionary *physicalDevices;
  NSMutableSet *v11;
  NSMutableSet *fusionGestureDevices;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_GCNintendoJoyConDeviceManager;
  v2 = -[_GCNintendoJoyConDeviceManager init](&v14, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("_GCNintendoJoyConDeviceManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableSet *)objc_alloc_init((Class)&off_254DEBF30);
    claimedServices = v2->_claimedServices;
    v2->_claimedServices = v5;

    v7 = objc_opt_new();
    pendingDevices = v2->_pendingDevices;
    v2->_pendingDevices = (NSMutableDictionary *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)&off_254DEBD30);
    physicalDevices = v2->_physicalDevices;
    v2->_physicalDevices = v9;

    v11 = (NSMutableSet *)objc_alloc_init((Class)&off_254DEBF30);
    fusionGestureDevices = v2->_fusionGestureDevices;
    v2->_fusionGestureDevices = v11;

  }
  return v2;
}

- (void)device:(id)a3 fusionGestureActive:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *queue;
  id v8;
  NSObject *v9;
  const char *v10;
  _QWORD block[4];
  id v12;
  _GCNintendoJoyConDeviceManager *v13;
  BOOL v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = "ended";
      if (v4)
        v10 = "began";
      *(_DWORD *)buf = 136315394;
      v16 = v10;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_INFO, "Device fusion gesture %s: %@", buf, 0x16u);
    }

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61___GCNintendoJoyConDeviceManager_device_fusionGestureActive___block_invoke;
  block[3] = &unk_24D2B3CD0;
  v14 = v4;
  v12 = v6;
  v13 = self;
  v8 = v6;
  dispatch_async(queue, block);

}

- (NSObject)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (_GCPhysicalDeviceRegistry)deviceRegistry
{
  return (_GCPhysicalDeviceRegistry *)objc_loadWeakRetained((id *)&self->_deviceRegistry);
}

- (void)setDeviceRegistry:(id)a3
{
  objc_storeWeak((id *)&self->_deviceRegistry, a3);
}

- (id)makeDeviceWithConfiguration:(id)a3 dependencies:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  _GCFusedLogicalDevice *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  const char *v41;
  void *v42;
  _GCNintendoJoyConDeviceManager *v43;
  id v44;
  id obj;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "count") != 1
    || (objc_msgSend(v8, "anyObject"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        v10 = objc_opt_isKindOfClass(),
        v9,
        (v10 & 1) == 0))
  {
    if (objc_msgSend(v8, "count") == 1)
    {
      objc_msgSend(v8, "anyObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v8, "anyObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[_GCDefaultLogicalDevice initWithPhysicalDevice:configuration:manager:]([_GCDefaultLogicalDevice alloc], "initWithPhysicalDevice:configuration:manager:", v14, v7, self);
        objc_msgSend(v14, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[_GCDefaultLogicalDevice setDelegate:](v11, "setDelegate:", v15);
LABEL_11:

LABEL_34:
        goto LABEL_35;
      }
    }
    if (objc_msgSend(v8, "count") != 2)
    {
      unk_254DEC4F8(&off_254DEC660, "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCNintendoJoyConDeviceManager.m"), 180, CFSTR("Bad configuration: %@"), v7);

      v11 = 0;
      goto LABEL_35;
    }
    objc_msgSend(v8, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v18 = objc_opt_isKindOfClass();

      if ((v18 & 1) != 0)
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v19, "type") != 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v20, "type") != 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = -[_GCNintendoFusedJoyConDevice initWithLeft:right:manager:]([_GCNintendoFusedJoyConDevice alloc], "initWithLeft:right:manager:", v15, v21, self);
        -[_GCFusedLogicalDevice setConfiguration:](v11, "setConfiguration:", v7);

        goto LABEL_11;
      }
    }
    else
    {

    }
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v44 = v8;
    v23 = v8;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v24)
    {
      v25 = v24;
      v41 = a2;
      v42 = v14;
      v43 = self;
      obj = v23;
      v46 = v7;
      v26 = 0;
      v27 = 0;
      v28 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v48 != v28)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v30, "identifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "deviceDependencies");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "firstObject");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v31, "isEqual:", v33);

          v35 = v30;
          if (v34)
            v36 = v26;
          else
            v36 = v27;
          if (v34)
            v26 = v35;
          else
            v27 = v35;

        }
        v23 = obj;
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v25);

      v7 = v46;
      v14 = v42;
      self = v43;
      a2 = v41;
      if (v26)
        goto LABEL_31;
    }
    else
    {

      v27 = 0;
    }
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCNintendoJoyConDeviceManager.m"), 170, CFSTR("Dependencies did not contain primary device. %@"), v23);

    v26 = 0;
LABEL_31:
    v8 = v44;
    if (!v27)
    {
      unk_254DEC4F8(&off_254DEC660, "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCNintendoJoyConDeviceManager.m"), 171, CFSTR("Dependencies did not contain secondary device. %@"), v23);

    }
    v11 = -[_GCFusedLogicalDevice initWithPrimaryPhysicalDevice:secondaryPhysicalDevice:configuration:manager:]([_GCFusedLogicalDevice alloc], "initWithPrimaryPhysicalDevice:secondaryPhysicalDevice:configuration:manager:", v26, v27, v7, self);
    objc_msgSend(v26, "delegate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GCDefaultLogicalDevice setDelegate:](v11, "setDelegate:", v38);

    goto LABEL_34;
  }
  objc_msgSend(v8, "anyObject");
  v11 = (_GCFusedLogicalDevice *)objc_claimAutoreleasedReturnValue();
  -[_GCFusedLogicalDevice setConfiguration:](v11, "setConfiguration:", v7);
LABEL_35:

  return v11;
}

- (void)activateLogicalDevice:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "underlyingDevices");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "makeObjectsPerformSelector:withObject:", sel_setFusionDevice_, v4);

  }
}

- (void)deactivateLogicalDevice:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "underlyingDevices");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "makeObjectsPerformSelector:withObject:", sel_setFusionDevice_, 0);

  }
}

- (void)_onqueue_registerFusionConfigurationWithLeftDevice:(id)a3 rightDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  +[_GCNintendoFusedJoyConDevice identifierForFusedJoyConDeviceWithLeftDevice:rightDevice:](_GCNintendoFusedJoyConDevice, "identifierForFusedJoyConDeviceWithLeftDevice:rightDevice:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v19, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_GCNintendoJoyConDeviceManager identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DF640C(&off_254DF6B98, "configurationWithIdentifier:priority:deviceIdentifier:deviceDependencies:deviceBuilder:", v8, 20, v8, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

LABEL_4:
    objc_msgSend(v13, "setTransient:", 1);
    goto LABEL_5;
  }
  objc_msgSend(v6, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    goto LABEL_4;
LABEL_5:
  -[_GCNintendoJoyConDeviceManager deviceRegistry](self, "deviceRegistry");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "deviceConfigurationRegistry");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addConfiguration:replaceExisting:", v13, 0);

}

- (void)_onqueue_tryRegisteringFusionConfigurationWithDevice:(id)a3
{
  id WeakRetained;
  id v5;
  int v6;
  int v7;
  id v8;
  id v9;
  int v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pendingJoyCon);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_pendingJoyCon);
    v6 = objc_msgSend(v5, "type");
    v7 = objc_msgSend(obj, "type");

    if (v6 != v7)
    {
      v8 = objc_loadWeakRetained((id *)&self->_pendingJoyCon);
      if (objc_msgSend(v8, "type") == 1 && objc_msgSend(obj, "type") == 2)
      {

      }
      else
      {
        v9 = objc_loadWeakRetained((id *)&self->_pendingJoyCon);
        if (objc_msgSend(v9, "type") != 2)
        {

LABEL_17:
          goto LABEL_18;
        }
        v10 = objc_msgSend(obj, "type");

        if (v10 != 1)
          goto LABEL_18;
      }
      v11 = objc_loadWeakRetained((id *)&self->_pendingJoyCon);
      if (objc_msgSend(v11, "type") == 1)
        v12 = objc_loadWeakRetained((id *)&self->_pendingJoyCon);
      else
        v12 = obj;
      v8 = v12;

      v13 = objc_loadWeakRetained((id *)&self->_pendingJoyCon);
      if (objc_msgSend(v13, "type") == 2)
        v14 = objc_loadWeakRetained((id *)&self->_pendingJoyCon);
      else
        v14 = obj;
      v15 = v14;

      -[_GCNintendoJoyConDeviceManager _onqueue_registerFusionConfigurationWithLeftDevice:rightDevice:](self, "_onqueue_registerFusionConfigurationWithLeftDevice:rightDevice:", v8, v15);
      goto LABEL_17;
    }
  }
  objc_storeWeak((id *)&self->_pendingJoyCon, obj);
LABEL_18:

}

- (void)_onqueue_registerDefaultConfigurationForJoyConDevice:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc((Class)&off_254DEDEA8);
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("JOYCON(%@)"), v6);

  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCNintendoJoyConDeviceManager identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DF640C(&off_254DF6B98, "configurationWithIdentifier:priority:deviceIdentifier:deviceDependencies:deviceBuilder:", v7, 10, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();

  if ((v4 & 1) != 0)
    objc_msgSend(v12, "setTransient:", 1);
  -[_GCNintendoJoyConDeviceManager deviceRegistry](self, "deviceRegistry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "deviceConfigurationRegistry");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addConfiguration:replaceExisting:", v12, 0);

}

- (void)_onqueue_registerDefaultConfigurationForDevice:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc((Class)&off_254DEDEA8);
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("LOGICAL_DEVICE(%@)"), v6);

  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCNintendoJoyConDeviceManager identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DF640C(&off_254DF6B98, "configurationWithIdentifier:priority:deviceIdentifier:deviceDependencies:deviceBuilder:", v7, 10, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();

  if ((v4 & 1) != 0)
    objc_msgSend(v11, "setTransient:", 1);
  -[_GCNintendoJoyConDeviceManager deviceRegistry](self, "deviceRegistry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deviceConfigurationRegistry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addConfiguration:replaceExisting:", v11, 0);

}

- (void)_onqueue_registerDefaultConfigurationsForDevice:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_GCNintendoJoyConDeviceManager _onqueue_registerDefaultConfigurationForJoyConDevice:](self, "_onqueue_registerDefaultConfigurationForJoyConDevice:", v4);
    -[_GCNintendoJoyConDeviceManager _onqueue_tryRegisteringFusionConfigurationWithDevice:](self, "_onqueue_tryRegisteringFusionConfigurationWithDevice:", v4);
  }
  else
  {
    -[_GCNintendoJoyConDeviceManager _onqueue_registerDefaultConfigurationForDevice:](self, "_onqueue_registerDefaultConfigurationForDevice:", v4);
  }

}

- (id)matchHIDService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id *v6;
  id v7;

  v3 = a3;
  objc_msgSend(v3, "numberPropertyForKey:", CFSTR("VendorID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberPropertyForKey:", CFSTR("ProductID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToNumber:", &unk_24D30DE10)
    && ((objc_msgSend(v5, "isEqualToNumber:", &unk_24D30DE28) & 1) != 0
     || (objc_msgSend(v5, "isEqualToNumber:", &unk_24D30DE40) & 1) != 0
     || (objc_msgSend(v5, "isEqualToNumber:", &unk_24D30DE58) & 1) != 0
     || (objc_msgSend(v5, "isEqualToNumber:", &unk_24D30DE70) & 1) != 0
     || (objc_msgSend(v5, "isEqualToNumber:", &unk_24D30DE88) & 1) != 0
     || (objc_msgSend(v5, "isEqualToNumber:", &unk_24D30DEA0) & 1) != 0))
  {
    v6 = (id *)MEMORY[0x24BE3A690];
  }
  else
  {
    v6 = (id *)MEMORY[0x24BE3A6A0];
  }
  v7 = *v6;

  return v7;
}

- (void)claimHIDService:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *queue;
  id v8;
  NSObject *v9;
  void *v10;
  _QWORD block[4];
  id v12;
  _GCNintendoJoyConDeviceManager *v13;
  SEL v14;
  os_activity_scope_state_s state;

  v5 = a3;
  v6 = _os_activity_create(&dword_215181000, "[Joy-Con Device Manager] Claim HID Service", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[_GCNintendoJoyConDeviceManager claimHIDService:].cold.1();

  }
  if (-[NSMutableSet containsObject:](self->_claimedServices, "containsObject:", v5))
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCNintendoJoyConDeviceManager.m"), 313, CFSTR("%@ has already claimed %@"), self, v5);

  }
  -[NSMutableSet addObject:](self->_claimedServices, "addObject:", v5);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50___GCNintendoJoyConDeviceManager_claimHIDService___block_invoke;
  block[3] = &unk_24D2B3D48;
  v12 = v5;
  v13 = self;
  v14 = a2;
  v8 = v5;
  dispatch_async(queue, block);

  os_activity_scope_leave(&state);
}

- (void)_onqueue_relinquishHIDService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKey:](self->_physicalDevices, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[_GCNintendoJoyConDeviceManager _onqueue_relinquishHIDService:].cold.2();

    }
    -[_GCNintendoJoyConDeviceManager deviceRegistry](self, "deviceRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceManager:deviceDidDisconnect:", self, v5);

    -[NSMutableSet removeObject:](self->_fusionGestureDevices, "removeObject:", v5);
    -[NSMutableDictionary removeObjectForKey:](self->_physicalDevices, "removeObjectForKey:", v4);
  }
  -[NSMutableDictionary objectForKey:](self->_pendingDevices, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[_GCNintendoJoyConDeviceManager _onqueue_relinquishHIDService:].cold.1();

    }
    objc_msgSend(v7, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancel");

    objc_msgSend(v7, "setFilterConnection:invalidatingPrevious:", 0, 1);
    objc_msgSend(v7, "setDriverConnection:invalidatingPrevious:", 0, 1);
    -[NSMutableDictionary removeObjectForKey:](self->_pendingDevices, "removeObjectForKey:", v4);
  }

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
  v6 = _os_activity_create(&dword_215181000, "[JoyCon Device Manager] Relinquish HID Service", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[_GCNintendoJoyConDeviceManager relinquishHIDService:].cold.1();

  }
  if ((-[NSMutableSet containsObject:](self->_claimedServices, "containsObject:", v5) & 1) == 0)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCNintendoJoyConDeviceManager.m"), 397, CFSTR("%@ has not claimed %@"), self, v5);

  }
  -[NSMutableSet removeObject:](self->_claimedServices, "removeObject:", v5);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55___GCNintendoJoyConDeviceManager_relinquishHIDService___block_invoke;
  block[3] = &unk_24D2B2B48;
  block[4] = self;
  v12 = v5;
  v8 = v5;
  dispatch_async(queue, block);

  os_activity_scope_leave(&state);
}

- (BOOL)acceptDriverConnection:(id)a3 forHIDService:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  char v10;
  NSObject *queue;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;
  os_activity_scope_state_s state;

  v7 = a3;
  v8 = a4;
  v9 = _os_activity_create(&dword_215181000, "[JoyCon Device Manager] Accept HID Driver Connection", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v10 = -[NSMutableSet containsObject:](self->_claimedServices, "containsObject:", v8);
  if ((v10 & 1) != 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71___GCNintendoJoyConDeviceManager_acceptDriverConnection_forHIDService___block_invoke;
    block[3] = &unk_24D2B3D70;
    block[4] = self;
    v15 = v8;
    v16 = v7;
    dispatch_async(queue, block);

  }
  else
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCNintendoJoyConDeviceManager.m"), 409, CFSTR("Unclaimed service: %@"), v8);

  }
  os_activity_scope_leave(&state);

  return v10;
}

- (BOOL)acceptFilterConnection:(id)a3 forHIDService:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  char v10;
  NSObject *queue;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;
  SEL v17;
  os_activity_scope_state_s state;

  v7 = a3;
  v8 = a4;
  v9 = _os_activity_create(&dword_215181000, "[JoyCon Device Manager] Accept HID Filter Connection", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  v10 = -[NSMutableSet containsObject:](self->_claimedServices, "containsObject:", v8);
  if ((v10 & 1) != 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71___GCNintendoJoyConDeviceManager_acceptFilterConnection_forHIDService___block_invoke;
    block[3] = &unk_24D2B2BC0;
    block[4] = self;
    v15 = v8;
    v16 = v7;
    v17 = a2;
    dispatch_async(queue, block);

  }
  else
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCNintendoJoyConDeviceManager.m"), 433, CFSTR("Unclaimed service: %@"), v8);

  }
  os_activity_scope_leave(&state);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fusionGestureDevices, 0);
  objc_destroyWeak((id *)&self->_pendingJoyCon);
  objc_storeStrong((id *)&self->_physicalDevices, 0);
  objc_storeStrong((id *)&self->_pendingDevices, 0);
  objc_storeStrong((id *)&self->_claimedServices, 0);
  objc_destroyWeak((id *)&self->_deviceRegistry);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)claimHIDService:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_215181000, v0, v1, "%@: Asked to claim %@");
  OUTLINED_FUNCTION_3_0();
}

- (void)_onqueue_relinquishHIDService:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_215181000, v0, v1, "%@: Removing %@");
  OUTLINED_FUNCTION_3_0();
}

- (void)_onqueue_relinquishHIDService:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_215181000, v0, v1, "%@: Removing %@");
  OUTLINED_FUNCTION_3_0();
}

- (void)relinquishHIDService:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_215181000, v0, v1, "%@: Asked to relinquish %@");
  OUTLINED_FUNCTION_3_0();
}

@end
