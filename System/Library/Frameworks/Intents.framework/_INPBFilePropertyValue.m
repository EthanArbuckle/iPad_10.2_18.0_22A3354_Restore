@implementation _INPBFilePropertyValue

- (void)setDateTime:(id)a3
{
  objc_storeStrong((id *)&self->_dateTime, a3);
}

- (BOOL)hasDateTime
{
  return self->_dateTime != 0;
}

- (void)setFileType:(int)a3
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
    self->_fileType = a3;
  }
}

- (BOOL)hasFileType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasFileType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)fileTypeAsString:(int)a3
{
  if (a3 < 0xB)
    return off_1E228B3F8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFileType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OTHER")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPLICATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DOCUMENT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MUSIC")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOVIE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDF")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRESENTATION")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IMAGE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOURCE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPREADSHEET")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TEXT")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (BOOL)hasPerson
{
  return self->_person != 0;
}

- (void)setQuantity:(id)a3
{
  objc_storeStrong((id *)&self->_quantity, a3);
}

- (BOOL)hasQuantity
{
  return self->_quantity != 0;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBFilePropertyValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[_INPBFilePropertyValue dateTime](self, "dateTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBFilePropertyValue dateTime](self, "dateTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBFilePropertyValue hasFileType](self, "hasFileType"))
    PBDataWriterWriteInt32Field();
  -[_INPBFilePropertyValue person](self, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBFilePropertyValue person](self, "person");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBFilePropertyValue quantity](self, "quantity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBFilePropertyValue quantity](self, "quantity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBFilePropertyValue value](self, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v13;
  if (v10)
  {
    -[_INPBFilePropertyValue value](self, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v11 = v13;
  }

}

- (_INPBFilePropertyValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBFilePropertyValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBFilePropertyValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBFilePropertyValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBFilePropertyValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBFilePropertyValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBFilePropertyValue *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = -[_INPBFilePropertyValue init](+[_INPBFilePropertyValue allocWithZone:](_INPBFilePropertyValue, "allocWithZone:"), "init");
  v6 = -[_INPBDateTimeRange copyWithZone:](self->_dateTime, "copyWithZone:", a3);
  -[_INPBFilePropertyValue setDateTime:](v5, "setDateTime:", v6);

  if (-[_INPBFilePropertyValue hasFileType](self, "hasFileType"))
    -[_INPBFilePropertyValue setFileType:](v5, "setFileType:", -[_INPBFilePropertyValue fileType](self, "fileType"));
  v7 = -[_INPBContact copyWithZone:](self->_person, "copyWithZone:", a3);
  -[_INPBFilePropertyValue setPerson:](v5, "setPerson:", v7);

  v8 = -[_INPBLong copyWithZone:](self->_quantity, "copyWithZone:", a3);
  -[_INPBFilePropertyValue setQuantity:](v5, "setQuantity:", v8);

  v9 = -[_INPBString copyWithZone:](self->_value, "copyWithZone:", a3);
  -[_INPBFilePropertyValue setValue:](v5, "setValue:", v9);

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
  int v12;
  int fileType;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  BOOL v29;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  -[_INPBFilePropertyValue dateTime](self, "dateTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_25;
  -[_INPBFilePropertyValue dateTime](self, "dateTime");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBFilePropertyValue dateTime](self, "dateTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_26;
  }
  else
  {

  }
  v12 = -[_INPBFilePropertyValue hasFileType](self, "hasFileType");
  if (v12 != objc_msgSend(v4, "hasFileType"))
    goto LABEL_26;
  if (-[_INPBFilePropertyValue hasFileType](self, "hasFileType"))
  {
    if (objc_msgSend(v4, "hasFileType"))
    {
      fileType = self->_fileType;
      if (fileType != objc_msgSend(v4, "fileType"))
        goto LABEL_26;
    }
  }
  -[_INPBFilePropertyValue person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_25;
  -[_INPBFilePropertyValue person](self, "person");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBFilePropertyValue person](self, "person");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "person");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBFilePropertyValue quantity](self, "quantity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quantity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_25;
  -[_INPBFilePropertyValue quantity](self, "quantity");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBFilePropertyValue quantity](self, "quantity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "quantity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBFilePropertyValue value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBFilePropertyValue value](self, "value");
    v24 = objc_claimAutoreleasedReturnValue();
    if (!v24)
    {

LABEL_29:
      v29 = 1;
      goto LABEL_27;
    }
    v25 = (void *)v24;
    -[_INPBFilePropertyValue value](self, "value");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if ((v28 & 1) != 0)
      goto LABEL_29;
  }
  else
  {
LABEL_25:

  }
LABEL_26:
  v29 = 0;
LABEL_27:

  return v29;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[_INPBDateTimeRange hash](self->_dateTime, "hash");
  if (-[_INPBFilePropertyValue hasFileType](self, "hasFileType"))
    v4 = 2654435761 * self->_fileType;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[_INPBContact hash](self->_person, "hash");
  v7 = v5 ^ v6 ^ -[_INPBLong hash](self->_quantity, "hash");
  return v7 ^ -[_INPBString hash](self->_value, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBFilePropertyValue dateTime](self, "dateTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dateTime"));

  if (-[_INPBFilePropertyValue hasFileType](self, "hasFileType"))
  {
    v6 = -[_INPBFilePropertyValue fileType](self, "fileType");
    if (v6 >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E228B3F8[v6];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("fileType"));

  }
  -[_INPBFilePropertyValue person](self, "person");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("person"));

  -[_INPBFilePropertyValue quantity](self, "quantity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("quantity"));

  -[_INPBFilePropertyValue value](self, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("value"));

  return v3;
}

- (_INPBDateTimeRange)dateTime
{
  return self->_dateTime;
}

- (int)fileType
{
  return self->_fileType;
}

- (_INPBContact)person
{
  return self->_person;
}

- (_INPBLong)quantity
{
  return self->_quantity;
}

- (_INPBString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_quantity, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_dateTime, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
