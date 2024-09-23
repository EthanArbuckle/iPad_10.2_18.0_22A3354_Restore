@implementation CSRemoteDarwinDeviceInfo

- (CSRemoteDarwinDeviceInfo)init
{
  CSRemoteDarwinDeviceInfo *v2;
  uint64_t v3;
  NSMutableDictionary *deviceUIDMapTable;
  uint64_t v5;
  NSMutableOrderedSet *voiceTriggerEnabledDevices;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CSRemoteDarwinDeviceInfo;
  v2 = -[CSRemoteDarwinDeviceInfo init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    deviceUIDMapTable = v2->_deviceUIDMapTable;
    v2->_deviceUIDMapTable = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v5 = objc_claimAutoreleasedReturnValue();
    voiceTriggerEnabledDevices = v2->_voiceTriggerEnabledDevices;
    v2->_voiceTriggerEnabledDevices = (NSMutableOrderedSet *)v5;

    v7 = dispatch_queue_create("CSRemoteDarwinDeviceInfo Queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)deviceConnectedWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *queue;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  CSRemoteDarwinDeviceInfo *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  id v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v23[0] = 0;
    v23[1] = 0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);
    objc_msgSend(v5, "getUUIDBytes:", v23);
    v6 = (void *)remote_device_copy_device_with_uuid();
    objc_msgSend(CFSTR("UniqueDeviceID"), "UTF8String");
    v7 = (void *)remote_device_copy_property();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_copy_clean_description());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        queue = self->_queue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __52__CSRemoteDarwinDeviceInfo_deviceConnectedWithUUID___block_invoke;
        block[3] = &unk_1E6880BF0;
        v14 = v4;
        v15 = v8;
        v16 = self;
        dispatch_async(queue, block);

      }
      else
      {
        v12 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v18 = "-[CSRemoteDarwinDeviceInfo deviceConnectedWithUUID:]";
          _os_log_error_impl(&dword_1B502E000, v12, OS_LOG_TYPE_ERROR, "%s Failed to fetch deviceUID", buf, 0xCu);
        }
      }

    }
    else
    {
      v11 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v18 = "-[CSRemoteDarwinDeviceInfo deviceConnectedWithUUID:]";
        v19 = 2114;
        v20 = CFSTR("UniqueDeviceID");
        v21 = 2114;
        v22 = v4;
        _os_log_error_impl(&dword_1B502E000, v11, OS_LOG_TYPE_ERROR, "%s Failed to fetch property of %{public}@ from deviceUUID %{public}@", buf, 0x20u);
      }
    }

  }
  else
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[CSRemoteDarwinDeviceInfo deviceConnectedWithUUID:]";
      _os_log_error_impl(&dword_1B502E000, v10, OS_LOG_TYPE_ERROR, "%s Invalid deviceUUIDString", buf, 0xCu);
    }
  }

}

