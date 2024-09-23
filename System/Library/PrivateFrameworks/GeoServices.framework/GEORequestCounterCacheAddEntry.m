@implementation GEORequestCounterCacheAddEntry

+ (Class)replyClass
{
  return 0;
}

- (GEORequestCounterCacheAddEntry)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("requestCounter.addCacheResult"), a3, a4, a5);
}

- (GEORequestCounterCacheAddEntry)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEORequestCounterCacheAddEntry *v7;
  const char *string;
  uint64_t v9;
  NSString *appId;
  uint64_t v11;
  NSDate *timestamp;
  GEORequestCounterCacheAddEntry *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEORequestCounterCacheAddEntry;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v15, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    string = xpc_dictionary_get_string(v6, "appId");
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v9 = objc_claimAutoreleasedReturnValue();
      appId = v7->_appId;
      v7->_appId = (NSString *)v9;

    }
    if (xpc_dictionary_get_double(v6, "timestamp") != 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v11 = objc_claimAutoreleasedReturnValue();
      timestamp = v7->_timestamp;
      v7->_timestamp = (NSDate *)v11;

    }
    v7->_requestKindRaw = xpc_dictionary_get_int64(v6, "requestKindRaw");
    v7->_result = xpc_dictionary_get_int64(v6, "result");
    v13 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  NSString *appId;
  const char *v6;
  NSDate *timestamp;
  double v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEORequestCounterCacheAddEntry;
  -[GEOXPCRequest encodeToXPCDictionary:](&v9, sel_encodeToXPCDictionary_, v4);
  appId = self->_appId;
  if (appId)
  {
    v6 = -[NSString UTF8String](appId, "UTF8String");
    if (v6)
      xpc_dictionary_set_string(v4, "appId", v6);
  }
  timestamp = self->_timestamp;
  if (timestamp)
  {
    -[NSDate timeIntervalSinceReferenceDate](timestamp, "timeIntervalSinceReferenceDate");
    if (v8 != 0.0)
      xpc_dictionary_set_double(v4, "timestamp", v8);
  }
  xpc_dictionary_set_int64(v4, "requestKindRaw", self->_requestKindRaw);
  xpc_dictionary_set_int64(v4, "result", self->_result);

}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 0;
}

- (NSString)appId
{
  return self->_appId;
}

- (void)setAppId:(id)a3
{
  objc_storeStrong((id *)&self->_appId, a3);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (int)requestKindRaw
{
  return self->_requestKindRaw;
}

- (void)setRequestKindRaw:(int)a3
{
  self->_requestKindRaw = a3;
}

- (unsigned)result
{
  return self->_result;
}

- (void)setResult:(unsigned __int8)a3
{
  self->_result = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_appId, 0);
}

@end
