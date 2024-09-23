@implementation EDPBInteractionEventCategoryInferred

- (void)setAccountId:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_accountId = a3;
}

- (void)setHasAccountId:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAccountId
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setMailboxId:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_mailboxId = a3;
}

- (void)setHasMailboxId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMailboxId
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (int)mailboxType
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_mailboxType;
  else
    return 0;
}

- (void)setMailboxType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_mailboxType = a3;
}

- (void)setHasMailboxType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMailboxType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)mailboxTypeAsString:(int)a3
{
  if (a3 < 9)
    return off_1E949F318[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMailboxType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNDEFINED_MAILBOX_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OTHER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INBOX")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARCHIVE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SENT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRASH")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("JUNK")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DRAFTS")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("OUTBOX")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setConversationId:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_conversationId = a3;
}

- (void)setHasConversationId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasConversationId
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setMessageId:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_messageId = a3;
}

- (void)setHasMessageId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasMessageId
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasScore
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setPositive:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_positive = a3;
}

- (void)setHasPositive:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPositive
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (int)categoryType
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_categoryType;
  else
    return 0;
}

- (void)setCategoryType:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_categoryType = a3;
}

- (void)setHasCategoryType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasCategoryType
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)categoryTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E949F360[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCategoryType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNDEFINED_CATEGORY_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IMPORTANT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOCIAL")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMMERCE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LIST")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setModelId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_modelId = a3;
}

- (void)setHasModelId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasModelId
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setModelVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_modelVersion = a3;
}

- (void)setHasModelVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasModelVersion
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasFeaturesImportant
{
  return self->_featuresImportant != 0;
}

- (BOOL)hasFeaturesPromotion
{
  return self->_featuresPromotion != 0;
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
  v8.super_class = (Class)EDPBInteractionEventCategoryInferred;
  -[EDPBInteractionEventCategoryInferred description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPBInteractionEventCategoryInferred dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v6;
  uint64_t mailboxType;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t categoryType;
  __CFString *v14;
  void *v15;
  void *v16;
  EDPBModelFeaturesImportant *featuresImportant;
  void *v18;
  EDPBModelFeaturesPromotion *featuresPromotion;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_accountId);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("account_id"));

    has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_mailboxId);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("mailbox_id"));

    has = (__int16)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    mailboxType = self->_mailboxType;
    if (mailboxType >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mailboxType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E949F318[mailboxType];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("mailbox_type"));

    has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_conversationId);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("conversation_id"));

    has = (__int16)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_messageId);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("message_id"));

    has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("score"));

    has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_positive);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("positive"));

    has = (__int16)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    categoryType = self->_categoryType;
    if (categoryType >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_categoryType);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E949F360[categoryType];
    }
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("category_type"));

    has = (__int16)self->_has;
  }
  if ((has & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_modelId);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("model_id"));

    has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_modelVersion);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("model_version"));

  }
  featuresImportant = self->_featuresImportant;
  if (featuresImportant)
  {
    -[EDPBModelFeaturesImportant dictionaryRepresentation](featuresImportant, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("features_important"));

  }
  featuresPromotion = self->_featuresPromotion;
  if (featuresPromotion)
  {
    -[EDPBModelFeaturesPromotion dictionaryRepresentation](featuresPromotion, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("features_promotion"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return EDPBInteractionEventCategoryInferredReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteSint64Field();
    has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteSint64Field();
    has = (__int16)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteSint64Field();
    has = (__int16)self->_has;
  }
  if ((has & 8) != 0)
  {
    PBDataWriterWriteSint64Field();
    has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (__int16)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
  }
  if ((has & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_featuresImportant)
    PBDataWriterWriteSubmessage();
  if (self->_featuresPromotion)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;
  id v6;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_accountId;
    *((_WORD *)v4 + 44) |= 1u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_mailboxId;
  *((_WORD *)v4 + 44) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 18) = self->_mailboxType;
  *((_WORD *)v4 + 44) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  v4[2] = self->_conversationId;
  *((_WORD *)v4 + 44) |= 2u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  v4[4] = self->_messageId;
  *((_WORD *)v4 + 44) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  v4[5] = *(_QWORD *)&self->_score;
  *((_WORD *)v4 + 44) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *((_BYTE *)v4 + 84) = self->_positive;
  *((_WORD *)v4 + 44) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 12) = self->_categoryType;
  *((_WORD *)v4 + 44) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_25:
  *((_DWORD *)v4 + 19) = self->_modelId;
  *((_WORD *)v4 + 44) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 20) = self->_modelVersion;
    *((_WORD *)v4 + 44) |= 0x100u;
  }
