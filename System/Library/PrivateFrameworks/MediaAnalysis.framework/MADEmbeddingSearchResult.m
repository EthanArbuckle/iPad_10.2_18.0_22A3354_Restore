@implementation MADEmbeddingSearchResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADEmbeddingSearchResult)initWithAssetUUID:(id)a3 distance:(id)a4 metric:(int64_t)a5
{
  id v9;
  id v10;
  MADEmbeddingSearchResult *v11;
  MADEmbeddingSearchResult *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MADEmbeddingSearchResult;
  v11 = -[MADEmbeddingSearchResult init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_assetUUID, a3);
    objc_storeStrong((id *)&v12->_distance, a4);
    v12->_metric = a5;
  }

  return v12;
}

- (MADEmbeddingSearchResult)initWithCoder:(id)a3
{
  id v4;
  MADEmbeddingSearchResult *v5;
  uint64_t v6;
  NSString *assetUUID;
  uint64_t v8;
  NSNumber *distance;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADEmbeddingSearchResult;
  v5 = -[MADEmbeddingSearchResult init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AssetUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    assetUUID = v5->_assetUUID;
    v5->_assetUUID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Distance"));
    v8 = objc_claimAutoreleasedReturnValue();
    distance = v5->_distance;
    v5->_distance = (NSNumber *)v8;

    v5->_metric = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Metric"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *assetUUID;
  id v5;

  assetUUID = self->_assetUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", assetUUID, CFSTR("AssetUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_distance, CFSTR("Distance"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_metric, CFSTR("Metric"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("assetUUID: %@, "), self->_assetUUID);
  objc_msgSend(v3, "appendFormat:", CFSTR("distance: %@, "), self->_distance);
  objc_msgSend(v3, "appendFormat:", CFSTR("metric: %d>"), self->_metric);
  return v3;
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (NSNumber)distance
{
  return self->_distance;
}

- (int64_t)metric
{
  return self->_metric;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
}

@end
