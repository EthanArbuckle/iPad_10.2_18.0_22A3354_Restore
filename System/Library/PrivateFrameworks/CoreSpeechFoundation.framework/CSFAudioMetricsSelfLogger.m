@implementation CSFAudioMetricsSelfLogger

- (CSFAudioMetricsSelfLogger)init
{
  CSFAudioMetricsSelfLogger *v3;
  objc_super v5;

  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CSFAudioMetricsSelfLogger;
    self = -[CSFAudioMetricsSelfLogger init](&v5, sel_init);
    v3 = self;
  }

  return v3;
}

- (id)_getSelfFanWithCSSiriFanInfo:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "count", (_QWORD)v16) == 3)
        {
          v11 = objc_alloc_init(MEMORY[0x1E0D998D0]);
          objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setFanId:", objc_msgSend(v12, "intValue"));

          objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setCurrentSpeed:", objc_msgSend(v13, "intValue"));

          objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setTargetSpeed:", objc_msgSend(v14, "intValue"));

          objc_msgSend(v4, "addObject:", v11);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (int)_getSelfStopRecordingReasonWithADStopRecordingEvent:(unsigned __int16)a3
{
  if (a3 > 8u)
    return 1;
  else
    return *(_DWORD *)&aMcplsupoxeps[4 * a3 + 12];
}

- (int)_getMHBluetoothAudioDeviceCategoryFromString:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D480E0]) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D48108]) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D480E8]) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D480F0]) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D48100]))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_getRunPairs:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v10 = objc_alloc_init(MEMORY[0x1E0D99A80]);
        objc_msgSend(v9, "objectForKey:", CFSTR("start"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setZeroRunStartingSample:", (int)objc_msgSend(v11, "intValue"));

        objc_msgSend(v9, "objectForKey:", CFSTR("len"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setZeroRunLength:", (int)objc_msgSend(v12, "intValue"));

        objc_msgSend(v4, "addObject:", v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v4);
  return v13;
}

- (id)_getPreprocessorCompletedMessageWithMetrics:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D99A78]);
  objc_msgSend(v4, "objectForKey:", CFSTR("ZeroFilterMetrics"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("CSInitialContinuousZeros"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInitialContinousZeros:", (int)objc_msgSend(v8, "intValue"));

    objc_msgSend(v7, "objectForKey:", CFSTR("CSMaxContinuousZeros"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMaxContinousZeros:", (int)objc_msgSend(v9, "intValue"));

    objc_msgSend(v7, "objectForKey:", CFSTR("CSMidSegmentContinuousZeros"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[CSFAudioMetricsSelfLogger _getRunPairs:](self, "_getRunPairs:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMidSegmentContinousZeros:", v11);

    }
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("BeepCancellerMetrics"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("beepLocation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBeepLocation:", objc_msgSend(v14, "intValue"));

    objc_msgSend(v13, "objectForKey:", CFSTR("statsComputed"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStatsComputed:", objc_msgSend(v15, "intValue"));

    objc_msgSend(v13, "objectForKey:", CFSTR("beepPower"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    objc_msgSend(v5, "setBeepPower:");

    objc_msgSend(v13, "objectForKey:", CFSTR("signalPower"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    objc_msgSend(v5, "setSignalPower:");

    objc_msgSend(v13, "objectForKey:", CFSTR("originalPower"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    objc_msgSend(v5, "setOriginalPower:");

    objc_msgSend(v13, "objectForKey:", CFSTR("absMaxVal"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    objc_msgSend(v5, "setAbsMaxVal:");

    objc_msgSend(v13, "objectForKey:", CFSTR("above95pcOfMax"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    objc_msgSend(v5, "setAboveNinetyFivepcOfMax:");

    objc_msgSend(v13, "objectForKey:", CFSTR("totalInputSamples"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNumTotalInputSamples:", (int)objc_msgSend(v21, "intValue"));

    objc_msgSend(v13, "objectForKey:", CFSTR("totalOutputSamples"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNumTotalOutputSamples:", (int)objc_msgSend(v22, "intValue"));

  }
  return v5;
}

- (void)logCoreSpeechPreprocessorCompletedWithMHUUID:(id)a3 withMetricsDictionary:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  -[CSFAudioMetricsSelfLogger _getPreprocessorCompletedMessageWithMetrics:](self, "_getPreprocessorCompletedMessageWithMetrics:", a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  v8 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v6);

  objc_msgSend(v8, "setMhId:", v9);
  objc_msgSend(v7, "setEventMetadata:", v8);
  objc_msgSend(v7, "setCoreSpeechPreprocessorCompleted:", v11);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emitMessage:", v7);

}

- (void)logMHASRAudioConfigureStartedWithMHUUID:(id)a3 withAudioCodecString:(id)a4 withAudioSkippedNumSamples:(unint64_t)a5
{
  objc_class *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v7 = (objc_class *)MEMORY[0x1E0D998A0];
  v8 = a4;
  v9 = a3;
  v15 = objc_alloc_init(v7);
  v10 = SASCodecForString();

  objc_msgSend(v15, "setAudioCodec:", v10);
  if (a5)
    objc_msgSend(v15, "setAudioSkippedNumSamples:", a5);
  v11 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  v12 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v9);

  objc_msgSend(v12, "setMhId:", v13);
  objc_msgSend(v11, "setEventMetadata:", v12);
  objc_msgSend(v11, "setAsrAudioConfigureStarted:", v15);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "emitMessage:", v11);

}

- (void)logMHASRAudioConfigureStartedWithMHUUID:(id)a3 withAudioCodecString:(id)a4 withAudioSkippedTimeInNs:(unint64_t)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315906;
    v16 = "-[CSFAudioMetricsSelfLogger logMHASRAudioConfigureStartedWithMHUUID:withAudioCodecString:withAudioSkippedTimeInNs:]";
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    v21 = 2048;
    v22 = a5;
    _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s logMHASRAudioConfigureStartedWithMHUUID: %@, CodeC: %@, SkippedTimeInNs:%llu", (uint8_t *)&v15, 0x2Au);
  }
  v10 = objc_alloc_init(MEMORY[0x1E0D998A0]);
  objc_msgSend(v10, "setAudioCodec:", SASCodecForString());
  objc_msgSend(v10, "setAudioSkippedTimeInNs:", a5);
  v11 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  v12 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v7);
  objc_msgSend(v12, "setMhId:", v13);

  objc_msgSend(v11, "setEventMetadata:", v12);
  objc_msgSend(v11, "setAsrAudioConfigureStarted:", v10);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "emitMessage:", v11);

}

- (void)logMHAssistantDaemonAudioInitContextWithMHUUID:(id)a3 withInitStarted:(BOOL)a4
{
  _BOOL4 v4;
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v5 = (objc_class *)MEMORY[0x1E0D998F0];
  v6 = a3;
  v12 = objc_alloc_init(v5);
  if (v4)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D99900]);
    objc_msgSend(v7, "setExists:", 1);
    objc_msgSend(v12, "setStartedOrChanged:", v7);
    objc_msgSend(v12, "setHasStartedOrChanged:", 1);
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D998F8]);
    objc_msgSend(v7, "setExists:", 1);
    objc_msgSend(v12, "setEnded:", v7);
    objc_msgSend(v12, "setHasEnded:", 1);
  }

  v8 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  v9 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v6);

  objc_msgSend(v9, "setMhId:", v10);
  objc_msgSend(v8, "setEventMetadata:", v9);
  objc_msgSend(v8, "setAssistantDaemonAudioInitContext:", v12);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "emitMessage:", v8);

}

- (void)logMHAssistantDaemonAudioConfigureContextWithMHUUID:(id)a3 withConfigureStarted:(BOOL)a4
{
  _BOOL4 v4;
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v5 = (objc_class *)MEMORY[0x1E0D998B8];
  v6 = a3;
  v12 = objc_alloc_init(v5);
  if (v4)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D998C8]);
    objc_msgSend(v7, "setExists:", 1);
    objc_msgSend(v12, "setStartedOrChanged:", v7);
    objc_msgSend(v12, "setHasStartedOrChanged:", 1);
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D998C0]);
    objc_msgSend(v7, "setExists:", 1);
    objc_msgSend(v12, "setEnded:", v7);
    objc_msgSend(v12, "setHasEnded:", 1);
  }

  v8 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  v9 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v6);

  objc_msgSend(v9, "setMhId:", v10);
  objc_msgSend(v8, "setEventMetadata:", v9);
  objc_msgSend(v8, "setAssistantDaemonAudioConfigureContext:", v12);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "emitMessage:", v8);

}

- (void)logMHAssistantDaemonAudioPrepareContextWithMHUUID:(id)a3 withPrepareStarted:(BOOL)a4
{
  _BOOL4 v4;
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v5 = (objc_class *)MEMORY[0x1E0D99910];
  v6 = a3;
  v12 = objc_alloc_init(v5);
  if (v4)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D99920]);
    objc_msgSend(v7, "setExists:", 1);
    objc_msgSend(v12, "setStartedOrChanged:", v7);
    objc_msgSend(v12, "setHasStartedOrChanged:", 1);
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D99918]);
    objc_msgSend(v7, "setExists:", 1);
    objc_msgSend(v12, "setEnded:", v7);
    objc_msgSend(v12, "setHasEnded:", 1);
  }

  v8 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  v9 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v6);

  objc_msgSend(v9, "setMhId:", v10);
  objc_msgSend(v8, "setEventMetadata:", v9);
  objc_msgSend(v8, "setAssistantDaemonAudioPrepareContext:", v12);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "emitMessage:", v8);

}

