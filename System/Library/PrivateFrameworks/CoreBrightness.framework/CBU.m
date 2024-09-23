@implementation CBU

void __CBU_SyncDisplayStateControlSupported_block_invoke(uint64_t a1)
{
  _OWORD *v1;
  _QWORD v2[15];
  os_log_t log;
  os_log_type_t v4[4];
  uint8_t *buf;
  NSObject *v6;
  os_log_t v7;
  NSObject *inited;
  _QWORD *v9;
  _OWORD *v10;
  int v11;
  os_log_type_t type;
  os_log_t oslog;
  Boolean AppBooleanValue;
  Boolean keyExistsAndHasValidFormat;
  uint64_t v16;
  uint64_t v17;
  _BYTE v18[16];
  __int128 v19;
  int v20;
  __int128 v21;
  int v22;
  _OWORD v23[2];
  char v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;
  uint64_t v34;

  v10 = v23;
  v34 = *MEMORY[0x1E0C80C00];
  v17 = a1;
  v16 = a1;
  v11 = 1;
  if (!CBU_IsWatch())
  {
    v1 = v10;
    v10[22] = xmmword_1B5461680;
    *((_DWORD *)v1 + 92) = -1820426635;
    v1[20] = xmmword_1B5461694;
    *((_DWORD *)v1 + 84) = -937652876;
    v1[18] = xmmword_1B54616A8;
    *((_DWORD *)v1 + 76) = 1874287171;
    v1[16] = xmmword_1B54616BC;
    *((_DWORD *)v1 + 68) = -781324731;
    v1[14] = xmmword_1B54616D0;
    *((_DWORD *)v1 + 60) = -609570151;
    v1[12] = xmmword_1B54616E4;
    *((_DWORD *)v1 + 52) = -874769875;
    v1[10] = xmmword_1B54616F8;
    *((_DWORD *)v1 + 44) = 1214880059;
    v1[8] = xmmword_1B546170C;
    *((_DWORD *)v1 + 36) = 426359977;
    v1[6] = xmmword_1B5461720;
    *((_DWORD *)v1 + 28) = 1223847566;
    v1[4] = xmmword_1B5461734;
    *((_DWORD *)v1 + 20) = 185580364;
    v1[2] = xmmword_1B5461748;
    *((_DWORD *)v1 + 12) = 958549802;
    v23[0] = xmmword_1B546175C;
    *((_DWORD *)v1 + 4) = -12497897;
    v21 = xmmword_1B5461770;
    v22 = 1377540371;
    v19 = xmmword_1B5461784;
    v20 = -518121279;
    v9 = v2;
    v2[0] = &v33;
    v2[1] = &v32;
    v2[2] = &v31;
    v2[3] = &v30;
    v2[4] = &v29;
    v2[5] = &v28;
    v2[6] = &v27;
    v2[7] = &v26;
    v2[8] = &v25;
    v2[9] = &v24;
    v2[10] = v23;
    v2[11] = &v21;
    v2[12] = &v19;
    v2[13] = 0;
    v2[14] = 0;
    v11 = MGIsDeviceOneOfType();
  }
  CBU_SyncDisplayStateControlSupported_SDSCEnabled = v11 & 1;
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("SynchronousDisplayStateControl"), (CFStringRef)*MEMORY[0x1E0C9B248], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    CBU_SyncDisplayStateControlSupported_SDSCEnabled = AppBooleanValue != 0;
    oslog = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT || init_default_corebrightness_log())
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v7 = inited;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        v6 = init_default_corebrightness_log();
      v7 = v6;
    }
    oslog = v7;
    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      *(_DWORD *)v4 = type;
      buf = v18;
      __os_log_helper_16_0_1_4_0((uint64_t)v18, AppBooleanValue);
      _os_log_impl(&dword_1B5291000, log, v4[0], "Synchronous display state control default override -> %i ", buf, 8u);
    }
  }
}

uint64_t __CBU_ForceUpdateFrequencyAndFrameSkip_block_invoke()
{
  uint64_t result;

  result = MGIsDeviceOneOfType();
  CBU_ForceUpdateFrequencyAndFrameSkip_force = result & 1;
  return result;
}

