@implementation NviCSAudioDataSource

- (NviCSAudioDataSource)init
{
  NviCSAudioDataSource *v2;
  uint64_t v3;
  NSHashTable *receivers;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NviCSAudioDataSource;
  v2 = -[NviCSAudioDataSource init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    receivers = v2->_receivers;
    v2->_receivers = (NSHashTable *)v3;

    -[NviCSAudioDataSource _createAudioStreamWithCurrentNviContext](v2, "_createAudioStreamWithCurrentNviContext");
    v5 = dispatch_queue_create("com.apple.nvi.csaudiosrc", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (unint64_t)type
{
  return 0;
}

- (unint64_t)numBytesPerSample
{
  return objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleByteDepth");
}

- (unint64_t)sampleRate
{
  float v2;

  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  return (unint64_t)v2;
}

- (void)addReceiver:(id)a3
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
  v7[2] = __36__NviCSAudioDataSource_addReceiver___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)removeReceiver:(id)a3
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
  v7[2] = __39__NviCSAudioDataSource_removeReceiver___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)startWithNviContext:(id)a3 didStartHandler:(id)a4
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
  block[2] = __60__NviCSAudioDataSource_startWithNviContext_didStartHandler___block_invoke;
  block[3] = &unk_1E7C28EC8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)stopWithDidStopHandler:(id)a3
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
  v7[2] = __47__NviCSAudioDataSource_stopWithDidStopHandler___block_invoke;
  v7[3] = &unk_1E7C29150;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_createAudioStreamWithCurrentNviContext
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  CSAudioStream *v15;
  id v16;
  CSAudioStream *audioStream;
  NSObject *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19008], "contextForBuiltInVoiceTrigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0D19030]);
  objc_msgSend(v4, "setRequestHistoricalAudioDataSampleCount:", 1);
  -[NviContext voiceTriggerInfo](self->_nviCtx, "voiceTriggerInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("triggerStartSampleCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStartRecordingSampleCount:", v6);

  +[CSSpeechManager sharedManager](CSSpeechManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v7, "audioProviderWithContext:error:", v3, &v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v20;

  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0D19058];
    v11 = v8;
    objc_msgSend(v10, "defaultRequestWithContext:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRequiresHistoricalBuffer:", 1);
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v9;
    objc_msgSend(v11, "audioStreamWithRequest:streamName:error:", v12, v14, &v19);
    v15 = (CSAudioStream *)objc_claimAutoreleasedReturnValue();

    v16 = v19;
    audioStream = self->_audioStream;
    self->_audioStream = v15;

    -[CSAudioStream setDelegate:](self->_audioStream, "setDelegate:", self);
    v9 = v16;
  }
  else
  {
    v18 = NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[NviCSAudioDataSource _createAudioStreamWithCurrentNviContext]";
      v23 = 2114;
      v24 = v9;
      _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s audioProvider == nil, error : %{public}@", buf, 0x16u);
    }
  }

}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__NviCSAudioDataSource_audioStreamProvider_audioBufferAvailable___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)audioStreamProvider:(id)a3 avBufferAvailable:(id)a4
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[NviCSAudioDataSource audioStreamProvider:avBufferAvailable:]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315650;
    v8 = "-[NviCSAudioDataSource audioStreamProvider:didStopStreamUnexpectedly:]";
    v9 = 2114;
    v10 = v5;
    v11 = 2050;
    v12 = a4;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s provider: %{public}@, unexpectedStop: %{public}ld", (uint8_t *)&v7, 0x20u);
  }

}

- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[NviCSAudioDataSource audioStreamProvider:audioChunkForTVAvailable:]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
}

- (NviContext)nviCtx
{
  return self->_nviCtx;
}

- (void)setNviCtx:(id)a3
{
  objc_storeStrong((id *)&self->_nviCtx, a3);
}

- (NSHashTable)receivers
{
  return self->_receivers;
}

