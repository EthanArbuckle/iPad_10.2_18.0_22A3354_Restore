@implementation _LTSpeechTranslationRequest

- (id)loggingType
{
  return CFSTR("speech");
}

- (id)requestContext
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_LTSpeechTranslationRequest;
  -[_LTTranslationRequest requestContext](&v8, sel_requestContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTTranslationRequest outputFileURL](self, "outputFileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOutputFileURL:", v4);

  -[_LTSpeechTranslationRequest _offlineASRModelURLs](self, "_offlineASRModelURLs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAsrModelURLs:", v5);

  objc_msgSend(v3, "setAutoEndpoint:", -[_LTSpeechTranslationRequest autoEndpoint](self, "autoEndpoint"));
  objc_msgSend(v3, "setLidThreshold:", -[_LTSpeechTranslationRequest _lidThreshold](self, "_lidThreshold"));
  objc_msgSend(v3, "setAsrConfidenceThreshold:", -[_LTSpeechTranslationRequest _asrConfidenceThreshold](self, "_asrConfidenceThreshold"));
  objc_msgSend(v3, "setEnableVAD:", -[_LTSpeechTranslationRequest enableVAD](self, "enableVAD"));
  v6 = 1;
  objc_msgSend(v3, "setCancelOnCleanup:", 1);
  objc_msgSend(v3, "setRoute:", 0);
  if (-[_LTTranslationRequest forcedOfflineTranslation](self, "forcedOfflineTranslation"))
    goto LABEL_4;
  if (-[_LTTranslationRequest _forcedOnlineTranslation](self, "_forcedOnlineTranslation"))
  {
    v6 = 2;
LABEL_4:
    objc_msgSend(v3, "setRoute:", v6);
  }
  return v3;
}

- (_LTSpeechTranslationRequest)initWithSourceLocale:(id)a3 targetLocale:(id)a4
{
  return -[_LTSpeechTranslationRequest initWithSourceLocale:targetLocale:suggestedUniqueID:](self, "initWithSourceLocale:targetLocale:suggestedUniqueID:", a3, a4, 0);
}

- (_LTSpeechTranslationRequest)initWithSourceLocale:(id)a3 targetLocale:(id)a4 suggestedUniqueID:(id)a5
{
  id v8;
  id v9;
  id v10;
  _LTLocalePair *v11;
  _LTSpeechTranslationRequest *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[_LTLocalePair initWithSourceLocale:targetLocale:]([_LTLocalePair alloc], "initWithSourceLocale:targetLocale:", v10, v9);

  v12 = -[_LTSpeechTranslationRequest initWithLocalePair:suggestedUniqueID:](self, "initWithLocalePair:suggestedUniqueID:", v11, v8);
  return v12;
}

- (_LTSpeechTranslationRequest)initWithLocalePair:(id)a3
{
  return -[_LTSpeechTranslationRequest initWithLocalePair:suggestedUniqueID:](self, "initWithLocalePair:suggestedUniqueID:", a3, 0);
}

- (_LTSpeechTranslationRequest)initWithLocalePair:(id)a3 suggestedUniqueID:(id)a4
{
  _LTSpeechTranslationRequest *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  _LTSpeechTranslationRequest *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_LTSpeechTranslationRequest;
  v4 = -[_LTTranslationRequest initWithLocalePair:suggestedUniqueID:](&v9, sel_initWithLocalePair_suggestedUniqueID_, a3, a4);
  if (v4)
  {
    v5 = dispatch_queue_create("com.apple.siri.translation.speechrequest", 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;

    v4->__asrConfidenceThreshold = -1;
    v4->__lidThreshold = -1;
    v4->_autoEndpoint = 0;
    v7 = v4;
  }

  return v4;
}

- (id)nativeAudioFormat
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initWithStreamDescription:", &SupportedASBD);
}

