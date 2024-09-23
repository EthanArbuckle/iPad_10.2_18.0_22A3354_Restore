@implementation IDSQueryRateLimitedMetric

- (NSString)name
{
  return (NSString *)CFSTR("IDSQueryRateLimited");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_topLevelService(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v3, CFSTR("topLevelService"), v7);

  objc_msgSend_queryCount(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("count"), v11);

  objc_msgSend_timeSinceStart(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    CFDictionarySetValue(v3, CFSTR("timeSinceStart"), v15);

  return (NSDictionary *)v3;
}

- (IDSQueryRateLimitedMetric)initWithTopLevelService:(id)a3 count:(id)a4 timeSinceStart:(id)a5
{
  id v9;
  id v10;
  id v11;
  IDSQueryRateLimitedMetric *v12;
  IDSQueryRateLimitedMetric *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSQueryRateLimitedMetric;
  v12 = -[IDSQueryRateLimitedMetric init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_topLevelService, a3);
    objc_storeStrong((id *)&v13->_queryCount, a4);
    objc_storeStrong((id *)&v13->_timeSinceStart, a5);
  }

  return v13;
}

- (NSString)topLevelService
{
  return self->_topLevelService;
}

- (NSNumber)queryCount
{
  return self->_queryCount;
}

- (NSNumber)timeSinceStart
{
  return self->_timeSinceStart;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeSinceStart, 0);
  objc_storeStrong((id *)&self->_queryCount, 0);
  objc_storeStrong((id *)&self->_topLevelService, 0);
}

@end
