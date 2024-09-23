@implementation ASFController

+ (id)sharedController
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "+[ASFController sharedController]";
    _os_log_impl(&dword_236B1F000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__ASFController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, block);
  return (id)sharedController_sharedController;
}

void __33__ASFController_sharedController__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedController_sharedController;
  sharedController_sharedController = (uint64_t)v1;

}

- (BOOL)assistantIsEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "assistantIsEnabled");

  return v3;
}

- (void)setAssistantIsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "assistantIsEnabled");

  if (v5 != v3)
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAssistantIsEnabled:", v3);

    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "synchronize");

  }
}

- (BOOL)isVoiceTriggerEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "voiceTriggerEnabled");

  return v3;
}

- (BOOL)hardwareButtonAssistantIsEnabled
{
  return _AXSHomeButtonAssistant() == 0;
}

- (void)setHardwareButtonAssistant:(BOOL)a3
{
  _AXSSetHomeButtonAssistant();
}

- (BOOL)alwaysShowRecognizedSpeech
{
  NSObject *v2;
  void *v3;
  char v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ASFController alwaysShowRecognizedSpeech]";
    _os_log_impl(&dword_236B1F000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "alwaysShowRecognizedSpeech");

  return v4;
}

- (void)setAlwaysShowRecognizedSpeech:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ASFController setAlwaysShowRecognizedSpeech:]";
    _os_log_impl(&dword_236B1F000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlwaysShowRecognizedSpeech:", v3);

}

- (BOOL)siriResponseShouldAlwaysPrint
{
  NSObject *v2;
  void *v3;
  char v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ASFController siriResponseShouldAlwaysPrint]";
    _os_log_impl(&dword_236B1F000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "siriResponseShouldAlwaysPrint");

  return v4;
}

- (void)setSiriResponseShouldAlwaysPrint:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ASFController setSiriResponseShouldAlwaysPrint:]";
    _os_log_impl(&dword_236B1F000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSiriResponseShouldAlwaysPrint:", v3);

}

- (int64_t)useDeviceSpeakerForTTS
{
  NSObject *v2;
  void *v3;
  int64_t v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ASFController useDeviceSpeakerForTTS]";
    _os_log_impl(&dword_236B1F000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "useDeviceSpeakerForTTS");

  return v4;
}

- (void)setUseDeviceSpeakerForTTS:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ASFController setUseDeviceSpeakerForTTS:]";
    _os_log_impl(&dword_236B1F000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUseDeviceSpeakerForTTS:", a3);

}

- (BOOL)isCallHangUpEnabled
{
  NSObject *v2;
  void *v3;
  char v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ASFController isCallHangUpEnabled]";
    _os_log_impl(&dword_236B1F000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canUseVoiceTriggerDuringPhoneCall");

  return v4;
}

- (void)setCallHangUpEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ASFController setCallHangUpEnabled:]";
    _os_log_impl(&dword_236B1F000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCanUseVoiceTriggerDuringPhoneCall:", v3);

}

- (BOOL)isAnnounceNotificationEnabled
{
  NSObject *v2;
  void *v3;
  void *v4;
  BOOL v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[ASFController isAnnounceNotificationEnabled]";
    _os_log_impl(&dword_236B1F000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BEBF9C0], "currentNotificationSettingsCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationSystemSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "announcementSetting") == 2;

  return v5;
}

- (void)setAnnounceNotificationEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[ASFController setAnnounceNotificationEnabled:]";
    _os_log_impl(&dword_236B1F000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BEBF9C0], "currentNotificationSettingsCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationSystemSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (v3)
    v8 = 2;
  else
    v8 = 1;
  objc_msgSend(v7, "setAnnouncementSetting:", v8);
  objc_msgSend(v5, "setNotificationSystemSettings:", v7);

}

- (BOOL)isSpokenNotificationSkipTriggerlessReplyConfirmationEnabled
{
  NSObject *v2;
  void *v3;
  char v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ASFController isSpokenNotificationSkipTriggerlessReplyConfirmationEnabled]";
    _os_log_impl(&dword_236B1F000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "spokenNotificationSkipTriggerlessReplyConfirmation");

  return v4;
}

