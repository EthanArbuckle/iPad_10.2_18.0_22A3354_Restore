@implementation CNPhotoPickerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPhotoPickerCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsAddItem
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetIsAddItem:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (BOOL)_axIsVariant
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetIsVariant:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (id)_axProviderItem
{
  JUMPOUT(0x23490B9A0);
}

- (void)_axSetProviderItem:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axProviderGroup
{
  JUMPOUT(0x23490B9A0);
}

- (void)_axSetProviderGroup:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CNPhotoPickerProviderItem"), CFSTR("_localizedVariantDisplayName"), "NSString");
  objc_msgSend(v3, "validateClass:", CFSTR("CNPhotoPickerAnimojiProviderItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("CNPhotoPickerEmojiProviderItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("CNPhotoPickerMonogramProviderItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPhotoPickerAnimojiProviderItem"), CFSTR("avatarRecord"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPhotoPickerAnimojiProviderItem"), CFSTR("poseConfiguration"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPhotoPickerCollectionViewCell"), CFSTR("captionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPhotoPickerMonogramProviderItem"), CFSTR("monogramText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPhotoPickerMonogramProviderItem"), CFSTR("renderingScope"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PRMonogramColor"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRMonogramColor"), CFSTR("colorName"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CNPhotoPickerProviderGroup"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CNPhotoPickerProviderGroup"), CFSTR("groupType"), "q");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[CNPhotoPickerCollectionViewCellAccessibility _axProviderItem](self, "_axProviderItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490B8B0](CFSTR("CNPhotoPickerAnimojiProviderItem"));
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v3, "safeValueForKey:", CFSTR("avatarRecord")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("isEditable")),
        v4,
        v5))
  {
    accessibilityLocalizedString(CFSTR("contact.image.type.memoji"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CNPhotoPickerCollectionViewCellAccessibility;
    -[CNPhotoPickerCollectionViewCellAccessibility accessibilityUserInputLabels](&v9, sel_accessibilityUserInputLabels);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;

  if (!-[CNPhotoPickerCollectionViewCellAccessibility _axIsAddItem](self, "_axIsAddItem"))
  {
    -[CNPhotoPickerCollectionViewCellAccessibility _axProviderItem](self, "_axProviderItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("captionLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    MEMORY[0x23490B8B0](CFSTR("CNPhotoPickerMonogramProviderItem"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      __UIAccessibilityCastAsSafeCategory();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_axColorVariantName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "safeStringForKey:", CFSTR("monogramText"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("monogram.description.button"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v12, v10, v9);
    }
    else
    {
      MEMORY[0x23490B8B0](CFSTR("CNPhotoPickerGlyphProviderItem"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        __UIAccessibilityCastAsSafeCategory();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_axSymbolName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
          v15 = v13;

        goto LABEL_19;
      }
      MEMORY[0x23490B8B0](CFSTR("CNPhotoPickerEmojiProviderItem"));
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        MEMORY[0x23490B8B0](CFSTR("CNPhotoPickerAnimojiProviderItem"));
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v7)
          {
            v14 = 0;
          }
          else
          {
            accessibilityLocalizedString(CFSTR("contact.image.type.photo"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_20;
        }
        if (-[CNPhotoPickerCollectionViewCellAccessibility _axIsVariant](self, "_axIsVariant"))
        {
          objc_opt_class();
          __UIAccessibilityCastAsSafeCategory();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "_axColorVariantName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (v25)
            v27 = v25;

        }
        else
        {
          v26 = 0;
        }
        objc_msgSend(v4, "safeValueForKey:", CFSTR("avatarRecord"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "safeValueForKey:", CFSTR("poseConfiguration"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "safeStringForKey:", CFSTR("localizedName"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        __UIAXStringForVariables();
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDFFA88], "descriptionForAvatarWithRecord:includeVideoPrefix:", v8, 0, v26, CFSTR("__AXStringForVariablesSentinel"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = CFSTR("__AXStringForVariablesSentinel");
        __UIAXStringForVariables();
        v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
LABEL_20:
        objc_msgSend(v4, "safeStringForKey:", CFSTR("_localizedVariantDisplayName"), v31, v32);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAXStringForVariables();
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        __UIAXStringForVariables();
        v5 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_21;
      }
      objc_opt_class();
      __UIAccessibilityCastAsSafeCategory();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_axStringRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_axColorVariantName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("emoji.description.button"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", v12, v9, v10);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_19;
  }
  -[CNPhotoPickerCollectionViewCellAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[CNPhotoPickerCollectionViewCellAccessibility _axProviderGroup](self, "_axProviderGroup");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "safeIntegerForKey:", CFSTR("groupType"));
    v18 = CFSTR("contact.image.add.button.label");
    if (v17 == 3)
      v18 = CFSTR("new.emoji.button");
    if (v17 == 2)
      v19 = CFSTR("new.memoji.button");
    else
      v19 = (__CFString *)v18;
    accessibilityLocalizedString(v19);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_21:

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8] | *MEMORY[0x24BDF73B0];
}

@end
