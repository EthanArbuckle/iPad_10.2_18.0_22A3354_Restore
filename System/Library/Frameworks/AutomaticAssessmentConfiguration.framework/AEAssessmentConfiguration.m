@implementation AEAssessmentConfiguration

- (AEAssessmentConfiguration)init
{
  AEAssessmentConfiguration *v2;
  uint64_t v3;
  AEAssessmentParticipantConfiguration *mainParticipantConfiguration;
  uint64_t v5;
  NSMutableDictionary *backingConfiguratonsByApplication;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AEAssessmentConfiguration;
  v2 = -[AEAssessmentConfiguration init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    mainParticipantConfiguration = v2->_mainParticipantConfiguration;
    v2->_mainParticipantConfiguration = (AEAssessmentParticipantConfiguration *)v3;

    v5 = objc_opt_new();
    backingConfiguratonsByApplication = v2->_backingConfiguratonsByApplication;
    v2->_backingConfiguratonsByApplication = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (NSDictionary)configurationsByApplication
{
  if (self)
    self = (AEAssessmentConfiguration *)self->_backingConfiguratonsByApplication;
  return (NSDictionary *)(id)-[AEAssessmentConfiguration copy](self, "copy");
}

- (void)setConfiguration:(AEAssessmentParticipantConfiguration *)configuration forApplication:(AEAssessmentApplication *)application
{
  AEAssessmentApplication *v6;
  uint64_t v7;
  NSMutableDictionary *backingConfiguratonsByApplication;
  id v9;

  v6 = application;
  v7 = -[AEAssessmentParticipantConfiguration copy](configuration, "copy");
  if (self)
    backingConfiguratonsByApplication = self->_backingConfiguratonsByApplication;
  else
    backingConfiguratonsByApplication = 0;
  v9 = (id)v7;
  -[NSMutableDictionary setObject:forKeyedSubscript:](backingConfiguratonsByApplication, "setObject:forKeyedSubscript:", v7, v6);

}

- (void)removeApplication:(AEAssessmentApplication *)application
{
  if (self)
    self = (AEAssessmentConfiguration *)self->_backingConfiguratonsByApplication;
  -[AEAssessmentConfiguration setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", 0, application);
}

- (id)configurationWrapper
{
  void *v3;
  void *v4;
  NSMutableDictionary *backingConfiguratonsByApplication;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  if (self)
    backingConfiguratonsByApplication = self->_backingConfiguratonsByApplication;
  else
    backingConfiguratonsByApplication = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__AEAssessmentConfiguration_configurationWrapper__block_invoke;
  v9[3] = &unk_24F4E0828;
  v9[4] = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](backingConfiguratonsByApplication, "enumerateKeysAndObjectsUsingBlock:", v9);
  -[AEAssessmentConfiguration mainParticipantConfiguration](self, "mainParticipantConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "individualConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMainIndividualConfiguration:", v7);

  objc_msgSend(v3, "setConfigurationsByApplicationDescriptor:", v4);
  objc_msgSend(v3, "setAllowsAutoCorrection:", self->_autocorrectMode & 1);
  objc_msgSend(v3, "setAllowsSmartPunctuation:", (self->_autocorrectMode >> 1) & 1);
  objc_msgSend(v3, "setAllowsSpellCheck:", self->_allowsSpellCheck);
  objc_msgSend(v3, "setAllowsPredictiveKeyboard:", self->_allowsPredictiveKeyboard);
  objc_msgSend(v3, "setAllowsKeyboardShortcuts:", self->_allowsKeyboardShortcuts);
  objc_msgSend(v3, "setAllowsActivityContinuation:", self->_allowsActivityContinuation);
  objc_msgSend(v3, "setAllowsDictation:", self->_allowsDictation);
  objc_msgSend(v3, "setAllowsAccessibilitySpeech:", self->_allowsAccessibilitySpeech);
  objc_msgSend(v3, "setAllowsPasswordAutoFill:", self->_allowsPasswordAutoFill);
  objc_msgSend(v3, "setAllowsContinuousPathKeyboard:", self->_allowsContinuousPathKeyboard);

  return v3;
}

void __49__AEAssessmentConfiguration_configurationWrapper__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_msgSend(a3, "individualConfiguration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "applicationDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);
}

+ (id)configurationFromWrapper:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  char v12;
  _QWORD v14[5];

  v3 = a3;
  v4 = objc_opt_new();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v3, "configurationsByApplicationDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __54__AEAssessmentConfiguration_configurationFromWrapper___block_invoke;
  v14[3] = &unk_24F4E0850;
  v14[4] = v5;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v14);

  v7 = (void *)objc_msgSend(v5, "mutableCopy");
  -[AEAssessmentConfiguration setBackingConfiguratonsByApplication:](v4, v7);

  objc_msgSend(v3, "mainIndividualConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AEAssessmentParticipantConfiguration instanceFromIndividualConfiguration:](AEAssessmentParticipantConfiguration, "instanceFromIndividualConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEAssessmentConfiguration setMainParticipantConfiguration:](v4, v9);

  *(_QWORD *)(v4 + 16) |= objc_msgSend(v3, "allowsAutoCorrection");
  v10 = objc_msgSend(v3, "allowsSmartPunctuation");
  v11 = 2;
  if (!v10)
    v11 = 0;
  *(_QWORD *)(v4 + 16) |= v11;
  *(_BYTE *)(v4 + 8) = objc_msgSend(v3, "allowsSpellCheck");
  *(_BYTE *)(v4 + 9) = objc_msgSend(v3, "allowsPredictiveKeyboard");
  *(_BYTE *)(v4 + 10) = objc_msgSend(v3, "allowsKeyboardShortcuts");
  *(_BYTE *)(v4 + 11) = objc_msgSend(v3, "allowsActivityContinuation");
  *(_BYTE *)(v4 + 12) = objc_msgSend(v3, "allowsDictation");
  *(_BYTE *)(v4 + 13) = objc_msgSend(v3, "allowsAccessibilitySpeech");
  *(_BYTE *)(v4 + 14) = objc_msgSend(v3, "allowsPasswordAutoFill");
  v12 = objc_msgSend(v3, "allowsContinuousPathKeyboard");

  *(_BYTE *)(v4 + 15) = v12;
  return (id)v4;
}

