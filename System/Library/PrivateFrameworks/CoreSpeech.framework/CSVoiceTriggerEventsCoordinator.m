@implementation CSVoiceTriggerEventsCoordinator

- (CSVoiceTriggerEventsCoordinator)init
{
  CSVoiceTriggerEventsCoordinator *v2;
  uint64_t v3;
  NSHashTable *observers;
  uint64_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSVoiceTriggerEventsCoordinator;
  v2 = -[CSVoiceTriggerEventsCoordinator init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    objc_msgSend(MEMORY[0x1E0D19260], "getSerialQueue:qualityOfService:", CFSTR("VoiceTriggerEventNotifier queue"), 33);
    v5 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v2->_splitterState = 0;
  }
  return v2;
}

- (void)setTargetQueue:(id)a3
{
  NSObject *targetQueue;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_targetQueue, a3);
  targetQueue = self->_targetQueue;
  if (targetQueue)
    dispatch_set_target_queue((dispatch_object_t)self->_queue, targetQueue);

}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CSVoiceTriggerEventsCoordinator_start__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)registerObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  CSVoiceTriggerEventsCoordinator *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CSVoiceTriggerEventsCoordinator_registerObserver___block_invoke;
  block[3] = &unk_1E7C292A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  CSVoiceTriggerEventsCoordinator *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CSVoiceTriggerEventsCoordinator_unregisterObserver___block_invoke;
  block[3] = &unk_1E7C292A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4
{
  -[CSVoiceTriggerEventsCoordinator voiceTriggerDidDetectKeyword:deviceId:completion:](self, "voiceTriggerDidDetectKeyword:deviceId:completion:", a3, a4, 0);
}

- (id)_createVoiceTriggerEventInfoString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (_createVoiceTriggerEventInfoString__onceToken != -1)
    dispatch_once(&_createVoiceTriggerEventInfoString__onceToken, &__block_literal_global_9_18716);
  v4 = (void *)objc_msgSend(CFSTR("\nvoiceTriggerEventInfo: {\n"), "mutableCopy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (id)_createVoiceTriggerEventInfoString__printingAllowList;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v3, "objectForKey:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("\t%@: %@\n"), v10, v13, (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendString:", v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "appendString:", CFSTR("}"));
  return v4;
}

- (void)_printVoiceTriggerMetricsString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (CSIsInternalBuild())
  {
    if (_printVoiceTriggerMetricsString__onceToken != -1)
      dispatch_once(&_printVoiceTriggerMetricsString__onceToken, &__block_literal_global_18_18706);
    v4 = (void *)objc_msgSend(CFSTR("\nVoiceTrigger Metrics: {\n"), "mutableCopy");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = (id)_printVoiceTriggerMetricsString__internalAllowList;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v3, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            v12 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v3, "objectForKey:", v10);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "stringWithFormat:", CFSTR("\t%@: %@\n"), v10, v13, (_QWORD)v16);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "appendString:", v14);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v7);
    }

    objc_msgSend(v4, "appendString:", CFSTR("}"));
    v15 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[CSVoiceTriggerEventsCoordinator _printVoiceTriggerMetricsString:]";
      v22 = 2112;
      v23 = v4;
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }

  }
}

