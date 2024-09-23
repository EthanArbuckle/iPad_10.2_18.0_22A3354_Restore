@implementation CSPreMyriadCoordinator

- (CSPreMyriadCoordinator)init
{
  CSPreMyriadCoordinator *v2;
  CSPreMyriadCoordinator *v3;
  uint64_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSMutableDictionary *accessoryVoiceTriggerMetaDataByDeviceId;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSPreMyriadCoordinator;
  v2 = -[CSPreMyriadCoordinator init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    if (!v2->_queue)
    {
      objc_msgSend(MEMORY[0x1E0D19260], "getSerialQueueWithQOS:name:fixedPriority:", 33, CFSTR("com.apple.corespeech.premyriad"), *MEMORY[0x1E0D192F0]);
      v4 = objc_claimAutoreleasedReturnValue();
      queue = v3->_queue;
      v3->_queue = (OS_dispatch_queue *)v4;

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    accessoryVoiceTriggerMetaDataByDeviceId = v3->_accessoryVoiceTriggerMetaDataByDeviceId;
    v3->_accessoryVoiceTriggerMetaDataByDeviceId = (NSMutableDictionary *)v6;

  }
  return v3;
}

- (BOOL)isBultInVoiceTriggerEvent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  char v11;
  BOOL v12;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_6;
  v5 = *MEMORY[0x1E0D19660];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D19660]);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_6;
  v7 = (void *)v6;
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D19450]);

  if ((v11 & 1) != 0)
    v12 = 1;
  else
LABEL_6:
    v12 = 0;

  return v12;
}

- (BOOL)isRemoraVoiceTriggerEvent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  char v11;
  BOOL v12;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_6;
  v5 = *MEMORY[0x1E0D19660];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D19660]);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_6;
  v7 = (void *)v6;
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D19490]);

  if ((v11 & 1) != 0)
    v12 = 1;
  else
LABEL_6:
    v12 = 0;

  return v12;
}

- (void)_clearPendingRemoraVoiceTrigger
{
  NSObject *v3;
  NSDictionary *pendingRemoraVoiceTriggerResult;
  void *v5;
  NSDictionary *v6;
  NSString *pendingRemoraVoiceTriggerDeviceId;
  id pendingRemoraVoiceTriggerCompletionBlk;
  CSSecondPassProgressProviding **p_remoraSecondPassProgressProvider;
  id WeakRetained;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  NSDictionary *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    pendingRemoraVoiceTriggerResult = self->_pendingRemoraVoiceTriggerResult;
    v12 = 136315395;
    v13 = "-[CSPreMyriadCoordinator _clearPendingRemoraVoiceTrigger]";
    v14 = 2113;
    v15 = pendingRemoraVoiceTriggerResult;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Clearing pending homekit accessory voice trigger %{private}@", (uint8_t *)&v12, 0x16u);
  }
  v5 = (void *)-[NSString copy](self->_pendingRemoraVoiceTriggerDeviceId, "copy");
  v6 = self->_pendingRemoraVoiceTriggerResult;
  self->_pendingRemoraVoiceTriggerResult = 0;

  pendingRemoraVoiceTriggerDeviceId = self->_pendingRemoraVoiceTriggerDeviceId;
  self->_pendingRemoraVoiceTriggerDeviceId = 0;

  pendingRemoraVoiceTriggerCompletionBlk = self->_pendingRemoraVoiceTriggerCompletionBlk;
  self->_pendingRemoraVoiceTriggerCompletionBlk = 0;

  p_remoraSecondPassProgressProvider = &self->_remoraSecondPassProgressProvider;
  WeakRetained = objc_loadWeakRetained((id *)p_remoraSecondPassProgressProvider);

  if (WeakRetained)
  {
    v11 = objc_loadWeakRetained((id *)p_remoraSecondPassProgressProvider);
    objc_msgSend(v11, "pendingSecondPassTriggerWasClearedForClient:deviceId:", 5, v5);

  }
}

