@implementation CBDiscovery

- (BOOL)disabledActive
{
  return self->_disabledActive;
}

- (unint64_t)extraDiscoveryFlags
{
  return self->_extraDiscoveryFlags;
}

- (BOOL)discoveryTypesContainTypes:(id *)a3
{
  return CBDiscoveryTypesContainTypes(self->_discoveryTypesInternal.bitArray, a3);
}

- (BOOL)disabledPending
{
  return self->_disabledPending;
}

- (char)bleRSSIThresholdHint
{
  return self->_bleRSSIThresholdHint;
}

- (int)bleScanRateOverride
{
  return self->_bleScanRateOverride;
}

- (void)setDisabledPending:(BOOL)a3
{
  self->_disabledPending = a3;
}

- (int)bleScanRate
{
  return self->_bleScanRate;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (unsigned)internalFlags
{
  return self->_internalFlags;
}

- (void)_xpcReceivedDeviceFound:(id)a3
{
  id v4;
  CBDevice *v5;
  id v6;
  void *v7;
  CBDiscovery *v8;
  NSMutableDictionary *deviceMap;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  int var0;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  id v18;

  v4 = a3;
  if (MEMORY[0x1A85D2194]() == MEMORY[0x1E0C812F8])
  {
    v18 = 0;
    v5 = -[CBDevice initWithXPCObject:error:]([CBDevice alloc], "initWithXPCObject:error:", v4, &v18);
    v6 = v18;
    if (v5)
    {
      -[CBDevice identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = self;
        objc_sync_enter(v8);
        deviceMap = v8->_deviceMap;
        if (!deviceMap)
        {
          v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          v11 = v8->_deviceMap;
          v8->_deviceMap = v10;

          deviceMap = v8->_deviceMap;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v5, v7);
        objc_sync_exit(v8);

        var0 = v8->_ucat->var0;
        if (var0 <= 15 && (var0 != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
        v13 = MEMORY[0x1A85D1CE4](v8->_deviceFoundHandler);
        v14 = (void *)v13;
        if (v13)
          (*(void (**)(uint64_t, CBDevice *))(v13 + 16))(v13, v5);

        goto LABEL_13;
      }
      v17 = self->_ucat->var0;
      if (v17 > 90 || v17 == -1 && !_LogCategory_Initialize())
      {
LABEL_13:

LABEL_14:
        goto LABEL_15;
      }
    }
    else
    {
      v16 = self->_ucat->var0;
      if (v16 > 90 || v16 == -1 && !_LogCategory_Initialize())
        goto LABEL_14;
      CUPrintNSError();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    LogPrintF_safe();
    goto LABEL_13;
  }
  v15 = self->_ucat->var0;
  if (v15 <= 90 && (v15 != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
LABEL_15:

}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- ($A0BF7C2F34202597F9F30F6CD4123348)discoveryTypesInternalPtr
{
  return ($A0BF7C2F34202597F9F30F6CD4123348 *)&self->_discoveryTypesInternal;
}

- (NSString)appID
{
  return self->_appID;
}

- (NSArray)deviceFilter
{
  return self->_deviceFilter;
}

- (void)setExtraDiscoveryFlags:(unint64_t)a3
{
  self->_extraDiscoveryFlags = a3;
}

- (BOOL)denyScreenLockedScans
{
  return self->_denyScreenLockedScans;
}

- (BOOL)denyLowPowerModeScans
{
  return self->_denyLowPowerModeScans;
}

- (unsigned)useCase
{
  return self->_useCase;
}

- (NSArray)oobKeys
{
  return self->_oobKeys;
}

- (int)bleScanRateScreenOff
{
  return self->_bleScanRateScreenOff;
}

_QWORD *__32__CBDiscovery__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[7] == *(_QWORD *)(a1 + 40))
    return (_QWORD *)objc_msgSend(result, "xpcReceivedMessage:", a2);
  return result;
}

- (BOOL)needsBLEScan
{
  $77478E09546100A0DB2933F271BBC655 *p_discoveryTypesInternal;
  _BYTE *v5;
  NSArray *serviceUUIDs;

  if ((self->_discoveryFlags & 0x7CFAA6C5B14FFFFFLL) != 0)
    return 1;
  p_discoveryTypesInternal = &self->_discoveryTypesInternal;
  v5 = CBDiscoveryTypesBLEScan();
  if (CBDiscoveryTypesContainTypes(p_discoveryTypesInternal, v5))
    return 1;
  serviceUUIDs = self->_serviceUUIDs;
  return serviceUUIDs && -[NSArray count](serviceUUIDs, "count");
}

- (BOOL)needsIdentify
{
  $77478E09546100A0DB2933F271BBC655 *p_discoveryTypesInternal;
  _BYTE *v4;

  if ((self->_discoveryFlags & 0x2000201400020108) != 0)
    return 1;
  p_discoveryTypesInternal = &self->_discoveryTypesInternal;
  v4 = CBDiscoveryTypesNeedsIdentify();
  return CBDiscoveryTypesContainTypes(p_discoveryTypesInternal, v4);
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (BOOL)needsAdvertisingAddress
{
  $77478E09546100A0DB2933F271BBC655 *p_discoveryTypesInternal;
  _BYTE *v4;

  if ((self->_discoveryFlags & 0x2000000400020108) != 0)
    return 1;
  p_discoveryTypesInternal = &self->_discoveryTypesInternal;
  v4 = CBDiscoveryTypesNeedsAdvertisingAddress();
  return CBDiscoveryTypesContainTypes(p_discoveryTypesInternal, v4);
}

- (void)setDisabledActive:(BOOL)a3
{
  self->_disabledActive = a3;
}

- (void)xpcReceivedMessage:(id)a3
{
  id v4;
  int var0;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  CBDiscovery *v21;
  OS_xpc_object *xpcCnx;
  void *v23;
  void *v24;
  id v25;

  v4 = a3;
  var0 = self->_ucat->var0;
  v25 = v4;
  if (var0 <= 9)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), v4 = v25, v6))
    {
      CUPrintXPC();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      v4 = v25;
    }
  }
  if (MEMORY[0x1A85D2194](v4) == MEMORY[0x1E0C812F8])
  {
    -[CBDiscovery _xpcReceivedMessage:](self, "_xpcReceivedMessage:", v25);
    goto LABEL_26;
  }
  if (v25 == (id)MEMORY[0x1E0C81258])
  {
    -[CBDiscovery _interrupted](self, "_interrupted");
    goto LABEL_26;
  }
  if (v25 != (id)MEMORY[0x1E0C81260])
  {
    CUXPCDecodeNSErrorIfNeeded();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v7;
    if (v7)
    {
      v15 = v7;

      v16 = self->_ucat->var0;
      if (v16 > 90)
        goto LABEL_21;
    }
    else
    {
      CBErrorF(-6700, (uint64_t)"XPC event error", v8, v9, v10, v11, v12, v13, (uint64_t)v23);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      v16 = self->_ucat->var0;
      if (v16 > 90)
      {
LABEL_21:
        v19 = MEMORY[0x1A85D1CE4](self->_errorHandler);
        v20 = (void *)v19;
        if (v19)
          (*(void (**)(uint64_t, id))(v19 + 16))(v19, v15);

        goto LABEL_26;
      }
    }
    if (v16 != -1 || _LogCategory_Initialize())
    {
      CUPrintNSError();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintXPC();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    goto LABEL_21;
  }
  if (!self->_invalidateCalled)
  {
    v17 = self->_ucat->var0;
    if (v17 <= 90 && (v17 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
  }
  v21 = self;
  objc_sync_enter(v21);
  xpcCnx = v21->_xpcCnx;
  v21->_xpcCnx = 0;

  objc_sync_exit(v21);
  -[CBDiscovery _invalidated](v21, "_invalidated");
LABEL_26:

}

- (void)_xpcReceivedMessage:(id)a3
{
  const char *string;
  const char *v5;
  int v6;
  int var0;
  id v8;

  v8 = a3;
  string = xpc_dictionary_get_string(v8, "mTyp");
  if (!string)
  {
    var0 = self->_ucat->var0;
    if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize())
      goto LABEL_13;
LABEL_12:
    LogPrintF_safe();
LABEL_13:

    return;
  }
  v5 = string;
  if (!strcmp(string, "DvFo"))
  {
    -[CBDiscovery _xpcReceivedDeviceFound:](self, "_xpcReceivedDeviceFound:", v8);

  }
  else if (!strcmp(v5, "DvLo"))
  {
    -[CBDiscovery _xpcReceivedDeviceLost:](self, "_xpcReceivedDeviceLost:", v8);

  }
  else if (!strcmp(v5, "DsBf"))
  {
    -[CBDiscovery _xpcReceivedDevicesBuffered:](self, "_xpcReceivedDevicesBuffered:", v8);

  }
  else if (!strcmp(v5, "PwrC"))
  {
    -[CBDiscovery _xpcReceivedPowerStateChanged:](self, "_xpcReceivedPowerStateChanged:", v8);

  }
  else
  {
    if (strcmp(v5, "SyOC"))
    {
      v6 = self->_ucat->var0;
      if (v6 > 90 || v6 == -1 && !_LogCategory_Initialize())
        goto LABEL_13;
      goto LABEL_12;
    }
    -[CBDiscovery _xpcReceivedSystemOverrideChanged:](self, "_xpcReceivedSystemOverrideChanged:", v8);

  }
}

- (void)_activateXPCCompleted:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD);
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CBDiscovery *v12;
  int var0;
  void (**v14)(_QWORD, _QWORD);
  id activateCompletion;
  void *v16;
  NSMutableDictionary *deviceMap;
  uint64_t *v18;
  id v19;
  _QWORD v20[6];
  _QWORD applier[6];
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
  _QWORD v34[6];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v4 = a3;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__4;
  v39 = __Block_byref_object_dispose__4;
  v40 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __37__CBDiscovery__activateXPCCompleted___block_invoke;
  v34[3] = &unk_1E53FF8C0;
  v34[4] = self;
  v34[5] = &v35;
  v6 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v34);
  CUXPCDecodeNSErrorIfNeeded();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v36[5];
  v36[5] = v7;

  if (!v36[5])
  {
    self->_bluetoothState = xpc_dictionary_get_int64(v4, "pwrS");
    xpc_dictionary_get_array(v4, "devA");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
      goto LABEL_6;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__4;
    v32 = __Block_byref_object_dispose__4;
    v33 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__4;
    v26 = __Block_byref_object_dispose__4;
    v27 = 0;
    applier[0] = v5;
    applier[1] = 3221225472;
    applier[2] = __37__CBDiscovery__activateXPCCompleted___block_invoke_2;
    applier[3] = &unk_1E5402490;
    applier[4] = &v22;
    applier[5] = &v28;
    xpc_array_apply(v9, applier);
    v11 = (void *)v23[5];
    if (v11)
    {
      v18 = v36;
      v19 = v11;
      v12 = (CBDiscovery *)v18[5];
      v18[5] = (uint64_t)v19;
    }
    else
    {
      v12 = self;
      objc_sync_enter(v12);
      objc_storeStrong((id *)&v12->_deviceMap, (id)v29[5]);
      objc_sync_exit(v12);
    }

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);

    if (!v11)
    {
LABEL_6:
      var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        -[NSMutableDictionary count](self->_deviceMap, "count");
        LogPrintF_safe();
      }
      v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_activateCompletion);
      activateCompletion = self->_activateCompletion;
      self->_activateCompletion = 0;

      if (v14)
        v14[2](v14, 0);
      v16 = (void *)MEMORY[0x1A85D1CE4](self->_deviceFoundHandler);
      if (v16)
      {
        deviceMap = self->_deviceMap;
        v20[0] = v5;
        v20[1] = 3221225472;
        v20[2] = __37__CBDiscovery__activateXPCCompleted___block_invoke_3;
        v20[3] = &unk_1E5402468;
        v20[4] = self;
        v20[5] = v16;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v20);
      }

    }
  }
  v6[2](v6);

  _Block_object_dispose(&v35, 8);
}

void __37__CBDiscovery__activateXPCCompleted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void (**v10)(id, _QWORD);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = **(_DWORD **)(v2 + 48);
    if (v3 <= 90)
    {
      if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v4))
      {
        CUPrintNSError();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 32);
      }
    }
    v10 = (void (**)(id, _QWORD))MEMORY[0x1A85D1CE4](*(_QWORD *)(v2 + 16));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = 0;

    if (v10)
    {
      v10[2](v10, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    }
    else
    {
      v7 = MEMORY[0x1A85D1CE4](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168));
      v8 = (void *)v7;
      if (v7)
        (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    }
  }
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSArray *deviceFilter;
  NSArray *v13;
  id v14;
  id v15;
  NSArray *oobKeys;
  NSArray *v17;
  id v18;
  NSArray *serviceUUIDs;
  NSArray *v20;
  id v21;
  CBDevice *remoteDevice;
  id v23;
  unsigned int useCase;
  id v25;
  NSArray *useCaseClientIDs;
  NSArray *v27;
  id v28;
  NSArray *typeToRssiThresholds;
  NSArray *v30;
  id v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  CBDevice *v37;
  void *v38;
  void *v39;
  id v40[3];

  v40[2] = 0;
  NSAppendPrintF_safe();
  v4 = 0;
  if (self->_discoveryFlags)
  {
    v40[1] = v4;
    CUPrintFlags64();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v5 = v4;

    v4 = v5;
  }
  v40[0] = v4;
  CBDiscoveryTypesAppendString((uint64_t)v40, (uint64_t)", DsTy", (uint64_t)&self->_discoveryTypesInternal);
  v6 = v40[0];

  if (self->_bleScanRate)
  {
    NSAppendPrintF_safe();
    v7 = v6;

    v6 = v7;
  }
  if (self->_bleScanRateScreenOff)
  {
    NSAppendPrintF_safe();
    v8 = v6;

    v6 = v8;
  }
  if (self->_bleScanRateOverride)
  {
    NSAppendPrintF_safe();
    v9 = v6;

    v6 = v9;
  }
  if (self->_bleRSSIThresholdHint)
  {
    NSAppendPrintF_safe();
    v10 = v6;

    v6 = v10;
  }
  if (self->_bleRSSIThresholdOrder)
  {
    NSAppendPrintF_safe();
    v11 = v6;

    v6 = v11;
  }
  deviceFilter = self->_deviceFilter;
  if (deviceFilter)
  {
    v13 = deviceFilter;
    CUPrintNSObjectOneLine();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v14 = v6;

    v6 = v14;
  }
  if (self->_deviceSetupState)
  {
    NSAppendPrintF_safe();
    v15 = v6;

    v6 = v15;
  }
  oobKeys = self->_oobKeys;
  if (oobKeys)
  {
    v17 = oobKeys;
    CUPrintNSObjectOneLine();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v18 = v6;

    v6 = v18;
  }
  serviceUUIDs = self->_serviceUUIDs;
  if (serviceUUIDs)
  {
    v20 = serviceUUIDs;
    CUPrintNSObjectOneLine();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v21 = v6;

    v6 = v21;
  }
  remoteDevice = self->_remoteDevice;
  if (remoteDevice)
  {
    v37 = remoteDevice;
    NSAppendPrintF_safe();
    v23 = v6;

    v6 = v23;
  }
  useCase = self->_useCase;
  if (useCase)
  {
    CBUseCaseToString_0(useCase);
    NSAppendPrintF_safe();
    v25 = v6;

    v6 = v25;
  }
  useCaseClientIDs = self->_useCaseClientIDs;
  if (useCaseClientIDs)
  {
    v27 = useCaseClientIDs;
    CUPrintNSObjectOneLine();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v28 = v6;

    v6 = v28;
  }
  typeToRssiThresholds = self->_typeToRssiThresholds;
  if (typeToRssiThresholds)
  {
    v30 = typeToRssiThresholds;
    CUPrintNSObjectOneLine();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v31 = v6;

    v6 = v31;
  }
  return v6;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

