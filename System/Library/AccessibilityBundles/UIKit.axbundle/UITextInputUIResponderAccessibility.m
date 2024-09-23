@implementation UITextInputUIResponderAccessibility

- (BOOL)becomeFirstResponder
{
  objc_super v3;
  char v4;
  SEL v6;
  UITextInputUIResponderAccessibility *v7;

  v7 = self;
  v6 = a2;
  if (-[UITextInputUIResponderAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("_AX_becomeFirstResponder")) & 1)return 0;
  -[UITextInputUIResponderAccessibility _accessibilitySetBoolValue:forKey:](v7, "_accessibilitySetBoolValue:forKey:", 1);
  v4 = 0;
  v3.receiver = v7;
  v3.super_class = (Class)UITextInputUIResponderAccessibility;
  v4 = -[UITextInputUIResponderAccessibility becomeFirstResponder](&v3, sel_becomeFirstResponder);
  -[UITextInputUIResponderAccessibility _accessibilitySetBoolValue:forKey:](v7, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("_AX_becomeFirstResponder"));
  if ((v4 & 1) != 0 && (-[NSObject __accessibilityRespondsToTextInput](v7) & 1) != 0)
    -[UITextInputUIResponderAccessibility _axResetFKAFocusToFirstResponder](v7);
  return v4 & 1;
}

- (BOOL)resignFirstResponder
{
  objc_super v3;
  char v4;
  SEL v6;
  UITextInputUIResponderAccessibility *v7;

  v7 = self;
  v6 = a2;
  if (-[UITextInputUIResponderAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("_AX_resignFirstResponder")) & 1)return 0;
  -[UITextInputUIResponderAccessibility _accessibilitySetBoolValue:forKey:](v7, "_accessibilitySetBoolValue:forKey:", 1);
  v4 = 0;
  v3.receiver = v7;
  v3.super_class = (Class)UITextInputUIResponderAccessibility;
  v4 = -[UITextInputUIResponderAccessibility resignFirstResponder](&v3, sel_resignFirstResponder);
  -[UITextInputUIResponderAccessibility _accessibilitySetBoolValue:forKey:](v7, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("_AX_resignFirstResponder"));
  if ((v4 & 1) != 0
    && (-[NSObject __accessibilityRespondsToTextInput](v7) & 1) != 0
    && -[UITextInputUIResponderAccessibility _accessibilityIsFKARunningForFocusItem](v7, "_accessibilityIsFKARunningForFocusItem"))
  {
    AXPerformBlockAsynchronouslyOnMainThread();
  }
  return v4 & 1;
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NSObject");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  const __CFString *v5;
  const char *v6;
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
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardCandidateController"), CFSTR("firstNonEmptyActiveCandidateView"), 0);
  v3 = CFSTR("UIKeyboardImpl");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("_keyboardBehaviorState"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("keyboardStateManager"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIKeyboardStateManager"), CFSTR("m_candidateList"), "<UIKeyboardCandidateList>");
  v4 = "B";
  v5 = CFSTR("_visibleRangeWithLayout:");
  v7 = "{_NSRange=QQ}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextView"), "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextField"), v5, v7, v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIResponder"), CFSTR("_nsrangeForTextRange:"), v7, v6, 0);
  objc_storeStrong(v9, v8);
}

- (void)_updateSelectionWithTextRange:(id)a3 withAffinityDownstream:(BOOL)a4
{
  id v5;
  UIAccessibilityNotifications *v6;
  objc_super v7;
  BOOL v8;
  id location[2];
  UITextInputUIResponderAccessibility *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = a4;
  v6 = (UIAccessibilityNotifications *)MEMORY[0x24BEBB0B0];
  _UIAccessibilityBlockPostingOfNotification();
  v7.receiver = v10;
  v7.super_class = (Class)UITextInputUIResponderAccessibility;
  -[UITextInputUIResponderAccessibility _updateSelectionWithTextRange:withAffinityDownstream:](&v7, sel__updateSelectionWithTextRange_withAffinityDownstream_, location[0], a4);
  _UIAccessibilityUnblockPostingOfNotification();
  v5 = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityResponderElementForFocus");
  _UIAccessibilitySetAssociatedElementContextForNextNotification();

  UIAccessibilityPostNotification(*v6, 0);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityCheckBorderHit:(char)a3 left:
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  BOOL v7;
  id location;
  id v9;
  int v10;
  id v11;
  char v12;
  char v13;
  id v14;

  v14 = a1;
  v13 = a2 & 1;
  v12 = a3 & 1;
  if (a1)
  {
    v11 = (id)objc_msgSend(v14, "safeValueForKey:", CFSTR("_selectableText"));
    v3 = (id)objc_msgSend(v11, "selectedTextRange");
    v7 = v3 != 0;

    if (v7)
    {
      v9 = (id)objc_msgSend(v11, "selectedTextRange");
      location = (id)objc_msgSend(v9, "start");
      if ((objc_msgSend(v9, "isEmpty") & 1) != 0 || (v13 & 1) != 0)
      {
        if ((v12 & 1) != 0)
          v4 = 3;
        else
          v4 = 2;
        v5 = (id)objc_msgSend(v11, "positionFromPosition:inDirection:offset:", location, v4, 1);
        v6 = location;
        location = v5;

      }
      if (!location)
        UIAccessibilityPostNotification(*MEMORY[0x24BEBB0B0], 0);
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v9, 0);
      v10 = 0;
    }
    else
    {
      v10 = 1;
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)_moveLeft:(BOOL)a3 withHistory:(id)a4
{
  id v5;
  objc_super v6;
  id location;
  BOOL v8;
  SEL v9;
  UITextInputUIResponderAccessibility *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  -[UITextInputUIResponderAccessibility _accessibilityCheckBorderHit:left:](v10, v8, 1);
  v6.receiver = v10;
  v6.super_class = (Class)UITextInputUIResponderAccessibility;
  v5 = -[UITextInputUIResponderAccessibility _moveLeft:withHistory:](&v6, sel__moveLeft_withHistory_, v8, location);
  objc_storeStrong(&location, 0);
  return v5;
}

- (id)_moveRight:(BOOL)a3 withHistory:(id)a4
{
  id v5;
  objc_super v6;
  id location;
  BOOL v8;
  SEL v9;
  UITextInputUIResponderAccessibility *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  -[UITextInputUIResponderAccessibility _accessibilityCheckBorderHit:left:](v10, v8, 0);
  v6.receiver = v10;
  v6.super_class = (Class)UITextInputUIResponderAccessibility;
  v5 = -[UITextInputUIResponderAccessibility _moveRight:withHistory:](&v6, sel__moveRight_withHistory_, v8, location);
  objc_storeStrong(&location, 0);
  return v5;
}

- (BOOL)isAccessibilityElement
{
  objc_super v3;
  objc_super v4;
  SEL v5;
  UITextInputUIResponderAccessibility *v6;

  v6 = self;
  v5 = a2;
  if ((-[NSObject __accessibilityRespondsToTextInput](self) & 1) != 0)
  {
    if ((-[NSObject __accessibilityRespondsToTextInput](v6) & 1) != 0)
    {
      return 1;
    }
    else
    {
      v3.receiver = v6;
      v3.super_class = (Class)UITextInputUIResponderAccessibility;
      return -[UITextInputUIResponderAccessibility isAccessibilityElement](&v3, sel_isAccessibilityElement);
    }
  }
  else
  {
    v4.receiver = v6;
    v4.super_class = (Class)UITextInputUIResponderAccessibility;
    return -[UITextInputUIResponderAccessibility isAccessibilityElement](&v4, sel_isAccessibilityElement);
  }
}

- (int64_t)_accessibilityTextInputLinePosition:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id location;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  SEL v18;
  UITextInputUIResponderAccessibility *v19;
  int64_t v20;

  v19 = self;
  v18 = a2;
  v17 = a3;
  v16 = self;
  v15 = (id)objc_msgSend(v16, "safeValueForKey:", CFSTR("selectedTextRange"));
  v14 = (id)objc_msgSend(v16, "tokenizer");
  v13 = 0;
  v12 = (id)objc_msgSend(v15, "start");
  v11 = (id)objc_msgSend(v15, "end");
  location = -[UITextInputUIResponderAccessibility _accessibilityBeginningOfDocument](v19, "_accessibilityBeginningOfDocument");
  if (!v17 || (objc_msgSend(v12, "isEqual:", location) & 1) == 0)
  {
    if (v17)
    {
      v3 = (id)objc_msgSend(v14, "positionFromPosition:toBoundary:inDirection:", v11, 4, 1);
      v4 = v11;
      v11 = v3;

      if (!v11)
      {
        v20 = 0x7FFFFFFFLL;
        goto LABEL_15;
      }
      v5 = (id)objc_msgSend(v16, "textRangeFromPosition:toPosition:", v12, v11);
      v6 = v13;
      v13 = v5;

    }
    else
    {
      if ((objc_msgSend(v14, "isPosition:atBoundary:inDirection:", v11, 4, 0) & 1) != 0)
        goto LABEL_14;
      if (!v11)
      {
        v20 = 0x7FFFFFFFLL;
        goto LABEL_15;
      }
      v7 = (id)objc_msgSend(v14, "rangeEnclosingPosition:withGranularity:inDirection:", v11, 4, 0);
      v8 = v13;
      v13 = v7;

    }
    if (!v13)
    {
      v20 = 0x7FFFFFFFLL;
      goto LABEL_15;
    }
LABEL_14:
    v20 = -[UITextInputUIResponderAccessibility _accessibilityOffsetFromPosition:toPosition:](v19, "_accessibilityOffsetFromPosition:toPosition:", location, v11);
    goto LABEL_15;
  }
  v20 = 0;
LABEL_15:
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  return v20;
}

