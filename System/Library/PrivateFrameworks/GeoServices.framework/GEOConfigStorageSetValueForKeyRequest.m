@implementation GEOConfigStorageSetValueForKeyRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOConfigStorageSetValueForKeyRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("defaults.setConfigValueForKey"), a3, a4, a5);
}

- (GEOConfigStorageSetValueForKeyRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOConfigStorageSetValueForKeyRequest *v7;
  const char *string;
  uint64_t v9;
  NSString *keyString;
  void *v11;
  uint64_t v12;
  id keyValue;
  GEOConfigStorageSetValueForKeyRequest *v14;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOConfigStorageSetValueForKeyRequest;
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
    xpc_dictionary_get_value(v6, "keyValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = _CFXPCCreateCFObjectFromXPCObject();
      keyValue = v7->_keyValue;
      v7->_keyValue = (id)v12;

    }
    v14 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  NSString *keyString;
  const char *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOConfigStorageSetValueForKeyRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v8, sel_encodeToXPCDictionary_, v4);
  keyString = self->_keyString;
  if (keyString)
  {
    v6 = -[NSString UTF8String](keyString, "UTF8String");
    if (v6)
      xpc_dictionary_set_string(v4, "keyString", v6);
  }
  xpc_dictionary_set_int64(v4, "keyOptions", self->_keyOptions);
  if (self->_keyValue)
  {
    v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v7)
      xpc_dictionary_set_value(v4, "keyValue", v7);

  }
}

- (BOOL)isValid
{
  return -[GEOConfigStorageSetValueForKeyRequest keyOptions](self, "keyOptions") != 0;
}

- (unint64_t)reply
{
  return 2;
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

- (id)keyValue
{
  return self->_keyValue;
}

- (void)setKeyValue:(id)a3
{
  objc_storeStrong(&self->_keyValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keyValue, 0);
  objc_storeStrong((id *)&self->_keyString, 0);
}

@end
