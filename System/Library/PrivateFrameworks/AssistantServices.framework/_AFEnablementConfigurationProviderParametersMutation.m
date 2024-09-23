@implementation _AFEnablementConfigurationProviderParametersMutation

- (_AFEnablementConfigurationProviderParametersMutation)initWithBase:(id)a3
{
  id v5;
  _AFEnablementConfigurationProviderParametersMutation *v6;
  _AFEnablementConfigurationProviderParametersMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFEnablementConfigurationProviderParametersMutation;
  v6 = -[_AFEnablementConfigurationProviderParametersMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (int64_t)getEnablementFlow
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
    return self->_enablementFlow;
  else
    return -[AFEnablementConfigurationProviderParameters enablementFlow](self->_base, "enablementFlow");
}

- (void)setEnablementFlow:(int64_t)a3
{
  self->_enablementFlow = a3;
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (BOOL)getNewUser
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
    return self->_newUser;
  else
    return -[AFEnablementConfigurationProviderParameters newUser](self->_base, "newUser");
}

- (void)setNewUser:(BOOL)a3
{
  self->_newUser = a3;
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getUserStatusFetchError
{
  NSError *v2;

  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_userStatusFetchError;
  }
  else
  {
    -[AFEnablementConfigurationProviderParameters userStatusFetchError](self->_base, "userStatusFetchError");
    v2 = (NSError *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setUserStatusFetchError:(id)a3
{
  objc_storeStrong((id *)&self->_userStatusFetchError, a3);
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getDateStartedResolvingUserStatus
{
  NSDate *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_dateStartedResolvingUserStatus;
  }
  else
  {
    -[AFEnablementConfigurationProviderParameters dateStartedResolvingUserStatus](self->_base, "dateStartedResolvingUserStatus");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDateStartedResolvingUserStatus:(id)a3
{
  objc_storeStrong((id *)&self->_dateStartedResolvingUserStatus, a3);
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getDateEndedResolvingUserStatus
{
  NSDate *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_dateEndedResolvingUserStatus;
  }
  else
  {
    -[AFEnablementConfigurationProviderParameters dateEndedResolvingUserStatus](self->_base, "dateEndedResolvingUserStatus");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDateEndedResolvingUserStatus:(id)a3
{
  objc_storeStrong((id *)&self->_dateEndedResolvingUserStatus, a3);
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getExperiment
{
  AFExperiment *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_experiment;
  }
  else
  {
    -[AFEnablementConfigurationProviderParameters experiment](self->_base, "experiment");
    v2 = (AFExperiment *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setExperiment:(id)a3
{
  objc_storeStrong((id *)&self->_experiment, a3);
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getExperimentFetchError
{
  NSError *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_experimentFetchError;
  }
  else
  {
    -[AFEnablementConfigurationProviderParameters experimentFetchError](self->_base, "experimentFetchError");
    v2 = (NSError *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setExperimentFetchError:(id)a3
{
  objc_storeStrong((id *)&self->_experimentFetchError, a3);
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getDateStartedResolvingExperiment
{
  NSDate *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
  {
    v2 = self->_dateStartedResolvingExperiment;
  }
  else
  {
    -[AFEnablementConfigurationProviderParameters dateStartedResolvingExperiment](self->_base, "dateStartedResolvingExperiment");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDateStartedResolvingExperiment:(id)a3
{
  objc_storeStrong((id *)&self->_dateStartedResolvingExperiment, a3);
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getDateEndedResolvingExperiment
{
  NSDate *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_dateEndedResolvingExperiment;
  }
  else
  {
    -[AFEnablementConfigurationProviderParameters dateEndedResolvingExperiment](self->_base, "dateEndedResolvingExperiment");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDateEndedResolvingExperiment:(id)a3
{
  objc_storeStrong((id *)&self->_dateEndedResolvingExperiment, a3);
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getOutputVoiceCountForRecognitionLanguage
{
  NSDictionary *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
  {
    v2 = self->_outputVoiceCountForRecognitionLanguage;
  }
  else
  {
    -[AFEnablementConfigurationProviderParameters outputVoiceCountForRecognitionLanguage](self->_base, "outputVoiceCountForRecognitionLanguage");
    v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setOutputVoiceCountForRecognitionLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_outputVoiceCountForRecognitionLanguage, a3);
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (BOOL)getRecognitionLanguageWithMultipleOutputVoicesExists
{
  if ((*(_WORD *)&self->_mutationFlags & 0x800) != 0)
    return self->_recognitionLanguageWithMultipleOutputVoicesExists;
  else
    return -[AFEnablementConfigurationProviderParameters recognitionLanguageWithMultipleOutputVoicesExists](self->_base, "recognitionLanguageWithMultipleOutputVoicesExists");
}

- (void)setRecognitionLanguageWithMultipleOutputVoicesExists:(BOOL)a3
{
  self->_recognitionLanguageWithMultipleOutputVoicesExists = a3;
  *(_WORD *)&self->_mutationFlags |= 0x801u;
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
  objc_storeStrong((id *)&self->_base, 0);
}

@end
