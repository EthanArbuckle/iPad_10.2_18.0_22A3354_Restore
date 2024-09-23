@implementation SKUIItemCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIItemCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIItemCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_layout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_itemOfferButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilitySetIdentification:", CFSTR("ItemOfferButton"));
  objc_msgSend(v3, "axSafelyAddObject:", v5);

  return v3;
}

@end
