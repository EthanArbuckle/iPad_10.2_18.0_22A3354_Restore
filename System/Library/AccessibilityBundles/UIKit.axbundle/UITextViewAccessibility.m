@implementation UITextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const char *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const __CFString *v13;
  const __CFString *v14;
  const char *v15;
  const __CFString *v16;
  const char *v17;
  id v18;
  id *v19;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v19 = location;
  v18 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = CFSTR("UITextView");
  v11 = "B";
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", 0);
  v15 = "@";
  v17 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("setAttributedText:"), "@", 0);
  v12 = "{_NSRange=QQ}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("setSelectedRange:"), v17, "{_NSRange=QQ}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("keyboardInput: shouldInsertText: isMarkedText:"), v15, v15, v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("keyboardInput: shouldReplaceTextInRange: replacementText:"), v11, v15, v12, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("keyboardInputChangedSelection:"), v17, v15, 0);
  v10 = "{CGRect={CGPoint=dd}{CGSize=dd}}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("visibleTextRect"), 0);
  v6 = "Q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("marginTop"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("setAttributedPlaceholder:"), v17, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v16, CFSTR("_placeholderLabel"), "UILabel");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v16, CFSTR("UIResponder"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("canBecomeFocused"), v11, 0);
  v9 = CFSTR("_UITextKit2LayoutController");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v16, CFSTR("_textLayoutController"), "_UITextLayoutControllerBase<_UITextLayoutController>");
  v3 = CFSTR("_UITextKit1LayoutController");
  v4 = CFSTR("layoutManager");
  objc_msgSend(location[0], "validateClass:hasProperty:withType:");
  v5 = CFSTR("canAccessLayoutManager");
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", v3);
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", v9, v4, v15);
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", v9, v5, v11);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("_textInteractableItemAtPoint:precision:"), v15, "{CGPoint=dd}", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("interactionAssistant"), v15, 0);
  v7 = CFSTR("UITextInteractionAssistant");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("linkInteraction"), v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UITextSimpleLinkInteraction"), CFSTR("contextMenuInteraction"), v15, 0);
  objc_msgSend(location[0], "validateClass:", CFSTR("_UITextMenuLinkInteraction"));
  v8 = CFSTR("_UITextInteractableItem");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("invokeDefaultAction"), v17, 0);
  objc_msgSend(location[0], "validateClass:", v9);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("boundingRectForCharacterRange:"), v10, v12, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", CFSTR("UIKeyboard"), CFSTR("presentsInlineTextCompletionAsMarkedText"), v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UITextKitTextRange"), CFSTR("asRange"), v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardImpl"), CFSTR("inlineTextCompletionController"), v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIInlineTextCompletionController"), CFSTR("lastAcceptedTextCompletion"), v15, 0);
  v13 = CFSTR("_UIInlineTextCompletion");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v13, CFSTR("input"), v15, 0);
  v14 = CFSTR("_UITextInteractableLinkItem");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, CFSTR("link"), v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("replaceAnimatedTextPlaceholderWith:"), v17, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("removeAnimatedTextPlaceholders"), v17, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, CFSTR("insertAnimatedTextPlaceholderAtLocation:numLines:"), v17, v15, "d", 0);
  objc_storeStrong(v19, v18);
}

- (uint64_t)_axDidRegisterForDDNotification
{
  char v2;

  if (a1)
    v2 = __UIAccessibilityGetAssociatedBool() & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (uint64_t)_axSetDidRegisterForDDNotification:(uint64_t)result
{
  if (result)
    return __UIAccessibilitySetAssociatedBool();
  return result;
}

- (uint64_t)_axRegisterForDDNotificationIfNeeded
{
  id v1;
  uint64_t v2;

  v2 = result;
  if (result)
  {
    result = -[UITextViewAccessibility _axDidRegisterForDDNotification](result);
    if ((result & 1) == 0)
    {
      v1 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      objc_msgSend(v1, "addObserver:selector:name:object:", v2, sel__axDidFinishDataDetectorURLification_, CFSTR("DataDetectorsUIDidFinishURLificationNotification"), v2);

      return -[UITextViewAccessibility _axSetDidRegisterForDDNotification:](v2);
    }
  }
  return result;
}

- (unint64_t)_accessibilityAutomationType
{
  return 52;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;
  SEL v3;
  UITextViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UITextViewAccessibility;
  -[UITextViewAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  -[UITextViewAccessibility _axRegisterForDDNotificationIfNeeded]((uint64_t)v4);
}

- (void)dealloc
{
  id v2;
  objc_super v3;
  SEL v4;
  UITextViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v2 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v2, "removeObserver:name:object:", v5, CFSTR("DataDetectorsUIDidFinishURLificationNotification"), v5);

  v3.receiver = v5;
  v3.super_class = (Class)UITextViewAccessibility;
  -[UITextViewAccessibility dealloc](&v3, sel_dealloc);
}

- (void)_axClearCachedLinkData
{
  void *v1;

  v1 = result;
  if (result)
  {
    objc_msgSend(result, "_accessibilitySetRetainedValue:forKey:");
    return (void *)objc_msgSend(v1, "_accessibilitySetRetainedValue:forKey:", 0, CFSTR("AXOnlyHasOneLink"));
  }
  return result;
}

- (void)_axDidFinishDataDetectorURLification:(id)a3
{
  id v3;
  id location[2];
  UITextViewAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (_AXSInUnitTestMode())
  {
    v3 = (id)-[UITextViewAccessibility _accessibilityValueForKey:](v5, "_accessibilityValueForKey:", CFSTR("UnitTestDataDetectionDoneBlock"));
    if (v3)
      (*((void (**)(void))v3 + 2))();
    objc_storeStrong(&v3, 0);
  }
  -[UITextViewAccessibility _axClearCachedLinkData](v5);
  -[UITextViewAccessibility _accessibilitySetRetainedValue:forKey:](v5, "_accessibilitySetRetainedValue:forKey:");
  -[UITextViewAccessibility _accessibilitySetRetainedValue:forKey:](v5, "_accessibilitySetRetainedValue:forKey:", 0, *MEMORY[0x24BEBB308]);
  objc_storeStrong(location, 0);
}

- (_NSRange)_accessibilitySelectedTextRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[UITextViewAccessibility selectedRange](self, "selectedRange", a2, self, 0, 0);
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)_accessibilityDataDetectorScheme:(CGPoint)a3
{
  id v4;
  id v5;

  v4 = (id)-[UITextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("webView"));
  v5 = (id)objc_msgSend(v4, "_accessibilityDataDetectorScheme:", a3.x, a3.y);

  return v5;
}

- (void)setAttributedText:(id)a3
{
  UIAccessibilityNotifications notification;
  id v4;
  char v5;
  objc_super v6;
  id location[2];
  UITextViewAccessibility *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[UITextViewAccessibility _axClearCachedLinkData](v8);
  -[UITextViewAccessibility _accessibilitySetRetainedValue:forKey:](v8, "_accessibilitySetRetainedValue:forKey:", 0, CFSTR("AXParagraphLinkRotor"));
  -[UITextViewAccessibility _accessibilitySetRetainedValue:forKey:](v8, "_accessibilitySetRetainedValue:forKey:", 0, *MEMORY[0x24BEBB308]);
  v6.receiver = v8;
  v6.super_class = (Class)UITextViewAccessibility;
  -[UITextViewAccessibility setAttributedText:](&v6, sel_setAttributedText_, location[0]);
  v5 = -[UITextViewAccessibility isFirstResponder](v8, "isFirstResponder") & 1;
  if (!location[0]
    || (-[UITextViewAccessibility safeBoolForKey:](v8, "safeBoolForKey:", CFSTR("hasText")) & 1) == 0 && (v5 & 1) != 0)
  {
    notification = *MEMORY[0x24BEBB1D0];
    v9[0] = *MEMORY[0x24BDFF118];
    v10[0] = MEMORY[0x24BDBD1C8];
    v9[1] = *MEMORY[0x24BDFF120];
    v10[1] = MEMORY[0x24BDBD1C8];
    v4 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    UIAccessibilityPostNotification(notification, v4);

  }
  objc_storeStrong(location, 0);
}

- (void)setSelectedRange:(_NSRange)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  SEL v11;
  UITextViewAccessibility *v12;
  _NSRange v13;

  v13 = a3;
  v12 = self;
  v11 = a2;
  v10 = 0;
  if ((-[UITextViewAccessibility isFirstResponder](self, "isFirstResponder") & 1) == 0
    || (v8 = -[UITextViewAccessibility selectedRange](v12, "selectedRange"), v9 = v3, v8 == v13.location)
    && (v6 = -[UITextViewAccessibility selectedRange](v12, "selectedRange"), v7 = v4, v4 == v13.length))
  {
    MEMORY[0x2348C39BC](*MEMORY[0x24BEBB0B0]);
    v10 = 1;
  }
  v5.receiver = v12;
  v5.super_class = (Class)UITextViewAccessibility;
  -[UITextViewAccessibility setSelectedRange:](&v5, sel_setSelectedRange_, v13.location, v13.length);
  if ((v10 & 1) != 0)
    MEMORY[0x2348C39BC](0);
}

- (BOOL)resignFirstResponder
{
  objc_super v3;
  char v4;
  SEL v5;
  UITextViewAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UITextViewAccessibility;
  v4 = -[UITextViewAccessibility resignFirstResponder](&v3, sel_resignFirstResponder);
  -[UITextViewAccessibility _axClearCachedLinkData](v6);
  return v4 & 1;
}

- (double)_accessibilityFontSize
{
  double v2;
  id v4;
  double v5;

  v4 = (id)-[UITextViewAccessibility font](self, "font");
  objc_msgSend(v4, "pointSize");
  v5 = v2;

  return v5;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat v4;
  CGFloat v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id obj;
  uint64_t v12;
  BOOL v13;
  objc_super v14;
  CGRect rect;
  CGPoint point;
  id v17;
  _QWORD __b[8];
  id v19;
  int v20;
  id v21;
  id *v22;
  char v23;
  uint64_t v24;
  int v25;
  int v26;
  BOOL (*v27)(uint64_t);
  void *v28;
  UITextViewAccessibility *v29;
  char v30;
  id location[2];
  UITextViewAccessibility *v32;
  CGPoint v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;

  v36 = *MEMORY[0x24BDAC8D0];
  v33 = a3;
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v30 = -[UITextViewAccessibility _accessibilityBoolValueForKey:](v32, "_accessibilityBoolValueForKey:", CFSTR("AXInHitTestOverride")) & 1;
  v23 = 0;
  v13 = 0;
  if (!v30)
  {
    v24 = MEMORY[0x24BDAC760];
    v25 = -1073741824;
    v26 = 0;
    v27 = __59__UITextViewAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v28 = &unk_24FF3E0C0;
    v29 = v32;
    v23 = 1;
    v22 = (id *)&v29;
    v13 = v27((uint64_t)&v24);
  }
  if (v13)
  {
    -[UITextViewAccessibility _accessibilitySetBoolValue:forKey:](v32, "_accessibilitySetBoolValue:forKey:", 1);
    v21 = (id)-[UITextViewAccessibility accessibilityHitTest:withEvent:](v32, "accessibilityHitTest:withEvent:", location[0], v33.x, v33.y);
    -[UITextViewAccessibility _accessibilitySetBoolValue:forKey:](v32, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXInHitTestOverride"));
    v34 = v21;
    v20 = 1;
    objc_storeStrong(&v21, 0);
  }
  else
  {
    v20 = 0;
  }
  if ((v23 & 1) != 0)
    objc_storeStrong(v22, 0);
  if (!v20)
  {
    if (!_AXSAutomationEnabled())
      goto LABEL_24;
    memset(__b, 0, sizeof(__b));
    obj = -[UITextViewAccessibility automationElements](v32, "automationElements");
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v35, 16);
    if (v12)
    {
      v8 = *(_QWORD *)__b[2];
      v9 = 0;
      v10 = v12;
      while (1)
      {
        v7 = v9;
        if (*(_QWORD *)__b[2] != v8)
          objc_enumerationMutation(obj);
        v19 = *(id *)(__b[1] + 8 * v9);
        v17 = (id)objc_msgSend(v19, "_accessibilityHitTest:withEvent:", location[0], v33.x, v33.y);
        if (v17)
        {
          v34 = v17;
          v20 = 1;
        }
        else
        {
          UIAccessibilityPointForPoint();
          point.x = v4;
          point.y = v5;
          objc_msgSend(v19, "accessibilityFrame");
          rect = v37;
          if (CGRectContainsPoint(v37, point))
          {
            v34 = v19;
            v20 = 1;
          }
          else
          {
            v20 = 0;
          }
        }
        objc_storeStrong(&v17, 0);
        if (v20)
          break;
        ++v9;
        if (v7 + 1 >= v10)
        {
          v9 = 0;
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v35, 16);
          if (!v10)
            goto LABEL_22;
        }
      }
    }
    else
    {
LABEL_22:
      v20 = 0;
    }

    if (!v20)
    {
LABEL_24:
      v14.receiver = v32;
      v14.super_class = (Class)UITextViewAccessibility;
      v34 = -[UITextViewAccessibility _accessibilityHitTest:withEvent:](&v14, sel__accessibilityHitTest_withEvent_, location[0], v33.x, v33.y);
      v20 = 1;
    }
  }
  objc_storeStrong(location, 0);
  return v34;
}

