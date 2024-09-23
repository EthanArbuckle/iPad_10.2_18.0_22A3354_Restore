@implementation DADiscovery

- (DADiscovery)init
{
  DADiscovery *v2;
  DADiscovery *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DADiscovery;
  v2 = -[DADiscovery init](&v5, sel_init);
  if (v2)
  {
    v2->_clientID = CUXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v2->_lock._os_unfair_lock_opaque = 0;
    v3 = v2;
  }

  return v2;
}

- (DADiscovery)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  DADiscovery *v13;
  uint64_t v14;
  DADiscoveryConfiguration *configuration;
  DADiscovery *v16;
  uint64_t v18;

  v6 = a3;
  v13 = -[DADiscovery init](self, "init");
  if (v13)
  {
    v14 = objc_msgSend(v6, "copy");
    configuration = v13->_configuration;
    v13->_configuration = (DADiscoveryConfiguration *)v14;

    v16 = v13;
  }
  else if (a4)
  {
    DAErrorF(350000, (uint64_t)"init failed", v7, v8, v9, v10, v11, v12, v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (DADiscovery)initWithConfigurations:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  DADiscovery *v13;
  uint64_t v14;
  NSArray *configurations;
  DADiscovery *v16;
  uint64_t v18;

  v6 = a3;
  v13 = -[DADiscovery init](self, "init");
  if (v13)
  {
    v14 = objc_msgSend(v6, "copy");
    configurations = v13->_configurations;
    v13->_configurations = (NSArray *)v14;

    v16 = v13;
  }
  else if (a4)
  {
    DAErrorF(350000, (uint64_t)"init failed", v7, v8, v9, v10, v11, v12, v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (DADiscovery)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  DADiscovery *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  DADiscovery *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a3;
  v7 = -[DADiscovery init](self, "init");
  if (!v7)
  {
    if (!a4)
      goto LABEL_19;
    v24 = objc_opt_class();
    DAErrorF(350001, (uint64_t)"%@ init failed", v17, v18, v19, v20, v21, v22, v24);
LABEL_18:
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (MEMORY[0x2199CAB58](v6) != MEMORY[0x24BDACFA0])
  {
    if (!a4)
      goto LABEL_19;
    DAErrorF(350004, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v23);
    goto LABEL_18;
  }
  CUXPCDecodeNSString();
  v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 != 6)
  {
    if (v14 != 5)
      goto LABEL_6;
LABEL_19:
    v15 = 0;
    goto LABEL_13;
  }
  v7->_clientID = 0;
LABEL_6:
  objc_opt_class();
  if (!CUXPCDecodeObject())
    goto LABEL_19;
  if (!v7->_configuration)
  {
    objc_opt_class();
    CUXPCDecodeNSArrayOfClass();
    if (!v7->_configuration && !v7->_configurations)
      goto LABEL_19;
  }
  if (CUXPCDecodeUInt64RangedEx() == 6)
    v7->_flags = 0;
  v15 = v7;
LABEL_13:

  return v15;
}

- (void)encodeWithXPCObject:(id)a3
{
  const char *v4;
  uint64_t clientID;
  xpc_object_t xdict;

  xdict = a3;
  v4 = -[NSString UTF8String](objc_retainAutorelease(self->_bundleID), "UTF8String");
  if (v4)
    xpc_dictionary_set_string(xdict, "bndI", v4);
  clientID = self->_clientID;
  if ((_DWORD)clientID)
    xpc_dictionary_set_uint64(xdict, "cid", clientID);
  CUXPCEncodeObject();
  CUXPCEncodeNSArrayOfObjects();
  xpc_dictionary_set_uint64(xdict, "dsFs", self->_flags);

}

- (id)description
{
  return -[DADiscovery descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v4;
  id v5;
  id v6;
  NSMutableSet *extensions;
  NSMutableSet *v8;
  id v9;
  DADiscoveryConfiguration *configuration;
  id v11;
  NSArray *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  DADiscoveryConfiguration *v21;
  uint64_t v22;
  uint64_t clientID;
  NSString *bundleID;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  id v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v31 = 0;
  v4 = objc_opt_class();
  clientID = self->_clientID;
  bundleID = self->_bundleID;
  v20 = v4;
  NSAppendPrintF();
  v5 = 0;
  v6 = v5;
  extensions = self->_extensions;
  if (extensions)
  {
    v30 = v5;
    v8 = extensions;
    -[NSMutableSet count](v8, "count", v20, clientID, bundleID);
    NSAppendPrintF();
    v9 = v30;

    v6 = v9;
  }
  configuration = self->_configuration;
  if (configuration)
  {
    v29 = v6;
    v21 = configuration;
    NSAppendPrintF();
    v11 = v6;

    v6 = v11;
  }
  v12 = self->_configurations;
  v13 = v12;
  if (v12)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        v17 = 0;
        v18 = v6;
        do
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          v22 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v17);
          NSAppendPrintF();
          v6 = v18;

          ++v17;
          v18 = v6;
        }
        while (v15 != v17);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v32, 16, v22);
      }
      while (v15);
    }
  }

  return v6;
}

