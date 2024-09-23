@implementation PUFeedCaptionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUFeedCaptionCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUFeedCaptionCell"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUFeedCaptionCell"), CFSTR("_updateLikeButton"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUFeedCaptionCell"), CFSTR("likeButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUFeedCaptionCell"), CFSTR("isLiked"), "B", 0);

}

- (PUFeedCaptionCellAccessibility)initWithFrame:(CGRect)a3
{
  PUFeedCaptionCellAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUFeedCaptionCellAccessibility;
  v3 = -[PUFeedCaptionCellAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PUFeedCaptionCellAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUFeedCaptionCellAccessibility;
  -[PUFeedCaptionCellAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[PUFeedCaptionCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("likeButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", &__block_literal_global_7);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __76__PUFeedCaptionCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v5[3] = &unk_24FF15280;
  v5[4] = self;
  objc_msgSend(v3, "_setAccessibilityValueBlock:", v5);
  objc_msgSend(v3, "_setAccessibilityHintBlock:", &__block_literal_global_220);
  v4 = objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", v4 & ~*MEMORY[0x24BDF7400]);

}

id __76__PUFeedCaptionCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityPULocalizedString(CFSTR("shared.photo.like"));
}

id __76__PUFeedCaptionCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  __CFString *v1;

  if (objc_msgSend(*(id *)(a1 + 32), "safeBoolForKey:", CFSTR("isLiked")))
    v1 = CFSTR("shared.photo.like.value.liked");
  else
    v1 = CFSTR("shared.photo.like.value.like");
  accessibilityPULocalizedString(v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __76__PUFeedCaptionCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3()
{
  return accessibilityPULocalizedString(CFSTR("shared.photo.like.hint"));
}

- (void)_updateLikeButton
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUFeedCaptionCellAccessibility;
  -[PUFeedCaptionCellAccessibility _updateLikeButton](&v3, sel__updateLikeButton);
  -[PUFeedCaptionCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
