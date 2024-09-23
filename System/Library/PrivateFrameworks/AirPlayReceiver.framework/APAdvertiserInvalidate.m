@implementation APAdvertiserInvalidate

void __APAdvertiserInvalidate_block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  const void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject **v6;
  NSObject **v7;
  NSObject *v8;
  uint64_t block;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject **v13;

  _APAdvertiserStop(a1[6]);
  v2 = (_QWORD *)a1[6];
  if (v2[5])
  {
    APConnectivityHelperRemoveAllRegistrations();
    v2 = (_QWORD *)a1[6];
  }
  v3 = (const void *)v2[11];
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1[6] + 88) = 0;
    v2 = (_QWORD *)a1[6];
  }
  v4 = v2[12];
  v5 = MEMORY[0x24BDAC760];
  if (v4)
  {
    v6 = *(NSObject ***)(v4 + 16);
    block = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __APAdvertiserBTLEManagerInvalidate_block_invoke;
    v12 = &unk_24E21FC00;
    v13 = v6;
    dispatch_sync((dispatch_queue_t)objc_msgSend(v6, "internalQueue"), &block);
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
    v2 = (_QWORD *)a1[6];
  }
  v7 = (NSObject **)v2[13];
  if (v7)
  {
    if (gLogCategory_APAdvertiserRapportManager <= 50
      && (gLogCategory_APAdvertiserRapportManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v8 = v7[5];
    block = v5;
    v10 = 3221225472;
    v11 = __APAdvertiserRapportManagerInvalidate_block_invoke;
    v12 = &__block_descriptor_40_e5_v8__0l;
    v13 = v7;
    dispatch_sync(v8, &block);
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    v2 = (_QWORD *)a1[6];
  }
  _APAdvertiserSetNeedsNIRangingSession((uint64_t)v2, 0);
}

@end
