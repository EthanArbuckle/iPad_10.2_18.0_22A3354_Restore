@implementation NNMKProtoAccountAuthenticationState

- (BOOL)hasAccountId
{
  return self->_accountId != 0;
}

- (void)setStandaloneState:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_standaloneState = a3;
}

- (void)setHasStandaloneState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStandaloneState
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasSubsectionId
{
  return self->_subsectionId != 0;
}

- (BOOL)hasEmailAddressToken
{
  return self->_emailAddressToken != 0;
}

- (BOOL)hasPccEmailAddress
{
  return self->_pccEmailAddress != 0;
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
  v8.super_class = (Class)NNMKProtoAccountAuthenticationState;
  -[NNMKProtoAccountAuthenticationState description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoAccountAuthenticationState dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *accountId;
  void *v6;
  NSString *displayName;
  NSString *subsectionId;
  NSString *emailAddressToken;
  NSString *pccEmailAddress;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  accountId = self->_accountId;
  if (accountId)
    objc_msgSend(v3, "setObject:forKey:", accountId, CFSTR("accountId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_standaloneState);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("standaloneState"));

  }
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v4, "setObject:forKey:", displayName, CFSTR("displayName"));
  subsectionId = self->_subsectionId;
  if (subsectionId)
    objc_msgSend(v4, "setObject:forKey:", subsectionId, CFSTR("subsectionId"));
  emailAddressToken = self->_emailAddressToken;
  if (emailAddressToken)
    objc_msgSend(v4, "setObject:forKey:", emailAddressToken, CFSTR("emailAddressToken"));
  pccEmailAddress = self->_pccEmailAddress;
  if (pccEmailAddress)
    objc_msgSend(v4, "setObject:forKey:", pccEmailAddress, CFSTR("pccEmailAddress"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoAccountAuthenticationStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_accountId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_displayName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_subsectionId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_emailAddressToken)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_pccEmailAddress)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_accountId)
  {
    objc_msgSend(v4, "setAccountId:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_standaloneState;
    *((_BYTE *)v4 + 56) |= 1u;
  }
  if (self->_displayName)
  {
    objc_msgSend(v5, "setDisplayName:");
    v4 = v5;
  }
  if (self->_subsectionId)
  {
    objc_msgSend(v5, "setSubsectionId:");
    v4 = v5;
  }
  if (self->_emailAddressToken)
  {
    objc_msgSend(v5, "setEmailAddressToken:");
    v4 = v5;
  }
  if (self->_pccEmailAddress)
  {
    objc_msgSend(v5, "setPccEmailAddress:");
    v4 = v5;
  }

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
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_accountId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_standaloneState;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_subsectionId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[NSString copyWithZone:](self->_emailAddressToken, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  v14 = -[NSString copyWithZone:](self->_pccEmailAddress, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *accountId;
  NSString *displayName;
  NSString *subsectionId;
  NSString *emailAddressToken;
  NSString *pccEmailAddress;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  accountId = self->_accountId;
  if ((unint64_t)accountId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](accountId, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_standaloneState != *((_DWORD *)v4 + 10))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](displayName, "isEqual:"))
  {
    goto LABEL_17;
  }
  subsectionId = self->_subsectionId;
  if ((unint64_t)subsectionId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](subsectionId, "isEqual:"))
      goto LABEL_17;
  }
  emailAddressToken = self->_emailAddressToken;
  if ((unint64_t)emailAddressToken | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](emailAddressToken, "isEqual:"))
      goto LABEL_17;
  }
  pccEmailAddress = self->_pccEmailAddress;
  if ((unint64_t)pccEmailAddress | *((_QWORD *)v4 + 4))
    v10 = -[NSString isEqual:](pccEmailAddress, "isEqual:");
  else
    v10 = 1;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;

  v3 = -[NSString hash](self->_accountId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_standaloneState;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSString hash](self->_displayName, "hash");
  v7 = v5 ^ v6 ^ -[NSString hash](self->_subsectionId, "hash");
  v8 = -[NSString hash](self->_emailAddressToken, "hash");
  return v7 ^ v8 ^ -[NSString hash](self->_pccEmailAddress, "hash");
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  unsigned int *v5;

  v4 = (unsigned int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[NNMKProtoAccountAuthenticationState setAccountId:](self, "setAccountId:");
    v4 = v5;
  }
  if ((v4[14] & 1) != 0)
  {
    self->_standaloneState = v4[10];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NNMKProtoAccountAuthenticationState setDisplayName:](self, "setDisplayName:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[NNMKProtoAccountAuthenticationState setSubsectionId:](self, "setSubsectionId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NNMKProtoAccountAuthenticationState setEmailAddressToken:](self, "setEmailAddressToken:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NNMKProtoAccountAuthenticationState setPccEmailAddress:](self, "setPccEmailAddress:");
    v4 = v5;
  }

}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
  objc_storeStrong((id *)&self->_accountId, a3);
}

- (unsigned)standaloneState
{
  return self->_standaloneState;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)subsectionId
{
  return self->_subsectionId;
}

- (void)setSubsectionId:(id)a3
{
  objc_storeStrong((id *)&self->_subsectionId, a3);
}

- (NSString)emailAddressToken
{
  return self->_emailAddressToken;
}

- (void)setEmailAddressToken:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddressToken, a3);
}

- (NSString)pccEmailAddress
{
  return self->_pccEmailAddress;
}

- (void)setPccEmailAddress:(id)a3
{
  objc_storeStrong((id *)&self->_pccEmailAddress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subsectionId, 0);
  objc_storeStrong((id *)&self->_pccEmailAddress, 0);
  objc_storeStrong((id *)&self->_emailAddressToken, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
}

@end
