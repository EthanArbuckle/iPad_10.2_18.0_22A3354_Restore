@implementation OBIconTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("OBIconTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("OBIconTextView"), CFSTR("_textView"), "UITextView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("OBIconTextView"), CFSTR("initWithIcon:iconSize:text:dataDetectorTypes:"), "@", "{CGSize=dd}", "@", "Q", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OBIconTextViewAccessibility;
  -[OBIconTextViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[OBIconTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetTextViewShouldBreakUpParagraphs:", 1);

}

- (OBIconTextViewAccessibility)initWithIcon:(id)a3 iconSize:(CGSize)a4 text:(id)a5 dataDetectorTypes:(unint64_t)a6
{
  OBIconTextViewAccessibility *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OBIconTextViewAccessibility;
  v6 = -[OBIconTextViewAccessibility initWithIcon:iconSize:text:dataDetectorTypes:](&v8, sel_initWithIcon_iconSize_text_dataDetectorTypes_, a3, a5, a6, a4.width, a4.height);
  -[OBIconTextViewAccessibility _accessibilityLoadAccessibilityInformation](v6, "_accessibilityLoadAccessibilityInformation");

  return v6;
}

@end
