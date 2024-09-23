@implementation CNLabelValuePair

- (CNLabelValuePair)initWithLabel:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  CNLabelValuePair *v9;
  CNLabelValuePair *v10;
  CNLabelValuePair *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNLabelValuePair;
  v9 = -[CNLabelValuePair init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_label, a3);
    objc_storeStrong(&v10->_value, a4);
    v11 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

+ (id)labeledValueWithLabel:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  CNLabelValuePair *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CNLabelValuePair initWithLabel:value:]([CNLabelValuePair alloc], "initWithLabel:value:", v6, v5);

  return v7;
}

- (id)value
{
  return objc_getProperty(self, a2, 16, 1);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isEqual:(id)a3
{
  NSString *label;
  int v6;
  unint64_t value;

  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      label = self->_label;
      if (!((unint64_t)label | *((_QWORD *)a3 + 1)) || (v6 = -[NSString isEqual:](label, "isEqual:")) != 0)
      {
        value = (unint64_t)self->_value;
        if (!(value | *((_QWORD *)a3 + 2)) || (v6 = objc_msgSend((id)value, "isEqual:")) != 0)
          LOBYTE(v6) = 1;
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendNamesAndObjects:", CFSTR("label"), self->_label, CFSTR("value"), self->_value, 0);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_label);
  return objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_value) - v3 + 32 * v3 + 16337;
}

@end
