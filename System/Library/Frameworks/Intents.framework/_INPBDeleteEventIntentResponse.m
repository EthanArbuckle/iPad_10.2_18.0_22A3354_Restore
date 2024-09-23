@implementation _INPBDeleteEventIntentResponse

- (void)setConfirmationReason:(int)a3
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
    self->_confirmationReason = a3;
  }
}

- (BOOL)hasConfirmationReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasConfirmationReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)confirmationReasonAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
  {
    v3 = CFSTR("DELETE_ALL_RECURRENCES");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsConfirmationReason:(id)a3
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("DELETE_ALL_RECURRENCES"));
  return 1;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDeleteEventIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_INPBDeleteEventIntentResponse hasConfirmationReason](self, "hasConfirmationReason"))
    PBDataWriterWriteInt32Field();

}

- (_INPBDeleteEventIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBDeleteEventIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBDeleteEventIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBDeleteEventIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBDeleteEventIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBDeleteEventIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBDeleteEventIntentResponse *v4;

  v4 = -[_INPBDeleteEventIntentResponse init](+[_INPBDeleteEventIntentResponse allocWithZone:](_INPBDeleteEventIntentResponse, "allocWithZone:", a3), "init");
  if (-[_INPBDeleteEventIntentResponse hasConfirmationReason](self, "hasConfirmationReason"))
    -[_INPBDeleteEventIntentResponse setConfirmationReason:](v4, "setConfirmationReason:", -[_INPBDeleteEventIntentResponse confirmationReason](self, "confirmationReason"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  int confirmationReason;

  v4 = a3;
  v6 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBDeleteEventIntentResponse hasConfirmationReason](self, "hasConfirmationReason");
    if (v5 == objc_msgSend(v4, "hasConfirmationReason"))
    {
      if (!-[_INPBDeleteEventIntentResponse hasConfirmationReason](self, "hasConfirmationReason")
        || !objc_msgSend(v4, "hasConfirmationReason")
        || (confirmationReason = self->_confirmationReason,
            confirmationReason == objc_msgSend(v4, "confirmationReason")))
      {
        v6 = 1;
      }
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if (-[_INPBDeleteEventIntentResponse hasConfirmationReason](self, "hasConfirmationReason"))
    return 2654435761 * self->_confirmationReason;
  else
    return 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBDeleteEventIntentResponse hasConfirmationReason](self, "hasConfirmationReason"))
  {
    v4 = -[_INPBDeleteEventIntentResponse confirmationReason](self, "confirmationReason");
    if ((_DWORD)v4 == 1)
    {
      v5 = CFSTR("DELETE_ALL_RECURRENCES");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("confirmationReason"));

  }
  return v3;
}

- (int)confirmationReason
{
  return self->_confirmationReason;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
