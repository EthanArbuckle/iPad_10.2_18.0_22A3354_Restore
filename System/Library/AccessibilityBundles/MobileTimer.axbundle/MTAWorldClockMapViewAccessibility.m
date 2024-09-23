@implementation MTAWorldClockMapViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTAWorldClockMapView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAWorldClockMapView"), CFSTR("terminatorPathForDayOfYear: size:"), "@", "d", "{CGSize=dd}", 0);
}

- (id)accessibilityElements
{
  _QWORD *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v3 = (_QWORD *)MEMORY[0x24BEBB308];
  -[MTAWorldClockMapViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = accessibilityElements_wasRTL,
        v5 != -[MTAWorldClockMapViewAccessibility _accessibilityIsRTL](self, "_accessibilityIsRTL")))
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);

    -[MTAWorldClockMapViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v6, *v3);
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAWorldClockMapViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subviews"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filteredArrayUsingPredicate:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __58__MTAWorldClockMapViewAccessibility_accessibilityElements__block_invoke_2;
    v12[3] = &unk_2502B71B0;
    v12[4] = self;
    objc_msgSend(v9, "sortedArrayUsingComparator:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v10);
    accessibilityElements_wasRTL = -[MTAWorldClockMapViewAccessibility _accessibilityIsRTL](self, "_accessibilityIsRTL");

    v4 = v6;
  }
  return v4;
}

uint64_t __58__MTAWorldClockMapViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  MEMORY[0x234916758](CFSTR("MTAWorldClockMapCityView"));
  v3 = objc_msgSend(v2, "isMemberOfClass:", objc_opt_class());

  return v3;
}

uint64_t __58__MTAWorldClockMapViewAccessibility_accessibilityElements__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v5 = a3;
  objc_msgSend(a2, "frame");
  v7 = v6;
  objc_msgSend(v5, "frame");
  v9 = v8;

  if (objc_msgSend(*(id *)(a1 + 32), "_accessibilityIsRTL") != v7 >= v9)
    return 1;
  else
    return -1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("world.map"));
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (void)addCity:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTAWorldClockMapViewAccessibility;
  -[MTAWorldClockMapViewAccessibility addCity:](&v4, sel_addCity_, a3);
  -[MTAWorldClockMapViewAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)removeCity:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTAWorldClockMapViewAccessibility;
  -[MTAWorldClockMapViewAccessibility removeCity:](&v4, sel_removeCity_, a3);
  -[MTAWorldClockMapViewAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)_accessibilityAnnounceSolarRegionChange:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  y = a3.y;
  x = a3.x;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MTAWorldClockMapViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("accessibilitySolarTerminatorPath"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bounds");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;

      v20 = 0;
      v21 = &v20;
      v22 = 0x3032000000;
      v23 = __Block_byref_object_copy__1;
      v24 = __Block_byref_object_dispose__1;
      v25 = 0;
      v19 = MEMORY[0x24BDAC760];
      AXPerformSafeBlock();
      v6 = (id)v21[5];
      _Block_object_dispose(&v20, 8);

      -[MTAWorldClockMapViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v6, CFSTR("accessibilitySolarTerminatorPath"), v19, 3221225472, __77__MTAWorldClockMapViewAccessibility__accessibilityAnnounceSolarRegionChange___block_invoke, &unk_2502B71D8, self, &v20, v9, v11, v13, v15);
    }
    -[MTAWorldClockMapViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("accessibilitySolarRegion"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "containsPoint:", x, y))
      v17 = CFSTR("world.map.solar.region.night");
    else
      v17 = CFSTR("world.map.solar.region.day");
    accessibilityLocalizedString(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isEqualToString:", v16) & 1) == 0)
      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v18);
    -[MTAWorldClockMapViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v18, CFSTR("accessibilitySolarRegion"));

  }
}

void __77__MTAWorldClockMapViewAccessibility__accessibilityAnnounceSolarRegionChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "terminatorPathForDayOfYear:size:", accessibilityDayOfYear(v6), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  objc_super v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  CGPoint v28;
  CGRect v29;

  y = a3.y;
  x = a3.x;
  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  -[MTAWorldClockMapViewAccessibility accessibilityElements](self, "accessibilityElements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPointForPoint();
  v10 = v9;
  v12 = v11;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[MTAWorldClockMapViewAccessibility convertPoint:toView:](self, "convertPoint:toView:", v18, x, y);
        if ((objc_msgSend(v18, "pointInside:withEvent:", v7) & 1) != 0)
        {
          -[MTAWorldClockMapViewAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", CFSTR("accessibilitySolarRegion"));
          v19 = v18;

          goto LABEL_13;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v15)
        continue;
      break;
    }
  }

  -[MTAWorldClockMapViewAccessibility accessibilityFrame](self, "accessibilityFrame");
  v28.x = v10;
  v28.y = v12;
  if (CGRectContainsPoint(v29, v28))
    -[MTAWorldClockMapViewAccessibility _accessibilityAnnounceSolarRegionChange:](self, "_accessibilityAnnounceSolarRegionChange:", x, y);
  v21.receiver = self;
  v21.super_class = (Class)MTAWorldClockMapViewAccessibility;
  -[MTAWorldClockMapViewAccessibility _accessibilityHitTest:withEvent:](&v21, sel__accessibilityHitTest_withEvent_, v7, x, y);
  v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v19;
}

- (void)_accessibilityRemoveSolarTerminatorPath
{
  -[MTAWorldClockMapViewAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", CFSTR("accessibilitySolarTerminatorPath"));
}

@end
