@implementation _CNLazyArrayActionOnNext

- (_CNLazyArrayActionOnNext)initWithInput:(id)a3 action:(id)a4
{
  id v6;
  _CNLazyArrayActionOnNext *v7;
  uint64_t v8;
  id action;
  _CNLazyArrayActionOnNext *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_CNLazyArrayActionOnNext;
  v7 = -[_CNLazyArrayOperator initWithInput:](&v12, sel_initWithInput_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    action = v7->_action;
    v7->_action = (id)v8;

    v10 = v7;
  }

  return v7;
}

- (id)nextObject
{
  void *v3;
  void *v4;

  -[_CNLazyArrayOperator input](self, "input");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    (*((void (**)(void))self->_action + 2))();
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
}

@end
