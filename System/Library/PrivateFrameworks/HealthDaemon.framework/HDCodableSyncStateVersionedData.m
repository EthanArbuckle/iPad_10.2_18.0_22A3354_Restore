@implementation HDCodableSyncStateVersionedData

- (void)setVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasOrigin
{
  return self->_origin != 0;
}

- (BOOL)hasObjectData
{
  return self->_objectData != 0;
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
  v8.super_class = (Class)HDCodableSyncStateVersionedData;
  -[HDCodableSyncStateVersionedData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSyncStateVersionedData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  HDCodableSyncStateOrigin *origin;
  void *v6;
  NSData *objectData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_version);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  origin = self->_origin;
  if (origin)
  {
    -[HDCodableSyncStateOrigin dictionaryRepresentation](origin, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("origin"));

  }
  objectData = self->_objectData;
  if (objectData)
    objc_msgSend(v3, "setObject:forKey:", objectData, CFSTR("objectData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSyncStateVersionedDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_origin)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_objectData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_version;
    *((_BYTE *)v4 + 28) |= 1u;
  }
  v5 = v4;
  if (self->_origin)
  {
    objc_msgSend(v4, "setOrigin:");
    v4 = v5;
  }
  if (self->_objectData)
  {
    objc_msgSend(v5, "setObjectData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_version;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v7 = -[HDCodableSyncStateOrigin copyWithZone:](self->_origin, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[NSData copyWithZone:](self->_objectData, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableSyncStateOrigin *origin;
  NSData *objectData;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_version != *((_DWORD *)v4 + 6))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  origin = self->_origin;
  if ((unint64_t)origin | *((_QWORD *)v4 + 2) && !-[HDCodableSyncStateOrigin isEqual:](origin, "isEqual:"))
    goto LABEL_11;
  objectData = self->_objectData;
  if ((unint64_t)objectData | *((_QWORD *)v4 + 1))
    v7 = -[NSData isEqual:](objectData, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_version;
  else
    v3 = 0;
  v4 = -[HDCodableSyncStateOrigin hash](self->_origin, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_objectData, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  HDCodableSyncStateOrigin *origin;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_version = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  origin = self->_origin;
  v7 = v5[2];
  v8 = v5;
  if (origin)
  {
    if (!v7)
      goto LABEL_9;
    -[HDCodableSyncStateOrigin mergeFrom:](origin, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[HDCodableSyncStateVersionedData setOrigin:](self, "setOrigin:");
  }
  v5 = v8;
LABEL_9:
  if (v5[1])
  {
    -[HDCodableSyncStateVersionedData setObjectData:](self, "setObjectData:");
    v5 = v8;
  }

}

- (int)version
{
  return self->_version;
}

- (HDCodableSyncStateOrigin)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_origin, a3);
}

- (NSData)objectData
{
  return self->_objectData;
}

- (void)setObjectData:(id)a3
{
  objc_storeStrong((id *)&self->_objectData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_objectData, 0);
}

@end
