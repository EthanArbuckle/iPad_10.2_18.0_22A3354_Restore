@implementation _CATXPCBoostAssertion

- (void)dealloc
{
  void *v3;
  void (**v4)(void);
  objc_super v5;

  -[_CATXPCBoostAssertion block](self, "block");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_CATXPCBoostAssertion block](self, "block");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
  v5.receiver = self;
  v5.super_class = (Class)_CATXPCBoostAssertion;
  -[_CATXPCBoostAssertion dealloc](&v5, sel_dealloc);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