uint64_t __38__CBDiscovery_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setBleRSSIThresholdHint:(char)a3
{
  self->_bleRSSIThresholdHint = a3;
}

uint64_t __40__CBDiscovery__updateIfNeededWithBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

- (void)setAppID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

uint64_t __33__CBDiscovery__activateXPCStart___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateXPCCompleted:", a2);
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__CBDiscovery_setDiscoveryFlags___block_invoke;
  v3[3] = &unk_1E53FFAC8;
  v3[4] = self;
  v3[5] = a3;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

- (void)_updateIfNeededWithBlock:(id)a3
{
  uint64_t (**v4)(_QWORD);
  CBDiscovery *v5;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = (uint64_t (**)(_QWORD))a3;
  v5 = self;
  objc_sync_enter(v5);
  if ((v4[2](v4) & 1) != 0 && v5->_activateCalled && !v5->_changesPending)
  {
    v5->_changesPending = 1;
    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__CBDiscovery__updateIfNeededWithBlock___block_invoke;
    block[3] = &unk_1E53FF780;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);

}

BOOL __33__CBDiscovery_setDiscoveryFlags___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(v2 + 240);
  if (v1 != v3)
    *(_QWORD *)(v2 + 240) = v1;
  return v1 != v3;
}

- (CBDiscovery)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CBDiscovery *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  id *p_oobKeys;
  int var0;
  id *p_serviceUUIDs;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  id *p_typeToRssiThresholds;
  int v31;
  CBDiscovery *v32;
  const char *v34;
  uint64_t v35;

  v6 = a3;
  v13 = -[CBDiscovery init](self, "init");
  if (!v13)
  {
    if (!a4)
      goto LABEL_75;
    v34 = "CBDiscovery init failed";
LABEL_74:
    CBErrorF(-6756, (uint64_t)v34, v7, v8, v9, v10, v11, v12, v35);
    v32 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_69;
  }
  if (MEMORY[0x1A85D2194](v6) != MEMORY[0x1E0C812F8])
  {
    if (!a4)
      goto LABEL_75;
    v34 = "XPC non-dict";
    goto LABEL_74;
  }
  v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 == 6)
  {
    v13->_bleRSSIThresholdOrder = 0;
  }
  else if (v14 == 5)
  {
    goto LABEL_75;
  }
  v15 = CUXPCDecodeSInt64RangedEx();
  if (v15 == 6)
  {
    v13->_bleRSSIThresholdHint = 0;
  }
  else if (v15 == 5)
  {
    goto LABEL_75;
  }
  v16 = CUXPCDecodeSInt64RangedEx();
  if (v16 == 6)
  {
    v13->_bleScanRate = 0;
  }
  else if (v16 == 5)
  {
    goto LABEL_75;
  }
  v17 = CUXPCDecodeSInt64RangedEx();
  if (v17 == 6)
  {
    v13->_bleScanRateScreenOff = 0;
  }
  else if (v17 == 5)
  {
    goto LABEL_75;
  }
  v18 = CUXPCDecodeUInt64RangedEx();
  if (v18 == 6)
  {
    v13->_clientID = 0;
  }
  else if (v18 == 5)
  {
    goto LABEL_75;
  }
  if (!CUXPCDecodeNSArrayOfNSString())
    goto LABEL_75;
  v19 = CUXPCDecodeUInt64RangedEx();
  if (v19 == 6)
  {
    v13->_discoveryFlags = 0;
  }
  else if (v19 == 5)
  {
    goto LABEL_75;
  }
  if (!CBXPCDecodeDiscoveryTypes(v6, "dsTy", &v13->_discoveryTypesInternal))
    goto LABEL_75;
  v20 = CUXPCDecodeUInt64RangedEx();
  if (v20 == 6)
  {
    v13->_internalFlags = 0;
  }
  else if (v20 == 5)
  {
    goto LABEL_75;
  }
  objc_opt_class();
  p_oobKeys = (id *)&v13->_oobKeys;
  if (!CUXPCDecodeNSArrayOfClass())
    goto LABEL_75;
  if (*p_oobKeys)
  {
    if (objc_msgSend(*p_oobKeys, "count"))
    {
      if (!v13->_discoveryFlags)
      {
        var0 = v13->_ucat->var0;
        if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
      }
    }
  }
  objc_opt_class();
  p_serviceUUIDs = (id *)&v13->_serviceUUIDs;
  if (!CUXPCDecodeNSArrayOfClass())
    goto LABEL_75;
  if (*p_serviceUUIDs)
  {
    if (objc_msgSend(*p_serviceUUIDs, "count"))
    {
      if (!v13->_discoveryFlags)
      {
        v24 = v13->_ucat->var0;
        if (v24 <= 60 && (v24 != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
      }
    }
  }
  objc_opt_class();
  if (!CUXPCDecodeObject())
    goto LABEL_75;
  v25 = CUXPCDecodeUInt64RangedEx();
  if (v25 == 6)
  {
    v13->_useCase = 0;
  }
  else if (v25 == 5)
  {
    goto LABEL_75;
  }
  if (!CUXPCDecodeNSArrayOfNSString())
    goto LABEL_75;
  v26 = CUXPCDecodeSInt64RangedEx();
  if (v26 == 6)
  {
    v13->_bleSensorRssiIncreaseScanThreshold = 0;
  }
  else if (v26 == 5)
  {
    goto LABEL_75;
  }
  if (!CUXPCDecodeBool())
    goto LABEL_75;
  v13->_bleSensorEnableRssiIncreaseScan = 1;
  v27 = CUXPCDecodeUInt64RangedEx();
  if (v27 == 6)
  {
    v13->_bleSensorIncreaseScanRate = 0;
  }
  else if (v27 == 5)
  {
    goto LABEL_75;
  }
  v28 = CUXPCDecodeUInt64RangedEx();
  if (v28 == 6)
  {
    v13->_bleSensorIncreaseScanTimeout = 0;
  }
  else if (v28 == 5)
  {
    goto LABEL_75;
  }
  v29 = CUXPCDecodeUInt64RangedEx();
  if (v29 == 6)
  {
    v13->_bleSensorTimeoutBetweenIncreaseScan = 0;
    goto LABEL_60;
  }
  if (v29 == 5)
  {
LABEL_75:
    v32 = 0;
    goto LABEL_69;
  }
LABEL_60:
  objc_opt_class();
  p_typeToRssiThresholds = (id *)&v13->_typeToRssiThresholds;
  if (!CUXPCDecodeNSArrayOfClass())
    goto LABEL_75;
  if (*p_typeToRssiThresholds)
  {
    if (objc_msgSend(*p_typeToRssiThresholds, "count"))
    {
      if (((char)v13->_discoveryTypesInternal.bitArray[3] & 0x80000000) == 0)
      {
        v31 = v13->_ucat->var0;
        if (v31 <= 60 && (v31 != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
      }
    }
  }
  v32 = v13;
LABEL_69:

  return v32;
}

- (CBDiscovery)init
{
  CBDiscovery *v2;
  CBDiscovery *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CBDiscovery;
  v2 = -[CBDiscovery init](&v5, sel_init);
  if (v2)
  {
    v2->_clientID = CBXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v2->_ucat = (LogCategory *)&gLogCategory_CBDiscovery;
    v3 = v2;
  }

  return v2;
}

- (void)_update
{
  CBDiscovery *v2;
  _BOOL4 changesPending;
  int var0;
  _xpc_connection_s *v5;
  xpc_object_t xdict;

  if (!self->_invalidateCalled)
  {
    v2 = self;
    objc_sync_enter(v2);
    changesPending = v2->_changesPending;
    v2->_changesPending = 0;
    objc_sync_exit(v2);

    var0 = v2->_ucat->var0;
    if (changesPending)
    {
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF_safe();
      if (!v2->_direct)
      {
        xdict = xpc_dictionary_create(0, 0, 0);
        -[CBDiscovery encodeWithXPCObject:](v2, "encodeWithXPCObject:", xdict);
        xpc_dictionary_set_string(xdict, "mTyp", "DscU");
        -[CBDiscovery _ensureXPCStarted](v2, "_ensureXPCStarted");
        v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        xpc_connection_send_message(v5, xdict);

      }
    }
    else if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
}

- (void)_activateXPCStart:(BOOL)a3
{
  int var0;
  xpc_object_t v5;
  _xpc_connection_s *v6;
  NSObject *dispatchQueue;
  _QWORD handler[5];

  var0 = self->_ucat->var0;
  if (a3)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
LABEL_7:
      LogPrintF_safe();
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  v5 = xpc_dictionary_create(0, 0, 0);
  -[CBDiscovery encodeWithXPCObject:](self, "encodeWithXPCObject:", v5);
  xpc_dictionary_set_string(v5, "mTyp", "DscA");
  -[CBDiscovery _ensureXPCStarted](self, "_ensureXPCStarted");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __33__CBDiscovery__activateXPCStart___block_invoke;
  handler[3] = &unk_1E53FFB40;
  handler[4] = self;
  xpc_connection_send_message_with_reply(v6, v5, dispatchQueue, handler);

}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  int64_t bleScanRate;
  int64_t bleScanRateScreenOff;
  uint64_t clientID;
  uint64_t discoveryFlags;
  size_t v9;
  uint64_t internalFlags;
  uint64_t useCase;
  uint64_t bleSensorIncreaseScanRate;
  uint64_t bleSensorIncreaseScanTimeout;
  uint64_t bleSensorTimeoutBetweenIncreaseScan;
  xpc_object_t xdict;

  v4 = a3;
  xdict = v4;
  if (self->_bleRSSIThresholdOrder)
    xpc_dictionary_set_uint64(v4, "blRO", self->_bleRSSIThresholdOrder);
  if (self->_bleRSSIThresholdHint)
    xpc_dictionary_set_int64(xdict, "blRT", self->_bleRSSIThresholdHint);
  bleScanRate = self->_bleScanRate;
  if ((_DWORD)bleScanRate)
    xpc_dictionary_set_int64(xdict, "blSR", bleScanRate);
  bleScanRateScreenOff = self->_bleScanRateScreenOff;
  if ((_DWORD)bleScanRateScreenOff)
    xpc_dictionary_set_int64(xdict, "blSO", bleScanRateScreenOff);
  clientID = self->_clientID;
  if ((_DWORD)clientID)
    xpc_dictionary_set_uint64(xdict, "cid", clientID);
  CUXPCEncodeNSArrayOfNSString();
  discoveryFlags = self->_discoveryFlags;
  if (discoveryFlags)
    xpc_dictionary_set_uint64(xdict, "dsFl", discoveryFlags);
  if (self->_discoveryTypesInternal)
    v9 = 4;
  else
    v9 = 1;
  xpc_dictionary_set_data(xdict, "dsTy", &self->_discoveryTypesInternal, v9);
  internalFlags = self->_internalFlags;
  if ((_DWORD)internalFlags)
    xpc_dictionary_set_uint64(xdict, "intF", internalFlags);
  CUXPCEncodeNSArrayOfObjects();
  CUXPCEncodeNSArrayOfObjects();
  CUXPCEncodeObject();
  useCase = self->_useCase;
  if ((_DWORD)useCase)
    xpc_dictionary_set_uint64(xdict, "ucas", useCase);
  CUXPCEncodeNSArrayOfNSString();
  if (self->_bleSensorRssiIncreaseScanThreshold)
    xpc_dictionary_set_int64(xdict, "bsIT", self->_bleSensorRssiIncreaseScanThreshold);
  if (self->_bleSensorEnableRssiIncreaseScan)
    xpc_dictionary_set_BOOL(xdict, "bsEI", 1);
  bleSensorIncreaseScanRate = self->_bleSensorIncreaseScanRate;
  if ((_DWORD)bleSensorIncreaseScanRate)
    xpc_dictionary_set_uint64(xdict, "bsIS", bleSensorIncreaseScanRate);
  bleSensorIncreaseScanTimeout = self->_bleSensorIncreaseScanTimeout;
  if ((_DWORD)bleSensorIncreaseScanTimeout)
    xpc_dictionary_set_uint64(xdict, "bsTO", bleSensorIncreaseScanTimeout);
  bleSensorTimeoutBetweenIncreaseScan = self->_bleSensorTimeoutBetweenIncreaseScan;
  if ((_DWORD)bleSensorTimeoutBetweenIncreaseScan)
    xpc_dictionary_set_uint64(xdict, "bsBT", bleSensorTimeoutBetweenIncreaseScan);
  CUXPCEncodeNSArrayOfObjects();

}

- (id)_ensureXPCStarted
{
  CBDiscovery *v2;
  OS_xpc_object *v3;
  _xpc_endpoint_s *v4;
  _xpc_endpoint_s *v5;
  _xpc_connection_s *mach_service;
  _QWORD v8[5];
  OS_xpc_object *v9;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_xpcCnx;
  if (!v3)
  {
    v4 = v2->_testListenerEndpoint;
    v5 = v4;
    if (v4)
    {
      mach_service = xpc_connection_create_from_endpoint(v4);
      xpc_connection_set_target_queue(mach_service, (dispatch_queue_t)v2->_dispatchQueue);
    }
    else
    {
      mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", (dispatch_queue_t)v2->_dispatchQueue, 0);
    }
    objc_storeStrong((id *)&v2->_xpcCnx, mach_service);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __32__CBDiscovery__ensureXPCStarted__block_invoke;
    v8[3] = &unk_1E53FFB68;
    v8[4] = v2;
    v3 = mach_service;
    v9 = v3;
    xpc_connection_set_event_handler(v3, v8);
    xpc_connection_activate(v3);

  }
  objc_sync_exit(v2);

  return v3;
}

- (id)description
{
  return -[CBDiscovery descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  CBDiscovery *v5;
  uint64_t v6;
  id activateCompletion;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_activateCalled)
  {
    v5->_activateCalled = 1;
    v6 = MEMORY[0x1A85D1CE4](v4);
    activateCompletion = v5->_activateCompletion;
    v5->_activateCompletion = (id)v6;

    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__CBDiscovery_activateWithCompletion___block_invoke;
    block[3] = &unk_1E53FF780;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);

}

- (void)_activate
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int var0;
  BOOL v10;
  _BOOL4 v11;
  void (**v12)(_QWORD, _QWORD);
  int v13;
  id activateCompletion;
  void (**v15)(_QWORD, _QWORD);
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSString *v21;

  v21 = self->_mockID;
  if (v21)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    CBMockAddOrUpdateDiscovery(v21, self);
    v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_activateCompletion);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v12)
      v12[2](v12, 0);
LABEL_30:

    goto LABEL_31;
  }
  if (self->_bluetoothStateChangedHandler)
    self->_internalFlags |= 1u;
  if (self->_testListenerEndpoint)
    v10 = 1;
  else
    v10 = gCBDaemonServer == 0;
  v11 = !v10;
  self->_direct = v11;
  if (self->_invalidateCalled)
  {
    CBErrorF(-71148, (uint64_t)"Activate after invalidate", v3, v4, v5, v6, v7, v8, v19);
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v13 = self->_ucat->var0;
    if (v13 <= 90 && (v13 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_activateCompletion);
    v16 = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v15)
    {
      v15[2](v15, v12);
    }
    else
    {
      v17 = MEMORY[0x1A85D1CE4](self->_errorHandler);
      v18 = (void *)v17;
      if (v17)
        (*(void (**)(uint64_t, _QWORD))(v17 + 16))(v17, v12);

    }
    goto LABEL_30;
  }
  if (v11)
    -[CBDiscovery _activateDirectStart](self, "_activateDirectStart");
  else
    -[CBDiscovery _activateXPCStart:](self, "_activateXPCStart:", 0);
