@implementation CSModelBenchmarker

- (CSModelBenchmarker)init
{
  CSModelBenchmarker *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  void *v5;
  uint64_t v6;
  NSString *tempCacheDirectoryForMil2Bnns;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)CSModelBenchmarker;
  v2 = -[CSModelBenchmarker init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSBenchMarker Queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_totalNumberSamples = 0;
    v2->_inferenceTimeSpan = 0;
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getOnDeviceCompilationCacheDirectoryForBenchmark");
    v6 = objc_claimAutoreleasedReturnValue();
    tempCacheDirectoryForMil2Bnns = v2->_tempCacheDirectoryForMil2Bnns;
    v2->_tempCacheDirectoryForMil2Bnns = (NSString *)v6;

    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CSModelBenchmarker init]";
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarker init", buf, 0xCu);
    }
  }
  return v2;
}

- (void)pingpong:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[CSModelBenchmarker pingpong:completion:]";
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }
  if (v6)
  {
    v8 = (void *)objc_msgSend(v5, "copy");
    v6[2](v6, v8);

  }
}

- (void)runLstmPhsModelWithConfig:(id)a3 withUrl:(id)a4 withConfigRoot:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__CSModelBenchmarker_runLstmPhsModelWithConfig_withUrl_withConfigRoot_completion___block_invoke;
  block[3] = &unk_1E7C27360;
  block[4] = self;
  v20 = v10;
  v22 = v11;
  v23 = v13;
  v21 = v12;
  v15 = v11;
  v16 = v13;
  v17 = v12;
  v18 = v10;
  dispatch_async(queue, block);

}

- (void)runVTSecondPassModelWithConfig:(id)a3 locale:(id)a4 withUrl:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__CSModelBenchmarker_runVTSecondPassModelWithConfig_locale_withUrl_completion___block_invoke;
  block[3] = &unk_1E7C27360;
  block[4] = self;
  v20 = v10;
  v22 = v12;
  v23 = v13;
  v21 = v11;
  v15 = v12;
  v16 = v13;
  v17 = v11;
  v18 = v10;
  dispatch_async(queue, block);

}

- (void)runOSDAnalyzerWithConfig:(id)a3 withUrl:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__CSModelBenchmarker_runOSDAnalyzerWithConfig_withUrl_completion___block_invoke;
  v15[3] = &unk_1E7C27310;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (void)runODLDModelWithConfig:(id)a3 locale:(id)a4 inputText:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__CSModelBenchmarker_runODLDModelWithConfig_locale_inputText_completion___block_invoke;
  v16[3] = &unk_1E7C27310;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v10;
  v14 = v11;
  v15 = v9;
  dispatch_async(queue, v16);

}

