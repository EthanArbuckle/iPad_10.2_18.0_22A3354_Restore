@implementation _TVInfoListViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVInfoListView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVInfoListView"), CFSTR("groupedInfos"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("_TVInfoListInfo"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVInfoListInfo"), CFSTR("headerContentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVInfoListInfo"), CFSTR("dataViews"), "@", 0);

}

- (id)accessibilityElements
{
  void *v3;
  uint64_t i;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[_TVInfoListViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("groupedInfos"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(obj);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_opt_class();
        __UIAccessibilityCastAsClass();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v18;
          do
          {
            for (j = 0; j != v7; ++j)
            {
              if (*(_QWORD *)v18 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
              objc_msgSend(v10, "safeValueForKey:", CFSTR("headerContentView"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "axSafelyAddObject:", v11);

              objc_msgSend(v10, "safeArrayForKey:", CFSTR("dataViews"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v12);

            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v7);
        }

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v16);
  }

  return v3;
}

@end
