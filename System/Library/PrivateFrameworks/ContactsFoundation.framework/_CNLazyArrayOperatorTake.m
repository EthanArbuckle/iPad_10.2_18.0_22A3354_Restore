@implementation _CNLazyArrayOperatorTake

- (_CNLazyArrayOperatorTake)initWithInput:(id)a3 limit:(unint64_t)a4
{
  _CNLazyArrayOperatorTake *v5;
  _CNLazyArrayOperatorTake *v6;
  _CNLazyArrayOperatorTake *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_CNLazyArrayOperatorTake;
  v5 = -[_CNLazyArrayOperator initWithInput:](&v9, sel_initWithInput_, a3);
  v6 = v5;
  if (v5)
  {
    v5->_remainingTakeCount = a4;
    v7 = v5;
  }

  return v6;
}

- (id)nextObject
{
  unint64_t remainingTakeCount;
  void *v3;
  void *v4;

  remainingTakeCount = self->_remainingTakeCount;
  if (remainingTakeCount)
  {
    self->_remainingTakeCount = remainingTakeCount - 1;
    -[_CNLazyArrayOperator input](self, "input");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nextObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
