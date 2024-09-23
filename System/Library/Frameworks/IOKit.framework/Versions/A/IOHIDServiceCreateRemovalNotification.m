@implementation IOHIDServiceCreateRemovalNotification

void __IOHIDServiceCreateRemovalNotification_block_invoke(uint64_t a1)
{
  const void **v2;
  uint64_t v3;
  _QWORD v4[5];

  v2 = *(const void ***)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 0x40000000;
    v4[2] = ____IOHIDServiceNotificationSetApplier_block_invoke;
    v4[3] = &__block_descriptor_tmp_201;
    v4[4] = v3;
    IOHIDNotificationSignalWithBlock(v2, (uint64_t)v4);
    v2 = *(const void ***)(a1 + 32);
  }
  CFRelease(v2);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