- (void)runNCModelWithConfig:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void (**v25)(id, void *);
  _QWORD v26[5];
  id v27;
  uint8_t v28[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  const __CFString *v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v25 = (void (**)(id, void *))a4;
  -[CSModelBenchmarker _onDeviceCompilationWithConfigFile:locale:modelType:](self, "_onDeviceCompilationWithConfigFile:locale:modelType:", v6, CFSTR("agnosticLocale"), 3);
  v27 = 0;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9C878]), "initWithConfig:error:", v6, &v27);
  v7 = v27;
  if (v7)
  {
    -[CSModelBenchmarker reset](self, "reset");
    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CSModelBenchmarker runNCModelWithConfig:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s model init error: %@", buf, 0x16u);
    }
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v38 = CFSTR("reason");
    objc_msgSend(v7, "localizedDescription", v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2001, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2](v25, v12);

  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9C880]), "initWithDefaults");
    objc_msgSend(v10, "setSpeechPackage:", 0);
    objc_msgSend(v10, "setInputOrigin:", &unk_1E7C63CB0);
    objc_msgSend(v10, "setAcousticFTMScores:", &unk_1E7C63CB0);
    objc_msgSend(v10, "setBoronScore:", &unk_1E7C63CB0);
    objc_msgSend(v10, "setSpeakerIDScore:", &unk_1E7C63C98);
    objc_msgSend(v10, "setDidDetectAttention:", 1);
    objc_msgSend(v10, "setDidDetectAttention:", 1);
    objc_msgSend(v10, "setDidDetectGazeAtOrb:", 1);
    objc_msgSend(v10, "setDidDetectVisualActivity:", 1);
    objc_msgSend(v10, "setIsAirpodsConnected:", 0);
    objc_msgSend(v10, "setTimeSinceLastQuery:", 1.0);
    objc_msgSend(v10, "setDecisionStage:", 1);
    objc_msgSend(v10, "setPrevStageOutput:", 0);
    objc_msgSend(v10, "setEosLikelihood:", 0);
    objc_msgSend(v10, "setNldaScore:", &unk_1E7C63F40);
    objc_msgSend(v10, "setLrnnScore:", &unk_1E7C63F40);
    objc_msgSend(v10, "setLrnnThreshold:", &unk_1E7C63F50);
    objc_msgSend(v10, "setEmbeddingScore:", &unk_1E7C63F50);
    objc_msgSend(v10, "setExternalLrnnScale:", &unk_1E7C63C98);
    objc_msgSend(v10, "setExternalLrnnOffset:", &unk_1E7C63CB0);
    v13 = mach_absolute_time();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v35 = __Block_byref_object_copy__19891;
    v36 = __Block_byref_object_dispose__19892;
    v37 = 0;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __54__CSModelBenchmarker_runNCModelWithConfig_completion___block_invoke;
    v26[3] = &unk_1E7C27338;
    v26[4] = buf;
    objc_msgSend(v24, "processInputFeats:completion:", v10, v26);
    v14 = v6;
    v15 = mach_absolute_time();
    v16 = (id *)MEMORY[0x1E0D18F60];
    v17 = os_signpost_id_generate((os_log_t)*MEMORY[0x1E0D18F60]);
    v18 = *v16;
    v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_DWORD *)v28 = 134349570;
      v29 = v13;
      v30 = 2080;
      v31 = "SiriX";
      v32 = 2080;
      v33 = "enableTelemetry=YES";
      _os_signpost_emit_with_name_impl(&dword_1C2614000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "allFramesProcessingLatency", "%{public, signpost.description:begin_time}llu, %s %s", v28, 0x20u);
    }

    v6 = v14;
    self->_allFramesInferenceLatency += v15 - v13;
    v20 = *v16;
    v21 = v20;
    if (v17 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v20))
    {
      v22 = self->_allFramesInferenceLatency + v13;
      *(_DWORD *)v28 = 134349570;
      v29 = v22;
      v30 = 2080;
      v31 = "SiriX";
      v32 = 2080;
      v33 = "enableTelemetry=YES";
      _os_signpost_emit_with_name_impl(&dword_1C2614000, v21, OS_SIGNPOST_INTERVAL_END, v17, "allFramesProcessingLatency", "%{public, signpost.description:end_time}llu, %s %s", v28, 0x20u);
    }

    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      -[CSModelBenchmarker reset](self, "reset");
      if (v25)
        v25[2](v25, 0);
    }
    else
    {
      -[CSModelBenchmarker reset](self, "reset");
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2002, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25[2](v25, v23);

    }
    _Block_object_dispose(buf, 8);

  }
}

- (void)runNovDetectorWithConfig:(id)a3 configRoot:(id)a4 withUrl:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__CSModelBenchmarker_runNovDetectorWithConfig_configRoot_withUrl_completion___block_invoke;
  block[3] = &unk_1E7C27360;
  v22 = v12;
  v23 = v13;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v13;
  dispatch_async(queue, block);

}

- (void)runAudioInjectionOnly:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CSModelBenchmarker_runAudioInjectionOnly_completion___block_invoke;
  block[3] = &unk_1E7C28EC8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)benchmarkOnDeviceCompilationCleanup:(id)a3
{
  void *v4;
  void (**v5)(id, id);
  void *v6;
  NSString *tempCacheDirectoryForMil2Bnns;
  id v8;
  NSObject *v9;
  NSString *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  NSString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3620];
  v5 = (void (**)(id, id))a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  tempCacheDirectoryForMil2Bnns = self->_tempCacheDirectoryForMil2Bnns;
  v11 = 0;
  objc_msgSend(v6, "removeItemAtPath:error:", tempCacheDirectoryForMil2Bnns, &v11);
  v8 = v11;

  v9 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_tempCacheDirectoryForMil2Bnns;
    *(_DWORD *)buf = 136315650;
    v13 = "-[CSModelBenchmarker benchmarkOnDeviceCompilationCleanup:]";
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s clean up benchmark cached bnnsir directory: %@ with error: %@", buf, 0x20u);
  }
  v5[2](v5, v8);

}

