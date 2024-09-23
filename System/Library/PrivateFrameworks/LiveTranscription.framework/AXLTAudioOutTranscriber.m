@implementation AXLTAudioOutTranscriber

- (AXLTAudioOutTranscriber)initWithPID:(int)a3 appID:(id)a4 appName:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  AXLTAudioOutTranscriber *v14;
  AXLTAudioOutTranscriber *v15;
  uint64_t v16;
  AVAudioFormat *tapFormat;
  uint64_t v18;
  AXLTTranscriber *transcriber;
  uint64_t v20;
  NSDate *sessionStartTime;
  objc_super v23;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)AXLTAudioOutTranscriber;
  v14 = -[AXLTAudioOutTranscriber init](&v23, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_pid = a3;
    objc_storeStrong((id *)&v14->_appID, a4);
    objc_storeStrong((id *)&v15->_appName, a5);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initWithCommonFormat:sampleRate:channels:interleaved:", 3, 1, 0, 16000.0);
    tapFormat = v15->_tapFormat;
    v15->_tapFormat = (AVAudioFormat *)v16;

    objc_storeWeak((id *)&v15->_delegate, v13);
    +[AXLTTranscriber sharedInstance](AXLTTranscriber, "sharedInstance");
    v18 = objc_claimAutoreleasedReturnValue();
    transcriber = v15->_transcriber;
    v15->_transcriber = (AXLTTranscriber *)v18;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v20 = objc_claimAutoreleasedReturnValue();
    sessionStartTime = v15->_sessionStartTime;
    v15->_sessionStartTime = (NSDate *)v20;

  }
  return v15;
}

