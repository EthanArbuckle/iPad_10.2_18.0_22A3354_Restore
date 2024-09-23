@implementation UIAccessibilityElementKBKey

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  const char *v5;
  const __CFString *v6;
  const char *v7;
  id v8;
  id *v9;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = CFSTR("UIKeyboardLayoutStar");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UIKeyboardLayoutStar"), CFSTR("UIView"));
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIKeyboardLayoutStar"), CFSTR("_keyplaneView"), "UIKBKeyplaneView");
  v4 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKBKeyplaneView"), CFSTR("deactivateKeys"), 0);
  v7 = "B";
  v3 = CFSTR("UITouch");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "{CGPoint=dd}", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("setTimestamp:"), v4, "d", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("setPhase:"), v4, "q", 0);
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("setActiveKey:"), v4, "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("useDismissForMessagesWriteboard"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardImpl"), CFSTR("_layout"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboadLayoutStarAccessibility"), CFSTR("_accessibilityVisibleKeysByRow"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("globeKeyDisplaysAsEmojiKey"), v7, 0);
  objc_storeStrong(v9, v8);
}

- (id)initWithAccessibilityContainer:(void *)a3 key:
{
  id v3;
  objc_super v6;
  int v7;
  id v8;
  id location;
  id v10;
  id v11;

  v10 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  v8 = 0;
  objc_storeStrong(&v8, a3);
  if (v10)
  {
    v3 = v10;
    v10 = 0;
    v6.receiver = v3;
    v6.super_class = (Class)UIAccessibilityElementKBKey;
    v10 = objc_msgSendSuper2(&v6, sel_initWithAccessibilityContainer_, location);
    objc_storeStrong(&v10, v10);
    if (v10)
    {
      objc_storeStrong((id *)v10 + 7, v8);
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
    v7 = 1;
  }
  else
  {
    v11 = 0;
    v7 = 1;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v10, 0);
  return v11;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  objc_super v6;
  SEL v7;
  UIAccessibilityElementKBKey *v8;

  v8 = self;
  v7 = a2;
  v3 = (void *)MEMORY[0x24BDD17C8];
  v6.receiver = self;
  v6.super_class = (Class)UIAccessibilityElementKBKey;
  v4 = -[UIAccessibilityElementKBKey description](&v6, sel_description);
  v5 = (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: Key:%@"), v4, v8->_key);

  return v5;
}

- (BOOL)_accessibilityWasForcedToUseForeignKB
{
  return a1 && AXKBElementWasForcedToUseForeignKB();
}

- (id)_accessibilityLocalizedStringForKeyboardLocale:(uint64_t)a1
{
  id location;
  uint64_t v4;
  id v5;

  v4 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v4)
    v5 = AXKBElementLocalizedForKeyboardLocale(location);
  else
    v5 = 0;
  objc_storeStrong(&location, 0);
  return v5;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)_accessibilitySupportsSecondaryActivateAction
{
  return 1;
}

- (BOOL)_accessibilityKeyboardKeyAllowsTouchTyping
{
  char v3;
  char v4;
  id v5;

  v4 = 0;
  v3 = 1;
  if (-[UIAccessibilityElementKBKey isButtonType]((id *)&self->super.super.super.isa))
  {
    v5 = (id)-[UIKBTree name](self->_key, "name");
    v4 = 1;
    v3 = objc_msgSend(v5, "hasSuffix:", CFSTR("Shift-Key"));
  }
  if ((v4 & 1) != 0)

  return v3 & 1;
}

- (BOOL)isButtonType
{
  id v2;
  id *v3;
  BOOL v4;
  id location;
  dispatch_once_t *v6;

  v3 = a1;
  if (a1)
  {
    v6 = (dispatch_once_t *)&isButtonType_onceToken;
    location = 0;
    objc_storeStrong(&location, &__block_literal_global_9);
    if (*v6 != -1)
      dispatch_once(v6, location);
    objc_storeStrong(&location, 0);
    v2 = (id)objc_msgSend(v3[7], "name");
    v4 = (objc_msgSend((id)isButtonType_AcceptableButtonTypes, "containsObject:", v2) & 1) != 0
      || (objc_msgSend(v3, "_accessibilityIsInternationalKeyboardKey") & 1) != 0
      || (-[UIAccessibilityElementKBKey _axIsDictationKey](v3) & 1) != 0
      || objc_msgSend(v3[7], "variantType") == 5;
    objc_storeStrong(&v2, 0);
  }
  else
  {
    return 0;
  }
  return v4;
}

- (id)_axLayoutStar
{
  if (a1)
    return (id)objc_msgSend(a1, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("UIKeyboardLayoutStar")));
  else
    return 0;
}

- (BOOL)_accessibilityDismissAlternativeKeyPicker
{
  id v2;
  id v4;
  void *v5;
  id v6;
  id argument[2];
  int v8;
  int v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13[3];

  v13[2] = self;
  v13[1] = (id)a2;
  v13[0] = -[UIAccessibilityElementKBKey _axLayoutStar](self);
  v4 = (id)objc_msgSend(v13[0], "safeValueForKey:", CFSTR("_keyplaneView"));
  v2 = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("deactivateKeys"));

  argument[1] = (id)MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __72__UIAccessibilityElementKBKey__accessibilityDismissAlternativeKeyPicker__block_invoke;
  v11 = &unk_24FF3DA40;
  v12 = v13[0];
  AXPerformSafeBlock();
  v5 = (void *)MEMORY[0x24BDFEA60];
  v6 = accessibilityLocalizedString(CFSTR("alternative.keys.dismissed"));
  argument[0] = (id)objc_msgSend(v5, "axAttributedStringWithString:");

  objc_msgSend(argument[0], "setAttribute:forKey:", &unk_24FF85A00, *MEMORY[0x24BDFEAD8]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument[0]);
  objc_storeStrong(argument, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  return 1;
}

uint64_t __72__UIAccessibilityElementKBKey__accessibilityDismissAlternativeKeyPicker__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActiveKey:", 0, a1, a1);
}

- (uint64_t)_accessibilityActivateForPanAlternate:(char)a3 isSecondAlternate:
{
  char v4;

  if (a1)
    v4 = -[UIAccessibilityElementKBKey _accessibilityActivateForPanAlternate:isSecondAlternate:isSecondaryActivate:](a1, a2 & 1, a3 & 1, 0) & 1;
  else
    v4 = 0;
  return v4 & 1;
}

- (uint64_t)_accessibilityActivateForPanAlternate:(char)a3 isSecondAlternate:(char)a4 isSecondaryActivate:
{
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  char v12;
  char v13;
  char v14;
  int v15;
  id v16;
  char v17;
  char v18;
  char v19;
  void *v20;
  char v21;

  v20 = a1;
  v19 = a2 & 1;
  v18 = a3 & 1;
  v17 = a4 & 1;
  if (a1)
  {
    v16 = -[UIAccessibilityElementKBKey _axLayoutStar](v20);
    if (v16)
    {
      v5 = MEMORY[0x24BDAC760];
      v6 = -1073741824;
      v7 = 0;
      v8 = __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke;
      v9 = &unk_24FF3E188;
      v10 = v16;
      v11 = v20;
      v12 = v19 & 1;
      v13 = v18 & 1;
      v14 = v17 & 1;
      AXPerformSafeBlock();
      v21 = 1;
      v15 = 1;
      objc_storeStrong(&v11, 0);
      objc_storeStrong(&v10, 0);
    }
    else
    {
      v21 = 0;
      v15 = 1;
    }
    objc_storeStrong(&v16, 0);
  }
  else
  {
    v21 = 0;
  }
  return v21 & 1;
}

void __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v6;
  char v7;
  id v8;
  id v9[2];
  char v10;
  uint64_t v11;
  int v12;
  int v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  id v18;
  CGRect v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  id v23[7];
  uint64_t v24;
  uint64_t v25;
  CGRect v26;

  v25 = a1;
  v24 = a1;
  objc_msgSend(*(id *)(a1 + 32), "_accessibilitySetBoolValue:forKey:", 1, CFSTR("IsActivatingAXKey"));
  memset(&v23[3], 0, 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "frame");
  *(CGRect *)&v23[3] = v26;
  CGRectGetMidX(v26);
  CGRectGetMidY(*(CGRect *)&v23[3]);
  CGPointMake_1();
  v23[1] = v1;
  v23[2] = v2;
  v23[0] = (id)AXUIMakeTouchForTouchesBeganAtLocation();
  v3 = *(void **)(a1 + 32);
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v23[0]);
  objc_msgSend(v3, "touchesBegan:withEvent:");

  v22 = 0x3F847AE147AE147BLL;
  v6 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "name");
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Caps-Lock-Key"));

  if ((v7 & 1) != 0)
    v22 = 0x3FC3333333333333;
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v11 = MEMORY[0x24BDAC760];
    v12 = -1073741824;
    v13 = 0;
    v14 = __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke_2;
    v15 = &unk_24FF3E110;
    v16 = *(id *)(a1 + 40);
    v19 = *(CGRect *)&v23[3];
    v21 = *(_BYTE *)(a1 + 49) & 1;
    v17 = v23[0];
    v20 = v22;
    v18 = *(id *)(a1 + 32);
    AXPerformBlockOnMainThreadAfterDelay();
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v16, 0);
  }
  else
  {
    v8 = v23[0];
    v9[1] = (id)v22;
    v9[0] = *(id *)(a1 + 32);
    v10 = *(_BYTE *)(a1 + 50) & 1;
    AXPerformBlockOnMainThreadAfterDelay();
    objc_storeStrong(v9, 0);
    objc_storeStrong(&v8, 0);
  }
  objc_storeStrong(v23, 0);
}

void __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  double v9;
  CGFloat MidX;
  id v12;
  id v13;
  id v14[2];
  __int128 v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22[2];
  __int128 v23;
  __int128 v24;
  CGFloat v25;
  uint64_t v26;
  uint64_t v27;

  v27 = a1;
  v26 = a1;
  v25 = 0.0;
  v12 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "secondaryRepresentedStrings");
  if (objc_msgSend(v12, "count") == 1)
  {
    MidX = CGRectGetMidX(*(CGRect *)(a1 + 56));
  }
  else
  {
    v1 = *(_QWORD *)(a1 + 56);
    v2 = *(_QWORD *)(a1 + 64);
    v3 = *(_QWORD *)(a1 + 72);
    v4 = *(_QWORD *)(a1 + 80);
    if ((*(_BYTE *)(a1 + 96) & 1) != 0)
      v9 = CGRectGetMaxX(*(CGRect *)&v1) + 10.0;
    else
      v9 = CGRectGetMinX(*(CGRect *)&v1) - 10.0;
    MidX = v9;
  }

  v25 = MidX;
  v24 = 0uLL;
  CGRectGetMaxY(*(CGRect *)(a1 + 56));
  CGPointMake_1();
  *(_QWORD *)&v24 = v5;
  *((_QWORD *)&v24 + 1) = v6;
  v16 = MEMORY[0x24BDAC760];
  v17 = -1073741824;
  v18 = 0;
  v19 = __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke_3;
  v20 = &unk_24FF3E0E8;
  v21 = *(id *)(a1 + 40);
  v22[1] = *(id *)(a1 + 88);
  v22[0] = *(id *)(a1 + 48);
  v23 = v24;
  AXPerformSafeBlock();
  v7 = *(void **)(a1 + 48);
  v8 = (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "touchesMoved:withEvent:");

  v13 = *(id *)(a1 + 40);
  v14[1] = *(id *)(a1 + 88);
  v14[0] = *(id *)(a1 + 48);
  v15 = v24;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong(v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v22, 0);
  objc_storeStrong(&v21, 0);
}

