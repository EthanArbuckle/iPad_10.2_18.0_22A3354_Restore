@implementation SLMicroBlogComposeViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SLMicroBlogComposeViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SLMicroBlogComposeViewController"), CFSTR("noteLocationInfoChanged:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SLMicroBlogComposeViewController"), CFSTR("_presentMentionsViewControllerWithSearchString:"), "v", "@", 0);

}

- (void)noteLocationInfoChanged:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SLMicroBlogComposeViewControllerAccessibility;
  -[SLMicroBlogComposeViewControllerAccessibility noteLocationInfoChanged:](&v3, sel_noteLocationInfoChanged_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)_presentMentionsViewControllerWithSearchString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SLMicroBlogComposeViewControllerAccessibility;
  -[SLMicroBlogComposeViewControllerAccessibility _presentMentionsViewControllerWithSearchString:](&v7, sel__presentMentionsViewControllerWithSearchString_, a3);
  accessibilityLocalizedString(CFSTR("mention.sheet.appeared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("mention.sheet.hint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v4, v6, CFSTR("__AXStringForVariablesSentinel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEB68]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v5);

}

@end
