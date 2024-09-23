@implementation PHLocallyAvailableResourceBag

- (void)setKeyIsHintBased:(BOOL)a3
{
  self->_keyIsHintBased = a3;
}

- (void)setIsPrimaryFormat:(BOOL)a3
{
  self->_isPrimaryFormat = a3;
}

- (void)setIsDerivedFromDeferredPreview:(BOOL)a3
{
  self->_isDerivedFromDeferredPreview = a3;
}

- (void)setIsDegraded:(BOOL)a3
{
  self->_isDegraded = a3;
}

- (void)setDataStoreKey:(id)a3
{
  objc_storeStrong((id *)&self->_dataStoreKey, a3);
}

- (void)setDataStore:(id)a3
{
  objc_storeStrong((id *)&self->_dataStore, a3);
}

- (void)setAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_assetID, a3);
}

- (void)prepareForReuse
{
  PLResourceDataStore *dataStore;
  PLResourceDataStoreKey *dataStoreKey;

  self->_isDegraded = 0;
  dataStore = self->_dataStore;
  self->_dataStore = 0;

  dataStoreKey = self->_dataStoreKey;
  self->_dataStoreKey = 0;

  *(_WORD *)&self->_isPrimaryFormat = 0;
  self->_keyIsHintBased = 0;
}

- (BOOL)isDegraded
{
  return self->_isDegraded;
}

- (BOOL)keyIsHintBased
{
  return self->_keyIsHintBased;
}

- (BOOL)isPrimaryFormat
{
  return self->_isPrimaryFormat;
}

- (BOOL)isDerivedFromDeferredPreview
{
  return self->_isDerivedFromDeferredPreview;
}

- (PLResourceDataStore)dataStore
{
  return self->_dataStore;
}

- (PLResourceDataStoreKey)dataStoreKey
{
  return self->_dataStoreKey;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;

  if (objc_msgSend((id)objc_opt_class(), "storeClassID") == 1)
  {
    v3 = 0;
  }
  else
  {
    -[PHLocallyAvailableResourceBag resourceURL](self, "resourceURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PHLocallyAvailableResourceBag keyIsHintBased](self, "keyIsHintBased"))
    v7 = CFSTR("Y");
  else
    v7 = CFSTR("N");
  if (-[PHLocallyAvailableResourceBag isDegraded](self, "isDegraded"))
    v8 = CFSTR("Y");
  else
    v8 = CFSTR("N");
  if (-[PHLocallyAvailableResourceBag isPrimaryFormat](self, "isPrimaryFormat"))
    v9 = CFSTR("Y");
  else
    v9 = CFSTR("N");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p> url: %@, hint-based: %@, degraded: %@, primary: %@"), v6, self, v3, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_isDerivedFromDeferredPreview)
  {
    objc_msgSend(v10, "stringByAppendingString:", CFSTR(", derived-from-deferred: Y"));
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }

  return (NSString *)v10;
}

- (id)resourceURL
{
  return (id)-[PLResourceDataStore resourceURLForKey:assetID:](self->_dataStore, "resourceURLForKey:assetID:", self->_dataStoreKey, self->_assetID);
}

- (id)resourceData
{
  return (id)-[PLResourceDataStore resourceDataForKey:assetID:](self->_dataStore, "resourceDataForKey:assetID:", self->_dataStoreKey, self->_assetID);
}

- (id)copyWithZone:(_NSZone *)a3
{
  PHLocallyAvailableResourceBag *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(PHLocallyAvailableResourceBag);
  -[PHLocallyAvailableResourceBag assetID](self, "assetID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHLocallyAvailableResourceBag setAssetID:](v4, "setAssetID:", v5);

  -[PHLocallyAvailableResourceBag dataStore](self, "dataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHLocallyAvailableResourceBag setDataStore:](v4, "setDataStore:", v6);

  -[PHLocallyAvailableResourceBag dataStoreKey](self, "dataStoreKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHLocallyAvailableResourceBag setDataStoreKey:](v4, "setDataStoreKey:", v7);

  -[PHLocallyAvailableResourceBag setKeyIsHintBased:](v4, "setKeyIsHintBased:", -[PHLocallyAvailableResourceBag keyIsHintBased](self, "keyIsHintBased"));
  -[PHLocallyAvailableResourceBag setIsDegraded:](v4, "setIsDegraded:", -[PHLocallyAvailableResourceBag isDegraded](self, "isDegraded"));
  -[PHLocallyAvailableResourceBag setIsPrimaryFormat:](v4, "setIsPrimaryFormat:", -[PHLocallyAvailableResourceBag isPrimaryFormat](self, "isPrimaryFormat"));
  -[PHLocallyAvailableResourceBag setIsDerivedFromDeferredPreview:](v4, "setIsDerivedFromDeferredPreview:", -[PHLocallyAvailableResourceBag isDerivedFromDeferredPreview](self, "isDerivedFromDeferredPreview"));
  return v4;
}

- (PLAssetID)assetID
{
  return self->_assetID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStoreKey, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
