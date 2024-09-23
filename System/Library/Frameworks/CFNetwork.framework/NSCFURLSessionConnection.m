@implementation NSCFURLSessionConnection

uint64_t __66____NSCFURLSessionConnection_initWithTask_delegate_delegateQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 40))(a2);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = result;
  return result;
}

uint64_t __51____NSCFURLSessionConnection__storeCachedResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)a2 + 16))(a2, objc_msgSend(*(id *)(a1 + 32), "_CFCachedURLResponse"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
}

@end
