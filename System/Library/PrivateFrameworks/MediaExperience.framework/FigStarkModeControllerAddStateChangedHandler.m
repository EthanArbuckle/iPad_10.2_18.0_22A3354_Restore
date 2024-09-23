@implementation FigStarkModeControllerAddStateChangedHandler

void __FigStarkModeControllerAddStateChangedHandler_block_invoke(uint64_t a1)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 32) + 120), *(const void **)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
