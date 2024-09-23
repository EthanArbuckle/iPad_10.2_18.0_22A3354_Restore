@implementation AVSSettings

+ (BOOL)avsFeatureEnabled
{
  id v2;
  unsigned __int8 v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v3 = objc_msgSend(v2, sel_isAdaptiveVoiceShortcutsEnabled);

  return v3;
}

+ (void)setAvsFeatureEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  objc_msgSend(v4, sel_setAdaptiveVoiceShortcutsEnabled_, v3);

}

+ (BOOL)shouldHideAudioDonationPrompt
{
  id v2;
  void *v3;
  unsigned __int8 v4;

  v2 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v3 = (void *)sub_235F4CA74();
  v4 = objc_msgSend(v2, sel_BOOLForKey_, v3);

  return v4;
}

+ (void)setShouldHideAudioDonationPrompt:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;

  v3 = a3;
  v4 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v5 = (id)sub_235F4CA74();
  objc_msgSend(v4, sel_setBool_forKey_, v3, v5);

}

- (AVSSettings)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVSSettings;
  return -[AVSSettings init](&v3, sel_init);
}

@end
