@implementation ReacquireServerClockObject

void __ReacquireServerClockObject_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  BOOL v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 12) && !*(_QWORD *)v2)
  {
    v3 = AcquireServerClockObject(*(_QWORD *)(a1 + 40), 0, 0);
    v4 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)v4)
      v5 = v3 == 0;
    else
      v5 = 0;
    if (v5)
      *(_BYTE *)(v4 + 8) = 0;
    *(_DWORD *)(v4 + 12) = 0;
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
