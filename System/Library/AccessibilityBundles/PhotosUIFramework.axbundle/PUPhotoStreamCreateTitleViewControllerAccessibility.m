@implementation PUPhotoStreamCreateTitleViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUPhotoStreamCreateTitleViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUPhotoStreamCreateTitleViewController"), CFSTR("_textPlaceholderLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUPhotoStreamCreateTitleViewController"), CFSTR("_textView"), "UITextView");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUPhotoStreamCreateTitleViewControllerAccessibility;
  -[PUPhotoStreamCreateTitleViewControllerAccessibility viewDidLoad](&v7, sel_viewDidLoad);
  -[PUPhotoStreamCreateTitleViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textPlaceholderLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  -[PUPhotoStreamCreateTitleViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoStreamCreateTitleViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textPlaceholderLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v6);

}

@end
