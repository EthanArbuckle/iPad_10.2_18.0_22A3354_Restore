@implementation UIKeyboardLayoutStarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyboardLayoutStar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityStickyPopupKeys
{
  if (a1)
    return objc_getAssociatedObject(a1, &__UIKeyboardLayoutStarAccessibility___accessibilityStickyPopupKeys);
  else
    return 0;
}

- (void)_accessibilitySetStickyPopupKeys:(uint64_t)a1
{
  id location;
  uint64_t v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(&location, 0);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  const char *v5;
  const char *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const char *v10;
  const char *v11;
  const __CFString *v12;
  const char *v13;
  id v14;
  id *v15;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v15 = location;
  v14 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = CFSTR("UIKeyboardLayoutStar");
  v7 = CFSTR("UIKeyboardLayout");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:", CFSTR("UIKBHandwritingCandidateView"));
  v9 = CFSTR("UIKeyboardEmojiCollectionInputView");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:", CFSTR("UIHandwritingAssistantView"));
  v3 = "UIKBTree";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIKeyboardLayoutStar"), CFSTR("_keyplane"));
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIKeyboardLayoutStar"), CFSTR("_keyplaneView"), "UIKBKeyplaneView");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIKeyboardLayoutStar"), CFSTR("_gestureKeyboardIntroduction"), "UIGestureKeyboardIntroduction");
  v4 = CFSTR("UIKBKeyplaneView");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIKeyboardLayoutStar"), CFSTR("_keyboard"), "UIKBTree");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIKeyboardEmojiCollectionInputView"), CFSTR("_collectionView"), "UIKeyboardEmojiCollectionView");
  v10 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardLayoutStar"), CFSTR("isHandwritingPlane"), 0);
  v11 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("viewForKey:"), "@", 0);
  v8 = CFSTR("UIKBTree");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v11, 0);
  v5 = "{CGPoint=dd}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("keyHitTestClosestToPoint:"), v11, "{CGPoint=dd}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("keyHitTestContainingPoint:"), v11, v5, 0);
  v13 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("setLabel: forKey:"), v11, v11, 0);
  v6 = "i";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("setReturnKeyEnabled: withDisplayName: withType:"), v13, v10, v11, "i", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("setState: forKey:"), v13, v6, v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("touchDown:"), v13, v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("touchDown: executionContext:"), v13, v11, v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("touchDragged: executionContext:"), v13, v11, v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("touchUp:"), v13, v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("touchUp: executionContext:"), v13, v11, v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("keyHasAccentedVariants:"), v10, v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardKeyplaneTransition"), CFSTR("setInitiallyAtEnd:"), v13, v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("selectedVariantIndex"), "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("modalDisplayView"), v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("tappedSkinToneEmoji"), v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("continueFromInternationalActionForTouchUp: withActions: timestamp: interval: didLongPress: prevActions: executionContext:"), v13, v11, "Q", "d", "d", v10, "Q", v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("setActiveKey:"), v13, v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("activeKey"), v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, CFSTR("didBeginContinuousPath"), v13, 0);
  objc_storeStrong(v15, v14);
}

- (void)addContinuousPathPoint:(CGPoint)a3 withTimestamp:(double)a4
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id obj;
  uint64_t v27;
  _QWORD v28[8];
  id v29;
  uint64_t v30;
  int v31;
  CGRect r2;
  CGRect r1;
  CGRect recta;
  _QWORD __b[8];
  id v36;
  uint64_t v37;
  id location;
  objc_super v39;
  double v40;
  SEL v41;
  UIKeyboardLayoutStarAccessibility *v42;
  CGPoint point;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;
  CGRect v47;

  v46 = *MEMORY[0x24BDAC8D0];
  point = a3;
  v42 = self;
  v41 = a2;
  v40 = a4;
  v39.receiver = self;
  v39.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  -[UIKeyboardLayoutStarAccessibility addContinuousPathPoint:withTimestamp:](&v39, sel_addContinuousPathPoint_withTimestamp_, a3.x, a3.y, a4);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    location = -[UIKeyboardLayoutStarAccessibility _accessibilityVisibleKeysByRow](v42, "_accessibilityVisibleKeysByRow");
    v37 = 0;
    memset(__b, 0, sizeof(__b));
    obj = location;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v45, 16);
    if (v27)
    {
      v23 = *(_QWORD *)__b[2];
      v24 = 0;
      v25 = v27;
      while (1)
      {
        v22 = v24;
        if (*(_QWORD *)__b[2] != v23)
          objc_enumerationMutation(obj);
        v36 = *(id *)(__b[1] + 8 * v24);
        memset(&recta, 0, sizeof(recta));
        v21 = (id)objc_msgSend(v36, "firstObject");
        objc_msgSend(v21, "frame");
        r1.origin.x = v4;
        r1.origin.y = v5;
        r1.size.width = v6;
        r1.size.height = v7;
        v20 = (id)objc_msgSend(v36, "lastObject");
        objc_msgSend(v20, "frame");
        r2.origin.x = v8;
        r2.origin.y = v9;
        r2.size.width = v10;
        r2.size.height = v11;
        recta = CGRectUnion(r1, r2);

        if (CGRectContainsPoint(recta, point))
        {
          if (v37 != addContinuousPathPoint_withTimestamp__CurrentRow)
          {
            addContinuousPathPoint_withTimestamp__CurrentRow = v37;
            v19 = (id)objc_msgSend(MEMORY[0x24BDFFA78], "sharedManager");
            objc_msgSend(v19, "playHapticFeedbackForType:", 15);

            v31 = 2;
            goto LABEL_23;
          }
          v30 = 0;
          memset(v28, 0, sizeof(v28));
          v17 = v36;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", v28, v44, 16);
          if (v18)
          {
            v14 = *(_QWORD *)v28[2];
            v15 = 0;
            v16 = v18;
            while (1)
            {
              v13 = v15;
              if (*(_QWORD *)v28[2] != v14)
                objc_enumerationMutation(v17);
              v29 = *(id *)(v28[1] + 8 * v15);
              objc_msgSend(v29, "frame");
              if (CGRectContainsPoint(v47, point) && v30 != addContinuousPathPoint_withTimestamp__CurrentKey)
                break;
              ++v30;
              ++v15;
              if (v13 + 1 >= v16)
              {
                v15 = 0;
                v16 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", v28, v44, 16);
                if (!v16)
                  goto LABEL_18;
              }
            }
            addContinuousPathPoint_withTimestamp__CurrentKey = v30;
            v12 = (id)objc_msgSend(MEMORY[0x24BDFFA78], "sharedManager");
            objc_msgSend(v12, "playHapticFeedbackForType:", 14);

            v31 = 4;
          }
          else
          {
LABEL_18:
            v31 = 0;
          }

        }
        ++v37;
        ++v24;
        if (v22 + 1 >= v25)
        {
          v24 = 0;
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v45, 16);
          if (!v25)
            break;
        }
      }
    }
    v31 = 0;
LABEL_23:

    objc_storeStrong(&location, 0);
  }
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBB160];
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  id v4;
  objc_super v5;
  SEL v6;
  UIKeyboardLayoutStarAccessibility *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  -[UIKeyboardLayoutStarAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  v2 = (id)-[UIKeyboardLayoutStarAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_gestureKeyboardIntroduction"));
  objc_msgSend(v2, "_accessibilityLoadAccessibilityInformation");

  v4 = accessibilityLocalizedString(CFSTR("keyboard.bias.escape.label"));
  v3 = -[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButton](v7);
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (id)_accessibilityBiasEscapeButton
{
  id v2;
  id v3;
  id v4;
  char v5;
  id v6;
  id v7;

  v6 = a1;
  if (a1)
  {
    v5 = 0;
    objc_opt_class();
    v2 = (id)objc_msgSend(v6, "safeValueForKey:", CFSTR("_biasEscapeButton"));
    v4 = (id)__UIAccessibilityCastAsClass();

    v3 = v4;
    objc_storeStrong(&v4, 0);
    v7 = v3;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)didMoveToWindow
{
  objc_super v2;
  SEL v3;
  UIKeyboardLayoutStarAccessibility *v4;

  v4 = self;
  v3 = a2;
  -[UIKeyboardLayoutStarAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  v2.receiver = v4;
  v2.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  -[UIKeyboardLayoutStarAccessibility didMoveToWindow](&v2, sel_didMoveToWindow);
}

- (BOOL)accessibilityPerformEscape
{
  __CFString *v2;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  BOOL v10;
  UIAccessibilityNotifications notification;
  id v12;
  id v13;
  id v14;
  char v15;
  char v16;
  id v17;
  char v18;
  id v19;
  char v20;
  SEL v21;
  UIKeyboardLayoutStarAccessibility *v22;
  char v23;

  v22 = self;
  v21 = a2;
  if ((AXDeviceIsPad() & 1) != 0 && (UIKeyboardSupportsSplit() & 1) != 0)
  {
    v20 = objc_msgSend(MEMORY[0x24BDF6B38], "isSplit") & 1;
    UIKeyboardSetSplit();
    notification = *MEMORY[0x24BDF71E8];
    if ((v20 & 1) != 0)
      v2 = CFSTR("keyboard.unsplit");
    else
      v2 = CFSTR("keyboard.split");
    v12 = accessibilityLocalizedString(v2);
    UIAccessibilityPostNotification(notification, v12);

    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
    v23 = 1;
  }
  else
  {
    v8 = (id)objc_msgSend(MEMORY[0x24BDF6B18], "activeKeyboard");
    v9 = (id)objc_msgSend(v8, "defaultTextInputTraits");
    v18 = 0;
    v16 = 0;
    v10 = 0;
    if ((objc_msgSend(v9, "isDevicePasscodeEntry") & 1) == 0)
    {
      v19 = (id)objc_msgSend(MEMORY[0x24BDF6B18], "activeKeyboard");
      v18 = 1;
      v17 = (id)objc_msgSend(v19, "defaultTextInputTraits");
      v16 = 1;
      v10 = objc_msgSend(v17, "keyboardType") != 127;
    }
    if ((v16 & 1) != 0)

    if ((v18 & 1) != 0)
    if (!v10)
      goto LABEL_20;
    v15 = 0;
    if ((AXUIKeyboardIsOOP() & 1) != 0)
    {
      v7 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
      objc_msgSend(v7, "dismissKeyboard");

      v15 = 1;
    }
    else
    {
      v15 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "resignFirstResponder") & 1;
      if (!v15)
      {
        v6 = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityMainWindow");
        v14 = (id)objc_msgSend(v6, "firstResponder");

        v15 = objc_msgSend(v14, "resignFirstResponder") & 1;
        objc_storeStrong(&v14, 0);
      }
    }
    if ((v15 & 1) != 0)
    {
      v4 = (void *)MEMORY[0x24BDFEA60];
      v5 = accessibilityLocalizedString(CFSTR("keyboard.hidden"));
      v13 = (id)objc_msgSend(v4, "axAttributedStringWithString:");

      objc_msgSend(v13, "setAttribute:forKey:", &unk_24FF85A78, *MEMORY[0x24BDFEAD8]);
      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v13);
      v23 = 1;
      objc_storeStrong(&v13, 0);
    }
    else
    {
LABEL_20:
      v23 = 0;
    }
  }
  return v23 & 1;
}

- (id)_accessibilityCreateElementForKey:(void *)a1
{
  id v3;
  char v4;
  id v5;
  id v6[2];
  uint64_t v7;
  uint64_t *v8;
  int v9;
  int v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  char v14;
  id v15;
  int v16;
  id location;
  void *v18;
  id v19;

  v18 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v18)
  {
    v3 = (id)objc_msgSend(location, "name");
    v14 = 0;
    v4 = 1;
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Emoji-Category-Control-Key")) & 1) == 0)
    {
      v15 = (id)objc_msgSend(location, "name");
      v14 = 1;
      v4 = objc_msgSend(v15, "hasPrefix:", CFSTR("Emoji-InputView-"));
    }
    if ((v14 & 1) != 0)

    if ((v4 & 1) != 0)
    {
      v7 = 0;
      v8 = &v7;
      v9 = 838860800;
      v10 = 48;
      v11 = __Block_byref_object_copy__15;
      v12 = __Block_byref_object_dispose__15;
      v13 = 0;
      v6[1] = &v7;
      v5 = v18;
      v6[0] = location;
      AXPerformSafeBlock();
      v19 = (id)v8[5];
      v16 = 1;
      objc_storeStrong(v6, 0);
      objc_storeStrong(&v5, 0);
      _Block_object_dispose(&v7, 8);
      objc_storeStrong(&v13, 0);
    }
    else
    {
      v19 = -[UIAccessibilityElementKBKey initWithAccessibilityContainer:key:](objc_allocWithZone((Class)UIAccessibilityElementKBKey), v18, location);
      v16 = 1;
    }
  }
  else
  {
    v19 = 0;
    v16 = 1;
  }
  objc_storeStrong(&location, 0);
  return v19;
}

uint64_t __71__UIKeyboardLayoutStarAccessibility__accessibilityCreateElementForKey___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v5;
  NSObject *log;
  os_log_type_t type;
  id v8;
  id v9;
  id v11;
  char v12;
  id v13[3];
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13[2] = (id)a1;
  v13[1] = (id)a1;
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_keyplaneView"));
  v1 = (id)objc_msgSend(v9, "viewForKey:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v13[0] = (id)AXLogAppAccessibility();
    v12 = 17;
    if (os_log_type_enabled((os_log_t)v13[0], OS_LOG_TYPE_FAULT))
    {
      log = v13[0];
      type = v12;
      v5 = *(_QWORD *)(a1 + 40);
      v8 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_keyplaneView"));
      v11 = v8;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v14, v5, (uint64_t)v11);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Could not get view for key in keyplane: %@, %@", v14, 0x16u);

      objc_storeStrong(&v11, 0);
    }
    objc_storeStrong(v13, 0);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAccessibilityContainer:", *(_QWORD *)(a1 + 32));
}

