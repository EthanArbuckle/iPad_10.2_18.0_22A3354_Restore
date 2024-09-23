@implementation _INPBAirline

- (void)setIataCode:(id)a3
{
  NSString *v4;
  NSString *iataCode;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  iataCode = self->_iataCode;
  self->_iataCode = v4;

}

- (BOOL)hasIataCode
{
  return self->_iataCode != 0;
}

- (void)setIcaoCode:(id)a3
{
  NSString *v4;
  NSString *icaoCode;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  icaoCode = self->_icaoCode;
  self->_icaoCode = v4;

}

- (BOOL)hasIcaoCode
{
  return self->_icaoCode != 0;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  name = self->_name;
  self->_name = v4;

}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAirlineReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_INPBAirline iataCode](self, "iataCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBAirline icaoCode](self, "icaoCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_INPBAirline name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    v7 = v8;
  }

}

- (_INPBAirline)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBAirline *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBAirline *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBAirline *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBAirline initWithData:](self, "initWithData:", v6);

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
  -[_INPBAirline data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBAirline *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = -[_INPBAirline init](+[_INPBAirline allocWithZone:](_INPBAirline, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_iataCode, "copyWithZone:", a3);
  -[_INPBAirline setIataCode:](v5, "setIataCode:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_icaoCode, "copyWithZone:", a3);
  -[_INPBAirline setIcaoCode:](v5, "setIcaoCode:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  -[_INPBAirline setName:](v5, "setName:", v8);

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
  -[_INPBAirline iataCode](self, "iataCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iataCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBAirline iataCode](self, "iataCode");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBAirline iataCode](self, "iataCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iataCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBAirline icaoCode](self, "icaoCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "icaoCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBAirline icaoCode](self, "icaoCode");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBAirline icaoCode](self, "icaoCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "icaoCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBAirline name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBAirline name](self, "name");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBAirline name](self, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
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
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_iataCode, "hash");
  v4 = -[NSString hash](self->_icaoCode, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_name, "hash");
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
  if (self->_iataCode)
  {
    -[_INPBAirline iataCode](self, "iataCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("iataCode"));

  }
  if (self->_icaoCode)
  {
    -[_INPBAirline icaoCode](self, "icaoCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("icaoCode"));

  }
  if (self->_name)
  {
    -[_INPBAirline name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("name"));

  }
  return v3;
}

- (NSString)iataCode
{
  return self->_iataCode;
}

- (NSString)icaoCode
{
  return self->_icaoCode;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_icaoCode, 0);
  objc_storeStrong((id *)&self->_iataCode, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
