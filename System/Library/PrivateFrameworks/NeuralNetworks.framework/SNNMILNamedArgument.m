@implementation SNNMILNamedArgument

- (SNNMILNamedArgument)initWithKey:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  SNNMILNamedArgument *v9;
  SNNMILNamedArgument *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SNNMILNamedArgument;
  v9 = -[SNNMILNamedArgument init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_value, a4);
  }

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (SNNMILValue)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
