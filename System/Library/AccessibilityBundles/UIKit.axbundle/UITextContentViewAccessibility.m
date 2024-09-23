@implementation UITextContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITextContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const char *v4;
  const __CFString *v5;
  const char *v6;
  id v7;
  id *v8;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = CFSTR("UITextContentView");
  v4 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("keyboardInput: shouldInsertText: isMarkedText:"), "@", "@", v4, 0);
  v6 = "{_NSRange=QQ}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("keyboardInput: shouldReplaceTextInRange: replacementText:"), v4, v3, "{_NSRange=QQ}", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("keyboardInputChangedSelection:"), "v", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("keyboardInputChanged:"), v4, v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("selectedRange"), v6, 0);
  objc_storeStrong(v8, v7);
}

- (id)_accessibilitySupplementaryHeaderViews
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7[3];

  v7[2] = self;
  v7[1] = (id)a2;
  v3 = (id)-[UITextContentViewAccessibility _accessibleNonSupplementarySubviews](self, "_accessibleNonSupplementarySubviews");
  v7[0] = (id)objc_msgSend(v3, "mutableCopy");

  v4 = v7[0];
  v5 = (id)objc_msgSend(v7[0], "indexesOfObjectsPassingTest:", &__block_literal_global_43);
  objc_msgSend(v4, "removeObjectsAtIndexes:");

  v6 = v7[0];
  objc_storeStrong(v7, 0);
  return v6;
}

BOOL __72__UITextContentViewAccessibility__accessibilitySupplementaryHeaderViews__block_invoke(void *a1, void *a2)
{
  id location[2];
  BOOL v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = (objc_msgSend(location[0], "_accessibilityIsWebDocumentView") & 1) != 0;
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)_accessibilityShouldAnnounceFontInfo
{
  return 0;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  id v3;
  char v4;

  v3 = (id)-[UITextContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("canBecomeFirstResponder"));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4 & 1;
}

- (BOOL)accessibilityActivate
{
  BOOL v4;

  v4 = 0;
  if (-[UITextContentViewAccessibility _accessibilitySupportsActivateAction](self, "_accessibilitySupportsActivateAction"))
  {
    -[UITextContentViewAccessibility becomeFirstResponder](self, "becomeFirstResponder");
    if ((-[UITextContentViewAccessibility isFirstResponder](self, "isFirstResponder") & 1) != 0)
      return 1;
  }
  return v4;
}

- (id)_accessibilityDataDetectorScheme:(CGPoint)a3
{
  id v4;
  id v5;

  v4 = (id)-[UITextContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("m_webView"));
  v5 = (id)objc_msgSend(v4, "_accessibilityDataDetectorScheme:", a3.x, a3.y);

  return v5;
}

