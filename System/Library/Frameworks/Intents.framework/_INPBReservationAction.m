@implementation _INPBReservationAction

- (void)setType:(int)a3
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
    self->_type = a3;
  }
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("UNKNOWN_RESERVATION_ACTION");
  if (a3 == 2)
  {
    v3 = CFSTR("CHECK_IN");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_RESERVATION_ACTION")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("CHECK_IN")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_userActivity, a3);
}

- (BOOL)hasUserActivity
{
  return self->_userActivity != 0;
}

- (void)setValidDuration:(id)a3
{
  objc_storeStrong((id *)&self->_validDuration, a3);
}

- (BOOL)hasValidDuration
{
  return self->_validDuration != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBReservationActionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[_INPBReservationAction hasType](self, "hasType"))
    PBDataWriterWriteInt32Field();
  -[_INPBReservationAction userActivity](self, "userActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBReservationAction userActivity](self, "userActivity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBReservationAction validDuration](self, "validDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6)
  {
    -[_INPBReservationAction validDuration](self, "validDuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v7 = v9;
  }

}

- (_INPBReservationAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBReservationAction *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBReservationAction *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBReservationAction *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBReservationAction initWithData:](self, "initWithData:", v6);

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
  -[_INPBReservationAction data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBReservationAction *v5;
  id v6;
  id v7;

  v5 = -[_INPBReservationAction init](+[_INPBReservationAction allocWithZone:](_INPBReservationAction, "allocWithZone:"), "init");
  if (-[_INPBReservationAction hasType](self, "hasType"))
    -[_INPBReservationAction setType:](v5, "setType:", -[_INPBReservationAction type](self, "type"));
  v6 = -[_INPBUserActivity copyWithZone:](self->_userActivity, "copyWithZone:", a3);
  -[_INPBReservationAction setUserActivity:](v5, "setUserActivity:", v6);

  v7 = -[_INPBDateTimeRange copyWithZone:](self->_validDuration, "copyWithZone:", a3);
  -[_INPBReservationAction setValidDuration:](v5, "setValidDuration:", v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int type;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  v5 = -[_INPBReservationAction hasType](self, "hasType");
  if (v5 != objc_msgSend(v4, "hasType"))
    goto LABEL_16;
  if (-[_INPBReservationAction hasType](self, "hasType"))
  {
    if (objc_msgSend(v4, "hasType"))
    {
      type = self->_type;
      if (type != objc_msgSend(v4, "type"))
        goto LABEL_16;
    }
  }
  -[_INPBReservationAction userActivity](self, "userActivity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userActivity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_15;
  -[_INPBReservationAction userActivity](self, "userActivity");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBReservationAction userActivity](self, "userActivity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userActivity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_16;
  }
  else
  {

  }
  -[_INPBReservationAction validDuration](self, "validDuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "validDuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBReservationAction validDuration](self, "validDuration");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {

LABEL_19:
      v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    -[_INPBReservationAction validDuration](self, "validDuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "validDuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) != 0)
      goto LABEL_19;
  }
  else
  {
LABEL_15:

  }
LABEL_16:
  v19 = 0;
LABEL_17:

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  if (-[_INPBReservationAction hasType](self, "hasType"))
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[_INPBUserActivity hash](self->_userActivity, "hash") ^ v3;
  return v4 ^ -[_INPBDateTimeRange hash](self->_validDuration, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBReservationAction hasType](self, "hasType"))
  {
    v4 = -[_INPBReservationAction type](self, "type");
    if ((_DWORD)v4 == 1)
    {
      v5 = CFSTR("UNKNOWN_RESERVATION_ACTION");
    }
    else if ((_DWORD)v4 == 2)
    {
      v5 = CFSTR("CHECK_IN");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("type"));

  }
  -[_INPBReservationAction userActivity](self, "userActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("userActivity"));

  -[_INPBReservationAction validDuration](self, "validDuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("validDuration"));

  return v3;
}

- (int)type
{
  return self->_type;
}

- (_INPBUserActivity)userActivity
{
  return self->_userActivity;
}

- (_INPBDateTimeRange)validDuration
{
  return self->_validDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validDuration, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
