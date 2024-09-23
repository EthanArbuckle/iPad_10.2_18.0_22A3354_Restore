@implementation BKUIPearlAudioSession

+ (id)_loadSound:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  char v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", v4, CFSTR("caf"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v18 = 0;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89A98]), "initForReading:error:", v6, &v18);
    v8 = v18;
    if (v7)
    {
      v9 = objc_alloc(MEMORY[0x1E0C89AC0]);
      objc_msgSend(v7, "processingFormat");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "initWithPCMFormat:frameCapacity:", v10, objc_msgSend(v7, "length"));

      v17 = v8;
      v12 = objc_msgSend(v7, "readIntoBuffer:error:", v11, &v17);
      v13 = v17;

      if ((v12 & 1) != 0)
      {
        v11 = v11;
        v14 = v11;
      }
      else
      {
        _BKUILoggingFacility();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v13;
          _os_log_impl(&dword_1DB281000, v15, OS_LOG_TYPE_DEFAULT, "Failed to read audio file into buffer: %@", buf, 0xCu);
        }

        v14 = 0;
      }
    }
    else
    {
      _BKUILoggingFacility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_impl(&dword_1DB281000, v11, OS_LOG_TYPE_DEFAULT, "Failed to create audio file: %@", buf, 0xCu);
      }
      v14 = 0;
      v13 = v8;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BKUIPearlAudioSession)init
{
  BKUIPearlAudioSession *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *avPlayerNodeOperationQueue;
  uint64_t v5;
  AVAudioPCMBuffer *lockSoundBuffer;
  uint64_t v7;
  AVAudioPCMBuffer *scanSoundBuffer;
  uint64_t v9;
  AVAudioPCMBuffer *completeSoundBuffer;
  uint64_t v11;
  AVAudioPCMBuffer *endSoundBuffer;
  uint64_t v13;
  AVAudioPCMBuffer *failSoundBuffer;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  void *v24;
  void *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)BKUIPearlAudioSession;
  v2 = -[BKUIPearlAudioSession init](&v27, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.biometrickitui.avPlayerNodeOperationQueue", 0);
    avPlayerNodeOperationQueue = v2->_avPlayerNodeOperationQueue;
    v2->_avPlayerNodeOperationQueue = (OS_dispatch_queue *)v3;

    +[BKUIPearlAudioSession _loadSound:](BKUIPearlAudioSession, "_loadSound:", CFSTR("PearlEnrollment_Lock-D22"));
    v5 = objc_claimAutoreleasedReturnValue();
    lockSoundBuffer = v2->_lockSoundBuffer;
    v2->_lockSoundBuffer = (AVAudioPCMBuffer *)v5;

    +[BKUIPearlAudioSession _loadSound:](BKUIPearlAudioSession, "_loadSound:", CFSTR("PearlEnrollment_Scan-D22"));
    v7 = objc_claimAutoreleasedReturnValue();
    scanSoundBuffer = v2->_scanSoundBuffer;
    v2->_scanSoundBuffer = (AVAudioPCMBuffer *)v7;

    +[BKUIPearlAudioSession _loadSound:](BKUIPearlAudioSession, "_loadSound:", CFSTR("PearlEnrollment_Complete-D22"));
    v9 = objc_claimAutoreleasedReturnValue();
    completeSoundBuffer = v2->_completeSoundBuffer;
    v2->_completeSoundBuffer = (AVAudioPCMBuffer *)v9;

    +[BKUIPearlAudioSession _loadSound:](BKUIPearlAudioSession, "_loadSound:", CFSTR("PearlEnrollment_End-D22"));
    v11 = objc_claimAutoreleasedReturnValue();
    endSoundBuffer = v2->_endSoundBuffer;
    v2->_endSoundBuffer = (AVAudioPCMBuffer *)v11;

    +[BKUIPearlAudioSession _loadSound:](BKUIPearlAudioSession, "_loadSound:", CFSTR("PearlEnrollment_Fail-D22"));
    v13 = objc_claimAutoreleasedReturnValue();
    failSoundBuffer = v2->_failSoundBuffer;
    v2->_failSoundBuffer = (AVAudioPCMBuffer *)v13;

    -[BKUIPearlAudioSession _setupMediaStack](v2, "_setupMediaStack");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      _BKUILoggingFacility();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[BKUIPearlAudioSession init].cold.1((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);

      v23 = 0;
    }
    else
    {
      v23 = 1;
    }
    v2->_mediaServicesConnected = v23;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v2, sel__mediaServicesReconnect_, *MEMORY[0x1E0C89738], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v2, sel__mediaServicesConnectionWasLost_, *MEMORY[0x1E0C89730], 0);

  }
  return v2;
}

