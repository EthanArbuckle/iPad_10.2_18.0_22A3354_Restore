@implementation CBCentralManager

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (void)scanForPeripheralsWithServices:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id scanCompletion;
  id v12;

  v8 = a4;
  v9 = a3;
  v10 = (void *)MEMORY[0x1A85D1CE4](a5);
  scanCompletion = self->_scanCompletion;
  self->_scanCompletion = v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("kCBMsgArgHasCompletionBlock"));
  -[CBCentralManager _scanForPeripheralsWithServices:options:](self, "_scanForPeripheralsWithServices:options:", v9, v12);

}

- (void)scanForPeripheralsWithServices:(NSArray *)serviceUUIDs options:(NSDictionary *)options
{
  id scanCompletion;
  NSDictionary *v7;
  NSArray *v8;
  id v9;

  scanCompletion = self->_scanCompletion;
  self->_scanCompletion = 0;
  v7 = options;
  v8 = serviceUUIDs;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("kCBMsgArgHasCompletionBlock"));
  -[CBCentralManager _scanForPeripheralsWithServices:options:](self, "_scanForPeripheralsWithServices:options:", v8, v9);

}

- (void)dealloc
{
  objc_super v3;

  -[CBCentralManager orphanPeripherals](self, "orphanPeripherals");
  if (self->_observingKeyPaths)
  {
    -[CBCentralManager removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("delegate"), objc_opt_class());
    -[CBCentralManager removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("state"), objc_opt_class());
    -[CBCentralManager removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("localName"), objc_opt_class());
    self->_observingKeyPaths = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)CBCentralManager;
  -[CBManager dealloc](&v3, sel_dealloc);
}

- (void)handleMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  switch((int)v4)
  {
    case 16:
    case 17:
    case 18:
      -[CBManager sharedPairingAgent](self, "sharedPairingAgent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handlePairingMessage:args:", v4, v7);

      return;
    case 23:
    case 24:
    case 165:
    case 166:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 185:
    case 189:
    case 190:
    case 196:
    case 197:
    case 198:
    case 199:
    case 200:
    case 203:
    case 204:
      goto LABEL_2;
    case 29:
      -[CBCentralManager handleSupportedFeatures:](self, "handleSupportedFeatures:", v6);

      return;
    case 56:
      v11 = 0;
      v8 = sel_handleReadyForUpdates_;
      goto LABEL_4;
    case 59:
      v8 = sel_handleAdvertisingAddressChanged_;
      goto LABEL_29;
    case 84:
      v11 = 0;
      v8 = sel_handlePeripheralDiscovered_;
      goto LABEL_4;
    case 85:
      v11 = 0;
      v8 = sel_handlePeripheralConnectionCompleted_;
      goto LABEL_4;
    case 86:
      v11 = 0;
      v8 = sel_handlePeripheralCLReady_;
      goto LABEL_4;
    case 87:
      v11 = 0;
      v8 = sel_handlePeripheralDisconnectionCompleted_;
      goto LABEL_4;
    case 88:
      v11 = 0;
      v8 = sel_handlePeripheralConnectionStateUpdated_;
      goto LABEL_4;
    case 89:
      v11 = 0;
      v8 = sel_handlePeripheralTrackingUpdated_;
      goto LABEL_4;
    case 90:
      v11 = 0;
      v8 = sel_handleZoneLost_;
      goto LABEL_4;
    case 91:
      v11 = 0;
      v8 = sel_handleApplicationActivityEvent_;
      goto LABEL_4;
    case 92:
      v8 = sel_handleRestoringState_;
LABEL_29:
      v11 = 1;
      goto LABEL_4;
    case 94:
      v11 = 0;
      v8 = sel_handleApplicationConnectionEventDidOccur_;
      goto LABEL_4;
    case 110:
      -[CBCentralManager handleAncsAuthChanged:](self, "handleAncsAuthChanged:", v6);

      return;
    case 129:
      v11 = 0;
      v8 = sel_handleScanFailedToStartWithError_;
      goto LABEL_4;
    case 133:
      -[CBCentralManager handleScanComplete:](self, "handleScanComplete:", v6);

      return;
    case 134:
      -[CBCentralManager handleScanParamsUpdated:](self, "handleScanParamsUpdated:", v6);

      return;
    case 135:
      -[CBCentralManager handleFindMyDevicesUpdated:](self, "handleFindMyDevicesUpdated:", v6);

      return;
    case 136:
      v11 = 0;
      v8 = sel_handlePeripheralInvalidated_;
      goto LABEL_4;
    case 138:
      v11 = 0;
      v8 = sel_handleDidSendBytesToPeripheralwithError_;
      goto LABEL_4;
    case 139:
      v11 = 0;
      v8 = sel_handleDidReceiveDataFromPeripheral_;
      goto LABEL_4;
    case 164:
      v8 = sel_handlePeerMTUChanged_;
LABEL_2:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "handleMsg:args:", v4, v7);
      if ((_DWORD)v4 != 164)
        goto LABEL_7;
      v11 = 0;
LABEL_4:
      if (-[CBManager state](self, "state") == CBManagerStatePoweredOn
        || ((-[CBManager state](self, "state") != 10) & ~v11) == 0)
      {
        objc_msgSend(self, v8, v7);
LABEL_7:

        return;
      }
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
        goto LABEL_7;
      -[CBCentralManager handleMsg:args:].cold.2();

      return;
    case 167:
      v11 = 0;
      v8 = sel_handleConnectionParametersUpdated_;
      goto LABEL_4;
    case 210:
      v11 = 0;
      v8 = sel_HandleControllerBTClockUpdateMsg_;
      goto LABEL_4;
    case 213:
      v11 = 0;
      v8 = sel_handleUpdateUsageNotificationForPeripheral_;
      goto LABEL_4;
    case 214:
      v11 = 0;
      v8 = sel_HandleRssiDetectionUpdateMsg_;
      goto LABEL_4;
    case 215:
      v11 = 0;
      v8 = sel_HandleBluetoothUsageEventMsg_;
      goto LABEL_4;
    case 216:
      v11 = 0;
      v8 = sel_HandleBluetoothPhyStatisticEventMsg_;
      goto LABEL_4;
    case 221:
      v11 = 0;
      v8 = sel_HandleCSProcedureEventMsg_;
      goto LABEL_4;
    default:
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v13 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      -[CBCentralManager handleMsg:args:].cold.1(v4, v13);

      return;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  int v46;
  void *v47;
  int v48;
  void *v49;
  int v50;
  void *v51;
  int v52;
  void *v53;
  int v54;
  void *v55;
  int v56;
  void *v57;
  int v58;
  void *v59;
  int v60;
  void *v61;
  int v62;
  void *v63;
  int v64;
  int v65;
  objc_super v66;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)objc_opt_class() == a6)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("state")))
    {
      if (-[CBManager state](self, "state") != CBManagerStatePoweredOn && -[CBManager state](self, "state") != 10)
      {
        -[CBCentralManager setIsScanning:](self, "setIsScanning:", 0);
        -[CBCentralManager forEachPeripheral:](self, "forEachPeripheral:", &__block_literal_global_18);
        if (-[CBManager state](self, "state") == CBManagerStateResetting)
          -[CBCentralManager orphanPeripherals](self, "orphanPeripherals");
      }
      -[CBCentralManager delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "centralManagerDidUpdateState:", self);
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("delegate")))
        goto LABEL_90;
      -[CBCentralManager delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1);

      -[CBCentralManager delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = 2;
      else
        v16 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFFD | v16);

      -[CBCentralManager delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = 4;
      else
        v18 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFFB | v18);

      -[CBCentralManager delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v20 = 8;
      else
        v20 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFF7 | v20);

      -[CBCentralManager delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v22 = 16;
      else
        v22 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFEF | v22);

      -[CBCentralManager delegate](self, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v24 = 32;
      else
        v24 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFDF | v24);

      -[CBCentralManager delegate](self, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v26 = 64;
      else
        v26 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFFBF | v26);

      -[CBCentralManager delegate](self, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v28 = 128;
      else
        v28 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFF7F | v28);

      -[CBCentralManager delegate](self, "delegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v30 = 256;
      else
        v30 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFEFF | v30);

      -[CBCentralManager delegate](self, "delegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v32 = 512;
      else
        v32 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFDFF | v32);

      -[CBCentralManager delegate](self, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v34 = 1024;
      else
        v34 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFFBFF | v34);

      -[CBCentralManager delegate](self, "delegate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v36 = 2048;
      else
        v36 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFF7FF | v36);

      -[CBCentralManager delegate](self, "delegate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v38 = 4096;
      else
        v38 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFEFFF | v38);

      -[CBCentralManager delegate](self, "delegate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v40 = 0x2000;
      else
        v40 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFDFFF | v40);

      -[CBCentralManager delegate](self, "delegate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v42 = 0x4000;
      else
        v42 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFFBFFF | v42);

      -[CBCentralManager delegate](self, "delegate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v44 = 0x8000;
      else
        v44 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFF7FFF | v44);

      -[CBCentralManager delegate](self, "delegate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v46 = 0x10000;
      else
        v46 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFEFFFF | v46);

      -[CBCentralManager delegate](self, "delegate");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v48 = 0x20000;
      else
        v48 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFDFFFF | v48);

      -[CBCentralManager delegate](self, "delegate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v50 = 0x40000;
      else
        v50 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFFBFFFF | v50);

      -[CBCentralManager delegate](self, "delegate");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v52 = 0x80000;
      else
        v52 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFF7FFFF | v52);

      -[CBCentralManager delegate](self, "delegate");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v54 = 0x100000;
      else
        v54 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFEFFFFF | v54);

      -[CBCentralManager delegate](self, "delegate");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v56 = 0x200000;
      else
        v56 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFDFFFFF | v56);

      -[CBCentralManager delegate](self, "delegate");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v58 = 0x400000;
      else
        v58 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFFBFFFFF | v58);

      -[CBCentralManager delegate](self, "delegate");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v60 = 0x800000;
      else
        v60 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFF7FFFFF | v60);

      -[CBCentralManager delegate](self, "delegate");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v62 = 0x1000000;
      else
        v62 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFEFFFFFF | v62);

      -[CBCentralManager delegate](self, "delegate");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v64 = 0x2000000;
      else
        v64 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFDFFFFFF | v64);

      -[CBCentralManager delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v65 = 0x4000000;
      else
        v65 = 0;
      self->_delegateFlags = ($07E581FC71E438F638AFE4D881A2E6BE)(*(_DWORD *)&self->_delegateFlags & 0xFBFFFFFF | v65);
    }

    goto LABEL_90;
  }
  v66.receiver = self;
  v66.super_class = (Class)CBCentralManager;
  -[CBCentralManager observeValueForKeyPath:ofObject:change:context:](&v66, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
LABEL_90:

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)handlePeripheralDiscovered:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  NSMutableArray *discoveredPeripherals;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_isScanning && (*(_BYTE *)&self->_delegateFlags & 2) != 0)
  {
    -[CBCentralManager peripheralWithInfo:](self, "peripheralWithInfo:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAdvertisingMoreAvailable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAdvertisingIsFromADVBuff"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    if (!v5)
    {
      if (!v7 && v9 && (*((_BYTE *)&self->_delegateFlags + 1) & 0x40) != 0)
      {
        -[CBCentralManager delegate](self, "delegate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSMutableArray count](self->_discoveredPeripherals, "count"))
          discoveredPeripherals = self->_discoveredPeripherals;
        else
          discoveredPeripherals = 0;
        objc_msgSend(v33, "centralManager:didDiscoverMultiplePeripherals:", self, discoveredPeripherals);

        -[NSMutableArray removeAllObjects](self->_discoveredPeripherals, "removeAllObjects");
      }
      goto LABEL_40;
    }
    v44 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAdvertisementData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgRssi"));
    v46 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBAdvDataServiceUUIDs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[CBCentralManager dataArrayToUUIDArray:](self, "dataArrayToUUIDArray:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("kCBAdvDataServiceUUIDs"));

    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBAdvDataSolicitedServiceUUIDs"));
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[CBCentralManager dataArrayToUUIDArray:](self, "dataArrayToUUIDArray:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("kCBAdvDataSolicitedServiceUUIDs"));

    }
    v45 = (void *)v14;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBAdvDataHashedServiceUUIDs"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[CBCentralManager dataArrayToUUIDArray:](self, "dataArrayToUUIDArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("kCBAdvDataHashedServiceUUIDs"));

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("kCBScanOptionFilterIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBScanOptionFilterIdentifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "numberWithUnsignedLongLong:", objc_msgSend(v20, "unsignedLongLongValue"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, CFSTR("kCBScanOptionFilterIdentifier"));

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("kCBScanOptionFilterIdentifierString"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBScanOptionFilterIdentifierString"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, CFSTR("kCBScanOptionFilterIdentifierString"));

    }
    v24 = CFSTR("kCBAdvDataServiceData");
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBAdvDataServiceData"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      v42 = v7;
      v43 = v12;
      v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v26 = v47;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v27)
      {
        v28 = v27;
        v39 = CFSTR("kCBAdvDataServiceData");
        v40 = v16;
        v41 = v5;
        v29 = 0;
        v30 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            while (1)
            {
              if (*(_QWORD *)v49 != v30)
                objc_enumerationMutation(v26);
              v32 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
              if (v29)
                break;
              +[CBUUID UUIDWithData:](CBUUID, "UUIDWithData:", v32);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (v28 == ++i)
                goto LABEL_17;
            }
            objc_msgSend(v25, "setObject:forKeyedSubscript:", v32, v29);

            v29 = 0;
          }
LABEL_17:
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v52, 16, v39, v40, v41);
        }
        while (v28);

        v16 = v40;
        v5 = v41;
        v24 = v39;
      }

      objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, v24);
      v7 = v42;
      v12 = v43;
    }
    if (v44)
    {
      v35 = v45;
      v36 = (void *)v46;
      if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x40) == 0)
      {
LABEL_39:

LABEL_40:
        goto LABEL_41;
      }
      v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v37, "setObject:forKeyedSubscript:", v5, CFSTR("kCBMsgArgAdvertisementPeripheral"));
      objc_msgSend(v37, "setObject:forKeyedSubscript:", v46, CFSTR("kCBMsgArgRssi"));
      objc_msgSend(v37, "setObject:forKeyedSubscript:", v11, CFSTR("kCBMsgArgAdvertisementData"));
      -[NSMutableArray addObject:](self->_discoveredPeripherals, "addObject:", v37);
      if (!v7)
      {
        -[CBCentralManager delegate](self, "delegate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "centralManager:didDiscoverMultiplePeripherals:", self, self->_discoveredPeripherals);

        -[NSMutableArray removeAllObjects](self->_discoveredPeripherals, "removeAllObjects");
      }
      v36 = (void *)v46;
    }
    else
    {
      -[CBCentralManager delegate](self, "delegate");
      v37 = (id)objc_claimAutoreleasedReturnValue();
      v36 = (void *)v46;
      objc_msgSend(v37, "centralManager:didDiscoverPeripheral:advertisementData:RSSI:", self, v5, v11, v46);
    }

    v35 = v45;
    goto LABEL_39;
  }
