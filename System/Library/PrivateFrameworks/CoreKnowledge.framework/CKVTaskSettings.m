@implementation CKVTaskSettings

- (CKVLocalization)localization
{
  return (CKVLocalization *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isEvaluationEnabled
{
  unsigned __int8 v4;

  if (+[CKVAssistantSettingsBridge isCustomerInstall](CKVAssistantSettingsBridge, "isCustomerInstall"))
    return 0;
  v4 = atomic_load((unsigned __int8 *)&self->_evaluationEnabled);
  return v4 & 1;
}

- (BOOL)isTaskEnabled:(unsigned __int16)a3 reason:(unsigned __int16)a4
{
  int v4;
  int v5;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  NSObject *v13;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v4 = a4;
  v5 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  if (!+[CKVAssistantSettingsBridge isCustomerInstall](CKVAssistantSettingsBridge, "isCustomerInstall"))
  {
    CKVTaskIdDescription(v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _BOOLValueForKey((const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Task %@"), CFSTR("*")));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;

    }
    else
    {
      _BOOLValueForKey((const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Task %@"), v9));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        goto LABEL_2;
    }
    v12 = objc_msgSend(v11, "BOOLValue");

    LOBYTE(v8) = v12;
    return v8;
  }
LABEL_2:
  if (v4 != 15 && v4 != 17 && -[CKVTaskSettings isEvaluationWithProfile](self, "isEvaluationWithProfile"))
  {
    v7 = CKLogContextVocabulary;
    v8 = os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO);
    if (!v8)
      return v8;
    *(_DWORD *)buf = 136315138;
    v16 = "-[CKVTaskSettings isTaskEnabled:reason:]";
    _os_log_impl(&dword_1A48B3000, v7, OS_LOG_TYPE_INFO, "%s Evaluation with profile is enabled, blocking all real task events.", buf, 0xCu);
    goto LABEL_7;
  }
  if (v5 > 100)
  {
    if ((v5 - 101) >= 3)
    {
      if (v5 == 104)
      {
LABEL_20:
        if (!+[CKVAssistantSettingsBridge isSiriUODSupported](CKVAssistantSettingsBridge, "isSiriUODSupported"))
        {
          LOBYTE(v8) = +[CKVAssistantSettingsBridge isASRSupported](CKVAssistantSettingsBridge, "isASRSupported");
          return v8;
        }
      }
      else if (v5 != 105)
      {
LABEL_18:
        v13 = CKLogContextVocabulary;
        v8 = os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR);
        if (!v8)
          return v8;
        *(_DWORD *)buf = 136315394;
        v16 = "-[CKVTaskSettings isTaskEnabled:reason:]";
        v17 = 1024;
        v18 = v5;
        _os_log_error_impl(&dword_1A48B3000, v13, OS_LOG_TYPE_ERROR, "%s Unexpected taskId: %u", buf, 0x12u);
LABEL_7:
        LOBYTE(v8) = 0;
        return v8;
      }
    }
LABEL_21:
    LOBYTE(v8) = 1;
    return v8;
  }
  LOBYTE(v8) = 0;
  switch(v5)
  {
    case 0:
    case 5:
    case 7:
      return v8;
    case 1:
    case 2:
    case 10:
      goto LABEL_21;
    case 3:
    case 4:
    case 6:
      goto LABEL_20;
    case 8:
    case 9:
    case 11:
      LOBYTE(v8) = +[CKVAssistantSettingsBridge isSiriUODSupported](CKVAssistantSettingsBridge, "isSiriUODSupported");
      break;
    default:
      goto LABEL_18;
  }
  return v8;
}

- (BOOL)isEvaluationWithProfile
{
  unsigned __int8 v4;

  if (+[CKVAssistantSettingsBridge isCustomerInstall](CKVAssistantSettingsBridge, "isCustomerInstall"))
    return 0;
  v4 = atomic_load((unsigned __int8 *)&self->_evaluationWithProfileEnabled);
  return v4 & 1;
}

- (CKVTaskSettings)initWithLocalization:(id)a3
{
  id v5;
  CKVTaskSettings *v6;
  CKVTaskSettings *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKVTaskSettings;
  v6 = -[CKVTaskSettings init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_localization, a3);

  return v7;
}

- (CKVTaskSettings)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)refreshLocalization
{
  -[CKVLocalization refresh](self->_localization, "refresh");
}

- (BOOL)isTaskCoalescenceDisabled
{
  char v2;
  void *v3;
  void *v4;

  if (+[CKVAssistantSettingsBridge isCustomerInstall](CKVAssistantSettingsBridge, "isCustomerInstall"))
    return 0;
  _BOOLValueForKey(CFSTR("Disable Coalescence"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v2 = objc_msgSend(v3, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

- (void)setTaskCoalescenceDisabled:(BOOL)a3
{
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    v5 = 136315650;
    v6 = "_setValueForKey";
    v7 = 2112;
    v8 = v3;
    v9 = 2112;
    v10 = CFSTR("Disable Coalescence");
    _os_log_impl(&dword_1A48B3000, v4, OS_LOG_TYPE_INFO, "%s Setting value: %@ for key: %@", (uint8_t *)&v5, 0x20u);
  }
  CFPreferencesSetAppValue(CFSTR("Disable Coalescence"), v3, CFSTR("com.apple.IntelligenceTasks"));

}

- (void)setEvaluationEnabled:(BOOL)a3
{
  if (!+[CKVAssistantSettingsBridge isCustomerInstall](CKVAssistantSettingsBridge, "isCustomerInstall"))
    atomic_store(a3, (unsigned __int8 *)&self->_evaluationEnabled);
}

- (void)setEvaluationWithProfile:(BOOL)a3
{
  if (!+[CKVAssistantSettingsBridge isCustomerInstall](CKVAssistantSettingsBridge, "isCustomerInstall"))
    atomic_store(a3, (unsigned __int8 *)&self->_evaluationWithProfileEnabled);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localization, 0);
}

+ (id)buildVersion
{
  return +[CKVAssistantSettingsBridge buildVersion](CKVAssistantSettingsBridge, "buildVersion");
}

+ (id)projectNameAndSourceVersion
{
  return CFSTR("GraphDB-3400.105.3");
}

+ (id)defaultSettings
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)objc_opt_class());
  +[CKVLocalization defaultLocalization](CKVLocalization, "defaultLocalization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithLocalization:", v3);

  return v4;
}

@end
