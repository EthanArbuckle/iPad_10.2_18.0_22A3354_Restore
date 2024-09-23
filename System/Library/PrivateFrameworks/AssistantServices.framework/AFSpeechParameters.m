@implementation AFSpeechParameters

- (AFSpeechParameters)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFSpeechParametersMutation *);
  AFSpeechParameters *v5;
  AFSpeechParameters *v6;
  _AFSpeechParametersMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *language;
  void *v11;
  uint64_t v12;
  NSString *interactionIdentifier;
  void *v14;
  uint64_t v15;
  NSString *task;
  void *v17;
  uint64_t v18;
  NSArray *loggingContext;
  void *v20;
  uint64_t v21;
  NSString *applicationName;
  void *v23;
  uint64_t v24;
  NSData *profile;
  void *v26;
  uint64_t v27;
  NSDictionary *overrides;
  void *v29;
  uint64_t v30;
  NSURL *modelOverrideURL;
  void *v32;
  uint64_t v33;
  NSURL *originalAudioFileURL;
  double v35;
  void *v36;
  uint64_t v37;
  NSString *inputOrigin;
  void *v39;
  uint64_t v40;
  CLLocation *location;
  void *v42;
  uint64_t v43;
  NSArray *jitGrammar;
  objc_super v46;

  v4 = (void (**)(id, _AFSpeechParametersMutation *))a3;
  v46.receiver = self;
  v46.super_class = (Class)AFSpeechParameters;
  v5 = -[AFSpeechParameters init](&v46, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFSpeechParametersMutation initWithBase:]([_AFSpeechParametersMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFSpeechParametersMutation isDirty](v7, "isDirty"))
    {
      -[_AFSpeechParametersMutation getLanguage](v7, "getLanguage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      language = v6->_language;
      v6->_language = (NSString *)v9;

      -[_AFSpeechParametersMutation getInteractionIdentifier](v7, "getInteractionIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      interactionIdentifier = v6->_interactionIdentifier;
      v6->_interactionIdentifier = (NSString *)v12;

      -[_AFSpeechParametersMutation getTask](v7, "getTask");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      task = v6->_task;
      v6->_task = (NSString *)v15;

      -[_AFSpeechParametersMutation getLoggingContext](v7, "getLoggingContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      loggingContext = v6->_loggingContext;
      v6->_loggingContext = (NSArray *)v18;

      -[_AFSpeechParametersMutation getApplicationName](v7, "getApplicationName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      applicationName = v6->_applicationName;
      v6->_applicationName = (NSString *)v21;

      -[_AFSpeechParametersMutation getProfile](v7, "getProfile");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "copy");
      profile = v6->_profile;
      v6->_profile = (NSData *)v24;

      -[_AFSpeechParametersMutation getOverrides](v7, "getOverrides");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "copy");
      overrides = v6->_overrides;
      v6->_overrides = (NSDictionary *)v27;

      -[_AFSpeechParametersMutation getModelOverrideURL](v7, "getModelOverrideURL");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "copy");
      modelOverrideURL = v6->_modelOverrideURL;
      v6->_modelOverrideURL = (NSURL *)v30;

      -[_AFSpeechParametersMutation getOriginalAudioFileURL](v7, "getOriginalAudioFileURL");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "copy");
      originalAudioFileURL = v6->_originalAudioFileURL;
      v6->_originalAudioFileURL = (NSURL *)v33;

      v6->_narrowband = -[_AFSpeechParametersMutation getNarrowband](v7, "getNarrowband");
      v6->_detectUtterances = -[_AFSpeechParametersMutation getDetectUtterances](v7, "getDetectUtterances");
      v6->_censorSpeech = -[_AFSpeechParametersMutation getCensorSpeech](v7, "getCensorSpeech");
      v6->_farField = -[_AFSpeechParametersMutation getFarField](v7, "getFarField");
      v6->_secureOfflineOnly = -[_AFSpeechParametersMutation getSecureOfflineOnly](v7, "getSecureOfflineOnly");
      v6->_shouldStoreAudioOnDevice = -[_AFSpeechParametersMutation getShouldStoreAudioOnDevice](v7, "getShouldStoreAudioOnDevice");
      -[_AFSpeechParametersMutation getMaximumRecognitionDuration](v7, "getMaximumRecognitionDuration");
      v6->_maximumRecognitionDuration = v35;
      -[_AFSpeechParametersMutation getInputOrigin](v7, "getInputOrigin");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "copy");
      inputOrigin = v6->_inputOrigin;
      v6->_inputOrigin = (NSString *)v37;

      -[_AFSpeechParametersMutation getLocation](v7, "getLocation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "copy");
      location = v6->_location;
      v6->_location = (CLLocation *)v40;

      -[_AFSpeechParametersMutation getJitGrammar](v7, "getJitGrammar");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "copy");
      jitGrammar = v6->_jitGrammar;
      v6->_jitGrammar = (NSArray *)v43;

    }
  }

  return v6;
}

