@implementation AFUISiriLanguage

- (AFUISiriLanguage)initWithDelegate:(id)a3
{
  id v4;
  AFUISiriLanguage *v5;
  AFUISiriLanguage *v6;
  uint64_t v7;
  NSString *spokenLanguageCode;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFUISiriLanguage;
  v5 = -[AFUISiriLanguage init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    *(_WORD *)&v5->_setupAssistantHasCompletedInitialRunChecked = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
    -[AFUISiriLanguage _computeSpokenLanguageCode](v6, "_computeSpokenLanguageCode");
    v7 = objc_claimAutoreleasedReturnValue();
    spokenLanguageCode = v6->_spokenLanguageCode;
    v6->_spokenLanguageCode = (NSString *)v7;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__spokenLanguageDidChange_, *MEMORY[0x24BE08DF0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v6, sel__currentLocaleDidChange_, *MEMORY[0x24BDBCA70], 0);

  }
  return v6;
}

- (AFUISiriLanguage)init
{
  return -[AFUISiriLanguage initWithDelegate:](self, "initWithDelegate:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AFUISiriLanguage;
  -[AFUISiriLanguage dealloc](&v4, sel_dealloc);
}

- (void)_updateSpokenLanguageCode
{
  id v3;

  -[AFUISiriLanguage _computeSpokenLanguageCode](self, "_computeSpokenLanguageCode");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AFUISiriLanguage _setSpokenLanguageCode:](self, "_setSpokenLanguageCode:", v3);

}

- (void)_setSpokenLanguageCode:(id)a3
{
  NSString *v4;
  NSString *spokenLanguageCode;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_spokenLanguageCode, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    spokenLanguageCode = self->_spokenLanguageCode;
    self->_spokenLanguageCode = v4;

    -[AFUISiriLanguage _delegate](self, "_delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "siriLanguageSpokenLanguageCodeDidChange:", self);

  }
}

- (BOOL)_setupAssistantHasCompletedInitialRunAvailable
{
  BOOL result;

  if (self->_setupAssistantHasCompletedInitialRunChecked)
    return self->_setupAssistantHasCompletedInitialRunAvailable;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  result = SetupAssistantLibraryCore_frameworkLibrary != 0;
  self->_setupAssistantHasCompletedInitialRunAvailable = SetupAssistantLibraryCore_frameworkLibrary != 0;
  self->_setupAssistantHasCompletedInitialRunChecked = 1;
  return result;
}

- (id)_computeSpokenLanguageCode
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t (*v6)(void);
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bestSupportedLanguageCodeForLanguageCode:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[AFUISiriLanguage _setupAssistantHasCompletedInitialRunAvailable](self, "_setupAssistantHasCompletedInitialRunAvailable"))
    {
      v9 = 0;
      v10 = &v9;
      v11 = 0x2020000000;
      v6 = (uint64_t (*)(void))getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr;
      v12 = getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr;
      if (!getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr)
      {
        v8[0] = MEMORY[0x24BDAC760];
        v8[1] = 3221225472;
        v8[2] = __getBYSetupAssistantHasCompletedInitialRunSymbolLoc_block_invoke;
        v8[3] = &unk_24D7A1A28;
        v8[4] = &v9;
        __getBYSetupAssistantHasCompletedInitialRunSymbolLoc_block_invoke((uint64_t)v8);
        v6 = (uint64_t (*)(void))v10[3];
      }
      _Block_object_dispose(&v9, 8);
      if (!v6)
        -[AFUISiriLanguage _computeSpokenLanguageCode].cold.1();
      if ((v6() & 1) == 0)
        VSPreferencesSetSpokenLanguageIdentifier();
    }
  }
  return v4;
}

- (NSString)spokenLanguageCode
{
  return self->_spokenLanguageCode;
}

- (AFUISiriLanguageDelegate)_delegate
{
  return (AFUISiriLanguageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)setupAssistantHasCompletedInitialRunChecked
{
  return self->_setupAssistantHasCompletedInitialRunChecked;
}

- (void)setSetupAssistantHasCompletedInitialRunChecked:(BOOL)a3
{
  self->_setupAssistantHasCompletedInitialRunChecked = a3;
}

- (void)setSetupAssistantHasCompletedInitialRunAvailable:(BOOL)a3
{
  self->_setupAssistantHasCompletedInitialRunAvailable = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spokenLanguageCode, 0);
}

- (void)_computeSpokenLanguageCode
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL soft_BYSetupAssistantHasCompletedInitialRun(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AFUISiriLanguage.m"), 14, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
