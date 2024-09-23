@implementation CSVoiceTriggerStatAggregator

- (CSVoiceTriggerStatAggregator)init
{
  CSVoiceTriggerStatAggregator *v2;
  CSVoiceTriggerStatAggregator *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *falseWakePhraseDictionary;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSVoiceTriggerStatAggregator;
  v2 = -[CSVoiceTriggerStatAggregator init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_numFalseWakeUp = 0;
    v2->_lastAggTimeFalseWakeUp = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    falseWakePhraseDictionary = v3->_falseWakePhraseDictionary;
    v3->_falseWakePhraseDictionary = v4;

  }
  return v3;
}

- (void)logAOPFirstPassTriggerWakeupLatency:(float)a3
{
  AnalyticsSendEventLazy();
}

- (void)logSecondPassResult:(int)a3 eventInfo:(id)a4 triggerAPWakeUp:(BOOL)a5
{
  id v5;
  id v6;

  v6 = a4;
  v5 = v6;
  AnalyticsSendEventLazy();

}

- (void)logFalseWakeUp:(BOOL)a3 withPhrase:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSMutableDictionary *falseWakePhraseDictionary;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  int v12;
  NSMutableDictionary *v13;
  NSObject *v14;
  unint64_t numFalseWakeUp;
  double v16;
  double v17;
  unint64_t lastAggTimeFalseWakeUp;
  unint64_t v19;
  double v20;
  void *v21;
  NSObject *v22;
  unint64_t v23;
  NSMutableDictionary *v24;
  NSMutableDictionary *v25;
  NSObject *v26;
  NSMutableDictionary *v27;
  int v28;
  const char *v29;
  __int16 v30;
  _BYTE v31[28];
  uint64_t v32;

  v4 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v4)
  {
    ++self->_numFalseWakeUp;
    -[NSMutableDictionary objectForKey:](self->_falseWakePhraseDictionary, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    falseWakePhraseDictionary = self->_falseWakePhraseDictionary;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = falseWakePhraseDictionary;
    }
    else
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_falseWakePhraseDictionary, "objectForKeyedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "intValue");

      v13 = self->_falseWakePhraseDictionary;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v12 + 1));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v13;
    }
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v9, v6);

    v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      numFalseWakeUp = self->_numFalseWakeUp;
      v28 = 136315394;
      v29 = "-[CSVoiceTriggerStatAggregator logFalseWakeUp:withPhrase:]";
      v30 = 2050;
      *(_QWORD *)v31 = numFalseWakeUp;
      _os_log_impl(&dword_1B502E000, v14, OS_LOG_TYPE_DEFAULT, "%s ::: incrementing false wakeup to %{public}llu", (uint8_t *)&v28, 0x16u);
    }
  }
  +[CSUtils systemUpTime](CSUtils, "systemUpTime");
  v17 = v16;
  lastAggTimeFalseWakeUp = self->_lastAggTimeFalseWakeUp;
  if (lastAggTimeFalseWakeUp)
  {
    v19 = self->_numFalseWakeUp;
    if (v19)
    {
      v20 = v16 - (double)lastAggTimeFalseWakeUp;
      if (v20 <= 0.0)
      {
        v26 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          v27 = self->_falseWakePhraseDictionary;
          v28 = 136315906;
          v29 = "-[CSVoiceTriggerStatAggregator logFalseWakeUp:withPhrase:]";
          v30 = 2050;
          *(_QWORD *)v31 = v19;
          *(_WORD *)&v31[8] = 2050;
          *(double *)&v31[10] = v20;
          *(_WORD *)&v31[18] = 2114;
          *(_QWORD *)&v31[20] = v27;
          _os_log_impl(&dword_1B502E000, v26, OS_LOG_TYPE_DEFAULT, "%s ::: accumulated false wakeup count is %{public}llu so far, not reporting yet because it has been only %{public}.2f seconds since last report with current phrases %{public}@", (uint8_t *)&v28, 0x2Au);
        }
      }
      else
      {
        +[CSPowerLogger sharedPowerLogger](CSPowerLogger, "sharedPowerLogger");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "powerWithNumFalseWakeup:withDuration:withPhraseDict:", self->_numFalseWakeUp, self->_falseWakePhraseDictionary, v20);

        v22 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          v23 = self->_numFalseWakeUp;
          v28 = 136315906;
          v29 = "-[CSVoiceTriggerStatAggregator logFalseWakeUp:withPhrase:]";
          v30 = 1026;
          *(_DWORD *)v31 = v23;
          *(_WORD *)&v31[4] = 2050;
          *(double *)&v31[6] = v20;
          *(_WORD *)&v31[14] = 2114;
          *(_QWORD *)&v31[16] = v6;
          _os_log_impl(&dword_1B502E000, v22, OS_LOG_TYPE_DEFAULT, "%s PowerLog : HeySiriFalseTrigger numFalseWakeUp:%{public}d, secondsSinceLastReport:%{public}lf, phrase:%{public}@", (uint8_t *)&v28, 0x26u);
        }
        self->_numFalseWakeUp = 0;
        self->_lastAggTimeFalseWakeUp = (unint64_t)v17;
        v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v25 = self->_falseWakePhraseDictionary;
        self->_falseWakePhraseDictionary = v24;

      }
    }
  }
  else
  {
    self->_lastAggTimeFalseWakeUp = (unint64_t)v16;
  }

}

