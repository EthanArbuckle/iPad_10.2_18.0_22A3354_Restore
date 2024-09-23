@implementation _AFSpeechParametersMutation

- (_AFSpeechParametersMutation)initWithBase:(id)a3
{
  id v5;
  _AFSpeechParametersMutation *v6;
  _AFSpeechParametersMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSpeechParametersMutation;
  v6 = -[_AFSpeechParametersMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_DWORD *)&self->_mutationFlags & 1;
}

- (id)getLanguage
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_language;
  }
  else
  {
    -[AFSpeechParameters language](self->_base, "language");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
  *(_DWORD *)&self->_mutationFlags |= 3u;
}

- (id)getInteractionIdentifier
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_interactionIdentifier;
  }
  else
  {
    -[AFSpeechParameters interactionIdentifier](self->_base, "interactionIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setInteractionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_interactionIdentifier, a3);
  *(_DWORD *)&self->_mutationFlags |= 5u;
}

- (id)getTask
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_task;
  }
  else
  {
    -[AFSpeechParameters task](self->_base, "task");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
  *(_DWORD *)&self->_mutationFlags |= 9u;
}

- (id)getLoggingContext
{
  NSArray *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_loggingContext;
  }
  else
  {
    -[AFSpeechParameters loggingContext](self->_base, "loggingContext");
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLoggingContext:(id)a3
{
  objc_storeStrong((id *)&self->_loggingContext, a3);
  *(_DWORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getApplicationName
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_applicationName;
  }
  else
  {
    -[AFSpeechParameters applicationName](self->_base, "applicationName");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setApplicationName:(id)a3
{
  objc_storeStrong((id *)&self->_applicationName, a3);
  *(_DWORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getProfile
{
  NSData *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_profile;
  }
  else
  {
    -[AFSpeechParameters profile](self->_base, "profile");
    v2 = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
  *(_DWORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getOverrides
{
  NSDictionary *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_overrides;
  }
  else
  {
    -[AFSpeechParameters overrides](self->_base, "overrides");
    v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_overrides, a3);
  *(_DWORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getModelOverrideURL
{
  NSURL *v2;

  if ((*((_BYTE *)&self->_mutationFlags + 1) & 1) != 0)
  {
    v2 = self->_modelOverrideURL;
  }
  else
  {
    -[AFSpeechParameters modelOverrideURL](self->_base, "modelOverrideURL");
    v2 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setModelOverrideURL:(id)a3
{
  objc_storeStrong((id *)&self->_modelOverrideURL, a3);
  *(_DWORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getOriginalAudioFileURL
{
  NSURL *v2;

  if ((*((_BYTE *)&self->_mutationFlags + 1) & 2) != 0)
  {
    v2 = self->_originalAudioFileURL;
  }
  else
  {
    -[AFSpeechParameters originalAudioFileURL](self->_base, "originalAudioFileURL");
    v2 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setOriginalAudioFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_originalAudioFileURL, a3);
  *(_DWORD *)&self->_mutationFlags |= 0x201u;
}

- (BOOL)getNarrowband
{
  if ((*((_BYTE *)&self->_mutationFlags + 1) & 4) != 0)
    return self->_narrowband;
  else
    return -[AFSpeechParameters narrowband](self->_base, "narrowband");
}

- (void)setNarrowband:(BOOL)a3
{
  self->_narrowband = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x401u;
}

- (BOOL)getDetectUtterances
{
  if ((*((_BYTE *)&self->_mutationFlags + 1) & 8) != 0)
    return self->_detectUtterances;
  else
    return -[AFSpeechParameters detectUtterances](self->_base, "detectUtterances");
}

- (void)setDetectUtterances:(BOOL)a3
{
  self->_detectUtterances = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x801u;
}

- (BOOL)getCensorSpeech
{
  if ((*((_BYTE *)&self->_mutationFlags + 1) & 0x10) != 0)
    return self->_censorSpeech;
  else
    return -[AFSpeechParameters censorSpeech](self->_base, "censorSpeech");
}

- (void)setCensorSpeech:(BOOL)a3
{
  self->_censorSpeech = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x1001u;
}

- (BOOL)getFarField
{
  if ((*((_BYTE *)&self->_mutationFlags + 1) & 0x20) != 0)
    return self->_farField;
  else
    return -[AFSpeechParameters farField](self->_base, "farField");
}

- (void)setFarField:(BOOL)a3
{
  self->_farField = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x2001u;
}

- (BOOL)getSecureOfflineOnly
{
  if ((*((_BYTE *)&self->_mutationFlags + 1) & 0x40) != 0)
    return self->_secureOfflineOnly;
  else
    return -[AFSpeechParameters secureOfflineOnly](self->_base, "secureOfflineOnly");
}

- (void)setSecureOfflineOnly:(BOOL)a3
{
  self->_secureOfflineOnly = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x4001u;
}

- (BOOL)getShouldStoreAudioOnDevice
{
  if ((*((_BYTE *)&self->_mutationFlags + 1) & 0x80) != 0)
    return self->_shouldStoreAudioOnDevice;
  else
    return -[AFSpeechParameters shouldStoreAudioOnDevice](self->_base, "shouldStoreAudioOnDevice");
}

- (void)setShouldStoreAudioOnDevice:(BOOL)a3
{
  self->_shouldStoreAudioOnDevice = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x8001u;
}

- (double)getMaximumRecognitionDuration
{
  double result;

  if ((*((_BYTE *)&self->_mutationFlags + 2) & 1) != 0)
    return self->_maximumRecognitionDuration;
  -[AFSpeechParameters maximumRecognitionDuration](self->_base, "maximumRecognitionDuration");
  return result;
}

- (void)setMaximumRecognitionDuration:(double)a3
{
  self->_maximumRecognitionDuration = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x10001u;
}

- (id)getInputOrigin
{
  NSString *v2;

  if ((*((_BYTE *)&self->_mutationFlags + 2) & 2) != 0)
  {
    v2 = self->_inputOrigin;
  }
  else
  {
    -[AFSpeechParameters inputOrigin](self->_base, "inputOrigin");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setInputOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_inputOrigin, a3);
  *(_DWORD *)&self->_mutationFlags |= 0x20001u;
}

- (id)getLocation
{
  CLLocation *v2;

  if ((*((_BYTE *)&self->_mutationFlags + 2) & 4) != 0)
  {
    v2 = self->_location;
  }
  else
  {
    -[AFSpeechParameters location](self->_base, "location");
    v2 = (CLLocation *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
  *(_DWORD *)&self->_mutationFlags |= 0x40001u;
}

- (id)getJitGrammar
{
  NSArray *v2;

  if ((*((_BYTE *)&self->_mutationFlags + 2) & 8) != 0)
  {
    v2 = self->_jitGrammar;
  }
  else
  {
    -[AFSpeechParameters jitGrammar](self->_base, "jitGrammar");
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setJitGrammar:(id)a3
{
  objc_storeStrong((id *)&self->_jitGrammar, a3);
  *(_DWORD *)&self->_mutationFlags |= 0x80001u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jitGrammar, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
  objc_storeStrong((id *)&self->_originalAudioFileURL, 0);
  objc_storeStrong((id *)&self->_modelOverrideURL, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_loggingContext, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_interactionIdentifier, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
