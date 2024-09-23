@implementation DADeviceResolver

- (DADeviceResolver)init
{
  DADeviceResolver *v2;
  DADeviceResolver *v3;
  DADeviceResolver *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DADeviceResolver;
  v2 = -[DADeviceResolver init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v4 = v3;
  }

  return v3;
}

- (id)description
{
  return -[DADeviceResolver descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableDictionary *devices;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (a3 < 0x15u)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__1;
    v16 = __Block_byref_object_dispose__1;
    v17 = 0;
    v11[5] = 0;
    v5 = objc_opt_class();
    v6 = -[NSMutableDictionary count](self->_devices, "count");
    v10 = -[NSMutableDictionary count](self->_endpoints, "count");
    NSAppendPrintF();
    objc_storeStrong(&v17, 0);
    devices = self->_devices;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __41__DADeviceResolver_descriptionWithLevel___block_invoke;
    v11[3] = &unk_24D169118;
    v11[4] = &v12;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](devices, "enumerateKeysAndObjectsUsingBlock:", v11, v5, v6, v10);
    v8 = (__CFString *)v13[5];
    if (!v8)
      v8 = &stru_24D169BB8;
    v9 = v8;
    _Block_object_dispose(&v12, 8);

    return v9;
  }
  else
  {
    objc_opt_class();
    -[NSMutableDictionary count](self->_devices, "count");
    -[NSMutableDictionary count](self->_endpoints, "count");
    NSPrintF();
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void __41__DADeviceResolver_descriptionWithLevel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  id obj;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v5, "endpoints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_opt_class();
  objc_msgSend(v5, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v7, "count");
  NSAppendPrintF();

  objc_storeStrong((id *)(v8 + 40), obj);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __41__DADeviceResolver_descriptionWithLevel___block_invoke_2;
  v12[3] = &unk_24D1690F0;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v12, v9, v6, v10, v11);

}

void __41__DADeviceResolver_descriptionWithLevel___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  v6 = a3;
  v7 = a2;
  objc_opt_class();
  objc_msgSend(v6, "airplayDeviceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bonjourName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bonjourType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bonjourInterfaceIndex");
  objc_msgSend(v6, "bonjourHostname");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ipv4String");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selected");

  NSAppendPrintF();
  objc_storeStrong((id *)(v4 + 40), v5);

}

- (void)addEndpoint:(id)a3
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
  v7[2] = __32__DADeviceResolver_addEndpoint___block_invoke;
  v7[3] = &unk_24D169140;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __32__DADeviceResolver_addEndpoint___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addEndpoint:", *(_QWORD *)(a1 + 40));
}

- (void)_addEndpoint:(id)a3
{
  void *v4;
  DAEndpoint *v5;
  DAEndpoint *v6;
  id v7;

  v7 = a3;
  -[DADeviceResolver _ensureInitialized](self, "_ensureInitialized");
  objc_msgSend(v7, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_endpoints, "objectForKeyedSubscript:", v4);
    v5 = (DAEndpoint *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = objc_alloc_init(DAEndpoint);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_endpoints, "setObject:forKeyedSubscript:", v5, v4);
    }
    -[DAEndpoint updateWithEndpoint:](v5, "updateWithEndpoint:", v7);
    -[DAEndpoint setAddTicks:](v5, "setAddTicks:", mach_absolute_time());
    if (gLogCategory_DADeviceResolver <= 30
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      v6 = v5;
      LogPrintF();
    }
    -[DADeviceResolver _startResolvingEndpoint:](self, "_startResolvingEndpoint:", v5, v6);
    -[CUCoalescer trigger](self->_coalescer, "trigger");

  }
  else if (gLogCategory_DADeviceResolver <= 90
         && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)removeEndpoint:(id)a3
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
  v7[2] = __35__DADeviceResolver_removeEndpoint___block_invoke;
  v7[3] = &unk_24D169140;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __35__DADeviceResolver_removeEndpoint___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeEndpoint:", *(_QWORD *)(a1 + 40));
}

- (void)_removeEndpoint:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  DADeviceEvent *v10;
  DADeviceEvent *v11;
  DADeviceEvent *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[DADeviceResolver _ensureInitialized](self, "_ensureInitialized");
  objc_msgSend(v15, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_endpoints, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_endpoints, "setObject:forKeyedSubscript:", 0, v4);
      objc_msgSend(v5, "parentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "endpoints");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v8, "mutableCopy");

        objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v4);
        objc_msgSend(v7, "setEndpoints:", v9);
        if (objc_msgSend(v9, "count"))
        {
          if (gLogCategory_DADeviceResolver <= 30
            && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v10 = -[DAEventDevice initWithEventType:device:]([DADeviceEvent alloc], "initWithEventType:device:", 40, v7);
          v11 = (DADeviceEvent *)_Block_copy(self->_eventHandler);
          v12 = v11;
          if (v11)
            ((void (*)(DADeviceEvent *, DADeviceEvent *))v11->super.super._error)(v11, v10);
        }
        else
        {
          objc_msgSend(v7, "identifier");
          v10 = (DADeviceEvent *)objc_claimAutoreleasedReturnValue();
          if (v10)
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devices, "setObject:forKeyedSubscript:", 0, v10);
          if (gLogCategory_DADeviceResolver <= 30
            && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v12 = -[DAEventDevice initWithEventType:device:]([DADeviceEvent alloc], "initWithEventType:device:", 41, v7);
          v13 = _Block_copy(self->_eventHandler);
          v14 = v13;
          if (v13)
            (*((void (**)(void *, DADeviceEvent *))v13 + 2))(v13, v12);

        }
      }

    }
  }
  else if (gLogCategory_DADeviceResolver <= 90
         && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)selectEndpoint:(id)a3
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
  v7[2] = __35__DADeviceResolver_selectEndpoint___block_invoke;
  v7[3] = &unk_24D169140;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __35__DADeviceResolver_selectEndpoint___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_selectEndpoint:", *(_QWORD *)(a1 + 40));
}

