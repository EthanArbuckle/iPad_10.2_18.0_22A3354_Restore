@implementation UIKeyboardStateManagerAccessibility

uint64_t __106___UIKeyboardStateManagerAccessibility_performKeyboardOutput_checkingDelegate_forwardToRemoteInputSource___block_invoke(uint64_t a1)
{
  os_log_t oslog[3];
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  if (AXDoesRequestingClientDeserveAutomation())
  {
    oslog[0] = (os_log_t)(id)AXLogUIA();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v4, *(_QWORD *)(a1 + 32));
      _os_log_impl(&dword_230C4A000, oslog[0], OS_LOG_TYPE_INFO, "Keyboard event handled - processed keyboardOutput: %@", v4, 0xCu);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  return AXUIUnblockKeyboardEntryNotifications();
}

void __77___UIKeyboardStateManagerAccessibility_handleKeyboardInput_executionContext___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(id *, void *);
  void *v7;
  id v8[3];

  v8[2] = a1;
  v8[1] = a1;
  v2 = (id)objc_msgSend(a1[4], "safeValueForKey:", CFSTR("taskQueue"));
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __77___UIKeyboardStateManagerAccessibility_handleKeyboardInput_executionContext___block_invoke_2;
  v7 = &unk_24FF3DB48;
  v8[0] = a1[4];
  objc_msgSend(v2, "addDeferredTask:");

  objc_storeStrong(v8, 0);
}

void __77___UIKeyboardStateManagerAccessibility_handleKeyboardInput_executionContext___block_invoke_2(id *a1, void *a2)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8[1] = a1;
  objc_msgSend(a1[4], "_axSetIsLastKeyBackspace:", 0);
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __77___UIKeyboardStateManagerAccessibility_handleKeyboardInput_executionContext___block_invoke_3;
  v7 = &unk_24FF3DA40;
  v8[0] = location[0];
  AXPerformSafeBlock();
  objc_storeStrong(v8, 0);
  objc_storeStrong(location, 0);
}

uint64_t __77___UIKeyboardStateManagerAccessibility_handleKeyboardInput_executionContext___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "returnExecutionToParent", a1, a1);
}

uint64_t __77___UIKeyboardStateManagerAccessibility_handleKeyboardInput_executionContext___block_invoke_4(void *a1)
{
  NSObject *log;
  os_log_type_t type;
  uint8_t v4[7];
  char v5;
  id location[3];

  location[2] = a1;
  location[1] = a1;
  location[0] = (id)AXLogUIA();
  v5 = 1;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_INFO))
  {
    log = location[0];
    type = v5;
    __os_log_helper_16_0_0(v4);
    _os_log_impl(&dword_230C4A000, log, type, "Never received keyboard finish task - unblock remaining notifications", v4, 2u);
  }
  objc_storeStrong(location, 0);
  return AXUIUnblockKeyboardEntryNotifications();
}

void __63___UIKeyboardStateManagerAccessibility__axShowKeyboardIfHidden__block_invoke(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("presentationDelegate"));
  objc_msgSend(v1, "showKeyboard");

}

void __82___UIKeyboardStateManagerAccessibility__axResetFKAFocusToFirstResponderOnDelegate__block_invoke(uint64_t a1)
{
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
  v2 = -[_UIKeyboardStateManagerAccessibility _accessibilityKeyboardInputDelegate](*(void **)(a1 + 32));
  v4 = (id)__UIAccessibilityCastAsSafeCategory();

  v3 = v4;
  objc_storeStrong(&v4, 0);
  -[UITextInputUIResponderAccessibility _axResetFKAFocusToFirstResponder](v3);

}

uint64_t __71___UIKeyboardStateManagerAccessibility__axUpdateAutocorrectionSettings__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAutocorrectionEnabled:", *(_BYTE *)(a1 + 48) & 1);
  return objc_msgSend(*(id *)(a1 + 40), "setAutocorrectSpellingEnabled:", *(_BYTE *)(a1 + 48) & 1);
}

uint64_t __77___UIKeyboardStateManagerAccessibility__axRegisterForVoiceOverNotifications___block_invoke(id *a1)
{
  uint64_t result;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v3;
  NSObject *log;
  os_log_type_t type;
  uint8_t v7[7];
  char v8;
  id location[3];

  location[2] = a1;
  location[1] = a1;
  result = objc_msgSend(a1[4], "_axIsObservingVoiceOverNotifications");
  if ((result & 1) == 0)
  {
    location[0] = (id)VOTLogHandwriting();
    v8 = 2;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
    {
      log = location[0];
      type = v8;
      __os_log_helper_16_0_0(v7);
      _os_log_debug_impl(&dword_230C4A000, log, type, "Registering UIKeyboard for handwriting notifications", v7, 2u);
    }
    objc_storeStrong(location, 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, a1[4], (CFNotificationCallback)voiceOverDidEnableHandwriting, (CFStringRef)*MEMORY[0x24BE00468], 0, CFNotificationSuspensionBehaviorCoalesce);
    v3 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v3, a1[4], (CFNotificationCallback)voiceOverDidDisableHandwriting, (CFStringRef)*MEMORY[0x24BE00460], 0, CFNotificationSuspensionBehaviorCoalesce);
    return objc_msgSend(a1[4], "_axSetIsObservingVoiceOverNotifications:", 1);
  }
  return result;
}

@end
