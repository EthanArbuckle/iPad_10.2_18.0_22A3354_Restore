@implementation UIDictationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIDictationView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
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
  v6 = CFSTR("UIDictationView");
  v7 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v3 = CFSTR("UIKeyboardImpl");
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v3, CFSTR("m_layout"), "UIKeyboardLayout");
  v4 = CFSTR("UIKeyboardLayoutStar");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_accessibilityKeys"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_accessibilityKeyElementForKey:"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("setState:"), v7, "i", 0);
  objc_storeStrong(v9, v8);
}

- (void)setState:(int)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  BOOL v7;
  id location;
  BOOL v9;
  objc_super v10;
  int v11;
  SEL v12;
  UIDictationViewAccessibility *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIDictationViewAccessibility;
  -[UIDictationViewAccessibility setState:](&v10, sel_setState_, a3);
  v9 = 0;
  v7 = 1;
  if (v11 != 3)
    v7 = v11 == 4;
  v9 = v7;
  location = (id)-[UIDictationViewAccessibility _accessibilityValueForKey:](v13, "_accessibilityValueForKey:", CFSTR("kAXDictationThinkingTimer"));
  if (v7)
  {
    if (!location || (objc_msgSend(location, "isActive") & 1) == 0 && (objc_msgSend(location, "isPending") & 1) == 0)
    {
      v5 = objc_alloc(MEMORY[0x24BDFE490]);
      v6 = MEMORY[0x24BDAC9B8];
      v3 = (void *)objc_msgSend(v5, "initWithTargetSerialQueue:");
      v4 = location;
      location = v3;

      objc_msgSend(location, "afterDelay:processBlock:", &__block_literal_global_17, 1.0);
      -[UIDictationViewAccessibility _accessibilitySetRetainedValue:forKey:](v13, "_accessibilitySetRetainedValue:forKey:", location, CFSTR("kAXDictationThinkingTimer"));
    }
  }
  else
  {
    objc_msgSend(location, "cancel");
    -[UIDictationViewAccessibility _accessibilityRemoveValueForKey:](v13, "_accessibilityRemoveValueForKey:", CFSTR("kAXDictationThinkingTimer"));
  }
  objc_storeStrong(&location, 0);
}

void __41__UIDictationViewAccessibility_setState___block_invoke()
{
  UIAccessibilityNotifications notification;
  id v1;

  notification = *MEMORY[0x24BDF71E8];
  v1 = accessibilityLocalizedString(CFSTR("thinking.about.dictation"));
  UIAccessibilityPostNotification(notification, v1);

}

- (void)endpointButtonPressed
{
  objc_super v2;
  SEL v3;
  UIDictationViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIDictationViewAccessibility;
  -[UIDictationViewAccessibility endpointButtonPressed](&v2, sel_endpointButtonPressed);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)finishReturnToKeyboard
{
  void *v2;
  double Current;
  id v4;
  id v5;
  id v6;
  id v7[3];
  uint64_t v8;
  uint64_t *v9;
  int v10;
  int v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(_QWORD *, void *, uint64_t, _BYTE *);
  void *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  int v23;
  int v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  id v28;
  objc_super v29;
  SEL v30;
  UIDictationViewAccessibility *v31;

  v31 = self;
  v30 = a2;
  v29.receiver = self;
  v29.super_class = (Class)UIDictationViewAccessibility;
  -[UIDictationViewAccessibility finishReturnToKeyboard](&v29, sel_finishReturnToKeyboard);
  v5 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v28 = (id)objc_msgSend(v5, "safeValueForKey:", CFSTR("m_layout"));

  v21 = 0;
  v22 = &v21;
  v23 = 838860800;
  v24 = 48;
  v25 = __Block_byref_object_copy__8;
  v26 = __Block_byref_object_dispose__8;
  v27 = 0;
  v4 = (id)objc_msgSend(v28, "safeValueForKey:", CFSTR("_accessibilityKeys"));
  v15 = MEMORY[0x24BDAC760];
  v16 = -1073741824;
  v17 = 0;
  v18 = __54__UIDictationViewAccessibility_finishReturnToKeyboard__block_invoke;
  v19 = &unk_24FF3ECB8;
  v20 = &v21;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v15);

  if (v22[5])
  {
    v8 = 0;
    v9 = &v8;
    v10 = 838860800;
    v11 = 48;
    v12 = __Block_byref_object_copy__8;
    v13 = __Block_byref_object_dispose__8;
    v14 = 0;
    v7[1] = &v8;
    v7[0] = v28;
    v7[2] = &v21;
    AXPerformSafeBlock();
    v6 = (id)v9[5];
    objc_storeStrong(v7, 0);
    _Block_object_dispose(&v8, 8);
    objc_storeStrong(&v14, 0);
    v2 = (void *)v22[5];
    v22[5] = (uint64_t)v6;

  }
  Current = CFAbsoluteTimeGetCurrent();
  if (Current - -[UIApplicationAccessibility _accessibilityLastDictationMagicTapTime]((void *)*MEMORY[0x24BDF74F8]) > 2.0)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)v22[5]);
  _Block_object_dispose(&v21, 8);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
}

void __54__UIDictationViewAccessibility_finishReturnToKeyboard__block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  BOOL v6;
  char v7;
  id v8;
  char v9;
  id v10;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  v9 = 0;
  v7 = 0;
  v6 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (id)objc_msgSend(location[0], "properties");
    v9 = 1;
    v8 = (id)objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDF7978]);
    v7 = 1;
    v6 = objc_msgSend(v8, "intValue") == 4;
  }
  if ((v7 & 1) != 0)

  if ((v9 & 1) != 0)
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), location[0]);
    *a4 = 1;
  }
  objc_storeStrong(location, 0);
}

void __54__UIDictationViewAccessibility_finishReturnToKeyboard__block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_accessibilityKeyElementForKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

@end
