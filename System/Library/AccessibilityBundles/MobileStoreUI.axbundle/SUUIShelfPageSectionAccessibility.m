@implementation SUUIShelfPageSectionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIShelfPageSection");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIShelfPageSectionAccessibility;
  -[SUUIShelfPageSectionAccessibility collectionView:didSelectItemAtIndexPath:](&v4, sel_collectionView_didSelectItemAtIndexPath_, a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