uint64_t __CBU_ForceFrameAfterBrightnessUpdate_block_invoke()
{
  uint64_t result;

  CBU_ForceFrameAfterBrightnessUpdate_force = (CBU_ForceFrameAfterBrightnessUpdate_force & 1 | MGIsDeviceOneOfType() & 1) != 0;
  CBU_ForceFrameAfterBrightnessUpdate_force = (CBU_ForceFrameAfterBrightnessUpdate_force & 1 | MGIsDeviceOneOfType() & 1) != 0;
  CBU_ForceFrameAfterBrightnessUpdate_force = (CBU_ForceFrameAfterBrightnessUpdate_force & 1 | MGIsDeviceOneOfType() & 1) != 0;
  CBU_ForceFrameAfterBrightnessUpdate_force = (CBU_ForceFrameAfterBrightnessUpdate_force & 1 | MGIsDeviceOneOfType() & 1) != 0;
  CBU_ForceFrameAfterBrightnessUpdate_force = (CBU_ForceFrameAfterBrightnessUpdate_force & 1 | MGIsDeviceOneOfType() & 1) != 0;
  CBU_ForceFrameAfterBrightnessUpdate_force = (CBU_ForceFrameAfterBrightnessUpdate_force & 1 | MGIsDeviceOneOfType() & 1) != 0;
  result = MGIsDeviceOneOfType();
  CBU_ForceFrameAfterBrightnessUpdate_force = (CBU_ForceFrameAfterBrightnessUpdate_force & 1 | result & 1) != 0;
  return result;
}

uint64_t __CBU_PassContrastEnhancerStrengthThroughSyncDBV_block_invoke()
{
  uint64_t result;
  char v1;
  char v2;
  char v3;
  char v4;

  v4 = 0;
  if ((CBU_PassContrastEnhancerStrengthThroughSyncDBV_pass & 1) != 0)
  {
    result = MGIsDeviceOneOfType();
    v4 = result ^ 1;
  }
  CBU_PassContrastEnhancerStrengthThroughSyncDBV_pass = v4 & 1;
  v3 = 0;
  if ((v4 & 1) != 0)
  {
    result = MGIsDeviceOneOfType();
    v3 = result ^ 1;
  }
  CBU_PassContrastEnhancerStrengthThroughSyncDBV_pass = v3 & 1;
  v2 = 0;
  if ((v3 & 1) != 0)
  {
    result = MGIsDeviceOneOfType();
    v2 = result ^ 1;
  }
  CBU_PassContrastEnhancerStrengthThroughSyncDBV_pass = v2 & 1;
  v1 = 0;
  if ((v2 & 1) != 0)
  {
    result = MGIsDeviceOneOfType();
    v1 = result ^ 1;
  }
  CBU_PassContrastEnhancerStrengthThroughSyncDBV_pass = v1 & 1;
  return result;
}

uint64_t __CBU_IsSecureIndicatorSupported_block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD v2[12];
  __int128 v3;
  int v4;
  __int128 v5;
  int v6;
  __int128 v7;
  int v8;
  __int128 v9;
  int v10;
  __int128 v11;
  int v12;
  __int128 v13;
  int v14;
  __int128 v15;
  int v16;
  __int128 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2[11] = a1;
  v2[10] = a1;
  v17 = xmmword_1B54619C8;
  v18 = 802516499;
  v15 = xmmword_1B54619DC;
  v16 = -1919324456;
  v13 = xmmword_1B54619F0;
  v14 = 1127969586;
  v11 = xmmword_1B5461A04;
  v12 = 1292009573;
  v9 = xmmword_1B5461A18;
  v10 = 1223847566;
  v7 = xmmword_1B5461A2C;
  v8 = 185580364;
  v5 = xmmword_1B5461A40;
  v6 = 1214880059;
  v3 = xmmword_1B5461A54;
  v4 = 426359977;
  v2[9] = v2;
  v2[0] = &v15;
  v2[1] = &v13;
  v2[2] = &v11;
  v2[3] = &v9;
  v2[4] = &v7;
  v2[5] = &v5;
  v2[6] = &v3;
  v2[7] = 0;
  v2[8] = 0;
  result = MGIsDeviceOneOfType();
  CBU_IsSecureIndicatorSupported_supported = result & 1;
  return result;
}

uint64_t __CBU_RampLumaBoostFactorInAOD_block_invoke()
{
  uint64_t result;

  result = MGIsDeviceOneOfType();
  CBU_RampLumaBoostFactorInAOD_result = result & 1;
  return result;
}

uint64_t __CBU_ShouldNotHandleExistingInternalDisplayAttachment_block_invoke()
{
  uint64_t result;

  result = MGIsDeviceOneOfType();
  CBU_ShouldNotHandleExistingInternalDisplayAttachment_result = result & 1;
  return result;
}

@end
