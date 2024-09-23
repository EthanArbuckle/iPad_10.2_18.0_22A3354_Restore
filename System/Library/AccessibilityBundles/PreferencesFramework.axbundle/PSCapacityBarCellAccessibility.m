@implementation PSCapacityBarCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSCapacityBarCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PSCapacityBarCell"), CFSTR("PSTableCell"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PSCapacityBarCell"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PSCapacityBarCell"), CFSTR("_sizeLabel"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73E0];
}

- (id)accessibilityLabel
{
  return (id)-[PSCapacityBarCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_titleLabel, _sizeLabel"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  double v14;
  void *v15;
  float v16;
  uint64_t v17;
  void *v19;
  void *v20;
  const __CFString *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v26 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", *MEMORY[0x24BE75908]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "capacity");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v4, "categories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v23;
      v11 = (double)v5;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v6);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v14 = (double)(unint64_t)objc_msgSend(v13, "bytes", v19, v20, v21) / v11;
          if (v14 >= 0.01)
          {
            objc_msgSend(v13, "title");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v14;
            MEMORY[0x23491A990](0, v16);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = CFSTR("__AXStringForVariablesSentinel");
            v19 = v15;
            __UIAXStringForVariables();
            v17 = objc_claimAutoreleasedReturnValue();

            v9 = (void *)v17;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
