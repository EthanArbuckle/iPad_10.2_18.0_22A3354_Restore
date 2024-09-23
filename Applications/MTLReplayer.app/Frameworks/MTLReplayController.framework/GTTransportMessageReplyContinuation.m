@implementation GTTransportMessageReplyContinuation

uint64_t __53__GTTransportMessageReplyContinuation_dispatchError___block_invoke(uint64_t result)
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
