@implementation MKWhenSizedBlock

- (void)perform
{
  void (**block)(id, SEL);
  void (**completion)(id, BOOL);

  if (self->_shouldRun)
  {
    block = (void (**)(id, SEL))self->_block;
    if (block)
      block[2](block, a2);
  }
  completion = (void (**)(id, BOOL))self->_completion;
  if (completion)
    completion[2](completion, self->_shouldRun);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_block, 0);
}

- (MKWhenSizedBlock)initWithType:(int64_t)a3 block:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  MKWhenSizedBlock *v10;
  MKWhenSizedBlock *v11;
  uint64_t v12;
  id block;
  uint64_t v14;
  id completion;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MKWhenSizedBlock;
  v10 = -[MKWhenSizedBlock init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v12 = MEMORY[0x18D778DB8](v8);
    block = v11->_block;
    v11->_block = (id)v12;

    v14 = MEMORY[0x18D778DB8](v9);
    completion = v11->_completion;
    v11->_completion = (id)v14;

    v11->_shouldRun = 1;
  }

  return v11;
}

- (MKWhenSizedBlock)initWithType:(int64_t)a3 block:(id)a4
{
  return -[MKWhenSizedBlock initWithType:block:completion:](self, "initWithType:block:completion:", a3, a4, 0);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)shouldRun
{
  return self->_shouldRun;
}

- (void)setShouldRun:(BOOL)a3
{
  self->_shouldRun = a3;
}

@end
