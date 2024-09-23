@implementation MFProgressFilterDataConsumer

- (MFProgressFilterDataConsumer)initWithConsumer:(id)a3 expectedSize:(unint64_t)a4
{
  MFProgressFilterDataConsumer *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFProgressFilterDataConsumer;
  result = -[MFBaseFilterDataConsumer initWithConsumer:](&v6, sel_initWithConsumer_, a3);
  if (result)
  {
    result->_expectedSize = a4;
    result->_currentBytes = 0;
  }
  return result;
}

- (MFProgressFilterDataConsumer)initWithConsumers:(id)a3 expectedSize:(unint64_t)a4
{
  MFProgressFilterDataConsumer *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFProgressFilterDataConsumer;
  result = -[MFBaseFilterDataConsumer initWithConsumers:](&v6, sel_initWithConsumers_, a3);
  if (result)
  {
    result->_expectedSize = a4;
    result->_currentBytes = 0;
  }
  return result;
}

- (int64_t)appendData:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFProgressFilterDataConsumer;
  v5 = -[MFBaseFilterDataConsumer appendData:](&v10, sel_appendData_, v4);
  v6 = v5;
  if ((v5 & 0x8000000000000000) == 0)
  {
    self->_currentBytes += v5;
    -[MFProgressFilterDataConsumer progressBlock](self, "progressBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[MFProgressFilterDataConsumer progressBlock](self, "progressBlock");
      v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v8[2](v8, self->_currentBytes, v6, self->_expectedSize);

    }
  }

  return v6;
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)expectedSize
{
  return self->_expectedSize;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressBlock, 0);
}

@end
