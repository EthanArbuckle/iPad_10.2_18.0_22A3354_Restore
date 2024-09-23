@implementation HFSiriLanguageOption

- (HFSiriLanguageOption)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithRecognitionLanguage_outputLanguage_outputGender_voiceName_defaultVoiceForRecognitionLanguage_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSiriLanguageOption.m"), 34, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFSiriLanguageOption init]",
    v5);

  return 0;
}

- (HFSiriLanguageOption)initWithRecognitionLanguage:(id)a3 outputVoice:(id)a4 defaultVoiceForRecognitionLanguage:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  HFSiriLanguageOption *v13;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "languageCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "gender");
  objc_msgSend(v8, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HFSiriLanguageOption initWithRecognitionLanguage:outputLanguage:outputGender:voiceName:defaultVoiceForRecognitionLanguage:](self, "initWithRecognitionLanguage:outputLanguage:outputGender:voiceName:defaultVoiceForRecognitionLanguage:", v9, v10, v11, v12, v5);
  return v13;
}

- (HFSiriLanguageOption)initWithRecognitionLanguage:(id)a3 outputLanguage:(id)a4 outputGender:(int64_t)a5 voiceName:(id)a6 defaultVoiceForRecognitionLanguage:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  HFSiriLanguageOption *v19;
  uint64_t v20;
  NSString *recognitionLanguage;
  uint64_t v22;
  NSString *outputLanguage;
  void *v25;
  void *v26;
  objc_super v27;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSiriLanguageOption.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputLanguage"));

    if (!v15)
      goto LABEL_7;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSiriLanguageOption.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recognitionLanguage"));

  if (!v14)
    goto LABEL_11;
LABEL_3:
  if (!v15)
    goto LABEL_7;
LABEL_4:
  objc_msgSend(MEMORY[0x1E0CFE900], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "voiceNamesForOutputLanguageCode:gender:", v14, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "isEqualToString:", v15))
  {

    v15 = 0;
  }

LABEL_7:
  v27.receiver = self;
  v27.super_class = (Class)HFSiriLanguageOption;
  v19 = -[HFSiriLanguageOption init](&v27, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v13, "copy");
    recognitionLanguage = v19->_recognitionLanguage;
    v19->_recognitionLanguage = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    outputLanguage = v19->_outputLanguage;
    v19->_outputLanguage = (NSString *)v22;

    v19->_outputGender = a5;
    v19->_defaultVoiceForRecognitionLanguage = a7;
    objc_storeStrong((id *)&v19->_serializableVoiceName, v15);
  }

  return v19;
}

- (HFSiriLanguageOption)initWithHomeKitSettingLanguageValue:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  HFSiriLanguageOption *v11;

  v5 = a3;
  +[HFUtilities voiceInfoFromSettingLanguageValue:](HFUtilities, "voiceInfoFromSettingLanguageValue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputLanguageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputVoiceLanguageCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "gender");
  objc_msgSend(v6, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HFSiriLanguageOption initWithRecognitionLanguage:outputLanguage:outputGender:voiceName:defaultVoiceForRecognitionLanguage:](self, "initWithRecognitionLanguage:outputLanguage:outputGender:voiceName:defaultVoiceForRecognitionLanguage:", v7, v8, v9, v10, 1);

  if (v11)
    objc_storeStrong((id *)&v11->_settingLanguageValue, a3);

  return v11;
}

- (HFSiriLanguageOption)initWithSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  HFSiriLanguageOption *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[5];
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") > 3)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __57__HFSiriLanguageOption_initWithSerializedRepresentation___block_invoke;
    v15[3] = &unk_1EA7324A0;
    v9 = v5;
    v15[4] = v9;
    v10 = __57__HFSiriLanguageOption_initWithSerializedRepresentation___block_invoke((uint64_t)v15);
    objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("d"));

    v13 = 0;
    if ((unint64_t)objc_msgSend(v9, "count") >= 5)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    self = -[HFSiriLanguageOption initWithRecognitionLanguage:outputLanguage:outputGender:voiceName:defaultVoiceForRecognitionLanguage:](self, "initWithRecognitionLanguage:outputLanguage:outputGender:voiceName:defaultVoiceForRecognitionLanguage:", v6, v8, v10, v13, v12);

    v7 = self;
  }
  else
  {
    HFLogForCategory(0x39uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v4;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "Unexpected Siri language format %@", buf, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

uint64_t __57__HFSiriLanguageOption_initWithSerializedRepresentation___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("m")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("f")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("n")) & 1) != 0)
  {
    v2 = 3;
  }
  else
  {
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("?")) & 1) == 0)
      NSLog(CFSTR("Unknown gender option %@"), v1);
    v2 = 0;
  }

  return v2;
}

