@implementation HKMonthWeekViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKMonthWeekView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKCalendarWeekView"), CFSTR("monthTitleView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HKMonthWeekView"), CFSTR("HKCalendarWeekView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_HKMonthTitleView"), CFSTR("monthTitle"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)accessibilityElements
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[HKMonthWeekViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("monthTitleView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("monthTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v3, "axSafelyAddObject:", v5);
    objc_msgSend(v5, "setAccessibilityContainer:", self);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HKMonthWeekViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("layer"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("sublayers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        MEMORY[0x234910EA0](CFSTR("HKMonthDayCell"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v3, "addObject:", v12);
          objc_msgSend(v12, "setAccessibilityContainer:", self);
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v3;
}

@end