BOOL __59__UITextViewAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v4;
  NSObject *log;
  os_log_type_t type;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  id v12;
  IMP Implementation;
  Method InstanceMethod;
  uint64_t v15;
  uint64_t v16;
  id location;
  dispatch_once_t *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v15 = a1;
  v18 = (dispatch_once_t *)&UIKBEmojiZeroWidthJoiner_block_invoke_onceToken_4;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_49);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  Implementation = 0;
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    v12 = (id)AXLogCommon();
    v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      type = v11;
      v8 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v2);
      v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)UIKBEmojiZeroWidthJoiner_block_invoke_BaseImplementation_4;
}

void __59__UITextViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v3;
  NSObject *log;
  os_log_type_t type;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  id v11;
  Method InstanceMethod;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    UIKBEmojiZeroWidthJoiner_block_invoke_BaseImplementation_4 = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      v3 = v7;
      v9 = v3;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (void)_accessibilitySetValue:(id)a3
{
  id v3;
  char v4;
  id v5;
  id v6;
  id v7;
  int v8;
  id location[2];
  UITextViewAccessibility *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
    v3 = (id)objc_msgSend(v7, "textInputTraits");
    v4 = objc_msgSend(v3, "contentsIsSingleValue");

    v5 = (id)objc_msgSend(v7, "textInputTraits");
    objc_msgSend(v5, "setContentsIsSingleValue:", 1);

    -[UITextViewAccessibility setText:](v10, "setText:", location[0]);
    v6 = (id)objc_msgSend(v7, "textInputTraits");
    objc_msgSend(v6, "setContentsIsSingleValue:", v4 & 1);

    -[UITextViewAccessibility keyboardInputChanged:](v10, "keyboardInputChanged:");
    objc_storeStrong(&v7, 0);
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  objc_storeStrong(location, 0);
}

- (id)_accessibilitySupplementaryHeaderViews
{
  return (id)-[UITextViewAccessibility _accessibleNonSupplementarySubviews](self, "_accessibleNonSupplementarySubviews", a2, self);
}

- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSUInteger length;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v15;
  id v16;
  objc_super v17;
  int v18;
  id location;
  id v20;
  _NSRange *v21;
  SEL v22;
  UITextViewAccessibility *v23;
  id v24;
  NSUInteger v25;
  NSUInteger v26;

  v23 = self;
  v22 = a2;
  v21 = a3;
  v20 = (id)-[UITextViewAccessibility _accessibilityAXAttributedValue](self, "_accessibilityAXAttributedValue");
  location = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (void *)objc_msgSend((id)objc_msgSend(v20, "cfAttributedString"), "mutableCopy");
    v4 = location;
    location = v3;

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (void *)objc_msgSend(v20, "mutableCopy");
      v6 = location;
      location = v5;

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v24 = 0;
        v18 = 1;
        goto LABEL_13;
      }
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v20);
      v8 = location;
      location = v7;

    }
  }
  length = v21->length;
  v25 = v21->location;
  v26 = length;
  if (v25 + length <= objc_msgSend(location, "length"))
  {
    v16 = (id)objc_msgSend(location, "attributedSubstringFromRange:", v21->location, v21->length);
    v10 = (void *)objc_msgSend(v16, "mutableCopy");
    v11 = location;
    location = v10;

  }
  if (!location)
  {
    v17.receiver = v23;
    v17.super_class = (Class)UITextViewAccessibility;
    v15 = -[UITextViewAccessibility _accessibilityAttributedValueForRange:](&v17, sel__accessibilityAttributedValueForRange_, v21);
    v12 = (void *)objc_msgSend(v15, "mutableCopy");
    v13 = location;
    location = v12;

  }
  -[UITextViewAccessibility _accessibilityAddAutoCorrectionAttributes:](v23, "_accessibilityAddAutoCorrectionAttributes:", location);
  -[UITextViewAccessibility _accessibilityConvertStyleAttributesToAccessibility:](v23, "_accessibilityConvertStyleAttributesToAccessibility:", location);
  -[UITextViewAccessibility _accessibilityAddMispellingsToAttributedString:](v23, "_accessibilityAddMispellingsToAttributedString:", location);
  v24 = location;
  v18 = 1;
LABEL_13:
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v20, 0);
  return v24;
}

- (BOOL)_accessibilityOverridesPotentiallyAttributedAPISelector:(SEL)a3
{
  objc_class *v3;
  objc_super v5;
  Method InstanceMethod;
  SEL name;
  SEL v8;
  UITextViewAccessibility *v9;
  id location;
  dispatch_once_t *v12;

  v9 = self;
  v8 = a2;
  name = a3;
  v12 = (dispatch_once_t *)&_accessibilityOverridesPotentiallyAttributedAPISelector__onceToken_1;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_342);
  if (*v12 != -1)
    dispatch_once(v12, location);
  objc_storeStrong(&location, 0);
  v3 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v3, name);
  if (name == sel_accessibilityValue)
    return InstanceMethod != (Method)_accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityValueBaseMethod_0;
  if (name == sel_accessibilityAttributedValue)
    return InstanceMethod != (Method)_accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedValueBaseMethod_0;
  v5.receiver = v9;
  v5.super_class = (Class)UITextViewAccessibility;
  return -[UITextViewAccessibility _accessibilityOverridesPotentiallyAttributedAPISelector:](&v5, sel__accessibilityOverridesPotentiallyAttributedAPISelector_, name);
}

Method __83__UITextViewAccessibility__accessibilityOverridesPotentiallyAttributedAPISelector___block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  Method result;

  v0 = (objc_class *)objc_opt_class();
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityValueBaseMethod_0 = (uint64_t)class_getInstanceMethod(v0, sel_accessibilityValue);
  v1 = (objc_class *)objc_opt_class();
  result = class_getInstanceMethod(v1, sel_accessibilityAttributedValue);
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedValueBaseMethod_0 = (uint64_t)result;
  return result;
}

- (id)_accessibilityGetValue
{
  return -[UITextViewAccessibility _accessibilityGetValue:](self, "_accessibilityGetValue:", 0, a2, self);
}

- (id)_accessibilityGetValue:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v17;
  id v18;
  id v19;
  char v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  char v28;
  id v29;
  BOOL v30;
  id v31;
  id v32;
  id v33;
  id v34;
  char v35;
  id v36;
  int v38;
  char v39;
  id v40;
  id v41;
  char v42;
  char v43;
  id v44;
  char v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  id v53;
  char v54;
  id v55;
  id v56;
  BOOL v57;
  SEL v58;
  UITextViewAccessibility *v59;
  id v60;
  uint64_t v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x24BDAC8D0];
  v59 = self;
  v58 = a2;
  v57 = a3;
  v56 = 0;
  v3 = (id)-[UITextViewAccessibility accessibilityUserDefinedValue](self, "accessibilityUserDefinedValue");
  v30 = v3 == 0;

  if (!v30)
  {
    v4 = (id)-[UITextViewAccessibility accessibilityUserDefinedValue](v59, "accessibilityUserDefinedValue");
    v5 = v56;
    v56 = v4;

LABEL_30:
    v36 = (id)-[UITextViewAccessibility safeValueForKey:](v59, "safeValueForKey:", CFSTR("textInputTraits"));
    v19 = (id)objc_msgSend(v36, "safeValueForKey:", CFSTR("isSecureTextEntry"));
    v20 = objc_msgSend(v19, "BOOLValue");

    if ((v20 & 1) != 0)
    {
      v35 = 0;
      objc_opt_class();
      v34 = (id)__UIAccessibilityCastAsClass();
      v33 = v34;
      objc_storeStrong(&v34, 0);
      v14 = -[UIView _accessibilitySecureTextForString:]((uint64_t)v33, v56);
      v15 = v56;
      v56 = v14;

    }
    if (!objc_msgSend(v56, "length"))
    {
      v32 = -[UITextViewAccessibility accessibilityPlaceholderValue](v59, "accessibilityPlaceholderValue");
      if (v32)
      {
        v31 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA60]), "initWithString:", v32);
        v17 = v31;
        v61 = *MEMORY[0x24BDFEC10];
        v62[0] = MEMORY[0x24BDBD1C8];
        v18 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
        objc_msgSend(v17, "setAttributes:");

        objc_storeStrong(&v56, v31);
        objc_storeStrong(&v31, 0);
      }
      objc_storeStrong(&v32, 0);
    }
    v60 = v56;
    v38 = 1;
    objc_storeStrong(&v36, 0);
    goto LABEL_37;
  }
  v54 = 0;
  objc_opt_class();
  v29 = (id)-[UITextViewAccessibility safeValueForKey:](v59, "safeValueForKey:", CFSTR("attributedText"));
  v53 = (id)__UIAccessibilityCastAsClass();

  v52 = v53;
  objc_storeStrong(&v53, 0);
  v55 = v52;
  v51 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v27 = (id)objc_msgSend(v51, "delegate");
  v28 = objc_msgSend(v27, "isEqual:", v59);

  if ((v28 & 1) == 0
    || (objc_msgSend(MEMORY[0x24BDF6B18], "safeBoolForKey:", CFSTR("presentsInlineTextCompletionAsMarkedText")) & 1) == 0)
  {
    goto LABEL_23;
  }
  v24 = (id)objc_msgSend(v51, "inlineCompletionAsMarkedText");
  v50 = (id)objc_msgSend(v24, "string");

  v26 = (id)objc_msgSend(v51, "inputDelegate");
  v25 = (id)objc_msgSend(v26, "markedTextRange");
  v48 = objc_msgSend(v25, "safeRangeForKey:", CFSTR("asRange"));
  v49 = v6;

  v45 = 0;
  v43 = 0;
  if (v48 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    v46 = (id)objc_msgSend(v55, "string");
    v45 = 1;
    v44 = (id)objc_msgSend(v46, "substringWithRange:", v48, v49);
    v43 = 1;
    v7 = v44;
  }
  v47 = v7;
  if ((v43 & 1) != 0)

  if ((v45 & 1) != 0)
  v42 = objc_msgSend(v47, "isEqualToString:", v50) & 1;
  v21 = (void *)MEMORY[0x24BDFEA60];
  v22 = (id)objc_msgSend(v55, "string");
  v41 = (id)objc_msgSend(v21, "axAttributedStringWithString:");

  v23 = (id)objc_msgSend(v51, "safeValueForKeyPath:", CFSTR("inlineTextCompletionController.lastAcceptedTextCompletion"));
  v40 = (id)objc_msgSend(v23, "safeStringForKey:", CFSTR("candidate"));

  v39 = 0;
  if (!v50)
    goto LABEL_40;
  if (v47 && (v42 & 1) != 0)
  {
    objc_msgSend(v41, "setAttribute:forKey:withRange:", v50, *MEMORY[0x24BDFEAA8], v48, v49);
    v39 = 1;
  }
  else
  {
LABEL_40:
    if (v40)
    {
      objc_msgSend(v41, "setAttribute:forKey:", v40, *MEMORY[0x24BDFEA98]);
      v39 = 1;
    }
  }
  if (objc_msgSend(v41, "length") && (v39 & 1) != 0)
  {
    v60 = v41;
    v38 = 1;
  }
  else
  {
    v38 = 0;
  }
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v50, 0);
  if (!v38)
  {
LABEL_23:
    if (v55)
    {
      if (objc_msgSend(v55, "length"))
      {
        v10 = (id)UIAccessibilityConvertAttachmentsInAttributedStringToAX();
        v11 = v56;
        v56 = v10;

        if (!v56)
        {
          v12 = (id)objc_msgSend(v55, "string");
          v13 = v56;
          v56 = v12;

        }
      }
    }
    else
    {
      v8 = (id)-[UITextViewAccessibility safeValueForKey:](v59, "safeValueForKey:", CFSTR("text"));
      v9 = v56;
      v56 = v8;

    }
    v38 = 0;
  }
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v55, 0);
  if (!v38)
    goto LABEL_30;
