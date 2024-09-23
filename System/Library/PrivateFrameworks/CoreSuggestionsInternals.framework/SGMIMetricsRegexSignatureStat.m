@implementation SGMIMetricsRegexSignatureStat

- (BOOL)hasEmailLanguage
{
  return self->_emailLanguage != 0;
}

- (BOOL)hasRegexLanguage
{
  return self->_regexLanguage != 0;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_type;
  else
    return 10;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;

  if (a3 <= 19)
  {
    if (a3 == 10)
      return CFSTR("Attachment");
    if (a3 == 11)
      return CFSTR("AttachmentLink");
    goto LABEL_14;
  }
  if (a3 == 20)
    return CFSTR("Recipient");
  if (a3 == 30)
    return CFSTR("FollowUpAsk");
  if (a3 != 31)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = CFSTR("FollowUpQuestion");
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Attachment")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AttachmentLink")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Recipient")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FollowUpAsk")) & 1) != 0)
  {
    v4 = 30;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FollowUpQuestion")))
  {
    v4 = 31;
  }
  else
  {
    v4 = 10;
  }

  return v4;
}

- (void)setIncomingMessage:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_incomingMessage = a3;
}

- (void)setHasIncomingMessage:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIncomingMessage
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasSignature
{
  return self->_signature != 0;
}

- (void)setNegativeEngagement:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_negativeEngagement = a3;
}

- (void)setHasNegativeEngagement:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNegativeEngagement
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNoEngagement:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_noEngagement = a3;
}

- (void)setHasNoEngagement:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNoEngagement
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPositiveEngagement:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_positiveEngagement = a3;
}

- (void)setHasPositiveEngagement:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPositiveEngagement
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setBlockedWarningCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_blockedWarningCount = a3;
}

- (void)setHasBlockedWarningCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBlockedWarningCount
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
  v8.super_class = (Class)SGMIMetricsRegexSignatureStat;
  -[SGMIMetricsRegexSignatureStat description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMIMetricsRegexSignatureStat dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *emailLanguage;
  NSString *regexLanguage;
  char has;
  int type;
  __CFString *v9;
  void *v10;
  NSData *signature;
  char v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  emailLanguage = self->_emailLanguage;
  if (emailLanguage)
    objc_msgSend(v3, "setObject:forKey:", emailLanguage, CFSTR("emailLanguage"));
  regexLanguage = self->_regexLanguage;
  if (regexLanguage)
    objc_msgSend(v4, "setObject:forKey:", regexLanguage, CFSTR("regexLanguage"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    type = self->_type;
    if (type <= 19)
    {
      if (type == 10)
      {
        v9 = CFSTR("Attachment");
        goto LABEL_18;
      }
      if (type == 11)
      {
        v9 = CFSTR("AttachmentLink");
        goto LABEL_18;
      }
    }
    else
    {
      switch(type)
      {
        case 20:
          v9 = CFSTR("Recipient");
          goto LABEL_18;
        case 30:
          v9 = CFSTR("FollowUpAsk");
          goto LABEL_18;
        case 31:
          v9 = CFSTR("FollowUpQuestion");
LABEL_18:
          objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("type"));

          has = (char)self->_has;
          goto LABEL_19;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
LABEL_19:
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_incomingMessage);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("incomingMessage"));

  }
  signature = self->_signature;
  if (signature)
    objc_msgSend(v4, "setObject:forKey:", signature, CFSTR("signature"));
  v12 = (char)self->_has;
  if ((v12 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_negativeEngagement);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("negativeEngagement"));

    v12 = (char)self->_has;
    if ((v12 & 4) == 0)
    {
LABEL_25:
      if ((v12 & 8) == 0)
        goto LABEL_26;
LABEL_31:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_positiveEngagement);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("positiveEngagement"));

      if ((*(_BYTE *)&self->_has & 1) == 0)
        return v4;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_noEngagement);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("noEngagement"));

  v12 = (char)self->_has;
  if ((v12 & 8) != 0)
    goto LABEL_31;
