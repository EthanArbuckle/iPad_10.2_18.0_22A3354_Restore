@implementation AVTRecordViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTRecordView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AVTRecordView"), CFSTR("AVTView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVTView"), CFSTR("_faceTrackingDelegate"), "<AVTViewFaceTrackingDelegate>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVTRecordView"), CFSTR("_avatar"), "AVTAvatar");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTFaceTrackingManager"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTView"), CFSTR("faceIsTracked"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorViewController"), CFSTR("isCreating"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  char v9;

  if (-[AVTRecordViewAccessibility _isCreating](self, "_isCreating"))
  {
    v3 = (void *)MEMORY[0x24BDFFA88];
    v9 = 0;
    -[AVTRecordViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("avatar"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "descriptionForMemoji:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVTRecordViewAccessibility;
    -[AVTRecordViewAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v7;
  objc_super v8;

  -[AVTRecordViewAccessibility accessibilityUserDefinedValue](self, "accessibilityUserDefinedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AVTRecordViewAccessibility _isCreating](self, "_isCreating"))
  {
    v8.receiver = self;
    v8.super_class = (Class)AVTRecordViewAccessibility;
    -[AVTRecordViewAccessibility accessibilityValue](&v8, sel_accessibilityValue);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[AVTRecordViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("faceIsTracked")))
      v5 = CFSTR("tracking.enabled");
    else
      v5 = CFSTR("tracking.disabled");
    accessibilityAvatarKitLocalizedString(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BOOL)_isCreating
{
  void *v2;
  char v3;

  -[AVTRecordViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("faceTrackingDelegate.delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isCreating"));

  return v3;
}

@end
