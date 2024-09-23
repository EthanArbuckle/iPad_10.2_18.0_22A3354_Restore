@implementation MTConvenienceEnvironmentDelegate

- (void).cxx_destruct
{
  objc_storeStrong(&self->__hostAppBlock, 0);
  objc_storeStrong(&self->__resourceRevNumBlock, 0);
  objc_storeStrong(&self->__pageURLBlock, 0);
}

- (MTConvenienceEnvironmentDelegate)initWithPageURLBlock:(id)a3 resourceRevNumBlock:(id)a4 hostAppBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  MTConvenienceEnvironmentDelegate *v11;
  uint64_t v12;
  id pageURLBlock;
  uint64_t v14;
  id resourceRevNumBlock;
  uint64_t v16;
  id hostAppBlock;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MTConvenienceEnvironmentDelegate;
  v11 = -[MTConvenienceEnvironmentDelegate init](&v19, sel_init);
  if (v11)
  {
    v12 = MEMORY[0x212BA8428](v8);
    pageURLBlock = v11->__pageURLBlock;
    v11->__pageURLBlock = (id)v12;

    v14 = MEMORY[0x212BA8428](v9);
    resourceRevNumBlock = v11->__resourceRevNumBlock;
    v11->__resourceRevNumBlock = (id)v14;

    v16 = MEMORY[0x212BA8428](v10);
    hostAppBlock = v11->__hostAppBlock;
    v11->__hostAppBlock = (id)v16;

  }
  return v11;
}

- (MTConvenienceEnvironmentDelegate)init
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("-init is not a valid initializer for the class %@"), v4);
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (id)hostApp
{
  void *v3;
  void (**v4)(void);
  void *v5;

  -[MTConvenienceEnvironmentDelegate _hostAppBlock](self, "_hostAppBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MTConvenienceEnvironmentDelegate _hostAppBlock](self, "_hostAppBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)pageUrl
{
  void *v3;
  void (**v4)(void);
  void *v5;

  -[MTConvenienceEnvironmentDelegate _pageURLBlock](self, "_pageURLBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MTConvenienceEnvironmentDelegate _pageURLBlock](self, "_pageURLBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)resourceRevNum
{
  void *v3;
  void (**v4)(void);
  void *v5;

  -[MTConvenienceEnvironmentDelegate _resourceRevNumBlock](self, "_resourceRevNumBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MTConvenienceEnvironmentDelegate _resourceRevNumBlock](self, "_resourceRevNumBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_pageURLBlock
{
  return self->__pageURLBlock;
}

- (void)set_pageURLBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)_resourceRevNumBlock
{
  return self->__resourceRevNumBlock;
}

- (void)set_resourceRevNumBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)_hostAppBlock
{
  return self->__hostAppBlock;
}

- (void)set_hostAppBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
