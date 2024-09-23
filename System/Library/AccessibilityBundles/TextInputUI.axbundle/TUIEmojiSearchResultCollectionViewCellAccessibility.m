@implementation TUIEmojiSearchResultCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TUIEmojiSearchResultCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUIEmojiSearchResultCollectionViewCell"), CFSTR("emojiLabel"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[TUIEmojiSearchResultCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("emojiLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73D0] | *MEMORY[0x24BDF73B0];
}

@end
