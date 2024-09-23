@implementation CMLUseCaseConfig

- (CMLUseCaseConfig)initWithType:(int64_t)a3 maxShards:(int64_t)a4 cacheElementCount:(int64_t)a5
{
  return -[CMLUseCaseConfig initWithType:maxShards:cacheElementCount:cacheEntryMinutesToLive:](self, "initWithType:maxShards:cacheElementCount:cacheEntryMinutesToLive:", a3, a4, a5, 10080);
}

- (CMLUseCaseConfig)initWithType:(int64_t)a3 maxShards:(int64_t)a4 cacheElementCount:(int64_t)a5 cacheEntryMinutesToLive:(int64_t)a6
{
  CMLUseCaseConfig *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CMLUseCaseConfig;
  result = -[CMLUseCaseConfig init](&v11, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_maxShards = a4;
    result->_cacheElementCount = a5;
    result->_cacheEntryMinutesToLive = a6;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  CMLUseCaseConfig *v4;
  CMLUseCaseConfig *v5;
  BOOL v6;

  v4 = (CMLUseCaseConfig *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CMLUseCaseConfig isEqualToUseCaseConfig:](self, "isEqualToUseCaseConfig:", v5);

  return v6;
}

- (BOOL)isEqualToUseCaseConfig:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  BOOL v9;

  v4 = a3;
  v5 = -[CMLUseCaseConfig type](self, "type");
  if (v5 == objc_msgSend(v4, "type")
    && (v6 = -[CMLUseCaseConfig maxShards](self, "maxShards"), v6 == objc_msgSend(v4, "maxShards"))
    && (v7 = -[CMLUseCaseConfig cacheElementCount](self, "cacheElementCount"),
        v7 == objc_msgSend(v4, "cacheElementCount")))
  {
    v8 = -[CMLUseCaseConfig cacheEntryMinutesToLive](self, "cacheEntryMinutesToLive");
    v9 = v8 == objc_msgSend(v4, "cacheEntryMinutesToLive");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CMLUseCaseConfig type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CMLUseCaseConfig maxShards](self, "maxShards"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CMLUseCaseConfig cacheElementCount](self, "cacheElementCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CMLUseCaseConfig cacheEntryMinutesToLive](self, "cacheEntryMinutesToLive"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMLUseCaseConfig)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxShards"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cacheElementCount"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cacheEntryMinutesToLive"));

  return -[CMLUseCaseConfig initWithType:maxShards:cacheElementCount:cacheEntryMinutesToLive:](self, "initWithType:maxShards:cacheElementCount:cacheEntryMinutesToLive:", v5, v6, v7, v8);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CMLUseCaseConfig type](self, "type"), CFSTR("type"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CMLUseCaseConfig maxShards](self, "maxShards"), CFSTR("maxShards"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CMLUseCaseConfig cacheElementCount](self, "cacheElementCount"), CFSTR("cacheElementCount"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CMLUseCaseConfig cacheEntryMinutesToLive](self, "cacheEntryMinutesToLive"), CFSTR("cacheEntryMinutesToLive"));

}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)maxShards
{
  return self->_maxShards;
}

- (int64_t)cacheElementCount
{
  return self->_cacheElementCount;
}

- (int64_t)cacheEntryMinutesToLive
{
  return self->_cacheEntryMinutesToLive;
}

@end
