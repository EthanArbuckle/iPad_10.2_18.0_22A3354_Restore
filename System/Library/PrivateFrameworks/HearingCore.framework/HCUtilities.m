@implementation HCUtilities

+ (BOOL)currentProcessIsPreferences
{
  if (currentProcessIsPreferences_token != -1)
    dispatch_once(&currentProcessIsPreferences_token, &__block_literal_global_32);
  return currentProcessIsPreferences__AXIsProcess;
}

void __36__HCUtilities_currentProcessIsHeard__block_invoke()
{
  void *v0;
  int v1;

  HCProcessGetName();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("heard"));

  if (v1)
    currentProcessIsHeard__AXIsProcess = 1;
}

void __42__HCUtilities_currentProcessIsPreferences__block_invoke()
{
  void *v0;
  int v1;

  HCApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.Preferences"));

  if (v1)
    currentProcessIsPreferences__AXIsProcess = 1;
}

+ (BOOL)currentProcessIsHeard
{
  if (currentProcessIsHeard_token != -1)
    dispatch_once(&currentProcessIsHeard_token, &__block_literal_global_31);
  return currentProcessIsHeard__AXIsProcess;
}

+ (BOOL)deviceIsPhone
{
  if (HCDeviceGetType__AXCurrentDeviceTypeOnceToken != -1)
    dispatch_once(&HCDeviceGetType__AXCurrentDeviceTypeOnceToken, &__block_literal_global_22_0);
  return HCDeviceGetType__HCDeviceType == 1;
}

+ (id)messagePayloadFromDictionary:(id)a3 andIdentifier:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v10[0] = CFSTR("axha_messageID");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = CFSTR("axha_payload");
    v11[0] = v7;
    v11[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)deviceIsPod
{
  if (HCDeviceGetType__AXCurrentDeviceTypeOnceToken != -1)
    dispatch_once(&HCDeviceGetType__AXCurrentDeviceTypeOnceToken, &__block_literal_global_22_0);
  return HCDeviceGetType__HCDeviceType == 2;
}

+ (BOOL)deviceIsPad
{
  if (HCDeviceGetType__AXCurrentDeviceTypeOnceToken != -1)
    dispatch_once(&HCDeviceGetType__AXCurrentDeviceTypeOnceToken, &__block_literal_global_22_0);
  return HCDeviceGetType__HCDeviceType == 3;
}

+ (BOOL)currentProcessIsSystemApp
{
  if (currentProcessIsSystemApp_token != -1)
    dispatch_once(&currentProcessIsSystemApp_token, &__block_literal_global_36);
  return currentProcessIsSystemApp__AXIsProcess;
}

+ (id)bluetoothManagerQueue
{
  if (bluetoothManagerQueue_token != -1)
    dispatch_once(&bluetoothManagerQueue_token, &__block_literal_global_29);
  return (id)bluetoothManagerQueue_BluetoothQueue;
}

+ (BOOL)isInternalInstall
{
  if (isInternalInstall__AXIsInternalInstallOnceToken != -1)
    dispatch_once(&isInternalInstall__AXIsInternalInstallOnceToken, &__block_literal_global_27);
  return isInternalInstall__AXIsInternalInstall;
}

uint64_t __32__HCUtilities_isInternalInstall__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  isInternalInstall__AXIsInternalInstall = result;
  return result;
}

void __36__HCUtilities_bluetoothManagerQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("hearing_bluetooth_manager_queue", v2);
  v1 = (void *)bluetoothManagerQueue_BluetoothQueue;
  bluetoothManagerQueue_BluetoothQueue = (uint64_t)v0;

}

+ (BOOL)currentProcessIsAXUIServer
{
  if (currentProcessIsAXUIServer_token != -1)
    dispatch_once(&currentProcessIsAXUIServer_token, &__block_literal_global_33);
  return currentProcessIsAXUIServer__AXIsProcess;
}