- (BOOL)handlePendingRemoraVoiceTriggerIfNeeded
{
  NSObject *v3;
  NSObject *queue;
  uint64_t v5;
  id WeakRetained;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CSPreMyriadCoordinator handlePendingRemoraVoiceTriggerIfNeeded]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Handling Pending Remora VoiceTrigger Event", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1484;
  v24 = __Block_byref_object_dispose__1485;
  v25 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1484;
  v19 = __Block_byref_object_dispose__1485;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__29;
  v13 = __Block_byref_object_dispose__30;
  v14 = 0;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__CSPreMyriadCoordinator_handlePendingRemoraVoiceTriggerIfNeeded__block_invoke;
  v8[3] = &unk_1E7C23E98;
  v8[4] = self;
  v8[5] = &buf;
  v8[6] = &v15;
  v8[7] = &v9;
  dispatch_async_and_wait(queue, v8);
  v5 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "voiceTriggerDidDetectKeyword:deviceId:completion:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v16[5], v10[5]);

  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&buf, 8);

  return v5 != 0;
}

- (void)_clearPendingBuiltInVoiceTrigger
{
  NSObject *v3;
  NSDictionary *pendingBuiltInVoiceTriggerResult;
  NSDictionary *v5;
  id pendingBuiltInVoiceTriggerCompletionBlk;
  CSSecondPassProgressProviding **p_builtInSeconPassProgressProvider;
  id WeakRetained;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  NSDictionary *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    pendingBuiltInVoiceTriggerResult = self->_pendingBuiltInVoiceTriggerResult;
    v10 = 136315395;
    v11 = "-[CSPreMyriadCoordinator _clearPendingBuiltInVoiceTrigger]";
    v12 = 2113;
    v13 = pendingBuiltInVoiceTriggerResult;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Clearing pending built-in voice trigger %{private}@", (uint8_t *)&v10, 0x16u);
  }
  v5 = self->_pendingBuiltInVoiceTriggerResult;
  self->_pendingBuiltInVoiceTriggerResult = 0;

  pendingBuiltInVoiceTriggerCompletionBlk = self->_pendingBuiltInVoiceTriggerCompletionBlk;
  self->_pendingBuiltInVoiceTriggerCompletionBlk = 0;

  p_builtInSeconPassProgressProvider = &self->_builtInSeconPassProgressProvider;
  WeakRetained = objc_loadWeakRetained((id *)p_builtInSeconPassProgressProvider);

  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained((id *)p_builtInSeconPassProgressProvider);
    objc_msgSend(v9, "pendingSecondPassTriggerWasClearedForClient:deviceId:", 1, 0);

  }
}

- (BOOL)handlePendingBuiltInVoiceTriggerIfNeeded
{
  NSObject *v3;
  NSObject *queue;
  uint64_t v5;
  id WeakRetained;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  __int128 buf;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CSPreMyriadCoordinator handlePendingBuiltInVoiceTriggerIfNeeded]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Handling Pending BuiltInVoiceTrigger Event", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1484;
  v18 = __Block_byref_object_dispose__1485;
  v19 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__29;
  v13 = __Block_byref_object_dispose__30;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CSPreMyriadCoordinator_handlePendingBuiltInVoiceTriggerIfNeeded__block_invoke;
  block[3] = &unk_1E7C27C98;
  block[4] = self;
  block[5] = &buf;
  block[6] = &v9;
  dispatch_async_and_wait(queue, block);
  v5 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "voiceTriggerDidDetectKeyword:deviceId:completion:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), 0, v10[5]);

  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&buf, 8);
  return v5 != 0;
}

