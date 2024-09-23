@implementation HUStringInLabelTapGestureRecognizerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUStringInLabelTapGestureRecognizer");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUStringInLabelTapGestureRecognizer"), CFSTR("UITapGestureRecognizer"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUStringInLabelTapGestureRecognizer"), CFSTR("shouldReceiveEvent:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUStringInLabelTapGestureRecognizer"), CFSTR("_didTapAttributedTextInLabel: targetRange: event:"), "B", "@", "{_NSRange=QQ}", "@", 0);

}

- (BOOL)shouldReceiveEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)HUStringInLabelTapGestureRecognizerAccessibility;
  -[HUStringInLabelTapGestureRecognizerAccessibility shouldReceiveEvent:](&v33, sel_shouldReceiveEvent_, v4);
  LOBYTE(v29) = 0;
  objc_opt_class();
  -[HUStringInLabelTapGestureRecognizerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "attributedText");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[HUStringInLabelTapGestureRecognizerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accessibilityLabel");
      v9 = objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[NSObject string](v7, "string");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "rangeOfString:options:", v9, 4);

        v29 = 0;
        v30 = &v29;
        v31 = 0x2020000000;
        v32 = 0;
        v27 = v6;
        v28 = v4;
        AXPerformSafeBlock();
        v11 = *((_BYTE *)v30 + 24) != 0;

        _Block_object_dispose(&v29, 8);
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      AXLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[HUStringInLabelTapGestureRecognizerAccessibility shouldReceiveEvent:].cold.2(v9, v19, v20, v21, v22, v23, v24, v25);
    }
    v11 = 0;
    goto LABEL_11;
  }
  AXLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[HUStringInLabelTapGestureRecognizerAccessibility shouldReceiveEvent:].cold.1(v7, v12, v13, v14, v15, v16, v17, v18);
  v11 = 0;
LABEL_12:

  return v11;
}

uint64_t __71__HUStringInLabelTapGestureRecognizerAccessibility_shouldReceiveEvent___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_didTapAttributedTextInLabel:targetRange:event:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)shouldReceiveEvent:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_232691000, a1, a3, "This class currently only supports UILabel", a5, a6, a7, a8, 0);
}

- (void)shouldReceiveEvent:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_232691000, a1, a3, "This class currently only supports search in label.attributedText, feel free to add label.text support too!", a5, a6, a7, a8, 0);
}

@end