void __41__HCUtilities_currentProcessIsAXUIServer__block_invoke()
{
  id v0;

  HCApplicationGetMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.accessibility.AccessibilityUIServer")) & 1) != 0
    || objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.AccessibilityUIServer")))
  {
    currentProcessIsAXUIServer__AXIsProcess = 1;
  }

}

+ (BOOL)currentProcessIsSpringBoard
{
  if (currentProcessIsSpringBoard_token != -1)
    dispatch_once(&currentProcessIsSpringBoard_token, &__block_literal_global_34);
  return currentProcessIsSpringBoard__AXIsProcess;
}

void __42__HCUtilities_currentProcessIsSpringBoard__block_invoke()
{
  void *v0;
  int v1;

  HCApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.springboard"));

  if (v1)
    currentProcessIsSpringBoard__AXIsProcess = 1;
}

+ (BOOL)currentProcessIsCarousel
{
  if (currentProcessIsCarousel_token != -1)
    dispatch_once(&currentProcessIsCarousel_token, &__block_literal_global_35);
  return currentProcessIsCarousel__AXIsProcess;
}

void __39__HCUtilities_currentProcessIsCarousel__block_invoke()
{
  void *v0;
  int v1;

  HCApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.Carousel"));

  if (v1)
    currentProcessIsCarousel__AXIsProcess = 1;
}

BOOL __40__HCUtilities_currentProcessIsSystemApp__block_invoke()
{
  _BOOL8 result;

  result = +[HCUtilities currentProcessIsSpringBoard](HCUtilities, "currentProcessIsSpringBoard")
        || +[HCUtilities currentProcessIsCarousel](HCUtilities, "currentProcessIsCarousel");
  currentProcessIsSystemApp__AXIsProcess = result;
  return result;
}

+ (BOOL)currentProcessIsRTTExternsion
{
  if (currentProcessIsRTTExternsion_onceToken != -1)
    dispatch_once(&currentProcessIsRTTExternsion_onceToken, &__block_literal_global_38);
  return currentProcessIsRTTExternsion_AXIsRTTNotificationContentExtension;
}

void __44__HCUtilities_currentProcessIsRTTExternsion__block_invoke()
{
  id v0;

  HCApplicationGetMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  currentProcessIsRTTExternsion_AXIsRTTNotificationContentExtension = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.accessibility.RTTUI.RTTNotifications"));

}

+ (BOOL)currentProcessIsInCallService
{
  if (currentProcessIsInCallService_onceToken != -1)
    dispatch_once(&currentProcessIsInCallService_onceToken, &__block_literal_global_39);
  return currentProcessIsInCallService_AXIsInCallService;
}

void __44__HCUtilities_currentProcessIsInCallService__block_invoke()
{
  id v0;

  HCApplicationGetMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  currentProcessIsInCallService_AXIsInCallService = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.InCallService"));

}

+ (BOOL)currentProcessIsHealth
{
  if (currentProcessIsHealth_token != -1)
    dispatch_once(&currentProcessIsHealth_token, &__block_literal_global_40);
  return currentProcessIsHealth__AXIsProcess;
}

void __37__HCUtilities_currentProcessIsHealth__block_invoke()
{
  void *v0;
  int v1;

  HCApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.Health"));

  if (v1)
    currentProcessIsHealth__AXIsProcess = 1;
}

+ (BOOL)deviceIsMultiUser
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)MKBUserTypeDeviceMode();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D4E5A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4E5A8]);

  return v4;
}

+ (BOOL)deviceIsSmallPhone
{
  if (deviceIsSmallPhone_onceToken != -1)
    dispatch_once(&deviceIsSmallPhone_onceToken, &__block_literal_global_46);
  return deviceIsSmallPhone_deviceIsSmallPhone;
}

uint64_t __33__HCUtilities_deviceIsSmallPhone__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  deviceIsSmallPhone_deviceIsSmallPhone = ((result + 1) < 7) & (0x4Du >> (result + 1));
  return result;
}