- (void)reset
{
  id completion;

  -[CSModelBenchmarker setAllProcessorsAsNil](self, "setAllProcessorsAsNil");
  completion = self->_completion;
  self->_completion = 0;

  self->_allFramesInferenceLatency = 0;
  self->_inferenceTimeSpan = 0;
}

- (void)setAllProcessorsAsNil
{
  EARSyncPSRAudioProcessor *psrAudioProcessor;
  CSSyncKeywordAnalyzerQuasar *vtSecondPassAnalyzer;
  OSDAnalyzer *osdAnalyzer;
  SLODLDProcessor *odldModelAnalyzer;
  CSAudioInjectionEngine *audioInjectionEngine;

  psrAudioProcessor = self->_psrAudioProcessor;
  self->_psrAudioProcessor = 0;

  vtSecondPassAnalyzer = self->_vtSecondPassAnalyzer;
  self->_vtSecondPassAnalyzer = 0;

  osdAnalyzer = self->_osdAnalyzer;
  self->_osdAnalyzer = 0;

  odldModelAnalyzer = self->_odldModelAnalyzer;
  self->_odldModelAnalyzer = 0;

  audioInjectionEngine = self->_audioInjectionEngine;
  self->_audioInjectionEngine = 0;

  if (self->_novDetectAnalyzer)
  {
    nd_close();
    self->_novDetectAnalyzer = 0;
  }
}

- (void)audioEngineDidStartRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6
{
  dispatch_async((dispatch_queue_t)self->_queue, &__block_literal_global_19875);
}

- (void)audioEngineBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 atTime:(unint64_t)a7 isFileLoadedBuffer:(BOOL)a8
{
  id v9;
  NSObject *queue;
  id v11;
  _QWORD v12[4];
  id v13;
  CSModelBenchmarker *v14;

  v9 = a5;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __112__CSModelBenchmarker_audioEngineBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_isFileLoadedBuffer___block_invoke;
  v12[3] = &unk_1E7C292A0;
  v13 = v9;
  v14 = self;
  v11 = v9;
  dispatch_async(queue, v12);

}

- (void)audioEngineDidStopRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 reason:(unint64_t)a5
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__CSModelBenchmarker_audioEngineDidStopRecord_audioStreamHandleId_reason___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_onDeviceCompilationWithConfigFile:(id)a3 locale:(id)a4 modelType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSString *tempCacheDirectoryForMil2Bnns;
  id v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0D19190], "readMilFilePathFromConfig:modelType:", v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(MEMORY[0x1E0D19190], "getBackendTypeFromModelFile:", v10);
  if (v11 == 2)
  {
LABEL_6:
    v14 = 0;
    goto LABEL_7;
  }
  if (v11 != 1)
  {
    v15 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "-[CSModelBenchmarker _onDeviceCompilationWithConfigFile:locale:modelType:]";
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s No Valid backend for compilation is found for model file: %@ from config: %@", buf, 0x20u);
    }
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0D19180], "sharedHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  tempCacheDirectoryForMil2Bnns = self->_tempCacheDirectoryForMil2Bnns;
  v16 = 0;
  objc_msgSend(v12, "compileUsingConfig:locale:compileDirectory:modelType:errOut:", v8, v9, tempCacheDirectoryForMil2Bnns, a5, &v16);
  v14 = v16;

LABEL_7:
}

