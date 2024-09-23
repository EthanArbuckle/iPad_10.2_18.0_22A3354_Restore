@implementation HUSiriLanguageOptionItem

- (HUSiriLanguageOptionItem)initWithStyle:(unint64_t)a3 adapter:(id)a4 languageOption:(id)a5
{
  id v9;
  id v10;
  HUSiriLanguageOptionItem *v11;
  HUSiriLanguageOptionItem *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUSiriLanguageOptionItem;
  v11 = -[HUSiriLanguageOptionItem init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_optionStyle = a3;
    objc_storeStrong((id *)&v11->_adapter, a4);
    objc_storeStrong((id *)&v12->_languageOption, a5);
  }

  return v12;
}

- (HUSiriLanguageOptionItem)initWithStyle:(unint64_t)a3 siriLanguageOptionsManager:(id)a4 languageOption:(id)a5
{
  id v9;
  id v10;
  HUSiriLanguageOptionItem *v11;
  HUSiriLanguageOptionItem *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUSiriLanguageOptionItem;
  v11 = -[HUSiriLanguageOptionItem init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_optionStyle = a3;
    objc_storeStrong((id *)&v11->_siriLanguageOptionsManager, a4);
    objc_storeStrong((id *)&v12->_languageOption, a5);
  }

  return v12;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
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
  _QWORD v24[6];
  _QWORD v25[5];

  v4 = (void *)objc_opt_new();
  v5 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __56__HUSiriLanguageOptionItem__subclass_updateWithOptions___block_invoke;
  v25[3] = &unk_1E6F504A0;
  v25[4] = self;
  __56__HUSiriLanguageOptionItem__subclass_updateWithOptions___block_invoke((uint64_t)v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30D18]);

  -[HUSiriLanguageOptionItem siriLanguageOptionsManager](self, "siriLanguageOptionsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedLanguageOption");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[HUSiriLanguageOptionItem adapter](self, "adapter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[HUSiriLanguageOptionItem adapter](self, "adapter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "selectedLanguageOption");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __56__HUSiriLanguageOptionItem__subclass_updateWithOptions___block_invoke_2;
  v24[3] = &unk_1E6F51BE0;
  v24[4] = self;
  v11 = v8;
  v24[5] = v11;
  objc_msgSend(v10, "numberWithBool:", __56__HUSiriLanguageOptionItem__subclass_updateWithOptions___block_invoke_2((uint64_t)v24));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D30DA0]);

  -[HUSiriLanguageOptionItem adapter](self, "adapter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0C99E20];
    -[HUSiriLanguageOptionItem adapter](self, "adapter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "homeKitSettingsVendor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithObject:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUSiriLanguageOptionItem adapter](self, "adapter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "settings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "na_safeAddObject:", v19);

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30B80]);
    -[HUSiriLanguageOptionItem adapter](self, "adapter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "keyPaths");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D30E50]);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

__CFString *__56__HUSiriLanguageOptionItem__subclass_updateWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  __CFString *v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "optionStyle");
  if (v2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "languageOption");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedOutputVoiceColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (v2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "languageOption");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedOutputVoiceAccent");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v2)
    {
      v5 = &stru_1E6F60E80;
      return v5;
    }
    objc_msgSend(*(id *)(a1 + 32), "languageOption");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedRecognitionLanguage");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (__CFString *)v4;

  return v5;
}

uint64_t __56__HUSiriLanguageOptionItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend((id)objc_opt_class(), "selectionKeyForLanguageOption:withOptionStyle:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "optionStyle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "languageOption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionKeyForLanguageOption:withOptionStyle:", v4, objc_msgSend(*(id *)(a1 + 32), "optionStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v2, "isEqual:", v5);
  return v6;
}

+ (id)selectionKeyForLanguageOption:(id)a3 withOptionStyle:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (a4 == 2)
  {
    objc_msgSend(v5, "localizedOutputVoiceColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if (a4 == 1)
  {
    objc_msgSend(v5, "outputLanguage");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      v8 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v5, "recognitionLanguage");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_9:

  return v8;
}

- (unint64_t)optionStyle
{
  return self->_optionStyle;
}

- (HFAccessorySettingSiriLanguageAdapter)adapter
{
  return self->_adapter;
}

- (HFSiriLanguageOption)languageOption
{
  return self->_languageOption;
}

- (void)setLanguageOption:(id)a3
{
  objc_storeStrong((id *)&self->_languageOption, a3);
}

- (HFSiriLanguageOptionsManager)siriLanguageOptionsManager
{
  return self->_siriLanguageOptionsManager;
}

- (void)setSiriLanguageOptionsManager:(id)a3
{
  objc_storeStrong((id *)&self->_siriLanguageOptionsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriLanguageOptionsManager, 0);
  objc_storeStrong((id *)&self->_languageOption, 0);
  objc_storeStrong((id *)&self->_adapter, 0);
}

@end
