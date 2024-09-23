@implementation _MRRequestDetailsProtobuf

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

- (BOOL)hasReason
{
  return self->_reason != 0;
}

- (void)setQos:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_qos = a3;
}

- (void)setHasQos:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasQos
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setStartDate:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setUserInitiated:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_userInitiated = a3;
}

- (void)setHasUserInitiated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUserInitiated
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)_MRRequestDetailsProtobuf;
  -[_MRRequestDetailsProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRRequestDetailsProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  NSString *requestID;
  NSString *reason;
  char has;
  void *v9;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  requestID = self->_requestID;
  if (requestID)
    objc_msgSend(v4, "setObject:forKey:", requestID, CFSTR("requestID"));
  reason = self->_reason;
  if (reason)
    objc_msgSend(v4, "setObject:forKey:", reason, CFSTR("reason"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_startDate);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("startDate"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v4;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_qos);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("qos"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_13;
LABEL_9:
  if ((has & 4) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userInitiated);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("userInitiated"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRRequestDetailsProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_requestID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_reason)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
LABEL_13:
    PBDataWriterWriteUint64Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_13;
LABEL_9:
  if ((has & 4) != 0)
  {
LABEL_10:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_11:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v6;
  }
  if (self->_requestID)
  {
    objc_msgSend(v6, "setRequestID:");
    v4 = v6;
  }
  if (self->_reason)
  {
    objc_msgSend(v6, "setReason:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
LABEL_13:
    *((_QWORD *)v4 + 1) = self->_startDate;
    *((_BYTE *)v4 + 52) |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  *((_DWORD *)v4 + 6) = self->_qos;
  *((_BYTE *)v4 + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_13;
LABEL_9:
  if ((has & 4) != 0)
  {
LABEL_10:
    *((_BYTE *)v4 + 48) = self->_userInitiated;
    *((_BYTE *)v4 + 52) |= 4u;
  }
LABEL_11:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_requestID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSString copyWithZone:](self->_reason, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    *(_QWORD *)(v5 + 8) = self->_startDate;
    *(_BYTE *)(v5 + 52) |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 24) = self->_qos;
  *(_BYTE *)(v5 + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_BYTE *)(v5 + 48) = self->_userInitiated;
    *(_BYTE *)(v5 + 52) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  NSString *requestID;
  NSString *reason;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_20;
  }
  requestID = self->_requestID;
  if ((unint64_t)requestID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](requestID, "isEqual:"))
      goto LABEL_20;
  }
  reason = self->_reason;
  if ((unint64_t)reason | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](reason, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_qos != *((_DWORD *)v4 + 6))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_startDate != *((_QWORD *)v4 + 1))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_20;
  }
  v8 = (*((_BYTE *)v4 + 52) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0)
    {
LABEL_20:
      v8 = 0;
      goto LABEL_21;
    }
    if (self->_userInitiated)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_20;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_20;
    }
    v8 = 1;
  }
LABEL_21:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_requestID, "hash");
  v5 = -[NSString hash](self->_reason, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  v6 = 2654435761 * self->_qos;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v7 = 2654435761u * self->_startDate;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v8 = 2654435761 * self->_userInitiated;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[_MRRequestDetailsProtobuf setName:](self, "setName:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[_MRRequestDetailsProtobuf setRequestID:](self, "setRequestID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[_MRRequestDetailsProtobuf setReason:](self, "setReason:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0)
      goto LABEL_9;
LABEL_13:
    self->_startDate = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v4 + 52) & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  self->_qos = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 1) != 0)
    goto LABEL_13;
LABEL_9:
  if ((v5 & 4) != 0)
  {
LABEL_10:
    self->_userInitiated = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_11:

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_requestID, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (unsigned)qos
{
  return self->_qos;
}

- (unint64_t)startDate
{
  return self->_startDate;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