- (BOOL)_setupAudioInjectionEngineWithAudioURL:(id)a3
{
  CSAudioInjectionEngine *audioInjectionEngine;
  void *v5;
  id v6;
  _BOOL4 v7;
  _QWORD v9[5];
  _BYTE v10[40];

  audioInjectionEngine = self->_audioInjectionEngine;
  v5 = (void *)MEMORY[0x1E0D190F8];
  v6 = a3;
  objc_msgSend(v5, "lpcmMonoInterleavedASBD");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__CSModelBenchmarker__setupAudioInjectionEngineWithAudioURL___block_invoke_35;
  v9[3] = &unk_1E7C27BF8;
  v9[4] = self;
  v7 = -[CSAudioInjectionEngine injectAudio:withScaleFactor:outASBD:playbackStarted:completion:](audioInjectionEngine, "injectAudio:withScaleFactor:outASBD:playbackStarted:completion:", v6, v10, &__block_literal_global_34_19855, v9, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0)));

  if (v7)
  {
    -[CSAudioInjectionEngine setDelegate:](self->_audioInjectionEngine, "setDelegate:", self);
    -[CSAudioInjectionEngine start](self->_audioInjectionEngine, "start");
    -[CSAudioInjectionEngine startAudioStreamWithOption:](self->_audioInjectionEngine, "startAudioStreamWithOption:", 0);
  }
  return v7;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CSSyncKeywordAnalyzerQuasar)vtSecondPassAnalyzer
{
  return self->_vtSecondPassAnalyzer;
}

- (void)setVtSecondPassAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_vtSecondPassAnalyzer, a3);
}

- (EARSyncPSRAudioProcessor)psrAudioProcessor
{
  return self->_psrAudioProcessor;
}

- (void)setPsrAudioProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_psrAudioProcessor, a3);
}

- (OSDAnalyzer)osdAnalyzer
{
  return self->_osdAnalyzer;
}

- (void)setOsdAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_osdAnalyzer, a3);
}

- (SLODLDProcessor)odldModelAnalyzer
{
  return self->_odldModelAnalyzer;
}

- (void)setOdldModelAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_odldModelAnalyzer, a3);
}

- (void)novDetectAnalyzer
{
  return self->_novDetectAnalyzer;
}

- (void)setNovDetectAnalyzer:(void *)a3
{
  self->_novDetectAnalyzer = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (CSAudioInjectionEngine)audioInjectionEngine
{
  return self->_audioInjectionEngine;
}

- (void)setAudioInjectionEngine:(id)a3
{
  objc_storeStrong((id *)&self->_audioInjectionEngine, a3);
}

- (OS_dispatch_queue)modelExeQueue
{
  return self->_modelExeQueue;
}

- (void)setModelExeQueue:(id)a3
{
  objc_storeStrong((id *)&self->_modelExeQueue, a3);
}

- (unint64_t)allFramesInferenceLatency
{
  return self->_allFramesInferenceLatency;
}

- (void)setAllFramesInferenceLatency:(unint64_t)a3
{
  self->_allFramesInferenceLatency = a3;
}

- (int64_t)totalNumberSamples
{
  return self->_totalNumberSamples;
}

- (void)setTotalNumberSamples:(int64_t)a3
{
  self->_totalNumberSamples = a3;
}

- (int64_t)inferenceTimeSpan
{
  return self->_inferenceTimeSpan;
}

- (void)setInferenceTimeSpan:(int64_t)a3
{
  self->_inferenceTimeSpan = a3;
}

- (NSString)tempCacheDirectoryForMil2Bnns
{
  return self->_tempCacheDirectoryForMil2Bnns;
}

- (void)setTempCacheDirectoryForMil2Bnns:(id)a3
{
  objc_storeStrong((id *)&self->_tempCacheDirectoryForMil2Bnns, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tempCacheDirectoryForMil2Bnns, 0);
  objc_storeStrong((id *)&self->_modelExeQueue, 0);
  objc_storeStrong((id *)&self->_audioInjectionEngine, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_odldModelAnalyzer, 0);
  objc_storeStrong((id *)&self->_osdAnalyzer, 0);
  objc_storeStrong((id *)&self->_psrAudioProcessor, 0);
  objc_storeStrong((id *)&self->_vtSecondPassAnalyzer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __61__CSModelBenchmarker__setupAudioInjectionEngineWithAudioURL___block_invoke_35(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CSModelBenchmarker__setupAudioInjectionEngineWithAudioURL___block_invoke_2;
  block[3] = &unk_1E7C292C8;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __61__CSModelBenchmarker__setupAudioInjectionEngineWithAudioURL___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[CSModelBenchmarker _setupAudioInjectionEngineWithAudioURL:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v0, OS_LOG_TYPE_DEFAULT, "%s Audio file read start", (uint8_t *)&v1, 0xCu);
  }
}

uint64_t __61__CSModelBenchmarker__setupAudioInjectionEngineWithAudioURL___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSModelBenchmarker _setupAudioInjectionEngineWithAudioURL:]_block_invoke_2";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Audio file read end", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "stopAudioStream");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "stop");
}

