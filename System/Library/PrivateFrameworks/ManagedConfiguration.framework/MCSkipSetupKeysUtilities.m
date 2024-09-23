@implementation MCSkipSetupKeysUtilities

+ (id)allSkipKeys
{
  if (allSkipKeys_onceToken != -1)
    dispatch_once(&allSkipKeys_onceToken, &__block_literal_global_18);
  return (id)allSkipKeys_allSkipKeys;
}

void __39__MCSkipSetupKeysUtilities_allSkipKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[44];

  v2[43] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("AppStore");
  v2[1] = CFSTR("SIMSetup");
  v2[2] = CFSTR("ScreenTime");
  v2[3] = CFSTR("AccessibilityAppearance");
  v2[4] = CFSTR("Android");
  v2[5] = CFSTR("Appearance");
  v2[6] = CFSTR("AppleID");
  v2[7] = CFSTR("N/A");
  v2[8] = CFSTR("Biometric");
  v2[9] = CFSTR("CloudStorage");
  v2[10] = CFSTR("DeviceProtection");
  v2[11] = CFSTR("DeviceToDeviceMigration");
  v2[12] = CFSTR("Diagnostics");
  v2[13] = CFSTR("DisplayTone");
  v2[14] = CFSTR("ExpressLanguage");
  v2[15] = CFSTR("HomeButtonSensitivity");
  v2[16] = CFSTR("Keyboard");
  v2[17] = CFSTR("Language");
  v2[18] = CFSTR("Location");
  v2[19] = CFSTR("EnableLockdownMode");
  v2[20] = CFSTR("MessagingActivationUsingPhoneNumber");
  v2[21] = CFSTR("OnBoarding");
  v2[22] = CFSTR("Passcode");
  v2[23] = CFSTR("Payment");
  v2[24] = CFSTR("PreferredLanguage");
  v2[25] = CFSTR("Privacy");
  v2[26] = CFSTR("Region");
  v2[27] = CFSTR("Restore");
  v2[28] = CFSTR("RestoreCompleted");
  v2[29] = CFSTR("Siri");
  v2[30] = CFSTR("SpokenLanguage");
  v2[31] = CFSTR("TOS");
  v2[32] = CFSTR("TapToSetup");
  v2[33] = CFSTR("UpdateCompleted");
  v2[34] = CFSTR("WatchMigration");
  v2[35] = CFSTR("Welcome");
  v2[36] = CFSTR("iMessageAndFaceTime");
  v2[37] = CFSTR("SoftwareUpdate");
  v2[38] = CFSTR("TermsOfAddress");
  v2[39] = CFSTR("WiFi");
  v2[40] = CFSTR("IntendedUser");
  v2[41] = CFSTR("Safety");
  v2[42] = CFSTR("ActionButton");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 43);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allSkipKeys_allSkipKeys;
  allSkipKeys_allSkipKeys = v0;

}

@end