uint64_t __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke_3(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v5;
  void *v6;
  void *v8;

  v6 = *(void **)(a1 + 32);
  v5 = *(double *)(a1 + 48) / 2.0;
  objc_msgSend(v6, "timestamp");
  objc_msgSend(v6, "setTimestamp:", v1 + v5);
  objc_msgSend(*(id *)(a1 + 32), "setPhase:", 1);
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "convertPoint:toView:", 0, *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(v8, "_setLocationInWindow:resetPrevious:", 0, v2, v3);
}

void __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10[2];
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = a1;
  v12 = a1;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke_5;
  v8 = &unk_24FF3E0E8;
  v9 = *(id *)(a1 + 32);
  v10[1] = *(id *)(a1 + 48);
  v10[0] = *(id *)(a1 + 40);
  v11 = *(_OWORD *)(a1 + 56);
  AXPerformSafeBlock();
  v2 = *(void **)(a1 + 40);
  v3 = (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "touchesEnded:withEvent:");

  objc_storeStrong(v10, 0);
  objc_storeStrong(&v9, 0);
}

uint64_t __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke_5(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v5;
  void *v6;
  void *v8;

  v6 = *(void **)(a1 + 32);
  v5 = *(double *)(a1 + 48) / 2.0;
  objc_msgSend(v6, "timestamp");
  objc_msgSend(v6, "setTimestamp:", v1 + v5);
  objc_msgSend(*(id *)(a1 + 32), "setPhase:", 3);
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "convertPoint:toView:", 0, *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(v8, "_setLocationInWindow:resetPrevious:", 0, v2, v3);
}

void __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke_6(uint64_t a1)
{
  double v1;
  void *v2;
  void *v3;
  id v4;
  id v6;
  id v7[4];

  v7[3] = (id)a1;
  v7[2] = (id)a1;
  objc_msgSend(*(id *)(a1 + 32), "setPhase:", 3);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "timestamp");
  objc_msgSend(v2, "setTimestamp:", v1 + *(double *)(a1 + 48));
  v3 = *(void **)(a1 + 40);
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "touchesEnded:withEvent:");

  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    v6 = *(id *)(a1 + 32);
    v7[1] = *(id *)(a1 + 48);
    v7[0] = *(id *)(a1 + 40);
    AXPerformBlockOnMainThreadAfterDelay();
    objc_storeStrong(v7, 0);
    objc_storeStrong(&v6, 0);
  }
}

void __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke_7(uint64_t a1)
{
  double v1;
  void *v2;
  void *v3;
  id v4;
  id v6;
  id v7[4];

  v7[3] = (id)a1;
  v7[2] = (id)a1;
  objc_msgSend(*(id *)(a1 + 32), "setPhase:", 0);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "timestamp");
  objc_msgSend(v2, "setTimestamp:", v1 + *(double *)(a1 + 48));
  v3 = *(void **)(a1 + 40);
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "touchesBegan:withEvent:");

  v6 = *(id *)(a1 + 32);
  v7[1] = *(id *)(a1 + 48);
  v7[0] = *(id *)(a1 + 40);
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong(v7, 0);
  objc_storeStrong(&v6, 0);
}

void __107__UIAccessibilityElementKBKey__accessibilityActivateForPanAlternate_isSecondAlternate_isSecondaryActivate___block_invoke_8(uint64_t a1)
{
  double v1;
  void *v2;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setPhase:", 3);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "timestamp");
  objc_msgSend(v2, "setTimestamp:", v1 + *(double *)(a1 + 48));
  v4 = *(void **)(a1 + 40);
  v5 = (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "touchesEnded:withEvent:");

}

- (unint64_t)_accessibilityAutomationType
{
  return 20;
}

- (BOOL)accessibilityActivate
{
  return -[UIAccessibilityElementKBKey _accessibilityActivateForPanAlternate:isSecondAlternate:](self, 0, 0) & 1;
}

- (BOOL)_accessibilitySecondaryActivate
{
  return -[UIAccessibilityElementKBKey _accessibilityActivateForPanAlternate:isSecondAlternate:isSecondaryActivate:](self, 0, 0, 1) & 1;
}

- (uint64_t)_axIsDictationKey
{
  id v2;
  id v3;
  BOOL v4;
  id v5;
  id v6;
  id v7;
  int v8;
  id v9;
  id v10;
  char v11;

  v10 = a1;
  if (a1)
  {
    v9 = (id)objc_msgSend(v10, "_accessibilityValueForKey:", CFSTR("AXIsDictationKey"));
    if (v9)
    {
      v11 = objc_msgSend(v9, "BOOLValue") & 1;
      v8 = 1;
    }
    else
    {
      v7 = (id)objc_msgSend(v10, "safeValueForKey:", CFSTR("key"));
      v3 = (id)objc_msgSend(v7, "properties");
      v2 = (id)objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDF7978]);
      v4 = objc_msgSend(v2, "intValue") == 4;

      v5 = v10;
      v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
      objc_msgSend(v5, "_accessibilitySetRetainedValue:forKey:");

      v11 = v4;
      v8 = 1;
      objc_storeStrong(&v7, 0);
    }
    objc_storeStrong(&v9, 0);
  }
  else
  {
    v11 = 0;
  }
  return v11 & 1;
}

- (id)_accessibilityKeyboardKeyEnteredString
{
  id v3;
  id v4;

  v3 = (id)-[UIKBTree properties](self->_key, "properties");
  v4 = (id)objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDF7988]);

  return v4;
}

