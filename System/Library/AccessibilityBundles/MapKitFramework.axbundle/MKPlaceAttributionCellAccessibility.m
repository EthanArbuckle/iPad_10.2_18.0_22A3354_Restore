@implementation MKPlaceAttributionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKPlaceAttributionCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKPlaceAttributionCell"), CFSTR("_label"), "_MKUILabel");
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;

  LOBYTE(v16) = 0;
  objc_opt_class();
  -[MKPlaceAttributionCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "attributedText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v6, "attribute:atIndex:effectiveRange:", CFSTR("AXAttributeDisplayName"), 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "length"))
      {
        v16 = 0;
        v17 = &v16;
        v18 = 0x3010000000;
        v19 = &unk_2326FB5CA;
        v20 = xmmword_2326FAC30;
        v8 = objc_msgSend(v6, "length");
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __57__MKPlaceAttributionCellAccessibility_accessibilityLabel__block_invoke;
        v15[3] = &unk_250250878;
        v15[4] = &v16;
        objc_msgSend(v6, "enumerateAttributesInRange:options:usingBlock:", 0, v8, 0, v15);
        v9 = v17[4];
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = v17[5];
          if (v10 + v9 <= (unint64_t)objc_msgSend(v6, "length"))
          {
            objc_msgSend(v6, "string");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (void *)objc_msgSend(v13, "copy");

            objc_msgSend(v14, "stringByReplacingCharactersInRange:withString:", v17[4], v17[5], v7);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            _Block_object_dispose(&v16, 8);
            goto LABEL_10;
          }
        }
        _Block_object_dispose(&v16, 8);
      }

    }
  }
  objc_msgSend(v4, "accessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v11;
}

void __57__MKPlaceAttributionCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v9;
  uint64_t v10;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x24BDF65C0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_QWORD *)(v10 + 32) = a3;
    *(_QWORD *)(v10 + 40) = a4;
    *a5 = 1;
  }
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
