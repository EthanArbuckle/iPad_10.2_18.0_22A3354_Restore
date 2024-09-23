@implementation SRCarPlayUIUtilities

+ (BOOL)flexibleFollowupEnabled
{
  int v2;

  v2 = _os_feature_enabled_impl("Siri", "continuous_conversation");
  if (v2)
    LOBYTE(v2) = _os_feature_enabled_impl("CoreSpeech", "support_carplay_with_flexible_followup");
  return v2;
}

+ (double)flexibleFollowupAdditonalDelay
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
  objc_msgSend(v2, "autoDismissalIdleTimeout");
  v4 = v3;

  return v4;
}

+ (BOOL)isJarvis
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "attributeForKey:", AVSystemController_CarPlayAuxStreamSupportAttribute));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

@end
