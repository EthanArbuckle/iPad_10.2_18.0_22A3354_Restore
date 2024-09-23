@implementation ConversationManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SequoiaTranslator.ConversationManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SequoiaTranslator.ConversationManager"), CFSTR("_accessbilityEvaluateTurnData:languageCode:"), "v", "@", "@", 0);
}

- (void)_accessbilityEvaluateTurnData:(id)a3 languageCode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ConversationManagerAccessibility;
  v5 = a4;
  v6 = a3;
  -[ConversationManagerAccessibility _accessbilityEvaluateTurnData:languageCode:](&v8, sel__accessbilityEvaluateTurnData_languageCode_, v6, v5);
  objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v6, v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAttribute:forKey:", v5, *MEMORY[0x24BDF7358]);
  UIAccessibilitySpeakAndDoNotBeInterrupted();

}

@end