- (BOOL)isAccessibilityElement
{
  id v3;
  BOOL v4;

  if ((-[UIKBTree visible](self->_key, "visible") & 1) == 0
    || -[UIKBTree displayType](self->_key, "displayType") == 1)
  {
    return 0;
  }
  if ((-[UIKBTree ghost](self->_key, "ghost") & 1) != 0)
    return 0;
  v3 = -[UIAccessibilityElementKBKey accessibilityLabel](self, "accessibilityLabel");
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (id)accessibilityValue
{
  _BOOL8 KeyboardKeys;
  id v4;
  char v5;
  id location[2];
  UIAccessibilityElementKBKey *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  if (self->_key)
  {
    location[0] = (id)-[UIKBTree name](v7->_key, "name");
    if ((objc_msgSend(location[0], "hasSuffix:", CFSTR("Shift-Key")) & 1) != 0)
    {
      v4 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
      v5 = objc_msgSend(v4, "isShiftLocked");

      if ((v5 & 1) != 0)
      {
        v8 = accessibilityLocalizedString(CFSTR("caps.lock.enabled"));
LABEL_12:
        objc_storeStrong(location, 0);
        return v8;
      }
    }
    else if (-[UIAccessibilityElementKBKey _accessibilityIsInternationalKeyboardKey](v7, "_accessibilityIsInternationalKeyboardKey"))
    {
      if ((-[UIAccessibilityElementKBKey _axDisplaysGlobeKeyAsEmojiKey](v7) & 1) != 0)
      {
        v8 = 0;
      }
      else
      {
        KeyboardKeys = UIAXRequiresTwoNextKeyboardKeys();
        v8 = UIAXNextKeyboardValue(KeyboardKeys);
      }
      goto LABEL_12;
    }
    v8 = 0;
    goto LABEL_12;
  }
  v8 = 0;
  return v8;
}

- (uint64_t)_axDisplaysGlobeKeyAsEmojiKey
{
  id v2;
  char v3;

  if (a1)
  {
    v2 = -[UIAccessibilityElementKBKey _axLayoutStar](a1);
    v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("globeKeyDisplaysAsEmojiKey")) & 1;

  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

- (id)accessibilityIdentifier
{
  id v3;
  char v4;
  id v5;
  char v6;
  id v7;
  char v8;
  id v9;
  char v10;
  id v11;
  char v12;
  unint64_t v13;
  id v14;
  char v15;
  objc_super v16;
  id v17;
  char v18;
  id v19;
  char v20;
  id v21;
  int v22;
  id location[2];
  UIAccessibilityElementKBKey *v24;
  __CFString *v25;

  v24 = self;
  location[1] = (id)a2;
  v14 = (id)-[UIKBTree name](self->_key, "name");
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("Return-Key"));

  if ((v15 & 1) != 0)
  {
    location[0] = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
    v13 = objc_msgSend(location[0], "returnKeyType");
    if (v13 <= 0xA)
      __asm { BR              X8 }
    v22 = 0;
    objc_storeStrong(location, 0);
  }
  else
  {
    v11 = (id)-[UIKBTree name](v24->_key, "name");
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Tab-Key"));

    if ((v12 & 1) != 0)
    {
      v25 = CFSTR("tab");
      return v25;
    }
    v9 = (id)-[UIKBTree name](v24->_key, "name");
    v20 = 0;
    v10 = 1;
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Delete-Key")) & 1) == 0)
    {
      v21 = (id)-[UIKBTree name](v24->_key, "name");
      v20 = 1;
      v10 = objc_msgSend(v21, "isEqualToString:", CFSTR("Monolith-Linear-Delete-Key"));
    }
    if ((v20 & 1) != 0)

    if ((v10 & 1) != 0)
    {
      v25 = CFSTR("delete");
      return v25;
    }
    v7 = (id)-[UIKBTree name](v24->_key, "name");
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Shift-Key"));

    if ((v8 & 1) != 0)
    {
      v25 = CFSTR("shift");
      return v25;
    }
    v5 = (id)-[UIKBTree name](v24->_key, "name");
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Caps-Lock-Key"));

    if ((v6 & 1) != 0)
    {
      v25 = CFSTR("caps-lock");
      return v25;
    }
    if ((-[UIAccessibilityElementKBKey _axIsDictationKey](v24) & 1) != 0)
    {
      v25 = CFSTR("dictation");
      return v25;
    }
    v3 = (id)-[UIKBTree name](v24->_key, "name");
    v18 = 0;
    v4 = 1;
    if ((objc_msgSend(v3, "hasSuffix:", CFSTR("More-Key")) & 1) == 0)
    {
      v19 = (id)-[UIKBTree name](v24->_key, "name");
      v18 = 1;
      v4 = objc_msgSend(v19, "isEqualToString:", CFSTR("NumberPad-More"));
    }
    if ((v18 & 1) != 0)

    if ((v4 & 1) != 0)
    {
      v25 = CFSTR("more");
      return v25;
    }
  }
  v17 = (id)-[UIKBTree name](v24->_key, "name");
  if ((objc_msgSend(v17, "isEqualToString:", CFSTR("Voiced-Sound-Mark-And-Semi-Voiced-Sound-Mark-And-Small-Variation")) & 1) != 0)
  {
    v25 = (__CFString *)(id)-[UIKBTree representedString](v24->_key, "representedString");
  }
  else
  {
    v16.receiver = v24;
    v16.super_class = (Class)UIAccessibilityElementKBKey;
    v25 = (__CFString *)-[UIAccessibilityElementKBKey accessibilityIdentifier](&v16, sel_accessibilityIdentifier);
  }
  v22 = 1;
  objc_storeStrong(&v17, 0);
  return v25;
}

- (uint64_t)_axIsShifted
{
  int v2;
  char v3;
  char v4;
  id v5;
  id location;
  void *v7;
  char v8;

  v7 = a1;
  if (a1)
  {
    location = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
    v4 = 0;
    v3 = 1;
    if ((objc_msgSend(location, "isShifted") & 1) == 0)
    {
      LOBYTE(v2) = 0;
      if ((objc_msgSend(location, "isShiftLocked") & 1) != 0)
      {
        v5 = -[UIAccessibilityElementKBKey _axLayoutStar](v7);
        v4 = 1;
        v2 = objc_msgSend(v5, "safeBoolForKey:", CFSTR("isShiftKeyBeingHeld")) ^ 1;
      }
      v3 = v2;
    }
    v8 = v3 & 1;
    if ((v4 & 1) != 0)

    objc_storeStrong(&location, 0);
  }
  else
  {
    v8 = 0;
  }
  return v8 & 1;
}

- (id)_accessibilityLabel
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  uint64_t v115;
  id v116;
  id v117;
  uint64_t v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  uint64_t v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v135;
  BOOL v136;
  id v137;
  id v138;
  uint64_t v139;
  BOOL v140;
  id v141;
  BOOL v142;
  id v143;
  id v144;
  id v145;
  BOOL v146;
  id v147;
  char v148;
  id v149;
  BOOL v150;
  id v151;
  BOOL v152;
  id v153;
  char v154;
  id v155;
  id v156;
  char v157;
  id v158;
  char v159;
  uint64_t v160;
  id v161;
  char v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  BOOL v169;
  id v170;
  id v171;
  id v172;
  int v173;
  id v174;
  id v175;
  int v176;
  unint64_t v177;
  id v178;
  void *v179;
  id v180;
  id v181;
  id v182;
  BOOL v183;
  _QWORD v184[2];
  id v185;
  id v186;
  BOOL v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  BOOL v191;
  id v192;
  id v193;
  char v194;
  id v195;
  id v196;
  id v197;
  char v198;
  id v199;
  char v200;
  id v201;
  id v202;
  id v203;
  id v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  id obj[3];
  char *i;
  uint64_t v211;
  id v212;
  id v213;
  id v214;
  char v215;
  id v216;
  id v217;
  id v218;
  char v219;
  id v220;
  id v221;
  id v222;
  id v223;
  int v224;
  int v225;
  char v226;
  int v227;
  id v228;
  int v229;
  BOOL v230;
  char v231;
  id location;
  char v233;
  char v234;
  uint64_t v235;
  id v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  char *v242;
  char *v243;
  uint64_t v244;

  v235 = a1;
  if (a1)
  {
    v234 = 0;
    v233 = 0;
    location = 0;
    v231 = 0;
    v179 = (void *)MEMORY[0x24BDBCEA0];
    v182 = (id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
    v181 = (id)objc_msgSend(v182, "currentInputMode");
    v180 = (id)objc_msgSend(v181, "primaryLanguage");
    v183 = objc_msgSend(v179, "characterDirectionForLanguage:") == 2;

    v230 = v183;
    if (!*(_QWORD *)(v235 + 56))
    {
      v236 = 0;
      v229 = 1;
LABEL_262:
      objc_storeStrong(&location, 0);
      return v236;
    }
    if ((-[UIAccessibilityElementKBKey _axIsDictationKey]((void *)v235) & 1) != 0)
    {
      v236 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:](v235, CFSTR("dictation.key"));
      v229 = 1;
      goto LABEL_262;
    }
    v228 = (id)objc_msgSend(*(id *)(v235 + 56), "name");
    v227 = 0;
    v227 = objc_msgSend(*(id *)(v235 + 56), "variantType");
    v226 = 0;
    if ((objc_msgSend(v228, "isEqualToString:", CFSTR("NumberPad-Delete")) & 1) != 0)
    {
      v234 = 1;
      v1 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:](v235, CFSTR("delete.key"));
      v2 = location;
      location = v1;

      goto LABEL_156;
    }
    if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Delete-Key")) & 1) != 0
      || (objc_msgSend(v228, "isEqualToString:", CFSTR("Monolith-Linear-Delete-Key")) & 1) != 0)
    {
      v233 = 1;
      v234 = 1;
      v178 = (id)objc_msgSend(*(id *)(v235 + 56), "properties");
      v3 = (id)objc_msgSend(v178, "valueForKey:", *MEMORY[0x24BDF7970]);
      v4 = location;
      location = v3;

      goto LABEL_156;
    }
    if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Double-Em-Dash")) & 1) != 0)
    {
      v234 = 1;
      v5 = accessibilityLocalizedString(CFSTR("double.em.dash.key"));
      v6 = location;
      location = v5;

      goto LABEL_156;
    }
    if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Double-Horizontal-Ellipsis")) & 1) != 0)
    {
      v234 = 1;
      v7 = accessibilityLocalizedString(CFSTR("double.ellipsis.dash.key"));
      v8 = location;
      location = v7;

      goto LABEL_156;
    }
    if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Cut-Key")) & 1) != 0)
    {
      v234 = 1;
      v9 = accessibilityLocalizedString(CFSTR("cut.keyboard.key"));
      v10 = location;
      location = v9;

      goto LABEL_156;
    }
    if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Copy-Key")) & 1) != 0)
    {
      v234 = 1;
      v11 = accessibilityLocalizedString(CFSTR("copy.keyboard.key"));
      v12 = location;
      location = v11;

      goto LABEL_156;
    }
    if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Paste-Key")) & 1) != 0)
    {
      v234 = 1;
      v13 = accessibilityLocalizedString(CFSTR("paste.keyboard.key"));
      v14 = location;
      location = v13;

      goto LABEL_156;
    }
    if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Hebrew-Accents")) & 1) != 0)
    {
      v234 = 1;
      v15 = accessibilityLocalizedString(CFSTR("hebrew.accents.key"));
      v16 = location;
      location = v15;

      goto LABEL_156;
    }
    if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Bold-Key")) & 1) != 0)
    {
      v234 = 1;
      v17 = accessibilityLocalizedString(CFSTR("bold.keyboard.key"));
      v18 = location;
      location = v17;

      goto LABEL_156;
    }
    if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Undo-Key")) & 1) != 0)
    {
      v234 = 1;
      v19 = accessibilityLocalizedString(CFSTR("undo.keyboard.key"));
      v20 = location;
      location = v19;

      goto LABEL_156;
    }
    if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Roman-to-Non-Roman-Switch-Key")) & 1) != 0)
    {
      v234 = 1;
      v21 = accessibilityLocalizedString(CFSTR("switch.back.to.non.roman.key"));
      v22 = location;
      location = v21;

      goto LABEL_156;
    }
    if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Non-Roman-to-Roman-Switch-Key")) & 1) != 0)
    {
      v234 = 1;
      v23 = accessibilityLocalizedString(CFSTR("switch.to.roman.key"));
      v24 = location;
      location = v23;

      goto LABEL_156;
    }
    if ((objc_msgSend(v228, "isEqualToString:", CFSTR("BIU-Key")) & 1) != 0)
    {
      v234 = 1;
      v25 = accessibilityLocalizedString(CFSTR("biu.keyboard.key"));
      v26 = location;
      location = v25;

      goto LABEL_156;
    }
    if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Left-Arrow-Key")) & 1) != 0)
    {
      v234 = 1;
      v27 = accessibilityLocalizedString(CFSTR("left.arrow.keyboard.key"));
      v28 = location;
      location = v27;

      goto LABEL_156;
    }
    if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Right-Arrow-Key")) & 1) != 0)
    {
      v234 = 1;
      v29 = accessibilityLocalizedString(CFSTR("right.arrow.keyboard.key"));
      v30 = location;
      location = v29;

      goto LABEL_156;
    }
    if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Redo-Key")) & 1) != 0)
    {
      v234 = 1;
      v31 = accessibilityLocalizedString(CFSTR("redo.keyboard.key"));
      v32 = location;
      location = v31;

      goto LABEL_156;
    }
    if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Emoji")) & 1) != 0)
    {
      v234 = 1;
      v33 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:](v235, CFSTR("emoji.keyboard.key"));
      v34 = location;
      location = v33;

      goto LABEL_156;
    }
    if ((objc_msgSend((id)v235, "_accessibilityIsInternationalKeyboardKey") & 1) != 0)
    {
      v234 = 1;
      if ((-[UIAccessibilityElementKBKey _axDisplaysGlobeKeyAsEmojiKey]((void *)v235) & 1) != 0)
        v35 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:](v235, CFSTR("global.keyboard.key.emoji"));
      else
        v35 = accessibilityLocalizedString(CFSTR("global.keyboard.key"));
      v36 = location;
      location = v35;

      goto LABEL_156;
    }
    if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Handwriting-Input")) & 1) != 0)
    {
      v234 = 1;
      v37 = accessibilityLocalizedString(CFSTR("handwriting.input.area"));
      v38 = location;
      location = v37;

      goto LABEL_156;
    }
    if ((objc_msgSend(v228, "isEqualToString:", CFSTR("FiftyOn-Fullwidth-Left-And-Right-Corner-Bracket-Right")) & 1) != 0)
    {
      v234 = 1;
      v39 = accessibilityLocalizedString(CFSTR("parentheses"));
      v40 = location;
      location = v39;

      goto LABEL_156;
    }
    if ((objc_msgSend(v228, "isEqualToString:", CFSTR("FiftyOn-SymbolNumber-Keyplane-Switch-Key")) & 1) != 0)
    {
LABEL_69:
      v233 = 1;
      v234 = 1;
      v55 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:](v235, CFSTR("more.numbers.key"));
      v56 = location;
      location = v55;

      goto LABEL_156;
    }
    if ((objc_msgSend(v228, "isEqualToString:", CFSTR("TenKey-Alphabet-Keyplane-Switch-Key")) & 1) == 0)
    {
      if ((objc_msgSend(v228, "isEqualToString:", CFSTR("FiftyOn-Kana-Keyplane-Switch-Key")) & 1) != 0)
      {
        v233 = 1;
        v234 = 1;
        v43 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:](v235, CFSTR("more.kana.key"));
        v44 = location;
        location = v43;

        goto LABEL_156;
      }
      if ((objc_msgSend(v228, "isEqualToString:", CFSTR("TenKey-Pinyin-Keyplane-Switch-Key")) & 1) != 0)
      {
        v233 = 1;
        v234 = 1;
        v45 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:](v235, CFSTR("more.pinyin.key"));
        v46 = location;
        location = v45;

        goto LABEL_156;
      }
      if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Multitap-Complete-Key")) & 1) != 0)
      {
        v234 = 1;
        v47 = accessibilityLocalizedString(CFSTR("keyboard.complete.key"));
        v48 = location;
        location = v47;

        goto LABEL_156;
      }
      if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Multitap-Reverse-Key")) & 1) != 0)
      {
        v234 = 1;
        v49 = accessibilityLocalizedString(CFSTR("keyboard.reverse.key"));
        v50 = location;
        location = v49;

        goto LABEL_156;
      }
      if ((objc_msgSend(v228, "isEqualToString:", CFSTR("TenKey-Case-Swap")) & 1) != 0)
      {
        v233 = 1;
        v234 = 1;
        v51 = accessibilityLocalizedString(CFSTR("keyboard.case.swap.key"));
        v52 = location;
        location = v51;

        goto LABEL_156;
      }
      if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Voiced-Sound-Mark-And-Semi-Voiced-Sound-Mark-And-Small-Variation")) & 1) != 0)
      {
        v233 = 1;
        v234 = 1;
        v53 = accessibilityLocalizedString(CFSTR("keyboard.voice.sound.mark.key"));
        v54 = location;
        location = v53;

        goto LABEL_156;
      }
      if ((objc_msgSend(v228, "hasSuffix:", CFSTR("TenKey-Alphabet-Keyplane-Switch-Key")) & 1) != 0
        || (objc_msgSend(v228, "hasSuffix:", CFSTR("SymbolNumber-Keyplane-Switch-Key")) & 1) != 0)
      {
        goto LABEL_69;
      }
      if ((objc_msgSend(v228, "hasSuffix:", CFSTR("Alphabet-Keyplane-Switch-Key")) & 1) == 0)
      {
        if ((objc_msgSend(v228, "hasSuffix:", CFSTR("Monolith-Clear-Key")) & 1) != 0)
        {
          v233 = 1;
          v234 = 1;
          v57 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:](v235, CFSTR("apple.tv.clear.key"));
          v58 = location;
          location = v57;

        }
        else if ((objc_msgSend(v228, "hasSuffix:", CFSTR("Monolith-Capital-Letters-Keyplane-Switch-Key")) & 1) != 0)
        {
          v233 = 1;
          v234 = 1;
          v59 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:](v235, CFSTR("Capital-Letters"));
          v60 = location;
          location = v59;

        }
        else if ((objc_msgSend(v228, "hasSuffix:", CFSTR("Monolith-Small-Letters-Keyplane-Switch-Key")) & 1) != 0)
        {
          v233 = 1;
          v234 = 1;
          v61 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:](v235, CFSTR("Small-Letters"));
          v62 = location;
          location = v61;

        }
        else if ((objc_msgSend(v228, "hasSuffix:", CFSTR("Monolith-Numbers-Keyplane-Switch-Key")) & 1) != 0)
        {
          v233 = 1;
          v234 = 1;
          v63 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:](v235, CFSTR("Numbers"));
          v64 = location;
          location = v63;

        }
        else if ((objc_msgSend(v228, "hasSuffix:", CFSTR("Monolith-Punctuation-Keyplane-Switch-Key")) & 1) != 0)
        {
          v233 = 1;
          v234 = 1;
          v65 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:](v235, CFSTR("Punctuation"));
          v66 = location;
          location = v65;

        }
        else if ((objc_msgSend(v228, "hasSuffix:", CFSTR("Monolith-Recents-Keyplane-Switch-Key")) & 1) != 0)
        {
          v233 = 1;
          v234 = 1;
          v67 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:](v235, CFSTR("Recents"));
          v68 = location;
          location = v67;

        }
        else if ((objc_msgSend(v228, "hasSuffix:", CFSTR("More-Key")) & 1) != 0
               || (objc_msgSend(v228, "isEqualToString:", CFSTR("NumberPad-More")) & 1) != 0)
        {
          v234 = 1;
          v175 = -[UIAccessibilityElementKBKey _axLayoutStar]((void *)v235);
          v174 = (id)objc_msgSend(v175, "safeValueForKey:", CFSTR("displayTypeHintForMoreKey"));
          v176 = objc_msgSend(v174, "intValue");

          v225 = v176;
          v177 = (v176 - 1);
          if (v177 <= 4)
            __asm { BR              X8 }
          objc_storeStrong(&location, 0);
          if (!location)
          {
            v69 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:](v235, CFSTR("more.key"));
            v70 = location;
            location = v69;

          }
          v233 = 1;
        }
        else if ((objc_msgSend(v228, "hasSuffix:", CFSTR("Shift-Key")) & 1) != 0)
        {
          v234 = 1;
          v172 = -[UIAccessibilityElementKBKey _axLayoutStar]((void *)v235);
          v171 = (id)objc_msgSend(v172, "safeValueForKey:", CFSTR("displayTypeHintForShiftKey"));
          v173 = objc_msgSend(v171, "intValue");

          v224 = v173;
          switch(v173)
          {
            case 1:
              v71 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:](v235, CFSTR("more.letters.key"));
              v72 = location;
              location = v71;

              break;
            case 2:
              v73 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:](v235, CFSTR("more.numbers.key"));
              v74 = location;
              location = v73;

              break;
            case 3:
              v75 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:](v235, CFSTR("more.symbols.key"));
              v76 = location;
              location = v75;

              break;
            default:
              objc_storeStrong(&location, 0);
              break;
          }
          if (!location)
          {
            v77 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:](v235, CFSTR("shift.key"));
            v78 = location;
            location = v77;

          }
          v233 = 1;
        }
        else if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Space-Key")) & 1) != 0
               || (objc_msgSend(v228, "isEqualToString:", CFSTR("Unlabeled-Space-Key")) & 1) != 0
               || (objc_msgSend(v228, "isEqualToString:", CFSTR("TenKey-Number-To-Number-Alternative-Keyplane-Switch-Key")) & 1) != 0|| (objc_msgSend(v228, "isEqualToString:", CFSTR("TenKey-Number-Alternative-To-Number-Keyplane-Switch-Key")) & 1) != 0|| (objc_msgSend(v228, "isEqualToString:", CFSTR("Monolith-Space-Key")) & 1) != 0|| (objc_msgSend(v228, "isEqualToString:", CFSTR("Monolith-Linear-Space-Key")) & 1) != 0)
        {
          v170 = (id)objc_msgSend(*(id *)(v235 + 56), "properties");
          v223 = (id)objc_msgSend(v170, "valueForKey:", *MEMORY[0x24BDF7970]);

          if (objc_msgSend(v223, "length"))
          {
            objc_storeStrong(&location, v223);
          }
          else
          {
            v234 = 1;
            v79 = accessibilityLocalizedString(CFSTR("spacebar.key"));
            v80 = location;
            location = v79;

          }
          v226 = 1;
          objc_storeStrong(&v223, 0);
        }
        else if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Return-Key")) & 1) != 0)
        {
          v222 = (id)objc_msgSend(*(id *)(v235 + 56), "displayString");
          if ((objc_msgSend(v222, "isEqualToString:", CFSTR("⏎")) & 1) != 0
            || (objc_msgSend(v222, "isEqualToString:", CFSTR("⮑")) & 1) != 0
            || (objc_msgSend(v222, "isEqualToString:", CFSTR("⮐")) & 1) != 0)
          {
            v234 = 1;
            v81 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:](v235, CFSTR("keyboard.return.key.default"));
            v82 = location;
            location = v81;

          }
          objc_storeStrong(&v222, 0);
        }
        else if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Dismiss-Key")) & 1) != 0
               || (objc_msgSend(v228, "isEqualToString:", CFSTR("Dismiss-HWR-Key")) & 1) != 0)
        {
          v234 = 1;
          v83 = accessibilityLocalizedString(CFSTR("keyboard.dismiss.key.default"));
          v84 = location;
          location = v83;

        }
        else if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Chinese-Facemark")) & 1) != 0)
        {
          v234 = 1;
          v85 = accessibilityLocalizedString(CFSTR("face.marks.keyboard.button"));
          v86 = location;
          location = v85;

        }
        else if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Wubihua-Letter-WildCard")) & 1) != 0)
        {
          v234 = 1;
          v87 = accessibilityLocalizedString(CFSTR("keyboard.key.chinese.stroke.wildcard"));
          v88 = location;
          location = v87;

        }
        else if ((objc_msgSend(v228, "hasSuffix:", CFSTR("Chinese10Key-Ideographic-Comma-Fullwidth-Question-Mark-Exclamation-Mark")) & 1) != 0|| (objc_msgSend(v228, "hasSuffix:", CFSTR("Period-Comma-Question-Mark-Exclamation-Mark")) & 1) != 0)
        {
          v234 = 1;
          v89 = accessibilityLocalizedString(CFSTR("keyboard.key.chinese.stroke.punctuation"));
          v90 = location;
          location = v89;

        }
        else if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Japanese-50on-Emoji")) & 1) != 0)
        {
          v234 = 1;
          v91 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:](v235, CFSTR("keyboard.emoji.keyplane"));
          v92 = location;
          location = v91;

        }
        else if ((objc_msgSend(v228, "isEqualToString:", CFSTR("TenKey-Fullwidth-Keyplane-Switch-Key")) & 1) != 0
               || (objc_msgSend(v228, "isEqualToString:", CFSTR("TenKey-Wubihua-Fullwidth-Keyplane-Switch-Key")) & 1) != 0)
        {
          v234 = 1;
          v93 = accessibilityLocalizedString(CFSTR("keyboard.chinese.fullwidth.toggle"));
          v94 = location;
          location = v93;

        }
        else if ((objc_msgSend(v228, "isEqualToString:", CFSTR("TenKey-Fullwidth-SymbolNumber-Keyplane-Switch-Key")) & 1) != 0
               || (objc_msgSend(v228, "isEqualToString:", CFSTR("TenKey-Wubihua-Fullwidth-SymbolNumber-Keyplane-Switch-Key")) & 1) != 0)
        {
          v234 = 1;
          v95 = accessibilityLocalizedString(CFSTR("keyboard.chinese.regularwidth.toggle"));
          v96 = location;
          location = v95;

        }
        else if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Wubihua-Facemark")) & 1) != 0)
        {
          v234 = 1;
          v97 = accessibilityLocalizedString(CFSTR("keyboard.emoticon.key"));
          v98 = location;
          location = v97;

        }
        else if ((objc_msgSend(v228, "isEqualToString:", CFSTR("TenKey-Wubihua-Keyplane-Switch-Key")) & 1) != 0
               || (objc_msgSend(v228, "isEqualToString:", CFSTR("TenKey-Wubihua-Stroke-Keyplane-Switch-Key")) & 1) != 0)
        {
          v99 = (id)objc_msgSend(*(id *)(v235 + 56), "displayString");
          v100 = location;
          location = v99;

        }
        else if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Cangjie-Letter-Z")) & 1) != 0)
        {
          objc_storeStrong(&location, CFSTR("蟲"));
        }
        else if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Ampersand")) & 1) != 0)
        {
          if (AXRequestingClient() != 15)
          {
            v234 = 1;
            v101 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:](v235, CFSTR("keyboard.key.ampersand"));
            v102 = location;
            location = v101;

          }
        }
        else if (v227 == 5)
        {
          v168 = (id)objc_msgSend(*(id *)(v235 + 56), "representedString");
          v167 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
          v166 = (id)objc_msgSend(v168, "stringByTrimmingCharactersInSet:");
          v169 = objc_msgSend(v166, "length") != 0;

          if (!v169)
          {
            v234 = 1;
            v103 = accessibilityLocalizedString(CFSTR("keyboard.key.accents"));
            v104 = location;
            location = v103;

          }
        }
        else if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Tab-Key")) & 1) != 0)
        {
          v234 = 1;
          v105 = accessibilityLocalizedString(CFSTR("keyboard.tab.key"));
          v106 = location;
          location = v105;

        }
        else if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Caps-Lock-Key")) & 1) != 0)
        {
          v234 = 1;
          v107 = accessibilityLocalizedString(CFSTR("caps.lock"));
          v108 = location;
          location = v107;

        }
        else if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Writeboard-Key")) & 1) != 0)
        {
          v234 = 1;
          v109 = accessibilityLocalizedString(CFSTR("keyboard.writeboard.key"));
          v110 = location;
          location = v109;

        }
