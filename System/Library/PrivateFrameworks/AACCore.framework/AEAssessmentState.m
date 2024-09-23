@implementation AEAssessmentState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
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
  id v18;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithBool:", -[AEAssessmentState isEnabled](self, "isEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("enabled"));

  -[AEAssessmentState configurationsByApplicationDescriptor](self, "configurationsByApplicationDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("configurationsByApplicationDescriptor"));

  -[AEAssessmentState mainIndividualConfiguration](self, "mainIndividualConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("mainIndividualConfiguration"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentState allowsAutoCorrection](self, "allowsAutoCorrection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("allowsAutoCorrection"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentState allowsSmartPunctuation](self, "allowsSmartPunctuation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("allowsSmartPunctuation"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentState allowsSpellCheck](self, "allowsSpellCheck"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("allowsSpellCheck"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentState allowsPredictiveKeyboard](self, "allowsPredictiveKeyboard"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("allowsPredictiveKeyboard"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentState allowsActivityContinuation](self, "allowsActivityContinuation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("allowsActivityContinuation"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentState allowsDictation](self, "allowsDictation"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v14, CFSTR("allowsDictation"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentState allowsAccessibilitySpeech](self, "allowsAccessibilitySpeech"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v15, CFSTR("allowsAccessibilitySpeech"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentState allowsPasswordAutoFill](self, "allowsPasswordAutoFill"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v16, CFSTR("allowsPasswordAutoFill"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentState allowsContinuousPathKeyboard](self, "allowsContinuousPathKeyboard"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v17, CFSTR("allowsContinuousPathKeyboard"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentState allowsKeyboardShortcuts](self, "allowsKeyboardShortcuts"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v18, CFSTR("allowsKeyboardShortcuts"));

}

- (AEAssessmentState)initWithCoder:(id)a3
{
  id v4;
  AEAssessmentState *v5;
  void *v6;
  uint64_t v7;
  AEAssessmentIndividualConfiguration *mainIndividualConfiguration;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDictionary *configurationsByApplicationDescriptor;
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
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AEAssessmentState;
  v5 = -[AEAssessmentState init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_enabled = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mainIndividualConfiguration"));
    v7 = objc_claimAutoreleasedReturnValue();
    mainIndividualConfiguration = v5->_mainIndividualConfiguration;
    v5->_mainIndividualConfiguration = (AEAssessmentIndividualConfiguration *)v7;

    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("configurationsByApplicationDescriptor"));
    v13 = objc_claimAutoreleasedReturnValue();
    configurationsByApplicationDescriptor = v5->_configurationsByApplicationDescriptor;
    v5->_configurationsByApplicationDescriptor = (NSDictionary *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowsAutoCorrection"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsAutoCorrection = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowsSmartPunctuation"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsSmartPunctuation = objc_msgSend(v16, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowsSpellCheck"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsSpellCheck = objc_msgSend(v17, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowsPredictiveKeyboard"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsPredictiveKeyboard = objc_msgSend(v18, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowsActivityContinuation"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsActivityContinuation = objc_msgSend(v19, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowsDictation"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsDictation = objc_msgSend(v20, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowsAccessibilitySpeech"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsAccessibilitySpeech = objc_msgSend(v21, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowsPasswordAutoFill"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsPasswordAutoFill = objc_msgSend(v22, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowsContinuousPathKeyboard"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsContinuousPathKeyboard = objc_msgSend(v23, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowsKeyboardShortcuts"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsKeyboardShortcuts = objc_msgSend(v24, "BOOLValue");

  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
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
  unint64_t v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentState isEnabled](self, "isEnabled"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v29, "hash");
  -[AEAssessmentState mainIndividualConfiguration](self, "mainIndividualConfiguration");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v28, "hash");
  -[AEAssessmentState configurationsByApplicationDescriptor](self, "configurationsByApplicationDescriptor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v27, "hash") ^ v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentState allowsAutoCorrection](self, "allowsAutoCorrection"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v26, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentState allowsSmartPunctuation](self, "allowsSmartPunctuation"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ v6 ^ objc_msgSend(v25, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentState allowsSpellCheck](self, "allowsSpellCheck"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v24, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentState allowsPredictiveKeyboard](self, "allowsPredictiveKeyboard"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentState allowsActivityContinuation](self, "allowsActivityContinuation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7 ^ v10 ^ objc_msgSend(v11, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentState allowsDictation](self, "allowsDictation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentState allowsAccessibilitySpeech](self, "allowsAccessibilitySpeech"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentState allowsPasswordAutoFill](self, "allowsPasswordAutoFill"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentState allowsContinuousPathKeyboard](self, "allowsContinuousPathKeyboard"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v12 ^ v18 ^ objc_msgSend(v19, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AEAssessmentState allowsKeyboardShortcuts](self, "allowsKeyboardShortcuts"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  AEAssessmentState *v4;
  AEAssessmentState *v5;
  unsigned __int8 v6;

  v4 = (AEAssessmentState *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[AEAssessmentState isEqualToState:](self, v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (void)isEqualToState:(void *)a1
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v23;
  void *v24;
  int v25;
  void *v26;

  v8 = a2;
  if (!a1)
    goto LABEL_35;
  v9 = objc_msgSend(a1, "isEnabled");
  if (v9 != objc_msgSend(v8, "isEnabled"))
  {
    a1 = 0;
    goto LABEL_35;
  }
  objc_msgSend(a1, "mainIndividualConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    || (objc_msgSend(v8, "mainIndividualConfiguration"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(a1, "mainIndividualConfiguration");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mainIndividualConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "isEqual:", v3) & 1) == 0)
    {

      a1 = 0;
      goto LABEL_32;
    }
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(a1, "configurationsByApplicationDescriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    || (objc_msgSend(v8, "configurationsByApplicationDescriptor"),
        (v24 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(a1, "configurationsByApplicationDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationsByApplicationDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqual:", v6) & 1) == 0)
    {

      a1 = 0;
      if (v12)
        goto LABEL_30;
LABEL_15:

      if ((v11 & 1) == 0)
        goto LABEL_32;
      goto LABEL_31;
    }
    v26 = v4;
    v25 = 1;
  }
  else
  {
    v26 = v4;
    v24 = 0;
    v25 = 0;
  }
  v13 = objc_msgSend(a1, "allowsAutoCorrection");
  if (v13 != objc_msgSend(v8, "allowsAutoCorrection"))
    goto LABEL_27;
  v14 = objc_msgSend(a1, "allowsSmartPunctuation");
  if (v14 != objc_msgSend(v8, "allowsSmartPunctuation")
    || (v15 = objc_msgSend(a1, "allowsSpellCheck"), v15 != objc_msgSend(v8, "allowsSpellCheck"))
    || (v16 = objc_msgSend(a1, "allowsPredictiveKeyboard"),
        v16 != objc_msgSend(v8, "allowsPredictiveKeyboard"))
    || (v17 = objc_msgSend(a1, "allowsActivityContinuation"),
        v17 != objc_msgSend(v8, "allowsActivityContinuation"))
    || (v18 = objc_msgSend(a1, "allowsDictation"), v18 != objc_msgSend(v8, "allowsDictation"))
    || (v19 = objc_msgSend(a1, "allowsAccessibilitySpeech"),
        v19 != objc_msgSend(v8, "allowsAccessibilitySpeech"))
    || (v20 = objc_msgSend(a1, "allowsPasswordAutoFill"), v20 != objc_msgSend(v8, "allowsPasswordAutoFill"))|| (v21 = objc_msgSend(a1, "allowsContinuousPathKeyboard"), v21 != objc_msgSend(v8, "allowsContinuousPathKeyboard")))
  {
LABEL_27:
    a1 = 0;
    if (!v25)
      goto LABEL_29;
    goto LABEL_28;
  }
  v23 = objc_msgSend(a1, "allowsKeyboardShortcuts");
  a1 = (void *)(v23 ^ objc_msgSend(v8, "allowsKeyboardShortcuts") ^ 1);
  if ((v25 & 1) != 0)
  {
LABEL_28:

  }
LABEL_29:
  v4 = v26;
  if (!v12)
    goto LABEL_15;
LABEL_30:

  if (v11)
  {
LABEL_31:

  }
LABEL_32:
  if (!v10)

LABEL_35:
  return a1;
}

- (id)description
{
  const __CFString *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;

  v23 = (void *)MEMORY[0x24BDD17C8];
  v22 = objc_opt_class();
  if (-[AEAssessmentState isEnabled](self, "isEnabled"))
    v3 = CFSTR("Yes");
  else
    v3 = CFSTR("No");
  v21 = v3;
  -[AEAssessmentState mainIndividualConfiguration](self, "mainIndividualConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEAssessmentState configurationsByApplicationDescriptor](self, "configurationsByApplicationDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AEAssessmentState allowsAutoCorrection](self, "allowsAutoCorrection"))
    v5 = CFSTR("Yes");
  else
    v5 = CFSTR("No");
  v19 = v5;
  if (-[AEAssessmentState allowsSmartPunctuation](self, "allowsSmartPunctuation"))
    v6 = CFSTR("Yes");
  else
    v6 = CFSTR("No");
  v18 = v6;
  if (-[AEAssessmentState allowsSpellCheck](self, "allowsSpellCheck"))
    v7 = CFSTR("Yes");
  else
    v7 = CFSTR("No");
  v17 = v7;
  if (-[AEAssessmentState allowsPredictiveKeyboard](self, "allowsPredictiveKeyboard"))
    v8 = CFSTR("Yes");
  else
    v8 = CFSTR("No");
  if (-[AEAssessmentState allowsActivityContinuation](self, "allowsActivityContinuation"))
    v9 = CFSTR("Yes");
  else
    v9 = CFSTR("No");
  if (-[AEAssessmentState allowsDictation](self, "allowsDictation"))
    v10 = CFSTR("Yes");
  else
    v10 = CFSTR("No");
  if (-[AEAssessmentState allowsAccessibilitySpeech](self, "allowsAccessibilitySpeech"))
    v11 = CFSTR("Yes");
  else
    v11 = CFSTR("No");
  if (-[AEAssessmentState allowsPasswordAutoFill](self, "allowsPasswordAutoFill"))
    v12 = CFSTR("Yes");
  else
    v12 = CFSTR("No");
  if (-[AEAssessmentState allowsContinuousPathKeyboard](self, "allowsContinuousPathKeyboard"))
    v13 = CFSTR("Yes");
  else
    v13 = CFSTR("No");
  if (-[AEAssessmentState allowsKeyboardShortcuts](self, "allowsKeyboardShortcuts"))
    v14 = CFSTR("Yes");
  else
    v14 = CFSTR("No");
  objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@: %p { isEnabled = %@, mainIndividualConfiguration = %@, configurationsByApplicationDescriptor = %@, allowsAutoCorrection = %@, allowsSmartPunctuation = %@, allowsSpellCheck = %@, allowsPredictiveKeyboard = %@, allowsActivityContinuation = %@, allowsDictation = %@, allowsAccessibilitySpeech = %@, allowsPasswordAutoFill = %@, allowsContinuousPathKeyboard = %@, allowsKeyboardShortcuts = %@}>"), v22, self, v21, v20, v4, v19, v18, v17, v8, v9, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setEnabled:", -[AEAssessmentState isEnabled](self, "isEnabled"));
  -[AEAssessmentState configurationsByApplicationDescriptor](self, "configurationsByApplicationDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConfigurationsByApplicationDescriptor:", v5);

  -[AEAssessmentState mainIndividualConfiguration](self, "mainIndividualConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMainIndividualConfiguration:", v6);

  objc_msgSend(v4, "setAllowsAutoCorrection:", -[AEAssessmentState allowsAutoCorrection](self, "allowsAutoCorrection"));
  objc_msgSend(v4, "setAllowsSmartPunctuation:", -[AEAssessmentState allowsSmartPunctuation](self, "allowsSmartPunctuation"));
  objc_msgSend(v4, "setAllowsSpellCheck:", -[AEAssessmentState allowsSpellCheck](self, "allowsSpellCheck"));
  objc_msgSend(v4, "setAllowsPredictiveKeyboard:", -[AEAssessmentState allowsPredictiveKeyboard](self, "allowsPredictiveKeyboard"));
  objc_msgSend(v4, "setAllowsActivityContinuation:", -[AEAssessmentState allowsActivityContinuation](self, "allowsActivityContinuation"));
  objc_msgSend(v4, "setAllowsDictation:", -[AEAssessmentState allowsDictation](self, "allowsDictation"));
  objc_msgSend(v4, "setAllowsAccessibilitySpeech:", -[AEAssessmentState allowsAccessibilitySpeech](self, "allowsAccessibilitySpeech"));
  objc_msgSend(v4, "setAllowsPasswordAutoFill:", -[AEAssessmentState allowsPasswordAutoFill](self, "allowsPasswordAutoFill"));
  objc_msgSend(v4, "setAllowsContinuousPathKeyboard:", -[AEAssessmentState allowsContinuousPathKeyboard](self, "allowsContinuousPathKeyboard"));
  objc_msgSend(v4, "setAllowsKeyboardShortcuts:", -[AEAssessmentState allowsKeyboardShortcuts](self, "allowsKeyboardShortcuts"));
  return v4;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (AEAssessmentIndividualConfiguration)mainIndividualConfiguration
{
  return self->_mainIndividualConfiguration;
}

- (void)setMainIndividualConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_mainIndividualConfiguration, a3);
}

- (NSDictionary)configurationsByApplicationDescriptor
{
  return self->_configurationsByApplicationDescriptor;
}

- (void)setConfigurationsByApplicationDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)allowsAutoCorrection
{
  return self->_allowsAutoCorrection;
}

- (void)setAllowsAutoCorrection:(BOOL)a3
{
  self->_allowsAutoCorrection = a3;
}

- (BOOL)allowsSmartPunctuation
{
  return self->_allowsSmartPunctuation;
}

- (void)setAllowsSmartPunctuation:(BOOL)a3
{
  self->_allowsSmartPunctuation = a3;
}

- (BOOL)allowsSpellCheck
{
  return self->_allowsSpellCheck;
}

- (void)setAllowsSpellCheck:(BOOL)a3
{
  self->_allowsSpellCheck = a3;
}

- (BOOL)allowsPredictiveKeyboard
{
  return self->_allowsPredictiveKeyboard;
}

- (void)setAllowsPredictiveKeyboard:(BOOL)a3
{
  self->_allowsPredictiveKeyboard = a3;
}

- (BOOL)allowsKeyboardShortcuts
{
  return self->_allowsKeyboardShortcuts;
}

- (void)setAllowsKeyboardShortcuts:(BOOL)a3
{
  self->_allowsKeyboardShortcuts = a3;
}

- (BOOL)allowsActivityContinuation
{
  return self->_allowsActivityContinuation;
}

- (void)setAllowsActivityContinuation:(BOOL)a3
{
  self->_allowsActivityContinuation = a3;
}

- (BOOL)allowsDictation
{
  return self->_allowsDictation;
}

- (void)setAllowsDictation:(BOOL)a3
{
  self->_allowsDictation = a3;
}

- (BOOL)allowsAccessibilitySpeech
{
  return self->_allowsAccessibilitySpeech;
}

- (void)setAllowsAccessibilitySpeech:(BOOL)a3
{
  self->_allowsAccessibilitySpeech = a3;
}

- (BOOL)allowsPasswordAutoFill
{
  return self->_allowsPasswordAutoFill;
}

- (void)setAllowsPasswordAutoFill:(BOOL)a3
{
  self->_allowsPasswordAutoFill = a3;
}

- (BOOL)allowsContinuousPathKeyboard
{
  return self->_allowsContinuousPathKeyboard;
}

- (void)setAllowsContinuousPathKeyboard:(BOOL)a3
{
  self->_allowsContinuousPathKeyboard = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationsByApplicationDescriptor, 0);
  objc_storeStrong((id *)&self->_mainIndividualConfiguration, 0);
}

@end
