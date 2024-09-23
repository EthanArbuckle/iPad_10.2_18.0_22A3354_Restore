@implementation NPTUploadDataStream

- (NPTUploadDataStream)initWithLength:(unint64_t)a3
{
  NPTUploadDataStream *v4;
  NPTUploadDataStream *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *callBackQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NPTUploadDataStream;
  v4 = -[NPTUploadDataStream init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->remainingLength = a3;
    v4->status = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("streamCallBackQueue", v6);
    callBackQueue = v5->callBackQueue;
    v5->callBackQueue = (OS_dispatch_queue *)v7;

  }
  return v5;
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  unint64_t remainingLength;
  unint64_t v6;
  NSObject *callBackQueue;
  _QWORD v9[5];
  BOOL v10;

  if (self->remainingLength >= a4)
    remainingLength = a4;
  else
    remainingLength = self->remainingLength;
  memset(a3, 114, remainingLength);
  v6 = self->remainingLength - remainingLength;
  self->remainingLength = v6;
  callBackQueue = self->callBackQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __38__NPTUploadDataStream_read_maxLength___block_invoke;
  v9[3] = &unk_24C991480;
  v9[4] = self;
  v10 = v6 != 0;
  dispatch_async(callBackQueue, v9);
  return remainingLength;
}

void __38__NPTUploadDataStream_read_maxLength___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    if (v3)
      v5 = 2;
    else
      v5 = 16;
    objc_msgSend(v4, "stream:handleEvent:", *(_QWORD *)(a1 + 32), v5);

  }
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (BOOL)hasBytesAvailable
{
  return 1;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return 0;
}

- (id)propertyForKey:(id)a3
{
  return 0;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (id)delegate
{
  return self->_delegate;
}

- (void)open
{
  NSObject *callBackQueue;
  _QWORD block[5];

  self->status = 2;
  callBackQueue = self->callBackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__NPTUploadDataStream_open__block_invoke;
  block[3] = &unk_24C990F78;
  block[4] = self;
  dispatch_async(callBackQueue, block);
}

void __27__NPTUploadDataStream_open__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stream:handleEvent:", *(_QWORD *)(a1 + 32), 1);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stream:handleEvent:", *(_QWORD *)(a1 + 32), 2);

  }
}

- (void)close
{
  self->status = 6;
}

- (id)streamError
{
  return 0;
}

- (unint64_t)streamStatus
{
  return self->status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->callBackQueue, 0);
}

@end
