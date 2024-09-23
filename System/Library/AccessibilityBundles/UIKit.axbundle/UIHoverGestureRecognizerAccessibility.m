@implementation UIHoverGestureRecognizerAccessibility

- (int64_t)state
{
  objc_super v3;
  id v4;
  SEL v5;
  UIHoverGestureRecognizerAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIHoverGestureRecognizerAccessibility;
  v4 = -[UIHoverGestureRecognizerAccessibility state](&v3, sel_state);
  if ((uint64_t)v4 <= 0)
    return -[UIHoverGestureRecognizerAccessibility _axSimulatedState]((uint64_t)v6);
  else
    return (int64_t)v4;
}

- (uint64_t)_axSimulatedState
{
  if (a1)
    return __UIAccessibilityGetAssociatedInteger();
  else
    return 0;
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIHoverGestureRecognizer");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (uint64_t)_axIsListeningForNotifications
{
  char v2;

  if (a1)
    v2 = __UIAccessibilityGetAssociatedBool() & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (uint64_t)_axSetIsListeningForNotifications:(uint64_t)result
{
  if (result)
    return __UIAccessibilitySetAssociatedBool();
  return result;
}

- (uint64_t)_axSetSimulatedState:(uint64_t)result
{
  if (result)
    return __UIAccessibilitySetAssociatedInteger();
  return result;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("UIGestureRecognizer");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UIHoverGestureRecognizer"));
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIGestureRecognizer"), CFSTR("_targets"), "NSMutableArray");
  v3 = CFSTR("UIGestureRecognizerTarget");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIGestureRecognizerTarget"), CFSTR("_target"), "@");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIGestureRecognizer"), CFSTR("state"), "q", 0);
  objc_storeStrong(v6, obj);
}

- (void)_accessibilityFocusedElementChanged:(id)a3
{
  id v3;
  id v4;
  id location[2];
  UIHoverGestureRecognizerAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (id)objc_msgSend(location[0], "userInfo");
  v3 = (id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDF7248]);
  -[UIHoverGestureRecognizerAccessibility _accessibilityFocusedElementChangedToElement:](v6, v3);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityFocusedElementChangedToElement:(void *)a1
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  id v10;
  BOOL v11;
  CGRect rect2;
  CGRect rect1;
  BOOL v14;
  id v15;
  int v16;
  id location;
  void *v18;

  v18 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v18)
  {
    v15 = -[UIHoverGestureRecognizerAccessibility _axGesture]((uint64_t)v18);
    v14 = -[UIHoverGestureRecognizerAccessibility _axSimulatedState]((uint64_t)v18) > 0;
    v10 = (id)objc_msgSend(v15, "view");
    objc_msgSend(v10, "accessibilityFrame");
    rect1.origin.x = v2;
    rect1.origin.y = v3;
    rect1.size.width = v4;
    rect1.size.height = v5;

    objc_msgSend(location, "accessibilityFrame");
    rect2.origin.x = v6;
    rect2.origin.y = v7;
    rect2.size.width = v8;
    rect2.size.height = v9;
    CGRectContainsRect(rect1, rect2);
    -[UIHoverGestureRecognizerAccessibility _axSetSimulatedState:]((uint64_t)v18);
    v11 = -[UIHoverGestureRecognizerAccessibility _axSimulatedState]((uint64_t)v18) > 0;
    if (v14 || v11)
      -[UIHoverGestureRecognizerAccessibility _accessibilitySimulateStateChange](v18);
    objc_storeStrong(&v15, 0);
    v16 = 0;
  }
  else
  {
    v16 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (id)_axGesture
{
  id v2;
  id v3;
  char v4;
  uint64_t v5;
  id v6;

  v5 = a1;
  if (a1)
  {
    v4 = 0;
    objc_opt_class();
    v3 = (id)__UIAccessibilityCastAsClass();
    v2 = v3;
    objc_storeStrong(&v3, 0);
    v6 = v2;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_accessibilitySimulateStateChange
{
  uint64_t v1;
  int v2;
  int v3;
  void (*v4)(uint64_t);
  void *v5;
  id v6;
  id v7;
  id v8;
  int v9;
  id v10;
  id v11;
  id v12;

  v12 = a1;
  if (a1)
  {
    v11 = -[UIHoverGestureRecognizerAccessibility _axGesture]((uint64_t)v12);
    v10 = (id)objc_msgSend(v11, "delegate");
    if (v10
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v10, "gestureRecognizerShouldBegin:", v11) & 1) == 0)
    {
      v9 = 1;
    }
    else
    {
      v8 = (id)objc_msgSend(v12, "safeArrayForKey:", CFSTR("_targets"));
      v1 = MEMORY[0x24BDAC760];
      v2 = -1073741824;
      v3 = 0;
      v4 = __74__UIHoverGestureRecognizerAccessibility__accessibilitySimulateStateChange__block_invoke;
      v5 = &unk_24FF3E050;
      v6 = v8;
      v7 = v11;
      AXPerformSafeBlock();
      objc_storeStrong(&v7, 0);
      objc_storeStrong(&v6, 0);
      objc_storeStrong(&v8, 0);
      v9 = 0;
    }
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v11, 0);
  }
}

void __74__UIHoverGestureRecognizerAccessibility__accessibilitySimulateStateChange__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id obj;
  uint64_t v8;
  _QWORD __b[8];
  id v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12 = a1;
  v11 = a1;
  memset(__b, 0, sizeof(__b));
  obj = *(id *)(a1 + 32);
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v13, 16);
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
      v10 = *(id *)(__b[1] + 8 * v4);
      v1 = (id)objc_msgSend(v10, "target");
      objc_msgSend(v1, "performSelector:withObject:", objc_msgSend(v10, "action"), *(_QWORD *)(a1 + 40));

      ++v4;
      if (v2 + 1 >= v5)
      {
        v4 = 0;
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v13, 16);
        if (!v5)
          break;
      }
    }
  }

}

- (void)_axSetOverrideStateEnabled:(id)obj forFocusedElement:
{
  id v3;
  id v4;
  id location;
  char v6;
  void *v7;

  v7 = a1;
  v6 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  if (v7)
  {
    if ((v6 & 1) == 0
      || (-[UIHoverGestureRecognizerAccessibility _axIsListeningForNotifications]((uint64_t)v7) & 1) != 0)
    {
      if ((v6 & 1) == 0
        && (-[UIHoverGestureRecognizerAccessibility _axIsListeningForNotifications]((uint64_t)v7) & 1) != 0)
      {
        -[UIHoverGestureRecognizerAccessibility _axSetIsListeningForNotifications:]((uint64_t)v7);
        v3 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        objc_msgSend(v3, "removeObserver:name:object:", v7, *MEMORY[0x24BDF7238], 0);

        -[UIHoverGestureRecognizerAccessibility _axSetSimulatedState:]((uint64_t)v7);
        -[UIHoverGestureRecognizerAccessibility _accessibilitySimulateStateChange](v7);
      }
    }
    else
    {
      -[UIHoverGestureRecognizerAccessibility _axSetIsListeningForNotifications:]((uint64_t)v7);
      v4 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      objc_msgSend(v4, "addObserver:selector:name:object:", v7, sel__accessibilityFocusedElementChanged_, *MEMORY[0x24BDF7238], 0);

      -[UIHoverGestureRecognizerAccessibility _accessibilityFocusedElementChangedToElement:](v7, location);
    }
  }
  objc_storeStrong(&location, 0);
}

@end