LABEL_41:

}

- (id)peripheralWithInfo:(id)a3
{
  id v4;
  CBPeripheral *v5;
  NSMapTable *peripherals;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  NSMapTable *v13;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v5 = (CBPeripheral *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    peripherals = self->_peripherals;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](peripherals, "objectForKey:", v7);
    v5 = (CBPeripheral *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgName"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[CBPeripheral name](v5, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v8);

        if ((v10 & 1) == 0)
          -[CBPeripheral setName:](v5, "setName:", v8);
      }
      -[CBPeripheral updateFindMyInfo:](v5, "updateFindMyInfo:", v4);
      objc_msgSend(v4, "objectForKey:", CFSTR("kCBMsgArgVisibleInSettings"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgVisibleInSettings"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CBPeripheral setVisibleInSettings:](v5, "setVisibleInSettings:", objc_msgSend(v12, "BOOLValue"));

      }
      else
      {
        -[CBPeripheral setVisibleInSettings:](v5, "setVisibleInSettings:", 1);
      }
    }
    else
    {
      v5 = -[CBPeripheral initWithCentralManager:info:]([CBPeripheral alloc], "initWithCentralManager:info:", self, v4);
      v13 = self->_peripherals;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](v13, "setObject:forKey:", v5, v8);
    }

  }
  return v5;
}

- (id)dataArrayToUUIDArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        +[CBUUID UUIDWithData:](CBUUID, "UUIDWithData:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)handleSupportedFeatures:(id)a3
{
  void *v3;
  id v4;

  gSupportedFeatures = 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSupportedFeatures"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("kCBMsgArgSupportsExtendedScanAndConnect"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    gSupportedFeatures = 1;

}

- (void)orphanPeripherals
{
  -[CBCentralManager forEachPeripheral:](self, "forEachPeripheral:", &__block_literal_global);
  -[NSMapTable removeAllObjects](self->_peripherals, "removeAllObjects");
}

- (void)forEachPeripheral:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  -[NSMapTable objectEnumerator](self->_peripherals, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      v8[2](v8, v6);
      objc_msgSend(v4, "nextObject");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    while (v7);
  }

}

- (void)stopScan
{
  if (-[CBManager sendMsg:args:](self, "sendMsg:args:", 72, 0))
    -[CBCentralManager setIsScanning:](self, "setIsScanning:", 0);
}

- (void)_scanForPeripheralsWithServices:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = (id)MEMORY[0x1E0C9AA60];
  if (a3)
    v6 = a3;
  v12[0] = CFSTR("kCBMsgArgUUIDs");
  v12[1] = CFSTR("kCBMsgArgOptions");
  v7 = (id)MEMORY[0x1E0C9AA70];
  if (a4)
    v7 = a4;
  v13[0] = v6;
  v13[1] = v7;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v10) = -[CBManager sendMsg:args:](self, "sendMsg:args:", 71, v11);
  if ((_DWORD)v10)
    -[CBCentralManager setIsScanning:](self, "setIsScanning:", 1);
}

- (void)setIsScanning:(BOOL)a3
{
  self->_isScanning = a3;
}

- (CBCentralManager)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue
{
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  CBCentralManager *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = CFSTR("kCBInitOptionShowPowerAlert");
  v13[0] = MEMORY[0x1E0C9AAB0];
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = queue;
  v8 = delegate;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CBCentralManager initWithDelegate:queue:options:](self, "initWithDelegate:queue:options:", v8, v7, v9);

  return v10;
}

- (CBCentralManager)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue options:(NSDictionary *)options
{
  id v9;
  NSObject *v10;
  NSDictionary *v11;
  CBCentralManager *v12;
  int v13;
  uint64_t v14;
  NSMapTable *peripherals;
  NSMutableArray *v16;
  NSMutableArray *discoveredPeripherals;
  void *v18;
  void *v19;
  void *v20;
  $07E581FC71E438F638AFE4D881A2E6BE delegateFlags;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  int v40;
  void *v41;
  void *v42;
  void *v44;
  SEL v45;
  objc_super v46;

  v9 = delegate;
  v10 = queue;
  v11 = options;
  v46.receiver = self;
  v46.super_class = (Class)CBCentralManager;
  v12 = -[CBManager initInternal](&v46, sel_initInternal);
  if (!v12)
    goto LABEL_36;
  v45 = a2;
  -[CBCentralManager addObserver:forKeyPath:options:context:](v12, "addObserver:forKeyPath:options:context:", v12, CFSTR("state"), 0, objc_opt_class());
  -[CBCentralManager addObserver:forKeyPath:options:context:](v12, "addObserver:forKeyPath:options:context:", v12, CFSTR("delegate"), 0, objc_opt_class());
  -[CBCentralManager addObserver:forKeyPath:options:context:](v12, "addObserver:forKeyPath:options:context:", v12, CFSTR("localName"), 0, objc_opt_class());
  v13 = 1;
  v12->_observingKeyPaths = 1;
  -[CBCentralManager setDelegate:](v12, "setDelegate:", v9);
  v12->_isScanning = 0;
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 5, 0);
  peripherals = v12->_peripherals;
  v12->_peripherals = (NSMapTable *)v14;

  v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  discoveredPeripherals = v12->_discoveredPeripherals;
  v12->_discoveredPeripherals = v16;

  -[CBManager setTccComplete:](v12, "setTccComplete:", 0);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForInfoDictionaryKey:", CFSTR("UIBackgroundModes"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v19, "containsObject:", CFSTR("bluetooth-central")) & 1) != 0)
      v13 = 0;
    else
      v13 = objc_msgSend(v19, "containsObject:", CFSTR("bluetooth")) ^ 1;
  }
  -[NSDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("kCBInitOptionRestoreIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  delegateFlags = v12->_delegateFlags;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[CBManager getCBPrivacySupported](v12, "getCBPrivacySupported");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKey:", v24, CFSTR("kCBManagerPrivacySupported"));

  if (!v20)
  {
    if ((*(_BYTE *)&delegateFlags & 1) != 0)
    {
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        -[CBCentralManager initWithDelegate:queue:options:].cold.1();
    }
    goto LABEL_15;
  }
  if ((*(_BYTE *)&delegateFlags & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", v45, v12, CFSTR("CBCentralManager.m"), 357, CFSTR("%@ has provided a restore identifier but the delegate doesn't implement the centralManager:willRestoreState: method"), v12);

    if (!v13)
      goto LABEL_15;
    goto LABEL_9;
  }
  if (v13)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", v45, v12, CFSTR("CBCentralManager.m"), 359, CFSTR("State restoration of CBCentralManager is only allowed for applications that have specified the \"bluetooth-central\" background mode"), v12);

  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "environment");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("XCTestConfigurationFilePath"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    if (_os_feature_enabled_impl())
    {
      v29 = 0x1E0CB3000uLL;
      if (+[CBManager tccAvailable](CBManager, "tccAvailable")
        && +[CBManager preflightCheckForTCC](CBManager, "preflightCheckForTCC") == 2)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForInfoDictionaryKey:", CFSTR("NSAccessorySetupKitSupports"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v32 = objc_msgSend(v31, "containsObject:", CFSTR("Bluetooth"));
        else
          v32 = 0;
        v33 = xpc_copy_entitlement_for_self();
        v34 = (void *)v33;
        if (v33 && MEMORY[0x1A85D2194](v33) == MEMORY[0x1E0C812D0] && xpc_BOOL_get_value(v34))
          v32 |= xpc_BOOL_get_value(v34);

      }
      else
      {
        v32 = 0;
      }
    }
    else
    {
      v32 = 0;
      v29 = 0x1E0CB3000;
    }
    objc_msgSend(*(id *)(v29 + 1232), "mainBundle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForInfoDictionaryKey:", CFSTR("NSBluetoothServices"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v29 + 1232), "mainBundle");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForInfoDictionaryKey:", CFSTR("NSBluetoothCompanyIdentifiers"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = 1;
    }
    else
    {
      objc_opt_class();
      v39 = objc_opt_isKindOfClass() & 1;
    }
    v40 = v39 | v32;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", dyld_program_sdk_at_least());
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v41, CFSTR("kCBManagerAppSDKSupportASK"));

    if (v40)
      objc_msgSend(v22, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("kCBManagerRequiresPlistInspection"));

  }
  v42 = (void *)objc_msgSend(v22, "copy");
  -[CBManager startWithQueue:options:sessionType:](v12, "startWithQueue:options:sessionType:", v10, v42, 0);

