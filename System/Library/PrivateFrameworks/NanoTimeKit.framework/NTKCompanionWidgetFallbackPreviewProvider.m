@implementation NTKCompanionWidgetFallbackPreviewProvider

+ (id)sharedInstance
{
  void *v2;
  NTKCompanionWidgetFallbackPreviewProvider *v3;
  void *v4;

  v2 = (void *)sharedInstance_sPreviewProvider;
  if (!sharedInstance_sPreviewProvider)
  {
    v3 = objc_alloc_init(NTKCompanionWidgetFallbackPreviewProvider);
    v4 = (void *)sharedInstance_sPreviewProvider;
    sharedInstance_sPreviewProvider = (uint64_t)v3;

    v2 = (void *)sharedInstance_sPreviewProvider;
  }
  return v2;
}

- (NTKCompanionWidgetFallbackPreviewProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKCompanionWidgetFallbackPreviewProvider;
  return -[NTKCompanionWidgetFallbackPreviewProvider init](&v3, sel_init);
}

- (id)fallbackInfoForDescriptor:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[NTKCompanionWidgetFallbackPreviewProvider isNanoHomeDescriptor:](self, "isNanoHomeDescriptor:", v4))
  {
    -[NTKCompanionWidgetFallbackPreviewProvider nanoHomeFallbackInfoForDescriptor:](self, "nanoHomeFallbackInfoForDescriptor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)fallbackSampleTemplateForDescriptor:(id)a3 family:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (-[NTKCompanionWidgetFallbackPreviewProvider isNanoHomeDescriptor:](self, "isNanoHomeDescriptor:", v6))
  {
    -[NTKCompanionWidgetFallbackPreviewProvider nanoHomefallbackSampleTemplateForDescriptor:family:](self, "nanoHomefallbackSampleTemplateForDescriptor:family:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)nanoHomeFallbackInfoForDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NTKWidgetComplicationInfo *v10;

  v4 = a3;
  if (-[NTKCompanionWidgetFallbackPreviewProvider isNanoHomeDescriptor:](self, "isNanoHomeDescriptor:", v4))
  {
    objc_msgSend(v4, "intentReference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "kind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D515D0], "launcherWidgetName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCompanionWidgetFallbackPreviewProvider nanoHomeDisplayStringForWidgetKind:intent:](self, "nanoHomeDisplayStringForWidgetKind:intent:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NTKWidgetComplicationInfo initWithAppName:displayName:]([NTKWidgetComplicationInfo alloc], "initWithAppName:displayName:", v8, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)nanoHomefallbackSampleTemplateForDescriptor:(id)a3 family:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;

  v6 = a3;
  if (-[NTKCompanionWidgetFallbackPreviewProvider isNanoHomeDescriptor:](self, "isNanoHomeDescriptor:", v6))
  {
    objc_msgSend(v6, "intentReference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "kind");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    switch(a4)
    {
      case 2:
      case 3:
      case 6:
        objc_msgSend(MEMORY[0x1E0D515D0], "launcherWidgetName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C94460], "templateWithTextProvider:", v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_4;
      case 8:
        -[NTKCompanionWidgetFallbackPreviewProvider nanoHomeDisplayStringForWidgetKind:intent:](self, "nanoHomeDisplayStringForWidgetKind:intent:", v9, v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKCompanionWidgetFallbackPreviewProvider nanoHomeImageProviderForIntent:fallbackNTKImageKey:](self, "nanoHomeImageProviderForIntent:fallbackNTKImageKey:", v8, CFSTR("SignatureCornerHome"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C94308], "templateWithTextProvider:imageProvider:", v15, v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      case 9:
        -[NTKCompanionWidgetFallbackPreviewProvider nanoHomeWidgetFallbackCircularTemplateWithIntent:](self, "nanoHomeWidgetFallbackCircularTemplateWithIntent:", v8);
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C94238], "templateWithCircularTemplate:", v13);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 10:
        -[NTKCompanionWidgetFallbackPreviewProvider nanoHomeWidgetFallbackCircularTemplateWithIntent:](self, "nanoHomeWidgetFallbackCircularTemplateWithIntent:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      case 11:
        objc_msgSend(MEMORY[0x1E0D515D8], "Accessory");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v9, "isEqualToString:", v18);

        if (v19)
        {
          objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", &stru_1E6BDC918);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKCompanionWidgetFallbackPreviewProvider nanoHomeDisplayStringForWidgetKind:intent:](self, "nanoHomeDisplayStringForWidgetKind:intent:", v9, v8);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C943C8], "templateWithHeaderTextProvider:body1TextProvider:", v14, v21);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
          goto LABEL_19;
        }
        objc_msgSend(MEMORY[0x1E0D515D8], "ActionSets");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v9, "isEqualToString:", v22);

        if (v23)
        {
          objc_msgSend(MEMORY[0x1E0D515D0], "actionSetRectangularWidgetText");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKCompanionWidgetFallbackPreviewProvider nanoHomeDisplayStringForWidgetKind:intent:](self, "nanoHomeDisplayStringForWidgetKind:intent:", v9, v8);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v16);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C943C8], "templateWithHeaderTextProvider:body1TextProvider:", v15, v24);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
          goto LABEL_18;
        }
        NTKImageNamed(CFSTR("SignatureXLHome"));
        v13 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)MEMORY[0x1E0C944D8];
        -[NSObject imageWithRenderingMode:](v13, "imageWithRenderingMode:", 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "providerWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:", v27, 1, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C94398], "templateWithImageProvider:", v28);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
