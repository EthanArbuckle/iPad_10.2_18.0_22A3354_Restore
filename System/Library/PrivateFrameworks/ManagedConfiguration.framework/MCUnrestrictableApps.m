@implementation MCUnrestrictableApps

void __MCUnrestrictableApps_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E20];
  v5[0] = CFSTR("com.apple.appleseed.FeedbackAssistant");
  v5[1] = CFSTR("com.apple.Preferences");
  v5[2] = CFSTR("com.apple.TVSettings");
  v5[3] = CFSTR("com.apple.TapToRadar");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (MCCTHasTelephony())
    objc_msgSend(v2, "addObject:", CFSTR("com.apple.mobilephone"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)MCUnrestrictableApps_unrestrictableApps;
  MCUnrestrictableApps_unrestrictableApps = v3;

}

@end