- (BOOL)_accessibilityFingerIsDown
{
  id v3;
  int v4;

  v3 = (id)-[UIKeyboardLayoutStarAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("IsFingerDown"));
  LOBYTE(v4) = 0;
  if ((objc_msgSend(v3, "BOOLValue") & 1) != 0)
    v4 = -[UIKeyboardLayoutStarAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("IsActivatingAXKey")) ^ 1;

  return v4 & 1;
}

- (void)touchDown:(id)a3 executionContext:(id)a4
{
  objc_super v5;
  id v6;
  id location[2];
  UIKeyboardLayoutStarAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  -[UIKeyboardLayoutStarAccessibility touchDown:executionContext:](&v5, sel_touchDown_executionContext_, location[0], v6);
  -[UIKeyboardLayoutStarAccessibility _accessibilitySetRetainedValue:forKey:](v8, "_accessibilitySetRetainedValue:forKey:", *MEMORY[0x24BDBD270], CFSTR("IsFingerDown"));
  -[UIKeyboardLayoutStarAccessibility _accessibilitySetIntegerValue:forKey:](v8, "_accessibilitySetIntegerValue:forKey:", -1, CFSTR("AXSpokenVariant"));
  UIAccessibilityPostNotification(0xFA2u, &unk_24FF85E38);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)touchUp:(id)a3 executionContext:(id)a4
{
  objc_super v5;
  id v6;
  id location[2];
  UIKeyboardLayoutStarAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  -[UIKeyboardLayoutStarAccessibility touchUp:executionContext:](&v5, sel_touchUp_executionContext_, location[0], v6);
  -[UIKeyboardLayoutStarAccessibility _accessibilitySetRetainedValue:forKey:](v8, "_accessibilitySetRetainedValue:forKey:", *MEMORY[0x24BDBD268], CFSTR("IsFingerDown"));
  -[UIKeyboardLayoutStarAccessibility _accessibilitySetBoolValue:forKey:](v8, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("IsActivatingAXKey"));
  _UIAXSetLastKeyboardUsed();
  UIAccessibilityPostNotification(0xFA2u, &unk_24FF85E60);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)touchDragged:(id)a3 executionContext:(id)a4
{
  id v4;
  id v5;
  id v6;
  id argument;
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  objc_super v14;
  uint64_t v15;
  id v16;
  id v17;
  char v18;
  id v19;
  int v20;
  objc_super v21;
  id v22;
  id location[2];
  UIKeyboardLayoutStarAccessibility *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = 0;
  objc_storeStrong(&v22, a4);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v18 = 0;
    v6 = (id)-[UIKeyboardLayoutStarAccessibility safeValueForKey:](v24, "safeValueForKey:", CFSTR("activeKey"));
    v17 = (id)__UIAccessibilitySafeClass();

    v16 = v17;
    objc_storeStrong(&v17, 0);
    v19 = v16;
    v15 = -[UIKeyboardLayoutStarAccessibility _accessibilityIntegerValueForKey:](v24, "_accessibilityIntegerValueForKey:", CFSTR("AXSpokenVariant"));
    v14.receiver = v24;
    v14.super_class = (Class)UIKeyboardLayoutStarAccessibility;
    -[UIKeyboardLayoutStarAccessibility touchDragged:executionContext:](&v14, sel_touchDragged_executionContext_, location[0], v22);
    v13 = (int)objc_msgSend(v19, "safeIntForKey:", CFSTR("displayTypeHint"));
    v12 = (id)objc_msgSend(v19, "safeArrayForKey:", CFSTR("subtrees"));
    if (v13 == v15)
    {
      v20 = 1;
    }
    else
    {
      -[UIKeyboardLayoutStarAccessibility _accessibilitySetIntegerValue:forKey:](v24, "_accessibilitySetIntegerValue:forKey:", v13, CFSTR("AXSpokenVariant"));
      if (v13 < objc_msgSend(v12, "count"))
      {
        v11 = (id)objc_msgSend(v12, "objectAtIndex:", v13);
        v10 = -[UIKeyboardLayoutStarAccessibility _accessibilityCreateElementForKey:](v24, v11);
        v9 = (id)objc_msgSend(v10, "accessibilityLabel");
        argument = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v9);
        v4 = argument;
        v5 = (id)objc_msgSend(v10, "accessibilityLanguage");
        objc_msgSend(v4, "setAttribute:forKey:");

        UIAccessibilityPostNotification(*MEMORY[0x24BEBB010], argument);
        objc_storeStrong(&argument, 0);
        objc_storeStrong(&v9, 0);
        objc_storeStrong(&v10, 0);
        objc_storeStrong(&v11, 0);
      }
      v20 = 0;
    }
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v19, 0);
  }
  else
  {
    v21.receiver = v24;
    v21.super_class = (Class)UIKeyboardLayoutStarAccessibility;
    -[UIKeyboardLayoutStarAccessibility touchDragged:executionContext:](&v21, sel_touchDragged_executionContext_, location[0], v22);
    v20 = 1;
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (uint64_t)_axIsWaitingForEmojiPopupAnnouncement
{
  char v2;

  if (a1)
    v2 = __UIAccessibilityGetAssociatedBool() & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (uint64_t)_axSetIsWaitingForEmojiPopupAnnouncement:(uint64_t)result
{
  if (result)
    return __UIAccessibilitySetAssociatedBool();
  return result;
}

- (void)_axHandleEmojiPopupLayoutChangeAfterAnnouncement
{
  id v2;
  UIAccessibilityNotifications notification;
  id v4;
  id location[2];
  UIKeyboardLayoutStarAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  if ((-[UIKeyboardLayoutStarAccessibility _axIsWaitingForEmojiPopupAnnouncement]((uint64_t)self) & 1) != 0)
  {
    location[0] = -[UIKeyboardLayoutStarAccessibility _accessibilityStickyPopupKeys](v6);
    if (objc_msgSend(location[0], "count"))
    {
      notification = *MEMORY[0x24BDF72C8];
      v4 = (id)objc_msgSend(location[0], "firstObject");
      UIAccessibilityPostNotification(notification, v4);

    }
    -[UIKeyboardLayoutStarAccessibility _axSetIsWaitingForEmojiPopupAnnouncement:]((uint64_t)v6);
    v2 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v2, "removeObserver:name:object:", v6, *MEMORY[0x24BDF71D0]);

    objc_storeStrong(location, 0);
  }
}

- (void)continueFromInternationalActionForTouchUp:(id)a3 withActions:(unint64_t)a4 timestamp:(double)a5 interval:(double)a6 didLongPress:(BOOL)a7 prevActions:(unint64_t)a8 executionContext:(id)a9
{
  UIAccessibilityNotifications v9;
  id v10;
  UIAccessibilityNotifications notification;
  id v12;
  id v13;
  id v14;
  id v15;
  id v22;
  UIKeyboardLayoutStarAccessibility *v23;
  id v24;
  id v25;
  id v26;
  char v27;
  id v28;
  id v29;
  id v30;
  id v31;
  char v32;
  id v33;
  objc_super v34;
  id v35;
  unint64_t v36;
  BOOL v37;
  double v38;
  double v39;
  unint64_t v40;
  id location[2];
  UIKeyboardLayoutStarAccessibility *v42;

  v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v40 = a4;
  v39 = a5;
  v38 = a6;
  v37 = a7;
  v36 = a8;
  v35 = 0;
  objc_storeStrong(&v35, a9);
  v34.receiver = v42;
  v34.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  -[UIKeyboardLayoutStarAccessibility continueFromInternationalActionForTouchUp:withActions:timestamp:interval:didLongPress:prevActions:executionContext:](&v34, sel_continueFromInternationalActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext_, location[0], v40, v37, v36, v35, v39, v38);
  v32 = 0;
  objc_opt_class();
  v22 = (id)-[UIKeyboardLayoutStarAccessibility safeValueForKey:](v42, "safeValueForKey:", CFSTR("activeKey"));
  v31 = (id)__UIAccessibilityCastAsClass();

  v30 = v31;
  objc_storeStrong(&v31, 0);
  v33 = v30;
  if (v30 && objc_msgSend(v33, "variantType") == 10)
  {
    v29 = (id)-[UIKeyboardLayoutStarAccessibility _accessibilityDescendantOfType:](v42, "_accessibilityDescendantOfType:", NSClassFromString(CFSTR("UIKeyboardEmojiCollectionInputView")));
    v27 = 0;
    objc_opt_class();
    v15 = (id)objc_msgSend(v29, "safeValueForKey:", CFSTR("_collectionView"));
    v26 = (id)__UIAccessibilityCastAsClass();

    v25 = v26;
    objc_storeStrong(&v26, 0);
    v14 = (id)objc_msgSend(v29, "safeValueForKey:", CFSTR("tappedSkinToneEmoji"));
    v28 = (id)objc_msgSend(v25, "cellForItemAtIndexPath:");

    v24 = (id)objc_msgSend(v28, "_accessibilityVariantKeys");
    -[UIKeyboardLayoutStarAccessibility _accessibilitySetStickyPopupKeys:]((uint64_t)v42, v24);
    if (UIAccessibilityIsVoiceOverRunning())
    {
      notification = *MEMORY[0x24BDF71E8];
      v12 = accessibilityLocalizedString(CFSTR("emoji.variants.alert"));
      UIAccessibilityPostNotification(notification, v12);

      -[UIKeyboardLayoutStarAccessibility _axSetIsWaitingForEmojiPopupAnnouncement:]((uint64_t)v42);
      v13 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      objc_msgSend(v13, "addObserver:selector:name:object:", v42, sel__axHandleEmojiPopupLayoutChangeAfterAnnouncement, *MEMORY[0x24BDF71D0]);

      v23 = v42;
      AXPerformBlockOnMainThreadAfterDelay();
      objc_storeStrong((id *)&v23, 0);
    }
    else
    {
      v9 = *MEMORY[0x24BDF72C8];
      v10 = (id)objc_msgSend(v24, "firstObject");
      UIAccessibilityPostNotification(v9, v10);

    }
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
  }
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

uint64_t __152__UIKeyboardLayoutStarAccessibility_continueFromInternationalActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axHandleEmojiPopupLayoutChangeAfterAnnouncement", a1, a1);
}

- (void)setActiveKey:(id)a3
{
  BOOL v3;
  char v4;
  id v5;
  objc_super v6;
  id location[2];
  UIKeyboardLayoutStarAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6.receiver = v8;
  v6.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  -[UIKeyboardLayoutStarAccessibility setActiveKey:](&v6, sel_setActiveKey_, location[0]);
  v4 = 0;
  v3 = 0;
  if (!location[0])
  {
    v5 = -[UIKeyboardLayoutStarAccessibility _accessibilityStickyPopupKeys](v8);
    v4 = 1;
    v3 = v5 != 0;
  }
  if ((v4 & 1) != 0)

  if (v3)
  {
    -[UIKeyboardLayoutStarAccessibility _accessibilitySetStickyPopupKeys:]((uint64_t)v8, 0);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  }
  objc_storeStrong(location, 0);
}

- (id)_accessibilityInternalData
{
  id v2;
  id v3;
  id v4;

  v3 = a1;
  if (a1)
  {
    v2 = (id)objc_msgSend(v3, "_accessibilityValueForKey:", CFSTR("AXInternalData"));
    if (!v2)
    {
      v2 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCED8]), "init");

      objc_msgSend(v3, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("AXInternalData"));
    }
    v4 = v2;
    objc_storeStrong(&v2, 0);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_accessibilityResetInternalData
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id obj;
  uint64_t v7;
  _QWORD __b[8];
  uint64_t v9;
  id location;
  void *v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11 = a1;
  if (a1)
  {
    location = -[UIKeyboardLayoutStarAccessibility _accessibilityInternalData](v11);
    memset(__b, 0, sizeof(__b));
    obj = location;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v12, 16);
    if (v7)
    {
      v3 = *(_QWORD *)__b[2];
      v4 = 0;
      v5 = v7;
      while (1)
      {
        v2 = v4;
        if (*(_QWORD *)__b[2] != v3)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(__b[1] + 8 * v4);
        v1 = (id)objc_msgSend(location, "objectForKey:", v9);
        objc_msgSend(v1, "setAccessibilityContainer:", 0);

        ++v4;
        if (v2 + 1 >= v5)
        {
          v4 = 0;
          v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v12, 16);
          if (!v5)
            break;
        }
      }
    }

    objc_msgSend(v11, "_accessibilityRemoveValueForKey:", CFSTR("AXInternalData"));
    objc_msgSend(v11, "_accessibilityRemoveValueForKey:", CFSTR("AXInternalStoredKeyOrder"));
    objc_msgSend(v11, "_accessibilityRemoveValueForKey:", CFSTR("kAXStoredVisibleKeysByRow"));
    objc_storeStrong(&location, 0);
  }
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  UIKeyboardLayoutStarAccessibility *v4;

  v4 = self;
  v3 = a2;
  -[UIKeyboardLayoutStarAccessibility _accessibilityResetInternalData](self);
  v2.receiver = v4;
  v2.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  -[UIKeyboardLayoutStarAccessibility dealloc](&v2, sel_dealloc);
}

