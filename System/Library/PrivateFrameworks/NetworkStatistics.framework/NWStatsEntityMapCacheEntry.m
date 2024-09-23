@implementation NWStatsEntityMapCacheEntry

- (NSObject)entityName
{
  return objc_getProperty(self, a2, 16, 1);
}

- (NSDate)expiryTime
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setExpiryTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[NWStatsEntityMapCacheEntry expiryTime](self, "expiryTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = v5;
  -[NWStatsEntityMapCacheEntry entityName](self, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("CacheEntry expiryTime %f, --> %@"), v6, v7);

  return v8;
}

- (void)setEntityName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_expiryTime, 0);
}

@end
