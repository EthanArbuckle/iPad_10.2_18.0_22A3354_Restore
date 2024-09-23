@implementation AXDataPointValue

+ (AXDataPointValue)valueWithNumber:(double)number
{
  AXDataPointValue *v4;

  v4 = objc_alloc_init(AXDataPointValue);
  -[AXDataPointValue setNumber:](v4, "setNumber:", number);
  return v4;
}

+ (AXDataPointValue)valueWithCategory:(NSString *)category
{
  NSString *v3;
  AXDataPointValue *v4;

  v3 = category;
  v4 = objc_alloc_init(AXDataPointValue);
  -[AXDataPointValue setCategory:](v4, "setCategory:", v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[AXDataPointValue number](self, "number");
  objc_msgSend(v4, "setNumber:");
  -[AXDataPointValue category](self, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCategory:", v6);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[AXDataPointValue category](self, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AXDataPointValue category](self, "category");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    v6 = (void *)MEMORY[0x24BDD16E0];
    -[AXDataPointValue number](self, "number");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (double)number
{
  return self->_number;
}

- (void)setNumber:(double)number
{
  self->_number = number;
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(NSString *)category
{
  objc_setProperty_nonatomic_copy(self, a2, category, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
}

@end