- (void)_startTranslationWithService:(id)a3 done:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id buf[2];

  v6 = a3;
  v7 = a4;
  v8 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_235438000, v8, OS_LOG_TYPE_DEFAULT, "Start speech translation with service", (uint8_t *)buf, 2u);
  }
  -[_LTTranslationRequest logIdentifier](self, "logIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTTranslationRequest localePair](self, "localePair");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTTranslationRequest setLogIdentifier:](self, "setLogIdentifier:", v9);

  objc_initWeak(buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65___LTSpeechTranslationRequest__startTranslationWithService_done___block_invoke;
  block[3] = &unk_2506936E0;
  objc_copyWeak(&v17, buf);
  v15 = v6;
  v16 = v7;
  v12 = v6;
  v13 = v7;
  dispatch_async(queue, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(buf);
}

- (void)_translationFailedWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_LTSpeechTranslationRequest delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_LTSpeechTranslationRequest delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "translationDidFinishWithError:", v7);

  }
}

- (void)_appendAudioPCMBuffer:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  _QWORD *v7;
  void *v8;
  id v9;

  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[_LTSpeechTranslationRequest nativeAudioFormat](self, "nativeAudioFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = (_QWORD *)objc_msgSend(v9, "int16ChannelData");
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *v7, 2 * objc_msgSend(v9, "frameLength"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTTranslationService addSpeechAudioData:](self->_service, "addSpeechAudioData:", v8);

  }
  else
  {
    -[_LTSpeechTranslationRequest _convertAndFeedPCMBuffer:](self, "_convertAndFeedPCMBuffer:", v9);
  }

}

- (void)appendAudioPCMBuffer:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  _LTSpeechTranslationRequest *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52___LTSpeechTranslationRequest_appendAudioPCMBuffer___block_invoke;
  v7[3] = &unk_250694468;
  objc_copyWeak(&v10, &location);
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_simulateRealtimeBehavior:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  uint64_t v13;
  _LTTranslationService *service;
  void *v15;
  BOOL v16;
  id v17;

  v17 = a3;
  v4 = objc_msgSend(v17, "length");
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemUptime");
  v7 = v6;

  if (v4 >= 1)
  {
    v8 = 0;
    v9 = 0.0;
    v10 = 0.0;
    do
    {
      v9 = v9 + 0.02;
      objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", v9 - v10);
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "systemUptime");
      v10 = v12 - v7;

      if (v4 >= 640)
        v13 = 640;
      else
        v13 = v4;
      service = self->_service;
      objc_msgSend(v17, "subdataWithRange:", v8, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTTranslationService addSpeechAudioData:](service, "addSpeechAudioData:", v15);

      v8 += v13;
      v16 = v4 <= v13;
      v4 -= v13;
    }
    while (!v16);
  }

}

