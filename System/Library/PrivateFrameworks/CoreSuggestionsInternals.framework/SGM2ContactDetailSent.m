@implementation SGM2ContactDetailSent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("ContactDetailSent");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (int)source
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_source;
  else
    return 0;
}

- (void)setSource:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSource
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)sourceAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("SGMDocumentTypeEmail");
  if (a3 == 1)
  {
    v3 = CFSTR("SGMDocumentTypeMessage");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMDocumentTypeEmail")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("SGMDocumentTypeMessage"));

  return v4;
}

- (int)detail
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_detail;
  else
    return 0;
}

- (void)setDetail:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_detail = a3;
}

- (void)setHasDetail:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDetail
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)detailAsString:(int)a3
{
  if (a3 < 5)
    return off_1E7DA7F40[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDetail:(id)a3
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

- (int)foundIn
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_foundIn;
  else
    return 0;
}

- (void)setFoundIn:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_foundIn = a3;
}

- (void)setHasFoundIn:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFoundIn
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)foundInAsString:(int)a3
{
  if (a3 < 4)
    return off_1E7DA7F68[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFoundIn:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMContactDetailFoundInNotFound")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMContactDetailFoundInSenderCNContact")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMContactDetailFoundInOtherCNContact")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMContactDetailFoundInSuggestions")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setHasName:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_hasName = a3;
}

- (void)setHasHasName:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasHasName
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (int)tokens
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_tokens;
  else
    return 0;
}

- (void)setTokens:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_tokens = a3;
}

- (void)setHasTokens:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTokens
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)tokensAsString:(int)a3
{
  if (a3 < 5)
    return off_1E7DA7F88[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTokens:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMLowCount0")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMLowCount1")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMLowCount2")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMLowCount3to4")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMLowCount5orMore")))
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
  v8.super_class = (Class)SGM2ContactDetailSent;
  -[SGM2ContactDetailSent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGM2ContactDetailSent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  int source;
  __CFString *v8;
  uint64_t detail;
  __CFString *v10;
  uint64_t foundIn;
  __CFString *v12;
  void *v13;
  uint64_t tokens;
  __CFString *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    source = self->_source;
    if (source)
    {
      if (source == 1)
      {
        v8 = CFSTR("SGMDocumentTypeMessage");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_source);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v8 = CFSTR("SGMDocumentTypeEmail");
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("source"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  detail = self->_detail;
  if (detail >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_detail);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E7DA7F40[detail];
  }
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("detail"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasName);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("hasName"));

    if ((*(_BYTE *)&self->_has & 8) == 0)
      return v4;
    goto LABEL_24;
  }
LABEL_19:
  foundIn = self->_foundIn;
  if (foundIn >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_foundIn);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_1E7DA7F68[foundIn];
  }
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("foundIn"));

  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_23;
LABEL_7:
  if ((has & 8) == 0)
    return v4;
LABEL_24:
  tokens = self->_tokens;
  if (tokens >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_tokens);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_1E7DA7F88[tokens];
  }
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("tokens"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SGM2ContactDetailSentReadFrom((uint64_t)self, (uint64_t)a3);
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
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
LABEL_13:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_13;
LABEL_7:
  if ((has & 8) != 0)
  {
LABEL_8:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_9:

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
    *((_DWORD *)v4 + 6) = self->_source;
    *((_BYTE *)v4 + 36) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 2) = self->_detail;
  *((_BYTE *)v4 + 36) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
LABEL_13:
    *((_BYTE *)v4 + 32) = self->_hasName;
    *((_BYTE *)v4 + 36) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_12:
  *((_DWORD *)v4 + 3) = self->_foundIn;
  *((_BYTE *)v4 + 36) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_13;
LABEL_7:
  if ((has & 8) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 7) = self->_tokens;
    *((_BYTE *)v4 + 36) |= 8u;
  }
LABEL_9:

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
    *(_DWORD *)(v5 + 24) = self->_source;
    *(_BYTE *)(v5 + 36) |= 4u;
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
  *(_DWORD *)(v5 + 8) = self->_detail;
  *(_BYTE *)(v5 + 36) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
LABEL_11:
    *(_BYTE *)(v5 + 32) = self->_hasName;
    *(_BYTE *)(v5 + 36) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      return (id)v5;
    goto LABEL_6;
  }
LABEL_10:
  *(_DWORD *)(v5 + 12) = self->_foundIn;
  *(_BYTE *)(v5 + 36) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 28) = self->_tokens;
    *(_BYTE *)(v5 + 36) |= 8u;
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
    goto LABEL_31;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_source != *((_DWORD *)v4 + 6))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_detail != *((_DWORD *)v4 + 2))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_foundIn != *((_DWORD *)v4 + 3))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x10) != 0)
    {
      if (self->_hasName)
      {
        if (!*((_BYTE *)v4 + 32))
          goto LABEL_31;
        goto LABEL_27;
      }
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_27;
    }
LABEL_31:
    v6 = 0;
    goto LABEL_32;
  }
  if ((*((_BYTE *)v4 + 36) & 0x10) != 0)
    goto LABEL_31;
LABEL_27:
  v6 = (*((_BYTE *)v4 + 36) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0 || self->_tokens != *((_DWORD *)v4 + 7))
      goto LABEL_31;
    v6 = 1;
  }
LABEL_32:

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

  v3 = -[NSString hash](self->_key, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4 = 2654435761 * self->_source;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_detail;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_foundIn;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_5;
LABEL_10:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
LABEL_11:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_9:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_10;
LABEL_5:
  v7 = 2654435761 * self->_hasName;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_11;
LABEL_6:
  v8 = 2654435761 * self->_tokens;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
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
    -[SGM2ContactDetailSent setKey:](self, "setKey:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 4) != 0)
  {
    self->_source = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 36);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_detail = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
LABEL_13:
    self->_hasName = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 0x10u;
    if ((*((_BYTE *)v4 + 36) & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_12:
  self->_foundIn = *((_DWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 0x10) != 0)
    goto LABEL_13;
LABEL_7:
  if ((v5 & 8) != 0)
  {
LABEL_8:
    self->_tokens = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_9:

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (BOOL)hasName
{
  return self->_hasName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