- (void)_notifyWakeKeywordSpokenEvent:(id)a3 deviceId:(id)a4
{
  id v5;
  id v6;
  os_log_t *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  NSObject *v19;
  int v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (os_log_t *)MEMORY[0x1E0D18F60];
  v8 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136315138;
    v21 = "-[CSVoiceTriggerEventsCoordinator _notifyWakeKeywordSpokenEvent:deviceId:]";
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Notifying Wake Keyword Spoken Event", (uint8_t *)&v20, 0xCu);
  }
  notify_post("com.apple.voicetrigger.KeywordSpoken");
  if (v5)
  {
    v9 = *MEMORY[0x1E0D19660];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D19660]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D19478]))
      {

LABEL_8:
        +[CSSiriLauncher sharedLauncher](CSSiriLauncher, "sharedLauncher");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "notifyWakeKeywordSpokenBluetoothDevice:deviceId:", v5, v6);
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D19480]);

      if (v13)
        goto LABEL_8;
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D19488]);

      if (v16)
      {
        +[CSSiriLauncher sharedLauncher](CSSiriLauncher, "sharedLauncher");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "notifyWakeKeywordSpokenCarPlay:deviceId:", v5, v6);
        goto LABEL_9;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0D19490]);

      if (v18)
      {
        +[CSSiriLauncher sharedLauncher](CSSiriLauncher, "sharedLauncher");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "notifyWakeKeywordSpokenRemora:deviceId:", v5, v6);
        goto LABEL_9;
      }
      v19 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136315138;
        v21 = "-[CSVoiceTriggerEventsCoordinator _notifyWakeKeywordSpokenEvent:deviceId:]";
        _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_DEFAULT, "%s Skip notifying the keyword spoken event because the trigger is not from Hearst, Jarvis or Remora", (uint8_t *)&v20, 0xCu);
      }
    }
  }
LABEL_10:

}

- (void)_notifyTriggerEvent:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[CSVoiceTriggerEventsCoordinator _notifyTriggerEvent:deviceId:completion:]";
    _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s EventNotifier received VoiceTrigger event", buf, 0xCu);
  }
  -[CSVoiceTriggerEventsCoordinator _notifyWakeKeywordSpokenEvent:deviceId:](self, "_notifyWakeKeywordSpokenEvent:deviceId:", v8, v9);
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__CSVoiceTriggerEventsCoordinator__notifyTriggerEvent_deviceId_completion___block_invoke;
  v16[3] = &unk_1E7C27310;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v9;
  v14 = v10;
  v15 = v8;
  dispatch_async(queue, v16);

}

- (id)_myriadPhashFromVoiceTriggerInfo:(id)a3
{
  id v3;
  CSMyriadPHash *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(CSMyriadPHash);
  -[CSMyriadPHash generatePHashFromVoiceTriggerInfo:writeFile:](v4, "generatePHashFromVoiceTriggerInfo:writeFile:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_isVoiceTriggerFromRemora:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = *MEMORY[0x1E0D19660];
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D19660]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D19490]);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_isVoiceTriggerFromHearst:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = *MEMORY[0x1E0D19660];
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D19660]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D19478]) & 1) != 0)
      {
        v8 = 1;
      }
      else
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D19480]);

      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldIgnoreVoiceTriggerEvent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (CSIsAppleSiliconMac())
  {
    if (objc_msgSend(MEMORY[0x1E0D19260], "shouldBlockVoiceTriggerWhenOtherAppRecording"))
    {
      +[CSOtherAppRecordingStateMonitorASMac sharedInstance](CSOtherAppRecordingStateMonitorASMac, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isOtherAppRecording");

      if (v6)
      {
        v7 = *MEMORY[0x1E0D18F60];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
        {
          v14 = 136315138;
          v15 = "-[CSVoiceTriggerEventsCoordinator _shouldIgnoreVoiceTriggerEvent:]";
          v8 = "%s Other app is recording, ignore Voicetrigger notification from ASMac";
LABEL_12:
          _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, 0xCu);
          goto LABEL_13;
        }
        goto LABEL_13;
      }
    }
  }
  if (-[CSVoiceTriggerEventsCoordinator _isVoiceTriggerFromHearst:](self, "_isVoiceTriggerFromHearst:", v4)
    || !objc_msgSend(MEMORY[0x1E0D19260], "supportRemoteDarwinVoiceTrigger"))
  {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0D191D0], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "hasDarwinDeviceConnected") & 1) == 0)
  {

    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0D191D0], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasDarwinDeviceHandleVoiceTrigger");

  if (!v11)
  {
LABEL_15:
    v12 = 0;
    goto LABEL_16;
  }
  v7 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315138;
    v15 = "-[CSVoiceTriggerEventsCoordinator _shouldIgnoreVoiceTriggerEvent:]";
    v8 = "%s Darwin device connected, ignore Voicetrigger notification from built-in device";
    goto LABEL_12;
  }
LABEL_13:
  v12 = 1;
