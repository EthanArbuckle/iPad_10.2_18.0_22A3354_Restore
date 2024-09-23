@implementation EDPBInteractionEventMessageViewEnd

- (void)withHasher:(id)a3 setMessage:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  _EDPBBaseMessageFieldsFill(v16, self, v8);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("duration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("duration"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    -[EDPBInteractionEventMessageViewEnd setDuration:](self, "setDuration:");

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("scrolled_to_end"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v14 = objc_opt_isKindOfClass();

  if ((v14 & 1) != 0)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("scrolled_to_end"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDPBInteractionEventMessageViewEnd setScrolledToEnd:](self, "setScrolledToEnd:", objc_msgSend(v15, "BOOLValue"));

  }
}

- (void)setAccountId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_accountId = a3;
}

- (void)setHasAccountId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAccountId
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setMailboxId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_mailboxId = a3;
}

- (void)setHasMailboxId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMailboxId
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)mailboxType
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_mailboxType;
  else
    return 0;
}

- (void)setMailboxType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_mailboxType = a3;
}

- (void)setHasMailboxType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasMailboxType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)mailboxTypeAsString:(int)a3
{
  if (a3 < 9)
    return off_1E949F5F0[a3];
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
  *(_BYTE *)&self->_has |= 2u;
  self->_conversationId = a3;
}

- (void)setHasConversationId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConversationId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMessageId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_messageId = a3;
}

- (void)setHasMessageId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMessageId
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setDuration:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDuration
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setScrolledToEnd:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_scrolledToEnd = a3;
}

- (void)setHasScrolledToEnd:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasScrolledToEnd
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
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
  v8.super_class = (Class)EDPBInteractionEventMessageViewEnd;
  -[EDPBInteractionEventMessageViewEnd description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPBInteractionEventMessageViewEnd dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  uint64_t mailboxType;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_accountId);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("account_id"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_mailboxId);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("mailbox_id"));

    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    mailboxType = self->_mailboxType;
    if (mailboxType >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mailboxType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E949F5F0[mailboxType];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("mailbox_type"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_conversationId);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("conversation_id"));

    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_messageId);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("message_id"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("duration"));

    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_scrolledToEnd);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("scrolled_to_end"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return EDPBInteractionEventMessageViewEndReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteSint64Field();
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    PBDataWriterWriteSint64Field();
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteSint64Field();
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteSint64Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_accountId;
    *((_BYTE *)v4 + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_mailboxId;
  *((_BYTE *)v4 + 56) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)v4 + 12) = self->_mailboxType;
  *((_BYTE *)v4 + 56) |= 0x20u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v4[2] = self->_conversationId;
  *((_BYTE *)v4 + 56) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
LABEL_15:
    v4[3] = *(_QWORD *)&self->_duration;
    *((_BYTE *)v4 + 56) |= 4u;
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  v4[5] = self->_messageId;
  *((_BYTE *)v4 + 56) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 0x40) != 0)
  {
LABEL_8:
    *((_BYTE *)v4 + 52) = self->_scrolledToEnd;
    *((_BYTE *)v4 + 56) |= 0x40u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_accountId;
    *((_BYTE *)result + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 4) = self->_mailboxId;
  *((_BYTE *)result + 56) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 12) = self->_mailboxType;
  *((_BYTE *)result + 56) |= 0x20u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_QWORD *)result + 2) = self->_conversationId;
  *((_BYTE *)result + 56) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_QWORD *)result + 5) = self->_messageId;
  *((_BYTE *)result + 56) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      return result;
    goto LABEL_8;
  }
LABEL_15:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_duration;
  *((_BYTE *)result + 56) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    return result;
LABEL_8:
  *((_BYTE *)result + 52) = self->_scrolledToEnd;
  *((_BYTE *)result + 56) |= 0x40u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_accountId != *((_QWORD *)v4 + 1))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) == 0 || self->_mailboxId != *((_QWORD *)v4 + 4))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x20) == 0 || self->_mailboxType != *((_DWORD *)v4 + 12))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x20) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_conversationId != *((_QWORD *)v4 + 2))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x10) == 0 || self->_messageId != *((_QWORD *)v4 + 5))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_duration != *((double *)v4 + 3))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_34;
  }
  v5 = (*((_BYTE *)v4 + 56) & 0x40) == 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x40) == 0)
    {
LABEL_34:
      v5 = 0;
      goto LABEL_35;
    }
    if (self->_scrolledToEnd)
    {
      if (!*((_BYTE *)v4 + 52))
        goto LABEL_34;
    }
    else if (*((_BYTE *)v4 + 52))
    {
      goto LABEL_34;
    }
    v5 = 1;
  }
LABEL_35:

  return v5;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double duration;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  uint64_t v14;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4 = 2654435761 * self->_accountId;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_mailboxId;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_mailboxType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_conversationId;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_15:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_7;
LABEL_16:
    v13 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_15;
LABEL_6:
  v8 = 2654435761 * self->_messageId;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_16;
LABEL_7:
  duration = self->_duration;
  v10 = -duration;
  if (duration >= 0.0)
    v10 = self->_duration;
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
  if ((has & 0x40) != 0)
    v14 = 2654435761 * self->_scrolledToEnd;
  else
    v14 = 0;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 1) != 0)
  {
    self->_accountId = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 56);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v4 + 56) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_mailboxId = *((_QWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_mailboxType = *((_DWORD *)v4 + 12);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  self->_conversationId = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      goto LABEL_7;
LABEL_15:
    self->_duration = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 56) & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  self->_messageId = *((_QWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 4) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v5 & 0x40) != 0)
  {
LABEL_8:
    self->_scrolledToEnd = *((_BYTE *)v4 + 52);
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_9:

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

- (double)duration
{
  return self->_duration;
}

- (BOOL)scrolledToEnd
{
  return self->_scrolledToEnd;
}

@end
