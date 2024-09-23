@implementation PBFFocusPosterCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PBFFocusPosterCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PRSWidget"));
  objc_msgSend(v3, "validateClass:", CFSTR("PRComplicationDescriptor"));
  objc_msgSend(v3, "validateClass:", CFSTR("PBFGenericComplicationLookupInfo"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBFFocusPosterCell"), CFSTR("isCheckboxOn"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBFFocusPosterCell"), CFSTR("posterPreview"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBFPosterConfigurationGalleryPreview"), CFSTR("galleryLocalizedTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBFPosterConfigurationGalleryPreview"), CFSTR("subtitleComplication"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBFPosterConfigurationGalleryPreview"), CFSTR("suggestedComplications"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PBFFocusPosterCell"), CFSTR("_checkboxView"), "PBFFocusCheckboxView");
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("PRSWidget"), CFSTR("pbf_PRSWidgetFromComplicationLookupInfo:uniqueIdentifier:intent:"), "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRComplicationDescriptor"), CFSTR("initWithPRSWidget:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRComplicationDescriptor"), CFSTR("widgetDescriptor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CHSWidgetDescriptor"), CFSTR("displayName"), "@");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v11;

  -[PBFFocusPosterCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("posterPreview"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXMappedLabelOrValueForPosterPreview(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    AXPosterProvider(v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.GradientPoster.GradientPosterExtension"));

    if (!v7)
    {
      accessibilityLocalizedString(CFSTR("lock.screen.wallpaper.label"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "safeStringForKey:", CFSTR("galleryLocalizedTitle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      AXCFormattedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    accessibilityLocalizedString(CFSTR("color.poster.label"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v5;
LABEL_7:

  return v8;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  objc_super v8;

  -[PBFFocusPosterCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("posterPreview"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXMappedLabelOrValueForPosterPreview(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)PBFFocusPosterCellAccessibility;
    -[PBFFocusPosterCellAccessibility accessibilityValue](&v8, sel_accessibilityValue);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PBFFocusPosterCellAccessibility _axWidgetNames](self, "_axWidgetNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  int v2;
  uint64_t v3;

  v2 = -[PBFFocusPosterCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isCheckboxOn"));
  v3 = *MEMORY[0x24BDF7400];
  if (!v2)
    v3 = 0;
  return v3 | *MEMORY[0x24BDF73B0];
}

- (id)accessibilityHint
{
  void *v3;
  __CFString *v4;
  void *v5;

  -[PBFFocusPosterCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_checkboxView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (-[PBFFocusPosterCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isCheckboxOn")))v4 = CFSTR("focus.poster.cell.unlink.hint");
    else
      v4 = CFSTR("focus.poster.cell.link.hint");
  }
  else
  {
    v4 = CFSTR("focus.poster.cell.hint");
  }
  accessibilityLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (id)_axWidgetNames
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  -[PBFFocusPosterCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("posterPreview"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("suggestedComplications"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v3;
  objc_msgSend(v3, "safeValueForKey:", CFSTR("subtitleComplication"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFFocusPosterCellAccessibility _axWidgetDescriptorFromLookupInfo:](self, "_axWidgetDescriptorFromLookupInfo:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    AXTopWidgetAndAppName(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "axSafelyAddObject:", v9);

  }
  v27 = v8;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        -[PBFFocusPosterCellAccessibility _axWidgetDescriptorFromLookupInfo:](self, "_axWidgetDescriptorFromLookupInfo:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        AXMapAppNameToWidgets(v15, v6);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v12);
  }
  v26 = v10;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v6, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v30;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(v6, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v20));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        AXFormatAndListWithElements();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAXStringForVariables();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "axSafelyAddObject:", v23, v22, CFSTR("__AXStringForVariablesSentinel"));

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v18);
  }

  AXFormatAndListWithElements();
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_axWidgetDescriptorFromLookupInfo:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a3;
  MEMORY[0x23491A0AC](CFSTR("PBFGenericComplicationLookupInfo"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__0;
    v19 = __Block_byref_object_dispose__0;
    v4 = MEMORY[0x24BDAC760];
    v20 = 0;
    v14 = v3;
    AXPerformSafeBlock();
    v5 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
    if (v5)
    {
      v15 = 0;
      v16 = &v15;
      v17 = 0x3032000000;
      v18 = __Block_byref_object_copy__0;
      v19 = __Block_byref_object_dispose__0;
      v20 = 0;
      v9 = v4;
      v10 = 3221225472;
      v11 = __69__PBFFocusPosterCellAccessibility__axWidgetDescriptorFromLookupInfo___block_invoke_2;
      v12 = &unk_2503080E0;
      v13 = v5;
      AXPerformSafeBlock();
      v6 = (id)v16[5];

      _Block_object_dispose(&v15, 8);
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
  objc_msgSend(v6, "safeValueForKey:", CFSTR("widgetDescriptor"), v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __69__PBFFocusPosterCellAccessibility__axWidgetDescriptorFromLookupInfo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)MEMORY[0x23491A0AC](CFSTR("PRSWidget")), "pbf_PRSWidgetFromComplicationLookupInfo:uniqueIdentifier:intent:", *(_QWORD *)(a1 + 32), &stru_250308B10, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __69__PBFFocusPosterCellAccessibility__axWidgetDescriptorFromLookupInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc((Class)MEMORY[0x23491A0AC](CFSTR("PRComplicationDescriptor"))), "initWithPRSWidget:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
