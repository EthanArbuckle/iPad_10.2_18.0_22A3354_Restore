@implementation SetIOMFBBrightness

void __SetIOMFBBrightness_block_invoke(uint64_t a1)
{
  SendSyncDBVNotification(*(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 44) & 1, (float)*(int *)(a1 + 40) / 65536.0);
}

void __SetIOMFBBrightness_block_invoke_2(uint64_t a1)
{
  IORegistryEntrySetCFProperty(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 108), CFSTR("IOMFBBrightnessLevel"), *(CFTypeRef *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
