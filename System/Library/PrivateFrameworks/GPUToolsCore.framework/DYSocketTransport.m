@implementation DYSocketTransport

- (DYSocketTransport)init
{
  -[DYSocketTransport doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (DYSocketTransport)initWithSocketDescriptor:(int)a3
{
  DYSocketTransport *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DYSocketTransport;
  result = -[DYBaseSocketTransport init](&v5, sel_init);
  if (result)
    *(_DWORD *)(&result->super._scheduledReadOnWritableSocket + 3) = a3;
  return result;
}

- (id)connect
{
  id v3;
  NSObject *queue;
  _QWORD v6[6];

  v3 = +[DYFuture future](DYFuture, "future");
  queue = self->super.super.super._queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __28__DYSocketTransport_connect__block_invoke;
  v6[3] = &unk_250D622A0;
  v6[4] = self;
  v6[5] = v3;
  dispatch_async(queue, v6);
  return v3;
}

uint64_t __28__DYSocketTransport_connect__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  DYError *v3;
  id *v4;
  void *v5;
  uint64_t v6;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[52])
  {
    v3 = +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 32, 0);
    v5 = *(void **)(a1 + 40);
    v4 = (id *)(a1 + 40);
    objc_msgSend(v5, "setError:", v3);
    v6 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  }
  else
  {
    if (!objc_msgSend(v2, "connected"))
      objc_msgSend(*(id *)(a1 + 32), "runWithSocket:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 268));
    v6 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v4 = (id *)(a1 + 40);
  }
  return objc_msgSend(*v4, "setResult:", v6);
}

@end