- (void)setupTranscriberIfNeeded
{
  void *v3;
  char v4;
  _QWORD block[5];

  -[AXLTAudioOutTranscriber transcriber](self, "transcriber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTranscribingForPID:", -[AXLTAudioOutTranscriber pid](self, "pid"));

  if ((v4 & 1) == 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__AXLTAudioOutTranscriber_setupTranscriberIfNeeded__block_invoke;
    block[3] = &unk_24F874E30;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __51__AXLTAudioOutTranscriber_setupTranscriberIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[4];
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "transcriber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "pid");
  objc_msgSend(*(id *)(a1 + 32), "appName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__AXLTAudioOutTranscriber_setupTranscriberIfNeeded__block_invoke_2;
  v7[3] = &unk_24F874E08;
  v8 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__AXLTAudioOutTranscriber_setupTranscriberIfNeeded__block_invoke_185;
  v6[3] = &unk_24F874E30;
  v6[4] = v8;
  objc_msgSend(v2, "startTranscriptionForPID:appName:callback:completionCallback:", v3, v4, v7, v6);

  objc_msgSend(*(id *)(a1 + 32), "transcriber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resumeTranscriptionForPID:", objc_msgSend(*(id *)(a1 + 32), "pid"));

}

void __51__AXLTAudioOutTranscriber_setupTranscriberIfNeeded__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  AXLTTranscribedData *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  AXLTTranscribedData *v25;
  void *v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "formattedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textLogTime");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_3;
  v8 = (void *)v7;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textLogTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v10);
  v12 = v11;

  if (v12 > 5.0)
  {
LABEL_3:
    AXLogLiveTranscription();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "appName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v14;
      v30 = 2112;
      v31 = v15;
      _os_log_impl(&dword_22D27A000, v13, OS_LOG_TYPE_DEFAULT, "Transcribed text: %@ for app: %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTextLogTime:", v16);

  }
  +[AXLTAudioTextDumper sharedInstance](AXLTAudioTextDumper, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sessionStartTime");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "saveTranscribedText:appName:sessionStartTime:", v6, v18, v19);

  v20 = [AXLTTranscribedData alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(*(id *)(a1 + 32), "pid");
  objc_msgSend(*(id *)(a1 + 32), "appID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v27) = 0;
  v25 = -[AXLTTranscribedData initWithTranscription:requestType:timestamp:pid:appID:appName:downloadProgress:silence:](v20, "initWithTranscription:requestType:timestamp:pid:appID:appName:downloadProgress:silence:", v5, 1, v21, v22, v23, v24, a3, v27);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "transcriberOutputData:", v25);

}

void __51__AXLTAudioOutTranscriber_setupTranscriberIfNeeded__block_invoke_185(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  AXLTTranscribedData *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  AXLTTranscribedData *v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  AXLogLiveTranscription();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "appName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v3;
    _os_log_impl(&dword_22D27A000, v2, OS_LOG_TYPE_DEFAULT, "Recognized text for app: %@", buf, 0xCu);

  }
  v4 = [AXLTTranscribedData alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "pid");
  objc_msgSend(*(id *)(a1 + 32), "appID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = 0;
  v9 = -[AXLTTranscribedData initWithTranscription:requestType:timestamp:pid:appID:appName:downloadProgress:silence:](v4, "initWithTranscription:requestType:timestamp:pid:appID:appName:downloadProgress:silence:", 0, 1, v5, v6, v7, v8, -2, v11);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transcriberOutputData:", v9);

}

- (void)cleanup
{
  OUTLINED_FUNCTION_0_0(&dword_22D27A000, a2, a3, "Failed to stop audio queue: %d\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (BOOL)createAudioBuffersWithBufferByteSize:(unsigned int)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  OpaqueAudioQueue *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  AudioQueueBufferRef outBuffer;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  outBuffer = 0;
  v6 = AudioQueueAllocateBuffer(-[AXLTAudioOutTranscriber audioQueue](self, "audioQueue"), a3, &outBuffer);
  if ((_DWORD)v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to allocate buffer: %d"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AXLogLiveTranscription();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AXLTAudioOutTranscriber createAudioBuffersWithBufferByteSize:error:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

    v15 = (void *)MEMORY[0x24BDD1540];
    v33 = *MEMORY[0x24BDD0BA0];
    v34[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15;
    v18 = 8;
LABEL_9:
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.accessibility.LiveTranscription"), v18, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    return 0;
  }
  v19 = -[AXLTAudioOutTranscriber audioQueue](self, "audioQueue");
  v20 = AudioQueueEnqueueBuffer(v19, outBuffer, 0, 0);
  if ((_DWORD)v20)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to enqueue buffer: %d"), v20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AXLogLiveTranscription();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[AXLTAudioOutTranscriber createAudioBuffersWithBufferByteSize:error:].cold.1((uint64_t)v7, v21, v22, v23, v24, v25, v26, v27);

    v28 = (void *)MEMORY[0x24BDD1540];
    v31 = *MEMORY[0x24BDD0BA0];
    v32 = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v28;
    v18 = 9;
    goto LABEL_9;
  }
  self->_mBuffers[0] = outBuffer;
  return 1;
}

- (void)handleAudioBuffer:(AudioQueueBuffer *)a3 audioQueue:(OpaqueAudioQueue *)a4 timestamp:(const AudioTimeStamp *)a5 packetCount:(unsigned int)a6 packetDesc:(const AudioStreamPacketDescription *)a7
{
  uint64_t v7;
  NSObject *v10;
  int v11;
  int64_t silentBuffersCount;

  v7 = *(_QWORD *)&a6;
  AXLogLiveTranscription();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[AXLTAudioOutTranscriber handleAudioBuffer:audioQueue:timestamp:packetCount:packetDesc:].cold.1((int *)a3, v7, v10);

  if (-[AXLTAudioOutTranscriber _isSilenceOnlyInBuffer:packetCount:](self, "_isSilenceOnlyInBuffer:packetCount:", a3, v7))
  {
    if (self->_silentBuffersCount <= 9)
      -[AXLTAudioOutTranscriber _appendBuffer:offsetInPackets:packetCount:](self, "_appendBuffer:offsetInPackets:packetCount:", a3, 0, v7);
    v11 = -[AXLTAudioOutTranscriber pid](self, "pid");
    silentBuffersCount = self->_silentBuffersCount;
    if (v11 != -2 && silentBuffersCount >= 11)
    {
      -[AXLTAudioOutTranscriber _pauseSpeechRecognition](self, "_pauseSpeechRecognition");
      silentBuffersCount = self->_silentBuffersCount;
    }
    self->_silentBuffersCount = silentBuffersCount + 1;
  }
  else
  {
    -[AXLTAudioOutTranscriber _appendBuffer:offsetInPackets:packetCount:](self, "_appendBuffer:offsetInPackets:packetCount:", a3, 0, v7);
    self->_silentBuffersCount = 0;
  }
  AudioQueueEnqueueBuffer(-[AXLTAudioOutTranscriber audioQueue](self, "audioQueue"), a3, 0, 0);
}

- (void)_pauseSpeechRecognition
{
  NSObject *v3;
  void *v4;
  _QWORD block[5];
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  AXLogLiveTranscription();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_silentBuffersCount);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v7 = v4;
    _os_log_impl(&dword_22D27A000, v3, OS_LOG_TYPE_DEFAULT, "Pause recognition for silence %@", buf, 0xCu);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__AXLTAudioOutTranscriber__pauseSpeechRecognition__block_invoke;
  block[3] = &unk_24F874E30;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __50__AXLTAudioOutTranscriber__pauseSpeechRecognition__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "transcriber");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopTranscriptionForPID:", objc_msgSend(*(id *)(a1 + 32), "pid"));

}

