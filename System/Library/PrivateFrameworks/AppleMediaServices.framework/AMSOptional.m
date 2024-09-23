@implementation AMSOptional

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

- (AMSOptional)initWithValue:(id)a3
{
  id v5;
  AMSOptional *v6;
  AMSOptional *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSOptional;
  v6 = -[AMSOptional init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_value, a3);

  return v7;
}

- (id)value
{
  return self->_value;
}

+ (id)optionalWithValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:", v4);

  return v5;
}

+ (id)optionalWithNil
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithValue:", 0);
}

- (AMSOptional)init
{
  return -[AMSOptional initWithValue:](self, "initWithValue:", 0);
}

@end
