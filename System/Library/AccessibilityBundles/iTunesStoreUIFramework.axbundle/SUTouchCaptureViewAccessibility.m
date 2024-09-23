@implementation SUTouchCaptureViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUTouchCaptureView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown
{
  return -[SUTouchCaptureViewAccessibility _accessibilityHasDescendantOfType:](self, "_accessibilityHasDescendantOfType:", NSClassFromString(CFSTR("SUMaskedView"))) ^ 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  SUTouchCaptureViewAccessibility *v8;
  SUTouchCaptureViewAccessibility *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  SUTouchCaptureViewAccessibility *v20;
  void *v21;
  uint64_t v22;
  SUTouchCaptureViewAccessibility *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  y = a3.y;
  x = a3.x;
  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)SUTouchCaptureViewAccessibility;
  -[SUTouchCaptureViewAccessibility _accessibilityHitTest:withEvent:](&v29, sel__accessibilityHitTest_withEvent_, v7, x, y);
  v8 = (SUTouchCaptureViewAccessibility *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = v8 == self;
  else
    v10 = 1;
  if (!v10)
    goto LABEL_21;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[SUTouchCaptureViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("passThroughViews"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v16, "convertPoint:fromView:", self, x, y);
        objc_msgSend(v16, "_accessibilityHitTest:withEvent:", v7);
        v17 = objc_claimAutoreleasedReturnValue();

        if (v17)
        {

          v9 = (SUTouchCaptureViewAccessibility *)v17;
          goto LABEL_20;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v13)
        continue;
      break;
    }
  }

  if (v9)
  {
LABEL_21:
    if (v9 != self)
      goto LABEL_24;
    goto LABEL_22;
  }
  if (!-[SUTouchCaptureViewAccessibility pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
LABEL_27:
    v9 = 0;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v9 = 0;
LABEL_20:

    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "userInterfaceIdiom");

  if (v19 != 1)
    goto LABEL_27;
  v20 = self;
LABEL_22:
  -[SUTouchCaptureViewAccessibility subviews](self, "subviews");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (!v22)
  {
    v23 = 0;
    goto LABEL_25;
  }
  v9 = self;
LABEL_24:
  self = v9;
  v23 = self;
LABEL_25:

  return v23;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)accessibilityPerformEscape
{
  -[SUTouchCaptureViewAccessibility sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
  return 1;
}

- (BOOL)accessibilityActivate
{
  -[SUTouchCaptureViewAccessibility sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
  return 1;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return (id)UIKitAccessibilityLocalizedString();
}

@end
