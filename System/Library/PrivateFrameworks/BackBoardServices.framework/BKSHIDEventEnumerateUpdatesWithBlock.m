@implementation BKSHIDEventEnumerateUpdatesWithBlock

uint64_t __BKSHIDEventEnumerateUpdatesWithBlock_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t IntegerValue;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  IntegerValue = IOHIDEventGetIntegerValue();
  result = IOHIDEventGetIntegerValue();
  if (IntegerValue && (_DWORD)result)
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10 != IntegerValue)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("child event should have the same generation as parent (child:%ld parent:%ld)"), IntegerValue, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventEnumerateUpdatesWithBlock(IOHIDEventRef, __strong BKSHIDEventUpdateHandler)_block_invoke");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v17 = v13;
        v18 = 2114;
        v19 = CFSTR("BKSHIDEvent.m");
        v20 = 1024;
        v21 = 2051;
        v22 = 2114;
        v23 = v12;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

      }
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A14FEF8);
    }
    v11 = *(unsigned int *)(a1 + 48);
    if ((result & ~(_DWORD)v11) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("child update mask should be a subset of parent update mask (child:%X parent:%X)"), result, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventEnumerateUpdatesWithBlock(IOHIDEventRef, __strong BKSHIDEventUpdateHandler)_block_invoke");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v17 = v15;
        v18 = 2114;
        v19 = CFSTR("BKSHIDEvent.m");
        v20 = 1024;
        v21 = 2052;
        v22 = 2114;
        v23 = v14;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

      }
      objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A14FFC8);
    }
    return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, a3, IntegerValue, a4);
  }
  return result;
}

@end
