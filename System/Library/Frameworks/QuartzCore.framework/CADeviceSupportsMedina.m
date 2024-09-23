@implementation CADeviceSupportsMedina

uint64_t __CADeviceSupportsMedina_block_invoke()
{
  int AppBooleanValue;
  uint64_t result;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;
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
  __int128 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("CAEnableMedina"), CFSTR("com.apple.coreanimation"), &keyExistsAndHasValidFormat);
  v19 = xmmword_18475F368;
  v20 = 802516499;
  v17 = xmmword_18475F37C;
  v18 = -1919324456;
  v15 = xmmword_18475F390;
  v16 = 1127969586;
  v13 = xmmword_18475F3A4;
  v14 = 1292009573;
  v12 = 1214880059;
  v11 = xmmword_18475D5E8;
  v10 = 426359977;
  v9 = xmmword_18475D5FC;
  v8 = 1223847566;
  v7 = xmmword_18475D610;
  v6 = 185580364;
  v5 = xmmword_18475D624;
  result = MGIsDeviceOneOfType();
  if ((_DWORD)result)
    CADeviceSupportsMedina::medina = 1;
  if (keyExistsAndHasValidFormat)
  {
    result = MGGetSInt64Answer();
    if (AppBooleanValue)
      v3 = result == 33074 || result == 33088;
    else
      v3 = 0;
    CADeviceSupportsMedina::medina = v3;
  }
  return result;
}

@end
