@implementation NPKProtoRegistrationDataResponse

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

- (BOOL)hasRegistrationDataBytes
{
  return self->_registrationDataBytes != 0;
}

- (BOOL)hasPushToken
{
  return self->_pushToken != 0;
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
  v8.super_class = (Class)NPKProtoRegistrationDataResponse;
  -[NPKProtoRegistrationDataResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRegistrationDataResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *registrationDataBytes;
  NSString *pushToken;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_pending);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("pending"));

  }
  registrationDataBytes = self->_registrationDataBytes;
  if (registrationDataBytes)
    objc_msgSend(v3, "setObject:forKey:", registrationDataBytes, CFSTR("registrationDataBytes"));
  pushToken = self->_pushToken;
  if (pushToken)
    objc_msgSend(v3, "setObject:forKey:", pushToken, CFSTR("pushToken"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRegistrationDataResponseReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_registrationDataBytes)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_pushToken)
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
    v4[24] = self->_pending;
    v4[28] |= 1u;
  }
  v5 = v4;
  if (self->_registrationDataBytes)
  {
    objc_msgSend(v4, "setRegistrationDataBytes:");
    v4 = v5;
  }
  if (self->_pushToken)
  {
    objc_msgSend(v5, "setPushToken:");
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
    *(_BYTE *)(v5 + 24) = self->_pending;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_registrationDataBytes, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[NSString copyWithZone:](self->_pushToken, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *registrationDataBytes;
  NSString *pushToken;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0)
    {
      if (self->_pending)
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
  registrationDataBytes = self->_registrationDataBytes;
  if ((unint64_t)registrationDataBytes | *((_QWORD *)v4 + 2)
    && !-[NSData isEqual:](registrationDataBytes, "isEqual:"))
  {
    goto LABEL_14;
  }
  pushToken = self->_pushToken;
  if ((unint64_t)pushToken | *((_QWORD *)v4 + 1))
    v7 = -[NSString isEqual:](pushToken, "isEqual:");
  else
    v7 = 1;
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_pending;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_registrationDataBytes, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_pushToken, "hash");
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((v4[28] & 1) != 0)
  {
    self->_pending = v4[24];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[NPKProtoRegistrationDataResponse setRegistrationDataBytes:](self, "setRegistrationDataBytes:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NPKProtoRegistrationDataResponse setPushToken:](self, "setPushToken:");
    v4 = v5;
  }

}

- (BOOL)pending
{
  return self->_pending;
}

- (NSData)registrationDataBytes
{
  return self->_registrationDataBytes;
}

- (void)setRegistrationDataBytes:(id)a3
{
  objc_storeStrong((id *)&self->_registrationDataBytes, a3);
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_storeStrong((id *)&self->_pushToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationDataBytes, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
}

@end
