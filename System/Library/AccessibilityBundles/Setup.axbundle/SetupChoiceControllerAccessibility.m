@implementation SetupChoiceControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SetupChoiceController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("BuddySetupTableViewCell"));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  char v14;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  objc_opt_class();
  v13.receiver = self;
  v13.super_class = (Class)SetupChoiceControllerAccessibility;
  -[SetupChoiceControllerAccessibility tableView:cellForRowAtIndexPath:](&v13, sel_tableView_cellForRowAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    abort();
  NSClassFromString(CFSTR("BuddySetupTableViewCell"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
    objc_msgSend(v9, "setIsAccessibilityElement:", 1);
    objc_msgSend(v9, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessibilityLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessibilityLabel:", v11);

  }
  return v9;
}

@end
