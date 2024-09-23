@implementation APSKSession

- (APSKSession)init
{
  return -[APSKSession initWithDelegate:delegateQueue:](self, "initWithDelegate:delegateQueue:", 0, 0);
}

- (APSKSession)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6;
  id v7;
  APSKSession *v8;
  APSKSession *v9;
  void **p_delegateQueue;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  id WeakRetained;
  void *v14;
  dispatch_queue_t v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)APSKSession;
  v8 = -[APSKSession init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    p_delegateQueue = (void **)&v9->_delegateQueue;
    objc_storeStrong((id *)&v9->_delegateQueue, a4);
    v9->_state = 0;
    v9->_remote = 1;
    v11 = dispatch_queue_create("com.apple.apsksession.stateq", 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    WeakRetained = objc_loadWeakRetained((id *)&v9->_delegate);
    if (WeakRetained)
    {
      v14 = *p_delegateQueue;

      if (!v14)
      {
        v15 = dispatch_queue_create("com.apple.apsksession.delegateq", 0);
        v16 = *p_delegateQueue;
        *p_delegateQueue = v15;

      }
    }
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

  return v9;
}

- (void)dealloc
{
  APSKSession *v3;
  objc_super v4;

  if (gLogCategory_AirPlaySenderKit <= 50
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    v3 = self;
    LogPrintF();
  }
  -[APSKSession stop](self, "stop", v3);
  v4.receiver = self;
  v4.super_class = (Class)APSKSession;
  -[APSKSession dealloc](&v4, sel_dealloc);
}

- (BOOL)active
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
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __21__APSKSession_active__block_invoke;
  v5[3] = &unk_25075C688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __21__APSKSession_active__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 56) != 0;
  return result;
}

- (int)addVideoStream:(id)a3
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
  int v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__APSKSession_addVideoStream___block_invoke;
  block[3] = &unk_25075C758;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LODWORD(queue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)queue;
}

void __30__APSKSession_addVideoStream___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 56))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -6709;
LABEL_10:
    APSLogErrorAt();
    return;
  }
  v4 = *(_QWORD *)(v2 + 32);
  v3 = (id *)(v2 + 32);
  if (v4)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -6719;
    goto LABEL_10;
  }
  objc_storeStrong(v3, *(id *)(a1 + 40));
  if (gLogCategory_AirPlaySenderKit <= 50
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (int)addAudioStream:(id)a3
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
  int v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__APSKSession_addAudioStream___block_invoke;
  block[3] = &unk_25075C758;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LODWORD(queue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)queue;
}

void __30__APSKSession_addAudioStream___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 56))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -6709;
LABEL_10:
    APSLogErrorAt();
    return;
  }
  v4 = *(_QWORD *)(v2 + 40);
  v3 = (id *)(v2 + 40);
  if (v4)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -6719;
    goto LABEL_10;
  }
  objc_storeStrong(v3, *(id *)(a1 + 40));
  if (gLogCategory_AirPlaySenderKit <= 50
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (int)setAuthString:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  int v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  if (gLogCategory_AirPlaySenderKit <= 30
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__APSKSession_setAuthString___block_invoke;
  block[3] = &unk_25075C780;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = *((_DWORD *)v13 + 6);

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __29__APSKSession_setAuthString___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;

  v2 = a1[4];
  v3 = *(_DWORD *)(v2 + 56);
  if (v3 == 1)
  {
    v4 = a1[5];
    if (*(_BYTE *)(v2 + 60))
      v5 = objc_msgSend((id)v2, "remoteSetAuthString:", v4);
    else
      v5 = objc_msgSend((id)v2, "localSetAuthString:", v4);
    *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
  }
  else if (v3)
  {
    *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = -6709;
  }
  else
  {
    objc_storeStrong((id *)(v2 + 48), (id)a1[5]);
  }
}

- (void)startToDestination:(id)a3 withOptions:(id)a4
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__APSKSession_startToDestination_withOptions___block_invoke;
  block[3] = &unk_25075C7A8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, block);

}

