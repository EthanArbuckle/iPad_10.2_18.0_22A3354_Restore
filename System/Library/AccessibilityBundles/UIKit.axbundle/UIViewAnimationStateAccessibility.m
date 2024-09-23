@implementation UIViewAnimationStateAccessibility

- (void)dealloc
{
  NSObject *log;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id obj;
  uint64_t v8;
  objc_super v9;
  os_log_type_t type;
  os_log_t oslog;
  _QWORD __b[8];
  void *v13;
  SEL v14;
  UIViewAnimationStateAccessibility *v15;
  uint8_t v16[24];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15 = self;
  v14 = a2;
  memset(__b, 0, sizeof(__b));
  obj = -[UIViewAnimationStateAccessibility _accessibilityAnimationTracker](v15);
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
  if (v8)
  {
    v4 = *(_QWORD *)__b[2];
    v5 = 0;
    v6 = v8;
    while (1)
    {
      v3 = v5;
      if (*(_QWORD *)__b[2] != v4)
        objc_enumerationMutation(obj);
      v13 = *(void **)(__b[1] + 8 * v5);
      oslog = (os_log_t)(id)AXLogUIA();
      type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        log = oslog;
        __os_log_helper_16_0_2_8_0_8_0((uint64_t)v16, (uint64_t)v15, (uint64_t)v13);
        _os_log_impl(&dword_230C4A000, log, type, "Animation tracker missed didStop, removing in dealloc: %p:%p", v16, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
      -[UIViewAnimationStateAccessibility _accessibilityMarkAnimationNotInProgress:](v15, v13);
      ++v5;
      if (v3 + 1 >= v6)
      {
        v5 = 0;
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v17, 16);
        if (!v6)
          break;
      }
    }
  }

  v9.receiver = v15;
  v9.super_class = (Class)UIViewAnimationStateAccessibility;
  -[UIViewAnimationStateAccessibility dealloc](&v9, sel_dealloc);
}

- (id)_accessibilityAnimationTracker
{
  if (a1)
    return objc_getAssociatedObject(a1, &__UIViewAnimationState___accessibilityAnimationTracker);
  else
    return 0;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v4;
  id v5;
  id v6;
  objc_super v8;
  id v9;
  BOOL v10;
  id location[2];
  UIViewAnimationStateAccessibility *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = a4;
  v9 = 0;
  if (_AXSAutomationEnabled())
  {
    v4 = (id)-[UIViewAnimationStateAccessibility safeValueForKey:](v12, "safeValueForKey:", CFSTR("_animationID"));
    v5 = v9;
    v9 = v4;

  }
  if (location[0])
  {
    v6 = -[UIViewAnimationStateAccessibility _accessibilityAnimationTracker](v12);
    objc_msgSend(v6, "removeObject:", location[0]);

    -[UIViewAnimationStateAccessibility _accessibilityMarkAnimationNotInProgress:](v12, location[0]);
  }
  v8.receiver = v12;
  v8.super_class = (Class)UIViewAnimationStateAccessibility;
  -[UIViewAnimationStateAccessibility animationDidStop:finished:](&v8, sel_animationDidStop_finished_, location[0], v10);
  if (_AXSAutomationEnabled())
    UIAccessibilityPostNotification(*MEMORY[0x24BEBB1D8], v9);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityMarkAnimationNotInProgress:(void *)a1
{
  id location;
  id v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    objc_msgSend(v3, "_accessibilitySetAnimationsInProgress:", 0);
  objc_storeStrong(&location, 0);
}

- (void)animationDidStart:(id)a3
{
  id v3;
  id v4;
  NSObject *log;
  os_log_type_t v6;
  id v7;
  char v8;
  UIViewAnimationStateAccessibility *v9;
  id v10;
  BOOL v11;
  BOOL v12;
  objc_super v13;
  uint8_t v14[7];
  os_log_type_t type;
  os_log_t oslog;
  BOOL v17;
  id v18;
  id v19;
  uint64_t v20;
  int v21;
  int v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25[2];
  uint64_t v26;
  uint64_t *v27;
  int v28;
  int v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  id v33;
  char v34;
  id v35;
  BOOL v36;
  id location[2];
  UIViewAnimationStateAccessibility *v38;

  v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v36 = location[0] != 0;
  v34 = 0;
  objc_opt_class();
  v26 = 0;
  v27 = &v26;
  v28 = 838860800;
  v29 = 48;
  v30 = __Block_byref_object_copy__26;
  v31 = __Block_byref_object_dispose__26;
  v32 = 0;
  v20 = MEMORY[0x24BDAC760];
  v21 = -1073741824;
  v22 = 0;
  v23 = __55__UIViewAnimationStateAccessibility_animationDidStart___block_invoke;
  v24 = &unk_24FF3DE88;
  v25[1] = &v26;
  v25[0] = v38;
  AXPerformSafeBlock();
  v19 = (id)v27[5];
  objc_storeStrong(v25, 0);
  _Block_object_dispose(&v26, 8);
  objc_storeStrong(&v32, 0);
  v33 = (id)__UIAccessibilityCastAsClass();

  if ((v34 & 1) != 0)
    abort();
  v18 = v33;
  objc_storeStrong(&v33, 0);
  v35 = v18;
  v17 = 0;
  v12 = 0;
  if (v18)
  {
    v12 = 0;
    if ((objc_msgSend(v35, "isUserInteractionEnabled") & 1) != 0)
      v12 = objc_msgSend(v35, "safeIntegerForKey:", CFSTR("_animationState")) == 4;
  }
  v17 = v12;
  if (v12)
    v36 = 0;
  if (_AXSAutomationEnabled())
  {
    v3 = -[UIViewAnimationStateAccessibility _accessibilityAnimationTracker](v38);
    v11 = v3 != 0;

    if (!v11)
    {
      v9 = v38;
      v10 = (id)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      -[UIViewAnimationStateAccessibility _accessibilitySetAnimationTracker:]((uint64_t)v9, v10);

    }
    v7 = -[UIViewAnimationStateAccessibility _accessibilityAnimationTracker](v38);
    v8 = objc_msgSend(v7, "containsObject:", location[0]);

    if ((v8 & 1) != 0)
    {
      oslog = (os_log_t)(id)AXLogUIA();
      type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        v6 = type;
        __os_log_helper_16_0_0(v14);
        _os_log_error_impl(&dword_230C4A000, log, v6, "The same animation was started twice. It's possible this will lead to mismatch animation tracking", v14, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    if (v36)
    {
      v4 = -[UIViewAnimationStateAccessibility _accessibilityAnimationTracker](v38);
      objc_msgSend(v4, "addObject:", location[0]);

    }
  }
  if (v36)
    -[UIViewAnimationStateAccessibility _accessibilitySetAnimationsInProgress:](v38, "_accessibilitySetAnimationsInProgress:", 1);
  v13.receiver = v38;
  v13.super_class = (Class)UIViewAnimationStateAccessibility;
  -[UIViewAnimationStateAccessibility animationDidStart:](&v13, sel_animationDidStart_, location[0]);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

void __55__UIViewAnimationStateAccessibility_animationDidStart___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_outerPropertyAnimator:", 1);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIViewAnimationState");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilitySetAnimationTracker:(uint64_t)a1
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
  const __CFString *v3;
  id obj;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("UIViewAnimationState");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewAnimationState"), CFSTR("_outerPropertyAnimator:"), "@", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewPropertyAnimator"), CFSTR("_animationState"), "q", 0);
  objc_storeStrong(v5, obj);
}

@end