LABEL_12:
  v6 = v4;
  if (self->_featuresImportant)
    objc_msgSend(v4, "setFeaturesImportant:");
  if (self->_featuresPromotion)
    objc_msgSend(v6, "setFeaturesPromotion:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  __int16 has;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_accountId;
    *(_WORD *)(v5 + 88) |= 1u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 24) = self->_mailboxId;
  *(_WORD *)(v5 + 88) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v5 + 72) = self->_mailboxType;
  *(_WORD *)(v5 + 88) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *(_QWORD *)(v5 + 16) = self->_conversationId;
  *(_WORD *)(v5 + 88) |= 2u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *(_QWORD *)(v5 + 32) = self->_messageId;
  *(_WORD *)(v5 + 88) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  *(double *)(v5 + 40) = self->_score;
  *(_WORD *)(v5 + 88) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *(_BYTE *)(v5 + 84) = self->_positive;
  *(_WORD *)(v5 + 88) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
LABEL_21:
    *(_DWORD *)(v5 + 76) = self->_modelId;
    *(_WORD *)(v5 + 88) |= 0x80u;
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  *(_DWORD *)(v5 + 48) = self->_categoryType;
  *(_WORD *)(v5 + 88) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_21;
LABEL_10:
  if ((has & 0x100) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 80) = self->_modelVersion;
    *(_WORD *)(v5 + 88) |= 0x100u;
  }
LABEL_12:
  v8 = -[EDPBModelFeaturesImportant copyWithZone:](self->_featuresImportant, "copyWithZone:", a3);
  v9 = (void *)v6[7];
  v6[7] = v8;

  v10 = -[EDPBModelFeaturesPromotion copyWithZone:](self->_featuresPromotion, "copyWithZone:", a3);
  v11 = (void *)v6[8];
  v6[8] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  EDPBModelFeaturesImportant *featuresImportant;
  EDPBModelFeaturesPromotion *featuresPromotion;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_59;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 44);
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_accountId != *((_QWORD *)v4 + 1))
      goto LABEL_59;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_mailboxId != *((_QWORD *)v4 + 3))
      goto LABEL_59;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_mailboxType != *((_DWORD *)v4 + 18))
      goto LABEL_59;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_conversationId != *((_QWORD *)v4 + 2))
      goto LABEL_59;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_messageId != *((_QWORD *)v4 + 4))
      goto LABEL_59;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_score != *((double *)v4 + 5))
      goto LABEL_59;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_59;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 44) & 0x200) != 0)
    {
      if (self->_positive)
      {
        if (!*((_BYTE *)v4 + 84))
          goto LABEL_59;
        goto LABEL_40;
      }
      if (!*((_BYTE *)v4 + 84))
        goto LABEL_40;
    }
LABEL_59:
    v9 = 0;
    goto LABEL_60;
  }
  if ((*((_WORD *)v4 + 44) & 0x200) != 0)
    goto LABEL_59;
LABEL_40:
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_categoryType != *((_DWORD *)v4 + 12))
      goto LABEL_59;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_modelId != *((_DWORD *)v4 + 19))
      goto LABEL_59;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_59;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 44) & 0x100) == 0 || self->_modelVersion != *((_DWORD *)v4 + 20))
      goto LABEL_59;
  }
  else if ((*((_WORD *)v4 + 44) & 0x100) != 0)
  {
    goto LABEL_59;
  }
  featuresImportant = self->_featuresImportant;
  if ((unint64_t)featuresImportant | *((_QWORD *)v4 + 7)
    && !-[EDPBModelFeaturesImportant isEqual:](featuresImportant, "isEqual:"))
  {
    goto LABEL_59;
  }
  featuresPromotion = self->_featuresPromotion;
  if ((unint64_t)featuresPromotion | *((_QWORD *)v4 + 8))
    v9 = -[EDPBModelFeaturesPromotion isEqual:](featuresPromotion, "isEqual:");
  else
    v9 = 1;
