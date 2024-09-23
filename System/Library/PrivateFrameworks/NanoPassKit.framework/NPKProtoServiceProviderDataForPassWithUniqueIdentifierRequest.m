@implementation NPKProtoServiceProviderDataForPassWithUniqueIdentifierRequest

- (void)setEncrypted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_encrypted = a3;
}

- (void)setHasEncrypted:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEncrypted
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
  v8.super_class = (Class)NPKProtoServiceProviderDataForPassWithUniqueIdentifierRequest;
  -[NPKProtoServiceProviderDataForPassWithUniqueIdentifierRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoServiceProviderDataForPassWithUniqueIdentifierRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *passUniqueID;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  passUniqueID = self->_passUniqueID;
  if (passUniqueID)
    objc_msgSend(v3, "setObject:forKey:", passUniqueID, CFSTR("passUniqueID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_encrypted);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("encrypted"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoServiceProviderDataForPassWithUniqueIdentifierRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_passUniqueID)
    -[NPKProtoServiceProviderDataForPassWithUniqueIdentifierRequest writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;

  v4 = a3;
  objc_msgSend(v4, "setPassUniqueID:", self->_passUniqueID);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[16] = self->_encrypted;
    v4[20] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_passUniqueID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 16) = self->_encrypted;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *passUniqueID;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  passUniqueID = self->_passUniqueID;
  if ((unint64_t)passUniqueID | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](passUniqueID, "isEqual:"))
      goto LABEL_6;
  }
  v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      v6 = 0;
      goto LABEL_7;
    }
    if (self->_encrypted)
    {
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_6;
    }
    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_6;
    }
    v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_passUniqueID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_encrypted;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v4 = (BOOL *)a3;
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[NPKProtoServiceProviderDataForPassWithUniqueIdentifierRequest setPassUniqueID:](self, "setPassUniqueID:");
    v4 = v5;
  }
  if (v4[20])
  {
    self->_encrypted = v4[16];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)passUniqueID
{
  return self->_passUniqueID;
}

- (void)setPassUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_passUniqueID, a3);
}

- (BOOL)encrypted
{
  return self->_encrypted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passUniqueID, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoServiceProviderDataForPassWithUniqueIdentifierRequest writeTo:]", "NPKProtoServiceProviderDataForPassWithUniqueIdentifierRequest.m", 96, "nil != self->_passUniqueID");
}

@end
