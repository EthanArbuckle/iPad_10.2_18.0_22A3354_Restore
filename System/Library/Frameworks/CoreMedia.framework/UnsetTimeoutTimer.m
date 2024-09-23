@implementation UnsetTimeoutTimer

void __figXPC_UnsetTimeoutTimer_block_invoke(uint64_t a1)
{
  void *context;
  uint64_t v3;
  void *v4;

  context = dispatch_get_context(*(dispatch_object_t *)(*(_QWORD *)(a1 + 40) + 192));
  if (context)
  {
    xpc_release(context);
    dispatch_set_context(*(dispatch_object_t *)(*(_QWORD *)(a1 + 40) + 192), 0);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v3 + 216);
  if (v4)
  {
    *(_QWORD *)(v3 + 216) = 0;
    xpc_release(v4);
  }
}

@end
