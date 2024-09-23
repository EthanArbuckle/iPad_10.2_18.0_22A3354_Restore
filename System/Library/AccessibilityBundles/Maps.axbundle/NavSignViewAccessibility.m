@implementation NavSignViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NavSignView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavSignView"), CFSTR("majorLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavSignView"), CFSTR("minorLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("NavSignLabel"), CFSTR("UILabel"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavSignView"), CFSTR("isManeuverSign"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavSignView"), CFSTR("maneuverSign"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GuidanceManeuverArtwork"), CFSTR("maneuver"), "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavManeuverSignView"), CFSTR("maneuverGuidanceInfo"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavSignManeuverGuidanceInfo"), CFSTR("shieldInfo"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavSignManeuverGuidanceInfo"), CFSTR("maneuverArtwork"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavSignShieldInfo"), CFSTR("shieldText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavSignManeuverGuidanceInfo"), CFSTR("minorText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKServerFormattedString"), CFSTR("geoServerString"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v22;
  const __CFString *v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  objc_opt_class();
  -[NavSignViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("majorLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v4, "accessibilityLabel");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_25025B660;
  }
  LOBYTE(v25) = 0;
  objc_opt_class();
  -[NavSignViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("minorLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v7, "accessibilityLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v8;
  }
  if (-[NavSignViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isManeuverSign"), v22, v23))
  {
    -[NavSignViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("maneuverSign"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NavSignViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("maneuverGuidanceInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      objc_msgSend(v10, "safeValueForKey:", CFSTR("maneuverArtwork"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "safeIntForKey:", CFSTR("maneuver"));

      AXMapsStringForManeuverType(v13);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v11)
        goto LABEL_15;
    }
    else
    {
      v14 = &stru_25025B660;
      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
    }
    objc_msgSend(v11, "safeValueForKey:", CFSTR("shieldInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "safeStringForKey:", CFSTR("shieldText"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = 0;
      v26 = &v25;
      v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__1;
      v29 = __Block_byref_object_dispose__1;
      v30 = 0;
      v24 = v11;
      AXPerformSafeBlock();
      v19 = (id)v26[5];

      _Block_object_dispose(&v25, 8);
      __UIAXStringForVariables();
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_15;
  }
  v14 = &stru_25025B660;
LABEL_16:
  __UIAXStringForVariables();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __46__NavSignViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("minorText"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("geoServerString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_navigation_stringForServerFormattedString:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

@end
