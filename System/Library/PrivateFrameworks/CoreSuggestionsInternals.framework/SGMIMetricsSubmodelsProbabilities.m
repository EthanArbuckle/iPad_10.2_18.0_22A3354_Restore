@implementation SGMIMetricsSubmodelsProbabilities

- (void)setPersonFromSenderProbability:(float)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_personFromSenderProbability = a3;
}

- (void)setHasPersonFromSenderProbability:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasPersonFromSenderProbability
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPersonFromSenderInDyadicConversationProbability:(float)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_personFromSenderInDyadicConversationProbability = a3;
}

- (void)setHasPersonFromSenderInDyadicConversationProbability:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPersonFromSenderInDyadicConversationProbability
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setSubjectContentProbability:(float)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_subjectContentProbability = a3;
}

- (void)setHasSubjectContentProbability:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSubjectContentProbability
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setPersonToRecipientsProbability:(float)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_personToRecipientsProbability = a3;
}

- (void)setHasPersonToRecipientsProbability:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPersonToRecipientsProbability
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setPersonCCRecipientsProbability:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_personCCRecipientsProbability = a3;
}

- (void)setHasPersonCCRecipientsProbability:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPersonCCRecipientsProbability
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setDomainFromSenderProbability:(float)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_domainFromSenderProbability = a3;
}

- (void)setHasDomainFromSenderProbability:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDomainFromSenderProbability
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setConversationProbability:(float)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_conversationProbability = a3;
}

- (void)setHasConversationProbability:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasConversationProbability
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setListIdProbability:(float)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_listIdProbability = a3;
}

- (void)setHasListIdProbability:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasListIdProbability
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setAttachmentsProbability:(float)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_attachmentsProbability = a3;
}

- (void)setHasAttachmentsProbability:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAttachmentsProbability
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setSubjectCountStatsProbability:(float)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_subjectCountStatsProbability = a3;
}

- (void)setHasSubjectCountStatsProbability:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSubjectCountStatsProbability
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setStandardMailRulesProbability:(float)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_standardMailRulesProbability = a3;
}

- (void)setHasStandardMailRulesProbability:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasStandardMailRulesProbability
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setMailboxProbability:(float)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_mailboxProbability = a3;
}

- (void)setHasMailboxProbability:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMailboxProbability
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setMailboxTypeProbability:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_mailboxTypeProbability = a3;
}