- (void)scheduleBuffer:(id)a3 atTime:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *avPlayerNodeOperationQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  avPlayerNodeOperationQueue = self->_avPlayerNodeOperationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__BKUIPearlAudioSession_scheduleBuffer_atTime_options_completionHandler___block_invoke;
  block[3] = &unk_1EA280D60;
  block[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a5;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(avPlayerNodeOperationQueue, block);

}

_QWORD *__73__BKUIPearlAudioSession_scheduleBuffer_atTime_options_completionHandler___block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = result[4];
  if (*(_BYTE *)(v1 + 72))
    return (_QWORD *)objc_msgSend(*(id *)(v1 + 16), "scheduleBuffer:atTime:options:completionHandler:", result[5], result[6], result[8], result[7]);
  return result;
}

- (void)scheduleBuffer:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *avPlayerNodeOperationQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  avPlayerNodeOperationQueue = self->_avPlayerNodeOperationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__BKUIPearlAudioSession_scheduleBuffer_completionHandler___block_invoke;
  block[3] = &unk_1EA27FDA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(avPlayerNodeOperationQueue, block);

}

_QWORD *__58__BKUIPearlAudioSession_scheduleBuffer_completionHandler___block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = result[4];
  if (*(_BYTE *)(v1 + 72))
    return (_QWORD *)objc_msgSend(*(id *)(v1 + 16), "scheduleBuffer:completionHandler:", result[5], result[6]);
  return result;
}

- (void)play
{
  NSObject *avPlayerNodeOperationQueue;
  _QWORD block[5];

  avPlayerNodeOperationQueue = self->_avPlayerNodeOperationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__BKUIPearlAudioSession_play__block_invoke;
  block[3] = &unk_1EA27FB98;
  block[4] = self;
  dispatch_async(avPlayerNodeOperationQueue, block);
}

uint64_t __29__BKUIPearlAudioSession_play__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 72))
  {
    v1 = result;
    _BKUILoggingFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1DB281000, v2, OS_LOG_TYPE_DEFAULT, "Audio node play called.", v3, 2u);
    }

    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 16), "play");
  }
  return result;
}

- (void)stop
{
  NSObject *avPlayerNodeOperationQueue;
  _QWORD block[5];

  avPlayerNodeOperationQueue = self->_avPlayerNodeOperationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__BKUIPearlAudioSession_stop__block_invoke;
  block[3] = &unk_1EA27FB98;
  block[4] = self;
  dispatch_async(avPlayerNodeOperationQueue, block);
}

uint64_t __29__BKUIPearlAudioSession_stop__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 72))
  {
    v1 = result;
    _BKUILoggingFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1DB281000, v2, OS_LOG_TYPE_DEFAULT, "Audio node stop called.", v3, 2u);
    }

    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 16), "stop");
  }
  return result;
}

- (void)_mediaServicesReconnect:(id)a3
{
  NSObject *avPlayerNodeOperationQueue;
  _QWORD block[5];

  avPlayerNodeOperationQueue = self->_avPlayerNodeOperationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__BKUIPearlAudioSession__mediaServicesReconnect___block_invoke;
  block[3] = &unk_1EA27FB98;
  block[4] = self;
  dispatch_async(avPlayerNodeOperationQueue, block);
}

void __49__BKUIPearlAudioSession__mediaServicesReconnect___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11[16];

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 72))
  {
    _BKUILoggingFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DB281000, v2, OS_LOG_TYPE_DEFAULT, "_mediaServicesReconnect called", v11, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_setupMediaStack");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      _BKUILoggingFacility();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __49__BKUIPearlAudioSession__mediaServicesReconnect___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
    }

  }
}

