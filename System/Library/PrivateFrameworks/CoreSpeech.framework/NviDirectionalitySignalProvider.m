@implementation NviDirectionalitySignalProvider

- (unint64_t)sigType
{
  return 4;
}

- (BOOL)receiveOnlyProcessedChannelData
{
  return 0;
}

- (NviDirectionalitySignalProvider)initWithDataSource:(id)a3 assetsProvider:(id)a4
{
  id v7;
  id v8;
  NviDirectionalitySignalProvider *v9;
  NviDirectionalitySignalProvider *v10;
  uint64_t v11;
  NSHashTable *delegates;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  NSObject *v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  NviDirectionalitySignalProvider *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NviDirectionalitySignalProvider;
  v9 = -[NviDirectionalitySignalProvider init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSrc, a3);
    objc_storeStrong((id *)&v10->_assetsProvider, a4);
    v10->_currReqFirstSampleId = -1;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    delegates = v10->_delegates;
    v10->_delegates = (NSHashTable *)v11;

    v13 = dispatch_queue_create("com.apple.nvi.sigprov.dir", 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    v15 = NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[NviDirectionalitySignalProvider initWithDataSource:assetsProvider:]";
      v20 = 2048;
      v21 = v10;
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s nvidir=%p", buf, 0x16u);
    }
  }

  return v10;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  NviDirectionalitySignalProvider *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[NviDirectionalitySignalProvider dealloc]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)NviDirectionalitySignalProvider;
  -[NviDirectionalitySignalProvider dealloc](&v4, sel_dealloc);
}

- (void)addDelegate:(id)a3
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
  v7[2] = __47__NviDirectionalitySignalProvider_addDelegate___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)removeDelegate:(id)a3
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
  v7[2] = __50__NviDirectionalitySignalProvider_removeDelegate___block_invoke;
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
  block[2] = __71__NviDirectionalitySignalProvider_startWithNviContext_didStartHandler___block_invoke;
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
  v7[2] = __58__NviDirectionalitySignalProvider_stopWithDidStopHandler___block_invoke;
  v7[3] = &unk_1E7C29150;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__NviDirectionalitySignalProvider_reset__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioChunkAvailable:(id)a3 numChannels:(unint64_t)a4 numSamplesPerChannel:(unint64_t)a5 startSampleId:(unint64_t)a6 atAbsMachTimestamp:(unint64_t)a7
{
  id v11;
  NSObject *queue;
  id v13;
  _QWORD block[5];
  id v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v11 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __121__NviDirectionalitySignalProvider_audioChunkAvailable_numChannels_numSamplesPerChannel_startSampleId_atAbsMachTimestamp___block_invoke;
  block[3] = &unk_1E7C24D68;
  block[4] = self;
  v15 = v11;
  v16 = a5;
  v17 = a6;
  v18 = a4;
  v13 = v11;
  dispatch_async(queue, block);

}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  NviDirectionalitySignalProvider *v10;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__NviDirectionalitySignalProvider_request_didProduceResult___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "-[NviDirectionalitySignalProvider request:didFailWithError:]";
    v10 = 2114;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s request: %{public}@, returnedError: %{public}@", (uint8_t *)&v8, 0x20u);
  }

}

- (NviAudioDataSource)dataSrc
{
  return self->_dataSrc;
}

- (void)setDataSrc:(id)a3
{
  objc_storeStrong((id *)&self->_dataSrc, a3);
}

- (NviAssetsProvider)assetsProvider
{
  return self->_assetsProvider;
}

- (void)setAssetsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_assetsProvider, a3);
}

- (NviContext)nviCtx
{
  return self->_nviCtx;
}

- (void)setNviCtx:(id)a3
{
  objc_storeStrong((id *)&self->_nviCtx, a3);
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (SNAudioStreamAnalyzer)snAudioStreamAnalyzer
{
  return self->_snAudioStreamAnalyzer;
}

- (void)setSnAudioStreamAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_snAudioStreamAnalyzer, a3);
}