- (int64_t)_findSilencePacketOffset:(AudioQueueBuffer *)a3 packetCount:(unsigned int)a4 silentSamplesMin:(int64_t)a5 zeroOffsetOnly:(BOOL)a6
{
  unint64_t v6;
  uint64_t v7;
  int64_t result;
  __int16 *v9;
  int v10;
  int v11;

  if (a4)
  {
    v6 = 0;
    v7 = 0;
    result = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      v9 = (__int16 *)((char *)a3->mAudioData + 2 * v6);
      v10 = *v9;
      if (v10 < 0)
        v10 = -v10;
      v11 = v9[1];
      if (v11 < 0)
        v11 = -v11;
      if ((__int16)v10 <= 10 && (__int16)v11 <= 10)
      {
        if (!v7)
          result = v6;
        if (++v7 >= a5)
          return result;
      }
      else
      {
        result = 0x7FFFFFFFFFFFFFFFLL;
        if (a6)
          return result;
        v7 = 0;
      }
      v6 += 2;
      if (v6 >= a4)
        return result;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_isSilenceOnlyInBuffer:(AudioQueueBuffer *)a3 packetCount:(unsigned int)a4
{
  __int16 *mAudioData;
  int v5;
  unsigned __int16 v6;
  unint64_t v7;
  __int16 *v8;
  int v9;
  BOOL v10;
  NSObject *v11;

  if (!a4)
    return 1;
  mAudioData = (__int16 *)a3->mAudioData;
  v5 = *mAudioData;
  if (v5 < 0)
    v5 = -v5;
  v6 = v5;
  if ((__int16)v5 <= 10)
  {
    v7 = 0;
    v8 = mAudioData + 1;
    while (a4 - 1 != v7)
    {
      v9 = v8[v7];
      if (v9 < 0)
        v9 = -v9;
      v6 = v9;
      ++v7;
      if ((__int16)v9 >= 11)
      {
        v10 = v7 >= a4;
        goto LABEL_13;
      }
    }
    return 1;
  }
  v10 = 0;
LABEL_13:
  AXLogLiveTranscription();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[AXLTAudioOutTranscriber _isSilenceOnlyInBuffer:packetCount:].cold.1(v6, v11);

  return v10;
}

- (void)_calcHistogramForBuffer:(AudioQueueBuffer *)a3 packetCount:(unsigned int)a4 isSilence:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v5 = a5;
  -[AXLTAudioOutTranscriber transcriber](self, "transcriber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isTranscribingForPID:", -[AXLTAudioOutTranscriber pid](self, "pid"));

  if (v10)
  {
    if (v5)
    {
      v11 = (void *)objc_opt_new();
      v12 = 16;
      do
      {
        objc_msgSend(v11, "addObject:", &unk_24F879088);
        --v12;
      }
      while (v12);
    }
    else
    {
      +[AXLTHistogramCalculator histogramForAudioQueueBuffer:packetCount:channelsCount:format:](AXLTHistogramCalculator, "histogramForAudioQueueBuffer:packetCount:channelsCount:format:", a3, a4, 1, 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __73__AXLTAudioOutTranscriber__calcHistogramForBuffer_packetCount_isSilence___block_invoke;
    v14[3] = &unk_24F874E58;
    v14[4] = self;
    v15 = v11;
    v13 = v11;
    dispatch_async(MEMORY[0x24BDAC9B8], v14);

  }
}

void __73__AXLTAudioOutTranscriber__calcHistogramForBuffer_packetCount_isSilence___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  AXLTAudioInfo *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  AXLogLiveTranscription();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "appName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_22D27A000, v2, OS_LOG_TYPE_INFO, "Histogram for app: %@", (uint8_t *)&v6, 0xCu);

  }
  v4 = -[AXLTAudioInfo initWithAudioInfo:requestType:pid:]([AXLTAudioInfo alloc], "initWithAudioInfo:requestType:pid:", *(_QWORD *)(a1 + 40), 1, objc_msgSend(*(id *)(a1 + 32), "pid"));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "audioInfoData:", v4);

}

