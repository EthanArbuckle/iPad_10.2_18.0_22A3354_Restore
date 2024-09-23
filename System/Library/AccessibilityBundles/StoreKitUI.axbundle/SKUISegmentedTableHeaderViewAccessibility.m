@implementation SKUISegmentedTableHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUISegmentedTableHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUISegmentedTableHeaderView"), CFSTR("setSegmentedControl:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUSegmentedControl"), CFSTR("_segmentedControl"), "UISegmentedControl");

}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (void)setSegmentedControl:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUISegmentedTableHeaderViewAccessibility;
  v3 = a3;
  -[SKUISegmentedTableHeaderViewAccessibility setSegmentedControl:](&v4, sel_setSegmentedControl_, v3);
  objc_msgSend(v3, "setShouldGroupAccessibilityChildren:", 0, v4.receiver, v4.super_class);

}

- (int64_t)_accessibilitySortPriority
{
  return 1;
}

@end
