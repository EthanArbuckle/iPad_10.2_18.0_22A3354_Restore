@implementation UIAccessibilityElementMockView

- (void)setView:(id *)a1
{
  id v2;
  id v3;
  id location;
  id *v5;

  v5 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v5)
  {
    objc_msgSend(v5[9], "setAccessibilityContainer:");
    objc_msgSend(location, "setAccessibilityContainer:", 0);
    objc_storeStrong(v5 + 9, location);
    v2 = v5[9];
    v3 = (id)objc_msgSend(v5, "accessibilityContainer");
    objc_msgSend(v2, "setAccessibilityContainer:");

  }
  objc_storeStrong(&location, 0);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  char v5;
  id location;
  SEL v7;
  SEL v8;
  UIAccessibilityElementMockView *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v5 = -[UIView canPerformAction:withSender:](v9->_view, "canPerformAction:withSender:", v7, location);
  objc_storeStrong(&location, 0);
  return v5 & 1;
}

- (id)_accessibilityScrollAncestor
{
  return (id)-[UIView _accessibilityScrollAncestor](self->_view, "_accessibilityScrollAncestor", a2, self);
}

- (id)accessibilityCustomRotors
{
  return (id)-[UIView accessibilityCustomRotors](self->_view, "accessibilityCustomRotors", a2, self);
}

- (id)accessibilityCustomActions
{
  return (id)-[UIView accessibilityCustomActions](self->_view, "accessibilityCustomActions", a2, self);
}

- (void)_accessibilitySetValue:(id)a3
{
  id location[2];
  UIAccessibilityElementMockView *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[UIView _accessibilitySetValue:](v4->_view, "_accessibilitySetValue:", location[0]);
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return -[UIView _accessibilitySupportsActivateAction](self->_view, "_accessibilitySupportsActivateAction", a2, self) & 1;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  id v3;
  id v4;
  char v6;
  BOOL v7;
  id location;
  char v9;
  int64_t v10;
  SEL v11;
  UIAccessibilityElementMockView *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  v9 = 0;
  location = self->_view;
  while (1)
  {
    v7 = 0;
    if ((v9 & 1) == 0)
    {
      objc_opt_class();
      v7 = 0;
      if ((objc_opt_isKindOfClass() & 1) == 0)
        v7 = location != 0;
    }
    if (!v7)
      break;
    v9 = objc_msgSend(location, "accessibilityScroll:", v10) & 1;
    if (!v9 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((unint64_t)(v10 - 1) <= 3)
        __asm { BR              X8 }
      v9 = objc_msgSend(location, "_accessibilityScrollPageInDirection:", 0) & 1;
    }
    v3 = (id)objc_msgSend(location, "superview");
    v4 = location;
    location = v3;

  }
  if ((v9 & 1) != 0)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  v6 = v9;
  objc_storeStrong(&location, 0);
  return v6 & 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v5;
  id location[2];
  UIAccessibilityElementMockView *v7;
  CGPoint v8;

  v8 = a3;
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v5 = (id)-[UIView _accessibilityHitTest:withEvent:](v7->_view, "_accessibilityHitTest:withEvent:", location[0], v8.x, v8.y);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)_accessibilityUserTestingProxyView
{
  return self->_view;
}

- (void)revalidate
{
  id v1;
  id WeakRetained;
  uint64_t v3;
  id obj;
  id v5;
  BOOL v6;
  id location;
  uint64_t v8;

  v8 = a1;
  if (a1)
  {
    v1 = (id)AXRetainAutorelease();
    WeakRetained = objc_loadWeakRetained((id *)(v8 + 56));
    v6 = WeakRetained == 0;

    if (!v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        location = (id)objc_msgSend(*(id *)(v8 + 72), "superview");
        if (!location || (objc_msgSend(*(id *)(v8 + 72), "isHiddenOrHasHiddenAncestor") & 1) != 0)
        {
          objc_msgSend(*(id *)(v8 + 72), "setAccessibilityContainer:", 0x255EA6000uLL, 0);
          objc_storeStrong((id *)(v8 + *(int *)(v3 + 3760)), obj);
          v5 = objc_loadWeakRetained((id *)(v8 + 56));
          objc_msgSend(v5, "updateMockView:", v8);

        }
        objc_storeStrong(&location, 0);
      }
      else
      {
        objc_storeStrong((id *)(v8 + 72), 0);
      }
    }
  }
}