+ (BOOL)deviceIsBigPhone
{
  if (deviceIsBigPhone_onceToken != -1)
    dispatch_once(&deviceIsBigPhone_onceToken, &__block_literal_global_49);
  return deviceIsBigPhone_deviceIsBigPhone;
}

uint64_t __31__HCUtilities_deviceIsBigPhone__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  deviceIsBigPhone_deviceIsBigPhone = ((result + 1) < 0x11) & (0x10401u >> (result + 1));
  return result;
}

+ (BOOL)watchSupportsPairingHearingAids
{
  return +[HCUtilities supportsLEA2](HCUtilities, "supportsLEA2");
}

+ (BOOL)supportsAlwaysListening
{
  if (supportsAlwaysListening_onceToken != -1)
    dispatch_once(&supportsAlwaysListening_onceToken, &__block_literal_global_50);
  return supportsAlwaysListening_supportsAlwaysListening;
}

uint64_t __38__HCUtilities_supportsAlwaysListening__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  supportsAlwaysListening_supportsAlwaysListening = result;
  return result;
}

+ (BOOL)supportsLEA2
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (supportsLEA2_onceToken != -1)
    dispatch_once(&supportsLEA2_onceToken, &__block_literal_global_53);
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This device support LEA 2.0 hearing aids: %hhd"), supportsLEA2_SupportsLEA2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "+[HCUtilities supportsLEA2]", 400, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)HAEngineeringLog;
  if (os_log_type_enabled((os_log_t)HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_retainAutorelease(v3);
    v6 = v4;
    *(_DWORD *)buf = 136446210;
    v9 = objc_msgSend(v5, "UTF8String");
    _os_log_impl(&dword_1B3CA7000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  return supportsLEA2_SupportsLEA2;
}

void __27__HCUtilities_supportsLEA2__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C97740], "controllerInfoAndReturnError:", 0);
  v0 = (id)objc_claimAutoreleasedReturnValue();
  supportsLEA2_SupportsLEA2 = objc_msgSend(v0, "leaVersion") == 2;

}

+ (int64_t)systemBootTime
{
  int64_t result;
  size_t v3;
  _QWORD v4[2];
  int v5[2];
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  result = systemBootTime___boottime;
  if (!systemBootTime___boottime)
  {
    v6 = 0;
    v4[1] = 0;
    *(_QWORD *)v5 = 0x1500000001;
    v3 = 16;
    v4[0] = 0;
    if (sysctl(v5, 2u, v4, &v3, 0, 0) == -1)
      result = 0;
    else
      result = v4[0];
    systemBootTime___boottime = result;
  }
  return result;
}

+ (BOOL)deviceIsWatch
{
  if (HCDeviceGetType__AXCurrentDeviceTypeOnceToken != -1)
    dispatch_once(&HCDeviceGetType__AXCurrentDeviceTypeOnceToken, &__block_literal_global_22_0);
  return HCDeviceGetType__HCDeviceType == 5;
}

+ (BOOL)deviceHasHomeButton
{
  if (deviceHasHomeButton_onceToken != -1)
    dispatch_once(&deviceHasHomeButton_onceToken, &__block_literal_global_57);
  return deviceHasHomeButton_hasHomeButton;
}

uint64_t __34__HCUtilities_deviceHasHomeButton__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  deviceHasHomeButton_hasHomeButton = (_DWORD)result != 2;
  return result;
}

+ (BOOL)isProtectedDataAvailable
{
  return MKBUserUnlockedSinceBoot() != 0;
}

+ (double)roundToPercentageValue:(double)a3
{
  double v3;

  if (a3 < 0.0)
    a3 = 0.0;
  if (a3 >= 1.0)
    v3 = 100.0;
  else
    v3 = a3 * 100.0;
  return (double)(int)llround(v3) / 100.0;
}

@end
