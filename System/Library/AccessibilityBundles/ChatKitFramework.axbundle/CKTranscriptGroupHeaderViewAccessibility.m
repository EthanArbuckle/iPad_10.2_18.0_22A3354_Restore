@implementation CKTranscriptGroupHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKTranscriptGroupHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptGroupHeaderView"), CFSTR("actionButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptGroupHeaderView"), CFSTR("textView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptGroupHeaderView"), CFSTR("initWithFrame: conversation:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeRecipientTextView"), CFSTR("textView"), "@", 0);

}

- (CKTranscriptGroupHeaderViewAccessibility)initWithFrame:(CGRect)a3 conversation:(id)a4
{
  CKTranscriptGroupHeaderViewAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKTranscriptGroupHeaderViewAccessibility;
  v4 = -[CKTranscriptGroupHeaderViewAccessibility initWithFrame:conversation:](&v6, sel_initWithFrame_conversation_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CKTranscriptGroupHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptGroupHeaderViewAccessibility;
  -[CKTranscriptGroupHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[CKTranscriptGroupHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("actionButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  -[CKTranscriptGroupHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("textView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("to.field"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

}

@end
