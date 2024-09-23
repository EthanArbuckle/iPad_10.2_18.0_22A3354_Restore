@implementation DYTransportMessageReplyContinuation

- (void)dispatchError:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->super.queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__DYTransportMessageReplyContinuation_dispatchError___block_invoke;
  v4[3] = &unk_250D622A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __53__DYTransportMessageReplyContinuation_dispatchError___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    result = (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 16) + 16))();
    *(_BYTE *)(*(_QWORD *)(v2 + 32) + 24) = 1;
  }
  return result;
}

@end
