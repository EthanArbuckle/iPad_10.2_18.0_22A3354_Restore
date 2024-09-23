@implementation BCSDomainShardItem

- (BCSDomainShardItem)initWithJSONObj:(id)a3 type:(int64_t)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BCSDomainShardItem *v19;
  NSObject *v20;
  const char *v21;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("records"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("fields"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      ABSLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v32 = "-[BCSDomainShardItem(Conversion) initWithJSONObj:type:]";
        v33 = 2112;
        v34 = v26;
        _os_log_error_impl(&dword_20ACAD000, v9, OS_LOG_TYPE_ERROR, "%s - Expected NSDictionary fields parameter. Got %@", buf, 0x16u);

      }
      v19 = 0;
      goto LABEL_24;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("filter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("value"));
    v9 = objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      ABSLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v32 = "-[BCSDomainShardItem(Conversion) initWithJSONObj:type:]";
        v33 = 2112;
        v34 = v28;
        _os_log_error_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_ERROR, "%s - Expected NSString domainShardString parameter. Got %@", buf, 0x16u);

      }
      v19 = 0;
      goto LABEL_23;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("shard"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("value"));
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("index"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("value"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("value"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ttl"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("value"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "doubleValue");
            objc_msgSend(v18, "dateByAddingTimeInterval:");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSObject fileURL](v11, "fileURL");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            self = -[BCSDomainShardItem initWithFileURL:startIndex:shardCount:type:expirationDate:](self, "initWithFileURL:startIndex:shardCount:type:expirationDate:", v29, objc_msgSend(v13, "longLongValue"), objc_msgSend(v15, "longLongValue"), 3, v30);

            v19 = self;
LABEL_22:

LABEL_23:
LABEL_24:

            goto LABEL_25;
          }
        }
      }
      ABSLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v32 = "-[BCSDomainShardItem(Conversion) initWithJSONObj:type:]";
        v21 = "%s - BCSDomainShardItem bloomFilter, startIndex, shardCount, or ttl is not correct class type";
LABEL_27:
        _os_log_error_impl(&dword_20ACAD000, v20, OS_LOG_TYPE_ERROR, v21, buf, 0xCu);
      }
    }
    else
    {
      ABSLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v32 = "-[BCSDomainShardItem(Conversion) initWithJSONObj:type:]";
        v21 = "%s - No asset found in record to download Domain Shard";
        goto LABEL_27;
      }
    }

    v19 = 0;
    goto LABEL_22;
  }
  ABSLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v32 = "-[BCSDomainShardItem(Conversion) initWithJSONObj:type:]";
    v33 = 2112;
    v34 = v24;
    _os_log_error_impl(&dword_20ACAD000, v6, OS_LOG_TYPE_ERROR, "%s - Expected NSArray for records parameter. Got %@", buf, 0x16u);

  }
  v19 = 0;
LABEL_25:

  return v19;
}

- (BCSDomainShardItem)initWithRecord:(id)a3 type:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BCSDomainShardItem *v13;
  NSObject *v14;
  const char *v15;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shard"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("index"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ttl"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  objc_msgSend(v10, "dateByAddingTimeInterval:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    ABSLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315138;
      v18 = "-[BCSDomainShardItem(Conversion) initWithRecord:type:]";
      v15 = "%s - No asset found in record to download Domain Shard";
      goto LABEL_12;
    }
LABEL_9:

    v13 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    ABSLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315138;
      v18 = "-[BCSDomainShardItem(Conversion) initWithRecord:type:]";
      v15 = "%s - BCSShardItem bloomFilter, startIndex, shardCount, or ttl is not correct class type";
LABEL_12:
      _os_log_error_impl(&dword_20ACAD000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v17, 0xCu);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  objc_msgSend(v6, "fileURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[BCSDomainShardItem initWithFileURL:startIndex:shardCount:type:expirationDate:](self, "initWithFileURL:startIndex:shardCount:type:expirationDate:", v12, objc_msgSend(v7, "longLongValue"), objc_msgSend(v8, "longLongValue"), 3, v11);

  v13 = self;
LABEL_10:

  return v13;
}