- (void)logMHAssistantDaemonAudioPrewarmContextWithMHUUID:(id)a3 withPrewarmStarted:(BOOL)a4
{
  _BOOL4 v4;
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v5 = (objc_class *)MEMORY[0x1E0D99928];
  v6 = a3;
  v12 = objc_alloc_init(v5);
  if (v4)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D99938]);
    objc_msgSend(v7, "setExists:", 1);
    objc_msgSend(v12, "setStartedOrChanged:", v7);
    objc_msgSend(v12, "setHasStartedOrChanged:", 1);
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D99930]);
    objc_msgSend(v7, "setExists:", 1);
    objc_msgSend(v12, "setEnded:", v7);
    objc_msgSend(v12, "setHasEnded:", 1);
  }

  v8 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  v9 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v6);

  objc_msgSend(v9, "setMhId:", v10);
  objc_msgSend(v8, "setEventMetadata:", v9);
  objc_msgSend(v8, "setAssistantDaemonAudioPrewarmContext:", v12);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "emitMessage:", v8);

}

- (void)logMHAssistantDaemonAudioStartRecordingContextWithMHUUID:(id)a3 withStartRecordingContext:(BOOL)a4 withFanInfoArray:(id)a5 withActiveSessionDisplayIDs:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v8 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init(MEMORY[0x1E0D999F0]);
  if (v8)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0D99A00]);
    objc_msgSend(v14, "setExists:", 1);
    objc_msgSend(v13, "setStartedOrChanged:", v14);
    objc_msgSend(v13, "setHasStartedOrChanged:", 1);
  }
  else
  {
    v14 = objc_alloc_init(MEMORY[0x1E0D999F8]);
    if (v11)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      -[CSFAudioMetricsSelfLogger _getSelfFanWithCSSiriFanInfo:](self, "_getSelfFanWithCSSiriFanInfo:", v11, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v25;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v25 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(v14, "addFanInfo:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v19++));
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v17);
      }

    }
    objc_msgSend(v14, "setActiveSessionDisplayIds:", v12);
    objc_msgSend(v13, "setEnded:", v14);
    objc_msgSend(v13, "setHasEnded:", 1);
  }

  v20 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  v21 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v10);
  objc_msgSend(v21, "setMhId:", v22);

  objc_msgSend(v20, "setEventMetadata:", v21);
  objc_msgSend(v20, "setAssistantDaemonAudioStartRecordingContext:", v13);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "emitMessage:", v20);

}

