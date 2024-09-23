@implementation SLFacebookRegistrationEmailPromptAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SLFacebookRegistrationEmailPrompt");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SLFacebookRegistrationEmailPromptAccessibility;
  -[SLFacebookRegistrationEmailPromptAccessibility viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  -[SLFacebookRegistrationEmailPromptAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_orLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SLFacebookRegistrationEmailPromptAccessibility;
  -[SLFacebookRegistrationEmailPromptAccessibility tableView:titleForFooterInSection:](&v11, sel_tableView_titleForFooterInSection_, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!a4 && objc_msgSend(v6, "isEqualToString:", CFSTR(" ")))
  {
    -[SLFacebookRegistrationEmailPromptAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_orLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessibilityLabel");
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  return v7;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  BOOL v10;
  objc_super v12;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SLFacebookRegistrationEmailPromptAccessibility;
  v10 = -[SLFacebookRegistrationEmailPromptAccessibility textField:shouldChangeCharactersInRange:replacementString:](&v12, sel_textField_shouldChangeCharactersInRange_replacementString_, v9, location, length, a5);
  if (!v10 && objc_msgSend(v9, "tag") == 1)
  {
    MEMORY[0x23490E738](*MEMORY[0x24BEBAFE0]);
    UIAccessibilityPostNotification(*MEMORY[0x24BEBB1D0], 0);
  }

  return v10;
}

@end
