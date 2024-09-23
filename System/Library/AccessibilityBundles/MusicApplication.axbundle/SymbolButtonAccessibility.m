@implementation SymbolButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicCoreUI.SymbolButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicCoreUI.SymbolButton"), CFSTR("accessibilityCustomView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicCoreUI.SymbolButton"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicCoreUI.SymbolButton"), CFSTR("accessibilityImageView"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MusicApplication.CircularProgressView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImageView"), CFSTR("image"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UIImage"), CFSTR("_imageAsset"), "UIImageAsset");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImageAsset"), CFSTR("assetName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicCoreUI.SymbolButton"), CFSTR("accessibilityUpdateSymbolButton"), "v", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MusicCoreUI.CoreAnimationPackageView"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicCoreUI.CoreAnimationPackageView"), CFSTR("definition"), "CAPackageDefinition");
  objc_msgSend(v3, "validateSwiftStruct:", CFSTR("MusicCoreUI.CAPackageDefinition"));
  objc_msgSend(v3, "validateSwiftStruct:hasSwiftField:withSwiftType:", CFSTR("MusicCoreUI.CAPackageDefinition"), CFSTR("name"), "String");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MusicCoreUI.SymbolButton"), CFSTR("UIControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIControl"), CFSTR("isSelected"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SymbolButtonAccessibility _accessibilityLabelHelper](self, "_accessibilityLabelHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "length") != 0;
  else
    v4 = 0;

  return v4;
}

- (id)_axCustomView
{
  return (id)-[SymbolButtonAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityCustomView"));
}

- (BOOL)_axIsCircularProgressView
{
  void *v2;
  char v3;

  -[SymbolButtonAccessibility _axCustomView](self, "_axCustomView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (MEMORY[0x234917594](CFSTR("MusicApplication.CircularProgressView")), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");
  else
    v3 = 0;

  return v3;
}

- (id)_accessibilityLabelHelper
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __CFString *v19;

  -[SymbolButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SymbolButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityImageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SymbolButtonAccessibility _axIsCircularProgressView](self, "_axIsCircularProgressView"))
  {
    accessibilityMusicLocalizedString(CFSTR("downloading"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (!objc_msgSend(v5, "length") && v3 && objc_msgSend(v3, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v3, "accessibilityLabel");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  if (!objc_msgSend(v5, "length"))
  {
    if (!v4)
      goto LABEL_15;
    objc_msgSend(v4, "safeValueForKey:", CFSTR("image"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("_imageAsset"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeStringForKey:", CFSTR("assetName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("icloud.and.arrow.down")) & 1) != 0
      || objc_msgSend(v9, "isEqualToString:", CFSTR("arrow.down")))
    {
      v10 = CFSTR("download.button");
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("checkmark")))
    {
      if (-[SymbolButtonAccessibility accessibilityIsInCell](self, "accessibilityIsInCell"))
        v10 = CFSTR("remove.download");
      else
        v10 = CFSTR("downloaded");
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("exclamationmark.icloud")))
    {
      v10 = CFSTR("download.error");
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("classical")))
    {
      v10 = CFSTR("classical.app");
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("stop.fill")))
    {
      v10 = CFSTR("cancel.download");
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("calendar")))
    {
      v10 = CFSTR("schedule.calendar");
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("ellipsis")))
    {
      v10 = CFSTR("more.button");
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("songcredits_toolbar_button_lyrics")))
    {
      v10 = CFSTR("share.lyrics.button");
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("songcredits_close_nav")))
    {
      v10 = CFSTR("close.button");
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("person.2.fill")))
    {
      v10 = CFSTR("manage.collaboration.button");
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("person.fill.badge.plus")))
      {
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("dolby.audio")))
        {
          v19 = CFSTR("dolby.audio");
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("dolby.atmos")))
        {
          v19 = CFSTR("dolby.atmos");
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("apple.digital.master")))
        {
          v19 = CFSTR("apple.digital.master");
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("dolby")))
        {
          v19 = CFSTR("dolby");
        }
        else
        {
          if (!objc_msgSend(v9, "isEqualToString:", CFSTR("lossless")))
          {
            objc_msgSend(v4, "accessibilityLabel");
            v11 = objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          }
          v19 = CFSTR("lossless");
        }
        accessibilityOasisMusicLocalizedString(v19);
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v12 = (void *)v11;

        v5 = v12;
LABEL_15:
        if (!objc_msgSend(v5, "length"))
        {
          -[SymbolButtonAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_5);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "safeSwiftValueForKey:", CFSTR("definition"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "safeSwiftStringForKey:", CFSTR("name"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "isEqualToString:", CFSTR("Favorite")))
            {
              accessibilityMusicLocalizedString(CFSTR("favorite"));
              v17 = objc_claimAutoreleasedReturnValue();

              v5 = (void *)v17;
            }

          }
        }
        goto LABEL_21;
      }
      v10 = CFSTR("collaboration.button");
    }
    accessibilityMusicLocalizedString(v10);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
LABEL_21:

  return v5;
}

uint64_t __54__SymbolButtonAccessibility__accessibilityLabelHelper__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x234917594](CFSTR("MusicCoreUI.CoreAnimationPackageView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SymbolButtonAccessibility;
  -[SymbolButtonAccessibility accessibilityLabel](&v6, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    -[SymbolButtonAccessibility _accessibilityLabelHelper](self, "_accessibilityLabelHelper");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SymbolButtonAccessibility;
  -[SymbolButtonAccessibility accessibilityValue](&v7, sel_accessibilityValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SymbolButtonAccessibility _axIsCircularProgressView](self, "_axIsCircularProgressView"))
  {
    -[SymbolButtonAccessibility _axCustomView](self, "_axCustomView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityValue");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = v3;
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SymbolButtonAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[SymbolButtonAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  if (-[SymbolButtonAccessibility _axIsCircularProgressView](self, "_axIsCircularProgressView"))
  {
    -[SymbolButtonAccessibility _axCustomView](self, "_axCustomView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 |= objc_msgSend(v4, "accessibilityTraits");

  }
  -[SymbolButtonAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_290);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && -[SymbolButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected")))
    v3 |= *MEMORY[0x24BDF7400];

  return v3;
}

uint64_t __48__SymbolButtonAccessibility_accessibilityTraits__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x234917594](CFSTR("MusicCoreUI.CoreAnimationPackageView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (void)accessibilityUpdateSymbolButton
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SymbolButtonAccessibility;
  -[SymbolButtonAccessibility accessibilityUpdateSymbolButton](&v2, sel_accessibilityUpdateSymbolButton);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (BOOL)accessibilityIsInCell
{
  return self->_accessibilityIsInCell;
}

- (void)setAccessibilityIsInCell:(BOOL)a3
{
  self->_accessibilityIsInCell = a3;
}

@end
