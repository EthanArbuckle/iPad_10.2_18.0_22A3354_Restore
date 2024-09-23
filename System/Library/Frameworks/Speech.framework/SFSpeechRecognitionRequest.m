@implementation SFSpeechRecognitionRequest

- (SFSpeechRecognitionRequest)init
{
  uint64_t v3;
  SFSpeechRecognitionRequest *v4;
  SFSpeechRecognitionRequest *v5;
  NSArray *contextualStrings;
  SFSpeechRecognitionRequest *v7;
  objc_super v9;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SFSpeechRecognitionRequest;
    v4 = -[SFSpeechRecognitionRequest init](&v9, sel_init);
    v5 = v4;
    if (v4)
    {
      v4->_shouldReportPartialResults = 1;
      contextualStrings = v4->_contextualStrings;
      v4->_contextualStrings = (NSArray *)MEMORY[0x1E0C9AA60];

      v5->_maximumRecognitionDuration = 60.0;
      v5->_detectMultipleUtterances = 0;
      v5->_addsPunctuation = 0;
    }
    self = v5;
    v7 = self;
  }

  return v7;
}

- (void)_setUseOnDeviceRecognition:(BOOL)a3
{
  self->_detectMultipleUtterances = a3;
  -[SFSpeechRecognitionRequest _setForceOfflineRecognition:](self, "_setForceOfflineRecognition:");
}

- (void)setDetectMultipleUtterances:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *detectMultipleUtterancesOverride;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  detectMultipleUtterancesOverride = self->_detectMultipleUtterancesOverride;
  self->_detectMultipleUtterancesOverride = v4;

}

- (BOOL)detectMultipleUtterances
{
  return -[NSNumber BOOLValue](self->_detectMultipleUtterancesOverride, "BOOLValue");
}

- (id)_startedConnectionWithLanguageCode:(id)a3 delegate:(id)a4 taskHint:(int64_t)a5 requestIdentifier:(id)a6
{
  return 0;
}

- (id)_startedLocalConnectionWithLanguageCode:(id)a3 delegate:(id)a4 taskHint:(int64_t)a5 requestIdentifier:(id)a6 taskIdentifier:(id)a7
{
  return 0;
}

- (double)_maximumRecognitionDuration
{
  return self->_maximumRecognitionDuration;
}

- (void)_setMaximumRecognitionDuration:(double)a3
{
  self->_maximumRecognitionDuration = a3;
}

- (BOOL)_forceOfflineRecognition
{
  return self->_forceOfflineRecognition;
}

- (void)_setForceOfflineRecognition:(BOOL)a3
{
  self->_forceOfflineRecognition = a3;
}

- (_SFSearchRequest)_searchRequest
{
  return self->_searchRequest;
}

- (void)_setSearchRequest:(id)a3
{
  objc_storeStrong((id *)&self->_searchRequest, a3);
}

- (NSDictionary)_voiceTriggerEventInfo
{
  return self->_voiceTriggerEventInfo;
}

- (void)_setVoiceTriggerEventInfo:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerEventInfo, a3);
}

- (NSDictionary)_recognitionOverrides
{
  return self->_recognitionOverrides;
}

- (void)_setRecognitionOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_recognitionOverrides, a3);
}

- (NSURL)_modelOverrideURL
{
  return self->_modelOverrideURL;
}

- (void)_setModelOverrideURL:(id)a3
{
  objc_storeStrong((id *)&self->_modelOverrideURL, a3);
}

- (BOOL)_forceUseSiriProcess
{
  return self->_forceUseSiriProcess;
}

- (void)_setForceUseSiriProcess:(BOOL)a3
{
  self->_forceUseSiriProcess = a3;
}

- (SFSpeechRecognitionTaskHint)taskHint
{
  return self->_taskHint;
}

- (void)setTaskHint:(SFSpeechRecognitionTaskHint)taskHint
{
  self->_taskHint = taskHint;
}

- (BOOL)shouldReportPartialResults
{
  return self->_shouldReportPartialResults;
}

- (void)setShouldReportPartialResults:(BOOL)shouldReportPartialResults
{
  self->_shouldReportPartialResults = shouldReportPartialResults;
}

- (NSArray)contextualStrings
{
  return self->_contextualStrings;
}

