@implementation NPKProtoAcceptSubcredentialInvitationResponse

- (BOOL)hasPassForInvitation
{
  return self->_passForInvitation != 0;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (void)setPending:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_pending = a3;
}

- (void)setHasPending:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPending
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoAcceptSubcredentialInvitationResponse;
  -[NPKProtoAcceptSubcredentialInvitationResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoAcceptSubcredentialInvitationResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NPKProtoPass *passForInvitation;
  void *v5;
  NSData *errorData;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  passForInvitation = self->_passForInvitation;
  if (passForInvitation)
  {
    -[NPKProtoPass dictionaryRepresentation](passForInvitation, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("passForInvitation"));

  }
  errorData = self->_errorData;
  if (errorData)
    objc_msgSend(v3, "setObject:forKey:", errorData, CFSTR("errorData"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_pending);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("pending"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoAcceptSubcredentialInvitationResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_passForInvitation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_errorData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v5 = v4;
  if (self->_passForInvitation)
  {
    objc_msgSend(v4, "setPassForInvitation:");
    v4 = v5;
  }
  if (self->_errorData)
  {
    objc_msgSend(v5, "setErrorData:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_pending;
    v4[28] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NPKProtoPass copyWithZone:](self->_passForInvitation, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSData copyWithZone:](self->_errorData, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_pending;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NPKProtoPass *passForInvitation;
  NSData *errorData;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  passForInvitation = self->_passForInvitation;
  if ((unint64_t)passForInvitation | *((_QWORD *)v4 + 2))
  {
    if (!-[NPKProtoPass isEqual:](passForInvitation, "isEqual:"))
      goto LABEL_8;
  }
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](errorData, "isEqual:"))
      goto LABEL_8;
  }
  v7 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      v7 = 0;
      goto LABEL_9;
    }
    if (self->_pending)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_8;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_8;
    }
    v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NPKProtoPass hash](self->_passForInvitation, "hash");
  v4 = -[NSData hash](self->_errorData, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_pending;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NPKProtoPass *passForInvitation;
  uint64_t v6;
  id v7;

  v4 = a3;
  passForInvitation = self->_passForInvitation;
  v6 = *((_QWORD *)v4 + 2);
  v7 = v4;
  if (passForInvitation)
  {
    if (!v6)
      goto LABEL_7;
    -[NPKProtoPass mergeFrom:](passForInvitation, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[NPKProtoAcceptSubcredentialInvitationResponse setPassForInvitation:](self, "setPassForInvitation:");
  }
  v4 = v7;
LABEL_7:
  if (*((_QWORD *)v4 + 1))
  {
    -[NPKProtoAcceptSubcredentialInvitationResponse setErrorData:](self, "setErrorData:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_pending = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NPKProtoPass)passForInvitation
{
  return self->_passForInvitation;
}

- (void)setPassForInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_passForInvitation, a3);
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
  objc_storeStrong((id *)&self->_errorData, a3);
}

- (BOOL)pending
{
  return self->_pending;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passForInvitation, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end
