@implementation SGM2ContactDetailConfirmed

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("ContactDetailConfirmed");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E4761760[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMContactDetailTypeEmail")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMContactDetailTypePhone")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMContactDetailTypeAddress")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMContactDetailTypeOther")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMContactDetailTypeBirthday")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)extracted
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_extracted;
  else
    return 0;
}

- (void)setExtracted:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_extracted = a3;
}

- (void)setHasExtracted:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExtracted
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)extractedAsString:(int)a3
{
  if (a3 < 5)
    return off_1E4761788[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsExtracted:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMDetailExtractionTypeSig")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMDetailExtractionTypePhrase")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMDetailExtractionTypeSigPhrase")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMDetailExtractionTypeInteraction")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMDetailExtractionTypeOther")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setExtractionModelVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_extractionModelVersion = a3;
}

- (void)setHasExtractionModelVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExtractionModelVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)uiType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_uiType;
  else
    return 0;
}

- (void)setUiType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_uiType = a3;
}

- (void)setHasUiType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUiType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)uiTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E47617B0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUiType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Banner")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DontSuggestButton")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Other")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Notification")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)SGM2ContactDetailConfirmed;
  -[SGM2ContactDetailConfirmed description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGM2ContactDetailConfirmed dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *key;
  char has;
  uint64_t type;
  __CFString *v8;
  uint64_t extracted;
  __CFString *v10;
  void *v11;
  uint64_t uiType;
  __CFString *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    type = self->_type;
    if (type >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E4761760[type];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("type"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
LABEL_16:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_extractionModelVersion);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("extractionModelVersion"));

      if ((*(_BYTE *)&self->_has & 8) == 0)
        return v4;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  extracted = self->_extracted;
  if (extracted >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_extracted);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E4761788[extracted];
  }
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("extracted"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_16;
LABEL_6:
  if ((has & 8) == 0)
    return v4;
LABEL_17:
  uiType = self->_uiType;
  if (uiType >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_uiType);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_1E47617B0[uiType];
  }
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("uiType"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SGM2ContactDetailConfirmedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
LABEL_11:
      PBDataWriterWriteUint32Field();
      v4 = v6;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_8:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_key)
  {
    v6 = v4;
    objc_msgSend(v4, "setKey:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_type;
    *((_BYTE *)v4 + 32) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
LABEL_11:
      *((_DWORD *)v4 + 3) = self->_extractionModelVersion;
      *((_BYTE *)v4 + 32) |= 2u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 2) = self->_extracted;
  *((_BYTE *)v4 + 32) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 7) = self->_uiType;
    *((_BYTE *)v4 + 32) |= 8u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_type;
    *(_BYTE *)(v5 + 32) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      *(_DWORD *)(v5 + 12) = self->_extractionModelVersion;
      *(_BYTE *)(v5 + 32) |= 2u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        return (id)v5;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 8) = self->_extracted;
  *(_BYTE *)(v5 + 32) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 28) = self->_uiType;
    *(_BYTE *)(v5 + 32) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_type != *((_DWORD *)v4 + 6))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
LABEL_23:
    v6 = 0;
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_extracted != *((_DWORD *)v4 + 2))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_extractionModelVersion != *((_DWORD *)v4 + 3))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_23;
  }
  v6 = (*((_BYTE *)v4 + 32) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0 || self->_uiType != *((_DWORD *)v4 + 7))
      goto LABEL_23;
    v6 = 1;
  }
LABEL_24:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_key, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4 = 2654435761 * self->_type;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_extracted;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_extractionModelVersion;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_uiType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if (*((_QWORD *)v4 + 2))
  {
    v6 = v4;
    -[SGM2ContactDetailConfirmed setKey:](self, "setKey:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 4) != 0)
  {
    self->_type = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 32);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0)
        goto LABEL_6;
LABEL_11:
      self->_extractionModelVersion = *((_DWORD *)v4 + 3);
      *(_BYTE *)&self->_has |= 2u;
      if ((*((_BYTE *)v4 + 32) & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_extracted = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 2) != 0)
    goto LABEL_11;
LABEL_6:
  if ((v5 & 8) != 0)
  {
LABEL_7:
    self->_uiType = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_8:

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (unsigned)extractionModelVersion
{
  return self->_extractionModelVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
