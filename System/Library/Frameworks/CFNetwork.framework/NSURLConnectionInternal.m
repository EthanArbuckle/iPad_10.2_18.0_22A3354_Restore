@implementation NSURLConnectionInternal

- (void)_withActiveConnectionAndDelegate:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    v4 = (void *)MEMORY[0x186DB8C8C]();
    -[NSURLConnectionInternal _withConnectionAndDelegate:onlyActive:](a1, a2, 1);
    objc_autoreleasePoolPop(v4);
  }
}

- (void)_withConnectionAndDelegate:(char)a3 onlyActive:
{
  void *v6;
  id v7;
  id v8;
  _QWORD v9[8];
  char v10;

  v6 = (void *)MEMORY[0x186DB8C8C]();
  if (*(_BYTE *)(a1 + 64) || (a3 & 1) == 0)
  {
    v7 = *(id *)(a1 + 8);
    v8 = *(id *)(a1 + 48);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__NSURLConnectionInternal__withConnectionAndDelegate_onlyActive___block_invoke;
    v9[3] = &unk_1E14FE340;
    v9[4] = v7;
    v9[5] = v8;
    v10 = a3;
    v9[6] = a1;
    v9[7] = a2;
    objc_msgSend((id)a1, "invokeForDelegate:", v9);
  }
  objc_autoreleasePoolPop(v6);
}

void __65__NSURLConnectionInternal__withConnectionAndDelegate_onlyActive___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 64) || !*(_BYTE *)(a1 + 64))
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __66__NSURLConnectionInternal__withConnectionDisconnectFromConnection__block_invoke(uint64_t a1, const void *a2, void *a3)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_invalidate");
  CFRelease(a2);
}

- (NSURLConnectionInternal)initWithInfo:(const InternalInit *)a3
{
  NSURLConnectionInternal *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSURLConnectionInternal;
  v4 = -[NSURLConnectionInternal init](&v6, sel_init);
  if (v4)
  {
    v4->_connection = (NSURLConnection *)CFRetain(a3->var0);
    v4->_originalRequest = (NSURLRequest *)a3->var1;
    v4->_currentRequest = (NSURLRequest *)a3->var1;
    v4->_delegate = a3->var2;
    v4->_url = (NSURL *)(id)objc_msgSend(a3->var1, "URL");
    v4->_connectionProperties = (NSDictionary *)a3->var3;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLConnectionInternal;
  -[NSURLConnectionInternal dealloc](&v3, sel_dealloc);
}

- (void)_setDelegateQueue:(id)a3
{
  NSOperationQueue *delegateQueue;

  delegateQueue = self->_delegateQueue;
  if (delegateQueue != a3)
  {

    self->_delegateQueue = (NSOperationQueue *)a3;
  }
}

- (id)_timingData
{
  return 0;
}

- (void)_withConnectionAndDelegate:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    v4 = (void *)MEMORY[0x186DB8C8C]();
    -[NSURLConnectionInternal _withConnectionAndDelegate:onlyActive:](a1, a2, 0);
    objc_autoreleasePoolPop(v4);
  }
}

@end
