@implementation _MRGameControllerPropertiesProtobuf

- (void)setPlayerIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_playerIndex = a3;
}

- (void)setHasPlayerIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPlayerIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasVendorName
{
  return self->_vendorName != 0;
}

- (void)setButtonAUpDelay:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_buttonAUpDelay = a3;
}

- (void)setHasButtonAUpDelay:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasButtonAUpDelay
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)profile
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_profile;
  else
    return 0;
}

- (void)setProfile:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_profile = a3;
}

- (void)setHasProfile:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasProfile
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)profileAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_1E30D0590 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsProfile:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("B239")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Extended")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSupportsExtendedMotion:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_supportsExtendedMotion = a3;
}

- (void)setHasSupportsExtendedMotion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSupportsExtendedMotion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)_MRGameControllerPropertiesProtobuf;
  -[_MRGameControllerPropertiesProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGameControllerPropertiesProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *vendorName;
  char has;
  void *v7;
  void *v9;
  uint64_t profile;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_playerIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("playerIndex"));

  }
  vendorName = self->_vendorName;
  if (vendorName)
    objc_msgSend(v3, "setObject:forKey:", vendorName, CFSTR("vendorName"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
LABEL_11:
    profile = self->_profile;
    if (profile >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_profile);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = *(&off_1E30D0590 + profile);
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("profile"));

    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
    return v3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_buttonAUpDelay);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("buttonAUpDelay"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 8) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsExtendedMotion);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("supportsExtendedMotion"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGameControllerPropertiesProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_vendorName)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
LABEL_11:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 8) != 0)
LABEL_8:
    PBDataWriterWriteBOOLField();
LABEL_9:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[3] = self->_playerIndex;
    *((_BYTE *)v4 + 36) |= 2u;
  }
  if (self->_vendorName)
  {
    v6 = v4;
    objc_msgSend(v4, "setVendorName:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
LABEL_11:
    v4[4] = self->_profile;
    *((_BYTE *)v4 + 36) |= 4u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  v4[2] = self->_buttonAUpDelay;
  *((_BYTE *)v4 + 36) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 8) != 0)
  {
LABEL_8:
    *((_BYTE *)v4 + 32) = self->_supportsExtendedMotion;
    *((_BYTE *)v4 + 36) |= 8u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_playerIndex;
    *(_BYTE *)(v5 + 36) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_vendorName, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    *(_DWORD *)(v6 + 16) = self->_profile;
    *(_BYTE *)(v6 + 36) |= 4u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      return (id)v6;
    goto LABEL_6;
  }
  *(_DWORD *)(v6 + 8) = self->_buttonAUpDelay;
  *(_BYTE *)(v6 + 36) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *(_BYTE *)(v6 + 32) = self->_supportsExtendedMotion;
    *(_BYTE *)(v6 + 36) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *vendorName;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_playerIndex != *((_DWORD *)v4 + 3))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_22;
  }
  vendorName = self->_vendorName;
  if ((unint64_t)vendorName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](vendorName, "isEqual:"))
      goto LABEL_22;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_buttonAUpDelay != *((_DWORD *)v4 + 2))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_22;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_profile != *((_DWORD *)v4 + 4))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_22;
  }
  v7 = (*((_BYTE *)v4 + 36) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) != 0)
    {
      if (self->_supportsExtendedMotion)
      {
        if (!*((_BYTE *)v4 + 32))
          goto LABEL_22;
      }
      else if (*((_BYTE *)v4 + 32))
      {
        goto LABEL_22;
      }
      v7 = 1;
      goto LABEL_23;
    }
LABEL_22:
    v7 = 0;
  }
LABEL_23:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_playerIndex;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_vendorName, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_9:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_7;
LABEL_10:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v5 = 2654435761 * self->_buttonAUpDelay;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_6:
  v6 = 2654435761 * self->_profile;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_10;
LABEL_7:
  v7 = 2654435761 * self->_supportsExtendedMotion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    self->_playerIndex = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    v6 = v4;
    -[_MRGameControllerPropertiesProtobuf setVendorName:](self, "setVendorName:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0)
      goto LABEL_7;
LABEL_11:
    self->_profile = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 36) & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  self->_buttonAUpDelay = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((v5 & 8) != 0)
  {
LABEL_8:
    self->_supportsExtendedMotion = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_9:

}

- (unsigned)playerIndex
{
  return self->_playerIndex;
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (void)setVendorName:(id)a3
{
  objc_storeStrong((id *)&self->_vendorName, a3);
}

- (int)buttonAUpDelay
{
  return self->_buttonAUpDelay;
}

- (BOOL)supportsExtendedMotion
{
  return self->_supportsExtendedMotion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorName, 0);
}

@end
