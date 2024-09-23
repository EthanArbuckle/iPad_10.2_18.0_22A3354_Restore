@implementation HUMosaicCameraCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUMosaicCameraCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUMosaicCameraCell"), CFSTR("item"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  objc_super v11;
  char v12;

  v12 = 0;
  objc_opt_class();
  -[HUMosaicCameraCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE4CF80]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE4CF58]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)HUMosaicCameraCellAccessibility;
    -[HUMosaicCameraCellAccessibility accessibilityLabel](&v11, sel_accessibilityLabel);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end
