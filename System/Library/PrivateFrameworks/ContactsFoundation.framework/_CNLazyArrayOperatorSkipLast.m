@implementation _CNLazyArrayOperatorSkipLast

- (_CNLazyArrayOperatorSkipLast)initWithInput:(id)a3 limit:(unint64_t)a4
{
  _CNLazyArrayOperatorSkipLast *v5;
  _CNLazyArrayOperatorSkipLast *v6;
  CNQueue *v7;
  CNQueue *buffer;
  _CNLazyArrayOperatorSkipLast *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_CNLazyArrayOperatorSkipLast;
  v5 = -[_CNLazyArrayOperator initWithInput:](&v11, sel_initWithInput_, a3);
  v6 = v5;
  if (v5)
  {
    v5->_limit = a4;
    v7 = objc_alloc_init(CNQueue);
    buffer = v6->_buffer;
    v6->_buffer = v7;

    v6->_haveFilledBuffer = 0;
    v9 = v6;
  }

  return v6;
}

- (id)nextObject
{
  void *v3;
  void *v4;
  void *v5;

  if (self->_haveFilledBuffer || -[_CNLazyArrayOperatorSkipLast fillBuffer](self, "fillBuffer"))
  {
    -[_CNLazyArrayOperator input](self, "input");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nextObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CNQueue dequeue](self->_buffer, "dequeue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNQueue enqueue:](self->_buffer, "enqueue:", v4);
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)fillBuffer
{
  BOOL v2;
  void *v4;
  void *v5;

  v2 = 1;
  if (!self->_haveFilledBuffer)
  {
    self->_haveFilledBuffer = 1;
    do
    {
      -[_CNLazyArrayOperator input](self, "input");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "nextObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v5 != 0;
      if (!v5)
        break;
      -[CNQueue enqueue:](self->_buffer, "enqueue:", v5);

    }
    while (-[CNQueue count](self->_buffer, "count") < self->_limit);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
