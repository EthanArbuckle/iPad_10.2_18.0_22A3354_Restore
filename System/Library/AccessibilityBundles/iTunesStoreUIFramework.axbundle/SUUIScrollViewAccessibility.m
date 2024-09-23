@implementation SUUIScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setTopExtensionViewColor:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIScrollViewAccessibility;
  -[SUUIScrollViewAccessibility setTopExtensionViewColor:](&v5, sel_setTopExtensionViewColor_, a3);
  -[SUUIScrollViewAccessibility viewWithTag:](self, "viewWithTag:", 800);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityViewIsModal:", 0);

}

@end
