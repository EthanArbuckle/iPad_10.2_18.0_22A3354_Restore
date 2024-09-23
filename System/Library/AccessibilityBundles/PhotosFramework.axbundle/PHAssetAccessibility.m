@implementation PHAssetAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHAsset");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axValueCallback
{
  JUMPOUT(0x2348C1420);
}

- (void)_setAXValueCallback:(id)a3
{
  id v3;

  v3 = (id)MEMORY[0x2348C15A0](a3, a2);
  __UIAccessibilitySetAssociatedCopiedObject();

}

- (BOOL)_axICloudLabelWasSet
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetICloudLabelWasSet:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAsset"), CFSTR("pixelWidth"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAsset"), CFSTR("pixelHeight"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAsset"), CFSTR("isPhoto"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAsset"), CFSTR("isVideo"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAsset"), CFSTR("isLoopingVideo"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAsset"), CFSTR("pixelHeight"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAsset"), CFSTR("pixelWidth"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAsset"), CFSTR("isAudio"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAsset"), CFSTR("duration"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAsset"), CFSTR("mainFileURL"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAsset"), CFSTR("creationDate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAsset"), CFSTR("mediaSubtypes"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAsset"), CFSTR("isPhotoIris"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAsset"), CFSTR("isFavorite"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHObject"), CFSTR("localIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PHAsset"), CFSTR("PHObject"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHObject"), CFSTR("photoLibrary"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHPhotoLibrary"), CFSTR("isSystemPhotoLibrary"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHPhotoLibrary"), CFSTR("photoLibraryURL"), "@", 0);

}