- (int64_t)_accessibilityLineEndPosition
{
  objc_super v3;
  SEL v4;
  UITextInputUIResponderAccessibility *v5;

  v5 = self;
  v4 = a2;
  if ((-[NSObject __accessibilityRespondsToTextInput](self) & 1) != 0)
    return -[UITextInputUIResponderAccessibility _accessibilityTextInputLinePosition:](v5, "_accessibilityTextInputLinePosition:", 0);
  v3.receiver = v5;
  v3.super_class = (Class)UITextInputUIResponderAccessibility;
  return -[UITextInputUIResponderAccessibility _accessibilityLineEndPosition](&v3, sel__accessibilityLineEndPosition);
}

- (int64_t)_accessibilityLineStartPosition
{
  objc_super v3;
  SEL v4;
  UITextInputUIResponderAccessibility *v5;

  v5 = self;
  v4 = a2;
  if ((-[NSObject __accessibilityRespondsToTextInput](self) & 1) != 0)
    return -[UITextInputUIResponderAccessibility _accessibilityTextInputLinePosition:](v5, "_accessibilityTextInputLinePosition:", 1);
  v3.receiver = v5;
  v3.super_class = (Class)UITextInputUIResponderAccessibility;
  return -[UITextInputUIResponderAccessibility _accessibilityLineStartPosition](&v3, sel__accessibilityLineStartPosition);
}

- (_NSRange)_accessibilityCharacterRangeForPosition:(unint64_t)a3
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  id location;
  id v7;
  id v8;
  int v9;
  id v10;
  id v11;
  objc_super v12;
  unint64_t v13;
  SEL v14;
  id v15;
  uint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _NSRange result;

  v15 = self;
  v14 = a2;
  v13 = a3;
  if ((-[NSObject __accessibilityRespondsToTextInput](self) & 1) != 0)
  {
    if (v13 == 0x7FFFFFFF || v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = 0x7FFFFFFFLL;
      v17 = 0;
    }
    else
    {
      v11 = v15;
      v10 = (id)objc_msgSend(v15, "_accessibilityBeginningOfDocument");
      if (v10)
      {
        v8 = (id)objc_msgSend(v15, "_accessibilityPositionFromPosition:offset:", v10, v13);
        if (v8)
        {
          v7 = (id)objc_msgSend(v11, "tokenizer");
          location = (id)objc_msgSend(v7, "positionFromPosition:toBoundary:inDirection:", v8, 0);
          if (location)
          {
            v19 = objc_msgSend(v15, "_accessibilityOffsetFromPosition:toPosition:", v10, v8);
            v18 = objc_msgSend(v15, "_accessibilityOffsetFromPosition:toPosition:", v10, location) - v19;
            v20 = v19;
            v21 = v18;
            v16 = v19;
            v17 = v18;
          }
          else
          {
            v23 = 0x7FFFFFFFLL;
            v22 = 0;
            v24 = 0x7FFFFFFFLL;
            v25 = 0;
            v16 = 0x7FFFFFFFLL;
            v17 = 0;
          }
          v9 = 1;
          objc_storeStrong(&location, 0);
          objc_storeStrong(&v7, 0);
        }
        else
        {
          v27 = 0x7FFFFFFFLL;
          v26 = 0;
          v28 = 0x7FFFFFFFLL;
          v29 = 0;
          v16 = 0x7FFFFFFFLL;
          v17 = 0;
          v9 = 1;
        }
        objc_storeStrong(&v8, 0);
      }
      else
      {
        v31 = 0x7FFFFFFFLL;
        v30 = 0;
        v32 = 0x7FFFFFFFLL;
        v33 = 0;
        v16 = 0x7FFFFFFFLL;
        v17 = 0;
        v9 = 1;
      }
      objc_storeStrong(&v10, 0);
      objc_storeStrong(&v11, 0);
    }
  }
  else
  {
    v12.receiver = v15;
    v12.super_class = (Class)UITextInputUIResponderAccessibility;
    v16 = (uint64_t)-[UITextInputUIResponderAccessibility _accessibilityLineRangeForPosition:](&v12, sel__accessibilityLineRangeForPosition_, v13);
    v17 = v3;
  }
  v4 = v16;
  v5 = v17;
  result.length = v5;
  result.location = v4;
  return result;
}

- (_NSRange)_accessibilityLineRangeForPosition:(unint64_t)a3
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id location;
  id v11;
  id v12;
  int v13;
  id v14;
  id v15;
  objc_super v16;
  unint64_t v17;
  SEL v18;
  id v19;
  uint64_t v20;
  NSUInteger v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _NSRange result;

  v19 = self;
  v18 = a2;
  v17 = a3;
  if ((-[NSObject __accessibilityRespondsToTextInput](self) & 1) != 0)
  {
    if (v17 == 0x7FFFFFFF || v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = 0x7FFFFFFFLL;
      v21 = 0;
    }
    else
    {
      v15 = v19;
      v14 = (id)objc_msgSend(v19, "_accessibilityBeginningOfDocument");
      if (v14)
      {
        v12 = (id)objc_msgSend(v19, "_accessibilityPositionFromPosition:offset:", v14, v17);
        if (v12)
        {
          v11 = (id)objc_msgSend(v15, "tokenizer");
          location = (id)objc_msgSend(v11, "rangeEnclosingPosition:withGranularity:inDirection:", v12, 4, 0);
          if (location
            || (location = (id)objc_msgSend(v11, "rangeEnclosingPosition:withGranularity:inDirection:", v12, 4, 1), 0, location))
          {
            v6 = (id)objc_msgSend(location, "start");
            v7 = objc_msgSend(v19, "_accessibilityOffsetFromPosition:toPosition:", v14);

            v8 = (id)objc_msgSend(location, "end");
            v9 = objc_msgSend(v19, "_accessibilityOffsetFromPosition:toPosition:", v14);

            v23 = v7;
            v22 = v9 - v7;
            v24 = v7;
            v25 = v9 - v7;
            v20 = v7;
            v21 = v9 - v7;
            v13 = 1;
          }
          else
          {
            v27 = 0x7FFFFFFFLL;
            v26 = 0;
            v28 = 0x7FFFFFFFLL;
            v29 = 0;
            v20 = 0x7FFFFFFFLL;
            v21 = 0;
            v13 = 1;
          }
          objc_storeStrong(&location, 0);
          objc_storeStrong(&v11, 0);
        }
        else
        {
          v31 = 0x7FFFFFFFLL;
          v30 = 0;
          v32 = 0x7FFFFFFFLL;
          v33 = 0;
          v20 = 0x7FFFFFFFLL;
          v21 = 0;
          v13 = 1;
        }
        objc_storeStrong(&v12, 0);
      }
      else
      {
        v35 = 0x7FFFFFFFLL;
        v34 = 0;
        v36 = 0x7FFFFFFFLL;
        v37 = 0;
        v20 = 0x7FFFFFFFLL;
        v21 = 0;
        v13 = 1;
      }
      objc_storeStrong(&v14, 0);
      objc_storeStrong(&v15, 0);
    }
  }
  else
  {
    v16.receiver = v19;
    v16.super_class = (Class)UITextInputUIResponderAccessibility;
    v20 = (uint64_t)-[UITextInputUIResponderAccessibility _accessibilityLineRangeForPosition:](&v16, sel__accessibilityLineRangeForPosition_, v17);
    v21 = v3;
  }
  v4 = v20;
  v5 = v21;
  result.length = v5;
  result.location = v4;
  return result;
}