LABEL_36:
  return v12;
}

- (BOOL)isMsgAllowedAlways:(unsigned __int16)a3
{
  uint64_t v3;
  uint64_t v4;
  BOOL result;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  result = 1;
  if ((a3 - 8) >= 2 && a3 != 206)
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = self;
    v7.super_class = (Class)CBCentralManager;
    return -[CBManager isMsgAllowedAlways:](&v7, sel_isMsgAllowedAlways_);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredPeripherals, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong(&self->_scanCompletion, 0);
  objc_storeStrong((id *)&self->_peripherals, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)peripheralWithIdentifier:(id)a3
{
  return -[NSMapTable objectForKey:](self->_peripherals, "objectForKey:", a3);
}

- (void)powerAssertionNearCompletion
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.bluetooth.powerAssertion.end"), self);

}

void __37__CBCentralManager_orphanPeripherals__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    __37__CBCentralManager_orphanPeripherals__block_invoke_cold_1();
  objc_msgSend(v2, "handleDisconnection");
  objc_msgSend(v2, "setOrphan");

}

uint64_t __67__CBCentralManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleDisconnection");
}

- (CBCentralManager)init
{
  return -[CBCentralManager initWithDelegate:queue:](self, "initWithDelegate:queue:", 0, 0);
}

- (void)retrievePeripherals:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CBCentralManager retrievePeripheralsWithIdentifiers:](self, "retrievePeripheralsWithIdentifiers:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBManager getCurrentQueue](self, "getCurrentQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__CBCentralManager_retrievePeripherals___block_invoke;
    v10[3] = &unk_1E53FF5A0;
    v10[4] = self;
    v11 = v7;
    v9 = v7;
    dispatch_async(v8, v10);

  }
}

void __40__CBCentralManager_retrievePeripherals___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "centralManager:didRetrievePeripherals:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)retrievePairingInfoForPeripheral:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 417, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

  }
  v11 = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 111, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)createCBPeripheralsFromIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[CBCentralManager peripheralWithInfo:](self, "peripheralWithInfo:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (NSArray)retrievePeripheralsWithIdentifiers:(NSArray *)identifiers
{
  NSArray *v5;
  id v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  const __CFString *v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = identifiers;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 436, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifiers != nil"));

  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v5;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        while (1)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            break;
          objc_msgSend(v7, "addObject:", v13);

          if (v10 == ++i)
            goto LABEL_5;
        }
        objc_msgSend(v6, "addObject:", v14);

      }
LABEL_5:
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count"))
  {
    v25 = CFSTR("kCBMsgArgUUIDs");
    v26 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 63, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDevices"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBCentralManager createCBPeripheralsFromIDs:](self, "createCBPeripheralsFromIDs:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v18);

  }
  return (NSArray *)v6;
}

- (void)retrievePeripheralsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  id *v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  void *v26;
  _QWORD block[4];
  id v28;
  id v29;
  _QWORD v30[4];
  _QWORD v31[2];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  const __CFString *v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 462, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifiers != nil"));

  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        while (1)
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            break;
          objc_msgSend(v10, "addObject:", v16);

          if (v13 == ++i)
            goto LABEL_5;
        }
        objc_msgSend(v9, "addObject:", v17);

      }
LABEL_5:
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v10, "count"))
  {
    v37 = CFSTR("kCBMsgArgUUIDs");
    v38 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __66__CBCentralManager_retrievePeripheralsWithIdentifiers_completion___block_invoke;
    v30[3] = &unk_1E53FF5C8;
    v19 = (id *)v31;
    v31[0] = v9;
    v31[1] = self;
    v32 = v8;
    v20 = v8;
    v21 = v9;
    -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 63, v18, v30);

    v22 = v32;
  }
  else
  {
    -[CBManager getCurrentQueue](self, "getCurrentQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__CBCentralManager_retrievePeripheralsWithIdentifiers_completion___block_invoke_2;
    block[3] = &unk_1E53FF5F0;
    v19 = &v29;
    v28 = v9;
    v29 = v8;
    v24 = v8;
    v25 = v9;
    dispatch_async(v23, block);

    v22 = v28;
  }

}

uint64_t __66__CBCentralManager_retrievePeripheralsWithIdentifiers_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDevices"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "peripheralWithInfo:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v10);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __66__CBCentralManager_retrievePeripheralsWithIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)retrieveConnectionHandleWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 497, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  v14 = CFSTR("kCBMsgArgUUID");
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__CBCentralManager_retrieveConnectionHandleWithIdentifier_completion___block_invoke;
  v12[3] = &unk_1E53FF618;
  v13 = v8;
  v10 = v8;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 64, v9, v12);

}

void __70__CBCentralManager_retrieveConnectionHandleWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kCBMsgArgConnectionHandle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kCBMsgArgConnectionHandle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unsignedShortValue");

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v5, "userInfo");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = v10;
    else
      v12 = MEMORY[0x1E0C9AA70];
    objc_msgSend(v9, "errorWithInfo:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v13);

  }
}

- (void)retrievePeripheralsWithTags:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  CBCentralManager *v16;
  id v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 515, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tags != nil"));

  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = CFSTR("kCBMsgArgTags");
  v19[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__CBCentralManager_retrievePeripheralsWithTags_completion___block_invoke;
  v14[3] = &unk_1E53FF5C8;
  v15 = v9;
  v16 = self;
  v17 = v8;
  v11 = v8;
  v12 = v9;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 65, v10, v14);

}

void __59__CBCentralManager_retrievePeripheralsWithTags_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDevices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "peripheralWithInfo:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)retrievePeripheralsWithCustomProperties:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  CBCentralManager *v16;
  id v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 533, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("properties != nil"));

  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = CFSTR("kCBMsgArgCustomProperties");
  v19[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__CBCentralManager_retrievePeripheralsWithCustomProperties_completion___block_invoke;
  v14[3] = &unk_1E53FF5C8;
  v15 = v9;
  v16 = self;
  v17 = v8;
  v11 = v8;
  v12 = v9;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 66, v10, v14);

}

void __71__CBCentralManager_retrievePeripheralsWithCustomProperties_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDevices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "peripheralWithInfo:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)retrieveState
{
  void *v2;
  void *v3;

  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 207, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kCBMsgArgs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)retrieveConnectedPeripherals
{
  id WeakRetained;
  char v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CBCentralManager retrieveConnectedPeripheralsWithServices:](self, "retrieveConnectedPeripheralsWithServices:", MEMORY[0x1E0C9AA60]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBManager getCurrentQueue](self, "getCurrentQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__CBCentralManager_retrieveConnectedPeripherals__block_invoke;
    v8[3] = &unk_1E53FF5A0;
    v8[4] = self;
    v9 = v5;
    v7 = v5;
    dispatch_async(v6, v8);

  }
}

void __48__CBCentralManager_retrieveConnectedPeripherals__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "centralManager:didRetrieveConnectedPeripherals:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (NSArray)retrieveConnectedPeripheralsWithServices:(NSArray *)serviceUUIDs
{
  NSArray *v5;
  void *v6;
  void *v8;

  v5 = serviceUUIDs;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 566, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceUUIDs != nil"));

  }
  -[CBCentralManager retrieveConnectedPeripheralsWithServices:allowAll:](self, "retrieveConnectedPeripheralsWithServices:allowAll:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (id)retrieveConnectedPeripheralsWithServices:(id)a3 allowAll:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v4 = a4;
  v16[2] = *MEMORY[0x1E0C80C00];
  if (a3)
    v6 = a3;
  else
    v6 = (id)MEMORY[0x1E0C9AA60];
  v15[0] = CFSTR("kCBMsgArgUUIDs");
  v15[1] = CFSTR("kCBMsgArgState");
  v16[0] = v6;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a3;
  objc_msgSend(v7, "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 67, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDevices"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager createCBPeripheralsFromIDs:](self, "createCBPeripheralsFromIDs:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)retrieveConnectedPeripheralsWithServices:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (id)MEMORY[0x1E0C9AA60];
  if (a3)
    v7 = a3;
  v14[0] = CFSTR("kCBMsgArgUUIDs");
  v14[1] = CFSTR("kCBMsgArgState");
  v15[0] = v7;
  v15[1] = MEMORY[0x1E0C9AAB0];
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__CBCentralManager_retrieveConnectedPeripheralsWithServices_completion___block_invoke;
  v12[3] = &unk_1E53FF640;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 67, v10, v12);

}

void __72__CBCentralManager_retrieveConnectedPeripheralsWithServices_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDevices"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createCBPeripheralsFromIDs:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

}

- (void)retrievePeripheralsWithFindMySerialNumbers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
        v15 = objc_alloc(MEMORY[0x1E0CB3940]);
        v16 = (void *)objc_msgSend(v15, "initWithData:encoding:", v14, 4, (_QWORD)v17);
        objc_msgSend(v8, "addObject:", v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  -[CBCentralManager retrievePeripheralsWithFindMySerialNumberStrings:completion:](self, "retrievePeripheralsWithFindMySerialNumberStrings:completion:", v8, v7);
}

