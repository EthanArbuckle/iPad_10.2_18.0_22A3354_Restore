@implementation PLManagedAssetAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLManagedAsset");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLManagedAsset"), CFSTR("isPhoto"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLManagedAsset"), CFSTR("isVideo"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLManagedAsset"), CFSTR("isAudio"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLManagedAsset"), CFSTR("isPhotoIris"), "B", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  float v31;
  float v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  void *v38;
  void *v39;
  void *v41;
  int v42;
  void *v43;
  int v44;

  -[PLManagedAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isPhoto"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[PLManagedAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isVideo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  -[PLManagedAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isAudio"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  -[PLManagedAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isPhotoIris"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  -[PLManagedAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mainFileURL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v6;
  v42 = v8;
  if (!v4)
  {
    if (v6)
    {
      v13 = CFSTR("photo.label.type.video");
    }
    else
    {
      if (!v8)
      {
        v43 = 0;
        goto LABEL_13;
      }
      v13 = CFSTR("photo.label.type.audio");
    }
    goto LABEL_11;
  }
  if (UIAccessibilityIsImageScreenshot())
  {
    accessibilityUIKitLocalizedString();
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v43 = (void *)v12;
    goto LABEL_13;
  }
  if (!v10)
  {
    v13 = CFSTR("photo.label.type.photo");
LABEL_11:
    accessibilityPLServicesLocalizedString(v13);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  accessibilityPLServicesLocalizedString(CFSTR("photo.label.type.photo.iris"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  AXAttributedStringForBetterPronuciation();
  v43 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  -[PLManagedAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("width"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("height"));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = 0;
  if (v15 && v16 && ((v4 ^ 1) & 1) == 0)
  {
    v19 = objc_msgSend(v15, "integerValue");
    if (v19 >= objc_msgSend(v17, "integerValue"))
      v20 = CFSTR("photo.label.orientation.landscape");
    else
      v20 = CFSTR("photo.label.orientation.portrait");
    accessibilityPLServicesLocalizedString(v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PLManagedAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dateCreated"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v41 = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "components:fromDate:", 28, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "components:fromDate:", 28, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = objc_msgSend(v23, "year");
      if (v27 == objc_msgSend(v26, "year"))
      {
        v28 = objc_msgSend(v23, "month");
        if (v28 == objc_msgSend(v26, "month"))
        {
          objc_msgSend(v23, "day");
          objc_msgSend(v26, "day");
        }
      }
      AXDateStringForFormat();
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v29 = 0;
    }
    v11 = v41;
  }
  else
  {
    v29 = 0;
  }
  -[PLManagedAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("duration"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "floatValue");
  v32 = roundf(v31);

  v33 = 0;
  if (v32 > 0.0 && v42 | v44)
  {
    v34 = (void *)MEMORY[0x24BDFEA60];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.0f"), v32);
    v35 = v11;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "axAttributedStringWithString:", v36);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v35;
    if (v32 >= 3600.0)
      v37 = (_QWORD *)MEMORY[0x24BDFEB28];
    else
      v37 = (_QWORD *)MEMORY[0x24BDFEB38];
    objc_msgSend(v33, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *v37);
  }
  if (v4)
  {
    UIAccessibilityMetadataDescriptionForImage();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v44)
  {
    UIAccessibilityMetadataDescriptionForVideo();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = 0;
  }
  __UIAXStringForVariables();
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8];
}

@end
