@implementation CSFVoiceTriggerEventInfoSelfLoggerEmbedded

- (CSFVoiceTriggerEventInfoSelfLoggerEmbedded)init
{
  CSFVoiceTriggerEventInfoSelfLoggerEmbedded *v3;
  objc_super v5;

  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CSFVoiceTriggerEventInfoSelfLoggerEmbedded;
    self = -[CSFVoiceTriggerEventInfoSelfLoggerEmbedded init](&v5, sel_init);
    v3 = self;
  }

  return v3;
}

- (void)logTwoShotDetectedWithMHUUID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0D99B38];
  v4 = a3;
  v9 = objc_alloc_init(v3);
  objc_msgSend(v9, "setExists:", 1);
  v5 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  v6 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v4);

  objc_msgSend(v6, "setMhId:", v7);
  objc_msgSend(v5, "setEventMetadata:", v6);
  objc_msgSend(v5, "setVoiceTriggerTwoShotDetected:", v9);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "emitMessage:", v5);

}

- (void)logTwoShotEndEventWithSuppresedAlert:(BOOL)a3 withTimedOut:(BOOL)a4 withMHUUID:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0D99A28];
  v8 = a5;
  v10 = objc_alloc_init(v7);
  objc_msgSend(v10, "setSuppresedAlert:", v6);
  objc_msgSend(v10, "setTimedOut:", v5);
  v9 = objc_alloc_init(MEMORY[0x1E0D99A20]);
  objc_msgSend(v9, "setEnded:", v10);
  objc_msgSend(v9, "setHasEnded:", 1);
  +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded _emitTwoShotClientEventWithTwoShotTransitionContext:withMHUUID:](CSFVoiceTriggerEventInfoSelfLoggerEmbedded, "_emitTwoShotClientEventWithTwoShotTransitionContext:withMHUUID:", v9, v8);

}

- (void)logTwoShotStartEventWithPromptType:(unsigned int)a3 withMHUUID:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0D99A30];
  v6 = a4;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setPromptType:", +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded _convertToTwoShotPromptType:](CSFVoiceTriggerEventInfoSelfLoggerEmbedded, "_convertToTwoShotPromptType:", a3));
  v7 = objc_alloc_init(MEMORY[0x1E0D99A20]);
  objc_msgSend(v7, "setStartedOrChanged:", v8);
  objc_msgSend(v7, "setHasStartedOrChanged:", 1);
  +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded _emitTwoShotClientEventWithTwoShotTransitionContext:withMHUUID:](CSFVoiceTriggerEventInfoSelfLoggerEmbedded, "_emitTwoShotClientEventWithTwoShotTransitionContext:withMHUUID:", v7, v6);

}

- (void)logStartEventWithFirstPassStartedInfo:(id)a3 withMHUUID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded sanitizeEventInfoForLogging:](CSFVoiceTriggerEventInfoSelfLoggerEmbedded, "sanitizeEventInfoForLogging:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded _getStartedMessageWithFirstPassInfo:](CSFVoiceTriggerEventInfoSelfLoggerEmbedded, "_getStartedMessageWithFirstPassInfo:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0D99B00]);
    objc_msgSend(v9, "setStartedOrChanged:", v8);
    objc_msgSend(v9, "setHasStartedOrChanged:", 1);
    +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded _emitVTClientEventWithVTContext:withMHUUID:](CSFVoiceTriggerEventInfoSelfLoggerEmbedded, "_emitVTClientEventWithVTContext:withMHUUID:", v9, v6);

  }
  else
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[CSFVoiceTriggerEventInfoSelfLoggerEmbedded logStartEventWithFirstPassStartedInfo:withMHUUID:]";
      _os_log_error_impl(&dword_1B502E000, v10, OS_LOG_TYPE_ERROR, "%s Skip SELF emitting since MHId is nil", (uint8_t *)&v11, 0xCu);
    }
    +[CSDiagnosticReporter sharedInstance](CSDiagnosticReporter, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "submitSELFIssueReport:", CFSTR("mhVoiceTriggerContextMhIdMissing"));
  }

}

