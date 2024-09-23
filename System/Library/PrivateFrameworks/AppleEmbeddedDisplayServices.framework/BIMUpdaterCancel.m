@implementation BIMUpdaterCancel

void __BIMUpdaterCancel_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