- (BOOL)accessibilityElementsHidden
{
  int v3;

  LOBYTE(v3) = 0;
  if ((objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySoftwareKeyboardActive") & 1) == 0)
    v3 = AXProcessIsStickerPickerService() ^ 1;
  return v3 & 1;
}

- (BOOL)_accessibilityKeyboardSupportsGestureMode
{
  return 1;
}

- (id)_accessibilityKeyboardKeyForString:(id)a3
{
  id v4;
  UIKeyboardLayoutStarAccessibility *v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, void *, uint64_t, _BYTE *);
  void *v10;
  id v11[2];
  uint64_t v12;
  uint64_t *v13;
  int v14;
  int v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  id location[2];
  UIKeyboardLayoutStarAccessibility *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  v13 = &v12;
  v14 = 838860800;
  v15 = 48;
  v16 = __Block_byref_object_copy__15;
  v17 = __Block_byref_object_dispose__15;
  v18 = 0;
  v5 = v20;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __72__UIKeyboardLayoutStarAccessibility__accessibilityKeyboardKeyForString___block_invoke;
  v10 = &unk_24FF3EE68;
  v11[0] = location[0];
  v11[1] = &v12;
  -[UIKeyboardLayoutStarAccessibility accessibilityEnumerateContainerElementsUsingBlock:](v5, "accessibilityEnumerateContainerElementsUsingBlock:", &v6);
  v4 = (id)v13[5];
  objc_storeStrong(v11, 0);
  _Block_object_dispose(&v12, 8);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v4;
}

void __72__UIKeyboardLayoutStarAccessibility__accessibilityKeyboardKeyForString___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  id v10;
  char v11;
  char v15;
  id v16;
  char v17;
  id v18;
  char v19;
  id v20;
  char v21;
  id v22;
  char v23;
  id v24;
  char v25;
  id v26;
  char v27;
  id v28;
  char v29;
  id v30;
  char v31;
  id v32;
  char v33;
  id v34;
  char v35;
  id v36;
  char v37;
  id v38;
  char v39;
  id v40;
  char v41;
  id v42;
  id v43;
  int v44;
  uint64_t v45;
  _BYTE *v46;
  uint64_t v47;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v47 = a3;
  v46 = a4;
  v45 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = location[0];
    v10 = (id)objc_msgSend(v43, "accessibilityLabel");
    v11 = 0;
    if ((objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
      v11 = objc_msgSend(v43, "isAccessibilityElement");

    if ((v11 & 1) != 0)
      goto LABEL_53;
    v41 = 0;
    v39 = 0;
    v9 = 0;
    if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("\n")) & 1) != 0)
    {
      v42 = (id)-[UIAccessibilityElementKBKey key]((uint64_t)v43);
      v41 = 1;
      v40 = (id)objc_msgSend(v42, "name");
      v39 = 1;
      v9 = objc_msgSend(v40, "isEqualToString:", CFSTR("Return-Key"));
    }
    if ((v39 & 1) != 0)

    if ((v41 & 1) != 0)
    if ((v9 & 1) != 0)
      goto LABEL_53;
    v37 = 0;
    v35 = 0;
    v33 = 0;
    v31 = 0;
    v29 = 0;
    v27 = 0;
    v8 = 0;
    if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR(" ")) & 1) != 0)
    {
      v38 = (id)-[UIAccessibilityElementKBKey key]((uint64_t)v43);
      v37 = 1;
      v36 = (id)objc_msgSend(v38, "name");
      v35 = 1;
      v7 = 1;
      if ((objc_msgSend(v36, "isEqualToString:", CFSTR("Space-Key")) & 1) == 0)
      {
        v34 = (id)-[UIAccessibilityElementKBKey key]((uint64_t)v43);
        v33 = 1;
        v32 = (id)objc_msgSend(v34, "name");
        v31 = 1;
        v7 = 1;
        if ((objc_msgSend(v32, "isEqualToString:", CFSTR("Unlabeled-Space-Key")) & 1) == 0)
        {
          v30 = (id)-[UIAccessibilityElementKBKey key]((uint64_t)v43);
          v29 = 1;
          v28 = (id)objc_msgSend(v30, "name");
          v27 = 1;
          v7 = objc_msgSend(v28, "isEqualToString:", CFSTR("Monolith-Space-Key"));
        }
      }
      v8 = v7;
    }
    if ((v27 & 1) != 0)

    if ((v29 & 1) != 0)
    if ((v31 & 1) != 0)

    if ((v33 & 1) != 0)
    if ((v35 & 1) != 0)

    if ((v37 & 1) != 0)
    if ((v8 & 1) != 0)
      goto LABEL_53;
    v25 = 0;
    v23 = 0;
    v21 = 0;
    v19 = 0;
    v6 = 0;
    if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("\b")) & 1) != 0)
    {
      v26 = (id)-[UIAccessibilityElementKBKey key]((uint64_t)v43);
      v25 = 1;
      v24 = (id)objc_msgSend(v26, "name");
      v23 = 1;
      v5 = 1;
      if ((objc_msgSend(v24, "isEqualToString:", CFSTR("Delete-Key")) & 1) == 0)
      {
        v22 = (id)-[UIAccessibilityElementKBKey key]((uint64_t)v43);
        v21 = 1;
        v20 = (id)objc_msgSend(v22, "name");
        v19 = 1;
        v5 = objc_msgSend(v20, "isEqualToString:", CFSTR("Monolith-Linear-Delete-Key"));
      }
      v6 = v5;
    }
    if ((v19 & 1) != 0)

    if ((v21 & 1) != 0)
    if ((v23 & 1) != 0)

    if ((v25 & 1) != 0)
    if ((v6 & 1) != 0)
      goto LABEL_53;
    v17 = 0;
    v15 = 0;
    v4 = 0;
    if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("&")) & 1) != 0)
    {
      v18 = (id)-[UIAccessibilityElementKBKey key]((uint64_t)v43);
      v17 = 1;
      v16 = (id)objc_msgSend(v18, "name");
      v15 = 1;
      v4 = objc_msgSend(v16, "isEqualToString:", CFSTR("Ampersand"));
    }
    if ((v15 & 1) != 0)

    if ((v17 & 1) != 0)
    if ((v4 & 1) != 0)
    {
LABEL_53:
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v43);
      *v46 = 1;
    }
    objc_storeStrong(&v43, 0);
    v44 = 0;
  }
  else
  {
    v44 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilityChangeToKeyplane:(id)a3
{
  id v3;
  int v4;
  id location[2];
  UIKeyboardLayoutStarAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = (id)-[UIKeyboardLayoutStarAccessibility keyplaneNamed:](v6, "keyplaneNamed:", location[0]);
    -[UIKeyboardLayoutStarAccessibility changeToKeyplane:](v6, "changeToKeyplane:", v3);
    -[UIKeyboardLayoutStarAccessibility _accessibilityRemoveValueForKey:](v6, "_accessibilityRemoveValueForKey:", CFSTR("AXInternalStoredKeyOrder"));
    objc_storeStrong(&v3, 0);
    v4 = 0;
  }
  else
  {
    v4 = 1;
  }
  objc_storeStrong(location, 0);
}

- (id)_accessibiltyAvailableKeyplanes
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  id obj;
  uint64_t v12;
  _QWORD __b[8];
  id v14;
  id v15[2];
  UIKeyboardLayoutStarAccessibility *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16 = self;
  v15[1] = (id)a2;
  v15[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  memset(__b, 0, sizeof(__b));
  v10 = (id)-[UIKeyboardLayoutStarAccessibility safeValueForKey:](v16, "safeValueForKey:", CFSTR("keyboard"));
  obj = (id)objc_msgSend(v10, "safeValueForKey:", CFSTR("subtrees"));

  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
  if (v12)
  {
    v7 = *(_QWORD *)__b[2];
    v8 = 0;
    v9 = v12;
    while (1)
    {
      v6 = v8;
      if (*(_QWORD *)__b[2] != v7)
        objc_enumerationMutation(obj);
      v14 = *(id *)(__b[1] + 8 * v8);
      v4 = v15[0];
      v5 = (id)objc_msgSend(v14, "name");
      objc_msgSend(v4, "addObject:");

      ++v8;
      if (v6 + 1 >= v9)
      {
        v8 = 0;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
        if (!v9)
          break;
      }
    }
  }

  v3 = v15[0];
  objc_storeStrong(v15, 0);
  return v3;
}

- (id)_accessibilityKeys
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7[2];
  UIKeyboardLayoutStarAccessibility *v8;

  v8 = self;
  v7[1] = (id)a2;
  v7[0] = (id)-[UIKeyboardLayoutStarAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXInternalStoredKeyOrder"));
  if (!v7[0])
  {
    v7[0] = -[UIKeyboardLayoutStarAccessibility _accessibilitySortedUnstoredKeys](v8, "_accessibilitySortedUnstoredKeys");

    -[UIKeyboardLayoutStarAccessibility _accessibilitySetRetainedValue:forKey:](v8, "_accessibilitySetRetainedValue:forKey:", v7[0], CFSTR("AXInternalStoredKeyOrder"));
    v6 = (id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
    v5 = (id)objc_msgSend(v6, "currentInputMode");
    v4 = (id)objc_msgSend(v5, "primaryLanguage");
    -[UIKeyboardLayoutStarAccessibility _accessibilitySetRetainedValue:forKey:](v8, "_accessibilitySetRetainedValue:forKey:");

  }
  v3 = v7[0];
  objc_storeStrong(v7, 0);
  return v3;
}

- (id)_accessibilityVisibleKeysByRow
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id obj;
  uint64_t v30;
  _QWORD v31[8];
  id v32;
  id v33;
  int v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  id location;
  _QWORD v40[8];
  id v41;
  char v42;
  __int128 v43;
  __int128 v44;
  _QWORD __b[8];
  id v46;
  id v47;
  id v48;
  id v49[2];
  UIKeyboardLayoutStarAccessibility *v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v50 = self;
  v49[1] = (id)a2;
  v49[0] = (id)-[UIKeyboardLayoutStarAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("kAXStoredVisibleKeysByRow"));
  if (!v49[0])
  {
    v48 = -[UIKeyboardLayoutStarAccessibility _accessibilityKeys](v50, "_accessibilityKeys");
    v47 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    memset(__b, 0, sizeof(__b));
    obj = v48;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v53, 16);
    if (v30)
    {
      v26 = *(_QWORD *)__b[2];
      v27 = 0;
      v28 = v30;
      while (1)
      {
        v25 = v27;
        if (*(_QWORD *)__b[2] != v26)
          objc_enumerationMutation(obj);
        v46 = *(id *)(__b[1] + 8 * v27);
        if ((objc_msgSend(v46, "visible") & 1) != 0)
        {
          v43 = 0u;
          v44 = 0u;
          objc_msgSend(v46, "frame");
          *(_QWORD *)&v43 = v2;
          *((_QWORD *)&v43 + 1) = v3;
          *(_QWORD *)&v44 = v4;
          *((_QWORD *)&v44 + 1) = v5;
          v42 = 0;
          memset(v40, 0, sizeof(v40));
          v23 = v47;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", v40, v52, 16);
          if (v24)
          {
            v20 = *(_QWORD *)v40[2];
            v21 = 0;
            v22 = v24;
            while (1)
            {
              v19 = v21;
              if (*(_QWORD *)v40[2] != v20)
                objc_enumerationMutation(v23);
              v41 = *(id *)(v40[1] + 8 * v21);
              location = (id)objc_msgSend(v41, "firstObject");
              v18 = *((double *)&v43 + 1);
              objc_msgSend(location, "frame");
              v35 = v6;
              v36 = v7;
              v37 = v8;
              v38 = v9;
              if (CGFAbs_0(v18 - v7) >= 0.001)
              {
                v34 = 0;
              }
              else
              {
                objc_msgSend(v41, "addObject:", v46);
                v42 = 1;
                v34 = 4;
              }
              objc_storeStrong(&location, 0);
              if (v34)
                break;
              ++v21;
              if (v19 + 1 >= v22)
              {
                v21 = 0;
                v22 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", v40, v52, 16);
                if (!v22)
                  goto LABEL_17;
              }
            }
          }
          else
          {
LABEL_17:
            v34 = 0;
          }

          if ((v42 & 1) == 0)
          {
            v33 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v46);
            objc_msgSend(v47, "addObject:", v33);
            objc_storeStrong(&v33, 0);
          }
        }
        ++v27;
        if (v25 + 1 >= v28)
        {
          v27 = 0;
          v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v53, 16);
          if (!v28)
            break;
        }
      }
    }

    memset(v31, 0, sizeof(v31));
    v16 = v47;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", v31, v51, 16);
    if (v17)
    {
      v13 = *(_QWORD *)v31[2];
      v14 = 0;
      v15 = v17;
      while (1)
      {
        v12 = v14;
        if (*(_QWORD *)v31[2] != v13)
          objc_enumerationMutation(v16);
        v32 = *(id *)(v31[1] + 8 * v14);
        objc_msgSend(v32, "sortUsingComparator:", &__block_literal_global_24);
        ++v14;
        if (v12 + 1 >= v15)
        {
          v14 = 0;
          v15 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", v31, v51, 16);
          if (!v15)
            break;
        }
      }
    }

    objc_msgSend(v47, "sortUsingComparator:", &__block_literal_global_382);
    -[UIKeyboardLayoutStarAccessibility _accessibilitySetRetainedValue:forKey:](v50, "_accessibilitySetRetainedValue:forKey:", v47, CFSTR("kAXStoredVisibleKeysByRow"));
    objc_storeStrong(v49, v47);
    objc_storeStrong(&v47, 0);
    objc_storeStrong(&v48, 0);
  }
  v11 = v49[0];
  v34 = 1;
  objc_storeStrong(v49, 0);
  return v11;
}

uint64_t __67__UIKeyboardLayoutStarAccessibility__accessibilityVisibleKeysByRow__block_invoke(void *a1, void *a2, void *a3)
{
  double v3;
  double v4;
  double v7;
  id v8;
  id location[2];
  uint64_t v10;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8 = 0;
  objc_storeStrong(&v8, a3);
  objc_msgSend(location[0], "frame");
  v7 = v3;
  objc_msgSend(v8, "frame");
  if (v7 >= v4)
    v10 = 1;
  else
    v10 = -1;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v10;
}