LABEL_37:
  objc_storeStrong(&v56, 0);
  return v60;
}

- (id)accessibilityValue
{
  if ((-[UITextViewAccessibility _axIsOnlyOneLinkElement](self) & 1) != 0)
    return 0;
  else
    return -[UITextViewAccessibility _accessibilityGetValue](self, "_accessibilityGetValue");
}

- (uint64_t)_axIsOnlyOneLinkElement
{
  id v1;
  uint64_t v2;
  id v4;
  id v5;
  BOOL v6;
  BOOL v7;
  id v8;
  BOOL v9;
  id location;
  uint64_t v11;
  uint64_t v12;
  id v13;
  char v14;
  int v15;
  id v16;
  id v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v18 = a1;
  if (a1)
  {
    if (objc_msgSend(v18, "isEditable") & 1)
    {
      v19 = 0;
    }
    else
    {
      v16 = (id)objc_msgSend(v18, "_accessibilityValueForKey:", CFSTR("AXOnlyHasOneLink"));
      if (v16)
      {
        v19 = objc_msgSend(v16, "BOOLValue") & 1;
        v15 = 1;
      }
      else
      {
        v14 = 0;
        v8 = (id)objc_msgSend(v18, "_accessibilityInternalTextLinks");
        v9 = objc_msgSend(v8, "count") != 1;

        if (!v9)
        {
          v13 = (id)objc_msgSend(v18, "attributedText");
          v11 = 0;
          v12 = 0;
          location = (id)objc_msgSend(v13, "attributesAtIndex:effectiveRange:", 0, &v11);
          v1 = (id)objc_msgSend(location, "objectForKey:", *MEMORY[0x24BEBB388]);
          v7 = v1 == 0;

          if (!v7)
          {
            v2 = objc_msgSend(v13, "length");
            v25 = 0;
            v24 = v2;
            v26 = 0;
            v27 = v2;
            v22 = v11;
            v23 = v12;
            v20 = 0;
            v21 = v2;
            v6 = 0;
            if (!v11)
              v6 = v23 == v21;
            if (v6)
              v14 = 1;
          }
          objc_storeStrong(&location, 0);
          objc_storeStrong(&v13, 0);
        }
        v4 = v18;
        v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v14 & 1);
        objc_msgSend(v4, "_accessibilitySetRetainedValue:forKey:");

        -[UITextViewAccessibility _axRegisterForDDNotificationIfNeeded]((uint64_t)v18);
        v19 = v14 & 1;
        v15 = 1;
      }
      objc_storeStrong(&v16, 0);
    }
  }
  else
  {
    v19 = 0;
  }
  return v19 & 1;
}

- (id)accessibilityAttributedValue
{
  id location[2];
  UITextViewAccessibility *v4;
  id v5;

  v4 = self;
  location[1] = (id)a2;
  if ((-[UITextViewAccessibility _axIsOnlyOneLinkElement](self) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    location[0] = -[UITextViewAccessibility _accessibilityGetValue](v4, "_accessibilityGetValue");
    if ((objc_msgSend(location[0], "isAXAttributedString") & 1) != 0)
    {
      v5 = (id)objc_msgSend(location[0], "cfAttributedString");
    }
    else if (location[0])
    {
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", location[0]);
    }
    else
    {
      v5 = 0;
    }
    objc_storeStrong(location, 0);
  }
  return v5;
}

- (id)accessibilityLabel
{
  objc_super v3;
  SEL v4;
  UITextViewAccessibility *v5;
  id v6;

  v5 = self;
  v4 = a2;
  if ((-[UITextViewAccessibility _axIsOnlyOneLinkElement](self) & 1) != 0)
  {
    v6 = -[UITextViewAccessibility _accessibilityGetValue:](v5, "_accessibilityGetValue:", 1);
  }
  else
  {
    v3.receiver = v5;
    v3.super_class = (Class)UITextViewAccessibility;
    v6 = -[UITextViewAccessibility accessibilityLabel](&v3, sel_accessibilityLabel);
  }
  return v6;
}

- (id)accessibilityPlaceholderValue
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  id v13[2];
  UITextViewAccessibility *v14;

  v14 = self;
  v13[1] = (id)a2;
  v13[0] = 0;
  v11 = 0;
  objc_opt_class();
  v8 = (id)-[UITextViewAccessibility safeValueForKey:](v14, "safeValueForKey:", CFSTR("_placeholderLabel"));
  v10 = (id)__UIAccessibilityCastAsClass();

  v9 = v10;
  objc_storeStrong(&v10, 0);
  v12 = v9;
  if ((objc_msgSend(v9, "_accessibilityViewIsVisible") & 1) != 0)
  {
    v2 = (id)objc_msgSend(v12, "accessibilityLabel");
    v3 = v13[0];
    v13[0] = v2;

    v4 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v13[0]);
    v5 = v13[0];
    v13[0] = v4;

    objc_msgSend(v13[0], "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEC10]);
  }
  v7 = v13[0];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  return v7;
}

- (void)setAttributedPlaceholder:(id)a3
{
  id v3;
  objc_super v4;
  id location[2];
  UITextViewAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)UITextViewAccessibility;
  -[UITextViewAccessibility setAttributedPlaceholder:](&v4, sel_setAttributedPlaceholder_, location[0]);
  v3 = (id)-[UITextViewAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("_placeholderLabel"));
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  id v2;
  id v4;
  BOOL v5;
  BOOL v7;

  v2 = (id)-[UITextViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v5 = v2 == 0;

  if (v5)
    return !-[UITextViewAccessibility _accessibilityTextViewShouldBreakUpParagraphs](self, "_accessibilityTextViewShouldBreakUpParagraphs")&& ((-[UITextViewAccessibility _accessibilityViewIsVisible](self, "_accessibilityViewIsVisible") & 1) != 0|| AXDoesRequestingClientDeserveAutomation());
  v4 = (id)-[UITextViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v7 = objc_msgSend(v4, "BOOLValue") & 1;

  return v7;
}

- (BOOL)accessibilityActivate
{
  id v3;
  id v4;
  id v5;
  BOOL v6;
  objc_super v7;
  id v8;
  id v9;
  char v10;
  id v11[2];
  UITextViewAccessibility *v12;
  char v13;

  v12 = self;
  v11[1] = (id)a2;
  v5 = -[UITextViewAccessibility _accessibilityInternalTextLinks](self, "_accessibilityInternalTextLinks");
  v6 = objc_msgSend(v5, "count") != 1;

  if (v6)
  {
    v7.receiver = v12;
    v7.super_class = (Class)UITextViewAccessibility;
    v13 = -[UITextViewAccessibility accessibilityActivate](&v7, sel_accessibilityActivate);
  }
  else
  {
    v10 = 0;
    objc_opt_class();
    v4 = -[UITextViewAccessibility _accessibilityInternalTextLinks](v12, "_accessibilityInternalTextLinks");
    v3 = (id)objc_msgSend(v4, "firstObject");
    v9 = (id)__UIAccessibilityCastAsClass();

    v8 = v9;
    objc_storeStrong(&v9, 0);
    v11[0] = v8;
    v13 = -[UITextViewAccessibility _accessibilityActivateLink:](v12, v8) & 1;
    objc_storeStrong(v11, 0);
  }
  return v13 & 1;
}

- (uint64_t)_accessibilityActivateLink:(void *)a1
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26[2];
  int v27;
  int v28;
  void (*v29)(_QWORD *);
  void *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  char v38;
  id v39;
  id v40;
  id v41[2];
  int v42;
  int v43;
  void (*v44)(uint64_t);
  void *v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  int v58;
  id location;
  id v60;
  char v61;

  v60 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v60)
  {
    if (objc_msgSend(v60, "_accessibilityActivateTextViewLink:", location) & 1)
    {
      v61 = 1;
      v58 = 1;
    }
    else
    {
      v56 = (id)objc_msgSend(v60, "safeValueForKey:", CFSTR("delegate"));
      if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
      {
        v54 = objc_msgSend(location, "range");
        v55 = v2;
        v53 = 0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v19 = v60;
          v20 = (id)objc_msgSend(location, "url");
          v53 = objc_msgSend(v56, "textView:shouldInteractWithURL:inRange:interaction:", v19) & 1;

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v17 = v60;
          v18 = (id)objc_msgSend(location, "url");
          v53 = objc_msgSend(v56, "textView:shouldInteractWithURL:inRange:", v17) & 1;

        }
        if ((v53 & 1) != 0)
        {
          v52 = (id)objc_msgSend(location, "textRangeForTextView:", v60);
          v50 = 0u;
          v51 = 0u;
          objc_msgSend(v60, "firstRectForRange:", v52);
          *(_QWORD *)&v50 = v3;
          *((_QWORD *)&v50 + 1) = v4;
          *(_QWORD *)&v51 = v5;
          *((_QWORD *)&v51 + 1) = v6;
          v41[1] = (id)MEMORY[0x24BDAC760];
          v42 = -1073741824;
          v43 = 0;
          v44 = __54__UITextViewAccessibility__accessibilityActivateLink___block_invoke;
          v45 = &unk_24FF3FA30;
          v46 = v60;
          v48 = v50;
          v49 = v51;
          v47 = location;
          AXPerformSafeBlock();
          objc_storeStrong(&v47, 0);
          objc_storeStrong(&v46, 0);
          objc_storeStrong(&v52, 0);
        }
        v61 = v53 & 1;
        v58 = 1;
      }
      else
      {
        v41[0] = (id)objc_msgSend(v60, "safeValueForKeyPath:", CFSTR("interactionAssistant.linkInteraction"));
        NSClassFromString(CFSTR("_UITextSimpleLinkInteraction"));
        v38 = 0;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v39 = (id)objc_msgSend(v41[0], "safeValueForKey:", CFSTR("contextMenuInteraction"));
          v38 = 1;
          v7 = v39;
        }
        else
        {
          v7 = 0;
        }
        v40 = v7;
        if ((v38 & 1) != 0)

        if (v41[0] && v40)
        {
          v37 = (id)objc_msgSend(location, "textRangeForTextView:", v60);
          v35 = 0u;
          v36 = 0u;
          objc_msgSend(v60, "firstRectForRange:", v37);
          *(_QWORD *)&v35 = v8;
          *((_QWORD *)&v35 + 1) = v9;
          *(_QWORD *)&v36 = v10;
          *((_QWORD *)&v36 + 1) = v11;
          objc_msgSend(v41[0], "_accessibilitySetBoolValue:forKey:", 1);
          v26[1] = (id)MEMORY[0x24BDAC760];
          v27 = -1073741824;
          v28 = 0;
          v29 = __54__UITextViewAccessibility__accessibilityActivateLink___block_invoke_2;
          v30 = &unk_24FF3FA30;
          v31 = v60;
          v33 = v35;
          v34 = v36;
          v32 = v40;
          AXPerformSafeBlock();
          objc_msgSend(v41[0], "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXIsPerformingSimpleTap"));
          v61 = 1;
          v58 = 1;
          objc_storeStrong(&v32, 0);
          objc_storeStrong(&v31, 0);
          objc_storeStrong(&v37, 0);
        }
        else
        {
          v26[0] = (id)objc_msgSend(location, "textRangeForTextView:", v60);
          objc_msgSend(v60, "firstRectForRange:", v26[0]);
          *(_QWORD *)&v24 = v12;
          *((_QWORD *)&v24 + 1) = v13;
          *(_QWORD *)&v25 = v14;
          *((_QWORD *)&v25 + 1) = v15;
          v21 = v60;
          v22 = v24;
          v23 = v25;
          AXPerformSafeBlock();
          v61 = 1;
          v58 = 1;
          objc_storeStrong(&v21, 0);
          objc_storeStrong(v26, 0);
        }
        objc_storeStrong(&v40, 0);
        objc_storeStrong(v41, 0);
      }
      objc_storeStrong(&v56, 0);
    }
  }
  else
  {
    v61 = 0;
    v58 = 1;
  }
  objc_storeStrong(&location, 0);
  return v61 & 1;
}

