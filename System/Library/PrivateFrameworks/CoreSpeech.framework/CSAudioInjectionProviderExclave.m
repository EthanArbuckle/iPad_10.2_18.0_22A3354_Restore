@implementation CSAudioInjectionProviderExclave

- (CSAudioInjectionProviderExclave)init
{
  CSAudioInjectionProviderExclave *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSAudioInjectionProviderExclave;
  v2 = -[CSAudioInjectionProviderExclave init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSAudioInjectionProviderExclave", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_isAudioQueueStarted = 0;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingBufferDuration");
    v2->_bufferDuration = v5;
  }
  return v2;
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CSAudioInjectionProviderExclave_start__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)speakAudioInExclave:(id)a3 withCompletion:(id)a4
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
  block[2] = __70__CSAudioInjectionProviderExclave_speakAudioInExclave_withCompletion___block_invoke;
  block[3] = &unk_1E7C28EC8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)_prepareAndStartAudioQueue
{
  os_log_t *v3;
  NSObject *v4;
  OSStatus v5;
  OSStatus v6;
  NSObject *v7;
  OSStatus v8;
  NSObject *v9;
  OSStatus v10;
  int v11;
  const char *v12;
  __int16 v13;
  OSStatus v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0D18F60];
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[CSAudioInjectionProviderExclave _prepareAndStartAudioQueue]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v11, 0xCu);
  }
  v5 = AudioQueueEnqueueBuffer(self->_exclaveAudioQueue, -[CSAudioInjectionProviderExclave _defaultBufferRef](self, "_defaultBufferRef"), 0, 0);
  if (v5)
  {
    v6 = v5;
    v7 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "-[CSAudioInjectionProviderExclave _prepareAndStartAudioQueue]";
      v13 = 1024;
      v14 = v6;
      _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s Failed to feed audio into exclave, unable to enqueue AQ buffer with OSStatus: %d", (uint8_t *)&v11, 0x12u);
    }
  }
  else
  {
    -[CSAudioInjectionProviderExclave _setAudioSessionActive:](self, "_setAudioSessionActive:", 1);
    v8 = AudioQueueStart(self->_exclaveAudioQueue, 0);
    v9 = *v3;
    if (v8)
    {
      v10 = v8;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
      {
        v11 = 136315394;
        v12 = "-[CSAudioInjectionProviderExclave _prepareAndStartAudioQueue]";
        v13 = 1024;
        v14 = v10;
        _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s Failed to feed audio into exclave, unable to start AQ buffer with OSStatus: %d", (uint8_t *)&v11, 0x12u);
      }
      -[CSAudioInjectionProviderExclave _setAudioSessionActive:](self, "_setAudioSessionActive:", 0);
    }
    else
    {
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315138;
        v12 = "-[CSAudioInjectionProviderExclave _prepareAndStartAudioQueue]";
        _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Successfully start the audio queue", (uint8_t *)&v11, 0xCu);
      }
      self->_isAudioQueueStarted = 1;
    }
  }
}

- (void)_readAudioBufferAndFeedIntoAudioQueue
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__CSAudioInjectionProviderExclave__readAudioBufferAndFeedIntoAudioQueue__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (AudioQueueBuffer)_defaultBufferRef
{
  double bufferDuration;
  double v4;
  unint64_t v5;
  double v6;
  unint64_t v7;
  unint64_t v8;
  OSStatus v9;
  OSStatus v10;
  NSObject *v11;
  AudioQueueBuffer *result;
  double v13;
  int v14;
  int v15;
  double v16;
  AudioQueueBufferRef outBuffer;
  int v18;
  int v19;
  double v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  OSStatus v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  bufferDuration = self->_bufferDuration;
  -[CSAudioInjectionProviderExclave _defaultOutASBD](self, "_defaultOutASBD");
  v4 = bufferDuration * v20;
  -[CSAudioInjectionProviderExclave _defaultOutASBD](self, "_defaultOutASBD");
  LODWORD(v5) = v19;
  v6 = v4 * (double)v5;
  -[CSAudioInjectionProviderExclave _defaultOutASBD](self, "_defaultOutASBD");
  LODWORD(v7) = v18;
  v8 = (unint64_t)(v6 * (double)v7);
  outBuffer = 0;
  v9 = AudioQueueAllocateBuffer(self->_exclaveAudioQueue, v8, &outBuffer);
  if (v9)
  {
    v10 = v9;
    v11 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[CSAudioInjectionProviderExclave _defaultBufferRef]";
      v23 = 1024;
      v24 = v10;
      _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s Unable to alloc AudioQueue AudioBuffer with OSStatus: %d", buf, 0x12u);
    }
    return 0;
  }
  else
  {
    memset(outBuffer->mAudioData, 1, v8);
    v13 = self->_bufferDuration;
    -[CSAudioInjectionProviderExclave _defaultOutASBD](self, "_defaultOutASBD");
    -[CSAudioInjectionProviderExclave _defaultOutASBD](self, "_defaultOutASBD");
    -[CSAudioInjectionProviderExclave _defaultOutASBD](self, "_defaultOutASBD");
    result = outBuffer;
    outBuffer->mAudioDataByteSize = v15 * (v13 * v16) * v14;
  }
  return result;
}

