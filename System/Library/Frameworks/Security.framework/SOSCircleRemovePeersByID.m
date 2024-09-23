@implementation SOSCircleRemovePeersByID

void __SOSCircleRemovePeersByID_block_invoke(uint64_t a1, CFTypeRef cf)
{
  CFTypeID v4;
  const void **v5;
  const void **v6;
  char v7;
  uint64_t v8;
  char v9;

  if (cf)
  {
    v4 = CFGetTypeID(cf);
    if (v4 == CFStringGetTypeID())
    {
      v5 = (const void **)SOSCircleCopyPeerInfo(*(const __CFSet **)(*(_QWORD *)(a1 + 40) + 32), (uint64_t)cf);
      if (v5)
      {
        v6 = v5;
        v7 = SOSCircleRemovePeerInternal(*(_QWORD *)(a1 + 40), *(_QWORD **)(a1 + 48), v5, *(CFTypeRef **)(a1 + 56));
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        if (*(_BYTE *)(v8 + 24))
          v9 = v7;
        else
          v9 = 0;
        *(_BYTE *)(v8 + 24) = v9;
        CFRelease(v6);
      }
    }
  }
}

@end
