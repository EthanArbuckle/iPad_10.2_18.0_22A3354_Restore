@implementation StartAssistedModeAdvertising

void ___StartAssistedModeAdvertising_block_invoke(uint64_t a1)
{
  _StopAssistedModeAdvertising(*(_QWORD *)(a1 + 32));
}

void ___StartAssistedModeAdvertising_block_invoke_2(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
