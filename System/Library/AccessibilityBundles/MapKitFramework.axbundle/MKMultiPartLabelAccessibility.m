@implementation MKMultiPartLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKMultiPartLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMultiPartLabel"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMultiPartLabel"), CFSTR("multiPartString"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MKMultiPartAttributedString"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMultiPartAttributedString"), CFSTR("components"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v15;
  const __CFString *v16;
  void *v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  __CFString *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[MKMultiPartLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("multiPartString"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_14;
  objc_opt_class();
  objc_msgSend(v18, "safeValueForKey:", CFSTR("components"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = &stru_2502511F8;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = v3;
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v21;
    v7 = *MEMORY[0x24BDF65C0];
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = objc_msgSend(v9, "length");
          v19[0] = MEMORY[0x24BDAC760];
          v19[1] = 3221225472;
          v19[2] = __51__MKMultiPartLabelAccessibility_accessibilityLabel__block_invoke;
          v19[3] = &unk_250250828;
          v19[4] = &v24;
          objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v10, 0, v19);
          objc_msgSend(v9, "string");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = CFSTR("__AXStringForVariablesSentinel");
          __UIAXStringForVariables();
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (void *)v25[5];
          v25[5] = v11;

        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v5);
  }

  v13 = objc_msgSend((id)v25[5], "length");
  if (v13)
    v5 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  if (!v13)
  {
LABEL_14:
    -[MKMultiPartLabelAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("text"), v15, v16);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

void __51__MKMultiPartLabelAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  NSClassFromString(CFSTR("NSTextAttachment"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

@end
