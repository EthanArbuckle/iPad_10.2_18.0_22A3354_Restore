@implementation PUFeedViewControllerPhoneSpecAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUFeedViewControllerPhoneSpec");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)configureTextCell:(id)a3 forSectionGroupHeaderWithText:(id)a4 collectionViewType:(int64_t)a5
{
  id v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUFeedViewControllerPhoneSpecAccessibility;
  v7 = a3;
  -[PUFeedViewControllerPhoneSpecAccessibility configureTextCell:forSectionGroupHeaderWithText:collectionViewType:](&v9, sel_configureTextCell_forSectionGroupHeaderWithText_collectionViewType_, v7, a4, a5);
  objc_msgSend(v7, "safeValueForKey:", CFSTR("_label"), v9.receiver, v9.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
}

@end
