@implementation GEOConfigStorageGetValueForKeyRequest

- (unint64_t)reply
{
  return 1;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  NSString *keyString;
  const char *v6;
  NSString *countryCode;
  const char *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOConfigStorageGetValueForKeyRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v9, sel_encodeToXPCDictionary_, v4);
  keyString = self->_keyString;
  if (keyString)
  {
    v6 = -[NSString UTF8String](keyString, "UTF8String");
    if (v6)
      xpc_dictionary_set_string(v4, "keyString", v6);
  }
  xpc_dictionary_set_int64(v4, "keyOptions", self->_keyOptions);
  countryCode = self->_countryCode;
  if (countryCode)
  {
    v8 = -[NSString UTF8String](countryCode, "UTF8String");
    if (v8)
      xpc_dictionary_set_string(v4, "countryCode", v8);
  }

}

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOConfigStorageGetValueForKeyRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOConfigStorageGetValueForKeyRequest *v7;
  const char *string;
  uint64_t v9;
  NSString *keyString;
  const char *v11;
  uint64_t v12;
  NSString *countryCode;
  GEOConfigStorageGetValueForKeyRequest *v14;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOConfigStorageGetValueForKeyRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v16, sel_initWithXPCDictionary_error_, v6, a4);
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
    v11 = xpc_dictionary_get_string(v6, "countryCode");
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      countryCode = v7->_countryCode;
      v7->_countryCode = (NSString *)v12;

    }
    v14 = v7;
  }

  return v7;
}

- (BOOL)isValid
{
  return -[GEOConfigStorageGetValueForKeyRequest keyOptions](self, "keyOptions") != 0;
}

- (unint64_t)keyOptions
{
  return self->_keyOptions;
}

- (NSString)keyString
{
  return self->_keyString;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_keyString, 0);
}

- (GEOConfigStorageGetValueForKeyRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("defaults.getConfigValueForKey"), a3, a4, a5);
}

- (void)setKeyString:(id)a3
{
  objc_storeStrong((id *)&self->_keyString, a3);
}

- (void)setKeyOptions:(unint64_t)a3
{
  self->_keyOptions = a3;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

@end