- (id)serializedRepresentation
{
  unint64_t v3;
  const __CFString *v4;
  _BOOL4 v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v3 = -[HFSiriLanguageOption outputGender](self, "outputGender") - 1;
  if (v3 > 2)
    v4 = CFSTR("?");
  else
    v4 = off_1EA740298[v3];
  v5 = -[HFSiriLanguageOption isDefaultVoiceForRecognitionLanguage](self, "isDefaultVoiceForRecognitionLanguage");
  v6 = CFSTR("n");
  if (v5)
    v6 = CFSTR("d");
  v7 = v6;
  v8 = (void *)MEMORY[0x1E0C99DE8];
  -[HFSiriLanguageOption recognitionLanguage](self, "recognitionLanguage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  -[HFSiriLanguageOption outputLanguage](self, "outputLanguage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  v15[2] = v4;
  v15[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_serializableVoiceName)
    objc_msgSend(v12, "addObject:");
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR(","));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)allSerializedRepresentations
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
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
  void *v26;
  void *v27;
  _QWORD v29[4];
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = -[HFSiriLanguageOption outputGender](self, "outputGender") - 1;
  if (v4 > 2)
    v5 = CFSTR("?");
  else
    v5 = off_1EA740298[v4];
  if (-[HFSiriLanguageOption isDefaultVoiceForRecognitionLanguage](self, "isDefaultVoiceForRecognitionLanguage"))
    v6 = CFSTR("d");
  else
    v6 = CFSTR("n");
  v7 = v6;
  if (-[HFSiriLanguageOption isDefaultVoiceForRecognitionLanguage](self, "isDefaultVoiceForRecognitionLanguage"))
    v8 = CFSTR("n");
  else
    v8 = CFSTR("d");
  v9 = v8;
  v10 = (void *)MEMORY[0x1E0C99DE8];
  -[HFSiriLanguageOption recognitionLanguage](self, "recognitionLanguage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v11;
  -[HFSiriLanguageOption outputLanguage](self, "outputLanguage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v12;
  v30[2] = v5;
  v30[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C99DE8];
  -[HFSiriLanguageOption recognitionLanguage](self, "recognitionLanguage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v16;
  -[HFSiriLanguageOption outputLanguage](self, "outputLanguage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v17;
  v29[2] = v5;
  v29[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_serializableVoiceName)
  {
    objc_msgSend(v14, "addObject:");
    objc_msgSend(v19, "addObject:", self->_serializableVoiceName);
LABEL_14:
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR(","));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v25);

    objc_msgSend(v19, "componentsJoinedByString:", CFSTR(","));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v26);

    goto LABEL_15;
  }
  objc_msgSend(v14, "componentsJoinedByString:", CFSTR(","));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v20);

  objc_msgSend(v19, "componentsJoinedByString:", CFSTR(","));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  -[HFSiriLanguageOption voiceName](self, "voiceName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[HFSiriLanguageOption voiceName](self, "voiceName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v23);

    -[HFSiriLanguageOption voiceName](self, "voiceName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v24);

    goto LABEL_14;
  }
LABEL_15:
  v27 = (void *)objc_msgSend(v3, "copy");

  return v27;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_324 != -1)
    dispatch_once(&_MergedGlobals_324, &__block_literal_global_37_6);
  return (NAIdentity *)(id)qword_1ED379E50;
}

void __35__HFSiriLanguageOption_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_42_7);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_43_4);
  v3 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_44_8);
  v4 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_46_9);
  v5 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_47_5);
  objc_msgSend(v0, "build");
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)qword_1ED379E50;
  qword_1ED379E50 = v6;

}

uint64_t __35__HFSiriLanguageOption_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recognitionLanguage");
}

uint64_t __35__HFSiriLanguageOption_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "outputLanguage");
}

uint64_t __35__HFSiriLanguageOption_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "outputGender"));
}

uint64_t __35__HFSiriLanguageOption_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "isDefaultVoiceForRecognitionLanguage"));
}

