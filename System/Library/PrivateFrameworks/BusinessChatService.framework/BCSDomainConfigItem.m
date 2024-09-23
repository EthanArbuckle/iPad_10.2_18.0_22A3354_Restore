@implementation BCSDomainConfigItem

- (BCSDomainConfigItem)initWithBuckets:(int64_t)a3 domainShards:(int64_t)a4 filterShards:(int64_t)a5 expirationDate:(id)a6
{
  return -[BCSDomainConfigItem initWithBuckets:domainShards:filterShards:expirationDate:filterMegaShardURL:domainMegaShardURL:itemTTL:](self, "initWithBuckets:domainShards:filterShards:expirationDate:filterMegaShardURL:domainMegaShardURL:itemTTL:", a3, a4, a5, a6, 0, 0, 0);
}

- (BCSDomainConfigItem)initWithBuckets:(int64_t)a3 domainShards:(int64_t)a4 filterShards:(int64_t)a5 expirationDate:(id)a6 filterMegaShardURL:(id)a7 domainMegaShardURL:(id)a8 itemTTL:(id)a9
{
  id v16;
  BCSDomainConfigItem *v17;
  BCSDomainConfigItem *v18;
  objc_super v20;

  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)BCSDomainConfigItem;
  v17 = -[BCSConfigItem initWithBuckets:shards:expirationDate:filterMegaShardURL:itemTTL:](&v20, sel_initWithBuckets_shards_expirationDate_filterMegaShardURL_itemTTL_, a3, 0, a6, a7, a9);
  v18 = v17;
  if (v17)
  {
    v17->_domainShardCount = a4;
    v17->_filterShardCount = a5;
    objc_storeStrong((id *)&v17->_domainMegaShardURL, a8);
  }

  return v18;
}

- (int64_t)domainShardCount
{
  return self->_domainShardCount;
}

- (int64_t)filterShardCount
{
  return self->_filterShardCount;
}

