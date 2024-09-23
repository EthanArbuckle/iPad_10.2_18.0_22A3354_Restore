@implementation AQServer

void __AQServer_DisposeQueue_block_invoke(uint64_t a1)
{
  AudioQueueObject *v2;
  AudioQueueOwner *v3;
  AudioQueueObject *v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  uint64_t v8;
  AQRemoteClient *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  AQOfflineMixerBase *v15;
  AQ::Server *v16;
  AQServer *AQServer;
  _BYTE v18[8];
  _QWORD *v19;
  char v20;

  QueueAccessor::QueueAccessor((QueueAccessor *)v18, *(_DWORD *)(a1 + 40), (audit_token_t *)(a1 + 44), *(_BYTE *)(a1 + 80));
  v3 = (AudioQueueOwner *)v19;
  v4 = (AudioQueueObject *)v19[2];
  v5 = (std::__shared_weak_count *)*((_QWORD *)v4 + 64);
  if (v5 && (v6 = std::__shared_weak_count::lock(v5)) != 0)
  {
    v7 = v6;
    v8 = *((_QWORD *)v4 + 63);
    if (v8)
      v9 = (AQRemoteClient *)(v8 - 16);
    else
      v9 = 0;
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v7);
    }
    v13 = (unint64_t *)&v7->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  else
  {
    v9 = 0;
  }
  v15 = (AQOfflineMixerBase *)*((_QWORD *)v4 + 98);
  if (*(_DWORD *)(a1 + 76))
  {
    QueueAccessor::SetSessionPlayStateToStopped_PreDeletion((QueueAccessor *)v18, v2);
    AudioQueueObject::~AudioQueueObject(v4);
    v16 = (AQ::Server *)MEMORY[0x1A1B07B34]();
  }
  else
  {
    v16 = (AQ::Server *)AudioQueueObject::ScheduleDisposal(v4, 1);
    v19[2] = 0;
  }
  if (v20 && v19)
    v16 = (AQ::Server *)CADeprecated::CAMutex::Unlock((CADeprecated::CAMutex *)(v19 + 3));
  if (v15)
    v16 = (AQ::Server *)AQOfflineMixerBase::ConnectQueue(v15, *(_DWORD *)(a1 + 40), 0);
  AQServer = (AQServer *)getAQServer(v16);
  AQServer::QueueDisposed(AQServer, v9, v3);
}

uint64_t __AQServer_Start_block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned __int8 *v3;
  uint64_t result;
  _QWORD *v5;
  NSObject *v6;
  unsigned __int8 v7;
  float v8;
  float v9;
  float v10;
  _BYTE v11[8];
  uint64_t v12;
  char v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  QueueAccessor::QueueAccessor((QueueAccessor *)v11, *(_DWORD *)(a1 + 72), (audit_token_t *)(a1 + 76), *(_BYTE *)(a1 + 112));
  v2 = *(_QWORD *)(v12 + 16);
  v7 = 0;
  v8 = 0.0;
  v9 = 0.0;
  v10 = 1.0;
  if (*(_BYTE *)(v2 + 88))
    v3 = 0;
  else
    v3 = &v7;
  result = QueueAccessor::SetSessionPlayState((uint64_t)v11, 1, (uint64_t)v3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_5;
  if (!*(_DWORD *)(a1 + 64) || (v5 = *(_QWORD **)(v2 + 784)) == 0)
  {
    if (*(_BYTE *)(v2 + 88))
      goto LABEL_26;
    if (gAQMELogScope)
    {
      v6 = *(NSObject **)gAQMELogScope;
      if (!*(_QWORD *)gAQMELogScope)
      {
LABEL_22:
        if (v7 && v8 > 0.0)
        {
          AudioQueueObject::SetVolume2InitialValue(v2, v9);
        }
        else
        {
          AudioQueueObject::SetParameter((AudioQueueObject *)v2, 6u, v8);
          AudioQueueObject::SetParameter((AudioQueueObject *)v2, 5u, v10);
        }
LABEL_26:
        result = AudioQueueObject::Start(v2, (__int128 *)(a1 + 40), *(_DWORD *)(a1 + 108));
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
        if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
          result = QueueAccessor::SetSessionPlayState((uint64_t)v11, 0, 0);
        if (*(_BYTE *)(v2 + 88))
          goto LABEL_5;
        v5 = 0;
        if (v7 && v8 > 0.0)
        {
          AudioQueueObject::SetParameter((AudioQueueObject *)v2, 6u, v8);
          result = AudioQueueObject::SetParameter((AudioQueueObject *)v2, 5u, v10);
LABEL_5:
          v5 = 0;
          goto LABEL_6;
        }
        goto LABEL_6;
      }
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316418;
      v15 = "AQServer.cpp";
      v16 = 1024;
      v17 = 701;
      v18 = 1024;
      v19 = v7;
      v20 = 2048;
      v21 = v8;
      v22 = 2048;
      v23 = v9;
      v24 = 2048;
      v25 = v10;
      _os_log_impl(&dword_1A0F4D000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d Duck info: fromCM %d, %.3fs, level %.3f -> %.3f", buf, 0x36u);
    }
    goto LABEL_22;
  }
LABEL_6:
  if (v13 && v12)
    result = CADeprecated::CAMutex::Unlock((CADeprecated::CAMutex *)(v12 + 24));
  if (v5)
  {
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      result = AQOfflineMixerBase::ScheduleQueueStart(v5, *(_DWORD *)(a1 + 72), (uint64_t *)(a1 + 40));
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    }
  }
  return result;
}

