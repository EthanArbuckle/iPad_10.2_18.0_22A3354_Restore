@implementation CSVTRePromptSELFLogger

- (void)logRePromptFinishedWithSiriSpeechID:(id)a3 withRePromptDate:(id)a4 withIsRePrompted:(BOOL)a5 withLocale:(id)a6
{
  _BOOL8 v7;
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
  id v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v7 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = SSRLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SSRLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v20 = "-[CSVTRePromptSELFLogger logRePromptFinishedWithSiriSpeechID:withRePromptDate:withIsRePrompted:withLocale:]";
    v13 = CFSTR("NO");
    v19 = 136316162;
    if (v7)
      v13 = CFSTR("YES");
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    v25 = 2112;
    v26 = v13;
    v27 = 2112;
    v28 = v11;
    _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s RePrompt SELF Log for siri speech ID %@, repromptDate %@, isRePrompted %@, locale %@", (uint8_t *)&v19, 0x34u);
  }
  v14 = objc_alloc_init(MEMORY[0x1E0D99B10]);
  objc_msgSend(v14, "setSiriSpeechID:", v9);
  objc_msgSend(v14, "setIsRePrompted:", v7);
  objc_msgSend(v14, "setLastWhenRePrompted:", v10);
  v15 = objc_alloc_init(MEMORY[0x1E0D99A58]);
  objc_msgSend(v15, "setVoiceTriggerRePrompted:", v14);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedAnalytics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "defaultMessageStream");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSVTRePromptSELFLogger voiceTriggerRePromptIsolatedStreamID](CSVTRePromptSELFLogger, "voiceTriggerRePromptIsolatedStreamID");
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
    v3 = (void *)_voiceTriggerRePromptIsolatedStreamID;
    _voiceTriggerRePromptIsolatedStreamID = v2;

  }
}

+ (NSUUID)voiceTriggerRePromptIsolatedStreamID
{
  return (NSUUID *)(id)_voiceTriggerRePromptIsolatedStreamID;
}

+ (id)sharedLogger
{
  if (sharedLogger_onceToken_5417 != -1)
    dispatch_once(&sharedLogger_onceToken_5417, &__block_literal_global_5418);
  return (id)sharedLogger_shared;
}

void __38__CSVTRePromptSELFLogger_sharedLogger__block_invoke()
{
  CSVTRePromptSELFLogger *v0;
  void *v1;

  v0 = objc_alloc_init(CSVTRePromptSELFLogger);
  v1 = (void *)sharedLogger_shared;
  sharedLogger_shared = (uint64_t)v0;

}

@end
