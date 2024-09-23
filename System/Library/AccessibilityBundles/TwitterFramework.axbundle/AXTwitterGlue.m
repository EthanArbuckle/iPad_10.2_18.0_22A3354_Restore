@implementation AXTwitterGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:", &__block_literal_global, &__block_literal_global_176, &__block_literal_global_182);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXTwitterGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __46__AXTwitterGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __46__AXTwitterGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;

  objc_msgSend(a2, "setOverrideProcessName:", CFSTR("Twitter"));
  v2 = AXPerformValidationChecks();
  if ((_DWORD)v2)
    NSLog(CFSTR("************* Validating Symbols for AXTwitterGlue *************"));
  return v2;
}

void __46__AXTwitterGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    NSLog(CFSTR("************* Errors validating AXTwitterGlue. Encountered %lu errors *************"), a3);
  else
    NSLog(CFSTR("************* Validated AXTwitterGlue successfully *************"));
}

@end