- (BOOL)isAccessibilityElement
{
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  return -[UIView isAccessibilityElement](self->_view, "isAccessibilityElement") & 1;
}

- (id)accessibilityLabel
{
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  return (id)-[UIView _accessibilityAXAttributedLabel](self->_view, "_accessibilityAXAttributedLabel");
}

- (id)accessibilityLanguage
{
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  return (id)-[UIView accessibilityLanguage](self->_view, "accessibilityLanguage");
}

- (_NSRange)accessibilityRowRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  v2 = -[UIView accessibilityRowRange](self->_view, "accessibilityRowRange");
  result.length = v3;
  result.location = v2;
  return result;
}

- (unint64_t)_accessibilityAutomationType
{
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  return -[UIView _accessibilityAutomationType](self->_view, "_accessibilityAutomationType");
}

- (id)accessibilityIdentification
{
  return (id)-[UIView accessibilityIdentification](self->_view, "accessibilityIdentification", a2, self);
}

- (id)accessibilityIdentifier
{
  return (id)-[UIView accessibilityIdentifier](self->_view, "accessibilityIdentifier", a2, self);
}

- (id)accessibilityValue
{
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  return (id)-[UIView _accessibilityAXAttributedValue](self->_view, "_accessibilityAXAttributedValue");
}

- (id)_accessibilityAbsoluteValue
{
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  return (id)-[UIView _accessibilityAbsoluteValue](self->_view, "_accessibilityAbsoluteValue");
}

- (double)_accessibilityMaxValue
{
  double result;

  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  -[UIView _accessibilityMaxValue](self->_view, "_accessibilityMaxValue");
  return result;
}

- (double)_accessibilityMinValue
{
  double result;

  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  -[UIView _accessibilityMinValue](self->_view, "_accessibilityMinValue");
  return result;
}

- (id)_accessibilityUserTestingElementType
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (CGPoint)accessibilityActivationPoint
{
  uint64_t v2;
  uint64_t v3;
  UIView *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  id v9;
  BOOL v10;
  __int128 v11;
  __int128 v13;
  CGPoint result;

  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  -[UIView accessibilityActivationPoint](self->_view, "accessibilityActivationPoint");
  *(_QWORD *)&v11 = v2;
  *((_QWORD *)&v11 + 1) = v3;
  v4 = -[UIView superview](self->_view, "superview");
  v10 = v4 != 0;

  if (v10)
  {
    v13 = v11;
  }
  else
  {
    v9 = (id)-[UIAccessibilityElementMockView accessibilityContainer](self, "accessibilityContainer");
    objc_msgSend(v9, "accessibilityActivationPoint");
    *(_QWORD *)&v13 = v5;
    *((_QWORD *)&v13 + 1) = v6;

  }
  v8 = *((double *)&v13 + 1);
  v7 = *(double *)&v13;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGRect)accessibilityFrame
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v14;
  __int128 v15;
  CGRect v16;
  CGRect result;

  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  -[UIView accessibilityFrame](self->_view, "accessibilityFrame");
  *(CGFloat *)&v14 = v16.origin.x;
  *((_QWORD *)&v14 + 1) = *(_QWORD *)&v16.origin.y;
  *(CGFloat *)&v15 = v16.size.width;
  *((_QWORD *)&v15 + 1) = *(_QWORD *)&v16.size.height;
  if (CGRectIsEmpty(v16))
  {
    v10 = (id)-[UIAccessibilityElementMockView accessibilityContainer](self, "accessibilityContainer");
    objc_msgSend(v10, "accessibilityFrame");
    *(_QWORD *)&v11 = v2;
    *((_QWORD *)&v11 + 1) = v3;
    *(_QWORD *)&v12 = v4;
    *((_QWORD *)&v12 + 1) = v5;
    v14 = v11;
    v15 = v12;

  }
  v7 = *((double *)&v14 + 1);
  v6 = *(double *)&v14;
  v9 = *((double *)&v15 + 1);
  v8 = *(double *)&v15;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  objc_super v4;
  id v5;
  SEL v6;
  UIAccessibilityElementMockView *v7;

  v7 = self;
  v6 = a2;
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  v5 = 0;
  v4.receiver = v7;
  v4.super_class = (Class)UIAccessibilityElementMockView;
  v5 = -[UIAccessibilityElementMockView accessibilityTraits](&v4, sel_accessibilityTraits);
  v3 = (unint64_t)v5;
  return v3 | -[UIView accessibilityTraits](v7->_view, "accessibilityTraits");
}

