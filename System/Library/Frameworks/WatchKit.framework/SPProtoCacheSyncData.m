@implementation SPProtoCacheSyncData

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SPProtoCacheSyncData;
  -[SPProtoCacheSyncData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPProtoCacheSyncData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *cacheIdentifier;
  SPProtoCacheAssets *permanentCache;
  void *v7;
  SPProtoCacheAssets *transientCache;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  cacheIdentifier = self->_cacheIdentifier;
  if (cacheIdentifier)
    objc_msgSend(v3, "setObject:forKey:", cacheIdentifier, CFSTR("cacheIdentifier"));
  permanentCache = self->_permanentCache;
  if (permanentCache)
  {
    -[SPProtoCacheAssets dictionaryRepresentation](permanentCache, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("permanentCache"));

  }
  transientCache = self->_transientCache;
  if (transientCache)
  {
    -[SPProtoCacheAssets dictionaryRepresentation](transientCache, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("transientCache"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoCacheSyncDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  NSString *cacheIdentifier;
  id v5;

  cacheIdentifier = self->_cacheIdentifier;
  v5 = a3;
  objc_msgSend(v5, "setCacheIdentifier:", cacheIdentifier);
  objc_msgSend(v5, "setPermanentCache:", self->_permanentCache);
  objc_msgSend(v5, "setTransientCache:", self->_transientCache);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_cacheIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[SPProtoCacheAssets copyWithZone:](self->_permanentCache, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[SPProtoCacheAssets copyWithZone:](self->_transientCache, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *cacheIdentifier;
  SPProtoCacheAssets *permanentCache;
  SPProtoCacheAssets *transientCache;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((cacheIdentifier = self->_cacheIdentifier, !((unint64_t)cacheIdentifier | v4[1]))
     || -[NSString isEqual:](cacheIdentifier, "isEqual:"))
    && ((permanentCache = self->_permanentCache, !((unint64_t)permanentCache | v4[2]))
     || -[SPProtoCacheAssets isEqual:](permanentCache, "isEqual:")))
  {
    transientCache = self->_transientCache;
    if ((unint64_t)transientCache | v4[3])
      v8 = -[SPProtoCacheAssets isEqual:](transientCache, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_cacheIdentifier, "hash");
  v4 = -[SPProtoCacheAssets hash](self->_permanentCache, "hash") ^ v3;
  return v4 ^ -[SPProtoCacheAssets hash](self->_transientCache, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SPProtoCacheAssets *permanentCache;
  uint64_t v6;
  SPProtoCacheAssets *transientCache;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v9 = v4;
  if (v4[1])
  {
    -[SPProtoCacheSyncData setCacheIdentifier:](self, "setCacheIdentifier:");
    v4 = v9;
  }
  permanentCache = self->_permanentCache;
  v6 = v4[2];
  if (permanentCache)
  {
    if (!v6)
      goto LABEL_9;
    -[SPProtoCacheAssets mergeFrom:](permanentCache, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[SPProtoCacheSyncData setPermanentCache:](self, "setPermanentCache:");
  }
  v4 = v9;
LABEL_9:
  transientCache = self->_transientCache;
  v8 = v4[3];
  if (transientCache)
  {
    if (v8)
    {
      -[SPProtoCacheAssets mergeFrom:](transientCache, "mergeFrom:");
LABEL_14:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[SPProtoCacheSyncData setTransientCache:](self, "setTransientCache:");
    goto LABEL_14;
  }

}

- (NSString)cacheIdentifier
{
  return self->_cacheIdentifier;
}

- (void)setCacheIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cacheIdentifier, a3);
}

- (SPProtoCacheAssets)permanentCache
{
  return self->_permanentCache;
}

- (void)setPermanentCache:(id)a3
{
  objc_storeStrong((id *)&self->_permanentCache, a3);
}

- (SPProtoCacheAssets)transientCache
{
  return self->_transientCache;
}

- (void)setTransientCache:(id)a3
{
  objc_storeStrong((id *)&self->_transientCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientCache, 0);
  objc_storeStrong((id *)&self->_permanentCache, 0);
  objc_storeStrong((id *)&self->_cacheIdentifier, 0);
}

@end
