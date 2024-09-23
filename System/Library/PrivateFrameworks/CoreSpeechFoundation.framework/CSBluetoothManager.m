@implementation CSBluetoothManager

uint64_t __53__CSBluetoothManager_getBTLocalDeviceWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t result;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[CSBluetoothManager getBTLocalDeviceWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Accessing BTLocalDevice", (uint8_t *)&v7, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 32))
    v4 = *(_QWORD *)(v3 + 40);
  else
    v4 = 0;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[CSBluetoothManager getBTLocalDeviceWithCompletion:]_block_invoke";
    v9 = 2050;
    v10 = v4;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s BTLocalDevice %{public}p", (uint8_t *)&v7, 0x16u);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  return result;
}

void __72__CSBluetoothManager_getBTDeviceInfoWithBTAddressString_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_getBluetoothDeviceInfoForDeviceWithBTAddressString:", *(_QWORD *)(a1 + 40));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (id)_getBluetoothDeviceInfoForDeviceWithBTAddressString:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id v14;
  CSBluetoothDeviceInfo *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  CSBluetoothDeviceInfo *v19;
  uint64_t v20;
  NSObject *v21;
  unint64_t v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  double v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = mach_absolute_time();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[NSMutableDictionary allValues](self->_deviceAddressToDeviceInfoMap, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v11, "address");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
        {
          v16 = (void *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            v17 = v16;
            objc_msgSend(v11, "address");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315651;
            v33 = "-[CSBluetoothManager _getBluetoothDeviceInfoForDeviceWithBTAddressString:]";
            v34 = 2113;
            v35 = *(double *)&v11;
            v36 = 2113;
            v37 = v18;
            _os_log_impl(&dword_1B502E000, v17, OS_LOG_TYPE_DEFAULT, "%s Using cached CSBluetoothDeviceInfo: %{private}@ for BTDevice with Address: %{private}@", buf, 0x20u);

          }
          v19 = v11;

          goto LABEL_24;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      if (v8)
        continue;
      break;
    }
  }

  v14 = objc_retainAutorelease(v4);
  objc_msgSend(v14, "UTF8String");
  BTDeviceAddressFromString();
  if (v14 && self->_bluetoothSession)
  {
    v15 = objc_alloc_init(CSBluetoothDeviceInfo);
    -[NSMutableDictionary setObject:forKey:](self->_deviceAddressToDeviceInfoMap, "setObject:forKey:", v15, v14);
    BTDeviceFromAddress();
  }
  else
  {
    v15 = 0;
  }
  v20 = mach_absolute_time();
  v21 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v20 - v5;
    v23 = v21;
    if (_CSMachAbsoluteTimeRate_onceToken != -1)
      dispatch_once(&_CSMachAbsoluteTimeRate_onceToken, &__block_literal_global_313);
    *(_DWORD *)buf = 136315394;
    v33 = "-[CSBluetoothManager _getBluetoothDeviceInfoForDeviceWithBTAddressString:]";
    v34 = 2048;
    v35 = *(double *)&_CSMachAbsoluteTimeRate_rate * (double)v22 / 1000000000.0;
    _os_log_impl(&dword_1B502E000, v23, OS_LOG_TYPE_DEFAULT, "%s Elapsed time: %f seconds", buf, 0x16u);

    v21 = CSLogContextFacilityCoreSpeech;
  }
  v24 = os_signpost_id_generate(v21);
  v25 = (id)CSLogContextFacilityCoreSpeech;
  v26 = v25;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B502E000, v26, OS_SIGNPOST_EVENT, v24, "getBluetoothDeviceInfoForDeviceWithId_latency", (const char *)&unk_1B50F8E55, buf, 2u);
  }

  v19 = v15;
LABEL_24:

  return v19;
}

- (void)getBTDeviceInfoWithBTAddressString:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__CSBluetoothManager_getBTDeviceInfoWithBTAddressString_withCompletion___block_invoke;
  v10[3] = &unk_1E6881188;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  -[CSBluetoothManager getBTLocalDeviceWithCompletion:](self, "getBTLocalDeviceWithCompletion:", v10);

}

