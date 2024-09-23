@implementation CRSUIClusterThemeLayoutPreview

- (CRSUIClusterThemeLayoutPreview)initWithAsset:(id)a3 stateForPaletteID:(id)a4
{
  return -[CRSUIClusterThemeLayoutPreview initWithAsset:lightModeStateForPaletteID:darkModeStateForPaletteID:supportsDynamicAppearance:](self, "initWithAsset:lightModeStateForPaletteID:darkModeStateForPaletteID:supportsDynamicAppearance:", a3, a4, 0, 0);
}

- (CRSUIClusterThemeLayoutPreview)initWithAsset:(id)a3 lightModeStateForPaletteID:(id)a4 darkModeStateForPaletteID:(id)a5
{
  return -[CRSUIClusterThemeLayoutPreview initWithAsset:lightModeStateForPaletteID:darkModeStateForPaletteID:supportsDynamicAppearance:](self, "initWithAsset:lightModeStateForPaletteID:darkModeStateForPaletteID:supportsDynamicAppearance:", a3, a4, a5, 1);
}

- (CRSUIClusterThemeLayoutPreview)initWithAsset:(id)a3 lightModeStateForPaletteID:(id)a4 darkModeStateForPaletteID:(id)a5 supportsDynamicAppearance:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  CRSUIClusterThemeLayoutPreview *v14;
  CRSUIClusterThemeLayoutPreview *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRSUIClusterThemeLayoutPreview;
  v14 = -[CRSUIClusterThemeLayoutPreview init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_asset, a3);
    objc_storeStrong((id *)&v15->_lightModeStateForPaletteID, a4);
    objc_storeStrong((id *)&v15->_darkModeStateForPaletteID, a5);
    v15->_supportsDynamicAppearance = a6;
  }

  return v15;
}

- (id)stateForPaletteIDWithInterfaceStyle:(int64_t)a3
{
  uint64_t v4;

  if (a3 == 2 && -[CRSUIClusterThemeLayoutPreview supportsDynamicAppearance](self, "supportsDynamicAppearance"))
    v4 = 16;
  else
    v4 = 8;
  return *(id *)((char *)&self->super.isa + v4);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (CRSUIClusterThemeLayoutPreview)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  CRSUIClusterThemeLayoutPreview *v11;
  char v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("asset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsDynamicAppearance"));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("lightModeStateForPaletteID")))
  {
    objc_msgSend(v4, "decodeDictionaryOfClass:forKey:", objc_opt_class(), CFSTR("lightModeStateForPaletteID"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  }
  v8 = v7;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("darkModeStateForPaletteID")))
  {
    objc_msgSend(v4, "decodeDictionaryOfClass:forKey:", objc_opt_class(), CFSTR("darkModeStateForPaletteID"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v10 = v9;
    goto LABEL_10;
  }
  if ((_DWORD)v6)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCE70]);
    goto LABEL_8;
  }
  v10 = 0;
LABEL_10:
  v11 = 0;
  if (v10)
    v12 = 0;
  else
    v12 = v6;
  if (v5 && v8 && (v12 & 1) == 0)
  {
    self = -[CRSUIClusterThemeLayoutPreview initWithAsset:lightModeStateForPaletteID:darkModeStateForPaletteID:supportsDynamicAppearance:](self, "initWithAsset:lightModeStateForPaletteID:darkModeStateForPaletteID:supportsDynamicAppearance:", v5, v8, v10, v6);
    v11 = self;
  }

  return v11;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CRSUIClusterThemeLayoutPreview asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("asset"));

  objc_msgSend(v5, "encodeDictionary:forKey:", self->_lightModeStateForPaletteID, CFSTR("lightModeStateForPaletteID"));
  objc_msgSend(v5, "encodeDictionary:forKey:", self->_darkModeStateForPaletteID, CFSTR("darkModeStateForPaletteID"));
  objc_msgSend(v5, "encodeBool:forKey:", -[CRSUIClusterThemeLayoutPreview supportsDynamicAppearance](self, "supportsDynamicAppearance"), CFSTR("supportsDynamicAppearance"));

}

- (CRSUIClusterThemeCAPackageAsset)asset
{
  return self->_asset;
}

- (BOOL)supportsDynamicAppearance
{
  return self->_supportsDynamicAppearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_darkModeStateForPaletteID, 0);
  objc_storeStrong((id *)&self->_lightModeStateForPaletteID, 0);
}

@end
