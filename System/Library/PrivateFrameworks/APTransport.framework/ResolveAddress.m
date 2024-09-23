@implementation ResolveAddress

void __browser_ResolveAddress_block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  const __CFString *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void (*v5)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t DerivedStorage;
  void (*v7)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const void *v8;
  void *v9;
  void (*v10)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v11;
  uint64_t v12;
  void (*v13[8])(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);

  v1 = *(unsigned __int8 *)(a1 + 72);
  v3 = *(const __CFString **)(a1 + 56);
  v2 = *(_QWORD *)(a1 + 64);
  v4 = *(void (***)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 32);
  v5 = *(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 40);
  CMBaseObjectGetDerivedStorage();
  if (!v4)
  {
    APSLogErrorAt();
    return;
  }
  if (v1 != 1)
  {
    ((void (**)(_QWORD, const __CFString *, _QWORD, _QWORD, uint64_t, _QWORD))v4)[2](v4, v3, 0, 0, v2, 0);
    return;
  }
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v7 = *(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))DerivedStorage;
  if (v2)
  {
    v8 = (const void *)FigCFWeakReferenceHolderCreateWithReferencedObject();
    if (v8)
    {
      v9 = _Block_copy(v4);
      if (v9)
      {
        v10 = (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v9;
        CFRetain(v8);
        goto LABEL_10;
      }
    }
  }
  else
  {
    v11 = _Block_copy(v4);
    v8 = 0;
    if (v11)
    {
      v10 = (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v11;
LABEL_10:
      v12 = *(_QWORD *)(DerivedStorage + 328);
      v13[0] = (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
      v13[1] = (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))3221225472;
      v13[2] = (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))__browser_resolveBrokerAddress_block_invoke;
      v13[3] = (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))&unk_1E825A7A8;
      v13[6] = v7;
      v13[7] = v5;
      v13[4] = v10;
      v13[5] = (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v8;
      APBrokerManagerResolveBrokeredReceiverDNSName(v12, v3, v13);
      if (!v8)
        return;
      goto LABEL_11;
    }
  }
  APSLogErrorAt();
  v4[2](v4, 0, 0, 0, v2, 4294960568);
  if (!v8)
    return;
LABEL_11:
  CFRelease(v8);
}

@end
