@implementation CSAggressiveECModeHandler

- (CSAggressiveECModeHandler)init
{
  CSAggressiveECModeHandler *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  CSAttSiriAudioSessionStateClient *v5;
  CSAttSiriAudioSessionStateClient *siriStateClient;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSAggressiveECModeHandler;
  v2 = -[CSAggressiveECModeHandler init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("AggressiveECModeHandler queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    *(_WORD *)&v2->_readThisOrVoiceOverSessionActive = 0;
    v2->_aggressiveEchoCancellationApplied = 0;
    v2->_echoCancellationReason = 0;
    v5 = -[CSAttSiriAudioSessionStateClient initWithDelegate:]([CSAttSiriAudioSessionStateClient alloc], "initWithDelegate:", v2);
    siriStateClient = v2->_siriStateClient;
    v2->_siriStateClient = v5;

  }
  return v2;
}

- (void)setAttendingState:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__CSAggressiveECModeHandler_setAttendingState___block_invoke;
  v4[3] = &unk_1E7C28480;
  v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (void)setAudioSessionState:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  CSAggressiveECModeHandler *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__CSAggressiveECModeHandler_setAudioSessionState___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)siriDismissed
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CSAggressiveECModeHandler_siriDismissed__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)notifySiriSessionStateTTSOngoing:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__CSAggressiveECModeHandler_notifySiriSessionStateTTSOngoing___block_invoke;
  v4[3] = &unk_1E7C28480;
  v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (void)_configureAggressiveEchoCancellationParams:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("remove");
    if (v3)
      v6 = CFSTR("apply");
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSAggressiveECModeHandler _configureAggressiveEchoCancellationParams:]";
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s  %@ Aggressive EC params", buf, 0x16u);
  }
  if (CSIsIOS())
  {
    if (objc_msgSend(MEMORY[0x1E0D19260], "isContinuousConversationSupported"))
    {
      objc_msgSend(MEMORY[0x1E0D18FA8], "sharedVoiceTriggerClient");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __72__CSAggressiveECModeHandler__configureAggressiveEchoCancellationParams___block_invoke;
      v8[3] = &unk_1E7C23BD8;
      v9 = v3;
      v8[4] = self;
      objc_msgSend(v7, "setAggressiveECMode:completionBlock:", v3, v8);

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

- (CSAttSiriAudioSessionStateClient)siriStateClient
{
  return self->_siriStateClient;
}

- (void)setSiriStateClient:(id)a3
{
  objc_storeStrong((id *)&self->_siriStateClient, a3);
}

- (BOOL)readThisOrVoiceOverSessionActive
{
  return self->_readThisOrVoiceOverSessionActive;
}

- (void)setReadThisOrVoiceOverSessionActive:(BOOL)a3
{
  self->_readThisOrVoiceOverSessionActive = a3;
}

- (BOOL)inAttendingWindow
{
  return self->_inAttendingWindow;
}

- (void)setInAttendingWindow:(BOOL)a3
{
  self->_inAttendingWindow = a3;
}

- (BOOL)aggressiveEchoCancellationApplied
{
  return self->_aggressiveEchoCancellationApplied;
}

- (void)setAggressiveEchoCancellationApplied:(BOOL)a3
{
  self->_aggressiveEchoCancellationApplied = a3;
}

- (int64_t)echoCancellationReason
{
  return self->_echoCancellationReason;
}

- (void)setEchoCancellationReason:(int64_t)a3
{
  self->_echoCancellationReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriStateClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __72__CSAggressiveECModeHandler__configureAggressiveEchoCancellationParams___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  __CFString *v9;
  _QWORD v10[5];
  char v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0D18F60];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v8 = v4;
      objc_msgSend(v3, "localizedDescription");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v13 = "-[CSAggressiveECModeHandler _configureAggressiveEchoCancellationParams:]_block_invoke";
      v14 = 2114;
      v15 = v9;
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s Failed to set Aggressive EC mode : %{public}@", buf, 0x16u);

    }
    if (*(_BYTE *)(a1 + 40))
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v5 = CFSTR("applied");
      if (!*(_BYTE *)(a1 + 40))
        v5 = CFSTR("removed");
      *(_DWORD *)buf = 136315394;
      v13 = "-[CSAggressiveECModeHandler _configureAggressiveEchoCancellationParams:]_block_invoke";
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Aggressive EC mode %@ successfully", buf, 0x16u);
    }
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(NSObject **)(v6 + 16);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72__CSAggressiveECModeHandler__configureAggressiveEchoCancellationParams___block_invoke_23;
    v10[3] = &unk_1E7C28480;
    v10[4] = v6;
    v11 = *(_BYTE *)(a1 + 40);
    dispatch_async(v7, v10);
  }

}

uint64_t __72__CSAggressiveECModeHandler__configureAggressiveEchoCancellationParams___block_invoke_23(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 10) = *(_BYTE *)(result + 40);
  if (!*(_BYTE *)(result + 40))
    *(_QWORD *)(*(_QWORD *)(result + 32) + 32) = 0;
  return result;
}

uint64_t __62__CSAggressiveECModeHandler_notifySiriSessionStateTTSOngoing___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    v6 = 136315394;
    v7 = "-[CSAggressiveECModeHandler notifySiriSessionStateTTSOngoing:]_block_invoke";
    v8 = 1024;
    v9 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s isSpeaking:%u", (uint8_t *)&v6, 0x12u);
  }
  v4 = *(unsigned __int8 *)(a1 + 40);
  if (*(_BYTE *)(a1 + 40))
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_configureAggressiveEchoCancellationParams:", v4 != 0);
}

