@implementation ISRecipeFactory

+ (id)factoryWithDescriptor:(id)a3
{
  id v3;
  ISRecipeFactory *v4;

  v3 = a3;
  v4 = -[ISRecipeFactory initWithDescriptor:resourceProvider:]([ISRecipeFactory alloc], "initWithDescriptor:resourceProvider:", v3, 0);

  return v4;
}

+ (id)factoryWithDescriptor:(id)a3 resourceProvider:(id)a4
{
  id v5;
  id v6;
  ISRecipeFactory *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[ISRecipeFactory initWithDescriptor:resourceProvider:]([ISRecipeFactory alloc], "initWithDescriptor:resourceProvider:", v6, v5);

  return v7;
}

- (ISRecipeFactory)initWithDescriptor:(id)a3 resourceProvider:(id)a4
{
  id v7;
  id v8;
  ISRecipeFactory *v9;
  ISRecipeFactory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ISRecipeFactory;
  v9 = -[ISRecipeFactory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resourceProvider, a4);
    objc_storeStrong((id *)&v10->_descriptor, a3);
  }

  return v10;
}

- (id)_recipeFromDescriptor
{
  void *v2;
  void *v3;

  -[ISRecipeFactory descriptor](self, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_recipe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_recipe
{
  void *v3;
  uint64_t v4;
  void *v5;
  ISGenericRecipe *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  uint64_t v39;

  -[ISRecipeFactory descriptor](self, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shape");

  if (!v4
    || (-[ISRecipeFactory descriptor](self, "descriptor"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "_recipe"),
        v6 = (ISGenericRecipe *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    -[ISRecipeFactory resourceProvider](self, "resourceProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "suggestedRecipe");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_7;
    -[ISRecipeFactory resourceProvider](self, "resourceProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "suggestedRecipe");
    v6 = (ISGenericRecipe *)objc_claimAutoreleasedReturnValue();

    _ISDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ISRecipeFactory _recipe].cold.2((uint64_t)v6, v10);

    if (!v6)
    {
LABEL_7:
      -[ISRecipeFactory resourceProvider](self, "resourceProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "iconResource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0 || (v6 = objc_alloc_init(ISGenericRecipe)) == 0)
      {
        -[ISRecipeFactory resourceProvider](self, "resourceProvider");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "resourceType");

        if (!v15)
          goto LABEL_17;
        -[ISRecipeFactory resourceProvider](self, "resourceProvider");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "resourceType");

        if (v17 == 2)
        {
          -[ISRecipeFactory resourceProvider](self, "resourceProvider");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v20, "platform");
          -[ISRecipeFactory descriptor](self, "descriptor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[ISRecipeInfo documentRecipeForPlatform:descriptor:](ISRecipeInfo, "documentRecipeForPlatform:descriptor:", v24, v22);
          v23 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
        if (v17 != 1)
        {
LABEL_17:
          _ISDefaultLog();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            -[ISRecipeFactory _recipe].cold.1(v25);

          -[ISRecipeFactory descriptor](self, "descriptor");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[ISRecipeInfo genericRecipeWithAppliedDescriptorRecipeAttributes:](ISRecipeInfo, "genericRecipeWithAppliedDescriptorRecipeAttributes:", v26);
          v6 = (ISGenericRecipe *)objc_claimAutoreleasedReturnValue();

          goto LABEL_20;
        }
        -[ISRecipeFactory descriptor](self, "descriptor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "platformStyle");

        if (v19)
        {
          -[ISRecipeFactory descriptor](self, "descriptor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "platformStyle");
          -[ISRecipeFactory descriptor](self, "descriptor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[ISRecipeInfo appRecipeForPlatformStyle:descriptor:](ISRecipeInfo, "appRecipeForPlatformStyle:descriptor:", v21, v22);
          v23 = objc_claimAutoreleasedReturnValue();
LABEL_15:
          v6 = (ISGenericRecipe *)v23;

          goto LABEL_16;
        }
        -[ISRecipeFactory resourceProvider](self, "resourceProvider");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "platform") == 2)
        {
          -[ISRecipeFactory resourceProvider](self, "resourceProvider");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "isPrecomposed");

          if (v33)
          {
            -[ISRecipeFactory descriptor](self, "descriptor");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = 1;
LABEL_35:
            +[ISRecipeInfo appRecipeForPlatform:descriptor:](ISRecipeInfo, "appRecipeForPlatform:descriptor:", v34, v20);
            v6 = (ISGenericRecipe *)objc_claimAutoreleasedReturnValue();
LABEL_16:

            if (v6)
              goto LABEL_20;
            goto LABEL_17;
          }
        }
        else
        {

        }
        -[ISRecipeFactory resourceProvider](self, "resourceProvider");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v35, "platform") == 4)
        {
          +[ISPlatformInfo sharedInstance](ISPlatformInfo, "sharedInstance");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v36, "nativePlatform") == 1)
          {
            -[ISRecipeFactory resourceProvider](self, "resourceProvider");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "isPrecomposed");

            if ((v38 & 1) == 0)
            {
              -[ISRecipeFactory descriptor](self, "descriptor");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = 2;
              goto LABEL_35;
            }
LABEL_38:
            -[ISRecipeFactory resourceProvider](self, "resourceProvider");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v20, "platform");
            -[ISRecipeFactory descriptor](self, "descriptor");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            +[ISRecipeInfo appRecipeForPlatform:descriptor:](ISRecipeInfo, "appRecipeForPlatform:descriptor:", v39, v22);
            v23 = objc_claimAutoreleasedReturnValue();
            goto LABEL_15;
          }

        }
        goto LABEL_38;
      }
    }
  }