- (NSArray)discoveredDevices
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *deviceMap;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  deviceMap = self->_deviceMap;
  if (deviceMap)
  {
    -[NSMutableDictionary allValues](deviceMap, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (BOOL)runningExtension
{
  os_unfair_lock_s *p_lock;
  NSMutableSet *v4;
  uint64_t v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_extensions;
  os_unfair_lock_unlock(p_lock);
  v5 = -[NSMutableSet count](v4, "count");

  return v5 != 0;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__DADiscovery_activate__block_invoke;
  block[3] = &unk_24D169168;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __23__DADiscovery_activate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;

  v1 = result;
  if (gLogCategory_DADiscovery <= 30)
  {
    if (gLogCategory_DADiscovery != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
      result = LogPrintF();
  }
  v2 = *(_QWORD *)(v1 + 32);
  if (!*(_BYTE *)(v2 + 8))
  {
    *(_BYTE *)(v2 + 8) = 1;
    v3 = *(_BYTE **)(v1 + 32);
    if (v3[56])
      return objc_msgSend(v3, "_activateDirect");
    else
      return objc_msgSend(v3, "_activateXPCStart:", 0);
  }
  return result;
}

- (void)_activateDirect
{
  NSString *v3;
  NSString *bundleID;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  DAEvent *v14;
  DADiscovery *v15;
  uint64_t v16;
  _QWORD v17[5];
  NSString *v18;
  _QWORD v19[5];

  if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  {
    v15 = self;
    LogPrintF();
  }
  -[DADiscoveryConfiguration bundleID](self->_configuration, "bundleID", v15);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleID = v3;
  if (!v3)
    bundleID = self->_bundleID;
  v5 = bundleID;

  self->_activateTimeInterval = CFAbsoluteTimeGetCurrent();
  if (v5)
  {
    v12 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __30__DADiscovery__activateDirect__block_invoke;
    v19[3] = &unk_24D1692A8;
    v19[4] = self;
    -[DADiscovery _findExtensionPoint:bundleID:entitlement:completion:](self, "_findExtensionPoint:bundleID:entitlement:completion:", CFSTR("com.apple.discovery-extension"), v5, CFSTR("com.apple.developer.media-device-discovery-extension"), v19);
    if ((self->_flags & 4) != 0)
    {
      v17[0] = v12;
      v17[1] = 3221225472;
      v17[2] = __30__DADiscovery__activateDirect__block_invoke_2;
      v17[3] = &unk_24D1692D0;
      v17[4] = self;
      v18 = v5;
      -[DADiscovery _findExtensionPoint:bundleID:entitlement:completion:](self, "_findExtensionPoint:bundleID:entitlement:completion:", CFSTR("com.apple.accessory-setup-extension"), v18, CFSTR("com.apple.developer.accessory-setup-discovery-extension"), v17);

    }
  }
  else
  {
    if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
      LogPrintF();
    DAErrorF(350001, (uint64_t)"Bundle does not exist", v6, v7, v8, v9, v10, v11, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[DAEvent initWithEventType:error:]([DAEvent alloc], "initWithEventType:error:", 10, v13);
    -[DADiscovery _reportEvent:](self, "_reportEvent:", v14);

  }
}

void __30__DADiscovery__activateDirect__block_invoke(uint64_t a1, void *a2)
{
  id v3;
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
  v3 = a2;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        objc_msgSend(*(id *)(a1 + 32), "_activateExtension:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __30__DADiscovery__activateDirect__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  _QWORD *v15;
  void *v16;
  DAEvent *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v3;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(a1 + 32), "_activateExtension:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }
    goto LABEL_9;
  }
  v15 = *(_QWORD **)(a1 + 32);
  if (!v15[11] && !v15[12])
  {
    DAErrorF(350001, (uint64_t)"Extension or configurations not available on %@", v4, v5, v6, v7, v8, v9, *(_QWORD *)(a1 + 40));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(a1 + 32);
    v17 = -[DAEvent initWithEventType:error:]([DAEvent alloc], "initWithEventType:error:", 32, v10);
    objc_msgSend(v16, "_reportEvent:", v17);

LABEL_9:
    goto LABEL_10;
  }
  if ((objc_msgSend(v15, "flags") & 8) != 0)
    objc_msgSend((id)gDADaemonServer, "runMigrationWithDiscovery:", *(_QWORD *)(a1 + 32));
  else
    objc_msgSend((id)gDADaemonServer, "runSystemDiscovery");
LABEL_10:

}

- (void)migrateDevices
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__DADiscovery_migrateDevices__block_invoke;
  block[3] = &unk_24D169168;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__DADiscovery_migrateDevices__block_invoke(uint64_t a1)
{
  if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    LogPrintF();
  return objc_msgSend(*(id *)(a1 + 32), "finishMigration");
}

- (void)finishMigration
{
  _xpc_connection_s *v3;
  xpc_object_t xdict;

  if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    LogPrintF();
  xdict = xpc_dictionary_create(0, 0, 0);
  -[DADiscovery encodeWithXPCObject:](self, "encodeWithXPCObject:", xdict);
  xpc_dictionary_set_string(xdict, "mTyp", "DscM");
  -[DADiscovery _ensureXPCStarted](self, "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message_with_reply(v3, xdict, (dispatch_queue_t)self->_dispatchQueue, &__block_literal_global);

}

void __30__DADiscovery_finishMigration__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_DADiscovery <= 30
    && ((v5 = v2, gLogCategory_DADiscovery != -1) || (v4 = _LogCategory_Initialize(), v3 = v5, v4)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (void)_activateExtension:(id)a3
{
  id v4;
  DADiscoveryExtension *v5;
  NSMutableSet *extensions;
  NSMutableSet *v7;
  NSMutableSet *v8;
  void *v9;
  _QWORD v10[6];

  v4 = a3;
  v5 = objc_alloc_init(DADiscoveryExtension);
  -[DADiscoveryExtension setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
  -[DADiscoveryExtension setEkExtension:](v5, "setEkExtension:", v4);

  -[DADiscoveryExtension setParent:](v5, "setParent:", self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __34__DADiscovery__activateExtension___block_invoke;
  v10[3] = &unk_24D169140;
  v10[4] = self;
  v10[5] = v5;
  -[DADiscoveryExtension setInvalidationHandler:](v5, "setInvalidationHandler:", v10);
  extensions = self->_extensions;
  if (!extensions)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v8 = self->_extensions;
    self->_extensions = v7;

    extensions = self->_extensions;
  }
  -[NSMutableSet addObject:](extensions, "addObject:", v5);
  -[DADiscovery _uuidFromExtension:](self, "_uuidFromExtension:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[DADiscovery _updateNEPolicy:remove:](self, "_updateNEPolicy:remove:", v9, 0);
  -[DADiscoveryExtension activate](v5, "activate");

}

uint64_t __34__DADiscovery__activateExtension___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_activateXPCStart:(BOOL)a3
{
  xpc_object_t v4;
  _xpc_connection_s *v5;
  NSObject *dispatchQueue;
  _QWORD handler[5];

  if (a3)
  {
    if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
LABEL_7:
      LogPrintF();
  }
  else if (gLogCategory_DADiscovery <= 30
         && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  v4 = xpc_dictionary_create(0, 0, 0);
  -[DADiscovery encodeWithXPCObject:](self, "encodeWithXPCObject:", v4);
  xpc_dictionary_set_string(v4, "mTyp", "DscA");
  -[DADiscovery _ensureXPCStarted](self, "_ensureXPCStarted");
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __33__DADiscovery__activateXPCStart___block_invoke;
  handler[3] = &unk_24D169318;
  handler[4] = self;
  xpc_connection_send_message_with_reply(v5, v4, dispatchQueue, handler);

}

uint64_t __33__DADiscovery__activateXPCStart___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateXPCCompleted:", a2);
}

- (void)_activateXPCCompleted:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  uint64_t v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *deviceMap;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  DADeviceEvent *v20;
  DAEventDevicesPresent *v21;
  DADiscovery *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _QWORD aBlock[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__3;
  v37 = __Block_byref_object_dispose__3;
  v38 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__DADiscovery__activateXPCCompleted___block_invoke;
  aBlock[3] = &unk_24D169340;
  aBlock[4] = self;
  aBlock[5] = &v33;
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  CUXPCDecodeNSErrorIfNeeded();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v34[5];
  v34[5] = v6;

  if (!v34[5])
  {
    if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    {
      v22 = self;
      LogPrintF();
    }
    v31 = 0;
    if (!-[DADiscoveryConfiguration presenceOnly](self->_configuration, "presenceOnly", v22))
    {
      objc_opt_class();
      CUXPCDecodeNSArrayOfClass();
    }
    if (objc_msgSend(v31, "count"))
    {
      os_unfair_lock_lock(&self->_lock);
      if (!self->_deviceMap)
      {
        v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
        deviceMap = self->_deviceMap;
        self->_deviceMap = v8;

      }
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v10 = v31;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v28 != v12)
              objc_enumerationMutation(v10);
            v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_msgSend(v14, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", v14, v15);

          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
        }
        while (v11);
      }

      os_unfair_lock_unlock(&self->_lock);
    }
    -[DADiscovery _reportEventType:](self, "_reportEventType:", 10);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = v31;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v16);
          v20 = -[DAEventDevice initWithEventType:device:]([DADeviceEvent alloc], "initWithEventType:device:", 40, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j));
          -[DADiscovery _reportEvent:](self, "_reportEvent:", v20);

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
      }
      while (v17);
    }

    if (xpc_dictionary_get_BOOL(v4, "dvPr"))
    {
      v21 = -[DAEventDevicesPresent initWithPresent:devicesMigrated:]([DAEventDevicesPresent alloc], "initWithPresent:devicesMigrated:", 1, 0);
      -[DADiscovery _reportEvent:](self, "_reportEvent:", v21);

    }
  }
  v5[2](v5);

  _Block_object_dispose(&v33, 8);
}

void __37__DADiscovery__activateXPCCompleted___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  DAEvent *v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    v2 = *(void **)(a1 + 32);
    v4 = -[DAEvent initWithEventType:error:]([DAEvent alloc], "initWithEventType:error:", 10, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(v2, "_reportEvent:", v4);

  }
}

- (id)_ensureXPCStarted
{
  OS_xpc_object **p_xpcCnx;
  OS_xpc_object *v4;
  OS_xpc_object *v5;
  OS_xpc_object *v6;
  OS_xpc_object *v7;
  _xpc_connection_s *mach_service;
  _QWORD handler[5];

  p_xpcCnx = &self->_xpcCnx;
  v4 = self->_xpcCnx;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v6 = self->_xpcListenerEndpoint;
    v7 = v6;
    if (v6)
    {
      mach_service = xpc_connection_create_from_endpoint(v6);
      xpc_connection_set_target_queue(mach_service, (dispatch_queue_t)self->_dispatchQueue);
    }
    else
    {
      mach_service = xpc_connection_create_mach_service("com.apple.DeviceAccess.xpc", (dispatch_queue_t)self->_dispatchQueue, 0);
    }
    objc_storeStrong((id *)p_xpcCnx, mach_service);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __32__DADiscovery__ensureXPCStarted__block_invoke;
    handler[3] = &unk_24D169318;
    handler[4] = self;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_activate(mach_service);
    v5 = mach_service;

  }
  return v5;
}

