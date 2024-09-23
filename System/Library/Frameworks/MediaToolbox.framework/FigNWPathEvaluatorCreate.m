@implementation FigNWPathEvaluatorCreate

void __FigNWPathEvaluatorCreate_block_invoke(uint64_t a1, NSObject *a2)
{
  const void *v3;
  NSObject **DerivedStorage;
  NSObject *v5;
  CFDictionaryRef v6;
  const void *v7;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 0;
  v3 = (const void *)FigCFWeakReferenceHolderCopyReferencedObject();
  if (v3)
  {
    DerivedStorage = (NSObject **)CMBaseObjectGetDerivedStorage();
    v5 = *DerivedStorage;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = __fnpe_EvaluatorHandleNetworkChange_block_invoke;
    block[3] = &unk_1E2FA3240;
    block[5] = &v9;
    block[6] = DerivedStorage;
    block[4] = &v13;
    dispatch_sync(v5, block);
    v6 = fnpe_CopyCurrentPathInformationFromNWPath(a2);
    if (v6)
      ((void (*)(uint64_t, CFDictionaryRef))v10[3])(v14[3], v6);
  }
  else
  {
    v6 = 0;
  }
  v7 = (const void *)v14[3];
  if (v7)
    CFRelease(v7);
  if (v6)
    CFRelease(v6);
  if (v3)
    CFRelease(v3);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
}

void __FigNWPathEvaluatorCreate_block_invoke_2(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

@end
