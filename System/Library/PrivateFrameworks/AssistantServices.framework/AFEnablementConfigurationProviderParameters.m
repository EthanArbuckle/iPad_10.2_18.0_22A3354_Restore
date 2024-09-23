@implementation AFEnablementConfigurationProviderParameters

- (AFEnablementConfigurationProviderParameters)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFEnablementConfigurationProviderParametersMutation *);
  AFEnablementConfigurationProviderParameters *v5;
  AFEnablementConfigurationProviderParameters *v6;
  _AFEnablementConfigurationProviderParametersMutation *v7;
  void *v8;
  uint64_t v9;
  NSError *userStatusFetchError;
  void *v11;
  uint64_t v12;
  NSDate *dateStartedResolvingUserStatus;
  void *v14;
  uint64_t v15;
  NSDate *dateEndedResolvingUserStatus;
  void *v17;
  uint64_t v18;
  AFExperiment *experiment;
  void *v20;
  uint64_t v21;
  NSError *experimentFetchError;
  void *v23;
  uint64_t v24;
  NSDate *dateStartedResolvingExperiment;
  void *v26;
  uint64_t v27;
  NSDate *dateEndedResolvingExperiment;
  void *v29;
  uint64_t v30;
  NSDictionary *outputVoiceCountForRecognitionLanguage;
  objc_super v33;

  v4 = (void (**)(id, _AFEnablementConfigurationProviderParametersMutation *))a3;
  v33.receiver = self;
  v33.super_class = (Class)AFEnablementConfigurationProviderParameters;
  v5 = -[AFEnablementConfigurationProviderParameters init](&v33, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFEnablementConfigurationProviderParametersMutation initWithBase:]([_AFEnablementConfigurationProviderParametersMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFEnablementConfigurationProviderParametersMutation isDirty](v7, "isDirty"))
    {
      v6->_enablementFlow = -[_AFEnablementConfigurationProviderParametersMutation getEnablementFlow](v7, "getEnablementFlow");
      v6->_newUser = -[_AFEnablementConfigurationProviderParametersMutation getNewUser](v7, "getNewUser");
      -[_AFEnablementConfigurationProviderParametersMutation getUserStatusFetchError](v7, "getUserStatusFetchError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      userStatusFetchError = v6->_userStatusFetchError;
      v6->_userStatusFetchError = (NSError *)v9;

      -[_AFEnablementConfigurationProviderParametersMutation getDateStartedResolvingUserStatus](v7, "getDateStartedResolvingUserStatus");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      dateStartedResolvingUserStatus = v6->_dateStartedResolvingUserStatus;
      v6->_dateStartedResolvingUserStatus = (NSDate *)v12;

      -[_AFEnablementConfigurationProviderParametersMutation getDateEndedResolvingUserStatus](v7, "getDateEndedResolvingUserStatus");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      dateEndedResolvingUserStatus = v6->_dateEndedResolvingUserStatus;
      v6->_dateEndedResolvingUserStatus = (NSDate *)v15;

      -[_AFEnablementConfigurationProviderParametersMutation getExperiment](v7, "getExperiment");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      experiment = v6->_experiment;
      v6->_experiment = (AFExperiment *)v18;

      -[_AFEnablementConfigurationProviderParametersMutation getExperimentFetchError](v7, "getExperimentFetchError");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      experimentFetchError = v6->_experimentFetchError;
      v6->_experimentFetchError = (NSError *)v21;

      -[_AFEnablementConfigurationProviderParametersMutation getDateStartedResolvingExperiment](v7, "getDateStartedResolvingExperiment");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "copy");
      dateStartedResolvingExperiment = v6->_dateStartedResolvingExperiment;
      v6->_dateStartedResolvingExperiment = (NSDate *)v24;

      -[_AFEnablementConfigurationProviderParametersMutation getDateEndedResolvingExperiment](v7, "getDateEndedResolvingExperiment");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "copy");
      dateEndedResolvingExperiment = v6->_dateEndedResolvingExperiment;
      v6->_dateEndedResolvingExperiment = (NSDate *)v27;

      -[_AFEnablementConfigurationProviderParametersMutation getOutputVoiceCountForRecognitionLanguage](v7, "getOutputVoiceCountForRecognitionLanguage");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "copy");
      outputVoiceCountForRecognitionLanguage = v6->_outputVoiceCountForRecognitionLanguage;
      v6->_outputVoiceCountForRecognitionLanguage = (NSDictionary *)v30;

      v6->_recognitionLanguageWithMultipleOutputVoicesExists = -[_AFEnablementConfigurationProviderParametersMutation getRecognitionLanguageWithMultipleOutputVoicesExists](v7, "getRecognitionLanguageWithMultipleOutputVoicesExists");
    }

  }
  return v6;
}

