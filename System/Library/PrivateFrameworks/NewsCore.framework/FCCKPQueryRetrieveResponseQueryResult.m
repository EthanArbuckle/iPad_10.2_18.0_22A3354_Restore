@implementation FCCKPQueryRetrieveResponseQueryResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_etag, 0);
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
  v8.super_class = (Class)FCCKPQueryRetrieveResponseQueryResult;
  -[FCCKPQueryRetrieveResponseQueryResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPQueryRetrieveResponseQueryResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  FCCKPRecordIdentifier *identifier;
  void *v5;
  NSString *etag;
  void *v7;
  FCCKPRecord *record;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  if (identifier)
  {
    -[FCCKPRecordIdentifier dictionaryRepresentation](identifier, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("identifier"));

  }
  etag = self->_etag;
  if (etag)
    objc_msgSend(v3, "setObject:forKey:", etag, CFSTR("etag"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_type);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("type"));

  }
  record = self->_record;
  if (record)
  {
    -[FCCKPRecord dictionaryRepresentation](record, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("record"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPQueryRetrieveResponseQueryResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_etag)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_record)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[FCCKPRecordIdentifier copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_etag, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_type;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v10 = -[FCCKPRecord copyWithZone:](self->_record, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  FCCKPRecordIdentifier *identifier;
  NSString *etag;
  FCCKPRecord *record;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 2))
  {
    if (!-[FCCKPRecordIdentifier isEqual:](identifier, "isEqual:"))
      goto LABEL_13;
  }
  etag = self->_etag;
  if ((unint64_t)etag | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](etag, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_type != *((_DWORD *)v4 + 8))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  record = self->_record;
  if ((unint64_t)record | *((_QWORD *)v4 + 3))
    v8 = -[FCCKPRecord isEqual:](record, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[FCCKPRecordIdentifier hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_etag, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_type;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[FCCKPRecord hash](self->_record, "hash");
}

@end
