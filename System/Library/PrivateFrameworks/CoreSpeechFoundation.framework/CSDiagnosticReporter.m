@implementation CSDiagnosticReporter

- (CSDiagnosticReporter)init
{
  CSDiagnosticReporter *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  void *v6;
  objc_class *v7;
  SDRDiagnosticReporter *v8;
  SDRDiagnosticReporter *reporter;
  CSDiagnosticReporter *v10;
  objc_super v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
    goto LABEL_10;
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (!CSIsInternalBuild_isInternal)
  {
LABEL_10:
    v10 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CSDiagnosticReporter;
    v3 = -[CSDiagnosticReporter init](&v12, sel_init);
    if (v3)
    {
      v4 = dispatch_queue_create("CSDiagnosticReporter", 0);
      queue = v3->_queue;
      v3->_queue = (OS_dispatch_queue *)v4;

      v14 = 0;
      v15 = &v14;
      v16 = 0x2050000000;
      v6 = (void *)getSDRDiagnosticReporterClass_softClass;
      v17 = getSDRDiagnosticReporterClass_softClass;
      if (!getSDRDiagnosticReporterClass_softClass)
      {
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __getSDRDiagnosticReporterClass_block_invoke;
        v13[3] = &unk_1E6880290;
        v13[4] = &v14;
        __getSDRDiagnosticReporterClass_block_invoke((uint64_t)v13);
        v6 = (void *)v15[3];
      }
      v7 = objc_retainAutorelease(v6);
      _Block_object_dispose(&v14, 8);
      v8 = (SDRDiagnosticReporter *)objc_alloc_init(v7);
      reporter = v3->_reporter;
      v3->_reporter = v8;

    }
    self = v3;
    v10 = self;
  }

  return v10;
}

- (void)submitTrialIssueReport:(id)a3
{
  -[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withDuration:withContext:](self, "submitDiagnosticReportWithType:withSubType:withDuration:withContext:", CFSTR("Trial"), a3, 0, 10.0);
}

- (void)submitVoiceIdIssueReport:(id)a3
{
  -[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withDuration:withContext:](self, "submitDiagnosticReportWithType:withSubType:withDuration:withContext:", CFSTR("VoiceId"), a3, 0, 5.0);
}

- (void)submitAudioIssueReport:(id)a3
{
  -[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withDuration:withContext:](self, "submitDiagnosticReportWithType:withSubType:withDuration:withContext:", CFSTR("Audio"), a3, 0, 10.0);
}

- (void)submitAudioIssueReport:(id)a3 withError:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "code");

  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.%ld"), v9, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withSubTypeContext:withDuration:withContext:](self, "submitDiagnosticReportWithType:withSubType:withSubTypeContext:withDuration:withContext:", CFSTR("Audio"), v8, v11, 0, 10.0);
}

- (void)submitVoiceTriggerIssueReport:(id)a3
{
  -[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withDuration:withContext:](self, "submitDiagnosticReportWithType:withSubType:withDuration:withContext:", CFSTR("VoiceTrigger"), a3, 0, 10.0);
}

- (void)submitEndpointerIssueReport:(id)a3
{
  -[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withDuration:withContext:](self, "submitDiagnosticReportWithType:withSubType:withDuration:withContext:", CFSTR("Endpointer"), a3, 0, 10.0);
}

- (void)submitEndpointerIssueReport:(id)a3 withContext:(id)a4
{
  -[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withDuration:withContext:](self, "submitDiagnosticReportWithType:withSubType:withDuration:withContext:", CFSTR("Endpointer"), a3, a4, 10.0);
}

- (void)submitUresIssueReport:(id)a3
{
  -[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withDuration:withContext:](self, "submitDiagnosticReportWithType:withSubType:withDuration:withContext:", CFSTR("Ures"), a3, 0, 10.0);
}

- (void)submitSiriPowerIssueReport:(id)a3
{
  -[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withDuration:withContext:](self, "submitDiagnosticReportWithType:withSubType:withDuration:withContext:", CFSTR("SiriPower"), a3, 0, 10.0);
}

- (void)submitRemoteCoreSpeechIssueReport:(id)a3 context:(id)a4
{
  -[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withDuration:withContext:](self, "submitDiagnosticReportWithType:withSubType:withDuration:withContext:", CFSTR("remoteCoreSpeech"), a3, a4, 10.0);
}

- (void)submitSELFIssueReport:(id)a3
{
  -[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withDuration:withContext:](self, "submitDiagnosticReportWithType:withSubType:withDuration:withContext:", CFSTR("SELF"), a3, 0, 10.0);
}

- (void)submitASRIssueReport:(id)a3
{
  -[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withDuration:withContext:](self, "submitDiagnosticReportWithType:withSubType:withDuration:withContext:", CFSTR("ASR"), a3, 0, 10.0);
}

- (void)submitDiagnosticReportWithType:(id)a3 withSubType:(id)a4 withDuration:(double)a5 withContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  double v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__CSDiagnosticReporter_submitDiagnosticReportWithType_withSubType_withDuration_withContext___block_invoke;
  block[3] = &unk_1E6880240;
  block[4] = self;
  v18 = v10;
  v21 = a5;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(queue, block);

}

