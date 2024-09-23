@implementation PlatformListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SwiftUI.ListTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SwiftUI.AccessibilityNode"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SwiftUI.ListTableViewCell"), CFSTR("UITableViewCell"));

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  const __CFString *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v27.receiver = self;
  v27.super_class = (Class)PlatformListCellAccessibility;
  -[PlatformListCellAccessibility accessibilityLabel](&v27, sel_accessibilityLabel);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "length"))
  {
    v26 = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subviews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_accessibilityFindUnsortedDescendantsPassingTest:", &__block_literal_global_0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      v12 = (_QWORD *)MEMORY[0x24BDFEB98];
      do
      {
        v13 = 0;
        v14 = v2;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
          objc_msgSend(v15, "accessibilityLabel", v20, v21, (_QWORD)v22);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "accessibilityLanguage");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v18, "setAttribute:forKey:", v17, *v12);
            v16 = v18;
          }
          v20 = v16;
          v21 = CFSTR("__AXStringForVariablesSentinel");
          __UIAXStringForVariables();
          v2 = (void *)objc_claimAutoreleasedReturnValue();

          ++v13;
          v14 = v2;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v28, 16, v16, CFSTR("__AXStringForVariablesSentinel"));
      }
      while (v10);
    }

  }
  return v2;
}

uint64_t __51__PlatformListCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAccessibilityElement");
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  char v18;
  CGPoint result;

  v18 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessibilityActivationPoint");
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PlatformListCellAccessibility;
    -[PlatformListCellAccessibility accessibilityActivationPoint](&v17, sel_accessibilityActivationPoint);
    v10 = v13;
    v12 = v14;
  }

  v15 = v10;
  v16 = v12;
  result.y = v16;
  result.x = v15;
  return result;
}

- (id)_accessibilityRetrieveTableViewCellText
{
  return 0;
}

@end