- (void)setReceivers:(id)a3
{
  objc_storeStrong((id *)&self->_receivers, a3);
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
  objc_storeStrong((id *)&self->_audioStream, a3);
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
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_receivers, 0);
  objc_storeStrong((id *)&self->_nviCtx, 0);
}

void __65__NviCSAudioDataSource_audioStreamProvider_audioBufferAvailable___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v7, "receiveOnlyProcessedChannelData", (_QWORD)v20))
        {
          objc_msgSend(*(id *)(a1 + 40), "dataForChannel:", objc_msgSend(MEMORY[0x1E0D19090], "channelForProcessedInput"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(*(id *)(a1 + 40), "numSamples");
          v10 = objc_msgSend(*(id *)(a1 + 40), "startSampleCount");
          v11 = objc_msgSend(*(id *)(a1 + 40), "hostTime");
          v12 = v7;
          v13 = v8;
          v14 = 1;
          v15 = v9;
          v16 = v10;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "data");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(*(id *)(a1 + 40), "numChannels");
          v18 = objc_msgSend(*(id *)(a1 + 40), "numSamples");
          v19 = objc_msgSend(*(id *)(a1 + 40), "startSampleCount");
          v11 = objc_msgSend(*(id *)(a1 + 40), "hostTime");
          v12 = v7;
          v13 = v8;
          v14 = v17;
          v15 = v18;
          v16 = v19;
        }
        objc_msgSend(v12, "audioChunkAvailable:numChannels:numSamplesPerChannel:startSampleId:atAbsMachTimestamp:", v13, v14, v15, v16, v11);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v4);
  }

}

void __47__NviCSAudioDataSource_stopWithDidStopHandler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__NviCSAudioDataSource_stopWithDidStopHandler___block_invoke_2;
  v3[3] = &unk_1E7C290D8;
  v4 = v1;
  objc_msgSend(v2, "stopAudioStreamWithOption:completion:", 0, v3);

}

void __47__NviCSAudioDataSource_stopWithDidStopHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315650;
      v8 = "-[NviCSAudioDataSource stopWithDidStopHandler:]_block_invoke_2";
      v9 = 1024;
      v10 = 0;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Stopped audioStream with result=%d, err=%@", (uint8_t *)&v7, 0x1Cu);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __60__NviCSAudioDataSource_startWithNviContext_didStartHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[3])
    objc_msgSend(v2, "_createAudioStreamWithCurrentNviContext");
  v3 = objc_alloc_init(MEMORY[0x1E0D19030]);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "requestHistoricalAudio"))
  {
    objc_msgSend(v3, "setRequestHistoricalAudioDataSampleCount:", 1);
    objc_msgSend(v3, "setStartRecordingSampleCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "reqStartAudioSampleId"));
  }
  else
  {
    objc_msgSend(v3, "setRequestHistoricalAudioDataSampleCount:", 0);
  }
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__NviCSAudioDataSource_startWithNviContext_didStartHandler___block_invoke_2;
  v6[3] = &unk_1E7C29128;
  v7 = v3;
  v8 = *(id *)(a1 + 48);
  v5 = v3;
  objc_msgSend(v4, "startAudioStreamWithOption:completion:", v5, v6);

}

void __60__NviCSAudioDataSource_startWithNviContext_didStartHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = (void *)NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      v9 = 136315906;
      v10 = "-[NviCSAudioDataSource startWithNviContext:didStartHandler:]_block_invoke_2";
      v11 = 2114;
      v12 = CFSTR("NO");
      v13 = 2114;
      v14 = v5;
      v15 = 2048;
      v16 = objc_msgSend(v7, "startRecordingSampleCount");
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Start audio stream successfully ? %{public}@, error : %{public}@, startRecordingSampleCount=%lu", (uint8_t *)&v9, 0x2Au);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __39__NviCSAudioDataSource_removeReceiver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __36__NviCSAudioDataSource_addReceiver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

@end