- (void)logRejectEventWithVTEI:(id)a3 withMHUUID:(id)a4 withSecondPassResult:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0D99B20]);
    +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded sanitizeEventInfoForLogging:](CSFVoiceTriggerEventInfoSelfLoggerEmbedded, "sanitizeEventInfoForLogging:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded _convertToSELFVTEI:](CSFVoiceTriggerEventInfoSelfLoggerEmbedded, "_convertToSELFVTEI:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setVoiceTriggerEventInfo:", v11);
    objc_msgSend(v9, "setReason:", +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded _convertToSELFRejectedReason:](CSFVoiceTriggerEventInfoSelfLoggerEmbedded, "_convertToSELFRejectedReason:", a5));
    v12 = objc_alloc_init(MEMORY[0x1E0D99B00]);
    objc_msgSend(v12, "setFailed:", v9);
    objc_msgSend(v12, "setHasFailed:", 1);
    +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded _emitVTClientEventWithVTContext:withMHUUID:](CSFVoiceTriggerEventInfoSelfLoggerEmbedded, "_emitVTClientEventWithVTContext:withMHUUID:", v12, v8);

  }
  else
  {
    v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315138;
      v15 = "-[CSFVoiceTriggerEventInfoSelfLoggerEmbedded logRejectEventWithVTEI:withMHUUID:withSecondPassResult:]";
      _os_log_error_impl(&dword_1B502E000, v13, OS_LOG_TYPE_ERROR, "%s Skip SELF emitting since MHId is nil", (uint8_t *)&v14, 0xCu);
    }
    +[CSDiagnosticReporter sharedInstance](CSDiagnosticReporter, "sharedInstance");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "submitSELFIssueReport:", CFSTR("mhVoiceTriggerContextMhIdMissing"));
  }

}

- (void)logCancelledEventWithMHUUID:(id)a3
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D99B18]);
    v5 = objc_alloc_init(MEMORY[0x1E0D99B00]);
    objc_msgSend(v5, "setCancelled:", v4);
    objc_msgSend(v5, "setHasCancelled:", 1);
    +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded _emitVTClientEventWithVTContext:withMHUUID:](CSFVoiceTriggerEventInfoSelfLoggerEmbedded, "_emitVTClientEventWithVTContext:withMHUUID:", v5, v3);

  }
  else
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "-[CSFVoiceTriggerEventInfoSelfLoggerEmbedded logCancelledEventWithMHUUID:]";
      _os_log_error_impl(&dword_1B502E000, v6, OS_LOG_TYPE_ERROR, "%s Skip SELF emitting since MHId is nil", (uint8_t *)&v7, 0xCu);
    }
    +[CSDiagnosticReporter sharedInstance](CSDiagnosticReporter, "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "submitSELFIssueReport:", CFSTR("mhVoiceTriggerContextMhIdMissing"));
  }

}

- (void)logTriggerEventWithVTEI:(id)a3 withMHUUID:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D99B30]);
    +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded _convertToSELFVTEI:](CSFVoiceTriggerEventInfoSelfLoggerEmbedded, "_convertToSELFVTEI:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setVoiceTriggerEventInfo:", v8);
    v9 = objc_alloc_init(MEMORY[0x1E0D99B00]);
    objc_msgSend(v9, "setEnded:", v7);
    objc_msgSend(v9, "setHasEnded:", 1);
    +[CSFVoiceTriggerEventInfoSelfLoggerEmbedded _emitVTClientEventWithVTContext:withMHUUID:](CSFVoiceTriggerEventInfoSelfLoggerEmbedded, "_emitVTClientEventWithVTContext:withMHUUID:", v9, v6);

  }
  else
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[CSFVoiceTriggerEventInfoSelfLoggerEmbedded logTriggerEventWithVTEI:withMHUUID:]";
      _os_log_error_impl(&dword_1B502E000, v10, OS_LOG_TYPE_ERROR, "%s Skip SELF emitting since MHId is nil", (uint8_t *)&v11, 0xCu);
    }
    +[CSDiagnosticReporter sharedInstance](CSDiagnosticReporter, "sharedInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "submitSELFIssueReport:", CFSTR("mhVoiceTriggerContextMhIdMissing"));
  }

}

