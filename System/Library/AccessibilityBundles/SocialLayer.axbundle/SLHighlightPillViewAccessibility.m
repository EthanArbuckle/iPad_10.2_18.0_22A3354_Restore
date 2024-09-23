@implementation SLHighlightPillViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SLHighlightPillView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SLHighlightPillView"), CFSTR("_attributionIdentifiers"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)_accessibilityAXAttributedLabel
{
  void *v2;
  void *v3;

  -[SLHighlightPillViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_attributionIdentifiers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA60]), "initWithString:", CFSTR(" "));
    objc_msgSend(v3, "setAttribute:forKey:withRange:", v2, *MEMORY[0x24BDFEC70], objc_msgSend(v3, "length") - 1, 1);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
