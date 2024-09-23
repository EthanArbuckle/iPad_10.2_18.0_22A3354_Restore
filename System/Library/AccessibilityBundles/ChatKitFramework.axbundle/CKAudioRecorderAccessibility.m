@implementation CKAudioRecorderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKAudioRecorder");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAudioRecorder"), CFSTR("startRecordingForRaiseGesture: shouldPlaySound:"), "v", "B", "B", 0);
}

- (void)startRecordingForRaiseGesture:(BOOL)a3 shouldPlaySound:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], &stru_2501B2580);
  v7.receiver = self;
  v7.super_class = (Class)CKAudioRecorderAccessibility;
  -[CKAudioRecorderAccessibility startRecordingForRaiseGesture:shouldPlaySound:](&v7, sel_startRecordingForRaiseGesture_shouldPlaySound_, v5, v4);
}

@end