void __74__CSModelBenchmarker_audioEngineDidStopRecord_audioStreamHandleId_reason___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0D18F60];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v28 = 136315138;
    v29 = "-[CSModelBenchmarker audioEngineDidStopRecord:audioStreamHandleId:reason:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s stopRecording", (uint8_t *)&v28, 0xCu);
  }
  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[11];
  if (v4[2])
  {
    v6 = mach_absolute_time();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "getResultsFromFlushedAudio");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) += mach_absolute_time() - v6;
    v8 = v7 != 0;

    v4 = *(_QWORD **)(a1 + 32);
  }
  else
  {
    v8 = 1;
  }
  v9 = (void *)v4[3];
  if (v9)
  {
    objc_msgSend(v9, "endAudio");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "getLatestSuperVector");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "getAccmulatedProcessingTime");
    if (!v10)
      v8 = 0;
    v11 = (double)(unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "getProcessedAudioDurationMs");

    v4 = *(_QWORD **)(a1 + 32);
  }
  else
  {
    v11 = (double)v5 * 1000.0 / 16000.0;
  }
  v12 = (void *)v4[4];
  if (v12)
  {
    objc_msgSend(v12, "endAudio");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "getCurrentOSDFeatures");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = objc_msgSend(v13, "inferenceTime");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "getCurrentOSDFeatures");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "processedAudioMs");
    v11 = v15;

    v4 = *(_QWORD **)(a1 + 32);
  }
  if (v4[6] && !nd_getresults())
    v8 = 0;
  v16 = mach_absolute_time();
  v17 = os_signpost_id_generate(*v2);
  v18 = *v2;
  v19 = v18;
  if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    v20 = *v2;
  }
  else
  {
    if (os_signpost_enabled(v18))
    {
      v28 = 134349570;
      v29 = (const char *)v16;
      v30 = 2080;
      v31 = "SiriX";
      v32 = 2080;
      v33 = "enableTelemetry=YES";
      _os_signpost_emit_with_name_impl(&dword_1C2614000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "allFramesProcessingLatency", "%{public, signpost.description:begin_time}llu, %s %s", (uint8_t *)&v28, 0x20u);
    }

    v20 = *v2;
    if (os_signpost_enabled(v20))
    {
      v21 = (const char *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + v16);
      v28 = 134349570;
      v29 = v21;
      v30 = 2080;
      v31 = "SiriX";
      v32 = 2080;
      v33 = "enableTelemetry=YES";
      _os_signpost_emit_with_name_impl(&dword_1C2614000, v20, OS_SIGNPOST_INTERVAL_END, v17, "allFramesProcessingLatency", "%{public, signpost.description:end_time}llu, %s %s", (uint8_t *)&v28, 0x20u);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "setAllProcessorsAsNil");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = 0;
  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(_QWORD *)(v22 + 56);
  if (v23)
  {
    v24 = vcvtpd_s64_f64(v11 / (double)*(uint64_t *)(v22 + 96));
    if (v8)
    {
      (*(void (**)(uint64_t, _QWORD, unint64_t, double))(v23 + 16))(v23, 0, v24, v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2002, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, unint64_t, double))(v23 + 16))(v23, v25, v24, v11);

    }
    v26 = *(_QWORD *)(a1 + 32);
    v27 = *(void **)(v26 + 56);
    *(_QWORD *)(v26 + 56) = 0;

  }
}

