@implementation CHTextInputGestureAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CHTextInputGesture");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CHTextInputGesture"), CFSTR("isEditGestureForDrawing:targetContentInfo:tentativeResultType:"), "B", "@", "@", "q", 0);
}

+ (BOOL)isEditGestureForDrawing:(id)a3 targetContentInfo:(id)a4 tentativeResultType:(int64_t)a5
{
  id v8;
  id v9;
  unsigned __int8 v10;
  objc_super v12;

  v8 = a3;
  v9 = a4;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v10 = 0;
  }
  else
  {
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_METACLASS___CHTextInputGestureAccessibility;
    v10 = objc_msgSendSuper2(&v12, sel_isEditGestureForDrawing_targetContentInfo_tentativeResultType_, v8, v9, a5);
  }

  return v10;
}

@end
