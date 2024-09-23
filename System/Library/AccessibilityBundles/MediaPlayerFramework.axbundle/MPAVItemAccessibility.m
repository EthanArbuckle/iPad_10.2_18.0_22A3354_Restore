@implementation MPAVItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MPAVItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabelForAlbum
{
  return (id)-[MPAVItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("album"));
}

@end
