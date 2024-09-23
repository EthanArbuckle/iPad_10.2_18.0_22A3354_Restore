@implementation EDPBInteractionEventMessageCopied

- (void)withHasher:(id)a3 setMessage:(id)a4 mailbox:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPBInteractionEventMessageCopied setAccountId:](self, "setAccountId:", objc_msgSend(v19, "hashedAccountID:", v10));

  -[EDPBInteractionEventMessageCopied setConversationId:](self, "setConversationId:", objc_msgSend(v19, "hashedConversationID:", objc_msgSend(v8, "conversationID")));
  objc_msgSend(v8, "messageIDHeader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ec_messageIDSubstring");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPBInteractionEventMessageCopied setMessageId:](self, "setMessageId:", objc_msgSend(v19, "hashedString:", v12));

  objc_msgSend(v8, "mailbox");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPBInteractionEventMessageCopied setFromMailboxId:](self, "setFromMailboxId:", objc_msgSend(v19, "hashedMailboxID:", v13));

  objc_msgSend(v8, "mailbox");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "type") - 1;
  if (v15 > 6)
    v16 = 1;
  else
    v16 = dword_1D317A638[v15];
  -[EDPBInteractionEventMessageCopied setFromMailboxType:](self, "setFromMailboxType:", v16);

  -[EDPBInteractionEventMessageCopied setToMailboxId:](self, "setToMailboxId:", objc_msgSend(v19, "hashedMailboxID:", v9));
  v17 = objc_msgSend(v9, "type") - 1;
  if (v17 > 6)
    v18 = 1;
  else
    v18 = dword_1D317A638[v17];
  -[EDPBInteractionEventMessageCopied setToMailboxType:](self, "setToMailboxType:", v18);

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
  *(_BYTE *)&self->_has |= 8u;
  self->_messageId = a3;
}

- (void)setHasMessageId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMessageId
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setFromMailboxId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_fromMailboxId = a3;
}

- (void)setHasFromMailboxId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFromMailboxId
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)fromMailboxType
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_fromMailboxType;
  else
    return 0;
}

- (void)setFromMailboxType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_fromMailboxType = a3;
}

- (void)setHasFromMailboxType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasFromMailboxType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)fromMailboxTypeAsString:(int)a3
{
  if (a3 < 9)
    return off_1E949F518[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFromMailboxType:(id)a3
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

- (void)setToMailboxId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_toMailboxId = a3;
}

- (void)setHasToMailboxId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasToMailboxId
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (int)toMailboxType
{
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    return self->_toMailboxType;
  else
    return 0;
}

- (void)setToMailboxType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_toMailboxType = a3;
}

- (void)setHasToMailboxType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasToMailboxType
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)toMailboxTypeAsString:(int)a3
{
  if (a3 < 9)
    return off_1E949F518[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsToMailboxType:(id)a3
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)EDPBInteractionEventMessageCopied;
  -[EDPBInteractionEventMessageCopied description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPBInteractionEventMessageCopied dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  void *v8;
  uint64_t fromMailboxType;
  __CFString *v10;
  void *v11;
  uint64_t toMailboxType;
  __CFString *v13;

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
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_conversationId);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("conversation_id"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_messageId);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("message_id"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_fromMailboxId);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("from_mailbox_id"));

    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    fromMailboxType = self->_fromMailboxType;
    if (fromMailboxType >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_fromMailboxType);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E949F518[fromMailboxType];
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("from_mailbox_type"));

    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_toMailboxId);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("to_mailbox_id"));

    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    toMailboxType = self->_toMailboxType;
    if (toMailboxType >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_toMailboxType);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E949F518[toMailboxType];
    }
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("to_mailbox_type"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return EDPBInteractionEventMessageCopiedReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 2) != 0)
  {
    PBDataWriterWriteSint64Field();
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    PBDataWriterWriteSint64Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteSint64Field();
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteSint64Field();
    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
    PBDataWriterWriteInt32Field();

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
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_conversationId;
  *((_BYTE *)v4 + 56) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v4[4] = self->_messageId;
  *((_BYTE *)v4 + 56) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v4[3] = self->_fromMailboxId;
  *((_BYTE *)v4 + 56) |= 4u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
LABEL_15:
    v4[5] = self->_toMailboxId;
    *((_BYTE *)v4 + 56) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  *((_DWORD *)v4 + 12) = self->_fromMailboxType;
  *((_BYTE *)v4 + 56) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 0x40) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 13) = self->_toMailboxType;
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
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 2) = self->_conversationId;
  *((_BYTE *)result + 56) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_QWORD *)result + 4) = self->_messageId;
  *((_BYTE *)result + 56) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_QWORD *)result + 3) = self->_fromMailboxId;
  *((_BYTE *)result + 56) |= 4u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 12) = self->_fromMailboxType;
  *((_BYTE *)result + 56) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      return result;
    goto LABEL_8;
  }
LABEL_15:
  *((_QWORD *)result + 5) = self->_toMailboxId;
  *((_BYTE *)result + 56) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    return result;
LABEL_8:
  *((_DWORD *)result + 13) = self->_toMailboxType;
  *((_BYTE *)result + 56) |= 0x40u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_accountId != *((_QWORD *)v4 + 1))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_36:
    v5 = 0;
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_conversationId != *((_QWORD *)v4 + 2))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) == 0 || self->_messageId != *((_QWORD *)v4 + 4))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_fromMailboxId != *((_QWORD *)v4 + 3))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x20) == 0 || self->_fromMailboxType != *((_DWORD *)v4 + 12))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x20) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x10) == 0 || self->_toMailboxId != *((_QWORD *)v4 + 5))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_36;
  }
  v5 = (*((_BYTE *)v4 + 56) & 0x40) == 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x40) == 0 || self->_toMailboxType != *((_DWORD *)v4 + 13))
      goto LABEL_36;
    v5 = 1;
  }
LABEL_37:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_accountId;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_conversationId;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_messageId;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_fromMailboxId;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_fromMailboxType;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_7;
LABEL_14:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_15:
    v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_14;
LABEL_7:
  v7 = 2654435761 * self->_toMailboxId;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_15;
LABEL_8:
  v8 = 2654435761 * self->_toMailboxType;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
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
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v4 + 56) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_conversationId = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_messageId = *((_QWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  self->_fromMailboxId = *((_QWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
LABEL_15:
    self->_toMailboxId = *((_QWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
    if ((*((_BYTE *)v4 + 56) & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  self->_fromMailboxType = *((_DWORD *)v4 + 12);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 0x10) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v5 & 0x40) != 0)
  {
LABEL_8:
    self->_toMailboxType = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_9:

}

- (int64_t)accountId
{
  return self->_accountId;
}

- (int64_t)conversationId
{
  return self->_conversationId;
}

- (int64_t)messageId
{
  return self->_messageId;
}

- (int64_t)fromMailboxId
{
  return self->_fromMailboxId;
}

- (int64_t)toMailboxId
{
  return self->_toMailboxId;
}

@end