- (_NSRange)_accessibilityVisibleTextRange
{
  NSUInteger v2;
  NSUInteger v3;
  id v4[2];
  uint64_t v5;
  uint64_t *v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  SEL v13;
  UITextInputUIResponderAccessibility *v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _NSRange result;

  v14 = self;
  v13 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v12 = 0uLL;
    v5 = 0;
    v6 = &v5;
    v7 = 0x10000000;
    v8 = 48;
    v9 = &unk_230DEFD8E;
    v10 = 0;
    v11 = 0;
    v4[1] = &v5;
    v4[0] = v14;
    AXPerformSafeBlock();
    v12 = *((_OWORD *)v6 + 2);
    objc_storeStrong(v4, 0);
    _Block_object_dispose(&v5, 8);
    if ((_QWORD)v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = 0x7FFFFFFFLL;
      v20 = 0;
      v22 = 0x7FFFFFFFLL;
      v23 = 0;
      v15 = 0x7FFFFFFFuLL;
    }
    else
    {
      v15 = v12;
    }
  }
  else
  {
    v17 = 0x7FFFFFFFLL;
    v16 = 0;
    v18 = 0x7FFFFFFFLL;
    v19 = 0;
    v15 = 0x7FFFFFFFuLL;
  }
  v3 = *((_QWORD *)&v15 + 1);
  v2 = v15;
  result.length = v3;
  result.location = v2;
  return result;
}

__n128 __69__UITextInputUIResponderAccessibility__accessibilityVisibleTextRange__block_invoke(uint64_t a1)
{
  unint64_t v1;
  __n128 result;
  __n128 v4;

  v4.n128_u64[0] = objc_msgSend(*(id *)(a1 + 32), "_visibleRangeWithLayout:", 0);
  v4.n128_u64[1] = v1;
  result = v4;
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = v4;
  return result;
}

- (unint64_t)_accessibilityPositionInDirection:(int64_t)a3 offset:(unint64_t)a4 forPosition:(unint64_t)a5
{
  id location;
  id v7;
  int v8;
  id v9;
  id v10;
  objc_super v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  SEL v15;
  UITextInputUIResponderAccessibility *v16;
  unint64_t v17;

  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = a4;
  v12 = a5;
  if ((-[NSObject __accessibilityRespondsToTextInput](self) & 1) != 0)
  {
    if (v12 == 0x7FFFFFFF || v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0x7FFFFFFFLL;
    }
    else
    {
      v10 = v16;
      v9 = -[UITextInputUIResponderAccessibility _accessibilityBeginningOfDocument](v16, "_accessibilityBeginningOfDocument");
      if (v9)
      {
        v7 = -[UITextInputUIResponderAccessibility _accessibilityPositionFromPosition:offset:](v16, "_accessibilityPositionFromPosition:offset:", v9, v12);
        if (v7)
        {
          location = (id)objc_msgSend(v10, "positionFromPosition:inDirection:offset:", v7, v14, v13);
          if (location)
            v17 = -[UITextInputUIResponderAccessibility _accessibilityOffsetFromPosition:toPosition:](v16, "_accessibilityOffsetFromPosition:toPosition:", v9, location);
          else
            v17 = 0x7FFFFFFFLL;
          v8 = 1;
          objc_storeStrong(&location, 0);
        }
        else
        {
          v17 = 0x7FFFFFFFLL;
          v8 = 1;
        }
        objc_storeStrong(&v7, 0);
      }
      else
      {
        v17 = 0x7FFFFFFFLL;
        v8 = 1;
      }
      objc_storeStrong(&v9, 0);
      objc_storeStrong(&v10, 0);
    }
  }
  else
  {
    v11.receiver = v16;
    v11.super_class = (Class)UITextInputUIResponderAccessibility;
    return -[UITextInputUIResponderAccessibility _accessibilityPositionInDirection:offset:forPosition:](&v11, sel__accessibilityPositionInDirection_offset_forPosition_, v14, v13, v12);
  }
  return v17;
}

- (id)accessibilityValue
{
  id v3;
  id v4;
  id v5;
  UITextInputUIResponderAccessibility *v6;
  objc_super v7;
  SEL v8;
  UITextInputUIResponderAccessibility *v9;
  id v10;

  v9 = self;
  v8 = a2;
  if ((-[NSObject __accessibilityRespondsToTextInput](self) & 1) != 0)
  {
    v6 = v9;
    v5 = -[UITextInputUIResponderAccessibility _accessibilityBeginningOfDocument](v9, "_accessibilityBeginningOfDocument");
    v4 = -[UITextInputUIResponderAccessibility _accessibilityEndOfDocument](v9, "_accessibilityEndOfDocument");
    v3 = (id)-[UITextInputUIResponderAccessibility textRangeFromPosition:toPosition:](v6, "textRangeFromPosition:toPosition:", v5, v4);
    v10 = (id)-[UITextInputUIResponderAccessibility textInRange:](v6, "textInRange:", v3);
    objc_storeStrong(&v3, 0);
    objc_storeStrong(&v4, 0);
    objc_storeStrong(&v5, 0);
    objc_storeStrong((id *)&v6, 0);
  }
  else
  {
    v7.receiver = v9;
    v7.super_class = (Class)UITextInputUIResponderAccessibility;
    v10 = -[UITextInputUIResponderAccessibility accessibilityValue](&v7, sel_accessibilityValue);
  }
  return v10;
}

- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3
{
  id v3;
  id v4;
  CGFloat v5;
  CGFloat v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;
  id v24;
  id v25;
  id v26;
  BOOL v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  char v34;
  id v35;
  char v36;
  id v37;
  id v38;
  id v39;
  id v40;
  char v41;
  id v42;
  char v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  CGPoint v52;
  id v53;
  int v54;
  objc_super v55;
  id v56;
  id v57[2];
  UITextInputUIResponderAccessibility *v58;
  CGPoint v59;
  id v60;

  v59 = a3;
  v58 = self;
  v57[1] = (id)a2;
  v57[0] = 0;
  v56 = self;
  if ((-[NSObject __accessibilityRespondsToTextInput](v58) & 1) != 0)
  {
    v53 = (id)objc_msgSend(v56, "textInputView");
    if (!v53)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v3 = (id)objc_msgSend(v56, "inputView");
        v4 = v53;
        v53 = v3;

      }
    }
    v32 = (id)objc_msgSend(v53, "window");
    objc_msgSend(v32, "convertPoint:toView:", v53, v59);
    v52.x = v5;
    v52.y = v6;
    v59 = v52;

    v51 = (id)objc_msgSend(v56, "characterRangeAtPoint:", v52.x, v52.y);
    v50 = (id)objc_msgSend(v56, "textInRange:", v51);
    if ((objc_msgSend(v50, "isEqualToString:", CFSTR("\n")) & 1) != 0)
    {
      v28 = v56;
      v29 = (id)objc_msgSend(v51, "start");
      v49 = (id)objc_msgSend(v28, "positionFromPosition:inDirection:offset:");

      v30 = v56;
      v31 = (id)objc_msgSend(v51, "end");
      v48 = (id)objc_msgSend(v30, "positionFromPosition:inDirection:offset:");

      v7 = (id)objc_msgSend(v56, "textRangeFromPosition:toPosition:", v49, v48);
      v8 = v51;
      v51 = v7;

      objc_storeStrong(&v48, 0);
      objc_storeStrong(&v49, 0);
    }
    v47 = (id)objc_msgSend(v56, "tokenizer");
    v25 = (id)objc_msgSend(v51, "start");
    v46 = (id)objc_msgSend(v47, "positionFromPosition:toBoundary:inDirection:");

    v26 = (id)objc_msgSend(v51, "end");
    v45 = (id)objc_msgSend(v47, "positionFromPosition:toBoundary:inDirection:");

    v43 = 0;
    v27 = 1;
    if (v45)
    {
      v24 = v56;
      v44 = (id)objc_msgSend(v51, "end");
      v43 = 1;
      v27 = objc_msgSend(v24, "comparePosition:toPosition:") == 1;
    }
    if ((v43 & 1) != 0)

    if (v27)
    {
      v9 = (id)objc_msgSend(v51, "end");
      v10 = v45;
      v45 = v9;

    }
    v41 = 0;
    v23 = 1;
    if (v46)
    {
      v22 = v56;
      v42 = (id)objc_msgSend(v51, "start");
      v41 = 1;
      v23 = objc_msgSend(v22, "comparePosition:toPosition:") == -1;
    }
    if ((v41 & 1) != 0)

    if (v23)
    {
      v11 = (id)objc_msgSend(v51, "start");
      v12 = v46;
      v46 = v11;

    }
    v40 = (id)objc_msgSend(v56, "textRangeFromPosition:toPosition:", v46, v45);
    if (!v40)
    {
      v21 = (id)objc_msgSend(v51, "start");
      v40 = (id)objc_msgSend(v47, "rangeEnclosingPosition:withGranularity:inDirection:");

    }
    v39 = -[UITextInputUIResponderAccessibility _accessibilityBeginningOfDocument](v58, "_accessibilityBeginningOfDocument");
    v20 = (id)objc_msgSend(v40, "start");
    v36 = 0;
    v34 = 0;
    if (v20)
    {
      v37 = (id)objc_msgSend(v40, "start");
      v36 = 1;
      v19 = v37;
    }
    else
    {
      v35 = -[UITextInputUIResponderAccessibility _accessibilityEndOfDocument](v58, "_accessibilityEndOfDocument");
      v34 = 1;
      v19 = v35;
    }
    v38 = v19;
    if ((v34 & 1) != 0)

    if ((v36 & 1) != 0)
    v33 = -[UITextInputUIResponderAccessibility _accessibilityOffsetFromPosition:toPosition:](v58, "_accessibilityOffsetFromPosition:toPosition:", v39, v38);
    v16 = (void *)MEMORY[0x24BDBCE70];
    v18 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v33);
    v17 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
    v13 = (id)objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", v18, CFSTR("lineNumber"), v17, CFSTR("lineColumn"), 0);
    v14 = v57[0];
    v57[0] = v13;

    v60 = v57[0];
    v54 = 1;
    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v39, 0);
    objc_storeStrong(&v40, 0);
    objc_storeStrong(&v45, 0);
    objc_storeStrong(&v46, 0);
    objc_storeStrong(&v47, 0);
    objc_storeStrong(&v50, 0);
    objc_storeStrong(&v51, 0);
    objc_storeStrong(&v53, 0);
  }
  else
  {
    v55.receiver = v58;
    v55.super_class = (Class)UITextInputUIResponderAccessibility;
    v60 = -[UITextInputUIResponderAccessibility _accessibilityLineNumberAndColumnForPoint:](&v55, sel__accessibilityLineNumberAndColumnForPoint_, v59.x, v59.y);
    v54 = 1;
  }
  objc_storeStrong(&v56, 0);
  objc_storeStrong(v57, 0);
  return v60;
}

- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3
{
  id v3;
  id v4;
  NSUInteger v5;
  NSUInteger v6;
  id v7;
  UITextInputUIResponderAccessibility *v8;
  id v9;
  id v10;
  UITextInputUIResponderAccessibility *v11;
  id v12;
  id v13;
  UITextInputUIResponderAccessibility *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27[2];
  id v28;
  int v29;
  id location[2];
  UITextInputUIResponderAccessibility *v31;
  uint64_t v32;
  NSUInteger v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _NSRange result;

  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = 0x7FFFFFFFLL;
  v34 = 0;
  v36 = 0x7FFFFFFFLL;
  v37 = 0;
  v32 = 0x7FFFFFFFLL;
  v33 = 0;
  v18 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("lineColumn"));
  v19 = objc_msgSend(v18, "integerValue") != 0;

  if (v19)
    goto LABEL_26;
  if ((-[UITextInputUIResponderAccessibility conformsToProtocol:](v31, "conformsToProtocol:", &unk_255ED66F8) & 1) == 0)
  {
    v29 = 1;
    goto LABEL_27;
  }
  v28 = v31;
  v16 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("lineNumber"));
  v17 = (void *)objc_msgSend(v16, "integerValue");

  v27[1] = v17;
  v27[0] = -[UITextInputUIResponderAccessibility _accessibilityBeginningOfDocument](v31, "_accessibilityBeginningOfDocument");
  v26 = (id)objc_msgSend(v28, "positionFromPosition:inDirection:offset:", v27[0], 2, v17);
  if (!v26)
    objc_storeStrong(&v26, v27[0]);
  if (v26)
  {
    v25 = (id)objc_msgSend(v28, "tokenizer");
    v24 = (id)objc_msgSend(v25, "positionFromPosition:toBoundary:inDirection:", v26, 4, 0);
    if (!v24)
      objc_storeStrong(&v24, v27[0]);
    if ((objc_msgSend(v25, "isPosition:withinTextUnit:inDirection:", v24, 0, 1) & 1) == 0)
    {
      v23 = (id)objc_msgSend(v25, "positionFromPosition:toBoundary:inDirection:", v24, 0);
      if (v23)
        objc_storeStrong(&v24, v23);
      objc_storeStrong(&v23, 0);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      _AXAssert();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      _AXAssert();
    v22 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v3 = (id)objc_msgSend(v28, "textRangeFromPosition:toPosition:", v26, v24);
        v4 = v22;
        v22 = v3;

      }
    }
    if (v22)
    {
      v11 = v31;
      v10 = v27[0];
      v12 = (id)objc_msgSend(v22, "start");
      v21 = -[UITextInputUIResponderAccessibility _accessibilityOffsetFromPosition:toPosition:](v11, "_accessibilityOffsetFromPosition:toPosition:", v10);

      v14 = v31;
      v13 = v27[0];
      v15 = (id)objc_msgSend(v22, "end");
      v20 = -[UITextInputUIResponderAccessibility _accessibilityOffsetFromPosition:toPosition:](v14, "_accessibilityOffsetFromPosition:toPosition:", v13);

    }
    else
    {
      v21 = -[UITextInputUIResponderAccessibility _accessibilityOffsetFromPosition:toPosition:](v31, "_accessibilityOffsetFromPosition:toPosition:", v27[0], v27[0]);
      v8 = v31;
      v7 = v27[0];
      v9 = -[UITextInputUIResponderAccessibility _accessibilityEndOfDocument](v31, "_accessibilityEndOfDocument");
      v20 = -[UITextInputUIResponderAccessibility _accessibilityOffsetFromPosition:toPosition:](v8, "_accessibilityOffsetFromPosition:toPosition:", v7);

    }
    v32 = v21;
    v33 = v20 - v21;
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
    v29 = 0;
  }
  else
  {
    v29 = 1;
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(v27, 0);
  objc_storeStrong(&v28, 0);
  if (!v29)
LABEL_26:
    v29 = 1;
LABEL_27:
  objc_storeStrong(location, 0);
  v5 = v32;
  v6 = v33;
  result.length = v6;
  result.location = v5;
  return result;
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id obj;
  uint64_t v30;
  id v31;
  CGRect r2;
  CGRect v33;
  CGRect v34;
  _QWORD __b[8];
  id v36;
  id location;
  CGRect rect2;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  objc_super v44;
  SEL v45;
  UITextInputUIResponderAccessibility *v46;
  _NSRange v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;
  CGRect result;

  v51 = *MEMORY[0x24BDAC8D0];
  v47 = a3;
  v46 = self;
  v45 = a2;
  if ((-[NSObject __accessibilityRespondsToTextInput](self) & 1) != 0)
  {
    if (v47.location == 0x7FFFFFFF || v47.location == 0x7FFFFFFFFFFFFFFFLL)
    {
      v48 = *MEMORY[0x24BDBF090];
      v49 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    }
    else
    {
      v43 = v46;
      v42 = -[UITextInputUIResponderAccessibility _accessibilityBeginningOfDocument](v46, "_accessibilityBeginningOfDocument");
      v41 = -[UITextInputUIResponderAccessibility _accessibilityPositionFromPosition:offset:](v46, "_accessibilityPositionFromPosition:offset:", v42, v47.location);
      v40 = -[UITextInputUIResponderAccessibility _accessibilityPositionFromPosition:offset:](v46, "_accessibilityPositionFromPosition:offset:", v41, v47.length);
      v39 = (id)objc_msgSend(v43, "textRangeFromPosition:toPosition:", v41, v40);
      memset(&rect2, 0, sizeof(rect2));
      rect2 = *(CGRect *)*(_QWORD *)&MEMORY[0x24BDBF090];
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        location = (id)objc_msgSend(v43, "selectionRectsForRange:", v39);
        memset(__b, 0, sizeof(__b));
        obj = location;
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v50, 16);
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
            v36 = *(id *)(__b[1] + 8 * v27);
            if (CGRectEqualToRect(*MEMORY[0x24BDBF090], rect2))
            {
              objc_msgSend(v36, "rect");
              v34.origin.x = v7;
              v34.origin.y = v8;
              v34.size.width = v9;
              v34.size.height = v10;
              rect2 = v34;
            }
            else
            {
              objc_msgSend(v36, "rect");
              r2.origin.x = v11;
              r2.origin.y = v12;
              r2.size.width = v13;
              r2.size.height = v14;
              v33 = CGRectUnion(rect2, r2);
              rect2 = v33;
            }
            ++v27;
            if (v25 + 1 >= v28)
            {
              v27 = 0;
              v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v50, 16);
              if (!v28)
                break;
            }
          }
        }

        objc_storeStrong(&location, 0);
      }
      v31 = (id)objc_msgSend(v43, "textInputView");
      if (!v31)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = (id)objc_msgSend(v43, "inputView");
          v16 = v31;
          v31 = v15;

        }
      }
      UIAccessibilityFrameForBounds();
      *(_QWORD *)&v48 = v17;
      *((_QWORD *)&v48 + 1) = v18;
      *(_QWORD *)&v49 = v19;
      *((_QWORD *)&v49 + 1) = v20;
      objc_storeStrong(&v31, 0);
      objc_storeStrong(&v39, 0);
      objc_storeStrong(&v40, 0);
      objc_storeStrong(&v41, 0);
      objc_storeStrong(&v42, 0);
      objc_storeStrong(&v43, 0);
    }
  }
  else
  {
    v44.receiver = v46;
    v44.super_class = (Class)UITextInputUIResponderAccessibility;
    -[UITextInputUIResponderAccessibility _accessibilityBoundsForRange:](&v44, sel__accessibilityBoundsForRange_, v47.location, v47.length);
    *(_QWORD *)&v48 = v3;
    *((_QWORD *)&v48 + 1) = v4;
    *(_QWORD *)&v49 = v5;
    *((_QWORD *)&v49 + 1) = v6;
  }
  v21 = *((double *)&v49 + 1);
  v22 = *(double *)&v49;
  v23 = *((double *)&v48 + 1);
  v24 = *(double *)&v48;
  result.size.height = v21;
  result.size.width = v22;
  result.origin.y = v23;
  result.origin.x = v24;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  id v3;
  UIAccessibilityNotifications *v4;
  id location;
  id v6;
  id v7;
  id v8;
  id v9;
  char v10;
  objc_super v11;
  SEL v12;
  UITextInputUIResponderAccessibility *v13;
  _NSRange v14;

  v14 = a3;
  v13 = self;
  v12 = a2;
  if ((-[NSObject __accessibilityRespondsToTextInput](self) & 1) != 0)
  {
    if (v14.location != 0x7FFFFFFF)
    {
      v10 = 0;
      if (AXIsDictationListening())
      {
        AXHandleUserInteractionForDictation(1);
        v10 = 1;
      }
      v9 = v13;
      v8 = -[UITextInputUIResponderAccessibility _accessibilityBeginningOfDocument](v13, "_accessibilityBeginningOfDocument");
      v7 = -[UITextInputUIResponderAccessibility _accessibilityPositionFromPosition:offset:](v13, "_accessibilityPositionFromPosition:offset:", v8, v14.location);
      v6 = -[UITextInputUIResponderAccessibility _accessibilityPositionFromPosition:offset:](v13, "_accessibilityPositionFromPosition:offset:", v7, v14.length);
      location = (id)objc_msgSend(v9, "textRangeFromPosition:toPosition:", v7, v6);
      v4 = (UIAccessibilityNotifications *)MEMORY[0x24BEBB0B0];
      MEMORY[0x2348C39BC](*MEMORY[0x24BEBB0B0]);
      objc_msgSend(v9, "setSelectedTextRange:", location);
      MEMORY[0x2348C39BC](0);
      v3 = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityResponderElementForFocus");
      _UIAccessibilitySetAssociatedElementContextForNextNotification();

      UIAccessibilityPostNotification(*v4, 0);
      if ((v10 & 1) != 0)
        AXHandleUserInteractionForDictation(0);
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v6, 0);
      objc_storeStrong(&v7, 0);
      objc_storeStrong(&v8, 0);
      objc_storeStrong(&v9, 0);
    }
  }
  else
  {
    v11.receiver = v13;
    v11.super_class = (Class)UITextInputUIResponderAccessibility;
    -[UITextInputUIResponderAccessibility _accessibilitySetSelectedTextRange:](&v11, sel__accessibilitySetSelectedTextRange_, v14.location, v14.length);
  }
}

