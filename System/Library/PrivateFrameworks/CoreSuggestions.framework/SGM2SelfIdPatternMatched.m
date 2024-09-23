@implementation SGM2SelfIdPatternMatched

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("SelfIdPatternMatched");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (int)patternType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_patternType;
  else
    return 0;
}

- (void)setPatternType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_patternType = a3;
}

- (void)setHasPatternType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPatternType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)patternTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("SGMSIPatternTypeSelfId");
  if (a3 == 1)
  {
    v3 = CFSTR("SGMSIPatternTypeSelfIdRequest");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsPatternType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMSIPatternTypeSelfId")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("SGMSIPatternTypeSelfIdRequest"));

  return v4;
}

- (BOOL)hasPatternHash
{
  return self->_patternHash != 0;
}

- (void)setNameTokens:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_nameTokens = a3;
}

- (void)setHasNameTokens:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNameTokens
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)nameClass
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_nameClass;
  else
    return 0;
}

- (void)setNameClass:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_nameClass = a3;
}

- (void)setHasNameClass:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNameClass
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)nameClassAsString:(int)a3
{
  if (a3 < 3)
    return off_1E475FE70[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNameClass:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMSINameClassificationName")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMSINameClassificationNotName")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMSINameClassificationMaybeName")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setMessageIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_messageIndex = a3;
}

- (void)setHasMessageIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMessageIndex
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)SGM2SelfIdPatternMatched;
  -[SGM2SelfIdPatternMatched description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGM2SelfIdPatternMatched dictionaryRepresentation](self, "dictionaryRepresentation");
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
  int patternType;
  __CFString *v7;
  NSString *patternHash;
  char has;
  void *v10;
  void *v12;
  uint64_t nameClass;
  __CFString *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    patternType = self->_patternType;
    if (patternType)
    {
      if (patternType == 1)
      {
        v7 = CFSTR("SGMSIPatternTypeSelfIdRequest");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_patternType);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = CFSTR("SGMSIPatternTypeSelfId");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("patternType"));

  }
  patternHash = self->_patternHash;
  if (patternHash)
    objc_msgSend(v4, "setObject:forKey:", patternHash, CFSTR("patternHash"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_14;
LABEL_18:
    nameClass = self->_nameClass;
    if (nameClass >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_nameClass);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E475FE70[nameClass];
    }
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("nameClass"));

    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_15;
    return v4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_nameTokens);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("nameTokens"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_18;
LABEL_14:
  if ((has & 1) != 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_messageIndex);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("messageIndex"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SGM2SelfIdPatternMatchedReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_patternHash)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_9;
LABEL_13:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_9:
  if ((has & 1) != 0)
  {
LABEL_10:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_11:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_patternType;
    *((_BYTE *)v4 + 44) |= 8u;
  }
  if (self->_patternHash)
  {
    objc_msgSend(v6, "setPatternHash:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_9;
LABEL_13:
    *((_DWORD *)v4 + 5) = self->_nameClass;
    *((_BYTE *)v4 + 44) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  *((_DWORD *)v4 + 6) = self->_nameTokens;
  *((_BYTE *)v4 + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_9:
  if ((has & 1) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 4) = self->_messageIndex;
    *((_BYTE *)v4 + 44) |= 1u;
  }
LABEL_11:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_patternType;
    *(_BYTE *)(v5 + 44) |= 8u;
  }
  v8 = -[NSString copyWithZone:](self->_patternHash, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
LABEL_9:
    *(_DWORD *)(v5 + 20) = self->_nameClass;
    *(_BYTE *)(v5 + 44) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return (id)v5;
    goto LABEL_6;
  }
  *(_DWORD *)(v5 + 24) = self->_nameTokens;
  *(_BYTE *)(v5 + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 1) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 16) = self->_messageIndex;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  char has;
  char v7;
  NSString *patternHash;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_26;
  }
  has = (char)self->_has;
  v7 = *((_BYTE *)v4 + 44);
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0 || self->_patternType != *((_DWORD *)v4 + 10))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
    goto LABEL_26;
  }
  patternHash = self->_patternHash;
  if ((unint64_t)patternHash | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](patternHash, "isEqual:"))
    {
LABEL_26:
      v9 = 0;
      goto LABEL_27;
    }
    has = (char)self->_has;
    v7 = *((_BYTE *)v4 + 44);
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_nameTokens != *((_DWORD *)v4 + 6))
      goto LABEL_26;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_nameClass != *((_DWORD *)v4 + 5))
      goto LABEL_26;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_26;
  }
  v9 = (v7 & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_messageIndex != *((_DWORD *)v4 + 4))
      goto LABEL_26;
    v9 = 1;
  }
LABEL_27:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_key, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v4 = 2654435761 * self->_patternType;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_patternHash, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_9:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_7;
LABEL_10:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  v6 = 2654435761 * self->_nameTokens;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_6:
  v7 = 2654435761 * self->_nameClass;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_7:
  v8 = 2654435761 * self->_messageIndex;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[SGM2SelfIdPatternMatched setKey:](self, "setKey:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
    self->_patternType = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[SGM2SelfIdPatternMatched setPatternHash:](self, "setPatternHash:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0)
      goto LABEL_9;
LABEL_13:
    self->_nameClass = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 44) & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  self->_nameTokens = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 2) != 0)
    goto LABEL_13;
LABEL_9:
  if ((v5 & 1) != 0)
  {
LABEL_10:
    self->_messageIndex = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_11:

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSString)patternHash
{
  return self->_patternHash;
}

- (void)setPatternHash:(id)a3
{
  objc_storeStrong((id *)&self->_patternHash, a3);
}

- (unsigned)nameTokens
{
  return self->_nameTokens;
}

- (unsigned)messageIndex
{
  return self->_messageIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patternHash, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