- (AFEnablementConfigurationProviderParameters)init
{
  return -[AFEnablementConfigurationProviderParameters initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFEnablementConfigurationProviderParameters)initWithEnablementFlow:(int64_t)a3 newUser:(BOOL)a4 userStatusFetchError:(id)a5 dateStartedResolvingUserStatus:(id)a6 dateEndedResolvingUserStatus:(id)a7 experiment:(id)a8 experimentFetchError:(id)a9 dateStartedResolvingExperiment:(id)a10 dateEndedResolvingExperiment:(id)a11 outputVoiceCountForRecognitionLanguage:(id)a12 recognitionLanguageWithMultipleOutputVoicesExists:(BOOL)a13
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  AFEnablementConfigurationProviderParameters *v32;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  int64_t v46;
  BOOL v47;
  BOOL v48;

  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __340__AFEnablementConfigurationProviderParameters_initWithEnablementFlow_newUser_userStatusFetchError_dateStartedResolvingUserStatus_dateEndedResolvingUserStatus_experiment_experimentFetchError_dateStartedResolvingExperiment_dateEndedResolvingExperiment_outputVoiceCountForRecognitionLanguage_recognitionLanguageWithMultipleOutputVoicesExists___block_invoke;
  v37[3] = &unk_1E3A308A8;
  v45 = v23;
  v46 = a3;
  v47 = a4;
  v38 = v16;
  v39 = v17;
  v40 = v18;
  v41 = v19;
  v42 = v20;
  v43 = v21;
  v44 = v22;
  v48 = a13;
  v24 = v23;
  v25 = v22;
  v26 = v21;
  v27 = v20;
  v28 = v19;
  v29 = v18;
  v30 = v17;
  v31 = v16;
  v32 = -[AFEnablementConfigurationProviderParameters initWithBuilder:](self, "initWithBuilder:", v37);

  return v32;
}

