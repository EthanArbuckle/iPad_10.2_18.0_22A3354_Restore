@implementation CardViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Diagnostics.CardViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Diagnostics.CardViewCell"), CFSTR("stackView"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("Diagnostics.CardStackSubviewContainer"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Diagnostics.CardStackSubviewContainer"), CFSTR("containedView"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20 = 0;
  objc_opt_class();
  -[CardViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("stackView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v15 = v4;
  objc_msgSend(v4, "arrangedSubviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        MEMORY[0x23490CF48](CFSTR("Diagnostics.CardStackSubviewContainer"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "safeValueForKey:", CFSTR("containedView"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v12, "subviewsForStackViewElement");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "axSafelyAddObjectsFromArray:", v13);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v8);
  }

  return v5;
}

@end