LABEL_156:
        if (!objc_msgSend(location, "length"))
        {
          v231 = -[UIAccessibilityElementKBKey _axIsShifted]((void *)v235) & 1;
          if (objc_msgSend(*(id *)(v235 + 56), "displayType") == 7)
          {
            -[UIAccessibilityElementKBKey setChangesOnShiftDown:](v235, 1);
            v111 = -[UIAccessibilityElementKBKey _axDualStringLabel]((id *)v235);
            v112 = location;
            location = v111;

          }
        }
        if (!objc_msgSend(location, "length") || (v226 & 1) != 0)
        {
          v221 = (id)objc_msgSend(*(id *)(v235 + 56), "overrideDisplayString");
          if (objc_msgSend(v221, "length"))
          {
            objc_storeStrong(&location, v221);
            v234 = 0;
          }
          objc_storeStrong(&v221, 0);
        }
        if (objc_msgSend(location, "length"))
          goto LABEL_203;
        v219 = 0;
        objc_opt_class();
        v165 = (id)objc_msgSend(*(id *)(v235 + 56), "displayString");
        v218 = (id)__UIAccessibilityCastAsClass();

        v217 = v218;
        objc_storeStrong(&v218, 0);
        v220 = v217;
        v215 = 0;
        objc_opt_class();
        v164 = (id)objc_msgSend(*(id *)(v235 + 56), "representedString");
        v214 = (id)__UIAccessibilityCastAsClass();

        v213 = v214;
        objc_storeStrong(&v214, 0);
        v216 = v213;
        if ((objc_msgSend(v228, "hasPrefix:", CFSTR("TenKey-Latin")) & 1) != 0
          || (objc_msgSend(v228, "hasPrefix:", CFSTR("TenKey-At")) & 1) != 0
          || (objc_msgSend(v228, "hasPrefix:", CFSTR("TenKey-Period")) & 1) != 0
          || (objc_msgSend(v228, "hasPrefix:", CFSTR("TenKey-Chinese-Pinyin")) & 1) != 0)
        {
          v212 = (id)objc_msgSend(MEMORY[0x24BDD16A8], "string");
          v211 = objc_msgSend(v220, "length");
          for (i = 0; (uint64_t)i < v211; ++i)
          {
            v242 = i;
            v241 = 1;
            v243 = i;
            v244 = 1;
            obj[1] = i;
            obj[2] = (id)1;
            v163 = (id)objc_msgSend(v220, "substringWithRange:", i, 1);
            objc_msgSend(v212, "appendFormat:", CFSTR("%@ "), v163);

          }
          objc_storeStrong(&v216, v212);
          v161 = (id)objc_msgSend(*(id *)(v235 + 56), "name");
          v162 = objc_msgSend(v161, "hasPrefix:", CFSTR("TenKey-Period"));

          if ((v162 & 1) != 0)
          {
            obj[0] = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v216);
            v160 = MEMORY[0x24BDBD1C8];
            objc_msgSend(obj[0], "setAttribute:forKey:");
            objc_msgSend(obj[0], "setAttribute:forKey:", v160, *MEMORY[0x24BDFEBB8]);
            objc_storeStrong(&v216, obj[0]);
            objc_storeStrong(obj, 0);
          }
          objc_storeStrong(&v212, 0);
        }
        else if ((objc_msgSend(v228, "hasSuffix:", CFSTR("10Key-Keyplane-Switch-Key")) & 1) != 0)
        {
          objc_storeStrong(&v216, v220);
        }
        else if ((objc_msgSend(v228, "hasPrefix:", CFSTR("Hebrew-Accents")) & 1) != 0)
        {
          objc_storeStrong(&v220, v216);
        }
        if (objc_msgSend(v216, "length")
          && (objc_msgSend(v220, "isEqualToString:", v216) & 1) == 0
          && !-[UIAccessibilityElementKBKey isButtonType]((id *)v235)
          && !v230)
        {
          objc_storeStrong(&v220, v216);
          if (objc_msgSend(v220, "length") == 1
            && (unsigned __int16)objc_msgSend(v220, "characterAtIndex:", 0) == 9787)
          {
            v236 = accessibilityLocalizedString(CFSTR("face.marks.keyboard.button"));
            v229 = 1;
            goto LABEL_202;
          }
          if ((objc_msgSend(v228, "isEqualToString:", CFSTR("Wubihua-Letter-ExactMatch")) & 1) != 0)
          {
            v113 = (id)objc_msgSend(*(id *)(v235 + 56), "displayString");
            v114 = v220;
            v220 = v113;

          }
        }
        if (v220)
        {
          if (-[UIAccessibilityElementKBKey allowsCaseChangeOnShift](v235))
          {
            if (objc_msgSend(v220, "length"))
            {
              v207 = objc_msgSend(v220, "rangeOfComposedCharacterSequenceAtIndex:", 0);
              v208 = v115;
              if (v115 == objc_msgSend(v220, "length"))
              {
                -[UIAccessibilityElementKBKey setChangesOnShiftDown:](v235, 1);
                if ((v231 & 1) != 0)
                  v116 = (id)objc_msgSend(v220, "uppercaseString");
                else
                  v116 = (id)objc_msgSend(v220, "lowercaseString");
                v117 = v220;
                v220 = v116;

              }
            }
          }
          v158 = (id)objc_msgSend(*(id *)(v235 + 56), "name");
          v159 = objc_msgSend(v158, "hasPrefix:", CFSTR("NumberPad"));

          if ((v159 & 1) != 0)
          {
            v205 = objc_msgSend(v220, "rangeOfString:", CFSTR("/"));
            v206 = v118;
            if (v205 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v119 = (id)objc_msgSend(v220, "substringToIndex:", v205);
              v120 = location;
              location = v119;

            }
          }
          if (!objc_msgSend(location, "length"))
            objc_storeStrong(&location, v220);
        }
        v229 = 0;