- (void)_selectEndpoint:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  DAEndpoint *v11;
  id v12;
  id v13;

  v13 = a3;
  -[DADeviceResolver _ensureInitialized](self, "_ensureInitialized");
  if (!v13)
  {
    v9 = 0;
    v7 = 0;
    v5 = 0;
LABEL_7:
    if (self->_bundleID)
    {
      if (gLogCategory_DADeviceResolver <= 30
        && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
      {
        v12 = v13;
        LogPrintF();
      }
      objc_msgSend(v7, "persistentDictionaryRepresentation", v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        v11 = -[DAEndpoint initWithPersistentDictionaryRepresentation:error:]([DAEndpoint alloc], "initWithPersistentDictionaryRepresentation:error:", v10, 0);
      else
        v11 = 0;
      -[DADeviceResolver _updateSelectedEndpoint:](self, "_updateSelectedEndpoint:", v11);

    }
    else if (gLogCategory_DADeviceResolver <= 90
           && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_16;
  }
  objc_msgSend(v13, "identifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_endpoints, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "protocolTypeString");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        goto LABEL_7;
      }
      if (gLogCategory_DADeviceResolver <= 90
        && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v9 = 0;
    }
    else
    {
      if (gLogCategory_DADeviceResolver <= 90
        && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v9 = 0;
      v7 = 0;
    }
  }
  else
  {
    if (gLogCategory_DADeviceResolver <= 90
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v9 = 0;
    v7 = 0;
    v5 = 0;
  }
LABEL_16:

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__DADeviceResolver_invalidate__block_invoke;
  block[3] = &unk_24D169168;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __30__DADeviceResolver_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  _DNSServiceRef_t *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 40))
  {
    v2 = result;
    *(_BYTE *)(v1 + 40) = 1;
    if (gLogCategory_DADeviceResolver <= 30
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      v12 = *(_QWORD *)(v2 + 32);
      LogPrintF();
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = *(id *)(*(_QWORD *)(v2 + 32) + 96);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "invalidate", v12);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v5);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 96), "removeAllObjects");
    v8 = *(_QWORD *)(v2 + 32);
    v9 = *(_DNSServiceRef_t **)(v8 + 8);
    if (v9)
    {
      DNSServiceRefDeallocate(v9);
      *(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) = 0;
      v8 = *(_QWORD *)(v2 + 32);
    }
    objc_msgSend(*(id *)(v8 + 88), "invalidate", v12);
    v10 = *(_QWORD *)(v2 + 32);
    v11 = *(void **)(v10 + 88);
    *(_QWORD *)(v10 + 88) = 0;

    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

