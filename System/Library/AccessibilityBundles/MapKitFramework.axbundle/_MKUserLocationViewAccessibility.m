@implementation _MKUserLocationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_MKUserLocationView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  unint64_t v2;
  Class v3;
  Class v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MKUserLocationViewAccessibility;
  v2 = *MEMORY[0x24BDFEFE8] | -[_MKUserLocationViewAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  v3 = NSClassFromString(CFSTR("VKMapViewTourGuideManager"));
  if (v3)
  {
    v4 = v3;
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (-[objc_class shouldSuppressLocationUpdates](v4, "shouldSuppressLocationUpdates") & 1) == 0)
    {
      v2 |= *MEMORY[0x24BDFF0D0];
    }
  }
  return v2;
}

@end