LABEL_202:
        objc_storeStrong(&v216, 0);
        objc_storeStrong(&v220, 0);
        if (v229)
        {
LABEL_261:
          objc_storeStrong(&v228, 0);
          goto LABEL_262;
        }
LABEL_203:
        if (!objc_msgSend(location, "length"))
        {
          v204 = (id)objc_msgSend(*(id *)(v235 + 56), "variantDisplayString");
          if (v204)
            objc_storeStrong(&location, v204);
          objc_storeStrong(&v204, 0);
        }
        v155 = (id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
        v203 = (id)objc_msgSend(v155, "currentInputMode");

        v156 = (id)objc_msgSend(v203, "primaryLanguage");
        v157 = objc_msgSend(v156, "_containsSubstring:", CFSTR("zh"));

        if ((v157 & 1) != 0)
        {
          v153 = (id)objc_msgSend(v203, "identifier");
          v154 = objc_msgSend(v153, "_containsSubstring:", CFSTR("Wubihua"));

          if ((v154 & 1) != 0)
          {
            v202 = 0;
            v151 = (id)objc_msgSend(v203, "primaryLanguage");
            v200 = 0;
            v152 = 1;
            if (objc_msgSend(v151, "compare:options:", CFSTR("zh-hant"), 1))
            {
              v201 = (id)objc_msgSend(v203, "primaryLanguage");
              v200 = 1;
              v152 = objc_msgSend(v201, "compare:options:", CFSTR("zh_hant"), 1) == 0;
            }
            if ((v200 & 1) != 0)

            if (v152)
            {
              v121 = _TraditionalStrokeDictionary();
              v122 = v202;
              v202 = v121;

            }
            else
            {
              v149 = (id)objc_msgSend(v203, "primaryLanguage");
              v198 = 0;
              v150 = 1;
              if (objc_msgSend(v149, "compare:options:", CFSTR("zh-hans"), 1))
              {
                v199 = (id)objc_msgSend(v203, "primaryLanguage");
                v198 = 1;
                v150 = objc_msgSend(v199, "compare:options:", CFSTR("zh_hans"), 1) == 0;
              }
              if ((v198 & 1) != 0)

              if (v150)
              {
                v123 = _SimplifiedStrokeDictionary();
                v124 = v202;
                v202 = v123;

              }
            }
            v197 = (id)objc_msgSend(v202, "objectForKey:", location);
            if (objc_msgSend(v197, "length"))
              objc_storeStrong(&location, v197);
            objc_storeStrong(&v197, 0);
            objc_storeStrong(&v202, 0);
          }
          else
          {
            v147 = (id)objc_msgSend(v203, "identifier");
            v148 = objc_msgSend(v147, "_containsSubstring:", CFSTR("Zhuyin"));

            if ((v148 & 1) != 0)
            {
              v196 = 0;
              v145 = (id)objc_msgSend(v203, "primaryLanguage");
              v194 = 0;
              v146 = 1;
              if (objc_msgSend(v145, "compare:options:", CFSTR("zh-hant"), 1))
              {
                v195 = (id)objc_msgSend(v203, "primaryLanguage");
                v194 = 1;
                v146 = objc_msgSend(v195, "compare:options:", CFSTR("zh_hant"), 1) == 0;
              }
              if ((v194 & 1) != 0)

              if (v146)
              {
                v125 = _ZhuyinTraditionalStrokeDictionary();
                v126 = v196;
                v196 = v125;

              }
              v193 = (id)objc_msgSend(v196, "objectForKey:", location);
              if (objc_msgSend(v193, "length"))
                objc_storeStrong(&location, v193);
              objc_storeStrong(&v193, 0);
              objc_storeStrong(&v196, 0);
            }
          }
        }
        v192 = 0;
        if ((objc_msgSend(location, "isAXAttributedString") & 1) == 0 && location)
        {
          v127 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", location);
          v128 = v192;
          v192 = v127;

        }
        else
        {
          objc_storeStrong(&v192, location);
        }
        v191 = -[UIAccessibilityElementKBKey _accessibilityWasForcedToUseForeignKB](v235);
        if ((v234 & 1) != 0 || !objc_msgSend(location, "length"))
        {
          if ((v233 & 1) != 0 && !v191)
          {
            v185 = (id)objc_msgSend(v203, "primaryLanguage");
            v132 = (id)MEMORY[0x2348C3008](v185);
            v133 = v185;
            v185 = v132;

            if (objc_msgSend(v185, "length"))
              objc_msgSend(v192, "setAttribute:forKey:", v185, *MEMORY[0x24BDFEB98]);
            objc_storeStrong(&v185, 0);
          }
        }
        else
        {
          v129 = objc_msgSend(location, "length");
          v238 = 0;
          v237 = v129;
          v239 = 0;
          v240 = v129;
          v189 = 0;
          v190 = v129;
          if (!-[UIAccessibilityElementKBKey isButtonType]((id *)v235) && v190 == 1)
          {
            v143 = v192;
            v144 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
            objc_msgSend(v143, "setAttribute:forKey:withRange:");

          }
          v141 = (id)objc_msgSend((id)v235, "accessibilityLanguage");
          v142 = objc_msgSend(v141, "length") != 0;

          if (!v142)
          {
            v138 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
            v137 = (id)objc_msgSend(v138, "textInputTraits");
            v139 = objc_msgSend(v137, "keyboardType");

            v188 = v139;
            v187 = 0;
            v140 = 1;
            if (v139 != 5)
            {
              v140 = 1;
              if (v188 != 4)
                v140 = v188 == 8;
            }
            v187 = v140;
            if (!v140 && !v191)
            {
              v186 = (id)objc_msgSend(v203, "primaryLanguage");
              v130 = (id)MEMORY[0x2348C3008](v186);
              v131 = v186;
              v186 = v130;

              if (objc_msgSend(v186, "length"))
                objc_msgSend(v192, "setAttribute:forKey:withRange:", v186, *MEMORY[0x24BDFEB98], v189, v190);
              objc_storeStrong(&v186, 0);
            }
          }
        }
        v184[0] = 0;
        v184[1] = 0;
        v135 = (id)objc_msgSend(v192, "attributesAtIndex:effectiveRange:", 0, v184);
        v136 = objc_msgSend(v135, "count") == 0;

        if (!v136)
          objc_storeStrong(&location, v192);
        v236 = location;
        v229 = 1;
        objc_storeStrong(&v192, 0);
        objc_storeStrong(&v203, 0);
        goto LABEL_261;
      }
    }
    v233 = 1;
    v234 = 1;
    v41 = -[UIAccessibilityElementKBKey _accessibilityLocalizedStringForKeyboardLocale:](v235, CFSTR("more.letters.key"));
    v42 = location;
    location = v41;

    goto LABEL_156;
  }
  v236 = 0;
  return v236;
}

