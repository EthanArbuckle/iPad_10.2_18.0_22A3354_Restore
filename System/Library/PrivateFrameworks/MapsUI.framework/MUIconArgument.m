@implementation MUIconArgument

- (BOOL)hasStyleAttributes
{
  return self->_styleAttributes != 0;
}

- (void)setNightMode:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_nightMode = a3;
}

- (void)setHasNightMode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNightMode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTransparent:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_transparent = a3;
}

- (void)setHasTransparent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTransparent
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)MUIconArgument;
  -[MUIconArgument description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIconArgument dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  MUStyleAttributes *styleAttributes;
  void *v5;
  char has;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  styleAttributes = self->_styleAttributes;
  if (styleAttributes)
  {
    -[MUStyleAttributes dictionaryRepresentation](styleAttributes, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("styleAttributes"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_nightMode);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("nightMode"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_transparent);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("transparent"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MUIconArgumentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_styleAttributes)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
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
  if (self->_styleAttributes)
  {
    v6 = v4;
    objc_msgSend(v4, "setStyleAttributes:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[16] = self->_nightMode;
    v4[20] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[17] = self->_transparent;
    v4[20] |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[MUStyleAttributes copyWithZone:](self->_styleAttributes, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_BYTE *)(v5 + 16) = self->_nightMode;
    *(_BYTE *)(v5 + 20) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 17) = self->_transparent;
    *(_BYTE *)(v5 + 20) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  MUStyleAttributes *styleAttributes;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((_QWORD *)v4 + 1))
  {
    if (!-[MUStyleAttributes isEqual:](styleAttributes, "isEqual:"))
      goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0)
      goto LABEL_14;
    if (self->_nightMode)
    {
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_14;
    }
    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 20) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) != 0)
    {
      if (self->_transparent)
      {
        if (!*((_BYTE *)v4 + 17))
          goto LABEL_14;
      }
      else if (*((_BYTE *)v4 + 17))
      {
        goto LABEL_14;
      }
      v6 = 1;
      goto LABEL_15;
    }
LABEL_14:
    v6 = 0;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[MUStyleAttributes hash](self->_styleAttributes, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_nightMode;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_transparent;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  MUStyleAttributes *styleAttributes;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  styleAttributes = self->_styleAttributes;
  v6 = *((_QWORD *)v4 + 1);
  if (styleAttributes)
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[MUStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[MUIconArgument setStyleAttributes:](self, "setStyleAttributes:");
  }
  v4 = v8;
LABEL_7:
  v7 = *((_BYTE *)v4 + 20);
  if ((v7 & 1) != 0)
  {
    self->_nightMode = *((_BYTE *)v4 + 16);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 20);
  }
  if ((v7 & 2) != 0)
  {
    self->_transparent = *((_BYTE *)v4 + 17);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (MUStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (BOOL)nightMode
{
  return self->_nightMode;
}

- (BOOL)transparent
{
  return self->_transparent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
}

@end
