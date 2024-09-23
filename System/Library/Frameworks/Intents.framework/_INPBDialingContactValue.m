@implementation _INPBDialingContactValue

- (void)setDialingContact:(id)a3
{
  objc_storeStrong((id *)&self->_dialingContact, a3);
}

- (BOOL)hasDialingContact
{
  return self->_dialingContact != 0;
}

- (void)setDialingPhoneLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dialingPhoneLabel, a3);
}

- (BOOL)hasDialingPhoneLabel
{
  return self->_dialingPhoneLabel != 0;
}

- (void)setDialingPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_dialingPhoneNumber, a3);
}

- (BOOL)hasDialingPhoneNumber
{
  return self->_dialingPhoneNumber != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDialingContactValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[_INPBDialingContactValue dialingContact](self, "dialingContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBDialingContactValue dialingContact](self, "dialingContact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBDialingContactValue dialingPhoneLabel](self, "dialingPhoneLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBDialingContactValue dialingPhoneLabel](self, "dialingPhoneLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBDialingContactValue dialingPhoneNumber](self, "dialingPhoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBDialingContactValue dialingPhoneNumber](self, "dialingPhoneNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBDialingContactValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBDialingContactValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBDialingContactValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBDialingContactValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBDialingContactValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBDialingContactValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBDialingContactValue *v5;
  id v6;
  id v7;
  id v8;

  v5 = -[_INPBDialingContactValue init](+[_INPBDialingContactValue allocWithZone:](_INPBDialingContactValue, "allocWithZone:"), "init");
  v6 = -[_INPBContactValue copyWithZone:](self->_dialingContact, "copyWithZone:", a3);
  -[_INPBDialingContactValue setDialingContact:](v5, "setDialingContact:", v6);

  v7 = -[_INPBStringValue copyWithZone:](self->_dialingPhoneLabel, "copyWithZone:", a3);
  -[_INPBDialingContactValue setDialingPhoneLabel:](v5, "setDialingPhoneLabel:", v7);

  v8 = -[_INPBStringValue copyWithZone:](self->_dialingPhoneNumber, "copyWithZone:", a3);
  -[_INPBDialingContactValue setDialingPhoneNumber:](v5, "setDialingPhoneNumber:", v8);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_INPBDialingContactValue dialingContact](self, "dialingContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dialingContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBDialingContactValue dialingContact](self, "dialingContact");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBDialingContactValue dialingContact](self, "dialingContact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dialingContact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBDialingContactValue dialingPhoneLabel](self, "dialingPhoneLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dialingPhoneLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBDialingContactValue dialingPhoneLabel](self, "dialingPhoneLabel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBDialingContactValue dialingPhoneLabel](self, "dialingPhoneLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dialingPhoneLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBDialingContactValue dialingPhoneNumber](self, "dialingPhoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dialingPhoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBDialingContactValue dialingPhoneNumber](self, "dialingPhoneNumber");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBDialingContactValue dialingPhoneNumber](self, "dialingPhoneNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dialingPhoneNumber");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[_INPBContactValue hash](self->_dialingContact, "hash");
  v4 = -[_INPBStringValue hash](self->_dialingPhoneLabel, "hash") ^ v3;
  return v4 ^ -[_INPBStringValue hash](self->_dialingPhoneNumber, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBDialingContactValue dialingContact](self, "dialingContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dialingContact"));

  -[_INPBDialingContactValue dialingPhoneLabel](self, "dialingPhoneLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("dialingPhoneLabel"));

  -[_INPBDialingContactValue dialingPhoneNumber](self, "dialingPhoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("dialingPhoneNumber"));

  return v3;
}

- (_INPBContactValue)dialingContact
{
  return self->_dialingContact;
}

- (_INPBStringValue)dialingPhoneLabel
{
  return self->_dialingPhoneLabel;
}

- (_INPBStringValue)dialingPhoneNumber
{
  return self->_dialingPhoneNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialingPhoneNumber, 0);
  objc_storeStrong((id *)&self->_dialingPhoneLabel, 0);
  objc_storeStrong((id *)&self->_dialingContact, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
