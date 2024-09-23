@implementation CDMFeatureFlags

+ (BOOL)isSiriMiniEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isUaaPEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isRepetitionDetectionEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isPSCEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isMarrsMentionResolverEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isMarrsMentionDetectorEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isLVCEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isContextualSpanMatcherEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isContextUpdateEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCcqrAerCbrEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCATIEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)globalOverridesAreEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isLighthouseAPIEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSSUEnabled
{
  int v3;
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = _os_feature_enabled_impl();
  if (v3)
  {
    if ((objc_msgSend(a1, "isCDMClientXPCEnabled") & 1) != 0)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v6 = 136315138;
        v7 = "+[CDMFeatureFlags isSSUEnabled]";
        _os_log_error_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_ERROR, "%s [ERR]: Mismatched feature flags: SiriNL/SiriMiniSSU cannot be enabled while SiriNL/isCDMClientXPCEnabled is disabled. Forcing SiriNL/SiriMiniSSU=off.", (uint8_t *)&v6, 0xCu);
      }

      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

+ (BOOL)isCDMClientXPCEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCbrUnrestrictedByRDEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isCATIMultiTurnEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isUaaPPreferred
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isLogNluEnabled
{
  return (_os_feature_enabled_impl() & 1) != 0
      || +[CDMUserDefaultsUtils isWriteDebugToDiskEnabled](CDMUserDefaultsUtils, "isWriteDebugToDiskEnabled");
}

+ (BOOL)isSSUEnableIndexingEnabled
{
  int v2;

  v2 = objc_msgSend(a1, "isSSUEnabled");
  if (v2)
    LOBYTE(v2) = _os_feature_enabled_impl();
  return v2;
}

+ (BOOL)isSSUCacheUpdateOnEveryRequestEnabled
{
  int v2;

  v2 = objc_msgSend(a1, "isSSUEnabled");
  if (v2)
    LOBYTE(v2) = _os_feature_enabled_impl();
  return v2;
}

+ (BOOL)isFeatureStoreEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isFeatureStoreEnabledForExternalBuilds
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isMentionResolverRewriterEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isShortcutsNLv4FollowupEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isTrieOverridesEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isUsoEntitySpanEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isAmbiguityRefactorEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isInterpretationGroupFilteringEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isNLv4ServiceOverridesEnabled
{
  return _os_feature_enabled_impl();
}

@end
