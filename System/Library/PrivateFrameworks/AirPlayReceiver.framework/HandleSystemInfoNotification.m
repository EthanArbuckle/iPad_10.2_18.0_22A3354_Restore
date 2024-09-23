@implementation HandleSystemInfoNotification

void ___HandleSystemInfoNotification_block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  int v4;
  NSObject *v5;
  _QWORD block[5];

  v3 = *(_QWORD **)(a1 + 32);
  v4 = *(unsigned __int8 *)(a1 + 40);
  _UpdateAdvertiserInfo((uint64_t)v3, a2);
  if (v4)
  {
    CFRetain(v3);
    v5 = v3[11];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___HandleAdvertisingParameterChanged_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v3;
    dispatch_async(v5, block);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