void __46__APSKSession_startToDestination_withOptions___block_invoke(uint64_t a1)
{
  void *v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  id WeakRetained;
  char v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[5];
  int v13;

  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 56))
  {
    if (gLogCategory_AirPlaySenderKit <= 90
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("_UseLocal"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 60) = objc_msgSend(v2, "BOOLValue") ^ 1;

    v3 = *(_BYTE **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    if (v3[60])
      v6 = objc_msgSend(v3, "remoteStartToDestination:withOptions:", v5, v4);
    else
      v6 = objc_msgSend(v3, "localStartToDestination:withOptions:", v5, v4);
    v7 = v6;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 1;
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(a1 + 48), "value");
      LogPrintF();
    }
    if (v7)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(NSObject **)(v10 + 16);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __46__APSKSession_startToDestination_withOptions___block_invoke_2;
        block[3] = &unk_25075C700;
        block[4] = v10;
        v13 = v7;
        dispatch_async(v11, block);
      }
    }
  }
}

void __46__APSKSession_startToDestination_withOptions___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "sessionDidFail:withError:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));

}

- (void)stop
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __19__APSKSession_stop__block_invoke;
  block[3] = &unk_25075C6B0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __19__APSKSession_stop__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t result;
  uint64_t v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setFrameSender:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setAudioSender:", 0);
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[60])
    result = objc_msgSend(v2, "remoteStop");
  else
    result = objc_msgSend(v2, "localStop");
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v4 + 56))
  {
    if (gLogCategory_AirPlaySenderKit <= 50)
    {
      if (gLogCategory_AirPlaySenderKit != -1
        || (result = _LogCategory_Initialize(), v4 = *(_QWORD *)(a1 + 32), (_DWORD)result))
      {
        result = LogPrintF();
        v4 = *(_QWORD *)(a1 + 32);
      }
    }
    *(_DWORD *)(v4 + 56) = 0;
  }
  return result;
}

- (int)sendFrame:(__CVBuffer *)a3 forTime:(int64_t)a4
{
  NSObject *queue;
  int v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__APSKSession_sendFrame_forTime___block_invoke;
  v7[3] = &unk_25075C7D0;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  dispatch_sync(queue, v7);
  v5 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __33__APSKSession_sendFrame_forTime___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = a1[4];
  if (!*(_QWORD *)(v1 + 32))
  {
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = -6705;
    return APSLogErrorAt();
  }
  if (*(_DWORD *)(v1 + 56) != 2)
  {
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = -6709;
    return APSLogErrorAt();
  }
  v2 = a1[6];
  v3 = a1[7];
  v4 = (void *)a1[4];
  if (*(_BYTE *)(v1 + 60))
    return objc_msgSend(v4, "remoteSendFrame:forTime:", v2, v3);
  else
    return objc_msgSend(v4, "localSendFrame:forTime:", v2, v3);
}

- (int)sendAudioData:(id)a3
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
  int v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__APSKSession_sendAudioData___block_invoke;
  block[3] = &unk_25075C758;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LODWORD(queue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)queue;
}

uint64_t __29__APSKSession_sendAudioData___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = a1[4];
  if (!*(_QWORD *)(v2 + 40))
  {
    *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = -6705;
    return APSLogErrorAt();
  }
  if (*(_DWORD *)(v2 + 56) != 2)
  {
    *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = -6709;
    return APSLogErrorAt();
  }
  v3 = a1[5];
  if (*(_BYTE *)(v2 + 60))
    result = objc_msgSend((id)v2, "remoteSendAudioData:", v3);
  else
    result = objc_msgSend((id)v2, "localSendAudioData:", v3);
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (int)sendAudioDataWithTimestamps:(id)a3 forHostTime:(id *)a4 forSampleTime:(unint64_t)a5 forDiscontinuity:(BOOL)a6
{
  id v10;
  NSObject *queue;
  id v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  unint64_t v17;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18;
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;

  v10 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  queue = self->_queue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __86__APSKSession_sendAudioDataWithTimestamps_forHostTime_forSampleTime_forDiscontinuity___block_invoke;
  v14[3] = &unk_25075C7F8;
  v14[4] = self;
  v15 = v10;
  v18 = *a4;
  v16 = &v20;
  v17 = a5;
  v19 = a6;
  v12 = v10;
  dispatch_sync(queue, v14);
  LODWORD(a5) = *((_DWORD *)v21 + 6);

  _Block_object_dispose(&v20, 8);
  return a5;
}