- (void)_accessibilitySetValue:(id)a3
{
  id v3;
  id v4;
  char v5;
  id location[2];
  UITextContentViewAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (id)-[UITextContentViewAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("isFirstResponder"));
    v5 = objc_msgSend(v4, "BOOLValue");

    if ((v5 & 1) == 0)
      v3 = (id)-[UITextContentViewAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("becomeFirstResponder"));
    -[UITextContentViewAccessibility setText:](v7, "setText:", location[0]);
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilitySetShouldUpdateCache:(BOOL)a3
{
  -[UITextContentViewAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AXAttrCacheIsClean"));
}

- (BOOL)_accessibilityShouldUpdateTextCache
{
  return (-[UITextContentViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("AXAttrCacheIsClean"), a2, self) ^ 1) & 1;
}

- (BOOL)keyboardInputChanged:(id)a3
{
  char v4;
  objc_super v5;
  char v6;
  id location[2];
  UITextContentViewAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  v5.receiver = v8;
  v5.super_class = (Class)UITextContentViewAccessibility;
  v6 = -[UITextContentViewAccessibility keyboardInputChanged:](&v5, sel_keyboardInputChanged_, location[0]);
  -[UITextContentViewAccessibility _accessibilitySetBoolValue:forKey:](v8, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXAttrCacheIsClean"));
  v4 = v6;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (unint64_t)_accessibilityAutomationType
{
  return 52;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  return (id)-[UITextContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("webView"), a2, self);
}

- (void)keyboardInputChangedSelection:(id)a3
{
  objc_super v3;
  id location[2];
  UITextContentViewAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UITextContentViewAccessibility;
  -[UITextContentViewAccessibility keyboardInputChangedSelection:](&v3, sel_keyboardInputChangedSelection_, location[0]);
  _UIAccessibilitySetAssociatedElementContextForNextNotification();
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB0B0], 0);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  NSUInteger length;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  objc_super v20;
  id location;
  id v22;
  id v23;
  id v24;
  _NSRange *v25;
  SEL v26;
  UITextContentViewAccessibility *v27;
  NSUInteger v28;
  NSUInteger v29;

  v27 = self;
  v26 = a2;
  v25 = a3;
  v24 = 0;
  v23 = (id)-[UITextContentViewAccessibility _accessibilityAXAttributedValue](self, "_accessibilityAXAttributedValue");
  v22 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (id)objc_msgSend(v23, "cfAttributedString");
    v4 = v22;
    v22 = v3;

  }
  else if (v23)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v23);
    v6 = v22;
    v22 = v5;

  }
  length = v25->length;
  v28 = v25->location;
  v29 = length;
  if (v28 + length <= objc_msgSend(v23, "length"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v19 = (id)objc_msgSend(v22, "attributedSubstringFromRange:", v25->location, v25->length);
      v8 = (void *)objc_msgSend(v19, "mutableCopy");
      v9 = v24;
      v24 = v8;

    }
  }
  if (!v24)
  {
    location = (id)-[UITextContentViewAccessibility safeValueForKey:](v27, "safeValueForKey:", CFSTR("m_webView"));
    if ((objc_msgSend(location, "_accessibilityIsWebDocumentView") & 1) != 0)
    {
      v18 = (id)objc_msgSend(location, "_accessibilityAttributedValueForRange:", v25);
      v10 = (void *)objc_msgSend(v18, "mutableCopy");
      v11 = v24;
      v24 = v10;

    }
    if (!objc_msgSend(v24, "length"))
    {
      v20.receiver = v27;
      v20.super_class = (Class)UITextContentViewAccessibility;
      v17 = -[UITextContentViewAccessibility _accessibilityAttributedValueForRange:](&v20, sel__accessibilityAttributedValueForRange_, v25);
      v12 = (void *)objc_msgSend(v17, "mutableCopy");
      v13 = v24;
      v24 = v12;

    }
    objc_storeStrong(&location, 0);
  }
  -[UITextContentViewAccessibility _accessibilityConvertStyleAttributesToAccessibility:](v27, "_accessibilityConvertStyleAttributesToAccessibility:", v24, &v24);
  -[UITextContentViewAccessibility _accessibilityAddMispellingsToAttributedString:](v27, "_accessibilityAddMispellingsToAttributedString:", v24);
  v16 = v24;
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(v15, 0);
  return v16;
}

- (id)accessibilityValue
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;
  id v11;
  id v12;
  char v13;
  id v14[2];
  UITextContentViewAccessibility *v15;

  v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)-[UITextContentViewAccessibility accessibilityUserDefinedValue](self, "accessibilityUserDefinedValue");
  if (!v14[0])
  {
    v14[0] = (id)-[UITextContentViewAccessibility safeValueForKey:](v15, "safeValueForKey:", CFSTR("attributedText"));

    v2 = (id)UIAccessibilityConvertAttachmentsInAttributedStringToAX();
    v3 = v14[0];
    v14[0] = v2;

    if (!v14[0])
    {
      v14[0] = (id)-[UITextContentViewAccessibility safeValueForKey:](v15, "safeValueForKey:", CFSTR("text"));

    }
  }
  v4 = -[UITextContentViewAccessibility accessibilityTraits](v15, "accessibilityTraits");
  if ((v4 & *MEMORY[0x24BEBB168]) == *MEMORY[0x24BEBB168])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (id)objc_msgSend(v14[0], "string");
      v6 = v14[0];
      v14[0] = v5;

    }
    v13 = 0;
    objc_opt_class();
    v12 = (id)__UIAccessibilityCastAsClass();
    v11 = v12;
    objc_storeStrong(&v12, 0);
    v7 = -[UIView _accessibilitySecureTextForString:]((uint64_t)v11, v14[0]);
    v8 = v14[0];
    v14[0] = v7;

  }
  v10 = v14[0];
  objc_storeStrong(v14, 0);
  return v10;
}

