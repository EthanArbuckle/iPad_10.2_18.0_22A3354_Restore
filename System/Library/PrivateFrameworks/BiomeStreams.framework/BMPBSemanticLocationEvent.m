@implementation BMPBSemanticLocationEvent

- (void)setStarting:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_starting = a3;
}

- (void)setHasStarting:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStarting
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)userSpecificPlaceType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_userSpecificPlaceType;
  else
    return 0;
}

- (void)setUserSpecificPlaceType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_userSpecificPlaceType = a3;
}

- (void)setHasUserSpecificPlaceType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUserSpecificPlaceType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)userSpecificPlaceTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E2648DB0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUserSpecificPlaceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unkown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Home")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Work")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("School")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Gym")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)placeType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_placeType;
  else
    return 0;
}

- (void)setPlaceType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_placeType = a3;
}

- (void)setHasPlaceType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlaceType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)placeTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E2648DD8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPlaceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AreaOfInterest")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PointOfInterest")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Address")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasLoiIdentifier
{
  return self->_loiIdentifier != 0;
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
  v8.super_class = (Class)BMPBSemanticLocationEvent;
  -[BMPBSemanticLocationEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBSemanticLocationEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  uint64_t userSpecificPlaceType;
  __CFString *v7;
  uint64_t placeType;
  __CFString *v9;
  NSString *loiIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_6:
    userSpecificPlaceType = self->_userSpecificPlaceType;
    if (userSpecificPlaceType >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_userSpecificPlaceType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E2648DB0[userSpecificPlaceType];
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("userSpecificPlaceType"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_14;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_starting);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("starting"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_6;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_10:
    placeType = self->_placeType;
    if (placeType >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_placeType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E2648DD8[placeType];
    }
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("placeType"));

  }
LABEL_14:
  loiIdentifier = self->_loiIdentifier;
  if (loiIdentifier)
    objc_msgSend(v3, "setObject:forKey:", loiIdentifier, CFSTR("loiIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBSemanticLocationEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_5:
  if (self->_loiIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  _BYTE *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[24] = self->_starting;
    v4[28] |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 5) = self->_userSpecificPlaceType;
  v4[28] |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *((_DWORD *)v4 + 4) = self->_placeType;
    v4[28] |= 1u;
  }
LABEL_5:
  if (self->_loiIdentifier)
  {
    v6 = v4;
    objc_msgSend(v4, "setLoiIdentifier:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 20) = self->_userSpecificPlaceType;
    *(_BYTE *)(v5 + 28) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_BYTE *)(v5 + 24) = self->_starting;
  *(_BYTE *)(v5 + 28) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 16) = self->_placeType;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_loiIdentifier, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *loiIdentifier;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) != 0)
    {
      if (self->_starting)
      {
        if (!*((_BYTE *)v4 + 24))
          goto LABEL_22;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_10;
    }
LABEL_22:
    v6 = 0;
    goto LABEL_23;
  }
  if ((*((_BYTE *)v4 + 28) & 4) != 0)
    goto LABEL_22;
LABEL_10:
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_userSpecificPlaceType != *((_DWORD *)v4 + 5))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_placeType != *((_DWORD *)v4 + 4))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_22;
  }
  loiIdentifier = self->_loiIdentifier;
  if ((unint64_t)loiIdentifier | *((_QWORD *)v4 + 1))
    v6 = -[NSString isEqual:](loiIdentifier, "isEqual:");
  else
    v6 = 1;
LABEL_23:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4 ^ -[NSString hash](self->_loiIdentifier, "hash");
  }
  v2 = 2654435761 * self->_starting;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_userSpecificPlaceType;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_placeType;
  return v3 ^ v2 ^ v4 ^ -[NSString hash](self->_loiIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 4) != 0)
  {
    self->_starting = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 28);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_userSpecificPlaceType = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_4:
    self->_placeType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:
  if (*((_QWORD *)v4 + 1))
  {
    v6 = v4;
    -[BMPBSemanticLocationEvent setLoiIdentifier:](self, "setLoiIdentifier:");
    v4 = v6;
  }

}

- (BOOL)starting
{
  return self->_starting;
}

- (NSString)loiIdentifier
{
  return self->_loiIdentifier;
}

- (void)setLoiIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_loiIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loiIdentifier, 0);
}

@end
