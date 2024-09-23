@implementation CallHangUpSettingConfig

+ (id)localizationKey
{
  return CFSTR("CALL_HANG_UP");
}

+ (id)localizationFooterKey
{
  _BOOL4 v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;

  v3 = +[AssistantUtilities deviceIsiPhone](AssistantUtilities, "deviceIsiPhone");
  v4 = CFSTR("_IPAD");
  if (v3)
    v4 = CFSTR("_IPHONE");
  v5 = v4;
  objc_msgSend(a1, "localizationKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)enabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canUseVoiceTriggerDuringPhoneCall");

  return v3;
}

+ (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  AssistantSettingsSignalEmitter *v4;
  id v5;

  v3 = a3;
  if (a3)
  {
    v4 = objc_alloc_init(AssistantSettingsSignalEmitter);
    -[AssistantSettingsSignalEmitter emitCallHangUpEnabledSignal](v4, "emitCallHangUpEnabledSignal");

  }
  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCanUseVoiceTriggerDuringPhoneCall:", v3);

}

@end
