@implementation NPKProtoRemotePassUpdateRequest

- (BOOL)hasUpdateRequestData
{
  return self->_updateRequestData != 0;
}

- (void)setCancelUpdate:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cancelUpdate = a3;
}

- (void)setHasCancelUpdate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCancelUpdate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasPass
{
  return self->_pass != 0;
}

- (void)setRequestAuthorization:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_requestAuthorization = a3;
}

- (void)setHasRequestAuthorization:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequestAuthorization
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setShouldNotifyUser:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_shouldNotifyUser = a3;
}

- (void)setHasShouldNotifyUser:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasShouldNotifyUser
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoRemotePassUpdateRequest;
  -[NPKProtoRemotePassUpdateRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemotePassUpdateRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *passID;
  NSData *updateRequestData;
  void *v7;
  NPKProtoPass *pass;
  void *v9;
  char has;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  passID = self->_passID;
  if (passID)
    objc_msgSend(v3, "setObject:forKey:", passID, CFSTR("passID"));
  updateRequestData = self->_updateRequestData;
  if (updateRequestData)
    objc_msgSend(v4, "setObject:forKey:", updateRequestData, CFSTR("updateRequestData"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_cancelUpdate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("cancelUpdate"));

  }
  pass = self->_pass;
  if (pass)
  {
    -[NPKProtoPass dictionaryRepresentation](pass, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("pass"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_requestAuthorization);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("requestAuthorization"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_shouldNotifyUser);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("shouldNotifyUser"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRemotePassUpdateRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  id v7;

  v4 = a3;
  if (!self->_passID)
    -[NPKProtoRemotePassUpdateRequest writeTo:].cold.1();
  v7 = v4;
  PBDataWriterWriteStringField();
  if (self->_updateRequestData)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v5 = v7;
  if (self->_pass)
  {
    PBDataWriterWriteSubmessage();
    v5 = v7;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v7;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v7;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  _BYTE *v6;

  v6 = a3;
  objc_msgSend(v6, "setPassID:", self->_passID);
  if (self->_updateRequestData)
    objc_msgSend(v6, "setUpdateRequestData:");
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6[32] = self->_cancelUpdate;
    v6[36] |= 1u;
  }
  if (self->_pass)
  {
    objc_msgSend(v6, "setPass:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[33] = self->_requestAuthorization;
    v4[36] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[34] = self->_shouldNotifyUser;
    v4[36] |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_passID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSData copyWithZone:](self->_updateRequestData, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_cancelUpdate;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v10 = -[NPKProtoPass copyWithZone:](self->_pass, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 33) = self->_requestAuthorization;
    *(_BYTE *)(v5 + 36) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v5 + 34) = self->_shouldNotifyUser;
    *(_BYTE *)(v5 + 36) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *passID;
  NSData *updateRequestData;
  char has;
  NPKProtoPass *pass;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  passID = self->_passID;
  if ((unint64_t)passID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](passID, "isEqual:"))
      goto LABEL_27;
  }
  updateRequestData = self->_updateRequestData;
  if ((unint64_t)updateRequestData | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](updateRequestData, "isEqual:"))
      goto LABEL_27;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0)
      goto LABEL_27;
    if (self->_cancelUpdate)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_27;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_27;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_27;
  }
  pass = self->_pass;
  if ((unint64_t)pass | *((_QWORD *)v4 + 1))
  {
    if (!-[NPKProtoPass isEqual:](pass, "isEqual:"))
      goto LABEL_27;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0)
      goto LABEL_27;
    if (self->_requestAuthorization)
    {
      if (!*((_BYTE *)v4 + 33))
        goto LABEL_27;
    }
    else if (*((_BYTE *)v4 + 33))
    {
      goto LABEL_27;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_27;
  }
  v9 = (*((_BYTE *)v4 + 36) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) != 0)
    {
      if (self->_shouldNotifyUser)
      {
        if (!*((_BYTE *)v4 + 34))
          goto LABEL_27;
      }
      else if (*((_BYTE *)v4 + 34))
      {
        goto LABEL_27;
      }
      v9 = 1;
      goto LABEL_28;
    }
LABEL_27:
    v9 = 0;
  }
LABEL_28:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_passID, "hash");
  v4 = -[NSData hash](self->_updateRequestData, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_cancelUpdate;
  else
    v5 = 0;
  v6 = -[NPKProtoPass hash](self->_pass, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = 2654435761 * self->_requestAuthorization;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_8:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_6:
  v8 = 2654435761 * self->_shouldNotifyUser;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  NPKProtoPass *pass;
  uint64_t v6;
  BOOL v7;
  BOOL *v8;

  v4 = (BOOL *)a3;
  v8 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[NPKProtoRemotePassUpdateRequest setPassID:](self, "setPassID:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NPKProtoRemotePassUpdateRequest setUpdateRequestData:](self, "setUpdateRequestData:");
    v4 = v8;
  }
  if (v4[36])
  {
    self->_cancelUpdate = v4[32];
    *(_BYTE *)&self->_has |= 1u;
  }
  pass = self->_pass;
  v6 = *((_QWORD *)v4 + 1);
  if (pass)
  {
    if (!v6)
      goto LABEL_13;
    -[NPKProtoPass mergeFrom:](pass, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_13;
    -[NPKProtoRemotePassUpdateRequest setPass:](self, "setPass:");
  }
  v4 = v8;
LABEL_13:
  v7 = v4[36];
  if ((v7 & 2) != 0)
  {
    self->_requestAuthorization = v4[33];
    *(_BYTE *)&self->_has |= 2u;
    v7 = v4[36];
  }
  if ((v7 & 4) != 0)
  {
    self->_shouldNotifyUser = v4[34];
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (NSString)passID
{
  return self->_passID;
}

- (void)setPassID:(id)a3
{
  objc_storeStrong((id *)&self->_passID, a3);
}

- (NSData)updateRequestData
{
  return self->_updateRequestData;
}

- (void)setUpdateRequestData:(id)a3
{
  objc_storeStrong((id *)&self->_updateRequestData, a3);
}

- (BOOL)cancelUpdate
{
  return self->_cancelUpdate;
}

- (NPKProtoPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (BOOL)requestAuthorization
{
  return self->_requestAuthorization;
}

- (BOOL)shouldNotifyUser
{
  return self->_shouldNotifyUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateRequestData, 0);
  objc_storeStrong((id *)&self->_passID, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoRemotePassUpdateRequest writeTo:]", "NPKProtoRemotePassUpdateRequest.m", 188, "nil != self->_passID");
}

@end
