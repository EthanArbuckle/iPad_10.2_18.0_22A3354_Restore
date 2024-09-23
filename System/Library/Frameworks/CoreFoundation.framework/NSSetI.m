@implementation NSSetI

unint64_t ____NSSetI_new_block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  result = objc_msgSend((id)a2, "hash");
  if (v4)
  {
    v7 = result % v4;
    v8 = v4;
    while (1)
    {
      result = *(_QWORD *)(v5 + 8 * v7);
      if (!result || result == a2)
        break;
      result = objc_msgSend((id)result, "isEqual:", a2);
      if ((result & 1) != 0)
        break;
      if (v7 + 1 >= v4)
        v10 = v4;
      else
        v10 = 0;
      v7 = v7 + 1 - v10;
      if (!--v8)
      {
        v7 = v4;
        break;
      }
    }
  }
  else
  {
    v7 = 0;
  }
  v11 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(v11 + 8 * v7))
  {
    *(_QWORD *)(v11 + 8 * v7) = a2;
    if (a2 >= 1 && !*(_BYTE *)(a1 + 56))
      result = (unint64_t)(id)a2;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) & 0xFC00000000000000 | (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 1) & 0x3FFFFFFFFFFFFFFLL;
  }
  return result;
}

_QWORD *__51____NSSetI_enumerateObjectsWithOptions_usingBlock___block_invoke(_QWORD *result, uint64_t a2)
{
  unsigned __int8 v2;
  _QWORD *v3;
  void *v4;

  v2 = atomic_load((unsigned __int8 *)(*(_QWORD *)(result[6] + 8) + 24));
  if ((v2 & 1) == 0)
  {
    v3 = result;
    if (*(_QWORD *)(result[4] + 16 + 8 * a2))
    {
      v4 = (void *)_CFAutoreleasePoolPush();
      __NSSET_IS_CALLING_OUT_TO_A_BLOCK__(v3[5]);
      return _CFAutoreleasePoolPop(v4);
    }
  }
  return result;
}

@end
