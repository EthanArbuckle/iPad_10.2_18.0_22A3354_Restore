@implementation AXSB_UIAlertControllerSafeCategory

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIAlertController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIAlertController"), CFSTR("_canDismissWithGestureRecognizer"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("UIAlertController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIAlertController"), CFSTR("viewDidAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_UIAlertControllerPhoneTVMacView"), CFSTR("_mainInterfaceActionsGroupView"), "_UIAlertControllerInterfaceActionGroupView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIInterfaceActionGroupView"), CFSTR("actionSequenceView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_UIAlertControllerInterfaceActionGroupView"), CFSTR("UIInterfaceActionGroupView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIInterfaceActionRepresentationsSequenceView"), CFSTR("arrangedActionRepresentationViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_UIInterfaceActionCustomViewRepresentationView"), CFSTR("_actionContentView"), "UIView");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXSB_UIAlertControllerSafeCategory;
  -[AXSB_UIAlertControllerSafeCategory _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[AXSB_UIAlertControllerSafeCategory _applyAccessibilityLoadAccessibilityInformation](self, "_applyAccessibilityLoadAccessibilityInformation");
}

- (void)_applyAccessibilityLoadAccessibilityInformation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  _QWORD v15[4];
  id v16;
  id location;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (-[AXSB_UIAlertControllerSafeCategory _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("IsTripleClick")))
  {
    LOBYTE(location) = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_mainInterfaceActionsGroupView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "safeValueForKey:", CFSTR("actionSequenceView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safeArrayForKey:", CFSTR("arrangedActionRepresentationViews"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v9, "safeValueForKey:", CFSTR("_actionContentView"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "axSafelyAddObject:", v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "_accessibilitySetViewIsVisible:", 1);
          objc_initWeak(&location, v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v15[0] = MEMORY[0x24BDAC760];
            v15[1] = 3221225472;
            v15[2] = __85__AXSB_UIAlertControllerSafeCategory__applyAccessibilityLoadAccessibilityInformation__block_invoke;
            v15[3] = &unk_24DDE5890;
            objc_copyWeak(&v16, &location);
            objc_msgSend(v10, "_setAccessibilityFrameBlock:", v15);
            objc_destroyWeak(&v16);
          }
          objc_destroyWeak(&location);

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
    }

    if (objc_msgSend(v5, "count"))
      v11 = v5;
    else
      v11 = 0;
    objc_msgSend(v13, "setAccessibilityElements:", v11);

  }
}

- (BOOL)_canDismissWithGestureRecognizer
{
  objc_super v4;

  if ((-[AXSB_UIAlertControllerSafeCategory _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("IsTripleClick")) & 1) != 0)return 0;
  v4.receiver = self;
  v4.super_class = (Class)AXSB_UIAlertControllerSafeCategory;
  return -[AXSB_UIAlertControllerSafeCategory _canDismissWithGestureRecognizer](&v4, sel__canDismissWithGestureRecognizer);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXSB_UIAlertControllerSafeCategory;
  -[AXSB_UIAlertControllerSafeCategory viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[AXSB_UIAlertControllerSafeCategory _applyAccessibilityLoadAccessibilityInformation](self, "_applyAccessibilityLoadAccessibilityInformation");
}

@end