- (void)_createAudioQueueIfNeeded
{
  os_log_t *v3;
  NSObject *v4;
  OSStatus v5;
  OSStatus v6;
  NSObject *v7;
  AudioQueueRef outAQ;
  uint8_t v9[4];
  const char *v10;
  __int16 v11;
  OSStatus v12;
  AudioStreamBasicDescription buf;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0D18F60];
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.mSampleRate) = 136315138;
    *(_QWORD *)((char *)&buf.mSampleRate + 4) = "-[CSAudioInjectionProviderExclave _createAudioQueueIfNeeded]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }
  if (!self->_exclaveAudioQueue)
  {
    outAQ = 0;
    memset(&buf, 0, sizeof(buf));
    -[CSAudioInjectionProviderExclave _defaultOutASBD](self, "_defaultOutASBD");
    v5 = AudioQueueNewOutput(&buf, (AudioQueueOutputCallback)AQInjectionOutputCallback, self, 0, (CFStringRef)*MEMORY[0x1E0C9B270], 0x80000u, &outAQ);
    if (v5)
    {
      v6 = v5;
      v7 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v9 = 136315394;
        v10 = "-[CSAudioInjectionProviderExclave _createAudioQueueIfNeeded]";
        v11 = 1024;
        v12 = v6;
        _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s Failed to create Exclave Audio Injection AudioQueue with OSStatus error: %d", v9, 0x12u);
      }
    }
    else
    {
      self->_exclaveAudioQueue = outAQ;
    }
  }
}

- (void)_setAudioSessionActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  id v15;
  const char *v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    v17 = 0;
    objc_msgSend(v4, "setActive:error:", 0, &v17);
    v11 = v17;
    v12 = *MEMORY[0x1E0D18F60];
    if (v11)
    {
      v13 = v11;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
LABEL_11:

        goto LABEL_17;
      }
      *(_DWORD *)buf = 136315394;
      v21 = "-[CSAudioInjectionProviderExclave _setAudioSessionActive:]";
      v22 = 2112;
      v23 = v13;
      v14 = "%s Failed to deactivate audioSession with error: %@";
LABEL_19:
      _os_log_error_impl(&dword_1C2614000, v12, OS_LOG_TYPE_ERROR, v14, buf, 0x16u);
      goto LABEL_11;
    }
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_DWORD *)buf = 136315138;
    v21 = "-[CSAudioInjectionProviderExclave _setAudioSessionActive:]";
    v16 = "%s Successfully deactivate audioSession";
