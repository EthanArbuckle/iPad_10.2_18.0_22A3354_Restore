@implementation CHSArrayBox

+ (id)boxedValue:(id)a3
{
  id v3;
  CHSArrayBox *v4;

  v3 = a3;
  v4 = -[CHSArrayBox initWithValue:]([CHSArrayBox alloc], "initWithValue:", v3);

  return v4;
}

- (CHSArrayBox)initWithValue:(id)a3
{
  id v5;
  CHSArrayBox *v6;
  CHSArrayBox *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSArrayBox;
  v6 = -[CHSArrayBox init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_value, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_value, CFSTR("arrayKey"));
}

- (CHSArrayBox)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CHSArrayBox *v7;

  v4 = a3;
  __plistableTypes();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("arrayKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CHSArrayBox initWithValue:](self, "initWithValue:", v6);
  return v7;
}

- (NSArray)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