LABEL_31:

}

- (NSArray)useCaseClientIDs
{
  return self->_useCaseClientIDs;
}

- (BOOL)updateWithCBDiscovery:(id)a3
{
  char *v4;
  int v5;
  int bleRSSIThresholdOrder;
  BOOL v7;
  void *v8;
  id v9;
  char v10;
  uint64_t bleRSSIThresholdHint;
  char v12;
  id v13;
  int v14;
  int bleScanRate;
  int v16;
  int bleScanRateScreenOff;
  const char *v18;
  int v19;
  const char *v20;
  id v21;
  int v22;
  const char *v23;
  int v24;
  const char *v25;
  id v26;
  void *v27;
  NSArray *deviceFilter;
  NSArray *v29;
  NSArray *v30;
  NSArray *v31;
  char v32;
  $77478E09546100A0DB2933F271BBC655 *v33;
  $77478E09546100A0DB2933F271BBC655 *p_discoveryTypesInternal;
  void *v35;
  id v36;
  void *v37;
  NSArray *oobKeys;
  NSArray *v39;
  NSArray *v40;
  NSArray *v41;
  char v42;
  void *v43;
  void *v44;
  id v45;
  NSArray *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  NSArray *v52;
  void *v53;
  NSArray *serviceUUIDs;
  NSArray *v55;
  NSArray *v56;
  NSArray *v57;
  char v58;
  unsigned int v59;
  unsigned int useCase;
  id v61;
  void *v62;
  NSArray *useCaseClientIDs;
  NSArray *v64;
  NSArray *v65;
  NSArray *v66;
  char v67;
  char v68;
  uint64_t bleSensorRssiIncreaseScanThreshold;
  int v70;
  _BOOL8 bleSensorEnableRssiIncreaseScan;
  int v72;
  uint64_t bleSensorIncreaseScanRate;
  int v74;
  uint64_t bleSensorIncreaseScanTimeout;
  int v76;
  uint64_t bleSensorTimeoutBetweenIncreaseScan;
  id v78;
  NSArray *v79;
  NSArray *typeToRssiThresholds;
  NSArray *v81;
  id v82;
  NSArray *v83;
  NSArray *v84;
  int var0;
  NSArray *v86;
  void *v87;
  void *v88;
  id v89;
  NSArray *v90;
  void *v91;
  id v92;
  NSArray *v93;
  char v94;
  int v95;
  id v96;
  int v97;
  id v98;
  int v99;
  id v100;
  int v101;
  id v102;
  int v103;
  void *v105;
  uint64_t v106;
  const char *v107;
  void *v108;
  uint64_t v109;
  NSArray *v110;
  uint64_t v111;
  _BOOL8 v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  void *v116;
  uint64_t v117;
  const char *v118;
  const char *v119;
  const char *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;

  v4 = (char *)a3;
  v5 = objc_msgSend(v4, "bleRSSIThresholdOrder");
  bleRSSIThresholdOrder = self->_bleRSSIThresholdOrder;
  v7 = v5 != bleRSSIThresholdOrder;
  if (v5 == bleRSSIThresholdOrder)
  {
    v9 = 0;
    v12 = objc_msgSend(v4, "bleRSSIThresholdHint");
    bleRSSIThresholdHint = self->_bleRSSIThresholdHint;
    if (v12 == self->_bleRSSIThresholdHint)
      goto LABEL_6;
    goto LABEL_5;
  }
  CUPrintFlags32();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bleRSSIThresholdOrder");
  CUPrintFlags32();
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  CUAppendF();
  v9 = 0;

  self->_bleRSSIThresholdOrder = objc_msgSend(v4, "bleRSSIThresholdOrder", v8, v116);
  v10 = objc_msgSend(v4, "bleRSSIThresholdHint");
  bleRSSIThresholdHint = self->_bleRSSIThresholdHint;
  if (v10 != self->_bleRSSIThresholdHint)
  {
LABEL_5:
    v106 = bleRSSIThresholdHint;
    v117 = (int)objc_msgSend(v4, "bleRSSIThresholdHint");
    CUAppendF();
    v13 = v9;

    self->_bleRSSIThresholdHint = objc_msgSend(v4, "bleRSSIThresholdHint", v106, v117);
    v7 = 1;
    v9 = v13;
  }
LABEL_6:
  v14 = objc_msgSend(v4, "bleScanRate");
  bleScanRate = self->_bleScanRate;
  if (v14 == bleScanRate)
  {
    v16 = objc_msgSend(v4, "bleScanRateScreenOff");
    bleScanRateScreenOff = self->_bleScanRateScreenOff;
    if (v16 == bleScanRateScreenOff)
      goto LABEL_47;
    goto LABEL_28;
  }
  v18 = "Default";
  switch(bleScanRate)
  {
    case 0:
      break;
    case 10:
      v18 = "Periodic";
      break;
    case 20:
      v18 = "Background";
      break;
    case 30:
      v18 = "Low";
      break;
    case 35:
      v18 = "MediumLow";
      break;
    case 40:
      v18 = "Medium";
      break;
    case 50:
      v18 = "High";
      break;
    case 60:
      v18 = "Max";
      break;
    default:
      v18 = "?";
      break;
  }
  v19 = objc_msgSend(v4, "bleScanRate");
  v20 = "Default";
  switch(v19)
  {
    case 0:
      break;
    case 10:
      v20 = "Periodic";
      break;
    case 20:
      v20 = "Background";
      break;
    case 30:
      v20 = "Low";
      break;
    case 35:
      v20 = "MediumLow";
      break;
    case 40:
      v20 = "Medium";
      break;
    case 50:
      v20 = "High";
      break;
    case 60:
      v20 = "Max";
      break;
    default:
      v20 = "?";
      break;
  }
  v118 = v20;
  CUAppendF();
  v21 = v9;

  self->_bleScanRate = objc_msgSend(v4, "bleScanRate", v18, v118);
  v7 = 1;
  v9 = v21;
  v22 = objc_msgSend(v4, "bleScanRateScreenOff");
  bleScanRateScreenOff = self->_bleScanRateScreenOff;
  if (v22 != bleScanRateScreenOff)
  {
LABEL_28:
    v23 = "Default";
    switch(bleScanRateScreenOff)
    {
      case 0:
        break;
      case 10:
        v23 = "Periodic";
        break;
      case 20:
        v23 = "Background";
        break;
      case 30:
        v23 = "Low";
        break;
      case 35:
        v23 = "MediumLow";
        break;
      case 40:
        v23 = "Medium";
        break;
      case 50:
        v23 = "High";
        break;
      case 60:
        v23 = "Max";
        break;
      default:
        v23 = "?";
        break;
    }
    v24 = objc_msgSend(v4, "bleScanRateScreenOff");
    v25 = "Default";
    switch(v24)
    {
      case 0:
        break;
      case 10:
        v25 = "Periodic";
        break;
      case 20:
        v25 = "Background";
        break;
      case 30:
        v25 = "Low";
        break;
      case 35:
        v25 = "MediumLow";
        break;
      case 40:
        v25 = "Medium";
        break;
      case 50:
        v25 = "High";
        break;
      case 60:
        v25 = "Max";
        break;
      default:
        v25 = "?";
        break;
    }
    v119 = v25;
    CUAppendF();
    v26 = v9;

    self->_bleScanRateScreenOff = objc_msgSend(v4, "bleScanRateScreenOff", v23, v119);
    v7 = 1;
    v9 = v26;
  }
LABEL_47:
  objc_msgSend(v4, "deviceFilter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  deviceFilter = self->_deviceFilter;
  v29 = v27;
  v30 = deviceFilter;
  if (v29 == v30)
  {

  }
  else
  {
    v31 = v30;
    if ((v29 == 0) != (v30 != 0))
    {
      v32 = -[NSArray isEqual:](v29, "isEqual:", v30);

      if ((v32 & 1) != 0)
      {
        if (objc_msgSend(v4, "discoveryFlags") == self->_discoveryFlags)
          goto LABEL_51;
        goto LABEL_62;
      }
    }
    else
    {

    }
    CUPrintNSObjectOneLine();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceFilter");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSObjectOneLine();
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v45 = v9;

    objc_msgSend(v4, "deviceFilter", v43, v121);
    v46 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v29 = self->_deviceFilter;
    self->_deviceFilter = v46;
    v7 = 1;
    v9 = v45;
  }

  if (objc_msgSend(v4, "discoveryFlags") == self->_discoveryFlags)
  {
LABEL_51:
    v33 = ($77478E09546100A0DB2933F271BBC655 *)(v4 + 41);
    p_discoveryTypesInternal = &self->_discoveryTypesInternal;
    if (*(_DWORD *)(v4 + 41) == *(_DWORD *)&self->_discoveryTypesInternal)
      goto LABEL_53;
    goto LABEL_52;
  }
LABEL_62:
  CUPrintFlags64();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "discoveryFlags");
  CUPrintFlags64();
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  CUAppendF();
  v48 = v9;

  self->_discoveryFlags = objc_msgSend(v4, "discoveryFlags", v47, v122);
  v7 = 1;
  v9 = v48;
  v33 = ($77478E09546100A0DB2933F271BBC655 *)(v4 + 41);
  p_discoveryTypesInternal = &self->_discoveryTypesInternal;
  if (*(_DWORD *)(v4 + 41) != *(_DWORD *)&self->_discoveryTypesInternal)
  {
LABEL_52:
    CBDiscoveryTypesToString((uint64_t)p_discoveryTypesInternal);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    CBDiscoveryTypesToString((uint64_t)v33);
    v105 = v35;
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v36 = v9;

    *p_discoveryTypesInternal = *v33;
    v7 = 1;
    v9 = v36;
  }
LABEL_53:
  objc_msgSend(v4, "oobKeys", v105, v115);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  oobKeys = self->_oobKeys;
  v39 = v37;
  v40 = oobKeys;
  if (v39 == v40)
  {

LABEL_66:
    goto LABEL_67;
  }
  v41 = v40;
  if ((v39 == 0) == (v40 != 0))
  {

    goto LABEL_65;
  }
  v42 = -[NSArray isEqual:](v39, "isEqual:", v40);

  if ((v42 & 1) == 0)
  {
LABEL_65:
    CUPrintNSObjectOneLine();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "oobKeys");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSObjectOneLine();
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v51 = v9;

    objc_msgSend(v4, "oobKeys", v49, v123);
    v52 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v39 = self->_oobKeys;
    self->_oobKeys = v52;
    v7 = 1;
    v9 = v51;
    goto LABEL_66;
  }
LABEL_67:
  objc_msgSend(v4, "serviceUUIDs");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  serviceUUIDs = self->_serviceUUIDs;
  v55 = v53;
  v56 = serviceUUIDs;
  if (v55 == v56)
  {

  }
  else
  {
    v57 = v56;
    if ((v55 == 0) != (v56 != 0))
    {
      v58 = -[NSArray isEqual:](v55, "isEqual:", v56);

      if ((v58 & 1) != 0)
      {
        v59 = objc_msgSend(v4, "useCase");
        useCase = self->_useCase;
        if (v59 == useCase)
          goto LABEL_72;
        goto LABEL_71;
      }
    }
    else
    {

    }
    CUPrintNSObjectOneLine();
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceUUIDs");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSObjectOneLine();
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v89 = v9;

    objc_msgSend(v4, "serviceUUIDs", v87, v127);
    v90 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v55 = self->_serviceUUIDs;
    self->_serviceUUIDs = v90;
    v7 = 1;
    v9 = v89;
  }

  v59 = objc_msgSend(v4, "useCase");
  useCase = self->_useCase;
  if (v59 != useCase)
  {
LABEL_71:
    v107 = CBUseCaseToString_0(useCase);
    v120 = CBUseCaseToString_0(v59);
    CUAppendF();
    v61 = v9;

    self->_useCase = v59;
    v7 = 1;
    v9 = v61;
  }
