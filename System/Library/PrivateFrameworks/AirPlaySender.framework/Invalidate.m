@implementation Invalidate

void __apsession_Invalidate_block_invoke(uint64_t a1)
{
  uint64_t v2;
  _BYTE *DerivedStorage;
  _BYTE *v4;
  const void *v5;
  CFTypeRef v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  void (*v11)(CFTypeRef);
  uint64_t CMBaseObject;
  uint64_t v13;
  void (*v14)(uint64_t);
  const void *v15;
  const void *v16;
  const void *v17;
  const void *v18;

  v2 = *(_QWORD *)(a1 + 40);
  DerivedStorage = (_BYTE *)CMBaseObjectGetDerivedStorage();
  if (!*DerivedStorage)
  {
    v4 = DerivedStorage;
    *DerivedStorage = 1;
    apsession_stopSenderNetworkClockIfNeeded(v2);
    MEMORY[0x1CAA400CC](*((_QWORD *)v4 + 32));
    v5 = (const void *)*((_QWORD *)v4 + 35);
    if (v5)
      v6 = CFRetain(v5);
    else
      v6 = 0;
    v7 = (const void *)*((_QWORD *)v4 + 44);
    if (v7)
    {
      CFRelease(v7);
      *((_QWORD *)v4 + 44) = 0;
    }
    v8 = (const void *)*((_QWORD *)v4 + 46);
    if (v8)
    {
      CFRelease(v8);
      *((_QWORD *)v4 + 46) = 0;
    }
    v9 = (const void *)*((_QWORD *)v4 + 47);
    if (v9)
    {
      CFRelease(v9);
      *((_QWORD *)v4 + 47) = 0;
    }
    v10 = (const void *)*((_QWORD *)v4 + 48);
    if (v10)
    {
      CFRelease(v10);
      *((_QWORD *)v4 + 48) = 0;
    }
    MEMORY[0x1CAA400E4](*((_QWORD *)v4 + 32));
    if (v4[176])
    {
      v11 = *(void (**)(CFTypeRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
      if (v11)
        v11(v6);
      v4[176] = 0;
    }
    MEMORY[0x1CAA400CC](*((_QWORD *)v4 + 32));
    if (*((_QWORD *)v4 + 35))
    {
      CMBaseObject = FigTransportSessionGetCMBaseObject();
      if (CMBaseObject)
      {
        v13 = CMBaseObject;
        v14 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
        if (v14)
          v14(v13);
      }
    }
    MEMORY[0x1CAA400E4](*((_QWORD *)v4 + 32));
    v15 = (const void *)*((_QWORD *)v4 + 6);
    if (v15)
    {
      CFRelease(v15);
      *((_QWORD *)v4 + 6) = 0;
    }
    v16 = (const void *)*((_QWORD *)v4 + 7);
    if (v16)
    {
      CFRelease(v16);
      *((_QWORD *)v4 + 7) = 0;
    }
    v17 = (const void *)*((_QWORD *)v4 + 24);
    if (v17)
    {
      CFRelease(v17);
      *((_QWORD *)v4 + 24) = 0;
    }
    v18 = (const void *)*((_QWORD *)v4 + 25);
    if (v18)
    {
      CFRelease(v18);
      *((_QWORD *)v4 + 25) = 0;
    }
    if (v6)
      CFRelease(v6);
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

@end
