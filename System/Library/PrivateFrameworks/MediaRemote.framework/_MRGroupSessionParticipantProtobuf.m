@implementation _MRGroupSessionParticipantProtobuf

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasIdentity
{
  return self->_identity != 0;
}

- (void)setConnected:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_connected = a3;
}

- (void)setHasConnected:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConnected
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setGuest:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_guest = a3;
}

- (void)setHasGuest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGuest
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHidden:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_hidden = a3;
}

- (void)setHasHidden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHidden
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
  v8.super_class = (Class)_MRGroupSessionParticipantProtobuf;
  -[_MRGroupSessionParticipantProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGroupSessionParticipantProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  _MRUserIdentityProtobuf *identity;
  void *v7;
  char has;
  void *v9;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  identity = self->_identity;
  if (identity)
  {
    -[_MRUserIdentityProtobuf dictionaryRepresentation](identity, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("identity"));

  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_guest);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("guest"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v4;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_connected);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("connected"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 4) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hidden);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("hidden"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupSessionParticipantProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_identity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
LABEL_11:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 4) != 0)
  {
LABEL_8:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_9:

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  _BYTE *v6;

  v4 = a3;
  v6 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v6;
  }
  if (self->_identity)
  {
    objc_msgSend(v6, "setIdentity:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
LABEL_11:
    v4[25] = self->_guest;
    v4[28] |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  v4[24] = self->_connected;
  v4[28] |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 4) != 0)
  {
LABEL_8:
    v4[26] = self->_hidden;
    v4[28] |= 4u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[_MRUserIdentityProtobuf copyWithZone:](self->_identity, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_BYTE *)(v5 + 25) = self->_guest;
    *(_BYTE *)(v5 + 28) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(_BYTE *)(v5 + 24) = self->_connected;
  *(_BYTE *)(v5 + 28) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_BYTE *)(v5 + 26) = self->_hidden;
    *(_BYTE *)(v5 + 28) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  _MRUserIdentityProtobuf *identity;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_24;
  }
  identity = self->_identity;
  if ((unint64_t)identity | *((_QWORD *)v4 + 2))
  {
    if (!-[_MRUserIdentityProtobuf isEqual:](identity, "isEqual:"))
      goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
      goto LABEL_24;
    if (self->_connected)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_24;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_24;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_24;
    if (self->_guest)
    {
      if (!*((_BYTE *)v4 + 25))
        goto LABEL_24;
    }
    else if (*((_BYTE *)v4 + 25))
    {
      goto LABEL_24;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_24;
  }
  v7 = (*((_BYTE *)v4 + 28) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) != 0)
    {
      if (self->_hidden)
      {
        if (!*((_BYTE *)v4 + 26))
          goto LABEL_24;
      }
      else if (*((_BYTE *)v4 + 26))
      {
        goto LABEL_24;
      }
      v7 = 1;
      goto LABEL_25;
    }
LABEL_24:
    v7 = 0;
  }
LABEL_25:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[_MRUserIdentityProtobuf hash](self->_identity, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v5 = 2654435761 * self->_connected;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v6 = 2654435761 * self->_guest;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v7 = 2654435761 * self->_hidden;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  _MRUserIdentityProtobuf *identity;
  uint64_t v6;
  BOOL v7;
  BOOL *v8;

  v4 = (BOOL *)a3;
  v8 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[_MRGroupSessionParticipantProtobuf setIdentifier:](self, "setIdentifier:");
    v4 = v8;
  }
  identity = self->_identity;
  v6 = *((_QWORD *)v4 + 2);
  if (identity)
  {
    if (!v6)
      goto LABEL_9;
    -[_MRUserIdentityProtobuf mergeFrom:](identity, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[_MRGroupSessionParticipantProtobuf setIdentity:](self, "setIdentity:");
  }
  v4 = v8;
LABEL_9:
  v7 = v4[28];
  if (!v7)
  {
    if ((v4[28] & 2) == 0)
      goto LABEL_11;
LABEL_15:
    self->_guest = v4[25];
    *(_BYTE *)&self->_has |= 2u;
    if ((v4[28] & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  self->_connected = v4[24];
  *(_BYTE *)&self->_has |= 1u;
  v7 = v4[28];
  if ((v7 & 2) != 0)
    goto LABEL_15;
LABEL_11:
  if ((v7 & 4) != 0)
  {
LABEL_12:
    self->_hidden = v4[26];
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_13:

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (_MRUserIdentityProtobuf)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (BOOL)connected
{
  return self->_connected;
}

- (BOOL)guest
{
  return self->_guest;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