- (void)logMHAssistantDaemonAudioStopRecordingContextWithMHUUID:(id)a3 withStopRecordingStarted:(BOOL)a4 withADStopRecordingEvent:(unsigned __int16)a5
{
  uint64_t v5;
  _BOOL4 v6;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a5;
  v6 = a4;
  v8 = (objc_class *)MEMORY[0x1E0D99A08];
  v9 = a3;
  v15 = objc_alloc_init(v8);
  if (v6)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D99A18]);
    objc_msgSend(v10, "setStopReason:", -[CSFAudioMetricsSelfLogger _getSelfStopRecordingReasonWithADStopRecordingEvent:](self, "_getSelfStopRecordingReasonWithADStopRecordingEvent:", v5));
    objc_msgSend(v15, "setStartedOrChanged:", v10);
    objc_msgSend(v15, "setHasStartedOrChanged:", 1);
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D99A10]);
    objc_msgSend(v15, "setEnded:", v10);
    objc_msgSend(v15, "setHasEnded:", 1);
  }

  v11 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  v12 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v9);

  objc_msgSend(v12, "setMhId:", v13);
  objc_msgSend(v11, "setEventMetadata:", v12);
  objc_msgSend(v11, "setAssistantDaemonAudioStopRecordingContext:", v15);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "emitMessage:", v11);

}

