@implementation _AXUITextViewParagraphElement

- (uint64_t)links
{
  if (a1)
    return *(_QWORD *)(a1 + 72);
  else
    return 0;
}

- (id)initWithAccessibilityContainer:(uint64_t)a3 textRange:(uint64_t)a4 links:(void *)a5
{
  id v5;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  objc_super v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  int v26;
  int v27;
  double (*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;
  id from;
  id v33;
  _QWORD __b[8];
  id v35;
  objc_super v36;
  int v37;
  id v38;
  id location;
  id v40;
  __int128 v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v41 = a3;
  *((_QWORD *)&v41 + 1) = a4;
  v40 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  v38 = 0;
  objc_storeStrong(&v38, a5);
  if (v40)
  {
    v5 = v40;
    v40 = 0;
    v36.receiver = v5;
    v36.super_class = (Class)_AXUITextViewParagraphElement;
    v40 = objc_msgSendSuper2(&v36, sel_initWithAccessibilityContainer_, location);
    objc_storeStrong(&v40, v40);
    if (v40)
    {
      *((_OWORD *)v40 + 5) = v41;
      objc_storeStrong((id *)v40 + 9, v38);
      memset(__b, 0, sizeof(__b));
      v13 = v38;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", __b, v43, 16);
      if (v14)
      {
        v10 = *(_QWORD *)__b[2];
        v11 = 0;
        v12 = v14;
        while (1)
        {
          v9 = v11;
          if (*(_QWORD *)__b[2] != v10)
            objc_enumerationMutation(v13);
          v35 = *(id *)(__b[1] + 8 * v11);
          objc_msgSend(v35, "setAccessibilityContainer:", v40);
          objc_initWeak(&v33, v35);
          objc_initWeak(&from, location);
          v8 = v35;
          v25 = MEMORY[0x24BDAC760];
          v26 = -1073741824;
          v27 = 0;
          v28 = __80___AXUITextViewParagraphElement_initWithAccessibilityContainer_textRange_links___block_invoke;
          v29 = &unk_24FF3FB70;
          objc_copyWeak(&v30, &from);
          objc_copyWeak(&v31, &v33);
          objc_msgSend(v8, "_setAccessibilityFrameBlock:", &v25);
          v7 = v35;
          v18 = MEMORY[0x24BDAC760];
          v19 = -1073741824;
          v20 = 0;
          v21 = __80___AXUITextViewParagraphElement_initWithAccessibilityContainer_textRange_links___block_invoke_2;
          v22 = &unk_24FF3FB98;
          objc_copyWeak(&v23, &from);
          objc_copyWeak(&v24, &v33);
          objc_msgSend(v7, "_setAccessibilityActivateBlock:", &v18);
          objc_destroyWeak(&v24);
          objc_destroyWeak(&v23);
          objc_destroyWeak(&v31);
          objc_destroyWeak(&v30);
          objc_destroyWeak(&from);
          objc_destroyWeak(&v33);
          ++v11;
          if (v9 + 1 >= v12)
          {
            v11 = 0;
            v12 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", __b, v43, 16);
            if (!v12)
              break;
          }
        }
      }

      v17 = 0;
      v16.receiver = v40;
      v16.super_class = (Class)_AXUITextViewParagraphElement;
      v17 = (unint64_t)objc_msgSendSuper2(&v16, sel_accessibilityTraits) | *MEMORY[0x24BDF7410];
      if ((objc_msgSend(location, "isSelectable") & 1) != 0)
        v17 |= *MEMORY[0x24BDFF000];
      objc_msgSend(v40, "setAccessibilityTraits:", v17);
    }
    v42 = v40;
    v37 = 1;
  }
  else
  {
    v42 = 0;
    v37 = 1;
  }
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v40, 0);
  return v42;
}

- (void)set_accessibilityContent:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (id)accessibilityLabel
{
  objc_super v3;
  SEL v4;
  _AXUITextViewParagraphElement *v5;
  id v6;

  v5 = self;
  v4 = a2;
  if (AXDoesRequestingClientDeserveAutomation())
  {
    v6 = (id)-[_AXUITextViewParagraphElement _accessibilityContent]((uint64_t)v5);
  }
  else
  {
    v3.receiver = v5;
    v3.super_class = (Class)_AXUITextViewParagraphElement;
    v6 = -[_AXUITextViewParagraphElement accessibilityLabel](&v3, sel_accessibilityLabel);
  }
  return v6;
}

