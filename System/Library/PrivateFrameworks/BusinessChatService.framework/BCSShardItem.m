@implementation BCSShardItem

- (BCSShardItem)initWithBase64EncodedString:(id)a3 shardType:(int64_t)a4 startIndex:(int64_t)a5 shardCount:(int64_t)a6 expirationDate:(id)a7
{
  id v13;
  id v14;
  BCSShardItem *v15;
  BCSShardItem *v16;
  objc_super v18;

  v13 = a3;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)BCSShardItem;
  v15 = -[BCSShardItem init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_base64EncodedString, a3);
    v16->_startIndex = a5;
    v16->_shardCount = a6;
    v16->_type = a4;
    objc_storeStrong((id *)&v16->_expirationDate, a7);
  }

  return v16;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v14.receiver = self;
  v14.super_class = (Class)BCSShardItem;
  -[BCSShardItem description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSShardItem base64EncodedString](self, "base64EncodedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  NSStringFromBCSShardType(-[BCSShardItem type](self, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BCSShardItem type](self, "type");
  v9 = -[BCSShardItem startIndex](self, "startIndex");
  v10 = -[BCSShardItem shardCount](self, "shardCount");
  -[BCSShardItem expirationDate](self, "expirationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - base64EncodedString length: %lu  - type:%@ (%ld) - startIndex:%lu - shardCount:%lu - expirationDate:%@"), v4, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
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
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    -[BCSShardItem base64EncodedString](self, "base64EncodedString");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v4[1];
    v4[1] = v5;

    v4[2] = -[BCSShardItem type](self, "type");
    v4[3] = -[BCSShardItem startIndex](self, "startIndex");
    v4[4] = -[BCSShardItem shardCount](self, "shardCount");
    -[BCSShardItem expirationDate](self, "expirationDate");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v4[5];
    v4[5] = v7;

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *base64EncodedString;
  id v5;

  base64EncodedString = self->_base64EncodedString;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", base64EncodedString, CFSTR("BCSShardItemBase64EncodedStringCodingKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("BCSShardItemTypeCodingKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_startIndex, CFSTR("BCSShardItemStartIndexCodingKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_shardCount, CFSTR("BCSShardItemShardCountCodingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("BCSShardItemExpirationDateCodingKey"));

}

- (BCSShardItem)initWithCoder:(id)a3
{
  id v4;
  BCSShardItem *v5;
  uint64_t v6;
  NSString *base64EncodedString;
  uint64_t v8;
  NSDate *expirationDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BCSShardItem;
  v5 = -[BCSShardItem init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BCSShardItemBase64EncodedStringCodingKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    base64EncodedString = v5->_base64EncodedString;
    v5->_base64EncodedString = (NSString *)v6;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("BCSShardItemTypeCodingKey"));
    v5->_startIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("BCSShardItemStartIndexCodingKey"));
    v5->_shardCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("BCSShardItemShardCountCodingKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BCSShardItemExpirationDateCodingKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)base64EncodedString
{
  return self->_base64EncodedString;
}

- (void)setBase64EncodedString:(id)a3
{
  objc_storeStrong((id *)&self->_base64EncodedString, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)startIndex
{
  return self->_startIndex;
}

- (void)setStartIndex:(int64_t)a3
{
  self->_startIndex = a3;
}

- (int64_t)shardCount
{
  return self->_shardCount;
}

- (void)setShardCount:(int64_t)a3
{
  self->_shardCount = a3;
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
  objc_storeStrong((id *)&self->_base64EncodedString, 0);
}

@end
