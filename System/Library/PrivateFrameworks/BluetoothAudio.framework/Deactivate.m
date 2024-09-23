@implementation Deactivate

void __endpoint_Deactivate_block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 64));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
