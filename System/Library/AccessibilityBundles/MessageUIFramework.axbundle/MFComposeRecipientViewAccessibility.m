@implementation MFComposeRecipientViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFComposeRecipientView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeRecipientView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (MFComposeRecipientViewAccessibility)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFComposeRecipientViewAccessibility;
  return -[MFComposeRecipientViewAccessibility initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)addRecipient:(id)a3 index:(unint64_t)a4 animate:(BOOL)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFComposeRecipientViewAccessibility;
  -[MFComposeRecipientViewAccessibility addRecipient:index:animate:](&v5, sel_addRecipient_index_animate_, a3, a4, a5);
}

- (void)_reflowAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFComposeRecipientViewAccessibility;
  -[MFComposeRecipientViewAccessibility _reflowAnimated:](&v6, sel__reflowAnimated_, a3);
  -[MFComposeRecipientViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("addButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("add.contact.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

}

- (void)removeRecipient:(id)a3
{
  id v3;
  UIAccessibilityNotifications v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFComposeRecipientViewAccessibility;
  v3 = a3;
  -[MFComposeRecipientViewAccessibility removeRecipient:](&v9, sel_removeRecipient_, v3);
  v4 = *MEMORY[0x24BDF71E8];
  v5 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("remove.item.announce"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("displayString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v8);

}

@end