- (id)accessibilityHint
{
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  return (id)-[UIView _accessibilityAXAttributedHint](self->_view, "_accessibilityAXAttributedHint");
}

- (BOOL)_accessibilityHasNativeFocus
{
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  return -[UIView _accessibilityHasNativeFocus](self->_view, "_accessibilityHasNativeFocus") & 1;
}

- (void)accessibilityElementDidLoseFocus
{
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  -[UIView accessibilityElementDidLoseFocus](self->_view, "accessibilityElementDidLoseFocus");
}

- (void)accessibilityElementDidBecomeFocused
{
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  -[UIView accessibilityElementDidBecomeFocused](self->_view, "accessibilityElementDidBecomeFocused");
}

- (void)accessibilityIncrement
{
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  -[UIView accessibilityIncrement](self->_view, "accessibilityIncrement");
}

- (void)accessibilityDecrement
{
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  -[UIView accessibilityDecrement](self->_view, "accessibilityDecrement");
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return -[UIView _accessibilityHitTestShouldFallbackToNearestChild](self->_view, "_accessibilityHitTestShouldFallbackToNearestChild", a2, self) & 1;
}

- (id)accessibilityElements
{
  return (id)-[UIView accessibilityElements](self->_view, "accessibilityElements", a2, self);
}

- (BOOL)_accessibilityScrollToVisible
{
  id v3;
  objc_super v4;
  SEL v5;
  UIAccessibilityElementMockView *v6;
  char v7;

  v6 = self;
  v5 = a2;
  v3 = (id)-[UIAccessibilityElementMockView _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());

  if (v3)
  {
    v4.receiver = v6;
    v4.super_class = (Class)UIAccessibilityElementMockView;
    v7 = -[UIAccessibilityElementMockView _accessibilityScrollToVisible](&v4, sel__accessibilityScrollToVisible);
  }
  else
  {
    v7 = -[UIView _accessibilityScrollToVisible](v6->_view, "_accessibilityScrollToVisible") & 1;
  }
  return v7 & 1;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  return (id)-[UIView _accessibilityTextViewTextOperationResponder](self->_view, "_accessibilityTextViewTextOperationResponder", a2, self);
}

- (CGPoint)_accessibilityMinScrubberPosition
{
  double v2;
  double v3;
  CGPoint result;

  -[UIView _accessibilityMinScrubberPosition](self->_view, "_accessibilityMinScrubberPosition", a2, self);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)_accessibilityMaxScrubberPosition
{
  double v2;
  double v3;
  CGPoint result;

  -[UIView _accessibilityMaxScrubberPosition](self->_view, "_accessibilityMaxScrubberPosition", a2, self);
  result.y = v3;
  result.x = v2;
  return result;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[UIView _accessibilitySelectedTextRange](self->_view, "_accessibilitySelectedTextRange", a2, self);
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  -[UIView _accessibilitySetSelectedTextRange:](self->_view, "_accessibilitySetSelectedTextRange:", a3.location, a3.length, a2, self, a3.location, a3.length);
}

- (_NSRange)_accessibilityVisibleTextRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[UIView _accessibilityVisibleTextRange](self->_view, "_accessibilityVisibleTextRange", a2, self);
  result.length = v3;
  result.location = v2;
  return result;
}