- (void)setSpokenNotificationSkipTriggerlessReplyConfirmationEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ASFController setSpokenNotificationSkipTriggerlessReplyConfirmationEnabled:]";
    _os_log_impl(&dword_236B1F000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSpokenNotificationSkipTriggerlessReplyConfirmation:", v3);

}

- (BOOL)isAnnounceNotificationEnabledForPlatform:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  char v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[ASFController isAnnounceNotificationEnabledForPlatform:]";
    _os_log_impl(&dword_236B1F000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v12, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BEBF9C0], "currentNotificationSettingsCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationSystemSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  switch(a3)
  {
    case 1:
      v7 = objc_msgSend(v6, "announcementHeadphonesSetting");
      goto LABEL_7;
    case 2:
      v7 = objc_msgSend(v6, "announcementCarPlaySetting");
LABEL_7:
      v8 = v7 == 2;
      break;
    case 3:
      objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "announceNotificationsOnHearingAidsEnabled");
      goto LABEL_10;
    case 4:
      objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "announceNotificationsOnBuiltInSpeakerEnabled");
LABEL_10:
      v8 = v10;

      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

- (void)setAnnounceNotificationEnabledForPlatform:(int64_t)a3 annouceNotificationEnabled:(BOOL)a4
{
  _BOOL8 v4;
  os_log_t *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x24BDAC8D0];
  v6 = (os_log_t *)MEMORY[0x24BE08FB0];
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[ASFController setAnnounceNotificationEnabledForPlatform:annouceNotificationEnabled:]";
    _os_log_impl(&dword_236B1F000, v7, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v15, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BEBF9C0], "currentNotificationSettingsCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationSystemSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  switch(a3)
  {
    case 1:
      if (v4)
        v11 = 2;
      else
        v11 = 1;
      objc_msgSend(v10, "setAnnouncementHeadphonesSetting:", v11);
      objc_msgSend(v8, "setNotificationSystemSettings:", v10);
      goto LABEL_11;
    case 2:
      if (v4)
        v11 = 2;
      else
        v11 = 1;
LABEL_11:
      objc_msgSend(v10, "setAnnouncementHeadphonesSetting:", v11);
      objc_msgSend(v8, "setNotificationSystemSettings:", v10);
      goto LABEL_12;
    case 3:
      goto LABEL_13;
    case 4:
LABEL_12:
      objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAnnounceNotificationsOnBuiltInSpeakerEnabled:", v4);

LABEL_13:
      objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAnnounceNotificationsOnHearingAidsEnabled:", v4);

      break;
    default:
      break;
  }
  v14 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[ASFController setAnnounceNotificationEnabledForPlatform:annouceNotificationEnabled:]";
    _os_log_impl(&dword_236B1F000, v14, OS_LOG_TYPE_DEFAULT, "%s The platform is not found for announce notification setting.", (uint8_t *)&v15, 0xCu);
  }

}

- (id)getAllNotificationApps
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[ASFController getAllNotificationApps]";
    _os_log_impl(&dword_236B1F000, v2, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBF9C0], "currentNotificationSettingsCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allNotificationSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isHiddenFromSettings", (_QWORD)v14) & 1) == 0)
        {
          objc_msgSend(v11, "sourceIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v3;
}

- (BOOL)isAnnounceNotificationEnabledForApp:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315138;
    v14 = "-[ASFController isAnnounceNotificationEnabledForApp:]";
    _os_log_impl(&dword_236B1F000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v13, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BEBF9C0], "currentNotificationSettingsCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3
    && (objc_msgSend(v5, "notificationSourceWithIdentifier:", v3),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = v7;
    objc_msgSend(v7, "sourceSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "notificationSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "announcementSetting") == 2;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setAnnounceNotificationEnabledForApp:(id)a3 annouceNotificationEnabled:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[ASFController setAnnounceNotificationEnabledForApp:annouceNotificationEnabled:]";
    _os_log_impl(&dword_236B1F000, v6, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v15, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BEBF9C0], "currentNotificationSettingsCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBF9C0], "currentNotificationSettingsCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationSourceWithIdentifier:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourceSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notificationSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  if (v4)
    v13 = 2;
  else
    v13 = 1;
  objc_msgSend(v12, "setAnnouncementSetting:", v13);
  v14 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v7, "replaceNotificationSettings:forNotificationSourceIdentifier:", v14, v5);

}

@end