- (BOOL)isAccessibilityElement
{
  id location[3];
  char v4;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITextContentViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  if (location[0])
    v4 = objc_msgSend(location[0], "BOOLValue") & 1;
  else
    v4 = 1;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (CGRect)accessibilityFrame
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id location[2];
  UITextContentViewAccessibility *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect result;

  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  v29 = (id)-[UITextContentViewAccessibility superview](self, "superview");
  while (v29)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong(location, v29);
      break;
    }
    v2 = (id)objc_msgSend(v29, "superview");
    v3 = v29;
    v29 = v2;

  }
  if (location[0])
  {
    -[UITextContentViewAccessibility bounds](v31, "bounds");
    v25 = v4;
    v26 = v5;
    v27 = v6;
    objc_msgSend(location[0], "bounds");
    v21 = v7;
    v22 = v8;
    v23 = v9;
    v24 = v10;
    v28 = v10;
    UIAccessibilityFrameForBounds();
  }
  else
  {
    v19.receiver = v31;
    v19.super_class = (Class)UITextContentViewAccessibility;
    -[UITextContentViewAccessibility accessibilityFrame](&v19, sel_accessibilityFrame);
  }
  v32 = v11;
  v33 = v12;
  v34 = v13;
  v35 = v14;
  v20 = 1;
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  v15 = v32;
  v16 = v33;
  v17 = v34;
  v18 = v35;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)_accessibilityAttributedTextRetrieval
{
  return (id)-[UITextContentViewAccessibility attributedText](self, "attributedText", a2, self);
}

