@implementation NTPBBloomFilterInfo

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBBloomFilterInfo;
  -[NTPBBloomFilterInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBBloomFilterInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *bloomFilterData;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  bloomFilterData = self->_bloomFilterData;
  if (bloomFilterData)
    objc_msgSend(v3, "setObject:forKey:", bloomFilterData, CFSTR("bloom_filter_data"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_hashFunctionCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("hash_function_count"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBBloomFilterInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteDataField();
  PBDataWriterWriteInt32Field();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_bloomFilterData, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  *(_DWORD *)(v5 + 16) = self->_hashFunctionCount;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *bloomFilterData;
  BOOL v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((bloomFilterData = self->_bloomFilterData, !((unint64_t)bloomFilterData | *((_QWORD *)v4 + 1)))
     || -[NSData isEqual:](bloomFilterData, "isEqual:"))
    && self->_hashFunctionCount == *((_DWORD *)v4 + 4);

  return v6;
}

- (unint64_t)hash
{
  return (2654435761 * self->_hashFunctionCount) ^ -[NSData hash](self->_bloomFilterData, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[NTPBBloomFilterInfo setBloomFilterData:](self, "setBloomFilterData:");
    v4 = v5;
  }
  self->_hashFunctionCount = v4[4];

}

- (NSData)bloomFilterData
{
  return self->_bloomFilterData;
}

- (void)setBloomFilterData:(id)a3
{
  objc_storeStrong((id *)&self->_bloomFilterData, a3);
}

- (int)hashFunctionCount
{
  return self->_hashFunctionCount;
}

- (void)setHashFunctionCount:(int)a3
{
  self->_hashFunctionCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bloomFilterData, 0);
}

@end
