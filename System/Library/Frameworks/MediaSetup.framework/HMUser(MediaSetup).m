@implementation HMUser(MediaSetup)

- (uint64_t)ms_allowiTunesAccountInHome:()MediaSetup
{
  return objc_msgSend(a1, "_settingForKeyPath:home:", CFSTR("root.music.allowiTunesAccount"), a3);
}

- (uint64_t)ms_voiceRecognitionEnabledInHome:()MediaSetup
{
  return objc_msgSend(a1, "_settingForKeyPath:home:", CFSTR("root.siri.identifyVoice"), a3);
}

- (uint64_t)_settingForKeyPath:()MediaSetup home:
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v6 = a3;
  v7 = 0;
  if (v6 && a4)
  {
    objc_msgSend(a1, "userSettingsForHome:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "rootGroup");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      findSettingWithKeyPath(v6, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v13, "BOOLValue");

    }
    else
    {
      _MSLogingFacility();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[HMUser(MediaSetup) _settingForKeyPath:home:].cold.1((uint64_t)v8, v14);

      v7 = 0;
    }

  }
  return v7;
}

- (void)_settingForKeyPath:()MediaSetup home:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = 0;
  _os_log_error_impl(&dword_219CD8000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch HomeKit settings objects. settingsContainer: %@, settings: %@", (uint8_t *)&v2, 0x16u);
}

@end
