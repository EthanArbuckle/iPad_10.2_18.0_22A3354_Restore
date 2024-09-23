@implementation _CESRSpeechParametersMutation

- (_CESRSpeechParametersMutation)init
{
  return -[_CESRSpeechParametersMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_CESRSpeechParametersMutation)initWithBaseModel:(id)a3
{
  id v5;
  _CESRSpeechParametersMutation *v6;
  _CESRSpeechParametersMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CESRSpeechParametersMutation;
  v6 = -[_CESRSpeechParametersMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
  *(_QWORD *)&self->_mutationFlags |= 3uLL;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
  *(_QWORD *)&self->_mutationFlags |= 5uLL;
}

- (void)setDictationUIInteractionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_dictationUIInteractionIdentifier, a3);
  *(_QWORD *)&self->_mutationFlags |= 9uLL;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
  *(_QWORD *)&self->_mutationFlags |= 0x11uLL;
}

- (void)setLoggingContext:(id)a3
{
  objc_storeStrong((id *)&self->_loggingContext, a3);
  *(_QWORD *)&self->_mutationFlags |= 0x21uLL;
}

- (void)setApplicationName:(id)a3
{
  objc_storeStrong((id *)&self->_applicationName, a3);
  *(_QWORD *)&self->_mutationFlags |= 0x41uLL;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
  *(_QWORD *)&self->_mutationFlags |= 0x81uLL;
}

- (void)setOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_overrides, a3);
  *(_QWORD *)&self->_mutationFlags |= 0x101uLL;
}

- (void)setModelOverrideURL:(id)a3
{
  objc_storeStrong((id *)&self->_modelOverrideURL, a3);
  *(_QWORD *)&self->_mutationFlags |= 0x201uLL;
}

- (void)setOriginalAudioFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_originalAudioFileURL, a3);
  *(_QWORD *)&self->_mutationFlags |= 0x401uLL;
}

- (void)setCodec:(id)a3
{
  objc_storeStrong((id *)&self->_codec, a3);
  *(_QWORD *)&self->_mutationFlags |= 0x801uLL;
}

- (void)setNarrowband:(BOOL)a3
{
  self->_narrowband = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x1001uLL;
}

- (void)setDetectUtterances:(BOOL)a3
{
  self->_detectUtterances = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x2001uLL;
}

- (void)setCensorSpeech:(BOOL)a3
{
  self->_censorSpeech = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x4001uLL;
}

- (void)setFarField:(BOOL)a3
{
  self->_farField = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x8001uLL;
}

- (void)setSecureOfflineOnly:(BOOL)a3
{
  self->_secureOfflineOnly = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x10001uLL;
}

- (void)setShouldStoreAudioOnDevice:(BOOL)a3
{
  self->_shouldStoreAudioOnDevice = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x20001uLL;
}

- (void)setContinuousListening:(BOOL)a3
{
  self->_continuousListening = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x40001uLL;
}

- (void)setShouldHandleCapitalization:(BOOL)a3
{
  self->_shouldHandleCapitalization = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x80001uLL;
}

- (void)setIsSpeechAPIRequest:(BOOL)a3
{
  self->_isSpeechAPIRequest = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x100001uLL;
}

- (void)setMaximumRecognitionDuration:(double)a3
{
  self->_maximumRecognitionDuration = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x200001uLL;
}

- (void)setEndpointStart:(double)a3
{
  self->_endpointStart = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x400001uLL;
}

- (void)setInputOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_inputOrigin, a3);
  *(_QWORD *)&self->_mutationFlags |= 0x800001uLL;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
  *(_QWORD *)&self->_mutationFlags |= 0x1000001uLL;
}

- (void)setJitGrammar:(id)a3
{
  objc_storeStrong((id *)&self->_jitGrammar, a3);
  *(_QWORD *)&self->_mutationFlags |= 0x2000001uLL;
}

- (void)setDeliverEagerPackage:(BOOL)a3
{
  self->_deliverEagerPackage = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x4000001uLL;
}

- (void)setDisableDeliveringAsrFeatures:(BOOL)a3
{
  self->_disableDeliveringAsrFeatures = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x8000001uLL;
}

- (void)setEnableEmojiRecognition:(BOOL)a3
{
  self->_enableEmojiRecognition = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x10000001uLL;
}