uint64_t __86__APSKSession_sendAudioDataWithTimestamps_forHostTime_forSampleTime_forDiscontinuity___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __int128 *v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t result;
  __int128 v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 40))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -6705;
    return APSLogErrorAt();
  }
  if (*(_DWORD *)(v2 + 56) != 2)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -6709;
    return APSLogErrorAt();
  }
  v3 = *(_QWORD *)(a1 + 40);
  v4 = (__int128 *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_BYTE *)(a1 + 88) != 0;
  if (*(_BYTE *)(v2 + 60))
  {
    v8 = *v4;
    v9 = *(_QWORD *)(a1 + 80);
    result = objc_msgSend((id)v2, "remoteSendAudioDataWithTimestamps:forHostTime:forSampleTime:forDiscontinuity:", v3, &v8, v5, v6);
  }
  else
  {
    v8 = *v4;
    v9 = *(_QWORD *)(a1 + 80);
    result = objc_msgSend((id)v2, "localSendAudioDataWithTimestamps:forHostTime:forSampleTime:forDiscontinuity:", v3, &v8, v5, v6);
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (unsigned)usageModes
{
  if (self->_audioStream)
    return (self->_videoStream != 0) | 2;
  else
    return self->_videoStream != 0;
}

- (void)handleAuthRequired:(int)a3
{
  id WeakRetained;
  char v6;
  _BOOL8 v7;
  NSObject *delegateQueue;
  _QWORD block[6];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = a3 == 1;
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__APSKSession_handleAuthRequired___block_invoke;
    block[3] = &unk_25075C820;
    block[4] = self;
    block[5] = v7;
    dispatch_async(delegateQueue, block);
  }
}

void __34__APSKSession_handleAuthRequired___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "sessionAuthRequired:forAuthType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)handleStartCompletion:(int)a3
{
  NSObject *queue;
  _QWORD v4[5];
  int v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__APSKSession_handleStartCompletion___block_invoke;
  v4[3] = &unk_25075C700;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

void __37__APSKSession_handleStartCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  id WeakRetained;
  char v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  _QWORD block[5];
  int v11;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 56) == 1)
  {
    if (*(_DWORD *)(a1 + 40))
    {
      if (gLogCategory_AirPlaySenderKit <= 100)
      {
        if (gLogCategory_AirPlaySenderKit != -1 || (v3 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v3))
        {
          LogPrintF();
          v2 = *(_QWORD *)(a1 + 32);
        }
      }
      WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) != 0)
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(NSObject **)(v6 + 16);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __37__APSKSession_handleStartCompletion___block_invoke_2;
        block[3] = &unk_25075C700;
        block[4] = v6;
        v11 = *(_DWORD *)(a1 + 40);
        dispatch_async(v7, block);
      }
    }
    else
    {
      if (gLogCategory_AirPlaySenderKit <= 50)
      {
        if (gLogCategory_AirPlaySenderKit != -1 || (v8 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v8))
        {
          v9 = v2;
          LogPrintF();
          v2 = *(_QWORD *)(a1 + 32);
        }
      }
      *(_DWORD *)(v2 + 56) = 2;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setAudioSender:", v9);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setFrameSender:");
    }
  }
  else if (gLogCategory_AirPlaySenderKit <= 50
         && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __37__APSKSession_handleStartCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "sessionDidFail:withError:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));

}