uint64_t __67__UIKeyboardLayoutStarAccessibility__accessibilityVisibleKeysByRow__block_invoke_2(void *a1, void *a2, void *a3)
{
  double v3;
  double v4;
  id v7;
  double v8;
  id v9;
  BOOL v10;
  id v11;
  id location[2];
  uint64_t v13;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v11 = 0;
  objc_storeStrong(&v11, a3);
  v9 = (id)objc_msgSend(location[0], "firstObject");
  objc_msgSend(v9, "frame");
  v8 = v3;
  v7 = (id)objc_msgSend(v11, "firstObject");
  objc_msgSend(v7, "frame");
  v10 = v8 >= v4;

  if (v10)
    v13 = 1;
  else
    v13 = -1;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v13;
}

- (id)_accessibilitySortedUnstoredKeys
{
  id v2;
  id v3;
  id v4;
  id v6;
  NSObject *log;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  id v13;
  id obj;
  uint64_t v15;
  id v16;
  id v17;
  os_log_t oslog;
  char v19;
  char v20;
  _QWORD __b[8];
  id v22;
  id v23;
  id v24;
  id v25;
  char v26;
  id v27;
  id v28;
  char v29;
  id v30;
  id v31[2];
  UIKeyboardLayoutStarAccessibility *v32;
  uint8_t v33[24];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v32 = self;
  v31[1] = (id)a2;
  v31[0] = (id)-[UIKeyboardLayoutStarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("keyplane"));
  v30 = 0;
  if ((-[UIKeyboardLayoutStarAccessibility _accessibilityIsRTL](v32, "_accessibilityIsRTL") & 1) != 0)
  {
    v29 = 0;
    objc_opt_class();
    v17 = (id)objc_msgSend(v31[0], "safeValueForKey:", CFSTR("keys"));
    v28 = (id)__UIAccessibilityCastAsClass();

    v27 = v28;
    objc_storeStrong(&v28, 0);
    v2 = (id)objc_msgSend(v27, "sortedArrayUsingFunction:context:", accessibilityRTLKeyPositionSort, 0);
    v3 = v30;
    v30 = v2;

  }
  else
  {
    v26 = 0;
    objc_opt_class();
    v16 = (id)objc_msgSend(v31[0], "safeValueForKey:", CFSTR("keysOrderedByPositionWithoutZip"));
    v25 = (id)__UIAccessibilityCastAsClass();

    v24 = v25;
    objc_storeStrong(&v25, 0);
    v4 = v30;
    v30 = v24;

  }
  v13 = (id)objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v30);
  v12 = (id)objc_msgSend(v13, "array");
  v23 = (id)objc_msgSend(v12, "mutableCopy");

  memset(__b, 0, sizeof(__b));
  obj = v30;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v34, 16);
  if (v15)
  {
    v9 = *(_QWORD *)__b[2];
    v10 = 0;
    v11 = v15;
    while (1)
    {
      v8 = v10;
      if (*(_QWORD *)__b[2] != v9)
        objc_enumerationMutation(obj);
      v22 = *(id *)(__b[1] + 8 * v10);
      v20 = 0;
      objc_opt_class();
      v20 = objc_opt_isKindOfClass() & 1;
      v19 = 1;
      if (!v20 || (objc_msgSend(v22, "visible") & 1) == 0 || (v19 & 1) == 0)
      {
        if ((v20 & 1) == 0)
        {
          oslog = (os_log_t)(id)AXLogCommon();
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            log = oslog;
            __os_log_helper_16_2_1_8_64((uint64_t)v33, (uint64_t)v22);
            _os_log_error_impl(&dword_230C4A000, log, OS_LOG_TYPE_ERROR, "Unexpected kb tree: %@", v33, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
        }
        objc_msgSend(v23, "removeObject:", v22);
      }
      ++v10;
      if (v8 + 1 >= v11)
      {
        v10 = 0;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v34, 16);
        if (!v11)
          break;
      }
    }
  }

  v6 = (id)objc_msgSend(v23, "copy");
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(v31, 0);
  return v6;
}

- (void)_axClearReturnKeyLabel
{
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  id obj;
  uint64_t v8;
  char v9;
  id v10;
  char v11;
  id v12;
  char v13;
  id v14;
  id v15;
  id v16;
  char v17;
  _QWORD __b[8];
  id v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20 = a1;
  if (a1)
  {
    memset(__b, 0, sizeof(__b));
    v6 = -[UIKeyboardLayoutStarAccessibility _accessibilityInternalData](v20);
    obj = (id)objc_msgSend(v6, "allValues");

    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
    if (v8)
    {
      v3 = *(_QWORD *)__b[2];
      v4 = 0;
      v5 = v8;
      while (1)
      {
        v2 = v4;
        if (*(_QWORD *)__b[2] != v3)
          objc_enumerationMutation(obj);
        v19 = *(id *)(__b[1] + 8 * v4);
        objc_opt_class();
        v13 = 0;
        v11 = 0;
        v9 = 0;
        v1 = 0;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = 0;
          objc_opt_class();
          v16 = (id)__UIAccessibilityCastAsClass();
          if ((v17 & 1) != 0)
            abort();
          v15 = v16;
          objc_storeStrong(&v16, 0);
          v14 = v15;
          v13 = 1;
          v12 = (id)-[UIAccessibilityElementKBKey key]((uint64_t)v15);
          v11 = 1;
          v10 = (id)objc_msgSend(v12, "name");
          v9 = 1;
          v1 = objc_msgSend(v10, "isEqualToString:", CFSTR("Return-Key"));
        }
        if ((v9 & 1) != 0)

        if ((v11 & 1) != 0)
        if ((v13 & 1) != 0)

        if ((v1 & 1) != 0)
          objc_msgSend(v19, "setAccessibilityLabel:", 0);
        ++v4;
        if (v2 + 1 >= v5)
        {
          v4 = 0;
          v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
          if (!v5)
            break;
        }
      }
    }

  }
}

- (void)setLabel:(id)a3 forKey:(id)a4
{
  objc_super v5;
  id v6;
  id location[2];
  UIKeyboardLayoutStarAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  -[UIKeyboardLayoutStarAccessibility setLabel:forKey:](&v5, sel_setLabel_forKey_, location[0], v6);
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF7AF8]) & 1) != 0)
    -[UIKeyboardLayoutStarAccessibility _axClearReturnKeyLabel](v8);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)setReturnKeyEnabled:(BOOL)a3 withDisplayName:(id)a4 withType:(int)a5
{
  objc_super v6;
  int v7;
  id location;
  BOOL v9;
  SEL v10;
  UIKeyboardLayoutStarAccessibility *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v7 = a5;
  v6.receiver = v11;
  v6.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  -[UIKeyboardLayoutStarAccessibility setReturnKeyEnabled:withDisplayName:withType:](&v6, sel_setReturnKeyEnabled_withDisplayName_withType_, v9, location, a5);
  -[UIKeyboardLayoutStarAccessibility _axClearReturnKeyLabel](v11);
  objc_storeStrong(&location, 0);
}

- (uint64_t)_isCapitalLetterKeyplane:(uint64_t)a1
{
  id v3;
  id location;
  uint64_t v5;
  char v6;

  v5 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v5)
  {
    v3 = (id)objc_msgSend(location, "lowercaseString");
    v6 = objc_msgSend(v3, "hasSuffix:", CFSTR("capital-letters")) & 1;

  }
  else
  {
    v6 = 0;
  }
  objc_storeStrong(&location, 0);
  return v6 & 1;
}

- (uint64_t)_isSmallLetterKeyplane:(uint64_t)a1
{
  id v3;
  id location;
  uint64_t v5;
  char v6;

  v5 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v5)
  {
    v3 = (id)objc_msgSend(location, "lowercaseString");
    v6 = objc_msgSend(v3, "hasSuffix:", CFSTR("small-letters")) & 1;

  }
  else
  {
    v6 = 0;
  }
  objc_storeStrong(&location, 0);
  return v6 & 1;
}

- (void)setKeyplaneName:(id)a3
{
  id v3;
  id v4;
  UIAccessibilityNotifications notification;
  id v6;
  id v7;
  id v8;
  id v9;
  char v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(id *, void *, void *, void *);
  void *v19;
  id v20;
  id v21;
  id v22;
  char v23;
  uint64_t v24;
  int v25;
  int v26;
  void (*v27)(_QWORD *, void *);
  void *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  int v32;
  int v33;
  uint64_t v34;
  char v35;
  id v36;
  int v37;
  id v38;
  objc_super v39;
  id v40;
  id v41;
  uint64_t v42;
  int v43;
  int v44;
  void (*v45)(_QWORD *, void *);
  void *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  int v50;
  int v51;
  uint64_t v52;
  id v53;
  id location[2];
  UIKeyboardLayoutStarAccessibility *v55;

  v55 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v53 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x20000000;
  v51 = 32;
  v52 = 0;
  v3 = -[UIKeyboardLayoutStarAccessibility _accessibilityKeys](v55, "_accessibilityKeys");
  v4 = v53;
  v53 = v3;

  v42 = MEMORY[0x24BDAC760];
  v43 = -1073741824;
  v44 = 0;
  v45 = __53__UIKeyboardLayoutStarAccessibility_setKeyplaneName___block_invoke;
  v46 = &unk_24FF3E960;
  v47 = &v48;
  objc_msgSend(v53, "enumerateObjectsUsingBlock:", &v42);
  v41 = (id)-[UIKeyboardLayoutStarAccessibility safeValueForKey:](v55, "safeValueForKey:", CFSTR("_keyplane"));
  v40 = (id)-[UIKeyboardLayoutStarAccessibility safeValueForKey:](v55, "safeValueForKey:", CFSTR("keyplaneName"));
  v39.receiver = v55;
  v39.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  -[UIKeyboardLayoutStarAccessibility setKeyplaneName:](&v39, sel_setKeyplaneName_, location[0]);
  v38 = (id)-[UIKeyboardLayoutStarAccessibility safeValueForKey:](v55, "safeValueForKey:", CFSTR("_keyplane"));
  if (v41 == v38)
  {
    v37 = 1;
  }
  else
  {
    v36 = -[UIKeyboardLayoutStarAccessibility _accessibilityKeys](v55, "_accessibilityKeys");
    v35 = 0;
    if ((-[UIKeyboardLayoutStarAccessibility _isCapitalLetterKeyplane:]((uint64_t)v55, v40) & 1) != 0
      && (-[UIKeyboardLayoutStarAccessibility _isSmallLetterKeyplane:]((uint64_t)v55, location[0]) & 1) != 0
      || (-[UIKeyboardLayoutStarAccessibility _isCapitalLetterKeyplane:]((uint64_t)v55, location[0]) & 1) != 0
      && (-[UIKeyboardLayoutStarAccessibility _isSmallLetterKeyplane:]((uint64_t)v55, v40) & 1) != 0)
    {
      v35 = 1;
    }
    v30 = 0;
    v31 = &v30;
    v32 = 0x20000000;
    v33 = 32;
    v34 = 0;
    v24 = MEMORY[0x24BDAC760];
    v25 = -1073741824;
    v26 = 0;
    v27 = __53__UIKeyboardLayoutStarAccessibility_setKeyplaneName___block_invoke_2;
    v28 = &unk_24FF3E960;
    v29 = &v30;
    objc_msgSend(v36, "enumerateObjectsUsingBlock:", &v24);
    v23 = 0;
    v14 = 1;
    if ((v35 & 1) != 0)
      v14 = v49[3] != v31[3];
    v23 = v14;
    if (v14)
    {
      v13 = (id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
      v12 = (id)objc_msgSend(v13, "currentInputMode");
      v11 = (id)objc_msgSend(v12, "primaryLanguage");
      v9 = (id)-[UIKeyboardLayoutStarAccessibility _accessibilityValueForKey:](v55, "_accessibilityValueForKey:", CFSTR("AXCurrentLanguage"));
      v10 = objc_msgSend(v11, "isEqualToString:");

      if ((v10 & 1) == 0)
        v23 = 1;
    }
    v8 = (id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
    v7 = (id)objc_msgSend(v8, "currentInputMode");
    v22 = (id)objc_msgSend(v7, "primaryLanguage");

    if (!UIAccessibilityIsVoiceOverRunning()
      || (v35 & 1) != 0
      && ((objc_msgSend(v22, "hasPrefix:", CFSTR("th")) & 1) != 0
       || (objc_msgSend(v22, "hasPrefix:", CFSTR("hi")) & 1) != 0
       || (objc_msgSend(v22, "hasPrefix:", CFSTR("ko")) & 1) != 0))
    {
      v23 = 1;
    }
    if ((v23 & 1) != 0)
    {
      -[UIKeyboardLayoutStarAccessibility _accessibilityResetInternalData](v55);
    }
    else
    {
      v21 = -[UIKeyboardLayoutStarAccessibility _accessibilityInternalData](v55);
      v6 = -[UIKeyboardLayoutStarAccessibility _accessibilityKeys](v55, "_accessibilityKeys");
      v15 = MEMORY[0x24BDAC760];
      v16 = -1073741824;
      v17 = 0;
      v18 = __53__UIKeyboardLayoutStarAccessibility_setKeyplaneName___block_invoke_3;
      v19 = &unk_24FF3E490;
      v20 = v21;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v15);

      objc_storeStrong(&v20, 0);
      objc_storeStrong(&v21, 0);
    }
    if ((v23 & 1) != 0 && (objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySoftwareKeyboardActive") & 1) != 0)
    {
      notification = *MEMORY[0x24BDF72C8];
      if (UIAccessibilityIsSwitchControlRunning())
        UIAccessibilityPostNotification(notification, (id)*MEMORY[0x24BDFEEB0]);
      else
        UIAccessibilityPostNotification(notification, 0);
    }
    objc_storeStrong(&v22, 0);
    _Block_object_dispose(&v30, 8);
    objc_storeStrong(&v36, 0);
    v37 = 0;
  }
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  _Block_object_dispose(&v48, 8);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(location, 0);
}

void __53__UIKeyboardLayoutStarAccessibility_setKeyplaneName___block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(location[0], "visible") & 1) != 0)
    ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  objc_storeStrong(location, 0);
}

