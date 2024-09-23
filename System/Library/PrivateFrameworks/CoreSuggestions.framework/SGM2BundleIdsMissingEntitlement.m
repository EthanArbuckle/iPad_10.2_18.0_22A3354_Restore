@implementation SGM2BundleIdsMissingEntitlement

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("BundleIdsMissingEntitlement");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (BOOL)hasEntitlement
{
  return self->_entitlement != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SGM2BundleIdsMissingEntitlement;
  -[SGM2BundleIdsMissingEntitlement description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGM2BundleIdsMissingEntitlement dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *key;
  NSString *bundleId;
  NSString *entitlement;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v4, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  entitlement = self->_entitlement;
  if (entitlement)
    objc_msgSend(v4, "setObject:forKey:", entitlement, CFSTR("entitlement"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SGM2BundleIdsMissingEntitlementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_entitlement)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    v4 = v5;
  }
  if (self->_bundleId)
  {
    objc_msgSend(v5, "setBundleId:");
    v4 = v5;
  }
  if (self->_entitlement)
  {
    objc_msgSend(v5, "setEntitlement:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_entitlement, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *key;
  NSString *bundleId;
  NSString *entitlement;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((key = self->_key, !((unint64_t)key | v4[3])) || -[NSString isEqual:](key, "isEqual:"))
    && ((bundleId = self->_bundleId, !((unint64_t)bundleId | v4[1]))
     || -[NSString isEqual:](bundleId, "isEqual:")))
  {
    entitlement = self->_entitlement;
    if ((unint64_t)entitlement | v4[2])
      v8 = -[NSString isEqual:](entitlement, "isEqual:");
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
  NSUInteger v4;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_bundleId, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_entitlement, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[3])
    -[SGM2BundleIdsMissingEntitlement setKey:](self, "setKey:");
  if (v4[1])
    -[SGM2BundleIdsMissingEntitlement setBundleId:](self, "setBundleId:");
  if (v4[2])
    -[SGM2BundleIdsMissingEntitlement setEntitlement:](self, "setEntitlement:");

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (NSString)entitlement
{
  return self->_entitlement;
}

- (void)setEntitlement:(id)a3
{
  objc_storeStrong((id *)&self->_entitlement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_entitlement, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
