@implementation GEOConfigAddChangeListenerRequest

void __59__GEOConfigAddChangeListenerRequest_encodeToXPCDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int64_t v6;
  void *v7;
  id v8;
  const char *v9;

  v5 = a2;
  v6 = objc_msgSend(a3, "longLongValue");
  v7 = *(void **)(a1 + 32);
  v8 = objc_retainAutorelease(v5);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  xpc_dictionary_set_int64(v7, v9, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysAndSources, 0);
}

- (void)setKeysAndSources:(id)a3
{
  objc_storeStrong((id *)&self->_keysAndSources, a3);
}

- (GEOConfigAddChangeListenerRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("defaults.addChangeListenerFor"), a3, a4, a5);
}

- (unint64_t)reply
{
  return 0;
}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  -[GEOConfigAddChangeListenerRequest keysAndSources](self, "keysAndSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSDictionary)keysAndSources
{
  return self->_keysAndSources;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  xpc_object_t v5;
  NSDictionary *keysAndSources;
  id v7;
  _QWORD v8[4];
  id v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOConfigAddChangeListenerRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v10, sel_encodeToXPCDictionary_, v4);
  if (-[NSDictionary count](self->_keysAndSources, "count"))
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    keysAndSources = self->_keysAndSources;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__GEOConfigAddChangeListenerRequest_encodeToXPCDictionary___block_invoke;
    v8[3] = &unk_1E1C08930;
    v7 = v5;
    v9 = v7;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](keysAndSources, "enumerateKeysAndObjectsUsingBlock:", v8);
    if (xpc_dictionary_get_count(v7))
      xpc_dictionary_set_value(v4, "kands", v7);

  }
}

- (GEOConfigAddChangeListenerRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOConfigAddChangeListenerRequest *v7;
  void *v8;
  size_t count;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  GEOConfigAddChangeListenerRequest *v14;
  _QWORD applier[4];
  id v17;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOConfigAddChangeListenerRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v18, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    xpc_dictionary_get_dictionary(v6, "kands");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    count = xpc_dictionary_get_count(v8);
    if (count)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", count);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      applier[0] = MEMORY[0x1E0C809B0];
      applier[1] = 3221225472;
      applier[2] = __65__GEOConfigAddChangeListenerRequest_initWithXPCDictionary_error___block_invoke;
      applier[3] = &unk_1E1C11C98;
      v11 = v10;
      v17 = v11;
      xpc_dictionary_apply(v8, applier);
      v12 = objc_msgSend(v11, "count");
      if (v12)
        v13 = (void *)objc_msgSend(v11, "copy");
      else
        v13 = (void *)MEMORY[0x1E0C9AA70];
      objc_storeStrong((id *)&v7->_keysAndSources, v13);
      if (v12)

    }
    v14 = v7;
  }

  return v7;
}

uint64_t __65__GEOConfigAddChangeListenerRequest_initWithXPCDictionary_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  int64_t value;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(v5, "stringWithUTF8String:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  value = xpc_int64_get_value(v6);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", value);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, v7);

  return 1;
}

+ (Class)replyClass
{
  return 0;
}

@end