LABEL_16:

  return v12;
}

- (void)_notifyRemoteTriggerEvent:(id)a3 myriadHash:(id)a4 remoteTriggerType:(unint64_t)a5 remoteDeviceId:(id)a6 isTriggeredFromFullWake:(BOOL)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *queue;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  id v28;
  unint64_t v29;
  BOOL v30;
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  v18 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[CSVoiceTriggerEventsCoordinator _notifyRemoteTriggerEvent:myriadHash:remoteTriggerType:remoteDeviceId:isTrig"
          "geredFromFullWake:completion:]";
    _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s EventNotifier received VoiceTrigger event", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __140__CSVoiceTriggerEventsCoordinator__notifyRemoteTriggerEvent_myriadHash_remoteTriggerType_remoteDeviceId_isTriggeredFromFullWake_completion___block_invoke;
  block[3] = &unk_1E7C27068;
  v30 = a7;
  v28 = v17;
  v29 = a5;
  block[4] = self;
  v25 = v14;
  v26 = v16;
  v27 = v15;
  v20 = v15;
  v21 = v16;
  v22 = v14;
  v23 = v17;
  dispatch_async(queue, block);

}

- (void)_notifyNearMissEvent:(id)a3 deviceId:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (CSIsInternalBuild())
    notify_post("com.apple.voicetrigger.NearTrigger");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CSVoiceTriggerEventsCoordinator__notifyNearMissEvent_deviceId___block_invoke;
  block[3] = &unk_1E7C291C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)_notifySpeakerReject:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CSVoiceTriggerEventsCoordinator _notifyWakeKeywordSpokenEvent:deviceId:](self, "_notifyWakeKeywordSpokenEvent:deviceId:", v4, 0);
  if (CSIsInternalBuild())
    notify_post("com.apple.voicetrigger.PHSReject");
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__CSVoiceTriggerEventsCoordinator__notifySpeakerReject___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_notifyKeywordReject:(id)a3 deviceId:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CSVoiceTriggerEventsCoordinator__notifyKeywordReject_deviceId___block_invoke;
  block[3] = &unk_1E7C291C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)_notifyKeywordDetect
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CSVoiceTriggerEventsCoordinator__notifyKeywordDetect__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_notifySuperVector:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__CSVoiceTriggerEventsCoordinator__notifySuperVector___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)CSAudioRouteChangeMonitor:(id)a3 didReceiveAudioRouteChangeEvent:(int64_t)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __93__CSVoiceTriggerEventsCoordinator_CSAudioRouteChangeMonitor_didReceiveAudioRouteChangeEvent___block_invoke;
  v5[3] = &unk_1E7C29178;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)CSBluetoothWirelessSplitterMonitor:(id)a3 didReceiveSplitterStateChange:(unint64_t)a4 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a5
{
  NSObject *queue;
  _QWORD v6[6];

  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __147__CSVoiceTriggerEventsCoordinator_CSBluetoothWirelessSplitterMonitor_didReceiveSplitterStateChange_shouldDisableSpeakerVerificationInSplitterMode___block_invoke;
  v6[3] = &unk_1E7C29178;
  v6[4] = self;
  v6[5] = a4;
  dispatch_async(queue, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

uint64_t __147__CSVoiceTriggerEventsCoordinator_CSBluetoothWirelessSplitterMonitor_didReceiveSplitterStateChange_shouldDisableSpeakerVerificationInSplitterMode___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 48) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __93__CSVoiceTriggerEventsCoordinator_CSAudioRouteChangeMonitor_didReceiveAudioRouteChangeEvent___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  if ((unint64_t)(v1 - 2) <= 4)
    *(_QWORD *)(*(_QWORD *)(result + 32) + 32) = v1 - 1;
  return result;
}