LABEL_72:
  objc_msgSend(v4, "useCaseClientIDs", v107, v120);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  useCaseClientIDs = self->_useCaseClientIDs;
  v64 = v62;
  v65 = useCaseClientIDs;
  if (v64 == v65)
  {

    v86 = v64;
  }
  else
  {
    v66 = v65;
    if ((v64 == 0) != (v65 != 0))
    {
      v67 = -[NSArray isEqual:](v64, "isEqual:", v65);

      if ((v67 & 1) != 0)
      {
        v68 = objc_msgSend(v4, "bleSensorRssiIncreaseScanThreshold");
        bleSensorRssiIncreaseScanThreshold = self->_bleSensorRssiIncreaseScanThreshold;
        if (v68 == self->_bleSensorRssiIncreaseScanThreshold)
          goto LABEL_76;
        goto LABEL_99;
      }
    }
    else
    {

    }
    CUPrintNSObjectOneLine();
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintNSObjectOneLine();
    v108 = v91;
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v92 = v9;

    v93 = v64;
    v86 = self->_useCaseClientIDs;
    self->_useCaseClientIDs = v93;
    v7 = 1;
    v9 = v92;
  }

  v94 = objc_msgSend(v4, "bleSensorRssiIncreaseScanThreshold");
  bleSensorRssiIncreaseScanThreshold = self->_bleSensorRssiIncreaseScanThreshold;
  if (v94 == self->_bleSensorRssiIncreaseScanThreshold)
  {
LABEL_76:
    v70 = objc_msgSend(v4, "bleSensorEnableRssiIncreaseScan", v108, v124);
    bleSensorEnableRssiIncreaseScan = self->_bleSensorEnableRssiIncreaseScan;
    if (bleSensorEnableRssiIncreaseScan == v70)
      goto LABEL_77;
    goto LABEL_100;
  }
LABEL_99:
  v95 = objc_msgSend(v4, "bleSensorRssiIncreaseScanThreshold", v108, v124);
  v111 = bleSensorRssiIncreaseScanThreshold;
  v128 = v95;
  CUAppendF();
  v96 = v9;

  self->_bleSensorRssiIncreaseScanThreshold = objc_msgSend(v4, "bleSensorRssiIncreaseScanThreshold", v111, v128);
  v7 = 1;
  v9 = v96;
  v97 = objc_msgSend(v4, "bleSensorEnableRssiIncreaseScan");
  bleSensorEnableRssiIncreaseScan = self->_bleSensorEnableRssiIncreaseScan;
  if (bleSensorEnableRssiIncreaseScan == v97)
  {
LABEL_77:
    v72 = objc_msgSend(v4, "bleSensorIncreaseScanRate");
    bleSensorIncreaseScanRate = self->_bleSensorIncreaseScanRate;
    if (v72 == (_DWORD)bleSensorIncreaseScanRate)
      goto LABEL_78;
    goto LABEL_101;
  }
LABEL_100:
  v112 = bleSensorEnableRssiIncreaseScan;
  v129 = objc_msgSend(v4, "bleSensorEnableRssiIncreaseScan");
  CUAppendF();
  v98 = v9;

  self->_bleSensorEnableRssiIncreaseScan = objc_msgSend(v4, "bleSensorEnableRssiIncreaseScan", v112, v129);
  v7 = 1;
  v9 = v98;
  v99 = objc_msgSend(v4, "bleSensorIncreaseScanRate");
  bleSensorIncreaseScanRate = self->_bleSensorIncreaseScanRate;
  if (v99 == (_DWORD)bleSensorIncreaseScanRate)
  {
LABEL_78:
    v74 = objc_msgSend(v4, "bleSensorIncreaseScanTimeout");
    bleSensorIncreaseScanTimeout = self->_bleSensorIncreaseScanTimeout;
    if (v74 == (_DWORD)bleSensorIncreaseScanTimeout)
      goto LABEL_79;
    goto LABEL_102;
  }
LABEL_101:
  v113 = bleSensorIncreaseScanRate;
  v130 = objc_msgSend(v4, "bleSensorIncreaseScanRate");
  CUAppendF();
  v100 = v9;

  self->_bleSensorIncreaseScanRate = objc_msgSend(v4, "bleSensorIncreaseScanRate", v113, v130);
  v7 = 1;
  v9 = v100;
  v101 = objc_msgSend(v4, "bleSensorIncreaseScanTimeout");
  bleSensorIncreaseScanTimeout = self->_bleSensorIncreaseScanTimeout;
  if (v101 == (_DWORD)bleSensorIncreaseScanTimeout)
  {
LABEL_79:
    v76 = objc_msgSend(v4, "bleSensorTimeoutBetweenIncreaseScan");
    bleSensorTimeoutBetweenIncreaseScan = self->_bleSensorTimeoutBetweenIncreaseScan;
    if (v76 == (_DWORD)bleSensorTimeoutBetweenIncreaseScan)
      goto LABEL_81;
    goto LABEL_80;
  }
LABEL_102:
  v114 = bleSensorIncreaseScanTimeout;
  v131 = objc_msgSend(v4, "bleSensorIncreaseScanTimeout");
  CUAppendF();
  v102 = v9;

  self->_bleSensorIncreaseScanTimeout = objc_msgSend(v4, "bleSensorIncreaseScanTimeout", v114, v131);
  v7 = 1;
  v9 = v102;
  v103 = objc_msgSend(v4, "bleSensorTimeoutBetweenIncreaseScan");
  bleSensorTimeoutBetweenIncreaseScan = self->_bleSensorTimeoutBetweenIncreaseScan;
  if (v103 != (_DWORD)bleSensorTimeoutBetweenIncreaseScan)
  {
LABEL_80:
    v109 = bleSensorTimeoutBetweenIncreaseScan;
    v125 = objc_msgSend(v4, "bleSensorTimeoutBetweenIncreaseScan");
    CUAppendF();
    v78 = v9;

    self->_bleSensorTimeoutBetweenIncreaseScan = objc_msgSend(v4, "bleSensorTimeoutBetweenIncreaseScan", v109, v125);
    v7 = 1;
    v9 = v78;
  }
LABEL_81:
  objc_msgSend(v4, "typeToRssiThresholds");
  v79 = (NSArray *)objc_claimAutoreleasedReturnValue();
  typeToRssiThresholds = self->_typeToRssiThresholds;

  if (v79 != typeToRssiThresholds)
  {
    v81 = self->_typeToRssiThresholds;
    objc_msgSend(v4, "typeToRssiThresholds");
    v110 = v81;
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v82 = v9;

    objc_msgSend(v4, "typeToRssiThresholds", v110, v126);
    v83 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v84 = self->_typeToRssiThresholds;
    self->_typeToRssiThresholds = v83;

    v7 = 1;
    v9 = v82;
  }
  var0 = self->_ucat->var0;
  if (v9)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
LABEL_91:
      LogPrintF_safe();
  }
  else if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_91;
  }

  return v7;
}

- (void)setSystemOverrideHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void)setDevicesBufferedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)dealloc
{
  NSString *v3;
  NSString *v4;
  LogCategory *ucat;
  objc_super v6;

  v3 = self->_mockID;
  v4 = v3;
  if (v3)
    CBMockRemoveDiscovery(v3, self);
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CBDiscovery;
  -[CBDiscovery dealloc](&v6, sel_dealloc);
}

- (unsigned)bleSensorTimeoutBetweenIncreaseScan
{
  return self->_bleSensorTimeoutBetweenIncreaseScan;
}

- (char)bleSensorRssiIncreaseScanThreshold
{
  return self->_bleSensorRssiIncreaseScanThreshold;
}

- (unsigned)bleSensorIncreaseScanTimeout
{
  return self->_bleSensorIncreaseScanTimeout;
}

- (unsigned)bleSensorIncreaseScanRate
{
  return self->_bleSensorIncreaseScanRate;
}

- (BOOL)bleSensorEnableRssiIncreaseScan
{
  return self->_bleSensorEnableRssiIncreaseScan;
}

- (unsigned)bleRSSIThresholdOrder
{
  return self->_bleRSSIThresholdOrder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_typeToRssiThresholds, 0);
  objc_storeStrong((id *)&self->_serviceUUIDs, 0);
  objc_storeStrong((id *)&self->_oobKeys, 0);
  objc_storeStrong((id *)&self->_mockID, 0);
  objc_storeStrong(&self->_finishHandler, 0);
  objc_storeStrong((id *)&self->_deviceFilter, 0);
  objc_storeStrong((id *)&self->_useCaseClientIDs, 0);
  objc_storeStrong(&self->_systemOverrideHandler, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_devicesBufferedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

+ (id)devicesWithDiscoveryFlags:(unint64_t)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "devicesWithDiscoveryFlags:endpoint:error:", a3, 0, a4);
}

+ (id)devicesWithDiscoveryFlags:(unint64_t)a3 endpoint:(id)a4 error:(id *)a5
{
  id v7;
  xpc_object_t v8;
  NSObject *v9;
  NSObject *v10;
  _xpc_endpoint_s *v11;
  _xpc_endpoint_s *v12;
  _xpc_connection_s *mach_service;
  xpc_object_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v33;
  _QWORD applier[6];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v7 = a4;
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "mTyp", "DsGD");
  xpc_dictionary_set_uint64(v8, "dsFl", a3);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = dispatch_queue_create("CBDiscovery-GetDevices", v9);

  v11 = (_xpc_endpoint_s *)v7;
  v12 = v11;
  if (v11)
  {
    mach_service = xpc_connection_create_from_endpoint(v11);
    xpc_connection_set_target_queue(mach_service, v10);
  }
  else
  {
    mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", v10, 0);
  }
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_5);
  xpc_connection_activate(mach_service);
  v14 = xpc_connection_send_message_with_reply_sync(mach_service, v8);
  xpc_connection_cancel(mach_service);
  if (v14)
  {
    CUXPCDecodeNSErrorIfNeeded();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v31 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v21);
    }
    else
    {
      xpc_dictionary_get_array(v14, "devA");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v41 = 0;
        v42 = &v41;
        v43 = 0x3032000000;
        v44 = __Block_byref_object_copy__4;
        v45 = __Block_byref_object_dispose__4;
        v46 = 0;
        v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v35 = 0;
        v36 = &v35;
        v37 = 0x3032000000;
        v38 = __Block_byref_object_copy__4;
        v39 = __Block_byref_object_dispose__4;
        v40 = 0;
        applier[0] = MEMORY[0x1E0C809B0];
        applier[1] = 3221225472;
        applier[2] = __56__CBDiscovery_devicesWithDiscoveryFlags_endpoint_error___block_invoke_2;
        applier[3] = &unk_1E5402490;
        applier[4] = &v35;
        applier[5] = &v41;
        xpc_array_apply(v29, applier);
        v30 = (void *)v36[5];
        if (v30)
        {
          v31 = 0;
          if (a5)
            *a5 = objc_retainAutorelease(v30);
        }
        else
        {
          v31 = (id)v42[5];
        }
        _Block_object_dispose(&v35, 8);

        _Block_object_dispose(&v41, 8);
      }
      else if (a5)
      {
        CBErrorF(-6700, (uint64_t)"No devices", v23, v24, v25, v26, v27, v28, (uint64_t)a5);
        v31 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = 0;
      }

    }
  }
  else if (a5)
  {
    CBErrorF(-6700, (uint64_t)"No reply", v15, v16, v17, v18, v19, v20, v33);
    v31 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (void)setBleScanRate:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__CBDiscovery_setBleScanRate___block_invoke;
  v3[3] = &unk_1E53FFAA0;
  v4 = a3;
  v3[4] = self;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __30__CBDiscovery_setBleScanRate___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(_DWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 84);
  if (v1 != v3)
    *(_DWORD *)(v2 + 84) = v1;
  return v1 != v3;
}

- (void)setBleScanRateScreenOff:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__CBDiscovery_setBleScanRateScreenOff___block_invoke;
  v3[3] = &unk_1E53FFAA0;
  v4 = a3;
  v3[4] = self;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __39__CBDiscovery_setBleScanRateScreenOff___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(_DWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 92);
  if (v1 != v3)
    *(_DWORD *)(v2 + 92) = v1;
  return v1 != v3;
}

- (void)setDeviceFilter:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CBDiscovery *v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__CBDiscovery_setDeviceFilter___block_invoke;
  v6[3] = &unk_1E53FFA50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);

}

BOOL __31__CBDiscovery_setDeviceFilter___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  char v7;
  void *v9;
  uint64_t v10;
  id v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 232);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  v5 = v3 != v4;
  if (v3 == v4)
  {

  }
  else
  {
    v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      v7 = objc_msgSend(v3, "isEqual:", v4);

      if ((v7 & 1) != 0)
        return 0;
    }
    else
    {

    }
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = v9;
    v3 = *(id *)(v10 + 232);
    *(_QWORD *)(v10 + 232) = v11;
  }

  return v5;
}

- (void)addDiscoveryType:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__CBDiscovery_addDiscoveryType___block_invoke;
  v3[3] = &unk_1E53FFAA0;
  v3[4] = self;
  v4 = a3;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

uint64_t __32__CBDiscovery_addDiscoveryType___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  int v6;
  unint64_t v7;
  int v8;

  v2 = *(_DWORD *)(a1 + 40);
  result = 1;
  if ((v2 - 30) >= 0xFFFFFFE3)
  {
    v4 = *(_QWORD *)(a1 + 32) + 41;
    v5 = (v2 - 1);
    v6 = 1 << (-(char)v2 & 7);
    v7 = v5 >> 3;
    v8 = *(unsigned __int8 *)(v4 + (v5 >> 3));
    result = 0;
    if ((v6 & v8) == 0)
    {
      *(_BYTE *)(v4 + v7) = v8 | v6;
      return 1;
    }
  }
  return result;
}

- (void)clearDuplicateFilterCache
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CBDiscovery_clearDuplicateFilterCache__block_invoke;
  block[3] = &unk_1E53FF780;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __40__CBDiscovery_clearDuplicateFilterCache__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _xpc_connection_s *v3;
  xpc_object_t xdict;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 45) && (*(_BYTE *)(v1 + 43) & 0x20) != 0 && *(_DWORD *)(v1 + 80) == 524290)
  {
    if (gCBDaemonServer)
    {
      objc_msgSend((id)gCBDaemonServer, "clearDuplicateFilterCache:");
    }
    else
    {
      xdict = xpc_dictionary_create(0, 0, 0);
      objc_msgSend(*(id *)(a1 + 32), "encodeWithXPCObject:", xdict);
      xpc_dictionary_set_string(xdict, "mTyp", "DsCD");
      objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
      v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_send_message(v3, xdict);

    }
  }
}

