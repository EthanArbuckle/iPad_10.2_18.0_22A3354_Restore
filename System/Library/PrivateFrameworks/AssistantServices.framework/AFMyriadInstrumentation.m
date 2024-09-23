@implementation AFMyriadInstrumentation

- (AFMyriadInstrumentation)init
{
  AFMyriadInstrumentation *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AFMyriadInstrumentation;
  v2 = -[AFMyriadInstrumentation init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.assistant.myriad.instrumentation", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)getPreviousBoostsWithCompletion:(id)a3
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
  v7[2] = __59__AFMyriadInstrumentation_getPreviousBoostsWithCompletion___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)logCDADeviceStateActivityStartedOrChanged:(int)a3 withTrigger:(int)a4 withCdaId:(id)a5 withTimestamp:(unint64_t)a6
{
  id v10;
  NSObject *queue;
  id v12;
  _QWORD v13[5];
  id v14;
  unint64_t v15;
  int v16;
  int v17;

  v10 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __105__AFMyriadInstrumentation_logCDADeviceStateActivityStartedOrChanged_withTrigger_withCdaId_withTimestamp___block_invoke;
  v13[3] = &unk_1E3A35150;
  v13[4] = self;
  v14 = v10;
  v16 = a3;
  v17 = a4;
  v15 = a6;
  v12 = v10;
  dispatch_async(queue, v13);

}

- (void)logCDADeviceStateActivityEnded:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  int v14;

  v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__AFMyriadInstrumentation_logCDADeviceStateActivityEnded_withCdaId_withTimestamp___block_invoke;
  v11[3] = &unk_1E3A330E0;
  v11[4] = self;
  v12 = v8;
  v14 = a3;
  v13 = a5;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)logCDAElectionAdvertisingStarted:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  int v14;

  v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__AFMyriadInstrumentation_logCDAElectionAdvertisingStarted_withCdaId_withTimestamp___block_invoke;
  v11[3] = &unk_1E3A330E0;
  v11[4] = self;
  v12 = v8;
  v14 = a3;
  v13 = a5;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)logCDAElectionAdvertisingStarting:(int)a3 withDelay:(float)a4 withInterval:(float)a5 withCdaId:(id)a6 withTimestamp:(unint64_t)a7
{
  id v12;
  NSObject *queue;
  id v14;
  _QWORD block[5];
  id v16;
  unint64_t v17;
  int v18;
  float v19;
  float v20;

  v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __108__AFMyriadInstrumentation_logCDAElectionAdvertisingStarting_withDelay_withInterval_withCdaId_withTimestamp___block_invoke;
  block[3] = &unk_1E3A33108;
  block[4] = self;
  v16 = v12;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v17 = a7;
  v14 = v12;
  dispatch_async(queue, block);

}

- (void)logCDAElectionAdvertisingEnded:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  int v14;

  v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__AFMyriadInstrumentation_logCDAElectionAdvertisingEnded_withCdaId_withTimestamp___block_invoke;
  v11[3] = &unk_1E3A330E0;
  v11[4] = self;
  v12 = v8;
  v14 = a3;
  v13 = a5;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)logCDAElectionAdvertisingEnding:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  int v14;

  v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__AFMyriadInstrumentation_logCDAElectionAdvertisingEnding_withCdaId_withTimestamp___block_invoke;
  v11[3] = &unk_1E3A330E0;
  v11[4] = self;
  v12 = v8;
  v14 = a3;
  v13 = a5;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)logCDAElectionTimerEnded:(int)a3 withCdaId:(id)a4 withTimestamp:(unint64_t)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  int v14;

  v8 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__AFMyriadInstrumentation_logCDAElectionTimerEnded_withCdaId_withTimestamp___block_invoke;
  v11[3] = &unk_1E3A330E0;
  v11[4] = self;
  v12 = v8;
  v14 = a3;
  v13 = a5;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)logCDAElectionDecisionMade:(int)a3 withDecision:(int)a4 withPreviousDecision:(int)a5 timeSincePreviousDecision:(unint64_t)a6 withWinningDevice:(id)a7 withThisDevice:(id)a8 withParticipants:(id)a9 withRawScore:(unsigned int)a10 withBoost:(id)a11 withCdaId:(id)a12 currentRequestId:(id)a13 withTimestamp:(unint64_t)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *queue;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD block[5];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  unint64_t v40;
  unint64_t v41;
  int v42;
  int v43;
  unsigned int v44;
  int v45;

  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a11;
  v22 = a12;
  v23 = a13;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __228__AFMyriadInstrumentation_logCDAElectionDecisionMade_withDecision_withPreviousDecision_timeSincePreviousDecision_withWinningDevice_withThisDevice_withParticipants_withRawScore_withBoost_withCdaId_currentRequestId_withTimestamp___block_invoke;
  block[3] = &unk_1E3A33130;
  block[4] = self;
  v34 = v22;
  v42 = a4;
  v43 = a5;
  v35 = v18;
  v36 = v19;
  v37 = v21;
  v38 = v20;
  v44 = a10;
  v45 = a3;
  v40 = a6;
  v41 = a14;
  v39 = v23;
  v25 = v23;
  v26 = v20;
  v27 = v21;
  v28 = v19;
  v29 = v18;
  v30 = v22;
  dispatch_async(queue, block);

}