LABEL_26:
  if ((v12 & 1) != 0)
  {
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_blockedWarningCount);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("blockedWarningCount"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsRegexSignatureStatReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_emailLanguage)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_regexLanguage)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
  }
  if (self->_signature)
  {
    PBDataWriterWriteDataField();
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v7;
    v6 = (char)self->_has;
    if ((v6 & 4) == 0)
    {
LABEL_13:
      if ((v6 & 8) == 0)
        goto LABEL_14;
LABEL_19:
      PBDataWriterWriteUint32Field();
      v4 = v7;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field();
  v4 = v7;
  v6 = (char)self->_has;
  if ((v6 & 8) != 0)
    goto LABEL_19;
LABEL_14:
  if ((v6 & 1) != 0)
  {
LABEL_15:
    PBDataWriterWriteUint32Field();
    v4 = v7;
  }
LABEL_16:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_emailLanguage)
  {
    objc_msgSend(v4, "setEmailLanguage:");
    v4 = v7;
  }
  if (self->_regexLanguage)
  {
    objc_msgSend(v7, "setRegexLanguage:");
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_type;
    *((_BYTE *)v4 + 64) |= 0x10u;
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *((_BYTE *)v4 + 60) = self->_incomingMessage;
    *((_BYTE *)v4 + 64) |= 0x20u;
  }
  if (self->_signature)
  {
    objc_msgSend(v7, "setSignature:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_negativeEngagement;
    *((_BYTE *)v4 + 64) |= 2u;
    v6 = (char)self->_has;
    if ((v6 & 4) == 0)
    {
LABEL_13:
      if ((v6 & 8) == 0)
        goto LABEL_14;
LABEL_19:
      *((_DWORD *)v4 + 8) = self->_positiveEngagement;
      *((_BYTE *)v4 + 64) |= 8u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v4 + 7) = self->_noEngagement;
  *((_BYTE *)v4 + 64) |= 4u;
  v6 = (char)self->_has;
  if ((v6 & 8) != 0)
    goto LABEL_19;
LABEL_14:
  if ((v6 & 1) != 0)
  {
LABEL_15:
    *((_DWORD *)v4 + 2) = self->_blockedWarningCount;
    *((_BYTE *)v4 + 64) |= 1u;
  }
LABEL_16:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;
  uint64_t v11;
  void *v12;
  char v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_emailLanguage, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_regexLanguage, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_type;
    *(_BYTE *)(v5 + 64) |= 0x10u;
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 60) = self->_incomingMessage;
    *(_BYTE *)(v5 + 64) |= 0x20u;
  }
  v11 = -[NSData copyWithZone:](self->_signature, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v11;

  v13 = (char)self->_has;
  if ((v13 & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_negativeEngagement;
    *(_BYTE *)(v5 + 64) |= 2u;
    v13 = (char)self->_has;
    if ((v13 & 4) == 0)
    {
LABEL_7:
      if ((v13 & 8) == 0)
        goto LABEL_8;
LABEL_13:
      *(_DWORD *)(v5 + 32) = self->_positiveEngagement;
      *(_BYTE *)(v5 + 64) |= 8u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        return (id)v5;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 28) = self->_noEngagement;
  *(_BYTE *)(v5 + 64) |= 4u;
  v13 = (char)self->_has;
  if ((v13 & 8) != 0)
    goto LABEL_13;
LABEL_8:
  if ((v13 & 1) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 8) = self->_blockedWarningCount;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *emailLanguage;
  NSString *regexLanguage;
  char has;
  char v8;
  NSData *signature;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_41;
  emailLanguage = self->_emailLanguage;
  if ((unint64_t)emailLanguage | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](emailLanguage, "isEqual:"))
      goto LABEL_41;
  }
  regexLanguage = self->_regexLanguage;
  if ((unint64_t)regexLanguage | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](regexLanguage, "isEqual:"))
      goto LABEL_41;
  }
  has = (char)self->_has;
  v8 = *((_BYTE *)v4 + 64);
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 14))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 64) & 0x10) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x20) == 0)
      goto LABEL_41;
    if (self->_incomingMessage)
    {
      if (!*((_BYTE *)v4 + 60))
        goto LABEL_41;
    }
    else if (*((_BYTE *)v4 + 60))
    {
      goto LABEL_41;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 0x20) != 0)
  {
    goto LABEL_41;
  }
  signature = self->_signature;
  if (!((unint64_t)signature | *((_QWORD *)v4 + 6)))
    goto LABEL_22;
  if (!-[NSData isEqual:](signature, "isEqual:"))
  {
LABEL_41:
    v10 = 0;
    goto LABEL_42;
  }
  has = (char)self->_has;
  v8 = *((_BYTE *)v4 + 64);
