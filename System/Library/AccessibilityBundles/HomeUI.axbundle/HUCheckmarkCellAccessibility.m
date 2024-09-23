@implementation HUCheckmarkCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUCheckmarkCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUCheckmarkCell"), CFSTR("_checked"), "B");
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUCheckmarkCellAccessibility;
  v3 = -[HUCheckmarkCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[HUCheckmarkCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_checked"));
  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

@end
