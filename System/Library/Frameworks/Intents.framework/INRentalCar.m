@implementation INRentalCar

- (INRentalCar)initWithRentalCompanyName:(NSString *)rentalCompanyName type:(NSString *)type make:(NSString *)make model:(NSString *)model rentalCarDescription:(NSString *)rentalCarDescription
{
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  INRentalCar *v17;
  uint64_t v18;
  NSString *v19;
  uint64_t v20;
  NSString *v21;
  uint64_t v22;
  NSString *v23;
  uint64_t v24;
  NSString *v25;
  uint64_t v26;
  NSString *v27;
  objc_super v29;

  v12 = rentalCompanyName;
  v13 = type;
  v14 = make;
  v15 = model;
  v16 = rentalCarDescription;
  v29.receiver = self;
  v29.super_class = (Class)INRentalCar;
  v17 = -[INRentalCar init](&v29, sel_init);
  if (v17)
  {
    v18 = -[NSString copy](v12, "copy");
    v19 = v17->_rentalCompanyName;
    v17->_rentalCompanyName = (NSString *)v18;

    v20 = -[NSString copy](v13, "copy");
    v21 = v17->_type;
    v17->_type = (NSString *)v20;

    v22 = -[NSString copy](v14, "copy");
    v23 = v17->_make;
    v17->_make = (NSString *)v22;

    v24 = -[NSString copy](v15, "copy");
    v25 = v17->_model;
    v17->_model = (NSString *)v24;

    v26 = -[NSString copy](v16, "copy");
    v27 = v17->_rentalCarDescription;
    v17->_rentalCarDescription = (NSString *)v26;

  }
  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_rentalCompanyName, "hash");
  v4 = -[NSString hash](self->_type, "hash") ^ v3;
  v5 = -[NSString hash](self->_make, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_model, "hash");
  return v6 ^ -[NSString hash](self->_rentalCarDescription, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INRentalCar *v4;
  INRentalCar *v5;
  NSString *rentalCompanyName;
  NSString *type;
  NSString *make;
  NSString *model;
  NSString *rentalCarDescription;
  BOOL v11;

  v4 = (INRentalCar *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      rentalCompanyName = self->_rentalCompanyName;
      v11 = 0;
      if (rentalCompanyName == v5->_rentalCompanyName
        || -[NSString isEqual:](rentalCompanyName, "isEqual:"))
      {
        type = self->_type;
        if (type == v5->_type || -[NSString isEqual:](type, "isEqual:"))
        {
          make = self->_make;
          if (make == v5->_make || -[NSString isEqual:](make, "isEqual:"))
          {
            model = self->_model;
            if (model == v5->_model || -[NSString isEqual:](model, "isEqual:"))
            {
              rentalCarDescription = self->_rentalCarDescription;
              if (rentalCarDescription == v5->_rentalCarDescription
                || -[NSString isEqual:](rentalCarDescription, "isEqual:"))
              {
                v11 = 1;
              }
            }
          }
        }
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (INRentalCar)initWithCoder:(id)a3
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
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  INRentalCar *v25;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("rentalCompanyName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v15, CFSTR("make"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v19, CFSTR("model"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v23, CFSTR("rentalCarDescription"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[INRentalCar initWithRentalCompanyName:type:make:model:rentalCarDescription:](self, "initWithRentalCompanyName:type:make:model:rentalCarDescription:", v8, v12, v16, v20, v24);
  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *rentalCompanyName;
  id v5;

  rentalCompanyName = self->_rentalCompanyName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", rentalCompanyName, CFSTR("rentalCompanyName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_make, CFSTR("make"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_model, CFSTR("model"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rentalCarDescription, CFSTR("rentalCarDescription"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_rentalCompanyName);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("rentalCompanyName"));

  objc_msgSend(v6, "encodeObject:", self->_type);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("type"));

  objc_msgSend(v6, "encodeObject:", self->_make);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("make"));

  objc_msgSend(v6, "encodeObject:", self->_model);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("model"));

  objc_msgSend(v6, "encodeObject:", self->_rentalCarDescription);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("rentalCarDescription"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INRentalCar descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INRentalCar;
  -[INRentalCar description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRentalCar _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *rentalCompanyName;
  uint64_t v4;
  NSString *type;
  void *v6;
  NSString *make;
  void *v8;
  NSString *model;
  void *v10;
  NSString *rentalCarDescription;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v17 = CFSTR("rentalCompanyName");
  rentalCompanyName = self->_rentalCompanyName;
  v4 = (uint64_t)rentalCompanyName;
  if (!rentalCompanyName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v15 = v4;
  v22[0] = v4;
  v18 = CFSTR("type");
  type = self->_type;
  v6 = type;
  if (!type)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v4, v17, v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v6;
  v19 = CFSTR("make");
  make = self->_make;
  v8 = make;
  if (!make)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v8;
  v20 = CFSTR("model");
  model = self->_model;
  v10 = model;
  if (!model)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v10;
  v21 = CFSTR("rentalCarDescription");
  rentalCarDescription = self->_rentalCarDescription;
  v12 = rentalCarDescription;
  if (!rentalCarDescription)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (rentalCarDescription)
  {
    if (model)
      goto LABEL_13;
  }
  else
  {

    if (model)
    {
LABEL_13:
      if (make)
        goto LABEL_14;
      goto LABEL_19;
    }
  }

  if (make)
  {
LABEL_14:
    if (type)
      goto LABEL_15;
LABEL_20:

    if (rentalCompanyName)
      return v13;
LABEL_21:

    return v13;
  }
LABEL_19:

  if (!type)
    goto LABEL_20;
LABEL_15:
  if (!rentalCompanyName)
    goto LABEL_21;
  return v13;
}

- (NSString)rentalCompanyName
{
  return self->_rentalCompanyName;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)make
{
  return self->_make;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)rentalCarDescription
{
  return self->_rentalCarDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rentalCarDescription, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_make, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_rentalCompanyName, 0);
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
  void *v11;
  void *v12;

  v6 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rentalCompanyName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("make"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("model"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rentalCarDescription"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRentalCompanyName:type:make:model:rentalCarDescription:", v7, v8, v9, v10, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