- (uint64_t)setChangesOnShiftDown:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 64) = a2 & 1;
  return result;
}

- (id)_axDualStringLabel
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v9;
  id v10;
  id v11;
  BOOL v12;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  char v17;
  id v18;
  id v19;
  char v20;
  id v21;
  char v22;
  id v23;
  _BYTE v24[9];
  id *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v25 = a1;
  if (a1)
  {
    v24[8] = 0;
    *(_QWORD *)v24 = -[UIAccessibilityElementKBKey _axIsShifted](v25) & 1;
    v23 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
    v22 = 0;
    if ((objc_msgSend(v23, "isShiftLocked") & 1) == 0
      || (v17 = 1, (-[UIAccessibilityElementKBKey isUnaffectedByShiftLock]((uint64_t)v25) & 1) == 0))
    {
      v17 = 1;
      if ((objc_msgSend(v23, "isAutoShifted") & 1) == 0)
        v17 = v24[0] ^ 1;
    }
    v22 = v17 & 1;
    v15 = (id)objc_msgSend(v25[7], "representedString");
    v16 = objc_msgSend(v15, "length") != 1;

    if (v16)
    {
      v11 = (id)objc_msgSend(v25[7], "representedString");
      v12 = (unint64_t)objc_msgSend(v11, "length") < 2;

      if (!v12)
      {
        if ((v22 & 1) != 0)
        {
          v10 = (id)objc_msgSend(v25[7], "representedString");
          v32 = 0;
          v31 = 1;
          v33 = 0;
          v34 = 1;
          v4 = (id)objc_msgSend(v10, "substringWithRange:", 0, 1);
          v5 = *(void **)&v24[1];
          *(_QWORD *)&v24[1] = v4;

        }
        else
        {
          v9 = (id)objc_msgSend(v25[7], "representedString");
          v28 = 1;
          v27 = 1;
          v29 = 1;
          v30 = 1;
          v6 = (id)objc_msgSend(v9, "substringWithRange:", 1, 1);
          v7 = *(void **)&v24[1];
          *(_QWORD *)&v24[1] = v6;

        }
      }
    }
    else if ((v22 & 1) != 0)
    {
      v1 = (id)objc_msgSend(v25[7], "representedString");
      v2 = *(void **)&v24[1];
      *(_QWORD *)&v24[1] = v1;

    }
    else
    {
      v21 = (id)objc_msgSend(v25[7], "secondaryRepresentedStrings");
      if (objc_msgSend(v21, "count"))
      {
        v20 = 0;
        objc_opt_class();
        v14 = (id)objc_msgSend(v25[7], "secondaryRepresentedStrings");
        v13 = (id)objc_msgSend(v14, "firstObject");
        v19 = (id)__UIAccessibilityCastAsClass();

        v18 = v19;
        objc_storeStrong(&v19, 0);
        v3 = *(void **)&v24[1];
        *(_QWORD *)&v24[1] = v18;

      }
      objc_storeStrong(&v21, 0);
    }
    v26 = *(id *)&v24[1];
    objc_storeStrong(&v23, 0);
    objc_storeStrong((id *)&v24[1], 0);
  }
  else
  {
    v26 = 0;
  }
  return v26;
}

