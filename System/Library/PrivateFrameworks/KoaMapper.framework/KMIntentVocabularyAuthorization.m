@implementation KMIntentVocabularyAuthorization

- (BOOL)isAuthorizedApp:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(MEMORY[0x24BDDA368], "_siriAuthorizationStatusForAppID:", v3);
  if (v4 != 3)
  {
    v5 = (void *)KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_INFO))
    {
      v6 = (void *)MEMORY[0x24BDD16E0];
      v7 = v5;
      objc_msgSend(v6, "numberWithInteger:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315650;
      v11 = "-[KMIntentVocabularyAuthorization isAuthorizedApp:]";
      v12 = 2112;
      v13 = v3;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_218838000, v7, OS_LOG_TYPE_INFO, "%s App is not authorized to share vocabulary with Siri. appId=%@ authStatus=%@", (uint8_t *)&v10, 0x20u);

    }
  }

  return v4 == 3;
}

@end
