@implementation IOHIDSessionCreate

void __IOHIDSessionCreate_block_invoke(uint64_t a1)
{
  uint64_t v1;
  CFIndex Count;
  uint64_t v3;
  CFArrayRef Copy;
  const __CFArray *v5;
  uint64_t v6;
  CFIndex i;
  void *ValueAtIndex;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD v12[5];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    if (pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(v1 + 32) + 8)))
      __IOHIDSessionCreate_block_invoke_cold_4(&v11, v12);
    ++**(_DWORD **)(v1 + 32);
    Count = CFArrayGetCount(*(CFArrayRef *)(v1 + 112));
    if (Count)
    {
      v3 = Count;
      Copy = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(CFArrayRef *)(v1 + 112));
      if (Copy)
      {
        v5 = Copy;
        CFArrayRemoveAllValues(*(CFMutableArrayRef *)(v1 + 112));
        v6 = *(_QWORD *)(v1 + 32);
        if (*(_DWORD *)v6)
        {
          --*(_DWORD *)v6;
          if (pthread_mutex_unlock((pthread_mutex_t *)(v6 + 8)))
            __IOHIDSessionCreate_block_invoke_cold_1(&v11, v12);
        }
        if (v3 >= 1)
        {
          for (i = 0; i != v3; ++i)
          {
            ValueAtIndex = (void *)CFArrayGetValueAtIndex(v5, i);
            if (ValueAtIndex)
              __IOHIDSessionDispatchEvent(v1, ValueAtIndex);
          }
        }
        CFRelease(v5);
      }
      else
      {
        v10 = *(_QWORD *)(v1 + 32);
        if (*(_DWORD *)v10)
        {
          --*(_DWORD *)v10;
          if (pthread_mutex_unlock((pthread_mutex_t *)(v10 + 8)))
            __IOHIDSessionCreate_block_invoke_cold_1(&v11, v12);
        }
      }
    }
    else
    {
      v9 = *(_QWORD *)(v1 + 32);
      if (*(_DWORD *)v9)
      {
        --*(_DWORD *)v9;
        if (pthread_mutex_unlock((pthread_mutex_t *)(v9 + 8)))
          __IOHIDSessionCreate_block_invoke_cold_1(&v11, v12);
      }
    }
  }
}

void __IOHIDSessionCreate_block_invoke_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_5(a1, a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void __IOHIDSessionCreate_block_invoke_cold_4(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_5(a1, a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

@end
