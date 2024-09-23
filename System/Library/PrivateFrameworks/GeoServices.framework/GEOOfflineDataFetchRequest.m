@implementation GEOOfflineDataFetchRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOOfflineDataFetchRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("offlinedata.fetch"), a3, a4, a5);
}

- (GEOOfflineDataFetchRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOOfflineDataFetchRequest *v7;
  void *v8;
  GEOOfflineDataKey *v9;
  GEOOfflineDataFetchRequest *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOOfflineDataFetchRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v12, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    xpc_dictionary_get_dictionary(v6, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[GEOOfflineDataKey initWithXPCDictionary:error:]([GEOOfflineDataKey alloc], "initWithXPCDictionary:error:", v8, a4);
      if (v9)
        objc_storeStrong((id *)&v7->_key, v9);

    }
    v10 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  xpc_object_t empty;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)GEOOfflineDataFetchRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v6, sel_encodeToXPCDictionary_, v4);
  if (self->_key)
  {
    empty = xpc_dictionary_create_empty();
    -[GEOOfflineDataKey encodeToXPCDictionary:](self->_key, "encodeToXPCDictionary:", empty);
    xpc_dictionary_set_value(v4, "key", empty);

  }
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- (GEOOfflineDataKey)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
