@implementation SymbolCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SymbolCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SymbolCollectionViewCell"), CFSTR("_symbolName"), "NSString");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SymbolCollectionViewCell"), CFSTR("_showsSelection"), "BOOL");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SymbolCollectionViewCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_symbolName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  profileSymbolAccessibilityLabel(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SymbolCollectionViewCellAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[SymbolCollectionViewCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[SymbolCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_showsSelection"));
  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v3 | v5;
}

@end
