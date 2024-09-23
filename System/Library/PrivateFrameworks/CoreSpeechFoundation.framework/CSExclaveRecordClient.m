@implementation CSExclaveRecordClient

- (CSExclaveRecordClient)init
{
  CSExclaveRecordClient *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  CSSecureSiriAudioProvidingProxy *v5;
  CSSecureSiriAudioProvidingProxy *audioProvidingProxy;
  CSExclaveIndicatorController *v7;
  CSExclaveIndicatorController *exclaveIndicatorController;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CSExclaveRecordClient;
  v2 = -[CSExclaveRecordClient init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSExclaveRecordClient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (CSSecureSiriAudioProvidingProxy *)objc_alloc_init(MEMORY[0x1E0D18E68]);
    audioProvidingProxy = v2->_audioProvidingProxy;
    v2->_audioProvidingProxy = v5;

    v7 = objc_alloc_init(CSExclaveIndicatorController);
    exclaveIndicatorController = v2->_exclaveIndicatorController;
    v2->_exclaveIndicatorController = v7;

  }
  return v2;
}

- (BOOL)startAudioStream
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  CSSecureSiriAudioProvidingProxy *audioProvidingProxy;
  unint64_t v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[CSExclaveRecordClient startAudioStream]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Start CSExclaveRecordClient", (uint8_t *)&v9, 0xCu);
  }
  -[CSExclaveRecordClient exclaveIndicatorController](self, "exclaveIndicatorController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sensorStart");

  v5 = +[CSUtils isSiriDSPTurnedOn](CSUtils, "isSiriDSPTurnedOn");
  audioProvidingProxy = self->_audioProvidingProxy;
  if (v5)
    v7 = +[CSConfig exclaveHALInputNumChannelsWithDSP](CSConfig, "exclaveHALInputNumChannelsWithDSP");
  else
    v7 = +[CSConfig exclaveHALInputNumChannelsWithoutDSP](CSConfig, "exclaveHALInputNumChannelsWithoutDSP");
  return -[CSSecureSiriAudioProvidingProxy prepare:](audioProvidingProxy, "prepare:", v7);
}

- (BOOL)stopAudioStream
{
  NSObject *v3;
  void *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CSExclaveRecordClient stopAudioStream]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Stopping CSExclaveRecordClient", (uint8_t *)&v6, 0xCu);
  }
  -[CSExclaveRecordClient exclaveIndicatorController](self, "exclaveIndicatorController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sensorStop");

  return 1;
}

- (BOOL)fetchAndStoreAudioBuffer
{
  return -[CSSecureSiriAudioProvidingProxy fetchAndStoreAudioBuffer](self->_audioProvidingProxy, "fetchAndStoreAudioBuffer");
}

- (void)requestHistoricalAudioBufferFor:(unint64_t)a3 startSample:(unint64_t)a4 numSamples:(unint64_t)a5 hostTime:(unint64_t)a6
{
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  int v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136315138;
    v21 = "-[CSExclaveRecordClient requestHistoricalAudioBufferFor:startSample:numSamples:hostTime:]";
    _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v20, 0xCu);
  }
  if (-[CSSecureSiriAudioProvidingProxy requestHistoricalAudioBufferWithStartSample:numSamples:](self->_audioProvidingProxy, "requestHistoricalAudioBufferWithStartSample:numSamples:", a4, a5))
  {
    -[CSExclaveRecordClient exclaveIndicatorController](self, "exclaveIndicatorController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (2 * a5);
    v14 = objc_msgSend(v12, "copyBufferWithSize:", v13);

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v14, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSExclaveRecordClient delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_opt_respondsToSelector();

      if ((v17 & 1) != 0)
      {
        -[CSExclaveRecordClient delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "exclaveRecordClientAudioBuffer:audioStreamHandleId:audioBuffer:hostTime:", self, a3, v15, a6);

      }
    }
  }
  else
  {
    v19 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315138;
      v21 = "-[CSExclaveRecordClient requestHistoricalAudioBufferFor:startSample:numSamples:hostTime:]";
      _os_log_impl(&dword_1B502E000, v19, OS_LOG_TYPE_DEFAULT, "%s Failed!!!", (uint8_t *)&v20, 0xCu);
    }
  }
}

- (void)configAOPVoiceTrigger
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSExclaveRecordClient configAOPVoiceTrigger]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  if ((-[CSSecureSiriAudioProvidingProxy configAOPVoiceTrigger](self->_audioProvidingProxy, "configAOPVoiceTrigger") & 1) == 0)
  {
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[CSExclaveRecordClient configAOPVoiceTrigger]";
      _os_log_error_impl(&dword_1B502E000, v4, OS_LOG_TYPE_ERROR, "%s Failed to config AOP VoiceTrigger", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)fetchAOPVoiceTriggerResult:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CSExclaveRecordClient fetchAOPVoiceTriggerResult:]";
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  -[CSSecureSiriAudioProvidingProxy fetchAOPVoiceTriggerResult:](self->_audioProvidingProxy, "fetchAOPVoiceTriggerResult:", v4);

}

- (void)startBargeInVoiceTrigger
{
  -[CSSecureSiriAudioProvidingProxy startBargeInVoiceTrigger](self->_audioProvidingProxy, "startBargeInVoiceTrigger");
}

