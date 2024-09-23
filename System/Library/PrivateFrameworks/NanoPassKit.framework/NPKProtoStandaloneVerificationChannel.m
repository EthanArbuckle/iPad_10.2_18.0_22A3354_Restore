@implementation NPKProtoStandaloneVerificationChannel

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_type;
  else
    return 110;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;

  if (a3 > 159)
  {
    if (a3 <= 179)
    {
      if (a3 == 160)
        return CFSTR("Statement");
      if (a3 == 170)
        return CFSTR("Other");
    }
    else
    {
      switch(a3)
      {
        case 180:
          return CFSTR("AppClip");
        case 190:
          return CFSTR("WebPage");
        case 200:
          return CFSTR("URL");
      }
    }
    goto LABEL_26;
  }
  if (a3 <= 129)
  {
    if (a3 == 110)
      return CFSTR("Email");
    if (a3 == 120)
      return CFSTR("SMS");
    goto LABEL_26;
  }
  if (a3 == 130)
    return CFSTR("InboundPhoneCall");
  if (a3 == 140)
    return CFSTR("OutboundPhoneCall");
  if (a3 != 150)
  {
LABEL_26:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = CFSTR("BankApp");
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Email")) & 1) != 0)
  {
    v4 = 110;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMS")) & 1) != 0)
  {
    v4 = 120;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InboundPhoneCall")) & 1) != 0)
  {
    v4 = 130;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OutboundPhoneCall")) & 1) != 0)
  {
    v4 = 140;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BankApp")) & 1) != 0)
  {
    v4 = 150;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Statement")) & 1) != 0)
  {
    v4 = 160;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Other")) & 1) != 0)
  {
    v4 = 170;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppClip")) & 1) != 0)
  {
    v4 = 180;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WebPage")) & 1) != 0)
  {
    v4 = 190;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("URL")))
  {
    v4 = 200;
  }
  else
  {
    v4 = 110;
  }

  return v4;
}

- (BOOL)hasTypeDescriptionUnlocalized
{
  return self->_typeDescriptionUnlocalized != 0;
}

- (BOOL)hasTypeDescription
{
  return self->_typeDescription != 0;
}

- (BOOL)hasOrganizationName
{
  return self->_organizationName != 0;
}

- (void)setRequiresUserInteraction:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_requiresUserInteraction = a3;
}

- (void)setHasRequiresUserInteraction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequiresUserInteraction
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasContactPoint
{
  return self->_contactPoint != 0;
}

- (BOOL)hasSourceAddress
{
  return self->_sourceAddress != 0;
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
  v8.super_class = (Class)NPKProtoStandaloneVerificationChannel;
  -[NPKProtoStandaloneVerificationChannel description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandaloneVerificationChannel dictionaryRepresentation](self, "dictionaryRepresentation");
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
  int type;
  __CFString *v7;
  NSString *typeDescriptionUnlocalized;
  NSString *typeDescription;
  NSString *organizationName;
  void *v11;
  NSString *contactPoint;
  NSString *sourceAddress;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    type = self->_type;
    if (type > 159)
    {
      if (type <= 179)
      {
        if (type == 160)
        {
          v7 = CFSTR("Statement");
          goto LABEL_28;
        }
        if (type == 170)
        {
          v7 = CFSTR("Other");
          goto LABEL_28;
        }
      }
      else
      {
        switch(type)
        {
          case 180:
            v7 = CFSTR("AppClip");
            goto LABEL_28;
          case 190:
            v7 = CFSTR("WebPage");
            goto LABEL_28;
          case 200:
            v7 = CFSTR("URL");
            goto LABEL_28;
        }
      }
    }
    else if (type <= 129)
    {
      if (type == 110)
      {
        v7 = CFSTR("Email");
        goto LABEL_28;
      }
      if (type == 120)
      {
        v7 = CFSTR("SMS");
        goto LABEL_28;
      }
    }
    else
    {
      switch(type)
      {
        case 130:
          v7 = CFSTR("InboundPhoneCall");
          goto LABEL_28;
        case 140:
          v7 = CFSTR("OutboundPhoneCall");
          goto LABEL_28;
        case 150:
          v7 = CFSTR("BankApp");
LABEL_28:
          objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("type"));

          goto LABEL_29;
      }
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
LABEL_29:
  typeDescriptionUnlocalized = self->_typeDescriptionUnlocalized;
  if (typeDescriptionUnlocalized)
    objc_msgSend(v4, "setObject:forKey:", typeDescriptionUnlocalized, CFSTR("typeDescriptionUnlocalized"));
  typeDescription = self->_typeDescription;
  if (typeDescription)
    objc_msgSend(v4, "setObject:forKey:", typeDescription, CFSTR("typeDescription"));
  organizationName = self->_organizationName;
  if (organizationName)
    objc_msgSend(v4, "setObject:forKey:", organizationName, CFSTR("organizationName"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_requiresUserInteraction);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("requiresUserInteraction"));

  }
  contactPoint = self->_contactPoint;
  if (contactPoint)
    objc_msgSend(v4, "setObject:forKey:", contactPoint, CFSTR("contactPoint"));
  sourceAddress = self->_sourceAddress;
  if (sourceAddress)
    objc_msgSend(v4, "setObject:forKey:", sourceAddress, CFSTR("sourceAddress"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandaloneVerificationChannelReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_typeDescriptionUnlocalized)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_typeDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_organizationName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_contactPoint)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_sourceAddress)
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
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_type;
    *((_BYTE *)v4 + 68) |= 1u;
  }
  if (self->_typeDescriptionUnlocalized)
  {
    objc_msgSend(v5, "setTypeDescriptionUnlocalized:");
    v4 = v5;
  }
  if (self->_typeDescription)
  {
    objc_msgSend(v5, "setTypeDescription:");
    v4 = v5;
  }
  if (self->_organizationName)
  {
    objc_msgSend(v5, "setOrganizationName:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v4 + 64) = self->_requiresUserInteraction;
    *((_BYTE *)v4 + 68) |= 2u;
  }
  if (self->_contactPoint)
  {
    objc_msgSend(v5, "setContactPoint:");
    v4 = v5;
  }
  if (self->_sourceAddress)
  {
    objc_msgSend(v5, "setSourceAddress:");
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
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_type;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_typeDescriptionUnlocalized, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  v10 = -[NSString copyWithZone:](self->_typeDescription, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[NSString copyWithZone:](self->_organizationName, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 64) = self->_requiresUserInteraction;
    *(_BYTE *)(v5 + 68) |= 2u;
  }
  v14 = -[NSString copyWithZone:](self->_contactPoint, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v14;

  v16 = -[NSString copyWithZone:](self->_sourceAddress, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *typeDescriptionUnlocalized;
  NSString *typeDescription;
  NSString *organizationName;
  NSString *contactPoint;
  NSString *sourceAddress;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_type != *((_DWORD *)v4 + 10))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_27;
  }
  typeDescriptionUnlocalized = self->_typeDescriptionUnlocalized;
  if ((unint64_t)typeDescriptionUnlocalized | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](typeDescriptionUnlocalized, "isEqual:"))
  {
    goto LABEL_27;
  }
  typeDescription = self->_typeDescription;
  if ((unint64_t)typeDescription | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](typeDescription, "isEqual:"))
      goto LABEL_27;
  }
  organizationName = self->_organizationName;
  if ((unint64_t)organizationName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](organizationName, "isEqual:"))
      goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) != 0)
    {
      if (self->_requiresUserInteraction)
      {
        if (!*((_BYTE *)v4 + 64))
          goto LABEL_27;
        goto LABEL_23;
      }
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_23;
    }
