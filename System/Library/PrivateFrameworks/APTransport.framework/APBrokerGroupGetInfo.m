@implementation APBrokerGroupGetInfo

void __APBrokerGroupGetInfo_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *aBlock)
{
  uint64_t v7;
  void *v8;
  _QWORD v9[8];

  v7 = *(_QWORD *)(a1 + 32);
  v8 = _Block_copy(aBlock);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = ___APBrokerGroupGetInfoWithOneBroker_block_invoke;
  v9[3] = &unk_1E8257940;
  v9[6] = a4;
  v9[7] = a3;
  v9[4] = v8;
  v9[5] = v7;
  APBrokerGetInfo(a3, v9);
}

void __APBrokerGroupGetInfo_block_invoke_2(uint64_t a1, int a2, int a3, CFTypeRef cf)
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[7];
  int v11;

  if (cf)
    CFRetain(cf);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 0x40000000;
  v10[2] = __APBrokerGroupGetInfo_block_invoke_3;
  v10[3] = &unk_1E8257708;
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(a1 + 40);
  v11 = a3;
  v9 = *(_QWORD *)(a1 + 48);
  v10[4] = v8;
  v10[5] = v9;
  v10[6] = cf;
  dispatch_async(v7, v10);
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

void __APBrokerGroupGetInfo_block_invoke_3(uint64_t a1)
{
  const void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
  CFRelease(*(CFTypeRef *)(a1 + 40));
  _Block_release(*(const void **)(a1 + 32));
}

@end