LABEL_60:

  return v9;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double score;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4 = 2654435761 * self->_accountId;
    if ((has & 4) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_mailboxId;
      if ((has & 0x40) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v4 = 0;
    if ((has & 4) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_mailboxType;
    if ((has & 2) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v6 = 0;
  if ((has & 2) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_conversationId;
    if ((has & 8) != 0)
      goto LABEL_6;
LABEL_15:
    v8 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_7;
LABEL_16:
    v13 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v7 = 0;
  if ((has & 8) == 0)
    goto LABEL_15;
LABEL_6:
  v8 = 2654435761 * self->_messageId;
  if ((has & 0x10) == 0)
    goto LABEL_16;
LABEL_7:
  score = self->_score;
  v10 = -score;
  if (score >= 0.0)
    v10 = self->_score;
  v11 = floor(v10 + 0.5);
  v12 = (v10 - v11) * 1.84467441e19;
  v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0)
      v13 += (unint64_t)v12;
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_19:
  if ((has & 0x200) != 0)
  {
    v14 = 2654435761 * self->_positive;
    if ((has & 0x20) != 0)
    {
LABEL_21:
      v15 = 2654435761 * self->_categoryType;
      if ((has & 0x80) != 0)
        goto LABEL_22;
LABEL_26:
      v16 = 0;
      if ((has & 0x100) != 0)
        goto LABEL_23;
LABEL_27:
      v17 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    v14 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_21;
  }
  v15 = 0;
  if ((has & 0x80) == 0)
    goto LABEL_26;
LABEL_22:
  v16 = 2654435761 * self->_modelId;
  if ((has & 0x100) == 0)
    goto LABEL_27;
LABEL_23:
  v17 = 2654435761 * self->_modelVersion;
LABEL_28:
  v18 = v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ -[EDPBModelFeaturesImportant hash](self->_featuresImportant, "hash");
  return v18 ^ -[EDPBModelFeaturesPromotion hash](self->_featuresPromotion, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  __int16 v6;
  EDPBModelFeaturesImportant *featuresImportant;
  uint64_t v8;
  EDPBModelFeaturesPromotion *featuresPromotion;
  uint64_t v10;
  _QWORD *v11;

  v4 = a3;
  v5 = v4;
  v6 = *((_WORD *)v4 + 44);
  if ((v6 & 1) != 0)
  {
    self->_accountId = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v6 = *((_WORD *)v4 + 44);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_mailboxId = *((_QWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  v6 = *((_WORD *)v4 + 44);
  if ((v6 & 0x40) == 0)
  {
LABEL_4:
    if ((v6 & 2) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  self->_mailboxType = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 0x40u;
  v6 = *((_WORD *)v4 + 44);
  if ((v6 & 2) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  self->_conversationId = *((_QWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v6 = *((_WORD *)v4 + 44);
  if ((v6 & 8) == 0)
  {
LABEL_6:
    if ((v6 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  self->_messageId = *((_QWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  v6 = *((_WORD *)v4 + 44);
  if ((v6 & 0x10) == 0)
  {
LABEL_7:
    if ((v6 & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  self->_score = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v6 = *((_WORD *)v4 + 44);
  if ((v6 & 0x200) == 0)
  {
LABEL_8:
    if ((v6 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  self->_positive = *((_BYTE *)v4 + 84);
  *(_WORD *)&self->_has |= 0x200u;
  v6 = *((_WORD *)v4 + 44);
  if ((v6 & 0x20) == 0)
  {
LABEL_9:
    if ((v6 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  self->_categoryType = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x20u;
  v6 = *((_WORD *)v4 + 44);
  if ((v6 & 0x80) == 0)
  {
LABEL_10:
    if ((v6 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_23:
  self->_modelId = *((_DWORD *)v4 + 19);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 44) & 0x100) != 0)
  {
LABEL_11:
    self->_modelVersion = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_12:
  featuresImportant = self->_featuresImportant;
  v11 = v5;
  v8 = v5[7];
  if (featuresImportant)
  {
    if (v8)
      -[EDPBModelFeaturesImportant mergeFrom:](featuresImportant, "mergeFrom:");
  }
  else if (v8)
  {
    -[EDPBInteractionEventCategoryInferred setFeaturesImportant:](self, "setFeaturesImportant:");
  }
  featuresPromotion = self->_featuresPromotion;
  v10 = v11[8];
  if (featuresPromotion)
  {
    if (v10)
      -[EDPBModelFeaturesPromotion mergeFrom:](featuresPromotion, "mergeFrom:");
  }
  else if (v10)
  {
    -[EDPBInteractionEventCategoryInferred setFeaturesPromotion:](self, "setFeaturesPromotion:");
  }

}

- (int64_t)accountId
{
  return self->_accountId;
}

- (int64_t)mailboxId
{
  return self->_mailboxId;
}

- (int64_t)conversationId
{
  return self->_conversationId;
}

- (int64_t)messageId
{
  return self->_messageId;
}

- (double)score
{
  return self->_score;
}

- (BOOL)positive
{
  return self->_positive;
}

- (unsigned)modelId
{
  return self->_modelId;
}

- (unsigned)modelVersion
{
  return self->_modelVersion;
}

- (EDPBModelFeaturesImportant)featuresImportant
{
  return self->_featuresImportant;
}

- (void)setFeaturesImportant:(id)a3
{
  objc_storeStrong((id *)&self->_featuresImportant, a3);
}

- (EDPBModelFeaturesPromotion)featuresPromotion
{
  return self->_featuresPromotion;
}

- (void)setFeaturesPromotion:(id)a3
{
  objc_storeStrong((id *)&self->_featuresPromotion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresPromotion, 0);
  objc_storeStrong((id *)&self->_featuresImportant, 0);
}

@end