- (void)logCDAElectionDecisionMadeDebug:(int)a3 withCrossDeviceArbitrationAllowed:(BOOL)a4 advertisementData:(id)a5 withDeviceGroup:(unsigned int)a6 withCdaId:(id)a7 withTimestamp:(unint64_t)a8
{
  id v14;
  id v15;
  NSObject *queue;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  unint64_t v22;
  unsigned int v23;
  int v24;
  BOOL v25;

  v14 = a5;
  v15 = a7;
  queue = self->_queue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __151__AFMyriadInstrumentation_logCDAElectionDecisionMadeDebug_withCrossDeviceArbitrationAllowed_advertisementData_withDeviceGroup_withCdaId_withTimestamp___block_invoke;
  v19[3] = &unk_1E3A33158;
  v19[4] = self;
  v20 = v15;
  v25 = a4;
  v23 = a6;
  v24 = a3;
  v21 = v14;
  v22 = a8;
  v17 = v14;
  v18 = v15;
  dispatch_async(queue, v19);

}

- (CDASchemaCDAScoreBoosters)currentBoost
{
  return self->_currentBoost;
}

- (void)resetCurrentBoost
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AFMyriadInstrumentation_resetCurrentBoost__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_sendAndLogClientEvent:(id)a3 stState:(int)a4 atTimestamp:(unint64_t)a5
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0D978A0];
  v7 = a3;
  objc_msgSend(v6, "sharedStream");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "emitMessage:timestamp:", v7, a5);

}

- (id)_boostTypeAsString:(unsigned __int8)a3
{
  if ((a3 - 1) > 6)
    return CFSTR("AFCDABoostTypeUnknown");
  else
    return off_1E3A33270[(a3 - 1)];
}

- (void)updateBoost:(unsigned __int8)a3 value:(unsigned int)a4
{
  NSObject *queue;
  _QWORD v5[5];
  unsigned int v6;
  unsigned __int8 v7;

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AFMyriadInstrumentation_updateBoost_value___block_invoke;
  v5[3] = &unk_1E3A33180;
  v5[4] = self;
  v7 = a3;
  v6 = a4;
  dispatch_async(queue, v5);
}

- (void)updateIsTrump:(BOOL)a3 withReason:(int)a4
{
  NSObject *queue;
  _QWORD v5[5];
  int v6;
  BOOL v7;

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__AFMyriadInstrumentation_updateIsTrump_withReason___block_invoke;
  v5[3] = &unk_1E3A33180;
  v5[4] = self;
  v7 = a3;
  v6 = a4;
  dispatch_async(queue, v5);
}

- (id)_createSchemaClientEvent:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x1E0D99400];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A500]), "initWithNSUUID:", v4);

  v7 = objc_alloc_init(MEMORY[0x1E0D99408]);
  objc_msgSend(v7, "setCdaId:", v6);
  objc_msgSend(v5, "setEventMetadata:", v7);

  return v5;
}