- (id)_accessibilityTextViewTextOperationResponder
{
  objc_super v3;
  SEL v4;
  UITextInputUIResponderAccessibility *v5;
  UITextInputUIResponderAccessibility *v6;

  v5 = self;
  v4 = a2;
  if ((-[NSObject __accessibilityRespondsToTextInput](self) & 1) != 0)
  {
    v6 = v5;
  }
  else
  {
    v3.receiver = v5;
    v3.super_class = (Class)UITextInputUIResponderAccessibility;
    v6 = (UITextInputUIResponderAccessibility *)-[UITextInputUIResponderAccessibility _accessibilityTextViewTextOperationResponder](&v3, sel__accessibilityTextViewTextOperationResponder);
  }
  return v6;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  NSUInteger v2;
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  id location;
  id v7;
  objc_super v8;
  SEL v9;
  UITextInputUIResponderAccessibility *v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _NSRange result;

  v10 = self;
  v9 = a2;
  if ((-[NSObject __accessibilityRespondsToTextInput](self) & 1) != 0)
  {
    v7 = v10;
    location = (id)objc_msgSend(v7, "safeValueForKey:", CFSTR("selectedTextRange"));
    if (location)
    {
      v11 = -[UITextInputUIResponderAccessibility _accessibilityRawRangeForUITextRange:](v10, "_accessibilityRawRangeForUITextRange:", location);
      v12 = v3;
    }
    else
    {
      v14 = 0x7FFFFFFFLL;
      v13 = 0;
      v15 = 0x7FFFFFFFLL;
      v16 = 0;
      v11 = 0x7FFFFFFFLL;
      v12 = 0;
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v7, 0);
  }
  else
  {
    v8.receiver = v10;
    v8.super_class = (Class)UITextInputUIResponderAccessibility;
    v11 = (uint64_t)-[UITextInputUIResponderAccessibility _accessibilitySelectedTextRange](&v8, sel__accessibilitySelectedTextRange);
    v12 = v2;
  }
  v4 = v11;
  v5 = v12;
  result.length = v5;
  result.location = v4;
  return result;
}

- (id)_accessibilityTextRangeFromNSRange:(_NSRange)a3
{
  id v4;
  id v5;
  id v6;
  UITextInputUIResponderAccessibility *v7;
  objc_super v8;
  SEL v9;
  UITextInputUIResponderAccessibility *v10;
  _NSRange v11;
  id v12;

  v11 = a3;
  v10 = self;
  v9 = a2;
  if ((-[NSObject __accessibilityRespondsToTextInput](self) & 1) != 0)
  {
    v7 = v10;
    v6 = (id)-[UITextInputUIResponderAccessibility beginningOfDocument](v7, "beginningOfDocument");
    v5 = (id)-[UITextInputUIResponderAccessibility positionFromPosition:offset:](v7, "positionFromPosition:offset:", v6, v11.location);
    v4 = (id)-[UITextInputUIResponderAccessibility positionFromPosition:offset:](v7, "positionFromPosition:offset:", v5, v11.length);
    v12 = (id)-[UITextInputUIResponderAccessibility textRangeFromPosition:toPosition:](v7, "textRangeFromPosition:toPosition:", v5, v4);
    objc_storeStrong(&v4, 0);
    objc_storeStrong(&v5, 0);
    objc_storeStrong(&v6, 0);
    objc_storeStrong((id *)&v7, 0);
  }
  else
  {
    v8.receiver = v10;
    v8.super_class = (Class)UITextInputUIResponderAccessibility;
    v12 = -[UITextInputUIResponderAccessibility _accessibilityTextRangeFromNSRange:](&v8, sel__accessibilityTextRangeFromNSRange_, v11.location, v11.length);
  }
  return v12;
}

- (_NSRange)_accessibilityRawRangeForUITextRange:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  id v6;
  UITextInputUIResponderAccessibility *v7;
  id v8;
  uint64_t v9;
  id v10;
  UITextInputUIResponderAccessibility *v11;
  id v12;
  uint64_t v13;
  id v14;
  int v15;
  objc_super v16;
  id location[2];
  UITextInputUIResponderAccessibility *v18;
  NSUInteger v19;
  NSUInteger v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _NSRange result;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((-[NSObject __accessibilityRespondsToTextInput](v18) & 1) != 0)
  {
    v14 = -[UITextInputUIResponderAccessibility _accessibilityBeginningOfDocument](v18, "_accessibilityBeginningOfDocument");
    v7 = v18;
    v6 = v14;
    v8 = (id)objc_msgSend(location[0], "start");
    v9 = -[UITextInputUIResponderAccessibility _accessibilityOffsetFromPosition:toPosition:](v7, "_accessibilityOffsetFromPosition:toPosition:", v6);

    v11 = v18;
    v10 = v14;
    v12 = (id)objc_msgSend(location[0], "end");
    v13 = -[UITextInputUIResponderAccessibility _accessibilityOffsetFromPosition:toPosition:](v11, "_accessibilityOffsetFromPosition:toPosition:", v10);

    v22 = v9;
    v21 = v13 - v9;
    v23 = v9;
    v24 = v13 - v9;
    v19 = v9;
    v20 = v13 - v9;
    v15 = 1;
    objc_storeStrong(&v14, 0);
  }
  else
  {
    v16.receiver = v18;
    v16.super_class = (Class)UITextInputUIResponderAccessibility;
    v19 = (NSUInteger)-[UITextInputUIResponderAccessibility _accessibilityRawRangeForUITextRange:](&v16, sel__accessibilityRawRangeForUITextRange_, location[0]);
    v20 = v3;
    v15 = 1;
  }
  objc_storeStrong(location, 0);
  v4 = v19;
  v5 = v20;
  result.length = v5;
  result.location = v4;
  return result;
}

