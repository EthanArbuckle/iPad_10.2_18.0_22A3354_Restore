@implementation MXRecognitionToken

- (BOOL)hasTokenText
{
  return self->_tokenText != 0;
}

- (void)setStartMilliSeconds:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_startMilliSeconds = a3;
}

- (void)setHasStartMilliSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStartMilliSeconds
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setEndMilliSeconds:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_endMilliSeconds = a3;
}

- (void)setHasEndMilliSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndMilliSeconds
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSilenceStartMilliSeconds:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_silenceStartMilliSeconds = a3;
}

- (void)setHasSilenceStartMilliSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSilenceStartMilliSeconds
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setConfidence:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setAddSpaceAfter:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_addSpaceAfter = a3;
}

- (void)setHasAddSpaceAfter:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasAddSpaceAfter
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasPhoneSeq
{
  return self->_phoneSeq != 0;
}

- (BOOL)hasIpaPhoneSeq
{
  return self->_ipaPhoneSeq != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)MXRecognitionToken;
  -[MXRecognitionToken description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXRecognitionToken dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *tokenText;
  char has;
  void *v7;
  NSString *phoneSeq;
  NSString *ipaPhoneSeq;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  tokenText = self->_tokenText;
  if (tokenText)
    objc_msgSend(v3, "setObject:forKey:", tokenText, CFSTR("token_text"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_startMilliSeconds);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("start_milli_seconds"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_endMilliSeconds);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("end_milli_seconds"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_silenceStartMilliSeconds);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("silence_start_milli_seconds"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_confidence);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("confidence"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_addSpaceAfter);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("add_space_after"));

  }
LABEL_9:
  phoneSeq = self->_phoneSeq;
  if (phoneSeq)
    objc_msgSend(v4, "setObject:forKey:", phoneSeq, CFSTR("phone_seq"));
  ipaPhoneSeq = self->_ipaPhoneSeq;
  if (ipaPhoneSeq)
    objc_msgSend(v4, "setObject:forKey:", ipaPhoneSeq, CFSTR("ipa_phone_seq"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MXRecognitionTokenReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_tokenText)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_9:
  if (self->_phoneSeq)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_ipaPhoneSeq)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_tokenText)
  {
    objc_msgSend(v4, "setTokenText:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 9) = self->_startMilliSeconds;
    *((_BYTE *)v4 + 52) |= 8u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 3) = self->_endMilliSeconds;
  *((_BYTE *)v4 + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v4 + 8) = self->_silenceStartMilliSeconds;
  *((_BYTE *)v4 + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  *((_DWORD *)v4 + 2) = self->_confidence;
  *((_BYTE *)v4 + 52) |= 1u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    *((_BYTE *)v4 + 48) = self->_addSpaceAfter;
    *((_BYTE *)v4 + 52) |= 0x10u;
  }
LABEL_9:
  if (self->_phoneSeq)
  {
    objc_msgSend(v6, "setPhoneSeq:");
    v4 = v6;
  }
  if (self->_ipaPhoneSeq)
  {
    objc_msgSend(v6, "setIpaPhoneSeq:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_tokenText, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_startMilliSeconds;
    *(_BYTE *)(v5 + 52) |= 8u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 12) = self->_endMilliSeconds;
  *(_BYTE *)(v5 + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
LABEL_11:
    *(_DWORD *)(v5 + 8) = self->_confidence;
    *(_BYTE *)(v5 + 52) |= 1u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  *(_DWORD *)(v5 + 32) = self->_silenceStartMilliSeconds;
  *(_BYTE *)(v5 + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
  {
LABEL_6:
    *(_BYTE *)(v5 + 48) = self->_addSpaceAfter;
    *(_BYTE *)(v5 + 52) |= 0x10u;
  }
LABEL_7:
  v9 = -[NSString copyWithZone:](self->_phoneSeq, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[NSString copyWithZone:](self->_ipaPhoneSeq, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *tokenText;
  NSString *phoneSeq;
  NSString *ipaPhoneSeq;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  tokenText = self->_tokenText;
  if ((unint64_t)tokenText | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](tokenText, "isEqual:"))
      goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 8) == 0 || self->_startMilliSeconds != *((_DWORD *)v4 + 9))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_endMilliSeconds != *((_DWORD *)v4 + 3))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_silenceStartMilliSeconds != *((_DWORD *)v4 + 8))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_confidence != *((_DWORD *)v4 + 2))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 0x10) != 0)
    {
      if (self->_addSpaceAfter)
      {
        if (!*((_BYTE *)v4 + 48))
          goto LABEL_36;
        goto LABEL_32;
      }
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_32;
    }
LABEL_36:
    v8 = 0;
    goto LABEL_37;
  }
  if ((*((_BYTE *)v4 + 52) & 0x10) != 0)
    goto LABEL_36;
LABEL_32:
  phoneSeq = self->_phoneSeq;
  if ((unint64_t)phoneSeq | *((_QWORD *)v4 + 3) && !-[NSString isEqual:](phoneSeq, "isEqual:"))
    goto LABEL_36;
  ipaPhoneSeq = self->_ipaPhoneSeq;
  if ((unint64_t)ipaPhoneSeq | *((_QWORD *)v4 + 2))
    v8 = -[NSString isEqual:](ipaPhoneSeq, "isEqual:");
  else
    v8 = 1;
LABEL_37:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;

  v3 = -[NSString hash](self->_tokenText, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4 = 2654435761 * self->_startMilliSeconds;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_endMilliSeconds;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_silenceStartMilliSeconds;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_5;
LABEL_10:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
LABEL_9:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_5:
  v7 = 2654435761 * self->_confidence;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  v8 = 2654435761 * self->_addSpaceAfter;
LABEL_12:
  v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_phoneSeq, "hash");
  return v9 ^ -[NSString hash](self->_ipaPhoneSeq, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[MXRecognitionToken setTokenText:](self, "setTokenText:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 8) != 0)
  {
    self->_startMilliSeconds = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 52);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_endMilliSeconds = *((_DWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  self->_silenceStartMilliSeconds = *((_DWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  self->_confidence = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 52) & 0x10) != 0)
  {
LABEL_8:
    self->_addSpaceAfter = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_9:
  if (*((_QWORD *)v4 + 3))
  {
    -[MXRecognitionToken setPhoneSeq:](self, "setPhoneSeq:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[MXRecognitionToken setIpaPhoneSeq:](self, "setIpaPhoneSeq:");
    v4 = v6;
  }

}

- (NSString)tokenText
{
  return self->_tokenText;
}

- (void)setTokenText:(id)a3
{
  objc_storeStrong((id *)&self->_tokenText, a3);
}

- (int)startMilliSeconds
{
  return self->_startMilliSeconds;
}

- (int)endMilliSeconds
{
  return self->_endMilliSeconds;
}

- (int)silenceStartMilliSeconds
{
  return self->_silenceStartMilliSeconds;
}

- (int)confidence
{
  return self->_confidence;
}

- (BOOL)addSpaceAfter
{
  return self->_addSpaceAfter;
}

- (NSString)phoneSeq
{
  return self->_phoneSeq;
}

- (void)setPhoneSeq:(id)a3
{
  objc_storeStrong((id *)&self->_phoneSeq, a3);
}

- (NSString)ipaPhoneSeq
{
  return self->_ipaPhoneSeq;
}

- (void)setIpaPhoneSeq:(id)a3
{
  objc_storeStrong((id *)&self->_ipaPhoneSeq, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenText, 0);
  objc_storeStrong((id *)&self->_phoneSeq, 0);
  objc_storeStrong((id *)&self->_ipaPhoneSeq, 0);
}

@end
