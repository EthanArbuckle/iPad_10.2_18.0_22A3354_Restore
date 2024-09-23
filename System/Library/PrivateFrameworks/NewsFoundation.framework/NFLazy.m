@implementation NFLazy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->_constructor, 0);
  objc_storeStrong(&self->_value, 0);
}

- (void)reset
{
  void *v3;
  id value;
  id v5;

  -[NFLazy lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  value = self->_value;
  self->_value = 0;

  -[NFLazy lock](self, "lock");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

}

- (id)value
{
  void *v3;
  void (**v4)(void);
  void *v5;
  id value;
  void *v7;

  -[NFLazy lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  if (!self->_value)
  {
    -[NFLazy constructor](self, "constructor");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    value = self->_value;
    self->_value = v5;

  }
  -[NFLazy lock](self, "lock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  return self->_value;
}

- (NFUnfairLock)lock
{
  return self->_lock;
}

- (id)constructor
{
  return self->_constructor;
}

- (NFLazy)initWithConstructor:(id)a3
{
  id v4;
  NFLazy *v5;
  uint64_t v6;
  id constructor;
  NFUnfairLock *v8;
  NFUnfairLock *lock;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFLazy;
  v5 = -[NFLazy init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    constructor = v5->_constructor;
    v5->_constructor = (id)v6;

    v8 = -[NFUnfairLock initWithOptions:]([NFUnfairLock alloc], "initWithOptions:", 1);
    lock = v5->_lock;
    v5->_lock = v8;

  }
  return v5;
}

@end
