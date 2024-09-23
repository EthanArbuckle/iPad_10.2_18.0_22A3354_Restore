@implementation PSSegmentableSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSSegmentableSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSSegmentableSlider"), CFSTR("numberOfTicks"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSSegmentableSlider"), CFSTR("offsetBetweenTicksForNumberOfTicks:"), "f", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSSegmentableSlider"), CFSTR("locksToSegment"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PSSegmentableSlider"), CFSTR("UISlider"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISlider"), CFSTR("minimumValue"), "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PSSegmentableSlider"), CFSTR("_segmented"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISlider"), CFSTR("value"), "f", 0);

}

- (double)_accessibilityIncreaseAmount:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  void *v11;
  float v12;
  float v13;
  unint64_t v14;
  uint64_t v15;
  void *v17;
  float v18;
  float v19;
  float v20;
  uint64_t v22;
  float *v23;
  uint64_t v24;
  int v25;

  v3 = a3;
  -[PSSegmentableSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("numberOfTicks"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  -[PSSegmentableSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("minimumValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  v22 = 0;
  v23 = (float *)&v22;
  v24 = 0x2020000000;
  v25 = 0;
  AXPerformSafeBlock();
  v10 = v23[6];
  _Block_object_dispose(&v22, 8);
  -[PSSegmentableSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("value"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = v12;

  if (-[PSSegmentableSliderAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_segmented"))
    && -[PSSegmentableSliderAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("locksToSegment")))
  {
    v14 = llroundf((float)(v13 - v9) / v10);
    if (v3)
      v15 = v14 + 1;
    else
      v15 = v14 - 1;
    if (v6 - 1 < v15)
      v15 = v6 - 1;
    return (float)(v9 + (float)(v10 * (float)(v15 & ~(v15 >> 63))));
  }
  else
  {
    -[PSSegmentableSliderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("maximumValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    v19 = v18;

    v20 = (float)(v19 - v9) / 10.0;
    if (!v3)
      v20 = -v20;
    return (float)(v13 + v20);
  }
}

uint64_t __65__PSSegmentableSliderAccessibility__accessibilityIncreaseAmount___block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;

  result = objc_msgSend(*(id *)(a1 + 32), "offsetBetweenTicksForNumberOfTicks:", *(_QWORD *)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

@end