- (void)_invalidated
{
  id eventHandler;

  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    -[DADeviceResolver _reportEventType:](self, "_reportEventType:", 20);
    eventHandler = self->_eventHandler;
    self->_eventHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_DADeviceResolver <= 30
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_ensureInitialized
{
  _BOOL4 v3;
  NSMutableArray *v4;
  NSMutableArray *selectedEndpoints;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  DAEndpoint *v15;
  NSString *v16;
  NSString *selectedProtocolStr;
  _DNSServiceRef_t **p_bonjourSharedService;
  CUCoalescer *v19;
  CUCoalescer *coalescer;
  CUCoalescer *v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *endpoints;
  NSMutableSet *v24;
  NSMutableSet *resolveOperations;
  void *v26;
  _QWORD v27[6];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  int v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (gLogCategory_DADeviceResolver <= 30
    && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_prefsInitialized)
  {
    if (gLogCategory_DADeviceResolver <= 30
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_prefsInitialized = 1;
    v32 = 0;
    v3 = CFPrefs_GetInt64() != 0;
    if (self->_prefNameBasedSelect != v3)
    {
      if (gLogCategory_DADeviceResolver <= 30
        && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_prefNameBasedSelect = v3;
    }
    if (!self->_selectedEndpoints)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      selectedEndpoints = self->_selectedEndpoints;
      self->_selectedEndpoints = v4;

    }
    v6 = self->_bundleID;
    if (v6)
    {
      if (gLogCategory_DADeviceResolver <= 30
        && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v7 = (void *)MEMORY[0x24BDBCEB8];
      NSPrintF();
      CFArrayGetTypeID();
      v8 = (void *)CFPrefs_CopyTypedValue();
      objc_msgSend(v7, "arrayWithArray:", v8, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        if (gLogCategory_DADeviceResolver <= 30
          && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        NSPrintF();
        CFDictionaryGetTypeID();

      }
      if (gLogCategory_DADeviceResolver <= 30
        && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v29 != v13)
              objc_enumerationMutation(v10);
            v15 = -[DAEndpoint initWithPersistentDictionaryRepresentation:error:]([DAEndpoint alloc], "initWithPersistentDictionaryRepresentation:error:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), 0);
            -[NSMutableArray addObject:](self->_selectedEndpoints, "addObject:", v15);
            if (!self->_selectedProtocolStr)
            {
              -[DAEndpoint protocolTypeString](v15, "protocolTypeString");
              v16 = (NSString *)objc_claimAutoreleasedReturnValue();
              selectedProtocolStr = self->_selectedProtocolStr;
              self->_selectedProtocolStr = v16;

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v12);
      }

    }
    if (gLogCategory_DADeviceResolver <= 30
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (self->_selectedEndpoints)
      -[CUCoalescer trigger](self->_coalescer, "trigger");

  }
  p_bonjourSharedService = &self->_bonjourSharedService;
  if (!self->_bonjourSharedService)
  {
    if (DNSServiceCreateConnection(&self->_bonjourSharedService)
      && gLogCategory_DADeviceResolver <= 90
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      CUPrintErrorCode();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    if (*p_bonjourSharedService)
      DNSServiceSetDispatchQueue(*p_bonjourSharedService, (dispatch_queue_t)self->_dispatchQueue);
  }
  if (!self->_coalescer)
  {
    self->_coalesceMinTicks = SecondsToUpTicksF();
    v19 = (CUCoalescer *)objc_alloc_init(MEMORY[0x24BE297A0]);
    coalescer = self->_coalescer;
    self->_coalescer = v19;
    v21 = v19;

    -[CUCoalescer setDispatchQueue:](v21, "setDispatchQueue:", self->_dispatchQueue);
    -[CUCoalescer setMinDelay:](v21, "setMinDelay:", 0.1);
    -[CUCoalescer setMaxDelay:](v21, "setMaxDelay:", 0.3);
    -[CUCoalescer setLeeway:](v21, "setLeeway:", 0.05);
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __38__DADeviceResolver__ensureInitialized__block_invoke;
    v27[3] = &unk_24D169140;
    v27[4] = v21;
    v27[5] = self;
    -[CUCoalescer setActionHandler:](v21, "setActionHandler:", v27);

  }
  if (!self->_endpoints)
  {
    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    endpoints = self->_endpoints;
    self->_endpoints = v22;

  }
  if (!self->_resolveOperations)
  {
    v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    resolveOperations = self->_resolveOperations;
    self->_resolveOperations = v24;

  }
}

_QWORD *__38__DADeviceResolver__ensureInitialized__block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v2 == result[11])
    return (_QWORD *)objc_msgSend(result, "_evaluateEndpoints");
  return result;
}

- (void)_evaluateEndpoints
{
  uint64_t v3;
  NSMutableDictionary *endpoints;
  _QWORD v5[8];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  _QWORD v10[3];
  int v11;

  v3 = mach_absolute_time();
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  endpoints = self->_endpoints;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__DADeviceResolver__evaluateEndpoints__block_invoke;
  v5[3] = &unk_24D1691B8;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = v10;
  v5[7] = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](endpoints, "enumerateKeysAndObjectsUsingBlock:", v5);
  -[DADeviceResolver _updateSelectedEndpoint:](self, "_updateSelectedEndpoint:", 0);
  if (gLogCategory_DADeviceResolver <= 30
    && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    -[NSMutableDictionary count](self->_endpoints, "count");
    mach_absolute_time();
    UpTicksToMicroseconds();
    LogPrintF();
  }
  if (*((_DWORD *)v7 + 6))
    -[CUCoalescer trigger](self->_coalescer, "trigger");
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);
}

void __38__DADeviceResolver__evaluateEndpoints__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *, _BYTE *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 56);
  if ((unint64_t)(v7 - objc_msgSend(v6, "addTicks")) >= *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(v6, "parentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && objc_msgSend(v6, "grouped"))
    {
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }
    else
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x3032000000;
      v20 = __Block_byref_object_copy__1;
      v21 = __Block_byref_object_dispose__1;
      v22 = 0;
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      v11 = MEMORY[0x24BDAC760];
      v12 = 3221225472;
      v13 = __38__DADeviceResolver__evaluateEndpoints__block_invoke_2;
      v14 = &unk_24D169190;
      v10 = v6;
      v15 = v10;
      v16 = &v17;
      objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &v11);
      if (v18[5])
      {
        objc_msgSend(*(id *)(a1 + 32), "_groupEndpoint:matchedEndpoint:", v10, v11, v12, v13, v14);
        ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      }
      else if (!v8)
      {
        objc_msgSend(*(id *)(a1 + 32), "_reportDeviceWithSoloEndpoint:", v10, v11, v12, v13, v14);
      }

      _Block_object_dispose(&v17, 8);
    }

  }
  else
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

