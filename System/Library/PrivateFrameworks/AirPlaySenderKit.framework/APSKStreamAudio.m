@implementation APSKStreamAudio

- (APSKStreamAudio)initWithAudioDescription:(const AudioStreamBasicDescription *)a3 delegate:(id)a4 delegateQueue:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  char *v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  dispatch_queue_t *v17;
  dispatch_queue_t v18;
  void *v19;
  id WeakRetained;
  dispatch_queue_t v21;
  dispatch_queue_t v22;
  dispatch_queue_t v23;
  NSObject *v24;
  dispatch_queue_t v25;
  void *v26;
  APSKStreamAudio *v27;
  objc_super v29;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v29.receiver = self;
  v29.super_class = (Class)APSKStreamAudio;
  v13 = -[APSKStreamAudio init](&v29, sel_init);
  v14 = v13;
  if (v13)
  {
    if (a3->mFormatID != 1819304813)
      goto LABEL_19;
    if (a3->mSampleRate <= 0.0)
      goto LABEL_19;
    if (!a3->mBytesPerPacket)
      goto LABEL_19;
    v15 = *(_OWORD *)&a3->mSampleRate;
    v16 = *(_OWORD *)&a3->mBytesPerPacket;
    *((_QWORD *)v13 + 5) = *(_QWORD *)&a3->mBitsPerChannel;
    *(_OWORD *)(v13 + 24) = v16;
    *(_OWORD *)(v13 + 8) = v15;
    objc_storeWeak((id *)v13 + 6, v10);
    v17 = (dispatch_queue_t *)(v14 + 56);
    objc_storeStrong((id *)v14 + 7, a5);
    objc_storeStrong((id *)v14 + 9, a6);
    objc_storeWeak((id *)v14 + 10, 0);
    *((_WORD *)v14 + 44) = 0;
    v18 = dispatch_queue_create("com.apple.apskstreamaudio.stateq", 0);
    v19 = (void *)*((_QWORD *)v14 + 8);
    *((_QWORD *)v14 + 8) = v18;

    if (!*((_QWORD *)v14 + 8))
      goto LABEL_19;
    WeakRetained = objc_loadWeakRetained((id *)v14 + 6);
    if (WeakRetained)
    {
      v21 = *v17;

      if (!v21)
      {
        v22 = dispatch_queue_create("com.apple.apskstreamaudio.delegateq", 0);
        v23 = *v17;
        *v17 = v22;

        if (!*v17)
          goto LABEL_19;
      }
    }
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = dispatch_queue_create("com.apple.apskstreamaudio.dataq", v24);
    v26 = (void *)*((_QWORD *)v14 + 13);
    *((_QWORD *)v14 + 13) = v25;

    if (!*((_QWORD *)v14 + 13)
      || !FigCFWeakReferenceHolderCreateWithReferencedObject()
      || APSRealTimeSignalCreate()
      || APSRingBufferCreate())
    {
LABEL_19:
      APSLogErrorAt();
      v27 = 0;
      goto LABEL_18;
    }
    *((_DWORD *)v14 + 30) = 0;
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  v27 = v14;
LABEL_18:

  return v27;
}

- (int)enqueueAudioData:(id)a3
{
  id v4;
  NSObject *queue;
  uint64_t v6;
  void *v7;
  int v8;
  NSObject *v9;
  _QWORD v11[5];
  int v12;
  _QWORD block[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  queue = self->_queue;
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__APSKStreamAudio_enqueueAudioData___block_invoke;
  block[3] = &unk_25075C688;
  block[4] = self;
  block[5] = &v14;
  dispatch_sync(queue, block);
  v7 = (void *)v15[5];
  if (v7)
  {
    v8 = objc_msgSend(v7, "sendAudioData:", v4);
    if (v8)
    {
      v9 = self->_queue;
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __36__APSKStreamAudio_enqueueAudioData___block_invoke_2;
      v11[3] = &unk_25075C700;
      v11[4] = self;
      v12 = v8;
      dispatch_sync(v9, v11);
    }
  }
  else
  {
    v8 = -6709;
  }
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __36__APSKStreamAudio_enqueueAudioData___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

void __36__APSKStreamAudio_enqueueAudioData___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  id v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];
  int v9;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 89))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 80));

    if (WeakRetained)
    {
      if (gLogCategory_AirPlaySenderKit <= 90
        && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) != 0)
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(NSObject **)(v6 + 56);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __36__APSKStreamAudio_enqueueAudioData___block_invoke_3;
        block[3] = &unk_25075C700;
        block[4] = v6;
        v9 = *(_DWORD *)(a1 + 40);
        dispatch_async(v7, block);
      }
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 89) = 1;
    }
  }
}

void __36__APSKStreamAudio_enqueueAudioData___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "audioStreamDidFail:withError:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));

}

