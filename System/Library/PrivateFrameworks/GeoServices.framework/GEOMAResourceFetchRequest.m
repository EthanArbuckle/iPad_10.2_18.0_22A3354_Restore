@implementation GEOMAResourceFetchRequest

- (unint64_t)reply
{
  return 1;
}

- (BOOL)isValid
{
  return 1;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  xpc_object_t v5;
  NSDictionary *extras;
  id v7;
  _QWORD v8[4];
  id v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMAResourceFetchRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v10, sel_encodeToXPCDictionary_, v4);
  xpc_dictionary_set_int64(v4, "type", self->_type);
  if (-[NSDictionary count](self->_extras, "count"))
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    extras = self->_extras;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__GEOMAResourceFetchRequest_encodeToXPCDictionary___block_invoke;
    v8[3] = &unk_1E1C07D90;
    v7 = v5;
    v9 = v7;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](extras, "enumerateKeysAndObjectsUsingBlock:", v8);
    if (xpc_dictionary_get_count(v7))
      xpc_dictionary_set_value(v4, "extras", v7);

  }
  xpc_dictionary_set_int64(v4, "options", self->_options);

}

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extras, 0);
}

- (GEOMAResourceFetchRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOMAResourceFetchRequest *v7;
  void *v8;
  size_t count;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  GEOMAResourceFetchRequest *v14;
  _QWORD applier[4];
  id v17;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOMAResourceFetchRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v18, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    v7->_type = xpc_dictionary_get_int64(v6, "type");
    xpc_dictionary_get_dictionary(v6, "extras");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    count = xpc_dictionary_get_count(v8);
    if (count)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", count);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      applier[0] = MEMORY[0x1E0C809B0];
      applier[1] = 3221225472;
      applier[2] = __57__GEOMAResourceFetchRequest_initWithXPCDictionary_error___block_invoke;
      applier[3] = &unk_1E1C11C98;
      v11 = v10;
      v17 = v11;
      xpc_dictionary_apply(v8, applier);
      v12 = objc_msgSend(v11, "count");
      if (v12)
        v13 = (void *)objc_msgSend(v11, "copy");
      else
        v13 = 0;
      objc_storeStrong((id *)&v7->_extras, v13);
      if (v12)

    }
    v7->_options = xpc_dictionary_get_int64(v6, "options");
    v14 = v7;
  }

  return v7;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSDictionary)extras
{
  return self->_extras;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)setExtras:(id)a3
{
  objc_storeStrong((id *)&self->_extras, a3);
}

- (GEOMAResourceFetchRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("MAResources.fetch"), a3, a4, a5);
}

uint64_t __57__GEOMAResourceFetchRequest_initWithXPCDictionary_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  const char *string_ptr;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(v5, "stringWithUTF8String:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  string_ptr = xpc_string_get_string_ptr(v6);

  if (string_ptr)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string_ptr);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v9, v7);

  }
  return 1;
}

void __51__GEOMAResourceFetchRequest_encodeToXPCDictionary___block_invoke(uint64_t a1, id a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  const char *v7;
  id v8;
  const char *v9;

  v4 = *(void **)(a1 + 32);
  v5 = objc_retainAutorelease(a2);
  v6 = a3;
  v7 = (const char *)objc_msgSend(v5, "UTF8String");
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  xpc_dictionary_set_string(v4, v7, v9);
}

- (unint64_t)options
{
  return self->_options;
}

@end
