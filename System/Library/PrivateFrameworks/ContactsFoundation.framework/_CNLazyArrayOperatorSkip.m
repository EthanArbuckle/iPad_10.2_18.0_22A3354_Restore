@implementation _CNLazyArrayOperatorSkip

- (_CNLazyArrayOperatorSkip)initWithInput:(id)a3 limit:(unint64_t)a4
{
  _CNLazyArrayOperatorSkip *v5;
  _CNLazyArrayOperatorSkip *v6;
  _CNLazyArrayOperatorSkip *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_CNLazyArrayOperatorSkip;
  v5 = -[_CNLazyArrayOperator initWithInput:](&v9, sel_initWithInput_, a3);
  v6 = v5;
  if (v5)
  {
    v5->_remainingSkipCount = a4;
    v7 = v5;
  }

  return v6;
}

- (id)nextObject
{
  void *v3;
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;

  if (self->_remainingSkipCount)
  {
    do
    {
      -[_CNLazyArrayOperator input](self, "input");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (id)objc_msgSend(v3, "nextObject");

      v5 = self->_remainingSkipCount - 1;
      self->_remainingSkipCount = v5;
    }
    while (v5);
  }
  -[_CNLazyArrayOperator input](self, "input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nextObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
