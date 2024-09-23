@implementation AMSPair

- (id)second
{
  return self->_second;
}

- (id)first
{
  return self->_first;
}

- (AMSPair)initWithFirst:(id)a3 second:(id)a4
{
  id v7;
  id v8;
  AMSPair *v9;
  AMSPair *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSPair;
  v9 = -[AMSPair init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_first, a3);
    objc_storeStrong(&v10->_second, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_second, 0);
  objc_storeStrong(&self->_first, 0);
}

@end