- (void)notifyVoiceTriggerEnabledWithDeviceUUID:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__CSRemoteDarwinDeviceInfo_notifyVoiceTriggerEnabledWithDeviceUUID___block_invoke;
    v7[3] = &unk_1E6880E88;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)notifyVoiceTriggerDisabledWithDeviceUUID:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__CSRemoteDarwinDeviceInfo_notifyVoiceTriggerDisabledWithDeviceUUID___block_invoke;
    v7[3] = &unk_1E6880E88;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)deviceDisconnectedWithUUID:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__CSRemoteDarwinDeviceInfo_deviceDisconnectedWithUUID___block_invoke;
    v7[3] = &unk_1E6880E88;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)allDeviceDisconnected
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CSRemoteDarwinDeviceInfo_allDeviceDisconnected__block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)hasDarwinDeviceConnected
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__CSRemoteDarwinDeviceInfo_hasDarwinDeviceConnected__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasDarwinDeviceHandleVoiceTrigger
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__CSRemoteDarwinDeviceInfo_hasDarwinDeviceHandleVoiceTrigger__block_invoke;
  v5[3] = &unk_1E6880D18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)fetchDeviceUUIDStringFromUID:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v14;
  __int128 *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int128 v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)&v20 = 0;
    *((_QWORD *)&v20 + 1) = &v20;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__3904;
    v23 = __Block_byref_object_dispose__3905;
    v24 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__CSRemoteDarwinDeviceInfo_fetchDeviceUUIDStringFromUID___block_invoke;
    block[3] = &unk_1E68811D8;
    block[4] = self;
    v7 = v4;
    v14 = v7;
    v15 = &v20;
    dispatch_async_and_wait(queue, block);
    v8 = *(void **)(*((_QWORD *)&v20 + 1) + 40);
    if (!v8)
    {
      v9 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "-[CSRemoteDarwinDeviceInfo fetchDeviceUUIDStringFromUID:]";
        v18 = 2114;
        v19 = v7;
        _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s Did not find deviceUID(%{public}@) in mapping table", buf, 0x16u);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 40);
      }
      else
      {
        v8 = 0;
      }
    }
    v11 = v8;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v20) = 136315138;
      *(_QWORD *)((char *)&v20 + 4) = "-[CSRemoteDarwinDeviceInfo fetchDeviceUUIDStringFromUID:]";
      _os_log_error_impl(&dword_1B502E000, v10, OS_LOG_TYPE_ERROR, "%s Invalid deviceUID", (uint8_t *)&v20, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (BOOL)isPrimaryVoiceTriggerDeviceWithUUID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CSRemoteDarwinDeviceInfo_isPrimaryVoiceTriggerDeviceWithUUID___block_invoke;
  block[3] = &unk_1E68811D8;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_async_and_wait(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (id)fetchRichDeviceUIDStringFromUUID:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v14;
  __int128 *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int128 v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)&v20 = 0;
    *((_QWORD *)&v20 + 1) = &v20;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__3904;
    v23 = __Block_byref_object_dispose__3905;
    v24 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__CSRemoteDarwinDeviceInfo_fetchRichDeviceUIDStringFromUUID___block_invoke;
    block[3] = &unk_1E68811D8;
    v15 = &v20;
    block[4] = self;
    v7 = v4;
    v14 = v7;
    dispatch_async_and_wait(queue, block);
    v8 = *(void **)(*((_QWORD *)&v20 + 1) + 40);
    v9 = CSLogContextFacilityCoreSpeech;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "-[CSRemoteDarwinDeviceInfo fetchRichDeviceUIDStringFromUUID:]";
        v18 = 2114;
        v19 = v8;
        _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s Return existing simple UID(%{public}@)", buf, 0x16u);
        v7 = *(id *)(*((_QWORD *)&v20 + 1) + 40);
      }
      else
      {
        v7 = v8;
      }
    }
    else if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[CSRemoteDarwinDeviceInfo fetchRichDeviceUIDStringFromUUID:]";
      _os_log_error_impl(&dword_1B502E000, v9, OS_LOG_TYPE_ERROR, "%s Can't find corresponding deviceUID from UUID, return existing UUID instead", buf, 0xCu);
    }
    v11 = v7;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v20) = 136315138;
      *(_QWORD *)((char *)&v20 + 4) = "-[CSRemoteDarwinDeviceInfo fetchRichDeviceUIDStringFromUUID:]";
      _os_log_error_impl(&dword_1B502E000, v10, OS_LOG_TYPE_ERROR, "%s Invalid deviceUUID", (uint8_t *)&v20, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (BOOL)isRemoteDarwinConnectedWithUUID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CSRemoteDarwinDeviceInfo_isRemoteDarwinConnectedWithUUID___block_invoke;
  block[3] = &unk_1E68811D8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_async_and_wait(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (BOOL)_isRemoteDarwinConnectedWithUUID:(id)a3
{
  NSMutableDictionary *deviceUIDMapTable;
  void *v4;
  BOOL v5;

  deviceUIDMapTable = self->_deviceUIDMapTable;
  if (!deviceUIDMapTable)
    return 0;
  -[NSMutableDictionary objectForKeyedSubscript:](deviceUIDMapTable, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)addDeviceIDPairToMapTable:(id)a3 withDeviceUID:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  CSRemoteDarwinDeviceInfo *v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__CSRemoteDarwinDeviceInfo_addDeviceIDPairToMapTable_withDeviceUID___block_invoke;
  block[3] = &unk_1E6880BF0;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (NSMutableDictionary)deviceUIDMapTable
{
  return self->_deviceUIDMapTable;
}

- (void)setDeviceUIDMapTable:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUIDMapTable, a3);
}

- (NSMutableOrderedSet)voiceTriggerEnabledDevices
{
  return self->_voiceTriggerEnabledDevices;
}

- (void)setVoiceTriggerEnabledDevices:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerEnabledDevices, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_voiceTriggerEnabledDevices, 0);
  objc_storeStrong((id *)&self->_deviceUIDMapTable, 0);
}

