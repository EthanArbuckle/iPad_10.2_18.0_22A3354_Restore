@implementation NavSignLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NavSignLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavSignLabel"), CFSTR("textAlternatives"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKServerFormattedString"), CFSTR("multiPartAttributedStringWithAttributes:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMultiPartAttributedString"), CFSTR("attributedString"), "@", 0);

}

- (id)accessibilityAttributedLabel
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  char v15;

  -[NavSignLabelAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("textAlternatives"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = 0;
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  v5 = v4;
  AXPerformSafeBlock();
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  __UIAccessibilitySafeClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    abort();

  return v7;
}

void __57__NavSignLabelAccessibility_accessibilityAttributedLabel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "multiPartAttributedStringWithAttributes:", MEMORY[0x24BDBD1B8]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedString");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)accessibilityAttributedUserInputLabels
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id obj;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NavSignLabelAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("textAlternatives"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(obj);
        LOBYTE(v13) = 0;
        __UIAccessibilitySafeClass();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((_BYTE)v13)
          abort();
        v19 = 0;
        v13 = 0;
        v14 = &v13;
        v15 = 0x3032000000;
        v16 = __Block_byref_object_copy__0;
        v17 = __Block_byref_object_dispose__0;
        v18 = 0;
        v8 = v7;
        AXPerformSafeBlock();
        v9 = (id)v14[5];

        _Block_object_dispose(&v13, 8);
        __UIAccessibilitySafeClass();
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
          abort();
        objc_msgSend(v3, "axSafelyAddObject:", v10);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v4);
  }

  return v3;
}

void __67__NavSignLabelAccessibility_accessibilityAttributedUserInputLabels__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "multiPartAttributedStringWithAttributes:", MEMORY[0x24BDBD1B8]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedString");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
