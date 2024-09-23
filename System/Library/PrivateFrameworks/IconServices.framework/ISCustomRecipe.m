@implementation ISCustomRecipe

+ (id)customRecipeWithInfo:(id)a3 bundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  id v10;
  id v11;
  ISCustomRecipe *v12;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "_IF_stringForKey:", CFSTR("recipe-name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("embossed-folder")) & 1) != 0)
  {
    v8 = CFSTR("ISEmbossedFolder");
  }
  else
  {
    objc_msgSend(v5, "_IF_stringForKey:", CFSTR("class-name"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
LABEL_7:
      v9 = 0;
LABEL_8:
      v10 = 0;
      v11 = 0;
      v12 = 0;
      goto LABEL_9;
    }
  }
  if (!-[objc_class conformsToProtocol:](NSClassFromString(&v8->isa), "conformsToProtocol:", &unk_1EEB8E5A8))goto LABEL_7;
  v9 = (void *)objc_opt_new();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    goto LABEL_7;
  }
  if (!v9)
    goto LABEL_8;
  objc_msgSend(v5, "_IF_dictionaryForKey:", CFSTR("bitmap-resources"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = (void *)MEMORY[0x1E0C9AA70];
  if (v14)
    v17 = (void *)v14;
  else
    v17 = (void *)MEMORY[0x1E0C9AA70];
  v10 = v17;

  objc_msgSend(v5, "_IF_dictionaryForKey:", CFSTR("symbol-resources"));
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (void *)v18;
  else
    v20 = v16;
  v11 = v20;

  v12 = -[ISCustomRecipe initWithRecipe:bitmapResources:symbolResources:bundle:]([ISCustomRecipe alloc], "initWithRecipe:bitmapResources:symbolResources:bundle:", v9, v10, v11, v6);
LABEL_9:

  return v12;
}

- (ISCustomRecipe)initWithRecipe:(id)a3 bitmapResources:(id)a4 symbolResources:(id)a5 bundle:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ISCustomRecipe *v15;
  ISCustomRecipe *v16;
  uint64_t v17;
  NSDictionary *bitmapResources;
  uint64_t v19;
  NSDictionary *symbolResources;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ISCustomRecipe;
  v15 = -[ISCustomRecipe init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_recipe, a3);
    v17 = objc_msgSend(v12, "copy");
    bitmapResources = v16->_bitmapResources;
    v16->_bitmapResources = (NSDictionary *)v17;

    v19 = objc_msgSend(v13, "copy");
    symbolResources = v16->_symbolResources;
    v16->_symbolResources = (NSDictionary *)v19;

    objc_storeStrong((id *)&v16->_bundle, a6);
  }

  return v16;
}

- (id)resourceNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;

  v4 = a3;
  -[NSDictionary _IF_stringForKey:](self->_bitmapResources, "_IF_stringForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (-[IFBundle assetCatalogURL](self->_bundle, "assetCatalogURL"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = 0,
        +[ISAssetCatalogResource assetCatalogResourceWithURL:imageName:error:](ISAssetCatalogResource, "assetCatalogResourceWithURL:imageName:error:", v6, v5, &v12), v7 = (void *)objc_claimAutoreleasedReturnValue(), v6, !v7))
  {
    -[NSDictionary _IF_stringForKey:](self->_symbolResources, "_IF_stringForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0D3A7E8]);
      -[IFBundle bundleURL](self->_bundle, "bundleURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v9, "initWithSymbolName:bundleURL:", v8, v10);

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (ISCompositorRecipe)recipe
{
  return (ISCompositorRecipe *)objc_getProperty(self, a2, 8, 1);
}

- (IFBundle)bundle
{
  return (IFBundle *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)bitmapResources
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)symbolResources
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolResources, 0);
  objc_storeStrong((id *)&self->_bitmapResources, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
}

@end
