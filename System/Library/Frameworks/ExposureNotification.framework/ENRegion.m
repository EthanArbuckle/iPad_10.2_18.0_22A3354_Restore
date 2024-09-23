@implementation ENRegion

- (ENRegion)initWithCountryCode:(id)a3
{
  return -[ENRegion initWithCountryCode:subdivisionCode:](self, "initWithCountryCode:subdivisionCode:", a3, 0);
}

+ (BOOL)validSubdivisionCode:(id)a3 forCountryCode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length") && objc_msgSend(v5, "containsString:", CFSTR("-")))
  {
    objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "rangeOfString:", CFSTR("-")));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithCountryCode:subdivisionCode:", self->_countryCode, self->_subdivisionCode);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[ENRegion isCountryCodeEqualToRegion:](self, "isCountryCodeEqualToRegion:", v5))
      v6 = -[ENRegion isSubdivisionCodeEqualToRegion:](self, "isSubdivisionCodeEqualToRegion:", v5);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isSubdivisionCodeEqualToRegion:(id)a3
{
  NSString *subdivisionCode;
  void *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  char v8;

  subdivisionCode = self->_subdivisionCode;
  objc_msgSend(a3, "subdivisionCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = subdivisionCode;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else if ((v5 == 0) == (v6 != 0))
  {
    v8 = 0;
  }
  else
  {
    v8 = -[NSString isEqual:](v5, "isEqual:", v6);
  }

  return v8;
}

- (NSString)subdivisionCode
{
  return self->_subdivisionCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subdivisionCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
}

- (BOOL)isCountryCodeEqualToRegion:(id)a3
{
  NSString *countryCode;
  void *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  char v8;

  countryCode = self->_countryCode;
  objc_msgSend(a3, "countryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = countryCode;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else if ((v5 == 0) == (v6 != 0))
  {
    v8 = 0;
  }
  else
  {
    v8 = -[NSString isEqual:](v5, "isEqual:", v6);
  }

  return v8;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (ENRegion)initWithCountryCode:(id)a3 subdivisionCode:(id)a4
{
  id v6;
  id v7;
  ENRegion *v8;
  uint64_t v9;
  NSString *countryCode;
  uint64_t v11;
  NSString *subdivisionCode;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ENRegion;
  v8 = -[ENRegion init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "uppercaseString");
    v9 = objc_claimAutoreleasedReturnValue();
    countryCode = v8->_countryCode;
    v8->_countryCode = (NSString *)v9;

    if (v7)
    {
      if (+[ENRegion validSubdivisionCode:forCountryCode:](ENRegion, "validSubdivisionCode:forCountryCode:", v7, v6))
      {
        objc_msgSend(v7, "uppercaseString");
        v11 = objc_claimAutoreleasedReturnValue();
        subdivisionCode = v8->_subdivisionCode;
        v8->_subdivisionCode = (NSString *)v11;

      }
      else if (gLogCategory_ENRegion <= 90 && (gLogCategory_ENRegion != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }

  return v8;
}

- (BOOL)validSubdivisionCode
{
  return +[ENRegion validSubdivisionCode:forCountryCode:](ENRegion, "validSubdivisionCode:forCountryCode:", self->_subdivisionCode, self->_countryCode);
}

+ (id)regionFromServerResponseDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  ENRegion *v6;
  ENRegion *v7;

  v3 = a3;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    v6 = -[ENRegion initWithCountryCode:]([ENRegion alloc], "initWithCountryCode:", v4);
    goto LABEL_5;
  }
  if (+[ENRegion validSubdivisionCode:forCountryCode:](ENRegion, "validSubdivisionCode:forCountryCode:", v5, v4))
  {
    v6 = -[ENRegion initWithCountryCode:subdivisionCode:]([ENRegion alloc], "initWithCountryCode:subdivisionCode:", v4, v5);
LABEL_5:
    v7 = v6;
    goto LABEL_6;
  }
  if (gLogCategory__ENRegionServerConfiguration <= 90
    && (gLogCategory__ENRegionServerConfiguration != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v7 = 0;
LABEL_6:

  return v7;
}

+ (ENRegion)regionWithCode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  ENRegion *v6;

  v3 = a3;
  if (objc_msgSend(v3, "containsString:", CFSTR("-")))
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("-"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ENRegion initWithCountryCode:subdivisionCode:]([ENRegion alloc], "initWithCountryCode:subdivisionCode:", v5, v3);

    v3 = v4;
  }
  else
  {
    v6 = -[ENRegion initWithCountryCode:]([ENRegion alloc], "initWithCountryCode:", v3);
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENRegion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ENRegion *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subdivisionCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ENRegion initWithCountryCode:subdivisionCode:](self, "initWithCountryCode:subdivisionCode:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *countryCode;
  id v5;

  countryCode = self->_countryCode;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", countryCode, CFSTR("countryCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subdivisionCode, CFSTR("subdivisionCode"));

}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_countryCode, "hash");
  return -[NSString hash](self->_subdivisionCode, "hash") ^ v3;
}

- (NSString)regionCode
{
  if (-[ENRegion validSubdivisionCode](self, "validSubdivisionCode"))
    -[ENRegion subdivisionCode](self, "subdivisionCode");
  else
    -[ENRegion countryCode](self, "countryCode");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

@end