void __53__UIKeyboardLayoutStarAccessibility_setKeyplaneName___block_invoke_2(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(location[0], "visible") & 1) != 0)
    ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  objc_storeStrong(location, 0);
}

void __53__UIKeyboardLayoutStarAccessibility_setKeyplaneName___block_invoke_3(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8[4];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8[3] = a3;
  v8[2] = a4;
  v8[1] = a1;
  v8[0] = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", a3);
  v7 = (id)objc_msgSend(a1[4], "objectForKey:", v8[0]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIAccessibilityElementKBKey setKey:]((uint64_t)v7, location[0]);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(v8, 0);
  objc_storeStrong(location, 0);
}

- (void)didBeginContinuousPath
{
  objc_super v2;
  SEL v3;
  UIKeyboardLayoutStarAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  -[UIKeyboardLayoutStarAccessibility didBeginContinuousPath](&v2, sel_didBeginContinuousPath);
  UIAccessibilityPostNotification(0x427u, 0);
}

- (id)automationElements
{
  id v2;
  id v3;
  id v5;
  id v6;
  id location;
  objc_super v8;
  id v9[3];

  v9[2] = self;
  v9[1] = (id)a2;
  v8.receiver = self;
  v8.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  v9[0] = -[UIKeyboardLayoutStarAccessibility automationElements](&v8, sel_automationElements);
  v6 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
  location = (id)objc_msgSend(v6, "autocorrectPrompt");

  if (location && (objc_msgSend(location, "isHiddenOrHasHiddenAncestor") & 1) == 0)
  {
    v2 = (id)objc_msgSend(v9[0], "arrayByAddingObject:", location);
    v3 = v9[0];
    v9[0] = v2;

  }
  v5 = v9[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v9, 0);
  return v5;
}

- (void)showPopupVariantsForKey:(id)a3
{
  char v3;
  float v4;
  id v5;
  uint64_t v6;
  objc_super v7;
  os_log_type_t type;
  os_log_t oslog;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  UIKeyboardLayoutStarAccessibility *v17;
  uint64_t v18;
  id location[2];
  UIKeyboardLayoutStarAccessibility *v20;
  uint8_t v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v11 = MEMORY[0x24BDAC760];
    v12 = -1073741824;
    v13 = 0;
    v14 = __61__UIKeyboardLayoutStarAccessibility_showPopupVariantsForKey___block_invoke;
    v15 = &unk_24FF3E050;
    v16 = location[0];
    v17 = v20;
    v18 = MEMORY[0x2348C3D88](&v11);
    v10 = 0;
    v5 = (id)objc_msgSend(MEMORY[0x24BDF6B18], "activeKeyboard");
    v3 = objc_msgSend(v5, "_accessibilityKeyboardIsContinuousPathAvailable");
    v4 = 0.5;
    if ((v3 & 1) == 0)
      v4 = 0.0;
    *(double *)&v6 = v4;

    v10 = v6;
    oslog = (os_log_t)(id)VOTLogCommon();
    type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v21, v10);
      _os_log_impl(&dword_230C4A000, oslog, type, "Delay for popup keys: %f", v21, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    AXPerformBlockOnMainThreadAfterDelay();
    objc_storeStrong((id *)&v18, 0);
    objc_storeStrong((id *)&v17, 0);
    objc_storeStrong(&v16, 0);
  }
  else
  {
    v7.receiver = v20;
    v7.super_class = (Class)UIKeyboardLayoutStarAccessibility;
    -[UIKeyboardLayoutStarAccessibility showPopupVariantsForKey:](&v7, sel_showPopupVariantsForKey_, location[0]);
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAFF8], 0);
  }
  objc_storeStrong(location, 0);
}

void __61__UIKeyboardLayoutStarAccessibility_showPopupVariantsForKey___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  UIAccessibilityNotifications notification;
  id v4;
  id v5;
  id v7;
  char v8;
  objc_super v9;
  uint64_t v10;
  uint64_t v11;

  v11 = a1;
  v10 = a1;
  v7 = (id)objc_msgSend(MEMORY[0x24BDF6B18], "activeKeyboard");
  v8 = objc_msgSend(v7, "_accessibilityKeyboardIsContinuousPathTracking");

  if ((v8 & 1) == 0)
  {
    v1 = *(_QWORD *)(a1 + 32);
    v9.receiver = *(id *)(a1 + 40);
    v9.super_class = (Class)UIKeyboardLayoutStarAccessibility;
    objc_msgSendSuper2(&v9, sel_showPopupVariantsForKey_, v1);
    notification = *MEMORY[0x24BDF71E8];
    v5 = accessibilityLocalizedString(CFSTR("keyboard.variants.alert"));
    v2 = accessibilityLocalizedString(CFSTR("keyboard.variants.hint"));
    v4 = (id)__UIAXStringForVariables();
    UIAccessibilityPostNotification(notification, v4);

    UIAccessibilityPostNotification(*MEMORY[0x24BEBAFF8], 0);
  }
}

- (void)showPopupView:(int64_t)a3 withKey:(id)a4 popupInfo:(id)a5 force:(BOOL)a6
{
  id v6;
  id v7;
  UIAccessibilityNotifications notification;
  id v9;
  id v10;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  objc_super v17;
  BOOL v18;
  BOOL v19;
  id v20;
  id location;
  int64_t v22;
  SEL v23;
  UIKeyboardLayoutStarAccessibility *v24;

  v24 = self;
  v23 = a2;
  v22 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v20 = 0;
  objc_storeStrong(&v20, a5);
  v19 = a6;
  v15 = (id)-[UIKeyboardLayoutStarAccessibility safeValueForKey:](v24, "safeValueForKey:", CFSTR("_keyplaneView"));
  v14 = (id)objc_msgSend(v15, "safeDictionaryForKey:", CFSTR("_activeViewIndex"));
  v13 = (id)objc_msgSend(location, "name");
  v6 = (id)objc_msgSend(v14, "objectForKey:");
  v16 = v6 != 0;

  v18 = !v16;
  v17.receiver = v24;
  v17.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  -[UIKeyboardLayoutStarAccessibility showPopupView:withKey:popupInfo:force:](&v17, sel_showPopupView_withKey_popupInfo_force_, v22, location, v20, a6);
  if (v18)
  {
    notification = *MEMORY[0x24BDF71E8];
    v10 = accessibilityLocalizedString(CFSTR("keyboard.variants.alert"));
    v7 = accessibilityLocalizedString(CFSTR("keyboard.variants.hint"));
    v9 = (id)__UIAXStringForVariables();
    UIAccessibilityPostNotification(notification, v9);

    UIAccessibilityPostNotification(*MEMORY[0x24BEBAFF8], 0);
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&location, 0);
}

- (void)setState:(int)a3 forKey:(id)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id argument;
  id v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  objc_super v14;
  id location;
  unsigned int v16;
  SEL v17;
  UIKeyboardLayoutStarAccessibility *v18;

  v18 = self;
  v17 = a2;
  v16 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v14.receiver = v18;
  v14.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  -[UIKeyboardLayoutStarAccessibility setState:forKey:](&v14, sel_setState_forKey_, v16, location);
  if (v16 == 16)
  {
    v13 = 0;
    v12 = (id)objc_msgSend(location, "subtrees");
    if (objc_msgSend(location, "interactionType") == 16)
    {
      v11 = objc_msgSend(location, "flickDirection");
      if (v11 + 1 < (unint64_t)objc_msgSend(v12, "count"))
      {
        v4 = (id)objc_msgSend(v12, "objectAtIndex:", v11 + 1);
        v5 = v13;
        v13 = v4;

      }
    }
    else
    {
      v10 = objc_msgSend(location, "safeIntegerForKey:", CFSTR("selectedVariantIndex"));
      if (v10 < objc_msgSend(v12, "count"))
      {
        v6 = (id)objc_msgSend(v12, "objectAtIndex:", v10);
        v7 = v13;
        v13 = v6;

      }
    }
    v9 = -[UIKeyboardLayoutStarAccessibility _accessibilityCreateElementForKey:](v18, v13);
    argument = (id)objc_msgSend(v9, "accessibilityLabel");
    if (!setState_forKey__LastLabel
      || (objc_msgSend(argument, "isEqualToString:", setState_forKey__LastLabel) & 1) == 0)
    {
      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);
      objc_storeStrong((id *)&setState_forKey__LastLabel, argument);
    }
    objc_storeStrong(&argument, 0);
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v13, 0);
  }
  else
  {
    objc_storeStrong((id *)&setState_forKey__LastLabel, 0);
  }
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityKeyElementForKey:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  int v17;
  id v18;
  id v19;
  id v20;
  BOOL v21;
  char v22;
  uint64_t v23;
  id location[2];
  UIKeyboardLayoutStarAccessibility *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = -[UIKeyboardLayoutStarAccessibility _accessibilityKeys](v25, "_accessibilityKeys");
  v11 = objc_msgSend(v10, "indexOfObject:", location[0]);

  v23 = v11;
  v15 = (id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
  v14 = (id)objc_msgSend(v15, "currentInputMode");
  v13 = (id)objc_msgSend(v14, "primaryLanguage");
  v12 = (id)-[UIKeyboardLayoutStarAccessibility _accessibilityValueForKey:](v25, "_accessibilityValueForKey:", CFSTR("AXCurrentLanguage"));
  v16 = objc_msgSend(v13, "isEqualToString:") ^ 1;

  v22 = v16 & 1;
  v17 = -[UIKeyboardLayoutStarAccessibility _accessibilityIsRTL](v25, "_accessibilityIsRTL") & 1;
  v21 = v17 != (-[UIKeyboardLayoutStarAccessibility _accessibilityBoolValueForKey:](v25, "_accessibilityBoolValueForKey:", CFSTR("AXIsRTL")) & 1);
  if ((v16 & 1) != 0 || v21)
  {
    -[UIKeyboardLayoutStarAccessibility _accessibilityResetInternalData](v25);
    -[UIKeyboardLayoutStarAccessibility _accessibilitySetBoolValue:forKey:](v25, "_accessibilitySetBoolValue:forKey:", -[UIKeyboardLayoutStarAccessibility _accessibilityIsRTL](v25, "_accessibilityIsRTL") & 1, CFSTR("AXIsRTL"));
  }
  if (v23 == 0x7FFFFFFFFFFFFFFFLL || (v22 & 1) != 0)
  {
    -[UIKeyboardLayoutStarAccessibility _accessibilityRemoveValueForKey:](v25, "_accessibilityRemoveValueForKey:", CFSTR("AXInternalStoredKeyOrder"));
    v9 = -[UIKeyboardLayoutStarAccessibility _accessibilityKeys](v25, "_accessibilityKeys");
    v23 = objc_msgSend(v9, "indexOfObject:", location[0]);

  }
  v20 = -[UIKeyboardLayoutStarAccessibility _accessibilityInternalData](v25);
  v19 = 0;
  if (v23 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = -[UIKeyboardLayoutStarAccessibility _accessibilityCreateElementForKey:](v25, location[0]);
    v4 = v19;
    v19 = v3;

  }
  else
  {
    v18 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", v23);
    v5 = (id)objc_msgSend(v20, "objectForKey:", v18);
    v6 = v19;
    v19 = v5;

    if (!v19)
    {
      v19 = -[UIKeyboardLayoutStarAccessibility _accessibilityCreateElementForKey:](v25, location[0]);

      objc_msgSend(v20, "setObject:forKey:", v19, v18);
    }
    objc_storeStrong(&v18, 0);
  }
  v8 = v19;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v4;
  id v5;
  double v6;
  double v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v17;
  char v18;
  id v19;
  char v20;
  id v21;
  char v22;
  id v23;
  id v24;
  id v25;
  char v26;
  double v27;
  double v28;
  char v29;
  id v30;
  uint64_t v31;
  int v32;
  int v33;
  BOOL (*v34)(void *, void *);
  void *v35;
  CGPoint v36;
  uint64_t v37;
  id v38;
  id v39;
  int v40;
  id location[2];
  UIKeyboardLayoutStarAccessibility *v42;
  CGPoint v43;
  UIKeyboardLayoutStarAccessibility *v44;

  v43 = a3;
  v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if ((-[UIKeyboardLayoutStarAccessibility pointInside:withEvent:](v42, "pointInside:withEvent:", location[0], v43) & 1) != 0)
  {
    v39 = 0;
    v38 = -[UIKeyboardLayoutStarAccessibility _accessibilityStickyPopupKeys](v42);
    if (v38)
    {
      v37 = 0;
      v31 = MEMORY[0x24BDAC760];
      v32 = -1073741824;
      v33 = 0;
      v34 = __69__UIKeyboardLayoutStarAccessibility__accessibilityHitTest_withEvent___block_invoke;
      v35 = &__block_descriptor_48_e44_B32__0__UIAccessibilityElementKBKey_8Q16_B24l;
      v36 = v43;
      v37 = objc_msgSend(v38, "indexOfObjectPassingTest:", &v31);
      if (v37 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v4 = (id)objc_msgSend(v38, "objectAtIndex:", v37);
        v5 = v39;
        v39 = v4;

      }
    }
    v29 = 0;
    v22 = 0;
    v20 = 0;
    v18 = 0;
    if (!v39)
    {
      v17 = -[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButton](v42);
      v30 = v17;
      v29 = 1;
      v26 = 0;
      objc_opt_class();
      v25 = (id)__UIAccessibilityCastAsClass();
      v24 = v25;
      objc_storeStrong(&v25, 0);
      v23 = v24;
      v22 = 1;
      v21 = -[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButton](v42);
      v20 = 1;
      objc_msgSend(v24, "convertPoint:toView:", v43);
      v27 = v6;
      v28 = v7;
      v18 = objc_msgSend(v17, "pointInside:withEvent:", 0, v6, v7);
    }
    if ((v20 & 1) != 0)

    if ((v22 & 1) != 0)
    if ((v29 & 1) != 0)

    if ((v18 & 1) != 0)
    {
      v44 = (UIKeyboardLayoutStarAccessibility *)-[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButton](v42);
      v40 = 1;
    }
    else
    {
      if (!v39 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v8 = (id)-[UIKeyboardLayoutStarAccessibility keyHitTestContainingPoint:](v42, "keyHitTestContainingPoint:", v43);
        v9 = v39;
        v39 = v8;

        if (!v39 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v10 = (id)-[UIKeyboardLayoutStarAccessibility keyHitTestClosestToPoint:](v42, "keyHitTestClosestToPoint:", v43);
          v11 = v39;
          v39 = v10;

        }
      }
      if (v39)
      {
        v19 = v39;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v12 = -[UIKeyboardLayoutStarAccessibility _accessibilityKeyElementForKey:](v42, "_accessibilityKeyElementForKey:", v39);
          v13 = v19;
          v19 = v12;

        }
        if ((objc_msgSend(v19, "isAccessibilityElement") & 1) == 0)
        {
          v14 = (id)-[UIKeyboardLayoutStarAccessibility __accessibilityHitTest:withEvent:](v42, "__accessibilityHitTest:withEvent:", location[0], v43);
          v15 = v19;
          v19 = v14;

        }
        v44 = (UIKeyboardLayoutStarAccessibility *)v19;
        v40 = 1;
        objc_storeStrong(&v19, 0);
      }
      else
      {
        v44 = v42;
        v40 = 1;
      }
    }
    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v39, 0);
  }
  else
  {
    v44 = 0;
    v40 = 1;
  }
  objc_storeStrong(location, 0);
  return v44;
}

