@implementation CSCoverSheetViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSCoverSheetView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CSCoverSheetView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("_childFocusViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetView"), CFSTR("modalPresentationView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetView"), CFSTR("slideableContentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetView"), CFSTR("setModalPresentationView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetView"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetView"), CFSTR("resetScrollViewToMainPageAnimated: withCompletion:"), "B", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetView"), CFSTR("scrollViewDidEndScrolling:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetView"), CFSTR("scrollView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("scrollPanGestureDidUpdate:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFPagedScrollView"), CFSTR("scrollToPageAtIndex:animated:"), "B", "Q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFPagedScrollView"), CFSTR("pageViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFPagedScrollView"), CFSTR("currentPageIndex"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("mainPageContentViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CSMainPageContentViewController"), CFSTR("_combinedListViewController"), "CSCombinedListViewController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCombinedListViewController"), CFSTR("notificationListScrollView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("mainPageContentViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CSMainPageContentViewController"), CFSTR("_combinedListViewController"), "CSCombinedListViewController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CSCombinedListViewController"), CFSTR("_structuredListViewController"), "NCNotificationStructuredListViewController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationStructuredListViewController"), CFSTR("listModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationRootList"), CFSTR("totalNotificationCount"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationRootList"), CFSTR("isNotificationHistoryRevealed"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationRootList"), CFSTR("rootListView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationRootList"), CFSTR("_setForceRevealed:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationRootList"), CFSTR("historySectionList"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationCombinedSectionList"), CFSTR("notificationCount"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("isPasscodeLockVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetView"), CFSTR("dateView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSCoverSheetViewAccessibility;
  -[CSCoverSheetViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[CSCoverSheetViewAccessibility _axAdjustObscuredContent](self, "_axAdjustObscuredContent");
}

- (void)_axAdjustObscuredContent
{
  void *v3;
  id v4;

  -[CSCoverSheetViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("modalPresentationView"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("slideableContentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetViewIsVisible:", v4 == 0);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSCoverSheetViewAccessibility;
  -[CSCoverSheetViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[CSCoverSheetViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)scrollViewDidEndScrolling:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSCoverSheetViewAccessibility;
  -[CSCoverSheetViewAccessibility scrollViewDidEndScrolling:](&v4, sel_scrollViewDidEndScrolling_, a3);
  -[CSCoverSheetViewAccessibility _axAdjustObscuredContent](self, "_axAdjustObscuredContent");
}

- (void)setModalPresentationView:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSCoverSheetViewAccessibility;
  -[CSCoverSheetViewAccessibility setModalPresentationView:](&v5, sel_setModalPresentationView_);
  -[CSCoverSheetViewAccessibility _axAdjustObscuredContent](self, "_axAdjustObscuredContent");
  if (!a3)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  unsigned __int8 v14;
  unint64_t v15;
  void *v16;
  void *v17;
  char v18;
  char v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  char IsPad;
  __CFString *v26;
  unsigned __int8 v27;
  __CFString *v28;
  objc_super v30;
  char v31;

  v31 = 0;
  -[CSCoverSheetViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("scrollView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isScreenLockedWithPasscode:", 0))
  {

    goto LABEL_5;
  }
  v8 = objc_msgSend(v6, "_accessibilityViewIsVisible");

  if ((v8 & 1) != 0)
  {
LABEL_5:
    v31 = 0;
    -[CSCoverSheetViewAccessibility _accessibilityViewController](self, "_accessibilityViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeValueForKeyPath:", CFSTR("mainPageContentViewController._combinedListViewController.notificationListScrollView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "contentOffset");
    if (a3 == 3 && v13 <= 0.0)
    {
      v9 = -[CSCoverSheetViewAccessibility accessibilityScrollUpPage](self, "accessibilityScrollUpPage");
LABEL_46:

      goto LABEL_47;
    }
    v14 = -[CSCoverSheetViewAccessibility _accessibilityIsRTL](self, "_accessibilityIsRTL");
    v15 = objc_msgSend(v6, "safeUnsignedIntegerForKey:", CFSTR("currentPageIndex"));
    v31 = 0;
    objc_opt_class();
    -[CSCoverSheetViewAccessibility _accessibilityViewController](self, "_accessibilityViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsSafeCategory();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v14 ^ 1;
    if (a3 == 2)
      v19 = v14 ^ 1;
    else
      v19 = 0;
    if ((v19 & 1) != 0 || a3 == 1 && ((v14 ^ 1) & 1) == 0)
    {
      if (objc_msgSend(v17, "_axIsTodayViewShowing"))
      {
        objc_msgSend(v17, "_axDismissTodayView");
LABEL_20:
        v9 = 0;
LABEL_45:

        goto LABEL_46;
      }
      v31 = 0;
      objc_opt_class();
      objc_msgSend(v6, "safeValueForKey:", CFSTR("pageViews"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_msgSend(v21, "count") - 1;
      if (v15 >= v22)
        v23 = v15;
      else
        v23 = v15 + 1;
      goto LABEL_19;
    }
    if (a3 != 2)
      v18 = 1;
    v24 = v14 ^ 1;
    if (a3 != 1)
      v24 = 0;
    if ((v24 & 1) != 0 || (v18 & 1) == 0)
    {
      if (v15)
      {
        v23 = v15 - 1;
        goto LABEL_31;
      }
      if ((objc_msgSend(v17, "_axIsCapabilityRestricted:", 64) & 1) != 0)
      {
        v23 = 0;
LABEL_19:
        if (v23 == v15)
          goto LABEL_20;
LABEL_31:
        IsPad = AXDeviceIsPad();
        if (v23 != 1 || (IsPad & 1) == 0)
        {
          if (!v23)
          {
            v26 = CFSTR("today.visible.key");
            goto LABEL_40;
          }
          if (v23 != 2)
          {
            v28 = &stru_2501EDF88;
            goto LABEL_41;
          }
        }
        v26 = CFSTR("camera.visible");
LABEL_40:
        accessibilitySBLocalizedString(v26);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_41:
        UIAccessibilityPostNotification(*MEMORY[0x24BDF72E0], v28);
        v9 = objc_msgSend(v6, "scrollToPageAtIndex:animated:", v23, 1);

        goto LABEL_45;
      }
      v27 = objc_msgSend(v17, "_axShowTodayView");
    }
    else
    {
      if (-[CSCoverSheetViewAccessibility _axHandleShowNotificationsAction](self, "_axHandleShowNotificationsAction"))
      {
        v9 = 1;
        goto LABEL_45;
      }
      v30.receiver = self;
      v30.super_class = (Class)CSCoverSheetViewAccessibility;
      v27 = -[CSCoverSheetViewAccessibility accessibilityScroll:](&v30, sel_accessibilityScroll_, a3);
    }
    v9 = v27;
    goto LABEL_45;
  }
  v9 = 0;
LABEL_47:

  return v9;
}

- (BOOL)accessibilityScrollUpPage
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleSpotlight");

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSpotlightVisible");

  if (v4)
  {
    accessibilityLocalizedString(CFSTR("spotlight.visible"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeakAndDoNotBeInterrupted();

  }
  return v4;
}

- (BOOL)resetScrollViewToMainPageAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSCoverSheetViewAccessibility;
  v4 = -[CSCoverSheetViewAccessibility resetScrollViewToMainPageAnimated:withCompletion:](&v6, sel_resetScrollViewToMainPageAnimated_withCompletion_, a3, a4);
  if (v4)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  return v4;
}

- (id)_childFocusViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)CSCoverSheetViewAccessibility;
  -[CSCoverSheetViewAccessibility _childFocusViews](&v17, sel__childFocusViews);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CSCoverSheetViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v3, "reverseObjectEnumerator", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
          -[CSCoverSheetViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("modalPresentationView"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9 == v10)
          {
            v18 = v9;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
            v11 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
        if (v6)
          continue;
        break;
      }
    }

  }
  v11 = v3;
LABEL_13:

  return v11;
}

- (id)__axShowNotificationsElement
{
  JUMPOUT(0x23490CB48);
}

- (void)__axSetShowNotificationsElement:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axShowNotificationsElement
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  -[CSCoverSheetViewAccessibility __axShowNotificationsElement](self, "__axShowNotificationsElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
    accessibilitySBLocalizedString(CFSTR("show.notifications"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v5);

    objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
    objc_initWeak(&location, self);
    v6 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __60__CSCoverSheetViewAccessibility__axShowNotificationsElement__block_invoke;
    v10[3] = &unk_2501EDD58;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v4, "_setAccessibilityFrameBlock:", v10);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __60__CSCoverSheetViewAccessibility__axShowNotificationsElement__block_invoke_2;
    v8[3] = &unk_2501EDD80;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "_setAccessibilityActivateBlock:", v8);
    -[CSCoverSheetViewAccessibility __axSetShowNotificationsElement:](self, "__axSetShowNotificationsElement:", v4);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
  -[CSCoverSheetViewAccessibility __axShowNotificationsElement](self, "__axShowNotificationsElement");
  return (id)objc_claimAutoreleasedReturnValue();
}

double __60__CSCoverSheetViewAccessibility__axShowNotificationsElement__block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v2;
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGRect v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessibilityFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v11.origin.x = v3;
  v11.origin.y = v5;
  v11.size.width = v7;
  v11.size.height = v9;
  CGRectGetMidY(v11);
  return v3;
}

uint64_t __60__CSCoverSheetViewAccessibility__axShowNotificationsElement__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_axHandleShowNotificationsAction");

  return v2;
}

- (BOOL)_axHandleShowNotificationsAction
{
  void *v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  NSObject *v6;
  uint8_t v8[8];
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  NSObject *v13;

  -[CSCoverSheetViewAccessibility _axNotificationsMasterList](self, "_axNotificationsMasterList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "safeBoolForKey:", CFSTR("isNotificationHistoryRevealed")) & 1) != 0
    || (objc_msgSend(v2, "safeValueForKey:", CFSTR("historySectionList")),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "safeUnsignedIntegerForKey:", CFSTR("notificationCount")),
        v3,
        !v4))
  {
    AXLogAppAccessibility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2325A1000, v6, OS_LOG_TYPE_DEFAULT, "Cannot show notifications. _setForceRevealed: failed", v8, 2u);
    }
    v5 = 0;
  }
  else
  {
    v5 = 1;
    objc_msgSend(v2, "_setForceRevealed:", 1);
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __65__CSCoverSheetViewAccessibility__axHandleShowNotificationsAction__block_invoke;
    v12 = &unk_2501EDC88;
    v13 = v2;
    AXPerformBlockOnMainThreadAfterDelay();
    v6 = v13;
  }

  return v5;
}