void __54__AEAssessmentConfiguration_configurationFromWrapper___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  +[AEAssessmentApplication instanceFromApplicationDescriptor:](AEAssessmentApplication, "instanceFromApplicationDescriptor:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[AEAssessmentParticipantConfiguration instanceFromIndividualConfiguration:](AEAssessmentParticipantConfiguration, "instanceFromIndividualConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setBackingConfiguratonsByApplication:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setMainParticipantConfiguration:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  AEAssessmentConfiguration *v4;
  NSMutableDictionary *backingConfiguratonsByApplication;
  void *v6;
  void *v7;

  v4 = -[AEAssessmentConfiguration init](+[AEAssessmentConfiguration allocWithZone:](AEAssessmentConfiguration, "allocWithZone:", a3), "init");
  if (self)
    backingConfiguratonsByApplication = self->_backingConfiguratonsByApplication;
  else
    backingConfiguratonsByApplication = 0;
  v6 = (void *)-[NSMutableDictionary mutableCopy](backingConfiguratonsByApplication, "mutableCopy");
  -[AEAssessmentConfiguration setBackingConfiguratonsByApplication:]((uint64_t)v4, v6);

  -[AEAssessmentConfiguration mainParticipantConfiguration](self, "mainParticipantConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEAssessmentConfiguration setMainParticipantConfiguration:]((uint64_t)v4, v7);

  v4->_autocorrectMode = self->_autocorrectMode;
  v4->_allowsSpellCheck = self->_allowsSpellCheck;
  v4->_allowsPredictiveKeyboard = self->_allowsPredictiveKeyboard;
  v4->_allowsKeyboardShortcuts = self->_allowsKeyboardShortcuts;
  v4->_allowsActivityContinuation = self->_allowsActivityContinuation;
  v4->_allowsDictation = self->_allowsDictation;
  v4->_allowsAccessibilitySpeech = self->_allowsAccessibilitySpeech;
  v4->_allowsPasswordAutoFill = self->_allowsPasswordAutoFill;
  v4->_allowsContinuousPathKeyboard = self->_allowsContinuousPathKeyboard;
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_autocorrectMode);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v24, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowsSpellCheck);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v23, "hash") ^ v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowsPredictiveKeyboard);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v22, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowsKeyboardShortcuts);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 ^ v5 ^ objc_msgSend(v6, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowsActivityContinuation);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowsDictation);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowsAccessibilitySpeech);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7 ^ v11 ^ objc_msgSend(v12, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowsPasswordAutoFill);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowsContinuousPathKeyboard);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[AEAssessmentConfiguration mainParticipantConfiguration](self, "mainParticipantConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17 ^ objc_msgSend(v18, "hash");
  v20 = v13 ^ v19 ^ -[NSMutableDictionary hash](self->_backingConfiguratonsByApplication, "hash");

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  AEAssessmentConfiguration *v4;
  AEAssessmentConfiguration *v5;
  char v6;

  v4 = (AEAssessmentConfiguration *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v6 = 1;
    goto LABEL_7;
  }
  if (-[AEAssessmentConfiguration isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    v6 = -[AEAssessmentConfiguration isEqualToConfiguration:]((uint64_t)self, v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (uint64_t)isEqualToConfiguration:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id *v7;
  id *v8;
  void *v9;
  char v10;
  id v12;
  void *v13;
  id v14;
  id v15;

  v7 = a2;
  v8 = v7;
  if (!a1)
    goto LABEL_16;
  if (*(id *)(a1 + 16) != v7[2]
    || *(unsigned __int8 *)(a1 + 8) != *((unsigned __int8 *)v7 + 8)
    || *(unsigned __int8 *)(a1 + 9) != *((unsigned __int8 *)v7 + 9)
    || *(unsigned __int8 *)(a1 + 10) != *((unsigned __int8 *)v7 + 10)
    || *(unsigned __int8 *)(a1 + 11) != *((unsigned __int8 *)v7 + 11)
    || *(unsigned __int8 *)(a1 + 12) != *((unsigned __int8 *)v7 + 12)
    || *(unsigned __int8 *)(a1 + 13) != *((unsigned __int8 *)v7 + 13)
    || *(unsigned __int8 *)(a1 + 14) != *((unsigned __int8 *)v7 + 14)
    || *(unsigned __int8 *)(a1 + 15) != *((unsigned __int8 *)v7 + 15))
  {
    a1 = 0;
    goto LABEL_16;
  }
  objc_msgSend((id)a1, "mainParticipantConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    || (objc_msgSend(v8, "mainParticipantConfiguration"), (v2 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend((id)a1, "mainParticipantConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mainParticipantConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqual:", v4))
    {

      a1 = 0;
      goto LABEL_24;
    }
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  v12 = *(id *)(a1 + 32);
  if (!v12)
  {
    v5 = v8[4];
    if (!v5)
    {
      a1 = 1;
      if ((v10 & 1) == 0)
        goto LABEL_24;
      goto LABEL_23;
    }
  }
  v13 = *(void **)(a1 + 32);
  v14 = v8[4];
  v15 = v13;
  a1 = objc_msgSend(v15, "isEqual:", v14);

  if (!v12)
  {

    if ((v10 & 1) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }

  if ((v10 & 1) != 0)
  {
LABEL_23:

  }
LABEL_24:
  if (!v9)

LABEL_16:
  return a1;
}

- (AEAutocorrectMode)autocorrectMode
{
  return self->_autocorrectMode;
}

- (void)setAutocorrectMode:(AEAutocorrectMode)autocorrectMode
{
  self->_autocorrectMode = autocorrectMode;
}

- (BOOL)allowsSpellCheck
{
  return self->_allowsSpellCheck;
}

- (void)setAllowsSpellCheck:(BOOL)allowsSpellCheck
{
  self->_allowsSpellCheck = allowsSpellCheck;
}

- (BOOL)allowsPredictiveKeyboard
{
  return self->_allowsPredictiveKeyboard;
}

- (void)setAllowsPredictiveKeyboard:(BOOL)allowsPredictiveKeyboard
{
  self->_allowsPredictiveKeyboard = allowsPredictiveKeyboard;
}

- (BOOL)allowsKeyboardShortcuts
{
  return self->_allowsKeyboardShortcuts;
}

- (void)setAllowsKeyboardShortcuts:(BOOL)allowsKeyboardShortcuts
{
  self->_allowsKeyboardShortcuts = allowsKeyboardShortcuts;
}

- (BOOL)allowsActivityContinuation
{
  return self->_allowsActivityContinuation;
}

- (void)setAllowsActivityContinuation:(BOOL)allowsActivityContinuation
{
  self->_allowsActivityContinuation = allowsActivityContinuation;
}

- (BOOL)allowsDictation
{
  return self->_allowsDictation;
}

- (void)setAllowsDictation:(BOOL)allowsDictation
{
  self->_allowsDictation = allowsDictation;
}

- (BOOL)allowsAccessibilitySpeech
{
  return self->_allowsAccessibilitySpeech;
}

- (void)setAllowsAccessibilitySpeech:(BOOL)allowsAccessibilitySpeech
{
  self->_allowsAccessibilitySpeech = allowsAccessibilitySpeech;
}

- (BOOL)allowsPasswordAutoFill
{
  return self->_allowsPasswordAutoFill;
}

- (void)setAllowsPasswordAutoFill:(BOOL)allowsPasswordAutoFill
{
  self->_allowsPasswordAutoFill = allowsPasswordAutoFill;
}

- (BOOL)allowsContinuousPathKeyboard
{
  return self->_allowsContinuousPathKeyboard;
}

- (void)setAllowsContinuousPathKeyboard:(BOOL)allowsContinuousPathKeyboard
{
  self->_allowsContinuousPathKeyboard = allowsContinuousPathKeyboard;
}

- (AEAssessmentParticipantConfiguration)mainParticipantConfiguration
{
  return self->_mainParticipantConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingConfiguratonsByApplication, 0);
  objc_storeStrong((id *)&self->_mainParticipantConfiguration, 0);
}

@end