LABEL_16:
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
    goto LABEL_17;
  }
  v6 = *MEMORY[0x1E0C89690];
  v7 = *MEMORY[0x1E0C89748];
  v19 = 0;
  objc_msgSend(v4, "setCategory:mode:options:error:", v6, v7, 1, &v19);
  v8 = v19;
  if (!v8)
  {
    v18 = 0;
    objc_msgSend(v5, "setActive:error:", 1, &v18);
    v15 = v18;
    v12 = *MEMORY[0x1E0D18F60];
    if (v15)
    {
      v13 = v15;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_DWORD *)buf = 136315394;
      v21 = "-[CSAudioInjectionProviderExclave _setAudioSessionActive:]";
      v22 = 2112;
      v23 = v13;
      v14 = "%s Failed to activate audioSession with error: %@";
      goto LABEL_19;
    }
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_DWORD *)buf = 136315138;
    v21 = "-[CSAudioInjectionProviderExclave _setAudioSessionActive:]";
    v16 = "%s Successfully activate audioSession";
    goto LABEL_16;
  }
  v9 = v8;
  v10 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[CSAudioInjectionProviderExclave _setAudioSessionActive:]";
    v22 = 2112;
    v23 = v9;
    _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s Failed to set audioSession properties with error: %@", buf, 0x16u);
  }

LABEL_17:
}

- (AudioStreamBasicDescription)_defaultOutASBD
{
  AudioStreamBasicDescription *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  if (objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingIsFloat"))
    result = (AudioStreamBasicDescription *)objc_msgSend(MEMORY[0x1E0D190F8], "lpcmFloatASBD");
  else
    result = (AudioStreamBasicDescription *)objc_msgSend(MEMORY[0x1E0D190F8], "lpcmInt16ASBD");
  v5 = v7;
  *(_OWORD *)&retstr->mSampleRate = v6;
  *(_OWORD *)&retstr->mBytesPerPacket = v5;
  *(_QWORD *)&retstr->mBitsPerChannel = v8;
  return result;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OpaqueAudioQueue)exclaveAudioQueue
{
  return self->_exclaveAudioQueue;
}

- (void)setExclaveAudioQueue:(OpaqueAudioQueue *)a3
{
  self->_exclaveAudioQueue = a3;
}

- (BOOL)isAudioQueueStarted
{
  return self->_isAudioQueueStarted;
}

- (void)setIsAudioQueueStarted:(BOOL)a3
{
  self->_isAudioQueueStarted = a3;
}

- (double)bufferDuration
{
  return self->_bufferDuration;
}

- (void)setBufferDuration:(double)a3
{
  self->_bufferDuration = a3;
}

- (CSAudioInjectionFileOption)fileOption
{
  return self->_fileOption;
}

- (void)setFileOption:(id)a3
{
  objc_storeStrong((id *)&self->_fileOption, a3);
}

- (id)injectionCompletion
{
  return self->_injectionCompletion;
}

- (void)setInjectionCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)injectionStartTime
{
  return self->_injectionStartTime;
}

- (void)setInjectionStartTime:(unint64_t)a3
{
  self->_injectionStartTime = a3;
}

- (unint64_t)injectionEndTime
{
  return self->_injectionEndTime;
}

