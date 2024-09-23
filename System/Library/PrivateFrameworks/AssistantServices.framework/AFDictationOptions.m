@implementation AFDictationOptions

- (AFDictationOptions)init
{
  AFDictationOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AFDictationOptions;
  result = -[AFDictationOptions init](&v3, sel_init);
  if (result)
    result->_maximumRecognitionDuration = 120.0;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *applicationName;
  id v5;

  applicationName = self->_applicationName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", applicationName, CFSTR("_applicationName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicationDisplayName, CFSTR("_applicationDisplayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicationVersion, CFSTR("_applicationVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_context, CFSTR("_context"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fieldLabel, CFSTR("_fieldLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fieldIdentifier, CFSTR("_fieldIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interactionIdentifier, CFSTR("_interactionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestIdentifier, CFSTR("_requestIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_keyboardType, CFSTR("_keyboardType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_prefixText, CFSTR("_prefixText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_postfixText, CFSTR("_postfixText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_selectedText, CFSTR("_selectedText"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_returnKeyType, CFSTR("_returnKeyType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_languageCodeOverride, CFSTR("_languageCodeOverride"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_offlineLanguage, CFSTR("_offlineLanguage"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_transcriptionMode, CFSTR("_transcriptionMode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_microphoneIdentifier, CFSTR("_microphoneIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inlineItemList, CFSTR("_inlineItemList"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_voiceSearchTypeOptions, CFSTR("_voiceSearchTypeOptions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_voiceSearchHeaderFields, CFSTR("_voiceSearchHeaderFields"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_voiceSearchQueryParameters, CFSTR("_voiceSearchQueryParameters"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_voiceTriggerEventInfo, CFSTR("_voiceTriggerEventInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_orthography, CFSTR("_orthography"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyboardIdentifier, CFSTR("_keyboardIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forceOfflineRecognition, CFSTR("_forceOfflineRecognition"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_preferOnlineRecognition, CFSTR("_preferOnlineRecognition"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_detectUtterances, CFSTR("_detectUtterances"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_continuousListening, CFSTR("_continuousListening"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldHandleCapitalization, CFSTR("_shouldHandleCapitalization"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_autoPunctuation, CFSTR("_autoPunctuation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_emojiRecognition, CFSTR("_emojiRecognition"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_preferOnDeviceRecognition, CFSTR("_preferOnDeviceRecognition"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_secureOfflineOnly, CFSTR("_secureOfflineOnly"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_farField, CFSTR("_farField"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_releaseAudioSessionOnRecordingCompletion, CFSTR("_releaseAudioSessionOnRecordingCompletion"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_incremental, CFSTR("_incremental"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_maximumRecognitionDuration"), self->_maximumRecognitionDuration);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_taskHint, CFSTR("_taskHint"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originalAudioFileURL, CFSTR("_originalAudioFileURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recognitionOverrides, CFSTR("_recognitionOverrides"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelOverrideURL, CFSTR("_modelOverrideURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_languageDetectionUserContext, CFSTR("_languageDetectionUserContext"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_dictationInputOrigin, CFSTR("_dictationInputOrigin"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_samplingInfo, CFSTR("_samplingInfo"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldClassifyIntent, CFSTR("_shouldClassifyIntent"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldRecognizeCommands, CFSTR("_shouldRecognizeCommands"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldGenerateVoiceCommandCandidates, CFSTR("_shouldGenerateVoiceCommandCandidates"));

}

- (AFDictationOptions)initWithCoder:(id)a3
{
  id v4;
  AFDictationOptions *v5;
  uint64_t v6;
  NSString *applicationName;
  uint64_t v8;
  NSString *applicationDisplayName;
  uint64_t v10;
  NSString *applicationVersion;
  uint64_t v12;
  STSiriContext *context;
  uint64_t v14;
  NSString *fieldLabel;
  uint64_t v16;
  NSString *fieldIdentifier;
  uint64_t v18;
  NSString *interactionIdentifier;
  uint64_t v20;
  NSString *requestIdentifier;
  uint64_t v22;
  NSString *prefixText;
  uint64_t v24;
  NSString *postfixText;
  uint64_t v26;
  NSString *selectedText;
  uint64_t v28;
  NSString *languageCodeOverride;
  uint64_t v30;
  NSString *offlineLanguage;
  uint64_t v32;
  NSString *microphoneIdentifier;
  uint64_t v34;
  NSString *orthography;
  uint64_t v36;
  NSString *keyboardIdentifier;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSArray *inlineItemList;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSDictionary *voiceSearchHeaderFields;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSDictionary *voiceSearchQueryParameters;
  uint64_t v53;
  NSDictionary *voiceTriggerEventInfo;
  NSDictionary *v55;
  double v56;
  uint64_t v57;
  NSURL *originalAudioFileURL;
  uint64_t v59;
  NSDictionary *recognitionOverrides;
  NSDictionary *v61;
  uint64_t v62;
  NSURL *modelOverrideURL;
  uint64_t v64;
  AFLanguageDetectionUserContext *languageDetectionUserContext;
  uint64_t v66;
  NSString *samplingInfo;
  objc_super v69;
  _QWORD v70[3];
  _QWORD v71[3];
  _QWORD v72[3];

  v72[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)AFDictationOptions;
  v5 = -[AFDictationOptions init](&v69, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_applicationName"));
    v6 = objc_claimAutoreleasedReturnValue();
    applicationName = v5->_applicationName;
    v5->_applicationName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_applicationDisplayName"));
    v8 = objc_claimAutoreleasedReturnValue();
    applicationDisplayName = v5->_applicationDisplayName;
    v5->_applicationDisplayName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_applicationVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    applicationVersion = v5->_applicationVersion;
    v5->_applicationVersion = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_context"));
    v12 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (STSiriContext *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fieldLabel"));
    v14 = objc_claimAutoreleasedReturnValue();
    fieldLabel = v5->_fieldLabel;
    v5->_fieldLabel = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fieldIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    fieldIdentifier = v5->_fieldIdentifier;
    v5->_fieldIdentifier = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_interactionIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    interactionIdentifier = v5->_interactionIdentifier;
    v5->_interactionIdentifier = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_requestIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSString *)v20;

    v5->_keyboardType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_keyboardType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_prefixText"));
    v22 = objc_claimAutoreleasedReturnValue();
    prefixText = v5->_prefixText;
    v5->_prefixText = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_postfixText"));
    v24 = objc_claimAutoreleasedReturnValue();
    postfixText = v5->_postfixText;
    v5->_postfixText = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_selectedText"));
    v26 = objc_claimAutoreleasedReturnValue();
    selectedText = v5->_selectedText;
    v5->_selectedText = (NSString *)v26;

    v5->_returnKeyType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_returnKeyType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_languageCodeOverride"));
    v28 = objc_claimAutoreleasedReturnValue();
    languageCodeOverride = v5->_languageCodeOverride;
    v5->_languageCodeOverride = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_offlineLanguage"));
    v30 = objc_claimAutoreleasedReturnValue();
    offlineLanguage = v5->_offlineLanguage;
    v5->_offlineLanguage = (NSString *)v30;

    v5->_transcriptionMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_transcriptionMode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_microphoneIdentifier"));
    v32 = objc_claimAutoreleasedReturnValue();
    microphoneIdentifier = v5->_microphoneIdentifier;
    v5->_microphoneIdentifier = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_orthography"));
    v34 = objc_claimAutoreleasedReturnValue();
    orthography = v5->_orthography;
    v5->_orthography = (NSString *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_keyboardIdentifier"));
    v36 = objc_claimAutoreleasedReturnValue();
    keyboardIdentifier = v5->_keyboardIdentifier;
    v5->_keyboardIdentifier = (NSString *)v36;

    v38 = (void *)MEMORY[0x1E0C99E60];
    v72[0] = objc_opt_class();
    v72[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setWithArray:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v40, CFSTR("_inlineItemList"));
    v41 = objc_claimAutoreleasedReturnValue();
    inlineItemList = v5->_inlineItemList;
    v5->_inlineItemList = (NSArray *)v41;

    v5->_voiceSearchTypeOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_voiceSearchTypeOptions"));
    v43 = (void *)MEMORY[0x1E0C99E60];
    v71[0] = objc_opt_class();
    v71[1] = objc_opt_class();
    v71[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 3);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setWithArray:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v45, CFSTR("_voiceSearchHeaderFields"));
    v46 = objc_claimAutoreleasedReturnValue();
    voiceSearchHeaderFields = v5->_voiceSearchHeaderFields;
    v5->_voiceSearchHeaderFields = (NSDictionary *)v46;

    v48 = (void *)MEMORY[0x1E0C99E60];
    v70[0] = objc_opt_class();
    v70[1] = objc_opt_class();
    v70[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 3);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setWithArray:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v50, CFSTR("_voiceSearchQueryParameters"));
    v51 = objc_claimAutoreleasedReturnValue();
    voiceSearchQueryParameters = v5->_voiceSearchQueryParameters;
    v5->_voiceSearchQueryParameters = (NSDictionary *)v51;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("_voiceTriggerEventInfo"));
    v53 = objc_claimAutoreleasedReturnValue();
    voiceTriggerEventInfo = v5->_voiceTriggerEventInfo;
    v5->_voiceTriggerEventInfo = (NSDictionary *)v53;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v55 = v5->_voiceTriggerEventInfo;
      v5->_voiceTriggerEventInfo = 0;

    }
    v5->_forceOfflineRecognition = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_forceOfflineRecognition"));
    v5->_preferOnlineRecognition = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_preferOnlineRecognition"));
    v5->_detectUtterances = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_detectUtterances"));
    v5->_continuousListening = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_continuousListening"));
    v5->_shouldHandleCapitalization = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldHandleCapitalization"));
    v5->_autoPunctuation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_autoPunctuation"));
    v5->_emojiRecognition = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_emojiRecognition"));
    v5->_preferOnDeviceRecognition = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_preferOnDeviceRecognition"));
    v5->_secureOfflineOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_secureOfflineOnly"));
    v5->_farField = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_farField"));
    v5->_releaseAudioSessionOnRecordingCompletion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_releaseAudioSessionOnRecordingCompletion"));
    v5->_incremental = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_incremental"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_maximumRecognitionDuration"));
    v5->_maximumRecognitionDuration = v56;
    v5->_taskHint = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_taskHint"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_originalAudioFileURL"));
    v57 = objc_claimAutoreleasedReturnValue();
    originalAudioFileURL = v5->_originalAudioFileURL;
    v5->_originalAudioFileURL = (NSURL *)v57;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("_recognitionOverrides"));
    v59 = objc_claimAutoreleasedReturnValue();
    recognitionOverrides = v5->_recognitionOverrides;
    v5->_recognitionOverrides = (NSDictionary *)v59;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v61 = v5->_recognitionOverrides;
      v5->_recognitionOverrides = 0;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_modelOverrideURL"));
    v62 = objc_claimAutoreleasedReturnValue();
    modelOverrideURL = v5->_modelOverrideURL;
    v5->_modelOverrideURL = (NSURL *)v62;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_languageDetectionUserContext"));
    v64 = objc_claimAutoreleasedReturnValue();
    languageDetectionUserContext = v5->_languageDetectionUserContext;
    v5->_languageDetectionUserContext = (AFLanguageDetectionUserContext *)v64;

    v5->_dictationInputOrigin = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_dictationInputOrigin"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_samplingInfo"));
    v66 = objc_claimAutoreleasedReturnValue();
    samplingInfo = v5->_samplingInfo;
    v5->_samplingInfo = (NSString *)v66;

    v5->_shouldClassifyIntent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldClassifyIntent"));
    v5->_shouldRecognizeCommands = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldRecognizeCommands"));
    v5->_shouldGenerateVoiceCommandCandidates = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldGenerateVoiceCommandCandidates"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[AFDictationOptions dictationOptionsWithoutTextContext](self, "dictationOptionsWithoutTextContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDictationOptions prefixText](self, "prefixText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrefixText:", v5);

  -[AFDictationOptions postfixText](self, "postfixText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPostfixText:", v6);

  -[AFDictationOptions selectedText](self, "selectedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedText:", v7);

  return v4;
}

- (AFDictationOptions)dictationOptionsWithoutTextContext
{
  id v3;
  void *v4;
  void *v5;
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

  v3 = objc_alloc_init((Class)objc_opt_class());
  -[AFDictationOptions applicationName](self, "applicationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setApplicationName:", v4);

  -[AFDictationOptions applicationDisplayName](self, "applicationDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setApplicationDisplayName:", v5);

  -[AFDictationOptions applicationVersion](self, "applicationVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setApplicationVersion:", v6);

  -[AFDictationOptions context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContext:", v7);

  -[AFDictationOptions fieldLabel](self, "fieldLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFieldLabel:", v8);

  -[AFDictationOptions fieldIdentifier](self, "fieldIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFieldIdentifier:", v9);

  -[AFDictationOptions interactionIdentifier](self, "interactionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInteractionIdentifier:", v10);

  -[AFDictationOptions requestIdentifier](self, "requestIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRequestIdentifier:", v11);

  objc_msgSend(v3, "setKeyboardType:", -[AFDictationOptions keyboardType](self, "keyboardType"));
  objc_msgSend(v3, "setReturnKeyType:", -[AFDictationOptions returnKeyType](self, "returnKeyType"));
  -[AFDictationOptions languageCodeOverride](self, "languageCodeOverride");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLanguageCodeOverride:", v12);

  -[AFDictationOptions offlineLanguage](self, "offlineLanguage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOfflineLanguage:", v13);

  objc_msgSend(v3, "setTranscriptionMode:", -[AFDictationOptions transcriptionMode](self, "transcriptionMode"));
  -[AFDictationOptions microphoneIdentifier](self, "microphoneIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMicrophoneIdentifier:", v14);

  objc_msgSend(v3, "setVoiceSearchTypeOptions:", -[AFDictationOptions voiceSearchTypeOptions](self, "voiceSearchTypeOptions"));
  -[AFDictationOptions voiceSearchHeaderFields](self, "voiceSearchHeaderFields");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVoiceSearchHeaderFields:", v15);

  -[AFDictationOptions voiceSearchQueryParameters](self, "voiceSearchQueryParameters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVoiceSearchQueryParameters:", v16);

  -[AFDictationOptions voiceTriggerEventInfo](self, "voiceTriggerEventInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVoiceTriggerEventInfo:", v17);

  objc_msgSend(v3, "setForceOfflineRecognition:", -[AFDictationOptions forceOfflineRecognition](self, "forceOfflineRecognition"));
  objc_msgSend(v3, "setPreferOnlineRecognition:", -[AFDictationOptions preferOnlineRecognition](self, "preferOnlineRecognition"));
  objc_msgSend(v3, "setDetectUtterances:", -[AFDictationOptions detectUtterances](self, "detectUtterances"));
  objc_msgSend(v3, "setContinuousListening:", -[AFDictationOptions continuousListening](self, "continuousListening"));
  objc_msgSend(v3, "setShouldHandleCapitalization:", -[AFDictationOptions shouldHandleCapitalization](self, "shouldHandleCapitalization"));
  objc_msgSend(v3, "setAutoPunctuation:", -[AFDictationOptions autoPunctuation](self, "autoPunctuation"));
  objc_msgSend(v3, "setEmojiRecognition:", -[AFDictationOptions emojiRecognition](self, "emojiRecognition"));
  objc_msgSend(v3, "setPreferOnDeviceRecognition:", -[AFDictationOptions preferOnDeviceRecognition](self, "preferOnDeviceRecognition"));
  objc_msgSend(v3, "setSecureOfflineOnly:", -[AFDictationOptions secureOfflineOnly](self, "secureOfflineOnly"));
  objc_msgSend(v3, "setFarField:", -[AFDictationOptions farField](self, "farField"));
  -[AFDictationOptions orthography](self, "orthography");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOrthography:", v18);

  -[AFDictationOptions keyboardIdentifier](self, "keyboardIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setKeyboardIdentifier:", v19);

  objc_msgSend(v3, "setReleaseAudioSessionOnRecordingCompletion:", -[AFDictationOptions releaseAudioSessionOnRecordingCompletion](self, "releaseAudioSessionOnRecordingCompletion"));
  objc_msgSend(v3, "setIncremental:", -[AFDictationOptions incremental](self, "incremental"));
  -[AFDictationOptions maximumRecognitionDuration](self, "maximumRecognitionDuration");
  objc_msgSend(v3, "setMaximumRecognitionDuration:");
  objc_msgSend(v3, "setTaskHint:", -[AFDictationOptions taskHint](self, "taskHint"));
  -[AFDictationOptions originalAudioFileURL](self, "originalAudioFileURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOriginalAudioFileURL:", v20);

  -[AFDictationOptions recognitionOverrides](self, "recognitionOverrides");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRecognitionOverrides:", v21);

  -[AFDictationOptions modelOverrideURL](self, "modelOverrideURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setModelOverrideURL:", v22);

  -[AFDictationOptions inlineItemList](self, "inlineItemList");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInlineItemList:", v23);

  -[AFDictationOptions languageDetectionUserContext](self, "languageDetectionUserContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLanguageDetectionUserContext:", v24);

  objc_msgSend(v3, "setDictationInputOrigin:", -[AFDictationOptions dictationInputOrigin](self, "dictationInputOrigin"));
  -[AFDictationOptions samplingInfo](self, "samplingInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSamplingInfo:", v25);

  objc_msgSend(v3, "setShouldClassifyIntent:", -[AFDictationOptions shouldClassifyIntent](self, "shouldClassifyIntent"));
  objc_msgSend(v3, "setShouldRecognizeCommands:", -[AFDictationOptions shouldRecognizeCommands](self, "shouldRecognizeCommands"));
  objc_msgSend(v3, "setShouldGenerateVoiceCommandCandidates:", -[AFDictationOptions shouldGenerateVoiceCommandCandidates](self, "shouldGenerateVoiceCommandCandidates"));
  return (AFDictationOptions *)v3;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void)setApplicationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)applicationDisplayName
{
  return self->_applicationDisplayName;
}

- (void)setApplicationDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)applicationVersion
{
  return self->_applicationVersion;
}

- (void)setApplicationVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (STSiriContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSString)fieldLabel
{
  return self->_fieldLabel;
}

- (void)setFieldLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)fieldIdentifier
{
  return self->_fieldIdentifier;
}

- (void)setFieldIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)interactionIdentifier
{
  return self->_interactionIdentifier;
}

- (void)setInteractionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (NSString)prefixText
{
  return self->_prefixText;
}

- (void)setPrefixText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)postfixText
{
  return self->_postfixText;
}

- (void)setPostfixText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)selectedText
{
  return self->_selectedText;
}

- (void)setSelectedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int64_t)returnKeyType
{
  return self->_returnKeyType;
}

- (void)setReturnKeyType:(int64_t)a3
{
  self->_returnKeyType = a3;
}

- (int64_t)transcriptionMode
{
  return self->_transcriptionMode;
}

- (void)setTranscriptionMode:(int64_t)a3
{
  self->_transcriptionMode = a3;
}

- (NSArray)inlineItemList
{
  return self->_inlineItemList;
}

- (void)setInlineItemList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)microphoneIdentifier
{
  return self->_microphoneIdentifier;
}

- (void)setMicrophoneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)orthography
{
  return self->_orthography;
}

- (void)setOrthography:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)keyboardIdentifier
{
  return self->_keyboardIdentifier;
}

- (void)setKeyboardIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)languageCodeOverride
{
  return self->_languageCodeOverride;
}

- (void)setLanguageCodeOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)offlineLanguage
{
  return self->_offlineLanguage;
}