- (float)dirAzimuthEMAParam
{
  return self->_dirAzimuthEMAParam;
}

- (void)setDirAzimuthEMAParam:(float)a3
{
  self->_dirAzimuthEMAParam = a3;
}

- (int64_t)currReqFirstSampleId
{
  return self->_currReqFirstSampleId;
}

- (void)setCurrReqFirstSampleId:(int64_t)a3
{
  self->_currReqFirstSampleId = a3;
}

- (unint64_t)currNumSamplesProcessed
{
  return self->_currNumSamplesProcessed;
}

- (void)setCurrNumSamplesProcessed:(unint64_t)a3
{
  self->_currNumSamplesProcessed = a3;
}

- (float)currEstimatedAzimuth
{
  return self->_currEstimatedAzimuth;
}

- (void)setCurrEstimatedAzimuth:(float)a3
{
  self->_currEstimatedAzimuth = a3;
}

- (NviDirectionalitySignalData)dirSigData
{
  return self->_dirSigData;
}

- (void)setDirSigData:(id)a3
{
  objc_storeStrong((id *)&self->_dirSigData, a3);
}

- (NviDataLogger)sigDataWriter
{
  return self->_sigDataWriter;
}

- (void)setSigDataWriter:(id)a3
{
  objc_storeStrong((id *)&self->_sigDataWriter, a3);
}

- (BOOL)doneProcessing
{
  return self->_doneProcessing;
}

- (void)setDoneProcessing:(BOOL)a3
{
  self->_doneProcessing = a3;
}

- (NviAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setAudioFileWriter:(id)a3
{
  objc_storeStrong((id *)&self->_audioFileWriter, a3);
}

- (NSMutableDictionary)azDistribution
{
  return self->_azDistribution;
}

- (void)setAzDistribution:(id)a3
{
  objc_storeStrong((id *)&self->_azDistribution, a3);
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
  objc_storeStrong((id *)&self->_azDistribution, 0);
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_sigDataWriter, 0);
  objc_storeStrong((id *)&self->_dirSigData, 0);
  objc_storeStrong((id *)&self->_snAudioStreamAnalyzer, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_nviCtx, 0);
  objc_storeStrong((id *)&self->_assetsProvider, 0);
  objc_storeStrong((id *)&self->_dataSrc, 0);
}

void __60__NviDirectionalitySignalProvider_request_didProduceResult___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  float v8;
  float v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "timeRange");
    v3 = *(void **)(a1 + 32);
    v4 = v33;
    if (v3)
    {
      objc_msgSend(v3, "timeRange");
      v5 = *((_QWORD *)&v31 + 1);
      v6 = *(void **)(a1 + 32);
      goto LABEL_6;
    }
  }
  else
  {
    v4 = 0;
    v34 = 0u;
    v35 = 0u;
    v33 = 0u;
  }
  v6 = 0;
  v5 = 0;
  v31 = 0u;
  v32 = 0u;
  v30 = 0u;
LABEL_6:
  v7 = v5 + v4;
  v8 = *(float *)(*(_QWORD *)(a1 + 40) + 12);
  objc_msgSend(v6, "azimuth");
  *(float *)(*(_QWORD *)(a1 + 40) + 16) = (float)((float)(1.0 - *(float *)(*(_QWORD *)(a1 + 40) + 12))
                                                  * *(float *)(*(_QWORD *)(a1 + 40) + 16))
                                          + (float)(v8 * v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "setSigGenTs:", mach_absolute_time());
  v10 = *(void **)(a1 + 32);
  if (v10)
  {
    objc_msgSend(v10, "timeRange");
    v11 = v27;
  }
  else
  {
    v11 = 0;
    v28 = 0u;
    v29 = 0u;
    v27 = 0u;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "setStartSample:", v11);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "setEndSample:", v7);
  objc_msgSend(*(id *)(a1 + 32), "azimuth");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "setAzimuth:");
  v12 = *(_QWORD *)(a1 + 40);
  LODWORD(v13) = *(_DWORD *)(v12 + 16);
  objc_msgSend(*(id *)(v12 + 80), "setEstimatedAzimuth:", v13);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "setProcessedAudioDurMs:", (double)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 72)/ (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "sampleRate"))* 1000.0);
  objc_msgSend(*(id *)(a1 + 32), "spatialSpectrum");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "setSpatialSpectrumData:", v14);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = *(id *)(*(_QWORD *)(a1 + 40) + 48);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "signalProvider:hasSignalData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80), (_QWORD)v23);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
    }
    while (v17);
  }

  v20 = *(_QWORD *)(a1 + 40);
  v21 = *(void **)(v20 + 88);
  objc_msgSend(*(id *)(v20 + 80), "stringForLogging");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "logData:", v22);

}

