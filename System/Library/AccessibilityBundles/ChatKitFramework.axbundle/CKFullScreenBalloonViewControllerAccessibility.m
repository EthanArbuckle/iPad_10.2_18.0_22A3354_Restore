@implementation CKFullScreenBalloonViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKFullScreenBalloonViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKFullScreenBalloonViewController"), CFSTR("delegate"), "@", 0);
}

- (BOOL)accessibilityPerformEscape
{
  void *v2;
  BOOL v3;
  id v5;

  -[CKFullScreenBalloonViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = v2;
    AXPerformSafeBlock();
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);

    v3 = 1;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __76__CKFullScreenBalloonViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fullScreenBalloonViewControllerHandleDismissTap:", *(_QWORD *)(a1 + 40));
}

@end
