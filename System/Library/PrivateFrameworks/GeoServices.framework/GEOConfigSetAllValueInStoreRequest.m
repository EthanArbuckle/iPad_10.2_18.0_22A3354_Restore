@implementation GEOConfigSetAllValueInStoreRequest

+ (Class)replyClass
{
  return 0;
}

- (GEOConfigSetAllValueInStoreRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("defaults.setAllValuesInStore"), a3, a4, a5);
}

- (GEOConfigSetAllValueInStoreRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOConfigSetAllValueInStoreRequest *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *keyStringsAndValues;
  GEOConfigSetAllValueInStoreRequest *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOConfigSetAllValueInStoreRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v13, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    v7->_keyOptions = xpc_dictionary_get_int64(v6, "keyOptions");
    xpc_dictionary_get_value(v6, "keyStringsAndValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = _CFXPCCreateCFObjectFromXPCObject();
      keyStringsAndValues = v7->_keyStringsAndValues;
      v7->_keyStringsAndValues = (NSDictionary *)v9;

    }
    v11 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)GEOConfigSetAllValueInStoreRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v6, sel_encodeToXPCDictionary_, v4);
  xpc_dictionary_set_int64(v4, "keyOptions", self->_keyOptions);
  if (-[NSDictionary count](self->_keyStringsAndValues, "count"))
  {
    v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v5)
      xpc_dictionary_set_value(v4, "keyStringsAndValues", v5);

  }
}

- (BOOL)isValid
{
  return -[GEOConfigSetAllValueInStoreRequest keyOptions](self, "keyOptions") != 0;
}

- (unint64_t)reply
{
  return 0;
}

- (unint64_t)keyOptions
{
  return self->_keyOptions;
}

- (void)setKeyOptions:(unint64_t)a3
{
  self->_keyOptions = a3;
}

- (NSDictionary)keyStringsAndValues
{
  return self->_keyStringsAndValues;
}

- (void)setKeyStringsAndValues:(id)a3
{
  objc_storeStrong((id *)&self->_keyStringsAndValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyStringsAndValues, 0);
}

@end