- (void)_appendBuffer:(AudioQueueBuffer *)a3 offsetInPackets:(unsigned int)a4 packetCount:(unsigned int)a5
{
  uint64_t v5;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unsigned int v17;
  size_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  UInt32 mAudioDataByteSize;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint8_t buf[4];
  _BYTE v39[10];
  void *v40;
  uint64_t v41;

  v5 = *(_QWORD *)&a5;
  v41 = *MEMORY[0x24BDAC8D0];
  -[AXLTAudioOutTranscriber setupTranscriberIfNeeded](self, "setupTranscriberIfNeeded");
  -[AXLTAudioOutTranscriber tapFormat](self, "tapFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "streamDescription");
  v11 = *(_QWORD *)(v10 + 32);
  v12 = *(_OWORD *)(v10 + 16);
  v35 = *(_OWORD *)v10;
  v36 = v12;
  v37 = v11;

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initWithStreamDescription:", &v35);
  v14 = objc_alloc(MEMORY[0x24BDB1838]);
  v15 = (void *)objc_msgSend(v14, "initWithPCMFormat:frameCapacity:", v13, v5, v35, v36, v37);
  objc_msgSend(v15, "setFrameLength:", v5);
  v16 = *(void **)(objc_msgSend(v15, "mutableAudioBufferList") + 16);
  v17 = 2 * a4;
  v18 = (2 * v5);
  AXLogLiveTranscription();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    mAudioDataByteSize = a3->mAudioDataByteSize;
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v39 = v17;
    *(_WORD *)&v39[4] = 1024;
    *(_DWORD *)&v39[6] = v18;
    LOWORD(v40) = 1024;
    *(_DWORD *)((char *)&v40 + 2) = mAudioDataByteSize;
    _os_log_debug_impl(&dword_22D27A000, v19, OS_LOG_TYPE_DEBUG, "Copy offsetInBytes = %d, dataByteSize = %d, full data size = %d", buf, 0x14u);
  }

  memcpy(v16, (char *)a3->mAudioData + v17, v18);
  -[AXLTAudioOutTranscriber bufferLogTime](self, "bufferLogTime");
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
    goto LABEL_5;
  v21 = (void *)v20;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXLTAudioOutTranscriber bufferLogTime](self, "bufferLogTime");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "timeIntervalSinceDate:", v23);
  v25 = v24;

  if (v25 > 5.0)
  {
LABEL_5:
    AXLogLiveTranscription();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v15, "frameCapacity"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXLTAudioOutTranscriber appName](self, "appName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v39 = v27;
      *(_WORD *)&v39[8] = 2112;
      v40 = v28;
      _os_log_impl(&dword_22D27A000, v26, OS_LOG_TYPE_DEFAULT, "Sent audio buffer with size: %@ for app: %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXLTAudioOutTranscriber setBufferLogTime:](self, "setBufferLogTime:", v29);

  }
  -[AXLTAudioOutTranscriber transcriber](self, "transcriber");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "appendAudioPCMBuffer:forPID:", v15, -[AXLTAudioOutTranscriber pid](self, "pid"));

  +[AXLTAudioTextDumper sharedInstance](AXLTAudioTextDumper, "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXLTAudioOutTranscriber appName](self, "appName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXLTAudioOutTranscriber sessionStartTime](self, "sessionStartTime");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "saveAudioBuffer:appName:sessionStartTime:", v15, v32, v33);

}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
  objc_storeStrong((id *)&self->_appID, a3);
}

