@implementation HDCodableVerifiableData

- (void)setType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDataValue
{
  return self->_dataValue != 0;
}

- (BOOL)hasIssuerIdentifier
{
  return self->_issuerIdentifier != 0;
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
  v8.super_class = (Class)HDCodableVerifiableData;
  -[HDCodableVerifiableData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableVerifiableData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *dataValue;
  NSString *issuerIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_type);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("type"));

  }
  dataValue = self->_dataValue;
  if (dataValue)
    objc_msgSend(v3, "setObject:forKey:", dataValue, CFSTR("dataValue"));
  issuerIdentifier = self->_issuerIdentifier;
  if (issuerIdentifier)
    objc_msgSend(v3, "setObject:forKey:", issuerIdentifier, CFSTR("issuerIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableVerifiableDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_dataValue)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_issuerIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_type;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  v5 = v4;
  if (self->_dataValue)
  {
    objc_msgSend(v4, "setDataValue:");
    v4 = v5;
  }
  if (self->_issuerIdentifier)
  {
    objc_msgSend(v5, "setIssuerIdentifier:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_type;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_dataValue, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[NSString copyWithZone:](self->_issuerIdentifier, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *dataValue;
  NSString *issuerIdentifier;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_type != *((_QWORD *)v4 + 1))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  dataValue = self->_dataValue;
  if ((unint64_t)dataValue | *((_QWORD *)v4 + 2) && !-[NSData isEqual:](dataValue, "isEqual:"))
    goto LABEL_11;
  issuerIdentifier = self->_issuerIdentifier;
  if ((unint64_t)issuerIdentifier | *((_QWORD *)v4 + 3))
    v7 = -[NSString isEqual:](issuerIdentifier, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_dataValue, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_issuerIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((v4[4] & 1) != 0)
  {
    self->_type = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (v4[2])
  {
    -[HDCodableVerifiableData setDataValue:](self, "setDataValue:");
    v4 = v5;
  }
  if (v4[3])
  {
    -[HDCodableVerifiableData setIssuerIdentifier:](self, "setIssuerIdentifier:");
    v4 = v5;
  }

}

- (int64_t)type
{
  return self->_type;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(id)a3
{
  objc_storeStrong((id *)&self->_dataValue, a3);
}

- (NSString)issuerIdentifier
{
  return self->_issuerIdentifier;
}

- (void)setIssuerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_issuerIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issuerIdentifier, 0);
  objc_storeStrong((id *)&self->_dataValue, 0);
}

@end
