@implementation CalendarMonthControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CalendarMonthControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_accessibilityUpdateOcurrenceTileCount:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  CalendarMonthControlAccessibility *v13;
  id obj;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD block[4];
  id v22;
  CalendarMonthControlAccessibility *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = self;
  -[CalendarMonthControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibleSubviews"));
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v25;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v7);
        NSClassFromString(CFSTR("CalendarMonthDayTile"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((objc_msgSend(v4, "_accessibilityBoolValueForKey:", CFSTR("_axDidWaitForLoad")) & 1) == 0)
          {
            objc_msgSend(v4, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("_axDidWaitForLoad"));
            if (_accessibilityUpdateOcurrenceTileCount__onceToken != -1)
              dispatch_once(&_accessibilityUpdateOcurrenceTileCount__onceToken, &__block_literal_global_0);
            v9 = _accessibilityUpdateOcurrenceTileCount__WaitQueue;
            if (_accessibilityUpdateOcurrenceTileCount__WaitQueue)
            {
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __76__CalendarMonthControlAccessibility__accessibilityUpdateOcurrenceTileCount___block_invoke_2;
              block[3] = &unk_25027D398;
              v22 = v4;
              v23 = v13;
              dispatch_async(v9, block);

            }
          }
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          _AXDateComponentsFromDate(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = 0;
          v18 = &v17;
          v19 = 0x2020000000;
          v20 = 0;
          v15 = v4;
          v16 = v11;
          AXPerformSafeBlock();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v18[3]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "_accessibilitySetRetainedValue:forKey:", v12, CFSTR("numberEvents"));

          _Block_object_dispose(&v17, 8);
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v5);
  }

}

void __76__CalendarMonthControlAccessibility__accessibilityUpdateOcurrenceTileCount___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("ax-wait-cal", 0);
  v1 = (void *)_accessibilityUpdateOcurrenceTileCount__WaitQueue;
  _accessibilityUpdateOcurrenceTileCount__WaitQueue = (uint64_t)v0;

}

void __76__CalendarMonthControlAccessibility__accessibilityUpdateOcurrenceTileCount___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  int8x16_t v5;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_eventLoader"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "safeValueForKey:", CFSTR("waitForBackgroundLoad"));

  v5 = *(int8x16_t *)(a1 + 32);
  v4 = (id)v5.i64[0];
  AXPerformBlockOnMainThreadAfterDelay();

}

uint64_t __76__CalendarMonthControlAccessibility__accessibilityUpdateOcurrenceTileCount___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityUpdateOcurrenceTileCount:", *(_QWORD *)(a1 + 40));
}

void __76__CalendarMonthControlAccessibility__accessibilityUpdateOcurrenceTileCount___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "occurrencesForDay:waitForLoad:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("occurrences"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "count");

}

@end