- (AFSpeechParameters)init
{
  return -[AFSpeechParameters initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFSpeechParameters)initWithLanguage:(id)a3 interactionIdentifier:(id)a4 task:(id)a5 loggingContext:(id)a6 applicationName:(id)a7 profile:(id)a8 overrides:(id)a9 modelOverrideURL:(id)a10 originalAudioFileURL:(id)a11 narrowband:(BOOL)a12 detectUtterances:(BOOL)a13 censorSpeech:(BOOL)a14 farField:(BOOL)a15 secureOfflineOnly:(BOOL)a16 shouldStoreAudioOnDevice:(BOOL)a17 maximumRecognitionDuration:(double)a18 inputOrigin:(id)a19 location:(id)a20 jitGrammar:(id)a21
{
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  AFSpeechParameters *v45;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  double v67;
  BOOL v68;
  BOOL v69;
  BOOL v70;
  BOOL v71;
  BOOL v72;
  BOOL v73;

  v53 = a3;
  v27 = a4;
  v28 = a5;
  v29 = a6;
  v30 = a7;
  v31 = a8;
  v32 = a9;
  v33 = a10;
  v34 = a11;
  v35 = a19;
  v36 = a20;
  v37 = a21;
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __305__AFSpeechParameters_initWithLanguage_interactionIdentifier_task_loggingContext_applicationName_profile_overrides_modelOverrideURL_originalAudioFileURL_narrowband_detectUtterances_censorSpeech_farField_secureOfflineOnly_shouldStoreAudioOnDevice_maximumRecognitionDuration_inputOrigin_location_jitGrammar___block_invoke;
  v54[3] = &unk_1E3A33C80;
  v55 = v53;
  v56 = v27;
  v57 = v28;
  v58 = v29;
  v59 = v30;
  v60 = v31;
  v61 = v32;
  v62 = v33;
  v68 = a12;
  v69 = a13;
  v70 = a14;
  v71 = a15;
  v72 = a16;
  v73 = a17;
  v67 = a18;
  v63 = v34;
  v64 = v35;
  v65 = v36;
  v66 = v37;
  v51 = v37;
  v50 = v36;
  v49 = v35;
  v48 = v34;
  v47 = v33;
  v38 = v32;
  v39 = v31;
  v40 = v30;
  v41 = v29;
  v42 = v28;
  v43 = v27;
  v44 = v53;
  v45 = -[AFSpeechParameters initWithBuilder:](self, "initWithBuilder:", v54);

  return v45;
}

- (id)description
{
  return -[AFSpeechParameters _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  NSString *applicationName;
  NSUInteger v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  objc_super v18;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v18.receiver = self;
  v18.super_class = (Class)AFSpeechParameters;
  -[AFSpeechParameters description](&v18, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_OWORD *)&self->_task;
  v17 = *(_OWORD *)&self->_language;
  applicationName = self->_applicationName;
  v7 = -[NSData length](self->_profile, "length");
  v8 = CFSTR("YES");
  if (self->_narrowband)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (self->_detectUtterances)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (self->_censorSpeech)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (self->_farField)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  if (self->_secureOfflineOnly)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (!self->_shouldStoreAudioOnDevice)
    v8 = CFSTR("NO");
  v14 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {language = %@, interactionIdentifier = %@, task = %@, loggingContext = %@, applicationName = %@, profile = (%llu bytes), overrides = %@, modelOverrideURL = %@, originalAudioFileURL = %@, narrowband = %@, detectUtterances = %@, censorSpeech = %@, farField = %@, secureOfflineOnly = %@, shouldStoreAudioOnDevice = %@, maximumRecognitionDuration = %f, inputOrigin = %@, location = %@, jitGrammar = %@}"), v5, v17, v16, applicationName, v7, *(_OWORD *)&self->_overrides, self->_originalAudioFileURL, v9, v10, v11, v12, v13, v8, *(_QWORD *)&self->_maximumRecognitionDuration, self->_inputOrigin, self->_location,
                  self->_jitGrammar);

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSUInteger v25;
  uint64_t v26;
  unint64_t v27;
  void *v29;

  v3 = -[NSString hash](self->_language, "hash");
  v4 = -[NSString hash](self->_interactionIdentifier, "hash") ^ v3;
  v5 = -[NSString hash](self->_task, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_loggingContext, "hash");
  v7 = -[NSString hash](self->_applicationName, "hash");
  v8 = v7 ^ -[NSData hash](self->_profile, "hash");
  v9 = v6 ^ v8 ^ -[NSDictionary hash](self->_overrides, "hash");
  v10 = -[NSURL hash](self->_modelOverrideURL, "hash");
  v11 = v10 ^ -[NSURL hash](self->_originalAudioFileURL, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_narrowband);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9 ^ v11 ^ objc_msgSend(v29, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_detectUtterances);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_censorSpeech);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_farField);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v12 ^ v16 ^ objc_msgSend(v17, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_secureOfflineOnly);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldStoreAudioOnDevice);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maximumRecognitionDuration);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22 ^ objc_msgSend(v23, "hash");
  v25 = v18 ^ v24 ^ -[NSString hash](self->_inputOrigin, "hash");
  v26 = -[CLLocation hash](self->_location, "hash");
  v27 = v25 ^ v26 ^ -[NSArray hash](self->_jitGrammar, "hash");

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  AFSpeechParameters *v4;
  AFSpeechParameters *v5;
  _BOOL4 narrowband;
  _BOOL4 detectUtterances;
  _BOOL4 censorSpeech;
  _BOOL4 farField;
  _BOOL4 secureOfflineOnly;
  _BOOL4 shouldStoreAudioOnDevice;
  double maximumRecognitionDuration;
  double v13;
  BOOL v14;
  NSString *v16;
  NSString *language;
  NSString *v18;
  NSString *interactionIdentifier;
  NSString *v20;
  NSString *task;
  NSArray *v22;
  NSArray *loggingContext;
  NSString *v24;
  NSString *applicationName;
  NSData *v26;
  NSData *profile;
  NSDictionary *v28;
  NSDictionary *overrides;
  uint64_t v30;
  NSURL *modelOverrideURL;
  uint64_t v32;
  NSURL *originalAudioFileURL;
  uint64_t v34;
  NSString *inputOrigin;
  uint64_t v36;
  CLLocation *location;
  uint64_t v38;
  NSArray *jitGrammar;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  v4 = (AFSpeechParameters *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      narrowband = self->_narrowband;
      if (narrowband == -[AFSpeechParameters narrowband](v5, "narrowband")
        && (detectUtterances = self->_detectUtterances,
            detectUtterances == -[AFSpeechParameters detectUtterances](v5, "detectUtterances"))
        && (censorSpeech = self->_censorSpeech, censorSpeech == -[AFSpeechParameters censorSpeech](v5, "censorSpeech"))
        && (farField = self->_farField, farField == -[AFSpeechParameters farField](v5, "farField"))
        && (secureOfflineOnly = self->_secureOfflineOnly,
            secureOfflineOnly == -[AFSpeechParameters secureOfflineOnly](v5, "secureOfflineOnly"))
        && (shouldStoreAudioOnDevice = self->_shouldStoreAudioOnDevice,
            shouldStoreAudioOnDevice == -[AFSpeechParameters shouldStoreAudioOnDevice](v5, "shouldStoreAudioOnDevice"))
        && (maximumRecognitionDuration = self->_maximumRecognitionDuration,
            -[AFSpeechParameters maximumRecognitionDuration](v5, "maximumRecognitionDuration"),
            maximumRecognitionDuration == v13))
      {
        -[AFSpeechParameters language](v5, "language");
        v16 = (NSString *)objc_claimAutoreleasedReturnValue();
        language = self->_language;
        if (language == v16 || -[NSString isEqual:](language, "isEqual:", v16))
        {
          -[AFSpeechParameters interactionIdentifier](v5, "interactionIdentifier");
          v18 = (NSString *)objc_claimAutoreleasedReturnValue();
          interactionIdentifier = self->_interactionIdentifier;
          if (interactionIdentifier == v18
            || -[NSString isEqual:](interactionIdentifier, "isEqual:", v18))
          {
            -[AFSpeechParameters task](v5, "task");
            v20 = (NSString *)objc_claimAutoreleasedReturnValue();
            task = self->_task;
            if (task == v20 || -[NSString isEqual:](task, "isEqual:", v20))
            {
              -[AFSpeechParameters loggingContext](v5, "loggingContext");
              v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
              loggingContext = self->_loggingContext;
              if (loggingContext == v22 || -[NSArray isEqual:](loggingContext, "isEqual:", v22))
              {
                -[AFSpeechParameters applicationName](v5, "applicationName");
                v24 = (NSString *)objc_claimAutoreleasedReturnValue();
                applicationName = self->_applicationName;
                if (applicationName == v24 || -[NSString isEqual:](applicationName, "isEqual:", v24))
                {
                  -[AFSpeechParameters profile](v5, "profile");
                  v26 = (NSData *)objc_claimAutoreleasedReturnValue();
                  profile = self->_profile;
                  if (profile == v26 || -[NSData isEqual:](profile, "isEqual:", v26))
                  {
                    -[AFSpeechParameters overrides](v5, "overrides");
                    v28 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
                    overrides = self->_overrides;
                    if (overrides == v28 || -[NSDictionary isEqual:](overrides, "isEqual:", v28))
                    {
                      -[AFSpeechParameters modelOverrideURL](v5, "modelOverrideURL");
                      v30 = objc_claimAutoreleasedReturnValue();
                      modelOverrideURL = self->_modelOverrideURL;
                      v44 = (void *)v30;
                      if (modelOverrideURL == (NSURL *)v30
                        || -[NSURL isEqual:](modelOverrideURL, "isEqual:", v30))
                      {
                        -[AFSpeechParameters originalAudioFileURL](v5, "originalAudioFileURL");
                        v32 = objc_claimAutoreleasedReturnValue();
                        originalAudioFileURL = self->_originalAudioFileURL;
                        v43 = (void *)v32;
                        if (originalAudioFileURL == (NSURL *)v32
                          || -[NSURL isEqual:](originalAudioFileURL, "isEqual:", v32))
                        {
                          -[AFSpeechParameters inputOrigin](v5, "inputOrigin");
                          v34 = objc_claimAutoreleasedReturnValue();
                          inputOrigin = self->_inputOrigin;
                          v42 = (void *)v34;
                          if (inputOrigin == (NSString *)v34
                            || -[NSString isEqual:](inputOrigin, "isEqual:", v34))
                          {
                            -[AFSpeechParameters location](v5, "location");
                            v36 = objc_claimAutoreleasedReturnValue();
                            location = self->_location;
                            v41 = (void *)v36;
                            if (location == (CLLocation *)v36
                              || -[CLLocation isEqual:](location, "isEqual:", v36))
                            {
                              -[AFSpeechParameters jitGrammar](v5, "jitGrammar");
                              v38 = objc_claimAutoreleasedReturnValue();
                              jitGrammar = self->_jitGrammar;
                              v40 = (void *)v38;
                              v14 = jitGrammar == (NSArray *)v38
                                 || -[NSArray isEqual:](jitGrammar, "isEqual:", v38);

                            }
                            else
                            {
                              v14 = 0;
                            }

                          }
                          else
                          {
                            v14 = 0;
                          }

                        }
                        else
                        {
                          v14 = 0;
                        }

                      }
                      else
                      {
                        v14 = 0;
                      }

                    }
                    else
                    {
                      v14 = 0;
                    }

                  }
                  else
                  {
                    v14 = 0;
                  }

                }
                else
                {
                  v14 = 0;
                }

              }
              else
              {
                v14 = 0;
              }

            }
            else
            {
              v14 = 0;
            }

          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (AFSpeechParameters)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  AFSpeechParameters *v44;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechParameters::language"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechParameters::interactionIdentifier"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechParameters::task"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("AFSpeechParameters::loggingContext"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechParameters::applicationName"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechParameters::profile"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v10, CFSTR("AFSpeechParameters::overrides"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechParameters::modelOverrideURL"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechParameters::originalAudioFileURL"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechParameters::narrowband"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechParameters::detectUtterances"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechParameters::censorSpeech"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechParameters::farField"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechParameters::secureOfflineOnly"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechParameters::shouldStoreAudioOnDevice"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechParameters::maximumRecognitionDuration"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  v23 = v22;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechParameters::inputOrigin"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechParameters::location"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0C99E60];
  v25 = objc_opt_class();
  objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v26, CFSTR("AFSpeechParameters::jitGrammar"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  BYTE5(v29) = v20;
  BYTE4(v29) = v18;
  BYTE3(v29) = v16;
  BYTE2(v29) = v33;
  BYTE1(v29) = v34;
  LOBYTE(v29) = v12;
  v44 = -[AFSpeechParameters initWithLanguage:interactionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:maximumRecognitionDuration:inputOrigin:location:jitGrammar:](self, "initWithLanguage:interactionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:maximumRecognitionDuration:inputOrigin:location:jitGrammar:", v42, v41, v40, v39, v38, v37, v23, v36, v35, v32, v29, v31, v30, v27);

  return v44;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *language;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  language = self->_language;
  v12 = a3;
  objc_msgSend(v12, "encodeObject:forKey:", language, CFSTR("AFSpeechParameters::language"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_interactionIdentifier, CFSTR("AFSpeechParameters::interactionIdentifier"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_task, CFSTR("AFSpeechParameters::task"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_loggingContext, CFSTR("AFSpeechParameters::loggingContext"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_applicationName, CFSTR("AFSpeechParameters::applicationName"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_profile, CFSTR("AFSpeechParameters::profile"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_overrides, CFSTR("AFSpeechParameters::overrides"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_modelOverrideURL, CFSTR("AFSpeechParameters::modelOverrideURL"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_originalAudioFileURL, CFSTR("AFSpeechParameters::originalAudioFileURL"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_narrowband);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("AFSpeechParameters::narrowband"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_detectUtterances);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("AFSpeechParameters::detectUtterances"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_censorSpeech);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("AFSpeechParameters::censorSpeech"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_farField);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("AFSpeechParameters::farField"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_secureOfflineOnly);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("AFSpeechParameters::secureOfflineOnly"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldStoreAudioOnDevice);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("AFSpeechParameters::shouldStoreAudioOnDevice"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maximumRecognitionDuration);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("AFSpeechParameters::maximumRecognitionDuration"));

  objc_msgSend(v12, "encodeObject:forKey:", self->_inputOrigin, CFSTR("AFSpeechParameters::inputOrigin"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_location, CFSTR("AFSpeechParameters::location"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_jitGrammar, CFSTR("AFSpeechParameters::jitGrammar"));

}

- (NSString)language
{
  return self->_language;
}

- (NSString)interactionIdentifier
{
  return self->_interactionIdentifier;
}

- (NSString)task
{
  return self->_task;
}

- (NSArray)loggingContext
{
  return self->_loggingContext;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (NSData)profile
{
  return self->_profile;
}

- (NSDictionary)overrides
{
  return self->_overrides;
}

- (NSURL)modelOverrideURL
{
  return self->_modelOverrideURL;
}

- (NSURL)originalAudioFileURL
{
  return self->_originalAudioFileURL;
}

- (BOOL)narrowband
{
  return self->_narrowband;
}

- (BOOL)detectUtterances
{
  return self->_detectUtterances;
}

- (BOOL)censorSpeech
{
  return self->_censorSpeech;
}

- (BOOL)farField
{
  return self->_farField;
}

- (BOOL)secureOfflineOnly
{
  return self->_secureOfflineOnly;
}

- (BOOL)shouldStoreAudioOnDevice
{
  return self->_shouldStoreAudioOnDevice;
}

- (double)maximumRecognitionDuration
{
  return self->_maximumRecognitionDuration;
}

- (NSString)inputOrigin
{
  return self->_inputOrigin;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSArray)jitGrammar
{
  return self->_jitGrammar;
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
}

void __305__AFSpeechParameters_initWithLanguage_interactionIdentifier_task_loggingContext_applicationName_profile_overrides_modelOverrideURL_originalAudioFileURL_narrowband_detectUtterances_censorSpeech_farField_secureOfflineOnly_shouldStoreAudioOnDevice_maximumRecognitionDuration_inputOrigin_location_jitGrammar___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setLanguage:", v3);
  objc_msgSend(v4, "setInteractionIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setTask:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setLoggingContext:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setApplicationName:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v4, "setProfile:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v4, "setOverrides:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v4, "setModelOverrideURL:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v4, "setOriginalAudioFileURL:", *(_QWORD *)(a1 + 96));
  objc_msgSend(v4, "setNarrowband:", *(unsigned __int8 *)(a1 + 136));
  objc_msgSend(v4, "setDetectUtterances:", *(unsigned __int8 *)(a1 + 137));
  objc_msgSend(v4, "setCensorSpeech:", *(unsigned __int8 *)(a1 + 138));
  objc_msgSend(v4, "setFarField:", *(unsigned __int8 *)(a1 + 139));
  objc_msgSend(v4, "setSecureOfflineOnly:", *(unsigned __int8 *)(a1 + 140));
  objc_msgSend(v4, "setShouldStoreAudioOnDevice:", *(unsigned __int8 *)(a1 + 141));
  objc_msgSend(v4, "setMaximumRecognitionDuration:", *(double *)(a1 + 128));
  objc_msgSend(v4, "setInputOrigin:", *(_QWORD *)(a1 + 104));
  objc_msgSend(v4, "setLocation:", *(_QWORD *)(a1 + 112));
  objc_msgSend(v4, "setJitGrammar:", *(_QWORD *)(a1 + 120));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFSpeechParametersMutation *);
  _AFSpeechParametersMutation *v5;
  AFSpeechParameters *v6;
  void *v7;
  uint64_t v8;
  NSString *language;
  void *v10;
  uint64_t v11;
  NSString *interactionIdentifier;
  void *v13;
  uint64_t v14;
  NSString *task;
  void *v16;
  uint64_t v17;
  NSArray *loggingContext;
  void *v19;
  uint64_t v20;
  NSString *applicationName;
  void *v22;
  uint64_t v23;
  NSData *profile;
  void *v25;
  uint64_t v26;
  NSDictionary *overrides;
  void *v28;
  uint64_t v29;
  NSURL *modelOverrideURL;
  void *v31;
  uint64_t v32;
  NSURL *originalAudioFileURL;
  double v34;
  void *v35;
  uint64_t v36;
  NSString *inputOrigin;
  void *v38;
  uint64_t v39;
  CLLocation *location;
  void *v41;
  uint64_t v42;
  NSArray *jitGrammar;

  v4 = (void (**)(id, _AFSpeechParametersMutation *))a3;
  if (v4)
  {
    v5 = -[_AFSpeechParametersMutation initWithBase:]([_AFSpeechParametersMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFSpeechParametersMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFSpeechParameters);
      -[_AFSpeechParametersMutation getLanguage](v5, "getLanguage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      language = v6->_language;
      v6->_language = (NSString *)v8;

      -[_AFSpeechParametersMutation getInteractionIdentifier](v5, "getInteractionIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      interactionIdentifier = v6->_interactionIdentifier;
      v6->_interactionIdentifier = (NSString *)v11;

      -[_AFSpeechParametersMutation getTask](v5, "getTask");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      task = v6->_task;
      v6->_task = (NSString *)v14;

      -[_AFSpeechParametersMutation getLoggingContext](v5, "getLoggingContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      loggingContext = v6->_loggingContext;
      v6->_loggingContext = (NSArray *)v17;

      -[_AFSpeechParametersMutation getApplicationName](v5, "getApplicationName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      applicationName = v6->_applicationName;
      v6->_applicationName = (NSString *)v20;

      -[_AFSpeechParametersMutation getProfile](v5, "getProfile");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "copy");
      profile = v6->_profile;
      v6->_profile = (NSData *)v23;

      -[_AFSpeechParametersMutation getOverrides](v5, "getOverrides");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "copy");
      overrides = v6->_overrides;
      v6->_overrides = (NSDictionary *)v26;

      -[_AFSpeechParametersMutation getModelOverrideURL](v5, "getModelOverrideURL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "copy");
      modelOverrideURL = v6->_modelOverrideURL;
      v6->_modelOverrideURL = (NSURL *)v29;

      -[_AFSpeechParametersMutation getOriginalAudioFileURL](v5, "getOriginalAudioFileURL");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "copy");
      originalAudioFileURL = v6->_originalAudioFileURL;
      v6->_originalAudioFileURL = (NSURL *)v32;

      v6->_narrowband = -[_AFSpeechParametersMutation getNarrowband](v5, "getNarrowband");
      v6->_detectUtterances = -[_AFSpeechParametersMutation getDetectUtterances](v5, "getDetectUtterances");
      v6->_censorSpeech = -[_AFSpeechParametersMutation getCensorSpeech](v5, "getCensorSpeech");
      v6->_farField = -[_AFSpeechParametersMutation getFarField](v5, "getFarField");
      v6->_secureOfflineOnly = -[_AFSpeechParametersMutation getSecureOfflineOnly](v5, "getSecureOfflineOnly");
      v6->_shouldStoreAudioOnDevice = -[_AFSpeechParametersMutation getShouldStoreAudioOnDevice](v5, "getShouldStoreAudioOnDevice");
      -[_AFSpeechParametersMutation getMaximumRecognitionDuration](v5, "getMaximumRecognitionDuration");
      v6->_maximumRecognitionDuration = v34;
      -[_AFSpeechParametersMutation getInputOrigin](v5, "getInputOrigin");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "copy");
      inputOrigin = v6->_inputOrigin;
      v6->_inputOrigin = (NSString *)v36;

      -[_AFSpeechParametersMutation getLocation](v5, "getLocation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "copy");
      location = v6->_location;
      v6->_location = (CLLocation *)v39;

      -[_AFSpeechParametersMutation getJitGrammar](v5, "getJitGrammar");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "copy");
      jitGrammar = v6->_jitGrammar;
      v6->_jitGrammar = (NSArray *)v42;

    }
    else
    {
      v6 = (AFSpeechParameters *)-[AFSpeechParameters copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFSpeechParameters *)-[AFSpeechParameters copy](self, "copy");
  }

  return v6;
}

@end
