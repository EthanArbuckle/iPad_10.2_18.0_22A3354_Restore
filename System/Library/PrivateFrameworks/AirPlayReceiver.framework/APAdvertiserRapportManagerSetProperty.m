@implementation APAdvertiserRapportManagerSetProperty

void __APAdvertiserRapportManagerSetProperty_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  CFTypeID v4;
  const void *v5;
  int v6;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(const void **)(a1 + 56);
  if (CFEqual(*(CFTypeRef *)(a1 + 48), CFSTR("deviceID")))
  {
    if (v3 && (v4 = CFGetTypeID(v3), v4 == CFStringGetTypeID()))
    {
      v5 = *(const void **)(v2 + 48);
      *(_QWORD *)(v2 + 48) = v3;
      CFRetain(v3);
      if (v5)
        CFRelease(v5);
      v6 = 0;
    }
    else
    {
      APSLogErrorAt();
      v6 = -6705;
    }
  }
  else
  {
    v6 = -72411;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
}

@end
