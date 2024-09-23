@implementation AFSpeakableUtteranceParser(AssistantUIAdditions)

+ (id)afui_speakableUtteranceParserForCurrentLanguage
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = objc_alloc(MEMORY[0x24BDBCEA0]);
  AFUIGetLanguageCode(v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v0, "initWithLocaleIdentifier:", v2);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE09310]), "initWithLocale:", v3);
  return v4;
}

- (uint64_t)afui_hasExternalDomainsForStringWithFormat:()AssistantUIAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_domainsForStringWithFormat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "_builtInDomains");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isSubsetOfSet:", v6) ^ 1;

  }
  else
  {
    v7 = 1;
  }
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v10 = 136315650;
    v11 = "-[AFSpeakableUtteranceParser(AssistantUIAdditions) afui_hasExternalDomainsForStringWithFormat:]";
    v12 = 2112;
    v13 = v4;
    v14 = 1024;
    v15 = v7;
    _os_log_impl(&dword_217514000, v8, OS_LOG_TYPE_INFO, "%s Format string: %@ has external domains: %d", (uint8_t *)&v10, 0x1Cu);
  }

  return v7;
}

- (id)_builtInDomains
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  if (objc_msgSend(a1, "handleTTSCodes"))
    objc_msgSend(v2, "addObject:", CFSTR("tts"));
  if (objc_msgSend(a1, "handlesFunctions"))
    objc_msgSend(v2, "addObject:", CFSTR("fn"));
  return v2;
}

+ (id)_domainsForStringWithFormat:()AssistantUIAdditions
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  _QWORD v24[5];
  id v25;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy_;
  v24[4] = __Block_byref_object_dispose_;
  v25 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v5 = objc_msgSend(v3, "length");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80__AFSpeakableUtteranceParser_AssistantUIAdditions___domainsForStringWithFormat___block_invoke;
  v11[3] = &unk_24D7A35A0;
  v13 = &v20;
  v14 = &v16;
  v15 = v24;
  v6 = v4;
  v12 = v6;
  objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 2, v11);
  if (*((_BYTE *)v21 + 24) || *((_BYTE *)v17 + 24))
  {

    v7 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      +[AFSpeakableUtteranceParser(AssistantUIAdditions) _domainsForStringWithFormat:].cold.1((uint64_t)v3, v7);
    v6 = 0;
  }
  v8 = v12;
  v9 = v6;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v24, 8);

  return v9;
}

+ (void)_domainsForStringWithFormat:()AssistantUIAdditions .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "+[AFSpeakableUtteranceParser(AssistantUIAdditions) _domainsForStringWithFormat:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_217514000, a2, OS_LOG_TYPE_ERROR, "%s Malformed parse for format string: %@", (uint8_t *)&v2, 0x16u);
}

@end
