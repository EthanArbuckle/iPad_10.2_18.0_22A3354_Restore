@implementation SGM2ContactConfirmed

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("ContactConfirmed");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (int)app
{
  if ((*(_WORD *)&self->_has & 1) != 0)
    return self->_app;
  else
    return 0;
}

- (void)setApp:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_app = a3;
}

- (void)setHasApp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasApp
{
  return *(_WORD *)&self->_has & 1;
}

- (id)appAsString:(int)a3
{
  if (a3 < 3)
    return off_1E475FF60[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsApp:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMBannerDisplayAppMail")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMBannerDisplayAppMessages")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMBannerDisplayAppOther")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setFirstNameAdj:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_firstNameAdj = a3;
}

- (void)setHasFirstNameAdj:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasFirstNameAdj
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setLastNameAdj:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_lastNameAdj = a3;
}

- (void)setHasLastNameAdj:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasLastNameAdj
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setMiddleNameAdj:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_middleNameAdj = a3;
}

- (void)setHasMiddleNameAdj:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMiddleNameAdj
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsUpdate:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isUpdate = a3;
}

- (void)setHasIsUpdate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsUpdate
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (int)extracted
{
  if ((*(_WORD *)&self->_has & 2) != 0)
    return self->_extracted;
  else
    return 0;
}

- (void)setExtracted:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_extracted = a3;
}

- (void)setHasExtracted:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasExtracted
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)extractedAsString:(int)a3
{
  if (a3 < 4)
    return off_1E475FF78[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsExtracted:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMBannerExtractionTypeSig")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMBannerExtractionTypePhrase")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMBannerExtractionTypeSigPhrase")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMBannerExtractionTypeOther")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setExtractionModelVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_extractionModelVersion = a3;
}

- (void)setHasExtractionModelVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasExtractionModelVersion
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setSelfId:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_selfId = a3;
}

- (void)setHasSelfId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSelfId
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (int)type
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E475FF98[a3];
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

- (int)uiType
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_uiType;
  else
    return 0;
}

- (void)setUiType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_uiType = a3;
}

- (void)setHasUiType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasUiType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)uiTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E475FFC0[a3];
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
  v8.super_class = (Class)SGM2ContactConfirmed;
  -[SGM2ContactConfirmed description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGM2ContactConfirmed dictionaryRepresentation](self, "dictionaryRepresentation");
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
  __int16 has;
  uint64_t app;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t extracted;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t type;
  __CFString *v18;
  uint64_t uiType;
  __CFString *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    app = self->_app;
    if (app >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_app);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E475FF60[app];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("app"));

    has = (__int16)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_firstNameAdj);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("firstNameAdj"));

    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_10:
      if ((has & 0x100) == 0)
        goto LABEL_11;
      goto LABEL_20;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lastNameAdj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("lastNameAdj"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_middleNameAdj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("middleNameAdj"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      goto LABEL_13;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isUpdate);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("isUpdate"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 4) == 0)
      goto LABEL_14;
    goto LABEL_26;
  }
LABEL_22:
  extracted = self->_extracted;
  if (extracted >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_extracted);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_1E475FF78[extracted];
  }
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("extracted"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_extractionModelVersion);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("extractionModelVersion"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_15:
    if ((has & 8) == 0)
      goto LABEL_16;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_selfId);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("selfId"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_16:
    if ((has & 0x10) == 0)
      return v4;
    goto LABEL_32;
  }
LABEL_28:
  type = self->_type;
  if (type >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = off_1E475FF98[type];
  }
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("type"));

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_32:
    uiType = self->_uiType;
    if (uiType >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_uiType);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E475FFC0[uiType];
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("uiType"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SGM2ContactConfirmedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 0x80) == 0)
        goto LABEL_6;
      goto LABEL_17;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_12;
LABEL_23:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_23;
LABEL_12:
  if ((has & 0x10) != 0)
  {
LABEL_13:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_14:

}