void __54__UITextViewAccessibility__accessibilityActivateLink___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  id v3;
  char v4;
  id v5;
  void *v7;
  id v8;
  id v9;
  char v10;
  double v11;
  double v12;
  id v13[3];

  v13[2] = (id)a1;
  v13[1] = (id)a1;
  v7 = *(void **)(a1 + 32);
  AX_CGRectGetCenter();
  v11 = v1;
  v12 = v2;
  v13[0] = (id)objc_msgSend(v7, "_textInteractableItemAtPoint:precision:", 0, v1, v2);
  NSClassFromString(CFSTR("_UITextInteractableLinkItem"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = 0;
    objc_opt_class();
    v5 = (id)objc_msgSend(v13[0], "safeValueForKey:", CFSTR("link"));
    v9 = (id)__UIAccessibilityCastAsClass();

    v8 = v9;
    objc_storeStrong(&v9, 0);
    v3 = (id)objc_msgSend(*(id *)(a1 + 40), "url");
    v4 = objc_msgSend(v8, "isEqual:");

    if ((v4 & 1) != 0)
      objc_msgSend(v13[0], "invokeDefaultAction");
  }
  objc_storeStrong(v13, 0);
}

void __54__UITextViewAccessibility__accessibilityActivateLink___block_invoke_2(_QWORD *a1)
{
  double v1;
  double v2;
  void *v3;
  id v5[3];

  v5[2] = a1;
  v5[1] = a1;
  v3 = (void *)a1[4];
  AX_CGRectGetCenter();
  v5[0] = (id)objc_msgSend(v3, "_textInteractableItemAtPoint:precision:", 0, v1, v2);
  objc_msgSend(v5[0], "setContextMenuInteraction:", a1[5]);
  objc_msgSend(v5[0], "invokeDefaultAction");
  objc_storeStrong(v5, 0);
}

uint64_t __54__UITextViewAccessibility__accessibilityActivateLink___block_invoke_3(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v8;
  void *v9;
  void *v11;

  v8 = *(void **)(a1 + 32);
  AX_CGRectGetCenter();
  objc_msgSend(v8, "startInteractionWithLinkAtPoint:", v1, v2);
  v9 = *(void **)(a1 + 32);
  AX_CGRectGetCenter();
  objc_msgSend(v9, "updateInteractionWithLinkAtPoint:", v3, v4);
  v11 = *(void **)(a1 + 32);
  AX_CGRectGetCenter();
  return objc_msgSend(v11, "validateInteractionWithLinkAtPoint:", v5, v6);
}

- (BOOL)accessibilityContainsOneLink
{
  return -[UITextViewAccessibility _axIsOnlyOneLinkElement](self) & 1;
}

- (unint64_t)accessibilityTraits
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v6;
  id v7;
  BOOL v8;
  id v9;
  uint64_t v10;
  BOOL v11;
  id v12;
  id v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  SEL v20;
  UITextViewAccessibility *v21;

  v21 = self;
  v20 = a2;
  v2 = (id)-[UITextViewAccessibility accessibilityUserDefinedTraits](self, "accessibilityUserDefinedTraits");
  v11 = v2 == 0;

  if (!v11)
  {
    v9 = (id)-[UITextViewAccessibility accessibilityUserDefinedTraits](v21, "accessibilityUserDefinedTraits");
    v10 = objc_msgSend(v9, "unsignedLongLongValue");

    v19 = v10;
    if (v10 != *MEMORY[0x24BDFEF48])
      return v19;
  }
  if ((-[UITextViewAccessibility _axIsOnlyOneLinkElement](v21) & 1) != 0)
    return *MEMORY[0x24BDF73D8];
  v18 = -[UITextViewAccessibility isEditable](v21, "isEditable") & 1;
  v17 = 0;
  if (v18)
    v17 = *MEMORY[0x24BEBB198] | *MEMORY[0x24BDFF000];
  else
    v17 = *MEMORY[0x24BDF7410] | *MEMORY[0x24BDFF000];
  v6 = (id)-[UITextViewAccessibility safeValueForKey:](v21, "safeValueForKey:", CFSTR("selectedRange"));
  v15 = objc_msgSend(v6, "rangeValue");
  v16 = v3;

  v7 = (id)-[UITextViewAccessibility safeValueForKey:](v21, "safeValueForKey:", CFSTR("isEditing"));
  v8 = 0;
  if ((objc_msgSend(v7, "BOOLValue") & 1) != 0)
    v8 = v15 != 0x7FFFFFFFFFFFFFFFLL;

  if (v8
    && (_AXSMossdeepEnabled()
     || (objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityHardwareKeyboardActive") & 1) != 0
     || (objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySoftwareKeyboardActive") & 1) != 0))
  {
    v17 |= *MEMORY[0x24BEBB128];
  }
  v14 = 0;
  objc_opt_class();
  v13 = (id)__UIAccessibilityCastAsClass();
  v12 = v13;
  objc_storeStrong(&v13, 0);
  v4 = -[UIView _accessibilityTextAreaTraits](v12);
  v17 |= v4;

  return v17;
}

- (id)_accessibilityForegroundTextColorAttribute
{
  return (id)-[UITextViewAccessibility textColor](self, "textColor", a2, self);
}

- (id)accessibilityElements
{
  objc_super v3;
  SEL v4;
  UITextViewAccessibility *v5;
  id v6;

  v5 = self;
  v4 = a2;
  if (-[UITextViewAccessibility _accessibilityTextViewShouldBreakUpParagraphs](self, "_accessibilityTextViewShouldBreakUpParagraphs"))
  {
    v6 = -[UITextViewAccessibility _accessibilityParagraphElements](v5);
  }
  else
  {
    v3.receiver = v5;
    v3.super_class = (Class)UITextViewAccessibility;
    v6 = -[UITextViewAccessibility accessibilityElements](&v3, sel_accessibilityElements);
  }
  return v6;
}

- (id)_accessibilityParagraphElements
{
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t, void *, void *, void *, void *, void *, uint64_t);
  void *v11;
  id v12;
  id v13;
  id v14[3];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  void (*v20)(_QWORD *, void *, uint64_t, uint64_t, void *, void *);
  void *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  _QWORD v26[2];
  int v27;
  int v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  int v34;
  int v35;
  void (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  id v39;
  id v40;
  char v41;
  id v42;
  int v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v45 = a1;
  if (a1)
  {
    v44 = (id)objc_msgSend(v45, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
    if (v44)
    {
      v46 = v44;
      v43 = 1;
    }
    else
    {
      v41 = 0;
      objc_opt_class();
      v40 = (id)__UIAccessibilityCastAsClass();
      v39 = v40;
      objc_storeStrong(&v40, 0);
      v42 = v39;
      if (v39)
      {
        v32 = 0;
        v33 = &v32;
        v34 = 838860800;
        v35 = 48;
        v36 = __Block_byref_object_copy__24;
        v37 = __Block_byref_object_dispose__24;
        v38 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v26[0] = 0;
        v26[1] = v26;
        v27 = 838860800;
        v28 = 48;
        v29 = __Block_byref_object_copy__24;
        v30 = __Block_byref_object_dispose__24;
        v31 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v25 = (id)objc_msgSend(v45, "_accessibilityAXAttributedValue");
        v6 = (id)objc_msgSend(v42, "text");
        v4 = (id)objc_msgSend(v42, "text");
        v5 = objc_msgSend(v4, "length");
        v52 = 0;
        v51 = v5;
        v53 = 0;
        v54 = v5;
        v23 = 0;
        v24 = v5;
        v17 = MEMORY[0x24BDAC760];
        v18 = -1073741824;
        v19 = 0;
        v20 = __58__UITextViewAccessibility__accessibilityParagraphElements__block_invoke;
        v21 = &unk_24FF3FAF8;
        v22 = v26;
        objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 1, &v17);

        v2 = v25;
        v3 = objc_msgSend(v25, "length");
        v48 = 0;
        v47 = v3;
        v49 = 0;
        v50 = v3;
        v15 = 0;
        v16 = v3;
        v7 = MEMORY[0x24BDAC760];
        v8 = -1073741824;
        v9 = 0;
        v10 = __58__UITextViewAccessibility__accessibilityParagraphElements__block_invoke_2;
        v11 = &unk_24FF3FB20;
        v14[1] = v26;
        v12 = v45;
        v13 = v25;
        v14[0] = v42;
        v14[2] = &v32;
        objc_msgSend(v2, "enumerateSubstringsInRange:options:usingBlock:", v15, v16, 1, &v7);
        if (objc_msgSend((id)v33[5], "count"))
          objc_msgSend(v45, "_accessibilitySetRetainedValue:forKey:", v33[5], *MEMORY[0x24BEBB308]);
        v46 = (id)v33[5];
        v43 = 1;
        objc_storeStrong(v14, 0);
        objc_storeStrong(&v13, 0);
        objc_storeStrong(&v12, 0);
        objc_storeStrong(&v25, 0);
        _Block_object_dispose(v26, 8);
        objc_storeStrong(&v31, 0);
        _Block_object_dispose(&v32, 8);
        objc_storeStrong(&v38, 0);
      }
      else
      {
        v46 = MEMORY[0x24BDBD1A8];
        v43 = 1;
      }
      objc_storeStrong(&v42, 0);
    }
    objc_storeStrong(&v44, 0);
  }
  else
  {
    v46 = 0;
  }
  return v46;
}

- (id)_accessibilityTextSelectionRectWithLargestVisualRangeFromCandidates:(void *)a1
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id obj;
  uint64_t v23;
  CGRect r2;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect r1;
  _QWORD __b[8];
  id v31;
  double v32;
  id v33;
  id v34;
  id v35;
  char v36;
  id v37;
  int v38;
  id location;
  id v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;
  CGRect v44;

  v43 = *MEMORY[0x24BDAC8D0];
  v40 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v40)
  {
    v36 = 0;
    objc_opt_class();
    v35 = (id)__UIAccessibilityCastAsClass();
    v34 = v35;
    objc_storeStrong(&v35, 0);
    v37 = v34;
    v33 = 0;
    v32 = 0.0;
    memset(__b, 0, sizeof(__b));
    obj = location;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v42, 16);
    if (v23)
    {
      v19 = *(_QWORD *)__b[2];
      v20 = 0;
      v21 = v23;
      while (1)
      {
        v18 = v20;
        if (*(_QWORD *)__b[2] != v19)
          objc_enumerationMutation(obj);
        v31 = *(id *)(__b[1] + 8 * v20);
        v16 = v37;
        objc_msgSend(v31, "rect");
        v25 = v2;
        v26 = v3;
        v27 = v4;
        v28 = v5;
        v17 = (id)objc_msgSend(v37, "superview");
        objc_msgSend(v16, "convertRect:toView:", v25, v26, v27, v28);
        r1.origin.x = v6;
        r1.origin.y = v7;
        r1.size.width = v8;
        r1.size.height = v9;

        objc_msgSend(v40, "frame");
        r2.origin.x = v10;
        r2.origin.y = v11;
        r2.size.width = v12;
        r2.size.height = v13;
        v44 = CGRectIntersection(r1, r2);
        v14 = v44.size.width * v44.size.height;
        if (v44.size.width * v44.size.height > v32)
        {
          v32 = v44.size.width * v44.size.height;
          objc_storeStrong(&v33, v31);
        }
        ++v20;
        if (v18 + 1 >= v21)
        {
          v20 = 0;
          v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v42, 16, v14);
          if (!v21)
            break;
        }
      }
    }

    v41 = v33;
    v38 = 1;
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v37, 0);
  }
  else
  {
    v41 = 0;
    v38 = 1;
  }
  objc_storeStrong(&location, 0);
  return v41;
}

