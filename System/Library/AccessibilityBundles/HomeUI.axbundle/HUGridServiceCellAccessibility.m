@implementation HUGridServiceCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUGridServiceCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("HFSensorServiceItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridServiceCell"), CFSTR("serviceItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridServiceCell"), CFSTR("serviceTextView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridServiceCell"), CFSTR("coloredDescriptionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridServiceCellTextView"), CFSTR("serviceNameComponents"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HFServiceNameComponents"), CFSTR("composedString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HFServiceNameComponents"), CFSTR("serviceName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HFServiceNameComponents"), CFSTR("roomName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridServiceCell"), CFSTR("accessoryView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridServiceCell"), CFSTR("iconView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUCheckmarkAccessoryView"), CFSTR("checked"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridServiceCell"), CFSTR("showingProgressIndicator"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridServiceCellTextView"), CFSTR("_combinedAttributedString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridServiceCellTextView"), CFSTR("descriptionText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUIconView"), CFSTR("iconDescriptor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridServiceCell"), CFSTR("_textConfiguration"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridServiceCell"), CFSTR("accessoryView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridServiceCell"), CFSTR("exclamationView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUIconView"), CFSTR("displayStyle"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridServiceCellTextConfiguration"), CFSTR("nameComponents"), "@", 0);

}

- (id)_axServiceNameComponents
{
  void *v2;
  void *v3;

  -[HUGridServiceCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("serviceTextView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("serviceNameComponents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_axServiceIconDescription
{
  void *v2;
  void *v3;
  void *v4;

  -[HUGridServiceCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("iconView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("iconDescriptor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_axComposedString
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[HUGridServiceCellAccessibility _axServiceNameComponents](self, "_axServiceNameComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("composedString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_asIsSensor
{
  void *v2;
  char isKindOfClass;

  -[HUGridServiceCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("serviceItem"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234911848](CFSTR("HFSensorServiceItem"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[HUGridServiceCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("iconView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("displayStyle"));

  -[HUGridServiceCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "safeValueForKeyPath:", CFSTR("nameComponents.serviceName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKeyPath:", CFSTR("nameComponents.roomName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridServiceCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("iconView.iconDescriptor.identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@, %@, %@, %ld"), v7, v8, v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  objc_super v23;
  char v24;

  -[HUGridServiceCellAccessibility _axServiceIconDescription](self, "_axServiceIconDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridServiceCellAccessibility _axComposedString](self, "_axComposedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HUGridServiceCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showingProgressIndicator")))
  {
    accessibilityHomeUILocalizedString(CFSTR("in.progress"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[HUGridServiceCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessoryView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridServiceCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("exclamationView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != v7)
  {

LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  -[HUGridServiceCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessoryView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_accessibilityViewIsVisible");

  if (!v9)
    goto LABEL_8;
  accessibilityHomeUILocalizedString(CFSTR("attention.icon"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  -[HUGridServiceCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("coloredDescriptionLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "_accessibilityViewIsVisible") && objc_msgSend(v12, "length"))
  {
    __UIAXStringForVariables();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[HUGridServiceCellAccessibility _asIsSensor](self, "_asIsSensor"))
  {
    v13 = 0;
  }
  else
  {
    -[HUGridServiceCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("serviceTextView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safeValueForKey:", CFSTR("descriptionText"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length") && (objc_msgSend(v15, "isEqualToString:", v4) & 1) == 0)
    {
      __UIAXStringForVariables();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v15;
    }
    else
    {
      v22 = v4;
      v24 = 0;
      objc_opt_class();
      objc_msgSend(v14, "safeValueForKey:", CFSTR("_combinedAttributedString"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = v17;
      objc_msgSend(v17, "string");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v22;
      if (objc_msgSend(v18, "length") && (objc_msgSend(v18, "isEqualToString:", v22) & 1) == 0)
      {
        __UIAXStringForVariables();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23.receiver = self;
        v23.super_class = (Class)HUGridServiceCellAccessibility;
        -[HUGridServiceCellAccessibility accessibilityValue](&v23, sel_accessibilityValue);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAXStringForVariables();
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = v22;
      }

    }
  }

  return v13;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[HUGridServiceCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessoryView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234911848](CFSTR("HUCheckmarkAccessoryView"));
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v2, "safeBoolForKey:", CFSTR("checked")))
    v3 = *MEMORY[0x24BDF7400] | *MEMORY[0x24BDF73B0];
  else
    v3 = *MEMORY[0x24BDF73B0];

  return v3;
}

@end
