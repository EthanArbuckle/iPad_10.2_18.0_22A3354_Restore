@implementation EKEventCalendarDetailItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKEventCalendarDetailItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEventCalendarDetailItem"), CFSTR("cellForSubitemAtIndex:withTraitCollection:"), "Q", "@", 0);
}

- (id)cellForSubitemAtIndex:(unint64_t)a3 withTraitCollection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  char v14;

  v6 = a4;
  v14 = 0;
  objc_opt_class();
  v13.receiver = self;
  v13.super_class = (Class)EKEventCalendarDetailItemAccessibility;
  -[EKEventCalendarDetailItemAccessibility cellForSubitemAtIndex:withTraitCollection:](&v13, sel_cellForSubitemAtIndex_withTraitCollection_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    abort();
  objc_msgSend(v8, "detailTextLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "detailTextLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityLabel:", v10);

  return v8;
}

@end
