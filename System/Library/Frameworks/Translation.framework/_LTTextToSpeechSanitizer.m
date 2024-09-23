@implementation _LTTextToSpeechSanitizer

+ (id)stringReplacingRedactionsWithBeepMarker:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_stringReplacingRedactionsInString:withMarker:", a3, CFSTR("_LT_Placeholder_##$#$#$"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_LT_Placeholder_##$#$#$"), CFSTR("\x1B\\mrk=play=beep.wav\\"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)stringContainsRedaction:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(a1, "_regularExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(v5, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length")) != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = _LTOSLogTTS();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[_LTTextToSpeechSanitizer stringContainsRedaction:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    v6 = 0;
  }

  return v6;
}

+ (id)_stringReplacingRedactionsInString:(id)a3 withMarker:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "rangeOfString:", CFSTR("*")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = _LTOSLogTTS();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_235438000, v8, OS_LOG_TYPE_INFO, "Not attempting to sanitize string because it has no asterisks", (uint8_t *)&v24, 2u);
    }
    v9 = v6;
  }
  else
  {
    objc_msgSend(a1, "_regularExpression");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)objc_msgSend(v6, "mutableCopy");
      v12 = objc_msgSend(v10, "replaceMatchesInString:options:range:withTemplate:", v11, 0, 0, objc_msgSend(v11, "length"), v7);
      v13 = _LTOSLogTTS();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = v13;
        v24 = 134218240;
        v25 = v12;
        v26 = 2048;
        v27 = objc_msgSend(v6, "length");
        _os_log_impl(&dword_235438000, v14, OS_LOG_TYPE_INFO, "Replaced %zu censored words with beep marker in TTS string of length %zu", (uint8_t *)&v24, 0x16u);

      }
      v9 = (id)objc_msgSend(v11, "copy");

    }
    else
    {
      v15 = _LTOSLogTTS();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[_LTTextToSpeechSanitizer _stringReplacingRedactionsInString:withMarker:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
      v9 = v6;
    }

  }
  return v9;
}

+ (id)_regularExpression
{
  if (_regularExpression_onceToken[0] != -1)
    dispatch_once(_regularExpression_onceToken, &__block_literal_global_10);
  return (id)_regularExpression_regularExpression;
}

+ (void)stringContainsRedaction:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_235438000, a1, a3, "Failed to create regular expression to find censored speech, returning that no redactions were found", a5, a6, a7, a8, 0);
}

+ (void)_stringReplacingRedactionsInString:(uint64_t)a3 withMarker:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_235438000, a1, a3, "Failed to create regular expression to find censored speech, just returning original string", a5, a6, a7, a8, 0);
}

@end
