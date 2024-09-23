@implementation ULWeakProxy

- (ULWeakProxy)initWithObject:(id)a3
{
  id v4;
  ULWeakProxy *v5;
  ULWeakProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ULWeakProxy;
  v5 = -[ULWeakProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[ULWeakProxy setObject:](v5, "setObject:", v4);
    -[ULWeakProxy setClass:](v6, "setClass:", objc_opt_class());
  }

  return v6;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
}

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

- (void)setObject:(id)a3
{
  objc_storeWeak(&self->_object, a3);
}

- (Class)class
{
  return self->_class;
}

- (void)setClass:(Class)a3
{
  objc_storeStrong((id *)&self->_class, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_class, 0);
  objc_destroyWeak(&self->_object);
}

@end
