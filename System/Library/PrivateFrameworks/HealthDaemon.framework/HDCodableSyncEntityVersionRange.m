@implementation HDCodableSyncEntityVersionRange

- (BOOL)hasEntityIdentifier
{
  return self->_entityIdentifier != 0;
}

- (BOOL)hasVersionRange
{
  return self->_versionRange != 0;
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
  v8.super_class = (Class)HDCodableSyncEntityVersionRange;
  -[HDCodableSyncEntityVersionRange description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSyncEntityVersionRange dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HDCodableEntityIdentifier *entityIdentifier;
  void *v5;
  HDCodableSyncVersionRange *versionRange;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  entityIdentifier = self->_entityIdentifier;
  if (entityIdentifier)
  {
    -[HDCodableEntityIdentifier dictionaryRepresentation](entityIdentifier, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("entityIdentifier"));

  }
  versionRange = self->_versionRange;
  if (versionRange)
  {
    -[HDCodableSyncVersionRange dictionaryRepresentation](versionRange, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("versionRange"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSyncEntityVersionRangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_entityIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_versionRange)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_entityIdentifier)
  {
    objc_msgSend(v4, "setEntityIdentifier:");
    v4 = v5;
  }
  if (self->_versionRange)
  {
    objc_msgSend(v5, "setVersionRange:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableEntityIdentifier copyWithZone:](self->_entityIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[HDCodableSyncVersionRange copyWithZone:](self->_versionRange, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  HDCodableEntityIdentifier *entityIdentifier;
  HDCodableSyncVersionRange *versionRange;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((entityIdentifier = self->_entityIdentifier, !((unint64_t)entityIdentifier | v4[1]))
     || -[HDCodableEntityIdentifier isEqual:](entityIdentifier, "isEqual:")))
  {
    versionRange = self->_versionRange;
    if ((unint64_t)versionRange | v4[2])
      v7 = -[HDCodableSyncVersionRange isEqual:](versionRange, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[HDCodableEntityIdentifier hash](self->_entityIdentifier, "hash");
  return -[HDCodableSyncVersionRange hash](self->_versionRange, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HDCodableEntityIdentifier *entityIdentifier;
  uint64_t v6;
  HDCodableSyncVersionRange *versionRange;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  entityIdentifier = self->_entityIdentifier;
  v6 = v4[1];
  v9 = v4;
  if (entityIdentifier)
  {
    if (!v6)
      goto LABEL_7;
    -[HDCodableEntityIdentifier mergeFrom:](entityIdentifier, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HDCodableSyncEntityVersionRange setEntityIdentifier:](self, "setEntityIdentifier:");
  }
  v4 = v9;
LABEL_7:
  versionRange = self->_versionRange;
  v8 = v4[2];
  if (versionRange)
  {
    if (v8)
    {
      -[HDCodableSyncVersionRange mergeFrom:](versionRange, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[HDCodableSyncEntityVersionRange setVersionRange:](self, "setVersionRange:");
    goto LABEL_12;
  }

}

- (HDCodableEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (void)setEntityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_entityIdentifier, a3);
}

- (HDCodableSyncVersionRange)versionRange
{
  return self->_versionRange;
}

- (void)setVersionRange:(id)a3
{
  objc_storeStrong((id *)&self->_versionRange, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionRange, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end
