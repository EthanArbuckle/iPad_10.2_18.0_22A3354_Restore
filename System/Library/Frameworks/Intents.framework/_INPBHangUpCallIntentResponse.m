@implementation _INPBHangUpCallIntentResponse

- (void)setHungUpCallType:(int)a3
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
    self->_hungUpCallType = a3;
  }
}

- (BOOL)hasHungUpCallType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasHungUpCallType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)hungUpCallTypeAsString:(int)a3
{
  int v3;
  __CFString *v4;

  v3 = a3 - 2;
  if ((a3 - 2) < 9 && ((0x1EFu >> v3) & 1) != 0)
  {
    v4 = off_1E2293A20[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsHungUpCallType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OUTGOING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MISSED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECEIVED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LATEST")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOICEMAIL")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RINGING")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IN_PROGRESS")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ON_HOLD")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBHangUpCallIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_INPBHangUpCallIntentResponse hasHungUpCallType](self, "hasHungUpCallType"))
    PBDataWriterWriteInt32Field();

}

- (_INPBHangUpCallIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBHangUpCallIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBHangUpCallIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBHangUpCallIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBHangUpCallIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBHangUpCallIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBHangUpCallIntentResponse *v4;

  v4 = -[_INPBHangUpCallIntentResponse init](+[_INPBHangUpCallIntentResponse allocWithZone:](_INPBHangUpCallIntentResponse, "allocWithZone:", a3), "init");
  if (-[_INPBHangUpCallIntentResponse hasHungUpCallType](self, "hasHungUpCallType"))
    -[_INPBHangUpCallIntentResponse setHungUpCallType:](v4, "setHungUpCallType:", -[_INPBHangUpCallIntentResponse hungUpCallType](self, "hungUpCallType"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  int hungUpCallType;

  v4 = a3;
  v6 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBHangUpCallIntentResponse hasHungUpCallType](self, "hasHungUpCallType");
    if (v5 == objc_msgSend(v4, "hasHungUpCallType"))
    {
      if (!-[_INPBHangUpCallIntentResponse hasHungUpCallType](self, "hasHungUpCallType")
        || !objc_msgSend(v4, "hasHungUpCallType")
        || (hungUpCallType = self->_hungUpCallType, hungUpCallType == objc_msgSend(v4, "hungUpCallType")))
      {
        v6 = 1;
      }
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if (-[_INPBHangUpCallIntentResponse hasHungUpCallType](self, "hasHungUpCallType"))
    return 2654435761 * self->_hungUpCallType;
  else
    return 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  int v5;
  __CFString *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBHangUpCallIntentResponse hasHungUpCallType](self, "hasHungUpCallType"))
  {
    v4 = -[_INPBHangUpCallIntentResponse hungUpCallType](self, "hungUpCallType");
    v5 = v4 - 2;
    if ((v4 - 2) < 9 && ((0x1EFu >> v5) & 1) != 0)
    {
      v6 = off_1E2293A20[v5];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("hungUpCallType"));

  }
  return v3;
}

- (int)hungUpCallType
{
  return self->_hungUpCallType;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