- (void)getBTLocalDeviceWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *bluetoothSessionSetupGroup;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[CSBluetoothManager getBTLocalDeviceWithCompletion:]";
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s Trying to access BTLocalDevice", buf, 0xCu);
  }
  bluetoothSessionSetupGroup = self->_bluetoothSessionSetupGroup;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__CSBluetoothManager_getBTLocalDeviceWithCompletion___block_invoke;
  v9[3] = &unk_1E6881160;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_group_notify(bluetoothSessionSetupGroup, queue, v9);

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11952 != -1)
    dispatch_once(&sharedInstance_onceToken_11952, &__block_literal_global_11953);
  return (id)sharedInstance_sharedInstance_11954;
}

- (CSBluetoothManager)init
{
  CSBluetoothManager *v3;
  id v4;
  dispatch_queue_t v5;
  void *v6;
  dispatch_group_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v14;
  objc_super v15;

  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    v3 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CSBluetoothManager;
    v4 = -[CSBluetoothManager init](&v15, sel_init);
    if (v4)
    {
      v5 = dispatch_queue_create("CSBluetoothManager Queue", 0);
      v6 = (void *)*((_QWORD *)v4 + 2);
      *((_QWORD *)v4 + 2) = v5;

      v7 = dispatch_group_create();
      v8 = (void *)*((_QWORD *)v4 + 8);
      *((_QWORD *)v4 + 8) = v7;

      *((_BYTE *)v4 + 8) = 0;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)*((_QWORD *)v4 + 10);
      *((_QWORD *)v4 + 10) = v9;

      dispatch_group_enter(*((dispatch_group_t *)v4 + 8));
      v11 = *((_QWORD *)v4 + 2);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __26__CSBluetoothManager_init__block_invoke;
      block[3] = &unk_1E6881138;
      v14 = v4;
      dispatch_async(v11, block);

    }
    self = (CSBluetoothManager *)v4;
    v3 = self;
  }

  return v3;
}

- (void)getWirelessSplitterInfoWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__CSBluetoothManager_getWirelessSplitterInfoWithCompletion___block_invoke;
  v6[3] = &unk_1E68811B0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CSBluetoothManager getBTLocalDeviceWithCompletion:](self, "getBTLocalDeviceWithCompletion:", v6);

}

- (void)getConnectedBluetoothDeviceAddressesWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__CSBluetoothManager_getConnectedBluetoothDeviceAddressesWithCompletion___block_invoke;
  v6[3] = &unk_1E68811B0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CSBluetoothManager getBTLocalDeviceWithCompletion:](self, "getBTLocalDeviceWithCompletion:", v6);

}

