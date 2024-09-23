@implementation ACSportsListViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ACSportsListView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[ACSportsListViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("domainObjectViews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__ACSportsListViewAccessibility_accessibilityLabel__block_invoke;
  v6[3] = &unk_250361F40;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  objc_msgSend((id)v8[5], "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __51__ACSportsListViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
    v3 = v4;
  }

}

@end