- (BCSDomainShardItem)initWithURL:(id)a3
{
  BCSDomainShardItem *v4;

  +[BCSDomainShardItem shardItemWithFileURL:](BCSDomainShardItem, "shardItemWithFileURL:", a3);
  v4 = (BCSDomainShardItem *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)shardItemWithFileURL:(id)a3
{
  id v3;
  BCSLineReader *v4;
  void *v5;
  NSObject *v6;
  BCSDomainShardItemMetadata *v7;
  BCSDomainShardItemMetadata *v8;
  void *v9;
  void *v10;
  BCSDomainShardItem *v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = -[BCSLineReader initWithFileURL:]([BCSLineReader alloc], "initWithFileURL:", v3);
  -[BCSLineReader readLine](v4, "readLine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    ABSLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315394;
      v14 = "+[BCSDomainShardItem shardItemWithFileURL:]";
      v15 = 2112;
      v16 = v3;
      _os_log_error_impl(&dword_20ACAD000, v6, OS_LOG_TYPE_ERROR, "%s Cannot create BCSDomainShardItem. Got nil metadata while reading file %@", (uint8_t *)&v13, 0x16u);
    }
    goto LABEL_7;
  }
  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v5, 0);
  if (!-[NSObject length](v6, "length")
    || (v7 = -[BCSDomainShardItemMetadata initWithData:]([BCSDomainShardItemMetadata alloc], "initWithData:", v6)) == 0)
  {
LABEL_7:

    v11 = 0;
    goto LABEL_8;
  }
  v8 = v7;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", (double)-[BCSDomainShardItemMetadata ttl](v8, "ttl"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[BCSDomainShardItem initWithFileURL:startIndex:shardCount:type:expirationDate:]([BCSDomainShardItem alloc], "initWithFileURL:startIndex:shardCount:type:expirationDate:", v3, -[BCSDomainShardItemMetadata index](v8, "index"), -[BCSDomainShardItemMetadata count](v8, "count"), 3, v10);
LABEL_8:

  return v11;
}

- (BCSDomainShardItem)initWithFileURL:(id)a3 startIndex:(int64_t)a4 shardCount:(int64_t)a5 type:(int64_t)a6 expirationDate:(id)a7
{
  id v13;
  BCSDomainShardItem *v14;
  BCSDomainShardItem *v15;
  objc_super v17;

  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BCSDomainShardItem;
  v14 = -[BCSShardItem initWithBase64EncodedString:shardType:startIndex:shardCount:expirationDate:](&v17, sel_initWithBase64EncodedString_shardType_startIndex_shardCount_expirationDate_, CFSTR("DS"), a6, a4, a5, a7);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_fileURL, a3);

  return v15;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)BCSDomainShardItem;
  -[BCSShardItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSDomainShardItem fileURL](self, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - File URL %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BCSDomainShardItem;
  v4 = -[BCSShardItem copyWithZone:](&v8, sel_copyWithZone_, a3);
  if (v4)
  {
    -[BCSDomainShardItem fileURL](self, "fileURL");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v4[6];
    v4[6] = v5;

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BCSDomainShardItem;
  v4 = a3;
  -[BCSShardItem encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_fileURL, CFSTR("BCSDomainShardItemFileURLCoding"), v5.receiver, v5.super_class);

}

- (BCSDomainShardItem)initWithCoder:(id)a3
{
  id v4;
  BCSDomainShardItem *v5;
  uint64_t v6;
  NSURL *fileURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BCSDomainShardItem;
  v5 = -[BCSShardItem initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BCSDomainShardItemFileURLCoding"));
    v6 = objc_claimAutoreleasedReturnValue();
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v6;

  }
  return v5;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
