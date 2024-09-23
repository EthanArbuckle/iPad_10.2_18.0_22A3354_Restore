@implementation GEOThrottlerIsSafeReply

- (GEOThrottlerIsSafeReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOThrottlerIsSafeReply *v7;
  const void *data;
  void *v9;
  uint64_t v10;
  GEODataRequestThrottlerToken *throttlerToken;
  GEOThrottlerIsSafeReply *v12;
  size_t length;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOThrottlerIsSafeReply;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v15, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    v7->_nextSafeRequestTime = xpc_dictionary_get_double(v6, "nextSafeRequestTime");
    v7->_availableRequestCount = xpc_dictionary_get_int64(v6, "availableRequestCount");
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
  v7.super_class = (Class)GEOThrottlerIsSafeReply;
  -[GEOXPCReply encodeToXPCDictionary:](&v7, sel_encodeToXPCDictionary_, v4);
  xpc_dictionary_set_double(v4, "nextSafeRequestTime", self->_nextSafeRequestTime);
  xpc_dictionary_set_int64(v4, "availableRequestCount", self->_availableRequestCount);
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
  return 1;
}

- (double)nextSafeRequestTime
{
  return self->_nextSafeRequestTime;
}

- (void)setNextSafeRequestTime:(double)a3
{
  self->_nextSafeRequestTime = a3;
}

- (int)availableRequestCount
{
  return self->_availableRequestCount;
}

- (void)setAvailableRequestCount:(int)a3
{
  self->_availableRequestCount = a3;
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