void __121__NviDirectionalitySignalProvider_audioChunkAvailable_numChannels_numSamplesPerChannel_startSampleId_atAbsMachTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  float *v25;
  __int16 *v26;
  int v27;
  int v28;
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    v3 = *(void **)(v1 + 96);
    objc_msgSend(*(id *)(a1 + 40), "rawMicChannelsDataWithNumSamplesPerChannel:", *(_QWORD *)(a1 + 48));
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "addSamples:numSamples:", objc_msgSend(v4, "bytes"), *(_QWORD *)(a1 + 48));

    v5 = *(_QWORD *)(a1 + 32);
    if ((*(_QWORD *)(v5 + 64) & 0x8000000000000000) != 0)
    {
      *(_QWORD *)(v5 + 64) = *(_QWORD *)(a1 + 56);
      v6 = (void *)NviLogContextFacility;
      if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(void **)(a1 + 40);
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
        v9 = *(_QWORD *)(a1 + 64);
        v10 = *(_QWORD *)(a1 + 48);
        v11 = v6;
        v28 = 136316162;
        v29 = "-[NviDirectionalitySignalProvider audioChunkAvailable:numChannels:numSamplesPerChannel:startSampleId:atAbs"
              "MachTimestamp:]_block_invoke";
        v30 = 2050;
        v31 = v8;
        v32 = 2050;
        v33 = v9;
        v34 = 2050;
        v35 = v10;
        v36 = 2050;
        v37 = objc_msgSend(v7, "length");
        _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s Dir: firstSample: %{public}lu, numChannels=%{public}lu, numSamplesPerChannel: %{public}lu, length: %{public}lu", (uint8_t *)&v28, 0x34u);

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "rawMicChannelsDataWithNumSamplesPerChannel:", *(_QWORD *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89A58]), "initWithLayoutTag:", 7208966);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initStandardFormatWithSampleRate:channelLayout:", v13, (double)(unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "sampleRate"));
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AC0]), "initWithPCMFormat:frameCapacity:", v14, *(unsigned int *)(a1 + 48));
    objc_msgSend(v15, "setFrameLength:", *(unsigned int *)(a1 + 48));
    v16 = *(_QWORD *)(a1 + 48);
    v17 = +[NviConstants numChannelsForNviDirectionality](NviConstants, "numChannelsForNviDirectionality");
    if (v17)
    {
      v18 = 0;
      v19 = 0;
      v20 = 2 * v16;
      v21 = v17;
      do
      {
        v22 = objc_msgSend(objc_retainAutorelease(v12), "bytes");
        v23 = objc_msgSend(v15, "mutableAudioBufferList");
        v24 = *(_QWORD *)(a1 + 48);
        if (v24)
        {
          v25 = *(float **)(v23 + 16 * v19 + 16);
          v26 = (__int16 *)(v22 + v18);
          do
          {
            v27 = *v26++;
            *v25++ = (float)v27 / 32767.0;
            --v24;
          }
          while (v24);
        }
        ++v19;
        v18 += v20;
      }
      while (v19 != v21);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "analyzeAudioBuffer:atAudioFramePosition:", v15, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) += *(_QWORD *)(a1 + 48);

  }
}