- (id)description
{
  return -[AFEnablementConfigurationProviderParameters _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t enablementFlow;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  objc_super v14;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v14.receiver = self;
  v14.super_class = (Class)AFEnablementConfigurationProviderParameters;
  -[AFEnablementConfigurationProviderParameters description](&v14, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  enablementFlow = self->_enablementFlow;
  if (enablementFlow > 9)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_1E3A32D20[enablementFlow];
  v8 = v7;
  v9 = v8;
  v10 = CFSTR("YES");
  if (self->_newUser)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (!self->_recognitionLanguageWithMultipleOutputVoicesExists)
    v10 = CFSTR("NO");
  v12 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {enablementFlow = %@, newUser = %@, userStatusFetchError = %@, dateStartedResolvingUserStatus = %@, dateEndedResolvingUserStatus = %@, experiment = %@, experimentFetchError = %@, dateStartedResolvingExperiment = %@, dateEndedResolvingExperiment = %@, outputVoiceCountForRecognitionLanguage = %@, recognitionLanguageWithMultipleOutputVoicesExists = %@}"), v5, v8, v11, *(_OWORD *)&self->_userStatusFetchError, *(_OWORD *)&self->_dateEndedResolvingUserStatus, *(_OWORD *)&self->_experimentFetchError, self->_dateEndedResolvingExperiment, self->_outputVoiceCountForRecognitionLanguage, v10);

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_enablementFlow);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_newUser);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = -[NSError hash](self->_userStatusFetchError, "hash");
  v8 = v7 ^ -[NSDate hash](self->_dateStartedResolvingUserStatus, "hash");
  v9 = v8 ^ -[NSDate hash](self->_dateEndedResolvingUserStatus, "hash");
  v10 = v6 ^ v9 ^ -[AFExperiment hash](self->_experiment, "hash");
  v11 = -[NSError hash](self->_experimentFetchError, "hash");
  v12 = v11 ^ -[NSDate hash](self->_dateStartedResolvingExperiment, "hash");
  v13 = v12 ^ -[NSDate hash](self->_dateEndedResolvingExperiment, "hash");
  v14 = v13 ^ -[NSDictionary hash](self->_outputVoiceCountForRecognitionLanguage, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_recognitionLanguageWithMultipleOutputVoicesExists);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  AFEnablementConfigurationProviderParameters *v4;
  AFEnablementConfigurationProviderParameters *v5;
  int64_t enablementFlow;
  _BOOL4 newUser;
  _BOOL4 recognitionLanguageWithMultipleOutputVoicesExists;
  NSError *v9;
  NSError *userStatusFetchError;
  NSDate *v11;
  NSDate *dateStartedResolvingUserStatus;
  NSDate *v13;
  NSDate *dateEndedResolvingUserStatus;
  AFExperiment *v15;
  AFExperiment *experiment;
  NSError *v17;
  NSError *experimentFetchError;
  NSDate *v19;
  NSDate *dateStartedResolvingExperiment;
  NSDate *v21;
  NSDate *dateEndedResolvingExperiment;
  NSDictionary *v23;
  NSDictionary *outputVoiceCountForRecognitionLanguage;
  BOOL v25;
  NSDate *v27;

  v4 = (AFEnablementConfigurationProviderParameters *)a3;
  if (self == v4)
  {
    v25 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      enablementFlow = self->_enablementFlow;
      if (enablementFlow == -[AFEnablementConfigurationProviderParameters enablementFlow](v5, "enablementFlow")
        && (newUser = self->_newUser, newUser == -[AFEnablementConfigurationProviderParameters newUser](v5, "newUser"))
        && (recognitionLanguageWithMultipleOutputVoicesExists = self->_recognitionLanguageWithMultipleOutputVoicesExists,
            recognitionLanguageWithMultipleOutputVoicesExists == -[AFEnablementConfigurationProviderParameters recognitionLanguageWithMultipleOutputVoicesExists](v5, "recognitionLanguageWithMultipleOutputVoicesExists")))
      {
        -[AFEnablementConfigurationProviderParameters userStatusFetchError](v5, "userStatusFetchError");
        v9 = (NSError *)objc_claimAutoreleasedReturnValue();
        userStatusFetchError = self->_userStatusFetchError;
        if (userStatusFetchError == v9 || -[NSError isEqual:](userStatusFetchError, "isEqual:", v9))
        {
          -[AFEnablementConfigurationProviderParameters dateStartedResolvingUserStatus](v5, "dateStartedResolvingUserStatus");
          v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
          dateStartedResolvingUserStatus = self->_dateStartedResolvingUserStatus;
          if (dateStartedResolvingUserStatus == v11
            || -[NSDate isEqual:](dateStartedResolvingUserStatus, "isEqual:", v11))
          {
            -[AFEnablementConfigurationProviderParameters dateEndedResolvingUserStatus](v5, "dateEndedResolvingUserStatus");
            v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
            dateEndedResolvingUserStatus = self->_dateEndedResolvingUserStatus;
            if (dateEndedResolvingUserStatus == v13
              || -[NSDate isEqual:](dateEndedResolvingUserStatus, "isEqual:", v13))
            {
              -[AFEnablementConfigurationProviderParameters experiment](v5, "experiment");
              v15 = (AFExperiment *)objc_claimAutoreleasedReturnValue();
              experiment = self->_experiment;
              if (experiment == v15 || -[AFExperiment isEqual:](experiment, "isEqual:", v15))
              {
                -[AFEnablementConfigurationProviderParameters experimentFetchError](v5, "experimentFetchError");
                v17 = (NSError *)objc_claimAutoreleasedReturnValue();
                experimentFetchError = self->_experimentFetchError;
                if (experimentFetchError == v17
                  || -[NSError isEqual:](experimentFetchError, "isEqual:", v17))
                {
                  -[AFEnablementConfigurationProviderParameters dateStartedResolvingExperiment](v5, "dateStartedResolvingExperiment");
                  v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
                  dateStartedResolvingExperiment = self->_dateStartedResolvingExperiment;
                  if (dateStartedResolvingExperiment == v19
                    || -[NSDate isEqual:](dateStartedResolvingExperiment, "isEqual:", v19))
                  {
                    -[AFEnablementConfigurationProviderParameters dateEndedResolvingExperiment](v5, "dateEndedResolvingExperiment");
                    v21 = (NSDate *)objc_claimAutoreleasedReturnValue();
                    dateEndedResolvingExperiment = self->_dateEndedResolvingExperiment;
                    if (dateEndedResolvingExperiment == v21
                      || -[NSDate isEqual:](dateEndedResolvingExperiment, "isEqual:", v21))
                    {
                      v27 = v21;
                      -[AFEnablementConfigurationProviderParameters outputVoiceCountForRecognitionLanguage](v5, "outputVoiceCountForRecognitionLanguage");
                      v23 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
                      outputVoiceCountForRecognitionLanguage = self->_outputVoiceCountForRecognitionLanguage;
                      v25 = outputVoiceCountForRecognitionLanguage == v23
                         || -[NSDictionary isEqual:](outputVoiceCountForRecognitionLanguage, "isEqual:", v23);

                      v21 = v27;
                    }
                    else
                    {
                      v25 = 0;
                    }

                  }
                  else
                  {
                    v25 = 0;
                  }

                }
                else
                {
                  v25 = 0;
                }

              }
              else
              {
                v25 = 0;
              }

            }
            else
            {
              v25 = 0;
            }

          }
          else
          {
            v25 = 0;
          }

        }
        else
        {
          v25 = 0;
        }

      }
      else
      {
        v25 = 0;
      }

    }
    else
    {
      v25 = 0;
    }
  }

  return v25;
}

