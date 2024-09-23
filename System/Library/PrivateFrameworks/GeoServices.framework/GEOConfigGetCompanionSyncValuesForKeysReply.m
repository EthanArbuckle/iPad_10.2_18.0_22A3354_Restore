@implementation GEOConfigGetCompanionSyncValuesForKeysReply

- (GEOConfigGetCompanionSyncValuesForKeysReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOConfigGetCompanionSyncValuesForKeysReply *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *keyStringsAndValues;
  GEOConfigGetCompanionSyncValuesForKeysReply *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOConfigGetCompanionSyncValuesForKeysReply;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v13, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
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
  v6.super_class = (Class)GEOConfigGetCompanionSyncValuesForKeysReply;
  -[GEOXPCReply encodeToXPCDictionary:](&v6, sel_encodeToXPCDictionary_, v4);
  if (-[NSDictionary count](self->_keyStringsAndValues, "count"))
  {
    v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v5)
      xpc_dictionary_set_value(v4, "keyStringsAndValues", v5);

  }
}

- (BOOL)isValid
{
  return 1;
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
