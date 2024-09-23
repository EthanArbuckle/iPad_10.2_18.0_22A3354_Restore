@implementation NSIPCallbackSerialization

uint64_t __45___NSIPCallbackSerialization_sendBeginBlock___block_invoke(uint64_t a1)
{
  unsigned __int8 v1;
  uint64_t result;

  v1 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16));
  if ((v1 & 1) != 0)
    __assert_rtn("-[_NSIPCallbackSerialization sendBeginBlock:]_block_invoke", "NSItemProvider.m", 106, "!_hasBegun");
  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __43___NSIPCallbackSerialization_sendEndBlock___block_invoke(uint64_t a1)
{
  uint64_t (**v2)(void);
  uint64_t v3;
  uint64_t result;

  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 17));
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(uint64_t (***)(void))(a1 + 40);
  LOBYTE(v3) = atomic_load((unsigned __int8 *)(v3 + 16));
  if ((v3 & 1) != 0)
    return v2[2]();
  result = objc_msgSend(v2, "copy");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = result;
  return result;
}

@end