void __112__CSModelBenchmarker_audioEngineBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_isFileLoadedBuffer___block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  double v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v2 = objc_msgSend(*(id *)(a1 + 32), "length");
  v3 = v2 / objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleByteDepth");
  v4 = (double)v3 * 1000.0 / 16000.0;
  NSLog(CFSTR("each batch duration: %d"), (int)v4);
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88) += v3;
  v5 = objc_alloc(MEMORY[0x1E0D18FC8]);
  v15 = (id)objc_msgSend(v5, "initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:remoteVAD:", *(_QWORD *)(a1 + 32), 1, v3, objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleByteDepth"), 0, 0, 0);
  v6 = *(_QWORD *)(a1 + 40);
  if ((*(_QWORD *)(v6 + 96) & 0x8000000000000000) != 0)
  {
    *(_QWORD *)(v6 + 96) = (uint64_t)v4;
    v6 = *(_QWORD *)(a1 + 40);
  }
  if (*(_QWORD *)(v6 + 16))
  {
    v7 = mach_absolute_time();
    v8 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "getAnalyzedResultsFromAudioChunk:", v15);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80) += mach_absolute_time() - v7;
  }
  v9 = *(id *)(a1 + 32);
  if (objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingIsFloat"))
  {
    objc_msgSend(MEMORY[0x1E0D19100], "convertToShortLPCMBufFromFloatLPCMBuf:", *(_QWORD *)(a1 + 32));
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v10;
  }
  v11 = *(_QWORD **)(a1 + 40);
  v12 = (void *)v11[3];
  if (v12)
  {
    objc_msgSend(v12, "addAudio:", v9);
    v11 = *(_QWORD **)(a1 + 40);
  }
  v13 = (void *)v11[4];
  if (v13)
  {
    objc_msgSend(v13, "addAudio:numSamples:", v9, v3);
    v11 = *(_QWORD **)(a1 + 40);
  }
  if (v11[6])
  {
    v14 = mach_absolute_time();
    objc_msgSend(objc_retainAutorelease(v9), "bytes");
    nd_wavedata();
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80) += mach_absolute_time() - v14;
  }

}

void __87__CSModelBenchmarker_audioEngineDidStartRecord_audioStreamHandleId_successfully_error___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[CSModelBenchmarker audioEngineDidStartRecord:audioStreamHandleId:successfully:error:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v0, OS_LOG_TYPE_DEFAULT, "%s startRecording", (uint8_t *)&v1, 0xCu);
  }
}

void __55__CSModelBenchmarker_runAudioInjectionOnly_completion___block_invoke(uint64_t a1)
{
  CSAudioInjectionEngine *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v2 = -[CSAudioInjectionEngine initWithStreamHandleId:withInputRecordingNumberOfChannels:]([CSAudioInjectionEngine alloc], "initWithStreamHandleId:withInputRecordingNumberOfChannels:", 1, 1);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 1;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 24);
  *(_QWORD *)(v7 + 24) = 0;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 16);
  *(_QWORD *)(v9 + 16) = 0;

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = 0;

  v13 = MEMORY[0x1C3BC4734](*(_QWORD *)(a1 + 48));
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 56);
  *(_QWORD *)(v14 + 56) = v13;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 0;
  if ((objc_msgSend(*(id *)(a1 + 32), "_setupAudioInjectionEngineWithAudioURL:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v16 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2005, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, uint64_t, double))(v16 + 16))(v16, v17, -1, 0.0);

  }
}

void __77__CSModelBenchmarker_runNovDetectorWithConfig_configRoot_withUrl_completion___block_invoke(uint64_t a1)
{
  CSAudioInjectionEngine *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  int v6;
  int v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setAllProcessorsAsNil");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 10;
  v2 = -[CSAudioInjectionEngine initWithStreamHandleId:withInputRecordingNumberOfChannels:]([CSAudioInjectionEngine alloc], "initWithStreamHandleId:withInputRecordingNumberOfChannels:", 1, 1);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = nd_create();
  v5 = *(_QWORD **)(a1 + 32);
  if (!v5[6])
  {
    objc_msgSend(v5, "reset");
    v12 = *(_QWORD *)(a1 + 64);
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D18E80];
    v15 = 2001;
LABEL_9:
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, v15, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, double))(v12 + 16))(v12, 0.0);

    return;
  }
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String");
  v6 = nd_initialize();
  if (!v6)
  {
    v16 = MEMORY[0x1C3BC4734](*(_QWORD *)(a1 + 64));
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 56);
    *(_QWORD *)(v17 + 56) = v16;

    if ((objc_msgSend(*(id *)(a1 + 32), "_setupAudioInjectionEngineWithAudioURL:", *(_QWORD *)(a1 + 56)) & 1) != 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "reset");
    v12 = *(_QWORD *)(a1 + 64);
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D18E80];
    v15 = 2005;
    goto LABEL_9;
  }
  v7 = v6;
  v8 = (void *)*MEMORY[0x1E0D18F50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F50], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)buf = 136315650;
    v21 = "-[CSModelBenchmarker runNovDetectorWithConfig:configRoot:withUrl:completion:]_block_invoke";
    v22 = 1026;
    v23 = v7;
    v24 = 2082;
    v25 = nd_error();
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to initialize _novDetect: err=[%{public}d]:%{public}s", buf, 0x1Cu);

  }
  objc_msgSend(*(id *)(a1 + 32), "reset");
  v10 = *(_QWORD *)(a1 + 64);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2001, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t, double))(v10 + 16))(v10, v11, -1, 0.0);

}

