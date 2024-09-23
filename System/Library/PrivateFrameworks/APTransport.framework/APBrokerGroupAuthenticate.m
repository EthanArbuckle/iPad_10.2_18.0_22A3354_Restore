@implementation APBrokerGroupAuthenticate

void __APBrokerGroupAuthenticate_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *aBlock)
{
  const void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[8];

  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(const void **)(a1 + 40);
  v9 = _Block_copy(aBlock);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 0x40000000;
  v10[2] = ___APBrokerGroupAuthenticateWithOneBroker_block_invoke;
  v10[3] = &unk_1E8257918;
  v10[6] = a4;
  v10[7] = a3;
  v10[4] = v9;
  v10[5] = v8;
  APBrokerAuthenticate(a3, v7, v10);
}

void __APBrokerGroupAuthenticate_block_invoke_2(uint64_t a1, uint64_t a2, int a3, CFTypeRef cf)
{
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  _QWORD v12[7];
  int v13;

  if (cf)
    CFRetain(cf);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 0x40000000;
  v12[2] = __APBrokerGroupAuthenticate_block_invoke_3;
  v12[3] = &unk_1E8257698;
  v9 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(a1 + 40);
  v13 = a3;
  v10 = *(_QWORD *)(a1 + 48);
  v12[4] = v9;
  v12[5] = v10;
  v12[6] = cf;
  dispatch_async(v8, v12);
  v11 = *(const void **)(a1 + 56);
  if (v11)
    CFRelease(v11);
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  _APBrokerDoReceiverPollingIfNecessary(a2, 0);
}

void __APBrokerGroupAuthenticate_block_invoke_3(uint64_t a1)
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
