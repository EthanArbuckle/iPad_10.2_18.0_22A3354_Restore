@implementation ISLanguageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ISLanguageViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ISLanguageViewController"), CFSTR("tableView: cellForRowAtIndexPath:"), "@", "@", 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ISLanguageViewControllerAccessibility;
  -[ISLanguageViewControllerAccessibility tableView:cellForRowAtIndexPath:](&v11, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "attributesAtIndex:effectiveRange:", 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDC4F10]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLanguage:", v8);

  return v4;
}

@end
