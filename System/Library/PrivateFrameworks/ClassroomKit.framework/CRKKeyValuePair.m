@implementation CRKKeyValuePair

- (CRKKeyValuePair)initWithKey:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  CRKKeyValuePair *v9;
  CRKKeyValuePair *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKKeyValuePair;
  v9 = -[CRKKeyValuePair init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_key, a3);
    objc_storeStrong(&v10->_value, a4);
  }

  return v10;
}

- (id)key
{
  return self->_key;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong(&self->_key, 0);
}

@end