- (void)handleFailure:(int)a3
{
  NSObject *queue;
  _QWORD v4[5];
  int v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __29__APSKSession_handleFailure___block_invoke;
  v4[3] = &unk_25075C700;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

void __29__APSKSession_handleFailure___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  id WeakRetained;
  char v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];
  int v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 56))
  {
    if (gLogCategory_AirPlaySenderKit <= 100)
    {
      if (gLogCategory_AirPlaySenderKit != -1 || (v3 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v3))
      {
        LogPrintF();
        v2 = *(_QWORD *)(a1 + 32);
      }
    }
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(NSObject **)(v6 + 16);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __29__APSKSession_handleFailure___block_invoke_2;
      block[3] = &unk_25075C700;
      block[4] = v6;
      v9 = *(_DWORD *)(a1 + 40);
      dispatch_async(v7, block);
    }
  }
  else if (gLogCategory_AirPlaySenderKit <= 50
         && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __29__APSKSession_handleFailure___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "sessionDidFail:withError:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));

}

- (void)handleUpdatedDisplayWidth:(int)a3 height:(int)a4 refreshRate:(int)a5
{
  NSObject *queue;
  _QWORD block[5];
  int v7;
  int v8;
  int v9;

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__APSKSession_handleUpdatedDisplayWidth_height_refreshRate___block_invoke;
  block[3] = &unk_25075C728;
  block[4] = self;
  v7 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_sync(queue, block);
}

uint64_t __60__APSKSession_handleUpdatedDisplayWidth_height_refreshRate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setDisplayWidth:height:refreshRate:", *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44), *(unsigned int *)(a1 + 48));
}

- (void)handleVideoStreamErrorNotification:(int)a3
{
  NSObject *queue;
  _QWORD block[5];
  int v7;

  if (gLogCategory_AirPlaySenderKit <= 90
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__APSKSession_handleVideoStreamErrorNotification___block_invoke;
  block[3] = &unk_25075C700;
  block[4] = self;
  v7 = a3;
  dispatch_sync(queue, block);
}

uint64_t __50__APSKSession_handleVideoStreamErrorNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setError:", *(unsigned int *)(a1 + 40));
}

- (int)localSetAuthString:(id)a3
{
  id v4;
  OpaqueAPMediaSender *sender;
  int v6;

  v4 = a3;
  sender = self->_sender;
  if (!sender)
  {
    v6 = -6709;
    goto LABEL_5;
  }
  v6 = APMediaSenderSetAuthString((uint64_t)sender, v4);
  if (v6)
LABEL_5:
    APSLogErrorAt();

  return v6;
}