- (void)setInjectionEndTime:(unint64_t)a3
{
  self->_injectionEndTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_injectionCompletion, 0);
  objc_storeStrong((id *)&self->_fileOption, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __72__CSAudioInjectionProviderExclave__readAudioBufferAndFeedIntoAudioQueue__block_invoke(uint64_t a1)
{
  void *v2;
  os_log_t *v3;
  NSObject *v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  unint64_t v11;
  double v12;
  unint64_t v13;
  double v14;
  NSObject *v15;
  OSStatus v16;
  UInt32 v17;
  os_log_t v18;
  const char *v19;
  os_log_t v20;
  uint8_t *p_buf;
  unint64_t v22;
  OSStatus v23;
  UInt32 v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  void *v28;
  UInt32 v29;
  double v30;
  double v31;
  OSStatus v32;
  void *v33;
  UInt32 v34;
  void *v35;
  int v36;
  int v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  OpaqueAudioQueue *v45;
  OSStatus v46;
  OSStatus v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  int v51;
  double v52;
  UInt32 ioNumberFrames;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  AudioQueueBufferRef outBuffer;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  uint8_t v67[4];
  const char *v68;
  __int16 v69;
  uint64_t v70;
  AudioBufferList buf;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v3 = (os_log_t *)MEMORY[0x1E0D18F60];
  if (v2 && objc_msgSend(v2, "fFile"))
  {
    v4 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      buf.mNumberBuffers = 136315138;
      *(_QWORD *)(&buf.mNumberBuffers + 1) = "-[CSAudioInjectionProviderExclave _readAudioBufferAndFeedIntoAudioQueue]_block_invoke";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s AudioQueue call back is asking for audio, injected file has been found", (uint8_t *)&buf, 0xCu);
    }
    v5 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v5 + 24))
    {
      v20 = *v3;
      if (!os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        return;
      buf.mNumberBuffers = 136315138;
      *(_QWORD *)(&buf.mNumberBuffers + 1) = "-[CSAudioInjectionProviderExclave _readAudioBufferAndFeedIntoAudioQueue]_block_invoke";
      v19 = "%s Failed to feed audio into exclave, unable to locate available audio queue";
      p_buf = (uint8_t *)&buf;
      goto LABEL_52;
    }
    v6 = *(double *)(v5 + 32);
    v7 = *(void **)(v5 + 40);
    if (v7)
    {
      objc_msgSend(v7, "outASBD");
      v5 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v5 + 40);
      v9 = v6 * *(double *)&v64;
      if (v8)
      {
        objc_msgSend(v8, "outASBD");
        v5 = *(_QWORD *)(a1 + 32);
        v10 = *(void **)(v5 + 40);
        LODWORD(v11) = DWORD2(v62);
        v12 = v9 * (double)v11;
        if (v10)
        {
          objc_msgSend(v10, "outASBD");
          v5 = *(_QWORD *)(a1 + 32);
          LODWORD(v13) = HIDWORD(v59);
          v14 = (double)v13;
          goto LABEL_20;
        }
LABEL_19:
        v60 = 0;
        v58 = 0u;
        v59 = 0u;
        v14 = 0.0;
LABEL_20:
        v22 = (unint64_t)(v12 * v14);
        outBuffer = 0;
        v23 = AudioQueueAllocateBuffer(*(AudioQueueRef *)(v5 + 24), v22, &outBuffer);
        if (v23)
        {
          v24 = v23;
          v18 = *v3;
          if (!os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
            return;
          buf.mNumberBuffers = 136315394;
          *(_QWORD *)(&buf.mNumberBuffers + 1) = "-[CSAudioInjectionProviderExclave _readAudioBufferAndFeedIntoAudioQueue]_block_invoke";
          LOWORD(buf.mBuffers[0].mDataByteSize) = 1024;
          *(UInt32 *)((char *)&buf.mBuffers[0].mDataByteSize + 2) = v24;
          v19 = "%s Failed to feed audio into exclave, unable to alloc AudioQueue AudioBuffer with OSStatus: %d";
          goto LABEL_23;
        }
        memset(outBuffer->mAudioData, 1, v22);
        *(_QWORD *)&buf.mNumberBuffers = 1;
        v27 = *(_QWORD *)(a1 + 32);
        v28 = *(void **)(v27 + 40);
        if (v28)
        {
          objc_msgSend(v28, "outASBD");
          v29 = HIDWORD(v55);
          v27 = *(_QWORD *)(a1 + 32);
          v28 = *(void **)(v27 + 40);
        }
        else
        {
          v29 = 0;
          v56 = 0;
          v54 = 0u;
          v55 = 0u;
        }
        buf.mBuffers[0].mNumberChannels = v29;
        buf.mBuffers[0].mDataByteSize = v22;
        buf.mBuffers[0].mData = outBuffer->mAudioData;
        v30 = *(double *)(v27 + 32);
        if (v28)
        {
          objc_msgSend(v28, "outASBD");
          v31 = v52;
          v28 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
        }
        else
        {
          v31 = 0.0;
        }
        ioNumberFrames = (v30 * v31);
        v32 = ExtAudioFileRead((ExtAudioFileRef)objc_msgSend(v28, "fFile"), &ioNumberFrames, &buf);
        v33 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
        if (v33)
        {
          v34 = ioNumberFrames;
          objc_msgSend(v33, "outASBD");
          v35 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
          v36 = v51 * v34;
          if (v35)
          {
            objc_msgSend(v35, "outASBD");
            v37 = HIDWORD(v49);
            goto LABEL_36;
          }
        }
        else
        {
          v36 = 0;
        }
        v37 = 0;
        v50 = 0;
        v48 = 0u;
        v49 = 0u;
LABEL_36:
        outBuffer->mAudioDataByteSize = v36 * v37;
        if (v32 || !ioNumberFrames)
        {
          if (v32)
          {
            v38 = *v3;
            if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v67 = 136315394;
              v68 = "-[CSAudioInjectionProviderExclave _readAudioBufferAndFeedIntoAudioQueue]_block_invoke";
              v69 = 1024;
              LODWORD(v70) = v32;
              _os_log_error_impl(&dword_1C2614000, v38, OS_LOG_TYPE_ERROR, "%s ::: Error reading data from audio file : %d", v67, 0x12u);
            }
          }
          ExtAudioFileDispose((ExtAudioFileRef)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "fFile", v48, v49, v50));
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setFFile:", 0);
          v39 = *(_QWORD *)(a1 + 32);
          v40 = *(void **)(v39 + 40);
          *(_QWORD *)(v39 + 40) = 0;

          outBuffer = (AudioQueueBufferRef)objc_msgSend(*(id *)(a1 + 32), "_defaultBufferRef");
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = mach_absolute_time();
          v41 = *v3;
          if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
          {
            v42 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
            *(_DWORD *)v67 = 136315394;
            v68 = "-[CSAudioInjectionProviderExclave _readAudioBufferAndFeedIntoAudioQueue]_block_invoke";
            v69 = 2048;
            v70 = v42;
            _os_log_impl(&dword_1C2614000, v41, OS_LOG_TYPE_DEFAULT, "%s injection is ended at time: %llu", v67, 0x16u);
          }
          v43 = *(_QWORD **)(a1 + 32);
          v44 = v43[6];
          if (v44)
            (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))(v44 + 16))(v44, 1, 0, v43[7], v43[8]);
        }
        v45 = *(OpaqueAudioQueue **)(*(_QWORD *)(a1 + 32) + 24);
        if (v45 && outBuffer)
        {
          v46 = AudioQueueEnqueueBuffer(v45, outBuffer, 0, 0);
          if (v46)
          {
            v47 = v46;
            v18 = *v3;
            if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v67 = 136315394;
              v68 = "-[CSAudioInjectionProviderExclave _readAudioBufferAndFeedIntoAudioQueue]_block_invoke";
              v69 = 1024;
              LODWORD(v70) = v47;
              v19 = "%s Failed to feed audio into exclave, unable to enqueue AQ buffer with OSStatus: %d";
              p_buf = v67;
              goto LABEL_24;
            }
          }
          return;
        }
        v20 = *v3;
        if (!os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
          return;
        *(_DWORD *)v67 = 136315138;
        v68 = "-[CSAudioInjectionProviderExclave _readAudioBufferAndFeedIntoAudioQueue]_block_invoke";
        v19 = "%s Failed to feed audio into exclave, AQ or AQBuffer is invalid";
        p_buf = v67;
LABEL_52:
        v25 = v20;
        v26 = 12;
        goto LABEL_53;
      }
    }
    else
    {
      v66 = 0;
      v64 = 0u;
      v65 = 0u;
      v9 = v6 * 0.0;
    }
    v63 = 0;
    v61 = 0u;
    v62 = 0u;
    v12 = v9 * 0.0;
    goto LABEL_19;
  }
  v15 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    buf.mNumberBuffers = 136315138;
    *(_QWORD *)(&buf.mNumberBuffers + 1) = "-[CSAudioInjectionProviderExclave _readAudioBufferAndFeedIntoAudioQueue]_block_invoke";
    _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s AudioQueue call back is asking for audio, injected file is not available, injecting digital 1s", (uint8_t *)&buf, 0xCu);
  }
  v16 = AudioQueueEnqueueBuffer(*(AudioQueueRef *)(*(_QWORD *)(a1 + 32) + 24), (AudioQueueBufferRef)objc_msgSend(*(id *)(a1 + 32), "_defaultBufferRef"), 0, 0);
  if (v16)
  {
    v17 = v16;
    v18 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      buf.mNumberBuffers = 136315394;
      *(_QWORD *)(&buf.mNumberBuffers + 1) = "-[CSAudioInjectionProviderExclave _readAudioBufferAndFeedIntoAudioQueue]_block_invoke";
      LOWORD(buf.mBuffers[0].mDataByteSize) = 1024;
      *(UInt32 *)((char *)&buf.mBuffers[0].mDataByteSize + 2) = v17;
      v19 = "%s Failed to feed audio into exclave, unable to enqueue AQ buffer with OSStatus: %d";
LABEL_23:
      p_buf = (uint8_t *)&buf;
LABEL_24:
      v25 = v18;
      v26 = 18;
LABEL_53:
      _os_log_error_impl(&dword_1C2614000, v25, OS_LOG_TYPE_ERROR, v19, p_buf, v26);
    }
  }
}

