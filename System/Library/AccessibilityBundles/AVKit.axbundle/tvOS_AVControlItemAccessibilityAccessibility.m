@implementation tvOS_AVControlItemAccessibilityAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVControlItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("AVControlItem"), CFSTR("_cancelPiPControlItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("AVControlItem"), CFSTR("_stopPiPControlItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("AVControlItem"), CFSTR("_startPiPControlItem"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PBSPictureInPictureController"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("PBSPictureInPictureController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBSPictureInPictureController"), CFSTR("currentState"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBSPictureInPictureState"), CFSTR("isPictureInPictureActive"), "B", 0);

}

+ (id)_cancelPiPControlItem
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___tvOS_AVControlItemAccessibilityAccessibility;
  objc_msgSendSuper2(&v5, sel__cancelPiPControlItem);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("pip.cancel.button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

+ (id)_stopPiPControlItem
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___tvOS_AVControlItemAccessibilityAccessibility;
  objc_msgSendSuper2(&v5, sel__stopPiPControlItem);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("pip.stop.button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

+ (id)_startPiPControlItem
{
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___tvOS_AVControlItemAccessibilityAccessibility;
  objc_msgSendSuper2(&v4, sel__startPiPControlItem);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setAccessibilityLabelBlock:", &__block_literal_global_3);
  return v2;
}

@end
