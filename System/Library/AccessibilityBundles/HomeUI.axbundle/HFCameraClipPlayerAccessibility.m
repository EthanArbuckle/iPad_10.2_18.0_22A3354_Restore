@implementation HFCameraClipPlayerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HFCameraClipPlayer");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HFCameraClipPlayer"), CFSTR("seekToOffset:inItem:"), "v", "d", "@", 0);
}

- (void)seekToOffset:(double)a3 inItem:(id)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HFCameraClipPlayerAccessibility;
  -[HFCameraClipPlayerAccessibility seekToOffset:inItem:](&v7, sel_seekToOffset_inItem_, a4, a3);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_opt_class();
    -[HFCameraClipPlayerAccessibility delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pause");

  }
}

@end