- (void)setContextualStrings:(NSArray *)contextualStrings
{
  objc_setProperty_nonatomic_copy(self, a2, contextualStrings, 88);
}

- (NSString)interactionIdentifier
{
  return self->_interactionIdentifier;
}

- (void)setInteractionIdentifier:(NSString *)interactionIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, interactionIdentifier, 96);
}

- (BOOL)requiresOnDeviceRecognition
{
  return self->_requiresOnDeviceRecognition;
}

- (void)setRequiresOnDeviceRecognition:(BOOL)requiresOnDeviceRecognition
{
  self->_requiresOnDeviceRecognition = requiresOnDeviceRecognition;
}

- (BOOL)addsPunctuation
{
  return self->_addsPunctuation;
}

- (void)setAddsPunctuation:(BOOL)addsPunctuation
{
  self->_addsPunctuation = addsPunctuation;
}

- (SFSpeechLanguageModelConfiguration)customizedLanguageModel
{
  return self->_customizedLanguageModel;
}

- (void)setCustomizedLanguageModel:(SFSpeechLanguageModelConfiguration *)customizedLanguageModel
{
  objc_setProperty_nonatomic_copy(self, a2, customizedLanguageModel, 104);
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_taskIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
  objc_storeStrong((id *)&self->_customizedLanguageModel, 0);
  objc_storeStrong((id *)&self->_interactionIdentifier, 0);
  objc_storeStrong((id *)&self->_contextualStrings, 0);
  objc_storeStrong((id *)&self->_afDictationRequestParams, 0);
  objc_storeStrong((id *)&self->_modelOverrideURL, 0);
  objc_storeStrong((id *)&self->_recognitionOverrides, 0);
  objc_storeStrong((id *)&self->_voiceTriggerEventInfo, 0);
  objc_storeStrong((id *)&self->_searchRequest, 0);
  objc_storeStrong((id *)&self->_detectMultipleUtterancesOverride, 0);
}

+ (void)initialize
{
  objc_opt_class();
}

