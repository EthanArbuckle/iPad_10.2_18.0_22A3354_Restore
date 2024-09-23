@implementation APReceiverSystemInfoHandleLocalSenderStateChanged

void __APReceiverSystemInfoHandleLocalSenderStateChanged_block_invoke(uint64_t a1)
{
  sysInfo_handleLocalSenderStateChanged(*(_QWORD *)(a1 + 32), *(const void **)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
