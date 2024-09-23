@implementation PHAudioCallControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHAudioCallControlsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAudioCallControlsView"), CFSTR("assignControlType: toButton:"), "v", "Q", "@", 0);
}

- (void)assignControlType:(unint64_t)a3 toButton:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v6 = a4;
  v8.receiver = self;
  v8.super_class = (Class)PHAudioCallControlsViewAccessibility;
  -[PHAudioCallControlsViewAccessibility assignControlType:toButton:](&v8, sel_assignControlType_toButton_, a3, v6);
  if (a3 == 5)
  {
    accessibilityLocalizedString(CFSTR("facetime.upgrade.label"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityLabel:", v7);

  }
}

@end
