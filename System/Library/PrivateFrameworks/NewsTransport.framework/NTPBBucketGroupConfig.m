@implementation NTPBBucketGroupConfig

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBBucketGroupConfig;
  -[NTPBBucketGroupConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBBucketGroupConfig dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_numberOfBuckets);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("number_of_buckets"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_byteCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("byte_count"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_validUntilDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("valid_until_date"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBBucketGroupConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteInt64Field();

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 8) = self->_version;
  *((_QWORD *)result + 2) = self->_numberOfBuckets;
  *((_QWORD *)result + 1) = self->_byteCount;
  *((_QWORD *)result + 3) = self->_validUntilDate;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_version == *((_DWORD *)v4 + 8)
    && self->_numberOfBuckets == *((_QWORD *)v4 + 2)
    && self->_byteCount == *((_QWORD *)v4 + 1)
    && self->_validUntilDate == *((_QWORD *)v4 + 3);

  return v5;
}

- (unint64_t)hash
{
  return (2654435761 * self->_numberOfBuckets) ^ (2654435761 * self->_version) ^ (2654435761 * self->_byteCount) ^ (2654435761 * self->_validUntilDate);
}

- (void)mergeFrom:(id)a3
{
  self->_version = *((_DWORD *)a3 + 8);
  self->_numberOfBuckets = *((_QWORD *)a3 + 2);
  self->_byteCount = *((_QWORD *)a3 + 1);
  self->_validUntilDate = *((_QWORD *)a3 + 3);
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (int64_t)numberOfBuckets
{
  return self->_numberOfBuckets;
}

- (void)setNumberOfBuckets:(int64_t)a3
{
  self->_numberOfBuckets = a3;
}

- (int64_t)byteCount
{
  return self->_byteCount;
}

- (void)setByteCount:(int64_t)a3
{
  self->_byteCount = a3;
}

- (int64_t)validUntilDate
{
  return self->_validUntilDate;
}

- (void)setValidUntilDate:(int64_t)a3
{
  self->_validUntilDate = a3;
}

@end
