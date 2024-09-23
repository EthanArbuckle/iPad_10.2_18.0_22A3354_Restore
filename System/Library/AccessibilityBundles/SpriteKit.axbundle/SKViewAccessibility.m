@implementation SKViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKView"), CFSTR("scene"), "@", 0);
}

- (id)_accessibilitySpriteKitScene
{
  return (id)-[SKViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("scene"));
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SKViewAccessibility _accessibilitySpriteKitScene](self, "_accessibilitySpriteKitScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    objc_msgSend(v3, "setAccessibilityContainer:", self);
  objc_msgSend(MEMORY[0x24BDBCEB8], "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKViewAccessibility _accessibilitySortedElementsWithin](self, "_accessibilitySortedElementsWithin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "addObjectsFromArray:", v6);

  return v5;
}

@end
