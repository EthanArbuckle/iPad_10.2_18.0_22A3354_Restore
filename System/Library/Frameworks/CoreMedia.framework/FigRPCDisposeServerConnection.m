@implementation FigRPCDisposeServerConnection

void __FigRPCDisposeServerConnection_block_invoke(uint64_t a1)
{
  NSObject *v2;

  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 48), (const void *)*(unsigned int *)(*(_QWORD *)(a1 + 40) + 8));
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 40);
  if (v2)
  {
    dispatch_source_cancel(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = 0;
  }
}

@end
