@implementation SLHighlightDisambiguationPillViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SLHighlightDisambiguationPillView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SLHighlightDisambiguationPillView"), CFSTR("attribution"), "@", 0);
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
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_opt_class();
  -[SLHighlightDisambiguationPillViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("attribution"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA60]), "initWithString:", CFSTR(" "));
    objc_msgSend(v4, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAttribute:forKey:withRange:", v8, *MEMORY[0x24BDFEC70], objc_msgSend(v7, "length") - 1, 1);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
