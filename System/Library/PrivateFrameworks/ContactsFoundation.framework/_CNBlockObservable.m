@implementation _CNBlockObservable

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

- (id)subscribe:(id)a3
{
  return (id)(*((uint64_t (**)(void))self->_block + 2))();
}

- (_CNBlockObservable)initWithBlock:(id)a3
{
  id v4;
  _CNBlockObservable *v5;
  uint64_t v6;
  id block;
  _CNBlockObservable *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNBlockObservable;
  v5 = -[_CNBlockObservable init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

    v8 = v5;
  }

  return v5;
}

@end