- (void)_mediaServicesConnectionWasLost:(id)a3
{
  NSObject *v4;
  NSObject *avPlayerNodeOperationQueue;
  _QWORD block[5];
  uint8_t buf[16];

  _BKUILoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB281000, v4, OS_LOG_TYPE_DEFAULT, "_mediaServicesConnectionWasLost called, niling cleaning up media stack", buf, 2u);
  }

  self->_mediaServicesConnected = 0;
  avPlayerNodeOperationQueue = self->_avPlayerNodeOperationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__BKUIPearlAudioSession__mediaServicesConnectionWasLost___block_invoke;
  block[3] = &unk_1EA27FB98;
  block[4] = self;
  dispatch_async(avPlayerNodeOperationQueue, block);
}

void __57__BKUIPearlAudioSession__mediaServicesConnectionWasLost___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stop");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "detachNode:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = 0;

}

- (id)_setupMediaStack
{
  AVAudioPlayerNode *v3;
  AVAudioPlayerNode *audioNode;
  AVAudioEngine *v5;
  AVAudioEngine *audioEngine;
  AVAudioEngine *v7;
  AVAudioPlayerNode *v8;
  void *v9;
  void *v10;
  AVAudioEngine *v11;
  id v13;

  v3 = (AVAudioPlayerNode *)objc_alloc_init(MEMORY[0x1E0C89AD8]);
  audioNode = self->_audioNode;
  self->_audioNode = v3;

  v5 = (AVAudioEngine *)objc_alloc_init(MEMORY[0x1E0C89A88]);
  audioEngine = self->_audioEngine;
  self->_audioEngine = v5;

  -[AVAudioEngine attachNode:](self->_audioEngine, "attachNode:", self->_audioNode);
  v7 = self->_audioEngine;
  v8 = self->_audioNode;
  -[AVAudioEngine mainMixerNode](v7, "mainMixerNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAudioPCMBuffer format](self->_lockSoundBuffer, "format");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAudioEngine connect:to:format:](v7, "connect:to:format:", v8, v9, v10);

  v11 = self->_audioEngine;
  v13 = 0;
  -[AVAudioEngine startAndReturnError:](v11, "startAndReturnError:", &v13);
  return v13;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[16];

  _BKUILoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB281000, v3, OS_LOG_TYPE_DEFAULT, "BKUIPearlAudioSession dealloc.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  self->_mediaServicesConnected = 0;
  -[AVAudioEngine stop](self->_audioEngine, "stop");
  -[AVAudioEngine detachNode:](self->_audioEngine, "detachNode:", self->_audioNode);
  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlAudioSession;
  -[BKUIPearlAudioSession dealloc](&v5, sel_dealloc);
}

- (AVAudioEngine)audioEngine
{
  return self->_audioEngine;
}

- (AVAudioPCMBuffer)lockSoundBuffer
{
  return self->_lockSoundBuffer;
}

- (AVAudioPCMBuffer)scanSoundBuffer
{
  return self->_scanSoundBuffer;
}

- (AVAudioPCMBuffer)completeSoundBuffer
{
  return self->_completeSoundBuffer;
}

- (AVAudioPCMBuffer)endSoundBuffer
{
  return self->_endSoundBuffer;
}

- (AVAudioPCMBuffer)failSoundBuffer
{
  return self->_failSoundBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avPlayerNodeOperationQueue, 0);
  objc_storeStrong((id *)&self->_failSoundBuffer, 0);
  objc_storeStrong((id *)&self->_endSoundBuffer, 0);
  objc_storeStrong((id *)&self->_completeSoundBuffer, 0);
  objc_storeStrong((id *)&self->_scanSoundBuffer, 0);
  objc_storeStrong((id *)&self->_lockSoundBuffer, 0);
  objc_storeStrong((id *)&self->_audioNode, 0);
  objc_storeStrong((id *)&self->_audioEngine, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_2_0(&dword_1DB281000, a2, a3, "Failed to start audio engine: %@", a5, a6, a7, a8, 2u);
}

void __49__BKUIPearlAudioSession__mediaServicesReconnect___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1DB281000, a2, a3, "Failed to start audio engine for _mediaServicesReconnect: %@", a5, a6, a7, a8, 2u);
}

@end