void __54__CSModelBenchmarker_runNCModelWithConfig_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __73__CSModelBenchmarker_runODLDModelWithConfig_locale_inputText_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setAllProcessorsAsNil");
  objc_msgSend(*(id *)(a1 + 32), "_onDeviceCompilationWithConfigFile:locale:modelType:", *(_QWORD *)(a1 + 40), CFSTR("agnosticLocale"), 2);
  v2 = objc_alloc(MEMORY[0x1E0D9C870]);
  v3 = *(_QWORD *)(a1 + 40);
  v23 = 0;
  v4 = objc_msgSend(v2, "initWithConfigFile:error:", v3, &v23);
  v5 = v23;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  v8 = *(_QWORD **)(a1 + 32);
  if (v8[5])
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9C868]), "initWithInputOrigin:inputAnchor:prevTokens:prevEmb:", &unk_1E7C63C98, &unk_1E7C63CB0, 0, 0);
    objc_msgSend(v9, "updateWithInputUtt:", *(_QWORD *)(a1 + 48));
    v10 = mach_absolute_time();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "processInputContext:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = mach_absolute_time();
    v13 = (id *)MEMORY[0x1E0D18F60];
    v14 = os_signpost_id_generate((os_log_t)*MEMORY[0x1E0D18F60]);
    v15 = *v13;
    v16 = v15;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_DWORD *)buf = 134349570;
      v25 = v10;
      v26 = 2080;
      v27 = "SiriX";
      v28 = 2080;
      v29 = "enableTelemetry=YES";
      _os_signpost_emit_with_name_impl(&dword_1C2614000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "allFramesProcessingLatency", "%{public, signpost.description:begin_time}llu, %s %s", buf, 0x20u);
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) += v12 - v10;
    v17 = *v13;
    v18 = v17;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + v10;
      *(_DWORD *)buf = 134349570;
      v25 = v19;
      v26 = 2080;
      v27 = "SiriX";
      v28 = 2080;
      v29 = "enableTelemetry=YES";
      _os_signpost_emit_with_name_impl(&dword_1C2614000, v18, OS_SIGNPOST_INTERVAL_END, v14, "allFramesProcessingLatency", "%{public, signpost.description:end_time}llu, %s %s", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "reset");
    v20 = *(_QWORD *)(a1 + 56);
    if (v11)
    {
      (*(void (**)(uint64_t, _QWORD))(v20 + 16))(v20, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2002, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v22);

    }
  }
  else
  {
    objc_msgSend(v8, "reset");
    v21 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2001, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v9);
  }

}

void __66__CSModelBenchmarker_runOSDAnalyzerWithConfig_withUrl_completion___block_invoke(uint64_t a1)
{
  CSAudioInjectionEngine *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  float v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "setAllProcessorsAsNil");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = (uint64_t)((double)getOSDInferenceBatchSize(*(void **)(a1 + 40)) * 10.0);
  v2 = -[CSAudioInjectionEngine initWithStreamHandleId:withInputRecordingNumberOfChannels:]([CSAudioInjectionEngine alloc], "initWithStreamHandleId:withInputRecordingNumberOfChannels:", 1, 1);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

  v5 = objc_alloc(MEMORY[0x1E0DA8D30]);
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  v8 = objc_msgSend(v5, "initWithConfigFile:sampleRate:context:queue:delegate:", v6, (unint64_t)v7, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), 0);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 32);
  *(_QWORD *)(v9 + 32) = v8;

  v11 = MEMORY[0x1C3BC4734](*(_QWORD *)(a1 + 56));
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 56);
  *(_QWORD *)(v12 + 56) = v11;

  v14 = *(_QWORD **)(a1 + 32);
  if (!v14[4])
  {
    objc_msgSend(v14, "reset");
    v15 = *(_QWORD *)(a1 + 56);
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0D18E80];
    v18 = 2001;
