@implementation AXMDataPointValue

+ (id)valueWithNumber:(double)a3
{
  AXMDataPointValue *v4;

  v4 = objc_alloc_init(AXMDataPointValue);
  -[AXMDataPointValue setNumber:](v4, "setNumber:", a3);
  return v4;
}

+ (id)valueWithCategory:(id)a3
{
  id v3;
  AXMDataPointValue *v4;

  v3 = a3;
  v4 = objc_alloc_init(AXMDataPointValue);
  -[AXMDataPointValue setCategory:](v4, "setCategory:", v3);

  return v4;
}

+ (id)emptyValue
{
  AXMDataPointValue *v2;

  v2 = objc_alloc_init(AXMDataPointValue);
  -[AXMDataPointValue setIsEmptyValue:](v2, "setIsEmptyValue:", 1);
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[AXMDataPointValue number](self, "number");
  objc_msgSend(v4, "setNumber:");
  -[AXMDataPointValue category](self, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCategory:", v6);

  objc_msgSend(v4, "setIsEmptyValue:", -[AXMDataPointValue isEmptyValue](self, "isEmptyValue"));
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[AXMDataPointValue category](self, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AXMDataPointValue category](self, "category");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[AXMDataPointValue number](self, "number");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ "), v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)setIsEmptyValue:(BOOL)a3
{
  self->_isEmptyValue = a3;
}

- (double)number
{
  return self->_number;
}

- (void)setNumber:(double)a3
{
  self->_number = a3;
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isEmptyValue
{
  return self->_isEmptyValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
}

@end