LABEL_20:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ISRecipeFactory descriptor](self, "descriptor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISGenericRecipe setShouldDrawBorder:](v6, "setShouldDrawBorder:", objc_msgSend(v27, "drawBorder"));

  }
  -[ISRecipeFactory resourceProvider](self, "resourceProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "isGenericProvider"))
  {
    objc_opt_class();
    v29 = objc_opt_isKindOfClass();

    if ((v29 & 1) != 0)
      -[ISGenericRecipe setGeneric:](v6, "setGeneric:", 1);
  }
  else
  {

  }
  return v6;
}

- (id)recipe
{
  void *v3;
  void *v4;

  -[ISRecipeFactory resourceProvider](self, "resourceProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[ISRecipeFactory _recipe](self, "_recipe");
  else
    -[ISRecipeFactory _recipeFromDescriptor](self, "_recipeFromDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISRecipeFactory pushDescriptorContentsToRecipe:](self, "pushDescriptorContentsToRecipe:", v4);
  if (-[ISRecipeFactory shouldSegment](self, "shouldSegment"))
    -[ISRecipeFactory enableSegmentationForRecipe:](self, "enableSegmentationForRecipe:", v4);
  return v4;
}

- (id)genericTaggedRecipe
{
  void *v2;

  -[ISRecipeFactory recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "setGeneric:", 1);
  return v2;
}

- (BOOL)shouldSegment
{
  id v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;

  -[ISRecipeFactory descriptor](self, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "appearance");
  if (v5 != 1)
  {
    -[ISRecipeFactory descriptor](self, "descriptor");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "appearance") != 2)
    {
      v9 = 0;
LABEL_23:

      goto LABEL_24;
    }
  }
  -[ISRecipeFactory resourceProvider](self, "resourceProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "allowNonDefaultAppearances"))
  {

    v9 = 0;
    if (v5 == 1)
      goto LABEL_24;
    goto LABEL_23;
  }
  -[ISRecipeFactory resourceProvider](self, "resourceProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowAlterationsToResourceArt");

  if (v5 != 1)
  {

    if ((v8 & 1) == 0)
      return 0;
LABEL_11:
    -[ISRecipeFactory resourceProvider](self, "resourceProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "iconResource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = 1;
LABEL_24:

      return v9;
    }
    v2 = v4;
    -[ISRecipeFactory descriptor](self, "descriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "appearance") == 1)
    {
      v12 = objc_msgSend(v2, "hasDarkResource");

      if ((v12 & 1) != 0)
        goto LABEL_19;
    }
    else
    {

    }
    -[ISRecipeFactory descriptor](self, "descriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "appearance") == 2)
    {
      v14 = objc_msgSend(v2, "hasTintableResource");

      if ((v14 & 1) != 0)
      {
LABEL_19:
        v9 = 0;
LABEL_22:
        v4 = v2;
        goto LABEL_23;
      }
    }
    else
    {

    }
    v9 = 1;
    goto LABEL_22;
  }

  if (v8)
    goto LABEL_11;
  return 0;
}

- (void)enableSegmentationForRecipe:(id)a3
{
  id v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setSegment:", 1);

}

- (void)pushDescriptorContentsToRecipe:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ISRecipeFactory descriptor](self, "descriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateRecipeWithImageDescriptor:", v4);

  }
}

- (ISResourceProvider)resourceProvider
{
  return (ISResourceProvider *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResourceProvider:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (ISImageDescriptor)descriptor
{
  return (ISImageDescriptor *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDescriptor:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_resourceProvider, 0);
}

- (void)_recipe
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1AA928000, a2, OS_LOG_TYPE_DEBUG, "Allowing provider to suggest recipe: %@", (uint8_t *)&v2, 0xCu);
}

@end