- (void)_logRequestLinkMessageRequestId:(id)a3 cdaId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    queue = self->_queue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__AFMyriadInstrumentation__logRequestLinkMessageRequestId_cdaId___block_invoke;
    v11[3] = &unk_1E3A36FC8;
    v12 = v7;
    v13 = v6;
    dispatch_async(queue, v11);

  }
  else
  {
    v10 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[AFMyriadInstrumentation _logRequestLinkMessageRequestId:cdaId:]";
      _os_log_debug_impl(&dword_19AF50000, v10, OS_LOG_TYPE_DEBUG, "%s Skipped emitting RequestLinkEvent as requestId or cdaId is nil", buf, 0xCu);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousBoosts, 0);
  objc_storeStrong((id *)&self->_currentBoost, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __65__AFMyriadInstrumentation__logRequestLinkMessageRequestId_cdaId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ADCreateRequestLinkInfo(v2, 23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ADCreateRequestLinkInfo(v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ADEmitRequestLinkEventMessage(v3, v5);
  v6 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v9 = 136315650;
    v10 = "-[AFMyriadInstrumentation _logRequestLinkMessageRequestId:cdaId:]_block_invoke";
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_debug_impl(&dword_19AF50000, v6, OS_LOG_TYPE_DEBUG, "%s Emitting Myriad RequestLinkEvent with requestId: %@, cdaId: %@", (uint8_t *)&v9, 0x20u);
  }

}

void __52__AFMyriadInstrumentation_updateIsTrump_withReason___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  unsigned int v8;
  const __CFString *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D99478]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  objc_msgSend(v2, "setIsTrump:", *(unsigned __int8 *)(a1 + 44));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setTrumpReason:", *(unsigned int *)(a1 + 40));
  v6 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(unsigned __int8 *)(a1 + 44);
    v8 = *(_DWORD *)(a1 + 40) - 1;
    if (v8 > 7)
      v9 = CFSTR("CDATRUMPREASON_UNKNOWN");
    else
      v9 = off_1E3A332A8[v8];
    v11 = 136315650;
    v12 = "-[AFMyriadInstrumentation updateIsTrump:withReason:]_block_invoke";
    v13 = 1024;
    v14 = v7;
    v15 = 2112;
    v16 = v9;
    v10 = v6;
    _os_log_debug_impl(&dword_19AF50000, v10, OS_LOG_TYPE_DEBUG, "%s trump: %d, with Reason:%@", (uint8_t *)&v11, 0x1Cu);

  }
}

void __45__AFMyriadInstrumentation_updateBoost_value___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0D99478]);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v2;

  }
  v5 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(unsigned __int8 *)(a1 + 44);
    v8 = v5;
    objc_msgSend(v6, "_boostTypeAsString:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_DWORD *)(a1 + 40);
    v11 = 136315650;
    v12 = "-[AFMyriadInstrumentation updateBoost:value:]_block_invoke";
    v13 = 2112;
    v14 = v9;
    v15 = 1024;
    v16 = v10;
    _os_log_debug_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEBUG, "%s boostType: %@, boostValue:%d", (uint8_t *)&v11, 0x1Cu);

  }
  switch(*(_BYTE *)(a1 + 44))
  {
    case 1:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDeviceBoost:", *(unsigned int *)(a1 + 40));
      break;
    case 2:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setRecentUnlockBoost:", *(unsigned int *)(a1 + 40));
      break;
    case 3:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setRecentRaiseToWakeBoost:", *(unsigned int *)(a1 + 40));
      break;
    case 4:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setRecentSiriRequestBoost:", *(unsigned int *)(a1 + 40));
      break;
    case 5:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setRecentMotionBoost:", *(unsigned int *)(a1 + 40));
      break;
    case 6:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setRecentPlaybackBoost:", *(unsigned int *)(a1 + 40));
      break;
    case 7:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setRecentAlarmBoost:", *(unsigned int *)(a1 + 40));
      break;
    default:
      return;
  }
}

void __44__AFMyriadInstrumentation_resetCurrentBoost__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

void __151__AFMyriadInstrumentation_logCDAElectionDecisionMadeDebug_withCrossDeviceArbitrationAllowed_advertisementData_withDeviceGroup_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;
  const __CFString *v7;
  int v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEvent:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0D99410]);
  objc_msgSend(v3, "setIsCrossDeviceArbitrationAllowed:", *(unsigned __int8 *)(a1 + 72));
  objc_msgSend(v3, "setDeviceGroup:", *(unsigned int *)(a1 + 64));
  objc_msgSend(v3, "setAdvertisementDatas:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "setDebugElectionDecisionMade:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_sendAndLogClientEvent:stState:atTimestamp:", v2, *(unsigned int *)(a1 + 68), *(_QWORD *)(a1 + 56));
  v4 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_DWORD *)(a1 + 68) - 1;
    if (v6 > 0x11)
      v7 = CFSTR("CDASTATE_UNKNOWN");
    else
      v7 = off_1E3A331E0[v6];
    v8 = *(unsigned __int8 *)(a1 + 72);
    v9 = *(_DWORD *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 48);
    v12 = 136316418;
    v13 = "-[AFMyriadInstrumentation logCDAElectionDecisionMadeDebug:withCrossDeviceArbitrationAllowed:advertisementData:"
          "withDeviceGroup:withCdaId:withTimestamp:]_block_invoke";
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v7;
    v18 = 1024;
    v19 = v8;
    v20 = 1024;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    v11 = v4;
    _os_log_debug_impl(&dword_19AF50000, v11, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@, arbitrationAllowed: %d, deviceGroup: %d, advertisements: %@", (uint8_t *)&v12, 0x36u);

  }
}