- (int)localStartToDestination:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  OpaqueAPMediaSender *sender;
  int v15;
  NSString *passcode;
  int updated;
  APSKStreamAudio *audioStream;
  OpaqueAPMediaSender *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  NSObject *v24;
  NSObject *senderNotifObserver;
  OpaqueAPMediaSender *v27;
  APSKSession *v28;
  OpaqueAPMediaSender *v29;
  int v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD aBlock[4];
  id v42;
  id location[2];

  v6 = a3;
  v7 = a4;
  v8 = -[APSKSession usageModes](self, "usageModes");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("APSKSessionOptionsKeyTimeoutSeconds"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v9, "intValue");

  objc_initWeak(location, self);
  v10 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__APSKSession_localStartToDestination_withOptions___block_invoke;
  aBlock[3] = &unk_25075C848;
  objc_copyWeak(&v42, location);
  v32 = _Block_copy(aBlock);
  v39[0] = v10;
  v39[1] = 3221225472;
  v39[2] = __51__APSKSession_localStartToDestination_withOptions___block_invoke_2;
  v39[3] = &unk_25075C848;
  objc_copyWeak(&v40, location);
  v11 = _Block_copy(v39);
  v37[0] = v10;
  v37[1] = 3221225472;
  v37[2] = __51__APSKSession_localStartToDestination_withOptions___block_invoke_3;
  v37[3] = &unk_25075C848;
  objc_copyWeak(&v38, location);
  v12 = _Block_copy(v37);
  v35[0] = v10;
  v35[1] = 3221225472;
  v35[2] = __51__APSKSession_localStartToDestination_withOptions___block_invoke_4;
  v35[3] = &unk_25075C870;
  objc_copyWeak(&v36, location);
  v31 = _Block_copy(v35);
  v33[0] = v10;
  v33[1] = 3221225472;
  v33[2] = __51__APSKSession_localStartToDestination_withOptions___block_invoke_5;
  v33[3] = &unk_25075C898;
  objc_copyWeak(&v34, location);
  v13 = _Block_copy(v33);
  if (!v8)
  {
    updated = -6705;
    APSLogErrorAt();
    goto LABEL_27;
  }
  if (self->_sender)
  {
    updated = -6709;
    APSLogErrorAt();
    goto LABEL_27;
  }
  sender = (OpaqueAPMediaSender *)APMediaSenderCreate();
  self->_sender = sender;
  if (!sender)
  {
    updated = -6762;
    APSLogErrorAt();
    goto LABEL_27;
  }
  if (gLogCategory_AirPlaySenderKit <= 50)
  {
    if (gLogCategory_AirPlaySenderKit != -1 || (v15 = _LogCategory_Initialize(), sender = self->_sender, v15))
    {
      v28 = self;
      v29 = sender;
      LogPrintF();
      sender = self->_sender;
    }
  }
  passcode = self->_passcode;
  if (!passcode)
    goto LABEL_11;
  updated = APMediaSenderSetAuthString((uint64_t)sender, passcode);
  if (!updated)
  {
    sender = self->_sender;
LABEL_11:
    updated = APMediaSenderSetAuthBlock((uint64_t)sender, (uint64_t)v32);
    if (!updated)
    {
      updated = APMediaSenderSetFailureBlock((uint64_t)self->_sender, (uint64_t)v12);
      if (!updated)
      {
        audioStream = self->_audioStream;
        if (!audioStream
          || (updated = APMediaSenderSetAudioDescription((uint64_t)self->_sender, (uint64_t)-[APSKStreamAudio asbd](audioStream, "asbd"), -[APSKStreamAudio useVideoLatency](self->_audioStream, "useVideoLatency"))) == 0)
        {
          if (!self->_videoStream)
          {
LABEL_21:
            APMediaSenderStart((uint64_t)self->_sender, (CFTypeRef)objc_msgSend(v6, "value", v28, v29), objc_msgSend(v6, "destinationType"), v8, v30, (uint64_t)v11);
            updated = 0;
            goto LABEL_22;
          }
          updated = APMediaSenderSetDisplayInfoUpdateBlock((uint64_t)self->_sender, (uint64_t)v31);
          if (!updated)
          {
            v19 = self->_sender;
            objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_VideoOverrides"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            updated = APMediaSenderSetVideoOverrides((uint64_t)v19, v20);

            if (!updated)
            {
              objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_UseVideoPassthrough"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "BOOLValue");

              if (!v22 || (updated = APMediaSenderSetVideoPassthroughMode((uint64_t)self->_sender)) == 0)
              {
                objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v28, v29);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "addObserverForName:object:queue:usingBlock:", 0x25075CCE8, self->_sender, 0, v13);
                v24 = objc_claimAutoreleasedReturnValue();
                senderNotifObserver = self->_senderNotifObserver;
                self->_senderNotifObserver = v24;

                goto LABEL_21;
              }
            }
          }
        }
      }
    }
  }
  APSLogErrorAt();
LABEL_27:
  if (gLogCategory_AirPlaySenderKit <= 90
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v27 = self->_sender;
  if (v27)
  {
    CFRelease(v27);
    self->_sender = 0;
  }
LABEL_22:

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);

  objc_destroyWeak(&v42);
  objc_destroyWeak(location);

  return updated;
}

void __51__APSKSession_localStartToDestination_withOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleAuthRequired:", a2);

}

void __51__APSKSession_localStartToDestination_withOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleStartCompletion:", a2);

}

void __51__APSKSession_localStartToDestination_withOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleFailure:", a2);

}

void __51__APSKSession_localStartToDestination_withOptions___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleUpdatedDisplayWidth:height:refreshRate:", a2, a3, a4);

}

void __51__APSKSession_localStartToDestination_withOptions___block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", 0x25075CD08);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(WeakRetained, "handleVideoStreamErrorNotification:", v6);
}