- (void)setOfflineLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (int64_t)voiceSearchTypeOptions
{
  return self->_voiceSearchTypeOptions;
}

- (void)setVoiceSearchTypeOptions:(int64_t)a3
{
  self->_voiceSearchTypeOptions = a3;
}

- (NSDictionary)voiceSearchHeaderFields
{
  return self->_voiceSearchHeaderFields;
}

- (void)setVoiceSearchHeaderFields:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSDictionary)voiceSearchQueryParameters
{
  return self->_voiceSearchQueryParameters;
}

- (void)setVoiceSearchQueryParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSDictionary)voiceTriggerEventInfo
{
  return self->_voiceTriggerEventInfo;
}

- (void)setVoiceTriggerEventInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)forceOfflineRecognition
{
  return self->_forceOfflineRecognition;
}

- (void)setForceOfflineRecognition:(BOOL)a3
{
  self->_forceOfflineRecognition = a3;
}

- (BOOL)preferOnlineRecognition
{
  return self->_preferOnlineRecognition;
}

- (void)setPreferOnlineRecognition:(BOOL)a3
{
  self->_preferOnlineRecognition = a3;
}

- (BOOL)detectUtterances
{
  return self->_detectUtterances;
}

- (void)setDetectUtterances:(BOOL)a3
{
  self->_detectUtterances = a3;
}

