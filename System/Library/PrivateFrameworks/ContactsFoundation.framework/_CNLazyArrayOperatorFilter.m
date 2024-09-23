@implementation _CNLazyArrayOperatorFilter

- (_CNLazyArrayOperatorFilter)initWithInput:(id)a3 test:(id)a4
{
  id v6;
  _CNLazyArrayOperatorFilter *v7;
  uint64_t v8;
  id test;
  _CNLazyArrayOperatorFilter *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_CNLazyArrayOperatorFilter;
  v7 = -[_CNLazyArrayOperator initWithInput:](&v12, sel_initWithInput_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    test = v7->_test;
    v7->_test = (id)v8;

    v10 = v7;
  }

  return v7;
}

- (id)nextObject
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[_CNLazyArrayOperator input](self, "input");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    do
    {
      if (((*((uint64_t (**)(void))self->_test + 2))() & 1) != 0)
        break;
      -[_CNLazyArrayOperator input](self, "input");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "nextObject");
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
    while (v6);
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_test, 0);
}

@end