- (void)logMHAssistantDaemonAudioSessionSetActivateContextWithMHUUID:(id)a3 withSetActivateStarted:(BOOL)a4
{
  _BOOL4 v4;
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v5 = (objc_class *)MEMORY[0x1E0D999C0];
  v6 = a3;
  v12 = objc_alloc_init(v5);
  if (v4)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D999D0]);
    objc_msgSend(v7, "setExists:", 1);
    objc_msgSend(v12, "setStartedOrChanged:", v7);
    objc_msgSend(v12, "setHasStartedOrChanged:", 1);
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D999C8]);
    objc_msgSend(v7, "setExists:", 1);
    objc_msgSend(v12, "setEnded:", v7);
    objc_msgSend(v12, "setHasEnded:", 1);
  }

  v8 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  v9 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v6);

  objc_msgSend(v9, "setMhId:", v10);
  objc_msgSend(v8, "setEventMetadata:", v9);
  objc_msgSend(v8, "setAssistantDaemonAudioSessionSetActiveContext:", v12);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "emitMessage:", v8);

}

- (void)logMHAssistantDaemonAudioSessionSetInactiveWithMHUUID:(id)a3 withSetInactiveStarted:(BOOL)a4
{
  _BOOL4 v4;
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v5 = (objc_class *)MEMORY[0x1E0D999D8];
  v6 = a3;
  v12 = objc_alloc_init(v5);
  if (v4)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D999E8]);
    objc_msgSend(v7, "setExists:", 1);
    objc_msgSend(v12, "setStartedOrChanged:", v7);
    objc_msgSend(v12, "setHasStartedOrChanged:", 1);
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D999E0]);
    objc_msgSend(v7, "setExists:", 1);
    objc_msgSend(v12, "setEnded:", v7);
    objc_msgSend(v12, "setHasEnded:", 1);
  }

  v8 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  v9 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v6);

  objc_msgSend(v9, "setMhId:", v10);
  objc_msgSend(v8, "setEventMetadata:", v9);
  objc_msgSend(v8, "setAssistantDaemonAudioSessionSetInactiveContext:", v12);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "emitMessage:", v8);

}

- (void)logMHAssistantDaemonAudioFetchRouteContextWithMHUUID:(id)a3 withFetchRouteContextStarted:(BOOL)a4
{
  _BOOL4 v4;
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v5 = (objc_class *)MEMORY[0x1E0D998D8];
  v6 = a3;
  v12 = objc_alloc_init(v5);
  if (v4)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D998E8]);
    objc_msgSend(v7, "setExists:", 1);
    objc_msgSend(v12, "setStartedOrChanged:", v7);
    objc_msgSend(v12, "setHasStartedOrChanged:", 1);
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D998E0]);
    objc_msgSend(v7, "setExists:", 1);
    objc_msgSend(v12, "setEnded:", v7);
    objc_msgSend(v12, "setHasEnded:", 1);
  }

  v8 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  v9 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v6);

  objc_msgSend(v9, "setMhId:", v10);
  objc_msgSend(v8, "setEventMetadata:", v9);
  objc_msgSend(v8, "setAssistantDaemonAudioFetchRouteContext:", v12);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "emitMessage:", v8);

}