- (id)_getConnectedBluetoothDeviceAddressesFromLocalDevice:(BTLocalDeviceImpl *)a3
{
  NSObject *v3;
  int ConnectedDevices;
  int v6;
  uint64_t v7;
  const char *v8;
  uint8_t *v9;
  NSObject *v10;
  uint32_t v11;
  id v13;
  void *v14;
  NSObject *v15;
  uint8_t v16[4];
  const char *v17;
  __int16 v18;
  BTLocalDeviceImpl *v19;
  __int16 v20;
  BTLocalDeviceImpl *v21;
  uint8_t buf[32];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (!a3)
  {
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[CSBluetoothManager _getConnectedBluetoothDeviceAddressesFromLocalDevice:]";
      v8 = "%s Local device is NULL.";
      v9 = buf;
      v10 = v3;
      v11 = 12;
      goto LABEL_16;
    }
    return 0;
  }
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CSBluetoothManager _getConnectedBluetoothDeviceAddressesFromLocalDevice:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a3;
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Getting connected devices from local device %p...", buf, 0x16u);
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  memset(buf, 0, sizeof(buf));
  ConnectedDevices = BTLocalDeviceGetConnectedDevices();
  if (ConnectedDevices)
  {
    v6 = ConnectedDevices;
    v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v16 = 136315650;
      v17 = "-[CSBluetoothManager _getConnectedBluetoothDeviceAddressesFromLocalDevice:]";
      v18 = 2048;
      v19 = a3;
      v20 = 1024;
      LODWORD(v21) = v6;
      v8 = "%s Failed getting connected devices from local device %p (result = %d).";
      v9 = v16;
      v10 = v7;
      v11 = 28;
LABEL_16:
      _os_log_error_impl(&dword_1B502E000, v10, OS_LOG_TYPE_ERROR, v8, v9, v11);
      return 0;
    }
    return 0;
  }
  if (objc_msgSend(0, "count"))
    v13 = 0;
  else
    v13 = (id)MEMORY[0x1E0C9AA60];
  v14 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    *(_DWORD *)v16 = 136315650;
    v17 = "-[CSBluetoothManager _getConnectedBluetoothDeviceAddressesFromLocalDevice:]";
    v18 = 2048;
    v19 = (BTLocalDeviceImpl *)objc_msgSend(v13, "count");
    v20 = 2048;
    v21 = a3;
    _os_log_impl(&dword_1B502E000, v15, OS_LOG_TYPE_DEFAULT, "%s Got %tu connected devices from local device %p.", v16, 0x20u);

  }
  return v13;
}

- (id)_getAddressWithBTDevice:(BTDeviceImpl *)a3
{
  int AddressString;
  int v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  BTDeviceImpl *v11;
  __int16 v12;
  int v13;
  _OWORD v14[15];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v15 = 0;
  memset(v14, 0, sizeof(v14));
  AddressString = BTDeviceGetAddressString();
  if (AddressString)
  {
    v5 = AddressString;
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315650;
      v9 = "-[CSBluetoothManager _getAddressWithBTDevice:]";
      v10 = 2048;
      v11 = a3;
      v12 = 1024;
      v13 = v5;
      _os_log_error_impl(&dword_1B502E000, v6, OS_LOG_TYPE_ERROR, "%s Failed getting address from BTDevice %p (result = %d).", (uint8_t *)&v8, 0x1Cu);
    }
    return 0;
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v14);
}

- (id)getBluetoothDeviceInfoForDeviceWithId:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *queue;
  id v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__11930;
  v23 = __Block_byref_object_dispose__11931;
  v24 = 0;
  v5 = mach_absolute_time();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CSBluetoothManager_getBluetoothDeviceInfoForDeviceWithId___block_invoke;
  block[3] = &unk_1E68811D8;
  block[4] = self;
  v7 = v4;
  v17 = v7;
  v18 = &v19;
  dispatch_sync(queue, block);
  v8 = mach_absolute_time();
  v9 = (id)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v8 - v5;
    if (_CSMachAbsoluteTimeRate_onceToken != -1)
      dispatch_once(&_CSMachAbsoluteTimeRate_onceToken, &__block_literal_global_313);
    *(_DWORD *)buf = 136315394;
    v26 = "-[CSBluetoothManager getBluetoothDeviceInfoForDeviceWithId:]";
    v27 = 2048;
    v28 = *(double *)&_CSMachAbsoluteTimeRate_rate * (double)v10 / 1000000000.0;
    _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s Elapsed time: %f seconds", buf, 0x16u);
  }

  v11 = os_signpost_id_generate((os_log_t)CSLogContextFacilityCoreSpeech);
  v12 = (id)CSLogContextFacilityCoreSpeech;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B502E000, v13, OS_SIGNPOST_EVENT, v11, "getBluetoothDeviceInfoForDeviceWithId_latency", (const char *)&unk_1B50F8E55, buf, 2u);
  }

  v14 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v14;
}