- (void)_getHighestRemoraFirstPassGoodnessScore:(id)a3
{
  void (**v4)(id, _QWORD, double);
  NSMutableDictionary *accessoryVoiceTriggerMetaDataByDeviceId;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  unint64_t v16;

  v4 = (void (**)(id, _QWORD, double))a3;
  if (v4)
  {
    v13 = 0;
    v14 = (double *)&v13;
    v15 = 0x2020000000;
    v16 = 0xBFF0000000000000;
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__1484;
    v11 = __Block_byref_object_dispose__1485;
    v12 = 0;
    accessoryVoiceTriggerMetaDataByDeviceId = self->_accessoryVoiceTriggerMetaDataByDeviceId;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__CSPreMyriadCoordinator__getHighestRemoraFirstPassGoodnessScore___block_invoke;
    v6[3] = &unk_1E7C23EC0;
    v6[4] = &v13;
    v6[5] = &v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](accessoryVoiceTriggerMetaDataByDeviceId, "enumerateKeysAndObjectsUsingBlock:", v6);
    v4[2](v4, v8[5], v14[3]);
    _Block_object_dispose(&v7, 8);

    _Block_object_dispose(&v13, 8);
  }

}

- (BOOL)_isRemoraSecondPassRunning
{
  NSMutableDictionary *accessoryVoiceTriggerMetaDataByDeviceId;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessoryVoiceTriggerMetaDataByDeviceId = self->_accessoryVoiceTriggerMetaDataByDeviceId;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__CSPreMyriadCoordinator__isRemoraSecondPassRunning__block_invoke;
  v5[3] = &unk_1E7C23EE8;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](accessoryVoiceTriggerMetaDataByDeviceId, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  CSVoiceTriggerDelegate **p_delegate;
  id WeakRetained;
  id v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v12 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v12, "voiceTriggerDidDetectKeyword:deviceId:completion:", v13, v8, v9);

  }
}

- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4
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
  block[2] = __64__CSPreMyriadCoordinator_voiceTriggerDidDetectKeyword_deviceId___block_invoke;
  block[3] = &unk_1E7C291C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)voiceTriggerDidDetectNearMiss:(id)a3 deviceId:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  if (-[CSPreMyriadCoordinator isBultInVoiceTriggerEvent:](self, "isBultInVoiceTriggerEvent:", v8))
  {
    -[CSPreMyriadCoordinator handlePendingRemoraVoiceTriggerIfNeeded](self, "handlePendingRemoraVoiceTriggerIfNeeded");
  }
  else if (-[CSPreMyriadCoordinator isRemoraVoiceTriggerEvent:](self, "isRemoraVoiceTriggerEvent:", v8))
  {
    -[CSPreMyriadCoordinator handlePendingBuiltInVoiceTriggerIfNeeded](self, "handlePendingBuiltInVoiceTriggerIfNeeded");
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "voiceTriggerDidDetectNearMiss:deviceId:", v8, v6);

}

- (void)voiceTriggerDidDetectSpeakerReject:(id)a3
{
  CSVoiceTriggerDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "voiceTriggerDidDetectSpeakerReject:", v4);

}

- (void)keywordDetectorDidDetectKeyword
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "keywordDetectorDidDetectKeyword");

}

- (void)voiceTriggerGotSuperVector:(id)a3
{
  CSVoiceTriggerDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "voiceTriggerGotSuperVector:", v4);

}

- (void)raiseToSpeakDetected:(id)a3
{
  CSVoiceTriggerDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "raiseToSpeakDetected:", v4);

}

- (void)voiceTriggerDidRejected:(id)a3 deviceId:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  if (-[CSPreMyriadCoordinator isBultInVoiceTriggerEvent:](self, "isBultInVoiceTriggerEvent:", v8))
  {
    -[CSPreMyriadCoordinator handlePendingRemoraVoiceTriggerIfNeeded](self, "handlePendingRemoraVoiceTriggerIfNeeded");
  }
  else if (-[CSPreMyriadCoordinator isRemoraVoiceTriggerEvent:](self, "isRemoraVoiceTriggerEvent:", v8))
  {
    -[CSPreMyriadCoordinator handlePendingBuiltInVoiceTriggerIfNeeded](self, "handlePendingBuiltInVoiceTriggerIfNeeded");
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "voiceTriggerDidRejected:deviceId:", v8, v6);

}

