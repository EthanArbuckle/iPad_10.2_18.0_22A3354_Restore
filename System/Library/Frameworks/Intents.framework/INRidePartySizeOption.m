@implementation INRidePartySizeOption

- (INRidePartySizeOption)initWithPartySizeRange:(NSRange)partySizeRange sizeDescription:(NSString *)sizeDescription priceRange:(INPriceRange *)priceRange
{
  NSUInteger length;
  NSUInteger location;
  NSString *v9;
  INPriceRange *v10;
  INRidePartySizeOption *v11;
  INRidePartySizeOption *v12;
  uint64_t v13;
  NSString *v14;
  uint64_t v15;
  INPriceRange *v16;
  objc_super v18;

  length = partySizeRange.length;
  location = partySizeRange.location;
  v9 = sizeDescription;
  v10 = priceRange;
  v18.receiver = self;
  v18.super_class = (Class)INRidePartySizeOption;
  v11 = -[INRidePartySizeOption init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_partySizeRange.location = location;
    v11->_partySizeRange.length = length;
    v13 = -[NSString copy](v9, "copy");
    v14 = v12->_sizeDescription;
    v12->_sizeDescription = (NSString *)v13;

    v15 = -[INPriceRange copy](v10, "copy");
    v16 = v12->_priceRange;
    v12->_priceRange = (INPriceRange *)v15;

  }
  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = self->_partySizeRange.location ^ self->_partySizeRange.length;
  v4 = v3 ^ -[NSString hash](self->_sizeDescription, "hash");
  return v4 ^ -[INPriceRange hash](self->_priceRange, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  NSString *sizeDescription;
  INPriceRange *priceRange;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = v5;
    v9 = 0;
    if (self->_partySizeRange.length == v5[4] && self->_partySizeRange.location == v5[3])
    {
      sizeDescription = self->_sizeDescription;
      if (sizeDescription == (NSString *)v6[1] || -[NSString isEqual:](sizeDescription, "isEqual:"))
      {
        priceRange = self->_priceRange;
        if (priceRange == (INPriceRange *)v6[2] || -[INPriceRange isEqual:](priceRange, "isEqual:"))
          v9 = 1;
      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (INRidePartySizeOption)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  INRidePartySizeOption *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partySizeRange"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeValue");
  v8 = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sizeDescription"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("priceRange"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[INRidePartySizeOption initWithPartySizeRange:sizeDescription:priceRange:](self, "initWithPartySizeRange:sizeDescription:priceRange:", v6, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB3B18];
  v5 = a3;
  v6 = -[INRidePartySizeOption partySizeRange](self, "partySizeRange");
  objc_msgSend(v4, "valueWithRange:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("partySizeRange"));

  -[INRidePartySizeOption sizeDescription](self, "sizeDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("sizeDescription"));

  -[INRidePartySizeOption priceRange](self, "priceRange");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("priceRange"));

}

- (NSString)description
{
  return (NSString *)-[INRidePartySizeOption descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INRidePartySizeOption;
  -[INRidePartySizeOption description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRidePartySizeOption _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sizeDescription;
  void *v6;
  INPriceRange *priceRange;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];
  NSRange v13;

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("partySizeRange");
  v13.location = -[INRidePartySizeOption partySizeRange](self, "partySizeRange");
  NSStringFromRange(v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("sizeDescription");
  sizeDescription = self->_sizeDescription;
  v6 = sizeDescription;
  if (!sizeDescription)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("priceRange");
  priceRange = self->_priceRange;
  v8 = priceRange;
  if (!priceRange)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (priceRange)
  {
    if (sizeDescription)
      goto LABEL_9;
LABEL_12:

    if (v3)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!sizeDescription)
    goto LABEL_12;
LABEL_9:
  if (!v3)
    goto LABEL_13;
LABEL_10:

  return v9;
}

- (NSRange)partySizeRange
{
  NSUInteger length;
  NSUInteger location;
  NSRange result;

  length = self->_partySizeRange.length;
  location = self->_partySizeRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSString)sizeDescription
{
  return self->_sizeDescription;
}

- (INPriceRange)priceRange
{
  return self->_priceRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priceRange, 0);
  objc_storeStrong((id *)&self->_sizeDescription, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
