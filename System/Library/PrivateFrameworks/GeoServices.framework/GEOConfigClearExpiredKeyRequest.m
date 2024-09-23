@implementation GEOConfigClearExpiredKeyRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOConfigClearExpiredKeyRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("defaults.clearExpiredKey"), a3, a4, a5);
}

- (GEOConfigClearExpiredKeyRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOConfigClearExpiredKeyRequest *v7;
  const char *string;
  uint64_t v9;
  NSString *keyString;
  GEOConfigClearExpiredKeyRequest *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOConfigClearExpiredKeyRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v13, sel_initWithXPCDictionary_error_, v6, a4);
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
    v11 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  NSString *keyString;
  const char *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOConfigClearExpiredKeyRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v7, sel_encodeToXPCDictionary_, v4);
  keyString = self->_keyString;
  if (keyString)
  {
    v6 = -[NSString UTF8String](keyString, "UTF8String");
    if (v6)
      xpc_dictionary_set_string(v4, "keyString", v6);
  }
  xpc_dictionary_set_int64(v4, "keyOptions", self->_keyOptions);

}

- (BOOL)isValid
{
  void *v3;
  BOOL v4;

  -[GEOConfigClearExpiredKeyRequest keyString](self, "keyString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    v4 = -[GEOConfigClearExpiredKeyRequest keyOptions](self, "keyOptions") != 0;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyString, 0);
}

@end