LABEL_19:

        break;
      case 12:
        -[NTKCompanionWidgetFallbackPreviewProvider nanoHomeImageProviderForIntent:fallbackNTKImageKey:](self, "nanoHomeImageProviderForIntent:fallbackNTKImageKey:", v8, CFSTR("SignatureXLHome"));
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C94330], "templateWithImageProvider:", v13);
        v17 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        v10 = (void *)v17;
        goto LABEL_14;
      default:
LABEL_4:
        _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[NTKCompanionWidgetFallbackPreviewProvider nanoHomefallbackSampleTemplateForDescriptor:family:].cold.1((uint64_t)v9, a4, v13);
        goto LABEL_14;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)nanoHomeWidgetFallbackCircularTemplateWithIntent:(id)a3
{
  void *v3;
  void *v4;

  -[NTKCompanionWidgetFallbackPreviewProvider nanoHomeImageProviderForIntent:fallbackNTKImageKey:](self, "nanoHomeImageProviderForIntent:fallbackNTKImageKey:", a3, CFSTR("SignatureCircularHome"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94260], "templateWithImageProvider:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)nanoHomeImageProviderForIntent:(id)a3 fallbackNTKImageKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  objc_msgSend(a3, "valueForKey:", CFSTR("icon"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6
    || (objc_msgSend(MEMORY[0x1E0C944E0], "_symbolImageProviderWithSystemName:", v6),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    NTKImageNamed(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C944D8];
    objc_msgSend(v8, "imageWithRenderingMode:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "providerWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:", v10, 1, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)isNanoHomeDescriptor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "containerBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "containerBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.NanoHome"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)nanoHomeDisplayStringForWidgetKind:(id)a3 intent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  const __CFString *v19;
  void *v20;
  int v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v30;
  int v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D515D8], "Launcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
LABEL_2:
    objc_msgSend(MEMORY[0x1E0D515D0], "launcherWidgetName");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0D515D8], "Energy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "isEqualToString:", v10);

  if (v11)
  {
    objc_msgSend(v6, "valueForKey:", CFSTR("homeIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12
      || (objc_msgSend(v6, "valueForKey:", CFSTR("homeName")), (v13 = objc_claimAutoreleasedReturnValue()) == 0)
      || (v14 = (void *)v13,
          objc_msgSend(MEMORY[0x1E0D515D0], "homeSpecificEnergyWidgetNameWithHomeName:", v13),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v14,
          !v15))
    {
      objc_msgSend(MEMORY[0x1E0D515D0], "currentLocationEnergyWidgetName");
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v15 = (void *)v16;
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0D515D8], "Accessory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v5, "isEqualToString:", v17);

  if (v18)
  {
    v19 = CFSTR("accessoryName");
LABEL_15:
    objc_msgSend(v6, "valueForKey:", v19);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0D515D8], "ActionSets");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v5, "isEqualToString:", v20);

  if (v21)
  {
    v19 = CFSTR("actionSetName");
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0D515D8], "SmartStack");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v5, "isEqualToString:", v30);

  if (!v31)
  {
    objc_msgSend(MEMORY[0x1E0D515D8], "ElectricityUsage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v5, "isEqualToString:", v32);

    if (v33)
    {
      objc_msgSend(v6, "valueForKey:", CFSTR("homeID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12
        || (objc_msgSend(v6, "valueForKey:", CFSTR("homeName")), (v34 = objc_claimAutoreleasedReturnValue()) == 0)
        || (v35 = (void *)v34,
            objc_msgSend(MEMORY[0x1E0D515D0], "homeSpecificElectricityUsageWidgetNameWithHomeName:", v34),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v35,
            !v15))
      {
        objc_msgSend(MEMORY[0x1E0D515D0], "electricityUsageWidgetName");
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D515D8], "ElectricityRates");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v5, "isEqualToString:", v36);

      if (!v37)
      {
        _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          -[NTKCompanionWidgetFallbackPreviewProvider nanoHomeDisplayStringForWidgetKind:intent:].cold.2((uint64_t)v5, v40, v41, v42, v43, v44, v45, v46);

        goto LABEL_2;
      }
      objc_msgSend(v6, "valueForKey:", CFSTR("homeID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12
        || (objc_msgSend(v6, "valueForKey:", CFSTR("homeName")), (v38 = objc_claimAutoreleasedReturnValue()) == 0)
        || (v39 = (void *)v38,
            objc_msgSend(MEMORY[0x1E0D515D0], "homeSpecificElectricityRatesWidgetNameWithHomeName:", v38),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v39,
            !v15))
      {
        objc_msgSend(MEMORY[0x1E0D515D0], "electricityRatesWidgetName");
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
LABEL_9:

    if (v15)
      goto LABEL_20;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0D515D0], "smartStackWidgetName");
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_16:
  v15 = (void *)v9;
  if (v9)
    goto LABEL_20;
LABEL_17:
  _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[NTKCompanionWidgetFallbackPreviewProvider nanoHomeDisplayStringForWidgetKind:intent:].cold.1((uint64_t)v5, v22, v23, v24, v25, v26, v27, v28);

  objc_msgSend(MEMORY[0x1E0D515D0], "launcherWidgetName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v15;
}

- (void)nanoHomefallbackSampleTemplateForDescriptor:(os_log_t)log family:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "Unhandled complication family %ld with kind %@ in NanoHome fallback preview provider!", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)nanoHomeDisplayStringForWidgetKind:(uint64_t)a3 intent:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "Fallback preview provider failed to generate a proper display string for widget kind: %@. Using launcher display string as a final fail-safe.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)nanoHomeDisplayStringForWidgetKind:(uint64_t)a3 intent:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "Unhandled NanoHome widget kind: %@. Using launcher display string as a fallback.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
