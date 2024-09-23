@implementation _ASDevice

+ (BOOL)isPad
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __18___ASDevice_isPad__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isPad_onceToken != -1)
    dispatch_once(&isPad_onceToken, block);
  return isPad_isPad;
}

+ (BOOL)isBiometricAuthenticationAvailable
{
  id v2;
  char v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v8[8];
  id v9;

  v2 = objc_alloc_init(MEMORY[0x24BDDA938]);
  v9 = 0;
  v3 = objc_msgSend(v2, "canEvaluatePolicy:error:", 1, &v9);
  v4 = v9;
  if ((v3 & 1) == 0)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        +[_ASDevice isBiometricAuthenticationAvailable].cold.1(v6);
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_20E648000, v6, OS_LOG_TYPE_INFO, "No biometrics available", v8, 2u);
    }
  }

  return v3;
}

+ (BOOL)isCompanionAuthenticationAvailable
{
  id v2;
  char v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v8[8];
  id v9;

  v2 = objc_alloc_init(MEMORY[0x24BDDA938]);
  v9 = 0;
  v3 = objc_msgSend(v2, "canEvaluatePolicy:error:", 3, &v9);
  v4 = v9;
  if ((v3 & 1) == 0)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        +[_ASDevice isCompanionAuthenticationAvailable].cold.1(v6);
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_20E648000, v6, OS_LOG_TYPE_INFO, "No companion auth available", v8, 2u);
    }
  }

  return v3;
}

+ (BOOL)shouldRequireLocalAuthenticationForPasswords
{
  id v2;
  char v3;
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  id v9;

  v2 = objc_alloc_init(MEMORY[0x24BDDA938]);
  v9 = 0;
  v3 = objc_msgSend(v2, "canEvaluatePolicy:error:", 2, &v9);
  v4 = v9;
  v5 = v4;
  if ((v3 & 1) != 0)
  {
LABEL_6:
    v6 = 1;
    goto LABEL_7;
  }
  if ((objc_msgSend(v4, "safari_matchesErrorDomain:andCode:", *MEMORY[0x24BDDA908], -5) & 1) == 0)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[_ASDevice shouldRequireLocalAuthenticationForPasswords].cold.1(v7);
    goto LABEL_6;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

+ (int64_t)_localAuthenticationBiometricsAvailability
{
  return 3;
}

+ (BOOL)shouldRequireLocalAuthenticationForPlatformCredentials
{
  return 1;
}

+ (int64_t)biometryType
{
  id v2;
  char v3;
  id v4;
  int64_t v5;
  NSObject *v6;
  id v8;

  v2 = objc_alloc_init(MEMORY[0x24BDDA938]);
  v8 = 0;
  v3 = objc_msgSend(v2, "canEvaluatePolicy:error:", 1, &v8);
  v4 = v8;
  if ((v3 & 1) != 0)
  {
    v5 = objc_msgSend(v2, "biometryType");
  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[_ASDevice biometryType].cold.1(v6);
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isCABLEClient
{
  unsigned int v2;

  v2 = objc_msgSend(a1, "deviceClass");
  return (v2 < 0xA) & (0x20Au >> v2);
}

+ (int)deviceClass
{
  if (deviceClass_onceToken != -1)
    dispatch_once(&deviceClass_onceToken, &__block_literal_global);
  return deviceClass_deviceClass;
}

+ (void)isBiometricAuthenticationAvailable
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20E648000, v3, v4, "Local Auth returned error when checking biometric auth availability: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

+ (void)isCompanionAuthenticationAvailable
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20E648000, v3, v4, "Local Auth returned error when checking companion auth availability: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

+ (void)shouldRequireLocalAuthenticationForPasswords
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20E648000, v3, v4, "Local Auth returned error when checking password auth availability: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

+ (void)biometryType
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_20E648000, v3, v4, "Cannot evaluate biometrics: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

@end
