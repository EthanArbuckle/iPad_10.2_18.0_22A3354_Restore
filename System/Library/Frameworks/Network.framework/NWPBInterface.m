@implementation NWPBInterface

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NWPBInterface;
  -[NWPBInterface description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPBInterface dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t type;
  __CFString *v6;
  uint64_t subtype;
  __CFString *v8;
  NSString *name;
  char v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    type = self->_type;
    if (type >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E14A9D00[type];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("type"));

    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    subtype = self->_subtype;
    if (subtype >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_subtype);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E14A9D28[subtype];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("subtype"));

  }
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  v10 = (char)self->_has;
  if ((v10 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_index);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("index"));

    v10 = (char)self->_has;
    if ((v10 & 2) == 0)
    {
LABEL_15:
      if ((v10 & 1) == 0)
        goto LABEL_16;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_generation);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("generation"));

  v10 = (char)self->_has;
  if ((v10 & 1) == 0)
  {
LABEL_16:
    if ((v10 & 8) == 0)
      goto LABEL_17;
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_mtu);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("mtu"));

    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      return v3;
    goto LABEL_18;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_delegateIndex);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("delegateIndex"));

  v10 = (char)self->_has;
  if ((v10 & 8) != 0)
    goto LABEL_23;
LABEL_17:
  if ((v10 & 0x40) != 0)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_expensive);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("expensive"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NWPBInterfaceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_name)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = (char)self->_has;
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 1) == 0)
        goto LABEL_10;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  v5 = (char)self->_has;
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0)
      goto LABEL_11;
LABEL_17:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  v5 = (char)self->_has;
  if ((v5 & 8) != 0)
    goto LABEL_17;
LABEL_11:
  if ((v5 & 0x40) != 0)
LABEL_12:
    PBDataWriterWriteBOOLField();
LABEL_13:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  char v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_type;
    *(_BYTE *)(v5 + 44) |= 0x20u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_subtype;
    *(_BYTE *)(v5 + 44) |= 0x10u;
  }
  v8 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v8;

  v10 = (char)self->_has;
  if ((v10 & 4) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_index;
    *(_BYTE *)(v6 + 44) |= 4u;
    v10 = (char)self->_has;
    if ((v10 & 2) == 0)
    {
LABEL_7:
      if ((v10 & 1) == 0)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v6 + 12) = self->_generation;
  *(_BYTE *)(v6 + 44) |= 2u;
  v10 = (char)self->_has;
  if ((v10 & 1) == 0)
  {
LABEL_8:
    if ((v10 & 8) == 0)
      goto LABEL_9;
LABEL_15:
    *(_DWORD *)(v6 + 20) = self->_mtu;
    *(_BYTE *)(v6 + 44) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      return (id)v6;
    goto LABEL_10;
  }
LABEL_14:
  *(_DWORD *)(v6 + 8) = self->_delegateIndex;
  *(_BYTE *)(v6 + 44) |= 1u;
  v10 = (char)self->_has;
  if ((v10 & 8) != 0)
    goto LABEL_15;
LABEL_9:
  if ((v10 & 0x40) != 0)
  {
LABEL_10:
    *(_BYTE *)(v6 + 40) = self->_expensive;
    *(_BYTE *)(v6 + 44) |= 0x40u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *name;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 44);
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x20) == 0 || self->_type != *((_DWORD *)v4 + 9))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 44) & 0x20) != 0)
  {
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x10) == 0 || self->_subtype != *((_DWORD *)v4 + 8))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 44) & 0x10) != 0)
  {
    goto LABEL_37;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_37;
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 44);
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_index != *((_DWORD *)v4 + 4))
      goto LABEL_37;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_37;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_generation != *((_DWORD *)v4 + 3))
      goto LABEL_37;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_37;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_delegateIndex != *((_DWORD *)v4 + 2))
      goto LABEL_37;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_37;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_mtu != *((_DWORD *)v4 + 5))
      goto LABEL_37;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_37;
  }
  v8 = (v6 & 0x40) == 0;
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) != 0)
    {
      if (self->_expensive)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_37;
      }
      else if (*((_BYTE *)v4 + 40))
      {
        goto LABEL_37;
      }
      v8 = 1;
      goto LABEL_38;
    }
LABEL_37:
    v8 = 0;
  }
LABEL_38:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v3 = 2654435761 * self->_type;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_subtype;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_name, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v6 = 2654435761 * self->_index;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_8:
      v7 = 2654435761 * self->_generation;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_9;
      goto LABEL_14;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_8;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_9:
    v8 = 2654435761 * self->_delegateIndex;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_10;
LABEL_15:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_11;
LABEL_16:
    v10 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v5;
  }
LABEL_14:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_15;
LABEL_10:
  v9 = 2654435761 * self->_mtu;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_16;
LABEL_11:
  v10 = 2654435761 * self->_expensive;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
