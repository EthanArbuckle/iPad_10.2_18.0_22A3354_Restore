@implementation CSVoiceTriggerEventInfoProvider

- (CSVoiceTriggerEventInfoProvider)init
{
  CSVoiceTriggerEventInfoProvider *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMutableDictionary *accessoryVoiceTriggerEvents;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSVoiceTriggerEventInfoProvider;
  v2 = -[CSVoiceTriggerEventInfoProvider init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSVoiceTriggerEventInfoProvider Queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    accessoryVoiceTriggerEvents = v2->_accessoryVoiceTriggerEvents;
    v2->_accessoryVoiceTriggerEvents = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)setVoiceTriggerInfo:(id)a3 deviceId:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CSVoiceTriggerEventInfoProvider *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CSVoiceTriggerEventInfoProvider_setVoiceTriggerInfo_deviceId___block_invoke;
  block[3] = &unk_1E6880BF0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)fetchVoiceTriggerInfoWithAudioContext:(id)a3 resultVoiceTriggerInfo:(id *)a4 resultRTSTriggerInfo:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *queue;
  _QWORD v17[4];
  id v18;
  CSVoiceTriggerEventInfoProvider *v19;
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

  v8 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__2134;
  v32 = __Block_byref_object_dispose__2135;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2134;
  v26 = __Block_byref_object_dispose__2135;
  v27 = 0;
  objc_msgSend(v8, "deviceId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isDarwinVoiceTriggered"))
  {
    +[CSRemoteDarwinDeviceInfo sharedInstance](CSRemoteDarwinDeviceInfo, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deviceId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchDeviceUUIDStringFromUID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[CSDarwinVoiceTriggerEventInfoProvider sharedInstance](CSDarwinVoiceTriggerEventInfoProvider, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "getMachTimeAdjustedVoiceTriggerEventInfoForDeviceUUID:", v12);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v29[5];
    v29[5] = v14;

  }
  else
  {
    queue = self->_queue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __117__CSVoiceTriggerEventInfoProvider_fetchVoiceTriggerInfoWithAudioContext_resultVoiceTriggerInfo_resultRTSTriggerInfo___block_invoke;
    v17[3] = &unk_1E6880CA0;
    v18 = v9;
    v19 = self;
    v20 = &v28;
    v21 = &v22;
    dispatch_async_and_wait(queue, v17);
    v12 = v18;
  }

  if (a4)
    *a4 = objc_retainAutorelease((id)v29[5]);
  if (a5)
    *a5 = objc_retainAutorelease((id)v23[5]);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

}

- (BOOL)_isBuiltInDeviceFromDeviceId:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "isEqualToString:", CFSTR("BuiltInMicrophoneDevice"));
  else
    return 1;
}

- (NSDictionary)rtsTriggerInfo
{
  return self->_rtsTriggerInfo;
}

- (void)setRtsTriggerInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)triggerNotifiedMachTime
{
  return self->_triggerNotifiedMachTime;
}

- (void)setTriggerNotifiedMachTime:(unint64_t)a3
{
  self->_triggerNotifiedMachTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtsTriggerInfo, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_builtInVoiceTriggerEvent, 0);
  objc_storeStrong((id *)&self->_accessoryVoiceTriggerEvents, 0);
}

void __117__CSVoiceTriggerEventInfoProvider_fetchVoiceTriggerInfoWithAudioContext_resultVoiceTriggerInfo_resultRTSTriggerInfo___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1[4]
    && (objc_msgSend(*(id *)(a1[5] + 8), "objectForKeyedSubscript:"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v2,
        v2))
  {
    v3 = CSLogCategoryVT;
    if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      v4 = a1[4];
      v11 = 136315394;
      v12 = "-[CSVoiceTriggerEventInfoProvider fetchVoiceTriggerInfoWithAudioContext:resultVoiceTriggerInfo:resultRTSTrig"
            "gerInfo:]_block_invoke";
      v13 = 2114;
      v14 = v4;
      _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Providing voiceTriggerEventInfo with deviceId %{public}@", (uint8_t *)&v11, 0x16u);
    }
    objc_msgSend(*(id *)(a1[5] + 8), "objectForKeyedSubscript:", a1[4]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
  }
  else
  {
    v8 = CSLogCategoryVT;
    if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[CSVoiceTriggerEventInfoProvider fetchVoiceTriggerInfoWithAudioContext:resultVoiceTriggerInfo:resultRTSTrig"
            "gerInfo:]_block_invoke";
      _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s Providing built-in voiceTriggerEventInfo", (uint8_t *)&v11, 0xCu);
    }
    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = *(id *)(a1[5] + 16);
    v7 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), *(id *)(a1[5] + 32));
}

void __64__CSVoiceTriggerEventInfoProvider_setVoiceTriggerInfo_deviceId___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "_isBuiltInDeviceFromDeviceId:", *(_QWORD *)(a1 + 48));
    v3 = *(void **)(a1 + 32);
    if (v2)
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = v3;
      v6 = *(void **)(v4 + 16);
      *(_QWORD *)(v4 + 16) = v5;

    }
    else if (v3 && *(_QWORD *)(a1 + 48))
    {
      v7 = (void *)objc_msgSend(v3, "copy");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 48));

    }
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2148 != -1)
    dispatch_once(&sharedInstance_onceToken_2148, &__block_literal_global_2149);
  return (id)sharedInstance_sharedInstance_2150;
}

+ (BOOL)isVoiceTriggerInfoAvailableLocally:(id)a3
{
  id v3;
  char v4;
  char v5;

  v3 = a3;
  if (+[CSUtils isLocalVoiceTriggerAvailable](CSUtils, "isLocalVoiceTriggerAvailable")
    || (objc_msgSend(v3, "isHearstVoiceTriggered") & 1) != 0
    || (objc_msgSend(v3, "isJarvisVoiceTriggered") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isRemoraVoiceTriggered");
  }
  v5 = objc_msgSend(v3, "isDarwinVoiceTriggered") | v4;

  return v5;
}

void __49__CSVoiceTriggerEventInfoProvider_sharedInstance__block_invoke()
{
  CSVoiceTriggerEventInfoProvider *v0;
  void *v1;

  v0 = objc_alloc_init(CSVoiceTriggerEventInfoProvider);
  v1 = (void *)sharedInstance_sharedInstance_2150;
  sharedInstance_sharedInstance_2150 = (uint64_t)v0;

}

@end
