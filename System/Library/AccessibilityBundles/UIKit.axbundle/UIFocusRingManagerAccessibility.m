@implementation UIFocusRingManagerAccessibility

+ (void)removeRingFromFocusItem:(id)a3 forClient:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t *v7;
  int v8;
  int v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  id v13;
  objc_super v14;
  id v15;
  id location[2];
  id v17;

  v17 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14.receiver = v17;
  v14.super_class = (Class)&OBJC_METACLASS___UIFocusRingManagerAccessibility;
  objc_msgSendSuper2(&v14, sel_removeRingFromFocusItem_forClient_, location[0], v15);
  if ((_UIAccessibilityFullKeyboardAccessEnabled() & 1) == 0)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 838860800;
    v9 = 48;
    v10 = __Block_byref_object_copy__9;
    v11 = __Block_byref_object_dispose__9;
    v12 = 0;
    AXPerformSafeBlock();
    v5 = (id)v7[5];
    _Block_object_dispose(&v6, 8);
    objc_storeStrong(&v12, 0);
    v13 = v5;
    objc_msgSend(v5, "_removeActiveFocusLayersForClient:", CFSTR("AXFKATextFieldClient"));
    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

void __69__UIFocusRingManagerAccessibility_removeRingFromFocusItem_forClient___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 40), "manager");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIFocusRingManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  const char *v5;
  id v6;
  id *v7;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = "@";
  v4 = CFSTR("UIFocusRingManager");
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", "@", "@", 0);
  v3 = "v";
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v4, CFSTR("moveRingToFocusItem:forClient:"), v5, v5, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v4, CFSTR("removeRingFromFocusItem:forClient:"), v3, v5, v5, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v4, CFSTR("manager"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_removeActiveFocusLayersForClient:"), v3, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_focusRingPathForItem:inView:"), v5, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_focusItemWantsFocusRing:forClient:"), "B", v5, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_viewToAddFocusLayerForItem:forClient:"), v5, v5, 0);
  objc_storeStrong(v7, v6);
}

+ (Class)shapeLayerClassForItem:(id)a3 client:(id)a4
{
  objc_super v6;
  int v7;
  id v8;
  id location[2];
  id v10;
  id v11;

  v10 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AXSpeakFingerManager")) & 1) == 0)
  {
    if ((_UIAccessibilityFullKeyboardAccessEnabled() & 1) == 0)
    {
      v6.receiver = v10;
      v6.super_class = (Class)&OBJC_METACLASS___UIFocusRingManagerAccessibility;
      v11 = objc_msgSendSuper2(&v6, sel_shapeLayerClassForItem_client_, location[0], v8);
      v7 = 1;
      goto LABEL_6;
    }
    objc_msgSend(v8, "isEqualToString:", CFSTR("AXFKATextFieldClient"));
  }
  v11 = (id)objc_opt_class();
  v7 = 1;
LABEL_6:
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return (Class)v11;
}

