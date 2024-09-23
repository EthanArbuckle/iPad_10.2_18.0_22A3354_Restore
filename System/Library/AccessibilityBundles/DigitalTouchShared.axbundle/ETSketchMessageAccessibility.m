@implementation ETSketchMessageAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ETSketchMessage");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ETSketchMessage"), CFSTR("ETMessage"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETMessage"), CFSTR("color"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETSketchMessage"), CFSTR("strokes"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETSketchMessage"), CFSTR("colorsInMessage"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETSketchMessage"), CFSTR("numberOfColors"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETSketchMessage"), CFSTR("hasMultipleColors"), "B", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("sketch.message"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETSketchMessageAccessibility _accessibilityStrokeDescription](self, "_accessibilityStrokeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_accessibilityMessageTypeString
{
  return accessibilityLocalizedString(CFSTR("sketch"));
}

- (id)_accessibilityStrokeDescription
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  char v11;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v11 = 0;
  objc_opt_class();
  -[ETSketchMessageAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("strokes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__ETSketchMessageAccessibility__accessibilityStrokeDescription__block_invoke;
  v9[3] = &unk_2501F5F78;
  v9[4] = self;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  -[ETSketchMessageAccessibility _accessibilityStringForColorCounts:](self, "_accessibilityStringForColorCounts:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __63__ETSketchMessageAccessibility__accessibilityStrokeDescription__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityColorOfStroke:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityIncrementNumberOfKey:inDictionary:", v2, *(_QWORD *)(a1 + 40));

}

- (id)_accessibilityStringForColorCounts:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__ETSketchMessageAccessibility__accessibilityStringForColorCounts___block_invoke;
  v6[3] = &unk_2501F5FA0;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __67__ETSketchMessageAccessibility__accessibilityStringForColorCounts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a3;
  v7 = a2;
  accessibilityLocalizedString(CFSTR("stroke.color.description"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v5, "localizedStringWithFormat:", v8, v9);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "axColorStringForSpeaking");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  __AXStringForVariables();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

- (void)_accessibilityIncrementNumberOfKey:(id)a3 inDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  v11 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "integerValue") + 1;
  else
    v9 = 1;
  objc_msgSend(v8, "numberWithInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v10, v6);

}

- (id)_accessibilityColorOfStroke:(unint64_t)a3
{
  id v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (-[ETSketchMessageAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("hasMultipleColors")))
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x3032000000;
    v9 = __Block_byref_object_copy_;
    v10 = __Block_byref_object_dispose_;
    v11 = 0;
    AXPerformSafeBlock();
    v4 = (id)v7[5];
    _Block_object_dispose(&v6, 8);

    return v4;
  }
  else
  {
    -[ETSketchMessageAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("color"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void __60__ETSketchMessageAccessibility__accessibilityColorOfStroke___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("numberOfColors"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v2 < v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_colorsInMessage"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", *(_QWORD *)(a1 + 48));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (id)_accessibilityUIColorFromETColor:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", (double)a3.var0 / 255.0, (double)a3.var1 / 255.0, (double)a3.var2 / 255.0, (double)a3.var3 / 255.0);
}

@end