- (void)logMHAssistantDaemonAudioRecordingContextWithMHUUID:(id)a3 withAudioRecordingStarted:(BOOL)a4 withAudioInputRoute:(int)a5 withAudioSource:(int)a6 withAudioInterfaceVendorId:(id)a7 withAudioInterfaceProductId:(id)a8
{
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  id v13;
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;

  v9 = *(_QWORD *)&a6;
  v10 = *(_QWORD *)&a5;
  v11 = a4;
  v22 = a7;
  v13 = a8;
  v14 = (objc_class *)MEMORY[0x1E0D99948];
  v15 = a3;
  v16 = objc_alloc_init(v14);
  if (v11)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0D999B8]);
    objc_msgSend(v17, "setAudioInputRoute:", v10);
    objc_msgSend(v17, "setSource:", v9);
    objc_msgSend(v17, "setAudioInterfaceVendorId:", v22);
    objc_msgSend(v17, "setAudioInterfaceProductId:", v13);
    objc_msgSend(v16, "setStartedOrChanged:", v17);
    objc_msgSend(v16, "setHasStartedOrChanged:", 1);
  }
  else
  {
    v17 = objc_alloc_init(MEMORY[0x1E0D99950]);
    objc_msgSend(v17, "setExists:", 1);
    objc_msgSend(v16, "setEnded:", v17);
    objc_msgSend(v16, "setHasEnded:", 1);
  }

  v18 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  v19 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v15);

  objc_msgSend(v19, "setMhId:", v20);
  objc_msgSend(v18, "setEventMetadata:", v19);
  objc_msgSend(v18, "setAssistantDaemonAudioRecordingContext:", v16);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "emitMessage:", v18);

}

- (void)logMHAssistantDaemonAudioRecordingMissedBufferDetectedWithMHUUID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0D999B0];
  v4 = a3;
  v9 = objc_alloc_init(v3);
  objc_msgSend(v9, "setExists:", 1);
  v5 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  objc_msgSend(v5, "setAssistantDaemonAudioRecordingMissedBufferDetected:", v9);
  v6 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v4);

  objc_msgSend(v6, "setMhId:", v7);
  objc_msgSend(v5, "setEventMetadata:", v6);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "emitMessage:", v5);

}

- (void)logMHAssistantDaemonAudioLateBufferDetectedWithMHUUID:(id)a3 withBufferReceiptTimeInNs:(unint64_t)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = (objc_class *)MEMORY[0x1E0D99908];
  v6 = a3;
  v10 = objc_alloc_init(v5);
  objc_msgSend(v10, "setBufferReceiptTimeOffsetInNs:", a4);
  v7 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  v8 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v6);

  objc_msgSend(v8, "setMhId:", v9);
  objc_msgSend(v7, "setEventMetadata:", v8);
  objc_msgSend(v7, "setAssistantDaemonAudioLateBufferDetected:", v10);

}

- (void)logMHAssistantDaemonAudioRecordingFirstBufferWithMHUUID:(id)a3 withStartEvent:(BOOL)a4 withFirstBufferStartTimeOffsetNs:(unint64_t)a5 withFirstBufferReceiptTimeOffsetNs:(unint64_t)a6
{
  _BOOL4 v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a4;
  v9 = (objc_class *)MEMORY[0x1E0D99968];
  v10 = a3;
  v16 = objc_alloc_init(v9);
  if (v8)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0D99970]);
    objc_msgSend(v11, "setFirstBufferStartTimeOffsetInNs:", a5);
    objc_msgSend(v16, "setStartedOrChanged:", v11);
    objc_msgSend(v16, "setHasStartedOrChanged:", 1);
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0D99940]);
    objc_msgSend(v11, "setFirstBufferReceiptTimeOffsetInNs:", a6);
    objc_msgSend(v16, "setEnded:", v11);
    objc_msgSend(v16, "setHasEnded:", 1);
  }

  v12 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  v13 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v10);

  objc_msgSend(v13, "setMhId:", v14);
  objc_msgSend(v12, "setEventMetadata:", v13);
  objc_msgSend(v12, "setAssistantDaemonAudioRecordingFirstBufferContext:", v16);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "emitMessage:", v12);

}

