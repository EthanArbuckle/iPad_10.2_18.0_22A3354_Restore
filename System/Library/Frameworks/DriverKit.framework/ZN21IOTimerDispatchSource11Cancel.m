@implementation ZN21IOTimerDispatchSource11Cancel

IORecursiveConditionLock *___ZN21IOTimerDispatchSource11Cancel_ImplEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  IORecursiveConditionLock *result;
  _QWORD v8[2];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(v2 + 48);
  v4 = *(_QWORD **)(v3 + 8);
  v5 = v4[5];
  if (*(_QWORD *)(v5 + 48))
  {
    (*(void (**)(_QWORD *))(*v4 + 8))(v4);
    IORecursiveConditionLockLock(*(IORecursiveConditionLock **)(v4[5] + 48));
    v3 = *(_QWORD *)(v2 + 48);
  }
  else
  {
    v8[1] = *(_QWORD *)(v3 + 8);
    v8[0] = *(_QWORD *)(v5 + 8);
    *(_QWORD *)(v5 + 8) = v8;
  }
  *(_WORD *)(v3 + 64) = 256;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v6 = v4[5];
  result = *(IORecursiveConditionLock **)(v6 + 48);
  if (result)
  {
    IORecursiveConditionLockUnlock(result);
    return (IORecursiveConditionLock *)(*(uint64_t (**)(_QWORD *))(*v4 + 16))(v4);
  }
  else
  {
    *(_QWORD *)(v6 + 8) = v8[0];
  }
  return result;
}

@end
