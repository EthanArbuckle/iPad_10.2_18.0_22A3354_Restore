@implementation PHVoicemailInboxListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHVoicemailInboxListViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHVoicemailInboxListViewController"), CFSTR("tableView:didSelectRowAtIndexPath:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHVoicemailInboxListViewController"), CFSTR("tableView:didDeselectRowAtIndexPath:"), "v", "@", "@", 0);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHVoicemailInboxListViewControllerAccessibility;
  v5 = a4;
  v6 = a3;
  -[PHVoicemailInboxListViewControllerAccessibility tableView:didSelectRowAtIndexPath:](&v8, sel_tableView_didSelectRowAtIndexPath_, v6, v5);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_msgSend(v6, "cellForRowAtIndexPath:", v5, v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("Selected"));
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHVoicemailInboxListViewControllerAccessibility;
  v5 = a4;
  v6 = a3;
  -[PHVoicemailInboxListViewControllerAccessibility tableView:didDeselectRowAtIndexPath:](&v8, sel_tableView_didDeselectRowAtIndexPath_, v6, v5);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_msgSend(v6, "cellForRowAtIndexPath:", v5, v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("Selected"));
}

@end