void __38__DADeviceResolver__evaluateEndpoints__block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = *(id *)(a1 + 32);
  if (v8 != v7 && objc_msgSend(v8, "sameDeviceAsEndpoint:", v7))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

- (void)_groupEndpoint:(id)a3 matchedEndpoint:(id)a4
{
  id v6;
  id v7;
  DADevice *v8;
  DADevice *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSMutableDictionary *devices;
  NSMutableDictionary *v20;
  NSMutableDictionary *v21;
  void *v22;
  void *v23;
  void *v24;
  DADeviceEvent *v25;
  void *v26;
  void *v27;
  DADeviceEvent *v28;
  void *v29;
  void *v30;
  NSObject *dispatchQueue;
  id v32;
  id v33;
  DADevice *v34;
  _QWORD block[4];
  id v36;
  DADeviceResolver *v37;
  id v38;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "mergeMissingInfoFromEndpoint:", v7);
  objc_msgSend(v7, "mergeMissingInfoFromEndpoint:", v6);
  objc_msgSend(v7, "parentDevice");
  v8 = (DADevice *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    -[DADevice endpoints](v8, "endpoints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");
    v12 = v11;
    if (v11)
      v13 = v11;
    else
      v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v15 = v13;

    objc_msgSend(v6, "identifier");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v6, v16);
    -[DADevice setEndpoints:](v9, "setEndpoints:", v15);
  }
  else
  {
    v9 = objc_alloc_init(DADevice);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[DADevice setIdentifier:](v9, "setIdentifier:", v15);
    objc_msgSend(v7, "setParentDevice:", v9);
    v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v6, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v6, v17);
    objc_msgSend(v7, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v7, v18);
    -[DADevice setEndpoints:](v9, "setEndpoints:", v16);
    devices = self->_devices;
    if (!devices)
    {
      v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v21 = self->_devices;
      self->_devices = v20;

      devices = self->_devices;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v9, v15);

  }
  objc_msgSend(v6, "parentDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    objc_msgSend(v22, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devices, "setObject:forKeyedSubscript:", 0, v24);
    if (gLogCategory_DADeviceResolver <= 30
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      v34 = v9;
      LogPrintF();
    }
    v25 = -[DAEventDevice initWithEventType:device:]([DADeviceEvent alloc], "initWithEventType:device:", 41, v23);
    v26 = _Block_copy(self->_eventHandler);
    v27 = v26;
    if (v26)
      (*((void (**)(void *, DADeviceEvent *))v26 + 2))(v26, v25);

  }
  objc_msgSend(v6, "setParentDevice:", v9, v34);
  objc_msgSend(v6, "setGrouped:", 1);
  objc_msgSend(v7, "setGrouped:", 1);
  if (gLogCategory_DADeviceResolver <= 30
    && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v28 = -[DAEventDevice initWithEventType:device:]([DADeviceEvent alloc], "initWithEventType:device:", 40, v9);
  v29 = _Block_copy(self->_eventHandler);
  v30 = v29;
  if (v29)
    (*((void (**)(void *, DADeviceEvent *))v29 + 2))(v29, v28);

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__DADeviceResolver__groupEndpoint_matchedEndpoint___block_invoke;
  block[3] = &unk_24D1691E0;
  v36 = v6;
  v37 = self;
  v38 = v7;
  v32 = v7;
  v33 = v6;
  dispatch_async(dispatchQueue, block);

}

void __51__DADeviceResolver__groupEndpoint_matchedEndpoint___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  __CFString *v36;
  uint64_t v37;
  id v38;
  _QWORD v39[11];
  _QWORD v40[13];

  v40[11] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "airplayDeviceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = &unk_24D1702A8;
  v4 = &unk_24D1702C0;
  if (!v2)
    v3 = &unk_24D1702C0;
  v38 = v3;

  objc_msgSend(*(id *)(a1 + 32), "underlyingDADevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v8, "length");

    v4 = &unk_24D1702A8;
  }
  else
  {
    v37 = 0;
  }
  v9 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
  if (v9)
    v36 = (__CFString *)objc_msgSend(v9, "copy");
  else
    v36 = CFSTR("NoBundleId");
  objc_msgSend(*(id *)(a1 + 32), "parentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "protocolType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v5, "protocolType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();
LABEL_16:

    v22 = &unk_24D1702A8;
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 32), "underlyingDADevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "protocolType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = *(void **)(a1 + 32);
LABEL_15:
    objc_msgSend(v17, "underlyingDADevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "protocolType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "identifier");
    v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 48), "underlyingDADevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "protocolType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v17 = *(void **)(a1 + 48);
    goto LABEL_15;
  }
  v13 = CFSTR("-");
  v22 = &unk_24D1702C0;
