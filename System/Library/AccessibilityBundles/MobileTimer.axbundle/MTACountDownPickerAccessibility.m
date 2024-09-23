@implementation MTACountDownPickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTACountDownPicker");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MTACountDownPicker"), CFSTR("UITextField"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTACountDownPicker"), CFSTR("incrementValue"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTACountDownPicker"), CFSTR("decrementValue"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTACountDownPicker"), CFSTR("incrementValueContinuouslly"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTACountDownPicker"), CFSTR("decrementValueContinuouslly"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTACountDownPicker"), CFSTR("pressesEnded:withEvent:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTACountDownPicker"), CFSTR("selectedField"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTACountDownPicker"), CFSTR("duration"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTACountDownPicker"), CFSTR("setSelectedField:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTACountDownPicker"), CFSTR("hourHighlightFrame"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTACountDownPicker"), CFSTR("minuteHighlightFrame"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTACountDownPicker"), CFSTR("secondHighlightFrame"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

}

@end
