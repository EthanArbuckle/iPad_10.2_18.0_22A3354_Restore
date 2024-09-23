@implementation HKHealthWrapCodableValue

- (int)type
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_type;
  else
    return 1;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E37F7840[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ValueTypeNull")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ValueTypeBytes")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ValueTypeString")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ValueTypeInteger")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasBytes
{
  return self->_bytes != 0;
}

- (BOOL)hasString
{
  return self->_string != 0;
}

- (void)setInteger:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_integer = a3;
}

- (void)setHasInteger:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInteger
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
  v8.super_class = (Class)HKHealthWrapCodableValue;
  -[HKHealthWrapCodableValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthWrapCodableValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  __CFString *v5;
  NSData *bytes;
  NSString *string;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = self->_type - 1;
    if (v4 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E37F7840[v4];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  }
  bytes = self->_bytes;
  if (bytes)
    objc_msgSend(v3, "setObject:forKey:", bytes, CFSTR("bytes"));
  string = self->_string;
  if (string)
    objc_msgSend(v3, "setObject:forKey:", string, CFSTR("string"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_integer);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("integer"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKHealthWrapCodableValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_bytes)
    PBDataWriterWriteDataField();
  if (self->_string)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[8] = self->_type;
    *((_BYTE *)v4 + 36) |= 2u;
  }
  v5 = v4;
  if (self->_bytes)
  {
    objc_msgSend(v4, "setBytes:");
    v4 = v5;
  }
  if (self->_string)
  {
    objc_msgSend(v5, "setString:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_integer;
    *((_BYTE *)v4 + 36) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_type;
    *(_BYTE *)(v5 + 36) |= 2u;
  }
  v7 = -[NSData copyWithZone:](self->_bytes, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  v9 = -[NSString copyWithZone:](self->_string, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_integer;
    *(_BYTE *)(v6 + 36) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *bytes;
  NSString *string;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_type != *((_DWORD *)v4 + 8))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  bytes = self->_bytes;
  if ((unint64_t)bytes | *((_QWORD *)v4 + 2) && !-[NSData isEqual:](bytes, "isEqual:"))
    goto LABEL_15;
  string = self->_string;
  if ((unint64_t)string | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](string, "isEqual:"))
      goto LABEL_15;
  }
  v7 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_integer != *((_QWORD *)v4 + 1))
      goto LABEL_15;
    v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_bytes, "hash");
  v5 = -[NSString hash](self->_string, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_integer;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    self->_type = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[HKHealthWrapCodableValue setBytes:](self, "setBytes:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[HKHealthWrapCodableValue setString:](self, "setString:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    self->_integer = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSData)bytes
{
  return self->_bytes;
}

- (void)setBytes:(id)a3
{
  objc_storeStrong((id *)&self->_bytes, a3);
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_storeStrong((id *)&self->_string, a3);
}

- (int64_t)integer
{
  return self->_integer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_bytes, 0);
}

@end
