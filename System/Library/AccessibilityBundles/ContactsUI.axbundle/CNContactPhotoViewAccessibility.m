@implementation CNContactPhotoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNContactPhotoView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNContactPhotoView"), CFSTR("contact"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNContactPhotoView"), CFSTR("isEditing"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNContactPhotoView"), CFSTR("hasPhoto"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNContactPhotoView"), CFSTR("avatarView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CNContact"), CFSTR("_displayNameOrder"), "NSInteger");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CNContactPhotoView"), CFSTR("_editPhotoButton"), "UIButton");

}

- (BOOL)isAccessibilityElement
{
  if ((-[CNContactPhotoViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("hasPhoto")) & 1) != 0)
    return 1;
  else
    return -[CNContactPhotoViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEditing"));
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  int v7;
  int v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;

  objc_opt_class();
  -[CNContactPhotoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contact"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactPhotoViewAccessibility frame](self, "frame");
  v6 = v5;
  v7 = -[CNContactPhotoViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("hasPhoto"));
  v8 = -[CNContactPhotoViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEditing"));
  if (!v7 && v8 && v6 >= 50.0)
  {
    v9 = CFSTR("add.photo.button");
LABEL_10:
    accessibilityLocalizedString(v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (!v4)
  {
LABEL_9:
    v9 = CFSTR("missing.photo.for.text.no.name");
    goto LABEL_10;
  }
  objc_msgSend(v4, "givenName");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "familyName");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!(v10 | v11))
  {
    if ((v7 & 1) != 0)
    {
      v9 = CFSTR("photo.for.text.no.name");
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (v10)
    v14 = (__CFString *)v10;
  else
    v14 = &stru_2501D9210;
  if (v11)
    v15 = (__CFString *)v11;
  else
    v15 = &stru_2501D9210;
  if (objc_msgSend(v4, "safeIntegerForKey:", CFSTR("_displayNameOrder")) == 2)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v15, v14);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 & 1) != 0)
  {
    -[CNContactPhotoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("avatarView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "accessibilityLabel");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    accessibilityLocalizedString(CFSTR("missing.photo.for.text"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "length");

    if (!v21)
    {
      objc_msgSend(v4, "phoneNumbers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "value");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringValue");
      v25 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v25;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v17, v16);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v18;

LABEL_11:
  return v12;
}

- (id)accessibilityValue
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[CNContactPhotoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_editPhotoButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_accessibilityViewIsVisible");

  if (v4)
  {
    -[CNContactPhotoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_editPhotoButton"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNContactPhotoViewAccessibility;
    -[CNContactPhotoViewAccessibility accessibilityValue](&v8, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)accessibilityHint
{
  void *v3;
  objc_super v5;

  if (-[CNContactPhotoViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("hasPhoto"))
    && -[CNContactPhotoViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEditing")))
  {
    accessibilityLocalizedString(CFSTR("edit.photo.hint"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CNContactPhotoViewAccessibility;
    -[CNContactPhotoViewAccessibility accessibilityHint](&v5, sel_accessibilityHint);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNContactPhotoViewAccessibility;
  v3 = -[CNContactPhotoViewAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[CNContactPhotoViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEditing"));
  v5 = *MEMORY[0x24BDF73B0];
  if (!v4)
    v5 = 0;
  return v5 | v3 | *MEMORY[0x24BDF73C8];
}

@end