- (void)retrievePeripheralsWithFindMySerialNumberStrings:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v14 = CFSTR("kCBMsgArgFindMySerialNumberString");
  if (a3)
    v7 = a3;
  else
    v7 = (id)MEMORY[0x1E0C9AA60];
  v15[0] = v7;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__CBCentralManager_retrievePeripheralsWithFindMySerialNumberStrings_completion___block_invoke;
  v12[3] = &unk_1E53FF640;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 69, v10, v12);

}

void __80__CBCentralManager_retrievePeripheralsWithFindMySerialNumberStrings_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDevices"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createCBPeripheralsFromIDs:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

}

- (void)retrievePeripheralsWithFindMyIds:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v14 = CFSTR("kCBMsgArgUUIDs");
  if (a3)
    v7 = a3;
  else
    v7 = (id)MEMORY[0x1E0C9AA60];
  v15[0] = v7;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__CBCentralManager_retrievePeripheralsWithFindMyIds_completion___block_invoke;
  v12[3] = &unk_1E53FF640;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 70, v10, v12);

}

void __64__CBCentralManager_retrievePeripheralsWithFindMyIds_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDevices"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createCBPeripheralsFromIDs:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

}

- (id)retrieveConnectingPeripherals
{
  void *v3;
  void *v4;
  void *v5;

  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 68, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDevices"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager createCBPeripheralsFromIDs:](self, "createCBPeripheralsFromIDs:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)connectPeripheral:(CBPeripheral *)peripheral options:(NSDictionary *)options
{
  CBPeripheral *v7;
  NSDictionary *v8;
  void *v9;
  $07E581FC71E438F638AFE4D881A2E6BE delegateFlags;
  void *v11;
  id WeakRetained;
  CBPeripheral *v13;
  NSDictionary *v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  _QWORD v18[5];
  CBPeripheral *v19;
  NSDictionary *v20;

  v7 = peripheral;
  v8 = options;
  -[NSDictionary valueForKey:](v8, "valueForKey:", CFSTR("kCBConnectOptionAutoReconnect"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || (delegateFlags = self->_delegateFlags, (*(_BYTE *)&delegateFlags & 0x20) != 0))
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 672, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

    }
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __46__CBCentralManager_connectPeripheral_options___block_invoke;
    v18[3] = &unk_1E53FF668;
    v18[4] = self;
    v13 = v7;
    v19 = v13;
    v14 = v8;
    v20 = v14;
    v15 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v18);
    -[NSDictionary valueForKey:](v14, "valueForKey:", CFSTR("kCBConnectOptionUseWHB"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      -[CBCentralManager connectWhbCBPeripheral:withCompletion:](self, "connectWhbCBPeripheral:withCompletion:", v13, v15);
    else
      v15[2](v15);

  }
  else if ((*(_BYTE *)&delegateFlags & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", &unk_1E5423FE0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "centralManager:didFailToConnectPeripheral:error:", self, v7, v11);

  }
}

void __46__CBCentralManager_connectPeripheral_options___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("kCBMsgArgDeviceUUID");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v9[1] = CFSTR("kCBMsgArgOptions");
  v5 = *(_QWORD *)(a1 + 48);
  if (!v5)
    v5 = MEMORY[0x1E0C9AA70];
  v10[0] = v3;
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "sendMsg:args:", 73, v6);

  if (v7)
  {
    v8 = objc_msgSend(*(id *)(a1 + 40), "state");
    if (v8 == 3 || !v8)
      objc_msgSend(*(id *)(a1 + 40), "setState:", 1);
  }
}

- (void)enableMrc:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 701, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

  }
  v14[0] = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(v7, "identifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v14[1] = CFSTR("kCBMsgArgOptions");
  v11 = (id)MEMORY[0x1E0C9AA70];
  if (v8)
    v11 = v8;
  v15[0] = v9;
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 220, v12);

}

- (id)retrieveWhbCBPeripheralWithInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  const __CFString *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgWhbStableIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgWhbRemoteControllerId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v8 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v5;
      v28 = 2112;
      v29 = v4;
      _os_log_impl(&dword_1A82A2000, v8, OS_LOG_TYPE_DEFAULT, "Retrieving peripheral for device:%@ with info %@", buf, 0x16u);
    }
    v24 = CFSTR("kCBMsgArgWhbStableIdentifier");
    v25 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 146, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        -[CBCentralManager peripheralWithInfo:](self, "peripheralWithInfo:", v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "setStableIdentifier:", v6);
      objc_msgSend(v13, "setRemoteControllerId:", v7);
      if (CBLogInitOnce == -1)
      {
        v19 = CBLogComponent;
        if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
          goto LABEL_22;
      }
      else
      {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        v19 = CBLogComponent;
        if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
          goto LABEL_22;
      }
      *(_DWORD *)buf = 138412290;
      v27 = v5;
      v15 = "Retrieved non local peripheral successfully for device:%@";
      v16 = v19;
      v17 = 12;
      goto LABEL_21;
    }
    -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v12, "setStableIdentifier:", v6);
      if (CBLogInitOnce != -1)
      {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        v14 = CBLogComponent;
        if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
          goto LABEL_22;
        goto LABEL_10;
      }
      v14 = CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:
        *(_DWORD *)buf = 138412546;
        v27 = v11;
        v28 = 2112;
        v29 = v5;
        v15 = "Retrieved local peripheral:%@ successfully for device:%@";
        v16 = v14;
        v17 = 22;
LABEL_21:
        _os_log_impl(&dword_1A82A2000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
      }
LABEL_22:
      v18 = v13;
LABEL_27:

      goto LABEL_28;
    }
    v20 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v11, CFSTR("kCBMsgArgDeviceUUID"));
    objc_msgSend(v20, "setObject:forKeyedSubscript:", 0, CFSTR("kCBMsgArgWhbRemoteControllerId"));
    -[CBCentralManager peripheralWithInfo:](self, "peripheralWithInfo:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setStableIdentifier:", v6);
    if (CBLogInitOnce == -1)
    {
      v22 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
LABEL_26:
        v18 = v21;

        goto LABEL_27;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v22 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
    }
    *(_DWORD *)buf = 138412546;
    v27 = v11;
    v28 = 2112;
    v29 = v5;
    _os_log_impl(&dword_1A82A2000, v22, OS_LOG_TYPE_DEFAULT, "Created local peripheral:%@ successfully for device:%@", buf, 0x16u);
    goto LABEL_26;
  }
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    -[CBCentralManager retrieveWhbCBPeripheralWithInfo:].cold.1();
  v18 = 0;
LABEL_28:

  return v18;
}

- (void)activateWhbCnxForCBPeripheral:(id)a3 infoDict:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  $07E581FC71E438F638AFE4D881A2E6BE delegateFlags;
  int v17;
  uint64_t v18;
  int v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  int v27;
  _QWORD v28[5];
  id v29;
  id v30;
  int v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager getCnxInstanceForIdentifier:](self, "getCnxInstanceForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      -[CBCentralManager activateWhbCnxForCBPeripheral:infoDict:].cold.1();
  }
  else
  {
    -[CBManager createCnxWithInfo:](self, "createCnxWithInfo:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v10 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v7;
      _os_log_impl(&dword_1A82A2000, v10, OS_LOG_TYPE_DEFAULT, "Setup WHB cnx: infoDict %@", buf, 0xCu);
    }
    objc_msgSend(v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "peerDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBManager setWhbLocalId:forRemoteId:](self, "setWhbLocalId:forRemoteId:", v11, v13);

  }
  objc_msgSend(v9, "peerDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  delegateFlags = self->_delegateFlags;
  v17 = (*(unsigned int *)&delegateFlags >> 3) & 1;
  v18 = MEMORY[0x1E0C809B0];
  v19 = (*(unsigned int *)&delegateFlags >> 4) & 1;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __59__CBCentralManager_activateWhbCnxForCBPeripheral_infoDict___block_invoke;
  v28[3] = &unk_1E53FF690;
  v28[4] = self;
  v20 = v6;
  v29 = v20;
  v21 = v15;
  v30 = v21;
  v31 = v19;
  objc_msgSend(v9, "setInterruptionHandler:", v28);
  v24[0] = v18;
  v24[1] = 3221225472;
  v24[2] = __59__CBCentralManager_activateWhbCnxForCBPeripheral_infoDict___block_invoke_171;
  v24[3] = &unk_1E53FF6B8;
  v24[4] = self;
  v25 = v20;
  v26 = v21;
  v27 = v17;
  v22 = v21;
  v23 = v20;
  objc_msgSend(v9, "activateWithCompletion:", v24);

}

void __59__CBCentralManager_activateWhbCnxForCBPeripheral_infoDict___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    __59__CBCentralManager_activateWhbCnxForCBPeripheral_infoDict___block_invoke_cold_1();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeCnxInstanceForIdentifier:", v3);

  objc_msgSend(*(id *)(a1 + 32), "removeWhbRemoteId:", *(_QWORD *)(a1 + 48));
  if (*(_DWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", &unk_1E5424008);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centralManager:didDisconnectPeripheral:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v4);

  }
}

void __59__CBCentralManager_activateWhbCnxForCBPeripheral_infoDict___block_invoke_171(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v4 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1A82A2000, v4, OS_LOG_TYPE_DEFAULT, "Got WHB CBConnection completed with error %@", (uint8_t *)&v8, 0xCu);
  }
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeCnxInstanceForIdentifier:", v6);

    objc_msgSend(*(id *)(a1 + 32), "removeWhbRemoteId:", *(_QWORD *)(a1 + 48));
    if (*(_DWORD *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "centralManager:didFailToConnectPeripheral:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v3);

    }
  }

}

- (void)connectWhbCBPeripheral:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  CBCentralManager *v24;
  id v25;
  id v26;
  int v27;
  const __CFString *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "remoteControllerId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

  }
  else
  {
    objc_msgSend(v6, "stableIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      {
        -[CBCentralManager connectWhbCBPeripheral:withCompletion:].cold.1();
        if ((*(_BYTE *)&self->_delegateFlags & 8) == 0)
          goto LABEL_13;
      }
      else if ((*(_BYTE *)&self->_delegateFlags & 8) == 0)
      {
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", &unk_1E5424030);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[CBCentralManager delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "centralManager:didFailToConnectPeripheral:error:", self, v6, v13);
      goto LABEL_11;
    }
  }
  v10 = (void *)MEMORY[0x1E0C99E08];
  v32 = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(v6, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithDictionary:", v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "remoteControllerId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v15 = (void *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      objc_msgSend(v6, "remoteControllerId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v17;
      _os_log_impl(&dword_1A82A2000, v16, OS_LOG_TYPE_DEFAULT, "Setting up WhbCnx using manually entered remoteControllerId %@", buf, 0xCu);

    }
    objc_msgSend(v6, "remoteControllerId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v18, CFSTR("kCBMsgArgWhbRemoteControllerId"));

    -[CBCentralManager activateWhbCnxForCBPeripheral:infoDict:](self, "activateWhbCnxForCBPeripheral:infoDict:", v6, v13);
    goto LABEL_12;
  }
  objc_msgSend(v6, "stableIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (*(_DWORD *)&self->_delegateFlags >> 3) & 1;
  v28 = CFSTR("kCBMsgArgWhbStableIdentifier");
  v29 = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __58__CBCentralManager_connectWhbCBPeripheral_withCompletion___block_invoke;
  v22[3] = &unk_1E53FF6E0;
  v27 = v20;
  v23 = v6;
  v24 = self;
  v26 = v7;
  v13 = v13;
  v25 = v13;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 145, v21, v22);

LABEL_11:
LABEL_12:

LABEL_13:
}

void __58__CBCentralManager_connectWhbCBPeripheral_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgWhbRemoteControllerId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgWhbRemoteDeviceUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v6 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A82A2000, v6, OS_LOG_TYPE_DEFAULT, "Whb connect request to p %@, routing via %@", (uint8_t *)&v10, 0x16u);
  }
  if (v4)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("CBLocalHostID")))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "setValue:forKey:", v4, CFSTR("kCBMsgArgWhbRemoteControllerId"));
      if (v5)
        objc_msgSend(*(id *)(a1 + 48), "setValue:forKey:", v5, CFSTR("kCBMsgArgWhbRemoteDeviceUUID"));
      objc_msgSend(*(id *)(a1 + 40), "activateWhbCnxForCBPeripheral:infoDict:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    }
  }
  else if (*(_DWORD *)(a1 + 64))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centralManager:didFailToConnectPeripheral:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v8);

  }
}