- (void)logTimeBasedTriggerLengthSampleCountStatistics:(unint64_t)a3 withAOPVTTriggerLengthSampleCount:(unint64_t)a4
{
  unint64_t v6;
  NSObject *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3 - a4;
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v9 = "-[CSVoiceTriggerStatAggregator logTimeBasedTriggerLengthSampleCountStatistics:withAOPVTTriggerLengthSampleCount:]";
    v10 = 2048;
    v11 = a3;
    v12 = 2048;
    v13 = a4;
    v14 = 2048;
    v15 = v6;
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Sending event with time based triggerLengthSampleCount %llu, AOPVT triggerLengthSampleCount %llu, and delta of %lld samples", buf, 0x2Au);
  }
  AnalyticsSendEventLazy();
}

- (void)reportDigitalZerosWithAudioZeroRun:(float)a3
{
  AnalyticsSendEventLazy();
}

- (unint64_t)numFalseWakeUp
{
  return self->_numFalseWakeUp;
}

- (void)setNumFalseWakeUp:(unint64_t)a3
{
  self->_numFalseWakeUp = a3;
}

- (unint64_t)lastAggTimeFalseWakeUp
{
  return self->_lastAggTimeFalseWakeUp;
}

- (void)setLastAggTimeFalseWakeUp:(unint64_t)a3
{
  self->_lastAggTimeFalseWakeUp = a3;
}

- (NSMutableDictionary)falseWakePhraseDictionary
{
  return self->_falseWakePhraseDictionary;
}

- (void)setFalseWakePhraseDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_falseWakePhraseDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_falseWakePhraseDictionary, 0);
}

id __67__CSVoiceTriggerStatAggregator_reportDigitalZerosWithAudioZeroRun___block_invoke(uint64_t a1, double a2)
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("duration");
  LODWORD(a2) = *(_DWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __113__CSVoiceTriggerStatAggregator_logTimeBasedTriggerLengthSampleCountStatistics_withAOPVTTriggerLengthSampleCount___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("newTriggerLengthSampleCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("oldTriggerLengthSampleCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("sampleCountDelta");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __78__CSVoiceTriggerStatAggregator_logSecondPassResult_eventInfo_triggerAPWakeUp___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  _QWORD v23[6];
  _QWORD v24[7];

  v24[6] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_DWORD *)"";
  if (!v2)
  {
    v7 = CFSTR("unknown");
    v6 = CFSTR("unknown");
LABEL_10:
    v10 = CFSTR("unknown");
    goto LABEL_11;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("languageCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("languageCode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (__CFString *)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = CFSTR("unknown");
  }
  v8 = *(void **)(a1 + 32);
  if (!v8)
  {
    v7 = CFSTR("unknown");
    goto LABEL_10;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("configVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("configVersion"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("unknown");
  }
  v17 = *(void **)(a1 + 32);
  if (v17)
  {
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("firstPassTriggerSource"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("firstPassTriggerSource"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = CFSTR("unknown");
    }
    v19 = *(void **)(a1 + 32);
    if (v19)
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("triggerScore"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("triggerScore"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "floatValue");
        v3 = v22;

      }
    }
  }
  else
  {
    v10 = CFSTR("unknown");
  }
LABEL_11:
  v23[0] = CFSTR("result");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  v24[1] = v6;
  v23[1] = CFSTR("languageCode");
  v23[2] = CFSTR("modelVersion");
  v24[2] = v7;
  v24[3] = v10;
  v23[3] = CFSTR("firstPassSource");
  v23[4] = CFSTR("triggerScore");
  LODWORD(v12) = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v13;
  v23[5] = CFSTR("triggerAPWakeup");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 44));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __68__CSVoiceTriggerStatAggregator_logAOPFirstPassTriggerWakeupLatency___block_invoke(uint64_t a1, double a2)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("latency");
  LODWORD(a2) = *(_DWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("device");
  v7[0] = v2;
  +[CSUtils deviceProductType](CSUtils, "deviceProductType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sharedAggregator
{
  if (sharedAggregator_onceToken != -1)
    dispatch_once(&sharedAggregator_onceToken, &__block_literal_global_7510);
  return (id)sharedAggregator_sharedAggregator;
}

void __48__CSVoiceTriggerStatAggregator_sharedAggregator__block_invoke()
{
  CSVoiceTriggerStatAggregator *v0;
  void *v1;

  v0 = objc_alloc_init(CSVoiceTriggerStatAggregator);
  v1 = (void *)sharedAggregator_sharedAggregator;
  sharedAggregator_sharedAggregator = (uint64_t)v0;

}

@end
