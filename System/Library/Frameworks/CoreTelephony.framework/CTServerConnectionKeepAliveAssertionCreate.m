@implementation CTServerConnectionKeepAliveAssertionCreate

void ___CTServerConnectionKeepAliveAssertionCreate_block_invoke(uint64_t a1)
{
  int v2;
  xpc_object_t object;

  CFRetain(*(CFTypeRef *)(a1 + 40));
  object = xpc_null_create();
  v2 = SendXpcMessage(*(_QWORD *)(a1 + 40), (xpc_object_t *)(a1 + 48), &object);
  CFRelease(*(CFTypeRef *)(a1 + 40));
  if (v2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  xpc_release(object);
}

@end
