@implementation _MKLineHeaderModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_MKLineHeaderModel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_MKLineHeaderModel"), CFSTR("contentAttributedString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_MKLineHeaderModel"), CFSTR("_tokens"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_MKTokenAttributedString"), CFSTR("attributedString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_MKTokenAttributedString"), CFSTR("string"), "@", 0);

}

- (id)contentAttributedString
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)_MKLineHeaderModelAccessibility;
  -[_MKLineHeaderModelAccessibility contentAttributedString](&v29, sel_contentAttributedString);
  v4 = objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_opt_class();
  -[_MKLineHeaderModelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tokens"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v26;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_opt_class();
        objc_msgSend(v12, "safeValueForKey:", CFSTR("attributedString"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          objc_opt_class();
          objc_msgSend(v12, "safeValueForKey:", CFSTR("string"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "accessibilityLabel");
          v20 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v20;
          if (v20)
            v21 = v20;
          else
            v21 = (uint64_t)v15;
          v23 = (void *)v21;
          __UIAXStringForVariables();
          v17 = objc_claimAutoreleasedReturnValue();

LABEL_15:
          v9 = (void *)v17;
          goto LABEL_16;
        }
        objc_msgSend(v14, "accessibilityLabel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (uint64_t)v15;
        if (!v15)
        {
          objc_msgSend(v14, "string");
          v2 = objc_claimAutoreleasedReturnValue();
          v16 = v2;
        }
        v23 = (void *)v16;
        __UIAXStringForVariables();
        v17 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v2;
        v9 = (void *)v17;
        if (!v15)
          goto LABEL_15;
LABEL_16:

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16, v23, CFSTR("__AXStringForVariablesSentinel"));
      if (!v8)
        goto LABEL_20;
    }
  }
  v9 = 0;
LABEL_20:

  objc_msgSend(v24, "setAccessibilityLabel:", v9);
  return v24;
}

@end