- (BOOL)shouldMeasureBlurriness
{
  void *v2;
  char v3;

  -[PHAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mediaSubtypes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return (v3 & 0x10) == 0;
}

- (id)_accessibilityCreationTime
{
  void *v2;
  void *v3;

  -[PHAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("creationDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    AXDateStringForFormat();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_accessibilityCreationDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PHAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("creationDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "components:fromDate:", 28, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "components:fromDate:", 28, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "year");
    objc_msgSend(v8, "year");
    AXDateStringForFormat();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_accessibilityOrientation
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;

  -[PHAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pixelWidth"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pixelHeight"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(v3, "integerValue");
    if (v8 >= objc_msgSend(v5, "integerValue"))
      v9 = CFSTR("photo.label.orientation.landscape");
    else
      v9 = CFSTR("photo.label.orientation.portrait");
    accessibilityPLServicesLocalizedString(v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_accessibilityAssetDuration
{
  float v2;
  float v3;
  void *v4;

  -[PHAssetAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("duration"));
  v3 = roundf(v2);
  if (v3 <= 0.0)
  {
    v4 = 0;
  }
  else
  {
    MEMORY[0x2348C1384](1, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)accessibilityCustomContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  const __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;

  v3 = (void *)objc_opt_new();
  -[PHAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("creationDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 28, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 28, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHAssetAccessibility _accessibilityCreationDate](self, "_accessibilityCreationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    v10 = (void *)MEMORY[0x24BDB3D68];
    accessibilityPLServicesLocalizedString(CFSTR("date.title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "customContentWithLabel:value:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v58, "month");
    if (v13 != objc_msgSend(v8, "month")
      || (v14 = objc_msgSend(v58, "day"), v14 != objc_msgSend(v8, "day"))
      || (v15 = objc_msgSend(v58, "year"), v15 != objc_msgSend(v8, "year")))
    {
      objc_msgSend(v12, "setImportance:", 1);
    }
    objc_msgSend(v3, "addObject:", v12);

  }
  -[PHAssetAccessibility _accessibilityCreationTime](self, "_accessibilityCreationTime");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "length"))
  {
    v17 = (void *)MEMORY[0x24BDB3D68];
    accessibilityPLServicesLocalizedString(CFSTR("time.title"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "customContentWithLabel:value:", v18, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setImportance:", 1);
    objc_msgSend(v3, "addObject:", v19);

  }
  -[PHAssetAccessibility _accessibilityOrientation](self, "_accessibilityOrientation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "length"))
  {
    v21 = (void *)MEMORY[0x24BDB3D68];
    accessibilityPLServicesLocalizedString(CFSTR("orientation.title"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "customContentWithLabel:value:", v22, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v23);
  }
  v55 = v20;
  -[PHAssetAccessibility _accessibilityAssetDuration](self, "_accessibilityAssetDuration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "length"))
  {
    v25 = (void *)MEMORY[0x24BDB3D68];
    accessibilityPLServicesLocalizedString(CFSTR("duration.title"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "customContentWithLabel:value:", v26, v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v27);
  }
  -[PHAssetAccessibility _accessibilityCaptionLabel](self, "_accessibilityCaptionLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "length"))
  {
    v29 = (void *)MEMORY[0x24BDB3D68];
    accessibilityPLServicesLocalizedString(CFSTR("caption.title"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "customContentWithLabel:value:", v30, v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v31);
  }
  v54 = v28;
  -[PHAssetAccessibility _accessibilityPeopleInPhoto](self, "_accessibilityPeopleInPhoto");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v16;
  if (objc_msgSend(v32, "length"))
  {
    v33 = (void *)MEMORY[0x24BDB3D68];
    accessibilityPLServicesLocalizedString(CFSTR("names.title"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "customContentWithLabel:value:", v34, v32);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v35);
  }
  else
  {
    -[PHAssetAccessibility _accessibilityFacesInfo](self, "_accessibilityFacesInfo");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "length"))
    {
      v36 = (void *)MEMORY[0x24BDB3D68];
      accessibilityPLServicesLocalizedString(CFSTR("faces.title"));
      v37 = v24;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "customContentWithLabel:value:", v38, v35);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v37;
      objc_msgSend(v3, "addObject:", v39);

    }
  }

  -[PHAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mediaSubtypes"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "unsignedIntegerValue");

  if ((v41 & 2) != 0)
  {
    accessibilityPLServicesLocalizedString(CFSTR("photo.label.type.photo.hdr"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v41 & 1) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
  v42 = 0;
  if ((v41 & 1) != 0)
  {
LABEL_23:
    accessibilityPLServicesLocalizedString(CFSTR("photo.label.type.photo.panorama"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = CFSTR("__AXStringForVariablesSentinel");
    __AXStringForVariables();
    v43 = v24;
    v44 = objc_claimAutoreleasedReturnValue();

    v42 = (void *)v44;
    v24 = v43;
  }
LABEL_24:
  v45 = v56;
  if ((v41 & 0x10) != 0)
  {
    accessibilityPLServicesLocalizedString(CFSTR("photo.label.type.photo.depth"));
    v46 = objc_claimAutoreleasedReturnValue();

    v42 = (void *)v46;
  }
  v47 = v55;
  if (objc_msgSend(v42, "length", v52, v53))
  {
    v48 = (void *)MEMORY[0x24BDB3D68];
    accessibilityPLServicesLocalizedString(CFSTR("photo.type.title"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "customContentWithLabel:value:", v49, v42);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = v56;
    objc_msgSend(v3, "addObject:", v50);

    v47 = v55;
  }

  return v3;
}

- (id)_accessibilityFacesInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDE3548], "fetchFacesInAsset:options:", self, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    accessibilityPLServicesLocalizedString(CFSTR("faces.count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithFormat:", v4, objc_msgSend(v2, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_accessibilityPeopleInPhoto
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  const __CFString *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE35E0], "fetchPersonsInAsset:options:", self, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v9, "name", v14, v15, (_QWORD)v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "length");

          if (v11)
          {
            objc_msgSend(v9, "name");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = CFSTR("__AXStringForVariablesSentinel");
            __UIAXStringForVariables();
            v12 = objc_claimAutoreleasedReturnValue();

            v6 = (void *)v12;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)accessibilityURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v26 = 0;
  __UIAccessibilitySafeClass();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE34D8], "assetResourcesForAsset:includeDerivatives:");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v23;
    v20 = (void *)*MEMORY[0x24BDF8438];
    v19 = (void *)*MEMORY[0x24BDF83F0];
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v23 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v6, "isLocallyAvailable"))
        {
          objc_msgSend(v6, "privateFileURL");
          v7 = objc_claimAutoreleasedReturnValue();
          if (v7)
          {
            v8 = (void *)v7;
            objc_msgSend(v6, "uniformTypeIdentifier");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "identifier");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v9, "isEqualToString:", v10))
            {

LABEL_17:
              objc_msgSend(v6, "privateFileURL");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              v14 = v18;
              goto LABEL_19;
            }
            objc_msgSend(v6, "uniformTypeIdentifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "identifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v11, "isEqualToString:", v12);

            if ((v13 & 1) != 0)
              goto LABEL_17;
          }
        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v3)
        continue;
      break;
    }
  }

  v14 = v18;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v26 = 0;
    objc_msgSend(v18, "safeValueForKey:", CFSTR("mainFileURL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
      abort();
  }
  else
  {
    v16 = 0;
  }
LABEL_19:

  return v16;
}

- (id)_accessibilityPHAssetLocalIdentifier
{
  return (id)-[PHAssetAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("localIdentifier"));
}

- (BOOL)_accessibilityIsPHAssetLocallyAvailable
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  __UIAccessibilitySafeClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE34D8], "assetResourcesForAsset:includeDerivatives:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axFilterObjectsUsingBlock:", &__block_literal_global_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

uint64_t __63__PHAssetAccessibility__accessibilityIsPHAssetLocallyAvailable__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLocallyAvailable");
}

- (id)_accessibilityPhotoLibraryURL
{
  void *v2;
  void *v3;
  void *v4;

  -[PHAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("photoLibrary"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("photoLibraryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  char v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  __CFString *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  const __CFString *v31;
  id v32;
  void *v33;
  __CFString *v34;
  const __CFString *v35;

  -[PHAssetAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    goto LABEL_38;
  }
  -[PHAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isPhoto"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  -[PHAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isVideo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  -[PHAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isAudio"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  v12 = -[PHAssetAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isLoopingVideo"));
  v13 = -[PHAssetAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isFavorite"));
  -[PHAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isPhotoIris"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  -[PHAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mainFileURL"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (UIAccessibilityIsImageScreenshot())
    {
      accessibilityUIKitLocalizedString();
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_20:
      v18 = (void *)v17;
      goto LABEL_26;
    }
    if (v15)
    {
      accessibilityCameraUILocalizedString(CFSTR("live.photo"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      AXAttributedStringForBetterPronuciation();
      v20 = objc_claimAutoreleasedReturnValue();
LABEL_25:
      v18 = (void *)v20;

      goto LABEL_26;
    }
    v23 = CFSTR("photo.label.type.photo");
    goto LABEL_19;
  }
  if ((v12 & 1) != 0)
  {
    accessibilityPLServicesLocalizedString(CFSTR("photo.label.type.looping.video"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
LABEL_26:
      -[PHAssetAccessibility _accessibilityiCloudPhotoLabel](self, "_accessibilityiCloudPhotoLabel", v31);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "length"))
      {
        v24 = v26;
      }
      else
      {
        if ((v7 & 1) != 0)
          UIAccessibilityMetadataDescriptionForImage();
        else
          UIAccessibilityMetadataDescriptionForVideo();
        v24 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "length"))
          -[PHAssetAccessibility _accessibilitySavePhotoLabel:](self, "_accessibilitySavePhotoLabel:", v24);
      }

      if (v13)
        goto LABEL_34;
      goto LABEL_23;
    }
  }
  else
  {
    if (v9)
    {
      -[PHAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mediaSubtypes"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "unsignedIntegerValue");

      if ((v22 & 0x20000) != 0)
      {
        v23 = CFSTR("photo.label.type.video.slomo");
      }
      else
      {
        if ((v22 & 0x40000) != 0)
        {
          accessibilityPLServicesLocalizedString(CFSTR("photo.label.type.video.timelapse"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = CFSTR("__AXStringForVariablesSentinel");
          __AXStringForVariables();
          v20 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        }
        v23 = CFSTR("photo.label.type.video");
      }
LABEL_19:
      accessibilityPLServicesLocalizedString(v23);
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    if (v11)
    {
      accessibilityPLServicesLocalizedString(CFSTR("photo.label.type.audio"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
  }
  v24 = 0;
  if (v13)
  {
LABEL_34:
    accessibilityPLServicesLocalizedString(CFSTR("is.favorite"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
LABEL_23:
  v25 = 0;
LABEL_35:
  v33 = v25;
  v34 = CFSTR("__AXStringForVariablesSentinel");
  v32 = v24;
  __UIAXStringForVariables();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (AXDoesRequestingClientDeserveAutomation())
  {
    -[PHAssetAccessibility _accessibilityAssetDuration](self, "_accessibilityAssetDuration", v24, v25, CFSTR("__AXStringForVariablesSentinel"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetAccessibility _accessibilityCreationDate](self, "_accessibilityCreationDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAssetAccessibility _accessibilityCreationTime](self, "_accessibilityCreationTime");
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v35 = CFSTR("__AXStringForVariablesSentinel");
    v32 = v27;
    v33 = v28;
    __UIAXStringForVariables();
    v29 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v29;
  }
  -[PHAssetAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v5, v32, v33, v34, v35);

LABEL_38:
  return v5;
}

- (id)_accessibilityCaptionLabel
{
  void *v2;
  void *v3;

  -[PHAssetAccessibility descriptionProperties](self, "descriptionProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityiCloudPhotoLabel
{
  PHAssetAccessibility *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PHAssetAccessibility *v7;
  void *v8;
  void *v9;
  PHAssetAccessibility *v11;
  void *v12;

  v2 = self;
  if (-[PHAssetAccessibility _axICloudLabelWasSet](v2, "_axICloudLabelWasSet"))
  {
    v3 = (void *)MEMORY[0x24BDBCE30];
    -[PHAssetAccessibility localIdentifier](v2, "localIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 1, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDE3488], "fetchAssetsWithLocalIdentifiers:options:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") != 1)
    {
      v11 = v2;
      v12 = v6;
      _AXAssert();
    }
    objc_msgSend(v6, "firstObject", v11, v12);
    v7 = (PHAssetAccessibility *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      v7 = v2;

    v2 = v7;
  }
  -[PHAssetAccessibility descriptionProperties](v2, "descriptionProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessibilityDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_accessibilitySavePhotoLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;
  id location;

  v4 = a3;
  -[PHAssetAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", 0);
  -[PHAssetAccessibility _axSetICloudLabelWasSet:](self, "_axSetICloudLabelWasSet:", 1);
  LOBYTE(location) = 0;
  objc_opt_class();
  -[PHAssetAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("photoLibrary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__PHAssetAccessibility__accessibilitySavePhotoLabel___block_invoke;
  v12[3] = &unk_24FF052C0;
  v12[4] = self;
  v8 = v4;
  v13 = v8;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __53__PHAssetAccessibility__accessibilitySavePhotoLabel___block_invoke_2;
  v10[3] = &unk_24FF052E8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v6, "performChanges:completionHandler:", v12, v10);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
  return 1;
}

void __53__PHAssetAccessibility__accessibilitySavePhotoLabel___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDE3490], "changeRequestForAsset:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityDescription:", *(_QWORD *)(a1 + 40));

}

void __53__PHAssetAccessibility__accessibilitySavePhotoLabel___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  int v8;
  id v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  VOTLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = 138412802;
    v9 = WeakRetained;
    v10 = 1024;
    v11 = a2;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_230BA9000, v6, OS_LOG_TYPE_DEFAULT, "Asset save: %@ success %d: %@", (uint8_t *)&v8, 0x1Cu);

  }
}

- (void)accessibilityApplyValueBlock:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  -[PHAssetAccessibility _setAXValueCallback:](self, "_setAXValueCallback:", v5);
  -[PHAssetAccessibility _accessibilityPhotoDescription](self, "_accessibilityPhotoDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && v4)
    v5[2](v5, v4);

}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8];
}

@end
