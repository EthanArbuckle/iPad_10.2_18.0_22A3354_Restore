@implementation MFCaptionLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFCaptionLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MFCaptionLabel"), CFSTR("UILabel"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFCaptionLabel"), CFSTR("_chevronAttributedString"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  MFCaptionLabelAccessibility *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v10 = MEMORY[0x24BDAC760];
  v11 = self;
  AXPerformSafeBlock();
  v4 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  objc_msgSend(v3, "attributedText", v10, 3221225472, __49__MFCaptionLabelAccessibility_accessibilityLabel__block_invoke, &unk_24FEF9F48, v11, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", v7, &stru_24FEFADD8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __49__MFCaptionLabelAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_chevronAttributedString");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