- (uint64_t)_accessibilityContent
{
  if (a1)
    return *(_QWORD *)(a1 + 56);
  else
    return 0;
}

- (id)accessibilityValue
{
  if (AXDoesRequestingClientDeserveAutomation())
    return 0;
  else
    return (id)-[_AXUITextViewParagraphElement _accessibilityContent]((uint64_t)self);
}

- (_NSRange)_accessibilitySelectedTextRange
{
  NSUInteger v2;
  NSUInteger length;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  id v7;
  BOOL v8;
  id v9;
  objc_super v10;
  int v11;
  unint64_t v12;
  NSUInteger v13;
  id v14;
  id v15;
  char v16;
  id v17[2];
  _AXUITextViewParagraphElement *v18;
  id v19;
  NSUInteger v20;
  NSUInteger location;
  NSUInteger v22;
  NSUInteger v23;
  void *v24;
  void *v25;
  NSUInteger v26;
  _NSRange result;

  v18 = self;
  v17[1] = (id)a2;
  v16 = 0;
  v9 = (id)-[_AXUITextViewParagraphElement accessibilityContainer](self, "accessibilityContainer");
  v15 = (id)__UIAccessibilitySafeClass();

  v14 = v15;
  objc_storeStrong(&v15, 0);
  v17[0] = v14;
  v12 = objc_msgSend(v14, "_accessibilitySelectedTextRange");
  v13 = v2;
  if ((objc_msgSend(v17[0], "isEditable") & 1) == 0)
  {
    v7 = (id)objc_msgSend(v17[0], "text");
    v8 = v12 != objc_msgSend(v7, "length");

    if (!v8)
      v12 = 0;
  }
  if (v12 < v18->_textRange.location
    || (length = v18->_textRange.length, location = v18->_textRange.location, v22 = length, v12 > location + length))
  {
    v10.receiver = v18;
    v10.super_class = (Class)_AXUITextViewParagraphElement;
    v19 = -[_AXUITextViewParagraphElement _accessibilitySelectedTextRange](&v10, sel__accessibilitySelectedTextRange);
    v20 = v4;
    v11 = 1;
  }
  else
  {
    v24 = (void *)(v12 - v18->_textRange.location);
    v23 = v13;
    v25 = v24;
    v26 = v13;
    v19 = v24;
    v20 = v13;
    v11 = 1;
  }
  objc_storeStrong(v17, 0);
  v5 = (NSUInteger)v19;
  v6 = v20;
  result.length = v6;
  result.location = v5;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  char v8;
  id v9[2];
  _AXUITextViewParagraphElement *v10;
  _NSRange v11;

  v11 = a3;
  v10 = self;
  v9[1] = (id)a2;
  v8 = 0;
  v5 = (id)-[_AXUITextViewParagraphElement accessibilityContainer](self, "accessibilityContainer");
  v7 = (id)__UIAccessibilitySafeClass();

  v6 = v7;
  objc_storeStrong(&v7, 0);
  v9[0] = v6;
  objc_msgSend(v6, "_accessibilitySelectedTextRange");
  if (!v3)
    objc_msgSend(v9[0], "select:", v10);
  v11.location += v10->_textRange.location;
  v4 = (id)-[_AXUITextViewParagraphElement accessibilityContainer](v10, "accessibilityContainer");
  objc_msgSend(v4, "_accessibilitySetSelectedTextRange:", v11.location, v11.length);

  objc_storeStrong(v9, 0);
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  id v3;
  BOOL v4;
  BOOL v5;

  if (self->__accessibilityRespondsToUserInteractionOverride)
    return -[NSNumber BOOLValue](self->__accessibilityRespondsToUserInteractionOverride, "BOOLValue");
  v3 = (id)objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v4 = 0;
  if ((objc_msgSend(v3, "assistiveTouchScannerSpeechEnabled") & 1) != 0)
    v4 = AXRequestingClient() == 4;
  v5 = v4;

  return v5;
}

