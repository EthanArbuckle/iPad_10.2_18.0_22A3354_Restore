@implementation DisposeServedSandboxRegistrationState

void __DisposeServedSandboxRegistrationState_block_invoke(uint64_t a1)
{
  fsbsxpc_removeAssertionForPIDOnQueue(*(_DWORD *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