- (id)_getWirelessSplitterInfoFromLocalDevice:(BTLocalDeviceImpl *)a3
{
  int IsSharingEnabled;
  int v4;
  NSObject *v5;
  CSBluetoothWirelessSplitterInfo *v6;
  int buf;
  const char *buf_4;
  __int16 buf_12;
  int buf_14;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    IsSharingEnabled = BTLocalDeviceIsSharingEnabled();
    if (!IsSharingEnabled)
    {
      v6 = objc_alloc_init(CSBluetoothWirelessSplitterInfo);
      -[CSBluetoothWirelessSplitterInfo setSplitterEnabled:](v6, "setSplitterEnabled:", 0);
      return v6;
    }
    v4 = IsSharingEnabled;
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      buf = 136315394;
      buf_4 = "-[CSBluetoothManager _getWirelessSplitterInfoFromLocalDevice:]";
      buf_12 = 1024;
      buf_14 = v4;
      _os_log_error_impl(&dword_1B502E000, v5, OS_LOG_TYPE_ERROR, "%s Failed to get sharing enable flag : %d", (uint8_t *)&buf, 0x12u);
    }
  }
  v6 = 0;
  return v6;
}

- (void)_detachBluetoothSession
{
  BTSessionImpl **p_bluetoothSession;
  BTSessionImpl *bluetoothSession;
  NSObject *v5;
  BTSessionImpl *v6;
  int v7;
  const char *v8;
  __int16 v9;
  BTSessionImpl *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CSBluetoothManager _tearDownLocalDevice](self, "_tearDownLocalDevice");
  bluetoothSession = self->_bluetoothSession;
  p_bluetoothSession = &self->_bluetoothSession;
  if (bluetoothSession)
  {
    BTServiceRemoveCallbacks();
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *p_bluetoothSession;
      v7 = 136315394;
      v8 = "-[CSBluetoothManager _detachBluetoothSession]";
      v9 = 2050;
      v10 = v6;
      _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s Detaching bluetooth session : %{public}p", (uint8_t *)&v7, 0x16u);
    }
    BTSessionDetachWithQueue();
  }
}

- (void)_attachBluetoothSession
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isAttachingBluetoothSession)
  {
    v3 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[CSBluetoothManager _attachBluetoothSession]";
      _os_log_error_impl(&dword_1B502E000, v3, OS_LOG_TYPE_ERROR, "%s Already Attaching Bluetooth Session", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    -[CSBluetoothManager _detachBluetoothSession](self, "_detachBluetoothSession");
    if (!BTSessionAttachWithQueue())
    {
      v4 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315138;
        v6 = "-[CSBluetoothManager _attachBluetoothSession]";
        _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Start attaching bluetooth session", (uint8_t *)&v5, 0xCu);
      }
      self->_isAttachingBluetoothSession = 1;
      dispatch_group_enter((dispatch_group_t)self->_bluetoothSessionSetupGroup);
    }
  }
}

- (void)device:(BTDeviceImpl *)a3 serviceMask:(unsigned int)a4 serviceEventType:(int)a5 serviceSpecificEvent:(unsigned int)a6 result:(int)a7
{
  NSObject *queue;
  _QWORD v8[6];
  int v9;
  int v10;
  unsigned int v11;

  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__CSBluetoothManager_device_serviceMask_serviceEventType_serviceSpecificEvent_result___block_invoke;
  v8[3] = &unk_1E6881200;
  v9 = a7;
  v10 = a5;
  v11 = a6;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async(queue, v8);
}

- (void)accessoryManager:(BTAccessoryManagerImpl *)a3 accessoryEvent:(int)a4 device:(BTDeviceImpl *)a5 accessoryState:(int)a6
{
  NSObject *v8;
  NSObject *queue;
  _QWORD v10[6];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a4 == 22)
  {
    v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CSBluetoothManager accessoryManager:accessoryEvent:device:accessoryState:]";
      _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
    queue = self->_queue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __76__CSBluetoothManager_accessoryManager_accessoryEvent_device_accessoryState___block_invoke;
    v10[3] = &unk_1E6881228;
    v10[4] = self;
    v10[5] = a5;
    dispatch_async(queue, v10);
  }
}

