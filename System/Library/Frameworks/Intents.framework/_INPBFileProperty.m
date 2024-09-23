@implementation _INPBFileProperty

- (void)setName:(int)a3
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
    self->_name = a3;
  }
}

- (BOOL)hasName
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasName:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)nameAsString:(int)a3
{
  if (a3 < 0xC)
    return off_1E228C078[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsName:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIZE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTENTS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTHOR")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CREATION_TIME")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCESSED_TIME")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODIFIED_TIME")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRINTED_TIME")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SENDER")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECIPIENT")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAGE_COUNT")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAG")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FILE_TYPE")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setQualifier:(int)a3
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
    self->_qualifier = a3;
  }
}

- (BOOL)hasQualifier
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasQualifier:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)qualifierAsString:(int)a3
{
  if (a3 < 5)
    return off_1E228C0D8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsQualifier:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EQUAL")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AT_LEAST")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AT_MOST")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MIN")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAX")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  return _INPBFilePropertyReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_INPBFileProperty hasName](self, "hasName"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBFileProperty hasQualifier](self, "hasQualifier"))
    PBDataWriterWriteInt32Field();
  -[_INPBFileProperty value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    -[_INPBFileProperty value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }

}

- (_INPBFileProperty)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBFileProperty *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBFileProperty *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBFileProperty *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBFileProperty initWithData:](self, "initWithData:", v6);

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
  -[_INPBFileProperty data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBFileProperty *v5;
  id v6;

  v5 = -[_INPBFileProperty init](+[_INPBFileProperty allocWithZone:](_INPBFileProperty, "allocWithZone:"), "init");
  if (-[_INPBFileProperty hasName](self, "hasName"))
    -[_INPBFileProperty setName:](v5, "setName:", -[_INPBFileProperty name](self, "name"));
  if (-[_INPBFileProperty hasQualifier](self, "hasQualifier"))
    -[_INPBFileProperty setQualifier:](v5, "setQualifier:", -[_INPBFileProperty qualifier](self, "qualifier"));
  v6 = -[_INPBFilePropertyValue copyWithZone:](self->_value, "copyWithZone:", a3);
  -[_INPBFileProperty setValue:](v5, "setValue:", v6);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int name;
  int v7;
  int qualifier;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBFileProperty hasName](self, "hasName");
    if (v5 == objc_msgSend(v4, "hasName"))
    {
      if (!-[_INPBFileProperty hasName](self, "hasName")
        || !objc_msgSend(v4, "hasName")
        || (name = self->_name, name == objc_msgSend(v4, "name")))
      {
        v7 = -[_INPBFileProperty hasQualifier](self, "hasQualifier");
        if (v7 == objc_msgSend(v4, "hasQualifier"))
        {
          if (!-[_INPBFileProperty hasQualifier](self, "hasQualifier")
            || !objc_msgSend(v4, "hasQualifier")
            || (qualifier = self->_qualifier, qualifier == objc_msgSend(v4, "qualifier")))
          {
            -[_INPBFileProperty value](self, "value");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "value");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v10;
            if ((v9 == 0) != (v10 != 0))
            {
              -[_INPBFileProperty value](self, "value");
              v12 = objc_claimAutoreleasedReturnValue();
              if (!v12)
              {

LABEL_18:
                v17 = 1;
                goto LABEL_16;
              }
              v13 = (void *)v12;
              -[_INPBFileProperty value](self, "value");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "value");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v14, "isEqual:", v15);

              if ((v16 & 1) != 0)
                goto LABEL_18;
            }
            else
            {

            }
          }
        }
      }
    }
  }
  v17 = 0;
LABEL_16:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  if (-[_INPBFileProperty hasName](self, "hasName"))
    v3 = 2654435761 * self->_name;
  else
    v3 = 0;
  if (-[_INPBFileProperty hasQualifier](self, "hasQualifier"))
    v4 = 2654435761 * self->_qualifier;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[_INPBFilePropertyValue hash](self->_value, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBFileProperty hasName](self, "hasName"))
  {
    v4 = -[_INPBFileProperty name](self, "name");
    if (v4 >= 0xC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E228C078[v4];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("name"));

  }
  if (-[_INPBFileProperty hasQualifier](self, "hasQualifier"))
  {
    v6 = -[_INPBFileProperty qualifier](self, "qualifier");
    if (v6 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E228C0D8[v6];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("qualifier"));

  }
  -[_INPBFileProperty value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("value"));

  return v3;
}

- (int)name
{
  return self->_name;
}

- (int)qualifier
{
  return self->_qualifier;
}

- (_INPBFilePropertyValue)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
