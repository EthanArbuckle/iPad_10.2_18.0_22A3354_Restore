@implementation IMBDateTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Business.IMBDateTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Business.IMBDateTableViewCell"), CFSTR("dateLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Business.IMBDateTableViewCell"), CFSTR("conflictsLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Business.IMBDateTableViewCell"), CFSTR("showMoreButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Business.IMBDateTableViewCell"), CFSTR("viewInCalendarButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Business.IMBDateTableViewCell"), CFSTR("timeslotContainerView"), "@", 0);

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x24BDAC8D0];
  -[IMBDateTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dateLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBDateTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("conflictsLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBDateTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("showMoreButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBDateTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("viewInCalendarButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBDateTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("timeslotContainerView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "accessibilityElements", v3, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v9;
  v12[3] = v4;
  v12[4] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "axSafelyAddObjectsFromArray:", v10);

  return v8;
}

@end