- (BCSDomainConfigItem)initWithBuckets:(int64_t)a3 shards:(int64_t)a4 expirationDate:(id)a5 filterMegaShardURL:(id)a6 itemTTL:(id)a7
{
  return -[BCSDomainConfigItem initWithBuckets:domainShards:filterShards:expirationDate:filterMegaShardURL:domainMegaShardURL:itemTTL:](self, "initWithBuckets:domainShards:filterShards:expirationDate:filterMegaShardURL:domainMegaShardURL:itemTTL:", a3, 0, a4, a5, a6, 0, a7);
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v12.receiver = self;
  v12.super_class = (Class)BCSDomainConfigItem;
  -[BCSConfigItem description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BCSConfigItem buckets](self, "buckets");
  v6 = -[BCSDomainConfigItem domainShardCount](self, "domainShardCount");
  v7 = -[BCSDomainConfigItem filterShardCount](self, "filterShardCount");
  -[BCSConfigItem expirationDate](self, "expirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSConfigItem itemTTL](self, "itemTTL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - buckets:%lu - domainShards:%lu - filterShards:%lu - expirationDate:%@ - itemTTL:%@"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BCSDomainConfigItem;
  v4 = -[BCSConfigItem copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[BCSConfigItem buckets](self, "buckets");
  v6 = -[BCSDomainConfigItem domainShardCount](self, "domainShardCount");
  v7 = -[BCSDomainConfigItem filterShardCount](self, "filterShardCount");
  -[BCSConfigItem expirationDate](self, "expirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSConfigItem filterMegaShardURL](self, "filterMegaShardURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSDomainConfigItem domainMegaShardURL](self, "domainMegaShardURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSConfigItem itemTTL](self, "itemTTL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v4, "initWithBuckets:domainShards:filterShards:expirationDate:filterMegaShardURL:domainMegaShardURL:itemTTL:", v5, v6, v7, v8, v9, v10, v11);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BCSDomainConfigItem;
  v4 = a3;
  -[BCSConfigItem encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_domainShardCount, CFSTR("BCSDomainConfigItemDomainShardsCodingKey"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_filterShardCount, CFSTR("BCSDomainConfigItemFilterShardsCodingKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_domainMegaShardURL, CFSTR("BCSDomainConfigItemDomainMegaShardCodingKey"));

}

- (BCSDomainConfigItem)initWithCoder:(id)a3
{
  id v4;
  BCSDomainConfigItem *v5;
  uint64_t v6;
  NSURL *domainMegaShardURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BCSDomainConfigItem;
  v5 = -[BCSConfigItem initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_domainShardCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("BCSDomainConfigItemDomainShardsCodingKey"));
    v5->_filterShardCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("BCSDomainConfigItemFilterShardsCodingKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BCSDomainConfigItemDomainMegaShardCodingKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    domainMegaShardURL = v5->_domainMegaShardURL;
    v5->_domainMegaShardURL = (NSURL *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)domainMegaShardURL
{
  return self->_domainMegaShardURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainMegaShardURL, 0);
}

+ (id)keysRequestedForCloudKitFetch
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("buckets");
  v3[1] = CFSTR("domainShards");
  v3[2] = CFSTR("filterShards");
  v3[3] = CFSTR("ttl");
  v3[4] = CFSTR("itemTtl");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BCSDomainConfigItem)initWithJSONObj:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BCSDomainConfigItem *v16;
  NSObject *v17;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("records"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("fields"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("buckets"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("value"));
      v8 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("domainShards"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("value"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("filterShards"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("value"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ttl"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("value"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "doubleValue");
        objc_msgSend(v15, "dateByAddingTimeInterval:");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        self = -[BCSDomainConfigItem initWithBuckets:domainShards:filterShards:expirationDate:](self, "initWithBuckets:domainShards:filterShards:expirationDate:", -[NSObject longLongValue](v8, "longLongValue"), objc_msgSend(v10, "longValue"), objc_msgSend(v12, "longLongValue"), v23);
        v16 = self;
      }
      else
      {
        ABSLogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_20ACAD000, v17, OS_LOG_TYPE_ERROR, "BCSDomainConfigItem buckets, domainShards, filterShards, or ttl is not an NSNumber", buf, 2u);
        }

        v16 = 0;
      }

    }
    else
    {
      ABSLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v25 = "-[BCSDomainConfigItem(Conversion) initWithJSONObj:]";
        v26 = 2112;
        v27 = v22;
        _os_log_error_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_ERROR, "%s - Expected NSDictionary fields parameter. Got %@", buf, 0x16u);

      }
      v16 = 0;
    }

  }
  else
  {
    ABSLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v25 = "-[BCSDomainConfigItem(Conversion) initWithJSONObj:]";
      v26 = 2112;
      v27 = v20;
      _os_log_error_impl(&dword_20ACAD000, v5, OS_LOG_TYPE_ERROR, "%s - Expected NSArray for records parameter. Got %@", buf, 0x16u);

    }
    v16 = 0;
  }

  return v16;
}

- (BCSDomainConfigItem)initWithRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BCSDomainConfigItem *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buckets"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domainShards"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("filterShards"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ttl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("filterArchive"));
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domainArchive"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      ABSLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[BCSDomainConfigItem(Conversion) initWithRecord:]";
        _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, "%s - No Filter Megashard to download", buf, 0xCu);
      }

    }
    if (!v10)
    {
      ABSLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[BCSDomainConfigItem(Conversion) initWithRecord:]";
        _os_log_impl(&dword_20ACAD000, v12, OS_LOG_TYPE_DEFAULT, "%s - No Domain Megashard to download", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    objc_msgSend(v13, "dateByAddingTimeInterval:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v5, "longLongValue");
    v20 = objc_msgSend(v6, "longLongValue");
    v19 = objc_msgSend(v7, "longLongValue");
    -[NSObject fileURL](v9, "fileURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURL");
    v22 = v10;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSConfigItem _extractItemTTLFromConfigRecord:](self, "_extractItemTTLFromConfigRecord:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[BCSDomainConfigItem initWithBuckets:domainShards:filterShards:expirationDate:filterMegaShardURL:domainMegaShardURL:itemTTL:](self, "initWithBuckets:domainShards:filterShards:expirationDate:filterMegaShardURL:domainMegaShardURL:itemTTL:", v21, v20, v19, v23, v14, v15, v16);

    v17 = self;
  }
  else
  {
    ABSLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20ACAD000, v9, OS_LOG_TYPE_ERROR, "BCSDomainConfigItem buckets, domainShards, filterShards, or ttl is not an NSNumber", buf, 2u);
    }
    v17 = 0;
  }

  return v17;
}

@end
