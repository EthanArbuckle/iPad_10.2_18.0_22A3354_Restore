@implementation UIImage(HeartRhythmUI)

+ (id)hrui_screenWidthImageWithName:()HeartRhythmUI
{
  id v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x24BDF6D38], "hrui_currentDeviceHasSmallPhoneScreen") & 1) != 0)
  {
    v4 = CFSTR("_320w");
LABEL_7:
    objc_msgSend(v3, "stringByAppendingString:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v5;
    goto LABEL_8;
  }
  if ((objc_msgSend(MEMORY[0x24BDF6D38], "hrui_currentDeviceHasMediumPhoneScreen") & 1) != 0)
  {
    v4 = CFSTR("_375w");
    goto LABEL_7;
  }
  if (objc_msgSend(MEMORY[0x24BDF6D38], "hrui_currentDeviceHasLargePhoneScreen"))
  {
    v4 = CFSTR("_414w");
    goto LABEL_7;
  }
LABEL_8:
  v6 = (void *)MEMORY[0x24BDF6AC8];
  HRHeartRhythmUIFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageNamed:inBundle:compatibleWithTraitCollection:", v3, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (__CFString)_watchImageName
{
  void *v0;
  _QWORD *v1;
  void *v2;
  __CFString *v3;
  _Unwind_Exception *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x24BDD3D78], "activeNonFamilySetupDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v1 = (_QWORD *)getNRDevicePropertyProductTypeSymbolLoc_ptr;
  v10 = getNRDevicePropertyProductTypeSymbolLoc_ptr;
  if (!getNRDevicePropertyProductTypeSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __getNRDevicePropertyProductTypeSymbolLoc_block_invoke;
    v6[3] = &unk_24D34A970;
    v6[4] = &v7;
    __getNRDevicePropertyProductTypeSymbolLoc_block_invoke((uint64_t)v6);
    v1 = (_QWORD *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v1)
  {
    v5 = (_Unwind_Exception *)+[UIImage(HeartRhythmUI) _watchImageName].cold.1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v5);
  }
  objc_msgSend(v0, "valueForProperty:", *v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("Watch6,18")))
  {
    objc_msgSend(CFSTR("ECG_onboarding_wrist"), "stringByAppendingString:", CFSTR("_alt"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("ECG_onboarding_wrist");
  }

  return v3;
}

+ (id)hrui_ECGOnboardingWristImage
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(a1, "_watchImageName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hrui_screenWidthImageWithName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)hrui_cannotDoImage
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDF6AC8];
  HRHeartRhythmUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("cannot_do"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hrui_warningImage
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDF6AC8];
  HRHeartRhythmUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("warning"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hrui_ECGAppIconImage
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDF6AC8];
  HRHeartRhythmUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("ECG_app_icon"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hrui_fingerCrownImage
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDF6AC8];
  HRHeartRhythmUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("finger_crown"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hrui_waveformImage
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDF6AC8];
  HRHeartRhythmUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("waveform"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hrui_atrialFibrillationDetectionIllustrationImage
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDF6AC8];
  HRHeartRhythmUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("afib_detection_illustration"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hrui_heartRateIconImage
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDF6AC8];
  HRHeartRhythmUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("heart_rate_icon"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hrui_watchIconImage
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDF6AC8];
  HRHeartRhythmUIFrameworkBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("watch_icon"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)_watchImageName
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __43__AVURLAsset_HeartRhythmUI__hrui_assetSize__block_invoke_cold_1(v0);
}

@end