- (void)secondPassDidStopForClient:(unint64_t)a3 deviceId:(id)a4
{
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  NSObject *queue;
  _QWORD block[4];
  __CFString *v11;
  id v12[2];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a4;
  v7 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("N/A");
    *(_DWORD *)buf = 136315651;
    v14 = "-[CSPreMyriadCoordinator secondPassDidStopForClient:deviceId:]";
    if (v6)
      v8 = v6;
    v15 = 2048;
    v16 = a3;
    v17 = 2113;
    v18 = v8;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s client: %lu, deviceId: %{private}@", buf, 0x20u);
  }
  if (objc_msgSend(MEMORY[0x1E0D19260], "supportHomeKitAccessory"))
  {
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__CSPreMyriadCoordinator_secondPassDidStopForClient_deviceId___block_invoke;
    block[3] = &unk_1E7C247D8;
    objc_copyWeak(v12, (id *)buf);
    v12[1] = (id)a3;
    v11 = v6;
    dispatch_async(queue, block);

    objc_destroyWeak(v12);
    objc_destroyWeak((id *)buf);
  }

}

- (void)secondPassDidStartForClient:(unint64_t)a3 deviceId:(id)a4 withFirstPassEstimate:(double)a5
{
  __CFString *v8;
  NSObject *v9;
  const __CFString *v10;
  NSObject *queue;
  _QWORD v12[4];
  __CFString *v13;
  id v14[3];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a4;
  v9 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("N/A");
    *(_DWORD *)buf = 136315651;
    v16 = "-[CSPreMyriadCoordinator secondPassDidStartForClient:deviceId:withFirstPassEstimate:]";
    if (v8)
      v10 = v8;
    v17 = 2048;
    v18 = a3;
    v19 = 2113;
    v20 = v10;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s client: %lu, deviceId: %{private}@", buf, 0x20u);
  }
  if (objc_msgSend(MEMORY[0x1E0D19260], "supportHomeKitAccessory"))
  {
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __85__CSPreMyriadCoordinator_secondPassDidStartForClient_deviceId_withFirstPassEstimate___block_invoke;
    v12[3] = &unk_1E7C23F10;
    objc_copyWeak(v14, (id *)buf);
    v14[1] = (id)a3;
    v14[2] = *(id *)&a5;
    v13 = v8;
    dispatch_async(queue, v12);

    objc_destroyWeak(v14);
    objc_destroyWeak((id *)buf);
  }

}

- (CSVoiceTriggerDelegate)delegate
{
  return (CSVoiceTriggerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CSSecondPassProgressProviding)builtInSeconPassProgressProvider
{
  return (CSSecondPassProgressProviding *)objc_loadWeakRetained((id *)&self->_builtInSeconPassProgressProvider);
}

- (void)setBuiltInSeconPassProgressProvider:(id)a3
{
  objc_storeWeak((id *)&self->_builtInSeconPassProgressProvider, a3);
}

- (CSSecondPassProgressProviding)remoraSecondPassProgressProvider
{
  return (CSSecondPassProgressProviding *)objc_loadWeakRetained((id *)&self->_remoraSecondPassProgressProvider);
}

- (void)setRemoraSecondPassProgressProvider:(id)a3
{
  objc_storeWeak((id *)&self->_remoraSecondPassProgressProvider, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSDictionary)pendingRemoraVoiceTriggerResult
{
  return self->_pendingRemoraVoiceTriggerResult;
}

- (void)setPendingRemoraVoiceTriggerResult:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRemoraVoiceTriggerResult, a3);
}

- (NSString)pendingRemoraVoiceTriggerDeviceId
{
  return self->_pendingRemoraVoiceTriggerDeviceId;
}

- (void)setPendingRemoraVoiceTriggerDeviceId:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRemoraVoiceTriggerDeviceId, a3);
}

