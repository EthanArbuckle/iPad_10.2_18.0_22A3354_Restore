@implementation PDFBlockQueuePair

+ (id)blockQueuePairWithBlock:(id)a3 andQueue:(id)a4
{
  id v5;
  id v6;
  PDFBlockQueuePair *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PDFBlockQueuePair initWithBlock:andQueue:]([PDFBlockQueuePair alloc], "initWithBlock:andQueue:", v6, v5);

  return v7;
}

- (PDFBlockQueuePair)initWithBlock:(id)a3 andQueue:(id)a4
{
  id v6;
  id v7;
  PDFBlockQueuePair *v8;
  uint64_t v9;
  id block;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PDFBlockQueuePair;
  v8 = -[PDFBlockQueuePair init](&v12, sel_init);
  if (v8)
  {
    v9 = MEMORY[0x20BD1AEB4](v6);
    block = v8->_block;
    v8->_block = (id)v9;

    objc_storeStrong((id *)&v8->_queue, a4);
  }

  return v8;
}

- (id)block
{
  return objc_getProperty(self, a2, 8, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
