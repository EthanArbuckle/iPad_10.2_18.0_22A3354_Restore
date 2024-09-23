@implementation EDPBInteractionEventCategoryMarked

- (void)withHasher:(id)a3 setMessage:(id)a4 data:(id)a5
{
  void *v8;
  void *v9;
  id v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a5;
  _EDPBBaseMessageFieldsFill(a3, self, a4);
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("revert")))
    {
      -[EDPBInteractionEventCategoryMarked setRemoveAllUserOverrides:](self, "setRemoveAllUserOverrides:", 1);
    }
    else
    {
      v10 = v9;
      v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("not_"));
      if (v11)
        v12 = 4;
      else
        v12 = 0;
      objc_msgSend(v10, "substringFromIndex:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = EMCategoryTypeFromString();

      if (v14)
        v15 = 3;
      else
        v15 = 0;

      -[EDPBInteractionEventCategoryMarked setCategoryType:](self, "setCategoryType:", v15);
      -[EDPBInteractionEventCategoryMarked setPositive:](self, "setPositive:", v11 ^ 1u);
    }
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
  *(_BYTE *)&self->_has |= 4u;
  self->_mailboxId = a3;
}

- (void)setHasMailboxId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMailboxId
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
    return off_1E949F388[a3];
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

- (int)categoryType
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_categoryType;
  else
    return 0;
}

- (void)setCategoryType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_categoryType = a3;
}

- (void)setHasCategoryType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasCategoryType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)categoryTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E949F3D0[a3];
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

- (void)setPositive:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_positive = a3;
}

- (void)setHasPositive:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasPositive
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setRemoveAllUserOverrides:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_removeAllUserOverrides = a3;
}

- (void)setHasRemoveAllUserOverrides:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasRemoveAllUserOverrides
{
  return *(_BYTE *)&self->_has >> 7;
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
  v8.super_class = (Class)EDPBInteractionEventCategoryMarked;
  -[EDPBInteractionEventCategoryMarked description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPBInteractionEventCategoryMarked dictionaryRepresentation](self, "dictionaryRepresentation");
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
  uint64_t categoryType;
  __CFString *v12;
  void *v13;
  void *v14;

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
  if ((has & 4) != 0)
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
      v8 = off_1E949F388[mailboxType];
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
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_messageId);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("message_id"));

    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    categoryType = self->_categoryType;
    if (categoryType >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_categoryType);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E949F3D0[categoryType];
    }
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("category_type"));

    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_positive);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("positive"));

    has = (char)self->_has;
  }
  if (has < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_removeAllUserOverrides);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("remove_all_user_overrides"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return EDPBInteractionEventCategoryMarkedReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if (has < 0)
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
    *((_BYTE *)v4 + 52) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_mailboxId;
  *((_BYTE *)v4 + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)v4 + 11) = self->_mailboxType;
  *((_BYTE *)v4 + 52) |= 0x20u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v4[2] = self->_conversationId;
  *((_BYTE *)v4 + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v4[4] = self->_messageId;
  *((_BYTE *)v4 + 52) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
LABEL_16:
    *((_BYTE *)v4 + 48) = self->_positive;
    *((_BYTE *)v4 + 52) |= 0x40u;
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_9;
LABEL_17:
    *((_BYTE *)v4 + 49) = self->_removeAllUserOverrides;
    *((_BYTE *)v4 + 52) |= 0x80u;
    goto LABEL_9;
  }
LABEL_15:
  *((_DWORD *)v4 + 10) = self->_categoryType;
  *((_BYTE *)v4 + 52) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_16;
LABEL_8:
  if (has < 0)
    goto LABEL_17;
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
    *((_BYTE *)result + 52) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 3) = self->_mailboxId;
  *((_BYTE *)result + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 11) = self->_mailboxType;
  *((_BYTE *)result + 52) |= 0x20u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_QWORD *)result + 2) = self->_conversationId;
  *((_BYTE *)result + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_QWORD *)result + 4) = self->_messageId;
  *((_BYTE *)result + 52) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 10) = self->_categoryType;
  *((_BYTE *)result + 52) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      return result;
LABEL_17:
    *((_BYTE *)result + 49) = self->_removeAllUserOverrides;
    *((_BYTE *)result + 52) |= 0x80u;
    return result;
  }
LABEL_16:
  *((_BYTE *)result + 48) = self->_positive;
  *((_BYTE *)result + 52) |= 0x40u;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    goto LABEL_17;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  BOOL v5;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[52] & 1) == 0 || self->_accountId != *((_QWORD *)v4 + 1))
      goto LABEL_42;
  }
  else if ((v4[52] & 1) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[52] & 4) == 0 || self->_mailboxId != *((_QWORD *)v4 + 3))
      goto LABEL_42;
  }
  else if ((v4[52] & 4) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((v4[52] & 0x20) == 0 || self->_mailboxType != *((_DWORD *)v4 + 11))
      goto LABEL_42;
  }
  else if ((v4[52] & 0x20) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[52] & 2) == 0 || self->_conversationId != *((_QWORD *)v4 + 2))
      goto LABEL_42;
  }
  else if ((v4[52] & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[52] & 8) == 0 || self->_messageId != *((_QWORD *)v4 + 4))
      goto LABEL_42;
  }
  else if ((v4[52] & 8) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((v4[52] & 0x10) == 0 || self->_categoryType != *((_DWORD *)v4 + 10))
      goto LABEL_42;
  }
  else if ((v4[52] & 0x10) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((v4[52] & 0x40) == 0)
      goto LABEL_42;
    if (self->_positive)
    {
      if (!v4[48])
        goto LABEL_42;
    }
    else if (v4[48])
    {
      goto LABEL_42;
    }
  }
  else if ((v4[52] & 0x40) != 0)
  {
    goto LABEL_42;
  }
  v5 = v4[52] >= 0;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if (v4[52] < 0)
    {
      if (self->_removeAllUserOverrides)
      {
        if (!v4[49])
          goto LABEL_42;
      }
      else if (v4[49])
      {
        goto LABEL_42;
      }
      v5 = 1;
      goto LABEL_43;
    }
LABEL_42:
    v5 = 0;
  }
LABEL_43:

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
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_accountId;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_mailboxId;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_mailboxType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_conversationId;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_messageId;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_categoryType;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_16:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_9;
LABEL_17:
    v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_16;
LABEL_8:
  v8 = 2654435761 * self->_positive;
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
    goto LABEL_17;
LABEL_9:
  v9 = 2654435761 * self->_removeAllUserOverrides;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 1) != 0)
  {
    self->_accountId = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 52);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_mailboxId = *((_QWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_mailboxType = *((_DWORD *)v4 + 11);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  self->_conversationId = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  self->_messageId = *((_QWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
LABEL_16:
    self->_positive = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 0x40u;
    if ((*((_BYTE *)v4 + 52) & 0x80) == 0)
      goto LABEL_9;
LABEL_17:
    self->_removeAllUserOverrides = *((_BYTE *)v4 + 49);
    *(_BYTE *)&self->_has |= 0x80u;
    goto LABEL_9;
  }
LABEL_15:
  self->_categoryType = *((_DWORD *)v4 + 10);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 0x40) != 0)
    goto LABEL_16;
LABEL_8:
  if (v5 < 0)
    goto LABEL_17;
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

- (BOOL)positive
{
  return self->_positive;
}

- (BOOL)removeAllUserOverrides
{
  return self->_removeAllUserOverrides;
}

@end
