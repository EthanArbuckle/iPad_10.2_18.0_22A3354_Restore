@implementation CallClientMessageHandlers

void __figXPCConnection_CallClientMessageHandlers_block_invoke(uint64_t a1)
{
  const void *v2;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 48))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  xpc_release(*(xpc_object_t *)(a1 + 48));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

void __figXPCConnection_CallClientMessageHandlers_block_invoke_2(uint64_t a1)
{
  (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 64))(*(_QWORD *)(a1 + 40));
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

@end