- (int)enqueueAudioDataWithTimestamps:(id)a3 forHostTime:(id *)a4 forSampleTime:(unint64_t)a5 forDiscontinuity:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  NSObject *queue;
  uint64_t v12;
  void *v13;
  int v14;
  NSObject *v15;
  _QWORD v17[5];
  int v18;
  __int128 v19;
  int64_t var3;
  _QWORD block[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a6;
  v10 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = 0;
  queue = self->_queue;
  v12 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __93__APSKStreamAudio_enqueueAudioDataWithTimestamps_forHostTime_forSampleTime_forDiscontinuity___block_invoke;
  block[3] = &unk_25075C688;
  block[4] = self;
  block[5] = &v22;
  dispatch_sync(queue, block);
  v13 = (void *)v23[5];
  if (v13)
  {
    v19 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v14 = objc_msgSend(v13, "sendAudioDataWithTimestamps:forHostTime:forSampleTime:forDiscontinuity:", v10, &v19, a5, v6);
    if (v14)
    {
      v15 = self->_queue;
      v17[0] = v12;
      v17[1] = 3221225472;
      v17[2] = __93__APSKStreamAudio_enqueueAudioDataWithTimestamps_forHostTime_forSampleTime_forDiscontinuity___block_invoke_2;
      v17[3] = &unk_25075C700;
      v17[4] = self;
      v18 = v14;
      dispatch_sync(v15, v17);
    }
  }
  else
  {
    v14 = -6709;
  }
  _Block_object_dispose(&v22, 8);

  return v14;
}

void __93__APSKStreamAudio_enqueueAudioDataWithTimestamps_forHostTime_forSampleTime_forDiscontinuity___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

void __93__APSKStreamAudio_enqueueAudioDataWithTimestamps_forHostTime_forSampleTime_forDiscontinuity___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  id v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];
  int v9;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 89))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 80));

    if (WeakRetained)
    {
      if (gLogCategory_AirPlaySenderKit <= 90
        && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) != 0)
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(NSObject **)(v6 + 56);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __93__APSKStreamAudio_enqueueAudioDataWithTimestamps_forHostTime_forSampleTime_forDiscontinuity___block_invoke_3;
        block[3] = &unk_25075C700;
        block[4] = v6;
        v9 = *(_DWORD *)(a1 + 40);
        dispatch_async(v7, block);
      }
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 89) = 1;
    }
  }
}

void __93__APSKStreamAudio_enqueueAudioDataWithTimestamps_forHostTime_forSampleTime_forDiscontinuity___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "audioStreamDidFail:withError:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));

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
  v5[2] = __25__APSKStreamAudio_active__block_invoke;
  v5[3] = &unk_25075C688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __25__APSKStreamAudio_active__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = WeakRetained != 0;

}

- (BOOL)useVideoLatency
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
  v5[2] = __34__APSKStreamAudio_useVideoLatency__block_invoke;
  v5[3] = &unk_25075C688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__APSKStreamAudio_useVideoLatency__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 88);
  return result;
}

- (void)setUseVideoLatency:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__APSKStreamAudio_setUseVideoLatency___block_invoke;
  v4[3] = &unk_25075CC00;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

uint64_t __38__APSKStreamAudio_setUseVideoLatency___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 88) = *(_BYTE *)(result + 40);
  return result;
}

- (id)enqueueAudioDataBlock
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__APSKStreamAudio_enqueueAudioDataBlock__block_invoke;
  aBlock[3] = &unk_25075CC28;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

uint64_t __40__APSKStreamAudio_enqueueAudioDataBlock__block_invoke(uint64_t a1, uint64_t a2, unsigned int a3, CMTime *a4, uint64_t a5, char a6)
{
  uint64_t result;
  unsigned int *v11;
  unsigned int v12;
  CMTime v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = 0;
  v13 = *a4;
  v14 = CMClockConvertHostTimeToSystemUnits(&v13);
  v15 = a5;
  LODWORD(v16) = a3;
  BYTE4(v16) = a6;
  if ((unint64_t)a3 + 24 > APSRingBufferGetBytesFree())
    return 4294960557;
  result = APSRingBufferEnqueueBytes();
  if (!(_DWORD)result)
  {
    result = APSRingBufferEnqueueBytes();
    if (!(_DWORD)result)
    {
      v11 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 120);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 + 1, v11));
      APSRealTimeSignalRaise();
      return 0;
    }
  }
  return result;
}

- (void)setAudioSender:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  APSKStreamAudio *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__APSKStreamAudio_setAudioSender___block_invoke;
  block[3] = &unk_25075C6D8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __34__APSKStreamAudio_setAudioSender___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  id v4;
  id v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD *v9;
  id v10;
  char v11;
  uint64_t v12;
  _QWORD block[5];
  _QWORD v14[5];

  v2 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 80));
  v4 = WeakRetained;
  if (v2)
  {

    if (v4)
    {
      APSLogErrorAt();
      return;
    }
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 80), *(id *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 89) = 0;
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 48));
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(NSObject **)(v7 + 56);
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __34__APSKStreamAudio_setAudioSender___block_invoke_2;
      v14[3] = &unk_25075C6B0;
      v14[4] = v7;
      v9 = v14;
LABEL_16:
      dispatch_async(v8, v9);
    }
  }
  else
  {

    if (v4)
    {
      objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 80), 0);
      if (gLogCategory_AirPlaySenderKit <= 50
        && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 48));
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        v12 = *(_QWORD *)(a1 + 40);
        v8 = *(NSObject **)(v12 + 56);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __34__APSKStreamAudio_setAudioSender___block_invoke_3;
        block[3] = &unk_25075C6B0;
        block[4] = v12;
        v9 = block;
        goto LABEL_16;
      }
    }
  }
}

void __34__APSKStreamAudio_setAudioSender___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "audioStreamDidStart:", *(_QWORD *)(a1 + 32));

}

void __34__APSKStreamAudio_setAudioSender___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "audioStreamDidStop:", *(_QWORD *)(a1 + 32));

}

- (const)asbd
{
  return &self->_asbd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtQueue, 0);
  objc_destroyWeak((id *)&self->_audioSender);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