- (void)logSiriLaunchStartedWithVoiceTriggerEventInfo:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("selfLoggingMHUUID"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);
    v4 = objc_alloc_init(MEMORY[0x1E0D99A70]);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v3);
    objc_msgSend(v4, "setMhId:", v5);

    v6 = objc_alloc_init(MEMORY[0x1E0D99AD0]);
    objc_msgSend(v6, "setExists:", 1);
    v7 = objc_alloc_init(MEMORY[0x1E0D99AC0]);
    objc_msgSend(v7, "setStartedOrChanged:", v6);
    v8 = objc_alloc_init(MEMORY[0x1E0D99A58]);
    objc_msgSend(v8, "setEventMetadata:", v4);
    objc_msgSend(v8, "setSiriLaunchRequestContext:", v7);
    objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "emitMessage:", v8);

  }
}

- (void)logSiriLaunchCompletedWithVoiceTriggerEventInfo:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("selfLoggingMHUUID"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);
    v4 = objc_alloc_init(MEMORY[0x1E0D99A70]);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v3);
    objc_msgSend(v4, "setMhId:", v5);

    v6 = objc_alloc_init(MEMORY[0x1E0D99AC8]);
    objc_msgSend(v6, "setExists:", 1);
    v7 = objc_alloc_init(MEMORY[0x1E0D99AC0]);
    objc_msgSend(v7, "setEnded:", v6);
    v8 = objc_alloc_init(MEMORY[0x1E0D99A58]);
    objc_msgSend(v8, "setEventMetadata:", v4);
    objc_msgSend(v8, "setSiriLaunchRequestContext:", v7);
    objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "emitMessage:", v8);

  }
}

