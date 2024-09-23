@implementation GEOPDSearchKey64Value32Pair

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchKey64Value32Pair;
  -[GEOPDSearchKey64Value32Pair description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchKey64Value32Pair dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  char v3;
  void *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_BYTE *)(a1 + 20);
    if ((v3 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 8));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("key"));

      v3 = *(_BYTE *)(a1 + 20);
    }
    if ((v3 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("value"));

    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchKey64Value32PairReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_key;
    *((_BYTE *)result + 20) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_value;
    *((_BYTE *)result + 20) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_key != *((_QWORD *)v4 + 1))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = (*((_BYTE *)v4 + 20) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0 || self->_value != *((_DWORD *)v4 + 4))
      goto LABEL_11;
    v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v2 = 2654435761u * self->_key;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_value;
  return v3 ^ v2;
}

@end