- (SFRequestParameters)_requestParametersWithTaskHint:(void *)a3 requestIdentifier:(void *)a4 taskIdentifier:(uint64_t)a5 narrowband:(void *)a6 language:
{
  __CFString *v11;
  id v12;
  id v13;
  SFRequestParameters *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;

  v11 = a6;
  if (a1)
  {
    v12 = a4;
    v13 = a3;
    v14 = objc_alloc_init(SFRequestParameters);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRequestParameters setApplicationName:](v14, "setApplicationName:", v16);

    objc_msgSend(v15, "infoDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0C9AE90]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SFRequestParameters setApplicationVersion:](v14, "setApplicationVersion:", v18);
    -[SFRequestParameters setInlineItemList:](v14, "setInlineItemList:", *(_QWORD *)(a1 + 88));
    -[SFRequestParameters setRequestIdentifier:](v14, "setRequestIdentifier:", v13);

    -[SFRequestParameters setTaskIdentifier:](v14, "setTaskIdentifier:", v12);
    if (!-[__CFString caseInsensitiveCompare:](v11, "caseInsensitiveCompare:", CFSTR("hi-IN-translit")))
    {
      v19 = CFSTR("hi-IN");

      v11 = CFSTR("hi-IN");
    }
    -[SFRequestParameters setLanguage:](v14, "setLanguage:", v11);
    +[SFUtilities taskNameFromTaskHint:](SFUtilities, "taskNameFromTaskHint:", a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRequestParameters setTask:](v14, "setTask:", v20);

    -[SFRequestParameters setNarrowband:](v14, "setNarrowband:", a5);
    -[SFRequestParameters setRecognitionOverrides:](v14, "setRecognitionOverrides:", *(_QWORD *)(a1 + 56));
    -[SFRequestParameters setModelOverrideURL:](v14, "setModelOverrideURL:", *(_QWORD *)(a1 + 64));
    -[SFRequestParameters setMaximumRecognitionDuration:](v14, "setMaximumRecognitionDuration:", 3600.0);
    objc_msgSend(*(id *)(a1 + 104), "languageModel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRequestParameters setDynamicLanguageModel:](v14, "setDynamicLanguageModel:", v21);

    objc_msgSend(*(id *)(a1 + 104), "vocabulary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRequestParameters setDynamicVocabulary:](v14, "setDynamicVocabulary:", v22);

    v23 = *(void **)(a1 + 16);
    if (v23)
      v24 = objc_msgSend(v23, "BOOLValue");
    else
      v24 = *(_BYTE *)(a1 + 8) != 0;
    -[SFRequestParameters setDetectMultipleUtterances:](v14, "setDetectMultipleUtterances:", v24);
    -[SFRequestParameters setOnDeviceOnly:](v14, "setOnDeviceOnly:", objc_msgSend((id)a1, "requiresOnDeviceRecognition"));
    -[SFRequestParameters setEnableAutoPunctuation:](v14, "setEnableAutoPunctuation:", objc_msgSend((id)a1, "addsPunctuation"));

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_sandboxExtensionsWithError:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFUtilities sandboxExtensionsForUsingANEAndAssets](SFUtilities, "sandboxExtensionsForUsingANEAndAssets");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(v2, "addObjectsFromArray:", v3);
    v4 = *(void **)(a1 + 104);
    if (v4)
    {
      objc_msgSend(v4, "languageModel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "path");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SFUtilities issueReadSandboxExtensionForFilePath:error:](SFUtilities, "issueReadSandboxExtensionForFilePath:error:", v6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 104), "vocabulary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 104), "vocabulary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[SFUtilities issueReadSandboxExtensionForFilePath:error:](SFUtilities, "issueReadSandboxExtensionForFilePath:error:", v10, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = 0;
      }

      if (v7)
        objc_msgSend(v2, "addObject:", v7);
      if (v11)
        objc_msgSend(v2, "addObject:", v11);

    }
    v12 = (void *)objc_msgSend(v2, "copy");

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)_dictationOptionsWithTaskHint:(void *)a3 requestIdentifier:
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  if (a1)
  {
    v5 = (objc_class *)MEMORY[0x1E0CFE890];
    v6 = a3;
    v7 = objc_alloc_init(v5);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setApplicationName:", v9);

    objc_msgSend(v8, "infoDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0C9AE90]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v7, "setApplicationVersion:", v11);
    objc_msgSend(v7, "setInlineItemList:", *(_QWORD *)(a1 + 88));
    objc_msgSend(v7, "setRequestIdentifier:", v6);

    objc_msgSend(v7, "setVoiceTriggerEventInfo:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v7, "setMaximumRecognitionDuration:", *(double *)(a1 + 32));
    v12 = *(void **)(a1 + 16);
    if (v12)
      v13 = objc_msgSend(v12, "BOOLValue");
    else
      v13 = *(_BYTE *)(a1 + 8) != 0;
    objc_msgSend(v7, "setDetectUtterances:", v13);
    v14 = *(id *)(a1 + 40);
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v7, "setVoiceSearchTypeOptions:", objc_msgSend(v14, "searchTypes") & 3);
      objc_msgSend(v15, "queryParameters");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setVoiceSearchQueryParameters:", v16);

      objc_msgSend(v15, "headerFields");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setVoiceSearchHeaderFields:", v17);

      objc_msgSend(v7, "setKeyboardType:", 12);
    }
    else
    {
      v18 = 1;
      if (a2 > 1001)
      {
        if (a2 == 1002)
        {
          v18 = 1;
          objc_msgSend(v7, "setTaskHint:", 1);
        }
        else if (a2 == 1004)
        {
          objc_msgSend(v7, "setTaskHint:", 2);
          v18 = 1;
        }
      }
      else
      {
        v19 = 13;
        if (a2 != 1001)
          v19 = 1;
        if (a2 == 2)
          v18 = 12;
        else
          v18 = v19;
      }
      objc_msgSend(v7, "setKeyboardType:", v18);
      objc_msgSend(v7, "setAutoPunctuation:", *(unsigned __int8 *)(a1 + 28));
    }
    objc_msgSend(v7, "setForceOfflineRecognition:", *(unsigned __int8 *)(a1 + 24));
    if (*(_BYTE *)(a1 + 24))
      objc_msgSend(v7, "setMaximumRecognitionDuration:", 3600.0);
    objc_msgSend(v7, "setRecognitionOverrides:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v7, "setModelOverrideURL:", *(_QWORD *)(a1 + 64));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_setAFDictationRequestParams:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 72), a2);
}

@end
