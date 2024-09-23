@implementation DOCCopyableLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("com_apple_DocumentManager_Service.DOCCopyableLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCCopyableLabel"), CFSTR("copyDetail"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCCopyableLabel"), CFSTR("handleTapWithSender:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("com_apple_DocumentManager_Service.DOCCopyableLabel"), CFSTR("supportsCopy"), "Bool");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("com_apple_DocumentManager_Service.DOCCopyableLabel"), CFSTR("behaveAsLink"), "Bool");

}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCCopyableLabelAccessibility;
  v3 = -[DOCCopyableLabelAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  if (-[DOCCopyableLabelAccessibility _axHasCopyGesture](self, "_axHasCopyGesture"))
    v4 = ~*MEMORY[0x24BDF73B0];
  else
    v4 = -1;
  return v4 & v3;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)DOCCopyableLabelAccessibility;
  -[DOCCopyableLabelAccessibility accessibilityCustomActions](&v9, sel_accessibilityCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  if (-[DOCCopyableLabelAccessibility _axHasCopyGesture](self, "_axHasCopyGesture"))
  {
    v5 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("copy"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithName:target:selector:", v6, self, sel__axCopyDetail);
    objc_msgSend(v3, "addObject:", v7);

  }
  return v3;
}

- (void)_axCopyDetail
{
  AXPerformSafeBlock();
}

uint64_t __46__DOCCopyableLabelAccessibility__axCopyDetail__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "copyDetail");
}

- (BOOL)_axHasCopyGesture
{
  void *v2;
  BOOL v3;

  -[DOCCopyableLabelAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("supportsCopy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_axBehavesAsLink
{
  void *v2;
  BOOL v3;

  -[DOCCopyableLabelAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("behaveAsLink"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)accessibilityActivate
{
  _BOOL4 v3;
  id v4;

  v3 = -[DOCCopyableLabelAccessibility _axBehavesAsLink](self, "_axBehavesAsLink");
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDF6E80]);
    objc_msgSend(v4, "setState:", 3);
    -[DOCCopyableLabelAccessibility handleTapWithSender:](self, "handleTapWithSender:", v4);

  }
  return v3;
}

@end
