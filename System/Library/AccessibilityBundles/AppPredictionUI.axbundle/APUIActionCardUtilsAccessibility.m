@implementation APUIActionCardUtilsAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("APUIActionCardUtils");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("APUIActionCardUtils"), CFSTR("_generateCardSectionWithInfo:config:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("APUIActionCardViewConfig"), CFSTR("bundleId"), "@", 0);

}

+ (id)_generateCardSectionWithInfo:(id)a3 config:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___APUIActionCardUtilsAccessibility;
  v5 = a4;
  objc_msgSendSuper2(&v9, sel__generateCardSectionWithInfo_config_, a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("bundleId"), v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_accessibilitySetRetainedValue:forKey:", v7, *MEMORY[0x24BDBD288]);
  return v6;
}

@end
