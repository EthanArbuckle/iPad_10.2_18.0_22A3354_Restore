@implementation CDMSELFLoggingPolicy

+ (BOOL)isSELFLoggingAllowed:(int)a3
{
  if (a3 == 2)
    return +[CDMSELFLoggingPolicy isDiagnosticsSubmissionAllowed](CDMSELFLoggingPolicy, "isDiagnosticsSubmissionAllowed");
  else
    return a3 == 1;
}

+ (BOOL)isDiagnosticsSubmissionAllowed
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638E0]) == 1;

  return v3;
}

+ (int)getSELFCDMLoggingPolicyType:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  NSObject *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!v3)
  {
    CDMOSLoggerForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v9 = 136315138;
      v10 = "+[CDMSELFLoggingPolicy getSELFCDMLoggingPolicyType:]";
      _os_log_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_INFO, "%s [WARN]: Calling bundle id is nil, setting logging policy to NO_LOGGING", (uint8_t *)&v9, 0xCu);
    }
    goto LABEL_13;
  }
  if (getSELFCDMLoggingPolicyType__onceToken[0] != -1)
    dispatch_once(getSELFCDMLoggingPolicyType__onceToken, &__block_literal_global_9910);
  objc_msgSend((id)getSELFCDMLoggingPolicyType__bundleIdStringToCDMPolicyTypeDict, "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9 = 136315394;
      v10 = "+[CDMSELFLoggingPolicy getSELFCDMLoggingPolicyType:]";
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_INFO, "%s [WARN]: Unknown calling bundle id, setting logging policy to NO_LOGGING: %@", (uint8_t *)&v9, 0x16u);
    }

    v4 = 0;
LABEL_13:
    v7 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315650;
    v10 = "+[CDMSELFLoggingPolicy getSELFCDMLoggingPolicyType:]";
    v11 = 2112;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    _os_log_debug_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_DEBUG, "%s Calling bundle id - %@, Logging Policy - %@", (uint8_t *)&v9, 0x20u);
  }

  v7 = -[NSObject intValue](v4, "intValue");
LABEL_14:

  return v7;
}

void __52__CDMSELFLoggingPolicy_getSELFCDMLoggingPolicyType___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[7];
  _QWORD v10[8];

  v10[7] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("com.apple.assistant.assistantd");
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 1);
  v10[0] = v0;
  v9[1] = CFSTR("com.apple.searchd");
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 2);
  v10[1] = v1;
  v9[2] = CFSTR("com.apple.spotlight");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 2);
  v10[2] = v2;
  v9[3] = CFSTR("com.apple.assistant.cdmtool");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 1);
  v10[3] = v3;
  v9[4] = CFSTR("com.apple.AssistantServices");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 1);
  v10[4] = v4;
  v9[5] = CFSTR("com.apple.siri.nlteam.SiriSSUCLINLU");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 1);
  v10[5] = v5;
  v9[6] = CFSTR("com.apple.assistantd");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 1);
  v10[6] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 7);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)getSELFCDMLoggingPolicyType__bundleIdStringToCDMPolicyTypeDict;
  getSELFCDMLoggingPolicyType__bundleIdStringToCDMPolicyTypeDict = v7;

}

@end
