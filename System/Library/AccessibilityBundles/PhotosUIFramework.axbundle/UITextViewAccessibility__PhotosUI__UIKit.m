@implementation UITextViewAccessibility__PhotosUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityPlaceholderValue
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[UITextViewAccessibility__PhotosUI__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AddCommentTextView"));

  if (v4)
  {
    -[UITextViewAccessibility__PhotosUI__UIKit _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("PUPhotoCommentEntryView")));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("_placeholderLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEC10]);
      v7 = v8;
    }

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UITextViewAccessibility__PhotosUI__UIKit;
    -[UITextViewAccessibility__PhotosUI__UIKit accessibilityPlaceholderValue](&v10, sel_accessibilityPlaceholderValue);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

@end
