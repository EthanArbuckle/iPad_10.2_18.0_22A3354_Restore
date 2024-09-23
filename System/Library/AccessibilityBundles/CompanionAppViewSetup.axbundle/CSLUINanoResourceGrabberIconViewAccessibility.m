@implementation CSLUINanoResourceGrabberIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSLUINanoResourceGrabberIconView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("CSLUINanoResourceGrabberIconView"), CFSTR("_bundleID"), "NSString");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CSLUINanoResourceGrabberIconViewAccessibility;
  -[CSLUINanoResourceGrabberIconViewAccessibility accessibilityLabel](&v11, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v10.receiver = self;
    v10.super_class = (Class)CSLUINanoResourceGrabberIconViewAccessibility;
    -[CSLUINanoResourceGrabberIconViewAccessibility accessibilityLabel](&v10, sel_accessibilityLabel);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  -[CSLUINanoResourceGrabberIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_bundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXWatchAppNameForBundleId();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    if (!AXIsInternalInstall())
    {
      v9 = 0;
      goto LABEL_9;
    }
    _AXAssert();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Internal only, missing app name: %@"), v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
LABEL_9:

  return v9;
}

@end