void __70__CSAudioInjectionProviderExclave_speakAudioInExclave_withCompletion___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  CSAudioInjectionFileOption *v6;
  void *v7;
  uint64_t v8;
  double v9;
  CSAudioInjectionFileOption *v10;
  const __CFURL *v11;
  OSStatus v12;
  os_log_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _OWORD v19[2];
  uint64_t v20;
  ExtAudioFileRef outExtAudioFile;
  _OWORD v22[2];
  uint64_t v23;
  uint8_t buf[32];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = mach_absolute_time();
  v2 = (os_log_t *)MEMORY[0x1E0D18F60];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[CSAudioInjectionProviderExclave speakAudioInExclave:withCompletion:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&buf[24] = v5;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Client request to speak audio into exclave with URL: %@ at time: %llu", buf, 0x20u);
  }
  v6 = [CSAudioInjectionFileOption alloc];
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    objc_msgSend(v7, "_defaultOutASBD");
  }
  else
  {
    v23 = 0;
    HIDWORD(v9) = 0;
    memset(v22, 0, sizeof(v22));
  }
  LODWORD(v9) = 1.0;
  v10 = -[CSAudioInjectionFileOption initWithAudioURL:withScaleFactor:outASBD:](v6, "initWithAudioURL:withScaleFactor:outASBD:", v8, v22, v9);
  outExtAudioFile = 0;
  -[CSAudioInjectionFileOption audioURL](v10, "audioURL");
  v11 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v12 = ExtAudioFileOpenURL(v11, &outExtAudioFile);

  if (v12)
  {
    v13 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
    {
      v17 = v13;
      -[CSAudioInjectionFileOption audioURL](v10, "audioURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[CSAudioInjectionProviderExclave speakAudioInExclave:withCompletion:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v12;
      _os_log_error_impl(&dword_1C2614000, v17, OS_LOG_TYPE_ERROR, "%s Failed to open audio file %@, error : %d", buf, 0x1Cu);

    }
  }
  v25 = 0;
  memset(buf, 0, sizeof(buf));
  if (v10)
    -[CSAudioInjectionFileOption outASBD](v10, "outASBD");
  ExtAudioFileSetProperty(outExtAudioFile, 0x63666D74u, 0x28u, buf);
  v19[0] = *(_OWORD *)buf;
  v19[1] = *(_OWORD *)&buf[16];
  v20 = v25;
  -[CSAudioInjectionFileOption setOutASBD:](v10, "setOutASBD:", v19);
  -[CSAudioInjectionFileOption setFFile:](v10, "setFFile:", outExtAudioFile);
  objc_msgSend(*(id *)(a1 + 32), "setFileOption:", v10);
  v14 = MEMORY[0x1C3BC4734](*(_QWORD *)(a1 + 48));
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 48);
  *(_QWORD *)(v15 + 48) = v14;

}

uint64_t __40__CSAudioInjectionProviderExclave_start__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_createAudioQueueIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_prepareAndStartAudioQueue");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4775 != -1)
    dispatch_once(&sharedInstance_onceToken_4775, &__block_literal_global_4776);
  return (id)sharedInstance_sharedInstance_4777;
}

void __49__CSAudioInjectionProviderExclave_sharedInstance__block_invoke()
{
  CSAudioInjectionProviderExclave *v0;
  void *v1;

  v0 = objc_alloc_init(CSAudioInjectionProviderExclave);
  v1 = (void *)sharedInstance_sharedInstance_4777;
  sharedInstance_sharedInstance_4777 = (uint64_t)v0;

}

@end