void __228__AFMyriadInstrumentation_logCDAElectionDecisionMade_withDecision_withPreviousDecision_timeSincePreviousDecision_withWinningDevice_withThisDevice_withParticipants_withRawScore_withBoost_withCdaId_currentRequestId_withTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  const __CFString *v9;
  const __CFString *v10;
  int v11;
  int v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  const __CFString *v22;
  int v23;
  uint64_t v24;
  int v25;
  const __CFString *v26;
  const __CFString *v27;
  int v28;
  uint64_t v29;
  const __CFString *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  const __CFString *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEvent:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0D99460]);
  objc_msgSend(v3, "setDecision:", *(unsigned int *)(a1 + 104));
  objc_msgSend(v3, "setPreviousDecision:", *(unsigned int *)(a1 + 108));
  objc_msgSend(v3, "setWinningDevice:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "setThisDevice:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v3, "setRawGoodnessScore:", *(unsigned int *)(a1 + 112));
  objc_msgSend(v3, "setTimeSinceLastDecisionInMs:", *(_QWORD *)(a1 + 88));
  v4 = *(_QWORD *)(a1 + 64);
  if (!v4)
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(v3, "setGoodnessScoreBoosts:", v4);
  objc_msgSend(v3, "setHeardParticipants:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v2, "setElectionDecisionMade:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_sendAndLogClientEvent:stState:atTimestamp:", v2, *(unsigned int *)(a1 + 116), *(_QWORD *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 32), "_logRequestLinkMessageRequestId:cdaId:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40));
  v5 = (id)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_DWORD *)(a1 + 116) - 1;
    if (v8 > 0x11)
      v9 = CFSTR("CDASTATE_UNKNOWN");
    else
      v9 = off_1E3A331E0[v8];
    v30 = v9;
    v10 = CFSTR("CDADECISION_UNKNOWN");
    v11 = *(_DWORD *)(a1 + 104);
    v12 = *(_DWORD *)(a1 + 108);
    if (v11 == 1)
      v13 = CFSTR("CDADECISION_WIN");
    else
      v13 = CFSTR("CDADECISION_UNKNOWN");
    if (v11 == 2)
      v14 = CFSTR("CDADECISION_LOSS");
    else
      v14 = v13;
    if (v12 == 1)
      v10 = CFSTR("CDADECISION_WIN");
    if (v12 == 2)
      v10 = CFSTR("CDADECISION_LOSS");
    v26 = v10;
    v27 = v14;
    v29 = *(_QWORD *)(a1 + 88);
    v15 = *(void **)(a1 + 48);
    v24 = *(_QWORD *)(a1 + 40);
    v28 = objc_msgSend(v15, "goodnessScore");
    v16 = *(void **)(a1 + 56);
    v25 = objc_msgSend(v16, "goodnessScore");
    objc_msgSend(*(id *)(a1 + 72), "debugDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(_DWORD *)(a1 + 112);
    objc_msgSend(v3, "goodnessScoreBoosts");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "debugDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "goodnessScoreBoosts");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "trumpReason") - 1;
    if (v21 > 7)
      v22 = CFSTR("CDATRUMPREASON_UNKNOWN");
    else
      v22 = off_1E3A332A8[v21];
    *(_DWORD *)buf = 136318466;
    v32 = "-[AFMyriadInstrumentation logCDAElectionDecisionMade:withDecision:withPreviousDecision:timeSincePreviousDecisi"
          "on:withWinningDevice:withThisDevice:withParticipants:withRawScore:withBoost:withCdaId:currentRequestId:withTim"
          "estamp:]_block_invoke";
    v33 = 2112;
    v34 = v24;
    v35 = 2112;
    v36 = v30;
    v37 = 2112;
    v38 = v27;
    v39 = 2112;
    v40 = v26;
    v41 = 2048;
    v42 = v29;
    v43 = 2112;
    v44 = v15;
    v45 = 1024;
    v46 = v28;
    v47 = 2112;
    v48 = v16;
    v49 = 1024;
    v50 = v25;
    v51 = 2112;
    v52 = v17;
    v53 = 1024;
    v54 = v23;
    v55 = 2112;
    v56 = v19;
    v57 = 2112;
    v58 = v22;
    _os_log_debug_impl(&dword_19AF50000, v5, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@, withDecision: %@, withPreviousDecision: %@, timeSincePreviousDecision: %llu, withWinningDevice: %@ (score: %d), withThisDevice: %@ (score: %d), withParticipants: %@, withRawScore:%u, withBoost:%@, withTrumpReason:%@", buf, 0x82u);

  }
  if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled](AFFeatureFlags, "isCrossDeviceArbitrationFeedbackEnabled"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(*(_QWORD *)(a1 + 32) + 16));
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = 0;

}