- (void)logMHAssistantDaemonAudioRecordingLastBufferWithMHUUID:(id)a3 withStartEvent:(BOOL)a4 withLastBufferStartTimeOffsetNs:(unint64_t)a5 withLastBufferReceiptTimeOffsetNs:(unint64_t)a6
{
  _BOOL4 v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a4;
  v9 = (objc_class *)MEMORY[0x1E0D99998];
  v10 = a3;
  v16 = objc_alloc_init(v9);
  if (v8)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0D999A8]);
    objc_msgSend(v11, "setLastAudioRecordBufferStartTimeOffsetInNs:", a5);
    objc_msgSend(v16, "setStartedOrChanged:", v11);
    objc_msgSend(v16, "setHasStartedOrChanged:", 1);
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0D999A0]);
    objc_msgSend(v11, "setLastAudioRecordBufferReceiptTimeOffsetInNs:", a6);
    objc_msgSend(v16, "setEnded:", v11);
    objc_msgSend(v16, "setHasEnded:", 1);
  }

  v12 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  v13 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v10);

  objc_msgSend(v13, "setMhId:", v14);
  objc_msgSend(v12, "setEventMetadata:", v13);
  objc_msgSend(v12, "setAssistantDaemonAudioRecordingLastBufferContext:", v16);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "emitMessage:", v12);

}

- (void)logMHAssistantDaemonAudioRecordingInterruptionContextWithMHUUID:(id)a3 withStartEvent:(BOOL)a4 withLinkID:(id)a5 withAvAudioSessionInterruptorName:(id)a6 withAVAudioSessionInterrupterType:(id)a7
{
  _BOOL4 v9;
  id v11;
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;

  v9 = a4;
  v22 = a5;
  v11 = a6;
  v12 = a7;
  v13 = (objc_class *)MEMORY[0x1E0D99978];
  v14 = a3;
  v15 = objc_alloc_init(v13);
  if (v9)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0D99988]);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v22);
    objc_msgSend(v16, "setLinkId:", v17);

    objc_msgSend(v16, "setAvAudioSessionInterruptorName:", v11);
    objc_msgSend(v16, "setAvAudioSessionInterruptionType:", v12);
    objc_msgSend(v15, "setStartedOrChanged:", v16);
    objc_msgSend(v15, "setHasStartedOrChanged:", 1);
  }
  else
  {
    v16 = objc_alloc_init(MEMORY[0x1E0D99980]);
    objc_msgSend(v16, "setExists:", 1);
    objc_msgSend(v15, "setEnded:", v16);
    objc_msgSend(v15, "setHasEnded:", 1);
  }

  v18 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  v19 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v14);

  objc_msgSend(v19, "setMhId:", v20);
  objc_msgSend(v18, "setEventMetadata:", v19);
  objc_msgSend(v18, "setAssistantDaemonAudioRecordingInterruptionContext:", v15);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "emitMessage:", v18);

}

- (void)logMHAssistantDaemonAudioRecordingInterruptionStartedTier1WithMHUUID:(id)a3 withLinkID:(id)a4 withActiveSessionDisplayIDs:(id)a5 audioSessionCategory:(id)a6 audioSessionMode:(id)a7
{
  id v12;
  id v13;
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  int v27;
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = a7;
  v14 = (objc_class *)MEMORY[0x1E0D99990];
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = objc_alloc_init(v14);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v16);

  objc_msgSend(v18, "setLinkId:", v19);
  objc_msgSend(v18, "setActiveSessionDisplayIds:", v15);

  v20 = -[CSFAudioMetricsSelfLogger _translateAudioSessionCategory:](self, "_translateAudioSessionCategory:", v12);
  v21 = -[CSFAudioMetricsSelfLogger _translateAudioSessionMode:](self, "_translateAudioSessionMode:", v13);
  v22 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 136316162;
    v28 = "-[CSFAudioMetricsSelfLogger logMHAssistantDaemonAudioRecordingInterruptionStartedTier1WithMHUUID:withLinkID:wi"
          "thActiveSessionDisplayIDs:audioSessionCategory:audioSessionMode:]";
    v29 = 2112;
    v30 = v12;
    v31 = 1024;
    v32 = v20;
    v33 = 2112;
    v34 = v13;
    v35 = 1024;
    v36 = v21;
    _os_log_impl(&dword_1B502E000, v22, OS_LOG_TYPE_DEFAULT, "%s Currently Active Category: %@[%d]. Mode: %@[%d]", (uint8_t *)&v27, 0x2Cu);
  }
  objc_msgSend(v18, "setAudioSessionCategory:", v20);
  objc_msgSend(v18, "setAudioSessionMode:", v21);
  v23 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  v24 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v17);

  objc_msgSend(v24, "setMhId:", v25);
  objc_msgSend(v23, "setEventMetadata:", v24);
  objc_msgSend(v23, "setAssistantDaemonAudioRecordingInterruptionStartedTier1:", v18);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "emitMessage:", v23);

}