- (void)randomizeAFHMapForPeripheral:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 853, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

  }
  v9 = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 99, v7);

}

- (void)setLeAFHMap:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 860, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("map != nil"));

  }
  v8 = CFSTR("kCBMsgArgLeAFHMap");
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 100, v6);

}

- (void)setHostState:(BOOL)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("kCBMsgArgState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendDebugMsg:args:](self, "sendDebugMsg:args:", 1, v5);

}

- (void)setLePowerControl:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (a4)
    v9 = a4;
  else
    v9 = (id)MEMORY[0x1E0C9AA70];
  v16[0] = CFSTR("kCBMsgArgOptions");
  v16[1] = CFSTR("kCBMsgArgDeviceUUID");
  v17[0] = v9;
  v10 = a4;
  objc_msgSend(a3, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__CBCentralManager_setLePowerControl_options_completion___block_invoke;
  v14[3] = &unk_1E53FF618;
  v15 = v8;
  v13 = v8;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 219, v12, v14);

}

uint64_t __57__CBCentralManager_setLePowerControl_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)wipeDuplicateFilterList:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    v4 = a3;
  else
    v4 = (id)MEMORY[0x1E0C9AA70];
  v8 = CFSTR("kCBMsgArgOptions");
  v9[0] = v4;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 101, v7);
}

- (void)addAdvancedMatchingRule:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    v4 = a3;
  else
    v4 = (id)MEMORY[0x1E0C9AA70];
  v8 = CFSTR("kCBMsgArgOptions");
  v9[0] = v4;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 108, v7);
}

- (void)removeAdvancedMatchingRule:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    v4 = a3;
  else
    v4 = (id)MEMORY[0x1E0C9AA70];
  v8 = CFSTR("kCBMsgArgOptions");
  v9[0] = v4;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 109, v7);
}

- (void)setEnhancedScanEnable:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    v4 = a3;
  else
    v4 = (id)MEMORY[0x1E0C9AA70];
  v8 = CFSTR("kCBMsgArgOptions");
  v9[0] = v4;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 106, v7);
}

- (void)setEnhancedSetScanParamtersMultiCore:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    v4 = a3;
  else
    v4 = (id)MEMORY[0x1E0C9AA70];
  v8 = CFSTR("kCBMsgArgOptions");
  v9[0] = v4;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 107, v7);
}

- (void)removeSingleEntryDuplicateFilter:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("kCBMsgArgOptions");
  v8[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 102, v6);
}

- (void)removeMultipleEntriesDuplicateFilter:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("kCBMsgArgOptions");
  v8[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 103, v6);
}

- (void)clearDuplicateFilterCache:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("kCBMsgArgOptions");
  v8[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 104, v6);
}

- (unsigned)getTotalSupportedAdvancedMatchingRules
{
  void *v2;
  void *v3;
  unsigned __int16 v4;

  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 105, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("kCBScanOptionTotalAdvMatchingRules"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (unsigned)getRemainingAdvancedMatchingRule
{
  void *v2;
  void *v3;
  unsigned __int16 v4;

  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 105, MEMORY[0x1E0C9AA70]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("kCBScanOptionRemainingAdvMatchingRules"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)setDataLengthChange:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 953, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

  }
  v14[0] = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(v7, "identifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v14[1] = CFSTR("kCBMsgArgOptions");
  v11 = (id)MEMORY[0x1E0C9AA70];
  if (v8)
    v11 = v8;
  v15[0] = v9;
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 113, v12);

}

- (void)csReadLocalSupportedCapabilities
{
  id v2;

  v2 = -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 114, 0);
}

- (void)csReadRemoteSupportedCapabilities:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 967, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

  }
  v9 = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 115, v7);

}

- (void)csWriteCachedRemoteSupportedCapabilities:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 973, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

  }
  v14[0] = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(v7, "identifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v14[1] = CFSTR("kCBMsgArgOptions");
  v11 = (id)MEMORY[0x1E0C9AA70];
  if (v8)
    v11 = v8;
  v15[0] = v9;
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 116, v12);

}

- (void)csSecurityEnable:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 980, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

  }
  v9 = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 117, v7);

}

- (void)csTest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 986, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

  }
  v9 = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 118, v7);

}

- (void)csCreateConfig:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 992, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

  }
  v14[0] = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(v7, "identifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v14[1] = CFSTR("kCBMsgArgOptions");
  v11 = (id)MEMORY[0x1E0C9AA70];
  if (v8)
    v11 = v8;
  v15[0] = v9;
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 119, v12);

}

- (void)csRemoveConfig:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 999, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

  }
  v14[0] = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(v7, "identifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v14[1] = CFSTR("kCBMsgArgOptions");
  v11 = (id)MEMORY[0x1E0C9AA70];
  if (v8)
    v11 = v8;
  v15[0] = v9;
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 120, v12);

}

- (void)csProcedureEnable:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 1006, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

  }
  v14[0] = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(v7, "identifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v14[1] = CFSTR("kCBMsgArgOptions");
  v11 = (id)MEMORY[0x1E0C9AA70];
  if (v8)
    v11 = v8;
  v15[0] = v9;
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 121, v12);

}

- (void)csSetProcedureParams:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 1013, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

  }
  v14[0] = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(v7, "identifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v14[1] = CFSTR("kCBMsgArgOptions");
  v11 = (id)MEMORY[0x1E0C9AA70];
  if (v8)
    v11 = v8;
  v15[0] = v9;
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 122, v12);

}

- (void)csSetAfh:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    v4 = a3;
  else
    v4 = (id)MEMORY[0x1E0C9AA70];
  v8 = CFSTR("kCBMsgArgOptions");
  v9[0] = v4;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 123, v7);
}

- (void)csSetDefaultSettings:(id)a3 options:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("kCBMsgArgDeviceUUID");
  v6 = a4;
  objc_msgSend(a3, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v11[1] = CFSTR("kCBMsgArgOptions");
  v9 = (id)MEMORY[0x1E0C9AA70];
  if (v6)
    v9 = v6;
  v12[0] = v7;
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 124, v10);
}

- (void)csReadLocalFAETable
{
  id v2;

  v2 = -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 125, 0);
}

- (void)csReadRemoteFAETable:(id)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 126, v5);

}

- (void)csWriteRemoteFAETable:(id)a3 options:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("kCBMsgArgDeviceUUID");
  v6 = a4;
  objc_msgSend(a3, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v11[1] = CFSTR("kCBMsgArgOptions");
  v9 = (id)MEMORY[0x1E0C9AA70];
  if (v6)
    v9 = v6;
  v12[0] = v7;
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 127, v10);
}

- (void)setLESetPhy:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 1047, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

  }
  v14[0] = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(v7, "identifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v14[1] = CFSTR("kCBMsgArgOptions");
  v11 = (id)MEMORY[0x1E0C9AA70];
  if (v8)
    v11 = v8;
  v15[0] = v9;
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 128, v12);

}

- (void)setRSSIStatisticsDetection:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 1056, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

  }
  v14[0] = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(v7, "identifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v14[1] = CFSTR("kCBMsgArgOptions");
  v11 = (id)MEMORY[0x1E0C9AA70];
  if (v8)
    v11 = v8;
  v15[0] = v9;
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 142, v12);

}

- (void)setBluetoothUsageNotifications:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 1065, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

  }
  v14[0] = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(v7, "identifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v14[1] = CFSTR("kCBMsgArgOptions");
  v11 = (id)MEMORY[0x1E0C9AA70];
  if (v8)
    v11 = v8;
  v15[0] = v9;
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 143, v12);

}

- (void)setBluetoothPhyStatisticsNotifications:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 1074, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

  }
  v14[0] = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(v7, "identifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v14[1] = CFSTR("kCBMsgArgOptions");
  v11 = (id)MEMORY[0x1E0C9AA70];
  if (v8)
    v11 = v8;
  v15[0] = v9;
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 144, v12);

}

- (void)cancelPeripheralConnection:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 1083, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

  }
  v15[0] = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(v7, "identifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v15[1] = CFSTR("kCBMsgArgOptions");
  v11 = (id)MEMORY[0x1E0C9AA70];
  if (v8)
    v11 = v8;
  v16[0] = v9;
  v16[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CBManager sendMsg:args:](self, "sendMsg:args:", 74, v12);

  if (v13 && (unint64_t)(objc_msgSend(v7, "state") - 1) <= 1)
    objc_msgSend(v7, "setState:", 3);

}

- (void)cancelPeripheralConnection:(CBPeripheral *)peripheral
{
  void *v4;
  CBPeripheral *v5;
  uint64_t v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = peripheral;
  objc_msgSend(v4, "dictionary");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v7, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("kCBCancelConnectOptionForce"));
  objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("kCBCancelConnectOptionDoNotAutoConnectBuiltInServices"));
  -[CBCentralManager cancelPeripheralConnection:options:](self, "cancelPeripheralConnection:options:", v5, v7);

}

- (void)cancelPeripheralConnection:(id)a3 force:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 1114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = MEMORY[0x1E0C9AAA0];
  if (v4)
    v10 = MEMORY[0x1E0C9AAB0];
  else
    v10 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("kCBCancelConnectOptionForce"));
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("kCBCancelConnectOptionDoNotAutoConnectBuiltInServices"));
  -[CBCentralManager cancelPeripheralConnection:options:](self, "cancelPeripheralConnection:options:", v12, v8);

}

