@implementation PHResourceChooserListResourceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStoreKey, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
}

- (PLResourceDataStore)store
{
  return self->_store;
}

- (unsigned)recipeID
{
  return self->_recipeID;
}

- (float)resourceScale
{
  return self->_resourceScale;
}

- (BOOL)isPrimaryFormat
{
  return self->_isPrimaryFormat;
}

- (BOOL)isDerivative
{
  return self->_isDerivative;
}

- (PHResourceChooserListResourceInfo)initWithResourceType:(unsigned int)a3 recipeID:(unsigned int)a4 resourceVersion:(unsigned int)a5 resourceScale:(double)a6 qualitySort:(int)a7 isDerivative:(BOOL)a8 isPrimaryFormat:(BOOL)a9 canDownload:(BOOL)a10 isHintBased:(BOOL)a11 uti:(id)a12 store:(id)a13 key:(id)a14 localAvailabilityTarget:(signed __int16)a15
{
  _BOOL8 v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;
  id v24;
  id v25;
  PHResourceChooserListResourceInfo *v26;
  PHResourceChooserListResourceInfo *v27;
  uint64_t v29;
  uint64_t v30;
  objc_super v31;

  v15 = a9;
  v16 = a8;
  v17 = *(_QWORD *)&a7;
  v19 = *(_QWORD *)&a5;
  v20 = *(_QWORD *)&a4;
  v21 = *(_QWORD *)&a3;
  v23 = a12;
  v24 = a13;
  v25 = a14;
  v31.receiver = self;
  v31.super_class = (Class)PHResourceChooserListResourceInfo;
  v26 = -[PHResourceChooserListResourceInfo init](&v31, sel_init);
  v27 = v26;
  if (v26)
  {
    LOWORD(v30) = a15;
    LOWORD(v29) = __PAIR16__(a11, a10);
    -[PHResourceChooserListResourceInfo populateWithResourceType:recipeID:resourceVersion:resourceScale:qualitySort:isDerivative:isPrimaryFormat:canDownload:isHintBased:uti:store:key:localAvailabilityTarget:](v26, "populateWithResourceType:recipeID:resourceVersion:resourceScale:qualitySort:isDerivative:isPrimaryFormat:canDownload:isHintBased:uti:store:key:localAvailabilityTarget:", v21, v20, v19, v17, v16, v15, a6, v29, v23, v24, v25, v30);
  }

  return v27;
}

