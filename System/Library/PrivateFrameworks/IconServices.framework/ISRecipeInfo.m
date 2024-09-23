@implementation ISRecipeInfo

+ (id)appRecipeForPlatform:(unint64_t)a3 descriptor:(id)a4
{
  id v5;
  __objc2_class *v6;
  __objc2_class *v7;
  ISrOSAppRecipe *v8;

  v5 = a4;
  switch(a3)
  {
    case 1uLL:
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_6;
    case 2uLL:
      v6 = ISiOSMacAppRecipe;
      goto LABEL_7;
    case 4uLL:
      v8 = (ISrOSAppRecipe *)objc_opt_new();
      -[ISrOSAppRecipe updateRecipeWithImageDescriptor:](v8, "updateRecipeWithImageDescriptor:", v5);
      goto LABEL_12;
    case 8uLL:
      v7 = ISwatchOSAppRecipe;
      goto LABEL_10;
    default:
      if (a3 == 16)
      {
        v8 = objc_alloc_init(ISrOSAppRecipe);
        -[ISrOSAppRecipe setShouldApplyMask:](v8, "setShouldApplyMask:", objc_msgSend(v5, "shouldApplyMask"));
        -[ISrOSAppRecipe setTemplateVariant:](v8, "setTemplateVariant:", objc_msgSend(v5, "templateVariant"));
      }
      else if (a3 == 32)
      {
        v7 = IStvOSAppRecipe;
LABEL_10:
        v8 = (ISrOSAppRecipe *)objc_alloc_init(v7);
        -[ISrOSAppRecipe setShouldApplyMask:](v8, "setShouldApplyMask:", objc_msgSend(v5, "shouldApplyMask"));
      }
      else
      {
LABEL_6:
        v6 = ISGenericRecipe;
LABEL_7:
        v8 = (ISrOSAppRecipe *)objc_alloc_init(v6);
      }
LABEL_12:

      return v8;
  }
}

+ (id)documentRecipeForPlatform:(unint64_t)a3 descriptor:(id)a4
{
  char v4;
  id v5;
  ISiosDocumentRecipe *v6;

  v4 = a3;
  v5 = a4;
  if ((v4 & 0x3C) != 0)
  {
    v6 = objc_alloc_init(ISiosDocumentRecipe);
    -[ISiosDocumentRecipe setOptions:](v6, "setOptions:", 1);
    if ((objc_msgSend(v5, "variantOptions") & 1) != 0)
      -[ISiosDocumentRecipe setOptions:](v6, "setOptions:", -[ISiosDocumentRecipe options](v6, "options") | 4);
  }
  else
  {
    v6 = objc_alloc_init(ISmacosDocumentRecipe1016);
  }

  return v6;
}

+ (id)appRecipeForPlatformStyle:(unint64_t)a3 descriptor:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  ISGenericRecipe *v8;
  NSObject *v9;

  v5 = a4;
  if (a3 == 1)
  {
    +[ISRecipeInfo appRecipeForPlatform:descriptor:](ISRecipeInfo, "appRecipeForPlatform:descriptor:", 4, v5);
    v8 = (ISGenericRecipe *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v7 = v8;
    goto LABEL_9;
  }
  if (a3)
  {
    _ISDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      +[ISRecipeInfo appRecipeForPlatformStyle:descriptor:].cold.1(a3, v9);

    v8 = objc_alloc_init(ISGenericRecipe);
    goto LABEL_8;
  }
  +[ISPlatformInfo sharedInstance](ISPlatformInfo, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISRecipeInfo appRecipeForPlatform:descriptor:](ISRecipeInfo, "appRecipeForPlatform:descriptor:", objc_msgSend(v6, "nativePlatform"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v7;
}

+ (id)genericRecipeWithAppliedDescriptorRecipeAttributes:(id)a3
{
  return objc_alloc_init(ISGenericRecipe);
}

+ (void)appRecipeForPlatformStyle:(uint64_t)a1 descriptor:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1AA928000, a2, OS_LOG_TYPE_FAULT, "Unknown platform style: %lu", (uint8_t *)&v2, 0xCu);
}

@end
