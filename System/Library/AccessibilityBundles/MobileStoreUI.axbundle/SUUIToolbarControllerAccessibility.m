@implementation SUUIToolbarControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIToolbarController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_barButtonItemWithButtonElement:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIToolbarControllerAccessibility;
  v3 = a3;
  -[SUUIToolbarControllerAccessibility _barButtonItemWithButtonElement:](&v6, sel__barButtonItemWithButtonElement_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("item %@ %@ %lu"), v4, v3, objc_msgSend(v3, "safeIntegerForKey:", CFSTR("elementType")));

  return v4;
}

@end
