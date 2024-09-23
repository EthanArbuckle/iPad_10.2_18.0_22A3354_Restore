@implementation CAMPhotoFormatStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMPhotoFormatStatusIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMPhotoFormatStatusIndicator"), CFSTR("CAMExpandingControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMExpandingControl"), CFSTR("selectedState"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMPhotoFormatStatusIndicator"), CFSTR("allowedFormats"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMPhotoFormatStatusIndicator"), CFSTR("_essentialFormatIndex"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMPhotoFormatStatusIndicator"), CFSTR("_advancedFormatIndex"), "Q", 0);

}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(CFSTR("PHOTO_ENCODING_FORMAT"));
}

- (id)accessibilityValue
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  -[CAMPhotoFormatStatusIndicatorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = 0;
  objc_msgSend(v3, "getValue:size:", &v12, 16);
  v4 = v12;
  v5 = v13;
  if (-[CAMPhotoFormatStatusIndicatorAccessibility _axIsCurrentFormatEssential](self, "_axIsCurrentFormatEssential"))
  {
    -[CAMPhotoFormatStatusIndicatorAccessibility _axAllowedFormats](self, "_axAllowedFormats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", -[CAMPhotoFormatStatusIndicatorAccessibility _axAdvancedFormatIndex](self, "_axAdvancedFormatIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v13 = 0;
    objc_msgSend(v7, "getValue:size:", &v12, 16);
    v4 = v12;
    v5 = v13;

  }
  -[CAMPhotoFormatStatusIndicatorAccessibility _axLocalizedStringForPhotoFormat:](self, "_axLocalizedStringForPhotoFormat:", v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPhotoFormatStatusIndicatorAccessibility _axCurrentFormatValue](self, "_axCurrentFormatValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)accessibilityActivate
{
  BOOL v3;
  void *v4;
  void *v5;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMPhotoFormatStatusIndicatorAccessibility;
  v3 = -[CAMPhotoFormatStatusIndicatorAccessibility accessibilityActivate](&v8, sel_accessibilityActivate);
  -[CAMPhotoFormatStatusIndicatorAccessibility _axCurrentFormatValue](self, "_axCurrentFormatValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v7 = v4;
    AXPerformBlockOnMainThreadAfterDelay();

  }
  return v3;
}

void __67__CAMPhotoFormatStatusIndicatorAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], *(id *)(a1 + 32));
}

- (id)_axAllowedFormats
{
  return (id)-[CAMPhotoFormatStatusIndicatorAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("allowedFormats"));
}

- (unint64_t)_axEssentialFormatIndex
{
  return -[CAMPhotoFormatStatusIndicatorAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("_essentialFormatIndex"));
}

- (unint64_t)_axAdvancedFormatIndex
{
  return -[CAMPhotoFormatStatusIndicatorAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("_advancedFormatIndex"));
}

- (id)_axCurrentFormatValue
{
  __CFString *v2;

  if (-[CAMPhotoFormatStatusIndicatorAccessibility _axIsCurrentFormatEssential](self, "_axIsCurrentFormatEssential"))
    v2 = CFSTR("PHOTO_ENCODING_OFF");
  else
    v2 = CFSTR("PHOTO_ENCODING_ON");
  accessibilityCameraUILocalizedString(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_axEncodingName:(id)a3
{
  if (a3.var0 > 2uLL)
    return 0;
  accessibilityCameraUILocalizedString(off_24FEE0008[a3.var0]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_axLocalizedStringForPhotoFormat:(id)a3
{
  int64_t var1;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  var1 = a3.var1;
  -[CAMPhotoFormatStatusIndicatorAccessibility _axEncodingName:](self, "_axEncodingName:", a3.var0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 24;
  v6 = 12;
  if (var1 != 1)
    v6 = 0;
  if (var1 != 2)
    v5 = v6;
  v7 = var1 == 3;
  if (var1 == 3)
    v8 = 48;
  else
    v8 = v5;
  +[AXCameraUIGlue integerFormatter](AXCameraUIGlue, "integerFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromNumber:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    accessibilityCameraUILocalizedString(CFSTR("PHOTO_ENCODING_MAX"));
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  __UIAXStringForVariables();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)_axIsCurrentFormatEssential
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[CAMPhotoFormatStatusIndicatorAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPhotoFormatStatusIndicatorAccessibility _axAllowedFormats](self, "_axAllowedFormats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAMPhotoFormatStatusIndicatorAccessibility _axEssentialFormatIndex](self, "_axEssentialFormatIndex");
  LOBYTE(v5) = objc_msgSend(v4, "indexOfObject:", v3) == v5;

  return v5;
}

@end
