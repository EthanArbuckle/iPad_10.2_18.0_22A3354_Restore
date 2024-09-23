@implementation VSOnceAndOnlyOnceHandler

- (void)dealloc
{
  int *p_counter;
  unsigned int v3;
  objc_super v4;

  p_counter = &self->_counter;
  while (1)
  {
    v3 = __ldaxr((unsigned int *)p_counter);
    if (v3 != 1)
      break;
    if (!__stlxr(2u, (unsigned int *)p_counter))
    {
      v4.receiver = self;
      v4.super_class = (Class)VSOnceAndOnlyOnceHandler;
      -[VSOnceAndOnlyOnceHandler dealloc](&v4, sel_dealloc);
      return;
    }
  }
  __clrex();
  __break(1u);
}

- (void)invoke
{
  int *p_counter;
  void (**v4)(void);

  p_counter = &self->_counter;
  while (!__ldaxr((unsigned int *)p_counter))
  {
    if (!__stlxr(1u, (unsigned int *)p_counter))
    {
      -[VSOnceAndOnlyOnceHandler block](self, "block");
      v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v4[2]();

      return;
    }
  }
  __clrex();
  __break(1u);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