LABEL_6:
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, v18, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, double))(v15 + 16))(v15, 0.0);

    return;
  }
  if ((objc_msgSend(v14, "_setupAudioInjectionEngineWithAudioURL:", *(_QWORD *)(a1 + 48)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "reset");
    v15 = *(_QWORD *)(a1 + 56);
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0D18E80];
    v18 = 2005;
    goto LABEL_6;
  }
}

void __79__CSModelBenchmarker_runVTSecondPassModelWithConfig_locale_withUrl_completion___block_invoke(uint64_t a1)
{
  CSAudioInjectionEngine *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "setAllProcessorsAsNil");
  objc_msgSend(*(id *)(a1 + 32), "_onDeviceCompilationWithConfigFile:locale:modelType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = (uint64_t)((double)getSeconPassInferenceBatchSize(*(void **)(a1 + 40)) * 10.0);
  v2 = -[CSAudioInjectionEngine initWithStreamHandleId:withInputRecordingNumberOfChannels:]([CSAudioInjectionEngine alloc], "initWithStreamHandleId:withInputRecordingNumberOfChannels:", 1, 1);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D19230]), "initWithConfigPath:triggerTokensArray:preventDuplicatedReset:memoryLock:", *(_QWORD *)(a1 + 40), &unk_1E7C64D18, CSIsHorseman(), 0);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setActiveChannel:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "reset");
  v8 = MEMORY[0x1C3BC4734](*(_QWORD *)(a1 + 64));
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 56);
  *(_QWORD *)(v9 + 56) = v8;

  v11 = *(_QWORD **)(a1 + 32);
  if (!v11[2])
  {
    objc_msgSend(v11, "reset");
    v12 = *(_QWORD *)(a1 + 64);
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D18E80];
    v15 = 2001;
LABEL_6:
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, v15, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, double))(v12 + 16))(v12, 0.0);

    return;
  }
  if ((objc_msgSend(v11, "_setupAudioInjectionEngineWithAudioURL:", *(_QWORD *)(a1 + 56)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "reset");
    v12 = *(_QWORD *)(a1 + 64);
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D18E80];
    v15 = 2005;
    goto LABEL_6;
  }
}

void __82__CSModelBenchmarker_runLstmPhsModelWithConfig_withUrl_withConfigRoot_completion___block_invoke(uint64_t a1)
{
  CSAudioInjectionEngine *v2;
  uint64_t v3;
  void *v4;
  dispatch_queue_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  objc_msgSend(*(id *)(a1 + 32), "setAllProcessorsAsNil");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = (uint64_t)((double)getPhsInferenceBatchSize(*(void **)(a1 + 40)) * 10.0);
  v2 = -[CSAudioInjectionEngine initWithStreamHandleId:withInputRecordingNumberOfChannels:]([CSAudioInjectionEngine alloc], "initWithStreamHandleId:withInputRecordingNumberOfChannels:", 1, 1);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

  v5 = dispatch_queue_create("Model benchmark Queue", 0);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v5;

  v8 = objc_alloc(MEMORY[0x1E0D1F0E8]);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  v12 = objc_msgSend(v8, "initWithConfigFile:configRoot:sampleRate:delegate:queue:", v9, v10, (unint64_t)v11, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 24);
  *(_QWORD *)(v13 + 24) = v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "resetForNewRequest");
  v15 = MEMORY[0x1C3BC4734](*(_QWORD *)(a1 + 64));
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 56);
  *(_QWORD *)(v16 + 56) = v15;

  v18 = *(_QWORD **)(a1 + 32);
  if (!v18[3])
  {
    objc_msgSend(v18, "reset");
    v19 = *(_QWORD *)(a1 + 64);
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0D18E80];
    v22 = 2001;
LABEL_6:
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, v22, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, double))(v19 + 16))(v19, 0.0);

    return;
  }
  if ((objc_msgSend(v18, "_setupAudioInjectionEngineWithAudioURL:", *(_QWORD *)(a1 + 56)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "reset");
    v19 = *(_QWORD *)(a1 + 64);
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0D18E80];
    v22 = 2005;
    goto LABEL_6;
  }
}

@end
