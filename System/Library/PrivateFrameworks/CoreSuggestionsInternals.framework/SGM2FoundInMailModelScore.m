@implementation SGM2FoundInMailModelScore

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("FoundInMailModelScore");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (int)model
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_model;
  else
    return 0;
}

- (void)setModel:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_model = a3;
}

- (void)setHasModel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasModel
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)modelAsString:(int)a3
{
  if (a3 < 4)
    return off_1E7DA7FD8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsModel:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMFoundInMailModelTypeRegex")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMFoundInMailModelTypeLogistic")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMFoundInMailModelTypeLinear")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMFoundInMailModelTypeNaiveBayes")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)contactDetail
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_contactDetail;
  else
    return 0;
}

- (void)setContactDetail:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_contactDetail = a3;
}

- (void)setHasContactDetail:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContactDetail
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)contactDetailAsString:(int)a3
{
  if (a3 < 5)
    return off_1E7DA7FF8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsContactDetail:(id)a3
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

- (void)setResult:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_result = a3;
}

- (void)setHasResult:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasResult
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setCorrect:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_correct = a3;
}

- (void)setHasCorrect:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasCorrect
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (int)mode
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_mode;
  else
    return 0;
}

- (void)setMode:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_mode = a3;
}

- (void)setHasMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)modeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E7DA8020[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGFoundInMailModelModeTraining")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGFoundInMailModelModeEvaluation")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGFoundInMailModelModePrediction")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)supervision
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_supervision;
  else
    return 0;
}

- (void)setSupervision:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_supervision = a3;
}

- (void)setHasSupervision:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSupervision
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)supervisionAsString:(int)a3
{
  if (a3 < 4)
    return off_1E7DA8038[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSupervision:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMFoundInMailSupervisionTypeNone")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMFoundInMailSupervisionTypeContact")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMFoundInMailSupervisionTypeAppleContact")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMFoundInMailSupervisionTypePreviousModel")))
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
  v8.super_class = (Class)SGM2FoundInMailModelScore;
  -[SGM2FoundInMailModelScore description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGM2FoundInMailModelScore dictionaryRepresentation](self, "dictionaryRepresentation");
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
  uint64_t model;
  __CFString *v8;
  uint64_t contactDetail;
  __CFString *v10;
  void *v11;
  void *v12;
  uint64_t mode;
  __CFString *v14;
  uint64_t supervision;
  __CFString *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    model = self->_model;
    if (model >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_model);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E7DA7FD8[model];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("model"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    contactDetail = self->_contactDetail;
    if (contactDetail >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_contactDetail);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E7DA7FF8[contactDetail];
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("contactDetail"));

    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_result);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("result"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_15:
      if ((has & 2) == 0)
        goto LABEL_16;
      goto LABEL_20;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_correct);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("correct"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_16:
    if ((has & 8) == 0)
      return v4;
    goto LABEL_24;
  }
LABEL_20:
  mode = self->_mode;
  if (mode >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mode);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_1E7DA8020[mode];
  }
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("mode"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_24:
    supervision = self->_supervision;
    if (supervision >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_supervision);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E7DA8038[supervision];
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("supervision"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SGM2FoundInMailModelScoreReadFrom((uint64_t)self, (uint64_t)a3);
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
      if ((has & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
LABEL_15:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_15;
LABEL_8:
  if ((has & 8) != 0)
  {
LABEL_9:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_10:

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
    *((_DWORD *)v4 + 7) = self->_model;
    *((_BYTE *)v4 + 40) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 2) = self->_contactDetail;
  *((_BYTE *)v4 + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  *((_BYTE *)v4 + 37) = self->_result;
  *((_BYTE *)v4 + 40) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
LABEL_15:
    *((_DWORD *)v4 + 6) = self->_mode;
    *((_BYTE *)v4 + 40) |= 2u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_14:
  *((_BYTE *)v4 + 36) = self->_correct;
  *((_BYTE *)v4 + 40) |= 0x10u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_15;
LABEL_8:
  if ((has & 8) != 0)
  {
LABEL_9:
    *((_DWORD *)v4 + 8) = self->_supervision;
    *((_BYTE *)v4 + 40) |= 8u;
  }
LABEL_10:

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
    *(_DWORD *)(v5 + 28) = self->_model;
    *(_BYTE *)(v5 + 40) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 8) = self->_contactDetail;
  *(_BYTE *)(v5 + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *(_BYTE *)(v5 + 37) = self->_result;
  *(_BYTE *)(v5 + 40) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
LABEL_13:
    *(_DWORD *)(v5 + 24) = self->_mode;
    *(_BYTE *)(v5 + 40) |= 2u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      return (id)v5;
    goto LABEL_7;
  }
LABEL_12:
  *(_BYTE *)(v5 + 36) = self->_correct;
  *(_BYTE *)(v5 + 40) |= 0x10u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    *(_DWORD *)(v5 + 32) = self->_supervision;
    *(_BYTE *)(v5 + 40) |= 8u;
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
    goto LABEL_39;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_model != *((_DWORD *)v4 + 7))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_contactDetail != *((_DWORD *)v4 + 2))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 0x20) == 0)
      goto LABEL_39;
    if (self->_result)
    {
      if (!*((_BYTE *)v4 + 37))
        goto LABEL_39;
    }
    else if (*((_BYTE *)v4 + 37))
    {
      goto LABEL_39;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 0x20) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 0x10) != 0)
    {
      if (self->_correct)
      {
        if (!*((_BYTE *)v4 + 36))
          goto LABEL_39;
        goto LABEL_30;
      }
      if (!*((_BYTE *)v4 + 36))
        goto LABEL_30;
    }
LABEL_39:
    v6 = 0;
    goto LABEL_40;
  }
  if ((*((_BYTE *)v4 + 40) & 0x10) != 0)
    goto LABEL_39;
LABEL_30:
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_mode != *((_DWORD *)v4 + 6))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_39;
  }
  v6 = (*((_BYTE *)v4 + 40) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0 || self->_supervision != *((_DWORD *)v4 + 8))
      goto LABEL_39;
    v6 = 1;
  }
LABEL_40:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[NSString hash](self->_key, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4 = 2654435761 * self->_model;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_contactDetail;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_result;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_correct;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_12:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_7;
LABEL_13:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_11:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_12;
LABEL_6:
  v8 = 2654435761 * self->_mode;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_13;
LABEL_7:
  v9 = 2654435761 * self->_supervision;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
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
    -[SGM2FoundInMailModelScore setKey:](self, "setKey:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 4) != 0)
  {
    self->_model = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 40);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_contactDetail = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  self->_result = *((_BYTE *)v4 + 37);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 2) == 0)
      goto LABEL_8;
LABEL_15:
    self->_mode = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 40) & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_14:
  self->_correct = *((_BYTE *)v4 + 36);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 2) != 0)
    goto LABEL_15;
LABEL_8:
  if ((v5 & 8) != 0)
  {
LABEL_9:
    self->_supervision = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_10:

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (BOOL)result
{
  return self->_result;
}

- (BOOL)correct
{
  return self->_correct;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
