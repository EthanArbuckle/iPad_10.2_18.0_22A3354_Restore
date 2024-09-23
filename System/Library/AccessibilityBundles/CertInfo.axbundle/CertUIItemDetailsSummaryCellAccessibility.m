@implementation CertUIItemDetailsSummaryCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CertUIItemDetailsSummaryCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CertUIItemDetailsSummaryCell"), CFSTR("detailViews"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CertUIItemDetailsSummaryCellAccessibility;
  -[CertUIItemDetailsSummaryCellAccessibility accessibilityLabel](&v11, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertUIItemDetailsSummaryCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("detailViews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__CertUIItemDetailsSummaryCellAccessibility_accessibilityLabel__block_invoke;
  v9[3] = &unk_2501AF290;
  v6 = v5;
  v10 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }

  return v3;
}

void __63__CertUIItemDetailsSummaryCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "accessibilityLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axSafelyAddObject:", v3);

}

@end
