@implementation TabOverviewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TabOverview");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("BarButton"), CFSTR("UIButton"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("TabOverview"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("BarButton"), CFSTR("UIButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabOverview"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TabOverview"), CFSTR("_interpolatedLocation"), "TabOverviewInterpolatedLocation");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TabOverview"), CFSTR("_header"), "TabOverviewToolbar");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabOverviewInterpolatedLocation"), CFSTR("location"), "{?={CGPoint=dd}dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabOverviewInterpolatedLocation"), CFSTR("resetToLocation:"), "v", "{?={CGPoint=dd}dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TabOverview"), CFSTR("_searchBar"), "SFTabOverviewSearchBar");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabOverview"), CFSTR("_updateDisplayLink"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabOverview"), CFSTR("_contentSize"), "{CGSize=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabOverview"), CFSTR("_dismissWithItemAtCurrentDecelerationFactor:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabOverview"), CFSTR("_isClosingLastItem"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabOverview"), CFSTR("presentationState"), "q", 0);

}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)isAccessibilityOpaqueElementProvider
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TabOverviewAccessibility;
  -[TabOverviewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[TabOverviewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_header"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityContainerType:", 4);
  objc_msgSend(v3, "_accessibilitySetOnlyComparesByXAxis:", 1);
  objc_msgSend(v3, "setShouldGroupAccessibilityChildren:", 1);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TabOverviewAccessibility;
  -[TabOverviewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[TabOverviewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEF20]);
}

- (TabOverviewAccessibility)initWithFrame:(CGRect)a3
{
  TabOverviewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TabOverviewAccessibility;
  v3 = -[TabOverviewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[TabOverviewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

- (CGPoint)_accessibilityThumbnailOffset
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;
  uint64_t v7;
  double *v8;
  uint64_t v9;
  const char *v10;
  __int128 v11;
  __int128 v12;
  CGPoint result;

  -[TabOverviewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_interpolatedLocation"));
  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x4010000000;
  v10 = "";
  v11 = 0u;
  v12 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  v2 = v8[4];
  v3 = v8[5];

  _Block_object_dispose(&v7, 8);
  v4 = v2;
  v5 = v3;
  result.y = v5;
  result.x = v4;
  return result;
}

uint64_t __57__TabOverviewAccessibility__accessibilityThumbnailOffset__block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "location");
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (BOOL)_accessibilityScrollToView:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  v5 = -[TabOverviewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("presentationState"));
  if (v5 != 3)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    objc_msgSend(v4, "convertRect:toView:", v6);
    AX_CGRectGetCenter();
    v8 = v7;
    objc_msgSend(v6, "frame");
    AX_CGRectGetCenter();
    -[TabOverviewAccessibility _accessibilityThumbnailApplyScrollOffset:](self, "_accessibilityThumbnailApplyScrollOffset:", 0.0, v9 - v8);
    AXPerformBlockOnMainThreadAfterDelay();

  }
  return v5 != 3;
}

void __55__TabOverviewAccessibility__accessibilityScrollToView___block_invoke()
{
  UIAccessibilityPostNotification(0x414u, 0);
}

- (void)_accessibilityThumbnailApplyScrollOffset:(CGPoint)a3
{
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[3];
  char v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v4 = MEMORY[0x24BDAC760];
  AXPerformSafeBlock();
  _Block_object_dispose(v10, 8);
  -[TabOverviewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_interpolatedLocation"));
  v9 = v4;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  v6 = (id)-[TabOverviewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_updateDisplayLink"), v9, 3221225472, __69__TabOverviewAccessibility__accessibilityThumbnailApplyScrollOffset___block_invoke_2, &unk_25029F208, self);
  LOBYTE(v10[0]) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (LOBYTE(v10[0]))
    abort();
  v8 = v7;
  objc_msgSend(v7, "setNeedsLayout");

}

void __69__TabOverviewAccessibility__accessibilityThumbnailApplyScrollOffset___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_searchBar"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "resignFirstResponder");

}

uint64_t __69__TabOverviewAccessibility__accessibilityThumbnailApplyScrollOffset___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v9;
  id v10;
  uint64_t v11;
  double *v12;
  uint64_t v13;
  const char *v14;
  __int128 v15;
  __int128 v16;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityAdjustedScrollOffset:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v3 = v2;
  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x4010000000;
  v14 = "";
  v15 = 0u;
  v16 = 0u;
  v9 = MEMORY[0x24BDAC760];
  v10 = *(id *)(a1 + 40);
  AXPerformSafeBlock();
  v4 = v12[4];
  v5 = v12[5];
  v6 = v12[6];
  v7 = v12[7];

  _Block_object_dispose(&v11, 8);
  return objc_msgSend(*(id *)(a1 + 40), "resetToLocation:", v4, v3 + v5, v6, v7, v9, 3221225472, __69__TabOverviewAccessibility__accessibilityThumbnailApplyScrollOffset___block_invoke_3, &unk_25029F1E0);
}