- (BOOL)_focusItemWantsFocusRing:(id)a3 forClient:(id)a4
{
  unsigned int v5;
  int v6;
  char v7;
  objc_super v9;
  id v10;
  unsigned __int8 v11;
  id v12;
  id v13;
  char v14;
  id v15;
  char v16;
  id v17;
  id location[2];
  UIFocusRingManagerAccessibility *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16 = objc_msgSend(v17, "isEqualToString:", CFSTR("AXSpeakFingerManager")) & 1;
  v14 = 0;
  objc_opt_class();
  v13 = (id)__UIAccessibilityCastAsClass();
  v12 = v13;
  objc_storeStrong(&v13, 0);
  v15 = v12;
  v11 = 0;
  v7 = 0;
  if ((objc_msgSend(v12, "_accessibilityIsFocusForHoverTextRunningForFocusItem") & 1) != 0)
    v7 = objc_msgSend(v15, "_accessibilityDisplayFocusIndicatorForHoverTextView");
  v11 = v7 & 1;
  v10 = (id)objc_msgSend(v15, "_accessibilityParentView");
  v6 = 1;
  if ((objc_msgSend(v10, "_accessibilityIsFKARunningForFocusItem") & 1) == 0)
  {
    v6 = 1;
    if ((v16 & 1) == 0)
      v6 = v11;
  }
  if ((v6 & 1) != 0)
  {
    v5 = v6;
  }
  else
  {
    v9.receiver = v19;
    v9.super_class = (Class)UIFocusRingManagerAccessibility;
    v5 = -[UIFocusRingManagerAccessibility _focusItemWantsFocusRing:forClient:](&v9, sel__focusItemWantsFocusRing_forClient_, location[0], v17);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v5 != 0;
}

- (id)_focusRingPathForItem:(id)a3 inView:(id)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  objc_super v9;
  int v10;
  id v11;
  BOOL v12;
  uint64_t v13;
  id v14;
  id location[2];
  UIFocusRingManagerAccessibility *v16;
  id v17;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v6 = (id)objc_msgSend(v14, "traitCollection");
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  v13 = v7;
  v12 = 0;
  v8 = 0;
  if (v7 != 3)
    v8 = v13 != 2;
  v12 = v8;
  if (!v8
    || ((v11 = (id)objc_msgSend(location[0], "accessibilityPath")) == 0
      ? (v10 = 0)
      : (v17 = (id)UIAccessibilityConvertAccessibilityPathToViewCoordinates(),
         v10 = 1),
        objc_storeStrong(&v11, 0),
        !v10))
  {
    v9.receiver = v16;
    v9.super_class = (Class)UIFocusRingManagerAccessibility;
    v17 = -[UIFocusRingManagerAccessibility _focusRingPathForItem:inView:](&v9, sel__focusRingPathForItem_inView_, location[0], v14);
    v10 = 1;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v17;
}

+ (void)moveRingToFocusItem:(id)a3 forClient:(id)a4
{
  id v4;
  objc_super v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(_QWORD *, void *);
  void *v11;
  id v12;
  id v13;
  id v14;
  char v15;
  id v16;
  id v17;
  id location[2];
  id v19;
  id v20;
  dispatch_once_t *v21;

  v19 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v15 = 0;
  objc_opt_class();
  v14 = (id)__UIAccessibilityCastAsClass();
  v13 = v14;
  objc_storeStrong(&v14, 0);
  v16 = v13;
  v4 = v13;
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __65__UIFocusRingManagerAccessibility_moveRingToFocusItem_forClient___block_invoke;
  v11 = &unk_24FF3ED08;
  v12 = v13;
  objc_msgSend(v4, "accessibilityEnumerateAncestorsUsingBlock:", &v7);
  v21 = (dispatch_once_t *)&moveRingToFocusItem_forClient__onceToken;
  v20 = 0;
  objc_storeStrong(&v20, &__block_literal_global_20);
  if (*v21 != -1)
    dispatch_once(v21, v20);
  objc_storeStrong(&v20, 0);
  if ((_UIAccessibilityFullKeyboardAccessEnabled() & 1) != 0
    && ((objc_msgSend(v17, "isEqualToString:", CFSTR("FocusEngineClient")) & 1) != 0
     || (objc_msgSend(v17, "isEqualToString:", CFSTR("AXFKATextFieldClient")) & 1) != 0)
    && !_AXSFullKeyboardAccessFocusRingEnabled())
  {
    objc_msgSend(MEMORY[0x24BDF6A60], "removeRingFromFocusItem:forClient:", location[0], v17);
  }
  else
  {
    v6.receiver = v19;
    v6.super_class = (Class)&OBJC_METACLASS___UIFocusRingManagerAccessibility;
    objc_msgSendSuper2(&v6, sel_moveRingToFocusItem_forClient_, location[0], v17);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

void __65__UIFocusRingManagerAccessibility_moveRingToFocusItem_forClient___block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_msgSend(location[0], "_accessibilityRemembersLastFocusedChild") & 1) != 0 && location[0] != (id)a1[4])
    objc_msgSend(location[0], "_axSetLastFocusedChild:", a1[4]);
  objc_storeStrong(location, 0);
}

void __65__UIFocusRingManagerAccessibility_moveRingToFocusItem_forClient___block_invoke_2()
{
  id v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;

  v4 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = *MEMORY[0x24BED2778];
  v3 = (id)objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v0 = (id)objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v2, 0);
  v1 = (void *)moveRingToFocusItem_forClient__FocusRingEnabledObserver;
  moveRingToFocusItem_forClient__FocusRingEnabledObserver = (uint64_t)v0;

}

void __65__UIFocusRingManagerAccessibility_moveRingToFocusItem_forClient___block_invoke_3(void *a1, void *a2)
{
  id v2;
  id v4;
  id v5;
  BOOL v6;
  id v7[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7[1] = a1;
  v4 = (id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v7[0] = (id)objc_msgSend(v4, "_accessibilityNativeFocusElement");

  v6 = _AXSFullKeyboardAccessFocusRingEnabled() != 0;
  if (v7[0])
  {
    if (v6)
      objc_msgSend(MEMORY[0x24BDF6A60], "moveRingToFocusItem:forClient:", v7[0], CFSTR("FocusEngineClient"));
    else
      objc_msgSend(MEMORY[0x24BDF6A60], "removeRingFromFocusItem:forClient:", v7[0], CFSTR("FocusEngineClient"));
  }
  else if (v6)
  {
    v5 = (id)objc_msgSend(MEMORY[0x24BDF6FF8], "_applicationKeyWindow");
    if (v5)
    {
      v2 = (id)objc_msgSend(MEMORY[0x24BDF6A68], "focusSystemForEnvironment:", v5);
      objc_msgSend(v2, "setNeedsFocusUpdate");

    }
    objc_storeStrong(&v5, 0);
  }
  AXPerformSafeBlock();
  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);
}

void __65__UIFocusRingManagerAccessibility_moveRingToFocusItem_forClient___block_invoke_4(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v7 = a1;
  v6 = a1;
  v5 = 0;
  objc_opt_class();
  v2 = (id)objc_msgSend(MEMORY[0x24BDF6FF8], "_applicationKeyWindow");
  v1 = (id)objc_msgSend(v2, "firstResponder");
  v4 = (id)__UIAccessibilityCastAsSafeCategory();

  v3 = v4;
  objc_storeStrong(&v4, 0);
  -[UITextInputUIResponderAccessibility _axDrawFocusRingAroundFirstResponderAndMoveFocus:](v3, 0);

}

@end