+ (id)sanitizeEventInfoForLogging:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD *v17;
  id v18;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v19[3] = 0xBFF0000000000000;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99E60];
    v20[0] = CFSTR("triggerStartTime");
    v20[1] = CFSTR("triggerEndTime");
    v20[2] = CFSTR("earlyDetectFiredTime");
    v20[3] = CFSTR("triggerFiredTime");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__CSFVoiceTriggerEventInfoSelfLoggerEmbedded_sanitizeEventInfoForLogging___block_invoke;
    v14[3] = &unk_1E6880480;
    v9 = v8;
    v15 = v9;
    v17 = v19;
    v10 = v5;
    v16 = v10;
    v18 = a1;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v14);
    v11 = v16;
    v12 = v10;

    _Block_object_dispose(v19, 8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (double)_round:(double)a3 withPlaces:(int)a4
{
  double v5;

  v5 = __exp10((double)a4);
  return round(v5 * a3) / v5;
}

+ (id)_convertToSELFVTEI:(id)a3
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  unint64_t v51;
  void *v52;
  unint64_t v53;
  void *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  unint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  unint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v108;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D99B08]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondPassAnalyerStartSampleCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondPassAnalyerStartSampleCount:", (int)objc_msgSend(v6, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondPassAnalyerEndSampleCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondPassAnalyerEndSampleCount:", (int)objc_msgSend(v7, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("satScore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  objc_msgSend(v5, "setSatScore:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("satNumTrainingUtts"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSatNumTrainingUtterances:", objc_msgSend(v9, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("satThreshold"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  objc_msgSend(v5, "setSatThreshold:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("satTriggered"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSatTriggered:", objc_msgSend(v11, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tdSpeakerRecognizerScore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  objc_msgSend(v5, "setTdSpeakerRecognizerScore:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tdSpeakerRecognizerCombinedScore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  objc_msgSend(v5, "setTdSpeakerRecognizerCombinedScore:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tdSpeakerRecognizerCombinedThreshold"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  objc_msgSend(v5, "setTdSpeakerRecognizerCombinedThreshold:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tdSpeakerRecognizerCombinationWeight"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatValue");
  objc_msgSend(v5, "setTdSpeakerRecognizerCombinationWeight:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("biometricClue"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBiometricClue:", objc_msgSend(a1, "_convertToMatchResult:", objc_msgSend(v16, "intValue")));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("satBeingTrained"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSatBeingTrained:", objc_msgSend(v17, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastConsecutivePHSRejects"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLastConsecutivePHSRejects:", objc_msgSend(v18, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deltaTimeFromlastPHSReject"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  objc_msgSend(v5, "setDeltaTimeInNsFromlastPHSReject:", +[CSFTimeUtils secondsToNs:](CSFTimeUtils, "secondsToNs:"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerExplicitSatScore"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  objc_msgSend(v5, "setTriggerExplicitSatScore:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerExplicitTDSRSatScore"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "floatValue");
  objc_msgSend(v5, "setTriggerExplicitTDSRSatScore:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shadowMicScore"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");
  objc_msgSend(v5, "setShadowMicScore:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shadowMicScoreThresholdForVAD"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");
  objc_msgSend(v5, "setShadowMicScoreThresholdForVAD:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("remoteMicVADScore"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "floatValue");
  objc_msgSend(v5, "setRemoteMicVADScore:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("remoteMicVADThreshold"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "floatValue");
  objc_msgSend(v5, "setRemoteMicVADThreshold:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("remoteMicVADMyriadThreshold"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "floatValue");
  objc_msgSend(v5, "setRemoteMicVADMyriadThreshold:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassJarvisTriggerMode"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnhancedCarplayTriggerMode:", objc_msgSend(a1, "_convertJarvisTriggerModeString:", v27));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerStartSampleCount"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTriggerStartSampleCount:", (int)objc_msgSend(v28, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientStartSampleCount"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClientStartSampleCount:", (int)objc_msgSend(v29, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerEndSampleCount"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTriggerEndSampleCount:", (int)objc_msgSend(v30, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerFireSampleCount"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTriggerFireSampleCount:", (int)objc_msgSend(v31, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerStartSeconds"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "floatValue");
  objc_msgSend(v5, "setTriggerStartNs:", +[CSFTimeUtils secondsToNs:](CSFTimeUtils, "secondsToNs:"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerEndSeconds"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "floatValue");
  objc_msgSend(v5, "setTriggerEndNs:", +[CSFTimeUtils secondsToNs:](CSFTimeUtils, "secondsToNs:"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerFireSeconds"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "floatValue");
  objc_msgSend(v5, "setTriggerFireNs:", +[CSFTimeUtils secondsToNs:](CSFTimeUtils, "secondsToNs:"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("extraSamplesAtStart"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExtraSamplesAtStart:", (int)objc_msgSend(v35, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("analyzerPrependingSamples"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnalyzerPrependingSamples:", (int)objc_msgSend(v36, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("analyzerTrailingSamples"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnalyzerTrailingSamples:", (int)objc_msgSend(v37, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isTriggerEvent"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsTriggerEvent:", objc_msgSend(v38, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalSampleCount"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTotalSampleCount:", (int)objc_msgSend(v39, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerScore"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "floatValue");
  objc_msgSend(v5, "setTriggerScore:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMaximized"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsMaximized:", objc_msgSend(v41, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("effectiveThreshold"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "floatValue");
  objc_msgSend(v5, "setEffectiveThreshold:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognizerScore"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "floatValue");
  objc_msgSend(v5, "setRecognizerScore:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognizerThresholdOffset"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "floatValue");
  objc_msgSend(v5, "setRecognizerThresholdOffset:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognizerWaitTime"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "floatValue");
  objc_msgSend(v5, "setRecognizerWaitTimeInNs:", +[CSFTimeUtils secondsToNs:](CSFTimeUtils, "secondsToNs:"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognizerScaleFactor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "floatValue");
  objc_msgSend(v5, "setRecognizerScaleFactor:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("threshold"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "floatValue");
  objc_msgSend(v5, "setThreshold:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggeredPhrase"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTriggerPhrase:", v48);

  v49 = mach_absolute_time();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerStartMachTime"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", v49 - objc_msgSend(v50, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerEndMachTime"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", v49 - objc_msgSend(v52, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerFireMachTime"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", v49 - objc_msgSend(v54, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKey:", CFSTR("displayWakeMachTime"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    v108 = a1;
    objc_msgSend(v4, "objectForKey:", CFSTR("extraSamplesAtStart"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = v51;
    if (v57)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("extraSamplesAtStart"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (int)objc_msgSend(v59, "intValue");

      +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
      v58 = v51
          - +[CSFTimeUtils convertSampleCountToNs:sampleRate:](CSFTimeUtils, "convertSampleCountToNs:sampleRate:", v60);
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("displayWakeMachTime"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", v49 - objc_msgSend(v61, "unsignedLongLongValue"));

    objc_msgSend(v5, "setIsHSJSTriggerFromAlwaysOnMicBuffer:", v58 > v62);
    objc_msgSend(v5, "setDisplayWakeTimeOffsetInNs:", v62);
    a1 = v108;
  }
  objc_msgSend(v5, "setTriggerStartTimeOffsetInNs:", v51);
  objc_msgSend(v5, "setTriggerEndTimeOffsetInNs:", v53);
  objc_msgSend(v5, "setTriggerFireTimeOffsetInNs:", v55);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerStartTime"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "doubleValue");
  objc_msgSend(v5, "setTriggerStartTime:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerEndTime"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "doubleValue");
  objc_msgSend(v5, "setTriggerEndTime:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerFiredTime"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "doubleValue");
  objc_msgSend(v5, "setTriggerFiredTime:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hardwareSamplerate"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHardwareSamplerate:", objc_msgSend(v66, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isContinuous"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsContinuous:", objc_msgSend(v67, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerDuration"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "floatValue");
  *(float *)&v69 = (float)+[CSFTimeUtils secondsToNs:](CSFTimeUtils, "secondsToNs:");
  objc_msgSend(v5, "setTriggerDurationInNs:", v69);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalSamplesAtTriggerStart"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTotalSamplesAtTriggerStart:", (int)objc_msgSend(v70, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalSamplesAtTriggerEnd"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTotalSamplesAtTriggerEnd:", (int)objc_msgSend(v71, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalSamplesAtEndOfCapture"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTotalSamplesAtEndOfCapture:", (int)objc_msgSend(v72, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("configVersion"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfigVersion:", v73);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("configPath"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfigPath:", v74);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSecondChance"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsSecondChance:", objc_msgSend(v75, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceHandHeld"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceHandheld:", objc_msgSend(v76, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activeChannel"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveChannel:", objc_msgSend(v77, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("twoShotAudibleFeedbackDelay"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "floatValue");
  objc_msgSend(v5, "setTwoShotAudibleFeedbackDelayInNs:", +[CSFTimeUtils secondsToNs:](CSFTimeUtils, "secondsToNs:"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cumulativeUptime"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "floatValue");
  objc_msgSend(v5, "setCumulativeUptimeInSec:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cumulativeDowntime"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "floatValue");
  objc_msgSend(v5, "setCumulativeDowntimeInSec:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hostPowerStateAtTrigger"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHostPowerStateAtTrigger:", objc_msgSend(a1, "_convertPowerState:", objc_msgSend(v81, "intValue")));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMediaPlaying"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsMediaPlaying:", objc_msgSend(v82, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaVolume"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "floatValue");
  objc_msgSend(v5, "setMediaVolume:");

  v84 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioProviderUUID"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (void *)objc_msgSend(v84, "initWithUUIDString:", v85);

  v87 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v86);
  objc_msgSend(v5, "setAudioProviderUUID:", v87);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("onBatteryPower"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOnBatteryPower:", objc_msgSend(v88, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("didWakeAP"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDidWakeAP:", objc_msgSend(v89, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uptime"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "floatValue");
  objc_msgSend(v5, "setUptimeInSec:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("downtime"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "floatValue");
  objc_msgSend(v5, "setDowntimeInSec:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastConsecutiveVTRejects"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLastConsecutiveVTRejects:", objc_msgSend(v92, "intValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("captureFilePath"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCaptureFilePath:", v93);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("configDataHash"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfigDataHash:", v94);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriIsActiveOrOtherAssertion"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSiriIsActiveOrOtherAssertion:", objc_msgSend(v95, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DarwinVoiceTriggeredWhenHostInSleep"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsWakeFromSleep:", objc_msgSend(v96, "BOOLValue"));

  objc_msgSend(v4, "objectForKey:", CFSTR("secondPassAssetQueryStartTime"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondPassAssetQueryStartTimeInNs:", objc_msgSend(v97, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKey:", CFSTR("secondPassAssetQueryCompleteTime"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondPassAssetQueryCompleteTimeInNs:", objc_msgSend(v98, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKey:", CFSTR("secondPassAssetLoadStartTime"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondPassAssetLoadStartTimeInNs:", objc_msgSend(v99, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKey:", CFSTR("secondPassAssetLoadCompleteTime"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondPassAssetLoadCompleteTimeInNs:", objc_msgSend(v100, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKey:", CFSTR("secondPassAudioStreamStartTime"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondPassAudioStreamStartTimeInNs:", objc_msgSend(v101, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKey:", CFSTR("secondPassAudioStreamReadyTime"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondPassAudioStreamReadyTimeInNs:", objc_msgSend(v102, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKey:", CFSTR("secondPassFirstAudioPacketReceptionTime"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondPassFirstAudioPacketReceptionTimeInNs:", objc_msgSend(v103, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKey:", CFSTR("secondPassLastAudioPacketReceptionTime"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondPassLastAudioPacketReceptionTimeInNs:", objc_msgSend(v104, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKey:", CFSTR("secondPassCheckerModelKeywordDetectionStartTime"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondPassCheckerModelKeywordDetectionStartTimeInNs:", objc_msgSend(v105, "unsignedLongLongValue"));

  objc_msgSend(v4, "objectForKey:", CFSTR("secondPassCheckerModelKeywordDetectionEndTime"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondPassCheckerModelKeywordDetectionEndTimeInNs:", objc_msgSend(v106, "unsignedLongLongValue"));

  return v5;
}

+ (int)_convertPowerState:(unsigned int)a3
{
  if (a3 < 4)
    return a3 + 1;
  else
    return 0;
}

+ (int)_convertJarvisTriggerModeString:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Disabled")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VoiceActivityDetection")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VoiceTriggerDetection")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int)_convertToMatchResult:(unsigned int)a3
{
  if (a3 < 4)
    return a3 + 1;
  else
    return 0;
}

+ (int)_convertToSELFRejectedReason:(unint64_t)a3
{
  if (a3 > 0xB)
    return 1;
  else
    return dword_1B50D75E8[a3];
}

+ (int)_convertToFirstPassSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ApplicationProcessor")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ApplicationProcessorWithRingtone")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("ApplicationProcessorWithConnectedCall")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BuiltInAlwaysOnProcessor")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Hearst")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Jarvis")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Remora")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HearstAP")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Watch")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Darwin")) & 1) != 0)
  {
    v4 = 10;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Default"));
  }

  return v4;
}

+ (int)_convertToTwoShotPromptType:(int64_t)a3
{
  if ((unint64_t)a3 < 3)
    return a3 + 1;
  else
    return 0;
}

+ (id)_convertToFirstPassChannelSelectionScores:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = objc_alloc_init(MEMORY[0x1E0D99898]);
        objc_msgSend(v11, "setChannelString:", v10, (_QWORD)v14);
        objc_msgSend(v5, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "floatValue");
        objc_msgSend(v11, "setFirstPassScore:");

        objc_msgSend(v4, "addObject:", v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)_getStartedMessageWithFirstPassInfo:(id)a3
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
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D99B28]);
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassDetectedChannel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFirstPassDetectedChannel:", objc_msgSend(v6, "intValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassScore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    objc_msgSend(v5, "setFirstPassScore:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassOnsetChannel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFirstPassOnsetChannel:", objc_msgSend(v8, "intValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassOnsetScore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    objc_msgSend(v5, "setFirstPassOnsetScore:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassChannelSelectionScores"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_convertToFirstPassChannelSelectionScores:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setChannelSelectionScores:", v11);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassChannelSelectionDelaySeconds"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    objc_msgSend(v5, "setFirstPassChannelSelectionDelayNs:", +[CSFTimeUtils secondsToNs:](CSFTimeUtils, "secondsToNs:"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassMasterChannelScoreBoost"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    objc_msgSend(v5, "setFirstPassPrimaryChannelScoreBoost:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassStartSampleCount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFirstPassStartSampleCount:", (int)objc_msgSend(v14, "intValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassEndSampleCount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFirstPassEndSampleCount:", (int)objc_msgSend(v15, "intValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassFireSampleCount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFirstPassFireSampleCount:", (int)objc_msgSend(v16, "intValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassTriggerSource"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFirstPassTriggerSource:", objc_msgSend(a1, "_convertToFirstPassSource:", v17));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("earlyDetectFiredTime"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    objc_msgSend(v5, "setEarlyDetectFiredTime:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("earlyDetectFiredMachTime"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (int)objc_msgSend(v19, "intValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("earlyDetectFiredTime"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "floatValue");
    objc_msgSend(v5, "setEarlyDetectFiredTimeOffsetInNs:", v20 - +[CSFTimeUtils secondsToNs:](CSFTimeUtils, "secondsToNs:"));

    objc_msgSend(v4, "objectForKey:", CFSTR("firstPassInfoGeneratedTime"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassInfoGeneratedTime"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setFirstPassInfoDispatchTimeInNs:", +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", objc_msgSend(v23, "unsignedLongLongValue")));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassInfoProcessedTime"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setFirstPassInfoReceptionTimeInNs:", +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", objc_msgSend(v24, "unsignedLongLongValue")));

    }
  }

  return v5;
}

+ (void)_emitTwoShotClientEventWithTwoShotTransitionContext:(id)a3 withMHUUID:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (objc_class *)MEMORY[0x1E0D99A58];
  v6 = a4;
  v7 = a3;
  v11 = objc_alloc_init(v5);
  v8 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v6);

  objc_msgSend(v8, "setMhId:", v9);
  objc_msgSend(v11, "setEventMetadata:", v8);
  objc_msgSend(v11, "setAssistantDaemonAudioTwoShotTransitionContext:", v7);

  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emitMessage:", v11);

}

+ (void)_emitVTClientEventWithVTContext:(id)a3 withMHUUID:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (objc_class *)MEMORY[0x1E0D99A58];
  v6 = a4;
  v7 = a3;
  v11 = objc_alloc_init(v5);
  v8 = objc_alloc_init(MEMORY[0x1E0D99A70]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v6);

  objc_msgSend(v8, "setMhId:", v9);
  objc_msgSend(v11, "setEventMetadata:", v8);
  objc_msgSend(v11, "setVoiceTriggerContext:", v7);

  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emitMessage:", v11);

}

void __74__CSFVoiceTriggerEventInfoSelfLoggerEmbedded_sanitizeEventInfoForLogging___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v15)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = v6;
    v8 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v8 < 0.0)
    {
      objc_msgSend(v6, "doubleValue");
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9 + -10.0;
      v8 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }
    v10 = *(void **)(a1 + 40);
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = *(void **)(a1 + 56);
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v12, "_round:withPlaces:", 2, v13 - v8);
    objc_msgSend(v11, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v14, v15);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v5, v15);
  }

}

@end
