@implementation SBStarkIconWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBStarkIconWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[SBStarkIconWindowAccessibility _accessibilityFindDescendant:](self, "_accessibilityFindDescendant:", &__block_literal_global_12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

uint64_t __62__SBStarkIconWindowAccessibility_accessibilityActivationPoint__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAccessibilityElement");
}

@end
