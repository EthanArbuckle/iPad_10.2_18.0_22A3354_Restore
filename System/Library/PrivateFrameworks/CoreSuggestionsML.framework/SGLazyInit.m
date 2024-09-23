@implementation SGLazyInit

- (SGLazyInit)initWithInitializer:(id)a3 destructor:(id)a4
{
  id v6;
  id v7;
  SGLazyInit *v8;
  uint64_t v9;
  id initializer;
  uint64_t v11;
  id destructor;
  SGLazyInit *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v15.receiver = self;
    v15.super_class = (Class)SGLazyInit;
    v8 = -[SGLazyInit init](&v15, sel_init);
    if (v8)
    {
      v9 = MEMORY[0x22075400C](v6);
      initializer = v8->_initializer;
      v8->_initializer = (id)v9;

      v11 = MEMORY[0x22075400C](v7);
      destructor = v8->_destructor;
      v8->_destructor = (id)v11;

    }
    self = v8;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)getObject
{
  id cachedObject;
  void *v4;
  id v5;

  cachedObject = self->_cachedObject;
  if (!cachedObject)
  {
    (*((void (**)(void))self->_initializer + 2))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cachedObject;
    self->_cachedObject = v4;

    cachedObject = self->_cachedObject;
  }
  return cachedObject;
}

- (id)peekAtCachedObject
{
  return self->_cachedObject;
}

- (void)destroyCachedObject
{
  void (**destructor)(void);
  id cachedObject;

  destructor = (void (**)(void))self->_destructor;
  if (destructor && self->_cachedObject)
    destructor[2]();
  cachedObject = self->_cachedObject;
  self->_cachedObject = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[SGLazyInit destroyCachedObject](self, "destroyCachedObject");
  v3.receiver = self;
  v3.super_class = (Class)SGLazyInit;
  -[SGLazyInit dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cachedObject, 0);
  objc_storeStrong(&self->_destructor, 0);
  objc_storeStrong(&self->_initializer, 0);
}

@end
