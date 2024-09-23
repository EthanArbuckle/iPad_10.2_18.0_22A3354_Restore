@implementation NSCollectionHandleConcurrentEnumerationIfSpecified

_QWORD *____NSCollectionHandleConcurrentEnumerationIfSpecified_block_invoke(_QWORD *result)
{
  unsigned __int8 v1;
  _QWORD *v2;
  void *v3;

  v1 = atomic_load((unsigned __int8 *)(*(_QWORD *)(result[5] + 8) + 24));
  if ((v1 & 1) == 0)
  {
    v2 = result;
    if (*((_BYTE *)result + 48))
    {
      v3 = (void *)_CFAutoreleasePoolPush();
      (*(void (**)(void))(v2[4] + 16))();
      return _CFAutoreleasePoolPop(v3);
    }
    else
    {
      return (_QWORD *)(*(uint64_t (**)(void))(result[4] + 16))();
    }
  }
  return result;
}

@end
