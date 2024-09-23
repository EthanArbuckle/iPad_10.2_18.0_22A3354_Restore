@implementation AXOnboardingObjC

+ (id)viewControllerForType:(unint64_t)a3 onDismiss:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  if (a3 > 1)
  {
    v6 = 0;
  }
  else
  {
    +[AXOnboardingSwiftBridge viewControllerForType:dismiss:](_TtC28AccessibilitySharedUISupport23AXOnboardingSwiftBridge, "viewControllerForType:dismiss:", a3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

@end
