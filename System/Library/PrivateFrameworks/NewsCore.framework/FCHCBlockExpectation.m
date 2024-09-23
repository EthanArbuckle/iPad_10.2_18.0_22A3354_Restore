@implementation FCHCBlockExpectation

- (void)validate
{
  void *v3;
  void (**v4)(void);

  -[FCHCBlockExpectation block](self, "block");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FCHCBlockExpectation block](self, "block");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
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
