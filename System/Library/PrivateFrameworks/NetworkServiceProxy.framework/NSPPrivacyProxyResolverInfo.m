@implementation NSPPrivacyProxyResolverInfo

- (BOOL)hasDohURL
{
  return self->_dohURL != 0;
}

- (BOOL)hasObliviousDoHConfig
{
  return self->_obliviousDoHConfig != 0;
}

- (void)setWeight:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_weight = a3;
}

- (void)setHasWeight:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWeight
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setProxyIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_proxyIndex = a3;
}

- (void)setHasProxyIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProxyIndex
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyResolverInfo;
  -[NSPPrivacyProxyResolverInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPPrivacyProxyResolverInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *dohURL;
  NSData *obliviousDoHConfig;
  char has;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  dohURL = self->_dohURL;
  if (dohURL)
    objc_msgSend(v3, "setObject:forKey:", dohURL, CFSTR("dohURL"));
  obliviousDoHConfig = self->_obliviousDoHConfig;
  if (obliviousDoHConfig)
    objc_msgSend(v4, "setObject:forKey:", obliviousDoHConfig, CFSTR("obliviousDoHConfig"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_weight);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("weight"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_proxyIndex);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("proxyIndex"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyResolverInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_dohURL)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_obliviousDoHConfig)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
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
  if (self->_dohURL)
  {
    objc_msgSend(v4, "setDohURL:");
    v4 = v6;
  }
  if (self->_obliviousDoHConfig)
  {
    objc_msgSend(v6, "setObliviousDoHConfig:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 7) = self->_weight;
    *((_BYTE *)v4 + 32) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_proxyIndex;
    *((_BYTE *)v4 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_dohURL, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSData copyWithZone:](self->_obliviousDoHConfig, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_weight;
    *(_BYTE *)(v5 + 32) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_proxyIndex;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *dohURL;
  NSData *obliviousDoHConfig;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  dohURL = self->_dohURL;
  if ((unint64_t)dohURL | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](dohURL, "isEqual:"))
      goto LABEL_15;
  }
  obliviousDoHConfig = self->_obliviousDoHConfig;
  if ((unint64_t)obliviousDoHConfig | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](obliviousDoHConfig, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_weight != *((_DWORD *)v4 + 7))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_proxyIndex != *((_DWORD *)v4 + 6))
      goto LABEL_15;
    v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_dohURL, "hash");
  v4 = -[NSData hash](self->_obliviousDoHConfig, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_weight;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_proxyIndex;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  char v5;
  unsigned int *v6;

  v4 = (unsigned int *)a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[NSPPrivacyProxyResolverInfo setDohURL:](self, "setDohURL:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NSPPrivacyProxyResolverInfo setObliviousDoHConfig:](self, "setObliviousDoHConfig:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_weight = v4[7];
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 32);
  }
  if ((v5 & 1) != 0)
  {
    self->_proxyIndex = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)dohURL
{
  return self->_dohURL;
}

- (void)setDohURL:(id)a3
{
  objc_storeStrong((id *)&self->_dohURL, a3);
}

- (NSData)obliviousDoHConfig
{
  return self->_obliviousDoHConfig;
}

- (void)setObliviousDoHConfig:(id)a3
{
  objc_storeStrong((id *)&self->_obliviousDoHConfig, a3);
}

- (unsigned)weight
{
  return self->_weight;
}

- (unsigned)proxyIndex
{
  return self->_proxyIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obliviousDoHConfig, 0);
  objc_storeStrong((id *)&self->_dohURL, 0);
}

@end
