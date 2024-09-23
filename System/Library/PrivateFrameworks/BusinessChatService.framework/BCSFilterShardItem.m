@implementation BCSFilterShardItem

- (BCSFilterShardItem)initWithBloomFilterString:(id)a3 startIndex:(int64_t)a4 shardCount:(int64_t)a5 type:(int64_t)a6 expirationDate:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  BCSFilterShardItem *v16;

  v12 = a3;
  v13 = a7;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v12, 0);
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BE7A5A0], "bloomFilterWithData:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  v16 = -[BCSFilterShardItem initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:](self, "initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:", v15, v12, a4, a5, a6, v13);

  return v16;
}

- (BCSFilterShardItem)initWithBloomFilter:(id)a3 bloomFilterString:(id)a4 startIndex:(int64_t)a5 shardCount:(int64_t)a6 type:(int64_t)a7 expirationDate:(id)a8
{
  id v15;
  BCSFilterShardItem *v16;
  BCSFilterShardItem *v17;
  objc_super v19;

  v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BCSFilterShardItem;
  v16 = -[BCSShardItem initWithBase64EncodedString:shardType:startIndex:shardCount:expirationDate:](&v19, sel_initWithBase64EncodedString_shardType_startIndex_shardCount_expirationDate_, a4, a7, a5, a6, a8);
  v17 = v16;
  if (v16)
    objc_storeStrong((id *)&v16->_bloomFilter, a3);

  return v17;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BCSFilterShardItem;
  -[BCSShardItem description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isExpired
{
  void *v2;
  void *v3;
  BOOL v4;

  -[BCSShardItem expirationDate](self, "expirationDate");
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
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BCSFilterShardItem;
  v4 = -[BCSShardItem copyWithZone:](&v8, sel_copyWithZone_, a3);
  if (v4)
  {
    -[BCSFilterShardItem bloomFilter](self, "bloomFilter");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v4[6];
    v4[6] = v5;

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BCSFilterShardItem;
  -[BCSShardItem encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (BCSFilterShardItem)initWithCoder:(id)a3
{
  BCSFilterShardItem *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BCSFilterShardItem;
  v3 = -[BCSShardItem initWithCoder:](&v9, sel_initWithCoder_, a3);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDBCE50]);
    -[BCSShardItem base64EncodedString](v3, "base64EncodedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithBase64EncodedString:options:", v5, 0);

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BE7A5A0], "bloomFilterWithData:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_storeStrong((id *)&v3->_bloomFilter, v7);
    if (v6)

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_containsValue:(void *)a1
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;

  v2 = a1;
  v10 = a2;
  if (a1)
  {
    objc_msgSend(a1, "bloomFilter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "newHashesArray");

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v10, 8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bloomFilter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "computeHashesWithSeed:forData:reuse:", 1, v5, v4);

    objc_msgSend(v2, "bloomFilter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v8, "getWithHashes:", v4);

  }
  return v2;
}

- (id)containsItemMatching:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BCSFilterMatchResult *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "conformsToProtocol:", &unk_25462B7B0) & 1) != 0)
  {
    v5 = v4;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v5, "truncatedHashes", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((-[BCSFilterShardItem _containsValue:](self, objc_msgSend(v11, "longLongValue")) & 1) != 0)
          {
            v12 = -[BCSFilterMatchResult initWithMatch:itemIdentifier:matchingTruncatedHash:]([BCSFilterMatchResult alloc], "initWithMatch:itemIdentifier:matchingTruncatedHash:", 1, v5, objc_msgSend(v11, "longLongValue"));

            goto LABEL_13;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }

    v12 = -[BCSFilterMatchResult initWithMatch:itemIdentifier:matchingTruncatedHash:]([BCSFilterMatchResult alloc], "initWithMatch:itemIdentifier:matchingTruncatedHash:", 0, v5, objc_msgSend(v5, "truncatedHash"));
LABEL_13:

  }
  else
  {
    v12 = -[BCSFilterMatchResult initWithMatch:itemIdentifier:matchingTruncatedHash:]([BCSFilterMatchResult alloc], "initWithMatch:itemIdentifier:matchingTruncatedHash:", -[BCSFilterShardItem _containsValue:](self, objc_msgSend(v4, "truncatedHash")), v4, objc_msgSend(v4, "truncatedHash"));
  }

  return v12;
}

- (_PASBloomFilter)bloomFilter
{
  return self->_bloomFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bloomFilter, 0);
}

- (BCSFilterShardItem)initWithBusinessLinkShardItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BCSFilterShardItem *v11;

  v4 = a3;
  objc_msgSend(v4, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", (double)objc_msgSend(v4, "ttl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "filter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BE7A5A0], "bloomFilterWithData:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = -[BCSFilterShardItem initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:]([BCSFilterShardItem alloc], "initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:", v10, v6, objc_msgSend(v4, "index"), objc_msgSend(v4, "count"), 2, v8);

  return v11;
}

- (BCSFilterShardItem)initWithChatSuggestShardItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BCSFilterShardItem *v11;

  v4 = a3;
  objc_msgSend(v4, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", (double)objc_msgSend(v4, "ttl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "filter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BE7A5A0], "bloomFilterWithData:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = -[BCSFilterShardItem initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:]([BCSFilterShardItem alloc], "initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:", v10, v6, objc_msgSend(v4, "index"), objc_msgSend(v4, "count"), 1, v8);

  return v11;
}

