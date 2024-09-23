@implementation MOSuggestionAssetsBundle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *assetLibrary;
  id v5;

  assetLibrary = self->_assetLibrary;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", assetLibrary, CFSTR("coderKeyMOSuggestionAssetsBundleAssetLibrary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_availableTypes, CFSTR("coderKeyMOSuggestionAssetsBundleAvailableTypes"));

}

- (MOSuggestionAssetsBundle)initWithCoder:(id)a3
{
  id v4;
  MOSuggestionAssetsBundle *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *assetLibrary;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSMutableSet *availableTypes;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MOSuggestionAssetsBundle;
  v5 = -[MOSuggestionAssetsBundle init](&v19, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("coderKeyMOSuggestionAssetsBundleAssetLibrary"));
    v11 = objc_claimAutoreleasedReturnValue();
    assetLibrary = v5->_assetLibrary;
    v5->_assetLibrary = (NSMutableDictionary *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("coderKeyMOSuggestionAssetsBundleAvailableTypes"));
    v16 = objc_claimAutoreleasedReturnValue();
    availableTypes = v5->_availableTypes;
    v5->_availableTypes = (NSMutableSet *)v16;

  }
  return v5;
}

- (id)assetsForType:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_assetLibrary, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (BOOL)hasAssetType:(id)a3
{
  return -[NSMutableSet containsObject:](self->_availableTypes, "containsObject:", a3);
}

- (MOSuggestionAssetsBundle)init
{
  MOSuggestionAssetsBundle *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *assetLibrary;
  NSMutableSet *v5;
  NSMutableSet *availableTypes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MOSuggestionAssetsBundle;
  v2 = -[MOSuggestionAssetsBundle init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    assetLibrary = v2->_assetLibrary;
    v2->_assetLibrary = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    availableTypes = v2->_availableTypes;
    v2->_availableTypes = v5;

  }
  return v2;
}

- (void)addAssets:(id)a3 forType:(id)a4
{
  NSMutableDictionary *assetLibrary;
  id v7;

  assetLibrary = self->_assetLibrary;
  v7 = a4;
  -[NSMutableDictionary setObject:forKeyedSubscript:](assetLibrary, "setObject:forKeyedSubscript:", a3, v7);
  -[NSMutableSet addObject:](self->_availableTypes, "addObject:", v7);

}

- (NSMutableSet)availableTypes
{
  return self->_availableTypes;
}

- (NSMutableDictionary)assetLibrary
{
  return self->_assetLibrary;
}

- (void)setAssetLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_assetLibrary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetLibrary, 0);
  objc_storeStrong((id *)&self->_availableTypes, 0);
}

@end
