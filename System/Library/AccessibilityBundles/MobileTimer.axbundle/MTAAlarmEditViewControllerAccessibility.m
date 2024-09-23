@implementation MTAAlarmEditViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTAAlarmEditViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAAlarmEditViewController"), CFSTR("editedAlarm"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAlarm"), CFSTR("repeatSchedule"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAAlarmEditViewController"), CFSTR("tableView:cellForRowAtIndexPath:"), "@", "@", "@", 0);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MTAAlarmEditViewControllerAccessibility;
  v6 = a4;
  -[MTAAlarmEditViewControllerAccessibility tableView:cellForRowAtIndexPath:](&v14, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row", v14.receiver, v14.super_class);
  v9 = objc_msgSend(v6, "section");

  if (v9 == 1 && !v8)
  {
    -[MTAAlarmEditViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("editedAlarm"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeUnsignedIntegerForKey:", CFSTR("repeatSchedule"));

    DateMaskToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "detailTextLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccessibilityLabel:", v11);

  }
  return v7;
}

@end
