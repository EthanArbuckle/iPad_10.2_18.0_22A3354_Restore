@implementation CSPowerLogger

- (CSPowerLogger)init
{
  CSPowerLogger *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSPowerLogger;
  v2 = -[CSPowerLogger init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSPowerLogger queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_selfTriggerSuppressionStartTime = 1.79769313e308;
    v2->_numSelfTriggersInInterval = 0;
  }
  return v2;
}

- (void)powerLogVoiceTriggerStart
{
  -[CSPowerLogger _borealisPowerlog:](self, "_borealisPowerlog:", &unk_1E68A1658);
}

- (void)powerLogVoiceTriggerStop
{
  -[CSPowerLogger _borealisPowerlog:](self, "_borealisPowerlog:", &unk_1E68A1680);
}

- (void)powerWithNumFalseWakeup:(unint64_t)a3 withDuration:(double)a4 withPhraseDict:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("numFalseWakeUp");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a5;
  objc_msgSend(v7, "numberWithUnsignedLongLong:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  v11[1] = CFSTR("secondsSinceLastReport");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = CFSTR("phraseDict");
  v12[1] = v10;
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);

  PLLogRegisteredEvent();
}

- (void)powerLogSiriConfigWithVoiceTriggerEnabled:(BOOL)a3 withLanguage:(id)a4 withModelVersion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v11 = a4;
  v8 = a5;
  -[CSPowerLogger _updateConfigToPreferencesWithLanguage:withModelVersion:](self, "_updateConfigToPreferencesWithLanguage:withModelVersion:", v11, v8);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("HeySiriEnabled"));

  if (v11)
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("Language"));
  if (v8)
    objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("ModelVersion"));
  -[CSPowerLogger _configPowerlog:](self, "_configPowerlog:", v9);

}

- (void)powerLogSecondPassWithResult:(unint64_t)a3 withSecondPassScore:(float)a4 withPhId:(unint64_t)a5
{
  void *v7;
  double v8;
  void *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("secondPassState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v11[1] = CFSTR("secondPassScore");
  *(float *)&v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  v11[2] = CFSTR("phID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  PLLogRegisteredEvent();

}

- (void)powerLogSelfTriggerSuppressionDetectedWithSpeakerType:(unint64_t)a3 withAudioSource:(unint64_t)a4 atTime:(double)a5 isPhoneCall:(BOOL)a6
{
  _BOOL8 v6;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *queue;
  _QWORD block[5];
  _QWORD v18[4];
  _QWORD v19[4];
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v6 = a6;
  v22 = *MEMORY[0x1E0C80C00];
  v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[CSPowerLogger powerLogSelfTriggerSuppressionDetectedWithSpeakerType:withAudioSource:atTime:isPhoneCall:]";
    _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_INFO, "%s PowerLog : SelfTriggerSuppressionDetected", buf, 0xCu);
  }
  v18[0] = CFSTR("AudioPlaybackRouteType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v18[1] = CFSTR("AudioSourceType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  v18[2] = CFSTR("DetectedTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v14;
  v18[3] = CFSTR("PhoneCallConnected");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  PLLogRegisteredEvent();

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__CSPowerLogger_powerLogSelfTriggerSuppressionDetectedWithSpeakerType_withAudioSource_atTime_isPhoneCall___block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)powerLogSelfTriggerSuppressionStartWithSpeakerType:(unint64_t)a3 withAudioSource:(unint64_t)a4 atTime:(double)a5 isPhoneCall:(BOOL)a6
{
  NSObject *queue;
  _QWORD block[8];
  BOOL v8;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__CSPowerLogger_powerLogSelfTriggerSuppressionStartWithSpeakerType_withAudioSource_atTime_isPhoneCall___block_invoke;
  block[3] = &unk_1E6880D60;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  *(double *)&block[7] = a5;
  v8 = a6;
  dispatch_async(queue, block);
}

- (void)powerLogSelfTriggerSuppressionStopAtTime:(double)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__CSPowerLogger_powerLogSelfTriggerSuppressionStopAtTime___block_invoke;
  v4[3] = &unk_1E6881228;
  *(double *)&v4[5] = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (void)_borealisPowerlog:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (PLShouldLogRegisteredEvent())
  {
    PLLogRegisteredEvent();
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "-[CSPowerLogger _borealisPowerlog:]";
      v7 = 2114;
      v8 = v3;
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s PowerLog : Borealis %{public}@", (uint8_t *)&v5, 0x16u);
    }
  }

}