uint64_t __32__DADiscovery__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "xpcReceivedMessage:", a2);
}

- (void)_interrupted
{
  DADiscovery *v3;

  if (!self->_invalidateCalled)
  {
    if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    {
      v3 = self;
      LogPrintF();
    }
    -[DADiscovery _reportEventType:](self, "_reportEventType:", 60, v3);
    -[DADiscovery _activateXPCStart:](self, "_activateXPCStart:", 1);
  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  objc_msgSend((id)gDADaemonServer, "runSystemDiscovery");
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__DADiscovery_invalidate__block_invoke;
  block[3] = &unk_24D169168;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__DADiscovery_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _xpc_connection_s *v3;
  uint64_t v4;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 32))
  {
    v2 = result;
    *(_BYTE *)(v1 + 32) = 1;
    if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    {
      v4 = *(_QWORD *)(v2 + 32);
      LogPrintF();
    }
    v3 = *(_xpc_connection_s **)(*(_QWORD *)(v2 + 32) + 48);
    if (v3)
      xpc_connection_cancel(v3);
    objc_msgSend(*(id *)(v2 + 32), "_stopExtensons", v4);
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

- (void)invalidateWithReason:(unint64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__DADiscovery_invalidateWithReason___block_invoke;
  v4[3] = &unk_24D169368;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

void __36__DADiscovery_invalidateWithReason___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  _xpc_connection_s *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD handler[5];

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32))
  {
    if (gLogCategory_DADiscovery <= 50 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    {
      v7 = *(_QWORD *)(a1 + 40);
      LogPrintF();
    }
    v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v2, "mTyp", "DsSp");
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      xpc_dictionary_set_uint64(v2, "DSpRn", v3);
    objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted", v7);
    v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 64);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __36__DADiscovery_invalidateWithReason___block_invoke_2;
    handler[3] = &unk_24D169318;
    handler[4] = v5;
    xpc_connection_send_message_with_reply(v4, v2, v6, handler);

  }
}

void __36__DADiscovery_invalidateWithReason___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  CUXPCDecodeNSErrorIfNeeded();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v2);

}

