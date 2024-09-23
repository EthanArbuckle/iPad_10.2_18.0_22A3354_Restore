@implementation GEOOfflineDataKey

- (GEOOfflineDataKey)initWithLayer:(unsigned int)a3 serviceKey:(id)a4
{
  id v6;
  GEOOfflineDataKey *v7;
  GEOOfflineDataKey *v8;
  uint64_t v9;
  NSData *serviceKey;
  GEOOfflineDataKey *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEOOfflineDataKey;
  v7 = -[GEOOfflineDataKey init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_layer = a3;
    v9 = objc_msgSend(v6, "copy");
    serviceKey = v8->_serviceKey;
    v8->_serviceKey = (NSData *)v9;

    v11 = v8;
  }

  return v8;
}

- (GEOOfflineDataKey)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  const void *bytes_ptr;
  NSData *v10;
  NSData *serviceKey;
  GEOOfflineDataKey *v12;
  objc_super v14;

  v5 = a3;
  xpc_dictionary_get_value(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v5, "service_key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (MEMORY[0x18D765A14](v6) == MEMORY[0x1E0C81398] ? (v8 = v7 == 0) : (v8 = 1),
        !v8
     && MEMORY[0x18D765A14](v7) == MEMORY[0x1E0C812E8]
     && (v14.receiver = self,
         v14.super_class = (Class)GEOOfflineDataKey,
         (self = -[GEOOfflineDataKey init](&v14, sel_init)) != 0)))
  {
    self->_layer = xpc_uint64_get_value(v6);
    bytes_ptr = xpc_data_get_bytes_ptr(v7);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", bytes_ptr, xpc_data_get_length(v7));
    v10 = (NSData *)objc_claimAutoreleasedReturnValue();
    serviceKey = self->_serviceKey;
    self->_serviceKey = v10;

    self = self;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeToXPCDictionary:(id)a3
{
  uint64_t layer;
  xpc_object_t xdict;

  layer = self->_layer;
  xdict = a3;
  xpc_dictionary_set_uint64(xdict, "layer", layer);
  xpc_dictionary_set_data(xdict, "service_key", -[NSData bytes](self->_serviceKey, "bytes"), -[NSData length](self->_serviceKey, "length"));

}

- (unint64_t)hash
{
  uint64_t layer;

  layer = self->_layer;
  return -[NSData hash](self->_serviceKey, "hash") ^ layer;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unsigned int layer;
  NSData *serviceKey;
  void *v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    layer = self->_layer;
    if (layer == objc_msgSend(v5, "layer"))
    {
      serviceKey = self->_serviceKey;
      objc_msgSend(v5, "serviceKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NSData isEqualToData:](serviceKey, "isEqualToData:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  void *v4;

  -[NSData base64EncodedStringWithOptions:](self->_serviceKey, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ layer: %llu, serviceKey: %@ }"), self->_layer, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (unsigned)layer
{
  return self->_layer;
}

- (NSData)serviceKey
{
  return self->_serviceKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceKey, 0);
}

@end
