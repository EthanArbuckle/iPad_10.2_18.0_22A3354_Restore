@implementation HKSignedClinicalDataParsingResult

- (HKSignedClinicalDataParsingResult)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKSignedClinicalDataParsingResult)initWithItems:(id)a3 options:(unint64_t)a4
{
  id v6;
  HKSignedClinicalDataParsingResult *v7;
  uint64_t v8;
  NSArray *items;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKSignedClinicalDataParsingResult;
  v7 = -[HKSignedClinicalDataParsingResult init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    items = v7->_items;
    v7->_items = (NSArray *)v8;

    v7->_options = a4;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *items;
  id v5;

  items = self->_items;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", items, CFSTR("Items"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_options, CFSTR("Options"));

}

- (HKSignedClinicalDataParsingResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HKSignedClinicalDataParsingResult *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("Items"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_msgSend(v4, "containsValueForKey:", CFSTR("Options")) & 1) != 0)
  {
    self = -[HKSignedClinicalDataParsingResult initWithItems:options:](self, "initWithItems:options:", v6, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Options")));
    v7 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v7 = 0;
  }

  return v7;
}

- (id)copyWithItems:(id)a3
{
  id v4;
  HKSignedClinicalDataParsingResult *v5;

  v4 = a3;
  v5 = -[HKSignedClinicalDataParsingResult initWithItems:options:]([HKSignedClinicalDataParsingResult alloc], "initWithItems:options:", v4, self->_options);

  return v5;
}

- (unint64_t)hash
{
  return self->_options ^ -[NSArray hash](self->_items, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKSignedClinicalDataParsingResult *v4;
  HKSignedClinicalDataParsingResult *v5;
  HKSignedClinicalDataParsingResult *v6;
  NSArray *items;
  NSArray *v8;
  void *v9;
  NSArray *v10;
  void *v11;
  unint64_t v12;
  BOOL v13;
  unint64_t options;

  v4 = (HKSignedClinicalDataParsingResult *)a3;
  v5 = v4;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      items = self->_items;
      -[HKSignedClinicalDataParsingResult items](v6, "items");
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (items == v8)
      {
        options = self->_options;
        v13 = options == -[HKSignedClinicalDataParsingResult options](v6, "options");
      }
      else
      {
        -[HKSignedClinicalDataParsingResult items](v6, "items");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = self->_items;
          -[HKSignedClinicalDataParsingResult items](v6, "items");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSArray isEqualToArray:](v10, "isEqualToArray:", v11))
          {
            v12 = self->_options;
            v13 = v12 == -[HKSignedClinicalDataParsingResult options](v6, "options");
          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (NSArray)items
{
  return self->_items;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