LABEL_17:
  objc_msgSend(*(id *)(a1 + 32), "bonjourFullName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v5;
  if (v23)
  {
    objc_msgSend(*(id *)(a1 + 32), "bonjourFullName");
    v34 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = CFSTR("no-full-name");
  }
  v25 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "underlyingDADevice", v34);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "numberWithBool:", objc_msgSend(v26, "supportsGrouping"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v39[0] = CFSTR("BundleID");
  v39[1] = CFSTR("SupportsAirPlay");
  v40[0] = v36;
  v40[1] = v38;
  v39[2] = CFSTR("SupportsBonjour");
  v39[3] = CFSTR("SupportsSSDP");
  v40[2] = v22;
  v40[3] = v4;
  v28 = (__CFString *)v13;
  v40[4] = v13;
  v39[4] = CFSTR("BonjourServices");
  v39[5] = CFSTR("SSDPURLLength");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v37);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40[5] = v29;
  v39[6] = CFSTR("SSDPProtocol");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v24, "protocol"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v40[6] = v30;
  v39[7] = CFSTR("DeviceFlags");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v24, "flags"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v40[7] = v31;
  v39[8] = CFSTR("DeviceType");
  DADeviceTypeToString(objc_msgSend(v24, "type"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v40[8] = v32;
  v40[9] = v27;
  v39[9] = CFSTR("SupportsGrouping");
  v39[10] = CFSTR("ProtocolType");
  v40[10] = v28;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  +[DADeviceAccessAnalytics sendAnalyticsInfo:forEvent:withDeviceIdentifier:](DADeviceAccessAnalytics, "sendAnalyticsInfo:forEvent:withDeviceIdentifier:", v33, CFSTR("com.apple.DeviceAccess.DeviceInfo"), v35);
}

- (void)_reportDeviceWithSoloEndpoint:(id)a3
{
  id v4;
  void *v5;
  DADevice *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *devices;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  DADeviceEvent *v13;
  void *v14;
  void *v15;
  NSObject *dispatchQueue;
  _QWORD block[4];
  id v18;
  DADeviceResolver *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(DADevice);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[DADevice setIdentifier:](v6, "setIdentifier:", v8);
    v20 = v5;
    v21[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DADevice setEndpoints:](v6, "setEndpoints:", v9);

    objc_msgSend(v4, "setParentDevice:", v6);
    devices = self->_devices;
    if (!devices)
    {
      v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v12 = self->_devices;
      self->_devices = v11;

      devices = self->_devices;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v6, v8);
    if (gLogCategory_DADeviceResolver <= 30
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v13 = -[DAEventDevice initWithEventType:device:]([DADeviceEvent alloc], "initWithEventType:device:", 40, v6);
    v14 = _Block_copy(self->_eventHandler);
    v15 = v14;
    if (v14)
      (*((void (**)(void *, DADeviceEvent *))v14 + 2))(v14, v13);

    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__DADeviceResolver__reportDeviceWithSoloEndpoint___block_invoke;
    block[3] = &unk_24D169140;
    v18 = v4;
    v19 = self;
    dispatch_async(dispatchQueue, block);

  }
}

void __50__DADeviceResolver__reportDeviceWithSoloEndpoint___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  uint64_t v34;
  id v35;
  _QWORD v36[11];
  _QWORD v37[13];

  v37[11] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "airplayDeviceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = &unk_24D1702A8;
  v4 = &unk_24D1702C0;
  if (!v2)
    v3 = &unk_24D1702C0;
  v35 = v3;

  objc_msgSend(*(id *)(a1 + 32), "underlyingDADevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v8, "length");

    v4 = &unk_24D1702A8;
  }
  else
  {
    v34 = 0;
  }
  v9 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
  if (v9)
    v33 = (__CFString *)objc_msgSend(v9, "copy");
  else
    v33 = CFSTR("NoBundleId");
  objc_msgSend(*(id *)(a1 + 32), "parentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "protocolType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v5, "protocolType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();
LABEL_13:

    v18 = &unk_24D1702A8;
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "underlyingDADevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "protocolType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 32), "underlyingDADevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "protocolType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  v13 = CFSTR("-");
  v18 = &unk_24D1702C0;
LABEL_14:
  objc_msgSend(*(id *)(a1 + 32), "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v32 = CFSTR("no-name");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "bonjourFullName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v5;
  if (v20)
  {
    objc_msgSend(*(id *)(a1 + 32), "bonjourFullName");
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = CFSTR("no-full-name");
  }
  v22 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "underlyingDADevice");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "numberWithBool:", objc_msgSend(v23, "supportsGrouping"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v36[0] = CFSTR("BundleID");
  v36[1] = CFSTR("SupportsAirPlay");
  v37[0] = v33;
  v37[1] = v35;
  v36[2] = CFSTR("SupportsBonjour");
  v36[3] = CFSTR("SupportsSSDP");
  v37[2] = v18;
  v37[3] = v4;
  v25 = (__CFString *)v13;
  v37[4] = v13;
  v36[4] = CFSTR("BonjourServices");
  v36[5] = CFSTR("SSDPURLLength");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v34);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37[5] = v26;
  v36[6] = CFSTR("SSDPProtocol");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v21, "protocol"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37[6] = v27;
  v36[7] = CFSTR("DeviceFlags");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v21, "flags"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v37[7] = v28;
  v36[8] = CFSTR("DeviceType");
  DADeviceTypeToString(objc_msgSend(v21, "type"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37[8] = v29;
  v37[9] = v24;
  v36[9] = CFSTR("SupportsGrouping");
  v36[10] = CFSTR("ProtocolType");
  v37[10] = v25;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 11);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  +[DADeviceAccessAnalytics sendAnalyticsInfo:forEvent:withDeviceIdentifier:](DADeviceAccessAnalytics, "sendAnalyticsInfo:forEvent:withDeviceIdentifier:", v30, CFSTR("com.apple.DeviceAccess.DeviceInfo"), v31);
}

- (void)_reportEvent:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_DADeviceResolver <= 30
    && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v4 = _Block_copy(self->_eventHandler);
  v5 = v4;
  if (v4)
    (*((void (**)(void *, id))v4 + 2))(v4, v6);

}