- (void)_sessionAttached:(BTSessionImpl *)a3 result:(int)a4
{
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  BTSessionImpl *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "-[CSBluetoothManager _sessionAttached:result:]";
    v10 = 2050;
    v11 = a3;
    v12 = 1026;
    v13 = a4;
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s session = %{public}p, result = %{public}d", (uint8_t *)&v8, 0x1Cu);
  }
  self->_isAttachingBluetoothSession = 0;
  if (!a4)
  {
    -[CSBluetoothManager _detachBluetoothSession](self, "_detachBluetoothSession");
    self->_bluetoothSession = a3;
    if (a3)
      BTServiceAddCallbacks();
    -[CSBluetoothManager _setUpLocalDevice](self, "_setUpLocalDevice");
    -[CSBluetoothManager _setUpAccessoryManager](self, "_setUpAccessoryManager");
    -[CSBluetoothManager _fetchAllConnectedDevices](self, "_fetchAllConnectedDevices");
  }
  dispatch_group_leave((dispatch_group_t)self->_bluetoothSessionSetupGroup);
}

- (void)_sessionDetached:(BTSessionImpl *)a3
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  BTSessionImpl *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[CSBluetoothManager _sessionDetached:]";
    v9 = 2048;
    v10 = a3;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s session = %p", (uint8_t *)&v7, 0x16u);
  }
  if (self->_bluetoothSession == a3)
  {
    -[CSBluetoothManager _tearDownLocalDevice](self, "_tearDownLocalDevice");
    if (self->_bluetoothSession)
    {
      BTServiceRemoveCallbacks();
      self->_bluetoothSession = 0;
    }
    -[NSMutableDictionary removeAllObjects](self->_deviceAddressToDeviceInfoMap, "removeAllObjects");
    -[CSBluetoothManager _tearDownAccessoryManager](self, "_tearDownAccessoryManager");
  }
  else
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "-[CSBluetoothManager _sessionDetached:]";
      _os_log_error_impl(&dword_1B502E000, v6, OS_LOG_TYPE_ERROR, "%s detached session is different from currently attached session, ignore", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_sessionTerminated:(BTSessionImpl *)a3
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  BTSessionImpl *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[CSBluetoothManager _sessionTerminated:]";
    v9 = 2048;
    v10 = a3;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s session = %p", (uint8_t *)&v7, 0x16u);
  }
  if (self->_bluetoothSession == a3)
  {
    if (a3)
    {
      BTServiceRemoveCallbacks();
      self->_bluetoothSession = 0;
    }
    -[NSMutableDictionary removeAllObjects](self->_deviceAddressToDeviceInfoMap, "removeAllObjects");
    -[CSBluetoothManager _tearDownAccessoryManager](self, "_tearDownAccessoryManager");
    -[CSBluetoothManager _attachBluetoothSession](self, "_attachBluetoothSession");
  }
  else
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "-[CSBluetoothManager _sessionTerminated:]";
      _os_log_error_impl(&dword_1B502E000, v6, OS_LOG_TYPE_ERROR, "%s terminated session is different from currently attached session, ignore", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_setUpLocalDevice
{
  int Default;
  int v4;
  uint64_t v5;
  BTSessionImpl *bluetoothSession;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  uint32_t v10;
  int v11;
  int v12;
  BTSessionImpl *v13;
  int v14;
  const char *v15;
  __int16 v16;
  BTSessionImpl *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[CSBluetoothManager _tearDownLocalDevice](self, "_tearDownLocalDevice");
  if (!self->_bluetoothSession)
  {
    v8 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      return;
    v14 = 136315138;
    v15 = "-[CSBluetoothManager _setUpLocalDevice]";
    v7 = "%s Bluetooth Session is NULL";
    v9 = v8;
    v10 = 12;
    goto LABEL_11;
  }
  Default = BTLocalDeviceGetDefault();
  if (Default)
  {
    v4 = Default;
    v5 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      return;
    bluetoothSession = self->_bluetoothSession;
    v14 = 136315650;
    v15 = "-[CSBluetoothManager _setUpLocalDevice]";
    v16 = 2050;
    v17 = bluetoothSession;
    v18 = 1026;
    v19 = v4;
    v7 = "%s Failed to get default local device from session %{public}p, (result = %{public}d)";
    goto LABEL_10;
  }
  v11 = BTLocalDeviceAddCallbacks();
  if (v11)
  {
    v12 = v11;
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v13 = self->_bluetoothSession;
      v14 = 136315650;
      v15 = "-[CSBluetoothManager _setUpLocalDevice]";
      v16 = 2050;
      v17 = v13;
      v18 = 1026;
      v19 = v12;
      v7 = "%s Failed to add local device callback from session %{public}p, (result = %{public}d";
LABEL_10:
      v9 = v5;
      v10 = 28;
LABEL_11:
      _os_log_error_impl(&dword_1B502E000, v9, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v14, v10);
    }
  }
}

