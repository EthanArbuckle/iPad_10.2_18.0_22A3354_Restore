@implementation TLKDetailsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TLKDetailsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("TLKTitleContainerView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKDetailsView"), CFSTR("titleContainer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKTitleContainerView"), CFSTR("titleLabelString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKTitleContainerView"), CFSTR("secondaryLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("TLKDetailsView"), CFSTR("contentView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("TLKTextAreaView"), CFSTR("detailsFields"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKDetailsView"), CFSTR("footnoteLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  -[TLKDetailsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleContainer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("titleLabelString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeUIViewForKey:", CFSTR("secondaryLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "_accessibilityViewIsVisible") & 1) != 0)
  {
    objc_msgSend(v4, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __UIAXStringForVariables();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)accessibilityValue
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[TLKDetailsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20 = 0;
  objc_opt_class();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("detailsFields"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v2, "safeValueForKey:", CFSTR("footnoteLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "axSafelyAddObject:", v7);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "_accessibilityViewIsVisible", (_QWORD)v16))
          objc_msgSend(v3, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v10);
  }

  MEMORY[0x23492252C](v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