- (void)_invalidated
{
  id eventHandler;

  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !-[NSMutableSet count](self->_extensions, "count")
    && !self->_xpcCnx)
  {
    -[DADiscovery _reportEventType:](self, "_reportEventType:", 20);
    eventHandler = self->_eventHandler;
    self->_eventHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

- (void)_reportEvent:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v4 = _Block_copy(self->_eventHandler);
  v5 = v4;
  if (v4)
    (*((void (**)(void *, id))v4 + 2))(v4, v6);

}

- (void)_reportASKEvent:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *bundleID;
  NSString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  DADiscoveryConfiguration *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  DADiscovery *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_34;
  -[DADiscoveryConfiguration bundleID](self->_configuration, "bundleID");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleID = v6;
  if (!v6)
    bundleID = self->_bundleID;
  v8 = bundleID;

  objc_msgSend((id)gDADaemonServer, "getDevicesWithFlags:appID:", 8, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  {
    v31 = v9;
    LogPrintF();
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (!v11)
    goto LABEL_17;
  v12 = v11;
  v13 = *(_QWORD *)v35;
  v32 = self;
  v33 = v4;
  while (2)
  {
    v14 = v8;
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v35 != v13)
        objc_enumerationMutation(v10);
      v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
      objc_msgSend(v16, "bluetoothIdentifier", v31);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bluetoothIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (v19)
      {
        v23 = v10;
        v8 = v14;
        v4 = v33;
        if (gLogCategory_DADiscovery > 90)
          goto LABEL_33;
        if (gLogCategory_DADiscovery == -1)
        {
          v23 = v10;
          if (!_LogCategory_Initialize())
            goto LABEL_33;
        }
LABEL_28:
        LogPrintF();
        v23 = v10;
        goto LABEL_33;
      }
      objc_msgSend(v16, "SSID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "SSID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqual:", v21);

      if (v22)
      {
        v23 = v10;
        v8 = v14;
        v4 = v33;
        if (gLogCategory_DADiscovery > 90)
          goto LABEL_33;
        if (gLogCategory_DADiscovery == -1)
        {
          v23 = v10;
          if (!_LogCategory_Initialize())
            goto LABEL_33;
        }
        goto LABEL_28;
      }
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    v8 = v14;
    self = v32;
    v4 = v33;
    if (v12)
      continue;
    break;
  }
LABEL_17:

  objc_msgSend(v5, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v5, "setFlags:", 8);
    objc_msgSend(v5, "discoveryConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      v25 = objc_alloc_init(DADiscoveryConfiguration);
      -[DADiscoveryConfiguration setBundleID:](v25, "setBundleID:", v8);
      objc_msgSend(v5, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[DADiscoveryConfiguration setAssociationIdentifier:](v25, "setAssociationIdentifier:", v26);

      objc_msgSend(v5, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[DADiscoveryConfiguration setDisplayName:](v25, "setDisplayName:", v27);

      -[DADiscoveryConfiguration setAllowsBluetoothPairing:](v25, "setAllowsBluetoothPairing:", objc_msgSend(v5, "allowPairing"));
      objc_msgSend(v5, "bluetoothIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[DADiscoveryConfiguration setBluetoothIdentifier:](v25, "setBluetoothIdentifier:", v28);

      objc_msgSend(v5, "setDiscoveryConfiguration:", v25);
    }
    objc_msgSend(v5, "setDiscoveredInExtension:", 1, v31);
    if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v29 = _Block_copy(self->_eventHandler);
    v30 = v29;
    if (v29)
      (*((void (**)(void *, id))v29 + 2))(v29, v4);

  }
LABEL_33:

LABEL_34:
}

- (void)_reportEventType:(int64_t)a3
{
  DAEvent *v4;

  v4 = -[DAEvent initWithEventType:]([DAEvent alloc], "initWithEventType:", a3);
  -[DADiscovery _reportEvent:](self, "_reportEvent:", v4);

}

- (void)getAuthorizedDevices:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__DADiscovery_getAuthorizedDevices___block_invoke;
  v7[3] = &unk_24D169230;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __36__DADiscovery_getAuthorizedDevices___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  DASession *v3;
  void *v4;
  void *v5;
  _xpc_connection_s *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "GADv");
  v3 = objc_alloc_init(DASession);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  -[DASession setBundleID:](v3, "setBundleID:", v5);

  -[DASession setClientID:](v3, "setClientID:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 60));
  CUXPCEncodeObject();
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 64);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __36__DADiscovery_getAuthorizedDevices___block_invoke_2;
  v10[3] = &unk_24D169390;
  v10[4] = v7;
  v11 = v8;
  xpc_connection_send_message_with_reply(v6, v2, v9, v10);

}

uint64_t __36__DADiscovery_getAuthorizedDevices___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getAuthorizedDevicesCompleted:completionHandler:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_getAuthorizedDevicesCompleted:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD aBlock[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__DADiscovery__getAuthorizedDevicesCompleted_completionHandler___block_invoke;
  aBlock[3] = &unk_24D1693B8;
  v14 = &v15;
  v7 = v6;
  v13 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  CUXPCDecodeNSErrorIfNeeded();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v16[5];
  v16[5] = v9;

  if (!v16[5])
  {
    objc_opt_class();
    CUXPCDecodeNSArrayOfClass();
    if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSObjectOneLine();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

  }
  v8[2](v8);

  _Block_object_dispose(&v15, 8);
}

uint64_t __64__DADiscovery__getAuthorizedDevicesCompleted_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

- (void)respondToBluetoothPairingRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  DADiscovery *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__DADiscovery_respondToBluetoothPairingRequest_completionHandler___block_invoke;
  block[3] = &unk_24D169408;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __66__DADiscovery_respondToBluetoothPairingRequest_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[4];
  id v7;

  if (gLogCategory_DADiscovery <= 50 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "mTyp", "BTPM");
  xpc_dictionary_set_string(v2, "mSTyp", "BTPRsp");
  CUXPCEncodeObject();
  objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 64);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __66__DADiscovery_respondToBluetoothPairingRequest_completionHandler___block_invoke_2;
  handler[3] = &unk_24D1693E0;
  v7 = v4;
  xpc_connection_send_message_with_reply(v3, v2, v5, handler);

}