- (void)_reportEventType:(int64_t)a3
{
  DAEvent *v4;

  v4 = -[DAEvent initWithEventType:]([DAEvent alloc], "initWithEventType:", a3);
  -[DADeviceResolver _reportEvent:](self, "_reportEvent:", v4);

}

- (void)_updateSelectedEndpoint:(id)a3
{
  NSString *v4;
  _BOOL4 prefNameBasedSelect;
  NSString *v6;
  NSMutableDictionary *endpoints;
  NSString *v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableDictionary *v21;
  void (**v22)(void *, DADeviceEvent *);
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  DADeviceEvent *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  DADeviceEvent *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  NSString *bundleID;
  void *v42;
  void *v43;
  NSString *v44;
  DADeviceResolver *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[9];
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  NSString *v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  BOOL v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v4 = (NSString *)a3;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  prefNameBasedSelect = self->_prefNameBasedSelect;
  v87 = self->_prefNameBasedSelect;
  v44 = v4;
  v45 = self;
  if (v4 && prefNameBasedSelect)
  {
    v6 = v4;
    endpoints = self->_endpoints;
    v81[0] = MEMORY[0x24BDAC760];
    v81[1] = 3221225472;
    v81[2] = __44__DADeviceResolver__updateSelectedEndpoint___block_invoke;
    v81[3] = &unk_24D169190;
    v8 = v6;
    v82 = v8;
    v83 = &v84;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](endpoints, "enumerateKeysAndObjectsUsingBlock:", v81);

  }
  else if (!v4)
  {
    goto LABEL_40;
  }
  if (gLogCategory_DADeviceResolver <= 30
    && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    bundleID = v44;
    LogPrintF();
  }
  v9 = v44;
  -[NSString protocolTypeString](v9, "protocolTypeString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqualToString:](v45->_selectedProtocolStr, "isEqualToString:", v10))
  {
    if (gLogCategory_DADeviceResolver <= 30
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v12 = v45->_selectedEndpoints;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
    if (v13)
    {
      v14 = 0;
      v15 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v78 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
          if (v14)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * i), "persistentDictionaryRepresentation");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v18);

          }
          else if (objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * i), "matchesSelectedEndpoint:allowName:", v9, *((unsigned __int8 *)v85 + 24)))
          {
            v14 = v17;
          }
          else
          {
            objc_msgSend(v17, "persistentDictionaryRepresentation");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v19);

            v14 = 0;
          }
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
      }
      while (v13);

      if (v14)
      {
        if (gLogCategory_DADeviceResolver <= 30
          && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
          -[NSMutableArray removeObject:](v45->_selectedEndpoints, "removeObject:", v14, v14, v9);
        }
        else
        {
          -[NSMutableArray removeObject:](v45->_selectedEndpoints, "removeObject:", v14, bundleID, v43);
        }
      }
    }
    else
    {

      v14 = 0;
    }
    -[NSMutableArray addObject:](v45->_selectedEndpoints, "addObject:", v9, bundleID);
    -[NSString persistentDictionaryRepresentation](v9, "persistentDictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v20);
  }
  else
  {
    if (gLogCategory_DADeviceResolver <= 30
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      v43 = v10;
      LogPrintF();
    }
    objc_storeStrong((id *)&v45->_selectedProtocolStr, v10);
    -[NSMutableArray removeAllObjects](v45->_selectedEndpoints, "removeAllObjects");
    -[NSString persistentDictionaryRepresentation](v9, "persistentDictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v20);
    v14 = 0;
  }

  bundleID = v45->_bundleID;
  NSPrintF();
  CFPrefs_SetValue();

  self = v45;
LABEL_40:
  v71 = 0;
  v72 = &v71;
  v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__1;
  v75 = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", self->_selectedEndpoints, bundleID, v43);
  v76 = (id)objc_claimAutoreleasedReturnValue();
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__1;
  v69 = __Block_byref_object_dispose__1;
  v70 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__1;
  v63 = __Block_byref_object_dispose__1;
  v64 = 0;
  v21 = self->_endpoints;
  v58[0] = MEMORY[0x24BDAC760];
  v58[1] = 3221225472;
  v58[2] = __44__DADeviceResolver__updateSelectedEndpoint___block_invoke_2;
  v58[3] = &unk_24D169208;
  v58[4] = self;
  v58[5] = &v84;
  v58[6] = &v71;
  v58[7] = &v59;
  v58[8] = &v65;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v21, "enumerateKeysAndObjectsUsingBlock:", v58);
  v22 = (void (**)(void *, DADeviceEvent *))_Block_copy(self->_eventHandler);
  if (v22)
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v23 = (id)v66[5];
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v90, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v55 != v25)
            objc_enumerationMutation(v23);
          v27 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
          if (gLogCategory_DADeviceResolver <= 30
            && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
          {
            v42 = v27;
            LogPrintF();
          }
          objc_msgSend(v27, "parentDevice", v42);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = -[DAEventDevice initWithEventType:device:]([DADeviceEvent alloc], "initWithEventType:device:", 40, v28);
          v22[2](v22, v29);

        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v90, 16);
      }
      while (v24);
    }

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v30 = (id)v60[5];
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v50, v89, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v51;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v51 != v32)
            objc_enumerationMutation(v30);
          v34 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
          if (gLogCategory_DADeviceResolver <= 30
            && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
          {
            v42 = v34;
            LogPrintF();
          }
          objc_msgSend(v34, "parentDevice", v42);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = -[DAEventDevice initWithEventType:device:]([DADeviceEvent alloc], "initWithEventType:device:", 40, v35);
          v22[2](v22, v36);

        }
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v50, v89, 16);
      }
      while (v31);
    }

  }
  if (v45->_selectedEndpoints && objc_msgSend((id)v72[5], "count"))
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v37 = (id)v72[5];
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v46, v88, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v47;
      do
      {
        for (m = 0; m != v38; ++m)
        {
          if (*(_QWORD *)v47 != v39)
            objc_enumerationMutation(v37);
          if (gLogCategory_DADeviceResolver <= 30
            && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
        }
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v46, v88, 16);
      }
      while (v38);
    }

  }
  _Block_object_dispose(&v59, 8);

  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v71, 8);

  _Block_object_dispose(&v84, 8);
}