- (void)setHasMailboxTypeProbability:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasMailboxTypeProbability
{
  return (*(_WORD *)&self->_has >> 5) & 1;
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
  v8.super_class = (Class)SGMIMetricsSubmodelsProbabilities;
  -[SGMIMetricsSubmodelsProbabilities description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMIMetricsSubmodelsProbabilities dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  __int16 has;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *(float *)&v4 = self->_personFromSenderProbability;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("personFromSenderProbability"));

    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&v4 = self->_personFromSenderInDyadicConversationProbability;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("personFromSenderInDyadicConversationProbability"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  *(float *)&v4 = self->_subjectContentProbability;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("subjectContentProbability"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *(float *)&v4 = self->_personToRecipientsProbability;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("personToRecipientsProbability"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *(float *)&v4 = self->_personCCRecipientsProbability;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("personCCRecipientsProbability"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  *(float *)&v4 = self->_domainFromSenderProbability;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("domainFromSenderProbability"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  *(float *)&v4 = self->_conversationProbability;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("conversationProbability"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  *(float *)&v4 = self->_listIdProbability;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("listIdProbability"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  *(float *)&v4 = self->_attachmentsProbability;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("attachmentsProbability"));

  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  *(float *)&v4 = self->_subjectCountStatsProbability;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("subjectCountStatsProbability"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_13;
LABEL_27:
    *(float *)&v4 = self->_mailboxProbability;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("mailboxProbability"));

    if ((*(_WORD *)&self->_has & 0x20) == 0)
      return v3;
    goto LABEL_14;
  }
LABEL_26:
  *(float *)&v4 = self->_standardMailRulesProbability;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("standardMailRulesProbability"));

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_27;
LABEL_13:
  if ((has & 0x20) != 0)
  {
LABEL_14:
    *(float *)&v4 = self->_mailboxTypeProbability;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("mailboxTypeProbability"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsSubmodelsProbabilitiesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_13;
LABEL_27:
    PBDataWriterWriteFloatField();
    if ((*(_WORD *)&self->_has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_26:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_27;
LABEL_13:
  if ((has & 0x20) != 0)
LABEL_14:
    PBDataWriterWriteFloatField();
LABEL_15:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v4[10] = LODWORD(self->_personFromSenderProbability);
    *((_WORD *)v4 + 30) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v4[9] = LODWORD(self->_personFromSenderInDyadicConversationProbability);
  *((_WORD *)v4 + 30) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  v4[13] = LODWORD(self->_subjectContentProbability);
  *((_WORD *)v4 + 30) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  v4[11] = LODWORD(self->_personToRecipientsProbability);
  *((_WORD *)v4 + 30) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  v4[8] = LODWORD(self->_personCCRecipientsProbability);
  *((_WORD *)v4 + 30) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  v4[4] = LODWORD(self->_domainFromSenderProbability);
  *((_WORD *)v4 + 30) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  v4[3] = LODWORD(self->_conversationProbability);
  *((_WORD *)v4 + 30) |= 2u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  v4[5] = LODWORD(self->_listIdProbability);
  *((_WORD *)v4 + 30) |= 8u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  v4[2] = LODWORD(self->_attachmentsProbability);
  *((_WORD *)v4 + 30) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  v4[14] = LODWORD(self->_subjectCountStatsProbability);
  *((_WORD *)v4 + 30) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_13;
LABEL_27:
    v4[6] = LODWORD(self->_mailboxProbability);
    *((_WORD *)v4 + 30) |= 0x10u;
    if ((*(_WORD *)&self->_has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_26:
  v4[12] = LODWORD(self->_standardMailRulesProbability);
  *((_WORD *)v4 + 30) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_27;
LABEL_13:
  if ((has & 0x20) != 0)
  {
LABEL_14:
    v4[7] = LODWORD(self->_mailboxTypeProbability);
    *((_WORD *)v4 + 30) |= 0x20u;
  }
LABEL_15:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)result + 10) = LODWORD(self->_personFromSenderProbability);
    *((_WORD *)result + 30) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 9) = LODWORD(self->_personFromSenderInDyadicConversationProbability);
  *((_WORD *)result + 30) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 13) = LODWORD(self->_subjectContentProbability);
  *((_WORD *)result + 30) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 11) = LODWORD(self->_personToRecipientsProbability);
  *((_WORD *)result + 30) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 8) = LODWORD(self->_personCCRecipientsProbability);
  *((_WORD *)result + 30) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 4) = LODWORD(self->_domainFromSenderProbability);
  *((_WORD *)result + 30) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 3) = LODWORD(self->_conversationProbability);
  *((_WORD *)result + 30) |= 2u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 5) = LODWORD(self->_listIdProbability);
  *((_WORD *)result + 30) |= 8u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 2) = LODWORD(self->_attachmentsProbability);
  *((_WORD *)result + 30) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 14) = LODWORD(self->_subjectCountStatsProbability);
  *((_WORD *)result + 30) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 12) = LODWORD(self->_standardMailRulesProbability);
  *((_WORD *)result + 30) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0)
      return result;
    goto LABEL_14;
  }
LABEL_27:
  *((_DWORD *)result + 6) = LODWORD(self->_mailboxProbability);
  *((_WORD *)result + 30) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x20) == 0)
    return result;
