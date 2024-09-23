@implementation AFEnablementConfiguration

- (AFEnablementConfiguration)initWithRequiresVoiceSelection:(BOOL)a3 voiceSelectionAllowsChooseForMe:(BOOL)a4 voiceCountForRecognitionLanguage:(id)a5 completionLoggingBlock:(id)a6
{
  NSDictionary *v10;
  id v11;
  AFEnablementConfiguration *v12;
  AFEnablementConfiguration *v13;
  uint64_t v14;
  id completionLoggingBlock;
  objc_super v17;

  v10 = (NSDictionary *)a5;
  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AFEnablementConfiguration;
  v12 = -[AFEnablementConfiguration init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_requiresVoiceSelection = a3;
    v12->_voiceSelectionAllowsRandomSelection = a4;
    v14 = MEMORY[0x1A1AC0C3C](v11);
    completionLoggingBlock = v13->_completionLoggingBlock;
    v13->_completionLoggingBlock = (id)v14;

    v13->_voiceCountForRecognitionLanguage = v10;
  }

  return v13;
}

- (BOOL)requiresVoiceSelectionForRecognitionLanguage:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (v4 && self->_requiresVoiceSelection)
  {
    -[NSDictionary objectForKey:](self->_voiceCountForRecognitionLanguage, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (int)objc_msgSend(v5, "intValue") > 1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)voiceSelectionAllowsRandomSelection
{
  return self->_voiceSelectionAllowsRandomSelection;
}

- (id)completionLoggingBlock
{
  return self->_completionLoggingBlock;
}

- (BOOL)requiresVoiceSelection
{
  return self->_requiresVoiceSelection;
}

- (NSDictionary)voiceCountForRecognitionLanguage
{
  return self->_voiceCountForRecognitionLanguage;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionLoggingBlock, 0);
}

@end
