@implementation FCCKPRecordReference

- (int)type
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_type;
  else
    return 1;
}

- (void)setType:(int)a3
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

- (BOOL)hasRecordIdentifier
{
  return self->_recordIdentifier != 0;
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
  v8.super_class = (Class)FCCKPRecordReference;
  -[FCCKPRecordReference description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPRecordReference dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  FCCKPRecordIdentifier *recordIdentifier;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_type);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("type"));

  }
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
  {
    -[FCCKPRecordIdentifier dictionaryRepresentation](recordIdentifier, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("recordIdentifier"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPRecordReferenceReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_recordIdentifier)
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_type;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v7 = -[FCCKPRecordIdentifier copyWithZone:](self->_recordIdentifier, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  FCCKPRecordIdentifier *recordIdentifier;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_type != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  recordIdentifier = self->_recordIdentifier;
  if ((unint64_t)recordIdentifier | *((_QWORD *)v4 + 1))
    v6 = -[FCCKPRecordIdentifier isEqual:](recordIdentifier, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_type;
  else
    v2 = 0;
  return -[FCCKPRecordIdentifier hash](self->_recordIdentifier, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  FCCKPRecordIdentifier *recordIdentifier;
  void *v7;
  _QWORD *v8;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    self->_type = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  recordIdentifier = self->_recordIdentifier;
  v7 = (void *)v5[1];
  if (recordIdentifier)
  {
    if (v7)
    {
      v8 = v5;
      -[FCCKPRecordIdentifier mergeFrom:]((uint64_t)recordIdentifier, v7);
LABEL_8:
      v5 = v8;
    }
  }
  else if (v7)
  {
    v8 = v5;
    -[FCCKPRecordReference setRecordIdentifier:](self, "setRecordIdentifier:", v7);
    goto LABEL_8;
  }

}

- (FCCKPRecordIdentifier)recordIdentifier
{
  return self->_recordIdentifier;
}

- (void)setRecordIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_recordIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
}

@end