void __66__DADiscovery_respondToBluetoothPairingRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v2;
  if (gLogCategory_DADiscovery <= 30)
  {
    if (gLogCategory_DADiscovery != -1 || (v3 = _LogCategory_Initialize(), v2 = v6, v3))
    {
      CUPrintNSError();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v2 = v6;
    }
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
    v2 = v6;
  }

}

- (void)setState:(int64_t)a3 device:(id)a4 completionHandler:(id)a5
{
  -[DADiscovery setState:device:simulateApp:completionHandler:](self, "setState:device:simulateApp:completionHandler:", a3, a4, 0, a5);
}

- (void)setState:(int64_t)a3 device:(id)a4 simulateApp:(BOOL)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  DADiscovery *v16;
  id v17;
  int64_t v18;

  v9 = a4;
  v10 = a6;
  dispatchQueue = self->_dispatchQueue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __61__DADiscovery_setState_device_simulateApp_completionHandler___block_invoke;
  v14[3] = &unk_24D169458;
  v15 = v9;
  v16 = self;
  v17 = v10;
  v18 = a3;
  v12 = v10;
  v13 = v9;
  dispatch_async(dispatchQueue, v14);

}

void __61__DADiscovery_setState_device_simulateApp_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  xpc_object_t v3;
  DASession *v4;
  void *v5;
  void *v6;
  _xpc_connection_s *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD handler[4];
  id v16;
  id v17;
  uint64_t v18;

  if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  {
    v2 = *(_QWORD *)(a1 + 32);
    DADeviceStateToString(*(_QWORD *)(a1 + 56));
    v13 = v2;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "mTyp", "SDvS");
  CUXPCEncodeObject();
  xpc_dictionary_set_int64(v3, "dvSt", *(_QWORD *)(a1 + 56));
  v4 = objc_alloc_init(DASession);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v6 = *(void **)(*(_QWORD *)(a1 + 40) + 120);
  -[DASession setBundleID:](v4, "setBundleID:", v6, v13, v14);

  -[DASession setClientID:](v4, "setClientID:", *(unsigned int *)(*(_QWORD *)(a1 + 40) + 60));
  CUXPCEncodeObject();
  objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 64);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __61__DADiscovery_setState_device_simulateApp_completionHandler___block_invoke_2;
  handler[3] = &unk_24D169430;
  v10 = v8;
  v12 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v16 = v10;
  v18 = v11;
  v17 = v12;
  xpc_connection_send_message_with_reply(v7, v3, v9, handler);

}

void __61__DADiscovery_setState_device_simulateApp_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  CUXPCDecodeNSErrorIfNeeded();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  {
    DADeviceStateToString(*(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSError();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  (*(void (**)(_QWORD, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5, v2);

}

- (void)setDeviceAppAccessInfo:(id)a3 device:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  DADiscovery *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __63__DADiscovery_setDeviceAppAccessInfo_device_completionHandler___block_invoke;
  v15[3] = &unk_24D169480;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(dispatchQueue, v15);

}

void __63__DADiscovery_setDeviceAppAccessInfo_device_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  xpc_object_t v8;
  DASession *v9;
  void *v10;
  void *v11;
  _xpc_connection_s *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _QWORD handler[4];
  id v19;
  id v20;

  if ((objc_msgSend(*(id *)(a1 + 32), "flags") & 8) != 0)
  {
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "mTyp", "SAAi");
    v9 = objc_alloc_init(DASession);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "bundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
      v11 = *(void **)(*(_QWORD *)(a1 + 40) + 120);
    -[DASession setBundleID:](v9, "setBundleID:", v11);

    -[DASession setClientID:](v9, "setClientID:", *(unsigned int *)(*(_QWORD *)(a1 + 40) + 60));
    CUXPCEncodeObject();
    CUXPCEncodeObject();
    CUXPCEncodeObject();
    objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
    v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 48);
    v14 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 64);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __63__DADiscovery_setDeviceAppAccessInfo_device_completionHandler___block_invoke_2;
    handler[3] = &unk_24D169390;
    v19 = v13;
    v20 = *(id *)(a1 + 56);
    xpc_connection_send_message_with_reply(v12, v8, v14, handler);

  }
  else
  {
    v15 = *(_QWORD *)(a1 + 56);
    DAErrorF(350001, (uint64_t)"Device missing accessory setup flag", v2, v3, v4, v5, v6, v7, v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v17);

  }
}

void __63__DADiscovery_setDeviceAppAccessInfo_device_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  id v5;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v2;
  if (gLogCategory_DADiscovery <= 30)
  {
    if (gLogCategory_DADiscovery != -1 || (v3 = _LogCategory_Initialize(), v2 = (uint64_t)v5, v3))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v2 = (uint64_t)v5;
    }
  }
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v2);

}

- (void)modifyDeviceWithIdentifier:(id)a3 settings:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __69__DADiscovery_modifyDeviceWithIdentifier_settings_completionHandler___block_invoke;
  v15[3] = &unk_24D1694A8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

void __69__DADiscovery_modifyDeviceWithIdentifier_settings_completionHandler___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  DASession *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  _xpc_connection_s *v9;
  NSObject *v10;
  _QWORD handler[4];
  id v12;

  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = objc_alloc_init(DASession);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  -[DASession setBundleID:](v3, "setBundleID:", v5);

  -[DASession setClientID:](v3, "setClientID:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 60));
  xpc_dictionary_set_string(v2, "mTyp", "MdSt");
  v6 = *(void **)(a1 + 40);
  v7 = v2;
  v8 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  if (v8)
    xpc_dictionary_set_string(v7, "id", v8);

  CUXPCEncodeObject();
  CUXPCEncodeObject();
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __69__DADiscovery_modifyDeviceWithIdentifier_settings_completionHandler___block_invoke_2;
  handler[3] = &unk_24D1693E0;
  v12 = *(id *)(a1 + 56);
  xpc_connection_send_message_with_reply(v9, v7, v10, handler);

}