- (id)accessibilityCustomRotors
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7[2];
  UITextContentViewAccessibility *v8;

  v8 = self;
  v7[1] = (id)a2;
  v7[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (id)-[UITextContentViewAccessibility _accessibilityInternalTextLinkCustomRotors](v8, "_accessibilityInternalTextLinkCustomRotors");
  objc_msgSend(v7[0], "axSafelyAddObjectsFromArray:");

  if ((-[UITextContentViewAccessibility isEditable](v8, "isEditable") & 1) != 0)
  {
    v5 = (id)-[UITextContentViewAccessibility _accessibilityCommonStylingRotors](v8, "_accessibilityCommonStylingRotors");
    objc_msgSend(v7[0], "axSafelyAddObjectsFromArray:");

    if (!AXUIKeyboardTypeSupportsMisspelledRotor(-[UITextContentViewAccessibility keyboardType](v8, "keyboardType")))
    {
      v4 = (id)-[UITextContentViewAccessibility _accessibilityMisspelledRotor](v8, "_accessibilityMisspelledRotor");
      objc_msgSend(v7[0], "removeObject:");

    }
  }
  v3 = v7[0];
  objc_storeStrong(v7, 0);
  return v3;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  id v6;
  id v7;
  BOOL v8;
  id v9;
  id v10;
  char v11;
  id v12;
  char v13;
  UITextContentViewAccessibility *v14;
  char v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  SEL v20;
  UITextContentViewAccessibility *v21;

  v21 = self;
  v20 = a2;
  v19 = 0;
  if ((-[UITextContentViewAccessibility isEditable](self, "isEditable") & 1) != 0)
    v19 = *MEMORY[0x24BEBB198] | *MEMORY[0x24BDFF000];
  else
    v19 = *MEMORY[0x24BDF7410] | *MEMORY[0x24BDFF000];
  v6 = (id)-[UITextContentViewAccessibility safeValueForKey:](v21, "safeValueForKey:", CFSTR("selectedRange"));
  v17 = objc_msgSend(v6, "rangeValue");
  v18 = v2;

  v7 = (id)-[UITextContentViewAccessibility safeValueForKey:](v21, "safeValueForKey:", CFSTR("isEditing"));
  v15 = 0;
  v13 = 0;
  v8 = 0;
  if ((objc_msgSend(v7, "BOOLValue") & 1) != 0)
  {
    v8 = 0;
    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = (id)-[UITextContentViewAccessibility _accessibilityWindow](v21, "_accessibilityWindow");
      v15 = 1;
      v14 = (UITextContentViewAccessibility *)(id)objc_msgSend(v16, "firstResponder");
      v13 = 1;
      v8 = v14 == v21;
    }
  }
  if ((v13 & 1) != 0)

  if ((v15 & 1) != 0)
  if (v8
    && ((objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityHardwareKeyboardActive") & 1) != 0
     || (objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySoftwareKeyboardActive") & 1) != 0
     || _AXSMossdeepEnabled()))
  {
    v19 |= *MEMORY[0x24BEBB128];
  }
  v12 = (id)-[UITextContentViewAccessibility accessibilityUserDefinedTraits](v21, "accessibilityUserDefinedTraits");
  if (v12)
    v19 |= objc_msgSend(v12, "unsignedLongLongValue");
  v11 = 0;
  objc_opt_class();
  v10 = (id)__UIAccessibilityCastAsClass();
  v9 = v10;
  objc_storeStrong(&v10, 0);
  v3 = -[UIView _accessibilityTextAreaTraits](v9);
  v19 |= v3;

  v5 = v19;
  objc_storeStrong(&v12, 0);
  return v5;
}

- (CGPoint)accessibilityActivationPoint
{
  unint64_t v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double v7;
  double v8;
  id v9;
  id v10;
  objc_super v11;
  CGRect v12;
  SEL v13;
  UITextContentViewAccessibility *v14;
  CGPoint result;

  v14 = self;
  v13 = a2;
  v2 = -[UITextContentViewAccessibility accessibilityTraits](self, "accessibilityTraits");
  if ((v2 & *MEMORY[0x24BEBB128]) != 0)
  {
    v10 = (id)-[UITextContentViewAccessibility safeValueForKey:](v14, "safeValueForKey:", CFSTR("m_webView"));
    v9 = (id)objc_msgSend(v10, "safeValueForKey:", CFSTR("caretRect"));
    objc_msgSend(v9, "rectValue");

    UIAccessibilityFrameForBounds();
    v12.origin.x = v3;
    v12.origin.y = v4;
    v12.size.width = v5;
    v12.size.height = v6;
    CGRectGetMidX(v12);
    CGRectGetMidY(v12);
    CGPointMake_8();
  }
  else
  {
    v11.receiver = v14;
    v11.super_class = (Class)UITextContentViewAccessibility;
    -[UITextContentViewAccessibility accessibilityActivationPoint](&v11, sel_accessibilityActivationPoint);
  }
  result.y = v8;
  result.x = v7;
  return result;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[UITextContentViewAccessibility selectedRange](self, "selectedRange", a2, self);
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  id location[2];
  UITextContentViewAccessibility *v4;
  _NSRange v5;
  NSUInteger v6;
  uint64_t v7;

  v5 = a3;
  v4 = self;
  location[1] = (id)a2;
  location[0] = -[UITextContentViewAccessibility accessibilityValue](self, "accessibilityValue");
  if (!location[0])
  {
    location[0] = (id)-[UITextContentViewAccessibility accessibilityLabel](v4, "accessibilityLabel");

  }
  if (v5.length || (v6 = v5.location, v7 = 0, v5.location > objc_msgSend(location[0], "length")))
  {
    if (v5.length)
      -[NSObject _accessibilitySetTextSelection:](v4, v5.location, v5.length);
  }
  else
  {
    -[UITextContentViewAccessibility setSelectedRange:](v4, "setSelectedRange:", v5.location, v5.length);
  }
  objc_storeStrong(location, 0);
}

- (BOOL)keyboardInput:(id)a3 shouldReplaceTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  char v6;
  objc_super v8;
  char v9;
  id v10;
  id location[2];
  UITextContentViewAccessibility *v12;
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
  v8.super_class = (Class)UITextContentViewAccessibility;
  v9 = -[UITextContentViewAccessibility keyboardInput:shouldReplaceTextInRange:replacementText:](&v8, sel_keyboardInput_shouldReplaceTextInRange_replacementText_, location[0], v13.location, v13.length, v10);
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
  UITextContentViewAccessibility *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11 = a5;
  v10 = 0;
  v9.receiver = v14;
  v9.super_class = (Class)UITextContentViewAccessibility;
  v10 = -[UITextContentViewAccessibility keyboardInput:shouldInsertText:isMarkedText:](&v9, sel_keyboardInput_shouldInsertText_isMarkedText_, location[0], v12, a5);
  if ((v10 & 1) == 0)
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAFE0], 0);
  v6 = v10;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (id)_accessibilityCapturedImages
{
  return 0;
}

@end
