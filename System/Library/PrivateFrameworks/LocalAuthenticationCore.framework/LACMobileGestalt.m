@implementation LACMobileGestalt

+ (unint64_t)currentDeviceScreenSize
{
  unsigned int v2;

  v2 = MGGetSInt32Answer() - 3;
  if (v2 > 0x16)
    return 14;
  else
    return qword_240A7BEC8[v2];
}

+ (BOOL)isIdiomPad
{
  return objc_msgSend(a1, "_deviceClass") == 3;
}

+ (BOOL)isIdiomPhone
{
  return objc_msgSend(a1, "_deviceClass") == 1;
}

+ (int)_deviceClass
{
  if (_deviceClass_onceToken != -1)
    dispatch_once(&_deviceClass_onceToken, &__block_literal_global_6);
  return _deviceClass_deviceClass;
}

uint64_t __32__LACMobileGestalt__deviceClass__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  _deviceClass_deviceClass = result;
  return result;
}

+ (BOOL)deviceHasFaceID
{
  NSObject *v2;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (deviceHasFaceID_onceToken != -1)
    dispatch_once(&deviceHasFaceID_onceToken, &__block_literal_global_4_0);
  LACLogGestalt();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109120;
    v4[1] = deviceHasFaceID_hasPearl;
    _os_log_impl(&dword_2409DC000, v2, OS_LOG_TYPE_INFO, "deviceHasPearl returned %d", (uint8_t *)v4, 8u);
  }

  return deviceHasFaceID_hasPearl;
}

void __35__LACMobileGestalt_deviceHasFaceID__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (MGIsQuestionValid())
  {
    deviceHasFaceID_hasPearl = MGGetBoolAnswer();
  }
  else
  {
    LACLogGestalt();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      __35__LACMobileGestalt_deviceHasFaceID__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

  }
}

+ (BOOL)deviceHasOpticID
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (deviceHasOpticID_onceToken != -1)
    dispatch_once(&deviceHasOpticID_onceToken, &__block_literal_global_7_0);
  LACLogGestalt();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "+[LACMobileGestalt deviceHasOpticID]";
    v6 = 1024;
    v7 = deviceHasOpticID_hasOyster;
    _os_log_impl(&dword_2409DC000, v2, OS_LOG_TYPE_INFO, "%s returned %d", (uint8_t *)&v4, 0x12u);
  }

  return deviceHasOpticID_hasOyster;
}

void __36__LACMobileGestalt_deviceHasOpticID__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (MGIsQuestionValid())
  {
    deviceHasOpticID_hasOyster = MGGetBoolAnswer();
  }
  else
  {
    LACLogGestalt();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      __36__LACMobileGestalt_deviceHasOpticID__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

  }
}

+ (BOOL)deviceHasTouchID
{
  NSObject *v2;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (deviceHasTouchID_onceToken != -1)
    dispatch_once(&deviceHasTouchID_onceToken, &__block_literal_global_10_0);
  LACLogGestalt();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109120;
    v4[1] = deviceHasTouchID_hasTouchID;
    _os_log_impl(&dword_2409DC000, v2, OS_LOG_TYPE_INFO, "deviceHasTouchID returned %d", (uint8_t *)v4, 8u);
  }

  return deviceHasTouchID_hasTouchID;
}

void __36__LACMobileGestalt_deviceHasTouchID__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (MGIsQuestionValid())
  {
    deviceHasTouchID_hasTouchID = MGGetBoolAnswer();
  }
  else
  {
    LACLogGestalt();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      __36__LACMobileGestalt_deviceHasTouchID__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

  }
}

+ (BOOL)isAppleSilicon
{
  return 0;
}

+ (BOOL)isDaytona
{
  return 0;
}

+ (BOOL)isGibraltar
{
  return 0;
}

+ (BOOL)isSharedIPad
{
  if (isSharedIPad_onceToken != -1)
    dispatch_once(&isSharedIPad_onceToken, &__block_literal_global_13);
  return isSharedIPad__isSharedIPad == 1;
}

void __32__LACMobileGestalt_isSharedIPad__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  NSObject *v3;

  v0 = (void *)MKBUserTypeDeviceMode();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "objectForKeyedSubscript:", *MEMORY[0x24BE67200]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    isSharedIPad__isSharedIPad = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE67208]);
  }
  else
  {
    v2 = 0;
    LACLogGestalt();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __32__LACMobileGestalt_isSharedIPad__block_invoke_cold_1(0, v3);

  }
}

+ (BOOL)isVirtualMachine
{
  return MGGetBoolAnswer();
}

+ (BOOL)hasBridge
{
  return 0;
}

+ (id)marketingDeviceName
{
  return (id)MGCopyAnswer();
}

+ (id)marketingDeviceFamilyName
{
  return (id)MGCopyAnswer();
}

+ (id)serialNumber
{
  return (id)MGCopyAnswer();
}

+ (unint64_t)faceIDCameraOrientation
{
  int v2;
  NSObject *v3;

  if (!MGGetBoolAnswer() || !MGIsQuestionValid())
    return 0;
  v2 = MGGetSInt32Answer();
  LACLogGestalt();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[LACMobileGestalt faceIDCameraOrientation].cold.1(v2, v3);

  if (v2)
    return 2;
  else
    return 1;
}

void __35__LACMobileGestalt_deviceHasFaceID__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2409DC000, a1, a3, "Can't query Face ID.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __36__LACMobileGestalt_deviceHasOpticID__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2409DC000, a1, a3, "Can't query OpticID.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __36__LACMobileGestalt_deviceHasTouchID__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2409DC000, a1, a3, "Can't query Touch ID.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __32__LACMobileGestalt_isSharedIPad__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_2409DC000, a2, OS_LOG_TYPE_ERROR, "MKBUserTypeDeviceMode returned NULL: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)faceIDCameraOrientation
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_2409DC000, a2, OS_LOG_TYPE_DEBUG, "camera rotation: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_4();
}

@end