BOOL __69__UIKeyboardLayoutStarAccessibility__accessibilityHitTest_withEvent___block_invoke(void *a1, void *a2)
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  id v9;
  BOOL v10;
  CGPoint point;
  CGRect v12;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "accessibilityFrame");
  v12.origin.x = v2;
  v12.origin.y = v3;
  v12.size.width = v4;
  v12.size.height = v5;
  v9 = (id)objc_msgSend(location[0], "accessibilityContainer");
  UIAccessibilityPointForPoint();
  point.x = v6;
  point.y = v7;
  v10 = CGRectContainsPoint(v12, point);

  objc_storeStrong(location, 0);
  return v10;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9[2];
  uint64_t v10;
  uint64_t *v11;
  int v12;
  int v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  id v17;
  uint64_t v18;
  int v19;
  int v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23[2];
  uint64_t v24;
  uint64_t *v25;
  int v26;
  int v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  id v31;
  id v32;
  id v33[2];
  UIKeyboardLayoutStarAccessibility *v34;

  v34 = self;
  v33[1] = (id)a2;
  v33[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if ((-[UIKeyboardLayoutStarAccessibility safeBoolForKey:](v34, "safeBoolForKey:", CFSTR("isHandwritingPlane")) & 1) != 0)
  {
    v32 = (id)-[UIKeyboardLayoutStarAccessibility safeUIViewForKey:](v34, "safeUIViewForKey:", CFSTR("_keyplaneView"));
    v24 = 0;
    v25 = &v24;
    v26 = 838860800;
    v27 = 48;
    v28 = __Block_byref_object_copy__15;
    v29 = __Block_byref_object_dispose__15;
    v30 = 0;
    v18 = MEMORY[0x24BDAC760];
    v19 = -1073741824;
    v20 = 0;
    v21 = __75__UIKeyboardLayoutStarAccessibility__accessibilitySupplementaryHeaderViews__block_invoke;
    v22 = &unk_24FF3DE88;
    v23[1] = &v24;
    v23[0] = v34;
    AXPerformSafeBlock();
    v17 = (id)v25[5];
    objc_storeStrong(v23, 0);
    _Block_object_dispose(&v24, 8);
    objc_storeStrong(&v30, 0);
    v31 = (id)objc_msgSend(v17, "firstObject");

    v6 = v33[0];
    v10 = 0;
    v11 = &v10;
    v12 = 838860800;
    v13 = 48;
    v14 = __Block_byref_object_copy__15;
    v15 = __Block_byref_object_dispose__15;
    v16 = 0;
    v9[1] = &v10;
    v8 = v32;
    v9[0] = v31;
    AXPerformSafeBlock();
    v7 = (id)v11[5];
    objc_storeStrong(v9, 0);
    objc_storeStrong(&v8, 0);
    _Block_object_dispose(&v10, 8);
    objc_storeStrong(&v16, 0);
    objc_msgSend(v6, "axSafelyAddObject:");

    v4 = v33[0];
    v5 = (id)objc_msgSend(v32, "_accessibilityFindSubviewDescendant:", &__block_literal_global_438);
    objc_msgSend(v4, "axSafelyAddObject:");

    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
  }
  v3 = v33[0];
  objc_storeStrong(v33, 0);
  return v3;
}

void __75__UIKeyboardLayoutStarAccessibility__accessibilitySupplementaryHeaderViews__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v5;

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_keyplane"));
  v1 = (id)objc_msgSend(v5, "cachedKeysByKeyName:", CFSTR("Handwriting-Input"));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

void __75__UIKeyboardLayoutStarAccessibility__accessibilitySupplementaryHeaderViews__block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "viewForKey:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

uint64_t __75__UIKeyboardLayoutStarAccessibility__accessibilitySupplementaryHeaderViews__block_invoke_3(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(CFSTR("UIHandwritingAssistantView"));
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)_axKBModalView
{
  if (a1)
    return (id)objc_msgSend(a1, "safeValueForKey:", CFSTR("modalDisplayView"));
  else
    return 0;
}

- (BOOL)_accessibilityHasBiasEscapeButton
{
  id v1;
  BOOL v3;

  if (a1)
  {
    v1 = -[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButton](a1);
    v3 = v1 != 0;

  }
  else
  {
    return 0;
  }
  return v3;
}

- (uint64_t)_accessibilityBiasEscapeButtonIsFirst
{
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  id v6;
  char v7;
  id v8;
  id v9;
  char v10;

  v9 = a1;
  if (a1)
  {
    v7 = 0;
    objc_opt_class();
    v4 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
    v3 = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("_layout"));
    v6 = (id)__UIAccessibilityCastAsClass();

    v5 = v6;
    objc_storeStrong(&v6, 0);
    v8 = v5;
    v2 = objc_msgSend(v5, "currentHandBias");
    if (v2)
    {
      if (v2 == 1)
      {
        v10 = (objc_msgSend(v9, "_accessibilityIsRTL") ^ 1) & 1;
      }
      else if (v2 == 2)
      {
        v10 = objc_msgSend(v9, "_accessibilityIsRTL") & 1;
      }
    }
    else
    {
      v10 = 0;
    }
    objc_storeStrong(&v8, 0);
  }
  else
  {
    v10 = 0;
  }
  return v10 & 1;
}

- (int64_t)accessibilityElementCount
{
  id v2;
  uint64_t v4;
  id v5;
  BOOL v6;
  id location[2];
  UIKeyboardLayoutStarAccessibility *v8;
  int64_t v9;

  v8 = self;
  location[1] = (id)a2;
  v2 = -[UIKeyboardLayoutStarAccessibility _axKBModalView](self);
  v6 = v2 == 0;

  if (!v6)
    return 1;
  location[0] = -[UIKeyboardLayoutStarAccessibility _accessibilityStickyPopupKeys](v8);
  if (location[0])
  {
    v9 = objc_msgSend(location[0], "count");
  }
  else
  {
    v5 = -[UIKeyboardLayoutStarAccessibility _accessibilityKeys](v8, "_accessibilityKeys");
    v4 = objc_msgSend(v5, "count");
    v9 = v4 + -[UIKeyboardLayoutStarAccessibility _accessibilityHasBiasEscapeButton](v8);

  }
  objc_storeStrong(location, 0);
  return v9;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v7;
  char v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id obj;
  uint64_t v15;
  uint64_t v16;
  id v17;
  BOOL v18;
  BOOL v19;
  _QWORD __b[8];
  id v21;
  id v22;
  id v23;
  int v24;
  id location[2];
  UIKeyboardLayoutStarAccessibility *v26;
  int64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[UIKeyboardLayoutStarAccessibility _axKBModalView](v26);
  v19 = v3 == 0;

  if (v19)
  {
    v23 = -[UIKeyboardLayoutStarAccessibility _accessibilityStickyPopupKeys](v26);
    if (v23)
    {
      v27 = objc_msgSend(v23, "indexOfObject:", location[0]);
      v24 = 1;
    }
    else
    {
      v17 = location[0];
      v4 = -[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButton](v26);
      v18 = v17 != v4;

      if (v18)
      {
        v22 = -[UIKeyboardLayoutStarAccessibility _accessibilityInternalData](v26);
        memset(__b, 0, sizeof(__b));
        obj = v22;
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
        if (v15)
        {
          v11 = *(_QWORD *)__b[2];
          v12 = 0;
          v13 = v15;
          while (1)
          {
            v10 = v12;
            if (*(_QWORD *)__b[2] != v11)
              objc_enumerationMutation(obj);
            v21 = *(id *)(__b[1] + 8 * v12);
            v5 = (id)objc_msgSend(v22, "objectForKey:", v21);
            v9 = v5 != location[0];

            if (!v9)
              break;
            ++v12;
            if (v10 + 1 >= v13)
            {
              v12 = 0;
              v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
              if (!v13)
                goto LABEL_20;
            }
          }
          v7 = objc_msgSend(v21, "unsignedIntegerValue");
          v8 = 0;
          if (-[UIKeyboardLayoutStarAccessibility _accessibilityHasBiasEscapeButton](v26))
            v8 = -[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButtonIsFirst](v26);
          v27 = v7 + ((v8 & 1) != 0);
          v24 = 1;
        }
        else
        {
LABEL_20:
          v24 = 0;
        }

        if (!v24)
        {
          v27 = 0x7FFFFFFFFFFFFFFFLL;
          v24 = 1;
        }
        objc_storeStrong(&v22, 0);
      }
      else
      {
        if ((-[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButtonIsFirst](v26) & 1) != 0)
          v16 = 0;
        else
          v16 = -[UIKeyboardLayoutStarAccessibility accessibilityElementCount](v26, "accessibilityElementCount") - 1;
        v27 = v16;
        v24 = 1;
      }
    }
    objc_storeStrong(&v23, 0);
  }
  else
  {
    v27 = 0;
    v24 = 1;
  }
  objc_storeStrong(location, 0);
  return v27;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  int64_t v11;
  id v12;
  BOOL v13;
  id v14;
  id v15;
  id v16;
  id v17;
  int v18;
  id v19;
  id v20;
  int64_t v21;
  SEL v22;
  UIKeyboardLayoutStarAccessibility *v23;
  id v24;

  v23 = self;
  v22 = a2;
  v21 = a3;
  v3 = -[UIKeyboardLayoutStarAccessibility _axKBModalView](self);
  v13 = v3 == 0;

  if (v13)
  {
    v20 = -[UIKeyboardLayoutStarAccessibility _accessibilityStickyPopupKeys](v23);
    if (v20)
    {
      v19 = 0;
      if (v21 < 0 || v21 >= (unint64_t)objc_msgSend(v20, "count"))
      {
        _AXAssert();
      }
      else
      {
        v4 = (id)objc_msgSend(v20, "objectAtIndexedSubscript:", v21);
        v5 = v19;
        v19 = v4;

      }
      v24 = v19;
      v18 = 1;
      objc_storeStrong(&v19, 0);
      goto LABEL_25;
    }
    if (-[UIKeyboardLayoutStarAccessibility _accessibilityHasBiasEscapeButton](v23)
      && (-[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButtonIsFirst](v23) & 1) != 0)
    {
      if (!v21)
      {
        v24 = -[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButton](v23);
        v18 = 1;
LABEL_25:
        objc_storeStrong(&v20, 0);
        return v24;
      }
      --v21;
    }
    v17 = -[UIKeyboardLayoutStarAccessibility _accessibilityInternalData](v23);
    v16 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", v21);
    v15 = (id)objc_msgSend(v17, "objectForKey:", v16);
    if (!v15)
    {
      v14 = -[UIKeyboardLayoutStarAccessibility _accessibilityKeys](v23, "_accessibilityKeys");
      if (v21 < (unint64_t)objc_msgSend(v14, "count"))
      {
        v12 = (id)objc_msgSend(v14, "objectAtIndex:", v21);
        v6 = -[UIKeyboardLayoutStarAccessibility _accessibilityCreateElementForKey:](v23, v12);
        v7 = v15;
        v15 = v6;

        if (v15)
          objc_msgSend(v17, "setObject:forKey:", v15, v16);
      }
      objc_storeStrong(&v14, 0);
    }
    if (!v15)
    {
      v11 = v21;
      if (v11 == -[UIKeyboardLayoutStarAccessibility accessibilityElementCount](v23, "accessibilityElementCount") - 1
        && -[UIKeyboardLayoutStarAccessibility _accessibilityHasBiasEscapeButton](v23)
        && (-[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButtonIsFirst](v23) & 1) == 0)
      {
        v8 = -[UIKeyboardLayoutStarAccessibility _accessibilityBiasEscapeButton](v23);
        v9 = v15;
        v15 = v8;

      }
    }
    v24 = v15;
    v18 = 1;
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
    goto LABEL_25;
  }
  v24 = -[UIKeyboardLayoutStarAccessibility _axKBModalView](v23);
  return v24;
}