- (void)_configPowerlog:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (PLShouldLogRegisteredEvent())
  {
    PLLogRegisteredEvent();
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "-[CSPowerLogger _configPowerlog:]";
      v7 = 2114;
      v8 = v3;
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s PowerLog : SiriConfig %{public}@", (uint8_t *)&v5, 0x16u);
    }
  }

}

- (void)_updateConfigToPreferencesWithLanguage:(id)a3 withModelVersion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPowerLoggingCurrentLanguage:", v6);

  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPowerLoggingCurrentAssetConfigVersion:", v5);

}

- (void)_emitSelfTriggerSuppressionToBiomeWithStsDuration:(double)a3
{
  unint64_t selfTriggerSuppressionAudioSource;
  unint64_t selfTriggerSuppressionPlaybackRoute;
  uint64_t v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  int v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  selfTriggerSuppressionPlaybackRoute = self->_selfTriggerSuppressionPlaybackRoute;
  selfTriggerSuppressionAudioSource = self->_selfTriggerSuppressionAudioSource;
  if (selfTriggerSuppressionAudioSource)
    v7 = 2 * (selfTriggerSuppressionAudioSource == 1);
  else
    v7 = 1;
  v8 = selfTriggerSuppressionPlaybackRoute == 2;
  v9 = selfTriggerSuppressionPlaybackRoute == 1;
  v10 = objc_alloc(MEMORY[0x1E0D022F0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numSelfTriggersInInterval);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v10, "initWithNumSelfTriggersDetectedDuringEvent:durationOfSelfTriggerEventInSec:audioSource:isBluetoothSpeakerActive:isBuiltInSpeakerActive:", v11, v12, v7, v13, v14);

  BiomeLibrary();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "Siri");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "SelfTriggerSuppression");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "source");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sendEvent:", v15);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v23 = v22;
    objc_msgSend(v21, "timeIntervalSinceDate:", v20);
    v25 = 136315394;
    v26 = "-[CSPowerLogger _emitSelfTriggerSuppressionToBiomeWithStsDuration:]";
    v27 = 2050;
    v28 = v24;
    _os_log_impl(&dword_1B502E000, v23, OS_LOG_TYPE_DEFAULT, "%s BMSource sentEvent elapsed time = %{public}lf", (uint8_t *)&v25, 0x16u);

  }
}

- (unint64_t)selfTriggerSuppressionPlaybackRoute
{
  return self->_selfTriggerSuppressionPlaybackRoute;
}

- (void)setSelfTriggerSuppressionPlaybackRoute:(unint64_t)a3
{
  self->_selfTriggerSuppressionPlaybackRoute = a3;
}

- (unint64_t)selfTriggerSuppressionAudioSource
{
  return self->_selfTriggerSuppressionAudioSource;
}

- (void)setSelfTriggerSuppressionAudioSource:(unint64_t)a3
{
  self->_selfTriggerSuppressionAudioSource = a3;
}

- (double)selfTriggerSuppressionStartTime
{
  return self->_selfTriggerSuppressionStartTime;
}

- (void)setSelfTriggerSuppressionStartTime:(double)a3
{
  self->_selfTriggerSuppressionStartTime = a3;
}

- (unint64_t)numSelfTriggersInInterval
{
  return self->_numSelfTriggersInInterval;
}