- (BOOL)accessibilityPerformMagicTap
{
  return -[UIView accessibilityPerformMagicTap](self->_view, "accessibilityPerformMagicTap", a2, self) & 1;
}

- (BOOL)_accessibilityCanPerformEscapeAction
{
  objc_class *v2;
  objc_class *v3;

  if ((-[UIView safeBoolForKey:](self->_view, "safeBoolForKey:", CFSTR("_accessibilityUIViewCanPerformEscapeAction")) & 1) != 0)
    return 1;
  if (!_accessibilityCanPerformEscapeAction_BaseNSObjectMethod)
  {
    v2 = (objc_class *)objc_opt_class();
    _accessibilityCanPerformEscapeAction_BaseNSObjectMethod = (uint64_t)class_getInstanceMethod(v2, sel_accessibilityPerformEscape);
  }
  v3 = (objc_class *)objc_opt_class();
  return class_getInstanceMethod(v3, sel_accessibilityPerformEscape) != (Method)_accessibilityCanPerformEscapeAction_BaseNSObjectMethod;
}

- (BOOL)accessibilityPerformEscape
{
  return -[UIView accessibilityPerformEscape](self->_view, "accessibilityPerformEscape", a2, self) & 1;
}

- (BOOL)accessibilityActivate
{
  return -[UIView accessibilityActivate](self->_view, "accessibilityActivate", a2, self) & 1;
}

- (BOOL)becomeFirstResponder
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UIView becomeFirstResponder](self->_view, "becomeFirstResponder") & 1;
  else
    return 0;
}

- (int64_t)_accessibilityPageCount
{
  return -[UIView _accessibilityPageCount](self->_view, "_accessibilityPageCount", a2, self);
}

- (int64_t)_accessibilityPageIndex
{
  return -[UIView _accessibilityPageIndex](self->_view, "_accessibilityPageIndex", a2, self);
}