- (void)stopBargeInVoiceTrigger
{
  -[CSSecureSiriAudioProvidingProxy stopBargeInVoiceTrigger](self->_audioProvidingProxy, "stopBargeInVoiceTrigger");
}

- (int)processBargeInVoiceTrigger
{
  return -[CSSecureSiriAudioProvidingProxy processBargeInVoiceTrigger](self->_audioProvidingProxy, "processBargeInVoiceTrigger");
}

- (void)processBargeInVoiceTriggerWithResult:(id)a3
{
  -[CSSecureSiriAudioProvidingProxy processBargeInVoiceTriggerWithResult:](self->_audioProvidingProxy, "processBargeInVoiceTriggerWithResult:", a3);
}

- (void)resetFirstPassVoiceTrigger
{
  -[CSSecureSiriAudioProvidingProxy resetFirstPassVoiceTrigger](self->_audioProvidingProxy, "resetFirstPassVoiceTrigger");
}

- (BOOL)initializeSecondPass
{
  return -[CSSecureSiriAudioProvidingProxy initializeSecondPass](self->_audioProvidingProxy, "initializeSecondPass");
}

- (void)startSecondPassVoiceTriggerWithFirstPassSource:(unint64_t)a3 enablePHS:(BOOL)a4 supportMultiPhrase:(BOOL)a5
{
  uint64_t v5;

  if (a3 - 11 > 3)
    v5 = 0;
  else
    v5 = qword_1B50D74E0[a3 - 11];
  -[CSSecureSiriAudioProvidingProxy startSecondPassVoiceTriggerFromOrigin:enablePHS:supportMultiPhrase:](self->_audioProvidingProxy, "startSecondPassVoiceTriggerFromOrigin:enablePHS:supportMultiPhrase:", v5, a4, a5);
}

- (void)stopSecondPassVoiceTrigger
{
  -[CSSecureSiriAudioProvidingProxy stopSecondPassVoiceTrigger](self->_audioProvidingProxy, "stopSecondPassVoiceTrigger");
}

- (void)processSecondPassVoiceTriggerWithShouldFlushAudio:(BOOL)a3 result:(id)a4
{
  -[CSSecureSiriAudioProvidingProxy processSecondPassVoiceTriggerWithShouldFlushAudio:result:](self->_audioProvidingProxy, "processSecondPassVoiceTriggerWithShouldFlushAudio:result:", a3, a4);
}

- (BOOL)setSpeakerProfile:(id)a3 numEmbeddings:(unint64_t)a4 dimension:(unint64_t)a5 speakerRecognizerType:(unint64_t)a6
{
  return -[CSSecureSiriAudioProvidingProxy setSpeakerProfile:numEmbeddings:dimension:speakerRecognizerType:](self->_audioProvidingProxy, "setSpeakerProfile:numEmbeddings:dimension:speakerRecognizerType:", a3, a4, a5, a6);
}

- (void)setAssetForLocale:(id)a3 isOTA:(BOOL)a4 completion:(id)a5
{
  -[CSSecureSiriAudioProvidingProxy setAssetForLocale:isOTA:completion:](self->_audioProvidingProxy, "setAssetForLocale:isOTA:completion:", a3, a4, a5);
}

- (void)startSecureMobileAssetLoaderService:(BOOL)a3 completion:(id)a4
{
  -[CSSecureSiriAudioProvidingProxy startSecureMobileAssetLoaderService:completion:](self->_audioProvidingProxy, "startSecureMobileAssetLoaderService:completion:", a3, a4);
}

- (void)stopSecureMobileAssetLoaderService:(id)a3
{
  -[CSSecureSiriAudioProvidingProxy stopSecureMobileAssetLoaderService:](self->_audioProvidingProxy, "stopSecureMobileAssetLoaderService:", a3);
}

- (CSExclaveRecordClientDelegate)delegate
{
  return (CSExclaveRecordClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_source)audioFeedTimer
{
  return self->_audioFeedTimer;
}

- (void)setAudioFeedTimer:(id)a3
{
  objc_storeStrong((id *)&self->_audioFeedTimer, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)isRecording
{
  return self->_isRecording;
}

- (void)setIsRecording:(BOOL)a3
{
  self->_isRecording = a3;
}

- (CSExclaveIndicatorController)exclaveIndicatorController
{
  return self->_exclaveIndicatorController;
}

- (void)setExclaveIndicatorController:(id)a3
{
  objc_storeStrong((id *)&self->_exclaveIndicatorController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclaveIndicatorController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_audioFeedTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioProvidingProxy, 0);
}

+ (id)sharedClient
{
  if (+[CSExclaveRecordClient sharedClient]::onceToken != -1)
    dispatch_once(&+[CSExclaveRecordClient sharedClient]::onceToken, &__block_literal_global_3069);
  return (id)+[CSExclaveRecordClient sharedClient]::sharedClient;
}

void __37__CSExclaveRecordClient_sharedClient__block_invoke()
{
  CSExclaveRecordClient *v0;
  void *v1;

  v0 = objc_alloc_init(CSExclaveRecordClient);
  v1 = (void *)+[CSExclaveRecordClient sharedClient]::sharedClient;
  +[CSExclaveRecordClient sharedClient]::sharedClient = (uint64_t)v0;

}

@end
