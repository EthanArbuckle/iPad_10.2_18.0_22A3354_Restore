@implementation PINKeypadAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PINKeypad");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityInternalChildren
{
  _QWORD *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  PINKeypadAccessibility *v23;
  id *v24;
  int v25;
  id from;
  id *p_from;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  id location[2];

  objc_initWeak(location, self);
  v32 = MEMORY[0x24BDAC760];
  v33 = 3221225472;
  v34 = __56__PINKeypadAccessibility__accessibilityInternalChildren__block_invoke;
  v35 = &unk_2503137A0;
  objc_copyWeak(&v36, location);
  UIAccessibilityPerformBlockForOrientationChange();
  v3 = (_QWORD *)MEMORY[0x24BEBB308];
  -[PINKeypadAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[PINKeypadAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v4, *v3);
    v5 = 0;
    v15 = *MEMORY[0x24BDF73D0] | *MEMORY[0x24BDF73F0];
    v6 = MEMORY[0x24BDAC760];
    do
    {
      if (v5 != 9)
      {
        v7 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
        objc_msgSend(v7, "setAccessibilityTraits:", v15);
        v8 = AX_kKeyStrs[v5];
        if (-[__CFString length](v8, "length") == 1)
          objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", CFSTR("%d"), -[__CFString intValue](v8, "intValue"));
        else
          accessibilityLocalizedString(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        from = 0;
        p_from = &from;
        v28 = 0x3032000000;
        v29 = __Block_byref_object_copy_;
        v30 = __Block_byref_object_dispose_;
        v31 = 0;
        v19 = v6;
        v20 = 3221225472;
        v21 = __56__PINKeypadAccessibility__accessibilityInternalChildren__block_invoke_210;
        v22 = &unk_2503137C8;
        v23 = self;
        v24 = &from;
        v25 = v5;
        AXPerformSafeBlock();
        v10 = p_from[5];
        _Block_object_dispose(&from, 8);

        if (v10)
        {
          objc_msgSend(v10, "accessibilityLabel");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "length"))
          {
            v12 = v11;

            v9 = v12;
            v6 = MEMORY[0x24BDAC760];
          }

        }
        objc_initWeak(&from, self);
        objc_msgSend(v7, "setAccessibilityLabel:", v9);
        v16[0] = v6;
        v16[1] = 3221225472;
        v16[2] = __56__PINKeypadAccessibility__accessibilityInternalChildren__block_invoke_2;
        v16[3] = &unk_2503137F0;
        objc_copyWeak(&v17, &from);
        v16[4] = self;
        v18 = v5;
        objc_msgSend(v7, "_setAccessibilityFrameBlock:", v16);
        objc_msgSend(v4, "addObject:", v7);
        objc_destroyWeak(&v17);
        objc_destroyWeak(&from);

      }
      ++v5;
    }
    while (v5 != 12);
  }
  v13 = v4;

  objc_destroyWeak(&v36);
  objc_destroyWeak(location);
  return v13;
}

void __56__PINKeypadAccessibility__accessibilityInternalChildren__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);

}

void __56__PINKeypadAccessibility__accessibilityInternalChildren__block_invoke_210(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_buttonForKeyAtIndex:", *(unsigned int *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

double __56__PINKeypadAccessibility__accessibilityInternalChildren__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  double v2;
  double v3;
  _QWORD v5[4];
  __int128 v6;
  __int128 v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x4010000000;
  v5[3] = &unk_2329150CD;
  v6 = 0u;
  v7 = 0u;
  AXPerformSafeBlock();
  _Block_object_dispose(v5, 8);
  UIAccessibilityFrameForBounds();
  v3 = v2;

  return v3;
}

uint64_t __56__PINKeypadAccessibility__accessibilityInternalChildren__block_invoke_3(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "_rectForKey:", *(unsigned int *)(a1 + 48));
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

@end