- (void)setEnableAutoPunctuation:(BOOL)a3
{
  self->_enableAutoPunctuation = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x20000001uLL;
}

- (void)setEnableVoiceCommands:(BOOL)a3
{
  self->_enableVoiceCommands = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x40000001uLL;
}

- (void)setSharedUserInfos:(id)a3
{
  objc_storeStrong((id *)&self->_sharedUserInfos, a3);
  *(_QWORD *)&self->_mutationFlags |= 0x80000001uLL;
}

- (void)setPrefixText:(id)a3
{
  objc_storeStrong((id *)&self->_prefixText, a3);
  *(_QWORD *)&self->_mutationFlags |= 0x100000001uLL;
}

- (void)setPostfixText:(id)a3
{
  objc_storeStrong((id *)&self->_postfixText, a3);
  *(_QWORD *)&self->_mutationFlags |= 0x200000001uLL;
}

- (void)setSelectedText:(id)a3
{
  objc_storeStrong((id *)&self->_selectedText, a3);
  *(_QWORD *)&self->_mutationFlags |= 0x400000001uLL;
}

- (void)setPowerContext:(id)a3
{
  objc_storeStrong((id *)&self->_powerContext, a3);
  *(_QWORD *)&self->_mutationFlags |= 0x800000001uLL;
}

- (void)setRecognitionStart:(double)a3
{
  self->_recognitionStart = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x1000000001uLL;
}

- (void)setShouldGenerateVoiceCommandCandidates:(BOOL)a3
{
  self->_shouldGenerateVoiceCommandCandidates = a3;
  *(_QWORD *)&self->_mutationFlags |= 0x2000000001uLL;
}

- (void)setAsrId:(id)a3
{
  objc_storeStrong((id *)&self->_asrId, a3);
  *(_QWORD *)&self->_mutationFlags |= 0x4000000001uLL;
}

