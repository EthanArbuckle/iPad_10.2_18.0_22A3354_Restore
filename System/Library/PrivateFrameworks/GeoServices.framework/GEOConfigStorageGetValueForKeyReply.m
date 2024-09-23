@implementation GEOConfigStorageGetValueForKeyReply

- (BOOL)isValid
{
  return 1;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)GEOConfigStorageGetValueForKeyReply;
  -[GEOXPCReply encodeToXPCDictionary:](&v6, sel_encodeToXPCDictionary_, v4);
  if (self->_keyValue)
  {
    v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v5)
      xpc_dictionary_set_value(v4, "keyValue", v5);

  }
  xpc_dictionary_set_int64(v4, "keySource", self->_keySource);

}

- (GEOConfigStorageGetValueForKeyReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOConfigStorageGetValueForKeyReply *v7;
  void *v8;
  uint64_t v9;
  id keyValue;
  GEOConfigStorageGetValueForKeyReply *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOConfigStorageGetValueForKeyReply;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v13, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    xpc_dictionary_get_value(v6, "keyValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = _CFXPCCreateCFObjectFromXPCObject();
      keyValue = v7->_keyValue;
      v7->_keyValue = (id)v9;

    }
    v7->_keySource = xpc_dictionary_get_int64(v6, "keySource");
    v11 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keyValue, 0);
}

- (void)setKeySource:(int64_t)a3
{
  self->_keySource = a3;
}

- (void)setKeyValue:(id)a3
{
  objc_storeStrong(&self->_keyValue, a3);
}

- (id)keyValue
{
  return self->_keyValue;
}

- (int64_t)keySource
{
  return self->_keySource;
}

@end