- (unint64_t)accessibilityTraits
{
  id v3;
  char v4;
  objc_super v5;
  unint64_t v6;
  SEL v7;
  UITextInputUIResponderAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = 0;
  v5.receiver = self;
  v5.super_class = (Class)UITextInputUIResponderAccessibility;
  v6 = -[UITextInputUIResponderAccessibility accessibilityTraits](&v5, sel_accessibilityTraits);
  if ((-[NSObject __accessibilityRespondsToTextInput](v8) & 1) == 0)
    return v6;
  v6 |= *MEMORY[0x24BEBB198] | *MEMORY[0x24BEBB1A0] | *MEMORY[0x24BDFF000];
  v3 = (id)-[UITextInputUIResponderAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("isFirstResponder"));
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) != 0)
    v6 |= *MEMORY[0x24BEBB128];
  return v6;
}

- (id)_accessibilitySpeakThisString
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  objc_super v8;
  id v9[2];
  UITextInputUIResponderAccessibility *v10;

  v10 = self;
  v9[1] = (id)a2;
  v9[0] = 0;
  if ((-[NSObject __accessibilityRespondsToTextInput](self) & 1) != 0)
  {
    v2 = (id)-[UITextInputUIResponderAccessibility _accessibilityAXAttributedValue](v10, "_accessibilityAXAttributedValue");
    v3 = v9[0];
    v9[0] = v2;

  }
  else
  {
    v8.receiver = v10;
    v8.super_class = (Class)UITextInputUIResponderAccessibility;
    v4 = -[UITextInputUIResponderAccessibility _accessibilitySpeakThisString](&v8, sel__accessibilitySpeakThisString);
    v5 = v9[0];
    v9[0] = v4;

  }
  v7 = v9[0];
  objc_storeStrong(v9, 0);
  return v7;
}

- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3 string:(id)a4 wantsSentences:(BOOL)a5
{
  id v7;
  id location[2];
  UITextInputUIResponderAccessibility *v9;
  _NSRange v10;

  v10 = a3;
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v7 = -[UITextInputUIResponderAccessibility _accessibilityTextRectsForSpeakThisStringRange:wantsSentences:](v9, "_accessibilityTextRectsForSpeakThisStringRange:wantsSentences:", v10.location, v10.length, a5);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3
{
  return -[UITextInputUIResponderAccessibility _accessibilityTextRectsForSpeakThisStringRange:wantsSentences:](self, "_accessibilityTextRectsForSpeakThisStringRange:wantsSentences:", a3.location, a3.length, 0, a2, self, a3.location, a3.length);
}

- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3 wantsSentences:(BOOL)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id obj;
  uint64_t v27;
  UITextInputUIResponderAccessibility *v28;
  id v29;
  UITextInputUIResponderAccessibility *v30;
  id v31;
  objc_super v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD __b[8];
  id v40;
  id v41;
  os_log_type_t type;
  os_log_t oslog;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  char v50;
  id location;
  id v52;
  BOOL v53;
  SEL v54;
  UITextInputUIResponderAccessibility *v55;
  _NSRange v56;
  _NSRange v57;
  _BYTE v58[128];
  uint8_t v59[40];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v56 = a3;
  v55 = self;
  v54 = a2;
  v53 = a4;
  v52 = 0;
  if ((-[NSObject __accessibilityRespondsToTextInput](self) & 1) != 0)
  {
    location = 0;
    v50 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong(&location, v55);
      if ((objc_msgSend(location, "isSelectable") & 1) == 0)
      {
        objc_msgSend(location, "setSelectable:", 1);
        v50 = 1;
      }
    }
    v49 = v55;
    v28 = v55;
    v29 = -[UITextInputUIResponderAccessibility _accessibilityBeginningOfDocument](v55, "_accessibilityBeginningOfDocument");
    v48 = -[UITextInputUIResponderAccessibility _accessibilityPositionFromPosition:offset:](v28, "_accessibilityPositionFromPosition:offset:");

    v30 = v55;
    v31 = -[UITextInputUIResponderAccessibility _accessibilityBeginningOfDocument](v55, "_accessibilityBeginningOfDocument");
    v57 = v56;
    v47 = -[UITextInputUIResponderAccessibility _accessibilityPositionFromPosition:offset:](v30, "_accessibilityPositionFromPosition:offset:");

    v46 = (id)objc_msgSend(v49, "textRangeFromPosition:toPosition:", v48, v47);
    v45 = (id)objc_msgSend(v49, "textInputView");
    if (!v45)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = (id)-[UITextInputUIResponderAccessibility inputView](v55, "inputView");
        v5 = v45;
        v45 = v4;

      }
    }
    v44 = 0;
    if (v53)
      v6 = (id)-[UITextInputUIResponderAccessibility _accessibilitySentenceRectsForRange:](v55, "_accessibilitySentenceRectsForRange:", v46);
    else
      v6 = (id)-[UITextInputUIResponderAccessibility _accessibilityTextRectsForRange:singleTextRect:](v55, "_accessibilityTextRectsForRange:singleTextRect:", v46, 0);
    v7 = v44;
    v44 = v6;

    oslog = (os_log_t)(id)AXLogSpeakScreen();
    type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_3_8_66_8_66_8_66((uint64_t)v59, (uint64_t)v46, (uint64_t)v45, (uint64_t)v44);
      _os_log_impl(&dword_230C4A000, oslog, type, "Was text input, got range %{public}@ and view %{public}@, rects in view space %{public}@", v59, 0x20u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v41 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v44, "count"));
    memset(__b, 0, sizeof(__b));
    obj = v44;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v58, 16);
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
        v40 = *(id *)(__b[1] + 8 * v24);
        objc_msgSend(v40, "CGRectValue");
        *(_QWORD *)&v37 = v8;
        *((_QWORD *)&v37 + 1) = v9;
        *(_QWORD *)&v38 = v10;
        *((_QWORD *)&v38 + 1) = v11;
        v35 = v37;
        v36 = v38;
        if (v45)
        {
          objc_msgSend(v45, "convertRect:toView:", 0, v37, v38);
          *(_QWORD *)&v33 = v12;
          *((_QWORD *)&v33 + 1) = v13;
          *(_QWORD *)&v34 = v14;
          *((_QWORD *)&v34 + 1) = v15;
          v35 = v33;
          v36 = v34;
        }
        v20 = v41;
        v21 = (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v35, v36);
        objc_msgSend(v20, "addObject:");

        ++v24;
        if (v22 + 1 >= v25)
        {
          v24 = 0;
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v58, 16);
          if (!v25)
            break;
        }
      }
    }

    objc_storeStrong(&v52, v41);
    if (location && (v50 & 1) == 1)
      objc_msgSend(location, "setSelectable:", 0);
    objc_storeStrong(&v41, 0);
    objc_storeStrong(&v44, 0);
    objc_storeStrong(&v45, 0);
    objc_storeStrong(&v46, 0);
    objc_storeStrong(&v47, 0);
    objc_storeStrong(&v48, 0);
    objc_storeStrong(&v49, 0);
    objc_storeStrong(&location, 0);
  }
  else
  {
    v32.receiver = v55;
    v32.super_class = (Class)UITextInputUIResponderAccessibility;
    v16 = -[UITextInputUIResponderAccessibility _accessibilityTextRectsForSpeakThisStringRange:](&v32, sel__accessibilityTextRectsForSpeakThisStringRange_, v56.location, v56.length);
    v17 = v52;
    v52 = v16;

  }
  v19 = v52;
  objc_storeStrong(&v52, 0);
  return v19;
}

