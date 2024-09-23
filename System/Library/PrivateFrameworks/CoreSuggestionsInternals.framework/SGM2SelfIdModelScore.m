@implementation SGM2SelfIdModelScore

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("SelfIdModelScore");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (int)model
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_model;
  else
    return 0;
}

- (void)setModel:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_model = a3;
}

- (void)setHasModel:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModel
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)modelAsString:(int)a3
{
  if (a3 < 4)
    return off_1E7DA7B98[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsModel:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMSelfIdModelTypeRegex")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMSelfIdModelTypeLogistic")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMSelfIdModelTypeLinear")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMSelfIdModelTypeCoreNLP")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setResult:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_result = a3;
}

- (void)setHasResult:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasResult
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)supervision
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_supervision;
  else
    return 0;
}

- (void)setSupervision:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_supervision = a3;
}

- (void)setHasSupervision:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSupervision
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)supervisionAsString:(int)a3
{
  if (a3 < 5)
    return off_1E7DA7BB8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSupervision:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMSelfIdSupervisionTypeNone")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMSelfIdSupervisionTypeContact")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMSelfIdSupervisionTypeAppleContact")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMSelfIdSupervisionTypePreviousModel")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMSelfIdSupervisionTypeRegex")))
  {
    v4 = 4;
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
  v8.super_class = (Class)SGM2SelfIdModelScore;
  -[SGM2SelfIdModelScore description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGM2SelfIdModelScore dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v9;
  uint64_t supervision;
  __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_result);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("result"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v4;
    goto LABEL_12;
  }
  model = self->_model;
  if (model >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_model);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E7DA7B98[model];
  }
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("model"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) == 0)
    return v4;
LABEL_12:
  supervision = self->_supervision;
  if (supervision >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_supervision);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E7DA7BB8[supervision];
  }
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("supervision"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SGM2SelfIdModelScoreReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_7:

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
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    *((_BYTE *)v4 + 24) = self->_result;
    *((_BYTE *)v4 + 28) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *((_DWORD *)v4 + 4) = self->_model;
  *((_BYTE *)v4 + 28) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 5) = self->_supervision;
    *((_BYTE *)v4 + 28) |= 2u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(_BYTE *)(v5 + 24) = self->_result;
    *(_BYTE *)(v5 + 28) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 16) = self->_model;
  *(_BYTE *)(v5 + 28) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 20) = self->_supervision;
    *(_BYTE *)(v5 + 28) |= 2u;
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
    goto LABEL_21;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_model != *((_DWORD *)v4 + 4))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) != 0)
    {
      if (self->_result)
      {
        if (!*((_BYTE *)v4 + 24))
          goto LABEL_21;
        goto LABEL_17;
      }
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_17;
    }
LABEL_21:
    v6 = 0;
    goto LABEL_22;
  }
  if ((*((_BYTE *)v4 + 28) & 4) != 0)
    goto LABEL_21;
LABEL_17:
  v6 = (*((_BYTE *)v4 + 28) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_supervision != *((_DWORD *)v4 + 5))
      goto LABEL_21;
    v6 = 1;
  }
LABEL_22:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_key, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_model;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_result;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_supervision;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if (*((_QWORD *)v4 + 1))
  {
    v6 = v4;
    -[SGM2SelfIdModelScore setKey:](self, "setKey:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0)
      goto LABEL_5;
LABEL_9:
    self->_result = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  self->_model = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((v5 & 2) != 0)
  {
LABEL_6:
    self->_supervision = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_7:

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (BOOL)result
{
  return self->_result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