- (void)setAccessibilityRespondsToUserInteraction:(BOOL)a3
{
  NSNumber *v3;
  NSNumber *accessibilityRespondsToUserInteractionOverride;

  v3 = (NSNumber *)(id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  accessibilityRespondsToUserInteractionOverride = self->__accessibilityRespondsToUserInteractionOverride;
  self->__accessibilityRespondsToUserInteractionOverride = v3;

}

- (CGPoint)accessibilityActivationPoint:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  id location[3];
  double v8;
  double v9;
  CGPoint result;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "accessibilityFrame");
  AX_CGRectGetCenter();
  v8 = v3;
  v9 = v4;
  objc_storeStrong(location, 0);
  v5 = v8;
  v6 = v9;
  result.y = v6;
  result.x = v5;
  return result;
}

- (id)accessibilityHint
{
  id v3;
  BOOL v4;
  objc_super v5;
  SEL v6;
  _AXUITextViewParagraphElement *v7;
  id v8;

  v7 = self;
  v6 = a2;
  v3 = (id)-[_AXUITextViewParagraphElement links]((uint64_t)self);
  v4 = objc_msgSend(v3, "count") != 1;

  if (v4)
  {
    v5.receiver = v7;
    v5.super_class = (Class)_AXUITextViewParagraphElement;
    v8 = -[_AXUITextViewParagraphElement accessibilityHint](&v5, sel_accessibilityHint);
  }
  else
  {
    v8 = accessibilityLocalizedString(CFSTR("hint.activate.embedded.link"));
  }
  return v8;
}

- (id)automationElements
{
  return (id)-[_AXUITextViewParagraphElement links]((uint64_t)self);
}

- (id)accessibilityElements
{
  return (id)-[_AXUITextViewParagraphElement links]((uint64_t)self);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat v4;
  CGFloat v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id obj;
  uint64_t v13;
  objc_super v14;
  int v15;
  CGRect rect;
  CGPoint point;
  _QWORD __b[8];
  id v19;
  id location[2];
  _AXUITextViewParagraphElement *v21;
  CGPoint v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;
  CGRect v26;

  v25 = *MEMORY[0x24BDAC8D0];
  v22 = a3;
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if (!AXDoesRequestingClientDeserveAutomation())
    goto LABEL_12;
  memset(__b, 0, sizeof(__b));
  obj = (id)-[_AXUITextViewParagraphElement links]((uint64_t)v21);
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
  if (v13)
  {
    v9 = *(_QWORD *)__b[2];
    v10 = 0;
    v11 = v13;
    while (1)
    {
      v8 = v10;
      if (*(_QWORD *)__b[2] != v9)
        objc_enumerationMutation(obj);
      v19 = *(id *)(__b[1] + 8 * v10);
      v7 = (id)-[_AXUITextViewParagraphElement _accessibilityParentView](v21, "_accessibilityParentView");
      UIAccessibilityPointForPoint();
      point.x = v4;
      point.y = v5;

      objc_msgSend(v19, "accessibilityFrame");
      rect = v26;
      if (CGRectContainsPoint(v26, point))
        break;
      ++v10;
      if (v8 + 1 >= v11)
      {
        v10 = 0;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
        if (!v11)
          goto LABEL_10;
      }
    }
    v23 = v19;
    v15 = 1;
  }
  else
  {
LABEL_10:
    v15 = 0;
  }

  if (!v15)
  {
LABEL_12:
    v14.receiver = v21;
    v14.super_class = (Class)_AXUITextViewParagraphElement;
    v23 = -[_AXUITextViewParagraphElement _accessibilityHitTest:withEvent:](&v14, sel__accessibilityHitTest_withEvent_, location[0], v22.x, v22.y);
    v15 = 1;
  }
  objc_storeStrong(location, 0);
  return v23;
}

- (CGRect)accessibilityFrame
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  id v12;
  objc_super v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  char v19;
  id v20[2];
  _AXUITextViewParagraphElement *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  v21 = self;
  v20[1] = (id)a2;
  v19 = 0;
  objc_opt_class();
  v12 = (id)-[_AXUITextViewParagraphElement accessibilityContainer](v21, "accessibilityContainer");
  v18 = (id)__UIAccessibilityCastAsSafeCategory();

  v17 = v18;
  objc_storeStrong(&v18, 0);
  v20[0] = v17;
  if (v17)
  {
    v11 = v20[0];
    v15 = -[_AXUITextViewParagraphElement textRange]((uint64_t)v21);
    v16 = v2;
    objc_msgSend(v11, "_accessibilityBoundsForRange:", v15, v2);
  }
  else
  {
    v13.receiver = v21;
    v13.super_class = (Class)_AXUITextViewParagraphElement;
    -[_AXUITextViewParagraphElement accessibilityFrame](&v13, sel_accessibilityFrame);
  }
  v22 = v3;
  v23 = v4;
  v24 = v5;
  v25 = v6;
  v14 = 1;
  objc_storeStrong(v20, 0);
  v7 = v22;
  v8 = v23;
  v9 = v24;
  v10 = v25;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (uint64_t)textRange
{
  __int128 v2;

  if (a1)
    return *(_OWORD *)(a1 + 80);
  else
    *(_QWORD *)&v2 = 0;
  return v2;
}

