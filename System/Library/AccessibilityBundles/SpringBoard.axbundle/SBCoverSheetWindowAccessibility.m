@implementation SBCoverSheetWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBCoverSheetWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityIdentifier
{
  return CFSTR("SBCoverSheetWindow");
}

- (BOOL)accessibilityElementsHidden
{
  BOOL v2;
  void *v3;
  int v4;
  void *v6;
  char v7;

  v2 = AXRequestingClient() == 16 || AXRequestingClient() == 2;
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isContinuitySessionActive");

  if (v4 && v2)
    return 1;
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isControlCenterVisible");

  return v7;
}

@end
