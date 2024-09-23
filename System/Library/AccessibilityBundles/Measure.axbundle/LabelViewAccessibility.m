@implementation LabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.LabelView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.LabelView"), CFSTR("labels"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.LabelRender"), CFSTR("speakableString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.LabelRender"), CFSTR("accessibilityFrameForLabelContainer"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.LabelRender"), CFSTR("state"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.LabelRender"), CFSTR("labelNode"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MeasureFoundation.WorldLine"), CFSTR("identifiersOfObjectsComposedInto"), "@", 0);

}

- (id)_axLabelElementForMeasureID:(id)a3 accessibilityContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AXMeasureLabelAccessibilityElement *v12;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  -[LabelViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labels"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "_accessibilityValueForKey:", CFSTR("LabelRenderAXElement"));
    v12 = (AXMeasureLabelAccessibilityElement *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v12 = -[AXMeasureLabelAccessibilityElement initWithAccessibilityContainer:]([AXMeasureLabelAccessibilityElement alloc], "initWithAccessibilityContainer:", v7);
      -[AXMeasureLabelAccessibilityElement setLabelRender:](v12, "setLabelRender:", v11);
      objc_msgSend(v11, "_accessibilitySetRetainedValue:forKey:", v12, CFSTR("LabelRenderAXElement"));
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)_accessibilityLastSavedMeasurementString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  AXMeasureAccessibilityStateObserver();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axOrderedWorldLineIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  objc_opt_class();
  -[LabelViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labels"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__LabelViewAccessibility__accessibilityLastSavedMeasurementString__block_invoke;
  v10[3] = &unk_25026DE78;
  v7 = v6;
  v11 = v7;
  v12 = &v14;
  objc_msgSend(v4, "enumerateObjectsWithOptions:usingBlock:", 2, v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return (NSString *)v8;
}

void __66__LabelViewAccessibility__accessibilityLastSavedMeasurementString__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v9, "safeIntegerForKey:", CFSTR("state")) - 3) >= 2)
  {
    objc_msgSend(v9, "safeStringForKey:", CFSTR("speakableString"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    *a4 = 1;
  }

}

- (NSString)_accessibilityCurrentMeasurementString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  AXMeasureAccessibilityStateObserver();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axOrderedWorldLineIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[LabelViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labels"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v8, "safeIntegerForKey:", CFSTR("state")) - 3) > 1)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v8, "safeStringForKey:", CFSTR("speakableString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v9;
}

- (id)_accessibilityLabelElementsWithAccessibilityContainer:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  AXMeasureAccessibilityStateObserver();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "axOrderedWorldLineIDs");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        v10 = v7;
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v20, "axWorldLines");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "safeArrayForKey:", CFSTR("identifiersOfObjectsComposedInto"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 && (objc_msgSend(v10, "isEqual:", v7) & 1) == 0)
        {
          -[LabelViewAccessibility _axLabelElementForMeasureID:accessibilityContainer:](self, "_axLabelElementForMeasureID:accessibilityContainer:", v10, v4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setIsRectangleArea:", 1);
          objc_msgSend(v21, "axSafelyAddObject:", v15);

        }
        -[LabelViewAccessibility _axLabelElementForMeasureID:accessibilityContainer:](self, "_axLabelElementForMeasureID:accessibilityContainer:", v11, v4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setIsRectangleSideLength:", v7 != 0);
        objc_msgSend(v21, "axSafelyAddObject:", v16);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
    if (v7)
    {
      -[LabelViewAccessibility _axLabelElementForMeasureID:accessibilityContainer:](self, "_axLabelElementForMeasureID:accessibilityContainer:", v7, v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setIsRectangleArea:", 1);
      objc_msgSend(v21, "axSafelyAddObject:", v17);

    }
  }

  return v21;
}

@end
