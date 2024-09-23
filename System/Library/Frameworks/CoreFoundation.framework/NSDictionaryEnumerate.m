@implementation NSDictionaryEnumerate

uint64_t ____NSDictionaryEnumerate_block_invoke_2(uint64_t a1)
{
  __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__(*(_QWORD *)(a1 + 32));
  return 1;
}

_QWORD *____NSDictionaryEnumerate_block_invoke(_QWORD *result)
{
  unsigned __int8 v1;
  _QWORD *v2;
  char *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = atomic_load((unsigned __int8 *)(*(_QWORD *)(result[7] + 8) + 24));
  if ((v1 & 1) == 0)
  {
    v2 = result;
    v3 = (char *)&v10 - ((8 * result[8] + 15) & 0xFFFFFFFFFFFFFFF0);
    v4 = (void *)_CFAutoreleasePoolPush();
    pthread_mutex_lock((pthread_mutex_t *)v2[9]);
    if (v2[8])
    {
      v5 = 0;
      do
      {
        v6 = objc_msgSend((id)v2[4], "nextObject");
        *(_QWORD *)&v3[8 * v5] = v6;
        if (!v6)
          break;
        ++v5;
      }
      while (v5 < v2[8]);
    }
    pthread_mutex_unlock((pthread_mutex_t *)v2[9]);
    if (v2[8])
    {
      for (i = 0; i < v2[8]; ++i)
      {
        v8 = *(_QWORD *)&v3[8 * i];
        if (!v8)
          break;
        HIBYTE(v10) = 0;
        v9 = v2[6];
        objc_msgSend((id)v2[5], "objectForKey:", v8);
        __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__(v9);
        if (HIBYTE(v10))
        {
          atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(v2[7] + 8) + 24));
          return _CFAutoreleasePoolPop(v4);
        }
      }
    }
    return _CFAutoreleasePoolPop(v4);
  }
  return result;
}

@end