- (void)setDesiredConnectionLatency:(int64_t)a3 forPeripheral:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 1126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

  }
  v12[0] = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = MEMORY[0x1E0C9AAA0];
  v12[1] = CFSTR("kCBMsgArgHasCompletionBlock");
  v12[2] = CFSTR("kCBMsgArgConnectionLatency");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 163, v10);

}

- (void)setDesiredConnectionLatency:(int64_t)a3 forPeripheral:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 1136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

  }
  v18[0] = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v11;
  v19[1] = MEMORY[0x1E0C9AAB0];
  v18[1] = CFSTR("kCBMsgArgHasCompletionBlock");
  v18[2] = CFSTR("kCBMsgArgConnectionLatency");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__CBCentralManager_setDesiredConnectionLatency_forPeripheral_completion___block_invoke;
  v16[3] = &unk_1E53FF618;
  v17 = v10;
  v14 = v10;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 163, v13, v16);

}

void __73__CBCentralManager_setDesiredConnectionLatency_forPeripheral_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)startTrackingPeripheral:(id)a3 options:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  v8 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 1149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

    v8 = 0;
  }
  v9 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, CFSTR("kCBMsgArgDeviceUUID"), v11, CFSTR("kCBMsgArgOptions"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 205, v12);

  if (!v7)
}

- (void)stopTrackingPeripheral:(id)a3 options:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  v8 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 1160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

    v8 = 0;
  }
  v9 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, CFSTR("kCBMsgArgDeviceUUID"), v11, CFSTR("kCBMsgArgOptions"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 206, v12);

  if (!v7)
}

- (void)enablePrivateModeForPeripheral:(id)a3 forDuration:(unsigned __int16)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v4 = a4;
  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("kCBMsgArgPrivateModeTimeout");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithUnsignedShort:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("kCBMsgArgDeviceUUID");
  v12[0] = v8;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 42, v10);

}

- (void)enablePrivateModeForSessionWithIdentifier:(id)a3 forDuration:(unsigned __int16)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v4 = a4;
  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("kCBMsgArgPrivateModeTimeout");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithUnsignedShort:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("kCBMsgArgPrivateModeSessionIdentifier");
  v11[0] = v8;
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 42, v9);
}

- (void)registerForConnectionEventsWithOptions:(NSDictionary *)options
{
  NSDictionary *v4;
  void *v5;
  NSDictionary *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (options)
    v4 = options;
  else
    v4 = (NSDictionary *)MEMORY[0x1E0C9AA70];
  v8 = CFSTR("kCBMsgArgOptions");
  v9[0] = v4;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = options;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 93, v7);
}

- (void)pauseLeConnectionManager
{
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 95, MEMORY[0x1E0C9AA70]);
}

- (void)resumeLeConnectionManager
{
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 96, MEMORY[0x1E0C9AA70]);
}

- (void)pauseScans
{
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 97, MEMORY[0x1E0C9AA70]);
}

- (void)resumeScans
{
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 98, MEMORY[0x1E0C9AA70]);
}

- (void)sendData:(id)a3 toPeripheral:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("kCBMsgArgDeviceUUID");
  v6 = a3;
  objc_msgSend(a4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("kCBMsgArgObjectDiscoveryData");
  v10[0] = v7;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 137, v8);
}

- (void)setConnectionEventOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    v4 = a3;
  else
    v4 = (id)MEMORY[0x1E0C9AA70];
  v8 = CFSTR("kCBMsgArgOptions");
  v9[0] = v4;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 93, v7);
}

- (void)setMatchActionRules:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    v4 = a3;
  else
    v4 = (id)MEMORY[0x1E0C9AA70];
  v8 = CFSTR("kCBMsgArgRules");
  v9[0] = v4;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 112, v7);
}

+ (BOOL)supportsFeatures:(CBCentralManagerFeature)features
{
  return (features & ~(unint64_t)gSupportedFeatures) == 0;
}

- (id)startConnectionEventCounterForPeripheral:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v10 = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(a3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 140, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithInfo:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)stopConnectionEventCounterForPeripheral:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v10 = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(a3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 141, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithInfo:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)isApplicationConnectedToAnyPeripherals:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("kCBMsgArgAnyConnectedPeripheralsPerApp");
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 78, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)createOfflineLEPairing:(unsigned __int16)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("kCBMsgArgDevices");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 79, v5);

}

- (id)getLPEMData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 211, MEMORY[0x1E0C9AA70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCBMsgArgLPEMData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setData:", v6);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unsigned)retrieveMaxConnectionForUsecase:(unsigned int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("kCBMsgArgUseCase");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 80, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBMsgArgUsecaseCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(self) = objc_msgSend(v7, "intValue");

  return (unsigned __int16)self;
}

- (id)retrieveAddressForPeripheral:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 1263, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peripheral != nil"));

  }
  v12 = CFSTR("kCBMsgArgDeviceUUID");
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 217, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAddressString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)updatePeripheral:(id)a3 options:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("kCBMsgArgDeviceUUID");
  v6 = a4;
  objc_msgSend(a3, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v11[1] = CFSTR("kCBMsgArgOptions");
  v9 = (id)MEMORY[0x1E0C9AA70];
  if (v6)
    v9 = v6;
  v12[0] = v7;
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 81, v10);
}

- (void)retrieveBTDeviceCacheInfo:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13 = CFSTR("kCBMsgArgOptions");
  v14[0] = a3;
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__CBCentralManager_retrieveBTDeviceCacheInfo_withCompletion___block_invoke;
  v11[3] = &unk_1E53FF618;
  v12 = v6;
  v10 = v6;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 83, v9, v11);

}

uint64_t __61__CBCentralManager_retrieveBTDeviceCacheInfo_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handleRestoringState:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  CBService *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  CBCharacteristic *v37;
  id v38;
  CBCharacteristic *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  CBDescriptor *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  void *v53;
  CBService *v54;
  void *v55;
  CBService *v56;
  id v57;
  CBService *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id obj;
  uint64_t v65;
  void *v66;
  CBCentralManager *v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  uint64_t v78;
  void *v79;
  CBService *v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD v83[4];
  CBService *v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[4];
  CBCharacteristic *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _QWORD v115[2];
  _QWORD v116[2];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((*(_BYTE *)&self->_delegateFlags & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCentralManager.m"), 1306, CFSTR("Registered delegate no longer supports restoring"));

  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCBMsgArgOptions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CBCentralManager setIsScanning:](self, "setIsScanning:", 1);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCBMsgArgUUIDs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      -[CBCentralManager dataArrayToUUIDArray:](self, "dataArrayToUUIDArray:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("kCBRestoredScanServices"));

    }
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCBScanOptionSolicitedServiceUUIDs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      -[CBCentralManager dataArrayToUUIDArray:](self, "dataArrayToUUIDArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("kCBScanOptionSolicitedServiceUUIDs"));

    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCBScanOptionAllowDuplicates"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    if (v14)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("kCBScanOptionAllowDuplicates"));
    if (objc_msgSend(v10, "count"))
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("kCBRestoredScanOptions"));

  }
  v61 = v7;
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v63 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDevices"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v119, 16);
  if (v68)
  {
    v65 = *(_QWORD *)v109;
    v66 = v15;
    v67 = self;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v109 != v65)
          objc_enumerationMutation(obj);
        v69 = v16;
        v17 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v16);
        -[CBCentralManager peripheralWithInfo:](self, "peripheralWithInfo:", v17, v61);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("kCBMsgArgState"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "BOOLValue"))
          v20 = 2;
        else
          v20 = 1;
        objc_msgSend(v18, "setState:", v20);

        objc_msgSend(v18, "setCanSendWriteWithoutResponse:", objc_msgSend(v18, "state") == 2);
        v74 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v76 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSubscribedHandles"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = 0u;
        v105 = 0u;
        v106 = 0u;
        v107 = 0u;
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("kCBMsgArgServices"));
        v70 = (id)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v104, v118, 16);
        if (v72)
        {
          v71 = *(_QWORD *)v105;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v105 != v71)
                objc_enumerationMutation(v70);
              v73 = v21;
              v23 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v21);
              v24 = -[CBService initWithPeripheral:dictionary:]([CBService alloc], "initWithPeripheral:dictionary:", v18, v23);
              v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v100 = 0u;
              v101 = 0u;
              v102 = 0u;
              v103 = 0u;
              objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kCBMsgArgIncludedServices"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v100, v117, 16);
              if (v27)
              {
                v28 = v27;
                v29 = *(_QWORD *)v101;
                do
                {
                  for (i = 0; i != v28; ++i)
                  {
                    if (*(_QWORD *)v101 != v29)
                      objc_enumerationMutation(v26);
                    v31 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * i);
                    v115[0] = CFSTR("service");
                    v115[1] = CFSTR("incInfo");
                    v116[0] = v24;
                    v116[1] = v31;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 2);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v76, "addObject:", v32);

                  }
                  v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v100, v117, 16);
                }
                while (v28);
              }

              v98 = 0u;
              v99 = 0u;
              v96 = 0u;
              v97 = 0u;
              objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kCBMsgArgCharacteristics"));
              v75 = (id)objc_claimAutoreleasedReturnValue();
              v81 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v96, v114, 16);
              if (v81)
              {
                v78 = *(_QWORD *)v97;
                v79 = v25;
                v80 = v24;
                do
                {
                  v33 = 0;
                  do
                  {
                    if (*(_QWORD *)v97 != v78)
                      objc_enumerationMutation(v75);
                    v82 = v33;
                    v36 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v33);
                    v37 = -[CBCharacteristic initWithService:dictionary:]([CBCharacteristic alloc], "initWithService:dictionary:", v24, v36);
                    v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    v94[0] = MEMORY[0x1E0C809B0];
                    v94[1] = 3221225472;
                    v94[2] = __41__CBCentralManager_handleRestoringState___block_invoke;
                    v94[3] = &unk_1E53FF708;
                    v39 = v37;
                    v95 = v39;
                    objc_msgSend(v77, "enumerateObjectsUsingBlock:", v94);
                    v92 = 0u;
                    v93 = 0u;
                    v90 = 0u;
                    v91 = 0u;
                    objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDescriptors"));
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v90, v113, 16);
                    if (v41)
                    {
                      v42 = v41;
                      v43 = *(_QWORD *)v91;
                      do
                      {
                        for (j = 0; j != v42; ++j)
                        {
                          if (*(_QWORD *)v91 != v43)
                            objc_enumerationMutation(v40);
                          v45 = -[CBDescriptor initWithCharacteristic:dictionary:]([CBDescriptor alloc], "initWithCharacteristic:dictionary:", v39, *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * j));
                          objc_msgSend(v38, "addObject:", v45);
                          -[CBDescriptor handle](v45, "handle");
                          v46 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v18, "setAttribute:forHandle:", v45, v46);

                        }
                        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v90, v113, 16);
                      }
                      while (v42);
                    }

                    if (objc_msgSend(v38, "count"))
                      -[CBCharacteristic setDescriptors:](v39, "setDescriptors:", v38);
                    v25 = v79;
                    objc_msgSend(v79, "addObject:", v39);
                    -[CBCharacteristic handle](v39, "handle");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v18, "setAttribute:forHandle:", v39, v34);

                    -[CBCharacteristic valueHandle](v39, "valueHandle");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v18, "setAttribute:forHandle:", v39, v35);

                    v33 = v82 + 1;
                    v24 = v80;
                  }
                  while (v82 + 1 != v81);
                  v81 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v96, v114, 16);
                }
                while (v81);
              }

              if (objc_msgSend(v25, "count"))
                -[CBService setCharacteristics:](v24, "setCharacteristics:", v25);
              objc_msgSend(v74, "addObject:", v24);
              -[CBService startHandle](v24, "startHandle");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setAttribute:forHandle:", v24, v22);

              v21 = v73 + 1;
            }
            while (v73 + 1 != v72);
            v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v104, v118, 16);
          }
          while (v72);
        }

        v88 = 0u;
        v89 = 0u;
        v86 = 0u;
        v87 = 0u;
        v47 = v76;
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v86, v112, 16);
        if (v48)
        {
          v49 = v48;
          v50 = *(_QWORD *)v87;
          do
          {
            for (k = 0; k != v49; ++k)
            {
              if (*(_QWORD *)v87 != v50)
                objc_enumerationMutation(v47);
              v52 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * k);
              objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("service"));
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = [CBService alloc];
              objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("incInfo"));
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = -[CBService initWithPeripheral:dictionary:](v54, "initWithPeripheral:dictionary:", 0, v55);

              v83[0] = MEMORY[0x1E0C809B0];
              v83[1] = 3221225472;
              v83[2] = __41__CBCentralManager_handleRestoringState___block_invoke_2;
              v83[3] = &unk_1E53FF730;
              v84 = v56;
              v85 = v53;
              v57 = v53;
              v58 = v56;
              objc_msgSend(v74, "enumerateObjectsUsingBlock:", v83);

            }
            v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v86, v112, 16);
          }
          while (v49);
        }

        if (objc_msgSend(v74, "count"))
          objc_msgSend(v18, "setServices:", v74);
        v15 = v66;
        objc_msgSend(v66, "addObject:", v18);

        v16 = v69 + 1;
        self = v67;
      }
      while (v69 + 1 != v68);
      v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v119, 16);
    }
    while (v68);
  }

  if (objc_msgSend(v15, "count"))
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("kCBRestoredPeripherals"));
  -[CBCentralManager delegate](self, "delegate", v61);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "centralManager:willRestoreState:", self, v6);

}