- (void)localStop
{
  void *v3;
  NSObject *senderNotifObserver;
  OpaqueAPMediaSender *sender;
  OpaqueAPMediaSender *v6;

  if (self->_senderNotifObserver)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_senderNotifObserver);

    senderNotifObserver = self->_senderNotifObserver;
    self->_senderNotifObserver = 0;

  }
  sender = self->_sender;
  if (sender)
  {
    APMediaSenderStop((uint64_t)sender);
    v6 = self->_sender;
    if (v6)
    {
      CFRelease(v6);
      self->_sender = 0;
    }
  }
}

- (int)localSendFrame:(__CVBuffer *)a3 forTime:(int64_t)a4
{
  OpaqueAPMediaSender *sender;
  int v5;

  sender = self->_sender;
  if (!sender)
  {
    v5 = -6709;
    goto LABEL_5;
  }
  v5 = APMediaSenderSubmitPixelBuffer((uint64_t)sender, (uint64_t)a3, a4);
  if (v5)
LABEL_5:
    APSLogErrorAt();
  return v5;
}

- (int)localSendAudioData:(id)a3
{
  id v4;
  OpaqueAPMediaSender *sender;
  int v6;

  v4 = a3;
  sender = self->_sender;
  if (!sender)
  {
    v6 = -6709;
    goto LABEL_5;
  }
  v6 = APMediaSenderEnqueueAudioData((uint64_t)sender, (uint64_t)v4);
  if (v6)
LABEL_5:
    APSLogErrorAt();

  return v6;
}

- (int)localSendAudioDataWithTimestamps:(id)a3 forHostTime:(id *)a4 forSampleTime:(unint64_t)a5 forDiscontinuity:(BOOL)a6
{
  id v10;
  OpaqueAPMediaSender *sender;
  int v12;
  __int128 v14;
  int64_t var3;

  v10 = a3;
  sender = self->_sender;
  if (!sender)
  {
    v12 = -6709;
    goto LABEL_5;
  }
  v14 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v12 = APMediaSenderEnqueueAudioDataWithTimestamps((uint64_t)sender, (uint64_t)v10, &v14, a5, a6);
  if (v12)
LABEL_5:
    APSLogErrorAt();

  return v12;
}