- (void)setNumSelfTriggersInInterval:(unint64_t)a3
{
  self->_numSelfTriggersInInterval = a3;
}

- (BOOL)selfTriggerSuppressionIsPhoneCallConnected
{
  return self->_selfTriggerSuppressionIsPhoneCallConnected;
}

- (void)setSelfTriggerSuppressionIsPhoneCallConnected:(BOOL)a3
{
  self->_selfTriggerSuppressionIsPhoneCallConnected = a3;
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
}

uint64_t __58__CSPowerLogger_powerLogSelfTriggerSuppressionStopAtTime___block_invoke(uint64_t result)
{
  double v1;
  uint64_t v2;
  double v3;
  uint64_t v4;
  double v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[7];
  _QWORD v18[7];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  double v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v1 = *(double *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  v3 = *(double *)(v2 + 32);
  if (v1 >= v3)
  {
    v4 = result;
    v5 = v1 - v3;
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(v2 + 16);
      v8 = *(_QWORD *)(v2 + 24);
      v9 = *(unsigned __int8 *)(v2 + 8);
      *(_DWORD *)buf = 136316162;
      v20 = "-[CSPowerLogger powerLogSelfTriggerSuppressionStopAtTime:]_block_invoke";
      v21 = 2048;
      v22 = v7;
      v23 = 2048;
      v24 = v8;
      v25 = 2048;
      v26 = v5;
      v27 = 1024;
      v28 = v9;
      _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_INFO, "%s PowerLog : SelfTriggerSuppressionEvent for playBackRoute: %lu, audioSource: %lu, duration: %f, _selfTriggerSuppressionIsPhoneCallConnected: %d", buf, 0x30u);
      v2 = *(_QWORD *)(v4 + 32);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(v2 + 16), CFSTR("AudioPlaybackRouteType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    v17[1] = CFSTR("AudioSourceType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(v4 + 32) + 24));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v11;
    v17[2] = CFSTR("StartTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(v4 + 32) + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v12;
    v17[3] = CFSTR("StopTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(v4 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[3] = v13;
    v17[4] = CFSTR("DurationSec");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[4] = v14;
    v17[5] = CFSTR("NumSelfTriggersInInterval");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(v4 + 32) + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[5] = v15;
    v17[6] = CFSTR("PhoneCallConnected");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(v4 + 32) + 8));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[6] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 7);
    PLLogRegisteredEvent();

    result = objc_msgSend(*(id *)(v4 + 32), "_emitSelfTriggerSuppressionToBiomeWithStsDuration:", v5);
    *(_QWORD *)(*(_QWORD *)(v4 + 32) + 40) = 0;
    *(_QWORD *)(*(_QWORD *)(v4 + 32) + 32) = 0x7FEFFFFFFFFFFFFFLL;
  }
  return result;
}

double __103__CSPowerLogger_powerLogSelfTriggerSuppressionStartWithSpeakerType_withAudioSource_atTime_isPhoneCall___block_invoke(uint64_t a1)
{
  double result;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)(a1 + 48);
  result = *(double *)(a1 + 56);
  *(double *)(*(_QWORD *)(a1 + 32) + 32) = result;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = *(_BYTE *)(a1 + 64);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  return result;
}

uint64_t __106__CSPowerLogger_powerLogSelfTriggerSuppressionDetectedWithSpeakerType_withAudioSource_atTime_isPhoneCall___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

+ (id)sharedPowerLogger
{
  if (sharedPowerLogger_onceToken != -1)
    dispatch_once(&sharedPowerLogger_onceToken, &__block_literal_global_10916);
  return (id)sharedPowerLogger_sharedLogger;
}

void __34__CSPowerLogger_sharedPowerLogger__block_invoke()
{
  CSPowerLogger *v0;
  void *v1;

  v0 = objc_alloc_init(CSPowerLogger);
  v1 = (void *)sharedPowerLogger_sharedLogger;
  sharedPowerLogger_sharedLogger = (uint64_t)v0;

}

@end