void __44__DADeviceResolver__updateSelectedEndpoint___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;

  v15 = a2;
  v7 = a3;
  v8 = v7;
  if (*(id *)(a1 + 32) != v7)
  {
    objc_msgSend(v7, "parentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v8, "protocolTypeString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = objc_msgSend(v10, "isEqual:", v11);

      if ((_DWORD)v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqual:", v13);

        if (v14)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          *a4 = 1;
        }
      }
    }
  }

}

void __44__DADeviceResolver__updateSelectedEndpoint___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "parentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = *(id *)(a1[4] + 48);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10);
        if ((objc_msgSend(v4, "matchesSelectedEndpoint:allowName:", v11, *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), (_QWORD)v20) & 1) != 0)break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "removeObject:", v11);

      if ((objc_msgSend(v4, "selected") & 1) != 0)
        goto LABEL_18;
      objc_msgSend(v4, "setSelected:", 1);
      v12 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
      if (!v12)
      {
        v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v18 = *(_QWORD *)(a1[7] + 8);
        v19 = *(void **)(v18 + 40);
        *(_QWORD *)(v18 + 40) = v17;

        v16 = a1[7];
        goto LABEL_16;
      }
      goto LABEL_17;
    }
LABEL_10:

    if (objc_msgSend(v4, "selected"))
    {
      objc_msgSend(v4, "setSelected:", 0);
      v12 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
      if (!v12)
      {
        v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v14 = *(_QWORD *)(a1[8] + 8);
        v15 = *(void **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = v13;

        v16 = a1[8];
LABEL_16:
        v12 = *(void **)(*(_QWORD *)(v16 + 8) + 40);
      }
LABEL_17:
      objc_msgSend(v12, "addObject:", v4, (_QWORD)v20);
    }
  }
LABEL_18:

}

- (void)_startResolvingEndpoint:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "ipv4String");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    objc_msgSend(v14, "bonjourHostname");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "UTF8String");

    if (v6)
    {
      -[DADeviceResolver _startResolvingHostname:interfaceIndex:endpoint:](self, "_startResolvingHostname:interfaceIndex:endpoint:", v6, 0, v14);
    }
    else
    {
      objc_msgSend(v14, "bonjourFullName");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v8 = objc_msgSend(v7, "UTF8String");

      v9 = objc_msgSend(v14, "bonjourInterfaceIndex");
      if (v8)
      {
        -[DADeviceResolver _startResolvingBonjourFullName:interfaceIndex:endpoint:](self, "_startResolvingBonjourFullName:interfaceIndex:endpoint:", v8, v9, v14);
      }
      else
      {
        objc_msgSend(v14, "bonjourName");
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v11 = objc_msgSend(v10, "UTF8String");

        objc_msgSend(v14, "bonjourType");
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v13 = objc_msgSend(v12, "UTF8String");

        if (v11 && v13)
        {
          -[DADeviceResolver _startResolvingBonjourName:type:interfaceIndex:endpoint:](self, "_startResolvingBonjourName:type:interfaceIndex:endpoint:", v11, v13, v9, v14);
        }
        else if (gLogCategory_DADeviceResolver <= 90
               && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
    }
  }

}

