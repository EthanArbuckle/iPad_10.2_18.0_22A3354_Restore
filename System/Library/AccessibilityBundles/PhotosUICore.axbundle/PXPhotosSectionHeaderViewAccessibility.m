@implementation PXPhotosSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXPhotosSectionHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderViewAccessibility;
  -[PXPhotosSectionHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[PXPhotosSectionHeaderViewAccessibility _axUpdateActionLabel](self, "_axUpdateActionLabel");
  -[PXPhotosSectionHeaderViewAccessibility _axUpdateDateLabel](self, "_axUpdateDateLabel");
  -[PXPhotosSectionHeaderViewAccessibility _axUpdateLocationLabel](self, "_axUpdateLocationLabel");
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderViewAccessibility;
  return *MEMORY[0x24BDF73C0] | -[PXPhotosSectionHeaderViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)isAccessibilityElement
{
  return 1;
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

  -[PXPhotosSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dateLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_locationsLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[PXPhotosSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_actionButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    && (__UIAccessibilitySafeClass(),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isHidden"),
        v3,
        (v4 & 1) == 0))
  {
    v7[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  if ((v6 & 1) == 0)
    objc_msgSend(v3, "axSafelyAddObject:", v4);
  if (AXDeviceIsPad())
  {
    -[PXPhotosSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_locationsLabel"));
    v7 = objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v7) = objc_msgSend(v8, "isHidden");
    if ((v7 & 1) == 0)
    {
      -[PXPhotosSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_locationsLabel"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "axSafelyAddObject:", v9);

    }
    -[PXPhotosSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dateLabel"));
    v10 = objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v10) = objc_msgSend(v11, "isHidden");
    if ((v10 & 1) == 0)
    {
      -[PXPhotosSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dateLabel"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "axSafelyAddObject:", v12);

    }
    -[PXPhotosSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_actionButton"));
    v13 = objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v13) = objc_msgSend(v14, "isHidden");
    if ((v13 & 1) == 0)
    {
      v15 = CFSTR("_actionButton");
LABEL_16:
      -[PXPhotosSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "axSafelyAddObject:", v24);

    }
  }
  else
  {
    -[PXPhotosSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_actionButton"));
    v16 = objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v16) = objc_msgSend(v17, "isHidden");
    if ((v16 & 1) == 0)
    {
      -[PXPhotosSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_actionButton"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "axSafelyAddObject:", v18);

    }
    -[PXPhotosSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_locationsLabel"));
    v19 = objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v19) = objc_msgSend(v20, "isHidden");
    if ((v19 & 1) == 0)
    {
      -[PXPhotosSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_locationsLabel"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "axSafelyAddObject:", v21);

    }
    -[PXPhotosSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dateLabel"));
    v22 = objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v22) = objc_msgSend(v23, "isHidden");
    if ((v22 & 1) == 0)
    {
      v15 = CFSTR("_dateLabel");
      goto LABEL_16;
    }
  }

  return v3;
}

- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF76C0]) & 1) == 0
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v3, (UIContentSizeCategory)*MEMORY[0x24BDF7658]) != NSOrderedDescending;

  return v4;
}

- (void)_updateTitleLabel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderViewAccessibility;
  -[PXPhotosSectionHeaderViewAccessibility _updateTitleLabel](&v3, sel__updateTitleLabel);
  -[PXPhotosSectionHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_updateDateLabel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderViewAccessibility;
  -[PXPhotosSectionHeaderViewAccessibility _updateDateLabel](&v3, sel__updateDateLabel);
  -[PXPhotosSectionHeaderViewAccessibility _axUpdateDateLabel](self, "_axUpdateDateLabel");
}

- (void)_updateLocationsLabelVisibility
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderViewAccessibility;
  -[PXPhotosSectionHeaderViewAccessibility _updateLocationsLabelVisibility](&v3, sel__updateLocationsLabelVisibility);
  -[PXPhotosSectionHeaderViewAccessibility _axUpdateLocationLabel](self, "_axUpdateLocationLabel");
}

- (void)_updateActionButton
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderViewAccessibility;
  -[PXPhotosSectionHeaderViewAccessibility _updateActionButton](&v3, sel__updateActionButton);
  -[PXPhotosSectionHeaderViewAccessibility _axUpdateActionLabel](self, "_axUpdateActionLabel");
}

- (void)_axUpdateActionLabel
{
  void *v3;
  id v4;

  -[PXPhotosSectionHeaderViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_actionButtonTitle, _dateLabel, _titleLabel"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_actionButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (void)_axUpdateDateLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[PXPhotosSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_sectionStartDate"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    -[PXPhotosSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_sectionEndDate"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20 || !v3)
      goto LABEL_14;
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "components:fromDate:", 28, v20);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "components:fromDate:", 28, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v5, "year");
    if (v8 == objc_msgSend(v7, "year")
      && (v9 = objc_msgSend(v5, "month"), v9 == objc_msgSend(v7, "month"))
      && (v10 = objc_msgSend(v5, "day"), v10 == objc_msgSend(v7, "day")))
    {
      v11 = objc_msgSend(v5, "hour");
      if (v11 != objc_msgSend(v7, "hour") || (v12 = objc_msgSend(v5, "minute"), v12 != objc_msgSend(v7, "minute")))
      {
        v19 = (void *)MEMORY[0x24BDD17C8];
        accessibilityPhotosUICoreLocalizedString(CFSTR("photos.taken.date"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        AXDateStringForFormat();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", v14, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      v13 = (void *)MEMORY[0x24BDD17C8];
      accessibilityPhotosUICoreLocalizedString(CFSTR("photos.taken.date.time"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      AXDateStringForFormat();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
      accessibilityPhotosUICoreLocalizedString(CFSTR("photos.taken.range"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      AXDateStringForFormat();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    AXDateStringForFormat();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
    -[PXPhotosSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dateLabel"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAccessibilityLabel:", v17);

    -[PXPhotosSectionHeaderViewAccessibility _axUpdateActionLabel](self, "_axUpdateActionLabel");
LABEL_14:

  }
}

- (void)_axUpdateLocationLabel
{
  void *v3;
  void *v4;
  id v5;

  -[PXPhotosSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_locationsLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);

  -[PXPhotosSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_locationsLabel"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  accessibilityPhotosUICoreLocalizedString(CFSTR("locations.label.button.hint"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityHint:", v4);

}

@end
