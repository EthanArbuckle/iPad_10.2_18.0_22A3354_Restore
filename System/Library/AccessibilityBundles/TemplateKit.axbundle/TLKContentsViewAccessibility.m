@implementation TLKContentsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TLKContentsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKContentsView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKContentsView"), CFSTR("detailsLabels"), "@", 0);

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
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", &stru_2503B38D0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKContentsViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  v9 = *MEMORY[0x24BDF7390];
  v10[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributes:withRange:", v5, 0, objc_msgSend(v3, "length"));

  -[TLKContentsViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("detailsLabels"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23492252C]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v7);

  return v3;
}

@end
