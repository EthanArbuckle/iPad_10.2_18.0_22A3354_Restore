@implementation CSVTUITrainingSelfLogger

- (void)logSiriSetupPHSEnrollmentUtteranceCompletedWithSiriSetupID:(id)a3 withPageNumber:(int)a4 withPhId:(id)a5 withTopScoreForUtterance:(float)a6 withStartSampleCount:(int)a7 withEndSampleCount:(int)a8 withHasSpeechDetected:(int)a9
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  objc_class *v15;
  id v16;
  id v17;
  double v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v10 = *(_QWORD *)&a8;
  v11 = *(_QWORD *)&a7;
  v13 = *(_QWORD *)&a4;
  v15 = (objc_class *)MEMORY[0x1E0D9A3C0];
  v16 = a5;
  v17 = a3;
  v23 = objc_alloc_init(v15);
  objc_msgSend(v23, "setPageNumber:", v13);
  objc_msgSend(v23, "setPhraseId:", v16);

  *(float *)&v18 = a6;
  objc_msgSend(v23, "setTopScoreForUtterance:", v18);
  objc_msgSend(v23, "setStartSampleCount:", v11);
  objc_msgSend(v23, "setEndSampleCount:", v10);
  objc_msgSend(v23, "setHasSpeechDetected:", a9 != 0);
  v19 = objc_alloc_init(MEMORY[0x1E0D9A3A8]);
  v20 = objc_alloc_init(MEMORY[0x1E0D9A3B0]);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v17);

  objc_msgSend(v20, "setSiriSetupId:", v21);
  objc_msgSend(v19, "setEventMetadata:", v20);
  objc_msgSend(v19, "setEnrollmentUtteranceCompleted:", v23);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "emitMessage:", v19);

}

- (void)logSiriSetupPHSEnrollmentDigitalZeroDetectionCompletedWithSiriSetupID:(id)a3 withPageNumber:(int)a4 withPhId:(id)a5 withMaxNumContinuousZeros:(int)a6 withMaxNumAllowedContinuousZeros:(int)a7 withIsMaxNumContinuousZerosOverThreshold:(BOOL)a8 withLocale:(id)a9 withVTAssetConfigVersion:(id)a10 withStageStatus:(int)a11
{
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v11 = a8;
  v12 = *(_QWORD *)&a7;
  v13 = *(_QWORD *)&a6;
  v15 = *(_QWORD *)&a4;
  v46 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a5;
  v18 = a9;
  v19 = a10;
  v20 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 136317442;
    v27 = "-[CSVTUITrainingSelfLogger logSiriSetupPHSEnrollmentDigitalZeroDetectionCompletedWithSiriSetupID:withPageNumbe"
          "r:withPhId:withMaxNumContinuousZeros:withMaxNumAllowedContinuousZeros:withIsMaxNumContinuousZerosOverThreshold"
          ":withLocale:withVTAssetConfigVersion:withStageStatus:]";
    v28 = 2112;
    v29 = v16;
    v30 = 1024;
    v31 = v15;
    v32 = 2112;
    v33 = v17;
    v34 = 1024;
    v35 = v13;
    v36 = 1024;
    v37 = v12;
    v38 = 1024;
    v39 = v11;
    v40 = 2112;
    v41 = v18;
    v42 = 2112;
    v43 = v19;
    v44 = 1024;
    v45 = a11;
    _os_log_impl(&dword_1B502E000, v20, OS_LOG_TYPE_DEFAULT, "%s logSiriSetupPHSEnrollmentDigitalZero, setupID: %@, pageNumber: %d, phID: %@, maxZeros: %d, maxAllowed: %d, isOverThreshold: %d locale: %@, assetConfigVersion: %@, sessionStatus: %u", (uint8_t *)&v26, 0x52u);
  }
  v21 = objc_alloc_init(MEMORY[0x1E0D9A3B8]);
  objc_msgSend(v21, "setPageNumber:", v15);
  objc_msgSend(v21, "setPhraseId:", v17);
  objc_msgSend(v21, "setMaxNumContinuousZeros:", v13);
  objc_msgSend(v21, "setMaxNumAllowedContinuousZeros:", v12);
  objc_msgSend(v21, "setIsMaxNumContinuousZerosOverThreshold:", v11);
  objc_msgSend(v21, "setLocale:", v18);
  objc_msgSend(v21, "setVtAssetConfigVersion:", v19);
  objc_msgSend(v21, "setStageStatus:", a11);
  v22 = objc_alloc_init(MEMORY[0x1E0D9A3A8]);
  v23 = objc_alloc_init(MEMORY[0x1E0D9A3B0]);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D9A4F8]), "initWithNSUUID:", v16);
  objc_msgSend(v23, "setSiriSetupId:", v24);

  objc_msgSend(v22, "setEventMetadata:", v23);
  objc_msgSend(v22, "setEnrollmentZeroDetectionCompleted:", v21);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "emitMessage:", v22);

}

+ (id)sharedLogger
{
  if (sharedLogger_onceToken != -1)
    dispatch_once(&sharedLogger_onceToken, &__block_literal_global_1173);
  return (id)sharedLogger_sharedVTUITrainingSelfLogger;
}

void __40__CSVTUITrainingSelfLogger_sharedLogger__block_invoke()
{
  CSVTUITrainingSelfLogger *v0;
  void *v1;

  v0 = objc_alloc_init(CSVTUITrainingSelfLogger);
  v1 = (void *)sharedLogger_sharedVTUITrainingSelfLogger;
  sharedLogger_sharedVTUITrainingSelfLogger = (uint64_t)v0;

}

@end
