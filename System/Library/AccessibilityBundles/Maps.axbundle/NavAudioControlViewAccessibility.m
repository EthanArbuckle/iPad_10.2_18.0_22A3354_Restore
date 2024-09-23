@implementation NavAudioControlViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NavAudioControlView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavAudioControlView"), CFSTR("currentAudioType"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavAudioControlView"), CFSTR("availableAudioTypes"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavAudioControlView"), CFSTR("_selectAudioType:"), "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavAudioControlView"), CFSTR("_accessibilityTextForAudioType:"), "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavAudioControlView"), CFSTR("_animateContentUpdate"), "v", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return AXMapsLocString(CFSTR("AUDIO"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityCustomActions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char *v10;
  void *v11;
  char *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NavAudioControlViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("availableAudioTypes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      v13 = sel__accessibilitySetNavTypeToNone;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v7), "intValue", v13);
        -[NavAudioControlViewAccessibility _accessibilityTextForAudioType:](self, "_accessibilityTextForAudioType:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = sel__accessibilitySetNavTypeToAll;
          if (!v8)
            goto LABEL_12;
          if (v8 == 2)
          {
            v10 = v13;
LABEL_12:
            v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v9, self, v10);
            objc_msgSend(v14, "addObject:", v11);

            goto LABEL_13;
          }
          v10 = sel__accessibilitySetNavTypeToAlerts;
          if (v8 == 1)
            goto LABEL_12;
        }
LABEL_13:

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  return v14;
}

- (id)accessibilityValue
{
  return (id)-[NavAudioControlViewAccessibility _accessibilityTextForAudioType:](self, "_accessibilityTextForAudioType:", (int)-[NavAudioControlViewAccessibility safeIntForKey:](self, "safeIntForKey:", CFSTR("currentAudioType")));
}

- (BOOL)_accessibilitySetNavTypeToAll
{
  -[NavAudioControlViewAccessibility _selectAudioType:](self, "_selectAudioType:", 0);
  -[NavAudioControlViewAccessibility _animateContentUpdate](self, "_animateContentUpdate");
  return 1;
}

- (BOOL)_accessibilitySetNavTypeToAlerts
{
  -[NavAudioControlViewAccessibility _selectAudioType:](self, "_selectAudioType:", 1);
  -[NavAudioControlViewAccessibility _animateContentUpdate](self, "_animateContentUpdate");
  return 1;
}

- (BOOL)_accessibilitySetNavTypeToNone
{
  -[NavAudioControlViewAccessibility _selectAudioType:](self, "_selectAudioType:", 2);
  -[NavAudioControlViewAccessibility _animateContentUpdate](self, "_animateContentUpdate");
  return 1;
}

@end
