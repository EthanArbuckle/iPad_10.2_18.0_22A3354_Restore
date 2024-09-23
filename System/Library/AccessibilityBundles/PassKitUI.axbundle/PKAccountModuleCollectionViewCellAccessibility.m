@implementation PKAccountModuleCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKAccountModuleCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__PKAccountModuleCollectionViewCellAccessibility_accessibilityLabel__block_invoke;
  v8[3] = &unk_2502E38E8;
  v8[4] = self;
  v9 = v3;
  v4 = v3;
  v5 = (id)-[PKAccountModuleCollectionViewCellAccessibility _accessibilityFindDescendant:](self, "_accessibilityFindDescendant:", v8);
  AXLabelForElements();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __68__PKAccountModuleCollectionViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  v4 = v3;
  if (*(id *)(a1 + 32) != v3)
  {
    if (objc_msgSend(v3, "isAccessibilityElement"))
    {
      v5 = objc_msgSend(v4, "accessibilityTraits");
      if ((*MEMORY[0x24BDF73C8] & v5) == 0)
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
    }
  }

  return 0;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
