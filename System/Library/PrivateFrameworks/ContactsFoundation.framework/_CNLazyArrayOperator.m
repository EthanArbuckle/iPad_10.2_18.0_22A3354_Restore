@implementation _CNLazyArrayOperator

- (_CNLazyArrayOperator)initWithInput:(id)a3
{
  id v5;
  _CNLazyArrayOperator *v6;
  _CNLazyArrayOperator *v7;
  _CNLazyArrayOperator *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNLazyArrayOperator;
  v6 = -[_CNLazyArrayOperator init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_input, a3);
    v8 = v7;
  }

  return v7;
}

- (id)nextObject
{
  id v2;

  CNAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (_CNLazyArrayOperation)input
{
  return (_CNLazyArrayOperation *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_input, 0);
}

@end
