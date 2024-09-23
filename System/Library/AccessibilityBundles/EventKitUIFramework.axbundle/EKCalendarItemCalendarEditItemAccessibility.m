@implementation EKCalendarItemCalendarEditItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKCalendarItemCalendarEditItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKCalendarItemCalendarEditItem"), CFSTR("cellForSubitemAtIndex:"), "@", "Q", 0);
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EKCalendarItemCalendarEditItemAccessibility;
  -[EKCalendarItemCalendarEditItemAccessibility cellForSubitemAtIndex:](&v8, sel_cellForSubitemAtIndex_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailTextLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v5);

  return v3;
}

@end
