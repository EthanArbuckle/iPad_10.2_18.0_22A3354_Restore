@implementation APBrokerGroupResolveReceiverDNSName

void __APBrokerGroupResolveReceiverDNSName_block_invoke(_QWORD *a1, int a2, uint64_t a3, uint64_t a4, void *aBlock)
{
  __CFString *v7;
  uint64_t v8;
  const void *v9;
  void *v10;
  _QWORD v11[8];

  v8 = a1[4];
  v7 = (__CFString *)a1[5];
  v9 = (const void *)a1[6];
  v10 = _Block_copy(aBlock);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 0x40000000;
  v11[2] = ___APBrokerGroupResolveReceiverDNSNameWithOneBroker_block_invoke;
  v11[3] = &unk_1E8257968;
  v11[6] = a4;
  v11[7] = a3;
  v11[4] = v10;
  v11[5] = v8;
  APBrokerGetReceiverConnectivityInfo(a3, v7, v9, v11);
}

void __APBrokerGroupResolveReceiverDNSName_block_invoke_2(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  int v5;
  const void *TypedValue;
  __int16 Int64Ranged;
  int v8;
  NSObject *v9;
  const void *v10;
  _QWORD v11[6];
  int v12;
  int v13;
  __int16 v14;

  if (a3)
  {
    v8 = a3;
    APSLogErrorAt();
    v5 = 0;
    Int64Ranged = 0;
    TypedValue = 0;
  }
  else
  {
    v5 = a4;
    if (a4)
    {
      CFArrayGetTypeID();
      TypedValue = (const void *)CFDictionaryGetTypedValue();
      if (TypedValue)
      {
        Int64Ranged = CFDictionaryGetInt64Ranged();
        if (Int64Ranged)
        {
          v8 = 0;
          v5 = (unsigned __int16)CFDictionaryGetInt64Ranged();
        }
        else
        {
          APSLogErrorAt();
          v5 = 0;
          v8 = -6705;
        }
        CFRetain(TypedValue);
        goto LABEL_7;
      }
      APSLogErrorAt();
      v5 = 0;
      Int64Ranged = 0;
    }
    else
    {
      APSLogErrorAt();
      Int64Ranged = 0;
      TypedValue = 0;
    }
    v8 = -6705;
  }
LABEL_7:
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 0x40000000;
  v11[2] = __APBrokerGroupResolveReceiverDNSName_block_invoke_3;
  v11[3] = &unk_1E8257778;
  v9 = *(NSObject **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v11[5] = TypedValue;
  v12 = v8;
  v13 = v5;
  v14 = Int64Ranged;
  dispatch_async(v9, v11);
  v10 = *(const void **)(a1 + 48);
  if (v10)
    CFRelease(v10);
  CFRelease(*(CFTypeRef *)(a1 + 56));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

void __APBrokerGroupResolveReceiverDNSName_block_invoke_3(uint64_t a1)
{
  const void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
  _Block_release(*(const void **)(a1 + 32));
}

@end
