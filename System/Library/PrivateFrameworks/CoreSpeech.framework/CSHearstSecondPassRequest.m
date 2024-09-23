@implementation CSHearstSecondPassRequest

- (CSHearstSecondPassRequest)initWithDeviceID:(id)a3 speechManager:(id)a4
{
  id v7;
  id v8;
  CSHearstSecondPassRequest *v9;
  CSHearstSecondPassRequest *v10;
  CSVoiceTriggerSecondPass *v11;
  CSVoiceTriggerSecondPass *voiceTriggerSecondPass;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CSHearstSecondPassRequest;
  v9 = -[CSHearstSecondPassRequest init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_speechManager, a4);
    objc_storeStrong((id *)&v10->_firstPassDeviceID, a3);
    v11 = -[CSVoiceTriggerSecondPass initWithPHSEnabled:speechManager:supportsMphDetection:secondPassQueue:]([CSVoiceTriggerSecondPass alloc], "initWithPHSEnabled:speechManager:supportsMphDetection:secondPassQueue:", 0, v10->_speechManager, 0, 0);
    voiceTriggerSecondPass = v10->_voiceTriggerSecondPass;
    v10->_voiceTriggerSecondPass = v11;

    -[CSVoiceTriggerSecondPass setFirstPassSource:](v10->_voiceTriggerSecondPass, "setFirstPassSource:", 3);
    -[CSVoiceTriggerSecondPass setSecondPassClient:](v10->_voiceTriggerSecondPass, "setSecondPassClient:", 2);
    v10->_remoteMicVADScore = -1.0;
    v10->_isSecondPassRunning = 0;
  }

  return v10;
}

- (CSHearstSecondPassRequest)initWithDeviceID:(id)a3
{
  id v4;
  void *v5;
  CSHearstSecondPassRequest *v6;

  v4 = a3;
  +[CSSpeechManager sharedManagerForCoreSpeechDaemon](CSSpeechManager, "sharedManagerForCoreSpeechDaemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CSHearstSecondPassRequest initWithDeviceID:speechManager:](self, "initWithDeviceID:speechManager:", v4, v5);

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
    v6 = "-[CSHearstSecondPassRequest dealloc]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s CSHearstSecondPassRequest is deallocated", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSHearstSecondPassRequest;
  -[CSHearstSecondPassRequest dealloc](&v4, sel_dealloc);
}

- (void)start
{
  -[CSVoiceTriggerSecondPass start](self->_voiceTriggerSecondPass, "start");
}

- (void)reset
{
  self->_remoteMicVADScore = -1.0;
  self->_isSecondPassRunning = 0;
  -[CSVoiceTriggerSecondPass reset](self->_voiceTriggerSecondPass, "reset");
}

- (void)setAsset:(id)a3
{
  -[CSVoiceTriggerSecondPass setAsset:](self->_voiceTriggerSecondPass, "setAsset:", a3);
}

- (void)holdAudioStreamWithTimeout:(double)a3
{
  void *v4;
  CSAudioStreamHolding *v5;
  CSAudioStreamHolding *audioStreamHolding;
  id v7;

  objc_msgSend(MEMORY[0x1E0D19050], "defaultOptionWithTimeout:", 5.0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CSHearstSecondPassRequest audioProvider](self, "audioProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "holdAudioStreamWithDescription:option:", CFSTR("CSHearstSecondPassRequest"), v7);
  v5 = (CSAudioStreamHolding *)objc_claimAutoreleasedReturnValue();
  audioStreamHolding = self->_audioStreamHolding;
  self->_audioStreamHolding = v5;

}

- (void)cancelAudioStreamHold
{
  void *v3;
  CSAudioStreamHolding *audioStreamHolding;

  -[CSHearstSecondPassRequest audioProvider](self, "audioProvider");
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

- (float)remoteMicVADScore
{
  return self->_remoteMicVADScore;
}

- (void)setRemoteMicVADScore:(float)a3
{
  self->_remoteMicVADScore = a3;
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

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setSpeechManager:(id)a3
{
  objc_storeStrong((id *)&self->_speechManager, a3);
}

- (CSVoiceTriggerSecondChanceContext)secondChanceContext
{
  return self->_secondChanceContext;
}

- (void)setSecondChanceContext:(id)a3
{
  objc_storeStrong((id *)&self->_secondChanceContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondChanceContext, 0);
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_storeStrong((id *)&self->_audioProvider, 0);
  objc_storeStrong((id *)&self->_audioStreamHolding, 0);
  objc_storeStrong((id *)&self->_voiceTriggerSecondPass, 0);
  objc_storeStrong((id *)&self->_firstPassDeviceID, 0);
}

@end
