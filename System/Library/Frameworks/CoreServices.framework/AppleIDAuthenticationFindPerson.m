@implementation AppleIDAuthenticationFindPerson

void ___AppleIDAuthenticationFindPerson_block_invoke(uint64_t a1, CFArrayRef theArray, int a3, const void *a4)
{
  __CFArray *v8;
  CFRange v9;

  if (theArray && (v8 = *(__CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)) != 0)
  {
    v9.length = CFArrayGetCount(theArray);
    v9.location = 0;
    CFArrayAppendArray(v8, theArray, v9);
  }
  else if (theArray)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, theArray);
  }
  if (a4 && *(_QWORD *)(a1 + 40))
  {
    CFRetain(a4);
    **(_QWORD **)(a1 + 40) = a4;
  }
  if (a3)
    dispatch_semaphore_signal(**(dispatch_semaphore_t **)(a1 + 48));
}

@end