- (id)accessibilityDragSourceDescriptors
{
  double v2;
  double v3;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  int v15;
  id v16[2];
  UITextViewAccessibility *v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16[1] = (id)a2;
  v16[0] = (id)-[UITextViewAccessibility accessibilityUserDefinedDragSourceDescriptors](self, "accessibilityUserDefinedDragSourceDescriptors");
  if (v16[0])
  {
    v18 = v16[0];
    v15 = 1;
  }
  else
  {
    v13 = 0;
    objc_opt_class();
    v12 = (id)__UIAccessibilityCastAsClass();
    v11 = v12;
    objc_storeStrong(&v12, 0);
    v14 = v11;
    v10 = (id)objc_msgSend(v11, "selectedTextRange");
    if (v10 && (objc_msgSend(v10, "isEmpty") & 1) == 0)
    {
      v9 = (id)objc_msgSend(v14, "selectionRectsForRange:", v10);
      v8 = -[UITextViewAccessibility _accessibilityTextSelectionRectWithLargestVisualRangeFromCandidates:](v17, v9);
      if (v8)
      {
        v5 = objc_alloc(MEMORY[0x24BDF67B0]);
        v7 = accessibilityLocalizedString(CFSTR("drag.selection"));
        objc_msgSend(v8, "rect");
        UIRectGetCenter();
        v6 = (id)objc_msgSend(v5, "initWithName:point:inView:", v7, v14, v2, v3);
        v19[0] = v6;
        v18 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);

      }
      else
      {
        v18 = MEMORY[0x24BDBD1A8];
      }
      v15 = 1;
      objc_storeStrong(&v8, 0);
      objc_storeStrong(&v9, 0);
    }
    else
    {
      v18 = MEMORY[0x24BDBD1A8];
      v15 = 1;
    }
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(v16, 0);
  return v18;
}

- (id)accessibilityDropPointDescriptors
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
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
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  id v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  char v44;
  id v45;
  int v46;
  id v47[2];
  UITextViewAccessibility *v48;
  id v49;
  id v50;
  id v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v48 = self;
  v47[1] = (id)a2;
  v47[0] = (id)-[UITextViewAccessibility accessibilityUserDefinedDropPointDescriptors](self, "accessibilityUserDefinedDropPointDescriptors");
  if (!v47[0])
  {
    v44 = 0;
    objc_opt_class();
    v43 = (id)__UIAccessibilityCastAsClass();
    v42 = v43;
    objc_storeStrong(&v43, 0);
    v45 = v42;
    v41 = (id)objc_msgSend(v42, "textDropDelegate");
    if ((objc_msgSend(v45, "isEditable") & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0)
    {
      v49 = MEMORY[0x24BDBD1A8];
      v46 = 1;
LABEL_15:
      objc_storeStrong(&v41, 0);
      objc_storeStrong(&v45, 0);
      goto LABEL_16;
    }
    v40 = (id)objc_msgSend(v45, "selectedTextRange");
    if (v40)
    {
      if ((objc_msgSend(v40, "isEmpty") & 1) != 0)
      {
        v23 = v45;
        v24 = (id)objc_msgSend(v40, "start");
        objc_msgSend(v23, "caretRectForPosition:");
        v36 = v2;
        v37 = v3;
        v38 = v4;
        v39 = v5;

        UIRectGetCenter();
        v34 = v6;
        v35 = v7;
        v25 = objc_alloc(MEMORY[0x24BDF67B0]);
        v27 = accessibilityLocalizedString(CFSTR("drop.at.point"));
        v26 = (id)objc_msgSend(v25, "initWithName:point:inView:", v34, v35);
        v52[0] = v26;
        v49 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 1);

        v46 = 1;
LABEL_14:
        objc_storeStrong(&v40, 0);
        goto LABEL_15;
      }
      v33 = (id)objc_msgSend(v45, "selectionRectsForRange:", v40);
      v32 = -[UITextViewAccessibility _accessibilityTextSelectionRectWithLargestVisualRangeFromCandidates:](v48, v33);
      if (v32)
      {
        v20 = objc_alloc(MEMORY[0x24BDF67B0]);
        v22 = accessibilityLocalizedString(CFSTR("drop.on.selection"));
        objc_msgSend(v32, "rect");
        UIRectGetCenter();
        v21 = (id)objc_msgSend(v20, "initWithName:point:inView:", v22, v45, v8, v9);
        v51 = v21;
        v49 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);

        v46 = 1;
      }
      else
      {
        v46 = 0;
      }
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
      if (v46)
        goto LABEL_14;
    }
    v15 = v45;
    objc_msgSend(v45, "frame");
    UIRectGetCenter();
    v28 = v10;
    v29 = v11;
    v16 = (id)objc_msgSend(v45, "superview");
    objc_msgSend(v15, "convertPoint:fromView:", v28, v29);
    v30 = v12;
    v31 = v13;

    v17 = objc_alloc(MEMORY[0x24BDF67B0]);
    v19 = accessibilityLocalizedString(CFSTR("drop.into.text"));
    v18 = (id)objc_msgSend(v17, "initWithName:point:inView:", v30, v31);
    v50 = v18;
    v49 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);

    v46 = 1;
    goto LABEL_14;
  }
  v49 = v47[0];
  v46 = 1;
LABEL_16:
  objc_storeStrong(v47, 0);
  return v49;
}

- (CGPoint)accessibilityActivationPoint
{
  unint64_t v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  id v15;
  id v16;
  __int128 v17;
  double v18;
  double v19;
  CGRect v20;
  id location[2];
  UITextViewAccessibility *v22;
  __int128 v23;
  CGPoint result;

  v22 = self;
  location[1] = (id)a2;
  v2 = -[UITextViewAccessibility accessibilityTraits](self, "accessibilityTraits");
  if ((v2 & *MEMORY[0x24BEBB128]) != 0)
  {
    location[0] = (id)-[UITextViewAccessibility selectedTextRange](v22, "selectedTextRange");
    v16 = (id)objc_msgSend(location[0], "start");
    -[UITextViewAccessibility caretRectForPosition:](v22, "caretRectForPosition:");

    if (location[0] && (objc_msgSend(location[0], "isEmpty") & 1) == 0)
      -[UITextViewAccessibility firstRectForRange:](v22, "firstRectForRange:", location[0]);
    UIAccessibilityFrameForBounds();
    v20.origin.x = v3;
    v20.origin.y = v4;
    v20.size.width = v5;
    v20.size.height = v6;
    CGRectGetMidX(v20);
    CGRectGetMidY(v20);
    CGPointMake_11();
    *(_QWORD *)&v23 = v7;
    *((_QWORD *)&v23 + 1) = v8;
    objc_storeStrong(location, 0);
  }
  else
  {
    v15 = (id)-[UITextViewAccessibility safeValueForKey:](v22, "safeValueForKey:", CFSTR("visibleTextRect"));
    objc_msgSend(v15, "rectValue");
    v18 = v9;
    v19 = v10;

    if (AX_CGSizeIsEmpty_0(v18, v19))
      -[UITextViewAccessibility bounds](v22, "bounds");
    -[UITextViewAccessibility safeIntegerForKey:](v22, "safeIntegerForKey:", CFSTR("marginTop"));
    UIAccessibilityFrameForBounds();
    *(_QWORD *)&v17 = v11;
    *((_QWORD *)&v17 + 1) = v12;
    v23 = v17;
  }
  v14 = *((double *)&v23 + 1);
  v13 = *(double *)&v23;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  __int128 v13;
  __int128 v14;
  _BYTE v16[32];
  CGRect v17;
  CGRect v18;
  CGRect result;

  -[UITextViewAccessibility safeCGRectForKey:](self, "safeCGRectForKey:", CFSTR("visibleTextRect"));
  if (AX_CGSizeIsEmpty_0(v2, v3))
    -[UITextViewAccessibility bounds](self, "bounds");
  UIAccessibilityFrameForBounds();
  *(double *)v16 = v5;
  *(double *)&v16[8] = v4;
  *(_QWORD *)&v16[16] = v6;
  *(_QWORD *)&v16[24] = v7;
  if (v5 < 0.0 || v4 < 0.0)
  {
    v12 = (id)-[UITextViewAccessibility _accessibilityWindow](self, "_accessibilityWindow");
    objc_msgSend(v12, "frame");
    v18 = CGRectIntersection(v17, *(CGRect *)v16);
    *(CGFloat *)&v13 = v18.origin.x;
    *((_QWORD *)&v13 + 1) = *(_QWORD *)&v18.origin.y;
    *(CGFloat *)&v14 = v18.size.width;
    *((_QWORD *)&v14 + 1) = *(_QWORD *)&v18.size.height;
    *(_OWORD *)v16 = v13;
    *(_OWORD *)&v16[16] = v14;

  }
  v9 = *(double *)&v16[8];
  v8 = *(double *)v16;
  v11 = *(double *)&v16[24];
  v10 = *(double *)&v16[16];
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  double v3;
  double v4;
  UITextViewAccessibility *v5;
  objc_super v6;
  double v7;
  double v8;
  BOOL v9;
  SEL v10;
  UITextViewAccessibility *v11;
  CGPoint v12;

  v12 = a3;
  v11 = self;
  v10 = a2;
  -[UITextViewAccessibility safeCGPointForKey:](self, "safeCGPointForKey:", CFSTR("contentOffset"));
  v7 = v3;
  v8 = v4;
  v9 = !__CGPointEqualToPoint_2(v12.x, v12.y, v3, v4);
  v6.receiver = v11;
  v6.super_class = (Class)UITextViewAccessibility;
  -[UITextViewAccessibility setContentOffset:](&v6, sel_setContentOffset_, v12.x, v12.y);
  if (v9)
  {
    v5 = v11;
    AXPerformBlockAsynchronouslyOnMainThread();
    objc_storeStrong((id *)&v5, 0);
  }
}

