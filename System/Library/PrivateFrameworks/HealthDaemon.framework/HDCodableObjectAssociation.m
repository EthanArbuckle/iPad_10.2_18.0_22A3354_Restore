@implementation HDCodableObjectAssociation

- (HDCodableObjectAssociation)initWithAssociationUUID:(id)a3
{
  id v4;
  HDCodableObjectAssociation *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableObjectAssociation;
  v5 = -[HDCodableObjectAssociation init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "hk_dataForUUIDBytes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableObjectAssociation setAssociationUuid:](v5, "setAssociationUuid:", v6);

  }
  return v5;
}

- (void)setAssociationUuid:(id)a3
{
  objc_storeStrong((id *)&self->_associationUuid, a3);
}

- (void)setObjectUuids:(id)a3
{
  objc_storeStrong((id *)&self->_objectUuids, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_associationUuid)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_objectUuids)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_objectUuids, 0);
  objc_storeStrong((id *)&self->_associationUuid, 0);
}

- (id)decodedAssociationUUID
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", self->_associationUuid);
}

- (BOOL)hasAssociationUuid
{
  return self->_associationUuid != 0;
}

- (BOOL)hasObjectUuids
{
  return self->_objectUuids != 0;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
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
  v8.super_class = (Class)HDCodableObjectAssociation;
  -[HDCodableObjectAssociation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableObjectAssociation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *associationUuid;
  NSData *objectUuids;
  HDCodableSyncIdentity *syncIdentity;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  associationUuid = self->_associationUuid;
  if (associationUuid)
    objc_msgSend(v3, "setObject:forKey:", associationUuid, CFSTR("associationUuid"));
  objectUuids = self->_objectUuids;
  if (objectUuids)
    objc_msgSend(v4, "setObject:forKey:", objectUuids, CFSTR("objectUuids"));
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("syncIdentity"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableObjectAssociationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_associationUuid)
  {
    objc_msgSend(v4, "setAssociationUuid:");
    v4 = v5;
  }
  if (self->_objectUuids)
  {
    objc_msgSend(v5, "setObjectUuids:");
    v4 = v5;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v5, "setSyncIdentity:");
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
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_associationUuid, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_objectUuids, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *associationUuid;
  NSData *objectUuids;
  HDCodableSyncIdentity *syncIdentity;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((associationUuid = self->_associationUuid, !((unint64_t)associationUuid | v4[1]))
     || -[NSData isEqual:](associationUuid, "isEqual:"))
    && ((objectUuids = self->_objectUuids, !((unint64_t)objectUuids | v4[2]))
     || -[NSData isEqual:](objectUuids, "isEqual:")))
  {
    syncIdentity = self->_syncIdentity;
    if ((unint64_t)syncIdentity | v4[3])
      v8 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
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

  v3 = -[NSData hash](self->_associationUuid, "hash");
  v4 = -[NSData hash](self->_objectUuids, "hash") ^ v3;
  return v4 ^ -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HDCodableSyncIdentity *syncIdentity;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[1])
  {
    -[HDCodableObjectAssociation setAssociationUuid:](self, "setAssociationUuid:");
    v4 = v7;
  }
  if (v4[2])
  {
    -[HDCodableObjectAssociation setObjectUuids:](self, "setObjectUuids:");
    v4 = v7;
  }
  syncIdentity = self->_syncIdentity;
  v6 = v4[3];
  if (syncIdentity)
  {
    if (v6)
    {
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
LABEL_10:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[HDCodableObjectAssociation setSyncIdentity:](self, "setSyncIdentity:");
    goto LABEL_10;
  }

}

- (NSData)associationUuid
{
  return self->_associationUuid;
}

- (NSData)objectUuids
{
  return self->_objectUuids;
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentity, a3);
}

@end
