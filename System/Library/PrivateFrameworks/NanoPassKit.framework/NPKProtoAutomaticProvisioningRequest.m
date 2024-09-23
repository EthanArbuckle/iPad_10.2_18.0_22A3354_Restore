@implementation NPKProtoAutomaticProvisioningRequest

- (BOOL)hasPassTypeIdentifier
{
  return self->_passTypeIdentifier != 0;
}

- (BOOL)hasSerialNumber
{
  return self->_serialNumber != 0;
}

- (void)setCredentialType:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_credentialType = a3;
}

- (void)setHasCredentialType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCredentialType
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasPrimaryAccountNumberSuffix
{
  return self->_primaryAccountNumberSuffix != 0;
}

- (BOOL)hasLocalizedName
{
  return self->_localizedName != 0;
}

- (int)cardType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_cardType;
  else
    return 0;
}

- (void)setCardType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_cardType = a3;
}

- (void)setHasCardType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCardType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)cardTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_24CFE8990[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCardType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Payment")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Transit")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Access")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)NPKProtoAutomaticProvisioningRequest;
  -[NPKProtoAutomaticProvisioningRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoAutomaticProvisioningRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *passTypeIdentifier;
  NSString *serialNumber;
  void *v7;
  NSString *primaryAccountNumberSuffix;
  NSString *localizedName;
  uint64_t cardType;
  __CFString *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  passTypeIdentifier = self->_passTypeIdentifier;
  if (passTypeIdentifier)
    objc_msgSend(v3, "setObject:forKey:", passTypeIdentifier, CFSTR("passTypeIdentifier"));
  serialNumber = self->_serialNumber;
  if (serialNumber)
    objc_msgSend(v4, "setObject:forKey:", serialNumber, CFSTR("serialNumber"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_credentialType);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("credentialType"));

  }
  primaryAccountNumberSuffix = self->_primaryAccountNumberSuffix;
  if (primaryAccountNumberSuffix)
    objc_msgSend(v4, "setObject:forKey:", primaryAccountNumberSuffix, CFSTR("primaryAccountNumberSuffix"));
  localizedName = self->_localizedName;
  if (localizedName)
    objc_msgSend(v4, "setObject:forKey:", localizedName, CFSTR("localizedName"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    cardType = self->_cardType;
    if (cardType >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_cardType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_24CFE8990[cardType];
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("cardType"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoAutomaticProvisioningRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_passTypeIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_serialNumber)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_primaryAccountNumberSuffix)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_localizedName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_passTypeIdentifier)
  {
    objc_msgSend(v4, "setPassTypeIdentifier:");
    v4 = v5;
  }
  if (self->_serialNumber)
  {
    objc_msgSend(v5, "setSerialNumber:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_credentialType;
    *((_BYTE *)v4 + 56) |= 1u;
  }
  if (self->_primaryAccountNumberSuffix)
  {
    objc_msgSend(v5, "setPrimaryAccountNumberSuffix:");
    v4 = v5;
  }
  if (self->_localizedName)
  {
    objc_msgSend(v5, "setLocalizedName:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_cardType;
    *((_BYTE *)v4 + 56) |= 2u;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_passTypeIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_serialNumber, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_credentialType;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_primaryAccountNumberSuffix, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[NSString copyWithZone:](self->_localizedName, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_cardType;
    *(_BYTE *)(v5 + 56) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *passTypeIdentifier;
  NSString *serialNumber;
  NSString *primaryAccountNumberSuffix;
  NSString *localizedName;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  passTypeIdentifier = self->_passTypeIdentifier;
  if ((unint64_t)passTypeIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](passTypeIdentifier, "isEqual:"))
      goto LABEL_19;
  }
  serialNumber = self->_serialNumber;
  if ((unint64_t)serialNumber | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](serialNumber, "isEqual:"))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_credentialType != *((_QWORD *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_19:
    v9 = 0;
    goto LABEL_20;
  }
  primaryAccountNumberSuffix = self->_primaryAccountNumberSuffix;
  if ((unint64_t)primaryAccountNumberSuffix | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](primaryAccountNumberSuffix, "isEqual:"))
  {
    goto LABEL_19;
  }
  localizedName = self->_localizedName;
  if ((unint64_t)localizedName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](localizedName, "isEqual:"))
      goto LABEL_19;
  }
  v9 = (*((_BYTE *)v4 + 56) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_cardType != *((_DWORD *)v4 + 4))
      goto LABEL_19;
    v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_passTypeIdentifier, "hash");
  v4 = -[NSString hash](self->_serialNumber, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761u * self->_credentialType;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_primaryAccountNumberSuffix, "hash");
  v7 = -[NSString hash](self->_localizedName, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v8 = 2654435761 * self->_cardType;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[NPKProtoAutomaticProvisioningRequest setPassTypeIdentifier:](self, "setPassTypeIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[NPKProtoAutomaticProvisioningRequest setSerialNumber:](self, "setSerialNumber:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_credentialType = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[NPKProtoAutomaticProvisioningRequest setPrimaryAccountNumberSuffix:](self, "setPrimaryAccountNumberSuffix:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NPKProtoAutomaticProvisioningRequest setLocalizedName:](self, "setLocalizedName:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    self->_cardType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passTypeIdentifier, a3);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (unint64_t)credentialType
{
  return self->_credentialType;
}

- (NSString)primaryAccountNumberSuffix
{
  return self->_primaryAccountNumberSuffix;
}

- (void)setPrimaryAccountNumberSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAccountNumberSuffix, a3);
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_primaryAccountNumberSuffix, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