- (void)removeDiscoveryType:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__CBDiscovery_removeDiscoveryType___block_invoke;
  v3[3] = &unk_1E53FFAA0;
  v3[4] = self;
  v4 = a3;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

uint64_t __35__CBDiscovery_removeDiscoveryType___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  int v6;

  v1 = *(_DWORD *)(a1 + 40);
  if ((v1 - 30) < 0xFFFFFFE3)
    return 0;
  v2 = *(_QWORD *)(a1 + 32) + 41;
  v3 = (v1 - 1);
  v4 = 1 << (-(char)v1 & 7);
  v5 = v3 >> 3;
  v6 = *(unsigned __int8 *)(v2 + (v3 >> 3));
  if ((v4 & v6) == 0)
    return 0;
  *(_BYTE *)(v2 + v5) = v6 & ~(_BYTE)v4;
  return 1;
}

- (void)removeAllDiscoveryTypes
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __38__CBDiscovery_removeAllDiscoveryTypes__block_invoke;
  v2[3] = &unk_1E54023F0;
  v2[4] = self;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v2);
}

BOOL __38__CBDiscovery_removeAllDiscoveryTypes__block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_DWORD *)(v1 + 41);
  if (v2)
    *(_DWORD *)(v1 + 41) = 0;
  return v2 != 0;
}

- (void)setLabel:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_label, a3);
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  LogCategoryReplaceF();

}

- (void)setOobKeys:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CBDiscovery *v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__CBDiscovery_setOobKeys___block_invoke;
  v6[3] = &unk_1E53FFA50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);

}

BOOL __26__CBDiscovery_setOobKeys___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  char v7;
  void *v9;
  uint64_t v10;
  id v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 264);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  v5 = v3 != v4;
  if (v3 == v4)
  {

  }
  else
  {
    v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      v7 = objc_msgSend(v3, "isEqual:", v4);

      if ((v7 & 1) != 0)
        return 0;
    }
    else
    {

    }
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = v9;
    v3 = *(id *)(v10 + 264);
    *(_QWORD *)(v10 + 264) = v11;
  }

  return v5;
}

- (void)setServiceUUIDs:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CBDiscovery *v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__CBDiscovery_setServiceUUIDs___block_invoke;
  v6[3] = &unk_1E53FFA50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);

}

BOOL __31__CBDiscovery_setServiceUUIDs___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  char v7;
  void *v9;
  uint64_t v10;
  id v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 272);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  v5 = v3 != v4;
  if (v3 == v4)
  {

  }
  else
  {
    v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      v7 = objc_msgSend(v3, "isEqual:", v4);

      if ((v7 & 1) != 0)
        return 0;
    }
    else
    {

    }
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = v9;
    v3 = *(id *)(v10 + 272);
    *(_QWORD *)(v10 + 272) = v11;
  }

  return v5;
}

- (void)setTypeToRssiThresholds:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CBDiscovery *v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__CBDiscovery_setTypeToRssiThresholds___block_invoke;
  v6[3] = &unk_1E53FFA50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);

}

BOOL __39__CBDiscovery_setTypeToRssiThresholds___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  char v7;
  void *v9;
  uint64_t v10;
  id v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 280);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  v5 = v3 != v4;
  if (v3 == v4)
  {

  }
  else
  {
    v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      v7 = objc_msgSend(v3, "isEqual:", v4);

      if ((v7 & 1) != 0)
        return 0;
    }
    else
    {

    }
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = v9;
    v3 = *(id *)(v10 + 280);
    *(_QWORD *)(v10 + 280) = v11;
  }

  return v5;
}

- (void)setUseCase:(unsigned int)a3
{
  _QWORD v3[5];
  unsigned int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __26__CBDiscovery_setUseCase___block_invoke;
  v3[3] = &unk_1E53FFAA0;
  v4 = a3;
  v3[4] = self;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __26__CBDiscovery_setUseCase___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(_DWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 80);
  if (v1 != v3)
    *(_DWORD *)(v2 + 80) = v1;
  return v1 != v3;
}

- (void)setUseCaseClientIDs:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CBDiscovery *v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__CBDiscovery_setUseCaseClientIDs___block_invoke;
  v6[3] = &unk_1E53FFA50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CBDiscovery _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);

}

BOOL __35__CBDiscovery_setUseCaseClientIDs___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  char v7;
  void *v9;
  uint64_t v10;
  id v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 216);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  v5 = v3 != v4;
  if (v3 == v4)
  {

  }
  else
  {
    v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      v7 = objc_msgSend(v3, "isEqual:", v4);

      if ((v7 & 1) != 0)
        return 0;
    }
    else
    {

    }
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = v9;
    v3 = *(id *)(v10 + 216);
    *(_QWORD *)(v10 + 216) = v11;
  }

  return v5;
}

- (unint64_t)updateWithXPCSubscriberInfo:(id)a3
{
  id v4;
  void *v5;
  uint64_t uint64;
  unint64_t v7;
  int64_t int64;
  uint64_t v9;
  NSArray *deviceFilter;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  char v14;
  NSArray *v15;
  const char *string;
  const char *v17;
  const char *v18;
  int *p_bleScanRateScreenOff;
  int *p_bleScanRate;
  int v21;
  unint64_t discoveryFlags;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  const char *v30;
  const char *v31;
  unsigned int v32;
  NSArray *oobKeys;
  NSArray *v34;
  NSArray *v35;
  NSArray *v36;
  char v37;
  NSArray *v38;
  NSArray *v39;
  NSArray *serviceUUIDs;
  NSArray *v41;
  NSArray *v42;
  NSArray *v43;
  char v44;
  NSArray *v45;
  NSArray *v46;
  int64_t v47;
  uint64_t v48;
  int64_t v49;
  int64_t v50;
  int64_t v51;
  int64_t v52;
  _BOOL4 v53;
  _BOOL4 v54;
  uint64_t v55;
  NSArray *typeToRssiThresholds;
  NSArray *v57;
  NSArray *v58;
  NSArray *v59;
  char v60;
  NSArray *v61;
  NSArray *v62;
  void *v64;
  _QWORD v65[5];
  uint64_t v66;
  $77478E09546100A0DB2933F271BBC655 *v67;
  uint64_t v68;
  const char *v69;
  int v70;
  _QWORD applier[6];
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  id v76;

  v4 = a3;
  v5 = v4;
  if (!v4 || MEMORY[0x1A85D2194](v4) != MEMORY[0x1E0C812F8])
  {
    v7 = 0;
    goto LABEL_144;
  }
  uint64 = xpc_dictionary_get_uint64(v5, "bleRSSIThresholdOrder");
  if (uint64 == self->_bleRSSIThresholdOrder)
  {
    v7 = 0;
  }
  else
  {
    self->_bleRSSIThresholdOrder = uint64;
    v7 = 0x80000000000;
  }
  int64 = xpc_dictionary_get_int64(v5, "bleRSSIThresholdHint");
  v9 = 127;
  if (int64 < 127)
    v9 = int64;
  if (v9 <= -128)
    v9 = -128;
  if (v9 != self->_bleRSSIThresholdHint)
  {
    self->_bleRSSIThresholdHint = v9;
    v7 = 0x80000000000;
  }
  v76 = 0;
  CUXPCDecodeNSArrayOfNSString();
  deviceFilter = self->_deviceFilter;
  v11 = (NSArray *)0;
  v12 = deviceFilter;
  if (v11 == v12)
  {

LABEL_19:
    goto LABEL_20;
  }
  v13 = v12;
  if ((v11 == 0) == (v12 != 0))
  {

    goto LABEL_18;
  }
  v14 = -[NSArray isEqual:](v11, "isEqual:", v12);

  if ((v14 & 1) == 0)
  {
LABEL_18:
    v15 = (NSArray *)objc_msgSend(v76, "copy");
    v11 = self->_deviceFilter;
    self->_deviceFilter = v15;
    v7 = 0x80000000000;
    goto LABEL_19;
  }
LABEL_20:
  string = xpc_dictionary_get_string(v5, "bleScanRate");
  v17 = xpc_dictionary_get_string(v5, "bleScanRateScreenOff");
  v18 = v17;
  p_bleScanRateScreenOff = &self->_bleScanRateScreenOff;
  if (!string)
  {
    if (!v17)
      goto LABEL_81;
    if (!strcmp(v17, "Default"))
    {
      *p_bleScanRateScreenOff = 0;
      v7 = 0x80000000000;
      if (strcmp(v18, "Periodic"))
      {
LABEL_41:
        if (strcmp(v18, "Background"))
          goto LABEL_42;
        goto LABEL_73;
      }
    }
    else if (strcmp(v18, "Periodic"))
    {
      goto LABEL_41;
    }
    *p_bleScanRateScreenOff = 10;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "Background"))
    {
LABEL_42:
      if (strcmp(v18, "Low"))
        goto LABEL_43;
      goto LABEL_74;
    }
LABEL_73:
    *p_bleScanRateScreenOff = 20;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "Low"))
    {
LABEL_43:
      if (strcmp(v18, "MediumLow"))
        goto LABEL_44;
      goto LABEL_75;
    }
LABEL_74:
    *p_bleScanRateScreenOff = 30;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "MediumLow"))
    {
LABEL_44:
      if (strcmp(v18, "Medium"))
        goto LABEL_45;
      goto LABEL_76;
    }
LABEL_75:
    *p_bleScanRateScreenOff = 35;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "Medium"))
    {
LABEL_45:
      if (strcmp(v18, "High"))
        goto LABEL_79;
LABEL_77:
      *p_bleScanRateScreenOff = 50;
      goto LABEL_78;
    }
LABEL_76:
    *p_bleScanRateScreenOff = 40;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "High"))
      goto LABEL_79;
    goto LABEL_77;
  }
  p_bleScanRate = &self->_bleScanRate;
  v21 = strcmp(string, "Default");
  if (v18)
  {
    if (v21)
    {
      if (strcmp(v18, "Default"))
        goto LABEL_24;
    }
    else
    {
      *p_bleScanRate = 0;
      v7 = 0x80000000000;
      if (strcmp(v18, "Default"))
      {
LABEL_24:
        if (strcmp(string, "Periodic"))
          goto LABEL_25;
        goto LABEL_58;
      }
    }
    *p_bleScanRateScreenOff = 0;
    v7 |= 0x80000000000uLL;
    if (strcmp(string, "Periodic"))
    {
LABEL_25:
      if (strcmp(v18, "Periodic"))
        goto LABEL_26;
      goto LABEL_59;
    }
LABEL_58:
    *p_bleScanRate = 10;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "Periodic"))
    {
LABEL_26:
      if (strcmp(string, "Background"))
        goto LABEL_27;
      goto LABEL_60;
    }
LABEL_59:
    *p_bleScanRateScreenOff = 10;
    v7 |= 0x80000000000uLL;
    if (strcmp(string, "Background"))
    {
LABEL_27:
      if (strcmp(v18, "Background"))
        goto LABEL_28;
      goto LABEL_61;
    }
LABEL_60:
    *p_bleScanRate = 20;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "Background"))
    {
LABEL_28:
      if (strcmp(string, "Low"))
        goto LABEL_29;
      goto LABEL_62;
    }
LABEL_61:
    *p_bleScanRateScreenOff = 20;
    v7 |= 0x80000000000uLL;
    if (strcmp(string, "Low"))
    {
LABEL_29:
      if (strcmp(v18, "Low"))
        goto LABEL_30;
      goto LABEL_63;
    }
LABEL_62:
    *p_bleScanRate = 30;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "Low"))
    {
LABEL_30:
      if (strcmp(string, "MediumLow"))
        goto LABEL_31;
      goto LABEL_64;
    }
LABEL_63:
    *p_bleScanRateScreenOff = 30;
    v7 |= 0x80000000000uLL;
    if (strcmp(string, "MediumLow"))
    {
LABEL_31:
      if (strcmp(v18, "MediumLow"))
        goto LABEL_32;
      goto LABEL_65;
    }
LABEL_64:
    *p_bleScanRate = 35;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "MediumLow"))
    {
LABEL_32:
      if (strcmp(string, "Medium"))
        goto LABEL_33;
      goto LABEL_66;
    }
LABEL_65:
    *p_bleScanRateScreenOff = 35;
    v7 |= 0x80000000000uLL;
    if (strcmp(string, "Medium"))
    {
LABEL_33:
      if (strcmp(v18, "Medium"))
        goto LABEL_34;
      goto LABEL_67;
    }
LABEL_66:
    *p_bleScanRate = 40;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "Medium"))
    {
LABEL_34:
      if (strcmp(string, "High"))
        goto LABEL_35;
      goto LABEL_68;
    }
LABEL_67:
    *p_bleScanRateScreenOff = 40;
    v7 |= 0x80000000000uLL;
    if (strcmp(string, "High"))
    {
LABEL_35:
      if (strcmp(v18, "High"))
        goto LABEL_36;
      goto LABEL_69;
    }
LABEL_68:
    *p_bleScanRate = 50;
    v7 |= 0x80000000000uLL;
    if (strcmp(v18, "High"))
    {
LABEL_36:
      if (strcmp(string, "Max"))
        goto LABEL_79;
LABEL_70:
      *p_bleScanRate = 60;
LABEL_78:
      v7 |= 0x80000000000uLL;
LABEL_79:
      if (strcmp(v18, "Max"))
        goto LABEL_81;
      goto LABEL_80;
    }
LABEL_69:
    *p_bleScanRateScreenOff = 50;
    v7 |= 0x80000000000uLL;
    if (strcmp(string, "Max"))
      goto LABEL_79;
    goto LABEL_70;
  }
  if (v21)
  {
    if (strcmp(string, "Periodic"))
      goto LABEL_49;
  }
  else
  {
    *p_bleScanRate = 0;
    v7 = 0x80000000000;
    if (strcmp(string, "Periodic"))
    {
LABEL_49:
      if (strcmp(string, "Background"))
        goto LABEL_50;
      goto LABEL_147;
    }
  }
  *p_bleScanRate = 10;
  v7 |= 0x80000000000uLL;
  if (strcmp(string, "Background"))
  {
LABEL_50:
    if (strcmp(string, "Low"))
      goto LABEL_51;
    goto LABEL_148;
  }
LABEL_147:
  *p_bleScanRate = 20;
  v7 |= 0x80000000000uLL;
  if (strcmp(string, "Low"))
  {
LABEL_51:
    if (strcmp(string, "MediumLow"))
      goto LABEL_52;
    goto LABEL_149;
  }
