@implementation ASUIInputValueCallback

void ___ASUIInputValueCallback_block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_handleMFIButtonDownValue:", *(_QWORD *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