- (unint64_t)hash
{
  _BOOL4 v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  v3 = -[PHResourceChooserListResourceInfo isHintBased](self, "isHintBased");
  v4 = -[PHResourceChooserListResourceInfo recipeID](self, "recipeID") ^ v3;
  v5 = -[PHResourceChooserListResourceInfo version](self, "version");
  v6 = v4 ^ v5 ^ -[PHResourceChooserListResourceInfo resourceType](self, "resourceType");
  -[PHResourceChooserListResourceInfo dataStoreKey](self, "dataStoreKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[PHResourceChooserListResourceInfo store](self, "store");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash") ^ v6;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PHResourceChooserListResourceInfo *v4;
  PHResourceChooserListResourceInfo *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  float v11;
  float v12;
  float v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = (PHResourceChooserListResourceInfo *)a3;
  if (v4 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PHResourceChooserListResourceInfo isHintBased](self, "isHintBased");
      v7 = v6 ^ -[PHResourceChooserListResourceInfo isHintBased](v5, "isHintBased") ^ 1;
      v8 = -[PHResourceChooserListResourceInfo resourceType](self, "resourceType");
      if (v8 == -[PHResourceChooserListResourceInfo resourceType](v5, "resourceType"))
      {
        v9 = -[PHResourceChooserListResourceInfo recipeID](self, "recipeID");
        if (v9 == -[PHResourceChooserListResourceInfo recipeID](v5, "recipeID"))
        {
          v10 = -[PHResourceChooserListResourceInfo version](self, "version");
          if (v10 == -[PHResourceChooserListResourceInfo version](v5, "version"))
          {
            -[PHResourceChooserListResourceInfo resourceScale](self, "resourceScale");
            v12 = v11;
            -[PHResourceChooserListResourceInfo resourceScale](v5, "resourceScale");
            if (v12 == v13)
            {
              v14 = -[PHResourceChooserListResourceInfo isDerivative](self, "isDerivative");
              if (v14 == -[PHResourceChooserListResourceInfo isDerivative](v5, "isDerivative"))
              {
                v15 = -[PHResourceChooserListResourceInfo isPrimaryFormat](self, "isPrimaryFormat");
                if (v15 == -[PHResourceChooserListResourceInfo isPrimaryFormat](v5, "isPrimaryFormat"))
                {
                  v16 = -[PHResourceChooserListResourceInfo canDownload](self, "canDownload");
                  if (v16 == -[PHResourceChooserListResourceInfo canDownload](v5, "canDownload"))
                  {
                    v17 = -[PHResourceChooserListResourceInfo localAvailabilityTarget](self, "localAvailabilityTarget");
                    if (v17 == -[PHResourceChooserListResourceInfo localAvailabilityTarget](v5, "localAvailabilityTarget"))
                    {
                      -[PHResourceChooserListResourceInfo store](self, "store");
                      v18 = (void *)objc_claimAutoreleasedReturnValue();
                      -[PHResourceChooserListResourceInfo store](v5, "store");
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      if (PLObjectIsEqual())
                      {
                        -[PHResourceChooserListResourceInfo dataStoreKey](self, "dataStoreKey");
                        v20 = (void *)objc_claimAutoreleasedReturnValue();
                        -[PHResourceChooserListResourceInfo dataStoreKey](v5, "dataStoreKey");
                        v21 = (void *)objc_claimAutoreleasedReturnValue();
                        PLObjectIsEqual();

                      }
                    }
                  }
                }
              }
            }
          }
        }
      }

    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

- (void)populateWithResourceType:(unsigned int)a3 recipeID:(unsigned int)a4 resourceVersion:(unsigned int)a5 resourceScale:(double)a6 qualitySort:(int)a7 isDerivative:(BOOL)a8 isPrimaryFormat:(BOOL)a9 canDownload:(BOOL)a10 isHintBased:(BOOL)a11 uti:(id)a12 store:(id)a13 key:(id)a14 localAvailabilityTarget:(signed __int16)a15
{
  PLUniformTypeIdentifier *v21;
  PLResourceDataStore *v22;
  PLResourceDataStoreKey *v23;
  PLUniformTypeIdentifier *uniformTypeIdentifier;
  PLUniformTypeIdentifier *v25;
  float v26;
  PLResourceDataStore *store;
  PLResourceDataStore *v28;
  PLResourceDataStoreKey *dataStoreKey;

  v21 = (PLUniformTypeIdentifier *)a12;
  v22 = (PLResourceDataStore *)a13;
  v23 = (PLResourceDataStoreKey *)a14;
  self->_recipeID = a4;
  self->_resourceType = a3;
  self->_version = a5;
  uniformTypeIdentifier = self->_uniformTypeIdentifier;
  self->_uniformTypeIdentifier = v21;
  v25 = v21;

  v26 = a6;
  self->_resourceScale = v26;
  self->_qualitySortValue = a7;
  self->_isDerivative = a8;
  self->_isPrimaryFormat = a9;
  self->_canDownload = a10;
  self->_isHintBased = a11;
  store = self->_store;
  self->_store = v22;
  v28 = v22;

  dataStoreKey = self->_dataStoreKey;
  self->_dataStoreKey = v23;

  self->_localAvailabilityTarget = a15;
}

- (CGSize)approximateSizeFromAsset:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v4 = a3;
  if (objc_msgSend(v4, "hasAdjustments")
    && !-[PHResourceChooserListResourceInfo version](self, "version"))
  {
    objc_msgSend(v4, "originalUnorientedSize");
  }
  else
  {
    objc_msgSend(v4, "unorientedSize");
  }
  -[PHResourceChooserListResourceInfo resourceScale](self, "resourceScale");
  PLApproximateResourceSizeFromScale();
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (signed)localAvailability
{
  void *v2;

  -[PHResourceChooserListResourceInfo dataStoreKey](self, "dataStoreKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    return 1;
  else
    return -1;
}

- (BOOL)isOriginalResource
{
  PHResourceChooserListResourceInfo *v2;
  BOOL v3;

  v2 = self;
  if (-[PHResourceChooserListResourceInfo version](v2, "version"))
    v3 = 0;
  else
    v3 = (-[PHResourceChooserListResourceInfo recipeID](v2, "recipeID") & 1) == 0;

  return v3;
}

- (BOOL)locallyGeneratableOnDemand
{
  unsigned int v3;
  int v4;
  BOOL result;
  BOOL v7;

  v3 = -[PHResourceChooserListResourceInfo recipeID](self, "recipeID");
  v4 = -[PHResourceChooserListResourceInfo localAvailabilityTarget](self, "localAvailabilityTarget");
  result = 1;
  if (v3 - 65938 > 8 || ((1 << (v3 + 110)) & 0x141) == 0)
  {
    v7 = v4 == 1 && v3 != 65747;
    return v3 == 65749 || v7;
  }
  return result;
}

- (void)prepareForReuse
{
  PLResourceDataStore *store;
  PLResourceDataStoreKey *dataStoreKey;
  PLUniformTypeIdentifier *uniformTypeIdentifier;

  *(_DWORD *)&self->_isDerivative = 0;
  *(_QWORD *)&self->_recipeID = 0;
  *(_QWORD *)&self->_version = 0;
  self->_qualitySortValue = 0;
  store = self->_store;
  self->_store = 0;

  dataStoreKey = self->_dataStoreKey;
  self->_dataStoreKey = 0;

  uniformTypeIdentifier = self->_uniformTypeIdentifier;
  self->_uniformTypeIdentifier = 0;

  self->_localAvailabilityTarget = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PHResourceChooserListResourceInfo *v4;
  uint64_t v6;
  uint64_t v7;

  v4 = [PHResourceChooserListResourceInfo alloc];
  LOWORD(v7) = self->_localAvailabilityTarget;
  LOWORD(v6) = *(_WORD *)&self->_canDownload;
  return -[PHResourceChooserListResourceInfo initWithResourceType:recipeID:resourceVersion:resourceScale:qualitySort:isDerivative:isPrimaryFormat:canDownload:isHintBased:uti:store:key:localAvailabilityTarget:](v4, "initWithResourceType:recipeID:resourceVersion:resourceScale:qualitySort:isDerivative:isPrimaryFormat:canDownload:isHintBased:uti:store:key:localAvailabilityTarget:", self->_resourceType, self->_recipeID, self->_version, self->_qualitySortValue, self->_isDerivative, self->_isPrimaryFormat, self->_resourceScale, v6, self->_uniformTypeIdentifier, self->_store, self->_dataStoreKey, v7);
}

- (PLUniformTypeIdentifier)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (unsigned)resourceType
{
  return self->_resourceType;
}

- (unsigned)version
{
  return self->_version;
}

- (int)qualitySortValue
{
  return self->_qualitySortValue;
}

- (PLResourceDataStoreKey)dataStoreKey
{
  return self->_dataStoreKey;
}

- (signed)localAvailabilityTarget
{
  return self->_localAvailabilityTarget;
}

- (BOOL)canDownload
{
  return self->_canDownload;
}

- (BOOL)isHintBased
{
  return self->_isHintBased;
}

@end
