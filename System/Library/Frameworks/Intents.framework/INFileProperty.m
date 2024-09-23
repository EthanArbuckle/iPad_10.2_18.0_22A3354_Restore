@implementation INFileProperty

- (INFileProperty)initWithName:(id)a3 qualifier:(id)a4 type:(id)a5 dateComponentsRange:(id)a6 person:(id)a7 value:(id)a8 quantity:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  INFileProperty *v22;
  uint64_t v23;
  NSString *name;
  uint64_t v25;
  NSString *qualifier;
  uint64_t v27;
  NSString *type;
  uint64_t v29;
  INDateComponentsRange *dateComponentsRange;
  uint64_t v31;
  INPerson *person;
  uint64_t v33;
  NSString *value;
  uint64_t v35;
  NSNumber *quantity;
  objc_super v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)INFileProperty;
  v22 = -[INFileProperty init](&v38, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v15, "copy");
    name = v22->_name;
    v22->_name = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    qualifier = v22->_qualifier;
    v22->_qualifier = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    type = v22->_type;
    v22->_type = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    dateComponentsRange = v22->_dateComponentsRange;
    v22->_dateComponentsRange = (INDateComponentsRange *)v29;

    v31 = objc_msgSend(v19, "copy");
    person = v22->_person;
    v22->_person = (INPerson *)v31;

    v33 = objc_msgSend(v20, "copy");
    value = v22->_value;
    v22->_value = (NSString *)v33;

    v35 = objc_msgSend(v21, "copy");
    quantity = v22->_quantity;
    v22->_quantity = (NSNumber *)v35;

  }
  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_qualifier, "hash") ^ v3;
  v5 = -[NSString hash](self->_type, "hash");
  v6 = v4 ^ v5 ^ -[INDateComponentsRange hash](self->_dateComponentsRange, "hash");
  v7 = -[INPerson hash](self->_person, "hash");
  v8 = v7 ^ -[NSString hash](self->_value, "hash");
  return v6 ^ v8 ^ -[NSNumber hash](self->_quantity, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *name;
  NSString *qualifier;
  NSString *type;
  INDateComponentsRange *dateComponentsRange;
  INPerson *person;
  NSString *value;
  NSNumber *quantity;
  BOOL v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    name = self->_name;
    v13 = 0;
    if (name == (NSString *)v5[1] || -[NSString isEqual:](name, "isEqual:"))
    {
      qualifier = self->_qualifier;
      if (qualifier == (NSString *)v5[2] || -[NSString isEqual:](qualifier, "isEqual:"))
      {
        type = self->_type;
        if (type == (NSString *)v5[3] || -[NSString isEqual:](type, "isEqual:"))
        {
          dateComponentsRange = self->_dateComponentsRange;
          if (dateComponentsRange == (INDateComponentsRange *)v5[4]
            || -[INDateComponentsRange isEqual:](dateComponentsRange, "isEqual:"))
          {
            person = self->_person;
            if (person == (INPerson *)v5[5] || -[INPerson isEqual:](person, "isEqual:"))
            {
              value = self->_value;
              if (value == (NSString *)v5[6] || -[NSString isEqual:](value, "isEqual:"))
              {
                quantity = self->_quantity;
                if (quantity == (NSNumber *)v5[7] || -[NSNumber isEqual:](quantity, "isEqual:"))
                  v13 = 1;
              }
            }
          }
        }
      }
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_qualifier, CFSTR("qualifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateComponentsRange, CFSTR("dateComponentsRange"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_person, CFSTR("person"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("value"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_quantity, CFSTR("quantity"));

}

- (INFileProperty)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  INFileProperty *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("qualifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateComponentsRange"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("person"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("quantity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[INFileProperty initWithName:qualifier:type:dateComponentsRange:person:value:quantity:](self, "initWithName:qualifier:type:dateComponentsRange:person:value:quantity:", v5, v6, v7, v8, v9, v10, v11);
  return v12;
}

- (NSString)description
{
  return (NSString *)-[INFileProperty descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INFileProperty;
  -[INFileProperty description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFileProperty _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t name;
  NSString *qualifier;
  uint64_t v5;
  NSString *type;
  uint64_t v7;
  INDateComponentsRange *dateComponentsRange;
  uint64_t v9;
  INPerson *person;
  void *v11;
  NSString *value;
  void *v13;
  NSNumber *quantity;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[7];
  _QWORD v24[9];

  v24[7] = *MEMORY[0x1E0C80C00];
  name = (uint64_t)self->_name;
  v22 = name;
  v23[0] = CFSTR("name");
  if (!name)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    name = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)name;
  v24[0] = name;
  v23[1] = CFSTR("qualifier");
  qualifier = self->_qualifier;
  v5 = (uint64_t)qualifier;
  if (!qualifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v5;
  v24[1] = v5;
  v23[2] = CFSTR("type");
  type = self->_type;
  v7 = (uint64_t)type;
  if (!type)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v7;
  v24[2] = v7;
  v23[3] = CFSTR("dateComponentsRange");
  dateComponentsRange = self->_dateComponentsRange;
  v9 = (uint64_t)dateComponentsRange;
  if (!dateComponentsRange)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v9;
  v24[3] = v9;
  v23[4] = CFSTR("person");
  person = self->_person;
  v11 = person;
  if (!person)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[4] = v11;
  v23[5] = CFSTR("value");
  value = self->_value;
  v13 = value;
  if (!value)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[5] = v13;
  v23[6] = CFSTR("quantity");
  quantity = self->_quantity;
  v15 = quantity;
  if (!quantity)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[6] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (quantity)
  {
    if (value)
      goto LABEL_17;
  }
  else
  {

    if (value)
    {
LABEL_17:
      if (person)
        goto LABEL_18;
      goto LABEL_26;
    }
  }

  if (person)
  {
LABEL_18:
    if (dateComponentsRange)
      goto LABEL_19;
    goto LABEL_27;
  }
LABEL_26:

  if (dateComponentsRange)
  {
LABEL_19:
    if (type)
      goto LABEL_20;
LABEL_28:

    if (qualifier)
      goto LABEL_21;
    goto LABEL_29;
  }
LABEL_27:

  if (!type)
    goto LABEL_28;
LABEL_20:
  if (qualifier)
    goto LABEL_21;
LABEL_29:

LABEL_21:
  if (!v22)

  return v16;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)qualifier
{
  return self->_qualifier;
}

- (NSString)type
{
  return self->_type;
}

- (INDateComponentsRange)dateComponentsRange
{
  return self->_dateComponentsRange;
}

- (INPerson)person
{
  return self->_person;
}

- (NSString)value
{
  return self->_value;
}

- (NSNumber)quantity
{
  return self->_quantity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantity, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_dateComponentsRange, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_qualifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