LABEL_14:
  *((_DWORD *)result + 7) = LODWORD(self->_mailboxTypeProbability);
  *((_WORD *)result + 30) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_67;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 30);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x100) == 0 || self->_personFromSenderProbability != *((float *)v4 + 10))
      goto LABEL_67;
  }
  else if ((*((_WORD *)v4 + 30) & 0x100) != 0)
  {
LABEL_67:
    v7 = 0;
    goto LABEL_68;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_personFromSenderInDyadicConversationProbability != *((float *)v4 + 9))
      goto LABEL_67;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x800) == 0 || self->_subjectContentProbability != *((float *)v4 + 13))
      goto LABEL_67;
  }
  else if ((*((_WORD *)v4 + 30) & 0x800) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x200) == 0 || self->_personToRecipientsProbability != *((float *)v4 + 11))
      goto LABEL_67;
  }
  else if ((*((_WORD *)v4 + 30) & 0x200) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_personCCRecipientsProbability != *((float *)v4 + 8))
      goto LABEL_67;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_domainFromSenderProbability != *((float *)v4 + 4))
      goto LABEL_67;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_conversationProbability != *((float *)v4 + 3))
      goto LABEL_67;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_listIdProbability != *((float *)v4 + 5))
      goto LABEL_67;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_attachmentsProbability != *((float *)v4 + 2))
      goto LABEL_67;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x1000) == 0 || self->_subjectCountStatsProbability != *((float *)v4 + 14))
      goto LABEL_67;
  }
  else if ((*((_WORD *)v4 + 30) & 0x1000) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x400) == 0 || self->_standardMailRulesProbability != *((float *)v4 + 12))
      goto LABEL_67;
  }
  else if ((*((_WORD *)v4 + 30) & 0x400) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_mailboxProbability != *((float *)v4 + 6))
      goto LABEL_67;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_mailboxTypeProbability != *((float *)v4 + 7))
      goto LABEL_67;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 0x20) == 0;
  }