- (id)focusItemsInRect:(CGRect)a3
{
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  id (*v8)(id *, void *);
  void *v9;
  UIKeyboardLayoutStarAccessibility *v10;
  id v11;
  int v12;
  objc_super v13;
  id v14[2];
  UIKeyboardLayoutStarAccessibility *v15;
  CGRect v16;
  id v17;

  v16 = a3;
  v15 = self;
  v14[1] = (id)a2;
  v13.receiver = self;
  v13.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  v14[0] = -[UIKeyboardLayoutStarAccessibility focusItemsInRect:](&v13, sel_focusItemsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if ((-[UIKeyboardLayoutStarAccessibility _accessibilityIsFKARunningForFocusItem](v15, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)
  {
    v4 = -[UIKeyboardLayoutStarAccessibility _accessibilityKeys](v15, "_accessibilityKeys");
    v5 = MEMORY[0x24BDAC760];
    v6 = -1073741824;
    v7 = 0;
    v8 = __54__UIKeyboardLayoutStarAccessibility_focusItemsInRect___block_invoke;
    v9 = &unk_24FF3EF30;
    v10 = v15;
    v11 = (id)objc_msgSend(v4, "axMapObjectsUsingBlock:", &v5);

    v17 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "axArrayWithPossiblyNilArrays:", 1, v11);
    v12 = 1;
    objc_storeStrong(&v11, 0);
    objc_storeStrong((id *)&v10, 0);
  }
  else
  {
    v17 = v14[0];
    v12 = 1;
  }
  objc_storeStrong(v14, 0);
  return v17;
}

id __54__UIKeyboardLayoutStarAccessibility_focusItemsInRect___block_invoke(id *a1, void *a2)
{
  id v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = (id)objc_msgSend(a1[4], "_accessibilityKeyElementForKey:", location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)canProduceString:(id)a3
{
  char v4;
  UIKeyboardLayoutStarAccessibility *v5;
  id v6;
  char v7;
  objc_super v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t i;
  unint64_t v12;
  objc_super v13;
  char v14;
  id location[2];
  UIKeyboardLayoutStarAccessibility *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  v13.receiver = v16;
  v13.super_class = (Class)UIKeyboardLayoutStarAccessibility;
  v14 = -[UIKeyboardLayoutStarAccessibility canProduceString:](&v13, sel_canProduceString_, location[0]);
  if (!v14 && UIAccessibilityIsVoiceOverRunning())
  {
    v14 = 1;
    v12 = objc_msgSend(location[0], "length");
    for (i = 0; ; ++i)
    {
      v7 = 0;
      if (i < v12)
        v7 = v14;
      if ((v7 & 1) == 0)
        break;
      v5 = v16;
      v18 = i;
      v17 = 1;
      v19 = i;
      v20 = 1;
      v9 = i;
      v10 = 1;
      v6 = (id)objc_msgSend(location[0], "substringWithRange:", i, 1);
      v8.receiver = v5;
      v8.super_class = (Class)UIKeyboardLayoutStarAccessibility;
      v14 = -[UIKeyboardLayoutStarAccessibility canProduceString:](&v8, sel_canProduceString_);

    }
  }
  v4 = v14;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (double)_axGetSortingNumberForEmojiCell:(uint64_t)a1
{
  double Width;
  CGRect v4;
  id v5;
  double v6;
  int v7;
  id location;
  uint64_t v9;
  double v10;
  CGRect v11;

  v9 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v9)
  {
    v6 = 0.4;
    v5 = (id)objc_msgSend(location, "_accessibilityAncestorIsKindOf:", objc_opt_class());
    if (v5)
    {
      objc_msgSend(location, "accessibilityFrame");
      UIAccessibilityFrameToBounds();
      v4 = v11;
      Width = CGRectGetWidth(v11);
      v6 = (double)(unint64_t)(CGRectGetMidX(v4) / Width) / 100.0 + 0.5;
    }
    v10 = v6;
    v7 = 1;
    objc_storeStrong(&v5, 0);
  }
  else
  {
    v10 = 0.0;
    v7 = 1;
  }
  objc_storeStrong(&location, 0);
  return v10;
}

- (id)_rowNumberOverrideForSplitEmojiKey:(uint64_t)a1
{
  id v3;
  id v4;
  int v5;
  id location;
  uint64_t v7;
  id v8;

  v7 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v7)
  {
    v4 = 0;
    v3 = (id)objc_msgSend(location, "name");
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Space-Key")) & 1) != 0
      || (objc_msgSend(v3, "isEqualToString:", CFSTR("Return-Key")) & 1) != 0
      || (objc_msgSend(v3, "isEqualToString:", CFSTR("Delete-Key")) & 1) != 0)
    {
      objc_storeStrong(&v4, &unk_24FF85A90);
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Emoji-International-Key")) & 1) != 0)
    {
      objc_storeStrong(&v4, &unk_24FF85AA8);
    }
    v8 = v4;
    v5 = 1;
    objc_storeStrong(&v3, 0);
    objc_storeStrong(&v4, 0);
  }
  else
  {
    v8 = 0;
    v5 = 1;
  }
  objc_storeStrong(&location, 0);
  return v8;
}

- (id)_accessibilityGetKeyboardRowsByRowNumber
{
  if (a1)
    return (id)objc_msgSend(a1, "iOSGetKeyboardRowsByNumber");
  else
    return 0;
}

- (id)atvGetKeyboardRowsByNumber
{
  id v3;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t, void *, void *, void *);
  void *v9;
  UIKeyboardLayoutStarAccessibility *v10;
  id v11[5];
  id v12;
  _QWORD v13[2];
  int v14;
  int v15;
  int v16;
  _QWORD v17[2];
  int v18;
  int v19;
  char v20;
  SEL v21;
  UIKeyboardLayoutStarAccessibility *v22;

  v22 = self;
  v21 = a2;
  v17[0] = 0;
  v17[1] = v17;
  v18 = 0x20000000;
  v19 = 32;
  v20 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v14 = 0x20000000;
  v15 = 32;
  v16 = 0;
  v12 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = -[UIKeyboardLayoutStarAccessibility _accessibilityKeys](v22, "_accessibilityKeys");
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __63__UIKeyboardLayoutStarAccessibility_atvGetKeyboardRowsByNumber__block_invoke;
  v9 = &unk_24FF3EF58;
  v10 = v22;
  v11[1] = v13;
  v11[2] = v17;
  v11[0] = v12;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v5);

  v3 = v12;
  objc_storeStrong(v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v12, 0);
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v17, 8);
  return v3;
}

void __63__UIKeyboardLayoutStarAccessibility_atvGetKeyboardRowsByNumber__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  char v15;
  id v16;
  char v17;
  id v18;
  id v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id obj;
  uint64_t v29;
  id v30;
  char v31;
  id v32;
  char v33;
  id v34;
  id v35;
  _QWORD __b[8];
  uint64_t v37;
  id v38;
  id v39;
  id v40[4];
  id location[2];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v40[3] = a3;
  v40[2] = a4;
  v40[1] = (id)a1;
  v40[0] = (id)objc_msgSend(*(id *)(a1 + 32), "_accessibilityKeyElementForKey:", location[0]);
  v39 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "defaultSwitchControlOptions");
  objc_msgSend(v39, "setShouldReturnScannerGroups:", 0);
  v38 = (id)objc_msgSend(v40[0], "_accessibilityLeafDescendantsWithOptions:", v39);
  memset(__b, 0, sizeof(__b));
  obj = v38;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v42, 16);
  if (v29)
  {
    v22 = *(_QWORD *)__b[2];
    v23 = 0;
    v24 = v29;
    while (1)
    {
      v21 = v23;
      if (*(_QWORD *)__b[2] != v22)
        objc_enumerationMutation(obj);
      v37 = *(_QWORD *)(__b[1] + 8 * v23);
      v35 = 0;
      v19 = (id)objc_msgSend(location[0], "properties");
      v4 = (id)objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BDF7968]);
      v20 = v4 == 0;

      if (v20)
      {
        v7 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
        v8 = v35;
        v35 = v7;

        v16 = (id)objc_msgSend(location[0], "name");
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("Monolith-Linear-Delete-Key"));

        if ((v17 & 1) != 0)
          ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        v9 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        v33 = 0;
        v31 = 0;
        v15 = 0;
        if ((v9 & 1) == 0)
        {
          v34 = (id)objc_msgSend(location[0], "name");
          v33 = 1;
          v14 = 1;
          if ((objc_msgSend(v34, "isEqualToString:", CFSTR("Monolith-Capital-Letters-Keyplane-Switch-Key")) & 1) == 0)
          {
            v32 = (id)objc_msgSend(location[0], "name");
            v31 = 1;
            v14 = objc_msgSend(v32, "isEqualToString:", CFSTR("Monolith-International-Key"));
          }
          v15 = v14;
        }
        if ((v31 & 1) != 0)

        if ((v33 & 1) != 0)
        if ((v15 & 1) != 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
          v10 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)+ 8)+ 24));
          v11 = v35;
          v35 = v10;

        }
      }
      else
      {
        v18 = (id)objc_msgSend(location[0], "properties");
        v5 = (id)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x24BDF7968]);
        v6 = v35;
        v35 = v5;

      }
      v30 = (id)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v35);
      if (!v30)
      {
        v12 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v13 = v30;
        v30 = v12;

        objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v30, v35);
      }
      objc_msgSend(v30, "addObject:", v37);
      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v35, 0);
      ++v23;
      if (v21 + 1 >= v24)
      {
        v23 = 0;
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v42, 16);
        if (!v24)
          break;
      }
    }
  }

  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(v40, 0);
  objc_storeStrong(location, 0);
}

- (id)iOSGetKeyboardRowsByNumber
{
  id v3;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(id *, void *, void *, void *);
  void *v9;
  UIKeyboardLayoutStarAccessibility *v10;
  id v11;
  id v12[2];
  UIKeyboardLayoutStarAccessibility *v13;

  v13 = self;
  v12[1] = (id)a2;
  v12[0] = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = -[UIKeyboardLayoutStarAccessibility _accessibilityKeys](v13, "_accessibilityKeys");
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __63__UIKeyboardLayoutStarAccessibility_iOSGetKeyboardRowsByNumber__block_invoke;
  v9 = &unk_24FF3EF80;
  v10 = v13;
  v11 = v12[0];
  objc_msgSend(v3, "enumerateObjectsUsingBlock:");

  v4 = v12[0];
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(v12, 0);
  return v4;
}

void __63__UIKeyboardLayoutStarAccessibility_iOSGetKeyboardRowsByNumber__block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v4;
  id v5;
  id v6;
  id v7;
  char v8;
  char v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  id v17;
  char v18;
  id v19;
  char v20;
  id v21;
  char v22;
  id v23;
  id v24;
  BOOL v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id obj;
  uint64_t v35;
  id v36;
  char v37;
  id v38;
  char v39;
  id v40;
  id v41;
  id v42;
  char v43;
  id v44;
  _QWORD __b[8];
  void *v46;
  id v47;
  id v48;
  id v49[4];
  id location[2];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v49[3] = a3;
  v49[2] = a4;
  v49[1] = a1;
  v49[0] = (id)objc_msgSend(a1[4], "_accessibilityKeyElementForKey:", location[0]);
  v48 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "defaultSwitchControlOptions");
  objc_msgSend(v48, "setShouldReturnScannerGroups:", 0);
  v47 = (id)objc_msgSend(v49[0], "_accessibilityLeafDescendantsWithOptions:", v48);
  memset(__b, 0, sizeof(__b));
  obj = v47;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v51, 16);
  if (v35)
  {
    v28 = *(_QWORD *)__b[2];
    v29 = 0;
    v30 = v35;
    while (1)
    {
      v27 = v29;
      if (*(_QWORD *)__b[2] != v28)
        objc_enumerationMutation(obj);
      v46 = *(void **)(__b[1] + 8 * v29);
      v44 = 0;
      v43 = 0;
      objc_opt_class();
      v26 = (id)objc_msgSend(a1[4], "safeValueForKey:", CFSTR("_keyboard"));
      v42 = (id)__UIAccessibilityCastAsClass();

      if ((v43 & 1) != 0)
        abort();
      v41 = v42;
      objc_storeStrong(&v42, 0);
      v24 = v41;
      v25 = objc_msgSend(v41, "visualStyle") != 109;

      if (!v25)
      {
        v4 = -[UIKeyboardLayoutStarAccessibility _rowNumberOverrideForSplitEmojiKey:]((uint64_t)a1[4], location[0]);
        v5 = v44;
        v44 = v4;

      }
      if (!v44)
      {
        v23 = (id)objc_msgSend(location[0], "properties");
        v6 = (id)objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x24BDF7968]);
        v7 = v44;
        v44 = v6;

      }
      if (v44)
        goto LABEL_28;
      v21 = (id)objc_msgSend(location[0], "name");
      v8 = objc_msgSend(v21, "isEqualToString:", CFSTR("Emoji-Category-Control-Key"));
      v39 = 0;
      v22 = 1;
      if ((v8 & 1) == 0)
      {
        v40 = (id)objc_msgSend(location[0], "name");
        v39 = 1;
        v22 = objc_msgSend(v40, "isEqualToString:", CFSTR("Handwriting-Input"));
      }
      if ((v39 & 1) != 0)

      if ((v22 & 1) == 0)
      {
        v19 = (id)objc_msgSend(location[0], "name");
        v9 = objc_msgSend(v19, "hasPrefix:", CFSTR("Emoji-InputView-"));
        v37 = 0;
        v20 = 1;
        if ((v9 & 1) == 0)
        {
          v38 = (id)objc_msgSend(location[0], "name");
          v37 = 1;
          v20 = objc_msgSend(v38, "isEqualToString:", CFSTR("Voiced-Sound-Mark-And-Semi-Voiced-Sound-Mark-And-Small-Variation"));
        }
        if ((v37 & 1) != 0)

        if ((v20 & 1) == 0)
        {
          v14 = location[0];
          _AXAssert();
        }
        v17 = (id)objc_msgSend(location[0], "name");
        v18 = objc_msgSend(v17, "hasPrefix:", CFSTR("Emoji-InputView-"));

        if ((v18 & 1) != 0)
        {
          v10 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -[UIKeyboardLayoutStarAccessibility _axGetSortingNumberForEmojiCell:]((uint64_t)a1[4], v46));
          v11 = v44;
          v44 = v10;

          goto LABEL_28;
        }
        v15 = (id)objc_msgSend(location[0], "name");
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("Voiced-Sound-Mark-And-Semi-Voiced-Sound-Mark-And-Small-Variation"));

        if ((v16 & 1) == 0)
        {
          objc_storeStrong(&v44, &unk_24FF85AC0);
          goto LABEL_28;
        }
      }
      objc_storeStrong(&v44, &unk_24FF85A90);
