@implementation HDCodableError

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (NSString)domain
{
  return self->_domain;
}

- (int64_t)code
{
  return self->_code;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (void)setCode:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_code = a3;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_storeStrong((id *)&self->_localizedDescription, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_domain)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_localizedDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (void)setHasCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasLocalizedDescription
{
  return self->_localizedDescription != 0;
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
  v8.super_class = (Class)HDCodableError;
  -[HDCodableError description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableError dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  NSString *localizedDescription;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  domain = self->_domain;
  if (domain)
    objc_msgSend(v3, "setObject:forKey:", domain, CFSTR("domain"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_code);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("code"));

  }
  localizedDescription = self->_localizedDescription;
  if (localizedDescription)
    objc_msgSend(v4, "setObject:forKey:", localizedDescription, CFSTR("localizedDescription"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_domain)
  {
    objc_msgSend(v4, "setDomain:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_code;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  if (self->_localizedDescription)
  {
    objc_msgSend(v5, "setLocalizedDescription:");
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_code;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_localizedDescription, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *domain;
  NSString *localizedDescription;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  domain = self->_domain;
  if ((unint64_t)domain | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](domain, "isEqual:"))
      goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_code != *((_QWORD *)v4 + 1))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  localizedDescription = self->_localizedDescription;
  if ((unint64_t)localizedDescription | *((_QWORD *)v4 + 3))
    v7 = -[NSString isEqual:](localizedDescription, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_domain, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_code;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NSString hash](self->_localizedDescription, "hash");
}

- (void)mergeFrom:(id)a3
{
  int64_t *v4;
  int64_t *v5;

  v4 = (int64_t *)a3;
  v5 = v4;
  if (v4[2])
  {
    -[HDCodableError setDomain:](self, "setDomain:");
    v4 = v5;
  }
  if ((v4[4] & 1) != 0)
  {
    self->_code = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[3])
  {
    -[HDCodableError setLocalizedDescription:](self, "setLocalizedDescription:");
    v4 = v5;
  }

}

@end
