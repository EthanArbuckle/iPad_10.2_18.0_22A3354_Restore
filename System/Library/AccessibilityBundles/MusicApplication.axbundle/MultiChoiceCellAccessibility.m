@implementation MultiChoiceCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.MultiChoiceCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.MultiChoiceCell"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.MultiChoiceCell"), CFSTR("subtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.MultiChoiceCell"), CFSTR("accessibilityIsSelectedChoice"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[MultiChoiceCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("title, subtitle"));
}

- (unint64_t)accessibilityTraits
{
  int v3;
  unint64_t v4;
  objc_super v6;

  v3 = -[MultiChoiceCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsSelectedChoice"));
  v6.receiver = self;
  v6.super_class = (Class)MultiChoiceCellAccessibility;
  v4 = -[MultiChoiceCellAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  if (v3)
    return *MEMORY[0x24BDF7400] | v4;
  else
    return v4 & ~*MEMORY[0x24BDF7400];
}

@end
