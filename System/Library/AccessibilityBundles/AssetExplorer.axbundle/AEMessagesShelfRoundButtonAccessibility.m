@implementation AEMessagesShelfRoundButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AEMessagesShelfRoundButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AEMessagesShelfRoundButton"), CFSTR("_commonAEMessagesRoundButtonInitializationWithStyle:"), "v", "q", 0);
}

- (void)_commonAEMessagesRoundButtonInitializationWithStyle:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AEMessagesShelfRoundButtonAccessibility;
  -[AEMessagesShelfRoundButtonAccessibility _commonAEMessagesRoundButtonInitializationWithStyle:](&v6, sel__commonAEMessagesRoundButtonInitializationWithStyle_);
  if ((unint64_t)a3 <= 2)
  {
    accessibilityLocalizedString(off_24FEDC4E0[a3]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEMessagesShelfRoundButtonAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v5);

  }
}

@end