void __44__UITextViewAccessibility_setContentOffset___block_invoke(uint64_t a1)
{
  if (_AXSAuditInspectionModeEnabled()
    && (objc_msgSend(*(id *)(a1 + 32), "isAccessibilityElement") & 1) != 0
    || UIAccessibilityIsSwitchControlRunning()
    && (objc_msgSend(*(id *)(a1 + 32), "_accessibilityTextViewShouldBreakUpParagraphs") & 1) != 0)
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  }
}

- (BOOL)keyboardInput:(id)a3 shouldReplaceTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  char v6;
  objc_super v8;
  char v9;
  id v10;
  id location[2];
  UITextViewAccessibility *v12;
  _NSRange v13;

  v13 = a4;
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a5);
  v9 = 0;
  v8.receiver = v12;
  v8.super_class = (Class)UITextViewAccessibility;
  v9 = -[UITextViewAccessibility keyboardInput:shouldReplaceTextInRange:replacementText:](&v8, sel_keyboardInput_shouldReplaceTextInRange_replacementText_, location[0], v13.location, v13.length, v10);
  if (!v9)
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAFE0], 0);
  v6 = v9;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  char v6;
  objc_super v9;
  char v10;
  BOOL v11;
  id v12;
  id location[2];
  UITextViewAccessibility *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11 = a5;
  v10 = 0;
  v9.receiver = v14;
  v9.super_class = (Class)UITextViewAccessibility;
  v10 = -[UITextViewAccessibility keyboardInput:shouldInsertText:isMarkedText:](&v9, sel_keyboardInput_shouldInsertText_isMarkedText_, location[0], v12, a5);
  if ((v10 & 1) == 0)
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAFE0], 0);
  v6 = v10;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;
  id v10[2];
  UITextViewAccessibility *v11;
  _NSRange v12;
  _NSRange v13;
  NSUInteger location;
  uint64_t v15;

  v12 = a3;
  v11 = self;
  v10[1] = (id)a2;
  v10[0] = (id)-[UITextViewAccessibility _accessibilityAXAttributedValue](self, "_accessibilityAXAttributedValue");
  if (!v10[0])
  {
    v10[0] = (id)-[UITextViewAccessibility _accessibilityAXAttributedLabel](v11, "_accessibilityAXAttributedLabel");

  }
  v9 = 0;
  if (AXIsDictationListening())
  {
    AXHandleUserInteractionForDictation(1);
    v9 = 1;
  }
  v8 = v11;
  if (v12.length || (location = v12.location, v15 = 0, v12.location > objc_msgSend(v10[0], "length")))
  {
    if (v12.length)
      -[NSObject _accessibilitySetTextSelection:](v11, v12.location, v12.length);
  }
  else
  {
    objc_msgSend(v8, "setSelectedRange:", v12.location, v12.length);
    if ((objc_msgSend(v8, "isEditing") & 1) == 0)
    {
      v6 = (id)objc_msgSend(v8, "beginningOfDocument");
      v5 = (id)objc_msgSend(v8, "positionFromPosition:offset:");
      v4 = (id)objc_msgSend(v8, "beginningOfDocument");
      v13 = v12;
      v3 = (id)objc_msgSend(v8, "positionFromPosition:offset:");
      v7 = (id)objc_msgSend(v8, "textRangeFromPosition:toPosition:", v5);

      objc_msgSend(v8, "setSelectedTextRange:", v7);
      objc_storeStrong(&v7, 0);
    }
  }
  if ((v9 & 1) != 0)
    AXHandleUserInteractionForDictation(0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v10, 0);
}

- (BOOL)_allowCustomActionHintSpeakOverride
{
  return 1;
}

- (id)_accessibilityAttributedTextRetrieval
{
  return (id)-[UITextViewAccessibility attributedText](self, "attributedText", a2, self);
}

- (id)accessibilityCustomRotors
{
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
  objc_super v14;
  id v15[2];
  UITextViewAccessibility *v16;

  v16 = self;
  v15[1] = (id)a2;
  v15[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = v15[0];
  v14.receiver = v16;
  v14.super_class = (Class)UITextViewAccessibility;
  v13 = -[UITextViewAccessibility accessibilityCustomRotors](&v14, sel_accessibilityCustomRotors);
  objc_msgSend(v12, "axSafelyAddObjectsFromArray:");

  if (-[UITextViewAccessibility _accessibilityTextViewShouldBreakUpParagraphs](v16, "_accessibilityTextViewShouldBreakUpParagraphs"))
  {
    v10 = v15[0];
    v11 = -[UITextViewAccessibility _accessibilityParagraphLinksCustomRotor](v16);
    objc_msgSend(v10, "axSafelyAddObject:");

  }
  else
  {
    v8 = v15[0];
    v9 = (id)-[UITextViewAccessibility _accessibilityInternalTextLinkCustomRotors](v16, "_accessibilityInternalTextLinkCustomRotors");
    objc_msgSend(v8, "axSafelyAddObjectsFromArray:");

    if ((-[UITextViewAccessibility isEditable](v16, "isEditable") & 1) != 0)
    {
      v6 = v15[0];
      v7 = (id)-[UITextViewAccessibility _accessibilityCommonStylingRotors](v16, "_accessibilityCommonStylingRotors");
      objc_msgSend(v6, "axSafelyAddObjectsFromArray:");

      if (!AXUIKeyboardTypeSupportsMisspelledRotor(-[UITextViewAccessibility keyboardType](v16, "keyboardType")))
      {
        v4 = v15[0];
        v5 = (id)-[UITextViewAccessibility _accessibilityMisspelledRotor](v16, "_accessibilityMisspelledRotor");
        objc_msgSend(v4, "removeObject:");

      }
    }
  }
  v3 = v15[0];
  objc_storeStrong(v15, 0);
  return v3;
}

- (id)_accessibilityParagraphLinksCustomRotor
{
  id v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id obj;
  uint64_t v10;
  void *v11;
  id v12;
  BOOL v13;
  id v14;
  _QWORD __b[8];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  id (*v21)(id *, void *);
  void *v22;
  id v23;
  id location;
  id v25;
  char v26;
  id v27;
  void *v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v28 = a1;
  if (a1)
  {
    v14 = -[UITextViewAccessibility _accessibilityParagraphElements](v28);
    v26 = 0;
    v13 = 0;
    if (objc_msgSend(v14, "count"))
    {
      v27 = -[UITextViewAccessibility _accessibilityParagraphElementsWithLinks](v28);
      v26 = 1;
      v13 = objc_msgSend(v27, "count") != 0;
    }
    if ((v26 & 1) != 0)

    if (v13)
    {
      v25 = (id)objc_msgSend(v28, "_accessibilityValueForKey:", CFSTR("AXParagraphLinkRotor"));
      if (!v25)
      {
        objc_initWeak(&location, v28);
        v12 = objc_alloc(MEMORY[0x24BDF6790]);
        v18 = MEMORY[0x24BDAC760];
        v19 = -1073741824;
        v20 = 0;
        v21 = __66__UITextViewAccessibility__accessibilityParagraphLinksCustomRotor__block_invoke;
        v22 = &unk_24FF3FAD0;
        objc_copyWeak(&v23, &location);
        v11 = (void *)objc_msgSend(v12, "initWithSystemType:itemSearchBlock:", 1, &v18);
        v1 = v25;
        v25 = v11;

        v17 = 0;
        memset(__b, 0, sizeof(__b));
        obj = -[UITextViewAccessibility _accessibilityParagraphElementsWithLinks](v28);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
        if (v10)
        {
          v6 = *(_QWORD *)__b[2];
          v7 = 0;
          v8 = v10;
          while (1)
          {
            v5 = v7;
            if (*(_QWORD *)__b[2] != v6)
              objc_enumerationMutation(obj);
            v16 = *(_QWORD *)(__b[1] + 8 * v7);
            v3 = (id)-[_AXUITextViewParagraphElement links](v16);
            v4 = objc_msgSend(v3, "count");
            v17 += v4;

            ++v7;
            if (v5 + 1 >= v8)
            {
              v7 = 0;
              v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
              if (!v8)
                break;
            }
          }
        }

        objc_msgSend(v25, "setLinkCount:", v17);
        objc_msgSend(v28, "_accessibilitySetRetainedValue:forKey:", v25, CFSTR("AXParagraphLinkRotor"));
        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);
      }
      v29 = v25;
      objc_storeStrong(&v25, 0);
    }
    else
    {
      v29 = 0;
    }
  }
  else
  {
    v29 = 0;
  }
  return v29;
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  id v32;
  id v33[2];
  _NSRange v34;
  uint64_t v35;
  uint64_t *v36;
  int v37;
  int v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  id v47;
  char v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  id v57;
  id v58;
  char v59;
  id v60;
  id v61;
  id v62;
  char v63;
  id v64;
  id v65;
  objc_super v66;
  __int128 v67;
  __int128 v68;
  SEL v69;
  UITextViewAccessibility *v70;
  _NSRange v71;
  __int128 v72;
  __int128 v73;
  CGRect result;

  v71 = a3;
  v70 = self;
  v69 = a2;
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[UITextViewAccessibility accessibilityFrame](v70, "accessibilityFrame");
    *(_QWORD *)&v72 = v3;
    *((_QWORD *)&v72 + 1) = v4;
    *(_QWORD *)&v73 = v5;
    *((_QWORD *)&v73 + 1) = v6;
  }
  else
  {
    v72 = 0u;
    v73 = 0u;
    v72 = *MEMORY[0x24BDBF090];
    v73 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    if ((-[UITextViewAccessibility isEditable](v70, "isEditable") & 1) != 0)
    {
      v66.receiver = v70;
      v66.super_class = (Class)UITextViewAccessibility;
      -[UITextViewAccessibility _accessibilityBoundsForRange:](&v66, sel__accessibilityBoundsForRange_, v71);
      *(_QWORD *)&v67 = v7;
      *((_QWORD *)&v67 + 1) = v8;
      *(_QWORD *)&v68 = v9;
      *((_QWORD *)&v68 + 1) = v10;
      v72 = v67;
      v73 = v68;
    }
    v65 = (id)-[UITextViewAccessibility safeValueForKey:](v70, "safeValueForKey:", CFSTR("_textLayoutController"));
    if (__CGSizeEqualToSize_2(*MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8), *(double *)&v73, *((double *)&v73 + 1))&& (objc_msgSend(v65, "safeBoolForKey:", CFSTR("canAccessLayoutManager")) & 1) != 0)
    {
      v63 = 0;
      objc_opt_class();
      v32 = (id)objc_msgSend(v65, "safeValueForKey:", CFSTR("layoutManager"));
      v62 = (id)__UIAccessibilityCastAsClass();

      v61 = v62;
      objc_storeStrong(&v62, 0);
      v64 = v61;
      v59 = 0;
      objc_opt_class();
      v31 = (id)-[UITextViewAccessibility safeValueForKey:](v70, "safeValueForKey:", CFSTR("_textContainer"));
      v58 = (id)__UIAccessibilityCastAsClass();

      v57 = v58;
      objc_storeStrong(&v58, 0);
      v60 = v57;
      objc_msgSend(v64, "boundingRectForGlyphRange:inTextContainer:", v71, v57);
      v51 = v11;
      v52 = v12;
      v53 = v13;
      v54 = v14;
      UIAccessibilityFrameForBounds();
      *(_QWORD *)&v55 = v15;
      *((_QWORD *)&v55 + 1) = v16;
      *(_QWORD *)&v56 = v17;
      *((_QWORD *)&v56 + 1) = v18;
      v72 = v55;
      v73 = v56;
      v49 = 0u;
      v50 = 0u;
      v48 = 0;
      objc_opt_class();
      v47 = (id)__UIAccessibilityCastAsClass();
      v46 = v47;
      objc_storeStrong(&v47, 0);
      objc_msgSend(v46, "textContainerInset");
      *(_QWORD *)&v49 = v19;
      *((_QWORD *)&v49 + 1) = v20;
      *(_QWORD *)&v50 = v21;
      *((_QWORD *)&v50 + 1) = v22;

      *(double *)&v72 = *(double *)&v72 + *((double *)&v49 + 1);
      *((double *)&v72 + 1) = *((double *)&v72 + 1) + *(double *)&v49;
      objc_storeStrong(&v60, 0);
      objc_storeStrong(&v64, 0);
    }
    else if (__CGSizeEqualToSize_2(*MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8), *(double *)&v73, *((double *)&v73 + 1)))
    {
      NSClassFromString(CFSTR("_UITextKit2LayoutController"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = 0;
        v36 = &v35;
        v37 = 0x10000000;
        v38 = 64;
        v39 = &unk_230DEFD8E;
        v40 = 0u;
        v41 = 0u;
        v33[1] = &v35;
        v33[0] = v65;
        v34 = v71;
        AXPerformSafeBlock();
        v42 = *((_OWORD *)v36 + 2);
        v43 = *((_OWORD *)v36 + 3);
        objc_storeStrong(v33, 0);
        _Block_object_dispose(&v35, 8);
        UIAccessibilityFrameForBounds();
        *(_QWORD *)&v44 = v23;
        *((_QWORD *)&v44 + 1) = v24;
        *(_QWORD *)&v45 = v25;
        *((_QWORD *)&v45 + 1) = v26;
        v72 = v44;
        v73 = v45;
      }
    }
    objc_storeStrong(&v65, 0);
  }
  v28 = *((double *)&v72 + 1);
  v27 = *(double *)&v72;
  v30 = *((double *)&v73 + 1);
  v29 = *(double *)&v73;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

