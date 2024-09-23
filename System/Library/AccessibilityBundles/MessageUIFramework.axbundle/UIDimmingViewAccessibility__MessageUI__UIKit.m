@implementation UIDimmingViewAccessibility__MessageUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIDimmingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("MFComposeRecipientTextView"));
}

- (id)passthroughViews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIDimmingViewAccessibility__MessageUI__UIKit;
  -[UIDimmingViewAccessibility__MessageUI__UIKit passthroughViews](&v8, sel_passthroughViews);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[UIDimmingViewAccessibility__MessageUI__UIKit safeValueForKey:](self, "safeValueForKey:", CFSTR("superview"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilityFindSubviewDescendant:", &__block_literal_global_4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "arrayByAddingObject:", v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v6;
    }

  }
  return v3;
}

@end