- (BOOL)allowsCaseChangeOnShift
{
  id v2;
  char v3;
  id location;
  uint64_t v5;
  BOOL v6;

  v5 = a1;
  if (a1)
  {
    location = (id)objc_msgSend(*(id *)(v5 + 56), "name");
    if ((objc_msgSend(location, "isEqualToString:", CFSTR("Return-Key")) & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      v2 = (id)objc_msgSend(*(id *)(v5 + 56), "name");
      v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("Latin-Small-Letter-Small-Display"));

      v6 = (v3 & 1) == 0;
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    return 0;
  }
  return v6;
}

- (uint64_t)isUnaffectedByShiftLock
{
  id v2;
  char v3;
  id location;
  uint64_t v5;
  char v6;

  v5 = a1;
  if (a1)
  {
    v2 = (id)-[UIAccessibilityElementKBKey key](v5);
    location = (id)objc_msgSend(v2, "name");

    v3 = 1;
    if ((objc_msgSend(location, "isEqualToString:", CFSTR("Comma-With-Exclamation-Mark")) & 1) == 0)
      v3 = objc_msgSend(location, "isEqualToString:", CFSTR("Full-Stop-With-Question-Mark"));
    v6 = v3 & 1;
    objc_storeStrong(&location, 0);
  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

- (void)_applyCapitalLetterTransform
{
  id v1;
  id v2;
  id v3;
  id v4;
  id obj;
  id v6;
  int v7;
  id v8;
  char v9;
  id *v10;

  v10 = a1;
  if (a1 && (-[UIAccessibilityElementKBKey changesOnShiftDown]((uint64_t)v10) & 1) != 0)
  {
    v9 = -[UIAccessibilityElementKBKey _axIsShifted](v10) & 1;
    v8 = (id)objc_msgSend(v10, "accessibilityUserDefinedLabel");
    if (objc_msgSend(v8, "length"))
    {
      v6 = 0;
      if (objc_msgSend(v10[7], "displayType") == 7)
      {
        -[UIAccessibilityElementKBKey setChangesOnShiftDown:]((uint64_t)v10, 1);
        v1 = -[UIAccessibilityElementKBKey _axDualStringLabel](v10);
        v2 = v6;
        v6 = v1;

      }
      if (!objc_msgSend(v6, "length"))
      {
        if (-[UIAccessibilityElementKBKey allowsCaseChangeOnShift]((uint64_t)v10))
        {
          if ((v9 & 1) != 0)
            v3 = (id)objc_msgSend(v8, "uppercaseString");
          else
            v3 = (id)objc_msgSend(v8, "lowercaseString");
          v4 = v6;
          v6 = v3;

        }
        if ((objc_msgSend(v8, "isAXAttributedString") & 1) != 0 && objc_msgSend(v6, "length"))
        {
          obj = (id)objc_msgSend(v8, "copy");
          objc_msgSend(obj, "replaceString:", v6);
          objc_storeStrong(&v6, obj);
          objc_storeStrong(&obj, 0);
        }
      }
      if ((objc_msgSend(v6, "isEqualToString:", v8) & 1) == 0)
        objc_msgSend(v10, "setAccessibilityLabel:", v6);
      objc_storeStrong(&v6, 0);
      v7 = 0;
    }
    else
    {
      v7 = 1;
    }
    objc_storeStrong(&v8, 0);
  }
}

- (uint64_t)changesOnShiftDown
{
  char v2;

  if (a1)
    v2 = *(_BYTE *)(a1 + 64) & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (BOOL)_allowCachingAccessibilityLabel
{
  id v2;
  id location;
  uint64_t v4;
  BOOL v5;

  v4 = a1;
  if (a1)
  {
    v2 = (id)-[UIAccessibilityElementKBKey key](v4);
    location = (id)objc_msgSend(v2, "name");

    v5 = (objc_msgSend(location, "isEqualToString:", CFSTR("TenKey-Facemark-Voiced-Sound-Mark-And-Semi-Voiced-Sound-Mark-And-Small-Variation")) & 1) == 0&& (objc_msgSend(location, "isEqualToString:", CFSTR("Space-Key")) & 1) == 0&& (-[UIAccessibilityElementKBKey isUnaffectedByShiftLock](v4) & 1) == 0&& (objc_msgSend(location, "isEqualToString:", CFSTR("Voiced-Sound-Mark-And-Semi-Voiced-Sound-Mark-And-Small-Variation")) & 1) == 0;
    objc_storeStrong(&location, 0);
  }
  else
  {
    return 0;
  }
  return v5;
}

- (uint64_t)key
{
  if (a1)
    return *(_QWORD *)(a1 + 56);
  else
    return 0;
}

- (id)accessibilityLabel
{
  id location[2];
  UIAccessibilityElementKBKey *v4;
  id v5;

  v4 = self;
  location[1] = (id)a2;
  -[UIAccessibilityElementKBKey _applyCapitalLetterTransform]((id *)&self->super.super.super.isa);
  location[0] = (id)-[UIAccessibilityElementKBKey accessibilityUserDefinedLabel](v4, "accessibilityUserDefinedLabel");
  if (!location[0])
  {
    location[0] = -[UIAccessibilityElementKBKey _accessibilityLabel]((uint64_t)v4);

    if (-[UIAccessibilityElementKBKey _allowCachingAccessibilityLabel]((uint64_t)v4))
      -[UIAccessibilityElementKBKey setAccessibilityLabel:](v4, "setAccessibilityLabel:", location[0]);
  }
  v5 = location[0];
  objc_storeStrong(location, 0);
  return v5;
}

- (BOOL)_accessibilityKeyboardSupportsGestureMode
{
  id v3;
  char v4;

  v3 = (id)-[UIAccessibilityElementKBKey accessibilityContainer](self, "accessibilityContainer");
  v4 = objc_msgSend(v3, "_accessibilityKeyboardSupportsGestureMode");

  return v4 & 1;
}

- (CGPoint)accessibilityActivationPoint
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  id v6;
  char v7;
  objc_super v8;
  SEL v9;
  UIAccessibilityElementKBKey *v10;
  __int128 v11;
  CGPoint result;

  v10 = self;
  v9 = a2;
  v6 = (id)-[UIKBTree name](self->_key, "name");
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Handwriting-Input"));

  if ((v7 & 1) != 0)
  {
    v11 = *MEMORY[0x24BDBEFB0];
  }
  else
  {
    v8.receiver = v10;
    v8.super_class = (Class)UIAccessibilityElementKBKey;
    -[UIAccessibilityElementKBKey accessibilityActivationPoint](&v8, sel_accessibilityActivationPoint);
    *(_QWORD *)&v11 = v2;
    *((_QWORD *)&v11 + 1) = v3;
  }
  v5 = *((double *)&v11 + 1);
  v4 = *(double *)&v11;
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)accessibilityHint
{
  uint64_t v2;
  id v3;
  id v4;
  __CFString *v5;
  id v7;
  char v8;
  id v9;
  char v10;
  char v11;
  char v12;
  id v13;
  char v14;
  id v15;
  unsigned __int16 v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25[2];
  UIAccessibilityElementKBKey *v26;
  id v27;

  v26 = self;
  v25[1] = (id)a2;
  if ((-[UIAccessibilityElementKBKey _axIsDictationKey](self) & 1) == 0)
  {
    v25[0] = (id)-[UIKBTree displayString](v26->_key, "displayString");
    v24 = (id)-[UIKBTree name](v26->_key, "name");
    if ((objc_msgSend(v24, "hasPrefix:", CFSTR("NumberPad")) & 1) != 0)
    {
      v22 = objc_msgSend(v25[0], "rangeOfString:", CFSTR("/"));
      v23 = v2;
      if (v22 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v27 = 0;
        v21 = 1;
      }
      else
      {
        v3 = (id)objc_msgSend(v25[0], "substringFromIndex:", v22);
        v4 = v25[0];
        v25[0] = v3;

        v20 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "letterCharacterSet");
        v19 = (id)objc_msgSend(MEMORY[0x24BDD16A8], "string");
        v18 = 0;
        v17 = objc_msgSend(v25[0], "length");
        while (v18 < v17)
        {
          v16 = objc_msgSend(v25[0], "characterAtIndex:", v18);
          if ((objc_msgSend(v20, "characterIsMember:", v16) & 1) != 0)
          {
            objc_msgSend(v19, "appendFormat:", CFSTR("%C"), v16);
            if (v18 < v17 - 1)
              objc_msgSend(v19, "appendString:", CFSTR("-"));
          }
          ++v18;
        }
        v27 = v19;
        v21 = 1;
        objc_storeStrong(&v19, 0);
        objc_storeStrong(&v20, 0);
      }
      goto LABEL_42;
    }
    if ((objc_msgSend(v24, "isEqualToString:", CFSTR("Handwriting-Input")) & 1) != 0)
    {
      v27 = accessibilityLocalizedString(CFSTR("handwriting.input.hint"));
      v21 = 1;
LABEL_42:
      objc_storeStrong(&v24, 0);
      objc_storeStrong(v25, 0);
      return v27;
    }
    v14 = 0;
    v11 = 1;
    if ((objc_msgSend(v24, "isEqualToString:", CFSTR("Dismiss-Key")) & 1) == 0)
    {
      v15 = (id)-[UIKBTree name](v26->_key, "name");
      v14 = 1;
      v11 = objc_msgSend(v15, "isEqualToString:", CFSTR("Dismiss-HWR-Key"));
    }
    if ((v14 & 1) != 0)

    if ((v11 & 1) != 0)
    {
      v9 = (id)-[UIAccessibilityElementKBKey accessibilityContainer](v26, "accessibilityContainer");
      v10 = objc_msgSend(v9, "safeBoolForKey:", CFSTR("useDismissForMessagesWriteboard"));

      if ((v10 & 1) != 0)
        v27 = accessibilityLocalizedString(CFSTR("keyboard.writeboard.key"));
      else
        v27 = accessibilityLocalizedString(CFSTR("keyboard.dismiss.hint"));
      v21 = 1;
      goto LABEL_42;
    }
    if (-[UIAccessibilityElementKBKey _accessibilityIsInternationalKeyboardKey](v26, "_accessibilityIsInternationalKeyboardKey"))
    {
      if ((-[UIAccessibilityElementKBKey _axDisplaysGlobeKeyAsEmojiKey](v26) & 1) == 0)
      {
        v27 = accessibilityLocalizedString(CFSTR("globe.keyboard.key.hint"));
        v21 = 1;
        goto LABEL_42;
      }
    }
    else
    {
      v12 = 0;
      v8 = 0;
      if ((objc_msgSend(v24, "hasSuffix:", CFSTR("Shift-Key")) & 1) != 0)
      {
        v13 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
        v12 = 1;
        v8 = objc_msgSend(v13, "shiftLockedEnabled");
      }
      if ((v12 & 1) != 0)

      if ((v8 & 1) != 0)
      {
        v7 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
        if ((objc_msgSend(v7, "isShiftLocked") & 1) != 0)
          v5 = CFSTR("keyboard.turn.capslock.off.hint");
        else
          v5 = CFSTR("keyboard.turn.capslock.on.hint");
        v27 = accessibilityLocalizedString(v5);

        v21 = 1;
        goto LABEL_42;
      }
      if ((objc_msgSend(v24, "isEqualToString:", CFSTR("Monolith-Linear-Delete-Key")) & 1) != 0)
      {
        v27 = accessibilityLocalizedString(CFSTR("atv.delete.keyboard.key.hint"));
        v21 = 1;
        goto LABEL_42;
      }
      if ((objc_msgSend(v24, "isEqualToString:", CFSTR("Writeboard-Key")) & 1) != 0)
      {
        v27 = accessibilityLocalizedString(CFSTR("keyboard.writeboard.key.hint"));
        v21 = 1;
        goto LABEL_42;
      }
    }
    v27 = 0;
    v21 = 1;
    goto LABEL_42;
  }
  v27 = accessibilityLocalizedString(CFSTR("dictation.key.hint"));
  return v27;
}

- (CGRect)accessibilityFrame
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double x;
  double y;
  double width;
  double height;
  id v14;
  char v15;
  CGRect rect;
  UIView *v17;
  objc_super v18;
  SEL v19;
  UIAccessibilityElementKBKey *v20;
  CGRect v21;
  CGRect result;

  v20 = self;
  v19 = a2;
  if (self->_key)
  {
    v17 = (UIView *)-[UIAccessibilityElementKBKey _axLayoutStar](v20);
    -[UIKBTree frame](v20->_key, "frame");
    rect.origin.x = v6;
    rect.origin.y = v7;
    rect.size.width = v8;
    rect.size.height = v9;
    v14 = (id)-[UIKBTree name](v20->_key, "name");
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("Handwriting-Input"));

    if ((v15 & 1) != 0 && (AXDeviceIsPhoneIdiom() & 1) != 0)
    {
      rect.origin.y = rect.origin.y + 30.0;
      rect.size.height = rect.size.height - 30.0;
    }
    v21 = UIAccessibilityConvertFrameToScreenCoordinates(rect, v17);
    objc_storeStrong((id *)&v17, 0);
  }
  else
  {
    v18.receiver = v20;
    v18.super_class = (Class)UIAccessibilityElementKBKey;
    -[UIAccessibilityElementKBKey accessibilityFrame](&v18, sel_accessibilityFrame);
    v21.origin.x = v2;
    v21.origin.y = v3;
    v21.size.width = v4;
    v21.size.height = v5;
  }
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)_accessibilityAllowsAlternativeCharacterActivation
{
  return 1;
}

void __43__UIAccessibilityElementKBKey_isButtonType__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v4 = a1;
  v3 = a1;
  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithObjects:", CFSTR("Return-Key"), CFSTR("Dismiss-Key"), CFSTR("Dismiss-HWR-Key"), CFSTR("Tab-Key"), CFSTR("Handwriting-Input"), CFSTR("Emoji-International-Key"), CFSTR("Emoji"), CFSTR("Cut-Key"), CFSTR("Copy-Key"), CFSTR("Undo-Key"), CFSTR("Paste-Key"), CFSTR("Redo-Key"), CFSTR("Shift-Key"), CFSTR("BIU-Key"), CFSTR("Writeboard-Key"), 0);
  v2 = (void *)isButtonType_AcceptableButtonTypes;
  isButtonType_AcceptableButtonTypes = v1;

}

- (uint64_t)_accessibilityIsDeleteKey
{
  char v2;
  id location;
  uint64_t v4;
  char v5;

  v4 = a1;
  if (a1)
  {
    location = (id)objc_msgSend(*(id *)(v4 + 56), "name");
    v2 = 1;
    if ((objc_msgSend(location, "isEqualToString:", CFSTR("Delete-Key")) & 1) == 0)
    {
      v2 = 1;
      if ((objc_msgSend(location, "isEqualToString:", CFSTR("NumberPad-Delete")) & 1) == 0)
        v2 = objc_msgSend(location, "isEqualToString:", CFSTR("Monolith-Linear-Delete-Key"));
    }
    v5 = v2 & 1;
    objc_storeStrong(&location, 0);
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (BOOL)_accessibilityIsInternationalKeyboardKey
{
  id v3;
  char v4;
  char v5;
  id v6;

  v3 = (id)-[UIKBTree name](self->_key, "name");
  v5 = 0;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("International-Key")) & 1) == 0)
  {
    v6 = (id)-[UIKBTree name](self->_key, "name");
    v5 = 1;
    v4 = objc_msgSend(v6, "isEqualToString:", CFSTR("Emoji-International-Key"));
  }
  if ((v5 & 1) != 0)

  return v4 & 1;
}

