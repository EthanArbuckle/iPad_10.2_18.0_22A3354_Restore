@implementation UIKeyboardEmojiCollectionViewCellAccessibility__ChatKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyboardEmojiCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityCustomRotors
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardEmojiCollectionViewCellAccessibility__ChatKit__UIKit;
  -[UIKeyboardEmojiCollectionViewCellAccessibility__ChatKit__UIKit accessibilityCustomRotors](&v5, sel_accessibilityCustomRotors);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  addFirstResponderRotorsToRotorArray(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
