@implementation INAirline

- (INAirline)initWithName:(NSString *)name iataCode:(NSString *)iataCode icaoCode:(NSString *)icaoCode
{
  NSString *v8;
  NSString *v9;
  NSString *v10;
  INAirline *v11;
  uint64_t v12;
  NSString *v13;
  uint64_t v14;
  NSString *v15;
  uint64_t v16;
  NSString *v17;
  objc_super v19;

  v8 = name;
  v9 = iataCode;
  v10 = icaoCode;
  v19.receiver = self;
  v19.super_class = (Class)INAirline;
  v11 = -[INAirline init](&v19, sel_init);
  if (v11)
  {
    v12 = -[NSString copy](v8, "copy");
    v13 = v11->_name;
    v11->_name = (NSString *)v12;

    v14 = -[NSString copy](v9, "copy");
    v15 = v11->_iataCode;
    v11->_iataCode = (NSString *)v14;

    v16 = -[NSString copy](v10, "copy");
    v17 = v11->_icaoCode;
    v11->_icaoCode = (NSString *)v16;

  }
  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_iataCode, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_icaoCode, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INAirline *v4;
  INAirline *v5;
  NSString *name;
  NSString *iataCode;
  NSString *icaoCode;
  BOOL v9;

  v4 = (INAirline *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      name = self->_name;
      v9 = 0;
      if (name == v5->_name || -[NSString isEqual:](name, "isEqual:"))
      {
        iataCode = self->_iataCode;
        if (iataCode == v5->_iataCode || -[NSString isEqual:](iataCode, "isEqual:"))
        {
          icaoCode = self->_icaoCode;
          if (icaoCode == v5->_icaoCode || -[NSString isEqual:](icaoCode, "isEqual:"))
            v9 = 1;
        }
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (INAirline)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  INAirline *v17;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("iataCode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v15, CFSTR("icaoCode"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[INAirline initWithName:iataCode:icaoCode:](self, "initWithName:iataCode:icaoCode:", v8, v12, v16);
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iataCode, CFSTR("iataCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_icaoCode, CFSTR("icaoCode"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_name);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("name"));

  objc_msgSend(v6, "encodeObject:", self->_iataCode);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("iataCode"));

  objc_msgSend(v6, "encodeObject:", self->_icaoCode);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("icaoCode"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INAirline descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INAirline;
  -[INAirline description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAirline _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *name;
  void *v4;
  NSString *iataCode;
  void *v6;
  NSString *icaoCode;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("name");
  name = self->_name;
  v4 = name;
  if (!name)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("iataCode");
  iataCode = self->_iataCode;
  v6 = iataCode;
  if (!iataCode)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("icaoCode");
  icaoCode = self->_icaoCode;
  v8 = icaoCode;
  if (!icaoCode)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (icaoCode)
  {
    if (iataCode)
      goto LABEL_9;
LABEL_12:

    if (name)
      return v9;
LABEL_13:

    return v9;
  }

  if (!iataCode)
    goto LABEL_12;
LABEL_9:
  if (!name)
    goto LABEL_13;
  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)iataCode
{
  return self->_iataCode;
}

- (NSString)icaoCode
{
  return self->_icaoCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icaoCode, 0);
  objc_storeStrong((id *)&self->_iataCode, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("iataCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("icaoCode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:iataCode:icaoCode:", v7, v8, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
