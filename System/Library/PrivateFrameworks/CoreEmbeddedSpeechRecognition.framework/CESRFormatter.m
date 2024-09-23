@implementation CESRFormatter

- (CESRFormatter)initWithAssetConfig:(id)a3
{
  id v5;
  CESRFormatter *v6;
  CESRFormatter *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CESRFormatter *v12;
  id v13;
  void *v14;
  uint64_t v15;
  _EARFormatter *formatter;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CESRFormatter;
  v6 = -[CESRFormatter init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetConfig, a3);
    objc_msgSend(MEMORY[0x1E0CD7F48], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "installedAssetWithConfig:", v7->_assetConfig);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && objc_msgSend(v9, "length"))
    {
      objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("mini.json"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (_os_feature_enabled_impl())
        v11 = AFIsUODCapableHorsemanDevice() ^ 1;
      else
        v11 = 0;
      v13 = objc_alloc(MEMORY[0x1E0D1F138]);
      -[SFEntitledAssetConfig language](v7->_assetConfig, "language");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "initWithQuasarConfig:overrideConfigFiles:supportEmojiRecognition:language:", v10, 0, v11, v14);
      formatter = v7->_formatter;
      v7->_formatter = (_EARFormatter *)v15;

      v12 = v7;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)formatSpeechTokensWithAutoPunctuation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[CESRUtilities earTokensForAFTokens:appendedAutoPunctuation:](CESRUtilities, "earTokensForAFTokens:appendedAutoPunctuation:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_EARFormatter formatWords:task:autoPunctuate:recognizeEmoji:](self->_formatter, "formatWords:task:autoPunctuate:recognizeEmoji:", v5, CFSTR("Dictation"), 1, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CESRUtilities afTokensForEARTokens:removeSpaceBefore:](CESRUtilities, "afTokensForEARTokens:removeSpaceBefore:", v6, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[CESRFormatter formatSpeechTokensWithAutoPunctuation:]";
      _os_log_error_impl(&dword_1B3E5F000, v8, OS_LOG_TYPE_ERROR, "%s Method 'formatWords' not found in EARFormatter", (uint8_t *)&v10, 0xCu);
    }
    v7 = v4;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetConfig, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
}

@end
