@implementation PKPaymentSetupFieldsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaymentSetupFieldsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentSetupFieldsViewController"), CFSTR("_headerView"), "PKTableHeaderView");
  objc_msgSend(v3, "validateClass:", CFSTR("PKTableHeaderView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKTableHeaderView"), CFSTR("_subtitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentSetupFieldsViewController"), CFSTR("setHeaderViewTitle:subtitle:"), "v", "@", "@", 0);

}

- (void)setHeaderViewTitle:(id)a3 subtitle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v14;
  char v15;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  objc_opt_class();
  -[PKPaymentSetupFieldsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_headerView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("_subtitleLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14.receiver = self;
  v14.super_class = (Class)PKPaymentSetupFieldsViewControllerAccessibility;
  -[PKPaymentSetupFieldsViewControllerAccessibility setHeaderViewTitle:subtitle:](&v14, sel_setHeaderViewTitle_subtitle_, v6, v7);
  v15 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v12 = objc_claimAutoreleasedReturnValue();
  if (v15)
    abort();
  v13 = (void *)v12;
  if ((objc_msgSend(v11, "isEqualToString:", v12) & 1) == 0 && objc_msgSend(v13, "length"))
    UIAccessibilitySpeakAndDoNotBeInterrupted();

}

@end
