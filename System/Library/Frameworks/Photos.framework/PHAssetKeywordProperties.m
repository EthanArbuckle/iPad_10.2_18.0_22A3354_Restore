@implementation PHAssetKeywordProperties

- (PHAssetKeywordProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  id v7;
  id v8;
  PHAssetKeywordProperties *v9;
  PHAssetKeywordProperties *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSSet *keywordTitles;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHAssetKeywordProperties;
  v9 = -[PHAssetKeywordProperties init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->super._asset, v8);
    v11 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("keywordTitles"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    keywordTitles = v10->_keywordTitles;
    v10->_keywordTitles = (NSSet *)v13;

  }
  return v10;
}

- (NSSet)keywordTitles
{
  return self->_keywordTitles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keywordTitles, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetKeywords");
}

+ (id)entityName
{
  return CFSTR("Keyword");
}

+ (id)keyPathFromPrimaryObject
{
  return 0;
}

+ (id)keyPathToPrimaryObject
{
  return 0;
}

+ (BOOL)isToMany
{
  return 1;
}

+ (BOOL)createsPropertySetObjectWithCustomImplementation
{
  return 1;
}

+ (id)propertiesToFetch
{
  return 0;
}

@end