- (void)_appendAudioSampleBuffer:(opaqueCMSampleBuffer *)a3 simulateRealtime:(BOOL)a4
{
  _BOOL4 v4;
  const opaqueCMFormatDescription *FormatDescription;
  const AudioStreamBasicDescription *StreamBasicDescription;
  double mSampleRate;
  OpaqueCMBlockBuffer *DataBuffer;
  size_t DataLength;
  id v12;
  OSStatus v13;
  int v14;
  NSObject *v15;
  id v16;
  void *v17;
  int32_t NumSamples;
  id v19;
  size_t totalLengthOut;
  char *dataPointerOut;

  v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
  mSampleRate = StreamBasicDescription->mSampleRate;
  if ((StreamBasicDescription->mSampleRate == 16000.0 || mSampleRate == 8000.0)
    && StreamBasicDescription->mFormatID == 1819304813
    && StreamBasicDescription->mFormatFlags == 12
    && StreamBasicDescription->mBytesPerPacket == 2
    && StreamBasicDescription->mFramesPerPacket == 1
    && StreamBasicDescription->mBytesPerFrame == 2
    && StreamBasicDescription->mChannelsPerFrame == 1
    && StreamBasicDescription->mBitsPerChannel == 16)
  {
    -[_LTSpeechTranslationRequest _drainAndClearAudioConverter](self, "_drainAndClearAudioConverter", mSampleRate);
    if (CMSampleBufferGetNumSamples(a3))
    {
      totalLengthOut = 0;
      dataPointerOut = 0;
      DataBuffer = CMSampleBufferGetDataBuffer(a3);
      if (CMBlockBufferGetDataPointer(DataBuffer, 0, 0, &totalLengthOut, &dataPointerOut))
      {
        DataLength = CMBlockBufferGetDataLength(DataBuffer);
        v12 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", DataLength));
        v13 = CMBlockBufferCopyDataBytes(DataBuffer, 0, DataLength, (void *)objc_msgSend(v12, "mutableBytes"));
        if (v13)
        {
          v14 = v13;
          v15 = _LTOSLogSpeech();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            -[_LTSpeechTranslationRequest _appendAudioSampleBuffer:simulateRealtime:].cold.1(v14, v15);
          v16 = 0;
        }
        else
        {
          v16 = v12;
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", dataPointerOut, totalLengthOut);
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (v16)
      {
        if (v4)
          -[_LTSpeechTranslationRequest _simulateRealtimeBehavior:](self, "_simulateRealtimeBehavior:", v16);
        else
          -[_LTTranslationService addSpeechAudioData:](self->_service, "addSpeechAudioData:", v16);

      }
    }
  }
  else
  {
    v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initWithStreamDescription:", StreamBasicDescription);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1838]), "initWithPCMFormat:frameCapacity:", v19, CMSampleBufferGetNumSamples(a3));
    objc_msgSend(v17, "setFrameLength:", CMSampleBufferGetNumSamples(a3));
    NumSamples = CMSampleBufferGetNumSamples(a3);
    CMSampleBufferCopyPCMDataIntoAudioBufferList(a3, 0, NumSamples, (AudioBufferList *)objc_msgSend(v17, "mutableAudioBufferList"));
    -[_LTSpeechTranslationRequest _convertAndFeedPCMBuffer:](self, "_convertAndFeedPCMBuffer:", v17);

  }
}

- (void)append:(opaqueCMSampleBuffer *)a3 simulateRealtime:(BOOL)a4
{
  NSObject *v7;
  opaqueCMSampleBuffer *v8;
  NSObject *queue;
  opaqueCMSampleBuffer *v10;
  _QWORD v11[4];
  opaqueCMSampleBuffer *v12;
  _LTSpeechTranslationRequest *v13;
  id v14;
  BOOL v15;
  id buf[2];

  v7 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_235438000, v7, OS_LOG_TYPE_INFO, "Append audio data", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  v8 = a3;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55___LTSpeechTranslationRequest_append_simulateRealtime___block_invoke;
  v11[3] = &unk_250693758;
  objc_copyWeak(&v14, buf);
  v12 = v8;
  v13 = self;
  v15 = a4;
  v10 = v8;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);
}

- (void)_drainAndClearAudioConverter
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_235438000, v0, v1, "Could not drain converter %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_convertAndFeedPCMBuffer:(id)a3
{
  id v4;
  void *v5;
  char v6;
  AVAudioConverter *v7;
  AVAudioConverter *converter;
  id v9;
  void *v10;
  void *v11;
  AVAudioConverter *v12;
  id v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  id v24;
  _QWORD v25[3];
  char v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v4, "format");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTSpeechTranslationRequest nativeAudioFormat](self, "nativeAudioFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAudioConverter inputFormat](self->_converter, "inputFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v20);

  if ((v6 & 1) == 0)
  {
    -[_LTSpeechTranslationRequest _drainAndClearAudioConverter](self, "_drainAndClearAudioConverter");
    v7 = (AVAudioConverter *)objc_msgSend(objc_alloc(MEMORY[0x24BDB17F8]), "initFromFormat:toFormat:", v20, v19);
    converter = self->_converter;
    self->_converter = v7;

    -[AVAudioConverter setSampleRateConverterQuality:](self->_converter, "setSampleRateConverterQuality:", 127);
  }
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  do
  {
    v9 = objc_alloc(MEMORY[0x24BDB1838]);
    -[_LTSpeechTranslationRequest nativeAudioFormat](self, "nativeAudioFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithPCMFormat:frameCapacity:", v10, 8000);

    objc_msgSend(v11, "setFrameLength:", 8000);
    v12 = self->_converter;
    v24 = 0;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __56___LTSpeechTranslationRequest__convertAndFeedPCMBuffer___block_invoke;
    v21[3] = &unk_2506944B0;
    v23 = v25;
    v13 = v4;
    v22 = v13;
    v14 = -[AVAudioConverter convertToBuffer:error:withInputFromBlock:](v12, "convertToBuffer:error:withInputFromBlock:", v11, &v24, v21);
    v15 = v24;
    if (v14 == 2)
      goto LABEL_8;
    if (v14 == 3)
    {
      v16 = _LTOSLogSpeech();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v15;
        _os_log_error_impl(&dword_235438000, v16, OS_LOG_TYPE_ERROR, "Could not run audio converter %@", buf, 0xCu);
      }
LABEL_8:
      v17 = 1;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *(_QWORD *)objc_msgSend(v11, "int16ChannelData"), 2 * objc_msgSend(v11, "frameLength"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTTranslationService addSpeechAudioData:](self->_service, "addSpeechAudioData:", v18);

    if (v14 == 1)
      v17 = 2;
    else
      v17 = 0;
LABEL_12:

  }
  while (!v17);
  _Block_object_dispose(v25, 8);

}

