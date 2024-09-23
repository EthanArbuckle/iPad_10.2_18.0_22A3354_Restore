@implementation CTSupportedMaxDataRates

- (CTSupportedMaxDataRates)initWithRates:(id)a3
{
  id v5;
  CTSupportedMaxDataRates *v6;
  CTSupportedMaxDataRates *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTSupportedMaxDataRates;
  v6 = -[CTSupportedMaxDataRates init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rates, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTSupportedMaxDataRates rates](self, "rates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" rates=%@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTSupportedMaxDataRates rates](self, "rates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setRates:", v6);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_rates, CFSTR("rates"));
}

- (CTSupportedMaxDataRates)initWithCoder:(id)a3
{
  id v4;
  CTSupportedMaxDataRates *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *rates;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTSupportedMaxDataRates;
  v5 = -[CTSupportedMaxDataRates init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("rates"));
    v9 = objc_claimAutoreleasedReturnValue();
    rates = v5->_rates;
    v5->_rates = (NSArray *)v9;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)rates
{
  return self->_rates;
}

- (void)setRates:(id)a3
{
  objc_storeStrong((id *)&self->_rates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rates, 0);
}

@end
