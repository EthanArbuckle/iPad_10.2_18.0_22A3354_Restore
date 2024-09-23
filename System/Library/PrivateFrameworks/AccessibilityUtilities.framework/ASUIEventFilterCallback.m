@implementation ASUIEventFilterCallback

void ___ASUIEventFilterCallback_block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_handleKeyboardKeyDownEvent:", *(_QWORD *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void ___ASUIEventFilterCallback_block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_handleGamepadButtonPressedEvent:", *(_QWORD *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void ___ASUIEventFilterCallback_block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_handleATVRemoteButtonDownEvent:", *(_QWORD *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
