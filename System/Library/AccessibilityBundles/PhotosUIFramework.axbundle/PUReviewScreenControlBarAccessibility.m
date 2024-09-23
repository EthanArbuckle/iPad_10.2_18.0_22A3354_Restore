@implementation PUReviewScreenControlBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUReviewScreenControlBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUReviewScreenControlBar"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUReviewScreenControlBar"), CFSTR("sendButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUReviewScreenControlBar"), CFSTR("markupButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUReviewScreenControlBar"), CFSTR("editButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUReviewScreenControlBar"), CFSTR("funEffectsButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUReviewScreenControlBarAccessibility;
  -[PUReviewScreenControlBarAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  -[PUReviewScreenControlBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("sendButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPULocalizedString(CFSTR("send.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[PUReviewScreenControlBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("markupButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPULocalizedString(CFSTR("markup.button"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  -[PUReviewScreenControlBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("editButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPULocalizedString(CFSTR("edit.button"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v8);

  -[PUReviewScreenControlBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("funEffectsButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPULocalizedString(CFSTR("effects.button"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", v10);

}

- (PUReviewScreenControlBarAccessibility)initWithFrame:(CGRect)a3
{
  PUReviewScreenControlBarAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUReviewScreenControlBarAccessibility;
  v3 = -[PUReviewScreenControlBarAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PUReviewScreenControlBarAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

@end
