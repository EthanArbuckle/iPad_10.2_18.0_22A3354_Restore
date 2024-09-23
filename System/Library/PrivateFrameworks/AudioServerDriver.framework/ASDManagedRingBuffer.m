@implementation ASDManagedRingBuffer

- (ASDManagedRingBuffer)initWithFrameCapacity:(int64_t)a3 writeFormat:(id)a4 readFormat:(id)a5
{
  id v8;
  id v9;
  ASDManagedRingBuffer *v10;
  objc_class *v11;
  id v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  objc_super v16;

  v8 = a4;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ASDManagedRingBuffer;
  v10 = -[ASDRingBuffer initWithFrameCapacity:writeFormat:readFormat:](&v16, sel_initWithFrameCapacity_writeFormat_readFormat_, a3, v8, v9);
  if (v10)
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = dispatch_queue_create((const char *)objc_msgSend(v12, "UTF8String"), 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

  }
  return v10;
}

- (void)startReader
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__ASDManagedRingBuffer_startReader__block_invoke;
  block[3] = &unk_24DBC9F68;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __35__ASDManagedRingBuffer_startReader__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setReaderRunning:", 1);
  result = objc_msgSend(*(id *)(a1 + 32), "writerRunning");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "allocate");
  return result;
}

- (void)stopReader
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__ASDManagedRingBuffer_stopReader__block_invoke;
  block[3] = &unk_24DBC9F68;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __34__ASDManagedRingBuffer_stopReader__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setReaderRunning:", 0);
  result = objc_msgSend(*(id *)(a1 + 32), "writerRunning");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "deallocate");
  return result;
}

- (void)startWriter
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__ASDManagedRingBuffer_startWriter__block_invoke;
  block[3] = &unk_24DBC9F68;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __35__ASDManagedRingBuffer_startWriter__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setWriterRunning:", 1);
  result = objc_msgSend(*(id *)(a1 + 32), "readerRunning");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "allocate");
  return result;
}

- (void)stopWriter
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__ASDManagedRingBuffer_stopWriter__block_invoke;
  block[3] = &unk_24DBC9F68;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __34__ASDManagedRingBuffer_stopWriter__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setWriterRunning:", 0);
  result = objc_msgSend(*(id *)(a1 + 32), "readerRunning");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "deallocate");
  return result;
}

- (BOOL)readerRunning
{
  return self->_readerRunning;
}

- (void)setReaderRunning:(BOOL)a3
{
  self->_readerRunning = a3;
}

- (BOOL)writerRunning
{
  return self->_writerRunning;
}

- (void)setWriterRunning:(BOOL)a3
{
  self->_writerRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
