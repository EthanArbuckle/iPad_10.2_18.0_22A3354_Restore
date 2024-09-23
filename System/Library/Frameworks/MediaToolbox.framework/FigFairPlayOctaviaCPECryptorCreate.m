@implementation FigFairPlayOctaviaCPECryptorCreate

uint64_t __FigFairPlayOctaviaCPECryptorCreate_block_invoke(_QWORD *a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int (*v5)(uint64_t, __CFString *, uint64_t, CFNumberRef *);
  uint64_t v6;
  void *context;
  uint64_t v8;
  uint64_t result;
  unsigned int valuePtr;
  CFNumberRef number;

  v2 = (uint64_t *)a1[6];
  number = 0;
  valuePtr = 0;
  if (v2)
  {
    v3 = v2[2];
    v4 = *v2;
    v5 = *(unsigned int (**)(uint64_t, __CFString *, uint64_t, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 8)
                                                                                      + 48);
    if (v5)
    {
      if (!v5(v3, CFSTR("3721370B-B25B-4EED-A8C8-F27CAA873C75"), v4, &number))
      {
        CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
        if (number)
          CFRelease(number);
      }
    }
  }
  v6 = valuePtr;
  context = dispatch_get_context(*(dispatch_object_t *)(a1[6] + 48));
  lpo7y56t5h(v6, (uint64_t)context, (uint64_t)(a1 + 7));
  result = FAIRPLAY_CALL_LOG(v8);
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  if (!*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    result = (uint64_t)CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, *(CFAllocatorRef *)(a1[6] + 8));
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  }
  return result;
}

@end
