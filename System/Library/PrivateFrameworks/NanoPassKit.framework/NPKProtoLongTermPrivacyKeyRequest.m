@implementation NPKProtoLongTermPrivacyKeyRequest

- (void)setReuseExisting:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_reuseExisting = a3;
}

- (void)setHasReuseExisting:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReuseExisting
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
  v8.super_class = (Class)NPKProtoLongTermPrivacyKeyRequest;
  -[NPKProtoLongTermPrivacyKeyRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoLongTermPrivacyKeyRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *credentialGroupIdentifier;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  credentialGroupIdentifier = self->_credentialGroupIdentifier;
  if (credentialGroupIdentifier)
    objc_msgSend(v3, "setObject:forKey:", credentialGroupIdentifier, CFSTR("credentialGroupIdentifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_reuseExisting);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("reuseExisting"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoLongTermPrivacyKeyRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_credentialGroupIdentifier)
    -[NPKProtoLongTermPrivacyKeyRequest writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;

  v4 = a3;
  objc_msgSend(v4, "setCredentialGroupIdentifier:", self->_credentialGroupIdentifier);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[16] = self->_reuseExisting;
    v4[20] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_credentialGroupIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 16) = self->_reuseExisting;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *credentialGroupIdentifier;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  credentialGroupIdentifier = self->_credentialGroupIdentifier;
  if ((unint64_t)credentialGroupIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](credentialGroupIdentifier, "isEqual:"))
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
    if (self->_reuseExisting)
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

  v3 = -[NSString hash](self->_credentialGroupIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_reuseExisting;
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
    -[NPKProtoLongTermPrivacyKeyRequest setCredentialGroupIdentifier:](self, "setCredentialGroupIdentifier:");
    v4 = v5;
  }
  if (v4[20])
  {
    self->_reuseExisting = v4[16];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)credentialGroupIdentifier
{
  return self->_credentialGroupIdentifier;
}

- (void)setCredentialGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_credentialGroupIdentifier, a3);
}

- (BOOL)reuseExisting
{
  return self->_reuseExisting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialGroupIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoLongTermPrivacyKeyRequest writeTo:]", "NPKProtoLongTermPrivacyKeyRequest.m", 96, "nil != self->_credentialGroupIdentifier");
}

@end