void __54__CSVoiceTriggerEventsCoordinator__notifySuperVector___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
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

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "voiceTriggerGotSuperVector:", *(_QWORD *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __55__CSVoiceTriggerEventsCoordinator__notifyKeywordDetect__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "keywordDetectorDidDetectKeyword", (_QWORD)v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __65__CSVoiceTriggerEventsCoordinator__notifyKeywordReject_deviceId___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
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

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1[4] + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "voiceTriggerDidRejected:deviceId:", a1[5], a1[6], (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __56__CSVoiceTriggerEventsCoordinator__notifySpeakerReject___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
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

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "voiceTriggerDidDetectSpeakerReject:", *(_QWORD *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __65__CSVoiceTriggerEventsCoordinator__notifyNearMissEvent_deviceId___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
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

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1[4] + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "voiceTriggerDidDetectNearMiss:deviceId:", a1[5], a1[6], (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __140__CSVoiceTriggerEventsCoordinator__notifyRemoteTriggerEvent_myriadHash_remoteTriggerType_remoteDeviceId_isTriggeredFromFullWake_completion___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  os_log_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0D18F60];
  if (*(_BYTE *)(a1 + 80))
  {
    v3 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 32);
      v6 = *(_QWORD *)(v4 + 48);
      *(_DWORD *)buf = 136315650;
      v46 = "-[CSVoiceTriggerEventsCoordinator _notifyRemoteTriggerEvent:myriadHash:remoteTriggerType:remoteDeviceId:isTr"
            "iggeredFromFullWake:completion:]_block_invoke";
      v47 = 2048;
      v48 = v5;
      v49 = 2050;
      v50 = v6;
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Hearst Route Status=%ld, splitterState = %{public}lu", buf, 0x20u);
    }
    v7 = *(_QWORD *)(a1 + 32);
    if ((*(_QWORD *)(v7 + 48) & 0xFFFFFFFFFFFFFFFELL) != 2 && *(_QWORD *)(v7 + 32) == 1)
    {
      v8 = *v2;
      if (!os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
        goto LABEL_48;
      *(_DWORD *)buf = 136315138;
      v46 = "-[CSVoiceTriggerEventsCoordinator _notifyRemoteTriggerEvent:myriadHash:remoteTriggerType:remoteDeviceId:isTr"
            "iggeredFromFullWake:completion:]_block_invoke";
      v9 = "%s Hearst is routed. Ignore voice trigger notification from other remote devices.";
      goto LABEL_27;
    }
  }
  if (*(_QWORD *)(a1 + 72) == 1 && objc_msgSend(MEMORY[0x1E0D19260], "supportRemoteDarwinVoiceTrigger"))
  {
    objc_msgSend(MEMORY[0x1E0D191D0], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "hasDarwinDeviceConnected"))
    {
      objc_msgSend(MEMORY[0x1E0D191D0], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "hasDarwinDeviceHandleVoiceTrigger") & 1) != 0)
      {
        v12 = *(unsigned __int8 *)(a1 + 80);

        if (v12)
        {
          v8 = *v2;
          if (!os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
            goto LABEL_48;
          *(_DWORD *)buf = 136315138;
          v46 = "-[CSVoiceTriggerEventsCoordinator _notifyRemoteTriggerEvent:myriadHash:remoteTriggerType:remoteDeviceId:"
                "isTriggeredFromFullWake:completion:]_block_invoke";
          v9 = "%s Darwin device connected, ignore trigger from Gibraltar machine";
          goto LABEL_27;
        }
        goto LABEL_17;
      }

    }
  }