- (BOOL)continuousListening
{
  return self->_continuousListening;
}

- (void)setContinuousListening:(BOOL)a3
{
  self->_continuousListening = a3;
}

- (BOOL)shouldHandleCapitalization
{
  return self->_shouldHandleCapitalization;
}

- (void)setShouldHandleCapitalization:(BOOL)a3
{
  self->_shouldHandleCapitalization = a3;
}

- (BOOL)autoPunctuation
{
  return self->_autoPunctuation;
}

- (void)setAutoPunctuation:(BOOL)a3
{
  self->_autoPunctuation = a3;
}

- (BOOL)emojiRecognition
{
  return self->_emojiRecognition;
}

- (void)setEmojiRecognition:(BOOL)a3
{
  self->_emojiRecognition = a3;
}

- (BOOL)preferOnDeviceRecognition
{
  return self->_preferOnDeviceRecognition;
}

- (void)setPreferOnDeviceRecognition:(BOOL)a3
{
  self->_preferOnDeviceRecognition = a3;
}

- (BOOL)secureOfflineOnly
{
  return self->_secureOfflineOnly;
}

- (void)setSecureOfflineOnly:(BOOL)a3
{
  self->_secureOfflineOnly = a3;
}

- (BOOL)farField
{
  return self->_farField;
}