- (unint64_t)accessibilityTraits
{
  char v2;
  unint64_t v4;
  id v5;
  id v6;
  int v7;
  int v8;
  char v9;
  id location;
  int v11;
  char v12;
  id v13;
  id v14;
  unint64_t v15;
  SEL v16;
  UIAccessibilityElementKBKey *v17;

  v17 = self;
  v16 = a2;
  v15 = 0;
  v15 = *MEMORY[0x24BDF73F0] | *MEMORY[0x24BDF73D0];
  v14 = (id)-[UIKBTree name](self->_key, "name");
  if (-[UIAccessibilityElementKBKey isButtonType]((id *)&v17->super.super.super.isa))
    v15 |= *MEMORY[0x24BDF73B0];
  if ((-[UIAccessibilityElementKBKey _axIsDictationKey](v17) & 1) != 0)
  {
    if ((-[UIKBTree state](v17->_key, "state") & 4) != 0)
      v15 |= *MEMORY[0x24BDF7400];
    v15 |= *MEMORY[0x24BDF7408];
  }
  v2 = -[UIKBTree disabled](v17->_key, "disabled");
  v12 = 0;
  v9 = 1;
  if ((v2 & 1) == 0)
  {
    LOBYTE(v8) = 0;
    if ((objc_msgSend(v14, "isEqualToString:", CFSTR("Return-Key")) & 1) != 0)
    {
      v13 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
      v12 = 1;
      v8 = objc_msgSend(v13, "returnKeyEnabled") ^ 1;
    }
    v9 = v8;
  }
  if ((v12 & 1) != 0)

  if ((v9 & 1) != 0)
    v15 |= *MEMORY[0x24BDF73E8];
  if ((-[UIAccessibilityElementKBKey _accessibilityIsDeleteKey]((uint64_t)v17) & 1) != 0)
    v15 |= *MEMORY[0x24BEBB108];
  if ((-[UIKBTree visible](v17->_key, "visible") & 1) == 0)
    v15 |= *MEMORY[0x24BEBB178];
  if ((objc_msgSend(v14, "hasSuffix:", CFSTR("Shift-Key")) & 1) != 0)
  {
    v6 = -[UIAccessibilityElementKBKey _axLayoutStar](v17);
    v5 = (id)objc_msgSend(v6, "safeValueForKey:", CFSTR("displayTypeHintForShiftKey"));
    v7 = objc_msgSend(v5, "intValue");

    v11 = v7;
    if (!v7)
    {
      location = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
      if ((objc_msgSend(location, "isShifted") & 1) != 0)
        v15 |= *MEMORY[0x24BDF7400];
      objc_storeStrong(&location, 0);
    }
  }
  else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("Handwriting-Input")) & 1) != 0)
  {
    v15 |= *MEMORY[0x24BDF73A8];
  }
  if ((-[UIAccessibilityElementKBKey _accessibilityIsKeySelected]() & 1) != 0)
    v15 |= *MEMORY[0x24BDF7400];
  v4 = v15;
  objc_storeStrong(&v14, 0);
  return v4;
}

- (uint64_t)_accessibilityIsKeySelected
{
  return 0;
}

- (id)_accessibilityVariantKeys
{
  id v3;
  id v4;
  BOOL v5;

  v4 = (id)-[UIAccessibilityElementKBKey cachedVariantKeys]((uint64_t)self);
  v5 = objc_msgSend(v4, "count") != 0;

  if (!v5)
  {
    v3 = +[UIAccessibilityElementKBKey variantKeysForKey:](UIAccessibilityElementKBKey, self->_key);
    -[UIAccessibilityElementKBKey setCachedVariantKeys:]((uint64_t)self, v3);

  }
  return (id)-[UIAccessibilityElementKBKey cachedVariantKeys]((uint64_t)self);
}

- (uint64_t)cachedVariantKeys
{
  if (a1)
    return *(_QWORD *)(a1 + 72);
  else
    return 0;
}

+ (id)variantKeysForKey:(void *)a1
{
  id v3;
  UIAccessibilityElementKBKey *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id obj;
  uint64_t v11;
  id v12;
  _QWORD __b[8];
  void *v14;
  id v15;
  id v16;
  id location;
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  v18 = (id)objc_opt_self();
  v16 = (id)objc_msgSend(location, "subtrees");
  v15 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  memset(__b, 0, sizeof(__b));
  obj = v16;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
  if (v11)
  {
    v7 = *(_QWORD *)__b[2];
    v8 = 0;
    v9 = v11;
    while (1)
    {
      v6 = v8;
      if (*(_QWORD *)__b[2] != v7)
        objc_enumerationMutation(obj);
      v14 = *(void **)(__b[1] + 8 * v8);
      if (objc_msgSend(v14, "displayType") != 50)
      {
        v4 = [UIAccessibilityElementKBKey alloc];
        v5 = (id)UIAccessibilityGetKeyboardLayoutStar();
        v12 = -[UIAccessibilityElementKBKey initWithAccessibilityContainer:key:](v4, v5, v14);

        objc_msgSend(v15, "addObject:", v12);
        objc_storeStrong(&v12, 0);
      }
      ++v8;
      if (v6 + 1 >= v9)
      {
        v8 = 0;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
        if (!v9)
          break;
      }
    }
  }

  objc_msgSend(v18, "_accessibilitySortElementsUsingGeometry:", v15);
  v3 = v15;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&location, 0);
  return v3;
}

- (void)setCachedVariantKeys:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 72), a2);
}

- (BOOL)_accessibilityHasVariantKeys
{
  id v3;
  int v4;
  char v5;
  SEL v6;
  UIAccessibilityElementKBKey *v7;

  v7 = self;
  v6 = a2;
  v5 = 0;
  v4 = 0;
  v4 = -[UIKBTree variantType](self->_key, "variantType");
  if (v4 == 1 || v4 == 3 || v4 == 7 || v4 == 4 || v4 == 5 || v4 == 8)
  {
    v5 = 1;
  }
  else
  {
    v3 = (id)UIAccessibilityGetKeyboardLayoutStar();
    v5 = objc_msgSend(v3, "keyHasAccentedVariants:", v7->_key) & 1;
    objc_storeStrong(&v3, 0);
  }
  return v5 & 1;
}

- (id)_accessibilitySupportGesturesAttributes
{
  id v2;
  id v3;
  id v5;
  id v6;
  id v7[3];
  _QWORD v8[3];
  _QWORD v9[3];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v7[2] = self;
  v7[1] = (id)a2;
  v7[0] = 0;
  if ((-[UIAccessibilityElementKBKey _accessibilityIsDeleteKey]((uint64_t)self) & 1) != 0)
  {
    v8[0] = CFSTR("AXSupportedGestureTypeKey");
    v9[0] = &unk_24FF85A00;
    v8[1] = CFSTR("AXGestureTapCountKey");
    v9[1] = &unk_24FF85A18;
    v8[2] = CFSTR("AXGestureFingerCountKey");
    v9[2] = &unk_24FF85A18;
    v6 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
    v10[0] = v6;
    v2 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v3 = v7[0];
    v7[0] = v2;

  }
  v5 = v7[0];
  objc_storeStrong(v7, 0);
  return v5;
}

- (BOOL)_performCapsLockDoubleTap
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  char v8;

  v7 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
  v8 = objc_msgSend(v7, "isShiftLocked");

  if ((v8 & 1) != 0)
  {
    v5 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
    objc_msgSend(v5, "setShiftLocked:", 0);

    v6 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
    objc_msgSend(v6, "setShift:", 0);

  }
  else
  {
    v3 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
    objc_msgSend(v3, "setShift:", 1);

    v4 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
    objc_msgSend(v4, "setShiftLocked:", 1);

  }
  return 1;
}

- (BOOL)_accessibilityActivatePanAlternate:(id)a3
{
  char v3;
  UIAccessibilityElementKBKey *v5;
  char v6;
  id location[2];
  UIAccessibilityElementKBKey *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = v8;
  v3 = -[UIAccessibilityPanAlternateCustomAction isSecondAlternate]((uint64_t)location[0]);
  v6 = -[UIAccessibilityElementKBKey _accessibilityActivateForPanAlternate:isSecondAlternate:](v5, 1, v3 & 1);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (id)accessibilityCustomActions
{
  UIAccessibilityPanAlternateCustomAction *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;
  UIAccessibilityPanAlternateCustomAction *v13;
  unint64_t i;
  unint64_t v15;
  id v16[2];
  UIAccessibilityElementKBKey *v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16[1] = (id)a2;
  v11 = (id)-[UIKBTree name](self->_key, "name");
  v12 = objc_msgSend(v11, "hasSuffix:", CFSTR("Shift-Key"));

  if ((v12 & 1) != 0)
  {
    v8 = objc_alloc(MEMORY[0x24BDF6788]);
    v10 = accessibilityLocalizedString(CFSTR("caps.lock"));
    v9 = (id)objc_msgSend(v8, "initWithName:target:selector:");
    v19[0] = v9;
    v18 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);

  }
  else if (-[UIKBTree displayTypeHint](v17->_key, "displayTypeHint") == 10)
  {
    v16[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = 0;
    v6 = (id)-[UIKBTree secondaryRepresentedStrings](v17->_key, "secondaryRepresentedStrings");
    v7 = objc_msgSend(v6, "count");

    v15 = v7;
    for (i = 0; i < v15; ++i)
    {
      v3 = [UIAccessibilityPanAlternateCustomAction alloc];
      v5 = (id)-[UIKBTree secondaryDisplayStrings](v17->_key, "secondaryDisplayStrings");
      v4 = (id)objc_msgSend(v5, "objectAtIndexedSubscript:", i);
      v13 = -[UIAccessibilityPanAlternateCustomAction initWithName:target:selector:](v3, "initWithName:target:selector:");

      -[UIAccessibilityPanAlternateCustomAction setIsSecondAlternate:]((uint64_t)v13, i == 1);
      objc_msgSend(v16[0], "addObject:", v13);
      objc_storeStrong((id *)&v13, 0);
    }
    v18 = v16[0];
    objc_storeStrong(v16, 0);
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (BOOL)_accessibilityKeyboardKeyHasSignificantAlternateActions
{
  id v3;
  char v4;

  v3 = (id)-[UIKBTree name](self->_key, "name");
  v4 = 1;
  if ((objc_msgSend(v3, "hasSuffix:", CFSTR("Shift-Key")) & 1) == 0)
    v4 = -[UIAccessibilityElementKBKey _accessibilityIsDeleteKey]((uint64_t)self);

  return v4 & 1;
}

- (void)setKey:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedVariantKeys, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