uint64_t __40__NviDirectionalitySignalProvider_reset__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 72) = 0;
  *(_DWORD *)(*(_QWORD *)(result + 32) + 16) = 0;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = 0;
  return result;
}

uint64_t __58__NviDirectionalitySignalProvider_stopWithDidStopHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeReceiver:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "endRequest");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 88);
  *(_QWORD *)(v2 + 88) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "endAudio");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __71__NviDirectionalitySignalProvider_startWithNviContext_didStartHandler___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  NSObject *v14;
  NviDirectionalitySignalData *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NviAudioFileWriter *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NviDataLogger *v28;
  uint64_t v29;
  void *v30;
  _OWORD v31[2];
  uint64_t v32;
  _OWORD v33[2];
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  id v38;
  uint8_t buf[32];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "dirAzimuthEMAParam");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) = v2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = -1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = 0;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89A58]), "initWithLayoutTag:", 7208966);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initStandardFormatWithSampleRate:channelLayout:", v3, (double)(unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "sampleRate"));
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD7538]), "initWithFormat:", v4);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v5;

  v8 = objc_alloc_init(MEMORY[0x1E0CD7570]);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 56);
  v38 = 0;
  v11 = objc_msgSend(v10, "addRequest:withObserver:error:", v8, v9, &v38);
  v12 = v38;
  v13 = v12;
  if (!v11 || v12)
  {
    v14 = NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[NviDirectionalitySignalProvider startWithNviContext:didStartHandler:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s Failed to create Directionality req: %@", buf, 0x16u);
    }
  }
  v15 = -[NviSignalData initWithSignalType:timestamp:]([NviDirectionalitySignalData alloc], "initWithSignalType:timestamp:", 4, mach_absolute_time());
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 80);
  *(_QWORD *)(v16 + 80) = v15;

  if (NviIsInternalBuild_onceToken != -1)
    dispatch_once(&NviIsInternalBuild_onceToken, &__block_literal_global_8_13250);
  if (NviIsInternalBuild_isInternal
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isDirectionalityLoggingEnabled"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "rootLogDir");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingPathComponent:", CFSTR("dir.wav"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    memset(buf, 0, sizeof(buf));
    +[NviConstants nviDirectionalityLpcmNonInterleavedASBD](NviConstants, "nviDirectionalityLpcmNonInterleavedASBD");
    v37 = 0;
    v35 = 0u;
    v36 = 0u;
    +[NviConstants nviDirectionalityLpcmInterleavedASBD](NviConstants, "nviDirectionalityLpcmInterleavedASBD");
    v21 = [NviAudioFileWriter alloc];
    v33[0] = *(_OWORD *)buf;
    v33[1] = *(_OWORD *)&buf[16];
    v34 = v40;
    v31[0] = v35;
    v31[1] = v36;
    v32 = v37;
    v22 = -[NviAudioFileWriter initWithURL:inputFormat:outputFormat:](v21, "initWithURL:inputFormat:outputFormat:", v20, v33, v31);
    v23 = *(_QWORD *)(a1 + 32);
    v24 = *(void **)(v23 + 96);
    *(_QWORD *)(v23 + 96) = v22;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "rootLogDir");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringByAppendingPathComponent:", CFSTR("dir.data"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    +[NviDirectionalitySignalData headerString](NviDirectionalitySignalData, "headerString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[NviDataLogger initWithFilePath:appendHdr:]([NviDataLogger alloc], "initWithFilePath:appendHdr:", v26, v27);
    v29 = *(_QWORD *)(a1 + 32);
    v30 = *(void **)(v29 + 88);
    *(_QWORD *)(v29 + 88) = v28;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addReceiver:");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __50__NviDirectionalitySignalProvider_removeDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __47__NviDirectionalitySignalProvider_addDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
}

@end
