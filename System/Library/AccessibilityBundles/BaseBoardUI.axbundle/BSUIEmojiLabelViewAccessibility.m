@implementation BSUIEmojiLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BSUIEmojiLabelView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("BSUIEmojiLabelView"), CFSTR("_rawText"), "NSString");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  objc_super v4;

  v2 = *MEMORY[0x24BDF7410];
  v4.receiver = self;
  v4.super_class = (Class)BSUIEmojiLabelViewAccessibility;
  return -[BSUIEmojiLabelViewAccessibility accessibilityTraits](&v4, sel_accessibilityTraits) | v2;
}

- (id)accessibilityLabel
{
  return (id)-[BSUIEmojiLabelViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_rawText"));
}

@end
