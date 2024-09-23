@implementation BKUIUtils

+ (id)nameForMessage:(unsigned int)a3
{
  __CFString *v3;
  uint64_t v5;

  v3 = CFSTR("No fingers enrolled");
  switch(a3)
  {
    case 0u:
      return v3;
    case 0x33u:
      return CFSTR("Matching failed");
    case 0x39u:
      return CFSTR("Template list not updated");
    case 0x3Au:
      return CFSTR("Matching stopped");
    case 0x3Bu:
      return CFSTR("Sensor in finger detect");
    case 0x3Cu:
      return CFSTR("Task paused");
    case 0x3Du:
      return CFSTR("Task resumed");
    case 0x3Eu:
      return CFSTR("Task resume failed");
    case 0x3Fu:
      return CFSTR("Finger on");
    case 0x40u:
      return CFSTR("Finger off");
    case 0x41u:
      return CFSTR("Enrolment complete");
    case 0x42u:
      return CFSTR("Enrolment canceled");
    case 0x43u:
      return CFSTR("Enrolment failed");
    case 0x44u:
      return CFSTR("Enrolment timed out");
    case 0x45u:
      return CFSTR("Unknown error");
    case 0x46u:
      return CFSTR("Image rejected");
    case 0x47u:
      return CFSTR("No calibration");
    case 0x48u:
      return CFSTR("Image ready for processing");
    case 0x49u:
      return CFSTR("Template list updated");
    case 0x4Au:
      return CFSTR("Request finger off");
    case 0x4Bu:
      return CFSTR("Autonomous matching started");
    case 0x4Cu:
      return CFSTR("Autonomous matching stopped");
    case 0x4Du:
      return CFSTR("Capture restart");
    case 0x4Eu:
      return CFSTR("Scan too short");
    case 0x4Fu:
      return CFSTR("Autonomous matching started by home button");
    case 0x50u:
      return CFSTR("Matching cancelled");
    case 0x51u:
      return CFSTR("Scan before first unlock");
    case 0x52u:
      return CFSTR("Scan in passcode lockout");
    case 0x53u:
      return CFSTR("Scan in biometric lockout");
    case 0x54u:
      return CFSTR("ESD recovery");
    case 0x55u:
      return CFSTR("Image rejected (unknown)");
    case 0x56u:
      return CFSTR("Image rejected (bad blocks)");
    case 0x57u:
      return CFSTR("Image rejected (ChFPN)");
    case 0x58u:
      return CFSTR("Image rejected (CaFPN)");
    case 0x59u:
      return CFSTR("Sensor idle");
    case 0x5Au:
      return CFSTR("Sensor capturing");
    case 0x5Bu:
      return CFSTR("Sensor paused");
    case 0x5Cu:
      return CFSTR("Scan when biometric token expired");
    case 0x62u:
      return CFSTR("Image rejected (Movement)");
    case 0x63u:
      return CFSTR("Finger detect canceled");
    default:
      if (a3 - 1 <= 0x31)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enrolment %d"), *(_QWORD *)&a3, v5);
LABEL_45:
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v3;
      }
      if (a3 >= 0x64)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Progress: %d/255 = %d %%"), a3 - 100, ((int)(100 * (a3 - 100)) / 255));
        goto LABEL_45;
      }
      v3 = CFSTR("Unknown status code");
      return v3;
  }
}

+ (void)resetScreenDimming
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1DB281000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "BiometricKitUI: Reset screen dimming", v0, 2u);
}

+ (void)vibrateWithIntensity:(float)a3 withPattern:(id)a4
{
  id v5;
  void *v6;
  double v7;
  void *v8;

  v5 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    +[BKUIUtils vibrateWithIntensity:withPattern:].cold.1((uint64_t)v5, a3);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("Intensity"));

  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("VibePattern"));
  AudioServicesPlaySystemSoundWithVibration();

}

+ (void)vibrateForBiometricEvent:(BOOL)a3
{
  _BOOL4 v3;
  double v4;
  void *v5;

  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    +[BKUIUtils vibrateForBiometricEvent:].cold.1(v3);
  if (v3)
    v5 = &unk_1EA298980;
  else
    v5 = &unk_1EA298998;
  LODWORD(v4) = 1.0;
  +[BKUIUtils vibrateWithIntensity:withPattern:](BKUIUtils, "vibrateWithIntensity:withPattern:", v5, v4);
}

+ (int64_t)activeInterfaceOrientationForView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isFrontBoard"))
  {

LABEL_4:
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "activeInterfaceOrientation");
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.springboard"));

  if (v7)
    goto LABEL_4;
  objc_msgSend(v3, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windows");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "filteredArrayUsingPredicate:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v16, "interfaceOrientation");

    goto LABEL_6;
  }
  objc_msgSend(v3, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "interfaceOrientation");
LABEL_5:
  v10 = v9;
LABEL_6:

  return v10;
}

uint64_t __47__BKUIUtils_activeInterfaceOrientationForView___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isKeyWindow");
}

+ (void)vibrateWithIntensity:(uint64_t)a1 withPattern:(float)a2 .cold.1(uint64_t a1, float a2)
{
  int v2;
  double v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 134218242;
  v3 = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_1DB281000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "BiometricKitUI: Vibrate with intensity: %f, and with pattern: %@", (uint8_t *)&v2, 0x16u);
}

+ (void)vibrateForBiometricEvent:(char)a1 .cold.1(char a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = a1 & 1;
  _os_log_debug_impl(&dword_1DB281000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "BiometricKitUI: Vibrate for good biometric event: %i", (uint8_t *)v1, 8u);
}

@end