LABEL_28:
      v36 = (id)objc_msgSend(a1[5], "objectForKey:", v44, v14);
      if (!v36)
      {
        v12 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v13 = v36;
        v36 = v12;

        objc_msgSend(a1[5], "setObject:forKey:", v36, v44);
      }
      objc_msgSend(v36, "addObject:", v46);
      objc_storeStrong(&v36, 0);
      objc_storeStrong(&v44, 0);
      ++v29;
      if (v27 + 1 >= v30)
      {
        v29 = 0;
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v51, 16);
        if (!v30)
          break;
      }
    }
  }

  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(v49, 0);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityScannerGroupElements
{
  id v2;
  id v3;
  id v5;
  BOOL v6;
  BOOL v7;
  id v8;
  uint64_t v9;
  id v10;
  objc_super v11;
  SEL v12;
  UIKeyboardLayoutStarAccessibility *v13;
  id v14;

  v13 = self;
  v12 = a2;
  v2 = -[UIKeyboardLayoutStarAccessibility _axKBModalView](self);
  v7 = v2 == 0;

  if (v7)
  {
    v3 = -[UIKeyboardLayoutStarAccessibility _accessibilityStickyPopupKeys](v13);
    v6 = v3 == 0;

    if (v6)
    {
      v10 = -[UIKeyboardLayoutStarAccessibility _accessibilityGetKeyboardRowsByRowNumber](v13);
      v9 = objc_msgSend(v10, "count");
      v5 = (id)objc_msgSend(v10, "allKeys");
      v8 = (id)objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_471);

      v14 = -[UIKeyboardLayoutStarAccessibility iOSGetOrderedRowsForRows:sortedRows:numRows:](v13, "iOSGetOrderedRowsForRows:sortedRows:numRows:", v10, v8, v9);
      objc_storeStrong(&v8, 0);
      objc_storeStrong(&v10, 0);
    }
    else
    {
      v14 = -[UIKeyboardLayoutStarAccessibility _accessibilityStickyPopupKeys](v13);
    }
  }
  else
  {
    v11.receiver = v13;
    v11.super_class = (Class)UIKeyboardLayoutStarAccessibility;
    v14 = -[UIKeyboardLayoutStarAccessibility _accessibilityScannerGroupElements](&v11, sel__accessibilityScannerGroupElements);
  }
  return v14;
}

uint64_t __71__UIKeyboardLayoutStarAccessibility__accessibilityScannerGroupElements__block_invoke(void *a1, void *a2, void *a3)
{
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v7;
  double v9;
  id v10;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v10 = 0;
  objc_storeStrong(&v10, a3);
  objc_msgSend(location[0], "doubleValue");
  v9 = v3;
  objc_msgSend(v10, "doubleValue");
  if (v9 == v4)
  {
    v7 = 0;
  }
  else
  {
    v5 = 1;
    if (v9 < v4)
      v5 = -1;
    v7 = v5;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)atvGetOrderedRowsForRows:(id)a3 sortedRows:(id)a4 numRows:(int64_t)a5
{
  float v5;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v24;
  uint64_t v25;
  id v26[3];
  id v27;
  char *i;
  unint64_t v29;
  float v30;
  unint64_t v31;
  id v32;
  id v33;
  _QWORD __b[8];
  uint64_t v35;
  id v36[2];
  id v37;
  id location[7];
  _QWORD v39[3];
  _QWORD v40[3];
  const __CFString *v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v37 = 0;
  objc_storeStrong(&v37, a4);
  v36[1] = (id)a5;
  v36[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a5);
  memset(__b, 0, sizeof(__b));
  v24 = v37;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", __b, v43, 16);
  if (v25)
  {
    v19 = *(_QWORD *)__b[2];
    v20 = 0;
    v21 = v25;
    while (1)
    {
      v18 = v20;
      if (*(_QWORD *)__b[2] != v19)
        objc_enumerationMutation(v24);
      v35 = *(_QWORD *)(__b[1] + 8 * v20);
      v33 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v32 = (id)objc_msgSend(location[0], "objectForKey:", v35);
      v31 = 0;
      v31 = (int)objc_msgSend(v32, "count");
      if (v31 >= 6)
      {
        v30 = 0.0;
        v5 = 2.0;
        if (v31 != 6)
          v5 = 4.0;
        v30 = v5;
        v29 = vcvtps_u32_f32((float)v31 / v5);
        for (i = 0; (unint64_t)i < v31; i += v29)
        {
          if ((unint64_t)&i[v29] > v31)
            v29 = v31 - (_QWORD)i;
          v41 = CFSTR("GroupElements");
          location[4] = i;
          location[3] = (id)v29;
          location[5] = i;
          location[6] = (id)v29;
          v26[1] = i;
          v26[2] = (id)v29;
          v17 = (id)objc_msgSend(v32, "subarrayWithRange:", i, v29);
          v42 = v17;
          v27 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);

          objc_msgSend(v33, "addObject:", v27);
          objc_storeStrong(&v27, 0);
        }
      }
      else
      {
        objc_msgSend(v33, "setArray:", v32);
      }
      if ((unint64_t)objc_msgSend(v32, "count") <= 1)
      {
        if (objc_msgSend(v32, "count") == 1)
        {
          v8 = v36[0];
          v9 = (id)objc_msgSend(v32, "firstObject");
          objc_msgSend(v8, "addObject:");

        }
      }
      else
      {
        v39[0] = CFSTR("GroupElements");
        v40[0] = v33;
        v39[1] = CFSTR("GroupTraits");
        v40[1] = &unk_24FF85AD8;
        v39[2] = CFSTR("GroupLabel");
        v10 = (void *)MEMORY[0x24BDD17C8];
        v16 = (id)UIKitAccessibilityLocalizedString();
        v15 = (id)objc_msgSend(v32, "firstObject");
        v14 = (id)objc_msgSend(v15, "accessibilityLabel");
        v13 = (id)objc_msgSend(v32, "lastObject");
        v12 = (id)objc_msgSend(v13, "accessibilityLabel");
        v11 = (id)objc_msgSend(v10, "stringWithFormat:", v16, v14, v12);
        v40[2] = v11;
        v26[0] = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);

        objc_msgSend(v36[0], "addObject:", v26[0]);
        objc_storeStrong(v26, 0);
      }
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
      ++v20;
      if (v18 + 1 >= v21)
      {
        v20 = 0;
        v21 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", __b, v43, 16);
        if (!v21)
          break;
      }
    }
  }

  v7 = v36[0];
  objc_storeStrong(v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)iOSGetOrderedRowsForRows:(id)a3 sortedRows:(id)a4 numRows:(int64_t)a5
{
  id v5;
  id v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v25;
  uint64_t v26;
  id v27[3];
  id v28;
  char *v29;
  unint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  uint64_t (*v34)(_BYTE *, void *, void *);
  void *v35;
  char v36;
  uint64_t v37;
  id v38;
  id v39;
  _QWORD __b[8];
  uint64_t v41;
  char v42;
  uint64_t v43;
  id v44[2];
  id v45;
  id location[2];
  UIKeyboardLayoutStarAccessibility *v47;
  unint64_t v48;
  char *v49;
  char *v50;
  unint64_t v51;
  _QWORD v52[4];
  _QWORD v53[4];
  const __CFString *v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v47 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v45 = 0;
  objc_storeStrong(&v45, a4);
  v44[1] = (id)a5;
  v44[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a5);
  v43 = 1;
  v42 = -[UIKeyboardLayoutStarAccessibility _accessibilityIsRTL](v47, "_accessibilityIsRTL") & 1;
  memset(__b, 0, sizeof(__b));
  v25 = v45;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", __b, v56, 16);
  if (v26)
  {
    v20 = *(_QWORD *)__b[2];
    v21 = 0;
    v22 = v26;
    while (1)
    {
      v19 = v21;
      if (*(_QWORD *)__b[2] != v20)
        objc_enumerationMutation(v25);
      v41 = *(_QWORD *)(__b[1] + 8 * v21);
      v39 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v38 = (id)objc_msgSend(location[0], "objectForKey:", v41);
      v37 = 0;
      v37 = objc_msgSend(v38, "count");
      if (v37 <= 8)
      {
        objc_msgSend(v39, "setArray:", v38);
      }
      else
      {
        v31 = MEMORY[0x24BDAC760];
        v32 = -1073741824;
        v33 = 0;
        v34 = __81__UIKeyboardLayoutStarAccessibility_iOSGetOrderedRowsForRows_sortedRows_numRows___block_invoke;
        v35 = &__block_descriptor_33_e11_q24__0_8_16l;
        v36 = v42 & 1;
        v5 = (id)objc_msgSend(v38, "sortedArrayWithOptions:usingComparator:", 16, &v31);
        v6 = v38;
        v38 = v5;

        v30 = llroundf((float)v37 / 3.0);
        v29 = 0;
        while ((uint64_t)v29 < v37)
        {
          if ((uint64_t)&v29[v30] > v37 || v37 - (uint64_t)v29 <= 5)
            v30 = v37 - (_QWORD)v29;
          v54 = CFSTR("GroupElements");
          v49 = v29;
          v48 = v30;
          v50 = v29;
          v51 = v30;
          v27[1] = v29;
          v27[2] = (id)v30;
          v18 = (id)objc_msgSend(v38, "subarrayWithRange:", v29, v30);
          v55 = v18;
          v28 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);

          objc_msgSend(v39, "addObject:", v28);
          v29 += v30;
          objc_storeStrong(&v28, 0);
        }
      }
      if ((unint64_t)objc_msgSend(v38, "count") <= 1)
      {
        if (objc_msgSend(v38, "count") == 1)
        {
          v9 = v44[0];
          v10 = (id)objc_msgSend(v38, "firstObject");
          objc_msgSend(v9, "addObject:");

        }
      }
      else
      {
        v52[0] = CFSTR("GroupElements");
        v53[0] = v39;
        v52[1] = CFSTR("GroupTraits");
        v53[1] = &unk_24FF85AD8;
        v52[2] = CFSTR("GroupLabel");
        v11 = (void *)MEMORY[0x24BDD17C8];
        v17 = (id)UIKitAccessibilityLocalizedString();
        v16 = (id)objc_msgSend(v38, "firstObject");
        v15 = (id)objc_msgSend(v16, "accessibilityLabel");
        v14 = (id)objc_msgSend(v38, "lastObject");
        v13 = (id)objc_msgSend(v14, "accessibilityLabel");
        v12 = (id)objc_msgSend(v11, "stringWithFormat:", v17, v15, v13);
        v53[2] = v12;
        v52[3] = CFSTR("GroupScanBehaviorTraits");
        v53[3] = &unk_24FF85AF0;
        v27[0] = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 4);

        objc_msgSend(v44[0], "addObject:", v27[0]);
        objc_storeStrong(v27, 0);
      }
      ++v43;
      objc_storeStrong(&v38, 0);
      objc_storeStrong(&v39, 0);
      ++v21;
      if (v19 + 1 >= v22)
      {
        v21 = 0;
        v22 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", __b, v56, 16);
        if (!v22)
          break;
      }
    }
  }

  v8 = v44[0];
  objc_storeStrong(v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(location, 0);
  return v8;
}

uint64_t __81__UIKeyboardLayoutStarAccessibility_iOSGetOrderedRowsForRows_sortedRows_numRows___block_invoke(_BYTE *a1, void *a2, void *a3)
{
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  double v10;
  id v11;
  id location[2];
  uint64_t v13;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v11 = 0;
  objc_storeStrong(&v11, a3);
  objc_msgSend(location[0], "accessibilityFrame");
  v10 = v3;
  objc_msgSend(v11, "accessibilityFrame");
  if (v10 >= v4)
  {
    if (v4 >= v10)
    {
      v13 = 0;
    }
    else
    {
      v6 = 1;
      if ((a1[32] & 1) != 0)
        v6 = -1;
      v13 = v6;
    }
  }
  else
  {
    v5 = -1;
    if ((a1[32] & 1) != 0)
      v5 = 1;
    v13 = v5;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v13;
}

- (int64_t)accessibilityNavigationStyle
{
  return 1;
}

@end