LABEL_148:
  *p_bleScanRate = 30;
  v7 |= 0x80000000000uLL;
  if (strcmp(string, "MediumLow"))
  {
LABEL_52:
    if (strcmp(string, "Medium"))
      goto LABEL_53;
    goto LABEL_150;
  }
LABEL_149:
  *p_bleScanRate = 35;
  v7 |= 0x80000000000uLL;
  if (strcmp(string, "Medium"))
  {
LABEL_53:
    if (strcmp(string, "High"))
      goto LABEL_54;
    goto LABEL_151;
  }
LABEL_150:
  *p_bleScanRate = 40;
  v7 |= 0x80000000000uLL;
  if (strcmp(string, "High"))
  {
LABEL_54:
    p_bleScanRateScreenOff = &self->_bleScanRate;
    if (strcmp(string, "Max"))
      goto LABEL_81;
    goto LABEL_80;
  }
LABEL_151:
  *p_bleScanRate = 50;
  v7 |= 0x80000000000uLL;
  p_bleScanRateScreenOff = &self->_bleScanRate;
  if (!strcmp(string, "Max"))
  {
LABEL_80:
    *p_bleScanRateScreenOff = 60;
    v7 |= 0x80000000000uLL;
  }
LABEL_81:
  discoveryFlags = self->_discoveryFlags;
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = 0;
  xpc_dictionary_get_array(v5, "discoveryFlags");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  v25 = MEMORY[0x1E0C809B0];
  if (v23)
  {
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __43__CBDiscovery_updateWithXPCSubscriberInfo___block_invoke;
    applier[3] = &unk_1E5402418;
    applier[4] = self;
    applier[5] = &v72;
    xpc_array_apply(v23, applier);
  }
  v26 = v73[3];
  if (v26 != discoveryFlags)
  {
    self->_discoveryFlags = v26;
    v7 |= 0x800000000uLL;
  }
  v66 = 0;
  v67 = ($77478E09546100A0DB2933F271BBC655 *)&v66;
  v68 = 0x2810000000;
  v69 = "";
  v70 = 0;
  xpc_dictionary_get_array(v5, "discoveryTypes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    v65[0] = v25;
    v65[1] = 3221225472;
    v65[2] = __43__CBDiscovery_updateWithXPCSubscriberInfo___block_invoke_2;
    v65[3] = &unk_1E5402080;
    v65[4] = &v66;
    xpc_array_apply(v27, v65);
  }

  if (*(_DWORD *)&v67[8] != *(_DWORD *)&self->_discoveryTypesInternal)
  {
    self->_discoveryTypesInternal = v67[8];
    v7 |= 0x800000000uLL;
  }
  v29 = xpc_dictionary_get_BOOL(v5, "keepAlive");
  if (self->_keepAlive != v29)
  {
    self->_keepAlive = v29;
    v7 |= 0x80000000000uLL;
  }
  v30 = xpc_dictionary_get_string(v5, "memoryPressure");
  if (v30)
    v31 = v30;
  else
    v31 = "";
  if (!strcmp(v31, "warn"))
  {
    v32 = 2;
    if (self->_memoryPressureFlags != 2)
    {
LABEL_99:
      self->_memoryPressureFlags = v32;
      v7 |= 0x80000000000uLL;
    }
  }
  else
  {
    if (!strcmp(v31, "critical"))
      v32 = 6;
    else
      v32 = 0;
    if (v32 != self->_memoryPressureFlags)
      goto LABEL_99;
  }
  objc_opt_class();
  CUXPCDecodeNSArrayOfClass();
  oobKeys = self->_oobKeys;
  v34 = (NSArray *)0;
  v35 = oobKeys;
  if (v34 == v35)
  {

    goto LABEL_109;
  }
  v36 = v35;
  if ((v34 == 0) == (v35 != 0))
  {

    goto LABEL_108;
  }
  v37 = -[NSArray isEqual:](v34, "isEqual:", v35);

  if ((v37 & 1) == 0)
  {
LABEL_108:
    v38 = (NSArray *)objc_msgSend(0, "copy");
    v39 = self->_oobKeys;
    self->_oobKeys = v38;

    v7 |= 0x80000000000uLL;
  }
LABEL_109:
  objc_opt_class();
  CUXPCDecodeNSArrayOfClass();
  serviceUUIDs = self->_serviceUUIDs;
  v41 = (NSArray *)0;
  v42 = serviceUUIDs;
  if (v41 == v42)
  {

    goto LABEL_116;
  }
  v43 = v42;
  if ((v41 == 0) == (v42 != 0))
  {

    goto LABEL_115;
  }
  v44 = -[NSArray isEqual:](v41, "isEqual:", v42);

  if ((v44 & 1) == 0)
  {
LABEL_115:
    v45 = (NSArray *)objc_msgSend(0, "copy");
    v46 = self->_serviceUUIDs;
    self->_serviceUUIDs = v45;

    v7 |= 0x80000000000uLL;
  }
LABEL_116:
  v47 = xpc_dictionary_get_int64(v5, "bleSensorRssiIncreaseScanThreshold");
  v48 = 127;
  if (v47 < 127)
    v48 = v47;
  if (v48 <= -128)
    v48 = -128;
  if (v48 != self->_bleSensorRssiIncreaseScanThreshold)
  {
    self->_bleSensorRssiIncreaseScanThreshold = v48;
    v7 |= 0x80000000000uLL;
  }
  v49 = xpc_dictionary_get_int64(v5, "bleSensorEnableRssiIncreaseScan");
  if (v49 != self->_bleSensorEnableRssiIncreaseScan)
  {
    self->_bleSensorEnableRssiIncreaseScan = v49 != 0;
    v7 |= 0x80000000000uLL;
  }
  v50 = xpc_dictionary_get_int64(v5, "bleSensorIncreaseScanRate");
  if (v50 != self->_bleSensorIncreaseScanRate)
  {
    self->_bleSensorIncreaseScanRate = v50;
    v7 |= 0x80000000000uLL;
  }
  v51 = xpc_dictionary_get_int64(v5, "bleSensorIncreaseScanTimeout");
  if (v51 != self->_bleSensorIncreaseScanTimeout)
  {
    self->_bleSensorIncreaseScanTimeout = v51;
    v7 |= 0x80000000000uLL;
  }
  v52 = xpc_dictionary_get_int64(v5, "bleSensorTimeoutBetweenIncreaseScan");
  if (v52 != self->_bleSensorTimeoutBetweenIncreaseScan)
  {
    self->_bleSensorTimeoutBetweenIncreaseScan = v52;
    v7 |= 0x80000000000uLL;
  }
  v53 = xpc_dictionary_get_BOOL(v5, "denyLowPowerModeScans");
  if (self->_denyLowPowerModeScans != v53)
  {
    self->_denyLowPowerModeScans = v53;
    v7 |= 0x80000000000uLL;
  }
  v54 = xpc_dictionary_get_BOOL(v5, "denyScreenLockedScans");
  if (self->_denyScreenLockedScans != v54)
  {
    self->_denyScreenLockedScans = v54;
    v7 |= 0x80000000000uLL;
  }
  v55 = xpc_dictionary_get_uint64(v5, "deviceSetupState");
  if (v55 != self->_deviceSetupState)
  {
    self->_deviceSetupState = v55;
    v7 |= 0x80000000000uLL;
  }
  v64 = 0;
  objc_opt_class();
  CUXPCDecodeNSArrayOfClass();
  typeToRssiThresholds = self->_typeToRssiThresholds;
  v57 = (NSArray *)0;
  v58 = typeToRssiThresholds;
  if (v57 == v58)
  {

  }
  else
  {
    v59 = v58;
    if ((v57 == 0) != (v58 != 0))
    {
      v60 = -[NSArray isEqual:](v57, "isEqual:", v58);

      if ((v60 & 1) != 0)
        goto LABEL_143;
    }
    else
    {

    }
    v61 = (NSArray *)objc_msgSend(0, "copy", 0);
    v62 = self->_typeToRssiThresholds;
    self->_typeToRssiThresholds = v61;

    v7 |= 0x80000000000uLL;
  }
LABEL_143:

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v72, 8);

LABEL_144:
  return v7;
}

