@implementation _INPBPayloadConfirmation

- (void)setSendAnnouncementIntentAnnouncementConfirmationReason:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_sendAnnouncementIntentAnnouncementConfirmationReason = a3;
  }
}

- (BOOL)hasSendAnnouncementIntentAnnouncementConfirmationReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSendAnnouncementIntentAnnouncementConfirmationReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)sendAnnouncementIntentAnnouncementConfirmationReasonAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
  {
    v3 = CFSTR("DURATION_ABOVE_MAX_THRESHOLD");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSendAnnouncementIntentAnnouncementConfirmationReason:(id)a3
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("DURATION_ABOVE_MAX_THRESHOLD"));
  return 1;
}

- (void)setConfirmationItem:(id)a3
{
  objc_storeStrong((id *)&self->_confirmationItem, a3);
}

- (BOOL)hasConfirmationItem
{
  return self->_confirmationItem != 0;
}

- (void)setStartCallIntentContactsConfirmationReason:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFD;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 2;
    self->_startCallIntentContactsConfirmationReason = a3;
  }
}

- (BOOL)hasStartCallIntentContactsConfirmationReason
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasStartCallIntentContactsConfirmationReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)startCallIntentContactsConfirmationReasonAsString:(int)a3
{
  if ((a3 - 1) < 5)
    return off_1E228D330[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStartCallIntentContactsConfirmationReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID_NUMBER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOP_MATCH_HANDLE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOP_MATCH_NAME")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_CONTACTS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FOUND_IN_APPS_TOP_MATCH_NAME")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setReason:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFB;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 4;
    self->_reason = a3;
  }
}

- (BOOL)hasReason
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (id)reasonAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("ConfirmationReasonNone");
  if (a3 == 1000)
  {
    v3 = CFSTR("ConfirmationReasonExtension");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ConfirmationReasonNone")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ConfirmationReasonExtension")))
  {
    v4 = 1000;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setAddTasksIntentTargetTaskListConfirmationReason:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xF7;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 8;
    self->_addTasksIntentTargetTaskListConfirmationReason = a3;
  }
}

- (BOOL)hasAddTasksIntentTargetTaskListConfirmationReason
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasAddTasksIntentTargetTaskListConfirmationReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (id)addTasksIntentTargetTaskListConfirmationReasonAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
  {
    v3 = CFSTR("LIST_SHOULD_BE_CREATED");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsAddTasksIntentTargetTaskListConfirmationReason:(id)a3
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("LIST_SHOULD_BE_CREATED"));
  return 1;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPayloadConfirmationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[_INPBPayloadConfirmation hasSendAnnouncementIntentAnnouncementConfirmationReason](self, "hasSendAnnouncementIntentAnnouncementConfirmationReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  -[_INPBPayloadConfirmation confirmationItem](self, "confirmationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBPayloadConfirmation confirmationItem](self, "confirmationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBPayloadConfirmation hasStartCallIntentContactsConfirmationReason](self, "hasStartCallIntentContactsConfirmationReason"))
  {
    PBDataWriterWriteInt32Field();
  }
  if (-[_INPBPayloadConfirmation hasReason](self, "hasReason"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBPayloadConfirmation hasAddTasksIntentTargetTaskListConfirmationReason](self, "hasAddTasksIntentTargetTaskListConfirmationReason"))
  {
    PBDataWriterWriteInt32Field();
  }

}

