@implementation BCSConfigItem

+ (id)keysRequestedForCloudKitFetch
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("buckets");
  v3[1] = CFSTR("shards");
  v3[2] = CFSTR("ttl");
  v3[3] = CFSTR("itemTtl");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BCSConfigItem)initWithJSONObj:(id)a3
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
  BCSConfigItem *v15;
  NSObject *v16;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t buf[16];

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

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shards"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("value"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ttl"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("value"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        objc_msgSend(v13, "dateByAddingTimeInterval:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        self = -[BCSConfigItem initWithBuckets:shards:expirationDate:](self, "initWithBuckets:shards:expirationDate:", -[NSObject longLongValue](v8, "longLongValue"), objc_msgSend(v10, "longLongValue"), v14);
        v15 = self;
      }
      else
      {
        ABSLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v18 = 0;
          _os_log_error_impl(&dword_20ACAD000, v16, OS_LOG_TYPE_ERROR, "BCSConfigItem buckets, shards, or ttl is not an NSNumber", v18, 2u);
        }

        v15 = 0;
      }

    }
    else
    {
      ABSLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_error_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_ERROR, "BCSConfigItem fields parameter is not an NSDictionary", v19, 2u);
      }
      v15 = 0;
    }

  }
  else
  {
    ABSLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20ACAD000, v5, OS_LOG_TYPE_ERROR, "BCSConfigItem records parameter is not an NSArray", buf, 2u);
    }
    v15 = 0;
  }

  return v15;
}

- (BCSConfigItem)initWithRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BCSConfigItem *v15;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buckets"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shards"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ttl"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("filterArchive"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      ABSLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[BCSConfigItem(Conversion) initWithRecord:]";
        _os_log_impl(&dword_20ACAD000, v9, OS_LOG_TYPE_DEFAULT, "%s - No Chat Suggest Filter Megashard to download", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v10, "dateByAddingTimeInterval:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v5, "longLongValue");
    v12 = objc_msgSend(v6, "longLongValue");
    -[NSObject fileURL](v8, "fileURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSConfigItem _extractItemTTLFromConfigRecord:](self, "_extractItemTTLFromConfigRecord:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[BCSConfigItem initWithBuckets:shards:expirationDate:filterMegaShardURL:itemTTL:](self, "initWithBuckets:shards:expirationDate:filterMegaShardURL:itemTTL:", v11, v12, v17, v13, v14);

    v15 = self;
  }
  else
  {
    ABSLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_ERROR, "BCSConfigItem buckets, shards, or ttl is not an NSNumber", buf, 2u);
    }
    v15 = 0;
  }

  return v15;
}

- (id)_extractItemTTLFromConfigRecord:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("itemTtl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    ABSLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_20ACAD000, v5, OS_LOG_TYPE_ERROR, "itemTTL exists but is not an NSNumber", v7, 2u);
    }

    v4 = 0;
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

- (BCSConfigItem)initWithBuckets:(int64_t)a3 shards:(int64_t)a4 expirationDate:(id)a5
{
  return -[BCSConfigItem initWithBuckets:shards:expirationDate:filterMegaShardURL:itemTTL:](self, "initWithBuckets:shards:expirationDate:filterMegaShardURL:itemTTL:", a3, a4, a5, 0, 0);
}

- (BCSConfigItem)initWithBuckets:(int64_t)a3 shards:(int64_t)a4 expirationDate:(id)a5 filterMegaShardURL:(id)a6 itemTTL:(id)a7
{
  id v13;
  id v14;
  id v15;
  BCSConfigItem *v16;
  BCSConfigItem *v17;
  objc_super v19;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)BCSConfigItem;
  v16 = -[BCSConfigItem init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_buckets = a3;
    v16->_filterShardCount = a4;
    objc_storeStrong((id *)&v16->_expirationDate, a5);
    objc_storeStrong((id *)&v17->_filterMegaShardURL, a6);
    objc_storeStrong((id *)&v17->_itemTTL, a7);
  }

  return v17;
}

- (NSString)description
{
  void *v3;
  void *v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)BCSConfigItem;
  -[BCSConfigItem description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BCSConfigItem buckets](self, "buckets");
  v6 = -[BCSConfigItem filterShardCount](self, "filterShardCount");
  -[BCSConfigItem expirationDate](self, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSConfigItem itemTTL](self, "itemTTL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - buckets:%lu - shards:%lu - expirationDate:%@ - itemTTL:%@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)isExpired
{
  void *v2;
  void *v3;
  BOOL v4;

  -[BCSConfigItem expirationDate](self, "expirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "compare:", v3) == -1;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v4[1] = -[BCSConfigItem buckets](self, "buckets");
    v4[2] = -[BCSConfigItem filterShardCount](self, "filterShardCount");
    -[BCSConfigItem expirationDate](self, "expirationDate");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v4[5];
    v4[5] = v5;

    -[BCSConfigItem filterMegaShardURL](self, "filterMegaShardURL");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v4[4];
    v4[4] = v7;

    -[BCSConfigItem itemTTL](self, "itemTTL");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v4[3];
    v4[3] = v9;

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t buckets;
  id v5;

  buckets = self->_buckets;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", buckets, CFSTR("BCSConfigItemBucketsCodingKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_filterShardCount, CFSTR("BCSConfigItemShardsCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("BCSConfigItemExpirationDateCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filterMegaShardURL, CFSTR("BCSConfigItemFilterMegaShardCoding"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemTTL, CFSTR("BCSConfigItemItemTTLCodingKey"));

}

- (BCSConfigItem)initWithCoder:(id)a3
{
  id v4;
  BCSConfigItem *v5;
  uint64_t v6;
  NSDate *expirationDate;
  uint64_t v8;
  NSURL *filterMegaShardURL;
  uint64_t v10;
  NSNumber *itemTTL;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BCSConfigItem;
  v5 = -[BCSConfigItem init](&v13, sel_init);
  if (v5)
  {
    v5->_buckets = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("BCSConfigItemBucketsCodingKey"));
    v5->_filterShardCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("BCSConfigItemShardsCodingKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BCSConfigItemExpirationDateCodingKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BCSConfigItemFilterMegaShardCoding"));
    v8 = objc_claimAutoreleasedReturnValue();
    filterMegaShardURL = v5->_filterMegaShardURL;
    v5->_filterMegaShardURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BCSConfigItemItemTTLCodingKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    itemTTL = v5->_itemTTL;
    v5->_itemTTL = (NSNumber *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)buckets
{
  return self->_buckets;
}

- (void)setBuckets:(int64_t)a3
{
  self->_buckets = a3;
}

- (int64_t)filterShardCount
{
  return self->_filterShardCount;
}

- (void)setFilterShardCount:(int64_t)a3
{
  self->_filterShardCount = a3;
}

- (NSNumber)itemTTL
{
  return self->_itemTTL;
}

- (void)setItemTTL:(id)a3
{
  objc_storeStrong((id *)&self->_itemTTL, a3);
}

- (NSURL)filterMegaShardURL
{
  return self->_filterMegaShardURL;
}

- (void)setFilterMegaShardURL:(id)a3
{
  objc_storeStrong((id *)&self->_filterMegaShardURL, a3);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_filterMegaShardURL, 0);
  objc_storeStrong((id *)&self->_itemTTL, 0);
}

@end
