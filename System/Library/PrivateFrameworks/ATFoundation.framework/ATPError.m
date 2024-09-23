@implementation ATPError

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (void)setDomainCode:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_domainCode = a3;
}

- (void)setHasDomainCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDomainCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setCode:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_code = a3;
}

- (void)setHasCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
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
  v8.super_class = (Class)ATPError;
  -[ATPError description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATPError dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *domain;
  char has;
  void *v7;
  void *v8;
  NSString *errorDescription;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  domain = self->_domain;
  if (domain)
    objc_msgSend(v3, "setObject:forKey:", domain, CFSTR("domain"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_domainCode);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("domainCode"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_code);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("code"));

  }
  errorDescription = self->_errorDescription;
  if (errorDescription)
    objc_msgSend(v4, "setObject:forKey:", errorDescription, CFSTR("errorDescription"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATPErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_domain)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_domain)
  {
    objc_msgSend(v4, "setDomain:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_domainCode;
    *((_BYTE *)v4 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_code;
    *((_BYTE *)v4 + 40) |= 2u;
  }
  if (self->_errorDescription)
  {
    objc_msgSend(v6, "setErrorDescription:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_domainCode;
    *(_BYTE *)(v5 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_code;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  v9 = -[NSString copyWithZone:](self->_errorDescription, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *domain;
  NSString *errorDescription;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  domain = self->_domain;
  if ((unint64_t)domain | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](domain, "isEqual:"))
      goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_domainCode != *((_QWORD *)v4 + 1))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_code != *((_DWORD *)v4 + 4))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_16;
  }
  errorDescription = self->_errorDescription;
  if ((unint64_t)errorDescription | *((_QWORD *)v4 + 4))
    v7 = -[NSString isEqual:](errorDescription, "isEqual:");
  else
    v7 = 1;
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_domain, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_domainCode;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_errorDescription, "hash");
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_code;
  return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_errorDescription, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[ATPError setDomain:](self, "setDomain:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 1) != 0)
  {
    self->_domainCode = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 40);
  }
  if ((v5 & 2) != 0)
  {
    self->_code = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[ATPError setErrorDescription:](self, "setErrorDescription:");
    v4 = v6;
  }

}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (int64_t)domainCode
{
  return self->_domainCode;
}

- (int)code
{
  return self->_code;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
  objc_storeStrong((id *)&self->_errorDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