- (AFEnablementConfigurationProviderParameters)initWithCoder:(id)a3
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
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  AFEnablementConfigurationProviderParameters *v17;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFEnablementConfigurationProviderParameters::enablementFlow"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFEnablementConfigurationProviderParameters::newUser"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFEnablementConfigurationProviderParameters::userStatusFetchError"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFEnablementConfigurationProviderParameters::dateStartedResolvingUserStatus"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFEnablementConfigurationProviderParameters::dateEndedResolvingUserStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFEnablementConfigurationProviderParameters::experiment"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFEnablementConfigurationProviderParameters::experimentFetchError"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFEnablementConfigurationProviderParameters::dateStartedResolvingExperiment"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFEnablementConfigurationProviderParameters::dateEndedResolvingExperiment"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v14, CFSTR("AFEnablementConfigurationProviderParameters::outputVoiceCountForRecognitionLanguage"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFEnablementConfigurationProviderParameters::recognitionLanguageWithMultipleOutputVoicesExists"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v16, "BOOLValue");
  LOBYTE(v19) = (_BYTE)v3;
  v17 = -[AFEnablementConfigurationProviderParameters initWithEnablementFlow:newUser:userStatusFetchError:dateStartedResolvingUserStatus:dateEndedResolvingUserStatus:experiment:experimentFetchError:dateStartedResolvingExperiment:dateEndedResolvingExperiment:outputVoiceCountForRecognitionLanguage:recognitionLanguageWithMultipleOutputVoicesExists:](self, "initWithEnablementFlow:newUser:userStatusFetchError:dateStartedResolvingUserStatus:dateEndedResolvingUserStatus:experiment:experimentFetchError:dateStartedResolvingExperiment:dateEndedResolvingExperiment:outputVoiceCountForRecognitionLanguage:recognitionLanguageWithMultipleOutputVoicesExists:", v23, v22, v21, v20, v6, v7, v8, v9, v10, v15, v19);

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t enablementFlow;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  enablementFlow = self->_enablementFlow;
  v6 = a3;
  objc_msgSend(v4, "numberWithInteger:", enablementFlow);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("AFEnablementConfigurationProviderParameters::enablementFlow"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_newUser);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("AFEnablementConfigurationProviderParameters::newUser"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_userStatusFetchError, CFSTR("AFEnablementConfigurationProviderParameters::userStatusFetchError"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_dateStartedResolvingUserStatus, CFSTR("AFEnablementConfigurationProviderParameters::dateStartedResolvingUserStatus"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_dateEndedResolvingUserStatus, CFSTR("AFEnablementConfigurationProviderParameters::dateEndedResolvingUserStatus"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_experiment, CFSTR("AFEnablementConfigurationProviderParameters::experiment"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_experimentFetchError, CFSTR("AFEnablementConfigurationProviderParameters::experimentFetchError"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_dateStartedResolvingExperiment, CFSTR("AFEnablementConfigurationProviderParameters::dateStartedResolvingExperiment"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_dateEndedResolvingExperiment, CFSTR("AFEnablementConfigurationProviderParameters::dateEndedResolvingExperiment"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_outputVoiceCountForRecognitionLanguage, CFSTR("AFEnablementConfigurationProviderParameters::outputVoiceCountForRecognitionLanguage"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_recognitionLanguageWithMultipleOutputVoicesExists);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("AFEnablementConfigurationProviderParameters::recognitionLanguageWithMultipleOutputVoicesExists"));

}

- (int64_t)enablementFlow
{
  return self->_enablementFlow;
}

- (BOOL)newUser
{
  return self->_newUser;
}

- (NSError)userStatusFetchError
{
  return self->_userStatusFetchError;
}

- (NSDate)dateStartedResolvingUserStatus
{
  return self->_dateStartedResolvingUserStatus;
}

- (NSDate)dateEndedResolvingUserStatus
{
  return self->_dateEndedResolvingUserStatus;
}

- (AFExperiment)experiment
{
  return self->_experiment;
}

- (NSError)experimentFetchError
{
  return self->_experimentFetchError;
}

- (NSDate)dateStartedResolvingExperiment
{
  return self->_dateStartedResolvingExperiment;
}

- (NSDate)dateEndedResolvingExperiment
{
  return self->_dateEndedResolvingExperiment;
}

- (NSDictionary)outputVoiceCountForRecognitionLanguage
{
  return self->_outputVoiceCountForRecognitionLanguage;
}

- (BOOL)recognitionLanguageWithMultipleOutputVoicesExists
{
  return self->_recognitionLanguageWithMultipleOutputVoicesExists;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputVoiceCountForRecognitionLanguage, 0);
  objc_storeStrong((id *)&self->_dateEndedResolvingExperiment, 0);
  objc_storeStrong((id *)&self->_dateStartedResolvingExperiment, 0);
  objc_storeStrong((id *)&self->_experimentFetchError, 0);
  objc_storeStrong((id *)&self->_experiment, 0);
  objc_storeStrong((id *)&self->_dateEndedResolvingUserStatus, 0);
  objc_storeStrong((id *)&self->_dateStartedResolvingUserStatus, 0);
  objc_storeStrong((id *)&self->_userStatusFetchError, 0);
}

void __340__AFEnablementConfigurationProviderParameters_initWithEnablementFlow_newUser_userStatusFetchError_dateStartedResolvingUserStatus_dateEndedResolvingUserStatus_experiment_experimentFetchError_dateStartedResolvingExperiment_dateEndedResolvingExperiment_outputVoiceCountForRecognitionLanguage_recognitionLanguageWithMultipleOutputVoicesExists___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 96);
  v4 = a2;
  objc_msgSend(v4, "setEnablementFlow:", v3);
  objc_msgSend(v4, "setNewUser:", *(unsigned __int8 *)(a1 + 104));
  objc_msgSend(v4, "setUserStatusFetchError:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setDateStartedResolvingUserStatus:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setDateEndedResolvingUserStatus:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setExperiment:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setExperimentFetchError:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v4, "setDateStartedResolvingExperiment:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v4, "setDateEndedResolvingExperiment:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v4, "setOutputVoiceCountForRecognitionLanguage:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v4, "setRecognitionLanguageWithMultipleOutputVoicesExists:", *(unsigned __int8 *)(a1 + 105));

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
  void (**v4)(id, _AFEnablementConfigurationProviderParametersMutation *);
  _AFEnablementConfigurationProviderParametersMutation *v5;
  AFEnablementConfigurationProviderParameters *v6;
  void *v7;
  uint64_t v8;
  NSError *userStatusFetchError;
  void *v10;
  uint64_t v11;
  NSDate *dateStartedResolvingUserStatus;
  void *v13;
  uint64_t v14;
  NSDate *dateEndedResolvingUserStatus;
  void *v16;
  uint64_t v17;
  AFExperiment *experiment;
  void *v19;
  uint64_t v20;
  NSError *experimentFetchError;
  void *v22;
  uint64_t v23;
  NSDate *dateStartedResolvingExperiment;
  void *v25;
  uint64_t v26;
  NSDate *dateEndedResolvingExperiment;
  void *v28;
  uint64_t v29;
  NSDictionary *outputVoiceCountForRecognitionLanguage;

  v4 = (void (**)(id, _AFEnablementConfigurationProviderParametersMutation *))a3;
  if (v4)
  {
    v5 = -[_AFEnablementConfigurationProviderParametersMutation initWithBase:]([_AFEnablementConfigurationProviderParametersMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFEnablementConfigurationProviderParametersMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFEnablementConfigurationProviderParameters);
      v6->_enablementFlow = -[_AFEnablementConfigurationProviderParametersMutation getEnablementFlow](v5, "getEnablementFlow");
      v6->_newUser = -[_AFEnablementConfigurationProviderParametersMutation getNewUser](v5, "getNewUser");
      -[_AFEnablementConfigurationProviderParametersMutation getUserStatusFetchError](v5, "getUserStatusFetchError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      userStatusFetchError = v6->_userStatusFetchError;
      v6->_userStatusFetchError = (NSError *)v8;

      -[_AFEnablementConfigurationProviderParametersMutation getDateStartedResolvingUserStatus](v5, "getDateStartedResolvingUserStatus");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      dateStartedResolvingUserStatus = v6->_dateStartedResolvingUserStatus;
      v6->_dateStartedResolvingUserStatus = (NSDate *)v11;

      -[_AFEnablementConfigurationProviderParametersMutation getDateEndedResolvingUserStatus](v5, "getDateEndedResolvingUserStatus");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      dateEndedResolvingUserStatus = v6->_dateEndedResolvingUserStatus;
      v6->_dateEndedResolvingUserStatus = (NSDate *)v14;

      -[_AFEnablementConfigurationProviderParametersMutation getExperiment](v5, "getExperiment");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      experiment = v6->_experiment;
      v6->_experiment = (AFExperiment *)v17;

      -[_AFEnablementConfigurationProviderParametersMutation getExperimentFetchError](v5, "getExperimentFetchError");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      experimentFetchError = v6->_experimentFetchError;
      v6->_experimentFetchError = (NSError *)v20;

      -[_AFEnablementConfigurationProviderParametersMutation getDateStartedResolvingExperiment](v5, "getDateStartedResolvingExperiment");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "copy");
      dateStartedResolvingExperiment = v6->_dateStartedResolvingExperiment;
      v6->_dateStartedResolvingExperiment = (NSDate *)v23;

      -[_AFEnablementConfigurationProviderParametersMutation getDateEndedResolvingExperiment](v5, "getDateEndedResolvingExperiment");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "copy");
      dateEndedResolvingExperiment = v6->_dateEndedResolvingExperiment;
      v6->_dateEndedResolvingExperiment = (NSDate *)v26;

      -[_AFEnablementConfigurationProviderParametersMutation getOutputVoiceCountForRecognitionLanguage](v5, "getOutputVoiceCountForRecognitionLanguage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "copy");
      outputVoiceCountForRecognitionLanguage = v6->_outputVoiceCountForRecognitionLanguage;
      v6->_outputVoiceCountForRecognitionLanguage = (NSDictionary *)v29;

      v6->_recognitionLanguageWithMultipleOutputVoicesExists = -[_AFEnablementConfigurationProviderParametersMutation getRecognitionLanguageWithMultipleOutputVoicesExists](v5, "getRecognitionLanguageWithMultipleOutputVoicesExists");
    }
    else
    {
      v6 = (AFEnablementConfigurationProviderParameters *)-[AFEnablementConfigurationProviderParameters copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFEnablementConfigurationProviderParameters *)-[AFEnablementConfigurationProviderParameters copy](self, "copy");
  }

  return v6;
}

@end