LABEL_17:
  if (CSIsIOS())
  {
    if (*(_QWORD *)(a1 + 72) != 2)
      goto LABEL_28;
    objc_msgSend(MEMORY[0x1E0D19198], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isOtherNonEligibleAppRecording");

    if ((v14 & 1) == 0)
      goto LABEL_28;
LABEL_25:
    v8 = *v2;
    if (!os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
      goto LABEL_48;
    *(_DWORD *)buf = 136315138;
    v46 = "-[CSVoiceTriggerEventsCoordinator _notifyRemoteTriggerEvent:myriadHash:remoteTriggerType:remoteDeviceId:isTrig"
          "geredFromFullWake:completion:]_block_invoke";
    v9 = "%s Other non eligible app is recording, ignore trigger from Darwin device";
LABEL_27:
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
LABEL_48:
    v34 = *(_QWORD *)(a1 + 64);
    if (v34)
      (*(void (**)(void))(v34 + 16))();
    return;
  }
  if (CSIsAppleSiliconMac())
  {
    if (objc_msgSend(MEMORY[0x1E0D19260], "shouldBlockVoiceTriggerWhenOtherAppRecording"))
    {
      if (*(_QWORD *)(a1 + 72) == 2)
      {
        +[CSOtherAppRecordingStateMonitorASMac sharedInstance](CSOtherAppRecordingStateMonitorASMac, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isOtherAppRecording");

        if (v16)
          goto LABEL_25;
      }
    }
  }
LABEL_28:
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v17 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "voiceTriggerDidDetectKeyword:deviceId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v40);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v19);
  }

  kdebug_trace();
  kdebug_trace();
  v22 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    v23 = *(void **)(a1 + 32);
    v24 = *(_QWORD *)(a1 + 40);
    v25 = v22;
    objc_msgSend(v23, "_createVoiceTriggerEventInfoString:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v46 = "-[CSVoiceTriggerEventsCoordinator _notifyRemoteTriggerEvent:myriadHash:remoteTriggerType:remoteDeviceId:isTrig"
          "geredFromFullWake:completion:]_block_invoke";
    v47 = 2114;
    v48 = v26;
    _os_log_impl(&dword_1C2614000, v25, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_printVoiceTriggerMetricsString:", *(_QWORD *)(a1 + 40), (_QWORD)v40);
  v27 = *(void **)(a1 + 72);
  if (v27 == (void *)2)
  {
    v30 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[CSVoiceTriggerEventsCoordinator _notifyRemoteTriggerEvent:myriadHash:remoteTriggerType:remoteDeviceId:isTr"
            "iggeredFromFullWake:completion:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v30, OS_LOG_TYPE_DEFAULT, "%s Notifying Darwin VoiceTrigger Trigger!!!!", buf, 0xCu);
    }
    if (CSIsOSX())
    {
      +[CSMyriadPHash decodeWithMyriadPHash:](CSMyriadPHash, "decodeWithMyriadPHash:", *(_QWORD *)(a1 + 56));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "absTime");
      v32 = AFMachAbsoluteTimeAddTimeInterval();

    }
    else
    {
      v32 = 0;
    }
    +[CSSiriLauncher sharedLauncher](CSSiriLauncher, "sharedLauncher");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = *(_QWORD *)(a1 + 40);
    v37 = *(_QWORD *)(a1 + 48);
    v38 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v32);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "notifyDarwinVoiceTrigger:deviceId:myriadPHash:myriadLateActivationExpirationTime:completion:", v36, v37, v38, v39, *(_QWORD *)(a1 + 64));

  }
  else
  {
    if (v27 != (void *)1)
    {
      v33 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "-[CSVoiceTriggerEventsCoordinator _notifyRemoteTriggerEvent:myriadHash:remoteTriggerType:remoteDeviceId:is"
              "TriggeredFromFullWake:completion:]_block_invoke";
        v47 = 2050;
        v48 = v27;
        _os_log_error_impl(&dword_1C2614000, v33, OS_LOG_TYPE_ERROR, "%s Unsupported trigger type : %{public}lu", buf, 0x16u);
      }
      goto LABEL_48;
    }
    v28 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[CSVoiceTriggerEventsCoordinator _notifyRemoteTriggerEvent:myriadHash:remoteTriggerType:remoteDeviceId:isTr"
            "iggeredFromFullWake:completion:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v28, OS_LOG_TYPE_DEFAULT, "%s Notifying Gibraltar VoiceTrigger Trigger!!!!", buf, 0xCu);
    }
    +[CSSiriLauncher sharedLauncher](CSSiriLauncher, "sharedLauncher");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "notifyBuiltInVoiceTrigger:myriadPHash:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  }
}

void __75__CSVoiceTriggerEventsCoordinator__notifyTriggerEvent_deviceId_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  os_log_t *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  CSMyriadPHash *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldIgnoreVoiceTriggerEvent:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(_QWORD *)(a1 + 56);
    if (v2)
      (*(void (**)(void))(v2 + 16))();
    return;
  }
  objc_msgSend(MEMORY[0x1E0D19288], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVoiceTriggerInfo:deviceId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v37 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "voiceTriggerDidDetectKeyword:deviceId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v36);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v6);
  }

  v9 = (os_log_t *)MEMORY[0x1E0D18F60];
  v10 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v41 = "-[CSVoiceTriggerEventsCoordinator _notifyTriggerEvent:deviceId:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s Notifying VoiceTrigger Trigger!!!!", buf, 0xCu);
    v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v13 = v10;
    objc_msgSend(v11, "_createVoiceTriggerEventInfoString:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v41 = "-[CSVoiceTriggerEventsCoordinator _notifyTriggerEvent:deviceId:completion:]_block_invoke";
    v42 = 2114;
    v43 = v14;
    _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_printVoiceTriggerMetricsString:", *(_QWORD *)(a1 + 40), (_QWORD)v36);
  kdebug_trace();
  kdebug_trace();
  if (!CSIsHorseman()
    || (objc_msgSend(*(id *)(a1 + 32), "_isVoiceTriggerFromRemora:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    if (objc_msgSend(MEMORY[0x1E0D19260], "supportHomeKitAccessory")
      && objc_msgSend(*(id *)(a1 + 32), "_isVoiceTriggerFromRemora:", *(_QWORD *)(a1 + 40)))
    {
      v15 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v41 = "-[CSVoiceTriggerEventsCoordinator _notifyTriggerEvent:deviceId:completion:]_block_invoke";
        _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s Activating Siri on Homekit accessory", buf, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "_myriadPhashFromVoiceTriggerInfo:", *(_QWORD *)(a1 + 40));
      v16 = (CSMyriadPHash *)objc_claimAutoreleasedReturnValue();
      +[CSSiriLauncher sharedLauncher](CSSiriLauncher, "sharedLauncher");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "notifyRemoraVoiceTrigger:myriadPHash:deviceId:completion:", *(_QWORD *)(a1 + 40), v16, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      goto LABEL_47;
    }
    v18 = *(void **)(a1 + 40);
    if (v18)
    {
      v19 = *MEMORY[0x1E0D19660];
      objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D19660]);
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = (void *)v20;
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0D19488]);

        if (v23)
        {
          v24 = *MEMORY[0x1E0D19728];
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D19728]);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "unsignedIntegerValue");

            +[CSMyriadPHash generateEmptyPHash:writeFile:](CSMyriadPHash, "generateEmptyPHash:writeFile:", v27, 0);
            v16 = (CSMyriadPHash *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v35 = *v9;
            if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v41 = "-[CSVoiceTriggerEventsCoordinator _notifyTriggerEvent:deviceId:completion:]_block_invoke";
              _os_log_error_impl(&dword_1C2614000, v35, OS_LOG_TYPE_ERROR, "%s Jarvis VoiceTrigger result doesn't have trigger end mach time", buf, 0xCu);
            }
            v16 = 0;
          }
          +[CSSiriLauncher sharedLauncher](CSSiriLauncher, "sharedLauncher");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "notifyCarPlayVoiceTrigger:deviceId:myriadPHash:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v16, *(_QWORD *)(a1 + 56));
          goto LABEL_47;
        }
      }
      v30 = *(_QWORD *)(a1 + 40);
      if (v30)
      {
        if ((objc_msgSend(MEMORY[0x1E0D19260], "isVoiceTriggerFromExclaveWithVTEI:") & 1) != 0)
        {
          v16 = objc_alloc_init(CSMyriadPHash);
          -[CSMyriadPHash generatePHashFromExclaveVoiceTriggerInfo:writeFile:](v16, "generatePHashFromExclaveVoiceTriggerInfo:writeFile:", *(_QWORD *)(a1 + 40), 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[CSSiriLauncher sharedLauncher](CSSiriLauncher, "sharedLauncher");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "notifyBuiltInVoiceTrigger:myriadPHash:completion:", *(_QWORD *)(a1 + 40), v17, *(_QWORD *)(a1 + 56));

          v32 = *v9;
          if (!os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
          {
LABEL_42:
            notify_post("com.apple.coreaudio.borealisTrigger");
            goto LABEL_47;
          }
          *(_DWORD *)buf = 136315138;
          v41 = "-[CSVoiceTriggerEventsCoordinator _notifyTriggerEvent:deviceId:completion:]_block_invoke";
LABEL_41:
          _os_log_impl(&dword_1C2614000, v32, OS_LOG_TYPE_DEFAULT, "%s notifying built-in VT trigger by notify_post", buf, 0xCu);
          goto LABEL_42;
        }
        v30 = *(_QWORD *)(a1 + 40);
      }
    }
    else
    {
      v30 = 0;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "_isVoiceTriggerFromHearst:", v30))
    {
      +[CSSiriLauncher sharedLauncher](CSSiriLauncher, "sharedLauncher");
      v16 = (CSMyriadPHash *)objc_claimAutoreleasedReturnValue();
      -[CSMyriadPHash notifyBluetoothDeviceVoiceTrigger:deviceId:completion:](v16, "notifyBluetoothDeviceVoiceTrigger:deviceId:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
LABEL_48:

      return;
    }
    v16 = objc_alloc_init(CSMyriadPHash);
    -[CSMyriadPHash generatePHashFromVoiceTriggerInfo:writeFile:](v16, "generatePHashFromVoiceTriggerInfo:writeFile:", *(_QWORD *)(a1 + 40), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSSiriLauncher sharedLauncher](CSSiriLauncher, "sharedLauncher");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "notifyBuiltInVoiceTrigger:myriadPHash:completion:", *(_QWORD *)(a1 + 40), v17, *(_QWORD *)(a1 + 56));

    v32 = *v9;
    if (!os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_42;
    *(_DWORD *)buf = 136315138;
    v41 = "-[CSVoiceTriggerEventsCoordinator _notifyTriggerEvent:deviceId:completion:]_block_invoke";
    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "useSiriActivationSPIForHomePod");

  if (v29)
  {
    objc_msgSend(*(id *)(a1 + 32), "_myriadPhashFromVoiceTriggerInfo:", *(_QWORD *)(a1 + 40));
    v16 = (CSMyriadPHash *)objc_claimAutoreleasedReturnValue();
    +[CSSiriLauncher sharedLauncher](CSSiriLauncher, "sharedLauncher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "notifyBuiltInVoiceTrigger:myriadPHash:completion:", *(_QWORD *)(a1 + 40), v16, *(_QWORD *)(a1 + 56));
LABEL_47:

    goto LABEL_48;
  }
  notify_post("com.apple.coreaudio.borealisTrigger");
  v33 = *(_QWORD *)(a1 + 56);
  if (v33)
    (*(void (**)(void))(v33 + 16))();
}

