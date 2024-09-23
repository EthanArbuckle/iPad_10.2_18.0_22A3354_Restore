@implementation GEOOfflineVersionMetadataFetchReply

- (GEOOfflineVersionMetadataFetchReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOOfflineVersionMetadataFetchReply *v7;
  void *v8;
  GEOOfflineVersionMetadata *v9;
  GEOOfflineVersionMetadataFetchReply *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOOfflineVersionMetadataFetchReply;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v12, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    xpc_dictionary_get_dictionary(v6, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[GEOOfflineVersionMetadata initWithXPCDictionary:error:]([GEOOfflineVersionMetadata alloc], "initWithXPCDictionary:error:", v8, a4);
      if (v9)
        objc_storeStrong((id *)&v7->_metadata, v9);

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
  v6.super_class = (Class)GEOOfflineVersionMetadataFetchReply;
  -[GEOXPCReply encodeToXPCDictionary:](&v6, sel_encodeToXPCDictionary_, v4);
  if (self->_metadata)
  {
    empty = xpc_dictionary_create_empty();
    -[GEOOfflineVersionMetadata encodeToXPCDictionary:](self->_metadata, "encodeToXPCDictionary:", empty);
    xpc_dictionary_set_value(v4, "metadata", empty);

  }
}

- (BOOL)isValid
{
  return 1;
}

- (GEOOfflineVersionMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
