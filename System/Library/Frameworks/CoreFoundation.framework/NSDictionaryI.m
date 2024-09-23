@implementation NSDictionaryI

void ____NSDictionaryI_new_block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  NSException *v23;

  v6 = a1[5];
  v5 = a1[6];
  v7 = objc_msgSend((id)a2, "hash");
  if (v5)
  {
    v8 = v7 % v5;
    v9 = 2 * (v7 % v5);
    v10 = *(void **)(v6 + 16 * (v7 % v5));
    if (v10)
      v11 = v10 == (void *)a2;
    else
      v11 = 1;
    if (v11)
    {
      v13 = 1;
    }
    else
    {
      v12 = 1;
      v13 = 1;
      do
      {
        if ((objc_msgSend(v10, "isEqual:", a2) & 1) != 0)
          break;
        v13 = v12 < v5;
        if (v5 == v12)
          break;
        v14 = v8 + 1;
        v15 = v8 + 1 >= v5 ? v5 : 0;
        v8 = v14 - v15;
        v9 = 2 * (v14 - v15);
        v10 = *(void **)(v6 + 16 * (v14 - v15));
        ++v12;
      }
      while (v10 && v10 != (void *)a2);
    }
    if (v13)
      v5 = v9;
    else
      v5 *= 2;
  }
  v17 = a1[5];
  v18 = (uint64_t *)(v17 + 8 * v5);
  if (*v18)
  {
    *(_QWORD *)(a1[4] + 8) = *(_QWORD *)(a1[4] + 8) & 0xFE00000000000000 | (*(_QWORD *)(a1[4] + 8) - 1) & 0x1FFFFFFFFFFFFFFLL;
    v19 = a1[7];
    if ((v19 & 8) != 0)
    {

      v19 = a1[7];
    }
    if ((v19 & 4) != 0)

    return;
  }
  v20 = a1[7];
  if ((v20 & 8) == 0)
  {
    if ((v20 & 1) != 0)
    {
      *(_QWORD *)(a1[5] + 8 * v5) = objc_msgSend((id)a2, "copyWithZone:", 0);
      if (!*(_QWORD *)(a1[5] + 8 * v5))
      {
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("NSDictionary: -copyWithZone: for key %@ returned nil"), 0);
        v23 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
        objc_exception_throw(v23);
      }
      goto LABEL_33;
    }
    if (a2 >= 1)
    {
      v21 = (id)a2;
      v17 = a1[5];
    }
    v18 = (uint64_t *)(v17 + 8 * v5);
  }
  *v18 = a2;
LABEL_33:
  *(_QWORD *)(a1[5] + 8 * v5 + 8) = a3;
  if (a3 >= 1 && (a1[7] & 4) == 0)
    v22 = (id)a3;
}

_QWORD *__65____NSDictionaryI_enumerateKeysAndObjectsWithOptions_usingBlock___block_invoke(_QWORD *result, uint64_t a2)
{
  _QWORD *v2;
  void *v3;

  if (*(_QWORD *)(result[4] + 16 + 16 * a2))
  {
    v2 = result;
    v3 = (void *)_CFAutoreleasePoolPush();
    __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__(v2[5]);
    return _CFAutoreleasePoolPop(v3);
  }
  return result;
}

_QWORD *__53____NSDictionaryI_keyOfEntryWithOptions_passingTest___block_invoke(_QWORD *result, uint64_t a2, _BYTE *a3)
{
  unint64_t v3;
  _QWORD *v5;
  void *v6;

  v3 = *(_QWORD *)(result[4] + 16 + 16 * a2);
  if (v3)
  {
    v5 = result;
    v6 = (void *)_CFAutoreleasePoolPush();
    if ((*(unsigned int (**)(void))(v5[5] + 16))())
    {
      atomic_store(v3, (unint64_t *)(*(_QWORD *)(v5[6] + 8) + 24));
      *a3 = 1;
    }
    return _CFAutoreleasePoolPop(v6);
  }
  return result;
}

_QWORD *__56____NSDictionaryI_keysOfEntriesWithOptions_passingTest___block_invoke(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD *)(result[4] + 16 + 16 * a2);
  if (v2)
  {
    v3 = result;
    v4 = (void *)_CFAutoreleasePoolPush();
    if ((*(unsigned int (**)(void))(v3[6] + 16))())
    {
      os_unfair_lock_lock((os_unfair_lock_t)v3[7]);
      objc_msgSend((id)v3[5], "addObject:", v2);
      os_unfair_lock_unlock((os_unfair_lock_t)v3[7]);
    }
    return _CFAutoreleasePoolPop(v4);
  }
  return result;
}

@end