void __65__CSCoverSheetViewAccessibility__axHandleShowNotificationsAction__block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  id v2;

  v1 = *MEMORY[0x24BDF72C8];
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("rootListView"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

- (id)_accessibilityAdditionalElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL IsSwitchControlRunning;
  void *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  -[CSCoverSheetViewAccessibility _axNotificationsMasterList](self, "_axNotificationsMasterList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("historySectionList"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeUnsignedIntegerForKey:", CFSTR("notificationCount"));

  if (!objc_msgSend(v3, "safeUnsignedIntegerForKey:", CFSTR("totalNotificationCount"))
    || (objc_msgSend(v3, "safeBoolForKey:", CFSTR("isNotificationHistoryRevealed")) & 1) != 0)
  {
    goto LABEL_10;
  }
  -[CSCoverSheetViewAccessibility _accessibilityViewController](self, "_accessibilityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "safeBoolForKey:", CFSTR("isPasscodeLockVisible")) & 1) != 0)
    goto LABEL_9;
  -[CSCoverSheetViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("dateView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "_accessibilityViewIsVisible") || !v5)
  {

LABEL_9:
    goto LABEL_10;
  }
  IsSwitchControlRunning = UIAccessibilityIsSwitchControlRunning();

  if (IsSwitchControlRunning)
  {
LABEL_10:
    v12.receiver = self;
    v12.super_class = (Class)CSCoverSheetViewAccessibility;
    -[CSCoverSheetViewAccessibility _accessibilityAdditionalElements](&v12, sel__accessibilityAdditionalElements);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  -[CSCoverSheetViewAccessibility _axShowNotificationsElement](self, "_axShowNotificationsElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v10;
}

- (id)_axNotificationsMasterList
{
  return (id)-[CSCoverSheetViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("delegate.mainPageContentViewController._combinedListViewController._structuredListViewController.listModel"));
}

@end
