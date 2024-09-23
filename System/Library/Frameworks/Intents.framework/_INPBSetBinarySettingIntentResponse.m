@implementation _INPBSetBinarySettingIntentResponse

- (void)setErrorDetail:(id)a3
{
  NSString *v4;
  NSString *errorDetail;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  errorDetail = self->_errorDetail;
  self->_errorDetail = v4;

}

- (BOOL)hasErrorDetail
{
  return self->_errorDetail != 0;
}

- (void)setOldValue:(int)a3
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
    self->_oldValue = a3;
  }
}

- (BOOL)hasOldValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasOldValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)oldValueAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return *(&off_1E2294688 + (a3 - 1));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOldValue:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ON")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFF")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TOGGLE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setUpdatedValue:(int)a3
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
    self->_updatedValue = a3;
  }
}

- (BOOL)hasUpdatedValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasUpdatedValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)updatedValueAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return *(&off_1E2294688 + (a3 - 1));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUpdatedValue:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ON")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFF")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TOGGLE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetBinarySettingIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_INPBSetBinarySettingIntentResponse errorDetail](self, "errorDetail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if (-[_INPBSetBinarySettingIntentResponse hasOldValue](self, "hasOldValue"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBSetBinarySettingIntentResponse hasUpdatedValue](self, "hasUpdatedValue"))
    PBDataWriterWriteInt32Field();

}

- (_INPBSetBinarySettingIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSetBinarySettingIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSetBinarySettingIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSetBinarySettingIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSetBinarySettingIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBSetBinarySettingIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSetBinarySettingIntentResponse *v5;
  void *v6;

  v5 = -[_INPBSetBinarySettingIntentResponse init](+[_INPBSetBinarySettingIntentResponse allocWithZone:](_INPBSetBinarySettingIntentResponse, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_errorDetail, "copyWithZone:", a3);
  -[_INPBSetBinarySettingIntentResponse setErrorDetail:](v5, "setErrorDetail:", v6);

  if (-[_INPBSetBinarySettingIntentResponse hasOldValue](self, "hasOldValue"))
    -[_INPBSetBinarySettingIntentResponse setOldValue:](v5, "setOldValue:", -[_INPBSetBinarySettingIntentResponse oldValue](self, "oldValue"));
  if (-[_INPBSetBinarySettingIntentResponse hasUpdatedValue](self, "hasUpdatedValue"))
    -[_INPBSetBinarySettingIntentResponse setUpdatedValue:](v5, "setUpdatedValue:", -[_INPBSetBinarySettingIntentResponse updatedValue](self, "updatedValue"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int oldValue;
  int v15;
  BOOL v16;
  int updatedValue;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[_INPBSetBinarySettingIntentResponse errorDetail](self, "errorDetail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorDetail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSetBinarySettingIntentResponse errorDetail](self, "errorDetail");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[_INPBSetBinarySettingIntentResponse errorDetail](self, "errorDetail");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "errorDetail");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_13;
    }
    else
    {

    }
    v13 = -[_INPBSetBinarySettingIntentResponse hasOldValue](self, "hasOldValue");
    if (v13 == objc_msgSend(v4, "hasOldValue"))
    {
      if (!-[_INPBSetBinarySettingIntentResponse hasOldValue](self, "hasOldValue")
        || !objc_msgSend(v4, "hasOldValue")
        || (oldValue = self->_oldValue, oldValue == objc_msgSend(v4, "oldValue")))
      {
        v15 = -[_INPBSetBinarySettingIntentResponse hasUpdatedValue](self, "hasUpdatedValue");
        if (v15 == objc_msgSend(v4, "hasUpdatedValue"))
        {
          if (!-[_INPBSetBinarySettingIntentResponse hasUpdatedValue](self, "hasUpdatedValue")
            || !objc_msgSend(v4, "hasUpdatedValue")
            || (updatedValue = self->_updatedValue, updatedValue == objc_msgSend(v4, "updatedValue")))
          {
            v16 = 1;
            goto LABEL_14;
          }
        }
      }
    }
  }
  else
  {

  }
LABEL_13:
  v16 = 0;
LABEL_14:

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_errorDetail, "hash");
  if (-[_INPBSetBinarySettingIntentResponse hasOldValue](self, "hasOldValue"))
    v4 = 2654435761 * self->_oldValue;
  else
    v4 = 0;
  if (-[_INPBSetBinarySettingIntentResponse hasUpdatedValue](self, "hasUpdatedValue"))
    v5 = 2654435761 * self->_updatedValue;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_errorDetail)
  {
    -[_INPBSetBinarySettingIntentResponse errorDetail](self, "errorDetail");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("errorDetail"));

  }
  if (-[_INPBSetBinarySettingIntentResponse hasOldValue](self, "hasOldValue"))
  {
    v6 = -[_INPBSetBinarySettingIntentResponse oldValue](self, "oldValue");
    if ((v6 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = *(&off_1E2294688 + (v6 - 1));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("oldValue"));

  }
  if (-[_INPBSetBinarySettingIntentResponse hasUpdatedValue](self, "hasUpdatedValue"))
  {
    v8 = -[_INPBSetBinarySettingIntentResponse updatedValue](self, "updatedValue");
    if ((v8 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = *(&off_1E2294688 + (v8 - 1));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("updatedValue"));

  }
  return v3;
}

- (NSString)errorDetail
{
  return self->_errorDetail;
}

- (int)oldValue
{
  return self->_oldValue;
}

- (int)updatedValue
{
  return self->_updatedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDetail, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
