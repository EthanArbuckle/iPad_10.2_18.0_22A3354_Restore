@implementation MPUMarqueeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MPUMarqueeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPUMarqueeView"), CFSTR("contentView"), "@", 0);
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[MPUMarqueeViewAccessibility storedIsAccessibilityElement](self, "storedIsAccessibilityElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "BOOLValue");
  }
  else
  {
    -[MPUMarqueeViewAccessibility accessibilityLabel](self, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "length") != 0;

  }
  return v5;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[MPUMarqueeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = &stru_24FEF6420;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "accessibilityLabel");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAXStringForVariables();
          v10 = objc_claimAutoreleasedReturnValue();

          v7 = (__CFString *)v10;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v7 = &stru_24FEF6420;
  }

  return v7;
}

@end
