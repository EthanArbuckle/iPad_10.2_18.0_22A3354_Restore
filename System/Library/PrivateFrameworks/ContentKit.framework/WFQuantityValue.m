@implementation WFQuantityValue

- (WFQuantityValue)initWithMagnitude:(id)a3 unitString:(id)a4
{
  id v8;
  id v9;
  WFQuantityValue *v10;
  WFQuantityValue *v11;
  uint64_t v12;
  NSString *unitString;
  WFQuantityValue *v14;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFQuantityValue.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("magnitude"));

  }
  v17.receiver = self;
  v17.super_class = (Class)WFQuantityValue;
  v10 = -[WFQuantityValue init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_magnitude, a3);
    v12 = objc_msgSend(v9, "copy");
    unitString = v11->_unitString;
    v11->_unitString = (NSString *)v12;

    v14 = v11;
  }

  return v11;
}

- (WFQuantityValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WFQuantityValue *v7;
  WFQuantityValue *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Magnitude"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Unit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[WFQuantityValue initWithMagnitude:unitString:](self, "initWithMagnitude:unitString:", v5, v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFQuantityValue magnitude](self, "magnitude");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Magnitude"));

  -[WFQuantityValue unitString](self, "unitString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("Unit"));

}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WFQuantityValue magnitude](self, "magnitude");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFQuantityValue unitString](self, "unitString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDecimalNumber)magnitude
{
  return self->_magnitude;
}

- (NSString)unitString
{
  return self->_unitString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitString, 0);
  objc_storeStrong((id *)&self->_magnitude, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