__n128 __56__UITextViewAccessibility__accessibilityBoundsForRange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  __n128 result;
  __int128 v8;
  __n128 v9;

  objc_msgSend(*(id *)(a1 + 32), "boundingRectForCharacterRange:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  *(_QWORD *)&v8 = v1;
  *((_QWORD *)&v8 + 1) = v2;
  v9.n128_u64[0] = v3;
  v9.n128_u64[1] = v4;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_OWORD *)(v5 + 32) = v8;
  result = v9;
  *(__n128 *)(v5 + 48) = v9;
  return result;
}

- (int64_t)accessibilityContainerType
{
  return 0;
}

- (id)_accessibilityInternalTextLinks
{
  id v3;
  objc_super v4;
  id v5[2];
  UITextViewAccessibility *v6;

  v6 = self;
  v5[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)UITextViewAccessibility;
  v5[0] = -[UITextViewAccessibility _accessibilityInternalTextLinks](&v4, sel__accessibilityInternalTextLinks);
  -[UITextViewAccessibility _axRegisterForDDNotificationIfNeeded]((uint64_t)v6);
  v3 = v5[0];
  objc_storeStrong(v5, 0);
  return v3;
}

- (BOOL)canBecomeFocused
{
  objc_super v3;
  SEL v4;
  UITextViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  if ((-[UITextViewAccessibility _accessibilityIsFocusForHoverTextRunningForFocusItem](self, "_accessibilityIsFocusForHoverTextRunningForFocusItem") & 1) != 0)return 1;
  if ((-[UITextViewAccessibility _accessibilityIsFKARunningForFocusItem](v5, "_accessibilityIsFKARunningForFocusItem") & 1) != 0
    && !-[UITextViewAccessibility isAccessibilityElement](v5, "isAccessibilityElement"))
  {
    return 0;
  }
  v3.receiver = v5;
  v3.super_class = (Class)UITextViewAccessibility;
  return -[UITextViewAccessibility canBecomeFocused](&v3, sel_canBecomeFocused);
}

- (id)automationElements
{
  id v2;
  uint64_t v3;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(uint64_t, void *, uint64_t, uint64_t, void *);
  void *v16;
  UITextViewAccessibility *v17;
  UITextViewAccessibility *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  UITextViewAccessibility *v22;
  id v23;
  char v24;
  id v25;
  objc_super v26;
  id v27[2];
  UITextViewAccessibility *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v28 = self;
  v27[1] = (id)a2;
  v26.receiver = self;
  v26.super_class = (Class)UITextViewAccessibility;
  v10 = -[UITextViewAccessibility automationElements](&v26, sel_automationElements);
  v11 = (id)objc_msgSend(v10, "mutableCopy");
  v24 = 0;
  if (v11)
  {
    v2 = v11;
  }
  else
  {
    v25 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v24 = 1;
    v2 = v25;
  }
  v27[0] = v2;
  if ((v24 & 1) != 0)

  v9 = (id)-[UITextViewAccessibility safeValueForKey:](v28, "safeValueForKey:", CFSTR("interactionAssistant"));
  v23 = (id)objc_msgSend(v9, "safeUIViewForKey:", CFSTR("_selectionView"));

  if ((objc_msgSend(v23, "_accessibilityViewIsVisible") & 1) != 0)
    objc_msgSend(v27[0], "addObject:", v23);
  v22 = v28;
  v7 = (id)-[UITextViewAccessibility textStorage](v22, "textStorage");
  v5 = *MEMORY[0x24BEBB318];
  v6 = (id)-[UITextViewAccessibility textStorage](v22, "textStorage");
  v3 = objc_msgSend(v6, "length");
  v30 = 0;
  v29 = v3;
  v31 = 0;
  v32 = v3;
  v20 = 0;
  v21 = v3;
  v12 = MEMORY[0x24BDAC760];
  v13 = -1073741824;
  v14 = 0;
  v15 = __45__UITextViewAccessibility_automationElements__block_invoke;
  v16 = &unk_24FF3FAA8;
  v17 = v22;
  v18 = v28;
  v19 = v27[0];
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v5, v20, v21, 0, &v12);

  v8 = v27[0];
  objc_storeStrong(&v19, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong((id *)&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(v27, 0);
  return v8;
}

void __45__UITextViewAccessibility_automationElements__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  BOOL v23;
  id v26;
  id v27;
  id v28;
  char v29;
  id v30;
  id v31;
  uint64_t v32;
  int v33;
  int v34;
  void (*v35)(uint64_t);
  void *v36;
  id v37[2];
  __int128 v38;
  uint64_t v39;
  uint64_t *v40;
  int v41;
  int v42;
  void (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  id v46;
  id v47;
  id v48;
  id v49[3];
  id location[2];
  __int128 v51;

  *(_QWORD *)&v51 = a3;
  *((_QWORD *)&v51 + 1) = a4;
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v49[2] = a5;
  v49[1] = (id)a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v49[0] = location[0];
    v48 = 0;
    v5 = (id)objc_msgSend(*(id *)(a1 + 32), "textLayoutManager");
    v23 = v5 != 0;

    if (v23)
    {
      v17 = (id)objc_msgSend(*(id *)(a1 + 32), "textLayoutManager");
      v16 = (id)objc_msgSend(*(id *)(a1 + 32), "textLayoutManager");
      v15 = (id)objc_msgSend(v16, "documentRange");
      v14 = (id)objc_msgSend(v15, "location");
      v26 = (id)objc_msgSend(v17, "locationFromLocation:withOffset:");

      v18 = (id)objc_msgSend(*(id *)(a1 + 32), "textLayoutManager");
      v10 = (id)objc_msgSend(v18, "viewProviderForTextAttachment:location:", v49[0], v26);
      v11 = v48;
      v48 = v10;

      objc_storeStrong(&v26, 0);
    }
    else if ((objc_msgSend((id)objc_opt_class(), "safeBoolForKey:", CFSTR("_isTextLayoutManagerEnabled")) & 1) != 0
           && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v47 = (id)objc_msgSend(*(id *)(a1 + 40), "safeValueForKey:", CFSTR("_textLayoutController"));
      v39 = 0;
      v40 = &v39;
      v41 = 838860800;
      v42 = 48;
      v43 = __Block_byref_object_copy__24;
      v44 = __Block_byref_object_dispose__24;
      v45 = 0;
      v32 = MEMORY[0x24BDAC760];
      v33 = -1073741824;
      v34 = 0;
      v35 = __45__UITextViewAccessibility_automationElements__block_invoke_426;
      v36 = &unk_24FF3FA80;
      v37[1] = &v39;
      v37[0] = v47;
      v38 = v51;
      AXPerformSafeBlock();
      v31 = (id)v40[5];
      objc_storeStrong(v37, 0);
      _Block_object_dispose(&v39, 8);
      objc_storeStrong(&v45, 0);
      v46 = v31;
      v29 = 0;
      objc_opt_class();
      v22 = (id)objc_msgSend(*(id *)(a1 + 40), "safeValueForKey:", CFSTR("_textContainer"));
      v28 = (id)__UIAccessibilityCastAsClass();

      v27 = v28;
      objc_storeStrong(&v28, 0);
      v30 = v27;
      v6 = (id)objc_msgSend(v49[0], "viewProviderForParentView:location:textContainer:", *(_QWORD *)(a1 + 32), v46, v27);
      v7 = v48;
      v48 = v6;

      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v46, 0);
      objc_storeStrong(&v47, 0);
    }
    else
    {
      v19 = *(void **)(a1 + 32);
      v20 = v51;
      v21 = (id)objc_msgSend(v19, "layoutManager");
      v8 = (id)objc_msgSend(v49[0], "viewProviderForParentView:characterIndex:layoutManager:", v19, v20);
      v9 = v48;
      v48 = v8;

    }
    v12 = *(void **)(a1 + 48);
    v13 = (id)objc_msgSend(v48, "view");
    objc_msgSend(v12, "axSafelyAddObject:");

    objc_storeStrong(&v48, 0);
    objc_storeStrong(v49, 0);
  }
  objc_storeStrong(location, 0);
}

