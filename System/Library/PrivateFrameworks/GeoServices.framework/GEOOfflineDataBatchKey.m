@implementation GEOOfflineDataBatchKey

- (GEOOfflineDataBatchKey)initWithLayer:(unsigned int)a3 key:(id)a4
{
  id v6;
  GEOOfflineDataBatchKey *v7;
  GEOOfflineDataBatchKey *v8;
  uint64_t v9;
  NSData *key;
  GEOOfflineDataBatchKey *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEOOfflineDataBatchKey;
  v7 = -[GEOOfflineDataBatchKey init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_layer = a3;
    v9 = objc_msgSend(v6, "copy");
    key = v8->_key;
    v8->_key = (NSData *)v9;

    v11 = v8;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t layer;

  layer = self->_layer;
  return -[NSData hash](self->_key, "hash") ^ layer;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unsigned int layer;
  NSData *key;
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
      key = self->_key;
      objc_msgSend(v5, "key");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NSData isEqualToData:](key, "isEqualToData:", v8);

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

- (id)description
{
  void *v3;
  void *v4;

  -[NSData base64EncodedStringWithOptions:](self->_key, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ layer: %llu, key: %@ }"), self->_layer, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unsigned)layer
{
  return self->_layer;
}

- (NSData)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
