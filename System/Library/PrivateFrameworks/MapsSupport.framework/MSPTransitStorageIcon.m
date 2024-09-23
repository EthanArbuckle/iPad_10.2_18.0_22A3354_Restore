@implementation MSPTransitStorageIcon

- (MSPTransitStorageIcon)initWithIcon:(id)a3
{
  id v4;
  MSPTransitStorageIcon *v5;
  MSPTransitStorageIcon *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSPTransitStorageIcon;
  v5 = -[MSPTransitStorageIcon init](&v8, sel_init);
  if (v5)
  {
    -[MSPTransitStorageIcon setIconType:](v5, "setIconType:", objc_msgSend(v4, "iconType"));
    -[MSPTransitStorageIcon setCartoID:](v5, "setCartoID:", objc_msgSend(v4, "cartoID"));
    -[MSPTransitStorageIcon setDefaultTransitType:](v5, "setDefaultTransitType:", objc_msgSend(v4, "defaultTransitType"));
    -[MSPTransitStorageIcon setIconAttributeKey:](v5, "setIconAttributeKey:", objc_msgSend(v4, "iconAttributeKey"));
    -[MSPTransitStorageIcon setIconAttributeValue:](v5, "setIconAttributeValue:", objc_msgSend(v4, "iconAttributeValue"));
    v6 = v5;
  }

  return v5;
}

- (void)setIconType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_iconType = a3;
}

- (void)setHasIconType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIconType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)iconTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("GEOTransitIconTypeSystem");
  if (a3 == 1)
  {
    v3 = CFSTR("GEOTransitIconTypeGeneric");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %ld)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsIconType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GEOTransitIconTypeSystem")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("GEOTransitIconTypeGeneric"));

  return v4;
}

- (void)setCartoID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cartoID = a3;
}

- (void)setHasCartoID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCartoID
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDefaultTransitType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_defaultTransitType = a3;
}

- (void)setHasDefaultTransitType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDefaultTransitType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIconAttributeKey:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_iconAttributeKey = a3;
}

- (void)setHasIconAttributeKey:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIconAttributeKey
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIconAttributeValue:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_iconAttributeValue = a3;
}

- (void)setHasIconAttributeValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIconAttributeValue
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MSPTransitStorageIcon;
  -[MSPTransitStorageIcon description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPTransitStorageIcon dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int iconType;
  __CFString *v6;
  void *v7;
  PBUnknownFields *unknownFields;
  void *v9;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    iconType = self->_iconType;
    if (iconType)
    {
      if (iconType == 1)
      {
        v6 = CFSTR("GEOTransitIconTypeGeneric");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %ld)"), iconType);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v6 = CFSTR("GEOTransitIconTypeSystem");
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("icon_type"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_cartoID);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("cartoID"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_10:
      if ((has & 4) == 0)
        goto LABEL_11;
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_defaultTransitType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("default_transit_type"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_iconAttributeKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("icon_attribute_key"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_iconAttributeValue);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("icon_attribute_value"));

  }
LABEL_13:
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("Unknown Fields"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPTransitStorageIconReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 8) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field();
LABEL_7:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[8] = self->_iconType;
    *((_BYTE *)v4 + 36) |= 0x10u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_cartoID;
  *((_BYTE *)v4 + 36) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
LABEL_11:
    v4[6] = self->_iconAttributeKey;
    *((_BYTE *)v4 + 36) |= 4u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  v4[5] = self->_defaultTransitType;
  *((_BYTE *)v4 + 36) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    v4[7] = self->_iconAttributeValue;
    *((_BYTE *)v4 + 36) |= 8u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char has;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v4 + 32) = self->_iconType;
    *(_BYTE *)(v4 + 36) |= 0x10u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 16) = self->_cartoID;
  *(_BYTE *)(v4 + 36) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
LABEL_11:
    *(_DWORD *)(v4 + 24) = self->_iconAttributeKey;
    *(_BYTE *)(v4 + 36) |= 4u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  *(_DWORD *)(v4 + 20) = self->_defaultTransitType;
  *(_BYTE *)(v4 + 36) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *(_DWORD *)(v4 + 28) = self->_iconAttributeValue;
    *(_BYTE *)(v4 + 36) |= 8u;
  }
LABEL_7:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x10) == 0 || self->_iconType != *((_DWORD *)v4 + 8))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 36) & 0x10) != 0)
  {
LABEL_26:
    v5 = 0;
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_cartoID != *((_DWORD *)v4 + 4))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_defaultTransitType != *((_DWORD *)v4 + 5))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_iconAttributeKey != *((_DWORD *)v4 + 6))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_26;
  }
  v5 = (*((_BYTE *)v4 + 36) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0 || self->_iconAttributeValue != *((_DWORD *)v4 + 7))
      goto LABEL_26;
    v5 = 1;
  }
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v2 = 2654435761 * self->_iconType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_cartoID;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_defaultTransitType;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761 * self->_iconAttributeKey;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_iconAttributeValue;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 0x10) != 0)
  {
    self->_iconType = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)v4 + 36);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_cartoID = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
LABEL_11:
    self->_iconAttributeKey = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 36) & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_defaultTransitType = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v5 & 8) != 0)
  {
LABEL_6:
    self->_iconAttributeValue = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_7:

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (int)iconType
{
  return self->_iconType;
}

- (unsigned)cartoID
{
  return self->_cartoID;
}

- (unsigned)defaultTransitType
{
  return self->_defaultTransitType;
}

- (unsigned)iconAttributeKey
{
  return self->_iconAttributeKey;
}

- (unsigned)iconAttributeValue
{
  return self->_iconAttributeValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
