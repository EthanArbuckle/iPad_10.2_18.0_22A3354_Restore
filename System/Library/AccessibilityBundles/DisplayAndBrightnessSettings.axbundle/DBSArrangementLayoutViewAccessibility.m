@implementation DBSArrangementLayoutViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DBSArrangementLayoutView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)_axDisplayLocation
{
  return __UIAccessibilityGetAssociatedUnsignedInteger();
}

- (void)_axSetDisplayLocation:(unint64_t)a3
{
  __UIAccessibilitySetAssociatedUnsignedInteger();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("DBSArrangementLayoutView"), CFSTR("northDisplay"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("DBSArrangementLayoutView"), CFSTR("eastDisplay"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("DBSArrangementLayoutView"), CFSTR("southDisplay"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("DBSArrangementLayoutView"), CFSTR("westDisplay"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("DBSNativeDisplayIconView"), CFSTR("nameField"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DBSArrangementLayoutView"), CFSTR("initWithDataSource:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DBSArrangementLayoutView"), CFSTR("placeCurrentDisplayAtLocation:"), "v", "Q", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DBSArrangementLayoutViewAccessibility;
  -[DBSArrangementLayoutViewAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  -[DBSArrangementLayoutViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("northDisplay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("arrangement.north"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[DBSArrangementLayoutViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("eastDisplay"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("arrangement.east"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  -[DBSArrangementLayoutViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("southDisplay"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("arrangement.south"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v8);

  -[DBSArrangementLayoutViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("westDisplay"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("arrangement.west"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", v10);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (DBSArrangementLayoutViewAccessibility)initWithDataSource:(id)a3
{
  id v4;
  DBSArrangementLayoutViewAccessibility *v5;
  objc_super v7;

  v4 = a3;
  -[DBSArrangementLayoutViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  v7.receiver = self;
  v7.super_class = (Class)DBSArrangementLayoutViewAccessibility;
  v5 = -[DBSArrangementLayoutViewAccessibility initWithDataSource:](&v7, sel_initWithDataSource_, v4);

  return v5;
}

- (void)placeCurrentDisplayAtLocation:(unint64_t)a3
{
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DBSArrangementLayoutViewAccessibility;
  -[DBSArrangementLayoutViewAccessibility placeCurrentDisplayAtLocation:](&v12, sel_placeCurrentDisplayAtLocation_);
  if (-[DBSArrangementLayoutViewAccessibility _axDisplayLocation](self, "_axDisplayLocation") != a3)
  {
    -[DBSArrangementLayoutViewAccessibility _axSetDisplayLocation:](self, "_axSetDisplayLocation:", a3);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
    v5 = 0;
    if (a3 <= 3)
    {
      -[DBSArrangementLayoutViewAccessibility safeValueForKey:](self, "safeValueForKey:", *(&off_2501F8340 + a3));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "safeValueForKey:", CFSTR("nameField"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("arrangement.announcement"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = &stru_2501F8460;
    if (v7)
      v10 = v7;
    objc_msgSend(v8, "localizedStringWithFormat:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }
}

@end
