@implementation AXSpringBoardSetScreenCurtainEnabled

void __AXSpringBoardSetScreenCurtainEnabled_block_invoke()
{
  void *v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBLockScreenManager")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey");
  v3[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "unlockUIFromSource:withOptions:", 8, v1);

}

void __AXSpringBoardSetScreenCurtainEnabled_block_invoke_2()
{
  id v0;

  BKSHIDServicesSetBacklightFactorWithFadeDuration();
  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBBacklightController")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setBacklightState:source:animated:completion:", 1, 1, 1, &__block_literal_global_723);

}

@end
