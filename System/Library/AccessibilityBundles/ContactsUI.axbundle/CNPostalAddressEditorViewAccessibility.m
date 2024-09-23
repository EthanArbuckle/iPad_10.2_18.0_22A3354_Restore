@implementation CNPostalAddressEditorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPostalAddressEditorView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPostalAddressEditorView"), CFSTR("textFields"), "@", 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CNPostalAddressEditorViewAccessibility;
  -[CNPostalAddressEditorViewAccessibility tableView:cellForRowAtIndexPath:](&v25, sel_tableView_cellForRowAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_opt_class();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("textFields"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v24 = 0;
        objc_opt_class();
        __UIAccessibilityCastAsClass();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
          abort();
        v17 = v16;
        objc_msgSend(v16, "placeholder", v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v17, "setAccessibilityLabel:", v18);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v13);
  }

  return v8;
}

@end
