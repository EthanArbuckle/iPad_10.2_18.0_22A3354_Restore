@implementation UIAirDropGroupActivityCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIAirDropGroupActivityCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIAirDropGroupActivityCell"), CFSTR("progress"), "d", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("UIAirDropGroupActivityCell"), CFSTR("textSlotID"), "I");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("UIAirDropGroupActivityCell"), CFSTR("subtitleSlotID"), "I");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("UIAirDropGroupActivityCell"), CFSTR("transportSlotID"), "I");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("UIAirDropGroupActivityCell"), CFSTR("displayName"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("UIAirDropGroupActivityCell"), CFSTR("subtitle"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIAirDropGroupActivityCell"), CFSTR("node"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIAirDropNode"), CFSTR("peopleSuggestion"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFPeopleSuggestion"), CFSTR("transportBundleIdentifier"), "@", 0);

}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIAirDropGroupActivityCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[UIAirDropGroupActivityCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (unsigned)_accessibilityTextSlotID
{
  return -[UIAirDropGroupActivityCellAccessibility safeUnsignedIntForKey:](self, "safeUnsignedIntForKey:", CFSTR("textSlotID"));
}

- (unsigned)_accessibilitySubtitleSlotID
{
  return -[UIAirDropGroupActivityCellAccessibility safeUnsignedIntForKey:](self, "safeUnsignedIntForKey:", CFSTR("subtitleSlotID"));
}

- (unsigned)_accessibilityTransportSlotID
{
  return -[UIAirDropGroupActivityCellAccessibility safeUnsignedIntForKey:](self, "safeUnsignedIntForKey:", CFSTR("transportSlotID"));
}

- (id)accessibilityLabel
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[UIAirDropGroupActivityCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("displayName"));
  v3 = objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("subtitle"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (-[UIAirDropGroupActivityCellAccessibility _accessibilityTextSlotID](self, "_accessibilityTextSlotID"))
  {
    v5 = objc_alloc(MEMORY[0x24BDFEA60]);
    accessibilityLocalizedString(CFSTR("sharing.person"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithString:", v6);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[UIAirDropGroupActivityCellAccessibility _accessibilityTextSlotID](self, "_accessibilityTextSlotID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAttribute:forKey:", v8, *MEMORY[0x24BDFEC60]);

    AXLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[UIAirDropGroupActivityCellAccessibility _accessibilityTextSlotID](self, "_accessibilityTextSlotID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v10;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_2329BA000, v9, OS_LOG_TYPE_DEFAULT, "Returning slot id %@ for %@", buf, 0x16u);

    }
  }
  else
  {
    if (v3 | v4)
    {
      __UIAXStringForVariables();
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)UIAirDropGroupActivityCellAccessibility;
      -[UIAirDropGroupActivityCellAccessibility accessibilityLabel](&v13, sel_accessibilityLabel);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v11;
  }

  return v7;
}

- (id)accessibilityValue
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  void *v14;
  void *v15;

  v3 = -[UIAirDropGroupActivityCellAccessibility _accessibilityTransportSlotID](self, "_accessibilityTransportSlotID");
  -[UIAirDropGroupActivityCellAccessibility _axAppNameForSuggestionCell](self, "_axAppNameForSuggestionCell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDFEA60]);
  accessibilityLocalizedString(CFSTR("sharing.sugggestion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithString:", v6);

  if ((_DWORD)v3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAttribute:forKey:", v8, *MEMORY[0x24BDFEC68]);
  }
  else
  {
    if (!objc_msgSend(v4, "length"))
      goto LABEL_6;
    v8 = v7;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA60]), "initWithString:", v4);
  }

LABEL_6:
  v9 = objc_alloc(MEMORY[0x24BDFEA60]);
  accessibilityLocalizedString(CFSTR(" "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithString:", v10);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[UIAirDropGroupActivityCellAccessibility _accessibilitySubtitleSlotID](self, "_accessibilitySubtitleSlotID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttribute:forKey:", v12, *MEMORY[0x24BDFEC60]);

  -[UIAirDropGroupActivityCellAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("progress"));
  if (v13 <= 0.0)
  {
    v14 = 0;
  }
  else
  {
    AXFormatFloatWithPercentage();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  __AXStringForVariables();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_axAppNameForSuggestionCell
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[UIAirDropGroupActivityCellAccessibility valueForKey:](self, "valueForKey:", CFSTR("node"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("peopleSuggestion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("transportBundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  AXAppNameForBundleId();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
