@implementation MCAlwaysRestrictedAppsInEDUMode

void __MCAlwaysRestrictedAppsInEDUMode_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.tips");
  v4[1] = CFSTR("com.apple.Home");
  v4[2] = CFSTR("com.apple.ScreenTimeWidgetApplication");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)MCAlwaysRestrictedAppsInEDUMode_restrictedApps;
  MCAlwaysRestrictedAppsInEDUMode_restrictedApps = v2;

}

@end