uint64_t __AQServer_Prime_block_invoke(uint64_t a1)
{
  AudioQueueObject *v2;
  uint64_t result;
  _BYTE v4[8];
  uint64_t v5;
  char v6;

  QueueAccessor::QueueAccessor((QueueAccessor *)v4, *(_DWORD *)(a1 + 48), (audit_token_t *)(a1 + 52), *(_BYTE *)(a1 + 88));
  v2 = *(AudioQueueObject **)(v5 + 16);
  result = QueueAccessor::SetSessionPlayState((uint64_t)v4, 3, 0);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    result = AudioQueueObject::Prime(v2, *(_DWORD *)(a1 + 84), *(unsigned int **)(a1 + 40));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      result = QueueAccessor::SetSessionPlayState((uint64_t)v4, 0, 0);
  }
  if (v6)
  {
    if (v5)
      return CADeprecated::CAMutex::Unlock((CADeprecated::CAMutex *)(v5 + 24));
  }
  return result;
}

void __AQServer_Stop_block_invoke(uint64_t a1)
{
  AudioQueueObject *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;

  v6 = 0;
  QueueAccessor::QueueAccessor((QueueAccessor *)&v3, *(_DWORD *)(a1 + 40), (audit_token_t *)(a1 + 44), *(_BYTE *)(a1 + 80));
  v2 = *(AudioQueueObject **)(v4 + 16);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = AudioQueueObject::Stop(v2, *(_DWORD *)(a1 + 76) != 0, 0, &v6);
  if (v6)
  {
    QueueAccessor::SetSessionPlayState((uint64_t)&v3, 0, 0);
    if (v6 == 2)
      AudioQueueObject::PropertyChanged((__CFData **)v2, 1634824814, 0);
  }
  if (v5)
  {
    if (v4)
      CADeprecated::CAMutex::Unlock((CADeprecated::CAMutex *)(v4 + 24));
  }
}

uint64_t __AQServer_Pause_block_invoke(uint64_t a1)
{
  uint64_t result;
  _BYTE v3[8];
  uint64_t v4;
  char v5;

  QueueAccessor::QueueAccessor((QueueAccessor *)v3, *(_DWORD *)(a1 + 48), (audit_token_t *)(a1 + 52), *(_BYTE *)(a1 + 84));
  AudioQueueObject::BeginPause(*(AudioQueueObject **)(v4 + 16), *(uint64_t **)(a1 + 40), 0);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  result = QueueAccessor::SetSessionPlayState((uint64_t)v3, 2, 0);
  if (v5)
  {
    if (v4)
      return CADeprecated::CAMutex::Unlock((CADeprecated::CAMutex *)(v4 + 24));
  }
  return result;
}

void __AQServer_SetOfflineRenderFormat_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const AudioStreamBasicDescription *v3;
  const AudioChannelLayout *v4;
  int v5;
  AQ::Server *v6;
  int v7;
  uint64_t AQServer;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  _BYTE v14[8];
  uint64_t v15;
  char v16;

  QueueAccessor::QueueAccessor((QueueAccessor *)v14, *(_DWORD *)(a1 + 88), (audit_token_t *)(a1 + 92), *(_BYTE *)(a1 + 132));
  v2 = *(_QWORD *)(v15 + 16);
  if (*(_DWORD *)(a1 + 124))
    v3 = (const AudioStreamBasicDescription *)(a1 + 40);
  else
    v3 = 0;
  if (*(_DWORD *)(a1 + 128))
    v4 = *(const AudioChannelLayout **)(a1 + 80);
  else
    v4 = 0;
  v5 = *(unsigned __int8 *)(v2 + 667);
  v6 = (AQ::Server *)AudioQueueObject::SetOfflineRenderFormat(*(AudioQueueObject **)(v15 + 16), v3, v4, 0);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (_DWORD)v6;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v7 = *(unsigned __int8 *)(v2 + 667);
    if ((v5 != 0) != (*(_BYTE *)(v2 + 667) != 0))
    {
      AQServer = getAQServer(v6);
      AudioQueueObject::GetRemoteClient<AQ::Server::RemoteClientBase>(&v12, v2);
      (*(void (**)(uint64_t, uint64_t, uint64_t, BOOL))(*(_QWORD *)AQServer + 48))(AQServer, v12, v15, v7 != 0);
      v9 = v13;
      if (v13)
      {
        p_shared_owners = (unint64_t *)&v13->__shared_owners_;
        do
          v11 = __ldaxr(p_shared_owners);
        while (__stlxr(v11 - 1, p_shared_owners));
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
    }
  }
  if (v16)
  {
    if (v15)
      CADeprecated::CAMutex::Unlock((CADeprecated::CAMutex *)(v15 + 24));
  }
}

uint64_t __AQServer_MixerConnectQueue_block_invoke(uint64_t a1)
{
  uint64_t result;
  AQOfflineMixerBase *v3;

  result = BaseOpaqueObject::ResolveOpaqueRef();
  if (result
    && (v3 = (AQOfflineMixerBase *)(result - 400),
        result = CheckCredentials(result - 400, (_QWORD *)(a1 + 44)),
        (_DWORD)result))
  {
    result = AQOfflineMixerBase::ConnectQueue(v3, *(_DWORD *)(a1 + 76), *(_DWORD *)(a1 + 80) != 0);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -50;
  }
  return result;
}

@end