- (void)_tearDownLocalDevice
{
  if (self->_localDevice)
  {
    BTLocalDeviceRemoveCallbacks();
    self->_localDevice = 0;
  }
}

- (void)_setUpAccessoryManager
{
  BTAccessoryManagerImpl **p_accessoryManager;
  NSObject *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  p_accessoryManager = &self->_accessoryManager;
  if (BTAccessoryManagerGetDefault())
  {
    v3 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[CSBluetoothManager _setUpAccessoryManager]";
      _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Failed to get default accessory manager", (uint8_t *)&v5, 0xCu);
    }
    *p_accessoryManager = 0;
  }
  else if (BTAccessoryManagerAddCallbacks())
  {
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[CSBluetoothManager _setUpAccessoryManager]";
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Failed to add accessory manager callbacks", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_tearDownAccessoryManager
{
  if (self->_accessoryManager)
    self->_accessoryManager = 0;
}

- (void)_fetchAllConnectedDevices
{
  NSObject *v2;
  uint8_t buf[16];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!self->_accessoryManager)
  {
    v2 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[CSBluetoothManager _fetchAllConnectedDevices]";
      _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Accessory manager is not initialized", buf, 0xCu);
    }
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  *(_OWORD *)buf = 0u;
  v4 = 0u;
  BTLocalDeviceGetConnectedDevices();
}