- (id)generate
{
  CESRSpeechParameters *baseModel;
  uint64_t v4;
  uint64_t v5;
  CESRSpeechParameters *v6;
  CESRSpeechParameters *v7;
  uint64_t v8;
  _BOOL4 detectUtterances;
  _BOOL4 continuousListening;
  double maximumRecognitionDuration;
  double endpointStart;
  double v13;
  double v14;
  uint64_t v15;
  _BOOL4 deliverEagerPackage;
  _BOOL4 disableDeliveringAsrFeatures;
  _BOOL4 enableEmojiRecognition;
  NSString *v19;
  NSString *v20;
  AFPowerContextPolicy *v21;
  uint64_t v22;
  double v23;
  double recognitionStart;
  NSUUID *v25;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  BOOL shouldGenerateVoiceCommandCandidates;
  NSString *v31;
  _BOOL4 shouldHandleCapitalization;
  _BOOL4 secureOfflineOnly;
  NSArray *v34;
  NSArray *v35;
  BOOL enableVoiceCommands;
  _BOOL4 farField;
  _BOOL4 narrowband;
  BOOL enableAutoPunctuation;
  CLLocation *v40;
  _BOOL4 censorSpeech;
  _BOOL4 isSpeechAPIRequest;
  NSString *v43;
  _BOOL4 shouldStoreAudioOnDevice;
  NSString *v45;
  NSURL *v46;
  NSURL *v47;
  NSDictionary *v48;
  NSData *v49;
  NSString *v50;
  NSArray *v51;
  NSString *v52;
  NSString *v53;
  NSString *v54;
  NSString *v55;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v6 = [CESRSpeechParameters alloc];
    LOBYTE(v29) = self->_shouldGenerateVoiceCommandCandidates;
    *(_DWORD *)((char *)&v28 + 1) = *(_DWORD *)&self->_disableDeliveringAsrFeatures;
    LOBYTE(v28) = self->_deliverEagerPackage;
    *(_QWORD *)((char *)&v27 + 1) = *(_QWORD *)&self->_detectUtterances;
    LOBYTE(v27) = self->_narrowband;
    v5 = -[CESRSpeechParameters initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:asrId:](v6, "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:asrId:", self->_language, self->_requestIdentifier, self->_dictationUIInteractionIdentifier, self->_task, self->_loggingContext, self->_applicationName, self->_maximumRecognitionDuration, self->_endpointStart, self->_recognitionStart, self->_profile, self->_overrides, self->_modelOverrideURL,
           self->_originalAudioFileURL,
           self->_codec,
           v27,
           self->_inputOrigin,
           self->_location,
           self->_jitGrammar,
           v28,
           self->_sharedUserInfos,
           self->_prefixText,
           self->_postfixText,
           self->_selectedText,
           self->_powerContext,
           v29,
           self->_asrId);
    goto LABEL_5;
  }
  v4 = *(_QWORD *)&self->_mutationFlags;
  if ((v4 & 1) != 0)
  {
    if ((v4 & 2) != 0)
    {
      v55 = self->_language;
    }
    else
    {
      -[CESRSpeechParameters language](baseModel, "language");
      v55 = (NSString *)(id)objc_claimAutoreleasedReturnValue();

    }
    if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
    {
      v54 = self->_requestIdentifier;
    }
    else
    {
      -[CESRSpeechParameters requestIdentifier](self->_baseModel, "requestIdentifier");
      v54 = (NSString *)(id)objc_claimAutoreleasedReturnValue();

    }
    if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
    {
      v53 = self->_dictationUIInteractionIdentifier;
    }
    else
    {
      -[CESRSpeechParameters dictationUIInteractionIdentifier](self->_baseModel, "dictationUIInteractionIdentifier");
      v53 = (NSString *)(id)objc_claimAutoreleasedReturnValue();

    }
    if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
    {
      v52 = self->_task;
    }
    else
    {
      -[CESRSpeechParameters task](self->_baseModel, "task");
      v52 = (NSString *)(id)objc_claimAutoreleasedReturnValue();

    }
    if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
    {
      v51 = self->_loggingContext;
    }
    else
    {
      -[CESRSpeechParameters loggingContext](self->_baseModel, "loggingContext");
      v51 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();

    }
    if ((*(_BYTE *)&self->_mutationFlags & 0x40) != 0)
    {
      v50 = self->_applicationName;
    }
    else
    {
      -[CESRSpeechParameters applicationName](self->_baseModel, "applicationName");
      v50 = (NSString *)(id)objc_claimAutoreleasedReturnValue();

    }
    if ((*(_BYTE *)&self->_mutationFlags & 0x80) != 0)
    {
      v49 = self->_profile;
    }
    else
    {
      -[CESRSpeechParameters profile](self->_baseModel, "profile");
      v49 = (NSData *)(id)objc_claimAutoreleasedReturnValue();

    }
    if ((*((_BYTE *)&self->_mutationFlags + 1) & 1) != 0)
    {
      v48 = self->_overrides;
    }
    else
    {
      -[CESRSpeechParameters overrides](self->_baseModel, "overrides");
      v48 = (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();

    }
    if ((*((_BYTE *)&self->_mutationFlags + 1) & 2) != 0)
    {
      v47 = self->_modelOverrideURL;
    }
    else
    {
      -[CESRSpeechParameters modelOverrideURL](self->_baseModel, "modelOverrideURL");
      v47 = (NSURL *)(id)objc_claimAutoreleasedReturnValue();

    }
    if ((*((_BYTE *)&self->_mutationFlags + 1) & 4) != 0)
    {
      v46 = self->_originalAudioFileURL;
    }
    else
    {
      -[CESRSpeechParameters originalAudioFileURL](self->_baseModel, "originalAudioFileURL");
      v46 = (NSURL *)(id)objc_claimAutoreleasedReturnValue();

    }
    if ((*((_BYTE *)&self->_mutationFlags + 1) & 8) != 0)
    {
      v45 = self->_codec;
    }
    else
    {
      -[CESRSpeechParameters codec](self->_baseModel, "codec");
      v45 = (NSString *)(id)objc_claimAutoreleasedReturnValue();

    }
    v8 = *(_QWORD *)&self->_mutationFlags;
    if ((v8 & 0x1000) != 0)
    {
      narrowband = self->_narrowband;
      if ((v8 & 0x2000) != 0)
      {
LABEL_41:
        detectUtterances = self->_detectUtterances;
        if ((v8 & 0x4000) != 0)
          goto LABEL_42;
        goto LABEL_54;
      }
    }
    else
    {
      narrowband = -[CESRSpeechParameters narrowband](self->_baseModel, "narrowband");
      v8 = *(_QWORD *)&self->_mutationFlags;
      if ((v8 & 0x2000) != 0)
        goto LABEL_41;
    }
    detectUtterances = -[CESRSpeechParameters detectUtterances](self->_baseModel, "detectUtterances");
    v8 = *(_QWORD *)&self->_mutationFlags;
    if ((v8 & 0x4000) != 0)
    {
LABEL_42:
      censorSpeech = self->_censorSpeech;
      if ((v8 & 0x8000) != 0)
        goto LABEL_43;
      goto LABEL_55;
    }
LABEL_54:
    censorSpeech = -[CESRSpeechParameters censorSpeech](self->_baseModel, "censorSpeech");
    v8 = *(_QWORD *)&self->_mutationFlags;
    if ((v8 & 0x8000) != 0)
    {
LABEL_43:
      farField = self->_farField;
      if ((v8 & 0x10000) != 0)
        goto LABEL_44;
      goto LABEL_56;
    }
LABEL_55:
    farField = -[CESRSpeechParameters farField](self->_baseModel, "farField");
    v8 = *(_QWORD *)&self->_mutationFlags;
    if ((v8 & 0x10000) != 0)
    {
LABEL_44:
      secureOfflineOnly = self->_secureOfflineOnly;
      if ((v8 & 0x20000) != 0)
        goto LABEL_45;
      goto LABEL_57;
    }
LABEL_56:
    secureOfflineOnly = -[CESRSpeechParameters secureOfflineOnly](self->_baseModel, "secureOfflineOnly");
    v8 = *(_QWORD *)&self->_mutationFlags;
    if ((v8 & 0x20000) != 0)
    {
LABEL_45:
      shouldStoreAudioOnDevice = self->_shouldStoreAudioOnDevice;
      if ((v8 & 0x40000) != 0)
        goto LABEL_46;
      goto LABEL_58;
    }
LABEL_57:
    shouldStoreAudioOnDevice = -[CESRSpeechParameters shouldStoreAudioOnDevice](self->_baseModel, "shouldStoreAudioOnDevice");
    v8 = *(_QWORD *)&self->_mutationFlags;
    if ((v8 & 0x40000) != 0)
    {
LABEL_46:
      continuousListening = self->_continuousListening;
      if ((v8 & 0x80000) != 0)
        goto LABEL_47;
      goto LABEL_59;
    }
LABEL_58:
    continuousListening = -[CESRSpeechParameters continuousListening](self->_baseModel, "continuousListening");
    v8 = *(_QWORD *)&self->_mutationFlags;
    if ((v8 & 0x80000) != 0)
    {
LABEL_47:
      shouldHandleCapitalization = self->_shouldHandleCapitalization;
      if ((v8 & 0x100000) != 0)
        goto LABEL_48;
      goto LABEL_60;
    }
LABEL_59:
    shouldHandleCapitalization = -[CESRSpeechParameters shouldHandleCapitalization](self->_baseModel, "shouldHandleCapitalization");
    v8 = *(_QWORD *)&self->_mutationFlags;
    if ((v8 & 0x100000) != 0)
    {
LABEL_48:
      isSpeechAPIRequest = self->_isSpeechAPIRequest;
      if ((v8 & 0x200000) != 0)
        goto LABEL_49;
      goto LABEL_61;
    }
LABEL_60:
    isSpeechAPIRequest = -[CESRSpeechParameters isSpeechAPIRequest](self->_baseModel, "isSpeechAPIRequest");
    v8 = *(_QWORD *)&self->_mutationFlags;
    if ((v8 & 0x200000) != 0)
    {
LABEL_49:
      maximumRecognitionDuration = self->_maximumRecognitionDuration;
      if ((v8 & 0x400000) != 0)
        goto LABEL_50;
      goto LABEL_62;
    }
LABEL_61:
    -[CESRSpeechParameters maximumRecognitionDuration](self->_baseModel, "maximumRecognitionDuration");
    maximumRecognitionDuration = v13;
    v8 = *(_QWORD *)&self->_mutationFlags;
    if ((v8 & 0x400000) != 0)
    {
LABEL_50:
      endpointStart = self->_endpointStart;
      if ((v8 & 0x800000) != 0)
      {
LABEL_51:
        v43 = self->_inputOrigin;
        goto LABEL_64;
      }
LABEL_63:
      -[CESRSpeechParameters inputOrigin](self->_baseModel, "inputOrigin");
      v43 = (NSString *)(id)objc_claimAutoreleasedReturnValue();

LABEL_64:
      if ((*((_BYTE *)&self->_mutationFlags + 3) & 1) != 0)
      {
        v40 = self->_location;
      }
      else
      {
        -[CESRSpeechParameters location](self->_baseModel, "location");
        v40 = (CLLocation *)(id)objc_claimAutoreleasedReturnValue();

      }
      if ((*((_BYTE *)&self->_mutationFlags + 3) & 2) != 0)
      {
        v35 = self->_jitGrammar;
      }
      else
      {
        -[CESRSpeechParameters jitGrammar](self->_baseModel, "jitGrammar");
        v35 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();

      }
      v15 = *(_QWORD *)&self->_mutationFlags;
      if ((v15 & 0x4000000) != 0)
      {
        deliverEagerPackage = self->_deliverEagerPackage;
        if ((v15 & 0x8000000) != 0)
        {
LABEL_72:
          disableDeliveringAsrFeatures = self->_disableDeliveringAsrFeatures;
          if ((v15 & 0x10000000) != 0)
            goto LABEL_73;
          goto LABEL_79;
        }
      }
      else
      {
        deliverEagerPackage = -[CESRSpeechParameters deliverEagerPackage](self->_baseModel, "deliverEagerPackage");
        v15 = *(_QWORD *)&self->_mutationFlags;
        if ((v15 & 0x8000000) != 0)
          goto LABEL_72;
      }
      disableDeliveringAsrFeatures = -[CESRSpeechParameters disableDeliveringAsrFeatures](self->_baseModel, "disableDeliveringAsrFeatures");
      v15 = *(_QWORD *)&self->_mutationFlags;
      if ((v15 & 0x10000000) != 0)
      {
LABEL_73:
        enableEmojiRecognition = self->_enableEmojiRecognition;
        if ((v15 & 0x20000000) != 0)
          goto LABEL_74;
        goto LABEL_80;
      }
LABEL_79:
      enableEmojiRecognition = -[CESRSpeechParameters enableEmojiRecognition](self->_baseModel, "enableEmojiRecognition");
      v15 = *(_QWORD *)&self->_mutationFlags;
      if ((v15 & 0x20000000) != 0)
      {
LABEL_74:
        enableAutoPunctuation = self->_enableAutoPunctuation;
        if ((v15 & 0x40000000) != 0)
          goto LABEL_75;
        goto LABEL_81;
      }
LABEL_80:
      enableAutoPunctuation = -[CESRSpeechParameters enableAutoPunctuation](self->_baseModel, "enableAutoPunctuation");
      v15 = *(_QWORD *)&self->_mutationFlags;
      if ((v15 & 0x40000000) != 0)
      {
LABEL_75:
        enableVoiceCommands = self->_enableVoiceCommands;
        if ((v15 & 0x80000000) != 0)
        {
LABEL_76:
          v34 = self->_sharedUserInfos;
          goto LABEL_83;
        }
LABEL_82:
        -[CESRSpeechParameters sharedUserInfos](self->_baseModel, "sharedUserInfos");
        v34 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();

LABEL_83:
        if ((*(_BYTE *)(&self->_mutationFlags + 1) & 1) != 0)
        {
          v31 = self->_prefixText;
        }
        else
        {
          -[CESRSpeechParameters prefixText](self->_baseModel, "prefixText");
          v31 = (NSString *)(id)objc_claimAutoreleasedReturnValue();

        }
        if ((*(_BYTE *)(&self->_mutationFlags + 1) & 2) != 0)
        {
          v19 = self->_postfixText;
        }
        else
        {
          -[CESRSpeechParameters postfixText](self->_baseModel, "postfixText");
          v19 = (NSString *)(id)objc_claimAutoreleasedReturnValue();

        }
        if ((*(_BYTE *)(&self->_mutationFlags + 1) & 4) != 0)
        {
          v20 = self->_selectedText;
        }
        else
        {
          -[CESRSpeechParameters selectedText](self->_baseModel, "selectedText");
          v20 = (NSString *)(id)objc_claimAutoreleasedReturnValue();

        }
        if ((*(_BYTE *)(&self->_mutationFlags + 1) & 8) != 0)
        {
          v21 = self->_powerContext;
        }
        else
        {
          -[CESRSpeechParameters powerContext](self->_baseModel, "powerContext");
          v21 = (AFPowerContextPolicy *)(id)objc_claimAutoreleasedReturnValue();

        }
        v22 = *(_QWORD *)&self->_mutationFlags;
        if ((v22 & 0x1000000000) != 0)
        {
          recognitionStart = self->_recognitionStart;
          if ((v22 & 0x2000000000) != 0)
          {
LABEL_97:
            shouldGenerateVoiceCommandCandidates = self->_shouldGenerateVoiceCommandCandidates;
            if ((v22 & 0x4000000000) != 0)
            {
LABEL_98:
              v25 = self->_asrId;
LABEL_102:
              LOBYTE(v29) = shouldGenerateVoiceCommandCandidates;
              BYTE4(v28) = enableVoiceCommands;
              BYTE3(v28) = enableAutoPunctuation;
              BYTE2(v28) = enableEmojiRecognition;
              BYTE1(v28) = disableDeliveringAsrFeatures;
              LOBYTE(v28) = deliverEagerPackage;
              BYTE8(v27) = isSpeechAPIRequest;
              BYTE7(v27) = shouldHandleCapitalization;
              BYTE6(v27) = continuousListening;
              BYTE5(v27) = shouldStoreAudioOnDevice;
              BYTE4(v27) = secureOfflineOnly;
              BYTE3(v27) = farField;
              BYTE2(v27) = censorSpeech;
              BYTE1(v27) = detectUtterances;
              LOBYTE(v27) = narrowband;
              v7 = -[CESRSpeechParameters initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:asrId:]([CESRSpeechParameters alloc], "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:asrId:", v55, v54, v53, v52, v51, v50, maximumRecognitionDuration, endpointStart, recognitionStart, v49, v48,
                     v47,
                     v46,
                     v45,
                     v27,
                     v43,
                     v40,
                     v35,
                     v28,
                     v34,
                     v31,
                     v19,
                     v20,
                     v21,
                     v29,
                     v25);

              return v7;
            }
LABEL_101:
            -[CESRSpeechParameters asrId](self->_baseModel, "asrId");
            v25 = (NSUUID *)(id)objc_claimAutoreleasedReturnValue();

            goto LABEL_102;
          }
        }
        else
        {
          -[CESRSpeechParameters recognitionStart](self->_baseModel, "recognitionStart");
          recognitionStart = v23;
          v22 = *(_QWORD *)&self->_mutationFlags;
          if ((v22 & 0x2000000000) != 0)
            goto LABEL_97;
        }
        shouldGenerateVoiceCommandCandidates = -[CESRSpeechParameters shouldGenerateVoiceCommandCandidates](self->_baseModel, "shouldGenerateVoiceCommandCandidates");
        if ((*(_QWORD *)&self->_mutationFlags & 0x4000000000) != 0)
          goto LABEL_98;
        goto LABEL_101;
      }
LABEL_81:
      enableVoiceCommands = -[CESRSpeechParameters enableVoiceCommands](self->_baseModel, "enableVoiceCommands");
      if ((*(_QWORD *)&self->_mutationFlags & 0x80000000) != 0)
        goto LABEL_76;
      goto LABEL_82;
    }
LABEL_62:
    -[CESRSpeechParameters endpointStart](self->_baseModel, "endpointStart");
    endpointStart = v14;
    if ((*(_QWORD *)&self->_mutationFlags & 0x800000) != 0)
      goto LABEL_51;
    goto LABEL_63;
  }
  v5 = -[CESRSpeechParameters copy](baseModel, "copy");
LABEL_5:
  v7 = (CESRSpeechParameters *)v5;
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asrId, 0);
  objc_storeStrong((id *)&self->_powerContext, 0);
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_postfixText, 0);
  objc_storeStrong((id *)&self->_prefixText, 0);
  objc_storeStrong((id *)&self->_sharedUserInfos, 0);
  objc_storeStrong((id *)&self->_jitGrammar, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
  objc_storeStrong((id *)&self->_codec, 0);
  objc_storeStrong((id *)&self->_originalAudioFileURL, 0);
  objc_storeStrong((id *)&self->_modelOverrideURL, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_loggingContext, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_dictationUIInteractionIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
