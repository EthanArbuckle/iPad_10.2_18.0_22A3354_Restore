@implementation WiFiSWAPStopCallBack

void ___WiFiSWAPStopCallBack_block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