LABEL_27:
    v11 = 0;
    goto LABEL_28;
  }
  if ((*((_BYTE *)v4 + 68) & 2) != 0)
    goto LABEL_27;
LABEL_23:
  contactPoint = self->_contactPoint;
  if ((unint64_t)contactPoint | *((_QWORD *)v4 + 1)
    && !-[NSString isEqual:](contactPoint, "isEqual:"))
  {
    goto LABEL_27;
  }
  sourceAddress = self->_sourceAddress;
  if ((unint64_t)sourceAddress | *((_QWORD *)v4 + 4))
    v11 = -[NSString isEqual:](sourceAddress, "isEqual:");
  else
    v11 = 1;
LABEL_28:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;

  v3 = -[NSString hash](self->_identifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_type;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_typeDescriptionUnlocalized, "hash");
  v6 = -[NSString hash](self->_typeDescription, "hash");
  v7 = -[NSString hash](self->_organizationName, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v8 = 2654435761 * self->_requiresUserInteraction;
  else
    v8 = 0;
  v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_contactPoint, "hash");
  return v9 ^ -[NSString hash](self->_sourceAddress, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[NPKProtoStandaloneVerificationChannel setIdentifier:](self, "setIdentifier:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    self->_type = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[NPKProtoStandaloneVerificationChannel setTypeDescriptionUnlocalized:](self, "setTypeDescriptionUnlocalized:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[NPKProtoStandaloneVerificationChannel setTypeDescription:](self, "setTypeDescription:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NPKProtoStandaloneVerificationChannel setOrganizationName:](self, "setOrganizationName:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    self->_requiresUserInteraction = *((_BYTE *)v4 + 64);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NPKProtoStandaloneVerificationChannel setContactPoint:](self, "setContactPoint:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NPKProtoStandaloneVerificationChannel setSourceAddress:](self, "setSourceAddress:");
    v4 = v5;
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)typeDescriptionUnlocalized
{
  return self->_typeDescriptionUnlocalized;
}

- (void)setTypeDescriptionUnlocalized:(id)a3
{
  objc_storeStrong((id *)&self->_typeDescriptionUnlocalized, a3);
}

- (NSString)typeDescription
{
  return self->_typeDescription;
}

- (void)setTypeDescription:(id)a3
{
  objc_storeStrong((id *)&self->_typeDescription, a3);
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
  objc_storeStrong((id *)&self->_organizationName, a3);
}

- (BOOL)requiresUserInteraction
{
  return self->_requiresUserInteraction;
}

- (NSString)contactPoint
{
  return self->_contactPoint;
}

- (void)setContactPoint:(id)a3
{
  objc_storeStrong((id *)&self->_contactPoint, a3);
}

- (NSString)sourceAddress
{
  return self->_sourceAddress;
}

- (void)setSourceAddress:(id)a3
{
  objc_storeStrong((id *)&self->_sourceAddress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeDescriptionUnlocalized, 0);
  objc_storeStrong((id *)&self->_typeDescription, 0);
  objc_storeStrong((id *)&self->_sourceAddress, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contactPoint, 0);
}

@end
