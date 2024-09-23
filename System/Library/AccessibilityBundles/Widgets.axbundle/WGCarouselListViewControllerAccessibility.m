@implementation WGCarouselListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WGCarouselListViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WGCarouselListViewController"), CFSTR("setFooterVisible:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WGCarouselListViewController"), CFSTR("isVisuallyRevealed"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WGCarouselListViewController"), CFSTR("setVisuallyRevealed:"), "v", "B", 0);

}

- (void)setFooterVisible:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WGCarouselListViewControllerAccessibility;
  -[WGCarouselListViewControllerAccessibility setFooterVisible:](&v3, sel_setFooterVisible_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEF20]);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  objc_super v6;

  if (a3 == 4
    && (-[WGCarouselListViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isVisuallyRevealed")) & 1) == 0)
  {
    AXPerformSafeBlock();
    return 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WGCarouselListViewControllerAccessibility;
    return -[WGCarouselListViewControllerAccessibility accessibilityScroll:](&v6, sel_accessibilityScroll_, a3);
  }
}

void __65__WGCarouselListViewControllerAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setVisuallyRevealed:", 1);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
