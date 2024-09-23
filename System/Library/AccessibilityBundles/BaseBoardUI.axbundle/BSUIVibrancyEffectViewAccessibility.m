@implementation BSUIVibrancyEffectViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BSUIVibrancyEffectView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BSUIVibrancyEffectView"), CFSTR("isEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BSUIVibrancyEffectView"), CFSTR("contentView"), "@", 0);

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[BSUIVibrancyEffectViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEnabled")))
  {
    -[BSUIVibrancyEffectViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("contentView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_0);
    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)BSUIVibrancyEffectViewAccessibility;
    -[BSUIVibrancyEffectViewAccessibility accessibilityElements](&v6, sel_accessibilityElements);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

uint64_t __60__BSUIVibrancyEffectViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilitySetOverridesInvisibility:", 1);
}

@end
