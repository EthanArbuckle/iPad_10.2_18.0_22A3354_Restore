@implementation TLKKeyValueGridViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TLKKeyValueGridView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKKeyValueGridView"), CFSTR("keyLabels"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKKeyValueGridView"), CFSTR("valueLabels"), "@", 0);

}

- (id)accessibilityElements
{
  _QWORD *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  TLKKeyValueGridViewAccessibility *v14;
  id v15;

  v3 = (_QWORD *)MEMORY[0x24BEBB308];
  -[TLKKeyValueGridViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKKeyValueGridViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("keyLabels"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKKeyValueGridViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("valueLabels"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __57__TLKKeyValueGridViewAccessibility_accessibilityElements__block_invoke;
    v12[3] = &unk_2503B3270;
    v13 = v8;
    v14 = self;
    v9 = v6;
    v15 = v9;
    v10 = v8;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);
    -[TLKKeyValueGridViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v9, *v3);
    v5 = v9;

  }
  return v5;
}

void __57__TLKKeyValueGridViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x24BDBCEB8];
  v6 = a2;
  objc_msgSend(v5, "array");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v6);

  if (objc_msgSend(*(id *)(a1 + 32), "count") > a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v7);

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBADA8]), "initWithAccessibilityContainer:representedElements:", *(_QWORD *)(a1 + 40), v9);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);

}

@end
