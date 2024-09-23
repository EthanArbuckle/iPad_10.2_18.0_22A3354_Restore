@implementation GEOTileEnumeration

- (GEOTileEnumeration)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOTileEnumeration *v7;
  void *v8;
  GEOTileData *v9;
  const void *data;
  void *v11;
  uint64_t v12;
  NSData *key;
  const char *string;
  uint64_t v15;
  NSString *eTag;
  GEOTileEnumeration *v17;
  size_t length;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GEOTileEnumeration;
  v7 = -[GEOTileEnumeration init](&v20, sel_init);
  if (v7)
  {
    xpc_dictionary_get_dictionary(v6, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[GEOTileData initWithXPCDictionary:error:]([GEOTileData alloc], "initWithXPCDictionary:error:", v8, a4);
      if (v9)
        objc_storeStrong((id *)&v7->_data, v9);

    }
    length = 0;
    data = xpc_dictionary_get_data(v6, "key", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, a4);
      v12 = objc_claimAutoreleasedReturnValue();
      key = v7->_key;
      v7->_key = (NSData *)v12;

    }
    v7->_current = xpc_dictionary_get_BOOL(v6, "current");
    string = xpc_dictionary_get_string(v6, "eTag");
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v15 = objc_claimAutoreleasedReturnValue();
      eTag = v7->_eTag;
      v7->_eTag = (NSString *)v15;

    }
    v7->_originalLoadReason = xpc_dictionary_get_int64(v6, "originalLoadReason");
    v7->_age = xpc_dictionary_get_double(v6, "age");
    v17 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  xpc_object_t empty;
  NSData *key;
  id v6;
  NSString *eTag;
  const char *v8;
  xpc_object_t xdict;

  xdict = a3;
  if (self->_data)
  {
    empty = xpc_dictionary_create_empty();
    -[GEOTileData encodeToXPCDictionary:](self->_data, "encodeToXPCDictionary:", empty);
    xpc_dictionary_set_value(xdict, "data", empty);

  }
  key = self->_key;
  if (key)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", key, 1, 0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(xdict, "key", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

  }
  xpc_dictionary_set_BOOL(xdict, "current", self->_current);
  eTag = self->_eTag;
  if (eTag)
  {
    v8 = -[NSString UTF8String](eTag, "UTF8String");
    if (v8)
      xpc_dictionary_set_string(xdict, "eTag", v8);
  }
  xpc_dictionary_set_int64(xdict, "originalLoadReason", self->_originalLoadReason);
  xpc_dictionary_set_double(xdict, "age", self->_age);

}

- (GEOTileData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (BOOL)current
{
  return self->_current;
}

- (void)setCurrent:(BOOL)a3
{
  self->_current = a3;
}

- (NSString)eTag
{
  return self->_eTag;
}

- (void)setETag:(id)a3
{
  objc_storeStrong((id *)&self->_eTag, a3);
}

- (unsigned)originalLoadReason
{
  return self->_originalLoadReason;
}

- (void)setOriginalLoadReason:(unsigned __int8)a3
{
  self->_originalLoadReason = a3;
}

- (double)age
{
  return self->_age;
}

- (void)setAge:(double)a3
{
  self->_age = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eTag, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
