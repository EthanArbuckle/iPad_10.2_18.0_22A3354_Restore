@implementation GEOConfigSetExpiringKeyRequest

+ (Class)replyClass
{
  return 0;
}

- (GEOConfigSetExpiringKeyRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("defaults.setExpiringKey"), a3, a4, a5);
}

- (GEOConfigSetExpiringKeyRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOConfigSetExpiringKeyRequest *v7;
  const char *string;
  uint64_t v9;
  NSString *keyString;
  uint64_t v11;
  NSDate *expireTime;
  const char *v13;
  uint64_t v14;
  NSString *expireOSVersion;
  GEOConfigSetExpiringKeyRequest *v16;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOConfigSetExpiringKeyRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v18, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    string = xpc_dictionary_get_string(v6, "keyString");
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v9 = objc_claimAutoreleasedReturnValue();
      keyString = v7->_keyString;
      v7->_keyString = (NSString *)v9;

    }
    v7->_keyOptions = xpc_dictionary_get_int64(v6, "keyOptions");
    if (xpc_dictionary_get_double(v6, "expireTime") != 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v11 = objc_claimAutoreleasedReturnValue();
      expireTime = v7->_expireTime;
      v7->_expireTime = (NSDate *)v11;

    }
    v13 = xpc_dictionary_get_string(v6, "expireOSVersion");
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      expireOSVersion = v7->_expireOSVersion;
      v7->_expireOSVersion = (NSString *)v14;

    }
    v16 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  NSString *keyString;
  const char *v6;
  NSDate *expireTime;
  double v8;
  NSString *expireOSVersion;
  const char *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOConfigSetExpiringKeyRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v11, sel_encodeToXPCDictionary_, v4);
  keyString = self->_keyString;
  if (keyString)
  {
    v6 = -[NSString UTF8String](keyString, "UTF8String");
    if (v6)
      xpc_dictionary_set_string(v4, "keyString", v6);
  }
  xpc_dictionary_set_int64(v4, "keyOptions", self->_keyOptions);
  expireTime = self->_expireTime;
  if (expireTime)
  {
    -[NSDate timeIntervalSinceReferenceDate](expireTime, "timeIntervalSinceReferenceDate");
    if (v8 != 0.0)
      xpc_dictionary_set_double(v4, "expireTime", v8);
  }
  expireOSVersion = self->_expireOSVersion;
  if (expireOSVersion)
  {
    v10 = -[NSString UTF8String](expireOSVersion, "UTF8String");
    if (v10)
      xpc_dictionary_set_string(v4, "expireOSVersion", v10);
  }

}

- (BOOL)isValid
{
  void *v3;
  BOOL v4;

  -[GEOConfigSetExpiringKeyRequest keyString](self, "keyString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    v4 = -[GEOConfigSetExpiringKeyRequest keyOptions](self, "keyOptions") != 0;
  else
    v4 = 0;

  return v4;
}

- (unint64_t)reply
{
  return 0;
}

- (NSString)keyString
{
  return self->_keyString;
}

- (void)setKeyString:(id)a3
{
  objc_storeStrong((id *)&self->_keyString, a3);
}

- (unint64_t)keyOptions
{
  return self->_keyOptions;
}

- (void)setKeyOptions:(unint64_t)a3
{
  self->_keyOptions = a3;
}

- (NSDate)expireTime
{
  return self->_expireTime;
}

- (void)setExpireTime:(id)a3
{
  objc_storeStrong((id *)&self->_expireTime, a3);
}

- (NSString)expireOSVersion
{
  return self->_expireOSVersion;
}

- (void)setExpireOSVersion:(id)a3
{
  objc_storeStrong((id *)&self->_expireOSVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expireOSVersion, 0);
  objc_storeStrong((id *)&self->_expireTime, 0);
  objc_storeStrong((id *)&self->_keyString, 0);
}

@end