- (void)copyTo:(id)a3
{
  id v4;
  __int16 has;
  id v6;

  v4 = a3;
  if (self->_key)
  {
    v6 = v4;
    objc_msgSend(v4, "setKey:");
    v4 = v6;
  }
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_app;
    *((_WORD *)v4 + 24) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 0x80) == 0)
        goto LABEL_6;
      goto LABEL_17;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  *((_BYTE *)v4 + 40) = self->_firstNameAdj;
  *((_WORD *)v4 + 24) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *((_BYTE *)v4 + 42) = self->_lastNameAdj;
  *((_WORD *)v4 + 24) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  *((_BYTE *)v4 + 43) = self->_middleNameAdj;
  *((_WORD *)v4 + 24) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *((_BYTE *)v4 + 41) = self->_isUpdate;
  *((_WORD *)v4 + 24) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 3) = self->_extracted;
  *((_WORD *)v4 + 24) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 4) = self->_extractionModelVersion;
  *((_WORD *)v4 + 24) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_12;
LABEL_23:
    *((_DWORD *)v4 + 8) = self->_type;
    *((_WORD *)v4 + 24) |= 8u;
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_22:
  *((_BYTE *)v4 + 44) = self->_selfId;
  *((_WORD *)v4 + 24) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_23;
LABEL_12:
  if ((has & 0x10) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 9) = self->_uiType;
    *((_WORD *)v4 + 24) |= 0x10u;
  }
LABEL_14:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int16 has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_app;
    *(_WORD *)(v5 + 48) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 40) = self->_firstNameAdj;
  *(_WORD *)(v5 + 48) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *(_BYTE *)(v5 + 42) = self->_lastNameAdj;
  *(_WORD *)(v5 + 48) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *(_BYTE *)(v5 + 43) = self->_middleNameAdj;
  *(_WORD *)(v5 + 48) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *(_BYTE *)(v5 + 41) = self->_isUpdate;
  *(_WORD *)(v5 + 48) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v5 + 12) = self->_extracted;
  *(_WORD *)(v5 + 48) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v5 + 16) = self->_extractionModelVersion;
  *(_WORD *)(v5 + 48) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
LABEL_21:
    *(_DWORD *)(v5 + 32) = self->_type;
    *(_WORD *)(v5 + 48) |= 8u;
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      return (id)v5;
    goto LABEL_11;
  }
LABEL_20:
  *(_BYTE *)(v5 + 44) = self->_selfId;
  *(_WORD *)(v5 + 48) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_21;
LABEL_10:
  if ((has & 0x10) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 36) = self->_uiType;
    *(_WORD *)(v5 + 48) |= 0x10u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  __int16 has;
  __int16 v7;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_69;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_69;
  }
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 24);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_app != *((_DWORD *)v4 + 2))
      goto LABEL_69;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_69;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0)
      goto LABEL_69;
    if (self->_firstNameAdj)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_69;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_69;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_69;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0)
      goto LABEL_69;
    if (self->_lastNameAdj)
    {
      if (!*((_BYTE *)v4 + 42))
        goto LABEL_69;
    }
    else if (*((_BYTE *)v4 + 42))
    {
      goto LABEL_69;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_69;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 24) & 0x100) == 0)
      goto LABEL_69;
    if (self->_middleNameAdj)
    {
      if (!*((_BYTE *)v4 + 43))
        goto LABEL_69;
    }
    else if (*((_BYTE *)v4 + 43))
    {
      goto LABEL_69;
    }
  }
  else if ((*((_WORD *)v4 + 24) & 0x100) != 0)
  {
    goto LABEL_69;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0)
      goto LABEL_69;
    if (self->_isUpdate)
    {
      if (!*((_BYTE *)v4 + 41))
        goto LABEL_69;
    }
    else if (*((_BYTE *)v4 + 41))
    {
      goto LABEL_69;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_69;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_extracted != *((_DWORD *)v4 + 3))
      goto LABEL_69;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_69;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_extractionModelVersion != *((_DWORD *)v4 + 4))
      goto LABEL_69;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_69;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 24) & 0x200) != 0)
    {
      if (self->_selfId)
      {
        if (!*((_BYTE *)v4 + 44))
          goto LABEL_69;
        goto LABEL_59;
      }
      if (!*((_BYTE *)v4 + 44))
        goto LABEL_59;
    }
