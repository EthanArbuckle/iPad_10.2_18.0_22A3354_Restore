@implementation LACCacheSync

- (LACCacheSync)initWithTimeout:(double)a3 block:(id)a4
{
  id v6;
  LACCacheSync *v7;
  void *v8;
  id block;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LACCacheSync;
  v7 = -[LACCache initWithTimeout:](&v11, sel_initWithTimeout_, a3);
  if (v7)
  {
    v8 = _Block_copy(v6);
    block = v7->_block;
    v7->_block = v8;

  }
  return v7;
}

- (id)valueWithParameter:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[LACCache cachedValueWithParameter:](self, "cachedValueWithParameter:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    (*((void (**)(void))self->_block + 2))();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACCache setCachedValue:withParameter:](self, "setCachedValue:withParameter:", v6, v5);
  }
  v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
