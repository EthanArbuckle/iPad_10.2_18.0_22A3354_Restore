@implementation NeroTransportRegisterObjectWithFlags

void __NeroTransportRegisterObjectWithFlags_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
