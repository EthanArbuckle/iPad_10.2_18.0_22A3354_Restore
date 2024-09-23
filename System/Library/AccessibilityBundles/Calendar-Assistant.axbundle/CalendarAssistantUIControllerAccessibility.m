@implementation CalendarAssistantUIControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CalendarAssistantUIController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CalendarAssistantUIController"), CFSTR("tableView: viewForHeaderInSection:"), "@", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CalendarAssistantUIController"), CFSTR("sections"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CalendarAssistantUISnippetSection"), CFSTR("date"), "@", 0);

}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CalendarAssistantUIControllerAccessibility;
  -[CalendarAssistantUIControllerAccessibility tableView:viewForHeaderInSection:](&v14, sel_tableView_viewForHeaderInSection_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    -[CalendarAssistantUIControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("sections"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count") > (unint64_t)a4)
    {
      objc_msgSend(v9, "objectAtIndex:", a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safeValueForKey:", CFSTR("date"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v11, 4, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAccessibilityLabel:", v12);
      objc_msgSend(v7, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
      objc_msgSend(v7, "setIsAccessibilityElement:", 1);

    }
  }

  return v7;
}

@end