- (void)logMHAssistantDaemonAudioBluetoothInfoWithMHUUID:(id)a3 withWirelessSplitterSessionState:(int)a4 withAudioDeviceCategory:(id)a5
{
  uint64_t v5;
  objc_class *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v5 = *(_QWORD *)&a4;
  v8 = (objc_class *)MEMORY[0x1E0D998B0];
  v9 = a5;
  v10 = a3;
  v16 = objc_alloc_init(v8);
  v11 = -[CSFAudioMetricsSelfLogger _getMHBluetoothAudioDeviceCategoryFromString:](self, "_getMHBluetoothAudioDeviceCategoryFromString:", v9);

  objc_msgSend(v16, "setState:", v5);
  objc_msgSend(v16, "setBluetoothAudioDeviceCategory:", v11);
  v12 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  v13 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v10);

  objc_msgSend(v13, "setMhId:", v14);
  objc_msgSend(v12, "setEventMetadata:", v13);
  objc_msgSend(v12, "setAssistantDaemonAudioBluetoothInfo:", v16);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "emitMessage:", v12);

}

- (void)logMHApplicationPlaybackAttemptedWithMHUUID:(id)a3 withAppBundleName:(id)a4 withAppBundleVersion:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v7 = (objc_class *)MEMORY[0x1E0D998A8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v15 = objc_alloc_init(v7);
  objc_msgSend(v15, "setAppBundleName:", v9);

  objc_msgSend(v15, "setAppBundleVersion:", v8);
  v11 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  v12 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v10);

  objc_msgSend(v12, "setMhId:", v13);
  objc_msgSend(v11, "setEventMetadata:", v12);
  objc_msgSend(v11, "setApplicationPlaybackAttempted:", v15);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "emitMessage:", v11);

}

- (void)logMHAssistantDaemonAudioRecordingFailedWithMHUUID:(id)a3 withReason:(int64_t)a4 vendorId:(id)a5 productId:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v10 = (objc_class *)MEMORY[0x1E0D99958];
  v11 = a6;
  v12 = a5;
  v13 = a3;
  v18 = objc_alloc_init(v10);
  objc_msgSend(v18, "setReason:", -[CSFAudioMetricsSelfLogger _getSpeechErrorTypeWithRecordingFailedReason:](self, "_getSpeechErrorTypeWithRecordingFailedReason:", a4));
  objc_msgSend(v18, "setAudioInterfaceVendorId:", v12);

  objc_msgSend(v18, "setAudioInterfaceProductId:", v11);
  v14 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  v15 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v13);

  objc_msgSend(v15, "setMhId:", v16);
  objc_msgSend(v14, "setEventMetadata:", v15);
  objc_msgSend(v14, "setAudioRecordingFailed:", v18);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "emitMessage:", v14);

}

- (void)logMHAssistantDaemonAudioSessionActivationFailedWithInsufficientPriority:(id)a3 activeSessionDisplayIDs:(id)a4 audioSessionCategory:(id)a5 audioSessionMode:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v10 = (objc_class *)MEMORY[0x1E0D99960];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v21 = objc_alloc_init(v10);
  v15 = -[CSFAudioMetricsSelfLogger _translateAudioSessionCategory:](self, "_translateAudioSessionCategory:", v12);

  objc_msgSend(v21, "setAudioSessionCategory:", v15);
  v16 = -[CSFAudioMetricsSelfLogger _translateAudioSessionMode:](self, "_translateAudioSessionMode:", v11);

  objc_msgSend(v21, "setAudioSessionMode:", v16);
  objc_msgSend(v21, "setActiveSessionDisplayIds:", v13);

  v17 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  v18 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v14);

  objc_msgSend(v18, "setMhId:", v19);
  objc_msgSend(v17, "setEventMetadata:", v18);
  objc_msgSend(v17, "setAssistantDaemonAudioRecordingFailureInsufficientPriority:", v21);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "emitMessage:", v17);

}

