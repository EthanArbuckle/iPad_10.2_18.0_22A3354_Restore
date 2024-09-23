@implementation HDCodableSyncIdentity

- (BOOL)hasHardwareIdentifier
{
  return self->_hardwareIdentifier != 0;
}

- (BOOL)hasDatabaseIdentifier
{
  return self->_databaseIdentifier != 0;
}

- (BOOL)hasInstanceDiscriminator
{
  return self->_instanceDiscriminator != 0;
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
  v8.super_class = (Class)HDCodableSyncIdentity;
  -[HDCodableSyncIdentity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSyncIdentity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *hardwareIdentifier;
  NSData *databaseIdentifier;
  NSString *instanceDiscriminator;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  hardwareIdentifier = self->_hardwareIdentifier;
  if (hardwareIdentifier)
    objc_msgSend(v3, "setObject:forKey:", hardwareIdentifier, CFSTR("hardwareIdentifier"));
  databaseIdentifier = self->_databaseIdentifier;
  if (databaseIdentifier)
    objc_msgSend(v4, "setObject:forKey:", databaseIdentifier, CFSTR("databaseIdentifier"));
  instanceDiscriminator = self->_instanceDiscriminator;
  if (instanceDiscriminator)
    objc_msgSend(v4, "setObject:forKey:", instanceDiscriminator, CFSTR("instanceDiscriminator"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSyncIdentityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hardwareIdentifier)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_databaseIdentifier)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_instanceDiscriminator)
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
  if (self->_hardwareIdentifier)
  {
    objc_msgSend(v4, "setHardwareIdentifier:");
    v4 = v5;
  }
  if (self->_databaseIdentifier)
  {
    objc_msgSend(v5, "setDatabaseIdentifier:");
    v4 = v5;
  }
  if (self->_instanceDiscriminator)
  {
    objc_msgSend(v5, "setInstanceDiscriminator:");
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
  v6 = -[NSData copyWithZone:](self->_hardwareIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_databaseIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_instanceDiscriminator, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *hardwareIdentifier;
  NSData *databaseIdentifier;
  NSString *instanceDiscriminator;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((hardwareIdentifier = self->_hardwareIdentifier, !((unint64_t)hardwareIdentifier | v4[2]))
     || -[NSData isEqual:](hardwareIdentifier, "isEqual:"))
    && ((databaseIdentifier = self->_databaseIdentifier, !((unint64_t)databaseIdentifier | v4[1]))
     || -[NSData isEqual:](databaseIdentifier, "isEqual:")))
  {
    instanceDiscriminator = self->_instanceDiscriminator;
    if ((unint64_t)instanceDiscriminator | v4[3])
      v8 = -[NSString isEqual:](instanceDiscriminator, "isEqual:");
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
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSData hash](self->_hardwareIdentifier, "hash");
  v4 = -[NSData hash](self->_databaseIdentifier, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_instanceDiscriminator, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[2])
    -[HDCodableSyncIdentity setHardwareIdentifier:](self, "setHardwareIdentifier:");
  if (v4[1])
    -[HDCodableSyncIdentity setDatabaseIdentifier:](self, "setDatabaseIdentifier:");
  if (v4[3])
    -[HDCodableSyncIdentity setInstanceDiscriminator:](self, "setInstanceDiscriminator:");

}

- (NSData)hardwareIdentifier
{
  return self->_hardwareIdentifier;
}

- (void)setHardwareIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareIdentifier, a3);
}

- (NSData)databaseIdentifier
{
  return self->_databaseIdentifier;
}

- (void)setDatabaseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_databaseIdentifier, a3);
}

- (NSString)instanceDiscriminator
{
  return self->_instanceDiscriminator;
}

- (void)setInstanceDiscriminator:(id)a3
{
  objc_storeStrong((id *)&self->_instanceDiscriminator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceDiscriminator, 0);
  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);
  objc_storeStrong((id *)&self->_databaseIdentifier, 0);
}

@end
