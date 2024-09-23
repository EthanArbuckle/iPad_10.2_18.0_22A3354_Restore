@implementation _INPBRentalCar

- (void)setMake:(id)a3
{
  NSString *v4;
  NSString *make;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  make = self->_make;
  self->_make = v4;

}

- (BOOL)hasMake
{
  return self->_make != 0;
}

- (void)setModel:(id)a3
{
  NSString *v4;
  NSString *model;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  model = self->_model;
  self->_model = v4;

}

- (BOOL)hasModel
{
  return self->_model != 0;
}

- (void)setRentalCarDescription:(id)a3
{
  NSString *v4;
  NSString *rentalCarDescription;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  rentalCarDescription = self->_rentalCarDescription;
  self->_rentalCarDescription = v4;

}

- (BOOL)hasRentalCarDescription
{
  return self->_rentalCarDescription != 0;
}

- (void)setRentalCompanyName:(id)a3
{
  NSString *v4;
  NSString *rentalCompanyName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  rentalCompanyName = self->_rentalCompanyName;
  self->_rentalCompanyName = v4;

}

- (BOOL)hasRentalCompanyName
{
  return self->_rentalCompanyName != 0;
}

- (void)setType:(id)a3
{
  NSString *v4;
  NSString *type;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  type = self->_type;
  self->_type = v4;

}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRentalCarReadFrom(self, (uint64_t)a3);
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
  -[_INPBRentalCar make](self, "make");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBRentalCar model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_INPBRentalCar rentalCarDescription](self, "rentalCarDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[_INPBRentalCar rentalCompanyName](self, "rentalCompanyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[_INPBRentalCar type](self, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v8)
  {
    PBDataWriterWriteStringField();
    v9 = v10;
  }

}

- (_INPBRentalCar)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBRentalCar *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBRentalCar *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBRentalCar *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBRentalCar initWithData:](self, "initWithData:", v6);

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
  -[_INPBRentalCar data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBRentalCar *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = -[_INPBRentalCar init](+[_INPBRentalCar allocWithZone:](_INPBRentalCar, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_make, "copyWithZone:", a3);
  -[_INPBRentalCar setMake:](v5, "setMake:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_model, "copyWithZone:", a3);
  -[_INPBRentalCar setModel:](v5, "setModel:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_rentalCarDescription, "copyWithZone:", a3);
  -[_INPBRentalCar setRentalCarDescription:](v5, "setRentalCarDescription:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_rentalCompanyName, "copyWithZone:", a3);
  -[_INPBRentalCar setRentalCompanyName:](v5, "setRentalCompanyName:", v9);

  v10 = (void *)-[NSString copyWithZone:](self->_type, "copyWithZone:", a3);
  -[_INPBRentalCar setType:](v5, "setType:", v10);

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
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[_INPBRentalCar make](self, "make");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "make");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBRentalCar make](self, "make");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBRentalCar make](self, "make");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "make");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBRentalCar model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBRentalCar model](self, "model");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBRentalCar model](self, "model");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "model");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBRentalCar rentalCarDescription](self, "rentalCarDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rentalCarDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBRentalCar rentalCarDescription](self, "rentalCarDescription");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBRentalCar rentalCarDescription](self, "rentalCarDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rentalCarDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBRentalCar rentalCompanyName](self, "rentalCompanyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rentalCompanyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBRentalCar rentalCompanyName](self, "rentalCompanyName");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBRentalCar rentalCompanyName](self, "rentalCompanyName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rentalCompanyName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBRentalCar type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBRentalCar type](self, "type");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[_INPBRentalCar type](self, "type");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_30;
  }
  else
  {
LABEL_26:

  }
LABEL_27:
  v32 = 0;
LABEL_28:

  return v32;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_make, "hash");
  v4 = -[NSString hash](self->_model, "hash") ^ v3;
  v5 = -[NSString hash](self->_rentalCarDescription, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_rentalCompanyName, "hash");
  return v6 ^ -[NSString hash](self->_type, "hash");
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_make)
  {
    -[_INPBRentalCar make](self, "make");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("make"));

  }
  if (self->_model)
  {
    -[_INPBRentalCar model](self, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("model"));

  }
  if (self->_rentalCarDescription)
  {
    -[_INPBRentalCar rentalCarDescription](self, "rentalCarDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("rentalCarDescription"));

  }
  if (self->_rentalCompanyName)
  {
    -[_INPBRentalCar rentalCompanyName](self, "rentalCompanyName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("rentalCompanyName"));

  }
  if (self->_type)
  {
    -[_INPBRentalCar type](self, "type");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("type"));

  }
  return v3;
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

- (NSString)rentalCompanyName
{
  return self->_rentalCompanyName;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_rentalCompanyName, 0);
  objc_storeStrong((id *)&self->_rentalCarDescription, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_make, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