void __69__DADiscovery_modifyDeviceWithIdentifier_settings_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)reportDeviceChanged:(id)a3 appID:(id)a4
{
  id v5;
  DADeviceEvent *v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = -[DAEventDevice initWithEventType:device:]([DADeviceEvent alloc], "initWithEventType:device:", 42, v5);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_extensions;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "reportEventToExtension:", v6, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)xpcReceivedMessage:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  OS_xpc_object *xpcCnx;
  DADiscovery *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  v18 = v4;
  if (gLogCategory_DADiscovery <= 9)
  {
    if (gLogCategory_DADiscovery != -1 || (v5 = _LogCategory_Initialize(), v4 = v18, v5))
    {
      CUPrintXPC();
      v15 = self;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v4 = v18;
    }
  }
  if (MEMORY[0x2199CAB58](v4) == MEMORY[0x24BDACFA0])
  {
    -[DADiscovery _xpcReceivedMessage:](self, "_xpcReceivedMessage:", v18);
  }
  else if (v18 == (id)MEMORY[0x24BDACF30])
  {
    -[DADiscovery _interrupted](self, "_interrupted");
  }
  else if (v18 == (id)MEMORY[0x24BDACF38])
  {
    if (!self->_invalidateCalled
      && gLogCategory_DADiscovery <= 90
      && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    -[DADiscovery _invalidated](self, "_invalidated");
  }
  else
  {
    DAErrorF(350000, (uint64_t)"XPC event error", v6, v7, v8, v9, v10, v11, (uint64_t)v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintXPC();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
  }

}

- (void)_xpcReceivedMessage:(id)a3
{
  const char *string;
  id v5;

  v5 = a3;
  string = xpc_dictionary_get_string(v5, "mTyp");
  if (string)
  {
    if (!strcmp(string, "Evnt"))
    {
      -[DADiscovery _xpcReceivedDAEvent:](self, "_xpcReceivedDAEvent:", v5);
      goto LABEL_13;
    }
    if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
      goto LABEL_8;
  }
  else if (gLogCategory_DADiscovery <= 90
         && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  {
LABEL_8:
    LogPrintF();
  }
LABEL_13:

}

- (void)_xpcReceivedDAEvent:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v4 = a3;
  if (MEMORY[0x2199CAB58]() == MEMORY[0x24BDACFA0])
  {
    v11 = 0;
    v5 = +[DAEvent allocInitWithXPCObject:error:](DAEvent, "allocInitWithXPCObject:error:", v4, &v11);
    v6 = v11;
    if (!v5)
    {
      if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      goto LABEL_14;
    }
    if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    {
      v9 = v5;
      LogPrintF();
    }
    if ((unint64_t)(objc_msgSend(v5, "eventType", v9) - 40) <= 2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (gLogCategory_DADiscovery <= 90
            && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          goto LABEL_14;
        }
      }
      -[DADiscovery _xpcReceivedDeviceEvent:](self, "_xpcReceivedDeviceEvent:", v5);
    }
    v7 = _Block_copy(self->_eventHandler);
    v8 = v7;
    if (v7)
      (*((void (**)(void *, id))v7 + 2))(v7, v5);

LABEL_14:
    goto LABEL_15;
  }
  if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    LogPrintF();
LABEL_15:

}

- (void)_xpcReceivedDeviceEvent:(id)a3
{
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *deviceMap;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    os_unfair_lock_lock(&self->_lock);
    if (!self->_deviceMap)
    {
      v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      deviceMap = self->_deviceMap;
      self->_deviceMap = v6;

    }
    if (objc_msgSend(v9, "eventType") == 41)
      v8 = 0;
    else
      v8 = v4;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", v8, v5);
    os_unfair_lock_unlock(&self->_lock);
  }
  else if (gLogCategory_DADiscovery <= 90
         && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)_findExtensionPoint:(id)a3 bundleID:(id)a4 entitlement:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC79E8]), "initWithExtensionPointIdentifier:", v10);
  v15 = (void *)MEMORY[0x24BDC79F0];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __67__DADiscovery__findExtensionPoint_bundleID_entitlement_completion___block_invoke;
  v20[3] = &unk_24D1694F8;
  v20[4] = self;
  v21 = v10;
  v23 = v12;
  v24 = v13;
  v22 = v11;
  v16 = v12;
  v17 = v11;
  v18 = v13;
  v19 = v10;
  objc_msgSend(v15, "executeQuery:completionHandler:", v14, v20);

}

void __67__DADiscovery__findExtensionPoint_bundleID_entitlement_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__DADiscovery__findExtensionPoint_bundleID_entitlement_completion___block_invoke_2;
  v7[3] = &unk_24D1694D0;
  v8 = v4;
  v9 = v3;
  v10 = *(_QWORD *)(a1 + 32);
  v13 = *(id *)(a1 + 64);
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __67__DADiscovery__findExtensionPoint_bundleID_entitlement_completion___block_invoke_2(uint64_t a1)
{
  if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(*(id *)(a1 + 40), "count");
    LogPrintF();
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 32) || !objc_msgSend(*(id *)(a1 + 40), "count"))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 48), "_startExtensions:bundleID:entitlement:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)_startExtensions:(id)a3 bundleID:(id)a4 entitlement:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void (**v25)(id, void *);
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v25 = (void (**)(id, void *))a6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
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
        v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v18, "bundleIdentifier", v23, v24);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringByDeletingPathExtension");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 && (objc_msgSend(v20, "isEqual:", v12) & 1) == 0)
        {
          if (gLogCategory_DADiscovery <= 30
            && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
          {
            v23 = v12;
            v24 = v20;
            LogPrintF();
          }
        }
        else
        {
          objc_msgSend(v18, "entitlementNamed:ofClass:", v11, objc_opt_class());
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "BOOLValue");

          if ((v22 & 1) != 0)
          {
            objc_msgSend(v26, "addObject:", v18);
          }
          else if (gLogCategory_DADiscovery <= 30
                 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
          {
            objc_msgSend(v18, "bundleIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF();

          }
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v15);
  }

  if (v25)
    v25[2](v25, v26);

}

