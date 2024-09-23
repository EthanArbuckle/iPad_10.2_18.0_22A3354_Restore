@implementation GEOThrottlerIsSafeRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOThrottlerIsSafeRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("throttler.isSafe"), a3, a4, a5);
}

- (GEOThrottlerIsSafeRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOThrottlerIsSafeRequest *v7;
  const void *data;
  void *v9;
  uint64_t v10;
  GEODataRequestThrottlerToken *throttlerToken;
  GEOThrottlerIsSafeRequest *v12;
  size_t length;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOThrottlerIsSafeRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v15, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    v7->_requestKindType = xpc_dictionary_get_int64(v6, "requestKindType");
    v7->_requestKindSubtype = xpc_dictionary_get_int64(v6, "requestKindSubtype");
    v7->_nextSafeRequestTime = xpc_dictionary_get_BOOL(v6, "nextSafeRequestTime");
    v7->_availableRequestCount = xpc_dictionary_get_BOOL(v6, "availableRequestCount");
    v7->_includeToken = xpc_dictionary_get_BOOL(v6, "includeToken");
    length = 0;
    data = xpc_dictionary_get_data(v6, "throttlerToken", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, a4);
      v10 = objc_claimAutoreleasedReturnValue();
      throttlerToken = v7->_throttlerToken;
      v7->_throttlerToken = (GEODataRequestThrottlerToken *)v10;

    }
    v12 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  GEODataRequestThrottlerToken *throttlerToken;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOThrottlerIsSafeRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v7, sel_encodeToXPCDictionary_, v4);
  xpc_dictionary_set_int64(v4, "requestKindType", self->_requestKindType);
  xpc_dictionary_set_int64(v4, "requestKindSubtype", self->_requestKindSubtype);
  xpc_dictionary_set_BOOL(v4, "nextSafeRequestTime", self->_nextSafeRequestTime);
  xpc_dictionary_set_BOOL(v4, "availableRequestCount", self->_availableRequestCount);
  xpc_dictionary_set_BOOL(v4, "includeToken", self->_includeToken);
  throttlerToken = self->_throttlerToken;
  if (throttlerToken)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", throttlerToken, 1, 0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "throttlerToken", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

  }
}

- (BOOL)isValid
{
  if (!self->_requestKindType)
    return 0;
  if (self->_includeToken || self->_nextSafeRequestTime)
    return 1;
  return self->_availableRequestCount;
}

- (unint64_t)reply
{
  return 1;
}

- (int)requestKindType
{
  return self->_requestKindType;
}

- (void)setRequestKindType:(int)a3
{
  self->_requestKindType = a3;
}

- (int)requestKindSubtype
{
  return self->_requestKindSubtype;
}

- (void)setRequestKindSubtype:(int)a3
{
  self->_requestKindSubtype = a3;
}

- (BOOL)nextSafeRequestTime
{
  return self->_nextSafeRequestTime;
}

- (void)setNextSafeRequestTime:(BOOL)a3
{
  self->_nextSafeRequestTime = a3;
}

- (BOOL)availableRequestCount
{
  return self->_availableRequestCount;
}

- (void)setAvailableRequestCount:(BOOL)a3
{
  self->_availableRequestCount = a3;
}

- (BOOL)includeToken
{
  return self->_includeToken;
}

- (void)setIncludeToken:(BOOL)a3
{
  self->_includeToken = a3;
}

- (GEODataRequestThrottlerToken)throttlerToken
{
  return self->_throttlerToken;
}

- (void)setThrottlerToken:(id)a3
{
  objc_storeStrong((id *)&self->_throttlerToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttlerToken, 0);
}

@end
