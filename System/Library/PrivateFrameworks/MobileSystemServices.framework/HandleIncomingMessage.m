@implementation HandleIncomingMessage

void ___HandleIncomingMessage_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
  xpc_release(*(xpc_object_t *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

@end
