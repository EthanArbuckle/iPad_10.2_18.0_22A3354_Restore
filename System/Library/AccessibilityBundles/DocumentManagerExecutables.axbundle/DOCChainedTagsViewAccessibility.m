@implementation DOCChainedTagsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DOCChainedTagsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DOCChainedTagsView"), CFSTR("tags"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v10;
  const __CFString *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[DOCChainedTagsViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("tags"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      v8 = v5;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "displayName", v10, v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = CFSTR("__AXStringForVariablesSentinel");
        __UIAXStringForVariables();
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        ++v7;
        v8 = v5;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16, v10, CFSTR("__AXStringForVariablesSentinel"));
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
