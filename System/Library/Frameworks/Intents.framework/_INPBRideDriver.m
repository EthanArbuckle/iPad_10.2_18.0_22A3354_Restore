@implementation _INPBRideDriver

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (BOOL)hasImage
{
  return self->_image != 0;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (BOOL)hasPerson
{
  return self->_person != 0;
}

- (void)setPhoneNumber:(id)a3
{
  NSString *v4;
  NSString *phoneNumber;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  phoneNumber = self->_phoneNumber;
  self->_phoneNumber = v4;

}

- (BOOL)hasPhoneNumber
{
  return self->_phoneNumber != 0;
}

- (void)setRating:(id)a3
{
  NSString *v4;
  NSString *rating;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  rating = self->_rating;
  self->_rating = v4;

}

- (BOOL)hasRating
{
  return self->_rating != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRideDriverReadFrom(self, (uint64_t)a3);
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
  id v11;

  v11 = a3;
  -[_INPBRideDriver image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBRideDriver image](self, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRideDriver person](self, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBRideDriver person](self, "person");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRideDriver phoneNumber](self, "phoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  -[_INPBRideDriver rating](self, "rating");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  if (v9)
  {
    PBDataWriterWriteStringField();
    v10 = v11;
  }

}

- (_INPBRideDriver)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBRideDriver *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBRideDriver *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBRideDriver *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBRideDriver initWithData:](self, "initWithData:", v6);

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
  -[_INPBRideDriver data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBRideDriver *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = -[_INPBRideDriver init](+[_INPBRideDriver allocWithZone:](_INPBRideDriver, "allocWithZone:"), "init");
  v6 = -[_INPBImageValue copyWithZone:](self->_image, "copyWithZone:", a3);
  -[_INPBRideDriver setImage:](v5, "setImage:", v6);

  v7 = -[_INPBContactValue copyWithZone:](self->_person, "copyWithZone:", a3);
  -[_INPBRideDriver setPerson:](v5, "setPerson:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_phoneNumber, "copyWithZone:", a3);
  -[_INPBRideDriver setPhoneNumber:](v5, "setPhoneNumber:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_rating, "copyWithZone:", a3);
  -[_INPBRideDriver setRating:](v5, "setRating:", v9);

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
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[_INPBRideDriver image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBRideDriver image](self, "image");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBRideDriver image](self, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBRideDriver person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBRideDriver person](self, "person");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBRideDriver person](self, "person");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "person");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBRideDriver phoneNumber](self, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBRideDriver phoneNumber](self, "phoneNumber");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBRideDriver phoneNumber](self, "phoneNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneNumber");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBRideDriver rating](self, "rating");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rating");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBRideDriver rating](self, "rating");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[_INPBRideDriver rating](self, "rating");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rating");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;

  v3 = -[_INPBImageValue hash](self->_image, "hash");
  v4 = -[_INPBContactValue hash](self->_person, "hash") ^ v3;
  v5 = -[NSString hash](self->_phoneNumber, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_rating, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBRideDriver image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("image"));

  -[_INPBRideDriver person](self, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("person"));

  if (self->_phoneNumber)
  {
    -[_INPBRideDriver phoneNumber](self, "phoneNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("phoneNumber"));

  }
  if (self->_rating)
  {
    -[_INPBRideDriver rating](self, "rating");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("rating"));

  }
  return v3;
}

- (_INPBImageValue)image
{
  return self->_image;
}

- (_INPBContactValue)person
{
  return self->_person;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)rating
{
  return self->_rating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rating, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