uint64_t __68__CSRemoteDarwinDeviceInfo_addDeviceIDPairToMapTable_withDeviceUID___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v6 = 136315650;
    v7 = "-[CSRemoteDarwinDeviceInfo addDeviceIDPairToMapTable:withDeviceUID:]_block_invoke";
    v8 = 2114;
    v9 = v3;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Testing: Add (%{public}@, %{public}@) pair into mapping table", (uint8_t *)&v6, 0x20u);
  }
  return objc_msgSend(*(id *)(a1[6] + 8), "setObject:forKeyedSubscript:", a1[5], a1[4]);
}

uint64_t __60__CSRemoteDarwinDeviceInfo_isRemoteDarwinConnectedWithUUID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isRemoteDarwinConnectedWithUUID:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __61__CSRemoteDarwinDeviceInfo_fetchRichDeviceUIDStringFromUUID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __64__CSRemoteDarwinDeviceInfo_isPrimaryVoiceTriggerDeviceWithUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "voiceTriggerEnabledDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 136315650;
    v7 = "-[CSRemoteDarwinDeviceInfo isPrimaryVoiceTriggerDeviceWithUUID:]_block_invoke";
    v8 = 2114;
    v9 = v3;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Primary device UUID : %{public}@, input device UUID : %{public}@", (uint8_t *)&v6, 0x20u);
  }
  if (objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 40)))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  if (!v3 && objc_msgSend(*(id *)(a1 + 32), "_isRemoteDarwinConnectedWithUUID:", *(_QWORD *)(a1 + 40)))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

void __57__CSRemoteDarwinDeviceInfo_fetchDeviceUUIDStringFromUID___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1[4] + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v8 = (void *)a1[5];
        objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", v7, (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v8) = objc_msgSend(v8, "containsString:", v9);

        if ((_DWORD)v8)
        {
          v10 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            v11 = a1[5];
            *(_DWORD *)buf = 136315650;
            v17 = "-[CSRemoteDarwinDeviceInfo fetchDeviceUUIDStringFromUID:]_block_invoke";
            v18 = 2114;
            v19 = v7;
            v20 = 2114;
            v21 = v11;
            _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s Found (%{public}@, %{public}@) pair in mapping table", buf, 0x20u);
          }
          objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v7);
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v22, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

}

uint64_t __61__CSRemoteDarwinDeviceInfo_hasDarwinDeviceHandleVoiceTrigger__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

uint64_t __52__CSRemoteDarwinDeviceInfo_hasDarwinDeviceConnected__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

void __49__CSRemoteDarwinDeviceInfo_allDeviceDisconnected__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSRemoteDarwinDeviceInfo allDeviceDisconnected]_block_invoke";
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "deviceUIDMapTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "voiceTriggerEnabledDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

void __55__CSRemoteDarwinDeviceInfo_deviceDisconnectedWithUUID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "deviceUIDMapTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "voiceTriggerEnabledDevices");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __69__CSRemoteDarwinDeviceInfo_notifyVoiceTriggerDisabledWithDeviceUUID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "voiceTriggerEnabledDevices");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __68__CSRemoteDarwinDeviceInfo_notifyVoiceTriggerEnabledWithDeviceUUID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "voiceTriggerEnabledDevices");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

uint64_t __52__CSRemoteDarwinDeviceInfo_deviceConnectedWithUUID___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v6 = 136315650;
    v7 = "-[CSRemoteDarwinDeviceInfo deviceConnectedWithUUID:]_block_invoke";
    v8 = 2114;
    v9 = v3;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Add (%{public}@, %{public}@) pair into mapping table", (uint8_t *)&v6, 0x20u);
  }
  return objc_msgSend(*(id *)(a1[6] + 8), "setObject:forKeyedSubscript:", a1[5], a1[4]);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3927 != -1)
    dispatch_once(&sharedInstance_onceToken_3927, &__block_literal_global_3928);
  return (id)sharedInstance_sharedInfo;
}

void __42__CSRemoteDarwinDeviceInfo_sharedInstance__block_invoke()
{
  CSRemoteDarwinDeviceInfo *v0;
  void *v1;

  v0 = objc_alloc_init(CSRemoteDarwinDeviceInfo);
  v1 = (void *)sharedInstance_sharedInfo;
  sharedInstance_sharedInfo = (uint64_t)v0;

}

@end
