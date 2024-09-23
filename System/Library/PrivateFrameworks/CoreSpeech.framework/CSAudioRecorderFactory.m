@implementation CSAudioRecorderFactory

+ (id)audioRecorderWithQueue:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "programmableAudioInjectionEnabled");

  if (v7)
  {
    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "+[CSAudioRecorderFactory audioRecorderWithQueue:error:]";
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Using audioInjectionProvider as recorder", (uint8_t *)&v11, 0xCu);
    }
    +[CSAudioInjectionProvider defaultInjectionProvider](CSAudioInjectionProvider, "defaultInjectionProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "start");
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19010]), "initWithQueue:error:", v5, a4);
  }

  return v9;
}

@end
