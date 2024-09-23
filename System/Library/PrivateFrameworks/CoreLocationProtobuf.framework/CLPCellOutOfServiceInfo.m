@implementation CLPCellOutOfServiceInfo

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (BOOL)hasServiceProviderName
{
  return self->_serviceProviderName != 0;
}

- (void)setUniqueCount:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_uniqueCount = a3;
}

- (void)setHasUniqueCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUniqueCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasWifiFallback:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_hasWifiFallback = a3;
}

- (void)setHasHasWifiFallback:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHasWifiFallback
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
  v8.super_class = (Class)CLPCellOutOfServiceInfo;
  -[CLPCellOutOfServiceInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPCellOutOfServiceInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  CLPLocation *location;
  void *v5;
  NSString *serviceProviderName;
  char has;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  location = self->_location;
  if (location)
  {
    -[CLPLocation dictionaryRepresentation](location, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("location"));

  }
  serviceProviderName = self->_serviceProviderName;
  if (serviceProviderName)
    objc_msgSend(v3, "setObject:forKey:", serviceProviderName, CFSTR("serviceProviderName"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_uniqueCount);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("uniqueCount"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasWifiFallback);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("hasWifiFallback"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPCellOutOfServiceInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_location)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_serviceProviderName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  _BYTE *v6;

  v4 = a3;
  v6 = v4;
  if (self->_location)
  {
    objc_msgSend(v4, "setLocation:");
    v4 = v6;
  }
  if (self->_serviceProviderName)
  {
    objc_msgSend(v6, "setServiceProviderName:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[25] = self->_uniqueCount;
    v4[28] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[24] = self->_hasWifiFallback;
    v4[28] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[CLPLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSString copyWithZone:](self->_serviceProviderName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 25) = self->_uniqueCount;
    *(_BYTE *)(v5 + 28) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_hasWifiFallback;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CLPLocation *location;
  NSString *serviceProviderName;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 1))
  {
    if (!-[CLPLocation isEqual:](location, "isEqual:"))
      goto LABEL_16;
  }
  serviceProviderName = self->_serviceProviderName;
  if ((unint64_t)serviceProviderName | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](serviceProviderName, "isEqual:"))
      goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_16;
    if (self->_uniqueCount)
    {
      if (!*((_BYTE *)v4 + 25))
        goto LABEL_16;
    }
    else if (*((_BYTE *)v4 + 25))
    {
      goto LABEL_16;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_16;
  }
  v7 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0)
    {
      if (self->_hasWifiFallback)
      {
        if (!*((_BYTE *)v4 + 24))
          goto LABEL_16;
      }
      else if (*((_BYTE *)v4 + 24))
      {
        goto LABEL_16;
      }
      v7 = 1;
      goto LABEL_17;
    }
LABEL_16:
    v7 = 0;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[CLPLocation hash](self->_location, "hash");
  v4 = -[NSString hash](self->_serviceProviderName, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_uniqueCount;
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
  v6 = 2654435761 * self->_hasWifiFallback;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CLPLocation *location;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  location = self->_location;
  v6 = *((_QWORD *)v4 + 1);
  v8 = v4;
  if (location)
  {
    if (!v6)
      goto LABEL_7;
    -[CLPLocation mergeFrom:](location, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[CLPCellOutOfServiceInfo setLocation:](self, "setLocation:");
  }
  v4 = v8;
LABEL_7:
  if (*((_QWORD *)v4 + 2))
  {
    -[CLPCellOutOfServiceInfo setServiceProviderName:](self, "setServiceProviderName:");
    v4 = v8;
  }
  v7 = *((_BYTE *)v4 + 28);
  if ((v7 & 2) != 0)
  {
    self->_uniqueCount = *((_BYTE *)v4 + 25);
    *(_BYTE *)&self->_has |= 2u;
    v7 = *((_BYTE *)v4 + 28);
  }
  if ((v7 & 1) != 0)
  {
    self->_hasWifiFallback = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (CLPLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSString)serviceProviderName
{
  return self->_serviceProviderName;
}

- (void)setServiceProviderName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProviderName, a3);
}

- (BOOL)uniqueCount
{
  return self->_uniqueCount;
}

- (BOOL)hasWifiFallback
{
  return self->_hasWifiFallback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProviderName, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