- (void)_stopExtensons
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_extensions;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[DADiscovery _uuidFromExtension:](self, "_uuidFromExtension:", v8, (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          -[DADiscovery _updateNEPolicy:remove:](self, "_updateNEPolicy:remove:", v9, 1);
        objc_msgSend(v8, "invalidate");

      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)_updateNEPolicy:(id)a3 remove:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableDictionary *policySessions;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  NSMutableDictionary *v85;
  NSMutableDictionary *v86;
  NSMutableDictionary *v87;
  void *v88;
  id v89;
  id v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  DADiscovery *v103;
  void *v104;
  id obj;
  id v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _QWORD v111[2];
  _QWORD v112[3];
  _QWORD v113[2];
  _QWORD v114[3];
  _QWORD v115[3];
  _BYTE v116[128];
  _QWORD v117[6];
  _QWORD v118[2];
  _QWORD v119[2];
  _QWORD v120[5];

  v4 = a4;
  v120[3] = *MEMORY[0x24BDAC8D0];
  v106 = a3;
  if (gLogCategory_DADiscovery <= 30 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
  {
    v89 = v106;
    LogPrintF();
  }
  if (v106)
  {
    if (v4)
    {
      policySessions = self->_policySessions;
      objc_msgSend(v106, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](policySessions, "objectForKeyedSubscript:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        if ((objc_msgSend(v8, "removeAllPolicies") & 1) == 0
          && gLogCategory_DADiscovery <= 90
          && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        {
          v89 = v106;
          LogPrintF();
        }
        if ((objc_msgSend(v8, "apply", v89) & 1) == 0
          && gLogCategory_DADiscovery <= 90
          && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        {
          v90 = v106;
          LogPrintF();
        }
        v16 = self->_policySessions;
        objc_msgSend(v106, "UUIDString", v90);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", 0, v17);

        if (gLogCategory_DADiscovery <= 30
          && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSObjectOneLine();
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

        }
        goto LABEL_84;
      }
      if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        goto LABEL_94;
    }
    else
    {
      v8 = objc_alloc_init(MEMORY[0x24BDE2728]);
      if (v8)
      {
        v9 = objc_alloc(MEMORY[0x24BDE2710]);
        objc_msgSend(MEMORY[0x24BDE2720], "skipWithOrder:", 20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDE2718], "allInterfaces");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v120[0] = v11;
        objc_msgSend(MEMORY[0x24BDE2718], "customEntitlement:", CFSTR("com.apple.developer.media-device-discovery-extension"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v120[1] = v12;
        objc_msgSend(MEMORY[0x24BDE2718], "effectiveApplication:", v106);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v120[2] = v13;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v120, 3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v9, "initWithOrder:result:conditions:", 0, v10, v14);

        v102 = (void *)v15;
        if (!objc_msgSend(v8, "addPolicy:", v15)
          && gLogCategory_DADiscovery <= 90
          && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        {
          v89 = v106;
          LogPrintF();
        }
        v18 = objc_alloc(MEMORY[0x24BDE2710]);
        objc_msgSend(MEMORY[0x24BDE2720], "skipWithOrder:", 100);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDE2718], "allInterfaces");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v119[0] = v20;
        objc_msgSend(MEMORY[0x24BDE2718], "effectiveApplication:", v106);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v119[1] = v21;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v119, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v18, "initWithOrder:result:conditions:", 10, v19, v22);

        v101 = (void *)v23;
        if (!objc_msgSend(v8, "addPolicy:", v23)
          && gLogCategory_DADiscovery <= 90
          && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        {
          v89 = v106;
          LogPrintF();
        }
        v103 = self;
        v24 = objc_alloc(MEMORY[0x24BDE2710]);
        objc_msgSend(MEMORY[0x24BDE2720], "skipWithOrder:", 65);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDE2718], "allInterfaces");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v118[0] = v26;
        objc_msgSend(MEMORY[0x24BDE2718], "schemeUsingPort:", 53);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v118[1] = v27;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v118, 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v24, "initWithOrder:result:conditions:", 25, v25, v28);

        v100 = (void *)v29;
        if (!objc_msgSend(v8, "addPolicy:", v29)
          && gLogCategory_DADiscovery <= 90
          && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        {
          v89 = v106;
          LogPrintF();
        }
        v30 = (void *)MEMORY[0x24BDE2718];
        objc_msgSend(MEMORY[0x24BDE07C0], "endpointWithHostname:port:", CFSTR("224.0.0.0"), CFSTR("0"), v89);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "remoteAddress:prefix:", v31, 4);
        v104 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = (void *)MEMORY[0x24BDE2718];
        objc_msgSend(MEMORY[0x24BDE07C0], "endpointWithHostname:port:", CFSTR("ff00::"), CFSTR("0"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "remoteAddress:prefix:", v33, 8);
        v34 = objc_claimAutoreleasedReturnValue();

        v35 = (void *)MEMORY[0x24BDE2718];
        objc_msgSend(MEMORY[0x24BDE07C0], "endpointWithHostname:port:", CFSTR("255.255.255.255"), CFSTR("0"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "remoteAddress:prefix:", v36, 32);
        v37 = objc_claimAutoreleasedReturnValue();

        v38 = (void *)MEMORY[0x24BDE2718];
        objc_msgSend(MEMORY[0x24BDE07C0], "endpointWithHostname:port:", CFSTR("224.0.0.0"), CFSTR("0"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "localAddress:prefix:", v39, 4);
        v40 = objc_claimAutoreleasedReturnValue();

        v41 = (void *)MEMORY[0x24BDE2718];
        objc_msgSend(MEMORY[0x24BDE07C0], "endpointWithHostname:port:", CFSTR("ff00::"), CFSTR("0"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "localAddress:prefix:", v42, 8);
        v43 = objc_claimAutoreleasedReturnValue();

        v44 = (void *)MEMORY[0x24BDE2718];
        objc_msgSend(MEMORY[0x24BDE07C0], "endpointWithHostname:port:", CFSTR("255.255.255.255"), CFSTR("0"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "localAddress:prefix:", v45, 32);
        v46 = objc_claimAutoreleasedReturnValue();

        v117[0] = v104;
        v117[1] = v34;
        v98 = (void *)v37;
        v99 = (void *)v34;
        v117[2] = v37;
        v117[3] = v40;
        v96 = (void *)v43;
        v97 = (void *)v40;
        v117[4] = v43;
        v117[5] = v46;
        v95 = (void *)v46;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v117, 6);
        v107 = 0u;
        v108 = 0u;
        v109 = 0u;
        v110 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v116, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v108;
          do
          {
            for (i = 0; i != v48; ++i)
            {
              if (*(_QWORD *)v108 != v49)
                objc_enumerationMutation(obj);
              v51 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * i);
              v52 = objc_alloc(MEMORY[0x24BDE2710]);
              objc_msgSend(MEMORY[0x24BDE2720], "skipWithOrder:", 50);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDE2718], "allInterfaces");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v115[0] = v54;
              objc_msgSend(MEMORY[0x24BDE2718], "effectiveApplication:", v106);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v115[1] = v55;
              v115[2] = v51;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v115, 3);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = (void *)objc_msgSend(v52, "initWithOrder:result:conditions:", 30, v53, v56);

              if (!objc_msgSend(v8, "addPolicy:", v57)
                && gLogCategory_DADiscovery <= 90
                && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
              {
                v92 = v106;
                LogPrintF();
              }

            }
            v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v116, 16);
          }
          while (v48);
        }

        v58 = objc_alloc(MEMORY[0x24BDE2710]);
        objc_msgSend(MEMORY[0x24BDE2720], "skipWithOrder:", 100);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDE2718], "allInterfaces");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v114[0] = v60;
        objc_msgSend(MEMORY[0x24BDE2718], "localNetworks");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v114[1] = v61;
        objc_msgSend(MEMORY[0x24BDE2718], "effectiveApplication:", v106);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v114[2] = v62;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v114, 3);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = (void *)objc_msgSend(v58, "initWithOrder:result:conditions:", 35, v59, v63);

        if (!objc_msgSend(v8, "addPolicy:", v64)
          && gLogCategory_DADiscovery <= 90
          && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        {
          v92 = v106;
          LogPrintF();
        }
        v65 = objc_alloc(MEMORY[0x24BDE2710]);
        objc_msgSend(MEMORY[0x24BDE2720], "drop");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDE2718], "allInterfaces");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v113[0] = v67;
        objc_msgSend(MEMORY[0x24BDE2718], "effectiveApplication:", v106);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v113[1] = v68;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v113, 2);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v65, "initWithOrder:result:conditions:", 40, v66, v69);

        v94 = (void *)v70;
        if (!objc_msgSend(v8, "addPolicy:", v70)
          && gLogCategory_DADiscovery <= 90
          && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        {
          v92 = v106;
          LogPrintF();
        }
        v71 = objc_alloc(MEMORY[0x24BDE2710]);
        objc_msgSend(MEMORY[0x24BDE2720], "skipWithOrder:", 100);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDE2718], "allInterfaces");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v112[0] = v73;
        objc_msgSend(MEMORY[0x24BDE2718], "customEntitlement:", CFSTR("com.apple.developer.networking.multicast"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v112[1] = v74;
        objc_msgSend(MEMORY[0x24BDE2718], "effectiveApplication:", v106);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v112[2] = v75;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v112, 3);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = objc_msgSend(v71, "initWithOrder:result:conditions:", 60, v72, v76);

        v78 = (void *)v77;
        if (!objc_msgSend(v8, "addPolicy:", v77)
          && gLogCategory_DADiscovery <= 90
          && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        {
          v92 = v106;
          LogPrintF();
        }
        v79 = objc_alloc(MEMORY[0x24BDE2710]);
        objc_msgSend(MEMORY[0x24BDE2720], "drop");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDE2718], "allInterfaces");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v111[0] = v81;
        objc_msgSend(MEMORY[0x24BDE2718], "effectiveApplication:", v106);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v111[1] = v82;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v111, 2);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = (void *)objc_msgSend(v79, "initWithOrder:result:conditions:", 70, v80, v83);

        if (!objc_msgSend(v8, "addPolicy:", v84)
          && gLogCategory_DADiscovery <= 90
          && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        {
          v92 = v106;
          LogPrintF();
        }
        if ((objc_msgSend(v8, "apply", v92) & 1) != 0)
        {
          v85 = v103->_policySessions;
          if (!v85)
          {
            v86 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
            v87 = v103->_policySessions;
            v103->_policySessions = v86;

            v85 = v103->_policySessions;
          }
          objc_msgSend(v106, "UUIDString");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v85, "setObject:forKeyedSubscript:", v8, v88);

          if (gLogCategory_DADiscovery <= 30
            && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
          {
            CUPrintNSObjectOneLine();
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF();

          }
        }
        else if (gLogCategory_DADiscovery <= 90
               && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }

        goto LABEL_84;
      }
      if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