- (id)_setBluetoothDeviceInfoForDevice:(BTDeviceImpl *)a3
{
  void *v5;
  CSBluetoothDeviceInfo *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CSBluetoothManager _getAddressWithBTDevice:](self, "_getAddressWithBTDevice:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary objectForKey:](self->_deviceAddressToDeviceInfoMap, "objectForKey:", v5);
    v6 = (CSBluetoothDeviceInfo *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v7 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "-[CSBluetoothManager _setBluetoothDeviceInfoForDevice:]";
        v12 = 2112;
        v13 = v5;
        _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Found BTDevice with address %@", buf, 0x16u);
      }
      v6 = objc_alloc_init(CSBluetoothDeviceInfo);
      BTDeviceSupportsHS();
      BTDeviceIsTemporaryPairedNotInContacts();
      v8 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315395;
        v11 = "-[CSBluetoothManager _setBluetoothDeviceInfoForDevice:]";
        v12 = 2113;
        v13 = v5;
        _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s Device with address %{private}@ is temporary paired and not in contacts", buf, 0x16u);
      }
      -[CSBluetoothDeviceInfo setAddress:](v6, "setAddress:", v5);
      -[CSBluetoothDeviceInfo setSupportDoAP:](v6, "setSupportDoAP:", 0);
      -[CSBluetoothDeviceInfo setIsTemporaryPairedNotInContacts:](v6, "setIsTemporaryPairedNotInContacts:", 1);
      -[NSMutableDictionary setObject:forKey:](self->_deviceAddressToDeviceInfoMap, "setObject:forKey:", v6, v5);
      -[CSBluetoothManager _loadAACPCapabilityForDevice:deviceAddress:](self, "_loadAACPCapabilityForDevice:deviceAddress:", a3, v5);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_loadAACPCapabilityForDevice:(BTDeviceImpl *)a3 deviceAddress:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int AACPCapabilityInteger;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  _BYTE v19[10];
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (v5)
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315395;
      v17 = "-[CSBluetoothManager _loadAACPCapabilityForDevice:deviceAddress:]";
      v18 = 2113;
      *(_QWORD *)v19 = v5;
      _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s Loading AACP capabilities for BTDevice with address %{private}@", buf, 0x16u);
    }
    -[NSMutableDictionary objectForKey:](self->_deviceAddressToDeviceInfoMap, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = mach_absolute_time();
      AACPCapabilityInteger = BTAccessoryManagerGetAACPCapabilityInteger();
      v10 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v17 = "-[CSBluetoothManager _loadAACPCapabilityForDevice:deviceAddress:]";
        v18 = 1024;
        *(_DWORD *)v19 = AACPCapabilityInteger == 0;
        *(_WORD *)&v19[4] = 1024;
        *(_DWORD *)&v19[6] = 96;
        v20 = 1024;
        v21 = 0;
        v22 = 1024;
        v23 = 0;
        _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s GetAACPCapability result: BT_SUCCESS=%d, AACP capability bit: %d,  AACP capability supported: %d (%d)", buf, 0x24u);
      }
      objc_msgSend(v7, "setSupportMph:", 0);
      v11 = mach_absolute_time();
      v12 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v11 - v8;
        v14 = v12;
        if (_CSMachAbsoluteTimeRate_onceToken != -1)
          dispatch_once(&_CSMachAbsoluteTimeRate_onceToken, &__block_literal_global_313);
        *(_DWORD *)buf = 136315394;
        v17 = "-[CSBluetoothManager _loadAACPCapabilityForDevice:deviceAddress:]";
        v18 = 2048;
        *(double *)v19 = *(double *)&_CSMachAbsoluteTimeRate_rate * (double)v13 / 1000000000.0;
        _os_log_impl(&dword_1B502E000, v14, OS_LOG_TYPE_DEFAULT, "%s BT AACP capability retrieval latency %f seconds", buf, 0x16u);

      }
    }
    else
    {
      v15 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315395;
        v17 = "-[CSBluetoothManager _loadAACPCapabilityForDevice:deviceAddress:]";
        v18 = 2113;
        *(_QWORD *)v19 = v5;
        _os_log_impl(&dword_1B502E000, v15, OS_LOG_TYPE_DEFAULT, "%s Received AACP capabilities for BTDevice with address %{private}@ not in the connected list.", buf, 0x16u);
      }
    }

  }
}

- (void)_clearBluetoothDeviceInfoForDevice:(BTDeviceImpl *)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[CSBluetoothManager _getAddressWithBTDevice:](self, "_getAddressWithBTDevice:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_deviceAddressToDeviceInfoMap, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315395;
        v8 = "-[CSBluetoothManager _clearBluetoothDeviceInfoForDevice:]";
        v9 = 2113;
        v10 = v4;
        _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s Lost BTDevice with address %{private}@", (uint8_t *)&v7, 0x16u);
      }
      -[NSMutableDictionary removeObjectForKey:](self->_deviceAddressToDeviceInfoMap, "removeObjectForKey:", v4);
    }

  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BTSessionImpl)bluetoothSession
{
  return self->_bluetoothSession;
}

- (void)setBluetoothSession:(BTSessionImpl *)a3
{
  self->_bluetoothSession = a3;
}

- (BOOL)isAttachingBluetoothSession
{
  return self->_isAttachingBluetoothSession;
}

- (void)setIsAttachingBluetoothSession:(BOOL)a3
{
  self->_isAttachingBluetoothSession = a3;
}

- (BTLocalDeviceImpl)localDevice
{
  return self->_localDevice;
}

- (void)setLocalDevice:(BTLocalDeviceImpl *)a3
{
  self->_localDevice = a3;
}

- (NSArray)pairedDeviceAddresses
{
  return self->_pairedDeviceAddresses;
}

- (void)setPairedDeviceAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_pairedDeviceAddresses, a3);
}