void __67__CSVoiceTriggerEventsCoordinator__printVoiceTriggerMetricsString___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D19528];
  v5[0] = *MEMORY[0x1E0D19530];
  v5[1] = v0;
  v1 = *MEMORY[0x1E0D19550];
  v5[2] = *MEMORY[0x1E0D19548];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0D19538];
  v5[4] = *MEMORY[0x1E0D19540];
  v5[5] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_printVoiceTriggerMetricsString__internalAllowList;
  _printVoiceTriggerMetricsString__internalAllowList = v3;

}

void __70__CSVoiceTriggerEventsCoordinator__createVoiceTriggerEventInfoString___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[27];

  v15[26] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D195F8];
  v15[0] = *MEMORY[0x1E0D195D8];
  v15[1] = v0;
  v1 = *MEMORY[0x1E0D19698];
  v15[2] = *MEMORY[0x1E0D19778];
  v15[3] = v1;
  v2 = *MEMORY[0x1E0D195A8];
  v15[4] = *MEMORY[0x1E0D19690];
  v15[5] = v2;
  v3 = *MEMORY[0x1E0D19628];
  v15[6] = *MEMORY[0x1E0D19658];
  v15[7] = v3;
  v4 = *MEMORY[0x1E0D19730];
  v15[8] = *MEMORY[0x1E0D19788];
  v15[9] = v4;
  v5 = *MEMORY[0x1E0D19790];
  v15[10] = *MEMORY[0x1E0D19760];
  v15[11] = v5;
  v6 = *MEMORY[0x1E0D19768];
  v15[12] = *MEMORY[0x1E0D19738];
  v15[13] = v6;
  v7 = *MEMORY[0x1E0D19728];
  v15[14] = *MEMORY[0x1E0D19780];
  v15[15] = v7;
  v8 = *MEMORY[0x1E0D195E8];
  v15[16] = *MEMORY[0x1E0D19758];
  v15[17] = v8;
  v9 = *MEMORY[0x1E0D195B0];
  v15[18] = *MEMORY[0x1E0D19600];
  v15[19] = v9;
  v10 = *MEMORY[0x1E0D197A8];
  v15[20] = *MEMORY[0x1E0D195B8];
  v15[21] = v10;
  v11 = *MEMORY[0x1E0D19660];
  v15[22] = *MEMORY[0x1E0D195E0];
  v15[23] = v11;
  v12 = *MEMORY[0x1E0D19688];
  v15[24] = *MEMORY[0x1E0D19678];
  v15[25] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 26);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)_createVoiceTriggerEventInfoString__printingAllowList;
  _createVoiceTriggerEventInfoString__printingAllowList = v13;

}

