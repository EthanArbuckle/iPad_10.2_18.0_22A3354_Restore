@implementation DEPSkipKeys

+ (id)allSkipKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__DEPSkipKeys_allSkipKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allSkipKeys_onceToken != -1)
    dispatch_once(&allSkipKeys_onceToken, block);
  return (id)allSkipKeys_allSkipKeys;
}

void __26__DEPSkipKeys_allSkipKeys__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_iOS_skipKeys");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)allSkipKeys_allSkipKeys;
  allSkipKeys_allSkipKeys = v1;

}

+ (id)_visionOS_skipKeys
{
  _QWORD v3[43];

  v3[42] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("AccessibilityAppearance");
  v3[1] = CFSTR("ActionButton");
  v3[2] = CFSTR("Android");
  v3[3] = CFSTR("Appearance");
  v3[4] = CFSTR("AppleID");
  v3[5] = CFSTR("AppStore");
  v3[6] = CFSTR("Biometric");
  v3[7] = CFSTR("CameraButton");
  v3[8] = CFSTR("DeviceToDeviceMigration");
  v3[9] = CFSTR("DeviceProtection");
  v3[10] = CFSTR("Diagnostics");
  v3[11] = CFSTR("DisplayTone");
  v3[12] = CFSTR("EnableLockdownMode");
  v3[13] = CFSTR("ExpressLanguage");
  v3[14] = CFSTR("HomeButtonSensitivity");
  v3[15] = CFSTR("iMessageAndFaceTime");
  v3[16] = CFSTR("Intelligence");
  v3[17] = CFSTR("IntendedUser");
  v3[18] = CFSTR("Keyboard");
  v3[19] = CFSTR("Location");
  v3[20] = CFSTR("MessagingActivationUsingPhoneNumber");
  v3[21] = CFSTR("OnBoarding");
  v3[22] = CFSTR("Passcode");
  v3[23] = CFSTR("Payment");
  v3[24] = CFSTR("PreferredLanguage");
  v3[25] = CFSTR("Privacy");
  v3[26] = CFSTR("Restore");
  v3[27] = CFSTR("RestoreCompleted");
  v3[28] = CFSTR("Safety");
  v3[29] = CFSTR("ScreenTime");
  v3[30] = CFSTR("SIMSetup");
  v3[31] = CFSTR("Siri");
  v3[32] = CFSTR("SoftwareUpdate");
  v3[33] = CFSTR("SpokenLanguage");
  v3[34] = CFSTR("TapToSetup");
  v3[35] = CFSTR("TermsOfAddress");
  v3[36] = CFSTR("TOS");
  v3[37] = CFSTR("UpdateCompleted");
  v3[38] = CFSTR("WatchMigration");
  v3[39] = CFSTR("Welcome");
  v3[40] = CFSTR("WiFi");
  v3[41] = CFSTR("Zoom");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 42);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_iOS_skipKeys
{
  _QWORD v3[43];

  v3[42] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("AccessibilityAppearance");
  v3[1] = CFSTR("ActionButton");
  v3[2] = CFSTR("Android");
  v3[3] = CFSTR("Appearance");
  v3[4] = CFSTR("AppleID");
  v3[5] = CFSTR("AppStore");
  v3[6] = CFSTR("Biometric");
  v3[7] = CFSTR("CameraButton");
  v3[8] = CFSTR("DeviceToDeviceMigration");
  v3[9] = CFSTR("DeviceProtection");
  v3[10] = CFSTR("Diagnostics");
  v3[11] = CFSTR("DisplayTone");
  v3[12] = CFSTR("EnableLockdownMode");
  v3[13] = CFSTR("ExpressLanguage");
  v3[14] = CFSTR("HomeButtonSensitivity");
  v3[15] = CFSTR("iMessageAndFaceTime");
  v3[16] = CFSTR("Intelligence");
  v3[17] = CFSTR("IntendedUser");
  v3[18] = CFSTR("Keyboard");
  v3[19] = CFSTR("Location");
  v3[20] = CFSTR("MessagingActivationUsingPhoneNumber");
  v3[21] = CFSTR("OnBoarding");
  v3[22] = CFSTR("Passcode");
  v3[23] = CFSTR("Payment");
  v3[24] = CFSTR("PreferredLanguage");
  v3[25] = CFSTR("Privacy");
  v3[26] = CFSTR("Restore");
  v3[27] = CFSTR("RestoreCompleted");
  v3[28] = CFSTR("Safety");
  v3[29] = CFSTR("ScreenTime");
  v3[30] = CFSTR("SIMSetup");
  v3[31] = CFSTR("Siri");
  v3[32] = CFSTR("SoftwareUpdate");
  v3[33] = CFSTR("SpokenLanguage");
  v3[34] = CFSTR("TapToSetup");
  v3[35] = CFSTR("TermsOfAddress");
  v3[36] = CFSTR("TOS");
  v3[37] = CFSTR("UpdateCompleted");
  v3[38] = CFSTR("WatchMigration");
  v3[39] = CFSTR("Welcome");
  v3[40] = CFSTR("WiFi");
  v3[41] = CFSTR("Zoom");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 42);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_osx_skipKeys
{
  _QWORD v3[25];

  v3[24] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Accessibility");
  v3[1] = CFSTR("Appearance");
  v3[2] = CFSTR("AppleID");
  v3[3] = CFSTR("AppStore");
  v3[4] = CFSTR("Biometric");
  v3[5] = CFSTR("Diagnostics");
  v3[6] = CFSTR("DisplayTone");
  v3[7] = CFSTR("EnableLockdownMode");
  v3[8] = CFSTR("FileVault");
  v3[9] = CFSTR("iCloudDiagnostics");
  v3[10] = CFSTR("iCloudStorage");
  v3[11] = CFSTR("Intelligence");
  v3[12] = CFSTR("Location");
  v3[13] = CFSTR("Passcode");
  v3[14] = CFSTR("Payment");
  v3[15] = CFSTR("Privacy");
  v3[16] = CFSTR("Restore");
  v3[17] = CFSTR("ScreenTime");
  v3[18] = CFSTR("Siri");
  v3[19] = CFSTR("TermsOfAddress");
  v3[20] = CFSTR("TOS");
  v3[21] = CFSTR("UnlockWithWatch");
  v3[22] = CFSTR("Wallpaper");
  v3[23] = CFSTR("Welcome");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 24);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_tvOS_skipKeys
{
  _QWORD v3[14];

  v3[13] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("AppleID");
  v3[1] = CFSTR("Diagnostics");
  v3[2] = CFSTR("Language");
  v3[3] = CFSTR("Location");
  v3[4] = CFSTR("Privacy");
  v3[5] = CFSTR("Region");
  v3[6] = CFSTR("ScreenSaver");
  v3[7] = CFSTR("Siri");
  v3[8] = CFSTR("TapToSetup");
  v3[9] = CFSTR("TOS");
  v3[10] = CFSTR("TVHomeScreenSync");
  v3[11] = CFSTR("TVProviderSignIn");
  v3[12] = CFSTR("TVRoom");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_watchOS_skipKeys
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