- (NSArray)connectedDeviceAddresses
{
  return self->_connectedDeviceAddresses;
}

- (void)setConnectedDeviceAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_connectedDeviceAddresses, a3);
}

- (OS_dispatch_group)bluetoothSessionSetupGroup
{
  return self->_bluetoothSessionSetupGroup;
}

- (void)setBluetoothSessionSetupGroup:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothSessionSetupGroup, a3);
}

- (BTAccessoryManagerImpl)accessoryManager
{
  return self->_accessoryManager;
}

- (void)setAccessoryManager:(BTAccessoryManagerImpl *)a3
{
  self->_accessoryManager = a3;
}

- (NSMutableDictionary)deviceAddressToDeviceInfoMap
{
  return self->_deviceAddressToDeviceInfoMap;
}

- (void)setDeviceAddressToDeviceInfoMap:(id)a3
{
  objc_storeStrong((id *)&self->_deviceAddressToDeviceInfoMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAddressToDeviceInfoMap, 0);
  objc_storeStrong((id *)&self->_bluetoothSessionSetupGroup, 0);
  objc_storeStrong((id *)&self->_connectedDeviceAddresses, 0);
  objc_storeStrong((id *)&self->_pairedDeviceAddresses, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __76__CSBluetoothManager_accessoryManager_accessoryEvent_device_accessoryState___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_getAddressWithBTDevice:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_loadAACPCapabilityForDevice:deviceAddress:", *(_QWORD *)(a1 + 40), v2);

}

id __86__CSBluetoothManager_device_serviceMask_serviceEventType_serviceSpecificEvent_result___block_invoke(id result)
{
  int v1;

  if (!*((_DWORD *)result + 12))
  {
    v1 = *((_DWORD *)result + 13);
    if (v1 == 1)
    {
      if (*((_DWORD *)result + 14) == 12)
        return (id)objc_msgSend(*((id *)result + 4), "_clearBluetoothDeviceInfoForDevice:", *((_QWORD *)result + 5));
    }
    else if (!v1 && *((_DWORD *)result + 14) == 11)
    {
      return (id)objc_msgSend(*((id *)result + 4), "_setBluetoothDeviceInfoForDevice:", *((_QWORD *)result + 5));
    }
  }
  return result;
}

void __60__CSBluetoothManager_getBluetoothDeviceInfoForDeviceWithId___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uuid_t uu;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1[4] + 80), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v7, "deviceIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", a1[5]);

        if (v9)
        {
          v10 = (void *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            v11 = v10;
            objc_msgSend(v7, "deviceIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315651;
            v20 = "-[CSBluetoothManager getBluetoothDeviceInfoForDeviceWithId:]_block_invoke";
            v21 = 2113;
            v22 = v7;
            v23 = 2113;
            v24 = v12;
            _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s Using cached CSBluetoothDeviceInfo: %{private}@ for BTDevice with identifier: %{private}@", buf, 0x20u);

          }
          objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v7);
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

  v13 = (void *)a1[5];
  if (v13 && *(_QWORD *)(a1[4] + 32) && !*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    memset(uu, 0, sizeof(uu));
    uuid_parse((const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"), uu);
    if (!uuid_is_null(uu))
      BTDeviceFromIdentifier();
  }
}

void __73__CSBluetoothManager_getConnectedBluetoothDeviceAddressesWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_getConnectedBluetoothDeviceAddressesFromLocalDevice:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __60__CSBluetoothManager_getWirelessSplitterInfoWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_getWirelessSplitterInfoFromLocalDevice:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __26__CSBluetoothManager_init__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_attachBluetoothSession");
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 64));
}

void __36__CSBluetoothManager_sharedInstance__block_invoke()
{
  CSBluetoothManager *v0;
  void *v1;

  v0 = objc_alloc_init(CSBluetoothManager);
  v1 = (void *)sharedInstance_sharedInstance_11954;
  sharedInstance_sharedInstance_11954 = (uint64_t)v0;

}

@end
