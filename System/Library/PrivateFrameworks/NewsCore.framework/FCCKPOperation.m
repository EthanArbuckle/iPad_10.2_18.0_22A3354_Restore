@implementation FCCKPOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationUUID, 0);
}

- (void)setOperationUUID:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_operationUUID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_7:

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
  v8.super_class = (Class)FCCKPOperation;
  -[FCCKPOperation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPOperation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *operationUUID;
  char has;
  void *v7;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  operationUUID = self->_operationUUID;
  if (operationUUID)
    objc_msgSend(v3, "setObject:forKey:", operationUUID, CFSTR("operationUUID"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_synchronousMode);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("synchronousMode"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v4;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_type);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("type"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_last);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("last"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPOperationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_operationUUID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(_BYTE *)(v5 + 21) = self->_synchronousMode;
    *(_BYTE *)(v5 + 24) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 16) = self->_type;
  *(_BYTE *)(v5 + 24) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(_BYTE *)(v5 + 20) = self->_last;
    *(_BYTE *)(v5 + 24) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *operationUUID;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  operationUUID = self->_operationUUID;
  if ((unint64_t)operationUUID | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](operationUUID, "isEqual:"))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_type != *((_DWORD *)v4 + 4))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0)
      goto LABEL_19;
    if (self->_synchronousMode)
    {
      if (!*((_BYTE *)v4 + 21))
        goto LABEL_19;
    }
    else if (*((_BYTE *)v4 + 21))
    {
      goto LABEL_19;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
    goto LABEL_19;
  }
  v6 = (*((_BYTE *)v4 + 24) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) != 0)
    {
      if (self->_last)
      {
        if (!*((_BYTE *)v4 + 20))
          goto LABEL_19;
      }
      else if (*((_BYTE *)v4 + 20))
      {
        goto LABEL_19;
      }
      v6 = 1;
      goto LABEL_20;
    }
LABEL_19:
    v6 = 0;
  }
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_operationUUID, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_type;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_synchronousMode;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_last;
  return v4 ^ v3 ^ v5 ^ v6;
}

@end
