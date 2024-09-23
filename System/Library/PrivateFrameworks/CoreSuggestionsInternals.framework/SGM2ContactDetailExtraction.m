@implementation SGM2ContactDetailExtraction

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("ContactDetailExtraction");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (int)source
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_source;
  else
    return 0;
}

- (void)setSource:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSource
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
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

- (void)setSignature:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_signature = a3;
}

- (void)setHasSignature:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasSignature
{
  return *(_BYTE *)&self->_has >> 7;
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
    return off_1E7DA7EC0[a3];
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

- (int)outcome
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_outcome;
  else
    return 0;
}

- (void)setOutcome:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_outcome = a3;
}

- (void)setHasOutcome:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasOutcome
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)outcomeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E7DA7EE8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOutcome:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMContactDetailExtractionOutcomeExtracted")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMContactDetailExtractionOutcomeIgnoredSuspectedBulkMail")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMContactDetailExtractionOutcomeIgnoredQuotedRegion")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMContactDetailExtractionOutcomeIgnoredPattern")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMContactDetailExtractionOutcomeIgnored")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)foundInSenderCNContact
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_foundInSenderCNContact;
  else
    return 0;
}

- (void)setFoundInSenderCNContact:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_foundInSenderCNContact = a3;
}

- (void)setHasFoundInSenderCNContact:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFoundInSenderCNContact
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)foundInSenderCNContactAsString:(int)a3
{
  if (a3 < 3)
    return off_1E7DA7F10[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFoundInSenderCNContact:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMContactDetailOwnerNotFound")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMContactDetailOwnerSender")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMContactDetailOwnerNotSender")))
  {
    v4 = 2;
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

- (void)setIsUnlikelyPhone:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_isUnlikelyPhone = a3;
}

- (void)setHasIsUnlikelyPhone:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsUnlikelyPhone
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (int)extractionSignatureSource
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_extractionSignatureSource;
  else
    return 0;
}

- (void)setExtractionSignatureSource:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_extractionSignatureSource = a3;
}

- (void)setHasExtractionSignatureSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasExtractionSignatureSource
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)extractionSignatureSourceAsString:(int)a3
{
  if (a3 < 3)
    return off_1E7DA7F28[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsExtractionSignatureSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMContactDetailExtractionSignatureSourceHMM")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGMContactDetailExtractionSignatureSourceDataDetectors")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGMContactDetailExtractionSignatureSourceNoSignatureSource")))
  {
    v4 = 2;
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
  v8.super_class = (Class)SGM2ContactDetailExtraction;
  -[SGM2ContactDetailExtraction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGM2ContactDetailExtraction dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v9;
  uint64_t detail;
  __CFString *v11;
  uint64_t outcome;
  __CFString *v13;
  uint64_t foundInSenderCNContact;
  __CFString *v15;
  void *v16;
  void *v17;
  uint64_t extractionSignatureSource;
  __CFString *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
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
    if ((has & 0x80) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_signature);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("signature"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_19:
  detail = self->_detail;
  if (detail >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_detail);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E7DA7EC0[detail];
  }
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("detail"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_23:
  outcome = self->_outcome;
  if (outcome >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_outcome);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_1E7DA7EE8[outcome];
  }
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("outcome"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_27:
  foundInSenderCNContact = self->_foundInSenderCNContact;
  if (foundInSenderCNContact >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_foundInSenderCNContact);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_1E7DA7F10[foundInSenderCNContact];
  }
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("foundInSenderCNContact"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
LABEL_32:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isUnlikelyPhone);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("isUnlikelyPhone"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v4;
    goto LABEL_33;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_extractionModelVersion);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("extractionModelVersion"));

  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_32;
LABEL_10:
  if ((has & 4) == 0)
    return v4;
LABEL_33:
  extractionSignatureSource = self->_extractionSignatureSource;
  if (extractionSignatureSource >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_extractionSignatureSource);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = off_1E7DA7F28[extractionSignatureSource];
  }
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("extractionSignatureSource"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SGM2ContactDetailExtractionReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
LABEL_19:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_19;
LABEL_10:
  if ((has & 4) != 0)
  {
LABEL_11:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_12:

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
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 9) = self->_source;
    *((_BYTE *)v4 + 44) |= 0x20u;
    has = (char)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_5;
  }
  *((_BYTE *)v4 + 41) = self->_signature;
  *((_BYTE *)v4 + 44) |= 0x80u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v4 + 2) = self->_detail;
  *((_BYTE *)v4 + 44) |= 1u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v4 + 8) = self->_outcome;
  *((_BYTE *)v4 + 44) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v4 + 5) = self->_foundInSenderCNContact;
  *((_BYTE *)v4 + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
LABEL_19:
    *((_BYTE *)v4 + 40) = self->_isUnlikelyPhone;
    *((_BYTE *)v4 + 44) |= 0x40u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_18:
  *((_DWORD *)v4 + 3) = self->_extractionModelVersion;
  *((_BYTE *)v4 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_19;
LABEL_10:
  if ((has & 4) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 4) = self->_extractionSignatureSource;
    *((_BYTE *)v4 + 44) |= 4u;
  }
LABEL_12:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_source;
    *(_BYTE *)(v5 + 44) |= 0x20u;
    has = (char)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 41) = self->_signature;
  *(_BYTE *)(v5 + 44) |= 0x80u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *(_DWORD *)(v5 + 8) = self->_detail;
  *(_BYTE *)(v5 + 44) |= 1u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v5 + 32) = self->_outcome;
  *(_BYTE *)(v5 + 44) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v5 + 20) = self->_foundInSenderCNContact;
  *(_BYTE *)(v5 + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
LABEL_17:
    *(_BYTE *)(v5 + 40) = self->_isUnlikelyPhone;
    *(_BYTE *)(v5 + 44) |= 0x40u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return (id)v5;
    goto LABEL_9;
  }
