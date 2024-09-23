@implementation IKDataBindingEntry

- (IKDataBindingEntry)initWithKey:(id)a3 value:(id)a4 attributes:(unint64_t)a5
{
  id v8;
  id v9;
  IKDataBindingEntry *v10;
  uint64_t v11;
  NSString *key;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IKDataBindingEntry;
  v10 = -[IKDataBindingEntry init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    key = v10->_key;
    v10->_key = (NSString *)v11;

    objc_storeStrong((id *)&v10->_value, a4);
    v10->_attributes = a5;
  }

  return v10;
}

- (NSString)key
{
  return self->_key;
}

- (IKDataBindingValue)value
{
  return self->_value;
}

- (unint64_t)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
