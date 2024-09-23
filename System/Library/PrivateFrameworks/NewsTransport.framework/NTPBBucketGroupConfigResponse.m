@implementation NTPBBucketGroupConfigResponse

- (BOOL)hasBucketGroupConfig
{
  return self->_bucketGroupConfig != 0;
}

- (BOOL)hasDomainBloomFilterInfo
{
  return self->_domainBloomFilterInfo != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBBucketGroupConfigResponse;
  -[NTPBBucketGroupConfigResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBBucketGroupConfigResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBBucketGroupConfig *bucketGroupConfig;
  void *v5;
  NTPBBloomFilterInfo *domainBloomFilterInfo;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  bucketGroupConfig = self->_bucketGroupConfig;
  if (bucketGroupConfig)
  {
    -[NTPBBucketGroupConfig dictionaryRepresentation](bucketGroupConfig, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("bucket_group_config"));

  }
  domainBloomFilterInfo = self->_domainBloomFilterInfo;
  if (domainBloomFilterInfo)
  {
    -[NTPBBloomFilterInfo dictionaryRepresentation](domainBloomFilterInfo, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("domain_bloom_filter_info"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBBucketGroupConfigResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_bucketGroupConfig)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_domainBloomFilterInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NTPBBucketGroupConfig copyWithZone:](self->_bucketGroupConfig, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NTPBBloomFilterInfo copyWithZone:](self->_domainBloomFilterInfo, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NTPBBucketGroupConfig *bucketGroupConfig;
  NTPBBloomFilterInfo *domainBloomFilterInfo;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((bucketGroupConfig = self->_bucketGroupConfig, !((unint64_t)bucketGroupConfig | v4[1]))
     || -[NTPBBucketGroupConfig isEqual:](bucketGroupConfig, "isEqual:")))
  {
    domainBloomFilterInfo = self->_domainBloomFilterInfo;
    if ((unint64_t)domainBloomFilterInfo | v4[2])
      v7 = -[NTPBBloomFilterInfo isEqual:](domainBloomFilterInfo, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[NTPBBucketGroupConfig hash](self->_bucketGroupConfig, "hash");
  return -[NTPBBloomFilterInfo hash](self->_domainBloomFilterInfo, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  NTPBBucketGroupConfig *bucketGroupConfig;
  uint64_t v6;
  NTPBBloomFilterInfo *domainBloomFilterInfo;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  bucketGroupConfig = self->_bucketGroupConfig;
  v6 = v4[1];
  v9 = v4;
  if (bucketGroupConfig)
  {
    if (!v6)
      goto LABEL_7;
    -[NTPBBucketGroupConfig mergeFrom:](bucketGroupConfig, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[NTPBBucketGroupConfigResponse setBucketGroupConfig:](self, "setBucketGroupConfig:");
  }
  v4 = v9;
LABEL_7:
  domainBloomFilterInfo = self->_domainBloomFilterInfo;
  v8 = v4[2];
  if (domainBloomFilterInfo)
  {
    if (v8)
    {
      -[NTPBBloomFilterInfo mergeFrom:](domainBloomFilterInfo, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[NTPBBucketGroupConfigResponse setDomainBloomFilterInfo:](self, "setDomainBloomFilterInfo:");
    goto LABEL_12;
  }

}

- (NTPBBucketGroupConfig)bucketGroupConfig
{
  return self->_bucketGroupConfig;
}

- (void)setBucketGroupConfig:(id)a3
{
  objc_storeStrong((id *)&self->_bucketGroupConfig, a3);
}

- (NTPBBloomFilterInfo)domainBloomFilterInfo
{
  return self->_domainBloomFilterInfo;
}

- (void)setDomainBloomFilterInfo:(id)a3
{
  objc_storeStrong((id *)&self->_domainBloomFilterInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainBloomFilterInfo, 0);
  objc_storeStrong((id *)&self->_bucketGroupConfig, 0);
}

@end
