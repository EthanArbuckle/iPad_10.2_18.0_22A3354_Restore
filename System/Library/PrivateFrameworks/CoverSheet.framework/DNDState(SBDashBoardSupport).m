@implementation DNDState(SBDashBoardSupport)

- (uint64_t)sb_isDimmingModeActive
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "activeModeConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "_isDNDSettingEnabled:", objc_msgSend(v2, "dimsLockScreen"));

  return v3;
}

- (uint64_t)sb_isDrivingModeActive
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "activeModeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.donotdisturb.mode.driving"));

  return v2;
}

- (uint64_t)sb_isBedtimeModeActive
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "activeModeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.donotdisturb.mode.bedtime")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DA8430]) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D4F9A0]);
  }

  return v2;
}

- (BOOL)_isDNDSettingEnabled:()SBDashBoardSupport
{
  return DNDResolvedDimsLockScreenSetting() == 2;
}

@end