- (BOOL)_accessibilityInsertTextWithAlternatives:(id)a3
{
  char v4;
  id v5;
  UITextInputUIResponderAccessibility *v6;
  id v7;
  id v8;
  char v9;
  id v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  int v14;
  int v15;
  void (*v16)(uint64_t, void *, uint64_t, uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  id v20;
  BOOL v21;
  id v22;
  id v23;
  uint64_t v24;
  int v25;
  int v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29[3];
  uint64_t v30;
  uint64_t *v31;
  int v32;
  int v33;
  void (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  int v38;
  int v39;
  void (*v40)(uint64_t, void *, uint64_t, uint64_t, void *);
  void *v41;
  id v42;
  id v43[2];
  uint64_t v44;
  uint64_t *v45;
  int v46;
  int v47;
  uint64_t v48;
  id v49;
  char v50;
  id location[2];
  UITextInputUIResponderAccessibility *v52;

  v52 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v50 = 0;
  if ((-[NSObject __accessibilityRespondsToTextInput](v52) & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v49 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v44 = 0;
      v45 = &v44;
      v46 = 0x20000000;
      v47 = 32;
      v48 = 0;
      v12 = location[0];
      v37 = MEMORY[0x24BDAC760];
      v38 = -1073741824;
      v39 = 0;
      v40 = __80__UITextInputUIResponderAccessibility__accessibilityInsertTextWithAlternatives___block_invoke;
      v41 = &unk_24FF3F9C0;
      v43[1] = &v44;
      v42 = v49;
      v43[0] = location[0];
      objc_msgSend(v12, "enumerateAttributesUsingBlock:", &v37);
      v11 = v45[3];
      if (v11 < objc_msgSend(location[0], "length"))
      {
        v10 = v49;
        v30 = 0;
        v31 = &v30;
        v32 = 838860800;
        v33 = 48;
        v34 = __Block_byref_object_copy__23;
        v35 = __Block_byref_object_dispose__23;
        v36 = 0;
        v24 = MEMORY[0x24BDAC760];
        v25 = -1073741824;
        v26 = 0;
        v27 = __80__UITextInputUIResponderAccessibility__accessibilityInsertTextWithAlternatives___block_invoke_3;
        v28 = &unk_24FF3ECE0;
        v29[1] = &v30;
        v29[0] = location[0];
        v29[2] = &v44;
        AXPerformSafeBlock();
        v23 = (id)v31[5];
        objc_storeStrong(v29, 0);
        _Block_object_dispose(&v30, 8);
        objc_storeStrong(&v36, 0);
        objc_msgSend(v10, "axSafelyAddObject:");

      }
      -[UITextInputUIResponderAccessibility insertDictationResult:](v52, "insertDictationResult:", v49);
      v50 = 1;
      objc_storeStrong(v43, 0);
      objc_storeStrong(&v42, 0);
      _Block_object_dispose(&v44, 8);
      objc_storeStrong(&v49, 0);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v22 = (id)objc_msgSend(location[0], "string");
      v21 = 1;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v6 = v52;
        v8 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
        v7 = (id)objc_msgSend(v8, "delegate");
        v9 = -[UITextInputUIResponderAccessibility keyboardInput:shouldInsertText:isMarkedText:](v6, "keyboardInput:shouldInsertText:isMarkedText:");

        v21 = (v9 & 1) != 0;
      }
      if (v21)
      {
        v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v22);
        v5 = location[0];
        v13 = MEMORY[0x24BDAC760];
        v14 = -1073741824;
        v15 = 0;
        v16 = __80__UITextInputUIResponderAccessibility__accessibilityInsertTextWithAlternatives___block_invoke_4;
        v17 = &unk_24FF3F9E8;
        v18 = location[0];
        v19 = v20;
        objc_msgSend(v5, "enumerateAttributesUsingBlock:", &v13);
        -[UITextInputUIResponderAccessibility _insertAttributedTextWithoutClosingTyping:](v52, "_insertAttributedTextWithoutClosingTyping:", v20);
        objc_storeStrong(&v19, 0);
        objc_storeStrong(&v18, 0);
        objc_storeStrong(&v20, 0);
      }
      v50 = 1;
      objc_storeStrong(&v22, 0);
    }
  }
  v4 = v50;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

void __80__UITextInputUIResponderAccessibility__accessibilityInsertTextWithAlternatives___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v5;
  void *v6;
  id v9;
  id v10;
  id v11[2];
  __int128 v12;
  uint64_t v13;
  uint64_t *v14;
  int v15;
  int v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  int v23;
  int v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27[3];
  __int128 v28;
  uint64_t v29;
  uint64_t *v30;
  int v31;
  int v32;
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35[3];
  id location[2];
  __int128 v37;
  __int128 v38;

  *(_QWORD *)&v37 = a3;
  *((_QWORD *)&v37 + 1) = a4;
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v35[2] = a5;
  v35[1] = (id)a1;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) < (unint64_t)v37)
  {
    v6 = *(void **)(a1 + 32);
    v29 = 0;
    v30 = &v29;
    v31 = 838860800;
    v32 = 48;
    v33 = __Block_byref_object_copy__23;
    v34 = __Block_byref_object_dispose__23;
    v35[0] = 0;
    v22 = MEMORY[0x24BDAC760];
    v23 = -1073741824;
    v24 = 0;
    v25 = __80__UITextInputUIResponderAccessibility__accessibilityInsertTextWithAlternatives___block_invoke_539;
    v26 = &unk_24FF3F998;
    v27[1] = &v29;
    v27[0] = *(id *)(a1 + 40);
    v27[2] = *(id *)(a1 + 48);
    v28 = v37;
    AXPerformSafeBlock();
    v21 = (id)v30[5];
    objc_storeStrong(v27, 0);
    _Block_object_dispose(&v29, 8);
    objc_storeStrong(v35, 0);
    objc_msgSend(v6, "axSafelyAddObject:");

  }
  v20 = (id)objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("AXTextAlternatives"));
  if (!objc_msgSend(v20, "count"))
    objc_storeStrong(&v20, MEMORY[0x24BDBD1A8]);
  v5 = *(void **)(a1 + 32);
  v13 = 0;
  v14 = &v13;
  v15 = 838860800;
  v16 = 48;
  v17 = __Block_byref_object_copy__23;
  v18 = __Block_byref_object_dispose__23;
  v19 = 0;
  v11[1] = &v13;
  v10 = *(id *)(a1 + 40);
  v12 = v37;
  v11[0] = v20;
  AXPerformSafeBlock();
  v9 = (id)v14[5];
  objc_storeStrong(v11, 0);
  objc_storeStrong(&v10, 0);
  _Block_object_dispose(&v13, 8);
  objc_storeStrong(&v19, 0);
  objc_msgSend(v5, "axSafelyAddObject:");

  v38 = v37;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v37 + *((_QWORD *)&v37 + 1);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

void __80__UITextInputUIResponderAccessibility__accessibilityInsertTextWithAlternatives___block_invoke_539(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x24BDF69D0];
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v7, *(_QWORD *)(a1 + 56) - v7);
  v1 = (id)objc_msgSend(v4, "phraseWithText:alternativeInterpretations:");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

void __80__UITextInputUIResponderAccessibility__accessibilityInsertTextWithAlternatives___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v6;

  v4 = (void *)MEMORY[0x24BDF69D0];
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v1 = (id)objc_msgSend(v4, "phraseWithText:alternativeInterpretations:");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

void __80__UITextInputUIResponderAccessibility__accessibilityInsertTextWithAlternatives___block_invoke_3(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v6;

  v4 = (void *)MEMORY[0x24BDF69D0];
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), objc_msgSend(*(id *)(a1 + 32), "length")- *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v1 = (id)objc_msgSend(v4, "phraseWithText:alternativeInterpretations:");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

void __80__UITextInputUIResponderAccessibility__accessibilityInsertTextWithAlternatives___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v11;
  id v12[3];
  id location[2];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v12[2] = a5;
  v12[1] = (id)a1;
  v12[0] = (id)objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("AXTextAlternatives"));
  if (objc_msgSend(v12[0], "count"))
  {
    v5 = objc_alloc(MEMORY[0x24BEBB4B0]);
    v6 = (id)objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v14, v15);
    v11 = objc_msgSend(v5, "initWithPrimaryString:alternativeStrings:");

    v7 = *(void **)(a1 + 40);
    v16 = *MEMORY[0x24BEBB3F8];
    v17[0] = v11;
    v8 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    objc_msgSend(v7, "setAttributes:range:");

    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(v12, 0);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityAlternativesForTextAtPosition:(unint64_t)a3
{
  id v3;
  id v4;
  id v6;
  id v7;
  id obj;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  SEL v15;
  UITextInputUIResponderAccessibility *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = 0;
  if ((-[NSObject __accessibilityRespondsToTextInput](self) & 1) != 0)
  {
    v12 = 0;
    v11 = -[UITextInputUIResponderAccessibility _accessibilityBeginningOfDocument](v16, "_accessibilityBeginningOfDocument");
    if (v11)
    {
      v10 = -[UITextInputUIResponderAccessibility _accessibilityPositionFromPosition:offset:](v16, "_accessibilityPositionFromPosition:offset:", v11, v14);
      if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        obj = v12;
        v7 = (id)-[UITextInputUIResponderAccessibility rangeWithTextAlternatives:atPosition:](v16, "rangeWithTextAlternatives:atPosition:", &obj, v10);
        objc_storeStrong(&v12, obj);
        v9 = v7;
        if (v7)
        {
          v3 = (id)objc_msgSend(v12, "alternativeStrings");
          v4 = v13;
          v13 = v3;

        }
        objc_storeStrong(&v9, 0);
      }
      objc_storeStrong(&v10, 0);
    }
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v12, 0);
  }
  v6 = v13;
  objc_storeStrong(&v13, 0);
  return v6;
}

