@implementation _TVStarHistogramAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVStarHistogram");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVStarHistogram"), CFSTR("starBars"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVStarBar"), CFSTR("numStars"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVStarBar"), CFSTR("countStr"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v28;
  const __CFString *v29;
  void *v30;
  _TVStarHistogramAccessibility *v31;
  uint64_t v32;
  id obj;
  objc_super v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  char v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v39 = 0;
  objc_opt_class();
  -[_TVStarHistogramAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("starBars"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v30 = v4;
    v31 = self;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = 0x24BDD1000uLL;
      v9 = CFSTR("numStars");
      v10 = *(_QWORD *)v36;
      do
      {
        v11 = 0;
        v32 = v6;
        do
        {
          if (*(_QWORD *)v36 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v11);
          v39 = 0;
          objc_opt_class();
          objc_msgSend(v12, "safeValueForKey:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39
            || (v39 = 0,
                objc_opt_class(),
                objc_msgSend(v12, "safeValueForKey:", CFSTR("countStr")),
                v15 = (void *)objc_claimAutoreleasedReturnValue(),
                __UIAccessibilityCastAsClass(),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                v15,
                v39))
          {
            abort();
          }
          if (v14)
            v17 = v16 == 0;
          else
            v17 = 1;
          if (!v17)
          {
            objc_msgSend(v16, "string");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "integerValue");

            if (v19 >= 1)
            {
              v20 = (void *)MEMORY[0x24BDD17C8];
              accessibilityLocalizedString(CFSTR("star.histogram"));
              v21 = v10;
              v22 = v9;
              v23 = v8;
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "stringWithFormat:", v24, v19, objc_msgSend(v14, "integerValue"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = CFSTR("__AXStringForVariablesSentinel");
              __UIAXStringForVariables();
              v25 = objc_claimAutoreleasedReturnValue();

              v8 = v23;
              v9 = v22;
              v10 = v21;
              v6 = v32;
              v7 = (void *)v25;
            }
          }

          ++v11;
        }
        while (v6 != v11);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    v4 = v30;
    self = v31;
  }
  else
  {
    v7 = 0;
  }
  if (!objc_msgSend(v7, "length", v28, v29))
  {
    v34.receiver = self;
    v34.super_class = (Class)_TVStarHistogramAccessibility;
    -[_TVStarHistogramAccessibility accessibilityLabel](&v34, sel_accessibilityLabel);
    v26 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v26;
  }

  return v7;
}

- (id)_accessibilityAncestorFocusParcel
{
  void *v3;
  char v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isProcessTVAppStore");

  if ((v4 & 1) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)_TVStarHistogramAccessibility;
  -[_TVStarHistogramAccessibility _accessibilityAncestorFocusParcel](&v6, sel__accessibilityAncestorFocusParcel);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