- (void)_startResolvingBonjourFullName:(const char *)a3 interfaceIndex:(unsigned int)a4 endpoint:(id)a5
{
  id v8;
  DADeviceResolveOperation *v9;
  void *v10;
  void *v11;
  DNSServiceRef sdRef;

  v8 = a5;
  if (gLogCategory_DADeviceResolver <= 30
    && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  v9 = objc_alloc_init(DADeviceResolveOperation);
  -[DADeviceResolveOperation setResolver:](v9, "setResolver:", self);
  -[DADeviceResolveOperation setEndpoint:](v9, "setEndpoint:", v8);
  sdRef = self->_bonjourSharedService;
  if (DNSServiceQueryRecord(&sdRef, 0x404000u, a4, a3, 0x21u, 1u, (DNSServiceQueryRecordReply)_resolveSRVCallack, v9))
  {
    if (gLogCategory_DADeviceResolver <= 90
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      CUPrintErrorCode();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
  }
  else
  {
    -[DADeviceResolveOperation setSrvQuery:](v9, "setSrvQuery:", sdRef);
    -[NSMutableSet addObject:](self->_resolveOperations, "addObject:", v9);
  }

}

- (void)_startResolvingBonjourName:(const char *)a3 type:(const char *)a4 interfaceIndex:(unsigned int)a5 endpoint:(id)a6
{
  id v10;
  DADeviceResolveOperation *v11;
  void *v12;
  void *v13;
  DNSServiceRef sdRef;
  char fullName[1073];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  if (gLogCategory_DADeviceResolver <= 30
    && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v10, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  if (!DNSServiceConstructFullName(fullName, a3, a4, "local."))
  {
    v11 = objc_alloc_init(DADeviceResolveOperation);
    -[DADeviceResolveOperation setResolver:](v11, "setResolver:", self);
    -[DADeviceResolveOperation setEndpoint:](v11, "setEndpoint:", v10);
    sdRef = self->_bonjourSharedService;
    if (DNSServiceQueryRecord(&sdRef, 0x404000u, a5, fullName, 0x21u, 1u, (DNSServiceQueryRecordReply)_resolveSRVCallack, v11))
    {
      if (gLogCategory_DADeviceResolver <= 90
        && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
      {
        CUPrintErrorCode();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
    }
    else
    {
      -[DADeviceResolveOperation setSrvQuery:](v11, "setSrvQuery:", sdRef);
      -[NSMutableSet addObject:](self->_resolveOperations, "addObject:", v11);
    }
    goto LABEL_8;
  }
  if (gLogCategory_DADeviceResolver <= 90
    && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    CUPrintErrorCode();
    v11 = (DADeviceResolveOperation *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
LABEL_8:

  }
}

- (void)_startResolvingHostname:(const char *)a3 interfaceIndex:(unsigned int)a4 endpoint:(id)a5
{
  id v8;
  DADeviceResolveOperation *v9;
  void *v10;
  void *v11;
  DNSServiceRef sdRef;

  v8 = a5;
  if (gLogCategory_DADeviceResolver <= 30
    && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  v9 = objc_alloc_init(DADeviceResolveOperation);
  -[DADeviceResolveOperation setResolver:](v9, "setResolver:", self);
  -[DADeviceResolveOperation setEndpoint:](v9, "setEndpoint:", v8);
  sdRef = self->_bonjourSharedService;
  if (DNSServiceGetAddrInfo(&sdRef, 0x4000u, a4, 1u, a3, (DNSServiceGetAddrInfoReply)_resolveHostnameCallback, v9))
  {
    if (gLogCategory_DADeviceResolver <= 90
      && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
    {
      CUPrintErrorCode();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
  }
  else
  {
    -[DADeviceResolveOperation setAddrInfoQuery:](v9, "setAddrInfoQuery:", sdRef);
    -[NSMutableSet addObject:](self->_resolveOperations, "addObject:", v9);
  }

}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CUCoalescer)coalescer
{
  return self->_coalescer;
}

- (void)setCoalescer:(id)a3
{
  objc_storeStrong((id *)&self->_coalescer, a3);
}

- (NSMutableSet)resolveOperations
{
  return self->_resolveOperations;
}

- (void)setResolveOperations:(id)a3
{
  objc_storeStrong((id *)&self->_resolveOperations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolveOperations, 0);
  objc_storeStrong((id *)&self->_coalescer, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_selectedProtocolStr, 0);
  objc_storeStrong((id *)&self->_selectedEndpoints, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