- (void)setFarField:(BOOL)a3
{
  self->_farField = a3;
}

- (BOOL)releaseAudioSessionOnRecordingCompletion
{
  return self->_releaseAudioSessionOnRecordingCompletion;
}

- (void)setReleaseAudioSessionOnRecordingCompletion:(BOOL)a3
{
  self->_releaseAudioSessionOnRecordingCompletion = a3;
}

- (BOOL)incremental
{
  return self->_incremental;
}

- (void)setIncremental:(BOOL)a3
{
  self->_incremental = a3;
}

- (double)maximumRecognitionDuration
{
  return self->_maximumRecognitionDuration;
}

- (void)setMaximumRecognitionDuration:(double)a3
{
  self->_maximumRecognitionDuration = a3;
}

- (int64_t)taskHint
{
  return self->_taskHint;
}

- (void)setTaskHint:(int64_t)a3
{
  self->_taskHint = a3;
}

- (NSURL)originalAudioFileURL
{
  return self->_originalAudioFileURL;
}

- (void)setOriginalAudioFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSDictionary)recognitionOverrides
{
  return self->_recognitionOverrides;
}

- (void)setRecognitionOverrides:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSURL)modelOverrideURL
{
  return self->_modelOverrideURL;
}

- (void)setModelOverrideURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (AFLanguageDetectionUserContext)languageDetectionUserContext
{
  return self->_languageDetectionUserContext;
}