- (void)submitDiagnosticReportWithType:(id)a3 withSubType:(id)a4 withSubTypeContext:(id)a5 withDuration:(double)a6 withContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *queue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  double v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  queue = self->_queue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __111__CSDiagnosticReporter_submitDiagnosticReportWithType_withSubType_withSubTypeContext_withDuration_withContext___block_invoke;
  v21[3] = &unk_1E6880268;
  v21[4] = self;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v26 = a6;
  v25 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  dispatch_async(queue, v21);

}

- (SDRDiagnosticReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
  objc_storeStrong((id *)&self->_reporter, a3);
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
  objc_storeStrong((id *)&self->_reporter, 0);
}

void __111__CSDiagnosticReporter_submitDiagnosticReportWithType_withSubType_withSubTypeContext_withDuration_withContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "reporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("CoreSpeech"), v3, v4, v5, v7, 0);
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "reporter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(double *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 64);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __111__CSDiagnosticReporter_submitDiagnosticReportWithType_withSubType_withSubTypeContext_withDuration_withContext___block_invoke_2;
  v14[3] = &unk_1E6880218;
  v12 = (id)v8;
  v15 = v12;
  LOBYTE(v8) = objc_msgSend(v9, "snapshotWithSignature:duration:event:payload:reply:", v12, 0, v11, v14, v10);

  if ((v8 & 1) == 0)
  {
    v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withSubTypeContext:withDuration:withContex"
            "t:]_block_invoke";
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_1B502E000, v13, OS_LOG_TYPE_DEFAULT, "%s Failed to send signature: %@", buf, 0x16u);
    }
  }

}

void __111__CSDiagnosticReporter_submitDiagnosticReportWithType_withSubType_withSubTypeContext_withDuration_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getkSymptomDiagnosticReplySuccess();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = (void *)CSLogContextFacilityCoreSpeech;
  v8 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = v7;
      getkSymptomDiagnosticReplySessionID();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 136315650;
      v17 = "-[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withSubTypeContext:withDuration:withContex"
            "t:]_block_invoke_2";
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s Auto bug captured for signature: %@ with sessionID: %@", (uint8_t *)&v16, 0x20u);
LABEL_6:

    }
  }
  else if (v8)
  {
    v13 = *(_QWORD *)(a1 + 32);
    v10 = v7;
    getkSymptomDiagnosticReplyReason();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    getkSymptomDiagnosticReplyReasonString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136315906;
    v17 = "-[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withSubTypeContext:withDuration:withContext:]_block_invoke";
    v18 = 2112;
    v19 = v13;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v15;
    _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s Auto bug capture dampened for signature: %@ with error code: %@ reason: %@", (uint8_t *)&v16, 0x2Au);

    goto LABEL_6;
  }

}

void __92__CSDiagnosticReporter_submitDiagnosticReportWithType_withSubType_withDuration_withContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "reporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "signatureWithDomain:type:subType:detectedProcess:triggerThresholdValues:", CFSTR("CoreSpeech"), v3, v4, v6, 0);
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "reporter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(double *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 56);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__CSDiagnosticReporter_submitDiagnosticReportWithType_withSubType_withDuration_withContext___block_invoke_2;
  v13[3] = &unk_1E6880218;
  v11 = (id)v7;
  v14 = v11;
  LOBYTE(v7) = objc_msgSend(v8, "snapshotWithSignature:duration:event:payload:reply:", v11, 0, v10, v13, v9);

  if ((v7 & 1) == 0)
  {
    v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withDuration:withContext:]_block_invoke";
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s Failed to send signature: %@", buf, 0x16u);
    }
  }

}

void __92__CSDiagnosticReporter_submitDiagnosticReportWithType_withSubType_withDuration_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getkSymptomDiagnosticReplySuccess();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = (void *)CSLogContextFacilityCoreSpeech;
  v8 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = v7;
      getkSymptomDiagnosticReplySessionID();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 136315650;
      v17 = "-[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withDuration:withContext:]_block_invoke_2";
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s Auto bug captured for signature: %@ with sessionID: %@", (uint8_t *)&v16, 0x20u);
LABEL_6:

    }
  }
  else if (v8)
  {
    v13 = *(_QWORD *)(a1 + 32);
    v10 = v7;
    getkSymptomDiagnosticReplyReason();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    getkSymptomDiagnosticReplyReasonString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136315906;
    v17 = "-[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withDuration:withContext:]_block_invoke";
    v18 = 2112;
    v19 = v13;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v15;
    _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s Auto bug capture dampened for signature: %@ with error code: %@ reason: %@", (uint8_t *)&v16, 0x2Au);

    goto LABEL_6;
  }

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7958 != -1)
    dispatch_once(&sharedInstance_onceToken_7958, &__block_literal_global_7959);
  return (id)sharedInstance_sharedReporter;
}

void __38__CSDiagnosticReporter_sharedInstance__block_invoke()
{
  CSDiagnosticReporter *v0;
  void *v1;

  v0 = objc_alloc_init(CSDiagnosticReporter);
  v1 = (void *)sharedInstance_sharedReporter;
  sharedInstance_sharedReporter = (uint64_t)v0;

}

@end