void __45__UITextViewAccessibility_automationElements__block_invoke_426(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_locationWithOffset:", *(_QWORD *)(a1 + 48));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (void)replaceAnimatedTextPlaceholderWith:(id)a3
{
  objc_super v3;
  id location[2];
  UITextViewAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UITextViewAccessibility;
  -[UITextViewAccessibility replaceAnimatedTextPlaceholderWith:](&v3, sel_replaceAnimatedTextPlaceholderWith_, location[0]);
  -[UITextViewAccessibility _accessibilitySetRetainedValue:forKey:](v5, "_accessibilitySetRetainedValue:forKey:", 0, *MEMORY[0x24BEBB308]);
  objc_storeStrong(location, 0);
}

- (void)removeAnimatedTextPlaceholders
{
  objc_super v2;
  SEL v3;
  UITextViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UITextViewAccessibility;
  -[UITextViewAccessibility removeAnimatedTextPlaceholders](&v2, sel_removeAnimatedTextPlaceholders);
  -[UITextViewAccessibility _accessibilitySetRetainedValue:forKey:](v4, "_accessibilitySetRetainedValue:forKey:", 0, *MEMORY[0x24BEBB308]);
}

- (void)insertAnimatedTextPlaceholderAtLocation:(id)a3 numLines:(double)a4
{
  objc_super v5;
  double v6;
  id location[2];
  UITextViewAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = a4;
  v5.receiver = v8;
  v5.super_class = (Class)UITextViewAccessibility;
  -[UITextViewAccessibility insertAnimatedTextPlaceholderAtLocation:numLines:](&v5, sel_insertAnimatedTextPlaceholderAtLocation_numLines_, location[0], a4);
  -[UITextViewAccessibility _accessibilitySetRetainedValue:forKey:](v8, "_accessibilitySetRetainedValue:forKey:", 0, *MEMORY[0x24BEBB308]);
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityTextViewShouldBreakUpParagraphs
{
  id v3;
  BOOL v4;
  objc_super v5;
  SEL v7;
  UITextViewAccessibility *v8;

  v8 = self;
  v7 = a2;
  if (-[UITextViewAccessibility isEditable](self, "isEditable") & 1)
    return 0;
  v3 = -[UITextViewAccessibility accessibilityLabel](v8, "accessibilityLabel");
  v4 = objc_msgSend(v3, "length") == 0;

  if (!v4)
    return 0;
  if ((-[UITextViewAccessibility _accessibilityViewIsVisible](v8, "_accessibilityViewIsVisible") & 1) == 0)
    return 0;
  v5.receiver = v8;
  v5.super_class = (Class)UITextViewAccessibility;
  return -[UITextViewAccessibility _accessibilityTextViewShouldBreakUpParagraphs](&v5, sel__accessibilityTextViewShouldBreakUpParagraphs);
}

- (id)_accessibilityLinksForRange:(NSUInteger)a3
{
  NSUInteger v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id obj;
  uint64_t v10;
  id v11;
  BOOL v12;
  NSRange range2;
  _QWORD __b[8];
  id v15;
  id v16;
  id v17;
  NSRange v18;
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v18.location = a2;
  v18.length = a3;
  v17 = a1;
  if (a1)
  {
    v11 = (id)objc_msgSend(v17, "_accessibilityInternalTextLinks");
    v12 = objc_msgSend(v11, "count") == 0;

    if (v12)
    {
      v19 = MEMORY[0x24BDBD1A8];
    }
    else
    {
      v16 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      memset(__b, 0, sizeof(__b));
      obj = (id)objc_msgSend(v17, "_accessibilityInternalTextLinks");
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
      if (v10)
      {
        v6 = *(_QWORD *)__b[2];
        v7 = 0;
        v8 = v10;
        while (1)
        {
          v5 = v7;
          if (*(_QWORD *)__b[2] != v6)
            objc_enumerationMutation(obj);
          v15 = *(id *)(__b[1] + 8 * v7);
          range2.location = objc_msgSend(v15, "range");
          range2.length = v3;
          if (NSIntersectionRange(v18, range2).length)
            objc_msgSend(v16, "addObject:", v15);
          ++v7;
          if (v5 + 1 >= v8)
          {
            v7 = 0;
            v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
            if (!v8)
              break;
          }
        }
      }

      v19 = v16;
      objc_storeStrong(&v16, 0);
    }
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

- (id)_accessibilityParagraphElementsWithLinks
{
  uint64_t v2;
  int v3;
  int v4;
  void (*v5)(_QWORD *, void *);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  int v10;
  int v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  int v15;
  id v16;
  void *v17;
  id v18;

  v17 = a1;
  if (a1)
  {
    v16 = -[UITextViewAccessibility _accessibilityParagraphElements](v17);
    if (objc_msgSend(v16, "count"))
    {
      v8 = 0;
      v9 = &v8;
      v10 = 838860800;
      v11 = 48;
      v12 = __Block_byref_object_copy__24;
      v13 = __Block_byref_object_dispose__24;
      v14 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v2 = MEMORY[0x24BDAC760];
      v3 = -1073741824;
      v4 = 0;
      v5 = __67__UITextViewAccessibility__accessibilityParagraphElementsWithLinks__block_invoke;
      v6 = &unk_24FF3FB48;
      v7 = &v8;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", &v2);
      v18 = (id)v9[5];
      v15 = 1;
      _Block_object_dispose(&v8, 8);
      objc_storeStrong(&v14, 0);
    }
    else
    {
      v18 = MEMORY[0x24BDBD1A8];
      v15 = 1;
    }
    objc_storeStrong(&v16, 0);
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

id __66__UITextViewAccessibility__accessibilityParagraphLinksCustomRotor__block_invoke(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id obj;
  uint64_t v18;
  id v19;
  uint64_t v20;
  int v21;
  _QWORD __b[8];
  uint64_t v23;
  id v24;
  id v25;
  id v26[2];
  id location[2];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v26[1] = a1;
  v26[0] = objc_loadWeakRetained(a1 + 4);
  v25 = -[UITextViewAccessibility _accessibilityParagraphElementsWithLinks](v26[0]);
  v24 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  memset(__b, 0, sizeof(__b));
  obj = v25;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
  if (v18)
  {
    v13 = *(_QWORD *)__b[2];
    v14 = 0;
    v15 = v18;
    while (1)
    {
      v12 = v14;
      if (*(_QWORD *)__b[2] != v13)
        objc_enumerationMutation(obj);
      v23 = *(_QWORD *)(__b[1] + 8 * v14);
      v10 = v24;
      v11 = (id)-[_AXUITextViewParagraphElement links](v23);
      objc_msgSend(v10, "axSafelyAddObjectsFromArray:");

      ++v14;
      if (v12 + 1 >= v15)
      {
        v14 = 0;
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
        if (!v15)
          break;
      }
    }
  }

  if (objc_msgSend(v24, "count"))
  {
    v6 = v24;
    v8 = (id)objc_msgSend(location[0], "currentItem");
    v7 = (id)objc_msgSend(v8, "targetElement");
    v9 = objc_msgSend(v6, "indexOfObject:");

    v20 = v9;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = 0;
    }
    else if (objc_msgSend(location[0], "searchDirection"))
    {
      ++v20;
    }
    else
    {
      --v20;
    }
    if (v20 < (unint64_t)objc_msgSend(v24, "count"))
    {
      if (v20 >= 0)
        v4 = v20;
      else
        v4 = objc_msgSend(v24, "count") - 1;
      v5 = v4;
    }
    else
    {
      v5 = 0;
    }
    v20 = v5;
    v19 = objc_alloc_init(MEMORY[0x24BDF6798]);
    v3 = (id)objc_msgSend(v24, "objectAtIndex:", v5);
    objc_msgSend(v19, "setTargetElement:");

    v28 = v19;
    v21 = 1;
    objc_storeStrong(&v19, 0);
  }
  else
  {
    v28 = 0;
    v21 = 1;
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(v26, 0);
  objc_storeStrong(location, 0);
  return v28;
}

void __58__UITextViewAccessibility__accessibilityParagraphElements__block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  void *v7;
  id v8;
  id location[4];
  uint64_t v10;
  uint64_t v11;

  v10 = a3;
  v11 = a4;
  location[2] = a5;
  location[3] = a6;
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
  v8 = (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v10, v11);
  objc_msgSend(v7, "addObject:");

  objc_storeStrong(location, 0);
}

void __58__UITextViewAccessibility__accessibilityParagraphElements__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v13;
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  id location[6];
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  location[4] = a3;
  location[5] = a4;
  location[2] = a5;
  location[3] = a6;
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v20 = a7;
  v19 = a1;
  v18 = 0uLL;
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
  {
    v10 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "firstObject");
    *(_QWORD *)&v17 = objc_msgSend(v10, "rangeValue");
    *((_QWORD *)&v17 + 1) = v7;
    v18 = v17;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "removeObjectAtIndex:", 0);
  }
  else
  {
    v24 = 0x7FFFFFFFFFFFFFFFLL;
    v23 = 0;
    v25 = 0x7FFFFFFFFFFFFFFFLL;
    v26 = 0;
    v16 = 0x7FFFFFFFFFFFFFFFuLL;
    v18 = 0x7FFFFFFFFFFFFFFFuLL;
  }
  if (objc_msgSend(location[0], "length"))
  {
    v15 = -[UITextViewAccessibility _accessibilityLinksForRange:](*(void **)(a1 + 32), v18, *((NSUInteger *)&v18 + 1));
    v14 = -[_AXUITextViewParagraphElement initWithAccessibilityContainer:textRange:links:]([_AXUITextViewParagraphElement alloc], *(void **)(a1 + 32), v18, *((uint64_t *)&v18 + 1), v15);
    if ((objc_msgSend(*(id *)(a1 + 40), "isAXAttributedString") & 1) != 0
      && (objc_msgSend(*(id *)(a1 + 40), "hasAttributes") & 1) != 0
      && (_QWORD)v18 != 0x7FFFFFFFFFFFFFFFLL
      && (v22 = v18, (_QWORD)v18 + *((_QWORD *)&v18 + 1) <= (unint64_t)objc_msgSend(*(id *)(a1 + 40), "length")))
    {
      v8 = (id)objc_msgSend(*(id *)(a1 + 40), "attributedString");
      v13 = (id)objc_msgSend(v8, "attributedSubstringFromRange:", v18);

      v9 = (id)UIAccessibilityConvertAttachmentsInAttributedStringToAX();
      -[_AXUITextViewParagraphElement set_accessibilityContent:]((uint64_t)v14, v9);

      objc_storeStrong(&v13, 0);
    }
    else
    {
      -[_AXUITextViewParagraphElement set_accessibilityContent:]((uint64_t)v14, location[0]);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v14);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(location, 0);
}

void __67__UITextViewAccessibility__accessibilityParagraphElementsWithLinks__block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  BOOL v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = (id)-[_AXUITextViewParagraphElement links]((uint64_t)location[0]);
  v4 = objc_msgSend(v3, "count") == 0;

  if (!v4)
    objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "addObject:", location[0]);
  objc_storeStrong(location, 0);
}

@end
