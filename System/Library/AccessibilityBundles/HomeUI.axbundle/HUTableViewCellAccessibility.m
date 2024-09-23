@implementation HUTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("HUAnnounceNotificationSettingsItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUTableViewCell"), CFSTR("item"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUTableViewCell"), CFSTR("UITableViewCell"));

}

- (id)accessibilityHint
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HUTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("item"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234911848](CFSTR("HUAnnounceNotificationSettingsItem"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)MEMORY[0x24BDD17C8];
    accessibilityHomeUILocalizedString(CFSTR("receive.notifications.when.setting"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
