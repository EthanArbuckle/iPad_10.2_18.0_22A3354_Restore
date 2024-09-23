@implementation BMPBUserFocusActivityEvent

- (void)setIsStart:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isStart = a3;
}

- (void)setHasIsStart:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsStart
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasMode
{
  return self->_mode != 0;
}

- (BOOL)hasClientID
{
  return self->_clientID != 0;
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
  v8.super_class = (Class)BMPBUserFocusActivityEvent;
  -[BMPBUserFocusActivityEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBUserFocusActivityEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *mode;
  NSString *clientID;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isStart);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("isStart"));

  }
  mode = self->_mode;
  if (mode)
    objc_msgSend(v3, "setObject:forKey:", mode, CFSTR("mode"));
  clientID = self->_clientID;
  if (clientID)
    objc_msgSend(v3, "setObject:forKey:", clientID, CFSTR("clientID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBUserFocusActivityEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_mode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_clientID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_isStart;
    v4[28] |= 1u;
  }
  v5 = v4;
  if (self->_mode)
  {
    objc_msgSend(v4, "setMode:");
    v4 = v5;
  }
  if (self->_clientID)
  {
    objc_msgSend(v5, "setClientID:");
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
    *(_BYTE *)(v5 + 24) = self->_isStart;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_mode, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[NSString copyWithZone:](self->_clientID, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *mode;
  NSString *clientID;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0)
    {
      if (self->_isStart)
      {
        if (!*((_BYTE *)v4 + 24))
          goto LABEL_14;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_10;
    }
LABEL_14:
    v7 = 0;
    goto LABEL_15;
  }
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
    goto LABEL_14;
LABEL_10:
  mode = self->_mode;
  if ((unint64_t)mode | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](mode, "isEqual:"))
    goto LABEL_14;
  clientID = self->_clientID;
  if ((unint64_t)clientID | *((_QWORD *)v4 + 1))
    v7 = -[NSString isEqual:](clientID, "isEqual:");
  else
    v7 = 1;
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_isStart;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_mode, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_clientID, "hash");
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((v4[28] & 1) != 0)
  {
    self->_isStart = v4[24];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[BMPBUserFocusActivityEvent setMode:](self, "setMode:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[BMPBUserFocusActivityEvent setClientID:](self, "setClientID:");
    v4 = v5;
  }

}

- (BOOL)isStart
{
  return self->_isStart;
}

- (NSString)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
  objc_storeStrong((id *)&self->_mode, a3);
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
  objc_storeStrong((id *)&self->_clientID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

@end