- (BOOL)accessibilityActivate
{
  uint64_t v2;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  BOOL v9;
  id v10;
  objc_super v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v15;
  id v16;
  char v17;
  id v18[2];
  _AXUITextViewParagraphElement *v19;
  char v20;

  v19 = self;
  v18[1] = (id)a2;
  v17 = 0;
  objc_opt_class();
  v10 = (id)-[_AXUITextViewParagraphElement accessibilityContainer](v19, "accessibilityContainer");
  v16 = (id)__UIAccessibilityCastAsSafeCategory();

  v15 = v16;
  objc_storeStrong(&v16, 0);
  v18[0] = v15;
  if (v15)
  {
    v8 = (id)-[_AXUITextViewParagraphElement links]((uint64_t)v19);
    v9 = objc_msgSend(v8, "count") == 0;

    if (v9)
    {
      v4 = v18[0];
      v12 = -[_AXUITextViewParagraphElement textRange]((uint64_t)v19);
      v13 = v2;
      v20 = objc_msgSend(v4, "_accessibilityActivateParagraphInTextViewRange:", v12, v2) & 1;
    }
    else
    {
      v5 = v18[0];
      v7 = (id)-[_AXUITextViewParagraphElement links]((uint64_t)v19);
      v6 = (id)objc_msgSend(v7, "firstObject");
      v20 = -[UITextViewAccessibility _accessibilityActivateLink:](v5, v6) & 1;

    }
    v14 = 1;
  }
  else
  {
    v11.receiver = v19;
    v11.super_class = (Class)_AXUITextViewParagraphElement;
    v20 = -[_AXUITextViewParagraphElement accessibilityActivate](&v11, sel_accessibilityActivate);
    v14 = 1;
  }
  objc_storeStrong(v18, 0);
  return v20 & 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  unint64_t v4;
  id location;
  objc_super v6;
  unint64_t v7;
  SEL v8;
  _AXUITextViewParagraphElement *v9;

  v9 = self;
  v8 = a2;
  v7 = 0;
  v6.receiver = self;
  v6.super_class = (Class)_AXUITextViewParagraphElement;
  v7 = -[_AXUITextViewParagraphElement accessibilityTraits](&v6, sel_accessibilityTraits);
  location = (id)-[_AXUITextViewParagraphElement accessibilityContainer](v9, "accessibilityContainer");
  v2 = objc_msgSend(location, "accessibilityTraits");
  if ((v2 & *MEMORY[0x24BDF73C0]) != 0)
    v7 |= *MEMORY[0x24BDF73C0];
  v4 = v7;
  objc_storeStrong(&location, 0);
  return v4;
}

- (id)accessibilityLanguage
{
  id v3;
  objc_super v4;
  int v5;
  id v6;
  id v7;
  char v8;
  id v9[2];
  _AXUITextViewParagraphElement *v10;
  id v11;

  v10 = self;
  v9[1] = (id)a2;
  v8 = 0;
  objc_opt_class();
  v3 = (id)-[_AXUITextViewParagraphElement accessibilityContainer](v10, "accessibilityContainer");
  v7 = (id)__UIAccessibilityCastAsSafeCategory();

  v6 = v7;
  objc_storeStrong(&v7, 0);
  v9[0] = v6;
  if (v6)
  {
    v11 = (id)objc_msgSend(v9[0], "accessibilityLanguage");
  }
  else
  {
    v4.receiver = v10;
    v4.super_class = (Class)_AXUITextViewParagraphElement;
    v11 = -[_AXUITextViewParagraphElement accessibilityLanguage](&v4, sel_accessibilityLanguage);
  }
  v5 = 1;
  objc_storeStrong(v9, 0);
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->__accessibilityRespondsToUserInteractionOverride, 0);
  objc_storeStrong((id *)&self->__accessibilityContent, 0);
}

@end
