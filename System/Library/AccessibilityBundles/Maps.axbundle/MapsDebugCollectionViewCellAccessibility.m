@implementation MapsDebugCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MapsDebugCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MapsDebugCollectionViewCell"), CFSTR("UICollectionViewListCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MapsDebugCollectionViewCell"), CFSTR("textLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MapsDebugCollectionViewCell"), CFSTR("detailTextLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  return (id)-[MapsDebugCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("textLabel, detailTextLabel"));
}

@end
