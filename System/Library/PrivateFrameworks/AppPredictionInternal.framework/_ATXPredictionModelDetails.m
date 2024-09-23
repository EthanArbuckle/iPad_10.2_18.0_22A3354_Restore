@implementation _ATXPredictionModelDetails

- (_ATXPredictionModelDetails)initWithAssetCompatibilityVersion:(int64_t)a3 assetVersion:(int64_t)a4 abGroup:(id)a5
{
  id v9;
  _ATXPredictionModelDetails *v10;
  _ATXPredictionModelDetails *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_ATXPredictionModelDetails;
  v10 = -[_ATXPredictionModelDetails init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_assetCompatibilityVersion = a3;
    v10->_assetVersion = a4;
    objc_storeStrong((id *)&v10->_abGroup, a5);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_ATXPredictionModelDetails)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _ATXPredictionModelDetails *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("assetCompatibilityVersion"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("assetVersion"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("abGroup"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[_ATXPredictionModelDetails initWithAssetCompatibilityVersion:assetVersion:abGroup:](self, "initWithAssetCompatibilityVersion:assetVersion:abGroup:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t assetCompatibilityVersion;
  id v5;

  assetCompatibilityVersion = self->_assetCompatibilityVersion;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", assetCompatibilityVersion, CFSTR("assetCompatibilityVersion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_assetVersion, CFSTR("assetVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_abGroup, CFSTR("abGroup"));

}

- (int64_t)assetCompatibilityVersion
{
  return self->_assetCompatibilityVersion;
}

- (void)setAssetCompatibilityVersion:(int64_t)a3
{
  self->_assetCompatibilityVersion = a3;
}

- (int64_t)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(int64_t)a3
{
  self->_assetVersion = a3;
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
  objc_storeStrong((id *)&self->_abGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end
