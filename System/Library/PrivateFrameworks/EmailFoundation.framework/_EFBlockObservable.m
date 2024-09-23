@implementation _EFBlockObservable

- (id)subscribe:(id)a3
{
  (*((void (**)(void))self->_block + 2))();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

- (_EFBlockObservable)initWithBlock:(id)a3
{
  id v4;
  _EFBlockObservable *v5;
  void *v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EFBlockObservable;
  v5 = -[_EFBlockObservable init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    block = v5->_block;
    v5->_block = v6;

  }
  return v5;
}

@end