uint64_t __54__CSVoiceTriggerEventsCoordinator_unregisterObserver___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 8), "removeObject:");
  return result;
}

uint64_t __52__CSVoiceTriggerEventsCoordinator_registerObserver___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 8), "addObject:");
  return result;
}

void __40__CSVoiceTriggerEventsCoordinator_start__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 40))
  {
    v3 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CSVoiceTriggerEventsCoordinator start]_block_invoke";
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
      v1 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v1 + 40) = 1;
    objc_msgSend(MEMORY[0x1E0D19018], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:", *(_QWORD *)(a1 + 32));

    objc_msgSend(MEMORY[0x1E0D19018], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__CSVoiceTriggerEventsCoordinator_start__block_invoke_5;
    v10[3] = &unk_1E7C26FD8;
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "getHearstRouteStatus:", v10);

    +[CSBluetoothWirelessSplitterMonitor sharedInstance](CSBluetoothWirelessSplitterMonitor, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:", *(_QWORD *)(a1 + 32));

    +[CSBluetoothWirelessSplitterMonitor sharedInstance](CSBluetoothWirelessSplitterMonitor, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __40__CSVoiceTriggerEventsCoordinator_start__block_invoke_3;
    v9[3] = &unk_1E7C27000;
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "splitterState:", v9);

  }
}