- (void)setAccessibilityContainer:(id)a3
{
  objc_super v3;
  id location[2];
  UIAccessibilityElementMockView *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIAccessibilityElementMockView;
  -[UIAccessibilityElementMockView setAccessibilityContainer:](&v3, sel_setAccessibilityContainer_, location[0]);
  -[UIView setAccessibilityContainer:](v5->_view, "setAccessibilityContainer:", location[0]);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityUserTestingParent
{
  return (id)-[UIView _accessibilityUserTestingParent](self->_view, "_accessibilityUserTestingParent", a2, self);
}

- (id)automationElements
{
  return (id)-[UIView automationElements](self->_view, "automationElements", a2, self);
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  UIAccessibilityElementMockView *v4;

  v4 = self;
  v3 = a2;
  -[UIView setAccessibilityContainer:](self->_view, "setAccessibilityContainer:", 0);
  v2.receiver = v4;
  v2.super_class = (Class)UIAccessibilityElementMockView;
  -[UIAccessibilityElementMockView dealloc](&v2, sel_dealloc);
}

- (int64_t)accessibilityCompareGeometry:(id)a3
{
  int64_t v4;
  id location[2];
  UIAccessibilityElementMockView *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[UIView accessibilityCompareGeometry:](v6->_view, "accessibilityCompareGeometry:", location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)description
{
  id v3;
  id v4;
  void *v5;
  id v6;
  objc_super v7;
  id location;
  id v9;
  id v10[2];
  UIAccessibilityElementMockView *v11;

  v11 = self;
  v10[1] = (id)a2;
  v10[0] = self->_view;
  v9 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("$%@$"), v10[0]);
  v7.receiver = v11;
  v7.super_class = (Class)UIAccessibilityElementMockView;
  location = -[UIAccessibilityElementMockView description](&v7, sel_description);
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = 0;
  else
    v4 = location;
  v3 = (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v4);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(v10, 0);
  return v3;
}

- (int64_t)accessibilityElementCount
{
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  return -[UIView accessibilityElementCount](self->_view, "accessibilityElementCount");
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  return (id)-[UIView accessibilityElementAtIndex:](self->_view, "accessibilityElementAtIndex:", a3);
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  int64_t v4;
  id location[2];
  UIAccessibilityElementMockView *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[UIAccessibilityElementMockView revalidate]((uint64_t)v6);
  v4 = -[UIView indexOfAccessibilityElement:](v6->_view, "indexOfAccessibilityElement:", location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_accessibilityScannerGroupElements
{
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  return (id)-[UIView _accessibilityScannerGroupElements](self->_view, "_accessibilityScannerGroupElements");
}

- (BOOL)_accessibilityIsScannerGroup
{
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  return -[UIView _accessibilityIsScannerGroup](self->_view, "_accessibilityIsScannerGroup") & 1;
}

- (unint64_t)_accessibilityScannerGroupTraits
{
  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  return -[UIView _accessibilityScannerGroupTraits](self->_view, "_accessibilityScannerGroupTraits");
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  unint64_t v2;
  BOOL v4;

  -[UIAccessibilityElementMockView revalidate]((uint64_t)self);
  v4 = 0;
  v2 = -[UIAccessibilityElementMockView accessibilityTraits](self, "accessibilityTraits");
  if ((v2 & *MEMORY[0x24BEBB178]) == 0)
    return -[UIView accessibilityRespondsToUserInteraction](self->_view, "accessibilityRespondsToUserInteraction") & 1;
  return v4;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return -[UIView _accessibilityIsSpeakThisElement](self->_view, "_accessibilityIsSpeakThisElement", a2, self) & 1;
}

- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3
{
  return (id)-[UIView _accessibilityLineNumberAndColumnForPoint:](self->_view, "_accessibilityLineNumberAndColumnForPoint:", a3.x, a3.y, a2, self, *(_QWORD *)&a3.x, *(_QWORD *)&a3.y);
}

- (BOOL)_accessibilityUpdatesSwitchMenu
{
  return -[UIView _accessibilityUpdatesSwitchMenu](self->_view, "_accessibilityUpdatesSwitchMenu", a2, self) & 1;
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIView _accessibilityBoundsForRange:](self->_view, "_accessibilityBoundsForRange:", a3.location, a3.length, a2, self, a3.location, a3.length);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (_NSRange)_accessibilityCharacterRangeForPosition:(unint64_t)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[UIView _accessibilityCharacterRangeForPosition:](self->_view, "_accessibilityCharacterRangeForPosition:", a3);
  result.length = v4;
  result.location = v3;
  return result;
}

- (_NSRange)_accessibilityLineRangeForPosition:(unint64_t)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[UIView _accessibilityLineRangeForPosition:](self->_view, "_accessibilityLineRangeForPosition:", a3);
  result.length = v4;
  result.location = v3;
  return result;
}

- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  id location[2];
  UIAccessibilityElementMockView *v7;
  uint64_t v8;
  NSUInteger v9;
  _NSRange result;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = -[UIView _accessibilityRangeForLineNumberAndColumn:](v7->_view, "_accessibilityRangeForLineNumberAndColumn:", location[0]);
  v9 = v3;
  objc_storeStrong(location, 0);
  v4 = v8;
  v5 = v9;
  result.length = v5;
  result.location = v4;
  return result;
}

- (unint64_t)_accessibilityPositionInDirection:(int64_t)a3 offset:(unint64_t)a4 forPosition:(unint64_t)a5
{
  return -[UIView _accessibilityPositionInDirection:offset:forPosition:](self->_view, "_accessibilityPositionInDirection:offset:forPosition:", a3, a4, a5);
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)setDelegate:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 7, a2);
  return result;
}

- (uint64_t)subviewIndex
{
  if (a1)
    return *(_QWORD *)(a1 + 64);
  else
    return 0;
}

- (uint64_t)setSubviewIndex:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 64) = a2;
  return result;
}

- (uint64_t)view
{
  if (a1)
    return *(_QWORD *)(a1 + 72);
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