void __76__AFMyriadInstrumentation_logCDAElectionTimerEnded_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;
  const __CFString *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEvent:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0D99468]);
  objc_msgSend(v3, "setState:", *(unsigned int *)(a1 + 56));
  objc_msgSend(v2, "setElectionTimerEnded:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_sendAndLogClientEvent:stState:atTimestamp:", v2, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v4 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_DWORD *)(a1 + 56) - 1;
    if (v6 > 0x11)
      v7 = CFSTR("CDASTATE_UNKNOWN");
    else
      v7 = off_1E3A331E0[v6];
    v9 = 136315650;
    v10 = "-[AFMyriadInstrumentation logCDAElectionTimerEnded:withCdaId:withTimestamp:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v7;
    v8 = v4;
    _os_log_debug_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v9, 0x20u);

  }
}

void __83__AFMyriadInstrumentation_logCDAElectionAdvertisingEnding_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  const __CFString *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEvent:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0D99448]);
  objc_msgSend(v3, "setState:", *(unsigned int *)(a1 + 56));
  v4 = objc_alloc_init(MEMORY[0x1E0D99418]);
  objc_msgSend(v4, "setStartedOrChanged:", v3);
  objc_msgSend(v2, "setCdaAdvertisingEndChanged:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_sendAndLogClientEvent:stState:atTimestamp:", v2, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v5 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_DWORD *)(a1 + 56) - 1;
    if (v7 > 0x11)
      v8 = CFSTR("CDASTATE_UNKNOWN");
    else
      v8 = off_1E3A331E0[v7];
    v10 = 136315650;
    v11 = "-[AFMyriadInstrumentation logCDAElectionAdvertisingEnding:withCdaId:withTimestamp:]_block_invoke";
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v8;
    v9 = v5;
    _os_log_debug_impl(&dword_19AF50000, v9, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v10, 0x20u);

  }
}

void __82__AFMyriadInstrumentation_logCDAElectionAdvertisingEnded_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  const __CFString *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEvent:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0D99440]);
  objc_msgSend(v3, "setState:", *(unsigned int *)(a1 + 56));
  v4 = objc_alloc_init(MEMORY[0x1E0D99418]);
  objc_msgSend(v4, "setEnded:", v3);
  objc_msgSend(v2, "setCdaAdvertisingEndChanged:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_sendAndLogClientEvent:stState:atTimestamp:", v2, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v5 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_DWORD *)(a1 + 56) - 1;
    if (v7 > 0x11)
      v8 = CFSTR("CDASTATE_UNKNOWN");
    else
      v8 = off_1E3A331E0[v7];
    v10 = 136315650;
    v11 = "-[AFMyriadInstrumentation logCDAElectionAdvertisingEnded:withCdaId:withTimestamp:]_block_invoke";
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v8;
    v9 = v5;
    _os_log_debug_impl(&dword_19AF50000, v9, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v10, 0x20u);

  }
}

void __108__AFMyriadInstrumentation_logCDAElectionAdvertisingStarting_withDelay_withInterval_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  const __CFString *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEvent:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0D99458]);
  objc_msgSend(v3, "setState:", *(unsigned int *)(a1 + 56));
  LODWORD(v4) = *(_DWORD *)(a1 + 60);
  objc_msgSend(v3, "setAdvertisementDelay:", v4);
  LODWORD(v5) = *(_DWORD *)(a1 + 64);
  objc_msgSend(v3, "setAdvertisementInterval:", v5);
  v6 = objc_alloc_init(MEMORY[0x1E0D99420]);
  objc_msgSend(v6, "setStartedOrChanged:", v3);
  objc_msgSend(v2, "setCdaAdvertisingStartChanged:", v6);
  objc_msgSend(*(id *)(a1 + 32), "_sendAndLogClientEvent:stState:atTimestamp:", v2, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v7 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_DWORD *)(a1 + 56) - 1;
    if (v9 > 0x11)
      v10 = CFSTR("CDASTATE_UNKNOWN");
    else
      v10 = off_1E3A331E0[v9];
    v12 = 136315650;
    v13 = "-[AFMyriadInstrumentation logCDAElectionAdvertisingStarting:withDelay:withInterval:withCdaId:withTimestamp:]_block_invoke";
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v10;
    v11 = v7;
    _os_log_debug_impl(&dword_19AF50000, v11, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v12, 0x20u);

  }
}