uint64_t __42__CSAggressiveECModeHandler_siriDismissed__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSAggressiveECModeHandler siriDismissed]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_configureAggressiveEchoCancellationParams:", 0);
}

void __50__CSAggressiveECModeHandler_setAudioSessionState___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  unsigned __int8 *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  const char *v25;
  __int16 v26;
  _BYTE v27[10];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0D18F60];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v24 = 136315394;
    v25 = "-[CSAggressiveECModeHandler setAudioSessionState:]_block_invoke";
    v26 = 2112;
    *(_QWORD *)v27 = v4;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s sessionInfo:%@", (uint8_t *)&v24, 0x16u);
  }
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AudioCategory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("AudioMode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("AudioSessionID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("IsActive"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    v11 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 136315906;
      v25 = "-[CSAggressiveECModeHandler setAudioSessionState:]_block_invoke";
      v26 = 2112;
      *(_QWORD *)v27 = v8;
      *(_WORD *)&v27[8] = 2112;
      v28 = v6;
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s audioSessionId:%@, audioSessionCategory:%@ audioMode:%@", (uint8_t *)&v24, 0x2Au);
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D48F00]))
      v12 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D491B0]);
    else
      v12 = 0;
    v14 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D48FF0]);
    v15 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 136315650;
      v25 = "-[CSAggressiveECModeHandler setAudioSessionState:]_block_invoke";
      v26 = 1024;
      *(_DWORD *)v27 = v12;
      *(_WORD *)&v27[4] = 1024;
      *(_DWORD *)&v27[6] = v14;
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s isReadThisAudioSession:(%u), isVoiceOver:(%u)", (uint8_t *)&v24, 0x18u);
    }
    if ((v12 | v14) != 1)
    {
      v23 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 136315138;
        v25 = "-[CSAggressiveECModeHandler setAudioSessionState:]_block_invoke";
        _os_log_impl(&dword_1C2614000, v23, OS_LOG_TYPE_DEFAULT, "%s Not a ReadThis or voiceOver audioSession - bail out!", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_28;
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) = v10;
    v16 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(unsigned __int8 **)(a1 + 40);
      v18 = v17[8];
      v19 = v17[10];
      LODWORD(v17) = v17[9];
      v24 = 136315906;
      v25 = "-[CSAggressiveECModeHandler setAudioSessionState:]_block_invoke";
      v26 = 1024;
      *(_DWORD *)v27 = v18;
      *(_WORD *)&v27[4] = 1024;
      *(_DWORD *)&v27[6] = v19;
      LOWORD(v28) = 1024;
      *(_DWORD *)((char *)&v28 + 2) = (_DWORD)v17;
      _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s readThisOrVoiceOverSessionActive:(%u) aggressiveEchoCancellationApplied:(%u) inAttendingWindow:(%u)", (uint8_t *)&v24, 0x1Eu);
    }
    v20 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(v20 + 8))
    {
      if (*(_BYTE *)(v20 + 10) || !*(_BYTE *)(v20 + 9))
        goto LABEL_28;
      v21 = 2;
      if (v12)
        v21 = 3;
      *(_QWORD *)(v20 + 32) = v21;
      v20 = *(_QWORD *)(a1 + 40);
      v22 = 1;
    }
    else
    {
      if (!*(_BYTE *)(v20 + 10) || (*(_QWORD *)(v20 + 32) & 0xFFFFFFFFFFFFFFFELL) != 2)
        goto LABEL_28;
      v22 = 0;
    }
    objc_msgSend((id)v20, "_configureAggressiveEchoCancellationParams:", v22);
LABEL_28:

    return;
  }
  v13 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
  {
    v24 = 136315138;
    v25 = "-[CSAggressiveECModeHandler setAudioSessionState:]_block_invoke";
    _os_log_error_impl(&dword_1C2614000, v13, OS_LOG_TYPE_ERROR, "%s audio session info is nil - bail out!", (uint8_t *)&v24, 0xCu);
  }
}

void __47__CSAggressiveECModeHandler_setAttendingState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  unsigned __int8 *v4;
  int v5;
  int v6;
  uint64_t v7;
  _BYTE *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    v4 = *(unsigned __int8 **)(a1 + 32);
    v5 = v4[8];
    v6 = v4[10];
    LODWORD(v4) = v4[9];
    v9 = 136316162;
    v10 = "-[CSAggressiveECModeHandler setAttendingState:]_block_invoke";
    v11 = 1024;
    v12 = v3;
    v13 = 1024;
    v14 = v5;
    v15 = 1024;
    v16 = v6;
    v17 = 1024;
    v18 = (int)v4;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s attendingStateStart:(%u) readThisOrVoiceOverSessionActive:(%u) aggressiveECParamsApplied:(%u) inAttendingWindow:(%u)", (uint8_t *)&v9, 0x24u);
  }
  if (*(_BYTE *)(a1 + 40))
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v7 + 9))
    {
      *(_BYTE *)(v7 + 9) = 1;
      v8 = *(_BYTE **)(a1 + 32);
      if (v8[8])
      {
        if (!v8[10])
          objc_msgSend(v8, "_configureAggressiveEchoCancellationParams:", 1);
      }
    }
  }
}

@end
