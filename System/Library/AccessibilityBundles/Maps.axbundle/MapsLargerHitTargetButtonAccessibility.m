@implementation MapsLargerHitTargetButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MapsLargerHitTargetButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  -[MapsLargerHitTargetButtonAccessibility accessibilityLabel](self, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)MapsLargerHitTargetButtonAccessibility;
  return -[MapsLargerHitTargetButtonAccessibility isAccessibilityElement](&v6, sel_isAccessibilityElement);
}

@end