- (id)pendingRemoraVoiceTriggerCompletionBlk
{
  return self->_pendingRemoraVoiceTriggerCompletionBlk;
}

- (void)setPendingRemoraVoiceTriggerCompletionBlk:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)pendingRemoraVoiceTriggerDetectedTime
{
  return self->_pendingRemoraVoiceTriggerDetectedTime;
}

- (void)setPendingRemoraVoiceTriggerDetectedTime:(unint64_t)a3
{
  self->_pendingRemoraVoiceTriggerDetectedTime = a3;
}

- (NSDictionary)pendingBuiltInVoiceTriggerResult
{
  return self->_pendingBuiltInVoiceTriggerResult;
}

- (void)setPendingBuiltInVoiceTriggerResult:(id)a3
{
  objc_storeStrong((id *)&self->_pendingBuiltInVoiceTriggerResult, a3);
}

- (id)pendingBuiltInVoiceTriggerCompletionBlk
{
  return self->_pendingBuiltInVoiceTriggerCompletionBlk;
}

- (void)setPendingBuiltInVoiceTriggerCompletionBlk:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unint64_t)pendingBuiltInVoiceTriggerDetectedTime
{
  return self->_pendingBuiltInVoiceTriggerDetectedTime;
}

- (void)setPendingBuiltInVoiceTriggerDetectedTime:(unint64_t)a3
{
  self->_pendingBuiltInVoiceTriggerDetectedTime = a3;
}

- (CSPreMyriadVoiceTriggerMetaData)builtInVoiceTriggerMetaData
{
  return self->_builtInVoiceTriggerMetaData;
}

- (void)setBuiltInVoiceTriggerMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_builtInVoiceTriggerMetaData, a3);
}

- (NSMutableDictionary)accessoryVoiceTriggerMetaDataByDeviceId
{
  return self->_accessoryVoiceTriggerMetaDataByDeviceId;
}

- (void)setAccessoryVoiceTriggerMetaDataByDeviceId:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryVoiceTriggerMetaDataByDeviceId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryVoiceTriggerMetaDataByDeviceId, 0);
  objc_storeStrong((id *)&self->_builtInVoiceTriggerMetaData, 0);
  objc_storeStrong(&self->_pendingBuiltInVoiceTriggerCompletionBlk, 0);
  objc_storeStrong((id *)&self->_pendingBuiltInVoiceTriggerResult, 0);
  objc_storeStrong(&self->_pendingRemoraVoiceTriggerCompletionBlk, 0);
  objc_storeStrong((id *)&self->_pendingRemoraVoiceTriggerDeviceId, 0);
  objc_storeStrong((id *)&self->_pendingRemoraVoiceTriggerResult, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_remoraSecondPassProgressProvider);
  objc_destroyWeak((id *)&self->_builtInSeconPassProgressProvider);
  objc_destroyWeak((id *)&self->_delegate);
}

void __85__CSPreMyriadCoordinator_secondPassDidStartForClient_deviceId_withFirstPassEstimate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  CSPreMyriadVoiceTriggerMetaData *v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3 == 5)
    {
      if (*(_QWORD *)(a1 + 32))
      {
        v8 = WeakRetained;
        v4 = objc_alloc_init(CSPreMyriadVoiceTriggerMetaData);
        -[CSPreMyriadVoiceTriggerMetaData setIsSecondPassRunning:](v4, "setIsSecondPassRunning:", 1);
        -[CSPreMyriadVoiceTriggerMetaData setDeviceId:](v4, "setDeviceId:", *(_QWORD *)(a1 + 32));
        v6 = *(double *)(a1 + 56);
        *(float *)&v6 = v6;
        -[CSPreMyriadVoiceTriggerMetaData setFirstPassMyriadGoodnessScore:](v4, "setFirstPassMyriadGoodnessScore:", v6);
        objc_msgSend(v8, "accessoryVoiceTriggerMetaDataByDeviceId");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v4, *(_QWORD *)(a1 + 32));

        goto LABEL_7;
      }
    }
    else if (v3 == 1)
    {
      v8 = WeakRetained;
      v4 = objc_alloc_init(CSPreMyriadVoiceTriggerMetaData);
      -[CSPreMyriadVoiceTriggerMetaData setIsSecondPassRunning:](v4, "setIsSecondPassRunning:", 1);
      -[CSPreMyriadVoiceTriggerMetaData setDeviceId:](v4, "setDeviceId:", 0);
      v5 = *(double *)(a1 + 56);
      *(float *)&v5 = v5;
      -[CSPreMyriadVoiceTriggerMetaData setFirstPassMyriadGoodnessScore:](v4, "setFirstPassMyriadGoodnessScore:", v5);
      objc_msgSend(v8, "setBuiltInVoiceTriggerMetaData:", v4);
LABEL_7:

      WeakRetained = v8;
    }
  }

}

