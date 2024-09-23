@implementation FPPreflightUserInteractionAlert

+ (id)alertFromDictionary:(id)a3 localizationLookup:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;

  v5 = a3;
  v6 = a4;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LocalizedTitle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPStringFormat formatForPlistObject:localizationLookup:](FPStringFormat, "formatForPlistObject:localizationLookup:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitleFormat:", v9);

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LocalizedSubTitle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPStringFormat formatForPlistObject:localizationLookup:](FPStringFormat, "formatForPlistObject:localizationLookup:", v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSubtitleFormat:", v11);

    objc_msgSend(v7, "titleFormat");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LocalizedRecoveryOptions"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v14 = 0;
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Continue"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[FPStringFormat formatForPlistObject:localizationLookup:](FPStringFormat, "formatForPlistObject:localizationLookup:", v15, v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setContinueCaptionFormat:", v16);

      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Cancel"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[FPStringFormat formatForPlistObject:localizationLookup:](FPStringFormat, "formatForPlistObject:localizationLookup:", v17, v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCancelCaptionFormat:", v18);

      objc_msgSend(v7, "setEnableContinue:", 1);
      objc_msgSend(v7, "setContinueIsDestructive:", 0);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RecoveryOptions"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Continue"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Destructive"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v7, "setEnableContinue:", objc_msgSend(v20, "BOOLValue"));
        }
        if (v21)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v7, "setContinueIsDestructive:", objc_msgSend(v21, "BOOLValue"));
        }

      }
      v22 = v7;

    }
    else
    {
      fp_current_or_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        +[FPPreflightUserInteractionAlert alertFromDictionary:localizationLookup:].cold.1();

      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (FPStringFormat)titleFormat
{
  return self->_titleFormat;
}

- (void)setTitleFormat:(id)a3
{
  objc_storeStrong((id *)&self->_titleFormat, a3);
}

- (FPStringFormat)subtitleFormat
{
  return self->_subtitleFormat;
}

- (void)setSubtitleFormat:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleFormat, a3);
}

- (FPStringFormat)continueCaptionFormat
{
  return self->_continueCaptionFormat;
}

- (void)setContinueCaptionFormat:(id)a3
{
  objc_storeStrong((id *)&self->_continueCaptionFormat, a3);
}

- (FPStringFormat)cancelCaptionFormat
{
  return self->_cancelCaptionFormat;
}

- (void)setCancelCaptionFormat:(id)a3
{
  objc_storeStrong((id *)&self->_cancelCaptionFormat, a3);
}

- (BOOL)enableContinue
{
  return self->_enableContinue;
}

- (void)setEnableContinue:(BOOL)a3
{
  self->_enableContinue = a3;
}

- (BOOL)continueIsDestructive
{
  return self->_continueIsDestructive;
}

- (void)setContinueIsDestructive:(BOOL)a3
{
  self->_continueIsDestructive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelCaptionFormat, 0);
  objc_storeStrong((id *)&self->_continueCaptionFormat, 0);
  objc_storeStrong((id *)&self->_subtitleFormat, 0);
  objc_storeStrong((id *)&self->_titleFormat, 0);
}

+ (void)alertFromDictionary:localizationLookup:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, v0, v1, "[ERROR] Alert %@ doesn't have a title defined", v2);
  OUTLINED_FUNCTION_3();
}

@end