void __40__CSVoiceTriggerEventsCoordinator_start__block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__CSVoiceTriggerEventsCoordinator_start__block_invoke_2;
  v4[3] = &unk_1E7C29178;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void __40__CSVoiceTriggerEventsCoordinator_start__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__CSVoiceTriggerEventsCoordinator_start__block_invoke_4;
  v4[3] = &unk_1E7C29178;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

uint64_t __40__CSVoiceTriggerEventsCoordinator_start__block_invoke_4(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 48) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __40__CSVoiceTriggerEventsCoordinator_start__block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 32) = *(_QWORD *)(result + 40);
  return result;
}

+ (CSVoiceTriggerEventsCoordinator)sharedInstance
{
  if (sharedInstance_onceToken_18728 != -1)
    dispatch_once(&sharedInstance_onceToken_18728, &__block_literal_global_18729);
  return (CSVoiceTriggerEventsCoordinator *)(id)sharedInstance_sharedInstance_18730;
}

void __49__CSVoiceTriggerEventsCoordinator_sharedInstance__block_invoke()
{
  CSVoiceTriggerEventsCoordinator *v0;
  void *v1;

  v0 = objc_alloc_init(CSVoiceTriggerEventsCoordinator);
  v1 = (void *)sharedInstance_sharedInstance_18730;
  sharedInstance_sharedInstance_18730 = (uint64_t)v0;

}

@end
