@implementation _SFSpeechRecognizerSupportedFeatures

- (_SFSpeechRecognizerSupportedFeatures)initWithLocale:(id)a3 taskNames:(id)a4 singleUtterance:(BOOL)a5 concatenateUtterances:(BOOL)a6 voiceCommandActiveSet:(id)a7 modelOptions:(id)a8 detectionOptions:(id)a9 flags:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _SFSpeechRecognizerSupportedFeatures *v21;
  uint64_t v22;
  NSLocale *locale;
  uint64_t v24;
  NSSet *taskNames;
  uint64_t v26;
  EARVoiceCommandActiveSet *voiceCommandActiveSet;
  uint64_t v28;
  _SFSpeechRecognizerModelOptions *modelOptions;
  objc_super v31;

  v16 = a3;
  v17 = a4;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v31.receiver = self;
  v31.super_class = (Class)_SFSpeechRecognizerSupportedFeatures;
  v21 = -[_SFSpeechRecognizerSupportedFeatures init](&v31, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v16, "copy");
    locale = v21->_locale;
    v21->_locale = (NSLocale *)v22;

    v24 = objc_msgSend(v17, "copy");
    taskNames = v21->_taskNames;
    v21->_taskNames = (NSSet *)v24;

    v26 = objc_msgSend(v18, "copy");
    voiceCommandActiveSet = v21->_voiceCommandActiveSet;
    v21->_voiceCommandActiveSet = (EARVoiceCommandActiveSet *)v26;

    v28 = objc_msgSend(v19, "copy");
    modelOptions = v21->_modelOptions;
    v21->_modelOptions = (_SFSpeechRecognizerModelOptions *)v28;

    v21->_flags = a10;
    objc_storeStrong((id *)&v21->_detectionOptions, a9);
    v21->_isSingleUtteranceTask = a5;
    v21->_concatenateUtterances = a6;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_SFSpeechRecognizerSupportedFeatures locale](self, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("_locale"));

  -[_SFSpeechRecognizerSupportedFeatures taskNames](self, "taskNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("_taskNames"));

  -[_SFSpeechRecognizerSupportedFeatures voiceCommandActiveSet](self, "voiceCommandActiveSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("_voiceCommandActiveSet"));

  -[_SFSpeechRecognizerSupportedFeatures modelOptions](self, "modelOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("_modelOptions"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[_SFSpeechRecognizerSupportedFeatures flags](self, "flags"), CFSTR("_flags"));
  objc_msgSend(v9, "encodeBool:forKey:", -[_SFSpeechRecognizerSupportedFeatures isSingleUtteranceTask](self, "isSingleUtteranceTask"), CFSTR("_isSingleUtteranceTask"));
  -[_SFSpeechRecognizerSupportedFeatures detectionOptions](self, "detectionOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("_detectionOptions"));

  objc_msgSend(v9, "encodeBool:forKey:", -[_SFSpeechRecognizerSupportedFeatures concatenateUtterances](self, "concatenateUtterances"), CFSTR("_concatenateUtterances"));
}

- (_SFSpeechRecognizerSupportedFeatures)initWithCoder:(id)a3
{
  id v4;
  _SFSpeechRecognizerSupportedFeatures *v5;
  uint64_t v6;
  NSLocale *locale;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSSet *taskNames;
  uint64_t v13;
  EARVoiceCommandActiveSet *voiceCommandActiveSet;
  uint64_t v15;
  _SFSpeechRecognizerModelOptions *modelOptions;
  uint64_t v17;
  _SFSpeechRecognizerDetectorOptions *detectionOptions;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_SFSpeechRecognizerSupportedFeatures;
  v5 = -[_SFSpeechRecognizerSupportedFeatures init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_locale"));
    v6 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_taskNames"));
    v11 = objc_claimAutoreleasedReturnValue();
    taskNames = v5->_taskNames;
    v5->_taskNames = (NSSet *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_voiceCommandActiveSet"));
    v13 = objc_claimAutoreleasedReturnValue();
    voiceCommandActiveSet = v5->_voiceCommandActiveSet;
    v5->_voiceCommandActiveSet = (EARVoiceCommandActiveSet *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_modelOptions"));
    v15 = objc_claimAutoreleasedReturnValue();
    modelOptions = v5->_modelOptions;
    v5->_modelOptions = (_SFSpeechRecognizerModelOptions *)v15;

    v5->_flags = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_flags"));
    v5->_isSingleUtteranceTask = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isSingleUtteranceTask"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_detectionOptions"));
    v17 = objc_claimAutoreleasedReturnValue();
    detectionOptions = v5->_detectionOptions;
    v5->_detectionOptions = (_SFSpeechRecognizerDetectorOptions *)v17;

    v5->_concatenateUtterances = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_concatenateUtterances"));
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSLocale localeIdentifier](self->_locale, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<_SFSpeechRecognizerSupportedFeatures (%p): locale %@, taskNames %@, singleUtterance %d, concatenateUtterances %d, modelOptions %@, detectionOptions %@, flags %#lx>"), self, v4, self->_taskNames, self->_isSingleUtteranceTask, self->_concatenateUtterances, self->_modelOptions, self->_detectionOptions, self->_flags);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSSet)taskNames
{
  return self->_taskNames;
}

- (EARVoiceCommandActiveSet)voiceCommandActiveSet
{
  return self->_voiceCommandActiveSet;
}

- (_SFSpeechRecognizerModelOptions)modelOptions
{
  return self->_modelOptions;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (_SFSpeechRecognizerDetectorOptions)detectionOptions
{
  return self->_detectionOptions;
}

- (BOOL)isSingleUtteranceTask
{
  return self->_isSingleUtteranceTask;
}

- (BOOL)concatenateUtterances
{
  return self->_concatenateUtterances;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionOptions, 0);
  objc_storeStrong((id *)&self->_modelOptions, 0);
  objc_storeStrong((id *)&self->_voiceCommandActiveSet, 0);
  objc_storeStrong((id *)&self->_taskNames, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
