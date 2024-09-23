@implementation CNMultiValueSingleUpdate

- (CNMultiValueSingleUpdate)initWithValue:(id)a3
{
  id v5;
  CNMultiValueSingleUpdate *v6;
  CNMultiValueSingleUpdate *v7;
  CNMultiValueSingleUpdate *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNMultiValueSingleUpdate;
  v6 = -[CNMultiValueSingleUpdate init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_value, a3);
    v8 = v7;
  }

  return v7;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendNamesAndObjects:", CFSTR("value"), self->_value, 0);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CNLabeledValue)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
