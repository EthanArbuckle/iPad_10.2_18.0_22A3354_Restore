@implementation GEORequestCounterCacheResults

- (NSDateInterval)timeRange
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3588]);
  -[GEORequestCounterCacheResults startTime](self, "startTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[GEORequestCounterCacheResults endTime](self, "endTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v5, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v5, v8);

  }
  if (!v4)

  return (NSDateInterval *)v7;
}

- (GEORequestCounterCacheResults)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v5;
  GEORequestCounterCacheResults *v6;
  const char *string;
  uint64_t v8;
  NSString *appId;
  uint64_t v10;
  NSDate *startTime;
  uint64_t v12;
  NSDate *endTime;
  GEORequestCounterCacheResults *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEORequestCounterCacheResults;
  v6 = -[GEORequestCounterCacheResults init](&v16, sel_init);
  if (v6)
  {
    string = xpc_dictionary_get_string(v5, "appId");
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v8 = objc_claimAutoreleasedReturnValue();
      appId = v6->_appId;
      v6->_appId = (NSString *)v8;

    }
    if (xpc_dictionary_get_double(v5, "startTime") != 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v10 = objc_claimAutoreleasedReturnValue();
      startTime = v6->_startTime;
      v6->_startTime = (NSDate *)v10;

    }
    if (xpc_dictionary_get_double(v5, "endTime") != 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v12 = objc_claimAutoreleasedReturnValue();
      endTime = v6->_endTime;
      v6->_endTime = (NSDate *)v12;

    }
    v6->_requestKindRaw = xpc_dictionary_get_int64(v5, "requestKindRaw");
    v6->_cacheHitCount = xpc_dictionary_get_int64(v5, "cacheHitCount");
    v6->_cacheMissCount = xpc_dictionary_get_int64(v5, "cacheMissCount");
    v6->_cacheExpiredCount = xpc_dictionary_get_int64(v5, "cacheExpiredCount");
    v14 = v6;
  }

  return v6;
}

- (void)encodeToXPCDictionary:(id)a3
{
  NSString *appId;
  const char *v5;
  NSDate *startTime;
  double v7;
  NSDate *endTime;
  double v9;
  xpc_object_t xdict;

  xdict = a3;
  appId = self->_appId;
  if (appId)
  {
    v5 = -[NSString UTF8String](appId, "UTF8String");
    if (v5)
      xpc_dictionary_set_string(xdict, "appId", v5);
  }
  startTime = self->_startTime;
  if (startTime)
  {
    -[NSDate timeIntervalSinceReferenceDate](startTime, "timeIntervalSinceReferenceDate");
    if (v7 != 0.0)
      xpc_dictionary_set_double(xdict, "startTime", v7);
  }
  endTime = self->_endTime;
  if (endTime)
  {
    -[NSDate timeIntervalSinceReferenceDate](endTime, "timeIntervalSinceReferenceDate");
    if (v9 != 0.0)
      xpc_dictionary_set_double(xdict, "endTime", v9);
  }
  xpc_dictionary_set_int64(xdict, "requestKindRaw", self->_requestKindRaw);
  xpc_dictionary_set_int64(xdict, "cacheHitCount", self->_cacheHitCount);
  xpc_dictionary_set_int64(xdict, "cacheMissCount", self->_cacheMissCount);
  xpc_dictionary_set_int64(xdict, "cacheExpiredCount", self->_cacheExpiredCount);

}

- (NSString)appId
{
  return self->_appId;
}

- (void)setAppId:(id)a3
{
  objc_storeStrong((id *)&self->_appId, a3);
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_endTime, a3);
}

- (int)requestKindRaw
{
  return self->_requestKindRaw;
}

- (void)setRequestKindRaw:(int)a3
{
  self->_requestKindRaw = a3;
}

- (unsigned)cacheHitCount
{
  return self->_cacheHitCount;
}

- (void)setCacheHitCount:(unsigned int)a3
{
  self->_cacheHitCount = a3;
}

- (unsigned)cacheMissCount
{
  return self->_cacheMissCount;
}

- (void)setCacheMissCount:(unsigned int)a3
{
  self->_cacheMissCount = a3;
}

- (unsigned)cacheExpiredCount
{
  return self->_cacheExpiredCount;
}

- (void)setCacheExpiredCount:(unsigned int)a3
{
  self->_cacheExpiredCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_appId, 0);
}

@end