uint64_t __43__CBDiscovery_updateWithXPCSubscriberInfo___block_invoke(uint64_t a1, int a2, xpc_object_t xstring)
{
  const char *string_ptr;
  const char *v5;
  int v6;

  string_ptr = xpc_string_get_string_ptr(xstring);
  if (!string_ptr)
    return 1;
  v5 = string_ptr;
  if (!strcmp(string_ptr, "ApplePay"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 1uLL;
    return 1;
  }
  if (!strcmp(v5, "AppleTVSetup"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 2uLL;
    return 1;
  }
  else if (!strcmp(v5, "AppSignIn"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 4uLL;
    return 1;
  }
  else if (!strcmp(v5, "BLEAdvertisementData"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x40000000uLL;
    return 1;
  }
  else if (!strcmp(v5, "BLEPresent"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x20000000uLL;
    return 1;
  }
  else if (!strcmp(v5, "CNJ"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x10000000000000uLL;
    return 1;
  }
  else if (!strcmp(v5, "CompanionAuthentication"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x10000000uLL;
    return 1;
  }
  else if (!strcmp(v5, "CompanionLink"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 8uLL;
    return 1;
  }
  else if (!strcmp(v5, "HomePodSetup"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x10uLL;
    return 1;
  }
  else if (!strcmp(v5, "iOSSetup"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x20uLL;
    return 1;
  }
  else if (!strcmp(v5, "NearbyAction"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x80000uLL;
    return 1;
  }
  else if (!strcmp(v5, "NearbyInfo"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x40uLL;
    return 1;
  }
  else if (!strcmp(v5, "OSR"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x800000000000uLL;
    return 1;
  }
  else if (!strcmp(v5, "PassiveRSSI"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x100000uLL;
    return 1;
  }
  else if (!strcmp(v5, "ProxControl"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x200000000000uLL;
    return 1;
  }
  else if (!strcmp(v5, "ProxRepair"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x200uLL;
    return 1;
  }
  else if (!strcmp(v5, "RemoteDisplay"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x100uLL;
    return 1;
  }
  else if (!strcmp(v5, "RemotePairing"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x20000uLL;
    return 1;
  }
  else if (!strcmp(v5, "ShareAudio"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x400uLL;
    return 1;
  }
  else if (!strcmp(v5, "SIMTransfer"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x4000000000000000uLL;
    return 1;
  }
  else if (!strcmp(v5, "TVLatencySetup"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x800uLL;
    return 1;
  }
  else if (!strcmp(v5, "WatchSetup"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x20000000000000uLL;
    return 1;
  }
  else if (!strcmp(v5, "WHASetup"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x1000uLL;
    return 1;
  }
  else if (!strcmp(v5, "WiFiPassword"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x2000uLL;
    return 1;
  }
  else if (!strcmp(v5, "WxSetup"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x4000uLL;
    return 1;
  }
  else if (!strcmp(v5, "WxStatus"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x8000uLL;
    return 1;
  }
  else if (!strcmp(v5, "ObjectSetup"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x10000uLL;
    return 1;
  }
  else if (!strcmp(v5, "Connections"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x200000uLL;
    return 1;
  }
  else if (!strcmp(v5, "Pairing"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x800000uLL;
    return 1;
  }
  else
  {
    if (strcmp(v5, "ScreenOff"))
    {
      v6 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 48);
      if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
        return 1;
      }
      return 1;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 0x2000000uLL;
    return 1;
  }
}

uint64_t __43__CBDiscovery_updateWithXPCSubscriberInfo___block_invoke_2(uint64_t a1, int a2, xpc_object_t xstring)
{
  const char *string_ptr;
  int v5;
  unint64_t v6;

  string_ptr = xpc_string_get_string_ptr(xstring);
  if (string_ptr)
  {
    v5 = CBDiscoveryTypeFromCString(string_ptr);
    if ((v5 - 30) >= 0xFFFFFFE3)
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + ((unint64_t)(v5 - 1) >> 3);
      *(_BYTE *)(v6 + 32) |= 1 << (-(char)v5 & 7);
    }
  }
  return 1;
}

- (OS_xpc_object)xpcSubscriberRepresentation
{
  xpc_object_t v3;
  void *v4;
  NSArray *v5;
  const char *v6;
  const char *v7;
  unint64_t discoveryFlags;
  xpc_object_t v9;
  void *v10;
  const char *v11;
  xpc_object_t v12;
  char **v13;
  char *v14;
  int v15;
  unsigned int memoryPressureFlags;
  const char *v17;
  NSArray *v18;
  NSArray *v19;
  int64_t bleSensorIncreaseScanRate;
  int64_t bleSensorIncreaseScanTimeout;
  int64_t bleSensorTimeoutBetweenIncreaseScan;
  NSArray *v23;
  id v24;

  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = v3;
  if (self->_bleRSSIThresholdOrder)
    xpc_dictionary_set_uint64(v3, "bleRSSIThresholdOrder", self->_bleRSSIThresholdOrder);
  if (self->_bleRSSIThresholdHint)
    xpc_dictionary_set_int64(v4, "bleRSSIThresholdHint", self->_bleRSSIThresholdHint);
  v5 = self->_deviceFilter;
  if (v5)
    CUXPCEncodeNSArrayOfNSString();

  v6 = "Periodic";
  switch(self->_bleScanRate)
  {
    case 0:
      break;
    case 0xA:
      goto LABEL_15;
    case 0x14:
      v6 = "Background";
      goto LABEL_15;
    case 0x1E:
      v6 = "Low";
      goto LABEL_15;
    case 0x23:
      v6 = "MediumLow";
      goto LABEL_15;
    case 0x28:
      v6 = "Medium";
      goto LABEL_15;
    case 0x32:
      v6 = "High";
      goto LABEL_15;
    case 0x3C:
      v6 = "Max";
      goto LABEL_15;
    default:
      v6 = "?";
LABEL_15:
      xpc_dictionary_set_string(v4, "bleScanRate", v6);
      break;
  }
  v7 = "Periodic";
  switch(self->_bleScanRateScreenOff)
  {
    case 0:
      goto LABEL_25;
    case 0xA:
      goto LABEL_24;
    case 0x14:
      v7 = "Background";
      goto LABEL_24;
    case 0x1E:
      v7 = "Low";
      goto LABEL_24;
    case 0x23:
      v7 = "MediumLow";
      goto LABEL_24;
    case 0x28:
      v7 = "Medium";
      goto LABEL_24;
    case 0x32:
      v7 = "High";
      goto LABEL_24;
    case 0x3C:
      v7 = "Max";
      goto LABEL_24;
    default:
      v7 = "?";
LABEL_24:
      xpc_dictionary_set_string(v4, "bleScanRateScreenOff", v7);
LABEL_25:
      discoveryFlags = self->_discoveryFlags;
      if (!discoveryFlags)
        goto LABEL_55;
      v9 = xpc_array_create(0, 0);
      v10 = v9;
      if ((discoveryFlags & 1) != 0)
      {
        xpc_array_set_string(v9, 0xFFFFFFFFFFFFFFFFLL, "ApplePay");
        if ((discoveryFlags & 2) == 0)
        {
LABEL_28:
          if ((discoveryFlags & 4) == 0)
            goto LABEL_29;
          goto LABEL_99;
        }
      }
      else if ((discoveryFlags & 2) == 0)
      {
        goto LABEL_28;
      }
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "AppleTVSetup");
      if ((discoveryFlags & 4) == 0)
      {
LABEL_29:
        if ((discoveryFlags & 0x20000000) == 0)
          goto LABEL_30;
        goto LABEL_100;
      }
LABEL_99:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "AppSignIn");
      if ((discoveryFlags & 0x20000000) == 0)
      {
LABEL_30:
        if ((discoveryFlags & 0x10000000000000) == 0)
          goto LABEL_31;
        goto LABEL_101;
      }
LABEL_100:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "BLEPresent");
      if ((discoveryFlags & 0x10000000000000) == 0)
      {
LABEL_31:
        if ((discoveryFlags & 0x10000000) == 0)
          goto LABEL_32;
        goto LABEL_102;
      }
LABEL_101:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "CNJ");
      if ((discoveryFlags & 0x10000000) == 0)
      {
LABEL_32:
        if ((discoveryFlags & 8) == 0)
          goto LABEL_33;
        goto LABEL_103;
      }
LABEL_102:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "CompanionAuthentication");
      if ((discoveryFlags & 8) == 0)
      {
LABEL_33:
        if ((discoveryFlags & 0x10) == 0)
          goto LABEL_34;
        goto LABEL_104;
      }
LABEL_103:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "CompanionLink");
      if ((discoveryFlags & 0x10) == 0)
      {
LABEL_34:
        if ((discoveryFlags & 0x20) == 0)
          goto LABEL_35;
        goto LABEL_105;
      }
LABEL_104:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "HomePodSetup");
      if ((discoveryFlags & 0x20) == 0)
      {
LABEL_35:
        if ((discoveryFlags & 0x80000) == 0)
          goto LABEL_36;
        goto LABEL_106;
      }
LABEL_105:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "iOSSetup");
      if ((discoveryFlags & 0x80000) == 0)
      {
LABEL_36:
        if ((discoveryFlags & 0x40) == 0)
          goto LABEL_37;
        goto LABEL_107;
      }
LABEL_106:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "NearbyAction");
      if ((discoveryFlags & 0x40) == 0)
      {
LABEL_37:
        if ((discoveryFlags & 0x800000000000) == 0)
          goto LABEL_38;
        goto LABEL_108;
      }
LABEL_107:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "NearbyInfo");
      if ((discoveryFlags & 0x800000000000) == 0)
      {
LABEL_38:
        if ((discoveryFlags & 0x100) == 0)
          goto LABEL_39;
        goto LABEL_109;
      }
LABEL_108:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "OSR");
      if ((discoveryFlags & 0x100) == 0)
      {
LABEL_39:
        if ((discoveryFlags & 0x200000000000) == 0)
          goto LABEL_40;
        goto LABEL_110;
      }
LABEL_109:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "RemoteDisplay");
      if ((discoveryFlags & 0x200000000000) == 0)
      {
LABEL_40:
        if ((discoveryFlags & 0x200) == 0)
          goto LABEL_41;
        goto LABEL_111;
      }
LABEL_110:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "ProxControl");
      if ((discoveryFlags & 0x200) == 0)
      {
LABEL_41:
        if ((discoveryFlags & 0x400) == 0)
          goto LABEL_42;
        goto LABEL_112;
      }
LABEL_111:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "ProxRepair");
      if ((discoveryFlags & 0x400) == 0)
      {
LABEL_42:
        if ((discoveryFlags & 0x4000000000000000) == 0)
          goto LABEL_43;
        goto LABEL_113;
      }
LABEL_112:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "ShareAudio");
      if ((discoveryFlags & 0x4000000000000000) == 0)
      {
LABEL_43:
        if ((discoveryFlags & 0x800) == 0)
          goto LABEL_44;
        goto LABEL_114;
      }
LABEL_113:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "SIMTransfer");
      if ((discoveryFlags & 0x800) == 0)
      {
LABEL_44:
        if ((discoveryFlags & 0x20000000000000) == 0)
          goto LABEL_45;
        goto LABEL_115;
      }
LABEL_114:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "TVLatencySetup");
      if ((discoveryFlags & 0x20000000000000) == 0)
      {
LABEL_45:
        if ((discoveryFlags & 0x1000) == 0)
          goto LABEL_46;
        goto LABEL_116;
      }
LABEL_115:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "WatchSetup");
      if ((discoveryFlags & 0x1000) == 0)
      {
LABEL_46:
        if ((discoveryFlags & 0x2000) == 0)
          goto LABEL_47;
        goto LABEL_117;
      }
LABEL_116:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "WHASetup");
      if ((discoveryFlags & 0x2000) == 0)
      {
LABEL_47:
        if ((discoveryFlags & 0x4000) == 0)
          goto LABEL_48;
        goto LABEL_118;
      }
LABEL_117:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "WiFiPassword");
      if ((discoveryFlags & 0x4000) == 0)
      {
LABEL_48:
        if ((discoveryFlags & 0x8000) == 0)
          goto LABEL_49;
        goto LABEL_119;
      }
LABEL_118:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "WxSetup");
      if ((discoveryFlags & 0x8000) == 0)
      {
LABEL_49:
        if ((discoveryFlags & 0x10000) == 0)
          goto LABEL_50;
        goto LABEL_120;
      }
LABEL_119:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "WxStatus");
      if ((discoveryFlags & 0x10000) == 0)
      {
LABEL_50:
        if ((discoveryFlags & 0x200000) == 0)
          goto LABEL_51;
        goto LABEL_121;
      }
LABEL_120:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "ObjectSetup");
      if ((discoveryFlags & 0x200000) == 0)
      {
LABEL_51:
        if ((discoveryFlags & 0x800000) == 0)
          goto LABEL_52;
        goto LABEL_122;
      }
LABEL_121:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "Connections");
      if ((discoveryFlags & 0x800000) == 0)
      {
LABEL_52:
        if ((discoveryFlags & 0x2000000) == 0)
          goto LABEL_54;
        goto LABEL_53;
      }
LABEL_122:
      xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "Pairing");
      if ((discoveryFlags & 0x2000000) != 0)
LABEL_53:
        xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "ScreenOff");
LABEL_54:
      xpc_dictionary_set_value(v4, "discoveryFlags", v10);

LABEL_55:
      v11 = "AirDrop";
      if ("AirDrop")
      {
        v12 = 0;
        v13 = &off_1E5401530;
        do
        {
          v15 = *((_DWORD *)v13 - 4);
          if ((v15 - 30) >= 0xFFFFFFE3
            && ((self->_discoveryTypesInternal.bitArray[(unint64_t)(v15 - 1) >> 3] >> (-(char)v15 & 7)) & 1) != 0)
          {
            if (!v12)
              v12 = xpc_array_create(0, 0);
            xpc_array_set_string(v12, 0xFFFFFFFFFFFFFFFFLL, v11);
          }
          v14 = *v13;
          v13 += 3;
          v11 = v14;
        }
        while (v14);
        if (v12)
          xpc_dictionary_set_value(v4, "discoveryTypes", v12);
        if (self->_keepAlive)
          goto LABEL_66;
      }
      else
      {
        v12 = 0;
        if (self->_keepAlive)
LABEL_66:
          xpc_dictionary_set_BOOL(v4, "keepAlive", 1);
      }
      memoryPressureFlags = self->_memoryPressureFlags;
      if ((memoryPressureFlags & 6) != 0)
      {
        if ((memoryPressureFlags & 4) != 0)
          v17 = "critical";
        else
          v17 = "warn";
        xpc_dictionary_set_string(v4, "memoryPressure", v17);
      }
      v18 = self->_oobKeys;
      if (v18)
        CUXPCEncodeNSArrayOfObjects();

      v19 = self->_serviceUUIDs;
      if (v19)
        CUXPCEncodeNSArrayOfObjects();

      if (self->_bleSensorRssiIncreaseScanThreshold)
        xpc_dictionary_set_int64(v4, "bleSensorRssiIncreaseScanThreshold", self->_bleSensorRssiIncreaseScanThreshold);
      if (self->_bleSensorEnableRssiIncreaseScan)
        xpc_dictionary_set_int64(v4, "bleSensorEnableRssiIncreaseScan", 1);
      bleSensorIncreaseScanRate = self->_bleSensorIncreaseScanRate;
      if ((_DWORD)bleSensorIncreaseScanRate)
        xpc_dictionary_set_int64(v4, "bleSensorIncreaseScanRate", bleSensorIncreaseScanRate);
      bleSensorIncreaseScanTimeout = self->_bleSensorIncreaseScanTimeout;
      if ((_DWORD)bleSensorIncreaseScanTimeout)
        xpc_dictionary_set_int64(v4, "bleSensorIncreaseScanTimeout", bleSensorIncreaseScanTimeout);
      bleSensorTimeoutBetweenIncreaseScan = self->_bleSensorTimeoutBetweenIncreaseScan;
      if ((_DWORD)bleSensorTimeoutBetweenIncreaseScan)
        xpc_dictionary_set_int64(v4, "bleSensorTimeoutBetweenIncreaseScan", bleSensorTimeoutBetweenIncreaseScan);
      if (self->_denyLowPowerModeScans)
        xpc_dictionary_set_BOOL(v4, "denyLowPowerModeScans", 1);
      if (self->_denyScreenLockedScans)
        xpc_dictionary_set_BOOL(v4, "denyScreenLockedScans", 1);
      if (self->_deviceSetupState)
        xpc_dictionary_set_uint64(v4, "deviceSetupState", self->_deviceSetupState);
      v23 = self->_typeToRssiThresholds;
      if (v23)
        CUXPCEncodeNSArrayOfObjects();

      v24 = v4;
      return (OS_xpc_object *)v24;
  }
}

- (void)_activateDirectStart
{
  int var0;
  uint64_t clientID;
  _QWORD v5[5];

  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    clientID = self->_clientID;
    LogPrintF_safe();
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__CBDiscovery__activateDirectStart__block_invoke;
  v5[3] = &unk_1E53FFB18;
  v5[4] = self;
  objc_msgSend((id)gCBDaemonServer, "activateCBDiscovery:completion:", self, v5, clientID);
}

void __35__CBDiscovery__activateDirectStart__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 160);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__CBDiscovery__activateDirectStart__block_invoke_2;
  v7[3] = &unk_1E53FF5A0;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __35__CBDiscovery__activateDirectStart__block_invoke_2(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[6];
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v2 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = **(_DWORD **)(v5 + 48);
  if (*(_QWORD *)(a1 + 40))
  {
    if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    if (v2)
    {
      v2[2](v2, *(_QWORD *)(a1 + 40));
    }
    else
    {
      v7 = MEMORY[0x1A85D1CE4](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168));
      v8 = (void *)v7;
      if (v7)
        (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(_QWORD *)(a1 + 40));

    }
    goto LABEL_20;
  }
  if (v6 <= 30)
  {
    if (v6 == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_15;
      v5 = *(_QWORD *)(a1 + 32);
    }
    v15 = *(unsigned int *)(v5 + 108);
    LogPrintF_safe();
  }
LABEL_15:
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  v24 = 0;
  objc_msgSend((id)gCBDaemonServer, "deviceMap", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __35__CBDiscovery__activateDirectStart__block_invoke_144;
  v18[3] = &unk_1E5402440;
  v18[4] = *(_QWORD *)(a1 + 32);
  v18[5] = &v19;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v18);

  v11 = *(id *)(a1 + 32);
  objc_sync_enter(v11);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), (id)v20[5]);
  objc_sync_exit(v11);

  if (v2)
    v2[2](v2, 0);
  v12 = (void *)MEMORY[0x1A85D1CE4](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
  if (v12)
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 32);
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __35__CBDiscovery__activateDirectStart__block_invoke_2_147;
    v17[3] = &unk_1E5402468;
    v17[4] = v13;
    v17[5] = v12;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v17);
  }

  _Block_object_dispose(&v19, 8);
LABEL_20:

}

void __35__CBDiscovery__activateDirectStart__block_invoke_144(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "discoveryTypesContainCBDiscovery:", *(_QWORD *)(a1 + 32)))
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v10);
  }

}