- (BOOL)_accessibilityHandlesTabKey
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;
  uint64_t v10;
  id v11;
  id v12;
  char v13;
  id v14;
  id v15;
  char v16;
  id v17;
  char v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24[2];
  uint64_t v25;
  uint64_t *v26;
  int v27;
  int v28;
  char v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;
  char v34;
  SEL v35;
  UITextInputUIResponderAccessibility *v36;

  v36 = self;
  v35 = a2;
  v34 = 0;
  v33.receiver = self;
  v33.super_class = (Class)UITextInputUIResponderAccessibility;
  v34 = -[UITextInputUIResponderAccessibility _accessibilityHandlesTabKey](&v33, sel__accessibilityHandlesTabKey);
  if (v34)
  {
    v32 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
    v8 = (id)objc_msgSend(v32, "textInputTraits");
    v9 = objc_msgSend(v8, "isSingleLineDocument");

    if ((v9 & 1) != 0)
    {
      v7 = (id)objc_msgSend(v32, "safeValueForKey:", CFSTR("keyboardStateManager"));
      v31 = (id)objc_msgSend(v7, "safeValueForKey:", CFSTR("m_candidateList"));

      v30 = (id)objc_msgSend(v31, "safeValueForKey:", CFSTR("firstNonEmptyActiveCandidateView"));
      v25 = 0;
      v26 = &v25;
      v27 = 0x20000000;
      v28 = 32;
      v29 = 0;
      v19 = MEMORY[0x24BDAC760];
      v20 = -1073741824;
      v21 = 0;
      v22 = __66__UITextInputUIResponderAccessibility__accessibilityHandlesTabKey__block_invoke;
      v23 = &unk_24FF3DE88;
      v24[1] = &v25;
      v24[0] = v30;
      AXPerformSafeBlock();
      v18 = v26[3] & 1;
      objc_storeStrong(v24, 0);
      _Block_object_dispose(&v25, 8);
      if ((v18 & 1) == 0)
      {
        v16 = 0;
        objc_opt_class();
        v6 = (id)objc_msgSend(v32, "safeValueForKey:", CFSTR("inputManagerState"));
        v15 = (id)__UIAccessibilityCastAsClass();

        v14 = v15;
        objc_storeStrong(&v15, 0);
        v3 = v14;
        v4 = (id)objc_msgSend(v14, "keyboardBehaviors");
        v13 = 0;
        objc_opt_class();
        v5 = (id)objc_msgSend(v32, "safeValueForKey:", CFSTR("_keyboardBehaviorState"));
        v12 = (id)__UIAccessibilityCastAsClass();

        v11 = v12;
        objc_storeStrong(&v12, 0);
        v17 = (id)objc_msgSend(v4, "keyBehaviorsForState:");

        v10 = objc_msgSend(v17, "tabKeyBehavior");
        if (v10 != 4 && v10 != 3)
          v34 = 0;
        objc_storeStrong(&v17, 0);
      }
      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v31, 0);
    }
    objc_storeStrong(&v32, 0);
  }
  return v34 & 1;
}

uint64_t __66__UITextInputUIResponderAccessibility__accessibilityHandlesTabKey__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "hasCandidateInForwardDirection:granularity:", 1, 3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result & 1;
  return result;
}

- (int64_t)_accessibilityOffsetFromPosition:(id)a3 toPosition:(id)a4
{
  int64_t v6;
  id v7;
  id location[2];
  UITextInputUIResponderAccessibility *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = -[UITextInputUIResponderAccessibility offsetFromPosition:toPosition:](v9, "offsetFromPosition:toPosition:", location[0], v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (id)_accessibilityPositionFromPosition:(id)a3 offset:(int64_t)a4
{
  id v5;
  id location[2];
  UITextInputUIResponderAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a4 < 0)
    _AXAssert();
  v5 = (id)-[UITextInputUIResponderAccessibility positionFromPosition:offset:](v8, "positionFromPosition:offset:", location[0], a4);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)_accessibilityBeginningOfDocument
{
  return (id)-[UITextInputUIResponderAccessibility beginningOfDocument](self, "beginningOfDocument", a2, self);
}

- (id)_accessibilityEndOfDocument
{
  return (id)-[UITextInputUIResponderAccessibility endOfDocument](self, "endOfDocument", a2, self);
}

- (void)_axResetFKAFocusToFirstResponder
{
  if (a1)
    -[UITextInputUIResponderAccessibility _axDrawFocusRingAroundFirstResponderAndMoveFocus:](a1, 1);
}

uint64_t __59__UITextInputUIResponderAccessibility_resignFirstResponder__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDF6A60], "moveRingToFocusItem:forClient:", 0, CFSTR("AXFKATextFieldClient"), a1, a1);
}

- (BOOL)_axShouldDrawFocusAroundFirstResponder
{
  return 1;
}

- (void)_axDrawFocusRingAroundFirstResponderAndMoveFocus:(void *)a1
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  id v7;
  id v8;
  char v9;
  id v10;
  char v11;
  void *v12;

  v12 = a1;
  v11 = a2 & 1;
  if (a1
    && (AXProcessIsFullKeyboardAccess() & 1) == 0
    && (-[NSObject __accessibilityRespondsToTextInput](v12) & 1) != 0)
  {
    v10 = (id)objc_msgSend(v12, "_accessibilityFocusItemForResponder");
    if ((objc_msgSend(v12, "_accessibilityIsFKARunningForFocusItem") & 1) != 0
      && (objc_msgSend(v10, "conformsToProtocol:", &unk_255EAA8A0) & 1) != 0)
    {
      v2 = MEMORY[0x24BDAC760];
      v3 = -1073741824;
      v4 = 0;
      v5 = __88__UITextInputUIResponderAccessibility__axDrawFocusRingAroundFirstResponderAndMoveFocus___block_invoke;
      v6 = &unk_24FF3DB70;
      v9 = v11 & 1;
      v7 = v10;
      v8 = v12;
      AXPerformBlockAsynchronouslyOnMainThread();
      objc_storeStrong(&v8, 0);
      objc_storeStrong(&v7, 0);
    }
    objc_storeStrong(&v10, 0);
  }
}

uint64_t __88__UITextInputUIResponderAccessibility__axDrawFocusRingAroundFirstResponderAndMoveFocus___block_invoke(uint64_t a1)
{
  uint64_t result;
  BOOL v3;
  char v4;
  id v5;
  char v6;
  id v7;

  v6 = 0;
  v4 = 0;
  v3 = 0;
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v7 = (id)objc_msgSend(MEMORY[0x24BDF6A68], "focusSystemForEnvironment:", *(_QWORD *)(a1 + 32));
    v6 = 1;
    v5 = (id)objc_msgSend(v7, "focusedItem");
    v4 = 1;
    v3 = v5 != *(id *)(a1 + 32);
  }
  if ((v4 & 1) != 0)

  if ((v6 & 1) != 0)
  if (v3)
    _UIAXAssignFocusToItem();
  result = objc_msgSend(*(id *)(a1 + 40), "_axShouldDrawFocusAroundFirstResponder");
  if ((result & 1) != 0)
    return objc_msgSend(MEMORY[0x24BDF6A60], "moveRingToFocusItem:forClient:", *(_QWORD *)(a1 + 32), CFSTR("AXFKATextFieldClient"));
  return result;
}

- (id)_accessibilityFocusItemForResponder
{
  return self;
}

- (BOOL)_accessibilityIsFKARunningForFocusItem
{
  int v3;
  id location;
  objc_super v5;
  SEL v6;
  UITextInputUIResponderAccessibility *v7;
  char v8;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)UITextInputUIResponderAccessibility;
  if (-[UITextInputUIResponderAccessibility _accessibilityIsFKARunningForFocusItem](&v5, sel__accessibilityIsFKARunningForFocusItem))
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ((location = (id)-[UITextInputUIResponderAccessibility nextResponder](v7, "nextResponder"), location == v7)? (v3 = 0): (v8 = objc_msgSend(location, "_accessibilityIsFKARunningForFocusItem") & 1, v3 = 1), objc_storeStrong(&location, 0), !v3))
    {
      v8 = 0;
    }
  }
  return v8 & 1;
}

@end
