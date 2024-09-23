@implementation SBFLockScreenDateViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFLockScreenDateView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  if (AXProcessIsSpringBoard())
  {
    objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBFLockScreenDateView"), CFSTR("UIView"));
    objc_msgSend(v3, "validateClass:", CFSTR("CSCoverSheetViewController"));
  }
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFLockScreenDateView"), CFSTR("_timeLabel"), "SBUILegibilityLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFLockScreenDateView"), CFSTR("_dateSubtitleView"), "SBFLockScreenDateSubtitleDateView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFLockScreenDateView"), CFSTR("_customSubtitleView"), "SBFLockScreenDateSubtitleView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFLockScreenDateSubtitleView"), CFSTR("_label"), "SBUILegibilityLabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFLockScreenDateSubtitleView"), CFSTR("string"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFLockScreenDateView"), CFSTR("_updateLabels"), "v", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("SBFLockScreenDateViewController"), CFSTR("inlineComplicationViewController"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("SBFLockScreenDateViewController"), CFSTR("complicationContainerViewController"), "@");
  if (NSClassFromString(CFSTR("CHUISWidgetHostViewController")))
    objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CHUISWidgetHostViewController"), CFSTR("_vibrancyEffectView"), "BSUIVibrancyEffectView");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("BSUIVibrancyEffectView"), CFSTR("contentView"), "@");

}

- (id)accessibilityElements
{
  return -[SBFLockScreenDateViewAccessibility _axElements:](self, "_axElements:", 0);
}

- (id)automationElements
{
  return -[SBFLockScreenDateViewAccessibility _axElements:](self, "_axElements:", 1);
}

