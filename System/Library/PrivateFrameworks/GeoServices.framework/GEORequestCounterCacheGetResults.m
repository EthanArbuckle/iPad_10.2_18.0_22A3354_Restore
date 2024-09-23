@implementation GEORequestCounterCacheGetResults

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEORequestCounterCacheGetResults)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("requestCounter.getCacheResults"), a3, a4, a5);
}

- (GEORequestCounterCacheGetResults)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEORequestCounterCacheGetResults *v7;
  const char *string;
  uint64_t v9;
  NSString *appId;
  uint64_t v11;
  NSDate *startTime;
  uint64_t v13;
  NSDate *endTime;
  GEORequestCounterCacheGetResults *v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEORequestCounterCacheGetResults;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v17, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    v7->_mode = xpc_dictionary_get_int64(v6, "mode");
    string = xpc_dictionary_get_string(v6, "appId");
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v9 = objc_claimAutoreleasedReturnValue();
      appId = v7->_appId;
      v7->_appId = (NSString *)v9;

    }
    if (xpc_dictionary_get_double(v6, "startTime") != 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v11 = objc_claimAutoreleasedReturnValue();
      startTime = v7->_startTime;
      v7->_startTime = (NSDate *)v11;

    }
    if (xpc_dictionary_get_double(v6, "endTime") != 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v13 = objc_claimAutoreleasedReturnValue();
      endTime = v7->_endTime;
      v7->_endTime = (NSDate *)v13;

    }
    v7->_requestKindRaw = xpc_dictionary_get_int64(v6, "requestKindRaw");
    v15 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  NSString *appId;
  const char *v6;
  NSDate *startTime;
  double v8;
  NSDate *endTime;
  double v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEORequestCounterCacheGetResults;
  -[GEOXPCRequest encodeToXPCDictionary:](&v11, sel_encodeToXPCDictionary_, v4);
  xpc_dictionary_set_int64(v4, "mode", self->_mode);
  appId = self->_appId;
  if (appId)
  {
    v6 = -[NSString UTF8String](appId, "UTF8String");
    if (v6)
      xpc_dictionary_set_string(v4, "appId", v6);
  }
  startTime = self->_startTime;
  if (startTime)
  {
    -[NSDate timeIntervalSinceReferenceDate](startTime, "timeIntervalSinceReferenceDate");
    if (v8 != 0.0)
      xpc_dictionary_set_double(v4, "startTime", v8);
  }
  endTime = self->_endTime;
  if (endTime)
  {
    -[NSDate timeIntervalSinceReferenceDate](endTime, "timeIntervalSinceReferenceDate");
    if (v10 != 0.0)
      xpc_dictionary_set_double(v4, "endTime", v10);
  }
  xpc_dictionary_set_int64(v4, "requestKindRaw", self->_requestKindRaw);

}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_appId, 0);
}

@end
