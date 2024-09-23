@implementation SOSCircleRemovePeersByIDUnsigned

void __SOSCircleRemovePeersByIDUnsigned_block_invoke(uint64_t a1, CFTypeRef cf)
{
  uint64_t v3;
  CFTypeID v4;
  uint64_t v5;
  const void *v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  char v10;

  if (!cf || (v3 = (uint64_t)cf, v4 = CFGetTypeID(cf), v4 != CFStringGetTypeID()))
    v3 = 0;
  v5 = SOSCircleCopyPeerInfo(*(const __CFSet **)(*(_QWORD *)(a1 + 40) + 32), v3);
  if (v5)
  {
    v6 = (const void *)v5;
    v7 = *(_QWORD *)(a1 + 40);
    v8 = SOSCircleHasPeerWithID(v7, *(const void **)(v5 + 40));
    if (v8)
      CFSetRemoveValue(*(CFMutableSetRef *)(v7 + 32), v6);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_BYTE *)(v9 + 24))
      v10 = v8;
    else
      v10 = 0;
    *(_BYTE *)(v9 + 24) = v10;
    CFRelease(v6);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
}

@end
