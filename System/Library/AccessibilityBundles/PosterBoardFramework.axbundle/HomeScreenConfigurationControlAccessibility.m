@implementation HomeScreenConfigurationControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PosterBoard.HomeScreenConfigurationControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PUIGradientView"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("PosterBoard.HomeScreenConfigurationControl"), CFSTR("previewContentView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("PosterBoard.HomeScreenConfigurationControl"), CFSTR("previewContentView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("PUIGradientView"), CFSTR("colors"), "@");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PosterBoard.HomeScreenConfigurationControl"), CFSTR("title"));
  objc_msgSend(v3, "validateClass:", CFSTR("PosterBoard.HomeScreenConfigurationBlurControlContentView"));
  objc_msgSend(v3, "validateClass:", CFSTR("PosterBoard.HomeScreenConfigurationPosterControlContentView"));

}

- (id)accessibilityLabel
{
  return (id)-[HomeScreenConfigurationControlAccessibility safeSwiftStringForKey:](self, "safeSwiftStringForKey:", CFSTR("title"));
}

- (id)accessibilityValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v7;

  -[HomeScreenConfigurationControlAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("previewContentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HomeScreenConfigurationControlAccessibility _axPreviewContentIsPosterOrBlur:](self, "_axPreviewContentIsPosterOrBlur:", v3))
  {
    objc_msgSend(v3, "accessibilityValue");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = (void *)v4;
    goto LABEL_6;
  }
  MEMORY[0x23491A0AC](CFSTR("PUIGradientView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HomeScreenConfigurationControlAccessibility _axGradientColorValue:](self, "_axGradientColorValue:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(v3, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AXColorStringForColor();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_6:

  return v5;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HomeScreenConfigurationControlAccessibility;
  return *MEMORY[0x24BDF73B0] | -[HomeScreenConfigurationControlAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;
  char v9;

  -[HomeScreenConfigurationControlAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("previewContentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HomeScreenConfigurationControlAccessibility _axPreviewContentIsPosterOrBlur:](self, "_axPreviewContentIsPosterOrBlur:", v3)&& -[HomeScreenConfigurationControlAccessibility _accessibilityIsUserInteractionEnabled](self, "_accessibilityIsUserInteractionEnabled"))
  {
    objc_msgSend(v3, "accessibilityHint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isSelected") & 1) != 0)
    {
      accessibilityLocalizedString(CFSTR("home.configuration.select.color.hint"));
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)HomeScreenConfigurationControlAccessibility;
      -[HomeScreenConfigurationControlAccessibility accessibilityHint](&v8, sel_accessibilityHint);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v4 = (void *)v6;

  }
  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_axGradientColorValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("colors"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v4, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  AXColorStringForColor();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AXColorStringForColor();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);
  v12 = (void *)MEMORY[0x24BDD17C8];
  if (v11)
  {
    accessibilityLocalizedString(CFSTR("home.configuration.gradient.color.value"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    accessibilityLocalizedString(CFSTR("home.configuration.gradient.between.colors.value"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v10;
  }
  objc_msgSend(v12, "stringWithFormat:", v13, v9, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)_axPreviewContentIsPosterOrBlur:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  MEMORY[0x23491A0AC](CFSTR("PosterBoard.HomeScreenConfigurationBlurControlContentView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    MEMORY[0x23491A0AC](CFSTR("PosterBoard.HomeScreenConfigurationPosterControlContentView"));
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

@end
