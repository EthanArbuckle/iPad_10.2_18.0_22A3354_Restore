@implementation HostViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthExperienceUI.HostViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGPoint result;

  -[HostViewCellAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "accessibilityActivationPoint");
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HostViewCellAccessibility;
    -[HostViewCellAccessibility accessibilityActivationPoint](&v12, sel_accessibilityActivationPoint);
  }
  v8 = v6;
  v9 = v7;

  v10 = v8;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

uint64_t __57__HostViewCellAccessibility_accessibilityActivationPoint__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HostViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[HostViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