LABEL_22:
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_negativeEngagement != *((_DWORD *)v4 + 6))
      goto LABEL_41;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_41;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_noEngagement != *((_DWORD *)v4 + 7))
      goto LABEL_41;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_41;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_positiveEngagement != *((_DWORD *)v4 + 8))
      goto LABEL_41;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_41;
  }
  v10 = (v8 & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_blockedWarningCount != *((_DWORD *)v4 + 2))
      goto LABEL_41;
    v10 = 1;
  }
LABEL_42:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[NSString hash](self->_emailLanguage, "hash");
  v4 = -[NSString hash](self->_regexLanguage, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v5 = 2654435761 * self->_type;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_3;
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_incomingMessage;
      goto LABEL_6;
    }
  }
  v6 = 0;
LABEL_6:
  v7 = -[NSData hash](self->_signature, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v8 = 2654435761 * self->_negativeEngagement;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_8:
      v9 = 2654435761 * self->_noEngagement;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_9;
LABEL_13:
      v10 = 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_10;
LABEL_14:
      v11 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
    }
  }
  else
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_8;
  }
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_13;
LABEL_9:
  v10 = 2654435761 * self->_positiveEngagement;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_14;
LABEL_10:
  v11 = 2654435761 * self->_blockedWarningCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[SGMIMetricsRegexSignatureStat setEmailLanguage:](self, "setEmailLanguage:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[SGMIMetricsRegexSignatureStat setRegexLanguage:](self, "setRegexLanguage:");
    v4 = v7;
  }
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 0x10) != 0)
  {
    self->_type = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)v4 + 64);
  }
  if ((v5 & 0x20) != 0)
  {
    self->_incomingMessage = *((_BYTE *)v4 + 60);
    *(_BYTE *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[SGMIMetricsRegexSignatureStat setSignature:](self, "setSignature:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 64);
  if ((v6 & 2) != 0)
  {
    self->_negativeEngagement = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 64);
    if ((v6 & 4) == 0)
    {
LABEL_13:
      if ((v6 & 8) == 0)
        goto LABEL_14;
LABEL_19:
      self->_positiveEngagement = *((_DWORD *)v4 + 8);
      *(_BYTE *)&self->_has |= 8u;
      if ((*((_BYTE *)v4 + 64) & 1) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 4) == 0)
  {
    goto LABEL_13;
  }
  self->_noEngagement = *((_DWORD *)v4 + 7);
  *(_BYTE *)&self->_has |= 4u;
  v6 = *((_BYTE *)v4 + 64);
  if ((v6 & 8) != 0)
    goto LABEL_19;
LABEL_14:
  if ((v6 & 1) != 0)
  {
LABEL_15:
    self->_blockedWarningCount = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_16:

}

- (NSString)emailLanguage
{
  return self->_emailLanguage;
}

- (void)setEmailLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_emailLanguage, a3);
}

- (NSString)regexLanguage
{
  return self->_regexLanguage;
}

- (void)setRegexLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_regexLanguage, a3);
}

- (BOOL)incomingMessage
{
  return self->_incomingMessage;
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
}

- (unsigned)negativeEngagement
{
  return self->_negativeEngagement;
}

- (unsigned)noEngagement
{
  return self->_noEngagement;
}

- (unsigned)positiveEngagement
{
  return self->_positiveEngagement;
}

- (unsigned)blockedWarningCount
{
  return self->_blockedWarningCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_regexLanguage, 0);
  objc_storeStrong((id *)&self->_emailLanguage, 0);
}

@end