- (int)remoteSetAuthString:(id)a3
{
  id v4;
  int v5;
  id v6;

  v4 = a3;
  if (self->_objectID && self->_client)
  {
    v5 = FigXPCCreateBasicMessage();
    v6 = 0;
    if (v5)
      goto LABEL_9;
    if (v4)
      xpc_dictionary_set_string(v6, (const char *)kAPSKServiceMsgParamC2S_AuthString, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    v5 = FigXPCRemoteClientSendSyncMessageCreatingReply();
    if (v5)
LABEL_9:
      APSLogErrorAt();
  }
  else
  {
    v5 = -6709;
    APSLogErrorAt();
    v6 = 0;
  }
  FigXPCRelease();

  return v5;
}

- (int)remoteStartToDestination:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  void *v9;
  int v10;
  uint64_t v11;
  int v12;
  id v13;
  id v14;
  void *v15;
  uint64_t uint64;
  unint64_t v17;
  int v18;
  int v19;
  NSString *passcode;
  APSKStreamAudio *audioStream;
  void *v22;
  int v23;
  void *v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;

  v6 = a3;
  v7 = a4;
  v8 = -[APSKSession usageModes](self, "usageModes");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("APSKSessionOptionsKeyTimeoutSeconds"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  if (!v8)
  {
    v12 = -6705;
LABEL_42:
    APSLogErrorAt();
    v13 = 0;
    goto LABEL_44;
  }
  if (self->_objectID)
  {
    v12 = -6709;
    goto LABEL_42;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sRemoteClientLock);
  if (sRemoteClient)
    goto LABEL_4;
  v27 = FigXPCRemoteClientCreateWithXPCService();
  if ((_DWORD)v27)
  {
    if (gLogCategory_AirPlaySenderKit <= 100)
    {
      v28 = v27;
      if (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize())
      {
        v30 = kAPSKServiceName;
        v31 = v28;
LABEL_34:
        LogPrintF();
      }
    }
  }
  else if (gLogCategory_AirPlaySenderKit <= 50
         && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    v30 = kAPSKServiceName;
    goto LABEL_34;
  }
LABEL_4:
  os_unfair_lock_unlock((os_unfair_lock_t)&sRemoteClientLock);
  v11 = sRemoteClient;
  self->_client = (OpaqueFigXPCRemoteClient *)sRemoteClient;
  if (!v11)
  {
    v12 = -6762;
    goto LABEL_42;
  }
  v12 = FigXPCCreateBasicMessage();
  v13 = 0;
  if (!v12)
  {
    v12 = FigXPCRemoteClientSendSyncMessageCreatingReply();
    v14 = 0;
    v15 = v14;
    if (!v12)
    {
      uint64 = xpc_dictionary_get_uint64(v14, (const char *)*MEMORY[0x24BDC0E10]);
      if (uint64)
      {
        v17 = uint64;
        v18 = FigXPCRemoteClientAssociateObject();
        if (v18)
        {
          v12 = v18;
        }
        else
        {
          self->_objectID = v17;
          FigXPCRelease();

          v12 = FigXPCCreateBasicMessage();
          v13 = 0;
          if (!v12)
          {
            objc_msgSend(v6, "value");
            v19 = FigXPCMessageSetCFObject();
            if (v19)
            {
              v12 = v19;
            }
            else
            {
              xpc_dictionary_set_uint64(v13, (const char *)kAPSKServiceMsgParamC2S_DestinationType, (int)objc_msgSend(v6, "destinationType"));
              xpc_dictionary_set_uint64(v13, (const char *)kAPSKServiceMsgParamC2S_UsageModes, v8);
              xpc_dictionary_set_uint64(v13, (const char *)kAPSKServiceMsgParamC2S_TimeoutSecs, v10);
              passcode = self->_passcode;
              if (passcode)
                xpc_dictionary_set_string(v13, (const char *)kAPSKServiceMsgParamC2S_AuthString, -[NSString UTF8String](passcode, "UTF8String"));
              audioStream = self->_audioStream;
              if (audioStream)
              {
                xpc_dictionary_set_data(v13, (const char *)kAPSKServiceMsgParamC2S_ASBD, -[APSKStreamAudio asbd](audioStream, "asbd"), 0x28uLL);
                xpc_dictionary_set_BOOL(v13, (const char *)kAPSKServiceMsgParamC2S_UseVideoLatency, -[APSKStreamAudio useVideoLatency](self->_audioStream, "useVideoLatency"));
              }
              if (!self->_videoStream)
                goto LABEL_20;
              objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_VideoOverrides"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v22 || (v23 = FigXPCMessageSetCFDictionary()) == 0)
              {
                objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_UseVideoPassthrough"), v30, v31);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v24, "BOOLValue");

                if (v25)
                  xpc_dictionary_set_BOOL(v13, (const char *)kAPSKServiceMsgParamC2S_VideoPassthru, 1);
LABEL_20:
                v26 = FigXPCRemoteClientSendSyncMessageCreatingReply();
                if (!v26)
                {
                  if (gLogCategory_AirPlaySenderKit <= 50
                    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
                  {
                    LogPrintF();
                  }
                  v12 = 0;
                  goto LABEL_30;
                }
                v12 = v26;
                goto LABEL_52;
              }
              v12 = v23;
            }
          }
        }
      }
      else
      {
        v12 = -6762;
      }
    }
LABEL_52:
    APSLogErrorAt();
    goto LABEL_53;
  }
  APSLogErrorAt();
LABEL_44:
  v15 = 0;
LABEL_53:
  if (gLogCategory_AirPlaySenderKit <= 90
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_30:
  FigXPCRelease();
  FigXPCRelease();

  return v12;
}

- (void)remoteStop
{
  int v3;
  id v4;

  if (self->_objectID)
  {
    if (self->_client)
    {
      v3 = FigXPCCreateBasicMessage();
      v4 = 0;
      if (v3 || FigXPCRemoteClientSendSyncMessageCreatingReply())
        APSLogErrorAt();
    }
    else
    {
      APSLogErrorAt();
      v4 = 0;
    }
    if (self->_objectID && self->_client)
      FigXPCRemoteClientDisassociateObject();
  }
  else
  {
    v4 = 0;
  }
  self->_client = 0;
  self->_objectID = 0;
  FigXPCRelease();

}

- (int)remoteSendFrame:(__CVBuffer *)a3 forTime:(int64_t)a4
{
  int v6;
  id v7;
  id v8;
  id v10[2];

  if (!self->_objectID || !self->_client)
  {
    v6 = -6709;
    APSLogErrorAt();
    v7 = 0;
LABEL_9:
    v8 = 0;
    goto LABEL_6;
  }
  v10[1] = 0;
  v6 = FigXPCCreateBasicMessage();
  v7 = 0;
  if (v6)
  {
    APSLogErrorAt();
    goto LABEL_9;
  }
  v10[0] = 0;
  v6 = APSKServiceSerializeFrame(a3, a4, v10);
  v8 = v10[0];
  if (v6
    || (xpc_dictionary_set_value(v7, (const char *)kAPSKServiceMsgParamC2S_Frame, v8),
        (v6 = FigXPCRemoteClientSendSyncMessageCreatingReply()) != 0))
  {
    APSLogErrorAt();
  }
LABEL_6:
  FigXPCRelease();
  FigXPCRelease();

  return v6;
}

- (int)remoteSendAudioData:(id)a3
{
  id v4;
  int v5;
  id v6;
  const char *v7;
  id v8;

  v4 = a3;
  if (self->_objectID && self->_client)
  {
    v5 = FigXPCCreateBasicMessage();
    v6 = 0;
    if (v5)
      goto LABEL_9;
    if (v4)
    {
      v7 = (const char *)kAPSKServiceMsgParamC2S_AudioData;
      v8 = objc_retainAutorelease(v4);
      xpc_dictionary_set_data(v6, v7, (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));
    }
    v5 = FigXPCRemoteClientSendSyncMessageCreatingReply();
    if (v5)
LABEL_9:
      APSLogErrorAt();
  }
  else
  {
    v5 = -6709;
    APSLogErrorAt();
    v6 = 0;
  }
  FigXPCRelease();

  return v5;
}

- (int)remoteSendAudioDataWithTimestamps:(id)a3 forHostTime:(id *)a4 forSampleTime:(unint64_t)a5 forDiscontinuity:(BOOL)a6
{
  id v9;
  int v10;
  id v11;
  const char *v12;
  id v13;
  int v14;

  v9 = a3;
  if (!self->_objectID || !self->_client)
  {
    v10 = -6709;
    APSLogErrorAt();
    v11 = 0;
    goto LABEL_8;
  }
  v10 = FigXPCCreateBasicMessage();
  v11 = 0;
  if (v10)
  {
LABEL_13:
    APSLogErrorAt();
    goto LABEL_8;
  }
  if (!v9)
    goto LABEL_7;
  v12 = (const char *)kAPSKServiceMsgParamC2S_AudioData;
  v13 = objc_retainAutorelease(v9);
  xpc_dictionary_set_data(v11, v12, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
  v14 = FigXPCMessageSetCMTime();
  if (v14)
  {
    v10 = v14;
    goto LABEL_13;
  }
  xpc_dictionary_set_uint64(v11, (const char *)kAPSKServiceMsgParamC2S_AudioSampleTime, a5);
  xpc_dictionary_set_BOOL(v11, (const char *)kAPSKServiceMsgParamC2S_AudioDiscontinuity, a6);
LABEL_7:
  v10 = FigXPCRemoteClientSendSyncMessageCreatingReply();
  if (v10)
    goto LABEL_13;
LABEL_8:
  FigXPCRelease();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderNotifObserver, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_videoStream, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