LABEL_68:

  return v7;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  float personFromSenderProbability;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  float personFromSenderInDyadicConversationProbability;
  float v11;
  float v12;
  float v13;
  unint64_t v14;
  float subjectContentProbability;
  float v16;
  float v17;
  float v18;
  unint64_t v19;
  float personToRecipientsProbability;
  float v21;
  float v22;
  float v23;
  unint64_t v24;
  float personCCRecipientsProbability;
  float v26;
  float v27;
  float v28;
  unint64_t v29;
  float domainFromSenderProbability;
  float v31;
  float v32;
  float v33;
  unint64_t v34;
  float conversationProbability;
  float v36;
  float v37;
  float v38;
  unint64_t v39;
  float listIdProbability;
  float v41;
  float v42;
  float v43;
  unint64_t v44;
  float attachmentsProbability;
  float v46;
  float v47;
  float v48;
  unint64_t v49;
  float subjectCountStatsProbability;
  float v51;
  float v52;
  float v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  float standardMailRulesProbability;
  float v59;
  float v60;
  float v61;
  unint64_t v62;
  float mailboxProbability;
  float v64;
  float v65;
  float v66;
  unint64_t v67;
  float mailboxTypeProbability;
  float v69;
  float v70;
  float v71;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    personFromSenderProbability = self->_personFromSenderProbability;
    v6 = -personFromSenderProbability;
    if (personFromSenderProbability >= 0.0)
      v6 = self->_personFromSenderProbability;
    v7 = floorf(v6 + 0.5);
    v8 = (float)(v6 - v7) * 1.8447e19;
    v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 0x80) != 0)
  {
    personFromSenderInDyadicConversationProbability = self->_personFromSenderInDyadicConversationProbability;
    v11 = -personFromSenderInDyadicConversationProbability;
    if (personFromSenderInDyadicConversationProbability >= 0.0)
      v11 = self->_personFromSenderInDyadicConversationProbability;
    v12 = floorf(v11 + 0.5);
    v13 = (float)(v11 - v12) * 1.8447e19;
    v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 0x800) != 0)
  {
    subjectContentProbability = self->_subjectContentProbability;
    v16 = -subjectContentProbability;
    if (subjectContentProbability >= 0.0)
      v16 = self->_subjectContentProbability;
    v17 = floorf(v16 + 0.5);
    v18 = (float)(v16 - v17) * 1.8447e19;
    v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((has & 0x200) != 0)
  {
    personToRecipientsProbability = self->_personToRecipientsProbability;
    v21 = -personToRecipientsProbability;
    if (personToRecipientsProbability >= 0.0)
      v21 = self->_personToRecipientsProbability;
    v22 = floorf(v21 + 0.5);
    v23 = (float)(v21 - v22) * 1.8447e19;
    v19 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabsf(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((has & 0x40) != 0)
  {
    personCCRecipientsProbability = self->_personCCRecipientsProbability;
    v26 = -personCCRecipientsProbability;
    if (personCCRecipientsProbability >= 0.0)
      v26 = self->_personCCRecipientsProbability;
    v27 = floorf(v26 + 0.5);
    v28 = (float)(v26 - v27) * 1.8447e19;
    v24 = 2654435761u * (unint64_t)fmodf(v27, 1.8447e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabsf(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((has & 4) != 0)
  {
    domainFromSenderProbability = self->_domainFromSenderProbability;
    v31 = -domainFromSenderProbability;
    if (domainFromSenderProbability >= 0.0)
      v31 = self->_domainFromSenderProbability;
    v32 = floorf(v31 + 0.5);
    v33 = (float)(v31 - v32) * 1.8447e19;
    v29 = 2654435761u * (unint64_t)fmodf(v32, 1.8447e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabsf(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  if ((has & 2) != 0)
  {
    conversationProbability = self->_conversationProbability;
    v36 = -conversationProbability;
    if (conversationProbability >= 0.0)
      v36 = self->_conversationProbability;
    v37 = floorf(v36 + 0.5);
    v38 = (float)(v36 - v37) * 1.8447e19;
    v34 = 2654435761u * (unint64_t)fmodf(v37, 1.8447e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0)
        v34 += (unint64_t)v38;
    }
    else
    {
      v34 -= (unint64_t)fabsf(v38);
    }
  }
  else
  {
    v34 = 0;
  }
  v77 = v4;
  if ((has & 8) != 0)
  {
    listIdProbability = self->_listIdProbability;
    v41 = -listIdProbability;
    if (listIdProbability >= 0.0)
      v41 = self->_listIdProbability;
    v42 = floorf(v41 + 0.5);
    v43 = (float)(v41 - v42) * 1.8447e19;
    v39 = 2654435761u * (unint64_t)fmodf(v42, 1.8447e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0)
        v39 += (unint64_t)v43;
    }
    else
    {
      v39 -= (unint64_t)fabsf(v43);
    }
  }
  else
  {
    v39 = 0;
  }
  v76 = v9;
  if ((has & 1) != 0)
  {
    attachmentsProbability = self->_attachmentsProbability;
    v46 = -attachmentsProbability;
    if (attachmentsProbability >= 0.0)
      v46 = self->_attachmentsProbability;
    v47 = floorf(v46 + 0.5);
    v48 = (float)(v46 - v47) * 1.8447e19;
    v44 = 2654435761u * (unint64_t)fmodf(v47, 1.8447e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0)
        v44 += (unint64_t)v48;
    }
    else
    {
      v44 -= (unint64_t)fabsf(v48);
    }
  }
  else
  {
    v44 = 0;
  }
  v74 = v34;
  v75 = v14;
  if ((has & 0x1000) != 0)
  {
    subjectCountStatsProbability = self->_subjectCountStatsProbability;
    v51 = -subjectCountStatsProbability;
    if (subjectCountStatsProbability >= 0.0)
      v51 = self->_subjectCountStatsProbability;
    v52 = floorf(v51 + 0.5);
    v53 = (float)(v51 - v52) * 1.8447e19;
    v49 = 2654435761u * (unint64_t)fmodf(v52, 1.8447e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0)
        v49 += (unint64_t)v53;
    }
    else
    {
      v49 -= (unint64_t)fabsf(v53);
    }
  }
  else
  {
    v49 = 0;
  }
  v73 = v44;
  v54 = v19;
  v55 = v39;
  if ((has & 0x400) != 0)
  {
    standardMailRulesProbability = self->_standardMailRulesProbability;
    v59 = -standardMailRulesProbability;
    if (standardMailRulesProbability >= 0.0)
      v59 = self->_standardMailRulesProbability;
    v60 = floorf(v59 + 0.5);
    v61 = (float)(v59 - v60) * 1.8447e19;
    v57 = 2654435761u * (unint64_t)fmodf(v60, 1.8447e19);
    v56 = v29;
    if (v61 >= 0.0)
    {
      if (v61 > 0.0)
        v57 += (unint64_t)v61;
    }
    else
    {
      v57 -= (unint64_t)fabsf(v61);
    }
  }
  else
  {
    v56 = v29;
    v57 = 0;
  }
  if ((has & 0x10) != 0)
  {
    mailboxProbability = self->_mailboxProbability;
    v64 = -mailboxProbability;
    if (mailboxProbability >= 0.0)
      v64 = self->_mailboxProbability;
    v65 = floorf(v64 + 0.5);
    v66 = (float)(v64 - v65) * 1.8447e19;
    v62 = 2654435761u * (unint64_t)fmodf(v65, 1.8447e19);
    if (v66 >= 0.0)
    {
      if (v66 > 0.0)
        v62 += (unint64_t)v66;
    }
    else
    {
      v62 -= (unint64_t)fabsf(v66);
    }
  }
  else
  {
    v62 = 0;
  }
  if ((has & 0x20) != 0)
  {
    mailboxTypeProbability = self->_mailboxTypeProbability;
    v69 = -mailboxTypeProbability;
    if (mailboxTypeProbability >= 0.0)
      v69 = self->_mailboxTypeProbability;
    v70 = floorf(v69 + 0.5);
    v71 = (float)(v69 - v70) * 1.8447e19;
    v67 = 2654435761u * (unint64_t)fmodf(v70, 1.8447e19);
    if (v71 >= 0.0)
    {
      if (v71 > 0.0)
        v67 += (unint64_t)v71;
    }
    else
    {
      v67 -= (unint64_t)fabsf(v71);
    }
  }
  else
  {
    v67 = 0;
  }
  return v76 ^ v77 ^ v75 ^ v54 ^ v24 ^ v56 ^ v74 ^ v55 ^ v73 ^ v49 ^ v57 ^ v62 ^ v67;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x100) != 0)
  {
    self->_personFromSenderProbability = *((float *)v4 + 10);
    *(_WORD *)&self->_has |= 0x100u;
    v5 = *((_WORD *)v4 + 30);
    if ((v5 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_personFromSenderInDyadicConversationProbability = *((float *)v4 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x800) == 0)
  {
LABEL_4:
    if ((v5 & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  self->_subjectContentProbability = *((float *)v4 + 13);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x200) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  self->_personToRecipientsProbability = *((float *)v4 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  self->_personCCRecipientsProbability = *((float *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 2) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  self->_domainFromSenderProbability = *((float *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  self->_conversationProbability = *((float *)v4 + 3);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 1) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  self->_listIdProbability = *((float *)v4 + 5);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  self->_attachmentsProbability = *((float *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x1000) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  self->_subjectCountStatsProbability = *((float *)v4 + 14);
  *(_WORD *)&self->_has |= 0x1000u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0)
      goto LABEL_13;
LABEL_27:
    self->_mailboxProbability = *((float *)v4 + 6);
    *(_WORD *)&self->_has |= 0x10u;
    if ((*((_WORD *)v4 + 30) & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_26:
  self->_standardMailRulesProbability = *((float *)v4 + 12);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x10) != 0)
    goto LABEL_27;
LABEL_13:
  if ((v5 & 0x20) != 0)
  {
LABEL_14:
    self->_mailboxTypeProbability = *((float *)v4 + 7);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_15:

}

- (float)personFromSenderProbability
{
  return self->_personFromSenderProbability;
}

- (float)personFromSenderInDyadicConversationProbability
{
  return self->_personFromSenderInDyadicConversationProbability;
}

- (float)subjectContentProbability
{
  return self->_subjectContentProbability;
}

- (float)personToRecipientsProbability
{
  return self->_personToRecipientsProbability;
}

- (float)personCCRecipientsProbability
{
  return self->_personCCRecipientsProbability;
}

- (float)domainFromSenderProbability
{
  return self->_domainFromSenderProbability;
}

- (float)conversationProbability
{
  return self->_conversationProbability;
}

- (float)listIdProbability
{
  return self->_listIdProbability;
}

- (float)attachmentsProbability
{
  return self->_attachmentsProbability;
}

- (float)subjectCountStatsProbability
{
  return self->_subjectCountStatsProbability;
}

- (float)standardMailRulesProbability
{
  return self->_standardMailRulesProbability;
}

- (float)mailboxProbability
{
  return self->_mailboxProbability;
}

- (float)mailboxTypeProbability
{
  return self->_mailboxTypeProbability;
}

@end