uint64_t __69__TabOverviewAccessibility__accessibilityThumbnailApplyScrollOffset___block_invoke_3(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "location");
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (CGPoint)_accessibilityAdjustedScrollOffset:(CGPoint)a3
{
  double y;
  CGFloat x;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  CGPoint result;
  CGRect v24;
  CGRect v25;

  y = a3.y;
  x = a3.x;
  -[TabOverviewAccessibility _accessibilityThumbnailOffset](self, "_accessibilityThumbnailOffset");
  v7 = v6;
  v8 = y + v6;
  if (y + v6 <= 0.0)
  {
    -[TabOverviewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_contentSize"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "CGSizeValue");
    v22 = v10;

    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    v24.origin.x = v13;
    v24.origin.y = v15;
    v24.size.width = v17;
    v24.size.height = v19;
    if (v22 - CGRectGetHeight(v24) < -v8)
    {
      v25.origin.x = v13;
      v25.origin.y = v15;
      v25.size.width = v17;
      v25.size.height = v19;
      y = -(v7 + v22 - CGRectGetHeight(v25));
    }
  }
  else
  {
    y = -v6;
  }
  v20 = x;
  v21 = y;
  result.y = v21;
  result.x = v20;
  return result;
}

- (id)_accessibilityScrollStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[TabOverviewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_contentSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGSizeValue");

  -[TabOverviewAccessibility bounds](self, "bounds");
  -[TabOverviewAccessibility _accessibilityThumbnailOffset](self, "_accessibilityThumbnailOffset");
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[TabOverviewAccessibility _accessibilityScrollStatusFormatString](self, "_accessibilityScrollStatusFormatString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatInteger();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatInteger();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_accessibilityScrollStatusFormatString
{
  return (id)accessibilityUIKitLocalizedString();
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  UIAccessibilityNotifications v9;
  void *v10;

  -[TabOverviewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("frame"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rectValue");
  v7 = v6;

  if (a3 == 4)
  {
    v8 = -(v7 + -30.0);
    goto LABEL_5;
  }
  if (a3 == 3)
  {
    v8 = v7 + -30.0;
LABEL_5:
    -[TabOverviewAccessibility _accessibilityThumbnailApplyScrollOffset:](self, "_accessibilityThumbnailApplyScrollOffset:", 0.0, v8);
    v9 = *MEMORY[0x24BDF72E0];
    -[TabOverviewAccessibility _accessibilityScrollStatus](self, "_accessibilityScrollStatus");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v9, v10);

    return 1;
  }
  return 0;
}

- (BOOL)_accessibilityIsScrollAncestor
{
  return 1;
}

- (void)_dismissWithItemAtCurrentDecelerationFactor:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TabOverviewAccessibility;
  -[TabOverviewAccessibility _dismissWithItemAtCurrentDecelerationFactor:](&v3, sel__dismissWithItemAtCurrentDecelerationFactor_, a3);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __72__TabOverviewAccessibility__dismissWithItemAtCurrentDecelerationFactor___block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (BOOL)_isClosingLastItem
{
  objc_super v4;

  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)TabOverviewAccessibility;
  return -[TabOverviewAccessibility _isClosingLastItem](&v4, sel__isClosingLastItem);
}

@end