void __84__AFMyriadInstrumentation_logCDAElectionAdvertisingStarted_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  const __CFString *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEvent:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0D99450]);
  objc_msgSend(v3, "setState:", *(unsigned int *)(a1 + 56));
  v4 = objc_alloc_init(MEMORY[0x1E0D99420]);
  objc_msgSend(v4, "setEnded:", v3);
  objc_msgSend(v2, "setCdaAdvertisingStartChanged:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_sendAndLogClientEvent:stState:atTimestamp:", v2, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v5 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_DWORD *)(a1 + 56) - 1;
    if (v7 > 0x11)
      v8 = CFSTR("CDASTATE_UNKNOWN");
    else
      v8 = off_1E3A331E0[v7];
    v10 = 136315650;
    v11 = "-[AFMyriadInstrumentation logCDAElectionAdvertisingStarted:withCdaId:withTimestamp:]_block_invoke";
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v8;
    v9 = v5;
    _os_log_debug_impl(&dword_19AF50000, v9, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v10, 0x20u);

  }
}

void __82__AFMyriadInstrumentation_logCDADeviceStateActivityEnded_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  const __CFString *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEvent:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0D99428]);
  objc_msgSend(v3, "setState:", *(unsigned int *)(a1 + 56));
  v4 = objc_alloc_init(MEMORY[0x1E0D99438]);
  objc_msgSend(v4, "setEnded:", v3);
  objc_msgSend(v2, "setDeviceElectionStateContext:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_sendAndLogClientEvent:stState:atTimestamp:", v2, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v5 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_DWORD *)(a1 + 56) - 1;
    if (v7 > 0x11)
      v8 = CFSTR("CDASTATE_UNKNOWN");
    else
      v8 = off_1E3A331E0[v7];
    v10 = 136315650;
    v11 = "-[AFMyriadInstrumentation logCDADeviceStateActivityEnded:withCdaId:withTimestamp:]_block_invoke";
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v8;
    v9 = v5;
    _os_log_debug_impl(&dword_19AF50000, v9, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@", (uint8_t *)&v10, 0x20u);

  }
}

void __105__AFMyriadInstrumentation_logCDADeviceStateActivityStartedOrChanged_withTrigger_withCdaId_withTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  const __CFString *v8;
  uint64_t v9;
  unsigned int v10;
  const __CFString *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_createSchemaClientEvent:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0D99430]);
  objc_msgSend(v3, "setState:", *(unsigned int *)(a1 + 56));
  if (*(_DWORD *)(a1 + 60))
    objc_msgSend(v3, "setTrigger:");
  v4 = objc_alloc_init(MEMORY[0x1E0D99438]);
  objc_msgSend(v4, "setStartedOrChanged:", v3);
  objc_msgSend(v2, "setDeviceElectionStateContext:", v4);
  objc_msgSend(MEMORY[0x1E0D978A0], "sharedStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emitMessage:timestamp:", v2, *(_QWORD *)(a1 + 48));

  v6 = (void *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_DWORD *)(a1 + 56) - 1;
    if (v7 > 0x11)
      v8 = CFSTR("CDASTATE_UNKNOWN");
    else
      v8 = off_1E3A331E0[v7];
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_DWORD *)(a1 + 60) - 1;
    if (v10 > 7)
      v11 = CFSTR("CDATRIGGER_UKNOWN");
    else
      v11 = off_1E3A331A0[v10];
    v13 = 136315906;
    v14 = "-[AFMyriadInstrumentation logCDADeviceStateActivityStartedOrChanged:withTrigger:withCdaId:withTimestamp:]_block_invoke";
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v11;
    v12 = v6;
    _os_log_debug_impl(&dword_19AF50000, v12, OS_LOG_TYPE_DEBUG, "%s cdaId: %@, state: %@, trigger: %@", (uint8_t *)&v13, 0x2Au);

  }
}

uint64_t __59__AFMyriadInstrumentation_getPreviousBoostsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  return result;
}

@end
