@implementation _TVMonogramViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVMonogramView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVMonogramView"), CFSTR("imageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVMonogramView"), CFSTR("configuration"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVMonogramView"), CFSTR("monogramDescription"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVMonogramViewConfiguration"), CFSTR("focusedSizeIncrease"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVMonogramDescription"), CFSTR("cornerRadius"), "d", 0);

}

- (id)accessibilityPath
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[_TVMonogramViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_accessibilityCirclePathBasedOnBoundsWidth");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
