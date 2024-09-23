@implementation TPPhonePadAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TPPhonePad");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  double *v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;

  -[TPPhonePadAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[TPPhonePadAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:");
    v4 = 0;
    v24 = *MEMORY[0x24BDF73D0] | *MEMORY[0x24BDF73F0];
    v26 = *MEMORY[0x24BDBD270];
    do
    {
      v5 = (void *)objc_msgSend(objc_allocWithZone((Class)TPButtonAccessibilityElement), "initWithAccessibilityContainer:", self);
      v6 = *(&AX_kKeyStrs + v4);
      -[TPPhonePadAccessibility _buttonForKeyAtIndex:](self, "_buttonForKeyAtIndex:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "accessibilityLabel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "length"))
        {
          v10 = v9;

          v11 = objc_msgSend(v8, "accessibilityTraits");
          v6 = v10;
        }
        else
        {
          v11 = v24;
        }

      }
      else
      {
        v11 = v24;
      }
      objc_msgSend(v5, "setAccessibilityTraits:", v11);
      objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAttribute:forKey:", v26, *MEMORY[0x24BDFEC00]);
      objc_msgSend(v5, "setAccessibilityLabel:", v12);
      v13 = (void *)MEMORY[0x24BDFEA60];
      -[__CFString lowercaseString](*(&AX_kLettersStrings + v4), "lowercaseString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "axAttributedStringWithString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setAttribute:forKey:", v26, *MEMORY[0x24BDFEBB8]);
      objc_msgSend(v5, "setAccessibilityHint:", v15);
      v27 = 0;
      v28 = (double *)&v27;
      v29 = 0x4010000000;
      v30 = &unk_232AF7CA6;
      v31 = 0u;
      v32 = 0u;
      AXPerformSafeBlock();
      v16 = v28[4];
      v17 = v28[5];
      v18 = v28[6];
      v19 = v28[7];
      _Block_object_dispose(&v27, 8);
      objc_msgSend(v5, "setAccessibilityFrameInContainerSpace:", v16, v17, v18, v19);
      objc_msgSend(v5, "accessibilityLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "length");

      if (v21)
        objc_msgSend(v25, "addObject:", v5);

      ++v4;
    }
    while (v4 != 12);
    v3 = v25;
  }
  v22 = v3;

  return v22;
}

uint64_t __48__TPPhonePadAccessibility_accessibilityElements__block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "_rectForKey:", *(int *)(a1 + 48));
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 1;
}

- (unint64_t)_accessibilityScannerGroupTraits
{
  return 1;
}

- (id)_accessibilityScannerGroupElements
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  __CFString **v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[TPPhonePadAccessibility accessibilityElements](self, "accessibilityElements");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = &AX_kKeyStrs;
  do
  {
    v7 = 0;
    v8 = 0;
    ++v5;
    do
    {
      if (-[__CFString length](v6[v7], "length"))
      {
        v9 = 1;
      }
      else
      {
        -[TPPhonePadAccessibility _buttonForKeyAtIndex:](self, "_buttonForKeyAtIndex:", v3 + v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "accessibilityLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v11, "length") != 0;

      }
      v8 += v9;
      ++v7;
    }
    while (v7 != 3);
    objc_msgSend(v15, "subarrayWithRange:", v4, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = CFSTR("GroupElements");
    v17[1] = CFSTR("GroupTraits");
    v18[0] = v12;
    v18[1] = &unk_2503B3000;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v13);
    v4 += v8;

    v3 += 3;
    v6 += 3;
  }
  while (v5 != 4);

  return v16;
}

@end