- (_INPBPayloadConfirmation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBPayloadConfirmation *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBPayloadConfirmation *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBPayloadConfirmation *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBPayloadConfirmation initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBPayloadConfirmation data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBPayloadConfirmation *v5;
  id v6;

  v5 = -[_INPBPayloadConfirmation init](+[_INPBPayloadConfirmation allocWithZone:](_INPBPayloadConfirmation, "allocWithZone:"), "init");
  if (-[_INPBPayloadConfirmation hasSendAnnouncementIntentAnnouncementConfirmationReason](self, "hasSendAnnouncementIntentAnnouncementConfirmationReason"))
  {
    -[_INPBPayloadConfirmation setSendAnnouncementIntentAnnouncementConfirmationReason:](v5, "setSendAnnouncementIntentAnnouncementConfirmationReason:", -[_INPBPayloadConfirmation sendAnnouncementIntentAnnouncementConfirmationReason](self, "sendAnnouncementIntentAnnouncementConfirmationReason"));
  }
  v6 = -[_INPBSelectionItem copyWithZone:](self->_confirmationItem, "copyWithZone:", a3);
  -[_INPBPayloadConfirmation setConfirmationItem:](v5, "setConfirmationItem:", v6);

  if (-[_INPBPayloadConfirmation hasStartCallIntentContactsConfirmationReason](self, "hasStartCallIntentContactsConfirmationReason"))
  {
    -[_INPBPayloadConfirmation setStartCallIntentContactsConfirmationReason:](v5, "setStartCallIntentContactsConfirmationReason:", -[_INPBPayloadConfirmation startCallIntentContactsConfirmationReason](self, "startCallIntentContactsConfirmationReason"));
  }
  if (-[_INPBPayloadConfirmation hasReason](self, "hasReason"))
    -[_INPBPayloadConfirmation setReason:](v5, "setReason:", -[_INPBPayloadConfirmation reason](self, "reason"));
  if (-[_INPBPayloadConfirmation hasAddTasksIntentTargetTaskListConfirmationReason](self, "hasAddTasksIntentTargetTaskListConfirmationReason"))
  {
    -[_INPBPayloadConfirmation setAddTasksIntentTargetTaskListConfirmationReason:](v5, "setAddTasksIntentTargetTaskListConfirmationReason:", -[_INPBPayloadConfirmation addTasksIntentTargetTaskListConfirmationReason](self, "addTasksIntentTargetTaskListConfirmationReason"));
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int sendAnnouncementIntentAnnouncementConfirmationReason;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  int startCallIntentContactsConfirmationReason;
  int v17;
  int reason;
  int v19;
  BOOL v20;
  int addTasksIntentTargetTaskListConfirmationReason;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  v5 = -[_INPBPayloadConfirmation hasSendAnnouncementIntentAnnouncementConfirmationReason](self, "hasSendAnnouncementIntentAnnouncementConfirmationReason");
  if (v5 != objc_msgSend(v4, "hasSendAnnouncementIntentAnnouncementConfirmationReason"))
    goto LABEL_21;
  if (-[_INPBPayloadConfirmation hasSendAnnouncementIntentAnnouncementConfirmationReason](self, "hasSendAnnouncementIntentAnnouncementConfirmationReason"))
  {
    if (objc_msgSend(v4, "hasSendAnnouncementIntentAnnouncementConfirmationReason"))
    {
      sendAnnouncementIntentAnnouncementConfirmationReason = self->_sendAnnouncementIntentAnnouncementConfirmationReason;
      if (sendAnnouncementIntentAnnouncementConfirmationReason != objc_msgSend(v4, "sendAnnouncementIntentAnnouncementConfirmationReason"))goto LABEL_21;
    }
  }
  -[_INPBPayloadConfirmation confirmationItem](self, "confirmationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "confirmationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBPayloadConfirmation confirmationItem](self, "confirmationItem");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[_INPBPayloadConfirmation confirmationItem](self, "confirmationItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "confirmationItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (!v14)
        goto LABEL_21;
    }
    else
    {

    }
    v15 = -[_INPBPayloadConfirmation hasStartCallIntentContactsConfirmationReason](self, "hasStartCallIntentContactsConfirmationReason");
    if (v15 == objc_msgSend(v4, "hasStartCallIntentContactsConfirmationReason"))
    {
      if (!-[_INPBPayloadConfirmation hasStartCallIntentContactsConfirmationReason](self, "hasStartCallIntentContactsConfirmationReason")|| !objc_msgSend(v4, "hasStartCallIntentContactsConfirmationReason")|| (startCallIntentContactsConfirmationReason = self->_startCallIntentContactsConfirmationReason, startCallIntentContactsConfirmationReason == objc_msgSend(v4, "startCallIntentContactsConfirmationReason")))
      {
        v17 = -[_INPBPayloadConfirmation hasReason](self, "hasReason");
        if (v17 == objc_msgSend(v4, "hasReason"))
        {
          if (!-[_INPBPayloadConfirmation hasReason](self, "hasReason")
            || !objc_msgSend(v4, "hasReason")
            || (reason = self->_reason, reason == objc_msgSend(v4, "reason")))
          {
            v19 = -[_INPBPayloadConfirmation hasAddTasksIntentTargetTaskListConfirmationReason](self, "hasAddTasksIntentTargetTaskListConfirmationReason");
            if (v19 == objc_msgSend(v4, "hasAddTasksIntentTargetTaskListConfirmationReason"))
            {
              if (!-[_INPBPayloadConfirmation hasAddTasksIntentTargetTaskListConfirmationReason](self, "hasAddTasksIntentTargetTaskListConfirmationReason")|| !objc_msgSend(v4, "hasAddTasksIntentTargetTaskListConfirmationReason")|| (addTasksIntentTargetTaskListConfirmationReason = self->_addTasksIntentTargetTaskListConfirmationReason, addTasksIntentTargetTaskListConfirmationReason == objc_msgSend(v4, "addTasksIntentTargetTaskListConfirmationReason")))
              {
                v20 = 1;
                goto LABEL_22;
              }
            }
          }
        }
      }
    }
  }
  else
  {

  }
LABEL_21:
  v20 = 0;
LABEL_22:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (-[_INPBPayloadConfirmation hasSendAnnouncementIntentAnnouncementConfirmationReason](self, "hasSendAnnouncementIntentAnnouncementConfirmationReason"))
  {
    v3 = 2654435761 * self->_sendAnnouncementIntentAnnouncementConfirmationReason;
  }
  else
  {
    v3 = 0;
  }
  v4 = -[_INPBSelectionItem hash](self->_confirmationItem, "hash");
  if (-[_INPBPayloadConfirmation hasStartCallIntentContactsConfirmationReason](self, "hasStartCallIntentContactsConfirmationReason"))
  {
    v5 = 2654435761 * self->_startCallIntentContactsConfirmationReason;
  }
  else
  {
    v5 = 0;
  }
  if (-[_INPBPayloadConfirmation hasReason](self, "hasReason"))
    v6 = 2654435761 * self->_reason;
  else
    v6 = 0;
  if (-[_INPBPayloadConfirmation hasAddTasksIntentTargetTaskListConfirmationReason](self, "hasAddTasksIntentTargetTaskListConfirmationReason"))
  {
    v7 = 2654435761 * self->_addTasksIntentTargetTaskListConfirmationReason;
  }
  else
  {
    v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  __CFString *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBPayloadConfirmation hasSendAnnouncementIntentAnnouncementConfirmationReason](self, "hasSendAnnouncementIntentAnnouncementConfirmationReason"))
  {
    v4 = -[_INPBPayloadConfirmation sendAnnouncementIntentAnnouncementConfirmationReason](self, "sendAnnouncementIntentAnnouncementConfirmationReason");
    if ((_DWORD)v4 == 1)
    {
      v5 = CFSTR("DURATION_ABOVE_MAX_THRESHOLD");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("announcementConfirmationReason"));

  }
  -[_INPBPayloadConfirmation confirmationItem](self, "confirmationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("confirmationItem"));

  if (-[_INPBPayloadConfirmation hasStartCallIntentContactsConfirmationReason](self, "hasStartCallIntentContactsConfirmationReason"))
  {
    v8 = -[_INPBPayloadConfirmation startCallIntentContactsConfirmationReason](self, "startCallIntentContactsConfirmationReason");
    if ((v8 - 1) >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E228D330[(v8 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("contactsConfirmationReason"));

  }
  if (-[_INPBPayloadConfirmation hasReason](self, "hasReason"))
  {
    v10 = -[_INPBPayloadConfirmation reason](self, "reason");
    if ((_DWORD)v10 == 1)
    {
      v11 = CFSTR("ConfirmationReasonNone");
    }
    else if ((_DWORD)v10 == 1000)
    {
      v11 = CFSTR("ConfirmationReasonExtension");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("reason"));

  }
  if (-[_INPBPayloadConfirmation hasAddTasksIntentTargetTaskListConfirmationReason](self, "hasAddTasksIntentTargetTaskListConfirmationReason"))
  {
    v12 = -[_INPBPayloadConfirmation addTasksIntentTargetTaskListConfirmationReason](self, "addTasksIntentTargetTaskListConfirmationReason");
    if ((_DWORD)v12 == 1)
    {
      v13 = CFSTR("LIST_SHOULD_BE_CREATED");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("targetTaskListConfirmationReason"));

  }
  return v3;
}

- (int)sendAnnouncementIntentAnnouncementConfirmationReason
{
  return self->_sendAnnouncementIntentAnnouncementConfirmationReason;
}

- (_INPBSelectionItem)confirmationItem
{
  return self->_confirmationItem;
}

- (int)startCallIntentContactsConfirmationReason
{
  return self->_startCallIntentContactsConfirmationReason;
}

- (int)reason
{
  return self->_reason;
}

- (int)addTasksIntentTargetTaskListConfirmationReason
{
  return self->_addTasksIntentTargetTaskListConfirmationReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationItem, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
