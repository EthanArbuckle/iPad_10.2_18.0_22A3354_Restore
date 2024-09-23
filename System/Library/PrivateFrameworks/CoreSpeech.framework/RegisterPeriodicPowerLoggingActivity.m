@implementation RegisterPeriodicPowerLoggingActivity

void ___RegisterPeriodicPowerLoggingActivity_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(MEMORY[0x1E0D191C0], "sharedPowerLogger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "voiceTriggerEnabled");
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "powerLoggingCurrentLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "powerLoggingCurrentAssetConfigVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "powerLogSiriConfigWithVoiceTriggerEnabled:withLanguage:withModelVersion:", v5, v7, v9);

  v10 = v11;
  if (v11)
  {
    (*((void (**)(id))v11 + 2))(v11);
    v10 = v11;
  }

}

void ___RegisterPeriodicPowerLoggingActivity_block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t v2;
  xpc_object_t v3;
  _xpc_activity_s *activity;

  activity = a2;
  v2 = xpc_activity_copy_criteria(activity);
  if (!v2)
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807F0] + *MEMORY[0x1E0C807D8]);
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C80790], 0);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80898], 1);
    xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80738], 0);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808D0], 0);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808D8], 0);
    xpc_activity_set_criteria(activity, v3);

  }
}

@end
