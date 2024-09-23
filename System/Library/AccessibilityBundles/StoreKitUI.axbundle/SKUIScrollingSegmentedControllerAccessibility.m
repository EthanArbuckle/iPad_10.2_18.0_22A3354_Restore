@implementation SKUIScrollingSegmentedControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIScrollingSegmentedController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIScrollingSegmentedController"), CFSTR("_focusedViewControllerIndex"), "Q");
}

- (void)scrollingSegmentedControllerCollectionViewDidLayoutSubviews:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  -[SKUIScrollingSegmentedControllerAccessibility valueForKey:](self, "valueForKey:", CFSTR("_focusedViewControllerIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  v9.receiver = self;
  v9.super_class = (Class)SKUIScrollingSegmentedControllerAccessibility;
  -[SKUIScrollingSegmentedControllerAccessibility scrollingSegmentedControllerCollectionViewDidLayoutSubviews:](&v9, sel_scrollingSegmentedControllerCollectionViewDidLayoutSubviews_, v4);

  -[SKUIScrollingSegmentedControllerAccessibility valueForKey:](self, "valueForKey:", CFSTR("_focusedViewControllerIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  if (v6 != v8)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