- (int)_getSpeechErrorTypeWithRecordingFailedReason:(int64_t)a3
{
  return a3 == 1;
}

- (int)_translateAudioSessionCategory:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D48F50]) & 1) != 0)
    {
      v5 = 5;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D48E90]) & 1) != 0)
    {
      v5 = 16;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D48F78]) & 1) != 0)
    {
      v5 = 11;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D48F40]) & 1) != 0)
    {
      v5 = 13;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D48EA0]) & 1) != 0)
    {
      v5 = 1;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D48F98]) & 1) != 0)
    {
      v5 = 2;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D48F08]) & 1) != 0)
    {
      v5 = 3;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D48F68]) & 1) != 0)
    {
      v5 = 4;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D48F28]) & 1) != 0)
    {
      v5 = 12;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D48FF8]) & 1) != 0)
    {
      v5 = 8;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D48FD8]) & 1) != 0)
    {
      v5 = 7;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D48F80]) & 1) != 0)
    {
      v5 = 10;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D49000]) & 1) != 0)
    {
      v5 = 9;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D48FC0]) & 1) != 0)
    {
      v5 = 15;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D48F10]) & 1) != 0)
    {
      v5 = 17;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D48EB8]) & 1) != 0)
    {
      v5 = 18;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D48ED0]) & 1) != 0)
    {
      v5 = 19;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D48EF0]) & 1) != 0)
    {
      v5 = 20;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D49010]) & 1) != 0)
    {
      v5 = 21;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D48ED8]) & 1) != 0)
    {
      v5 = 23;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D48FB0]) & 1) != 0)
    {
      v5 = 24;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D48FA8]) & 1) != 0)
    {
      v5 = 25;
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D49028]))
    {
      v5 = 26;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int)_translateAudioSessionMode:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D49088]) & 1) != 0)
    {
      v5 = 1;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D491E8]) & 1) != 0)
    {
      v5 = 2;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D490B8]) & 1) != 0)
    {
      v5 = 3;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D491D8]) & 1) != 0)
    {
      v5 = 4;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D49100]) & 1) != 0)
    {
      v5 = 5;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D49110]) & 1) != 0)
    {
      v5 = 6;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D491A8]) & 1) != 0)
    {
      v5 = 8;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D491B8]) & 1) != 0)
    {
      v5 = 7;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D49170]) & 1) != 0)
    {
      v5 = 22;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D49208]) & 1) != 0)
    {
      v5 = 9;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D49168]) & 1) != 0)
    {
      v5 = 21;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D49198]) & 1) != 0)
    {
      v5 = 14;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D49120]) & 1) != 0)
    {
      v5 = 15;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D491F8]) & 1) != 0)
    {
      v5 = 16;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D490A8]) & 1) != 0)
    {
      v5 = 17;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D490E0]) & 1) != 0)
    {
      v5 = 19;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D49140]) & 1) != 0)
    {
      v5 = 20;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D491C8]) & 1) != 0)
    {
      v5 = 11;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D49158]) & 1) != 0)
    {
      v5 = 12;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D49078]) & 1) != 0)
    {
      v5 = 13;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D490F0]) & 1) != 0)
    {
      v5 = 25;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D49220]) & 1) != 0)
    {
      v5 = 26;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D49188]) & 1) != 0)
    {
      v5 = 23;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D490C0]) & 1) != 0)
    {
      v5 = 18;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D49098]) & 1) != 0)
    {
      v5 = 29;
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D49070]))
    {
      v5 = 28;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)sharedLogger
{
  if (sharedLogger_onceToken_2257 != -1)
    dispatch_once(&sharedLogger_onceToken_2257, &__block_literal_global_2258);
  return (id)sharedLogger_sharedAudioMetricsSelfLogger;
}

void __41__CSFAudioMetricsSelfLogger_sharedLogger__block_invoke()
{
  CSFAudioMetricsSelfLogger *v0;
  void *v1;

  v0 = objc_alloc_init(CSFAudioMetricsSelfLogger);
  v1 = (void *)sharedLogger_sharedAudioMetricsSelfLogger;
  sharedLogger_sharedAudioMetricsSelfLogger = (uint64_t)v0;

}

@end
