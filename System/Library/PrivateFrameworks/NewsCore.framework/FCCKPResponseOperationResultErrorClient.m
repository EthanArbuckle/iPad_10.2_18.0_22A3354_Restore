@implementation FCCKPResponseOperationResultErrorClient

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)FCCKPResponseOperationResultErrorClient;
  -[FCCKPResponseOperationResultErrorClient description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPResponseOperationResultErrorClient dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  FCCKPOplockFailure *oplockFailure;
  void *v6;
  FCCKPUniqueFieldFailure *uniqueFieldFailure;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_type);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("type"));

  }
  oplockFailure = self->_oplockFailure;
  if (oplockFailure)
  {
    -[FCCKPOplockFailure dictionaryRepresentation](oplockFailure, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("oplockFailure"));

  }
  uniqueFieldFailure = self->_uniqueFieldFailure;
  if (uniqueFieldFailure)
  {
    -[FCCKPUniqueFieldFailure dictionaryRepresentation](uniqueFieldFailure, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("uniqueFieldFailure"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPResponseOperationResultErrorClientReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_oplockFailure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_uniqueFieldFailure)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_type;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[FCCKPOplockFailure copyWithZone:](self->_oplockFailure, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  v9 = -[FCCKPUniqueFieldFailure copyWithZone:](self->_uniqueFieldFailure, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  FCCKPOplockFailure *oplockFailure;
  FCCKPUniqueFieldFailure *uniqueFieldFailure;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_type != *((_DWORD *)v4 + 4))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  oplockFailure = self->_oplockFailure;
  if ((unint64_t)oplockFailure | *((_QWORD *)v4 + 1)
    && !-[FCCKPOplockFailure isEqual:](oplockFailure, "isEqual:"))
  {
    goto LABEL_11;
  }
  uniqueFieldFailure = self->_uniqueFieldFailure;
  if ((unint64_t)uniqueFieldFailure | *((_QWORD *)v4 + 3))
    v7 = -[FCCKPUniqueFieldFailure isEqual:](uniqueFieldFailure, "isEqual:");
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
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[FCCKPOplockFailure hash](self->_oplockFailure, "hash") ^ v3;
  return v4 ^ -[FCCKPUniqueFieldFailure hash](self->_uniqueFieldFailure, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueFieldFailure, 0);
  objc_storeStrong((id *)&self->_oplockFailure, 0);
}

@end
