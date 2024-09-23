@implementation NUBlockBasedURLModifier

+ (id)modifierWithBlock:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBlock:", v4);

  return v5;
}

- (NUBlockBasedURLModifier)initWithBlock:(id)a3
{
  id v4;
  NUBlockBasedURLModifier *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUBlockBasedURLModifier;
  v5 = -[NUBlockBasedURLModifier init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (id)modifyURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);

  v4 = a3;
  -[NUBlockBasedURLModifier block](self, "block");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v4;
  if (v5)
  {
    -[NUBlockBasedURLModifier block](self, "block");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v7)[2](v7, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
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
