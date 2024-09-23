@implementation SetupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SetupView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SetupView"), CFSTR("_title"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SetupView"), CFSTR("_setupSteps"), "NSMutableArray");

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SetupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v4);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[SetupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_setupSteps"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = CFSTR("NSArray");
    v8 = *(_QWORD *)v28;
    v9 = CFSTR("UILabel");
    v24 = *(_QWORD *)v28;
    do
    {
      v10 = 0;
      v25 = v6;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(obj);
        __UIAccessibilitySafeClass();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilitySafeClass();
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "lastObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilitySafeClass();
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "isAccessibilityElement"))
        {
          v16 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v13, "accessibilityLabel");
          v17 = v3;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "accessibilityLabel");
          v19 = v9;
          v20 = v7;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("%@, %@"), v18, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setAccessibilityLabel:", v22);

          v7 = v20;
          v9 = v19;

          v3 = v17;
          v8 = v24;
          v6 = v25;
          objc_msgSend(v13, "setIsAccessibilityElement:", 0);
        }
        objc_msgSend(v3, "axSafelyAddObject:", v15);

        ++v10;
      }
      while (v6 != v10);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v6);
  }

  return v3;
}

@end