- (NSString)appName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAppName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (AVAudioFormat)tapFormat
{
  return self->_tapFormat;
}

- (void)setTapFormat:(id)a3
{
  objc_storeStrong((id *)&self->_tapFormat, a3);
}

- (OpaqueAudioQueue)audioQueue
{
  return self->_audioQueue;
}

- (void)setAudioQueue:(OpaqueAudioQueue *)a3
{
  self->_audioQueue = a3;
}

- (AXLTTranscriber)transcriber
{
  return (AXLTTranscriber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTranscriber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (AXLTTranscriberDelegateProtocol)delegate
{
  return (AXLTTranscriberDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)silentSamplesTailCount
{
  return self->_silentSamplesTailCount;
}

- (void)setSilentSamplesTailCount:(int64_t)a3
{
  self->_silentSamplesTailCount = a3;
}

- (NSDate)sessionStartTime
{
  return self->_sessionStartTime;
}

- (void)setSessionStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStartTime, a3);
}

- (NSDate)bufferLogTime
{
  return self->_bufferLogTime;
}

- (void)setBufferLogTime:(id)a3
{
  objc_storeStrong((id *)&self->_bufferLogTime, a3);
}

- (NSDate)textLogTime
{
  return self->_textLogTime;
}

- (void)setTextLogTime:(id)a3
{
  objc_storeStrong((id *)&self->_textLogTime, a3);
}

- (int64_t)silentBuffersCount
{
  return self->_silentBuffersCount;
}

- (void)setSilentBuffersCount:(int64_t)a3
{
  self->_silentBuffersCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLogTime, 0);
  objc_storeStrong((id *)&self->_bufferLogTime, 0);
  objc_storeStrong((id *)&self->_sessionStartTime, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transcriber, 0);
  objc_storeStrong((id *)&self->_tapFormat, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appID, 0);
}

- (void)createAudioBuffersWithBufferByteSize:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D27A000, a2, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)handleAudioBuffer:(os_log_t)log audioQueue:timestamp:packetCount:packetDesc:.cold.1(int *a1, int a2, os_log_t log)
{
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a1[4];
  v4 = *a1;
  v5[0] = 67109632;
  v5[1] = a2;
  v6 = 1024;
  v7 = v3;
  v8 = 1024;
  v9 = v4;
  _os_log_debug_impl(&dword_22D27A000, log, OS_LOG_TYPE_DEBUG, "handleAudioBuffer packets: %i, data size: %i, buffer capacity: %i", (uint8_t *)v5, 0x14u);
  OUTLINED_FUNCTION_1();
}

- (void)_isSilenceOnlyInBuffer:(unsigned __int16)a1 packetCount:(NSObject *)a2 .cold.1(unsigned __int16 a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_22D27A000, a2, OS_LOG_TYPE_DEBUG, "Found a sample of %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1_0();
}

@end