- (void)setLanguageDetectionUserContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (int64_t)dictationInputOrigin
{
  return self->_dictationInputOrigin;
}

- (void)setDictationInputOrigin:(int64_t)a3
{
  self->_dictationInputOrigin = a3;
}

- (NSString)samplingInfo
{
  return self->_samplingInfo;
}

- (void)setSamplingInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (BOOL)shouldClassifyIntent
{
  return self->_shouldClassifyIntent;
}

- (void)setShouldClassifyIntent:(BOOL)a3
{
  self->_shouldClassifyIntent = a3;
}

- (BOOL)shouldRecognizeCommands
{
  return self->_shouldRecognizeCommands;
}

- (void)setShouldRecognizeCommands:(BOOL)a3
{
  self->_shouldRecognizeCommands = a3;
}

- (BOOL)shouldGenerateVoiceCommandCandidates
{
  return self->_shouldGenerateVoiceCommandCandidates;
}

- (void)setShouldGenerateVoiceCommandCandidates:(BOOL)a3
{
  self->_shouldGenerateVoiceCommandCandidates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samplingInfo, 0);
  objc_storeStrong((id *)&self->_languageDetectionUserContext, 0);
  objc_storeStrong((id *)&self->_modelOverrideURL, 0);
  objc_storeStrong((id *)&self->_recognitionOverrides, 0);
  objc_storeStrong((id *)&self->_originalAudioFileURL, 0);
  objc_storeStrong((id *)&self->_voiceTriggerEventInfo, 0);
  objc_storeStrong((id *)&self->_voiceSearchQueryParameters, 0);
  objc_storeStrong((id *)&self->_voiceSearchHeaderFields, 0);
  objc_storeStrong((id *)&self->_offlineLanguage, 0);
  objc_storeStrong((id *)&self->_languageCodeOverride, 0);
  objc_storeStrong((id *)&self->_keyboardIdentifier, 0);
  objc_storeStrong((id *)&self->_orthography, 0);
  objc_storeStrong((id *)&self->_microphoneIdentifier, 0);
  objc_storeStrong((id *)&self->_inlineItemList, 0);
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_postfixText, 0);
  objc_storeStrong((id *)&self->_prefixText, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_interactionIdentifier, 0);
  objc_storeStrong((id *)&self->_fieldIdentifier, 0);
  objc_storeStrong((id *)&self->_fieldLabel, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_applicationVersion, 0);
  objc_storeStrong((id *)&self->_applicationDisplayName, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