void __62__CSPreMyriadCoordinator_secondPassDidStopForClient_deviceId___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3 == 5)
    {
      if (*(_QWORD *)(a1 + 32))
      {
        v5 = WeakRetained;
        objc_msgSend(WeakRetained, "accessoryVoiceTriggerMetaDataByDeviceId");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

        goto LABEL_7;
      }
    }
    else if (v3 == 1)
    {
      v5 = WeakRetained;
      objc_msgSend(WeakRetained, "setBuiltInVoiceTriggerMetaData:", 0);
LABEL_7:
      WeakRetained = v5;
    }
  }

}

void __64__CSPreMyriadCoordinator_voiceTriggerDidDetectKeyword_deviceId___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id WeakRetained;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isBultInVoiceTriggerEvent:", *(_QWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "_clearPendingRemoraVoiceTrigger");
  }
  else if (objc_msgSend(v3, "isRemoraVoiceTriggerEvent:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "_clearPendingBuiltInVoiceTrigger");
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "voiceTriggerDidDetectKeyword:deviceId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __52__CSPreMyriadCoordinator__isRemoraSecondPassRunning__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "isSecondPassRunning");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __66__CSPreMyriadCoordinator__getHighestRemoraFirstPassGoodnessScore___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  float v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "isSecondPassRunning"))
  {
    objc_msgSend(v10, "firstPassMyriadGoodnessScore");
    v5 = v4;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(double *)(v6 + 24) < v5)
    {
      *(double *)(v6 + 24) = v5;
      objc_msgSend(v10, "deviceId");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
  }

}

uint64_t __66__CSPreMyriadCoordinator_handlePendingBuiltInVoiceTriggerIfNeeded__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  mach_absolute_time();
  CSMachAbsoluteTimeGetTimeInterval();
  v3 = v2;
  if (v2 <= 2.0)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    if (v5)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);
      v6 = MEMORY[0x1C3BC4734](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
  }
  else
  {
    v4 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "-[CSPreMyriadCoordinator handlePendingBuiltInVoiceTriggerIfNeeded]_block_invoke";
      v12 = 2048;
      v13 = v3;
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Time since last pending builtin voice trigger %f. Ignoring.", (uint8_t *)&v10, 0x16u);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_clearPendingBuiltInVoiceTrigger");
}

uint64_t __65__CSPreMyriadCoordinator_handlePendingRemoraVoiceTriggerIfNeeded__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  mach_absolute_time();
  CSMachAbsoluteTimeGetTimeInterval();
  v3 = v2;
  if (v2 <= 2.0)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    if (v5)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
      v6 = MEMORY[0x1C3BC4734](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
  }
  else
  {
    v4 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "-[CSPreMyriadCoordinator handlePendingRemoraVoiceTriggerIfNeeded]_block_invoke";
      v12 = 2048;
      v13 = v3;
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Time since last pending remora voice trigger %f. Ignoring.", (uint8_t *)&v10, 0x16u);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_clearPendingRemoraVoiceTrigger");
}

@end
