@implementation _CNLazyArrayOperatorTakeLast

- (_CNLazyArrayOperatorTakeLast)initWithInput:(id)a3 limit:(unint64_t)a4
{
  _CNLazyArrayOperatorTakeLast *v5;
  uint64_t v6;
  CNQueue *buffer;
  _CNLazyArrayOperatorTakeLast *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_CNLazyArrayOperatorTakeLast;
  v5 = -[_CNLazyArrayOperator initWithInput:](&v10, sel_initWithInput_, a3);
  if (v5)
  {
    +[CNQueue boundedQueueWithCapacity:](CNQueue, "boundedQueueWithCapacity:", a4);
    v6 = objc_claimAutoreleasedReturnValue();
    buffer = v5->_buffer;
    v5->_buffer = (CNQueue *)v6;

    v5->_haveFilledBuffer = 0;
    v8 = v5;
  }

  return v5;
}

- (id)nextObject
{
  if (!self->_haveFilledBuffer)
    -[_CNLazyArrayOperatorTakeLast fillBuffer](self, "fillBuffer");
  return -[CNQueue dequeue](self->_buffer, "dequeue");
}

- (void)fillBuffer
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (!self->_haveFilledBuffer)
  {
    self->_haveFilledBuffer = 1;
    -[_CNLazyArrayOperator input](self, "input");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nextObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      do
      {
        -[CNQueue enqueue:](self->_buffer, "enqueue:", v4);
        -[_CNLazyArrayOperator input](self, "input");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "nextObject");
        v6 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v6;
      }
      while (v6);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
