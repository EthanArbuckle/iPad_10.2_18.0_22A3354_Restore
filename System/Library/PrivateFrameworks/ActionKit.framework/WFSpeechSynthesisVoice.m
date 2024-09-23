@implementation WFSpeechSynthesisVoice

- (WFSpeechSynthesisVoice)initWithIdentifier:(id)a3
{
  id v6;
  WFSpeechSynthesisVoice *v7;
  WFSpeechSynthesisVoice *v8;
  WFSpeechSynthesisVoice *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSpeechSynthesisVoice.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFSpeechSynthesisVoice;
  v7 = -[WFSpeechSynthesisVoice init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_identifier, a3);
    v9 = v8;
  }

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSpeechSynthesisVoice identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSpeechSynthesisVoice vsVoiceName](self, "vsVoiceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSpeechSynthesisVoice avVoice](self, "avVoice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p %@> Identifier: %@, (VS voice name: %@ AV voice: %@)"), self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)name
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  -[WFSpeechSynthesisVoice avVoice](self, "avVoice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(getAXAlternativeVoicesClass(), "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSpeechSynthesisVoice identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isSiriVoiceIdentifier:", v6);

  if (v7)
  {
    -[WFSpeechSynthesisVoice identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nameForVoiceIdentifier:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }

  return (NSString *)v4;
}

- (NSString)languageCode
{
  void *v2;
  void *v3;

  -[WFSpeechSynthesisVoice avVoice](self, "avVoice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "language");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isSiriVoice
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(getAXAlternativeVoicesClass(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSpeechSynthesisVoice identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isSiriVoiceIdentifier:", v4);

  return v5;
}

- (AVSpeechSynthesisVoice)avVoice
{
  AVSpeechSynthesisVoice *avVoice;
  AVSpeechSynthesisVoice *v3;
  id AVSpeechSynthesisVoiceClass;
  void *v6;

  avVoice = self->_avVoice;
  if (avVoice)
  {
    v3 = avVoice;
  }
  else
  {
    AVSpeechSynthesisVoiceClass = getAVSpeechSynthesisVoiceClass();
    -[WFSpeechSynthesisVoice identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(AVSpeechSynthesisVoiceClass, "_voiceFromInternalVoiceListWithIdentifier:", v6);
    v3 = (AVSpeechSynthesisVoice *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSString)vsVoiceName
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  NSString *result;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  -[WFSpeechSynthesisVoice identifier](self, "identifier");
  v9 = 0;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v3 = getAXGetComponentsInSiriVoiceIdentifierSymbolLoc_ptr;
  v13 = getAXGetComponentsInSiriVoiceIdentifierSymbolLoc_ptr;
  if (!getAXGetComponentsInSiriVoiceIdentifierSymbolLoc_ptr)
  {
    v4 = AccessibilityUtilitiesLibrary();
    v3 = dlsym(v4, "AXGetComponentsInSiriVoiceIdentifier");
    v11[3] = (uint64_t)v3;
    getAXGetComponentsInSiriVoiceIdentifierSymbolLoc_ptr = v3;
  }
  _Block_object_dispose(&v10, 8);
  if (v3)
  {
    ((void (*)(id, _QWORD, _QWORD, _QWORD, id *))v3)(v2, 0, 0, 0, &v9);

    v5 = v9;
    return (NSString *)v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL WFAXGetComponentsInSiriVoiceIdentifier(NSString *__strong, NSString *__autoreleasing *, NSString *__autoreleasing *, NSString *__autoreleasing *, NSString *__autoreleasing *)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("WFSpeechSynthesisVoice.m"), 27, CFSTR("%s"), dlerror(), v9, v10);

    __break(1u);
  }
  return result;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setAvVoice:(id)a3
{
  objc_storeStrong((id *)&self->_avVoice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avVoice, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)voiceForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:", v4);

  return v5;
}

+ (id)voicesForLanguageCode:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFSpeechSynthesisVoice.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("languageCode"));

  }
  objc_msgSend(getAVSpeechSynthesisVoiceClass(), "_speechVoicesIncludingSiri");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48__WFSpeechSynthesisVoice_voicesForLanguageCode___block_invoke;
  v12[3] = &unk_24F8B12D8;
  v13 = v5;
  v7 = v5;
  objc_msgSend(v6, "if_compactMap:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_5823);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)defaultVoiceForLanguageCode:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id result;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v5 = (void *)getAXSettingsClass_softClass;
  v27 = getAXSettingsClass_softClass;
  if (!getAXSettingsClass_softClass)
  {
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = (uint64_t)__getAXSettingsClass_block_invoke;
    v22 = &unk_24F8BB430;
    v23 = &v24;
    __getAXSettingsClass_block_invoke((uint64_t)&v19);
    v5 = (void *)v25[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v24, 8);
  objc_msgSend(v6, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = (uint64_t)&v19;
  v21 = 0x2020000000;
  v8 = (_QWORD *)getAXSpeechSourceKeySpeechFeaturesSymbolLoc_ptr;
  v22 = (void *)getAXSpeechSourceKeySpeechFeaturesSymbolLoc_ptr;
  if (!getAXSpeechSourceKeySpeechFeaturesSymbolLoc_ptr)
  {
    v9 = AccessibilityUtilitiesLibrary();
    v8 = dlsym(v9, "AXSpeechSourceKeySpeechFeatures");
    *(_QWORD *)(v20 + 24) = v8;
    getAXSpeechSourceKeySpeechFeaturesSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v19, 8);
  if (v8)
  {
    objc_msgSend(v7, "speechVoiceIdentifierForLanguage:sourceKey:exists:", v4, *v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(getAVSpeechSynthesisVoiceClass(), "_voiceFromInternalVoiceListWithIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "language");
        v13 = (id)objc_claimAutoreleasedReturnValue();

        v14 = v12;
        if (v13 == v4)
          goto LABEL_12;
      }
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(getAVSpeechSynthesisVoiceClass(), "voiceWithLanguage:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
    objc_msgSend(a1, "voiceFromAVVoice:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    return v15;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAXSpeechSourceKeySpeechFeatures(void)");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("WFSpeechSynthesisVoice.m"), 42, CFSTR("%s"), dlerror(), v19);

  __break(1u);
  return result;
}

+ (id)availableLanguageCodes
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(getAVSpeechSynthesisVoiceClass(), "_speechVoicesIncludingSiri");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_compactMap:", &__block_literal_global_14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)currentLanguageCode
{
  return (id)objc_msgSend(getAVSpeechSynthesisVoiceClass(), "currentLanguageCode");
}

+ (id)voiceFromAVVoice:(id)a3
{
  id v5;
  WFSpeechSynthesisVoice *v6;
  void *v7;
  WFSpeechSynthesisVoice *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFSpeechSynthesisVoice.m"), 199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("avVoice"));

  }
  v6 = [WFSpeechSynthesisVoice alloc];
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFSpeechSynthesisVoice initWithIdentifier:](v6, "initWithIdentifier:", v7);

  -[WFSpeechSynthesisVoice setAvVoice:](v8, "setAvVoice:", v5);
  return v8;
}

uint64_t __48__WFSpeechSynthesisVoice_availableLanguageCodes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "language");
}

id __48__WFSpeechSynthesisVoice_voicesForLanguageCode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(v3, "language");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)a1 && objc_msgSend(v3, "isInstalled"))
  {
    +[WFSpeechSynthesisVoice voiceFromAVVoice:](WFSpeechSynthesisVoice, "voiceFromAVVoice:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __48__WFSpeechSynthesisVoice_voicesForLanguageCode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

@end
