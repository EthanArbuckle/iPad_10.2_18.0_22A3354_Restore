@implementation ASCLazy

- (ASCLazy)initWithFactory:(id)a3
{
  id v4;
  ASCLazy *v5;
  uint64_t v6;
  id factory;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASCLazy;
  v5 = -[ASCLazy init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    factory = v5->_factory;
    v5->_factory = (id)v6;

    v5->_loadingGuard._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (id)object
{
  void *v3;
  void *v4;
  void (**v5)(void);
  void *v6;

  -[ASCLazy objectIfLoaded](self, "objectIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    os_unfair_lock_lock(&self->_loadingGuard);
    -[ASCLazy objectIfLoaded](self, "objectIfLoaded");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[ASCLazy factory](self, "factory");
      v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v5[2]();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCLazy setObjectIfLoaded:](self, "setObjectIfLoaded:", v6);

    }
    os_unfair_lock_unlock(&self->_loadingGuard);
  }
  return -[ASCLazy objectIfLoaded](self, "objectIfLoaded");
}

- (id)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCLazy objectIfLoaded](self, "objectIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("object"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)objectIfLoaded
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setObjectIfLoaded:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (id)factory
{
  return self->_factory;
}

- (os_unfair_lock_s)loadingGuard
{
  return self->_loadingGuard;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_factory, 0);
  objc_storeStrong(&self->_objectIfLoaded, 0);
}

@end
