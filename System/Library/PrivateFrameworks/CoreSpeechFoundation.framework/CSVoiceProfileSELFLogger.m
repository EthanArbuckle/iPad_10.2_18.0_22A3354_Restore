@implementation CSVoiceProfileSELFLogger

- (void)logVoiceProfileICloudSyncFinishedForEnrollmentId:(id)a3 isVoiceProfileiCloudSyncSuccess:(BOOL)a4 failureReasonIfAny:(id)a5 forLocale:(id)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  const __CFString *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v8 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = SSRLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SSRLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("NO");
    v19 = 136315906;
    v20 = "-[CSVoiceProfileSELFLogger logVoiceProfileICloudSyncFinishedForEnrollmentId:isVoiceProfileiCloudSyncSuccess:fa"
          "ilureReasonIfAny:forLocale:]";
    if (v8)
      v13 = CFSTR("YES");
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v13;
    v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s VoiceProfile iCloud Sync SELF Log for enrollment ID %@, isVoiceProfileiCloudSyncSuccess %@, failureReason %@", (uint8_t *)&v19, 0x2Au);
  }
  v14 = objc_alloc_init(MEMORY[0x1E0D99AF8]);
  objc_msgSend(v14, "setEnrollmentId:", v9);
  objc_msgSend(v14, "setIsVoiceProfileSyncSuccess:", v8);
  objc_msgSend(v14, "setVoiceProfileSyncFailureReason:", v10);
  objc_msgSend(v14, "setLocale:", v11);
  v15 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  objc_msgSend(v15, "setVoiceProfileICloudSyncFinished:", v14);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedAnalytics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "defaultMessageStream");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSVoiceProfileSELFLogger voiceProfileiCloudSyncIsolatedStreamID](CSVoiceProfileSELFLogger, "voiceProfileiCloudSyncIsolatedStreamID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "emitMessage:isolatedStreamUUID:", v15, v18);

}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)_voiceProfileiCloudSyncIsolatedStreamID;
    _voiceProfileiCloudSyncIsolatedStreamID = v2;

  }
}

+ (NSUUID)voiceProfileiCloudSyncIsolatedStreamID
{
  return (NSUUID *)(id)_voiceProfileiCloudSyncIsolatedStreamID;
}

+ (id)sharedLogger
{
  if (sharedLogger_onceToken_10607 != -1)
    dispatch_once(&sharedLogger_onceToken_10607, &__block_literal_global_10608);
  return (id)sharedLogger_shared_10609;
}

void __40__CSVoiceProfileSELFLogger_sharedLogger__block_invoke()
{
  CSVoiceProfileSELFLogger *v0;
  void *v1;

  v0 = objc_alloc_init(CSVoiceProfileSELFLogger);
  v1 = (void *)sharedLogger_shared_10609;
  sharedLogger_shared_10609 = (uint64_t)v0;

}

@end
