@implementation SASSystemStateAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SASSystemState");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SASSystemState"), CFSTR("isConnectedToEyesFreeDevice"), "B", 0);
}

- (BOOL)isConnectedToEyesFreeDevice
{
  void *v3;
  char v4;
  objc_super v6;

  v3 = (void *)objc_opt_new();
  v4 = objc_msgSend(v3, "isClarityBoardEnabled");

  if ((v4 & 1) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)SASSystemStateAccessibility;
  return -[SASSystemStateAccessibility isConnectedToEyesFreeDevice](&v6, sel_isConnectedToEyesFreeDevice);
}

@end