uint64_t __35__HFSiriLanguageOption_na_identity__block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializableVoiceName");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSiriLanguageOption recognitionLanguage](self, "recognitionLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("recognitionLanguage"));

  -[HFSiriLanguageOption outputLanguage](self, "outputLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("outputLanguage"));

  v6 = -[HFSiriLanguageOption outputGender](self, "outputGender") - 1;
  if (v6 > 2)
    v7 = CFSTR("Any");
  else
    v7 = off_1EA7402B0[v6];
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("outputGender"));
  -[HFSiriLanguageOption serializableVoiceName](self, "serializableVoiceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend((id)HFSiriLanguageOptionSerializableVoiceName, "copy");
  objc_msgSend(v3, "appendString:withName:", v8, v9);

  -[HFSiriLanguageOption voiceName](self, "voiceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend((id)HFSiriLanguageOptionVoiceName, "copy");
  objc_msgSend(v3, "appendString:withName:", v10, v11);

  v12 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFSiriLanguageOption isDefaultVoiceForRecognitionLanguage](self, "isDefaultVoiceForRecognitionLanguage"), CFSTR("defaultVoice"));
  objc_msgSend(v3, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (NSString)localizedRecognitionLanguage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CFE900], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSiriLanguageOption recognitionLanguage](self, "recognitionLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedNameForSiriLanguage:inDisplayLanguage:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFSiriRecognitionLanguageUnknownName"), CFSTR("HFSiriRecognitionLanguageUnknownName"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      -[HFSiriLanguageOption recognitionLanguage](self, "recognitionLanguage");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ (%@)"), v6, v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      v5 = (void *)v8;
    }
    else
    {
      v9 = v6;
    }

    v5 = v9;
  }
  return (NSString *)v5;
}

- (NSString)localizedOutputVoice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  -[HFSiriLanguageOption voiceNameWithDefaultFallback](self, "voiceNameWithDefaultFallback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CFE900], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSiriLanguageOption outputLanguage](self, "outputLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputVoiceDescriptorForOutputLanguageCode:voiceName:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedDisplayWithRegion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "length"))
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFSiriOutputVoiceUnknownName"), CFSTR("HFSiriOutputVoiceUnknownName"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      -[HFSiriLanguageOption voiceName](self, "voiceName");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ (%@, %@)"), v8, v10, v3);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
    else
    {
      v11 = v8;
    }

    v7 = v11;
  }

  return (NSString *)v7;
}

- (NSString)localizedOutputVoiceAccent
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CFE900], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSiriLanguageOption outputVoice](self, "outputVoice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedNameOfOutputVoice:inDisplayLanguage:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)outputVoice
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[HFSiriLanguageOption voiceNameWithDefaultFallback](self, "voiceNameWithDefaultFallback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CFEAC0]);
  -[HFSiriLanguageOption outputLanguage](self, "outputLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithLanguageCode:gender:isCustom:name:footprint:contentVersion:masteredVersion:", v5, -[HFSiriLanguageOption outputGender](self, "outputGender"), 0, v3, 0, 0, 0);

  return v6;
}

- (NSString)localizedOutputVoiceColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HFSiriLanguageOption voiceNameWithDefaultFallback](self, "voiceNameWithDefaultFallback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CFE900], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSiriLanguageOption outputLanguage](self, "outputLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputVoiceDescriptorForOutputLanguageCode:voiceName:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedDisplay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)voiceNameWithDefaultFallback
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = self->_serializableVoiceName;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CFE900], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSiriLanguageOption outputLanguage](self, "outputLanguage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceNamesForOutputLanguageCode:gender:", v5, -[HFSiriLanguageOption outputGender](self, "outputGender"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSString)recognitionLanguage
{
  return self->_recognitionLanguage;
}

- (NSString)outputLanguage
{
  return self->_outputLanguage;
}

- (int64_t)outputGender
{
  return self->_outputGender;
}

- (BOOL)isDefaultVoiceForRecognitionLanguage
{
  return self->_defaultVoiceForRecognitionLanguage;
}

- (HMSettingLanguageValue)settingLanguageValue
{
  return self->_settingLanguageValue;
}

- (void)setSettingLanguageValue:(id)a3
{
  objc_storeStrong((id *)&self->_settingLanguageValue, a3);
}

- (NSString)serializableVoiceName
{
  return self->_serializableVoiceName;
}

- (void)setSerializableVoiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serializableVoiceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializableVoiceName, 0);
  objc_storeStrong((id *)&self->_settingLanguageValue, 0);
  objc_storeStrong((id *)&self->_outputLanguage, 0);
  objc_storeStrong((id *)&self->_recognitionLanguage, 0);
}

@end