void __35__CBDiscovery__activateDirectStart__block_invoke_2_147(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 48);
  if (v6 <= 15 && (v6 != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

}

BOOL __37__CBDiscovery__activateXPCCompleted___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  CBDevice *v5;
  uint64_t v6;
  CBDevice *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id obj;

  v4 = a3;
  v5 = [CBDevice alloc];
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v6 + 40);
  v7 = -[CBDevice initWithXPCObject:error:](v5, "initWithXPCObject:error:", v4, &obj);

  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    -[CBDevice identifier](v7, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 != 0;
    if (v14)
    {
      v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (!v16)
      {
        v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v19 = *(void **)(v18 + 40);
        *(_QWORD *)(v18 + 40) = v17;

        v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      }
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v7, v14);
    }
    else
    {
      CBErrorF(-6708, (uint64_t)"No device ID", v8, v9, v10, v11, v12, v13, v24);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v23 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v21;

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __37__CBDiscovery__activateXPCCompleted___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 48);
  if (v6 <= 15 && (v6 != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

}

- (NSArray)discoveredDevices
{
  CBDiscovery *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_deviceMap;
  v4 = v3;
  if (v3)
  {
    -[NSMutableDictionary allValues](v3, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  objc_sync_exit(v2);
  return (NSArray *)v5;
}

- (void)finish
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__CBDiscovery_finish__block_invoke;
  block[3] = &unk_1E53FF780;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __21__CBDiscovery_finish__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  xpc_object_t v4;
  _xpc_connection_s *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD handler[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = **(_DWORD **)(v2 + 48);
  if (*(_BYTE *)(v2 + 45))
  {
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
  }
  else
  {
    if (v3 <= 30 && (v3 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v4, "mTyp", "DscF");
    objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
    v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(NSObject **)(v6 + 160);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __21__CBDiscovery_finish__block_invoke_2;
    handler[3] = &unk_1E53FFB40;
    handler[4] = v6;
    xpc_connection_send_message_with_reply(v5, v4, v7, handler);

  }
}

void __21__CBDiscovery_finish__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_opt_class();
    CUXPCDecodeObject();
    v4 = 0;
  }
  if (v4)
    v5 = 90;
  else
    v5 = 30;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = **(_DWORD **)(v6 + 48);
  if (v5 >= v7)
  {
    if (v7 != -1 || (v8 = _LogCategory_Initialize(), v6 = *(_QWORD *)(a1 + 32), v8))
    {
      CUPrintNSError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      v6 = *(_QWORD *)(a1 + 32);
    }
  }
  v9 = MEMORY[0x1A85D1CE4](*(_QWORD *)(v6 + 248));
  v10 = (void *)v9;
  if (v9)
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v4);

  objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_interrupted
{
  int var0;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (!self->_invalidateCalled)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    -[CBDiscovery _lostAllDevices](self, "_lostAllDevices");
    v4 = MEMORY[0x1A85D1CE4](self->_interruptionHandler);
    v5 = (void *)v4;
    if (v4)
      (*(void (**)(uint64_t))(v4 + 16))(v4);

    self->_bluetoothState = 1;
    v6 = MEMORY[0x1A85D1CE4](self->_bluetoothStateChangedHandler);
    v7 = (void *)v6;
    if (v6)
      (*(void (**)(uint64_t))(v6 + 16))(v6);

    -[CBDiscovery _activateXPCStart:](self, "_activateXPCStart:", 1);
  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__CBDiscovery_invalidate__block_invoke;
  block[3] = &unk_1E53FF780;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__CBDiscovery_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  int var0;
  CBDiscovery *v4;
  _xpc_connection_s *v5;
  _xpc_connection_s *v6;
  NSString *v7;

  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    v7 = self->_mockID;
    if (v7)
      CBMockRemoveDiscovery(v7, self);
    if (self->_direct)
      -[CBDiscovery _invalidateDirect](self, "_invalidateDirect");
    v4 = self;
    objc_sync_enter(v4);
    v5 = v4->_xpcCnx;
    v6 = v5;
    if (v5)
      xpc_connection_cancel(v5);

    objc_sync_exit(v4);
    -[CBDiscovery _invalidated](v4, "_invalidated");

  }
}

- (void)_invalidateDirect
{
  objc_msgSend((id)gCBDaemonServer, "invalidateCBDiscovery:completion:");
}

void __32__CBDiscovery__invalidateDirect__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 160);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__CBDiscovery__invalidateDirect__block_invoke_2;
  block[3] = &unk_1E53FF780;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __32__CBDiscovery__invalidateDirect__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_invalidated
{
  CBDiscovery *v3;
  OS_xpc_object *xpcCnx;
  id bluetoothStateChangedHandler;
  id deviceFoundHandler;
  id deviceLostHandler;
  id devicesBufferedHandler;
  id errorHandler;
  id finishHandler;
  id interruptionHandler;
  id invalidationHandler;
  id systemOverrideHandler;
  void *v14;
  int var0;
  int v16;
  uint64_t v17;

  if (self->_invalidateCalled && !self->_invalidateDone && !self->_direct)
  {
    v3 = self;
    objc_sync_enter(v3);
    xpcCnx = v3->_xpcCnx;
    objc_sync_exit(v3);

    if (!xpcCnx)
    {
      self->_invalidateCalled = 1;
      v17 = MEMORY[0x1A85D1CE4](v3->_invalidationHandler);
      bluetoothStateChangedHandler = v3->_bluetoothStateChangedHandler;
      v3->_bluetoothStateChangedHandler = 0;

      deviceFoundHandler = v3->_deviceFoundHandler;
      v3->_deviceFoundHandler = 0;

      deviceLostHandler = v3->_deviceLostHandler;
      v3->_deviceLostHandler = 0;

      devicesBufferedHandler = v3->_devicesBufferedHandler;
      v3->_devicesBufferedHandler = 0;

      errorHandler = v3->_errorHandler;
      v3->_errorHandler = 0;

      finishHandler = v3->_finishHandler;
      v3->_finishHandler = 0;

      interruptionHandler = v3->_interruptionHandler;
      v3->_interruptionHandler = 0;

      invalidationHandler = v3->_invalidationHandler;
      v3->_invalidationHandler = 0;

      systemOverrideHandler = v3->_systemOverrideHandler;
      v3->_systemOverrideHandler = 0;

      v14 = (void *)v17;
      if (v17)
      {
        (*(void (**)(uint64_t))(v17 + 16))(v17);
        v14 = (void *)v17;
      }
      self->_invalidateDone = 1;
      var0 = v3->_ucat->var0;
      if (var0 <= 30)
      {
        if (var0 != -1 || (v16 = _LogCategory_Initialize(), v14 = (void *)v17, v16))
        {
          LogPrintF_safe();
          v14 = (void *)v17;
        }
      }

    }
  }
}

- (void)_lostAllDevices
{
  void (**v3)(_QWORD, _QWORD);
  CBDiscovery *v4;
  NSMutableDictionary *deviceMap;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int var0;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_deviceLostHandler, a2);
  v4 = self;
  objc_sync_enter(v4);
  deviceMap = v4->_deviceMap;
  if (v3)
  {
    -[NSMutableDictionary allValues](deviceMap, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeAllObjects](v4->_deviceMap, "removeAllObjects");
    objc_sync_exit(v4);

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
          var0 = v4->_ucat->var0;
          if (var0 <= 15 && (var0 != -1 || _LogCategory_Initialize()))
            LogPrintF_safe();
          v3[2](v3, v11);
          ++v10;
        }
        while (v8 != v10);
        v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v8 = v13;
      }
      while (v13);
    }

  }
  else
  {
    -[NSMutableDictionary removeAllObjects](deviceMap, "removeAllObjects");
    objc_sync_exit(v4);

  }
}

- (void)reportMockDeviceFound:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__CBDiscovery_reportMockDeviceFound___block_invoke;
  v7[3] = &unk_1E53FF5A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __37__CBDiscovery_reportMockDeviceFound___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 45))
  {
    v2 = result;
    v3 = **(_DWORD **)(v1 + 48);
    if (v3 <= 30)
    {
      if (v3 != -1 || (v4 = _LogCategory_Initialize(), v1 = *(_QWORD *)(v2 + 32), v4))
      {
        LogPrintF();
        v1 = *(_QWORD *)(v2 + 32);
      }
    }
    result = *(_QWORD *)(v1 + 136);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(v2 + 40));
  }
  return result;
}

- (void)reportMockDeviceLost:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__CBDiscovery_reportMockDeviceLost___block_invoke;
  v7[3] = &unk_1E53FF5A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __36__CBDiscovery_reportMockDeviceLost___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 45))
  {
    v2 = result;
    v3 = **(_DWORD **)(v1 + 48);
    if (v3 <= 30)
    {
      if (v3 != -1 || (v4 = _LogCategory_Initialize(), v1 = *(_QWORD *)(v2 + 32), v4))
      {
        LogPrintF();
        v1 = *(_QWORD *)(v2 + 32);
      }
    }
    result = *(_QWORD *)(v1 + 144);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(v2 + 40));
  }
  return result;
}

- (void)_xpcReceivedDeviceLost:(id)a3
{
  id v4;
  CBDevice *v5;
  id v6;
  void *v7;
  CBDiscovery *v8;
  int var0;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  id v15;

  v4 = a3;
  if (MEMORY[0x1A85D2194]() == MEMORY[0x1E0C812F8])
  {
    v15 = 0;
    v5 = -[CBDevice initWithXPCObject:error:]([CBDevice alloc], "initWithXPCObject:error:", v4, &v15);
    v6 = v15;
    if (v5)
    {
      -[CBDevice identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = self;
        objc_sync_enter(v8);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_deviceMap, "setObject:forKeyedSubscript:", 0, v7);
        objc_sync_exit(v8);

        var0 = v8->_ucat->var0;
        if (var0 <= 15 && (var0 != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
        v10 = MEMORY[0x1A85D1CE4](v8->_deviceLostHandler);
        v11 = (void *)v10;
        if (v10)
          (*(void (**)(uint64_t, CBDevice *))(v10 + 16))(v10, v5);

        goto LABEL_11;
      }
      v14 = self->_ucat->var0;
      if (v14 > 90 || v14 == -1 && !_LogCategory_Initialize())
      {
LABEL_11:

LABEL_12:
        goto LABEL_13;
      }
    }
    else
    {
      v13 = self->_ucat->var0;
      if (v13 > 90 || v13 == -1 && !_LogCategory_Initialize())
        goto LABEL_12;
      CUPrintNSError();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    LogPrintF_safe();
    goto LABEL_11;
  }
  v12 = self->_ucat->var0;
  if (v12 <= 90 && (v12 != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
LABEL_13:

}

- (void)_xpcReceivedDevicesBuffered:(id)a3
{
  id v4;
  id v5;
  int v6;
  int var0;
  void *v8;

  v4 = a3;
  if (MEMORY[0x1A85D2194]() == MEMORY[0x1E0C812F8])
  {
    objc_opt_class();
    CUXPCDecodeNSArrayOfClass();
    v5 = 0;
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    goto LABEL_4;
  }
  v6 = self->_ucat->var0;
  if (v6 > 90 || v6 == -1 && !_LogCategory_Initialize())
  {
LABEL_4:

    return;
  }
  LogPrintF_safe();

}

- (void)_xpcReceivedPowerStateChanged:(id)a3
{
  uint64_t v4;
  void *v5;
  int var0;
  xpc_object_t xdict;

  xdict = a3;
  if (MEMORY[0x1A85D2194]() == MEMORY[0x1E0C812F8])
  {
    self->_bluetoothState = xpc_dictionary_get_int64(xdict, "pwrS");
    v4 = MEMORY[0x1A85D1CE4](self->_bluetoothStateChangedHandler);
    v5 = (void *)v4;
    if (v4)
      (*(void (**)(uint64_t))(v4 + 16))(v4);

  }
  else
  {
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();

      return;
    }
  }

}

- (void)_xpcReceivedSystemOverrideChanged:(id)a3
{
  uint64_t v4;
  void *v5;
  int var0;
  xpc_object_t xdict;

  xdict = a3;
  if (MEMORY[0x1A85D2194]() == MEMORY[0x1E0C812F8])
  {
    self->_bleScanRateOverride = xpc_dictionary_get_int64(xdict, "scRO");
    self->_systemOverrideFlags = xpc_dictionary_get_uint64(xdict, "syOF");
    v4 = MEMORY[0x1A85D1CE4](self->_systemOverrideHandler);
    v5 = (void *)v4;
    if (v4)
      (*(void (**)(uint64_t))(v4 + 16))(v4);

  }
  else
  {
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();

      return;
    }
  }

}

BOOL __56__CBDiscovery_devicesWithDiscoveryFlags_endpoint_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  CBDevice *v5;
  uint64_t v6;
  CBDevice *v7;
  id obj;

  v4 = a3;
  v5 = [CBDevice alloc];
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v6 + 40);
  v7 = -[CBDevice initWithXPCObject:error:](v5, "initWithXPCObject:error:", v4, &obj);

  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v7);

  return v7 != 0;
}

- (int64_t)bluetoothState
{
  return self->_bluetoothState;
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (id)devicesBufferedHandler
{
  return self->_devicesBufferedHandler;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (NSString)label
{
  return self->_label;
}

- (CBDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDevice, a3);
}

- (unsigned)systemOverrideFlags
{
  return self->_systemOverrideFlags;
}

- (void)setSystemOverrideFlags:(unsigned int)a3
{
  self->_systemOverrideFlags = a3;
}

- (id)systemOverrideHandler
{
  return self->_systemOverrideHandler;
}

- (void)setBleRSSIThresholdOrder:(unsigned __int8)a3
{
  self->_bleRSSIThresholdOrder = a3;
}

- (void)setBleScanRateOverride:(int)a3
{
  self->_bleScanRateOverride = a3;
}

- (unint64_t)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(unint64_t)a3
{
  self->_changeFlags = a3;
}

- (id)finishHandler
{
  return self->_finishHandler;
}

- (void)setFinishHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)mockID
{
  return self->_mockID;
}

- (void)setMockID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSArray)serviceUUIDs
{
  return self->_serviceUUIDs;
}

- (NSArray)typeToRssiThresholds
{
  return self->_typeToRssiThresholds;
}

- (void)setBleSensorRssiIncreaseScanThreshold:(char)a3
{
  self->_bleSensorRssiIncreaseScanThreshold = a3;
}

- (void)setBleSensorEnableRssiIncreaseScan:(BOOL)a3
{
  self->_bleSensorEnableRssiIncreaseScan = a3;
}

- (void)setBleSensorIncreaseScanRate:(unsigned int)a3
{
  self->_bleSensorIncreaseScanRate = a3;
}

- (void)setBleSensorIncreaseScanTimeout:(unsigned int)a3
{
  self->_bleSensorIncreaseScanTimeout = a3;
}

- (void)setBleSensorTimeoutBetweenIncreaseScan:(unsigned int)a3
{
  self->_bleSensorTimeoutBetweenIncreaseScan = a3;
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (void)setDenyLowPowerModeScans:(BOOL)a3
{
  self->_denyLowPowerModeScans = a3;
}

- (void)setDenyScreenLockedScans:(BOOL)a3
{
  self->_denyScreenLockedScans = a3;
}

- (unsigned)deviceSetupState
{
  return self->_deviceSetupState;
}

- (void)setDeviceSetupState:(unsigned __int8)a3
{
  self->_deviceSetupState = a3;
}

- (void)setInternalFlags:(unsigned int)a3
{
  self->_internalFlags = a3;
}

- (BOOL)keepAlive
{
  return self->_keepAlive;
}

- (void)setKeepAlive:(BOOL)a3
{
  self->_keepAlive = a3;
}

- (unsigned)memoryPressureFlags
{
  return self->_memoryPressureFlags;
}

- (void)setMemoryPressureFlags:(unsigned int)a3
{
  self->_memoryPressureFlags = a3;
}

- (OS_xpc_object)testListenerEndpoint
{
  return self->_testListenerEndpoint;
}

- (void)setTestListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, a3);
}

@end
