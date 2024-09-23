@implementation CSRemoraSecondPassRequest

- (id)_secondPassWorkQueue
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.corespeech.remoram.voicetriggersecondpassq.%@,"), self->_firstPassDeviceID);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19260], "getSerialQueueWithQOS:name:fixedPriority:", 33, v2, *MEMORY[0x1E0D192F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CSRemoraSecondPassRequest)initWithDeviceID:(id)a3
{
  id v5;
  CSRemoraSecondPassRequest *v6;
  NSObject *v7;
  CSVoiceTriggerSecondPass *v8;
  void *v9;
  uint64_t v10;
  CSVoiceTriggerSecondPass *voiceTriggerSecondPass;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSRemoraSecondPassRequest;
  v6 = -[CSRemoraSecondPassRequest init](&v13, sel_init);
  if (v6)
  {
    v7 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CSRemoraSecondPassRequest initWithDeviceID:]";
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Using high priority queues for remora second pass", buf, 0xCu);
    }
    objc_storeStrong((id *)&v6->_firstPassDeviceID, a3);
    v8 = [CSVoiceTriggerSecondPass alloc];
    -[CSRemoraSecondPassRequest _secondPassWorkQueue](v6, "_secondPassWorkQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CSVoiceTriggerSecondPass initWithPHSEnabled:speechManager:supportsMphDetection:secondPassQueue:](v8, "initWithPHSEnabled:speechManager:supportsMphDetection:secondPassQueue:", 0, 0, 0, v9);
    voiceTriggerSecondPass = v6->_voiceTriggerSecondPass;
    v6->_voiceTriggerSecondPass = (CSVoiceTriggerSecondPass *)v10;

    -[CSVoiceTriggerSecondPass setFirstPassSource:](v6->_voiceTriggerSecondPass, "setFirstPassSource:", 7);
    -[CSVoiceTriggerSecondPass setSecondPassClient:](v6->_voiceTriggerSecondPass, "setSecondPassClient:", 5);
    -[CSVoiceTriggerSecondPass setFirstPassDeviceId:](v6->_voiceTriggerSecondPass, "setFirstPassDeviceId:", v6->_firstPassDeviceID);
    v6->_isSecondPassRunning = 0;
  }

  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSRemoraSecondPassRequest dealloc]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s CSRemoraFirstPassRequest is deallocated", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSRemoraSecondPassRequest;
  -[CSRemoraSecondPassRequest dealloc](&v4, sel_dealloc);
}

- (void)start
{
  -[CSVoiceTriggerSecondPass start](self->_voiceTriggerSecondPass, "start");
}

- (void)reset
{
  self->_isSecondPassRunning = 0;
  -[CSVoiceTriggerSecondPass reset](self->_voiceTriggerSecondPass, "reset");
}

- (void)setAsset:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_currentAsset, a3);
  v5 = a3;
  objc_msgSend(v5, "logAssetVersionForInsight");
  -[CSVoiceTriggerSecondPass setAsset:](self->_voiceTriggerSecondPass, "setAsset:", v5);

}

- (void)holdAudioStreamWithTimeout:(double)a3
{
  void *v4;
  CSAudioStreamHolding *v5;
  CSAudioStreamHolding *audioStreamHolding;
  id v7;

  objc_msgSend(MEMORY[0x1E0D19050], "defaultOptionWithTimeout:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CSRemoraSecondPassRequest audioProvider](self, "audioProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "holdAudioStreamWithDescription:option:", CFSTR("CSRemoraSecondPassRequest"), v7);
  v5 = (CSAudioStreamHolding *)objc_claimAutoreleasedReturnValue();
  audioStreamHolding = self->_audioStreamHolding;
  self->_audioStreamHolding = v5;

}

- (void)cancelRequest
{
  self->_isCancelled = 1;
  -[CSVoiceTriggerSecondPass cancelCurrentRequest](self->_voiceTriggerSecondPass, "cancelCurrentRequest");
  -[CSRemoraSecondPassRequest cancelAudioStreamHold](self, "cancelAudioStreamHold");
}

- (void)cancelAudioStreamHold
{
  void *v3;
  CSAudioStreamHolding *audioStreamHolding;

  -[CSRemoraSecondPassRequest audioProvider](self, "audioProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAudioStreamHold:", self->_audioStreamHolding);

  audioStreamHolding = self->_audioStreamHolding;
  self->_audioStreamHolding = 0;

}

- (NSString)firstPassDeviceID
{
  return self->_firstPassDeviceID;
}

- (void)setFirstPassDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_firstPassDeviceID, a3);
}

- (CSVoiceTriggerSecondPass)voiceTriggerSecondPass
{
  return self->_voiceTriggerSecondPass;
}

- (void)setVoiceTriggerSecondPass:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerSecondPass, a3);
}

- (BOOL)isSecondPassRunning
{
  return self->_isSecondPassRunning;
}

- (void)setIsSecondPassRunning:(BOOL)a3
{
  self->_isSecondPassRunning = a3;
}

- (CSAudioStreamHolding)audioStreamHolding
{
  return self->_audioStreamHolding;
}

- (void)setAudioStreamHolding:(id)a3
{
  objc_storeStrong((id *)&self->_audioStreamHolding, a3);
}

- (CSAudioProvider)audioProvider
{
  return self->_audioProvider;
}

- (void)setAudioProvider:(id)a3
{
  objc_storeStrong((id *)&self->_audioProvider, a3);
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setCurrentAsset:(id)a3
{
  objc_storeStrong((id *)&self->_currentAsset, a3);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (float)goodnessScore
{
  return self->_goodnessScore;
}

- (void)setGoodnessScore:(float)a3
{
  self->_goodnessScore = a3;
}

- (double)firstPassTriggerEndTime
{
  return self->_firstPassTriggerEndTime;
}

- (void)setFirstPassTriggerEndTime:(double)a3
{
  self->_firstPassTriggerEndTime = a3;
}

- (CSVoiceTriggerSecondChanceContext)secondChanceContext
{
  return self->_secondChanceContext;
}

- (void)setSecondChanceContext:(id)a3
{
  objc_storeStrong((id *)&self->_secondChanceContext, a3);
}

- (CSVoiceTriggerUserSelectedPhrase)multiPhraseSelectedStatus
{
  return self->_multiPhraseSelectedStatus;
}

- (void)setMultiPhraseSelectedStatus:(id)a3
{
  objc_storeStrong((id *)&self->_multiPhraseSelectedStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiPhraseSelectedStatus, 0);
  objc_storeStrong((id *)&self->_secondChanceContext, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_audioProvider, 0);
  objc_storeStrong((id *)&self->_audioStreamHolding, 0);
  objc_storeStrong((id *)&self->_voiceTriggerSecondPass, 0);
  objc_storeStrong((id *)&self->_firstPassDeviceID, 0);
}

@end