- (BCSFilterShardItem)initWithBusinessCallerShardItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BCSFilterShardItem *v11;

  v4 = a3;
  objc_msgSend(v4, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", (double)objc_msgSend(v4, "ttl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "filter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BE7A5A0], "bloomFilterWithData:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = -[BCSFilterShardItem initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:]([BCSFilterShardItem alloc], "initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:", v10, v6, objc_msgSend(v4, "index"), objc_msgSend(v4, "count"), 4, v8);

  return v11;
}

- (BCSFilterShardItem)initWithBusinessEmailShardItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BCSFilterShardItem *v11;

  v4 = a3;
  objc_msgSend(v4, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", (double)objc_msgSend(v4, "ttl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "filter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BE7A5A0], "bloomFilterWithData:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = -[BCSFilterShardItem initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:]([BCSFilterShardItem alloc], "initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:", v10, v6, objc_msgSend(v4, "index"), objc_msgSend(v4, "count"), 5, v8);

  return v11;
}

- (BCSFilterShardItem)initWithJSONObj:(id)a3 type:(int64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BCSFilterShardItem *v17;
  NSObject *v18;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("records"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "firstObject");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("fields"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x24BE7A5A0]), "initWithJSONObj:", v6);
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("index"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("value"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("value"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ttl"));
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
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSObject _bloomFilterStringWithJSONObj:](v10, "_bloomFilterStringWithJSONObj:", v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[BCSFilterShardItem initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:](self, "initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:", v10, v16, objc_msgSend(v22, "longLongValue"), objc_msgSend(v21, "longLongValue"), a4, v20);

        v17 = self;
      }
      else
      {
        ABSLogCommon();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v24 = "-[BCSFilterShardItem(Conversion) initWithJSONObj:type:]";
          _os_log_error_impl(&dword_20ACAD000, v18, OS_LOG_TYPE_ERROR, "%s - BCSFilterShardItem bloomFilter, startIndex, shardCount, or ttl is not correct class type", buf, 0xCu);
        }

        v17 = 0;
      }

    }
    else
    {
      ABSLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[BCSFilterShardItem(Conversion) initWithJSONObj:type:]";
        _os_log_error_impl(&dword_20ACAD000, v10, OS_LOG_TYPE_ERROR, "%s - BCSFilterShardItem fields parameter is not an NSDictioanry", buf, 0xCu);
      }
      v17 = 0;
    }

  }
  else
  {
    ABSLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[BCSFilterShardItem(Conversion) initWithJSONObj:type:]";
      _os_log_error_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_ERROR, "%s - BCSFilterShardItem records parameter is not an NSArray", buf, 0xCu);
    }
    v17 = 0;
  }

  return v17;
}

- (BCSFilterShardItem)initWithRecord:(id)a3 type:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BCSFilterShardItem *v15;
  NSObject *v16;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("filter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE7A5A0], "bloomFilterWithData:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("index"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ttl"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    objc_msgSend(v12, "dateByAddingTimeInterval:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[BCSFilterShardItem initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:](self, "initWithBloomFilter:bloomFilterString:startIndex:shardCount:type:expirationDate:", v8, v14, objc_msgSend(v9, "longLongValue"), objc_msgSend(v10, "longLongValue"), a4, v13);

    v15 = self;
  }
  else
  {
    ABSLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = 136315138;
      v19 = "-[BCSFilterShardItem(Conversion) initWithRecord:type:]";
      _os_log_error_impl(&dword_20ACAD000, v16, OS_LOG_TYPE_ERROR, "%s - BCSFilterShardItem bloomFilter, startIndex, shardCount, or ttl is not correct class type", (uint8_t *)&v18, 0xCu);
    }

    v15 = 0;
  }

  return v15;
}

- (BCSFilterShardItem)initWithURL:(id)a3 type:(int64_t)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  BCSFilterShardItem *v9;
  BCSChatSuggestShardItem *v10;
  BCSFilterShardItem *v11;

  v6 = (objc_class *)MEMORY[0x24BDBCE50];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithContentsOfURL:", v7);

  v9 = 0;
  switch(a4)
  {
    case 1:
      v10 = -[BCSChatSuggestShardItem initWithData:]([BCSChatSuggestShardItem alloc], "initWithData:", v8);
      v11 = -[BCSFilterShardItem initWithChatSuggestShardItem:]([BCSFilterShardItem alloc], "initWithChatSuggestShardItem:", v10);
      goto LABEL_6;
    case 2:
      v10 = -[BCSBusinessLinkShardItem initWithData:]([BCSBusinessLinkShardItem alloc], "initWithData:", v8);
      v11 = -[BCSFilterShardItem initWithBusinessLinkShardItem:]([BCSFilterShardItem alloc], "initWithBusinessLinkShardItem:", v10);
      goto LABEL_6;
    case 4:
      v10 = -[BCSCallerIdShardItem initWithData:]([BCSCallerIdShardItem alloc], "initWithData:", v8);
      v11 = -[BCSFilterShardItem initWithBusinessCallerShardItem:]([BCSFilterShardItem alloc], "initWithBusinessCallerShardItem:", v10);
      goto LABEL_6;
    case 5:
      v10 = -[BCSCallerIdShardItem initWithData:]([BCSCallerIdShardItem alloc], "initWithData:", v8);
      v11 = -[BCSFilterShardItem initWithBusinessEmailShardItem:]([BCSFilterShardItem alloc], "initWithBusinessEmailShardItem:", v10);
LABEL_6:
      v9 = v11;

      break;
    default:
      break;
  }

  return v9;
}

@end