void __41__CBCentralManager_handleRestoringState___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  int v9;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "handle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToNumber:", v8);

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsNotifying:", 1);
    *a4 = 1;
  }
}

void __41__CBCentralManager_handleRestoringState___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "UUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) == 0)
    goto LABEL_7;
  objc_msgSend(v15, "startHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "startHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToNumber:", v9))
  {

LABEL_7:
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v15, "endHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToNumber:", v11);

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "includedServices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 40), "includedServices");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(v14, "mutableCopy");

    }
    else
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    }

    objc_msgSend(v6, "addObject:", v15);
    objc_msgSend(*(id *)(a1 + 40), "setIncludedServices:", v6);
    *a4 = 1;
    goto LABEL_8;
  }
LABEL_9:

}

- (void)handlePeripheralInvalidated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[NSMapTable removeObjectForKey:](self->_peripherals, "removeObjectForKey:", v6);

    v4 = v6;
  }

}

- (void)handleScanComplete:(id)a3
{
  id v4;
  void *v5;
  void (**scanCompletion)(id, void *, void *);
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  if (self->_scanCompletion)
  {
    v9 = v4;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    scanCompletion = (void (**)(id, void *, void *))self->_scanCompletion;
    if (v5)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCBScanOptionTotalRXTimeMS"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      scanCompletion[2](scanCompletion, v5, v7);

    }
    else
    {
      scanCompletion[2](self->_scanCompletion, 0, 0);
    }
    v8 = self->_scanCompletion;
    self->_scanCompletion = 0;

    v4 = v9;
  }

}

- (void)handleScanParamsUpdated:(id)a3
{
  id v4;
  id v5;

  if ((*((_BYTE *)&self->_delegateFlags + 3) & 2) != 0)
  {
    v4 = a3;
    -[CBCentralManager delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centralManager:didUpdateScanParams:", self, v4);

  }
}

- (void)handleFindMyDevicesUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*((_BYTE *)&self->_delegateFlags + 3) & 4) != 0)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDevices"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[CBCentralManager peripheralWithInfo:](self, "peripheralWithInfo:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    -[CBCentralManager delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "centralManager:didUpdateFindMyPeripherals:", self, v5);

  }
}

- (void)handlePeripheralConnectionCompleted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "handleFailedConnection");
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgResult"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 341);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToNumber:", v9);

      if (v10)
      {
        if (CBLogInitOnce != -1)
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT))
        {
          -[CBCentralManager handlePeripheralConnectionCompleted:].cold.1();
          if ((*(_BYTE *)&self->_delegateFlags & 8) == 0)
            goto LABEL_22;
          goto LABEL_20;
        }
      }
      else
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgResult"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 348);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToNumber:", v14);

        if (v15)
        {
          if (CBLogInitOnce != -1)
            dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT))
          {
            -[CBCentralManager handlePeripheralConnectionCompleted:].cold.2();
            if ((*(_BYTE *)&self->_delegateFlags & 8) == 0)
              goto LABEL_22;
            goto LABEL_20;
          }
        }
      }
      if ((*(_BYTE *)&self->_delegateFlags & 8) != 0)
      {
LABEL_20:
        -[CBCentralManager delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "centralManager:didFailToConnectPeripheral:error:", self, v6, v7);
        goto LABEL_21;
      }
    }
    else
    {
      objc_msgSend(v6, "handleSuccessfulConnection:", v4);
      if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
      {
        -[CBCentralManager delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "centralManager:didConnectPeripheral:", self, v6);
LABEL_21:

      }
    }
LABEL_22:

    goto LABEL_23;
  }
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v11 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_impl(&dword_1A82A2000, v11, OS_LOG_TYPE_DEFAULT, "No peripheral found for args %@", (uint8_t *)&v16, 0xCu);
  }
LABEL_23:

}

- (void)handlePeripheralCLReady:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6 && (*((_BYTE *)&self->_delegateFlags + 2) & 1) != 0)
    {
      -[CBCentralManager delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "centralManager:canSendDataToPeripheral:", self, v5);

    }
  }

}

- (void)handlePeripheralDisconnectionCompleted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  $07E581FC71E438F638AFE4D881A2E6BE delegateFlags;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBDisconnectInfoTimestamp"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBDisconnectInfoIsReconnecting"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v6, "handleDisconnection");
    if ((_DWORD)v12)
      objc_msgSend(v6, "setState:", 1);
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBManager getCnxInstanceForIdentifier:](self, "getCnxInstanceForIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v15 = CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138412290;
        v22 = v6;
        _os_log_impl(&dword_1A82A2000, v15, OS_LOG_TYPE_DEFAULT, "WHB device %@ disconnected", (uint8_t *)&v21, 0xCu);
      }
      objc_msgSend(v14, "peerDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBManager removeWhbRemoteId:](self, "removeWhbRemoteId:", v17);

      objc_msgSend(v6, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBManager removeCnxInstanceForIdentifier:](self, "removeCnxInstanceForIdentifier:", v18);

    }
    delegateFlags = self->_delegateFlags;
    if ((*(_BYTE *)&delegateFlags & 0x10) != 0)
    {
      -[CBCentralManager delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "centralManager:didDisconnectPeripheral:error:", self, v6, v7);
    }
    else
    {
      if ((*(_BYTE *)&delegateFlags & 0x20) == 0)
      {
LABEL_15:

        goto LABEL_16;
      }
      -[CBCentralManager delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "centralManager:didDisconnectPeripheral:timestamp:isReconnecting:error:", self, v6, v12, v7, v10);
    }

    goto LABEL_15;
  }
LABEL_16:

}

- (void)handleApplicationConnectionEventDidOccur:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v4 = a3;
  -[CBCentralManager peripheralWithInfo:](self, "peripheralWithInfo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgConnectionEvent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    -[CBCentralManager handleApplicationConnectionEventDidOccur:].cold.1();
    if (!v5)
      goto LABEL_7;
  }
  else if (!v5)
  {
    goto LABEL_7;
  }
  if ((*((_BYTE *)&self->_delegateFlags + 1) & 8) != 0)
  {
    objc_msgSend(v5, "handleConnectionStateUpdated:", v7 != 0);
    -[CBCentralManager delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "centralManager:connectionEventDidOccur:forPeripheral:", self, v7, v5);

  }
LABEL_7:

}

- (void)handleScanFailedToStartWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBCentralManager handleScanFailedToStartWithError:].cold.3();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgResult"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 341);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToNumber:", v6);

  if (v7)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT))
        goto LABEL_12;
      goto LABEL_8;
    }
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT))
LABEL_8:
      -[CBCentralManager handleScanFailedToStartWithError:].cold.1();
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgResult"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 348);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToNumber:", v9);

    if (!v10)
      goto LABEL_12;
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT))
        goto LABEL_12;
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_FAULT))
        goto LABEL_12;
    }
    -[CBCentralManager handleScanFailedToStartWithError:].cold.2();
  }
LABEL_12:
  if ((*((_BYTE *)&self->_delegateFlags + 2) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBCentralManager delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "centralManager:didFailToScanWithError:", self, v11);

  }
}

- (void)handlePeripheralConnectionStateUpdated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CBCentralManager peripheralWithInfo:](self, "peripheralWithInfo:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCBMsgArgConnectionState"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleConnectionStateUpdated:", objc_msgSend(v5, "BOOLValue"));
    if ((*(_BYTE *)&self->_delegateFlags & 0x40) != 0)
    {
      -[CBCentralManager delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "centralManager:didUpdatePeripheralConnectionState:", self, v4);

    }
  }

}

- (void)handlePeripheralTrackingUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  $07E581FC71E438F638AFE4D881A2E6BE delegateFlags;
  id WeakRetained;
  id v10;

  v4 = a3;
  -[CBCentralManager peripheralWithInfo:](self, "peripheralWithInfo:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBTrackingOptionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBTrackingOptionState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v5 && v6)
  {
    v7 = objc_msgSend(v6, "isEqual:", &unk_1E54236D0);
    delegateFlags = self->_delegateFlags;
    if (v7)
    {
      if ((*(_WORD *)&delegateFlags & 0x100) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "centralManager:didLosePeripheral:forType:", self, v10, v5);
LABEL_9:

      }
    }
    else if ((*(_BYTE *)&delegateFlags & 0x80) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "centralManager:didFindPeripheral:forType:", self, v10, v5);
      goto LABEL_9;
    }
  }

}

- (void)handleApplicationActivityEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgName"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "BOOLValue");
  if (v12)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v8 = WeakRetained;
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        v11 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v11, "centralManager:application:isActive:", self, v12, v6);

      }
    }
  }

}

