@implementation CDPContext(AsyncMode)

- (uint64_t)disableAsyncModeRequested
{
  NSObject *v2;
  const char *v3;
  NSObject *v4;
  uint32_t v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a1, "type") == 2
    || objc_msgSend(a1, "type") == 3
    || objc_msgSend(a1, "type") == 4
    || objc_msgSend(a1, "type") == 5
    || objc_msgSend(a1, "type") == 6
    || objc_msgSend(a1, "type") == 7
    || objc_msgSend(a1, "type") == 8)
  {
    _CDPLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:

      return 1;
    }
    v7 = 134217984;
    v8 = objc_msgSend(a1, "type");
    v3 = "\"Disabling async secure backup enrollment for CDPContextType: %ld\";
    v4 = v2;
    v5 = 12;
LABEL_10:
    _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, v3, (uint8_t *)&v7, v5);
    goto LABEL_11;
  }
  if ((objc_msgSend(a1, "isLocalSecretCached") & 1) == 0)
  {
    _CDPLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    LOWORD(v7) = 0;
    v3 = "\"Disabling async secure backup enrollment since context has no cached local secret.\";
    goto LABEL_22;
  }
  if (objc_msgSend(a1, "_disableAsyncSecureBackupEnrollment"))
  {
    _CDPLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    LOWORD(v7) = 0;
    v3 = "\"Context has disabled async secure backup enrollment\";
    goto LABEL_22;
  }
  result = CFPreferencesGetAppBooleanValue(CFSTR("DisableAsyncEnable"), CFSTR("com.apple.corecdp"), 0);
  if ((_DWORD)result)
  {
    _CDPLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    LOWORD(v7) = 0;
    v3 = "\"Pref to disable async enable was set...\";
LABEL_22:
    v4 = v2;
    v5 = 2;
    goto LABEL_10;
  }
  return result;
}

@end
