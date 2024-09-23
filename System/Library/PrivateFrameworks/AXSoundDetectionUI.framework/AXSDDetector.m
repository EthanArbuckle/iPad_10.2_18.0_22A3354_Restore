@implementation AXSDDetector

- (AXSDDetector)initWithIdentifier:(id)a3
{
  return -[AXSDDetector initWithIdentifier:andName:](self, "initWithIdentifier:andName:", a3, 0);
}

- (AXSDDetector)initWithIdentifier:(id)a3 andName:(id)a4
{
  id v6;
  id v7;
  AXSDDetector *v8;
  AXSDDetector *v9;
  uint64_t v10;
  NSString *identifier;
  AXSDDetector *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AXSDDetector;
  v8 = -[AXSDDetector init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_modelName, a4);
    AXSDSoundDetectionTypeForIdentifier();
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    *(_WORD *)&v9->_enabled = 0;
    v12 = v9;
  }

  return v9;
}

- (AXSDDetector)initWithType:(id)a3
{
  NSString *v4;
  AXSDDetector *v5;
  NSString *modelName;

  v4 = (NSString *)a3;
  v5 = -[AXSDDetector initWithIdentifier:](self, "initWithIdentifier:", v4);
  modelName = v5->_modelName;
  v5->_modelName = v4;

  return v5;
}

- (AXSDDetector)initWithModel:(id)a3
{
  id v5;
  AXSDDetector *v6;
  AXSDDetector *v7;
  uint64_t v8;
  NSString *modelName;
  void *v10;
  uint64_t v11;
  NSString *identifier;
  AXSDDetector *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AXSDDetector;
  v6 = -[AXSDDetector init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    objc_msgSend(v5, "ultronModelName");
    v8 = objc_claimAutoreleasedReturnValue();
    modelName = v7->_modelName;
    v7->_modelName = (NSString *)v8;

    objc_msgSend(v5, "ultronModelName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AXSDSoundDetectionTypeForIdentifier();
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v11;

    v7->_needsUpdate = 0;
    v13 = v7;
  }

  return v7;
}

- (NSString)name
{
  return self->_modelName;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)contentVersion
{
  AXAsset *model;

  model = self->_model;
  if (model)
    return -[AXAsset contentVersion](model, "contentVersion");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)compatibilityVersion
{
  AXAsset *model;

  model = self->_model;
  if (model)
    return -[AXAsset compatibilityVersion](model, "compatibilityVersion");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)properties
{
  return (id)-[AXAsset properties](self->_model, "properties");
}

- (id)model
{
  return self->_model;
}

- (BOOL)isCustom
{
  return 0;
}

- (void)setIsEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v3 = a3;
  self->_enabled = a3;
  if (!-[AXSDDetector _isInBuild](self, "_isInBuild"))
  {
    objc_msgSend(MEMORY[0x24BDFDD38], "store");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDFDD70], "ultronAssetType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:forAssetType:", CFSTR("AXUltronAssetsInUse"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v7, "mutableCopy");

    v8 = (uint64_t)v14;
    if (!v14)
      v8 = objc_opt_new();
    v15 = (id)v8;
    if (v3)
    {
      -[AXSDDetector model](self, "model");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "assetId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSDDetector identifier](self, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v10, v11);

    }
    else
    {
      -[AXSDDetector identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObjectForKey:", v9);
    }

    objc_msgSend(MEMORY[0x24BDFDD38], "store");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDFDD70], "ultronAssetType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forKey:forAssetType:", v15, CFSTR("AXUltronAssetsInUse"), v13);

  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSString)category
{
  void *v2;
  id *v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  NSString *v12;

  -[AXSDDetector identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id *)MEMORY[0x24BDFF140];
  AXSDSoundDetectionTypesForCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v2);

  if ((v5 & 1) == 0)
  {
    v3 = (id *)MEMORY[0x24BDFF148];
    AXSDSoundDetectionTypesForCategory();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v2);

    if ((v7 & 1) == 0)
    {
      v3 = (id *)MEMORY[0x24BDFF150];
      AXSDSoundDetectionTypesForCategory();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsObject:", v2);

      if ((v9 & 1) == 0)
      {
        v3 = (id *)MEMORY[0x24BDFF160];
        AXSDSoundDetectionTypesForCategory();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", v2);

        if (!v11)
          v3 = (id *)MEMORY[0x24BDFF158];
      }
    }
  }
  v12 = (NSString *)*v3;

  return v12;
}

- (BOOL)isDownloading
{
  if (-[AXSDDetector _isInBuild](self, "_isInBuild"))
    return 0;
  else
    return -[AXAsset isDownloading](self->_model, "isDownloading");
}

- (BOOL)isInstalled
{
  if (-[AXSDDetector _isInBuild](self, "_isInBuild"))
    return 1;
  else
    return -[AXAsset isInstalled](self->_model, "isInstalled");
}

- (BOOL)isCompatiable
{
  unint64_t v4;
  unint64_t v5;

  if (-[AXSDDetector _isInBuild](self, "_isInBuild"))
    return 1;
  v4 = -[AXSDDetector compatibilityVersion](self, "compatibilityVersion");
  if (v4 < objc_msgSend(MEMORY[0x24BDFDD70], "minimumCompatibilityVersion"))
    return 0;
  v5 = -[AXSDDetector compatibilityVersion](self, "compatibilityVersion");
  return v5 <= objc_msgSend(MEMORY[0x24BDFDD70], "maximumCompatibilityVersion");
}

- (BOOL)isUsingSoundPrint
{
  return -[AXAsset isUsingSoundPrint](self->_model, "isUsingSoundPrint");
}

- (NSURL)modelURL
{
  return (NSURL *)-[AXAsset localURL](self->_model, "localURL");
}

- (NSString)modelURLString
{
  void *v2;
  void *v3;

  -[AXSDDetector modelURL](self, "modelURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isOlderThanDetector:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;

  v4 = a3;
  v8 = 0;
  if (!-[AXSDDetector _isInBuild](self, "_isInBuild") && (objc_msgSend(v4, "isCustom") & 1) == 0)
  {
    v5 = objc_msgSend(v4, "compatibilityVersion");
    if (v5 > -[AXSDDetector compatibilityVersion](self, "compatibilityVersion")
      || (v6 = objc_msgSend(v4, "compatibilityVersion"),
          v6 == -[AXSDDetector compatibilityVersion](self, "compatibilityVersion"))
      && (v7 = objc_msgSend(v4, "contentVersion"), v7 > -[AXSDDetector contentVersion](self, "contentVersion")))
    {
      v8 = 1;
    }
  }

  return v8;
}

- (BOOL)_isInBuild
{
  void *v3;
  int v4;
  unsigned int v5;

  -[AXSDDetector name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF1B0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF1B8]) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF1A8]) ^ 1;
  }
  if (AXIsSoundDetectionMedinaSupportEnabled())
    v5 = v4 & ~-[AXSDDetector isCustom](self, "isCustom");
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[AXSDDetector identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] Identifier: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[AXSDDetector name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSDDetector identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSDDetector category](self, "category");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXSDDetector compatibilityVersion](self, "compatibilityVersion");
  v9 = -[AXSDDetector contentVersion](self, "contentVersion");
  -[AXSDDetector isInstalled](self, "isInstalled");
  NSStringFromBOOL();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] Name: %@, Identifier: %@, Category: %@, Compat Version: %lu, Version: %lu, Is Installed: %@"), v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[AXSDDetector isInstalled](self, "isInstalled"))
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    -[AXSDDetector modelURL](self, "modelURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@, Model URL: %@"), v11, v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = v11;
  }

  return v14;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
}

@end
