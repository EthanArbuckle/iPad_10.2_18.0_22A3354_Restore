@implementation _INPBRidePartySizeOption

- (void)setPartySizeRange:(id)a3
{
  objc_storeStrong((id *)&self->_partySizeRange, a3);
}

- (BOOL)hasPartySizeRange
{
  return self->_partySizeRange != 0;
}

- (void)setPriceRange:(id)a3
{
  objc_storeStrong((id *)&self->_priceRange, a3);
}

- (BOOL)hasPriceRange
{
  return self->_priceRange != 0;
}

- (void)setSizeDescription:(id)a3
{
  NSString *v4;
  NSString *sizeDescription;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  sizeDescription = self->_sizeDescription;
  self->_sizeDescription = v4;

}

- (BOOL)hasSizeDescription
{
  return self->_sizeDescription != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRidePartySizeOptionReadFrom(self, (uint64_t)a3);
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
  -[_INPBRidePartySizeOption partySizeRange](self, "partySizeRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBRidePartySizeOption partySizeRange](self, "partySizeRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRidePartySizeOption priceRange](self, "priceRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBRidePartySizeOption priceRange](self, "priceRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRidePartySizeOption sizeDescription](self, "sizeDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v8)
  {
    PBDataWriterWriteStringField();
    v9 = v10;
  }

}

- (_INPBRidePartySizeOption)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBRidePartySizeOption *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBRidePartySizeOption *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBRidePartySizeOption *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBRidePartySizeOption initWithData:](self, "initWithData:", v6);

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
  -[_INPBRidePartySizeOption data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBRidePartySizeOption *v5;
  id v6;
  id v7;
  void *v8;

  v5 = -[_INPBRidePartySizeOption init](+[_INPBRidePartySizeOption allocWithZone:](_INPBRidePartySizeOption, "allocWithZone:"), "init");
  v6 = -[_INPBRangeValue copyWithZone:](self->_partySizeRange, "copyWithZone:", a3);
  -[_INPBRidePartySizeOption setPartySizeRange:](v5, "setPartySizeRange:", v6);

  v7 = -[_INPBPriceRangeValue copyWithZone:](self->_priceRange, "copyWithZone:", a3);
  -[_INPBRidePartySizeOption setPriceRange:](v5, "setPriceRange:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_sizeDescription, "copyWithZone:", a3);
  -[_INPBRidePartySizeOption setSizeDescription:](v5, "setSizeDescription:", v8);

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
  -[_INPBRidePartySizeOption partySizeRange](self, "partySizeRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "partySizeRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBRidePartySizeOption partySizeRange](self, "partySizeRange");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBRidePartySizeOption partySizeRange](self, "partySizeRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "partySizeRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBRidePartySizeOption priceRange](self, "priceRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "priceRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBRidePartySizeOption priceRange](self, "priceRange");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBRidePartySizeOption priceRange](self, "priceRange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "priceRange");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBRidePartySizeOption sizeDescription](self, "sizeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBRidePartySizeOption sizeDescription](self, "sizeDescription");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBRidePartySizeOption sizeDescription](self, "sizeDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sizeDescription");
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

  v3 = -[_INPBRangeValue hash](self->_partySizeRange, "hash");
  v4 = -[_INPBPriceRangeValue hash](self->_priceRange, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_sizeDescription, "hash");
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
  -[_INPBRidePartySizeOption partySizeRange](self, "partySizeRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("partySizeRange"));

  -[_INPBRidePartySizeOption priceRange](self, "priceRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("priceRange"));

  if (self->_sizeDescription)
  {
    -[_INPBRidePartySizeOption sizeDescription](self, "sizeDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("sizeDescription"));

  }
  return v3;
}

- (_INPBRangeValue)partySizeRange
{
  return self->_partySizeRange;
}

- (_INPBPriceRangeValue)priceRange
{
  return self->_priceRange;
}

- (NSString)sizeDescription
{
  return self->_sizeDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeDescription, 0);
  objc_storeStrong((id *)&self->_priceRange, 0);
  objc_storeStrong((id *)&self->_partySizeRange, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