LABEL_69:
    v8 = 0;
    goto LABEL_70;
  }
  if ((*((_WORD *)v4 + 24) & 0x200) != 0)
    goto LABEL_69;
LABEL_59:
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_type != *((_DWORD *)v4 + 8))
      goto LABEL_69;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_69;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_uiType != *((_DWORD *)v4 + 9))
      goto LABEL_69;
    v8 = 1;
  }
  else
  {
    v8 = (v7 & 0x10) == 0;
  }
LABEL_70:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  __int16 has;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = -[NSString hash](self->_key, "hash");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v5 = 2654435761 * self->_app;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_firstNameAdj;
      if ((has & 0x80) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v5 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    v7 = 2654435761 * self->_lastNameAdj;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    v8 = 2654435761 * self->_middleNameAdj;
    if ((has & 0x40) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_6:
    v9 = 2654435761 * self->_isUpdate;
    if ((has & 2) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v9 = 0;
  if ((has & 2) != 0)
  {
LABEL_7:
    v10 = 2654435761 * self->_extracted;
    if ((has & 4) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v10 = 0;
  if ((has & 4) != 0)
  {
LABEL_8:
    v11 = 2654435761 * self->_extractionModelVersion;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_9:
    v12 = 2654435761 * self->_selfId;
    if ((has & 8) != 0)
      goto LABEL_10;
LABEL_20:
    v13 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_11;
LABEL_21:
    v14 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_19:
  v12 = 0;
  if ((has & 8) == 0)
    goto LABEL_20;
LABEL_10:
  v13 = 2654435761 * self->_type;
  if ((has & 0x10) == 0)
    goto LABEL_21;
LABEL_11:
  v14 = 2654435761 * self->_uiType;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  id v6;

  v4 = a3;
  if (*((_QWORD *)v4 + 3))
  {
    v6 = v4;
    -[SGM2ContactConfirmed setKey:](self, "setKey:");
    v4 = v6;
  }
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 1) != 0)
  {
    self->_app = *((_DWORD *)v4 + 2);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 24);
    if ((v5 & 0x20) == 0)
    {
LABEL_5:
      if ((v5 & 0x80) == 0)
        goto LABEL_6;
      goto LABEL_17;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_5;
  }
  self->_firstNameAdj = *((_BYTE *)v4 + 40);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  self->_lastNameAdj = *((_BYTE *)v4 + 42);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  self->_middleNameAdj = *((_BYTE *)v4 + 43);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  self->_isUpdate = *((_BYTE *)v4 + 41);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  self->_extracted = *((_DWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  self->_extractionModelVersion = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 8) == 0)
      goto LABEL_12;
LABEL_23:
    self->_type = *((_DWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 8u;
    if ((*((_WORD *)v4 + 24) & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_22:
  self->_selfId = *((_BYTE *)v4 + 44);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 24);
  if ((v5 & 8) != 0)
    goto LABEL_23;
LABEL_12:
  if ((v5 & 0x10) != 0)
  {
LABEL_13:
    self->_uiType = *((_DWORD *)v4 + 9);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_14:

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (BOOL)firstNameAdj
{
  return self->_firstNameAdj;
}

- (BOOL)lastNameAdj
{
  return self->_lastNameAdj;
}

- (BOOL)middleNameAdj
{
  return self->_middleNameAdj;
}

- (BOOL)isUpdate
{
  return self->_isUpdate;
}

- (unsigned)extractionModelVersion
{
  return self->_extractionModelVersion;
}

- (BOOL)selfId
{
  return self->_selfId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