- (void)handleZoneLost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgLeZone"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgLeZoneMask"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*((_BYTE *)&self->_delegateFlags + 1) & 2) != 0)
  {
    -[CBCentralManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centralManager:didLoseZone:mask:", self, v7, v5);

  }
}

- (void)HandleControllerBTClockUpdateMsg:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  $07E581FC71E438F638AFE4D881A2E6BE delegateFlags;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kCBGetControllerBTClockSeconds"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kCBGetControllerBTClockMicroSeconds"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kCBGetControllerBTClockEventType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kCBGetControllerBTLocalClock"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kCBGetControllerBTRemoteClock"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    delegateFlags = self->_delegateFlags;
    if ((*(_DWORD *)&delegateFlags & 0x40000) != 0)
    {
      -[CBCentralManager delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "centralManager:didUpdateControllerBTClockForPeripheral:eventType:seconds:microseconds:localClock:remoteClock:", self, v10, v6, v4, v5, v7, v8);

      delegateFlags = self->_delegateFlags;
    }
    if ((*(_DWORD *)&delegateFlags & 0x80000) != 0)
    {
      -[CBCentralManager delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "centralManager:didUpdateControllerBTClockDictForPeripheral:results:", self, v10, v14);

    }
  }

}

- (void)HandleRssiDetectionUpdateMsg:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((*((_BYTE *)&self->_delegateFlags + 2) & 0x20) != 0)
    {
      -[CBCentralManager delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "centralManager:didUpdateRSSIStatisticsDetectionForPeripheral:results:error:", self, v6, v4, v7);

    }
  }
  else
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v9 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1A82A2000, v9, OS_LOG_TYPE_DEFAULT, "No peripheral found in HandleRssiDetectionUpdateMsg for args %@", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (void)HandleBluetoothUsageEventMsg:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((*((_BYTE *)&self->_delegateFlags + 2) & 0x40) != 0)
    {
      -[CBCentralManager delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "centralManager:didUpdateUsageStatisticEvent:results:error:", self, v6, v4, v7);

    }
  }
  else
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v9 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1A82A2000, v9, OS_LOG_TYPE_DEFAULT, "No peripheral found in HandleBluetoothUsageEventMsg for args %@", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (void)HandleBluetoothPhyStatisticEventMsg:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (*((_BYTE *)&self->_delegateFlags + 2) & 0x80) != 0)
  {
    -[CBCentralManager delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "centralManager:didUpdatePhyStatisticEvent:results:error:", self, v5, v8, v6);

  }
}

- (void)HandleCSProcedureEventMsg:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((*((_BYTE *)&self->_delegateFlags + 3) & 1) != 0)
    {
      -[CBCentralManager delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "centralManager:didChannelSoundingProcedureEvent:results:error:", self, v6, v4, v7);

    }
  }
  else
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v9 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1A82A2000, v9, OS_LOG_TYPE_DEFAULT, "No peripheral found in HandleCSProcedureEventMsg for args %@", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (void)handleConnectionParametersUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgConnectionInterval"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgConnectionLatency"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgSupervisionTimeout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && (*((_BYTE *)&self->_delegateFlags + 1) & 4) != 0)
  {
    -[CBCentralManager delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centralManager:didUpdateConnectionParameters:interval:latency:supervisionTimeout:", self, v10, v6, v7, v8);

  }
}

- (void)handleReadyForUpdates:(id)a3
{
  void *v3;
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

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMapTable objectEnumerator](self->_peripherals, "objectEnumerator", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "isReadyForUpdates");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)retrievePeripheralWithAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v12 = CFSTR("kCBMsgArgAddressString");
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 75, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDevices"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[CBCentralManager peripheralWithInfo:](self, "peripheralWithInfo:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBDAddress:", v4);
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      -[CBCentralManager retrievePeripheralWithAddress:].cold.1();
    v10 = 0;
  }

  return v10;
}

- (void)addIRKwithBTAddress:(id)a3 irk:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = (id)MEMORY[0x1E0C9AA60];
  if (a3)
    v6 = a3;
  v12[0] = CFSTR("kCBSetIRKForAddressPublicAddress");
  v12[1] = CFSTR("kCBSetIRKForAddressIRK");
  v7 = (id)MEMORY[0x1E0C9AA70];
  if (a4)
    v7 = a4;
  v13[0] = v6;
  v13[1] = v7;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 130, v11);
}

- (void)removeIRKwithBTAddress:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    v4 = a3;
  else
    v4 = (id)MEMORY[0x1E0C9AA60];
  v8 = CFSTR("kCBSetIRKForAddressPublicAddress");
  v9[0] = v4;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager sendMsg:args:](self, "sendMsg:args:", 131, v7);
}

- (void)deleteDevice:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("kCBMsgArgDeviceUUID");
  v8[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 132, v6);

  -[NSMapTable removeObjectForKey:](self->_peripherals, "removeObjectForKey:", v5);
}

- (id)createPeripheralWithAddress:(id)a3 andIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E08];
  v8 = a3;
  objc_msgSend(v7, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("kCBAdvOptionInstanceRandomAddressBytes"));

  if (v6)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("kCBMsgArgDeviceUUID"));
  -[CBManager sendSyncMsg:args:](self, "sendSyncMsg:args:", 76, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDevices"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[CBCentralManager peripheralWithInfo:](self, "peripheralWithInfo:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)createPeripheralFromIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E08];
  v8 = a3;
  objc_msgSend(v7, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("kCBMsgArgDeviceUUID"));

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__CBCentralManager_createPeripheralFromIdentifier_completion___block_invoke;
  v11[3] = &unk_1E53FF758;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 77, v9, v11);

}

void __62__CBCentralManager_createPeripheralFromIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDevices"));
    v4 = objc_claimAutoreleasedReturnValue();
    v6 = (id)v4;
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "peripheralWithInfo:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)readLocalFastLeConnectionCachedControllerInfoWithcompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__CBCentralManager_readLocalFastLeConnectionCachedControllerInfoWithcompletion___block_invoke;
  v6[3] = &unk_1E53FF618;
  v7 = v4;
  v5 = v4;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 82, MEMORY[0x1E0C9AA70], v6);

}

void __80__CBCentralManager_readLocalFastLeConnectionCachedControllerInfoWithcompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v7 = (void *)objc_opt_new();
    (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v5, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCBFastLeConnectionInfoData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);

  }
}

- (void)handleDidSendBytesToPeripheralwithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgBytesSent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (*((_BYTE *)&self->_delegateFlags + 1) & 0x10) != 0)
  {
    -[CBCentralManager delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "centralManager:didSendBytes:toPeripheral:withError:", self, v6, v9, v7);

  }
}

- (void)handleDidReceiveDataFromPeripheral:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v12;
  if (!v5)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBCentralManager retrievePeripheralsWithIdentifiers:](self, "retrievePeripheralsWithIdentifiers:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "count"))
    {

      v6 = v12;
      goto LABEL_4;
    }
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v12;
    if (!v5)
    {
LABEL_4:

      return;
    }
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBMsgArgObjectDiscoveryData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x20) != 0)
  {
    -[CBCentralManager delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centralManager:didReceiveData:fromPeripheral:", self, v10, v5);

  }
}

- (void)handleAncsAuthChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", CFSTR("kCBMsgArgAncsAuthorization"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "BOOLValue");
  if (v9)
  {
    objc_msgSend(v9, "setAncsAuthorized:", v7);
    if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x80) != 0)
    {
      -[CBCentralManager delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "centralManager:didUpdateANCSAuthorizationForPeripheral:", self, v9);

    }
  }

}

- (void)handlePeerMTUChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBCentralManager handlePeerMTUChanged:].cold.1();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCentralManager peripheralWithIdentifier:](self, "peripheralWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (*((_BYTE *)&self->_delegateFlags + 2) & 0x10) != 0)
  {
    -[CBCentralManager delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "centralManager:didUpdateMTUForPeripheral:", self, v6);

  }
}

- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3
{
  return (a3 & 0xFFFFFFFB) == 10;
}

- (BOOL)isScanning
{
  return self->_isScanning;
}

- (NSMapTable)peripherals
{
  return self->_peripherals;
}

- (id)scanCompletion
{
  return self->_scanCompletion;
}

- (void)setScanCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (OS_dispatch_source)updateTimer
{
  return self->_updateTimer;
}

- (void)setUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_updateTimer, a3);
}

- (NSMutableArray)discoveredPeripherals
{
  return (NSMutableArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDiscoveredPeripherals:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

void __37__CBCentralManager_orphanPeripherals__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1A82A2000, v0, v1, "Orphaning %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDelegate:queue:options:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "API MISUSE: %@ has no restore identifier but the delegate implements the centralManager:willRestoreState: method. Restoring will not be supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)retrieveWhbCBPeripheralWithInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "Cannot retrieve WHB peripheral as stableId is null for peripheral %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)activateWhbCnxForCBPeripheral:infoDict:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "WHB cnx instance for localPeripheral %@ already exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __59__CBCentralManager_activateWhbCnxForCBPeripheral_infoDict___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1A82A2000, v0, v1, "CBCentralManager->WHB shim interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)connectWhbCBPeripheral:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "No remoteId/stableId for this WHB peripheral %@, aborting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handlePeripheralConnectionCompleted:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1A82A2000, v0, v1, "BundleID is NOT in the allowed CBCentralSession list for connection. Please file a radar for CoreBluetooth - Framework Onboarding | All component.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)handlePeripheralConnectionCompleted:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1A82A2000, v0, v1, "CBUseCase is not provided in connectPeripheral while it is required. Please file a radar for CoreBluetooth - Framework Onboarding | All component.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)handleApplicationConnectionEventDidOccur:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1A82A2000, v0, v1, "ConnectionEventDidOccur %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleScanFailedToStartWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1A82A2000, v0, v1, "BundleID is NOT in the allowed CBCentralSession list for scanning. Please file a radar for CoreBluetooth - Framework Onboarding | All component.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)handleScanFailedToStartWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_1A82A2000, v0, v1, "CBUseCase is not provided in scanForPeripheralsWithServices while it is required. Please file a radar for CoreBluetooth - Framework Onboarding | All component.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)handleScanFailedToStartWithError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1A82A2000, v0, v1, "handleScanFailedToStartWithError %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)retrievePeripheralWithAddress:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1A82A2000, v0, v1, "WARNING: Invalid address specified, cannot create a CBPeripheral from an empty string", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)handlePeerMTUChanged:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1A82A2000, v0, v1, "handlePeerMTUChanged %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMsg:(int)a1 args:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A82A2000, a2, OS_LOG_TYPE_ERROR, "Unhandled XPC message: %u", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_5();
}

- (void)handleMsg:args:.cold.2()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl(&dword_1A82A2000, v1, OS_LOG_TYPE_DEBUG, "%@ is not powered on, ignoring message: %u", v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

@end
