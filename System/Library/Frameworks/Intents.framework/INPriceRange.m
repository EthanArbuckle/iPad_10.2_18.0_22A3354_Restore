@implementation INPriceRange

- (INPriceRange)initWithRangeBetweenPrice:(NSDecimalNumber *)firstPrice andPrice:(NSDecimalNumber *)secondPrice currencyCode:(NSString *)currencyCode
{
  NSDecimalNumber *v8;
  NSDecimalNumber *v9;
  NSString *v10;
  INPriceRange *v11;
  uint64_t v12;
  BOOL v13;
  NSDecimalNumber *v14;
  NSDecimalNumber *v15;
  uint64_t v16;
  NSDecimalNumber *minimumPrice;
  uint64_t v18;
  NSDecimalNumber *maximumPrice;
  uint64_t v20;
  NSString *v21;
  objc_super v23;

  v8 = firstPrice;
  v9 = secondPrice;
  v10 = currencyCode;
  v23.receiver = self;
  v23.super_class = (Class)INPriceRange;
  v11 = -[INPriceRange init](&v23, sel_init);
  if (v11)
  {
    v12 = -[NSDecimalNumber compare:](v8, "compare:", v9);
    v13 = v12 == -1;
    if (v12 == -1)
      v14 = v8;
    else
      v14 = v9;
    if (v13)
      v15 = v9;
    else
      v15 = v8;
    v16 = -[NSDecimalNumber copy](v14, "copy");
    minimumPrice = v11->_minimumPrice;
    v11->_minimumPrice = (NSDecimalNumber *)v16;

    v18 = -[NSDecimalNumber copy](v15, "copy");
    maximumPrice = v11->_maximumPrice;
    v11->_maximumPrice = (NSDecimalNumber *)v18;

    v20 = -[NSString copy](v10, "copy");
    v21 = v11->_currencyCode;
    v11->_currencyCode = (NSString *)v20;

  }
  return v11;
}

- (INPriceRange)initWithMaximumPrice:(NSDecimalNumber *)maximumPrice currencyCode:(NSString *)currencyCode
{
  NSDecimalNumber *v6;
  NSString *v7;
  INPriceRange *v8;
  uint64_t v9;
  NSDecimalNumber *v10;
  uint64_t v11;
  NSString *v12;
  objc_super v14;

  v6 = maximumPrice;
  v7 = currencyCode;
  v14.receiver = self;
  v14.super_class = (Class)INPriceRange;
  v8 = -[INPriceRange init](&v14, sel_init);
  if (v8)
  {
    v9 = -[NSDecimalNumber copy](v6, "copy");
    v10 = v8->_maximumPrice;
    v8->_maximumPrice = (NSDecimalNumber *)v9;

    v11 = -[NSString copy](v7, "copy");
    v12 = v8->_currencyCode;
    v8->_currencyCode = (NSString *)v11;

  }
  return v8;
}

- (INPriceRange)initWithMinimumPrice:(NSDecimalNumber *)minimumPrice currencyCode:(NSString *)currencyCode
{
  NSDecimalNumber *v6;
  NSString *v7;
  INPriceRange *v8;
  uint64_t v9;
  NSDecimalNumber *v10;
  uint64_t v11;
  NSString *v12;
  objc_super v14;

  v6 = minimumPrice;
  v7 = currencyCode;
  v14.receiver = self;
  v14.super_class = (Class)INPriceRange;
  v8 = -[INPriceRange init](&v14, sel_init);
  if (v8)
  {
    v9 = -[NSDecimalNumber copy](v6, "copy");
    v10 = v8->_minimumPrice;
    v8->_minimumPrice = (NSDecimalNumber *)v9;

    v11 = -[NSString copy](v7, "copy");
    v12 = v8->_currencyCode;
    v8->_currencyCode = (NSString *)v11;

  }
  return v8;
}

- (INPriceRange)initWithPrice:(NSDecimalNumber *)price currencyCode:(NSString *)currencyCode
{
  return -[INPriceRange initWithRangeBetweenPrice:andPrice:currencyCode:](self, "initWithRangeBetweenPrice:andPrice:currencyCode:", price, price, currencyCode);
}