- (void)endAudio
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39___LTSpeechTranslationRequest_endAudio__block_invoke;
  v4[3] = &unk_250693730;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)speechActivityDetected
{
  void *v3;
  char v4;
  id v5;

  -[_LTSpeechTranslationRequest delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_LTSpeechTranslationRequest delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "speechActivityDetected");

  }
}

- (void)languageDetectionCompleted
{
  void *v3;
  char v4;
  id v5;

  -[_LTSpeechTranslationRequest delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_LTSpeechTranslationRequest delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "languageDetectionCompleted");

  }
}

- (void)languageDetectionResult:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_LTSpeechTranslationRequest delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_LTSpeechTranslationRequest delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "languageDetectionResult:", v7);

  }
}

- (void)hybridEndpointerFoundEndpoint
{
  void *v3;
  char v4;
  id v5;

  -[_LTSpeechTranslationRequest delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_LTSpeechTranslationRequest delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hybridEndpointerFoundEndpoint");

  }
}

- (void)serverEndpointerFeatures:(id)a3 locale:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[_LTSpeechTranslationRequest delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[_LTSpeechTranslationRequest delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serverEndpointerFeatures:locale:", v10, v6);

  }
}

- (void)speechRecognitionResult:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_LTSpeechTranslationRequest delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_LTSpeechTranslationRequest delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "speechRecognitionResult:", v7);

  }
}

- (void)translatorDidTranslate:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_LTSpeechTranslationRequest delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_LTSpeechTranslationRequest delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "translatorDidTranslate:", v7);

    -[_LTTranslationRequest logIdentifier](self, "logIdentifier");
  }

}

- (void)translationDidFinishWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void (**done)(void);
  id v8;

  v8 = a3;
  -[_LTSpeechTranslationRequest delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_LTSpeechTranslationRequest delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "translationDidFinishWithError:", v8);

    -[_LTTranslationRequest logIdentifier](self, "logIdentifier");
  }
  done = (void (**)(void))self->_done;
  if (done)
    done[2]();

}

- (_LTSpeechTranslationDelegate)delegate
{
  return (_LTSpeechTranslationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)_lidModelURL
{
  return self->__lidModelURL;
}

- (void)set_lidModelURL:(id)a3
{
  objc_storeStrong((id *)&self->__lidModelURL, a3);
}

- (NSArray)_offlineASRModelURLs
{
  return self->__offlineASRModelURLs;
}

- (void)set_offlineASRModelURLs:(id)a3
{
  objc_storeStrong((id *)&self->__offlineASRModelURLs, a3);
}

- (int64_t)_asrConfidenceThreshold
{
  return self->__asrConfidenceThreshold;
}

- (void)set_asrConfidenceThreshold:(int64_t)a3
{
  self->__asrConfidenceThreshold = a3;
}

- (int64_t)_lidThreshold
{
  return self->__lidThreshold;
}

- (void)set_lidThreshold:(int64_t)a3
{
  self->__lidThreshold = a3;
}

- (BOOL)autoEndpoint
{
  return self->_autoEndpoint;
}

- (void)setAutoEndpoint:(BOOL)a3
{
  self->_autoEndpoint = a3;
}

- (BOOL)enableVAD
{
  return self->_enableVAD;
}

- (void)setEnableVAD:(BOOL)a3
{
  self->_enableVAD = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__offlineASRModelURLs, 0);
  objc_storeStrong((id *)&self->__lidModelURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_done, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queuedBuffers, 0);
  objc_storeStrong((id *)&self->_converter, 0);
}

- (void)_appendAudioSampleBuffer:(int)a1 simulateRealtime:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_235438000, a2, OS_LOG_TYPE_ERROR, "CMBlockBufferCopyDataBytes could not copy data: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_3_0();
}

@end