LABEL_94:
        LogPrintF();
    }
LABEL_84:

    goto LABEL_85;
  }
  if (gLogCategory_DADiscovery <= 90 && (gLogCategory_DADiscovery != -1 || _LogCategory_Initialize()))
    LogPrintF();
LABEL_85:

}

- (id)_uuidFromExtension:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD applier[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  objc_msgSend(v3, "ekExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    v6 = NEHelperCacheCopyAppUUIDMapping();
    v7 = (void *)v6;
    if (v6 && MEMORY[0x2199CAB58](v6) == MEMORY[0x24BDACF78])
    {
      applier[0] = MEMORY[0x24BDAC760];
      applier[1] = 3221225472;
      applier[2] = __34__DADiscovery__uuidFromExtension___block_invoke;
      applier[3] = &unk_24D169520;
      applier[4] = &v11;
      xpc_array_apply(v7, applier);
    }

  }
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __34__DADiscovery__uuidFromExtension___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  const uint8_t *bytes;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (MEMORY[0x2199CAB58]() == MEMORY[0x24BDAD000])
  {
    bytes = xpc_uuid_get_bytes(v4);
    if (bytes)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", bytes);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
  }

  return 1;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (double)activateTimeInterval
{
  return self->_activateTimeInterval;
}

- (void)setActivateTimeInterval:(double)a3
{
  self->_activateTimeInterval = a3;
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (DADiscoveryConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (NSArray)configurations
{
  return self->_configurations;
}

- (void)setConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_configurations, a3);
}

- (BOOL)direct
{
  return self->_direct;
}

- (void)setDirect:(BOOL)a3
{
  self->_direct = a3;
}

- (OS_xpc_object)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
  objc_storeStrong((id *)&self->_xpcCnx, a3);
}

- (OS_xpc_object)xpcListenerEndpoint
{
  return self->_xpcListenerEndpoint;
}

- (void)setXpcListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, a3);
}

- (DAAppContext)appContext
{
  return self->_appContext;
}

- (void)setAppContext:(id)a3
{
  objc_storeStrong((id *)&self->_appContext, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_policySessions, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
}

@end
