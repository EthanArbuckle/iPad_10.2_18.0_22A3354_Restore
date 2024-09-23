@implementation NSError(LTTranslationError)

+ (id)lt_errorWithCode:()LTTranslationError description:userInfo:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  if (v7)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDD0FC8]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TranslationErrorDomain"), a3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)lt_onlineNotImplementedError
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ONLINE_TRANSLATION_NOT_IMPLEMENTED_ERROR_DESCRIPTION"), &stru_250695360, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lt_errorWithCode:description:userInfo:", 1, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)lt_offlineNotImplementedError
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OFFLINE_TRANSLATION_NOT_IMPLEMENTED_ERROR_DESCRIPTION"), &stru_250695360, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lt_errorWithCode:description:userInfo:", 1, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (uint64_t)lt_invalidRequestErrorWithDescription:()LTTranslationError
{
  return objc_msgSend(a1, "lt_errorWithCode:description:userInfo:", 8, a3, 0);
}

+ (id)lt_speechTranslationOngoing
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ONGOING_SPEECH_TRANSLATION_ERROR_DESCRIPTION"), &stru_250695360, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lt_errorWithCode:description:userInfo:", 7, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)lt_speechLimitExceeded
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SPEECH_DURATION_EXCEEDED_ERROR_DESCRIPTION"), &stru_250695360, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lt_errorWithCode:description:userInfo:", 6, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)lt_translationTimeout
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SERVER_TIMEOUT_ERROR_DESCRIPTION"), &stru_250695360, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lt_errorWithCode:description:userInfo:", 9, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)lt_unsupportedLanguageError:()LTTranslationError
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "_ltLocaleIdentifier");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("UNSUPPORTED_LANGUAGE_ERROR_DESCRIPTION"), &stru_250695360, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("nil");
  if (v4)
    v8 = v4;
  objc_msgSend(v5, "stringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "lt_errorWithCode:description:userInfo:", 18, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)lt_unsupportedPairingErrorWithSource:()LTTranslationError target:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDBCED8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("sourceLocale"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("targetLocale"));
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TranslationErrorDomain"), 11, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)lt_unsupportedSourceLanguageError:()LTTranslationError
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("sourceLocale"));

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TranslationErrorDomain"), 18, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)lt_unsupportedTargetLanguageError:()LTTranslationError
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("targetLocale"));

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TranslationErrorDomain"), 19, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
