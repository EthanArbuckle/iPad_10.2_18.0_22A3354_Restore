@implementation ATAssetLinkPowerLoggerAggregationKey

- (ATAssetLinkPowerLoggerAggregationKey)initWithLinkType:(int64_t)a3 dataclass:(id)a4 assetType:(id)a5
{
  id v9;
  id v10;
  ATAssetLinkPowerLoggerAggregationKey *v11;
  ATAssetLinkPowerLoggerAggregationKey *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ATAssetLinkPowerLoggerAggregationKey;
  v11 = -[ATAssetLinkPowerLoggerAggregationKey init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_linkType = a3;
    objc_storeStrong((id *)&v11->_dataclass, a4);
    objc_storeStrong((id *)&v12->_assetType, a5);
  }

  return v12;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[ATAssetLinkPowerLoggerAggregationKey linkType](self, "linkType");
  -[ATAssetLinkPowerLoggerAggregationKey dataclass](self, "dataclass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[ATAssetLinkPowerLoggerAggregationKey assetType](self, "assetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  ATAssetLinkPowerLoggerAggregationKey *v4;
  ATAssetLinkPowerLoggerAggregationKey *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (ATAssetLinkPowerLoggerAggregationKey *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[ATAssetLinkPowerLoggerAggregationKey linkType](v5, "linkType");
      if (v6 == -[ATAssetLinkPowerLoggerAggregationKey linkType](self, "linkType"))
      {
        -[ATAssetLinkPowerLoggerAggregationKey dataclass](v5, "dataclass");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATAssetLinkPowerLoggerAggregationKey dataclass](self, "dataclass");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqualToString:", v8))
        {
          -[ATAssetLinkPowerLoggerAggregationKey assetType](v5, "assetType");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATAssetLinkPowerLoggerAggregationKey assetType](self, "assetType");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9 == v10)
          {
            v13 = 1;
          }
          else
          {
            -[ATAssetLinkPowerLoggerAggregationKey assetType](v5, "assetType");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[ATAssetLinkPowerLoggerAggregationKey assetType](self, "assetType");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v11, "isEqualToString:", v12);

          }
        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (NSString)dataclass
{
  return self->_dataclass;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_dataclass, 0);
}

@end
