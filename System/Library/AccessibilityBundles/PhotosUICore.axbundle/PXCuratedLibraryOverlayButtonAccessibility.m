@implementation PXCuratedLibraryOverlayButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXCuratedLibraryOverlayButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryOverlayButton"), CFSTR("userData"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryOverlayButton"), CFSTR("canBecomeFocused"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryOverlayButtonConfiguration"), CFSTR("actionPerformer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryOverlayButtonConfiguration"), CFSTR("actionHandler"), "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryOverlayButtonConfiguration"), CFSTR("menuActionHandler"), "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryOverlayButtonConfiguration"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryOverlayButtonConfiguration"), CFSTR("systemImageName"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PXCuratedLibraryOverlayButton"), CFSTR("UIControl"));

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v9;
  char v10;

  -[PXCuratedLibraryOverlayButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("userData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("actionPerformer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeIntegerForKey:", CFSTR("actionZoomLevel"));

  if (v5 == 2)
  {
    -[PXCuratedLibraryOverlayButtonAccessibility _axUserDataConfiguration](self, "_axUserDataConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeStringForKey:", CFSTR("systemImageName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v6) = objc_msgSend(v7, "hasPrefix:", CFSTR("sidebar"));
    return (char)v6;
  }
  else
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "_accessibilityViewIsVisible");

    return v10;
  }
}

- (id)_axUserDataConfiguration
{
  return (id)-[PXCuratedLibraryOverlayButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("userData"));
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXCuratedLibraryOverlayButtonAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[PXCuratedLibraryOverlayButtonAccessibility accessibilityTraits](&v14, sel_accessibilityTraits);
  -[PXCuratedLibraryOverlayButtonAccessibility _axUserDataConfiguration](self, "_axUserDataConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("actionPerformer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[PXCuratedLibraryOverlayButtonAccessibility _axUserDataConfiguration](self, "_axUserDataConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("actionHandler"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = 1;
    }
    else
    {
      -[PXCuratedLibraryOverlayButtonAccessibility _axUserDataConfiguration](self, "_axUserDataConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safeValueForKey:", CFSTR("menuActionHandler"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v10 != 0;

    }
    if (!v8)
      v3 |= *MEMORY[0x24BDF73E8];
  }
  -[PXCuratedLibraryOverlayButtonAccessibility _axUserDataConfiguration](self, "_axUserDataConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeStringForKey:", CFSTR("systemImageName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "isEqualToString:", CFSTR("PXCuratedLibraryFilterIndicatorInactiveIconImageName")))
  {
    v3 &= ~*MEMORY[0x24BDF7400];
  }
  else if (objc_msgSend(v12, "isEqualToString:", CFSTR("PXCuratedLibraryFilterIndicatorActiveIconImageName")))
  {
    v3 |= *MEMORY[0x24BDF7400];
  }

  return v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  objc_super v11;

  -[PXCuratedLibraryOverlayButtonAccessibility _axUserDataConfiguration](self, "_axUserDataConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PXCuratedLibraryOverlayButtonAccessibility _axUserDataConfiguration](self, "_axUserDataConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeStringForKey:", CFSTR("systemImageName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("plus.slash.minus")) & 1) != 0)
    {
      v9 = CFSTR("curated.zoom");
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("plus")) & 1) != 0)
    {
      v9 = CFSTR("curated.zoom.in");
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("minus")) & 1) != 0)
    {
      v9 = CFSTR("curated.zoom.out");
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("xmark")) & 1) != 0)
    {
      v9 = CFSTR("curated.close");
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("person.crop.circle.badge.checkmark")) & 1) != 0)
    {
      v9 = CFSTR("curated.manage.subscribers");
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("person.crop.circle.badge.plus")) & 1) != 0)
    {
      v9 = CFSTR("curated.add.subscribers");
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PXCuratedLibraryEllipsisIconImageName")) & 1) != 0)
    {
      v9 = CFSTR("curated.more");
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PXCuratedLibraryFilterIndicatorInactiveIconImageName")) & 1) != 0
           || (objc_msgSend(v8, "isEqualToString:", CFSTR("PXCuratedLibraryFilterIndicatorActiveIconImageName")) & 1) != 0)
    {
      v9 = CFSTR("curated.filter");
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("sidebar.left")) & 1) != 0
           || (objc_msgSend(v8, "isEqualToString:", CFSTR("sidebar.right")) & 1) != 0
           || (objc_msgSend(v8, "isEqualToString:", CFSTR("sidebar.leading")) & 1) != 0)
    {
      v9 = CFSTR("curated.show.sidebar");
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("rectangle.arrowtriangle.2.inward")) & 1) != 0)
    {
      v9 = CFSTR("curated.aspect");
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("rectangle.arrowtriangle.2.outward")) & 1) != 0)
    {
      v9 = CFSTR("curated.square");
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("person.fill")) & 1) != 0)
    {
      v9 = CFSTR("personal.library");
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("person.2.fill")) & 1) != 0)
    {
      v9 = CFSTR("shared.library");
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("speaker.wave.2")) & 1) != 0)
    {
      v9 = CFSTR("photo.volume.button");
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("speaker.slash")))
      {

        v11.receiver = self;
        v11.super_class = (Class)PXCuratedLibraryOverlayButtonAccessibility;
        -[PXCuratedLibraryOverlayButtonAccessibility accessibilityLabel](&v11, sel_accessibilityLabel);
        v5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
      v9 = CFSTR("photo.volume.muted.button");
    }
    accessibilityPhotosUICoreLocalizedString(v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_26;
  }
  v5 = v4;
LABEL_3:
  v6 = v5;
LABEL_26:

  return v6;
}

- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3
{
  return objc_msgSend(a3, "isEqual:", *MEMORY[0x24BDF76A0]);
}

- (BOOL)canBecomeFocused
{
  unsigned __int8 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXCuratedLibraryOverlayButtonAccessibility;
  v3 = -[PXCuratedLibraryOverlayButtonAccessibility canBecomeFocused](&v5, sel_canBecomeFocused);
  return -[PXCuratedLibraryOverlayButtonAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") | v3;
}

- (id)focusGroupIdentifier
{
  return CFSTR("PXCuratedLibraryOverlayButtonAXGroup");
}

@end
