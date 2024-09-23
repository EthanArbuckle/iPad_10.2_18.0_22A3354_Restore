@implementation _MKNanoAddressSnapshotViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_MKNanoAddressSnapshotView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_MKNanoAddressSnapshotView"), CFSTR("_mapItem"), "MKMapItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_MKNanoAddressSnapshotView"), CFSTR("_showsName"), "B");
  objc_msgSend(v3, "validateClass:", CFSTR("MKMapItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMapItem"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMapItem"), CFSTR("_addressFormattedAsMultilineAddress"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[_MKNanoAddressSnapshotViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_mapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_addressFormattedAsMultilineAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_MKNanoAddressSnapshotViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_showsName")))
  {
    __UIAXStringForVariables();
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v5;
  }
  v7 = v6;

  return v7;
}

@end