LABEL_16:
  *(_DWORD *)(v5 + 12) = self->_extractionModelVersion;
  *(_BYTE *)(v5 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 4) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 16) = self->_extractionSignatureSource;
    *(_BYTE *)(v5 + 44) |= 4u;
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
    goto LABEL_49;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x20) == 0 || self->_source != *((_DWORD *)v4 + 9))
      goto LABEL_49;
  }
  else if ((*((_BYTE *)v4 + 44) & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x80) == 0)
      goto LABEL_49;
    if (self->_signature)
    {
      if (!*((_BYTE *)v4 + 41))
        goto LABEL_49;
    }
    else if (*((_BYTE *)v4 + 41))
    {
      goto LABEL_49;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 0x80) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_detail != *((_DWORD *)v4 + 2))
      goto LABEL_49;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x10) == 0 || self->_outcome != *((_DWORD *)v4 + 8))
      goto LABEL_49;
  }
  else if ((*((_BYTE *)v4 + 44) & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0 || self->_foundInSenderCNContact != *((_DWORD *)v4 + 5))
      goto LABEL_49;
  }
  else if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_extractionModelVersion != *((_DWORD *)v4 + 3))
      goto LABEL_49;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x40) != 0)
    {
      if (self->_isUnlikelyPhone)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_49;
        goto LABEL_45;
      }
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_45;
    }
LABEL_49:
    v6 = 0;
    goto LABEL_50;
  }
  if ((*((_BYTE *)v4 + 44) & 0x40) != 0)
    goto LABEL_49;
LABEL_45:
  v6 = (*((_BYTE *)v4 + 44) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_extractionSignatureSource != *((_DWORD *)v4 + 4))
      goto LABEL_49;
    v6 = 1;
  }
LABEL_50:

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
  uint64_t v10;
  uint64_t v11;

  v3 = -[NSString hash](self->_key, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v4 = 2654435761 * self->_source;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_signature;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_detail;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_outcome;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_foundInSenderCNContact;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_7:
    v9 = 2654435761 * self->_extractionModelVersion;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_16:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_9;
LABEL_17:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_15:
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_16;
LABEL_8:
  v10 = 2654435761 * self->_isUnlikelyPhone;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_17;
LABEL_9:
  v11 = 2654435761 * self->_extractionSignatureSource;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if (*((_QWORD *)v4 + 3))
  {
    v6 = v4;
    -[SGM2ContactDetailExtraction setKey:](self, "setKey:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 0x20) != 0)
  {
    self->_source = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 0x20u;
    v5 = *((_BYTE *)v4 + 44);
    if ((v5 & 0x80) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 0x80) == 0)
  {
    goto LABEL_5;
  }
  self->_signature = *((_BYTE *)v4 + 41);
  *(_BYTE *)&self->_has |= 0x80u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  self->_detail = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  self->_outcome = *((_DWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  self->_foundInSenderCNContact = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 0x40) == 0)
      goto LABEL_10;
LABEL_19:
    self->_isUnlikelyPhone = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 0x40u;
    if ((*((_BYTE *)v4 + 44) & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_18:
  self->_extractionModelVersion = *((_DWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 0x40) != 0)
    goto LABEL_19;
LABEL_10:
  if ((v5 & 4) != 0)
  {
LABEL_11:
    self->_extractionSignatureSource = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_12:

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (BOOL)signature
{
  return self->_signature;
}

- (unsigned)extractionModelVersion
{
  return self->_extractionModelVersion;
}

- (BOOL)isUnlikelyPhone
{
  return self->_isUnlikelyPhone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
