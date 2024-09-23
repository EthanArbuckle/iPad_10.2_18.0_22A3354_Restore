@implementation AssistantUtilities

+ (BOOL)assistantEnabled
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "assistantIsEnabled"))
  {
    v4 = (void *)MEMORY[0x24BE09170];
    objc_msgSend(a1, "assistantLanguage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "assistantIsSupportedForLanguageCode:error:", v5, 0);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)assistantLanguage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)deviceIsiPad
{
  return objc_msgSend(a1, "deviceIsClass:", CFSTR("iPad"));
}

+ (BOOL)deviceIsiPod
{
  return objc_msgSend(a1, "deviceIsClass:", CFSTR("iPod"));
}

+ (BOOL)deviceIsiPhone
{
  return objc_msgSend(a1, "deviceIsClass:", CFSTR("iPhone"));
}

+ (BOOL)deviceIsVision
{
  return objc_msgSend(a1, "deviceIsClass:", CFSTR("RealityDevice"));
}

+ (BOOL)deviceIsClass:(__CFString *)a3
{
  const void *v4;

  v4 = (const void *)MGCopyAnswer();
  LOBYTE(a3) = CFEqual(v4, a3) != 0;
  CFRelease(v4);
  return (char)a3;
}

+ (id)numberFormatter
{
  if (numberFormatter_onceToken != -1)
    dispatch_once(&numberFormatter_onceToken, &__block_literal_global_2);
  return (id)numberFormatter_numberFormatter;
}

uint64_t __37__AssistantUtilities_numberFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)numberFormatter_numberFormatter;
  numberFormatter_numberFormatter = (uint64_t)v0;

  return objc_msgSend((id)numberFormatter_numberFormatter, "setNumberStyle:", 1);
}

+ (BOOL)isHardwareButtonTrigger
{
  int v2;

  v2 = objc_msgSend(a1, "assistantEnabled");
  if (v2)
    LOBYTE(v2) = _AXSHomeButtonAssistant() == 0;
  return v2;
}

+ (BOOL)isVoiceTriggerEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "voiceTriggerEnabled");

  return v3;
}

+ (void)enableVoiceTrigger
{
  id v2;

  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setVoiceTriggerEnabled:", 1);

}

+ (void)disableVoiceTrigger
{
  id v2;

  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setVoiceTriggerEnabled:", 0);

}

+ (void)disableVoiceTriggerAndSiriEnrollmentForCurrentLanguage
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "assistantLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "discardSiriEnrollmentForLanguageCode:", v4);

  objc_msgSend(a1, "disableVoiceTrigger");
}

+ (BOOL)needsTrainingData:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSpeakerRecognitionAvailable");

  objc_msgSend(MEMORY[0x24BEAFEB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "assistantLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isSATEnrolledForSiriProfileId:forLanguageCode:", 0, v8);

  if (v3)
    return v6 & (v9 ^ 1);
  else
    return 0;
}

+ (BOOL)shouldShowCompactVoiceTriggerSpecifier
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  char v6;

  objc_msgSend(a1, "assistantLanguage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bestSupportedLanguageCodeForLanguageCode:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isCompactVoiceTriggerAvailableForLanguageCode:", v2))
    v5 = AFDeviceSupportsANE();
  else
    v5 = 0;

  v6 = _os_feature_enabled_impl() & v5;
  return v6;
}

+ (id)nameForApplicationWithBundleID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;

  v3 = (objc_class *)MEMORY[0x24BDC1540];
  v4 = a3;
  v9 = 0;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, &v9);

  v6 = 0;
  if (!v9)
  {
    objc_msgSend(v5, "localizedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "length"))
    {
      objc_msgSend(v5, "localizedShortName");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
  }

  return v6;
}

+ (BOOL)isAppWithBundleIDPresent:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v9;

  v3 = (objc_class *)MEMORY[0x24BDC1540];
  v4 = a3;
  v9 = 0;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, &v9);

  if (v9)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    objc_msgSend(v5, "applicationState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isInstalled"))
      v6 = objc_msgSend(v7, "isPlaceholder") ^ 1;
    else
      LOBYTE(v6) = 0;

  }
  return v6;
}

+ (BOOL)isRpiOnDeviceDeletionEnabled
{
  char v2;
  void *v3;
  char v4;

  v2 = objc_msgSend(MEMORY[0x24BE091E0], "isOnDeviceHistoryDeletionEnabled");
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLivedIdentifierUploadingEnabled") ^ 1;

  return v2 & v4;
}

@end
