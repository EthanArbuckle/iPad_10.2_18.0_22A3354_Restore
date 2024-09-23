@implementation CalendarViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MenstrualCyclesAppPlugin.CalendarViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MenstrualCyclesAppPlugin.CalendarDayCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MenstrualCyclesAppPlugin.CalendarViewController"), CFSTR("calendarDataSource:cellForItemIn:date:dayComponent:indexPath:"), "@", "@", "@", "q", "@", 0);

}

- (id)calendarDataSource:(id)a3 cellForItemIn:(id)a4 date:(id)a5 dayComponent:(int64_t)a6 indexPath:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CalendarViewControllerAccessibility;
  -[CalendarViewControllerAccessibility calendarDataSource:cellForItemIn:date:dayComponent:indexPath:](&v20, sel_calendarDataSource_cellForItemIn_date_dayComponent_indexPath_, v12, v13, v14, a6, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessibilityDate:", v17);

  return v16;
}

@end