- (INPriceRange)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  INPriceRange *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstPrice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondPrice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[INPriceRange initWithRangeBetweenPrice:andPrice:currencyCode:](self, "initWithRangeBetweenPrice:andPrice:currencyCode:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[INPriceRange minimumPrice](self, "minimumPrice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("firstPrice"));

  -[INPriceRange maximumPrice](self, "maximumPrice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("secondPrice"));

  -[INPriceRange currencyCode](self, "currencyCode");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("currencyCode"));

}

- (id)_formattedStringWithLocale:(id)a3 componentsFormatString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  int v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setLocale:", v7);

  -[INPriceRange currencyCode](self, "currencyCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCurrencyCode:", v9);

  -[INPriceRange minimumPrice](self, "minimumPrice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "stringFromNumber:", v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_1E2295770;
  }
  -[INPriceRange minimumPrice](self, "minimumPrice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[INPriceRange maximumPrice](self, "maximumPrice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if (v14)
  {
    v15 = v11;
  }
  else
  {
    v16 = &stru_1E2295770;
    objc_msgSend(v8, "setCurrencySymbol:", &stru_1E2295770);
    objc_msgSend(v8, "setInternationalCurrencySymbol:", &stru_1E2295770);
    -[INPriceRange maximumPrice](self, "maximumPrice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v8, "stringFromNumber:", v17);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v6, v11, v16);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSDecimalNumber hash](self->_minimumPrice, "hash");
  v4 = -[NSDecimalNumber hash](self->_maximumPrice, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_currencyCode, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  INPriceRange *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (INPriceRange *)v4;
    if (self == v5)
    {
      v12 = 1;
    }
    else
    {
      -[INPriceRange minimumPrice](self, "minimumPrice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[INPriceRange minimumPrice](v5, "minimumPrice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[INPriceRange maximumPrice](self, "maximumPrice");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[INPriceRange maximumPrice](v5, "maximumPrice");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqual:", v9))
        {
          -[INPriceRange currencyCode](self, "currencyCode");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[INPriceRange currencyCode](v5, "currencyCode");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqualToString:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)description
{
  return (NSString *)-[INPriceRange descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INPriceRange;
  -[INPriceRange description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INPriceRange _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSDecimalNumber *minimumPrice;
  void *v4;
  NSDecimalNumber *maximumPrice;
  void *v6;
  NSString *currencyCode;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("minimumPrice");
  minimumPrice = self->_minimumPrice;
  v4 = minimumPrice;
  if (!minimumPrice)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("maximumPrice");
  maximumPrice = self->_maximumPrice;
  v6 = maximumPrice;
  if (!maximumPrice)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("currencyCode");
  currencyCode = self->_currencyCode;
  v8 = currencyCode;
  if (!currencyCode)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (currencyCode)
  {
    if (maximumPrice)
      goto LABEL_9;
LABEL_12:

    if (minimumPrice)
      return v9;
LABEL_13:

    return v9;
  }

  if (!maximumPrice)
    goto LABEL_12;
LABEL_9:
  if (!minimumPrice)
    goto LABEL_13;
  return v9;
}

- (NSDecimalNumber)minimumPrice
{
  return self->_minimumPrice;
}

- (NSDecimalNumber)maximumPrice
{
  return self->_maximumPrice;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_maximumPrice, 0);
  objc_storeStrong((id *)&self->_minimumPrice, 0);
}

+ (id)_priceWithPriceRangeValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "minimumPrice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDecimalNumberValue(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "maximumPrice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDecimalNumberValue(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "currencyCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v8)
  {
    v10 = objc_msgSend(objc_alloc((Class)a1), "initWithRangeBetweenPrice:andPrice:currencyCode:", v6, v8, v9);
  }
  else if (v6)
  {
    v10 = objc_msgSend(objc_alloc((Class)a1), "initWithMinimumPrice:currencyCode:", v6, v9);
  }
  else
  {
    if (!v8)
    {
      v11 = 0;
      goto LABEL_9;
    }
    v10 = objc_msgSend(objc_alloc((Class)a1), "initWithMaximumPrice:currencyCode:", v8, v9);
  }
  v11 = (void *)v10;
LABEL_9:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
