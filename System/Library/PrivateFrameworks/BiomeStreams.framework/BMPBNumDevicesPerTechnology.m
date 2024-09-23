@implementation BMPBNumDevicesPerTechnology

- (BOOL)hasTechnologyString
{
  return self->_technologyString != 0;
}

- (void)setNumber:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_number = a3;
}

- (void)setHasNumber:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumber
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
  v8.super_class = (Class)BMPBNumDevicesPerTechnology;
  -[BMPBNumDevicesPerTechnology description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBNumDevicesPerTechnology dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *technologyString;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  technologyString = self->_technologyString;
  if (technologyString)
    objc_msgSend(v3, "setObject:forKey:", technologyString, CFSTR("technologyString"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_number);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("number"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBNumDevicesPerTechnologyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_technologyString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
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
  if (self->_technologyString)
  {
    v5 = v4;
    objc_msgSend(v4, "setTechnologyString:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_number;
    *((_BYTE *)v4 + 24) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_technologyString, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_number;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *technologyString;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  technologyString = self->_technologyString;
  if ((unint64_t)technologyString | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](technologyString, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) != 0 && self->_number == *((_DWORD *)v4 + 2))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_technologyString, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_number;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  if (*((_QWORD *)v4 + 2))
  {
    v5 = v4;
    -[BMPBNumDevicesPerTechnology setTechnologyString:](self, "setTechnologyString:");
    v4 = v5;
  }
  if ((v4[6] & 1) != 0)
  {
    self->_number = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)technologyString
{
  return self->_technologyString;
}

- (void)setTechnologyString:(id)a3
{
  objc_storeStrong((id *)&self->_technologyString, a3);
}

- (int)number
{
  return self->_number;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_technologyString, 0);
}

@end
