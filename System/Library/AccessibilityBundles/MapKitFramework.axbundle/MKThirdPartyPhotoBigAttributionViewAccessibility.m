@implementation MKThirdPartyPhotoBigAttributionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKThirdPartyPhotoBigAttributionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKThirdPartyPhotoBigAttributionView"), CFSTR("_firstLineLabel"), "_MKUILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKThirdPartyPhotoBigAttributionView"), CFSTR("_secondLineLabel"), "_MKUILabel");

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
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  char v18;

  -[MKThirdPartyPhotoBigAttributionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_firstLineLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  objc_opt_class();
  -[MKThirdPartyPhotoBigAttributionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_secondLineLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "attributedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v7, "attribute:atIndex:effectiveRange:", CFSTR("AXAttributeDisplayName"), 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = *MEMORY[0x24BDF65C0];
    v12 = objc_msgSend(v7, "length");
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __70__MKThirdPartyPhotoBigAttributionViewAccessibility_accessibilityLabel__block_invoke;
    v15[3] = &unk_250250850;
    v16 = v9;
    v17 = v10;
    objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v12, 0, v15);

  }
  __UIAXStringForVariables();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __70__MKThirdPartyPhotoBigAttributionViewAccessibility_accessibilityLabel__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a2)
  {
    result = objc_msgSend(*(id *)(result + 32), "replaceCharactersInRange:withString:", a3, a4, *(_QWORD *)(result + 40));
    *a5 = 1;
  }
  return result;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73D8];
}

@end