- (id)_axElements:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  SBFLockScreenDateViewAccessibility *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v3 = a3;
  v46 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFLockScreenDateViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_timeLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFLockScreenDateViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_customSubtitleView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFLockScreenDateViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_dateSubtitleView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "_accessibilityViewIsVisible"))
    objc_msgSend(v40, "axSafelyAddObject:", v6);
  if (-[SBFLockScreenDateViewAccessibility _axIsDateViewVisible](self, "_axIsDateViewVisible"))
  {
    v8 = v7;
LABEL_7:
    v10 = v8;
    goto LABEL_8;
  }
  -[SBFLockScreenDateViewAccessibility _axCustomSubtitleView](self, "_axCustomSubtitleView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SBFLockScreenDateViewAccessibility _axCustomSubtitleView](self, "_axCustomSubtitleView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[SBFLockScreenDateViewAccessibility _axInlineComplicationViewController](self, "_axInlineComplicationViewController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v3)
  {
    objc_msgSend(v31, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v31, "safeValueForKeyPath:", CFSTR("widgetViewController.widgetHostViewController"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBFLockScreenDateViewAccessibility _axWidgetFromController:](self, "_axWidgetFromController:", v33);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_8:
  objc_msgSend(v10, "_setAccessibilityIsNotFirstElement:", 1);
  objc_msgSend(v40, "axSafelyAddObject:", v10);
  if (objc_msgSend(v5, "_accessibilityViewIsVisible"))
    objc_msgSend(v40, "axSafelyAddObject:", v5);
  if (-[SBFLockScreenDateViewAccessibility _axIsComplicationViewVisible](self, "_axIsComplicationViewVisible"))
  {
    if ((unint64_t)(objc_msgSend((id)*MEMORY[0x24BDF74F8], "activeInterfaceOrientation") - 1) >= 2)
      -[SBFLockScreenDateViewAccessibility _axSidebarComplicationContainerViewController](self, "_axSidebarComplicationContainerViewController");
    else
      -[SBFLockScreenDateViewAccessibility _axComplicationContainerViewController](self, "_axComplicationContainerViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v3)
    {
      objc_msgSend(v11, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "axSafelyAddObject:", v13);

    }
    else
    {
      v35 = v10;
      v36 = v7;
      v38 = v5;
      v39 = self;
      v37 = v6;
      v34 = v11;
      objc_msgSend(v11, "safeValueForKey:", CFSTR("widgetGridViewController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v16 = v14;
      objc_msgSend(v14, "safeValueForKey:", CFSTR("model"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "safeArrayForKey:", CFSTR("complicationDescriptors"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v42 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_msgSend(v23, "safeStringForKey:", CFSTR("uniqueIdentifier"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v15, "containsObject:", v24);

            if ((v25 & 1) == 0)
            {
              objc_msgSend(v16, "widgetHostViewControllerForComplicationDescriptor:", v23);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[SBFLockScreenDateViewAccessibility _axWidgetFromController:](v39, "_axWidgetFromController:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "axSafelyAddObject:", v27);

              objc_msgSend(v23, "safeStringForKey:", CFSTR("uniqueIdentifier"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v28);

            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        }
        while (v20);
      }

      v6 = v37;
      v5 = v38;
      v10 = v35;
      v7 = v36;
      v12 = v34;
    }

  }
  objc_msgSend(v40, "sortedArrayUsingSelector:", sel_accessibilityCompareGeometry_);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (BOOL)_accessibilityServesAsFirstElement
{
  if (-[SBFLockScreenDateViewAccessibility _axIsDateViewVisible](self, "_axIsDateViewVisible"))
    return 0;
  else
    return !-[SBFLockScreenDateViewAccessibility _axIsCustomSubtitleViewVisible](self, "_axIsCustomSubtitleViewVisible");
}

- (CGRect)accessibilityFrame
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  objc_super v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect result;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v30.receiver = self;
  v30.super_class = (Class)SBFLockScreenDateViewAccessibility;
  -[SBFLockScreenDateViewAccessibility accessibilityFrame](&v30, sel_accessibilityFrame);
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  -[SBFLockScreenDateViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_timeLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v11, "accessibilityFrame");
    v38.origin.x = v12;
    v38.origin.y = v13;
    v38.size.width = v14;
    v38.size.height = v15;
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    v32 = CGRectUnion(v31, v38);
    x = v32.origin.x;
    y = v32.origin.y;
    width = v32.size.width;
    height = v32.size.height;
  }
  -[SBFLockScreenDateViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_dateSubtitleView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBFLockScreenDateViewAccessibility _axIsDateViewVisible](self, "_axIsDateViewVisible"))
  {
    objc_msgSend(v16, "accessibilityFrame");
    v39.origin.x = v17;
    v39.origin.y = v18;
    v39.size.width = v19;
    v39.size.height = v20;
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    v34 = CGRectUnion(v33, v39);
    x = v34.origin.x;
    y = v34.origin.y;
    width = v34.size.width;
    height = v34.size.height;
  }
  -[SBFLockScreenDateViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_customSubtitleView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v21, "accessibilityFrame");
    v40.origin.x = v22;
    v40.origin.y = v23;
    v40.size.width = v24;
    v40.size.height = v25;
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    v36 = CGRectUnion(v35, v40);
    x = v36.origin.x;
    y = v36.origin.y;
    width = v36.size.width;
    height = v36.size.height;
  }

  v26 = x;
  v27 = y;
  v28 = width;
  v29 = height;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)_updateLabels
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFLockScreenDateViewAccessibility;
  -[SBFLockScreenDateViewAccessibility _updateLabels](&v3, sel__updateLabels);
  -[SBFLockScreenDateViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBFLockScreenDateViewAccessibility;
  -[SBFLockScreenDateViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[SBFLockScreenDateViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_timeLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilitySetIdentification:", CFSTR("LockScreenTimeLabel"));

}

- (CGRect)_axTimeLabelFrame
{
  void *v2;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;
  CGRect v13;
  CGRect result;

  -[SBFLockScreenDateViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_timeLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v13 = CGRectInset(v12, -25.0, 0.0);
  x = v13.origin.x;
  width = v13.size.width;
  height = v13.size.height;
  objc_msgSend(MEMORY[0x24BE29F60], "frameForElements:", 1);
  v7 = v6;

  v8 = x;
  v9 = v7;
  v10 = width;
  v11 = height;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (BOOL)_accessibilityOverridesInvisibility
{
  return 1;
}

- (BOOL)_accessibilityViewIsVisible
{
  void *v3;
  BOOL v4;
  void *v5;

  -[SBFLockScreenDateViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_timeLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "_accessibilityViewIsVisible") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[SBFLockScreenDateViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_customSubtitleView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (objc_msgSend(v5, "_accessibilityViewIsVisible") & 1) != 0
      || -[SBFLockScreenDateViewAccessibility _axIsDateViewVisible](self, "_axIsDateViewVisible");

  }
  return v4;
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (BOOL)_accessibilityAllowOutOfBoundsHitTestAtPoint:(CGPoint)a3 withEvent:(id)a4
{
  return 1;
}

- (SBFLockScreenDateViewAccessibility)initWithFrame:(CGRect)a3
{
  SBFLockScreenDateViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFLockScreenDateViewAccessibility;
  v3 = -[SBFLockScreenDateViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SBFLockScreenDateViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (int64_t)_accessibilitySortPriority
{
  return 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;
  CGPoint v14;
  CGPoint v15;
  CGRect v16;
  CGRect v17;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[SBFLockScreenDateViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_dateSubtitleView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFLockScreenDateViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_timeLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && -[SBFLockScreenDateViewAccessibility _axIsDateViewVisible](self, "_axIsDateViewVisible")
    && (objc_msgSend(v8, "accessibilityFrame"), v14.x = x, v14.y = y, CGRectContainsPoint(v16, v14)))
  {
    v10 = v8;
  }
  else if (v9 && (objc_msgSend(v9, "accessibilityFrame"), v15.x = x, v15.y = y, CGRectContainsPoint(v17, v15)))
  {
    v10 = v9;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBFLockScreenDateViewAccessibility;
    -[SBFLockScreenDateViewAccessibility _accessibilityHitTest:withEvent:](&v13, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SBFLockScreenDateViewAccessibility;
  -[SBFLockScreenDateViewAccessibility layoutSubviews](&v2, sel_layoutSubviews);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (id)_axInlineComplicationViewController
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[SBFLockScreenDateViewAccessibility _accessibilityViewController](self, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("inlineComplicationViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_axIsDateViewVisible
{
  void *v4;
  char v5;

  if (-[SBFLockScreenDateViewAccessibility _axIsInlineWidgetVisible](self, "_axIsInlineWidgetVisible")
    || -[SBFLockScreenDateViewAccessibility _axIsCustomSubtitleViewVisible](self, "_axIsCustomSubtitleViewVisible"))
  {
    return 0;
  }
  -[SBFLockScreenDateViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_dateSubtitleView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_accessibilityViewIsVisible");

  return v5;
}

- (BOOL)_axIsCustomSubtitleViewVisible
{
  void *v2;
  BOOL v3;

  -[SBFLockScreenDateViewAccessibility _axCustomSubtitleView](self, "_axCustomSubtitleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_axCustomSubtitleView
{
  return (id)-[SBFLockScreenDateViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("prominentDisplayViewController.displayView.customSubtitleView"));
}

- (id)_axComplicationContainerViewController
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[SBFLockScreenDateViewAccessibility _accessibilityViewController](self, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("complicationContainerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_axSidebarComplicationContainerViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  -[SBFLockScreenDateViewAccessibility _accessibilityViewController](self, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("sidebarComplicationContainerViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_axIsInlineWidgetVisible
{
  void *v2;
  BOOL v3;

  -[SBFLockScreenDateViewAccessibility _axInlineComplicationViewController](self, "_axInlineComplicationViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_axIsComplicationViewVisible
{
  void *v2;
  BOOL v3;

  -[SBFLockScreenDateViewAccessibility _axComplicationContainerViewController](self, "_axComplicationContainerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_axWidgetFromController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (NSClassFromString(CFSTR("CSCoverSheetView")))
  {
    -[SBFLockScreenDateViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("CSCoverSheetView")));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("backgroundContentView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "_accessibilityViewIsVisible") & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v4, "safeValueForKeyPath:", CFSTR("_vibrancyEffectView.contentView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_accessibilityDescendantOfType:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
